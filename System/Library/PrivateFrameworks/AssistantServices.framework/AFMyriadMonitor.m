@interface AFMyriadMonitor
+ (id)sharedMonitor;
- (AFMyriadMonitor)init;
- (BOOL)didWin;
- (BOOL)isMonitoring;
- (id)_fetchCurrentMyriadDecisionWithWaitTime:(double)a3;
- (id)_myriadStateToString:(int64_t)a3;
- (void)_cancelRepostedMyriadDecisionTimer;
- (void)_clear;
- (void)_dequeueBlocksWithSignal:(int64_t)a3;
- (void)_deregisterFromMyriadEventNotifications;
- (void)_deregisterFromRepostedDecisionResultsObservers;
- (void)_enqueueBlock:(id)a3 forReason:(id)a4;
- (void)_flushCompletions:(BOOL)a3;
- (void)_ignoreRepostMyriadNotification:(BOOL)a3;
- (void)_registerForMyriadEvents;
- (void)_resultSeenWithValue:(BOOL)a3;
- (void)_setDecisionIsPending;
- (void)dealloc;
- (void)dequeueBlocksWaitingForMyriadDecision;
- (void)ignoreMyriadEvents:(BOOL)a3;
- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5;
- (void)notifyObserver:(id)a3 didReceiveNotificationWithToken:(int)a4;
- (void)startMonitoringWithTimeoutInterval:(double)a3;
- (void)startMonitoringWithTimeoutInterval:(double)a3 instanceContext:(id)a4;
- (void)stopMonitoring;
- (void)waitForMyriadDecisionForReason:(id)a3 withCompletion:(id)a4;
- (void)waitForMyriadDecisionWithCompletion:(id)a3;
@end

@implementation AFMyriadMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_myriadMonitorQueue, 0);
  objc_storeStrong((id *)&self->_fetchRepostedMyriadDecisionTimer, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_repostedWonObserver, 0);
  objc_storeStrong((id *)&self->_lostObserver, 0);
  objc_storeStrong((id *)&self->_wonObserver, 0);
  objc_storeStrong((id *)&self->_beginObserver, 0);
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
}

- (void)_ignoreRepostMyriadNotification:(BOOL)a3
{
  myriadMonitorQueue = self->_myriadMonitorQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__AFMyriadMonitor__ignoreRepostMyriadNotification___block_invoke;
  v4[3] = &unk_1E592AEA0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(myriadMonitorQueue, v4);
}

uint64_t __51__AFMyriadMonitor__ignoreRepostMyriadNotification___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 99) = *(unsigned char *)(result + 40);
  return result;
}

- (void)_resultSeenWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3) {
    int64_t v5 = 3;
  }
  else {
    int64_t v5 = 2;
  }
  self->_state = v5;
  v6 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    v8 = [(AFMyriadMonitor *)self _myriadStateToString:v5];
    int v9 = 136315394;
    v10 = "-[AFMyriadMonitor _resultSeenWithValue:]";
    __int16 v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s Myriad decision seen: state is %@.", (uint8_t *)&v9, 0x16u);
  }
  [(AFMyriadMonitor *)self _flushCompletions:v3];
}

- (void)_flushCompletions:(BOOL)a3
{
  if (a3) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = -1000;
  }
  [(AFMyriadMonitor *)self _dequeueBlocksWithSignal:v4];
  timer = self->_timer;
  [(AFWatchdogTimer *)timer cancelIfNotAlreadyCanceled];
}

- (void)_clear
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int64_t state = self->_state;
    int64_t v5 = v3;
    v6 = [(AFMyriadMonitor *)self _myriadStateToString:state];
    int v7 = 136315394;
    v8 = "-[AFMyriadMonitor _clear]";
    __int16 v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s Clear pending for Myriad decision: %@.", (uint8_t *)&v7, 0x16u);
  }
  self->_int64_t state = 0;
  [(AFMyriadMonitor *)self _flushCompletions:0];
}

