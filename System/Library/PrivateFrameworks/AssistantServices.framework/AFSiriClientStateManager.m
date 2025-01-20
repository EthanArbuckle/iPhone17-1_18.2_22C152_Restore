@interface AFSiriClientStateManager
+ (id)sharedManager;
- (AFSiriClientStateManager)initWithInstanceContext:(id)a3;
- (id)_stateForClient:(void *)a3 createIfAbsent:(BOOL)a4;
- (unint64_t)_aggregatedState;
- (void)_aggregateStatesAndPublishIfNeeded;
- (void)_beginListeningForClient:(void *)a3;
- (void)_beginPresentationTransition;
- (void)_beginRequestWithUUID:(id)a3 forClient:(void *)a4;
- (void)_beginSessionForClient:(void *)a3;
- (void)_beginSpeakingForClient:(void *)a3;
- (void)_endListeningForClient:(void *)a3;
- (void)_endPresentationTransitionForReason:(id)a3;
- (void)_endRequestWithUUID:(id)a3 forClient:(void *)a4;
- (void)_endSessionForClient:(void *)a3;
- (void)_endSpeakingForClient:(void *)a3;
- (void)_removeStateForClient:(void *)a3;
- (void)beginListeningForClient:(void *)a3;
- (void)beginPresentationTransition;
- (void)beginRequestWithUUID:(id)a3 forClient:(void *)a4;
- (void)beginSessionForClient:(void *)a3;
- (void)beginSpeakingForClient:(id)a3;
- (void)beginTransaction;
- (void)beginTransactionForReason:(int64_t)a3;
- (void)endListeningForClient:(void *)a3;
- (void)endPresentationTransition;
- (void)endRequestWithUUID:(id)a3 forClient:(void *)a4;
- (void)endSessionForClient:(void *)a3;
- (void)endSpeakingForClient:(id)a3;
- (void)endTransaction;
- (void)endTransactionForReason:(int64_t)a3;
- (void)getCurrentStateWithCompletion:(id)a3;
- (void)invalidateClient:(void *)a3;
@end

@implementation AFSiriClientStateManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationTransitionGroup, 0);
  objc_storeStrong((id *)&self->_presentationTransitionWatchdogTimer, 0);
  objc_storeStrong((id *)&self->_presentationTransitionAssertion, 0);
  objc_storeStrong((id *)&self->_statesByClient, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_endPresentationTransitionForReason:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    v12 = "-[AFSiriClientStateManager _endPresentationTransitionForReason:]";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s reason = %@", (uint8_t *)&v11, 0x16u);
  }
  presentationTransitionWatchdogTimer = self->_presentationTransitionWatchdogTimer;
  if (presentationTransitionWatchdogTimer)
  {
    [(AFWatchdogTimer *)presentationTransitionWatchdogTimer cancel];
    v7 = self->_presentationTransitionWatchdogTimer;
    self->_presentationTransitionWatchdogTimer = 0;
  }
  presentationTransitionAssertion = self->_presentationTransitionAssertion;
  if (presentationTransitionAssertion)
  {
    [(AFSafetyBlock *)presentationTransitionAssertion invokeWithSignal:0];
    v9 = self->_presentationTransitionAssertion;
    self->_presentationTransitionAssertion = 0;
  }
  else
  {
    v10 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      v12 = "-[AFSiriClientStateManager _endPresentationTransitionForReason:]";
      _os_log_error_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_ERROR, "%s Attempted to end a presentation transition when there's no current presentation transition.", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)_beginPresentationTransition
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[AFSiriClientStateManager _beginPresentationTransition]";
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  presentationTransitionWatchdogTimer = self->_presentationTransitionWatchdogTimer;
  if (presentationTransitionWatchdogTimer)
  {
    [(AFWatchdogTimer *)presentationTransitionWatchdogTimer cancel];
    v5 = self->_presentationTransitionWatchdogTimer;
    self->_presentationTransitionWatchdogTimer = 0;
  }
  if (self->_presentationTransitionAssertion)
  {
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[AFSiriClientStateManager _beginPresentationTransition]";
      _os_log_error_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_ERROR, "%s Attempted to begin a presentation transition when there's already a current presentation transition.", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v7 = mach_absolute_time();
    v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[AFSiriClientStateManager _beginPresentationTransition]";
      _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s Acquired presentation transition assertion.", buf, 0xCu);
    }
    dispatch_group_enter((dispatch_group_t)self->_presentationTransitionGroup);
    v9 = [AFSafetyBlock alloc];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __56__AFSiriClientStateManager__beginPresentationTransition__block_invoke;
    v18[3] = &unk_1E592B430;
    v18[4] = self;
    v18[5] = v7;
    v10 = [(AFSafetyBlock *)v9 initWithBlock:v18];
    presentationTransitionAssertion = self->_presentationTransitionAssertion;
    self->_presentationTransitionAssertion = v10;
  }
  objc_initWeak((id *)buf, self);
  v12 = [AFWatchdogTimer alloc];
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __56__AFSiriClientStateManager__beginPresentationTransition__block_invoke_12;
  v16[3] = &unk_1E592B978;
  objc_copyWeak(&v17, (id *)buf);
  id v14 = [(AFWatchdogTimer *)v12 initWithTimeoutInterval:queue onQueue:v16 timeoutHandler:4.0];
  uint64_t v15 = self->_presentationTransitionWatchdogTimer;
  self->_presentationTransitionWatchdogTimer = v14;

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

