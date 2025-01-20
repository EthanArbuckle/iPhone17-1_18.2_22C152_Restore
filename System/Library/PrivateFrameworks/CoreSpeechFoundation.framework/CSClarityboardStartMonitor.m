@interface CSClarityboardStartMonitor
+ (id)sharedInstance;
- (BOOL)_checkClarityBoardStarted;
- (BOOL)isClarityBoardStarted;
- (CSClarityboardStartMonitor)init;
- (void)_didReceiveClarityboardStarted:(BOOL)a3;
- (void)_didReceiveClarityboardStartedInQueue:(BOOL)a3;
- (void)_notifyObserver:(id)a3 withStarted:(BOOL)a4;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
@end

@implementation CSClarityboardStartMonitor

- (BOOL)_checkClarityBoardStarted
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int out_token = -1;
  notify_register_check("com.apple.ClarityBoard.FinishedStartup", &out_token);
  if (out_token == -1)
  {
    BOOL v2 = 0;
  }
  else
  {
    int check = 0;
    notify_check(out_token, &check);
    notify_cancel(out_token);
    BOOL v2 = check != 0;
  }
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v4 = @"NO";
    if (v2) {
      v4 = @"YES";
    }
    int check = 136315394;
    v8 = "-[CSClarityboardStartMonitor _checkClarityBoardStarted]";
    __int16 v9 = 2114;
    v10 = v4;
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s ClarityBoard started = %{public}@", (uint8_t *)&check, 0x16u);
  }
  return v2;
}

- (BOOL)isClarityBoardStarted
{
  return self->_isClarityBoardStarted;
}

- (void)_notifyObserver:(id)a3 withStarted:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(CSEventMonitor *)self notifyObserver:v6];
  if (objc_opt_respondsToSelector()) {
    [v6 CSClarityboardStartMonitor:self didReceiveStarted:v4];
  }
}

- (void)_didReceiveClarityboardStarted:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__CSClarityboardStartMonitor__didReceiveClarityboardStarted___block_invoke;
  v3[3] = &unk_1E6201138;
  v3[4] = self;
  BOOL v4 = a3;
  [(CSEventMonitor *)self enumerateObservers:v3];
}

uint64_t __61__CSClarityboardStartMonitor__didReceiveClarityboardStarted___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2 withStarted:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_didReceiveClarityboardStartedInQueue:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__CSClarityboardStartMonitor__didReceiveClarityboardStartedInQueue___block_invoke;
  v3[3] = &unk_1E6201138;
  v3[4] = self;
  BOOL v4 = a3;
  [(CSEventMonitor *)self enumerateObserversInQueue:v3];
}

uint64_t __68__CSClarityboardStartMonitor__didReceiveClarityboardStartedInQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2 withStarted:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_stopMonitoring
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int notifyToken = self->_notifyToken;
  if (notifyToken != -1)
  {
    notify_cancel(notifyToken);
    self->_int notifyToken = -1;
    BOOL v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      id v6 = "-[CSClarityboardStartMonitor _stopMonitoring]";
      _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : Clarityboard start", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v4 = a3;
  if (self->_notifyToken == -1)
  {
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __56__CSClarityboardStartMonitor__startMonitoringWithQueue___block_invoke;
    handler[3] = &unk_1E6201110;
    handler[4] = self;
    notify_register_dispatch("com.apple.ClarityBoard.FinishedStartup", &self->_notifyToken, v4, handler);
    int v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v9 = "-[CSClarityboardStartMonitor _startMonitoringWithQueue:]";
      id v6 = "%s Start monitoring : ClarityBoard start";
      goto LABEL_6;
    }
  }
  else
  {
    int v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v9 = "-[CSClarityboardStartMonitor _startMonitoringWithQueue:]";
      id v6 = "%s Cannot start monitoring ClarityBoard start because it was already started";
LABEL_6:
      _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
    }
  }
  self->_isClarityBoardStarted = [(CSClarityboardStartMonitor *)self _checkClarityBoardStarted];
}

uint64_t __56__CSClarityboardStartMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 28) = [*(id *)(a1 + 32) _checkClarityBoardStarted];
  BOOL v2 = *(unsigned __int8 **)(a1 + 32);
  uint64_t v3 = v2[28];
  return [v2 _didReceiveClarityboardStarted:v3];
}

- (CSClarityboardStartMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSClarityboardStartMonitor;
  result = [(CSEventMonitor *)&v3 init];
  if (result)
  {
    result->_int notifyToken = -1;
    result->_isClarityBoardStarted = 0;
  }
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_960 != -1) {
    dispatch_once(&sharedInstance_onceToken_960, &__block_literal_global_961);
  }
  BOOL v2 = (void *)sharedInstance__sharedInstance_962;
  return v2;
}

uint64_t __44__CSClarityboardStartMonitor_sharedInstance__block_invoke()
{
  sharedInstance__sharedInstance_962 = objc_alloc_init(CSClarityboardStartMonitor);
  return MEMORY[0x1F41817F8]();
}

@end