- (void)_dequeueBlocksWithSignal:(int64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int64_t v5 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    completions = self->_completions;
    int v7 = v5;
    *(_DWORD *)buf = 136315394;
    v20 = "-[AFMyriadMonitor _dequeueBlocksWithSignal:]";
    __int16 v21 = 1024;
    int v22 = [(AFQueue *)completions count];
    _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s Myriad decision had %d block(s) waiting", buf, 0x12u);
  }
  if ([(AFQueue *)self->_completions count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v8 = self->_completions;
    uint64_t v9 = [(AFQueue *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12++), "invokeWithSignal:", a3, (void)v14);
        }
        while (v10 != v12);
        uint64_t v10 = [(AFQueue *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }

    id v13 = [(AFQueue *)self->_completions dequeueAllObjects];
  }
}

- (void)_setDecisionIsPending
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = AFSiriLogContextConnection;
  if (self->_state == 1)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      long long v14 = "-[AFMyriadMonitor _setDecisionIsPending]";
      _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s Myriad decision is already in pending state.", buf, 0xCu);
      BOOL v3 = AFSiriLogContextConnection;
    }
    timer = self->_timer;
    if (timer)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        long long v14 = "-[AFMyriadMonitor _setDecisionIsPending]";
        _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s Myriad monitor cancelling existing watch dog timer.", buf, 0xCu);
        timer = self->_timer;
      }
      [(AFWatchdogTimer *)timer cancel];
      int64_t v5 = self->_timer;
      self->_timer = 0;

      BOOL v3 = AFSiriLogContextConnection;
    }
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    long long v14 = "-[AFMyriadMonitor _setDecisionIsPending]";
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s Myriad decision is pending.", buf, 0xCu);
    BOOL v3 = AFSiriLogContextConnection;
  }
  self->_int64_t state = 1;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    double myriadEventMonitorTimeout = self->_myriadEventMonitorTimeout;
    *(_DWORD *)buf = 136315394;
    long long v14 = "-[AFMyriadMonitor _setDecisionIsPending]";
    __int16 v15 = 2048;
    double v16 = myriadEventMonitorTimeout;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s Myriad monitor initializing safety timer with timeout: %f seconds", buf, 0x16u);
  }
  int v7 = [AFWatchdogTimer alloc];
  double v8 = self->_myriadEventMonitorTimeout;
  myriadMonitorQueue = self->_myriadMonitorQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __40__AFMyriadMonitor__setDecisionIsPending__block_invoke;
  v12[3] = &unk_1E592C678;
  v12[4] = self;
  uint64_t v10 = [(AFWatchdogTimer *)v7 initWithTimeoutInterval:myriadMonitorQueue onQueue:v12 timeoutHandler:v8];
  uint64_t v11 = self->_timer;
  self->_timer = v10;

  [(AFWatchdogTimer *)self->_timer start];
}

void *__40__AFMyriadMonitor__setDecisionIsPending__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315138;
    int64_t v5 = "-[AFMyriadMonitor _setDecisionIsPending]_block_invoke";
    _os_log_error_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_ERROR, "%s Myriad monitor times out, Myriad is probably unable to finish, clear pending blocks", (uint8_t *)&v4, 0xCu);
  }
  result = *(void **)(a1 + 32);
  if (result[1] == 1)
  {
    [result _deregisterFromRepostedDecisionResultsObservers];
    return (void *)[*(id *)(a1 + 32) _clear];
  }
  return result;
}

- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  double v8 = (AFNotifyObserver *)a3;
  uint64_t v9 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315906;
    uint64_t v12 = "-[AFMyriadMonitor notifyObserver:didChangeStateFrom:to:]";
    __int16 v13 = 2048;
    long long v14 = v8;
    __int16 v15 = 2048;
    unint64_t v16 = a4;
    __int16 v17 = 2048;
    unint64_t v18 = a5;
    _os_log_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_INFO, "%s notifyObserver %p didChangeStateFrom %ld -> %ld", (uint8_t *)&v11, 0x2Au);
  }
  if (!a4 && self->_repostedWonObserver == v8)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.siri.myriad.get.decision", 0, 0, 1u);
  }
}