void __56__AFSiriClientStateManager__beginPresentationTransition__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 56));
  id v4 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    uint64_t v6 = mach_absolute_time() - *(void *)(a1 + 40);
    if (_AFMachAbsoluteTimeRate_onceToken != -1) {
      dispatch_once(&_AFMachAbsoluteTimeRate_onceToken, &__block_literal_global_973);
    }
    int v7 = 136315650;
    v8 = "-[AFSiriClientStateManager _beginPresentationTransition]_block_invoke";
    __int16 v9 = 2048;
    uint64_t v10 = a2;
    __int16 v11 = 2048;
    double v12 = *(double *)&_AFMachAbsoluteTimeRate_rate * (double)v6 / 1000000000.0;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s Relinquished presentation transition assertion. (signal = %ld, duration = %f)", (uint8_t *)&v7, 0x20u);
  }
}

void __56__AFSiriClientStateManager__beginPresentationTransition__block_invoke_12(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _endPresentationTransitionForReason:@"Timeout"];
}

- (unint64_t)_aggregatedState
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(NSMapTable *)self->_statesByClient objectEnumerator];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 |= [*(id *)(*((void *)&v9 + 1) + 8 * i) notifyState];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (void)_aggregateStatesAndPublishIfNeeded
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int64_t transactionDepth = self->_transactionDepth;
  if (transactionDepth < 1)
  {
    unint64_t v5 = [(AFSiriClientStateManager *)self _aggregatedState];
    uint64_t v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316162;
      long long v10 = "-[AFSiriClientStateManager _aggregateStatesAndPublishIfNeeded]";
      __int16 v11 = 1024;
      *(_DWORD *)long long v12 = (v5 >> 1) & 1;
      *(_WORD *)&v12[4] = 1024;
      *(_DWORD *)&v12[6] = v5 & 1;
      __int16 v13 = 1024;
      unsigned int v14 = (v5 >> 2) & 1;
      __int16 v15 = 1024;
      unsigned int v16 = (v5 >> 3) & 1;
      _os_log_debug_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_DEBUG, "%s hasActiveSession = %d, hasActiveRequest = %d, isListening = %d, isSpeaking = %d", buf, 0x24u);
    }
    publisher = self->_publisher;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __62__AFSiriClientStateManager__aggregateStatesAndPublishIfNeeded__block_invoke;
    v8[3] = &__block_descriptor_40_e8_Q16__0Q8l;
    v8[4] = v5;
    [(AFNotifyStatePublisher *)publisher publishStateWithBlock:v8];
  }
  else
  {
    uint64_t v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      long long v10 = "-[AFSiriClientStateManager _aggregateStatesAndPublishIfNeeded]";
      __int16 v11 = 2048;
      *(void *)long long v12 = transactionDepth;
      _os_log_debug_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_DEBUG, "%s Skipped because transaction depth is %ld", buf, 0x16u);
    }
  }
}

