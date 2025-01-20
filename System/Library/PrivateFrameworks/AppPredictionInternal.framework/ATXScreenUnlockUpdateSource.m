@interface ATXScreenUnlockUpdateSource
- (ATXCoreDuetContextHelper)contextHelper;
- (ATXPredictionContextBuilderProtocol)predictionContextBuilder;
- (ATXScreenUnlockUpdateSource)init;
- (ATXScreenUnlockUpdateSource)initWithContextHelper:(id)a3 predictionContextBuilder:(id)a4;
- (ATXUpdatePredictionsDelegate)delegate;
- (void)_handleScreenUnlockEvent;
- (void)_listenForScreenUnlock;
- (void)setContextHelper:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPredictionContextBuilder:(id)a3;
@end

@implementation ATXScreenUnlockUpdateSource

- (ATXScreenUnlockUpdateSource)init
{
  v3 = objc_opt_new();
  v4 = +[ATXPredictionContextBuilder sharedInstance];
  v5 = [(ATXScreenUnlockUpdateSource *)self initWithContextHelper:v3 predictionContextBuilder:v4];

  return v5;
}

- (ATXScreenUnlockUpdateSource)initWithContextHelper:(id)a3 predictionContextBuilder:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXScreenUnlockUpdateSource;
  v9 = [(ATXScreenUnlockUpdateSource *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contextHelper, a3);
    objc_storeStrong((id *)&v10->_predictionContextBuilder, a4);
  }
  [(ATXScreenUnlockUpdateSource *)v10 _listenForScreenUnlock];

  return v10;
}

- (void)_listenForScreenUnlock
{
  objc_initWeak(&location, self);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __53__ATXScreenUnlockUpdateSource__listenForScreenUnlock__block_invoke;
  v11 = &unk_1E68AFBE0;
  objc_copyWeak(&v12, &location);
  v3 = _Block_copy(&v8);
  v4 = objc_msgSend(MEMORY[0x1E4F5B6B8], "keyPathForDeviceLockStatus", v8, v9, v10, v11);
  v5 = [MEMORY[0x1E4F5B6E8] predicateForKeyPath:v4 equalToValue:&unk_1F27F2010];
  v6 = [MEMORY[0x1E4F5B6C8] localWakingRegistrationWithIdentifier:@"com.apple.duetexpertd.ATXScreenUnlockUpdateSource" contextualPredicate:v5 clientIdentifier:@"com.apple.duetexpertd.cdidentifier" callback:v3];
  id v7 = [(ATXCoreDuetContextHelper *)self->_contextHelper context];
  [v7 registerCallback:v6];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __53__ATXScreenUnlockUpdateSource__listenForScreenUnlock__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _handleScreenUnlockEvent];
    id WeakRetained = v2;
  }
}

- (void)_handleScreenUnlockEvent
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    int v8 = 138412546;
    uint64_t v9 = v5;
    __int16 v10 = 2080;
    v11 = "-[ATXScreenUnlockUpdateSource _handleScreenUnlockEvent]";
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "%@ - %s: got screen unlock event", (uint8_t *)&v8, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained tryUpdatePredictionsDefaultIntervalWithReason:7];

  id v7 = (id)[(ATXPredictionContextBuilderProtocol *)self->_predictionContextBuilder updateContextStreamAndReturnPredictionContextForCurrentContext];
}

- (ATXUpdatePredictionsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ATXUpdatePredictionsDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ATXCoreDuetContextHelper)contextHelper
{
  return self->_contextHelper;
}

- (void)setContextHelper:(id)a3
{
}

- (ATXPredictionContextBuilderProtocol)predictionContextBuilder
{
  return self->_predictionContextBuilder;
}

- (void)setPredictionContextBuilder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionContextBuilder, 0);
  objc_storeStrong((id *)&self->_contextHelper, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end