- (void)notifyObserver:(id)a3 didReceiveNotificationWithToken:(int)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int64_t v5 = (AFNotifyObserver *)a3;
  uint64_t v6 = [(AFNotifyObserver *)v5 name];
  if (self->_wonObserver == v5)
  {
    int v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int16 v13 = 136315394;
      *(void *)&v13[4] = "-[AFMyriadMonitor notifyObserver:didReceiveNotificationWithToken:]";
      *(_WORD *)&v13[12] = 2112;
      *(void *)&v13[14] = v6;
      double v8 = "%s Myriad Delay Monitor result: YES (%@)";
      goto LABEL_9;
    }
LABEL_10:
    uint64_t v9 = self;
    uint64_t v10 = 1;
LABEL_14:
    -[AFMyriadMonitor _resultSeenWithValue:](v9, "_resultSeenWithValue:", v10, *(_OWORD *)v13, *(void *)&v13[16], v14);
LABEL_15:
    [(AFMyriadMonitor *)self _deregisterFromRepostedDecisionResultsObservers];
    goto LABEL_16;
  }
  if (self->_lostObserver == v5)
  {
    int v11 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int16 v13 = 136315394;
      *(void *)&v13[4] = "-[AFMyriadMonitor notifyObserver:didReceiveNotificationWithToken:]";
      *(_WORD *)&v13[12] = 2112;
      *(void *)&v13[14] = v6;
      _os_log_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_INFO, "%s Myriad Delay Monitor result: NO (%@)", v13, 0x16u);
    }
    uint64_t v9 = self;
    uint64_t v10 = 0;
    goto LABEL_14;
  }
  if (self->_beginObserver == v5)
  {
    uint64_t v12 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int16 v13 = 136315394;
      *(void *)&v13[4] = "-[AFMyriadMonitor notifyObserver:didReceiveNotificationWithToken:]";
      *(_WORD *)&v13[12] = 2112;
      *(void *)&v13[14] = v6;
      _os_log_impl(&dword_19CF1D000, v12, OS_LOG_TYPE_INFO, "%s Myriad Delay Monitor Begin (%@)", v13, 0x16u);
    }
    [(AFMyriadMonitor *)self _setDecisionIsPending];
    goto LABEL_15;
  }
  if (self->_repostedWonObserver == v5)
  {
    int v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int16 v13 = 136315394;
      *(void *)&v13[4] = "-[AFMyriadMonitor notifyObserver:didReceiveNotificationWithToken:]";
      *(_WORD *)&v13[12] = 2112;
      *(void *)&v13[14] = v6;
      double v8 = "%s Myriad Delay Monitor received reposted result: YES (%@)";
LABEL_9:
      _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, v8, v13, 0x16u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
LABEL_16:
}

- (void)_deregisterFromRepostedDecisionResultsObservers
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [(AFMyriadMonitor *)self _cancelRepostedMyriadDecisionTimer];
  repostedWonObserver = self->_repostedWonObserver;
  if (repostedWonObserver)
  {
    int v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      int v7 = "-[AFMyriadMonitor _deregisterFromRepostedDecisionResultsObservers]";
      _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s Myriad Delay Monitor: Deregistering from reposted Myriad event notification.", (uint8_t *)&v6, 0xCu);
      repostedWonObserver = self->_repostedWonObserver;
    }
    [(AFNotifyObserver *)repostedWonObserver invalidate];
    int64_t v5 = self->_repostedWonObserver;
    self->_repostedWonObserver = 0;
  }
}