uint64_t __62__AFSiriClientStateManager__aggregateStatesAndPublishIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 136315650;
    v8 = "-[AFSiriClientStateManager _aggregateStatesAndPublishIfNeeded]_block_invoke";
    __int16 v9 = 2048;
    uint64_t v10 = a2;
    __int16 v11 = 2048;
    uint64_t v12 = v5;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s state: %llu -> %llu", (uint8_t *)&v7, 0x20u);
  }
  return *(void *)(a1 + 32);
}

- (void)_endSpeakingForClient:(void *)a3
{
  id v4 = [(AFSiriClientStateManager *)self _stateForClient:a3 createIfAbsent:0];
  [v4 setIsSpeaking:0];
  [(AFSiriClientStateManager *)self _aggregateStatesAndPublishIfNeeded];
}

- (void)_beginSpeakingForClient:(void *)a3
{
  id v4 = [(AFSiriClientStateManager *)self _stateForClient:a3 createIfAbsent:1];
  [v4 setIsSpeaking:1];
  [(AFSiriClientStateManager *)self _aggregateStatesAndPublishIfNeeded];
}

- (void)_endListeningForClient:(void *)a3
{
  id v4 = [(AFSiriClientStateManager *)self _stateForClient:a3 createIfAbsent:0];
  [v4 setIsListening:0];
  [(AFSiriClientStateManager *)self _aggregateStatesAndPublishIfNeeded];
}

- (void)_beginListeningForClient:(void *)a3
{
  id v4 = [(AFSiriClientStateManager *)self _stateForClient:a3 createIfAbsent:1];
  [v4 setIsListening:1];
  [(AFSiriClientStateManager *)self _aggregateStatesAndPublishIfNeeded];
}

- (void)_endRequestWithUUID:(id)a3 forClient:(void *)a4
{
  id v6 = a3;
  id v7 = [(AFSiriClientStateManager *)self _stateForClient:a4 createIfAbsent:0];
  [v7 removeRequestUUID:v6];

  [(AFSiriClientStateManager *)self _aggregateStatesAndPublishIfNeeded];
}

- (void)_beginRequestWithUUID:(id)a3 forClient:(void *)a4
{
  id v6 = a3;
  id v7 = [(AFSiriClientStateManager *)self _stateForClient:a4 createIfAbsent:1];
  [v7 addRequestUUID:v6];

  [(AFSiriClientStateManager *)self _aggregateStatesAndPublishIfNeeded];
}

- (void)_endSessionForClient:(void *)a3
{
  id v4 = [(AFSiriClientStateManager *)self _stateForClient:a3 createIfAbsent:0];
  [v4 setHasActiveSession:0];
  [(AFSiriClientStateManager *)self _aggregateStatesAndPublishIfNeeded];
}

- (void)_beginSessionForClient:(void *)a3
{
  id v4 = [(AFSiriClientStateManager *)self _stateForClient:a3 createIfAbsent:1];
  [v4 setHasActiveSession:1];
  [(AFSiriClientStateManager *)self _aggregateStatesAndPublishIfNeeded];
}

- (void)_removeStateForClient:(void *)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  NSMapRemove(self->_statesByClient, a3);
  if (![(NSMapTable *)self->_statesByClient count])
  {
    id v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      id v7 = "-[AFSiriClientStateManager _removeStateForClient:]";
      _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s Resetting transaction depth since last client has been invalidated", (uint8_t *)&v6, 0xCu);
    }
    if (self->_transactionDepth >= 1)
    {
      uint64_t v5 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        int v6 = 136315138;
        id v7 = "-[AFSiriClientStateManager _removeStateForClient:]";
        _os_log_error_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_ERROR, "%s last client was removed before all transactions ended", (uint8_t *)&v6, 0xCu);
      }
    }
    self->_int64_t transactionDepth = 0;
  }
  [(AFSiriClientStateManager *)self _aggregateStatesAndPublishIfNeeded];
}

