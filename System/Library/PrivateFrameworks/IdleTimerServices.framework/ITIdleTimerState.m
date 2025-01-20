@interface ITIdleTimerState
+ (BOOL)isIdleTimerServiceAvailable;
+ (id)sharedInstance;
- (BOOL)isIdleTimerServiceAvailable;
- (id)_init;
- (id)_initWithModel:(id)a3;
- (id)newAssertionToDisableIdleTimerForReason:(id)a3;
- (id)newAssertionToDisableIdleTimerForReason:(id)a3 error:(id *)a4;
- (id)newIdleTimerAssertionWithConfiguration:(id)a3 forReason:(id)a4;
- (id)newIdleTimerAssertionWithConfiguration:(id)a3 forReason:(id)a4 error:(id *)a5;
@end

@implementation ITIdleTimerState

- (id)newAssertionToDisableIdleTimerForReason:(id)a3
{
  return [(ITIdleTimerState *)self newAssertionToDisableIdleTimerForReason:a3 error:0];
}

- (id)newAssertionToDisableIdleTimerForReason:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"ITIdleTimerState.m", 72, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  v8 = +[ITIdleTimerConfiguration configurationToDisableIdleTimer];
  id v9 = [(ITIdleTimerState *)self newIdleTimerAssertionWithConfiguration:v8 forReason:v7 error:a4];

  return v9;
}

- (id)newIdleTimerAssertionWithConfiguration:(id)a3 forReason:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v10)
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"ITIdleTimerState.m", 87, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  if ([(id)objc_opt_class() isIdleTimerServiceAvailable])
  {
    model = self->_model;
    v12 = (void *)[v9 _copyWithNewIdentifier];
    id v13 = [(ITIdleTimerStateModel *)model newIdleTimerAssertionWithConfiguration:v12 forReason:v10 error:a5];
  }
  else
  {
    v14 = ITLogIdleTimer();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ITIdleTimerState newIdleTimerAssertionWithConfiguration:forReason:error:](v14);
    }

    id v13 = 0;
    if (a5) {
      *a5 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ITIdleTimerConfigurationErrorDomain" code:1 userInfo:0];
    }
  }

  return v13;
}

+ (BOOL)isIdleTimerServiceAvailable
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__ITIdleTimerState_isIdleTimerServiceAvailable__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isIdleTimerServiceAvailable_onceToken != -1) {
    dispatch_once(&isIdleTimerServiceAvailable_onceToken, block);
  }
  return isIdleTimerServiceAvailable_isIdleTimerServiceAvailable;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __34__ITIdleTimerState_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = [[ITIdleTimerState alloc] _init];
  return MEMORY[0x270F9A758]();
}

- (id)_init
{
  v3 = objc_alloc_init(ITIdleTimerStateModel);
  id v4 = [(ITIdleTimerState *)self _initWithModel:v3];

  return v4;
}

- (id)_initWithModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ITIdleTimerState;
  v6 = [(ITIdleTimerState *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    v6->_accessLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_model, a3);
  }

  return v7;
}

void __47__ITIdleTimerState_isIdleTimerServiceAvailable__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) sharedInstance];
  isIdleTimerServiceAvailable_isIdleTimerServiceAvailable = [v1 isIdleTimerServiceAvailable];
}

- (BOOL)isIdleTimerServiceAvailable
{
  return [(ITIdleTimerStateModel *)self->_model isIdleTimerServiceAvailable];
}

- (id)newIdleTimerAssertionWithConfiguration:(id)a3 forReason:(id)a4
{
  return [(ITIdleTimerState *)self newIdleTimerAssertionWithConfiguration:a3 forReason:a4 error:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestHandler, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

- (void)newIdleTimerAssertionWithConfiguration:(os_log_t)log forReason:error:.cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_210665000, log, OS_LOG_TYPE_ERROR, "The client is requesting an idle timer assertion, but the system is not providing idle timer services.", v1, 2u);
}

@end