- (void)_deregisterFromMyriadEventNotifications
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  beginObserver = self->_beginObserver;
  if (*(_OWORD *)&self->_beginObserver != 0 || self->_lostObserver)
  {
    int v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      uint64_t v9 = "-[AFMyriadMonitor _deregisterFromMyriadEventNotifications]";
      _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s Myriad Delay Monitor: Deregistering from Myriad event notifications.", (uint8_t *)&v8, 0xCu);
      beginObserver = self->_beginObserver;
    }
    [(AFNotifyObserver *)beginObserver invalidate];
    int64_t v5 = self->_beginObserver;
    self->_beginObserver = 0;

    [(AFNotifyObserver *)self->_wonObserver invalidate];
    wonObserver = self->_wonObserver;
    self->_wonObserver = 0;

    [(AFNotifyObserver *)self->_lostObserver invalidate];
    lostObserver = self->_lostObserver;
    self->_lostObserver = 0;

    self->_isRegisteredForMyriadEventNotification = 0;
    [(AFMyriadMonitor *)self _deregisterFromRepostedDecisionResultsObservers];
  }
}

- (id)_fetchCurrentMyriadDecisionWithWaitTime:(double)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_ignoreRepostMyriadNotification)
  {
    BOOL v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v12 = "-[AFMyriadMonitor _fetchCurrentMyriadDecisionWithWaitTime:]";
      _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s Myriad Delay Monitor: Ignoring Myriad repost notifications.", buf, 0xCu);
    }
    int v4 = 0;
  }
  else
  {
    int v7 = [AFWatchdogTimer alloc];
    myriadMonitorQueue = self->_myriadMonitorQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__AFMyriadMonitor__fetchCurrentMyriadDecisionWithWaitTime___block_invoke;
    v10[3] = &unk_1E592C678;
    v10[4] = self;
    int v4 = [(AFWatchdogTimer *)v7 initWithTimeoutInterval:myriadMonitorQueue onQueue:v10 timeoutHandler:a3];
  }
  return v4;
}

void __59__AFMyriadMonitor__fetchCurrentMyriadDecisionWithWaitTime___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 8) == 1 && !*(unsigned char *)(v1 + 97) && *(void *)(v1 + 56))
  {
    v2 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v4 = 136315138;
      int64_t v5 = "-[AFMyriadMonitor _fetchCurrentMyriadDecisionWithWaitTime:]_block_invoke";
      _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s Myriad Delay Monitor: Fetching reposted Myriad event notification.", (uint8_t *)&v4, 0xCu);
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.siri.myriad.get.decision", 0, 0, 1u);
  }
}

- (void)_cancelRepostedMyriadDecisionTimer
{
  fetchRepostedMyriadDecisionTimer = self->_fetchRepostedMyriadDecisionTimer;
  if (fetchRepostedMyriadDecisionTimer)
  {
    [(AFWatchdogTimer *)fetchRepostedMyriadDecisionTimer cancelIfNotAlreadyCanceled];
    int v4 = self->_fetchRepostedMyriadDecisionTimer;
    self->_fetchRepostedMyriadDecisionTimer = 0;
  }
}