- (id)_stateForClient:(void *)a3 createIfAbsent:(BOOL)a4
{
  BOOL v4 = a4;
  NSMapGet(self->_statesByClient, a3);
  id v7 = (_AFSiriClientState *)objc_claimAutoreleasedReturnValue();
  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = !v4;
  }
  if (!v8)
  {
    id v7 = objc_alloc_init(_AFSiriClientState);
    NSMapInsert(self->_statesByClient, a3, v7);
  }
  return v7;
}

- (void)getCurrentStateWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = mach_absolute_time();
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__AFSiriClientStateManager_getCurrentStateWithCompletion___block_invoke;
    block[3] = &unk_1E592B3E8;
    block[4] = self;
    uint64_t v9 = v5;
    id v8 = v4;
    dispatch_async(queue, block);
  }
}

void __58__AFSiriClientStateManager_getCurrentStateWithCompletion___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(NSObject **)(v2 + 56);
  id v4 = *(NSObject **)(v2 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__AFSiriClientStateManager_getCurrentStateWithCompletion___block_invoke_2;
  block[3] = &unk_1E592B3E8;
  uint64_t v5 = (void *)a1[5];
  uint64_t v9 = a1[6];
  id v6 = v5;
  block[4] = a1[4];
  id v8 = v6;
  dispatch_group_notify(v3, v4, block);
}

uint64_t __58__AFSiriClientStateManager_getCurrentStateWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = v2;
    uint64_t v4 = mach_absolute_time() - *(void *)(a1 + 48);
    if (_AFMachAbsoluteTimeRate_onceToken != -1) {
      dispatch_once(&_AFMachAbsoluteTimeRate_onceToken, &__block_literal_global_973);
    }
    int v6 = 136315394;
    id v7 = "-[AFSiriClientStateManager getCurrentStateWithCompletion:]_block_invoke_2";
    __int16 v8 = 2048;
    double v9 = *(double *)&_AFMachAbsoluteTimeRate_rate * (double)v4 / 1000000000.0;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s Took %f seconds to access current state.", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), [*(id *)(a1 + 32) _aggregatedState]);
}

- (void)endPresentationTransition
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__AFSiriClientStateManager_endPresentationTransition__block_invoke;
  block[3] = &unk_1E592C678;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __53__AFSiriClientStateManager_endPresentationTransition__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endPresentationTransitionForReason:@"Client"];
}

- (void)beginPresentationTransition
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__AFSiriClientStateManager_beginPresentationTransition__block_invoke;
  block[3] = &unk_1E592C678;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __55__AFSiriClientStateManager_beginPresentationTransition__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginPresentationTransition];
}

- (void)endTransactionForReason:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__AFSiriClientStateManager_endTransactionForReason___block_invoke;
  v4[3] = &unk_1E592B398;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __52__AFSiriClientStateManager_endTransactionForReason___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 32);
  uint64_t v4 = AFSiriLogContextConnection;
  if (v3 < 1)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      __int16 v11 = "-[AFSiriClientStateManager endTransactionForReason:]_block_invoke";
      _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s Attempting to decrement transaction depth below 0", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v6 = *(void *)(a1 + 40);
      id v7 = v4;
      if (v6 > 4) {
        __int16 v8 = @"(unknown)";
      }
      else {
        __int16 v8 = off_1E5927988[v6];
      }
      double v9 = v8;
      int v10 = 136315394;
      __int16 v11 = "-[AFSiriClientStateManager endTransactionForReason:]_block_invoke";
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      _os_log_debug_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_DEBUG, "%s Ending transaction for reason: %@", (uint8_t *)&v10, 0x16u);

      uint64_t v2 = *(void *)(a1 + 32);
      uint64_t v3 = *(void *)(v2 + 32);
    }
    *(void *)(v2 + 32) = v3 - 1;
  }
  return [*(id *)(a1 + 32) _aggregateStatesAndPublishIfNeeded];
}