- (void)_registerForMyriadEvents
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  observerWithNotificationName((uint64_t)"com.apple.siri.myriad.decision.begin", self->_instanceContext, 1, self, self->_myriadMonitorQueue);
  BOOL v3 = (AFNotifyObserver *)objc_claimAutoreleasedReturnValue();
  beginObserver = self->_beginObserver;
  self->_beginObserver = v3;

  observerWithNotificationName((uint64_t)"com.apple.siri.myriad.decision.won", self->_instanceContext, 1, self, self->_myriadMonitorQueue);
  int64_t v5 = (AFNotifyObserver *)objc_claimAutoreleasedReturnValue();
  wonObserver = self->_wonObserver;
  self->_wonObserver = v5;

  observerWithNotificationName((uint64_t)"com.apple.siri.myriad.decision.lost", self->_instanceContext, 1, self, self->_myriadMonitorQueue);
  int v7 = (AFNotifyObserver *)objc_claimAutoreleasedReturnValue();
  lostObserver = self->_lostObserver;
  self->_lostObserver = v7;

  observerWithNotificationName((uint64_t)"com.apple.siri.myriad.repost.decision.won", self->_instanceContext, 1, self, self->_myriadMonitorQueue);
  uint64_t v9 = (AFNotifyObserver *)objc_claimAutoreleasedReturnValue();
  repostedWonObserver = self->_repostedWonObserver;
  self->_repostedWonObserver = v9;

  self->_isRegisteredForMyriadEventNotification = 1;
  int v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = self->_beginObserver;
    uint64_t v13 = self->_wonObserver;
    uint64_t v14 = self->_lostObserver;
    __int16 v15 = self->_repostedWonObserver;
    int v16 = 136316162;
    __int16 v17 = "-[AFMyriadMonitor _registerForMyriadEvents]";
    __int16 v18 = 2048;
    uint64_t v19 = v12;
    __int16 v20 = 2048;
    __int16 v21 = v13;
    __int16 v22 = 2048;
    uint64_t v23 = v14;
    __int16 v24 = 2048;
    v25 = v15;
    _os_log_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_INFO, "%s Myriad Delay Monitor: Registering for Myriad event notifications (beginObserver: %p, wonObserver: %p, lostObserver: %p, decisionRepostObserver: %p).", (uint8_t *)&v16, 0x34u);
  }
}

- (id)_myriadStateToString:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return @"Unknown";
  }
  else {
    return off_1E59268F8[a3];
  }
}

- (void)dealloc
{
  [(AFNotifyObserver *)self->_wonObserver invalidate];
  [(AFNotifyObserver *)self->_lostObserver invalidate];
  v3.receiver = self;
  v3.super_class = (Class)AFMyriadMonitor;
  [(AFMyriadMonitor *)&v3 dealloc];
}

- (BOOL)didWin
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  myriadMonitorQueue = self->_myriadMonitorQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __25__AFMyriadMonitor_didWin__block_invoke;
  v5[3] = &unk_1E592C6C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(myriadMonitorQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __25__AFMyriadMonitor_didWin__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(v1 + 8);
  if (v2) {
    BOOL v3 = v2 == 3;
  }
  else {
    BOOL v3 = 1;
  }
  BOOL v4 = v3 || *(unsigned char *)(v1 + 97) != 0;
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v4;
  return result;
}

- (BOOL)isMonitoring
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  myriadMonitorQueue = self->_myriadMonitorQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__AFMyriadMonitor_isMonitoring__block_invoke;
  v5[3] = &unk_1E592C6C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(myriadMonitorQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __31__AFMyriadMonitor_isMonitoring__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 98);
  return result;
}

- (void)stopMonitoring
{
  myriadMonitorQueue = self->_myriadMonitorQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__AFMyriadMonitor_stopMonitoring__block_invoke;
  block[3] = &unk_1E592C678;
  block[4] = self;
  dispatch_async(myriadMonitorQueue, block);
}

unsigned char *__33__AFMyriadMonitor_stopMonitoring__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 98) = 0;
  result = *(unsigned char **)(a1 + 32);
  if (result[96])
  {
    [result _deregisterFromMyriadEventNotifications];
    char v3 = *(void **)(a1 + 32);
    return (unsigned char *)[v3 _clear];
  }
  return result;
}

- (void)dequeueBlocksWaitingForMyriadDecision
{
  myriadMonitorQueue = self->_myriadMonitorQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__AFMyriadMonitor_dequeueBlocksWaitingForMyriadDecision__block_invoke;
  block[3] = &unk_1E592C678;
  block[4] = self;
  dispatch_async(myriadMonitorQueue, block);
}

uint64_t __56__AFMyriadMonitor_dequeueBlocksWaitingForMyriadDecision__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    int64_t v5 = "-[AFMyriadMonitor dequeueBlocksWaitingForMyriadDecision]_block_invoke";
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  return [*(id *)(a1 + 32) _dequeueBlocksWithSignal:-1000];
}

- (void)ignoreMyriadEvents:(BOOL)a3
{
  myriadMonitorQueue = self->_myriadMonitorQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__AFMyriadMonitor_ignoreMyriadEvents___block_invoke;
  v4[3] = &unk_1E592AEA0;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(myriadMonitorQueue, v4);
}

void __38__AFMyriadMonitor_ignoreMyriadEvents___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
    int v4 = 136315394;
    BOOL v5 = "-[AFMyriadMonitor ignoreMyriadEvents:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = v3;
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s Myriad Delay Monitor: Should ignoring Myriad events -> %d.", (uint8_t *)&v4, 0x12u);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 97) = *(unsigned char *)(a1 + 40);
  if (*(unsigned char *)(a1 + 40)) {
    [*(id *)(a1 + 32) _deregisterFromRepostedDecisionResultsObservers];
  }
}

- (void)startMonitoringWithTimeoutInterval:(double)a3 instanceContext:(id)a4
{
  id v6 = a4;
  myriadMonitorQueue = self->_myriadMonitorQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__AFMyriadMonitor_startMonitoringWithTimeoutInterval_instanceContext___block_invoke;
  block[3] = &unk_1E592B3C0;
  double v12 = a3;
  id v10 = v6;
  int v11 = self;
  id v8 = v6;
  dispatch_async(myriadMonitorQueue, block);
}

void __70__AFMyriadMonitor_startMonitoringWithTimeoutInterval_instanceContext___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 32);
    int v9 = 136315650;
    id v10 = "-[AFMyriadMonitor startMonitoringWithTimeoutInterval:instanceContext:]_block_invoke";
    __int16 v11 = 2048;
    uint64_t v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s BTLE delay monitor watchdog timeout %f context %@", (uint8_t *)&v9, 0x20u);
  }
  *(unsigned char *)(*(void *)(a1 + 40) + 98) = 1;
  uint64_t v5 = *(void *)(a1 + 40);
  if (!*(unsigned char *)(v5 + 96))
  {
    objc_storeStrong((id *)(v5 + 16), *(id *)(a1 + 32));
    *(void *)(*(void *)(a1 + 40) + 88) = *(void *)(a1 + 48);
    [*(id *)(a1 + 40) _registerForMyriadEvents];
    [*(id *)(a1 + 40) _setDecisionIsPending];
    [*(id *)(a1 + 40) _cancelRepostedMyriadDecisionTimer];
    uint64_t v6 = [*(id *)(a1 + 40) _fetchCurrentMyriadDecisionWithWaitTime:1.75];
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = *(void **)(v7 + 72);
    *(void *)(v7 + 72) = v6;

    [*(id *)(*(void *)(a1 + 40) + 72) start];
  }
}

- (void)startMonitoringWithTimeoutInterval:(double)a3
{
}

- (void)waitForMyriadDecisionForReason:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  myriadMonitorQueue = self->_myriadMonitorQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__AFMyriadMonitor_waitForMyriadDecisionForReason_withCompletion___block_invoke;
  block[3] = &unk_1E592C598;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(myriadMonitorQueue, block);
}

uint64_t __65__AFMyriadMonitor_waitForMyriadDecisionForReason_withCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enqueueBlock:*(void *)(a1 + 48) forReason:*(void *)(a1 + 40)];
}