- (void)endTransaction
{
}

- (void)beginTransactionForReason:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__AFSiriClientStateManager_beginTransactionForReason___block_invoke;
  v4[3] = &unk_1E592B398;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

void __54__AFSiriClientStateManager_beginTransactionForReason___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) count];
  uint64_t v3 = (void *)AFSiriLogContextConnection;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = v3;
      if (v4 > 4) {
        unint64_t v6 = @"(unknown)";
      }
      else {
        unint64_t v6 = off_1E5927988[v4];
      }
      int v10 = v6;
      int v12 = 136315394;
      uint64_t v13 = "-[AFSiriClientStateManager beginTransactionForReason:]_block_invoke";
      __int16 v14 = 2112;
      __int16 v15 = v10;
      _os_log_debug_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEBUG, "%s Started transaction for reason: %@", (uint8_t *)&v12, 0x16u);
    }
    ++*(void *)(*(void *)(a1 + 32) + 32);
  }
  else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    unint64_t v7 = *(void *)(a1 + 40);
    __int16 v8 = v3;
    if (v7 > 4) {
      double v9 = @"(unknown)";
    }
    else {
      double v9 = off_1E5927988[v7];
    }
    __int16 v11 = v9;
    int v12 = 136315394;
    uint64_t v13 = "-[AFSiriClientStateManager beginTransactionForReason:]_block_invoke";
    __int16 v14 = 2112;
    __int16 v15 = v11;
    _os_log_error_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_ERROR, "%s Not begining transaction for reason: %@", (uint8_t *)&v12, 0x16u);
  }
}

- (void)beginTransaction
{
}

- (void)endSpeakingForClient:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __49__AFSiriClientStateManager_endSpeakingForClient___block_invoke;
    v7[3] = &unk_1E592C710;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __49__AFSiriClientStateManager_endSpeakingForClient___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endSpeakingForClient:*(void *)(a1 + 40)];
}

- (void)beginSpeakingForClient:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __51__AFSiriClientStateManager_beginSpeakingForClient___block_invoke;
    v7[3] = &unk_1E592C710;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __51__AFSiriClientStateManager_beginSpeakingForClient___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginSpeakingForClient:*(void *)(a1 + 40)];
}

- (void)endListeningForClient:(void *)a3
{
  if (a3)
  {
    queue = self->_queue;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __50__AFSiriClientStateManager_endListeningForClient___block_invoke;
    v4[3] = &unk_1E592B398;
    v4[4] = self;
    v4[5] = a3;
    dispatch_async(queue, v4);
  }
}

uint64_t __50__AFSiriClientStateManager_endListeningForClient___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endListeningForClient:*(void *)(a1 + 40)];
}

- (void)beginListeningForClient:(void *)a3
{
  if (a3)
  {
    queue = self->_queue;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __52__AFSiriClientStateManager_beginListeningForClient___block_invoke;
    v4[3] = &unk_1E592B398;
    v4[4] = self;
    v4[5] = a3;
    dispatch_async(queue, v4);
  }
}

uint64_t __52__AFSiriClientStateManager_beginListeningForClient___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginListeningForClient:*(void *)(a1 + 40)];
}

- (void)endRequestWithUUID:(id)a3 forClient:(void *)a4
{
  id v6 = a3;
  unint64_t v7 = v6;
  if (v6 && a4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__AFSiriClientStateManager_endRequestWithUUID_forClient___block_invoke;
    block[3] = &unk_1E592B3C0;
    block[4] = self;
    id v10 = v6;
    __int16 v11 = a4;
    dispatch_async(queue, block);
  }
}

uint64_t __57__AFSiriClientStateManager_endRequestWithUUID_forClient___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endRequestWithUUID:*(void *)(a1 + 40) forClient:*(void *)(a1 + 48)];
}