- (void)_enqueueBlock:(id)a3 forReason:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (__CFString *)a4;
  id v8 = v7;
  if (v6)
  {
    id v9 = @"Unspecified";
    if (v7) {
      id v9 = v7;
    }
    id v10 = v9;
    int64_t state = self->_state;
    if (state == 1 && !self->_ignoreMyriadEvents)
    {
      uint64_t v15 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v16 = v15;
        __int16 v17 = [(AFMyriadMonitor *)self _myriadStateToString:1];
        *(_DWORD *)buf = 136315650;
        v27 = "-[AFMyriadMonitor _enqueueBlock:forReason:]";
        __int16 v28 = 2112;
        v29 = v17;
        __int16 v30 = 2112;
        v31 = v10;
        _os_log_impl(&dword_19CF1D000, v16, OS_LOG_TYPE_INFO, "%s Queueing command waiting for Myriad decision: %@ (reason = %@).", buf, 0x20u);
      }
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      completions = self->_completions;
      __int16 v20 = [AFSafetyBlock alloc];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __43__AFMyriadMonitor__enqueueBlock_forReason___block_invoke;
      v22[3] = &unk_1E59268D8;
      CFAbsoluteTime v25 = Current;
      uint64_t v23 = v10;
      id v24 = v6;
      __int16 v21 = [(AFSafetyBlock *)v20 initWithBlock:v22];
      [(AFQueue *)completions enqueueObject:v21];
    }
    else
    {
      id v12 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        id v13 = v12;
        uint64_t v14 = [(AFMyriadMonitor *)self _myriadStateToString:state];
        *(_DWORD *)buf = 136315650;
        v27 = "-[AFMyriadMonitor _enqueueBlock:forReason:]";
        __int16 v28 = 2112;
        v29 = v14;
        __int16 v30 = 2112;
        v31 = v10;
        _os_log_impl(&dword_19CF1D000, v13, OS_LOG_TYPE_INFO, "%s Dequeueing command for Myriad decision: %@ (reason = %@).", buf, 0x20u);
      }
      if (self->_ignoreMyriadEvents) {
        (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
      }
      else {
        (*((void (**)(id, BOOL))v6 + 2))(v6, self->_state != 2);
      }
    }
  }
}

uint64_t __43__AFMyriadMonitor__enqueueBlock_forReason___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = v4;
    CFAbsoluteTime v6 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 32);
    int v9 = 136315906;
    id v10 = "-[AFMyriadMonitor _enqueueBlock:forReason:]_block_invoke";
    __int16 v11 = 2048;
    CFAbsoluteTime v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    __int16 v15 = 2048;
    uint64_t v16 = a2;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s Dequeuing after %f seconds for Myriad decision (reason = %@) and dequeue signal %zd.", (uint8_t *)&v9, 0x2Au);
  }
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2 == 0);
}

- (void)waitForMyriadDecisionWithCompletion:(id)a3
{
  id v4 = a3;
  myriadMonitorQueue = self->_myriadMonitorQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__AFMyriadMonitor_waitForMyriadDecisionWithCompletion___block_invoke;
  v7[3] = &unk_1E592C6E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(myriadMonitorQueue, v7);
}

uint64_t __55__AFMyriadMonitor_waitForMyriadDecisionWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enqueueBlock:*(void *)(a1 + 40) forReason:0];
}

- (AFMyriadMonitor)init
{
  v12.receiver = self;
  v12.super_class = (Class)AFMyriadMonitor;
  uint64_t v2 = [(AFMyriadMonitor *)&v12 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_int64_t state = 0;
    id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.assistant.myriad.delay_monitor", v5);
    myriadMonitorQueue = v3->_myriadMonitorQueue;
    v3->_myriadMonitorQueue = (OS_dispatch_queue *)v6;

    id v8 = objc_alloc_init(AFQueue);
    completions = v3->_completions;
    v3->_completions = v8;

    *(_DWORD *)&v3->_isRegisteredForMyriadEventNotification = 0;
    id v10 = v3;
  }

  return v3;
}

+ (id)sharedMonitor
{
  if (sharedMonitor_onceToken != -1) {
    dispatch_once(&sharedMonitor_onceToken, &__block_literal_global_11683);
  }
  uint64_t v2 = (void *)sharedMonitor_sharedMonitor;
  return v2;
}

void __32__AFMyriadMonitor_sharedMonitor__block_invoke()
{
  v0 = objc_alloc_init(AFMyriadMonitor);
  uint64_t v1 = (void *)sharedMonitor_sharedMonitor;
  sharedMonitor_sharedMonitor = (uint64_t)v0;
}

@end