- (void)beginRequestWithUUID:(id)a3 forClient:(void *)a4
{
  id v6 = a3;
  unint64_t v7 = v6;
  if (v6 && a4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__AFSiriClientStateManager_beginRequestWithUUID_forClient___block_invoke;
    block[3] = &unk_1E592B3C0;
    block[4] = self;
    id v10 = v6;
    __int16 v11 = a4;
    dispatch_async(queue, block);
  }
}

uint64_t __59__AFSiriClientStateManager_beginRequestWithUUID_forClient___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginRequestWithUUID:*(void *)(a1 + 40) forClient:*(void *)(a1 + 48)];
}

- (void)endSessionForClient:(void *)a3
{
  if (a3)
  {
    queue = self->_queue;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __48__AFSiriClientStateManager_endSessionForClient___block_invoke;
    v4[3] = &unk_1E592B398;
    v4[4] = self;
    v4[5] = a3;
    dispatch_async(queue, v4);
  }
}

uint64_t __48__AFSiriClientStateManager_endSessionForClient___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endSessionForClient:*(void *)(a1 + 40)];
}

- (void)beginSessionForClient:(void *)a3
{
  if (a3)
  {
    queue = self->_queue;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __50__AFSiriClientStateManager_beginSessionForClient___block_invoke;
    v4[3] = &unk_1E592B398;
    v4[4] = self;
    v4[5] = a3;
    dispatch_async(queue, v4);
  }
}

uint64_t __50__AFSiriClientStateManager_beginSessionForClient___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginSessionForClient:*(void *)(a1 + 40)];
}

- (void)invalidateClient:(void *)a3
{
  if (a3)
  {
    queue = self->_queue;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __45__AFSiriClientStateManager_invalidateClient___block_invoke;
    v4[3] = &unk_1E592B398;
    v4[4] = self;
    v4[5] = a3;
    dispatch_async(queue, v4);
  }
}

uint64_t __45__AFSiriClientStateManager_invalidateClient___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeStateForClient:*(void *)(a1 + 40)];
}

- (AFSiriClientStateManager)initWithInstanceContext:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AFSiriClientStateManager;
  uint64_t v5 = [(AFSiriClientStateManager *)&v19 init];
  if (v5)
  {
    id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    unint64_t v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.siri.client-state-manager", v7);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:258 valueOptions:0 capacity:1];
    statesByClient = v5->_statesByClient;
    v5->_statesByClient = (NSMapTable *)v10;

    int v12 = (void *)[[NSString alloc] initWithUTF8String:"com.apple.siri.client-state-changed"];
    AFNotifyGetEffectiveNotificationName(v12, v4);
    objc_claimAutoreleasedReturnValue();

    uint64_t v13 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v21 = "-[AFSiriClientStateManager initWithInstanceContext:]";
      __int16 v22 = 2048;
      v23 = v5;
      __int16 v24 = 2112;
      v25 = v12;
      _os_log_debug_impl(&dword_19CF1D000, v13, OS_LOG_TYPE_DEBUG, "%s %p %@", buf, 0x20u);
    }
    __int16 v14 = [[AFNotifyStatePublisher alloc] initWithName:v12 queue:v5->_queue];
    publisher = v5->_publisher;
    v5->_publisher = v14;

    dispatch_group_t v16 = dispatch_group_create();
    presentationTransitionGroup = v5->_presentationTransitionGroup;
    v5->_presentationTransitionGroup = (OS_dispatch_group *)v16;
  }
  return v5;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken_42963 != -1) {
    dispatch_once(&sharedManager_onceToken_42963, &__block_literal_global_42964);
  }
  uint64_t v2 = (void *)sharedManager_sharedManager_42965;
  return v2;
}

void __41__AFSiriClientStateManager_sharedManager__block_invoke()
{
  v0 = [[AFSiriClientStateManager alloc] initWithInstanceContext:0];
  v1 = (void *)sharedManager_sharedManager_42965;
  sharedManager_sharedManager_42965 = (uint64_t)v0;
}

@end