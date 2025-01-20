@interface ECLocalActionReplayer
+ (OS_os_log)log;
- (ECLocalActionReplayer)init;
- (ECLocalActionReplayer)initWithAction:(id)a3;
- (ECLocalActionReplayerDelegate)delegate;
- (ECLocalMessageAction)action;
- (NSError)error;
- (id)failActionWithError:(id)a3;
- (id)replayAction;
- (void)setAction:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setError:(id)a3;
@end

@implementation ECLocalActionReplayer

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__ECLocalActionReplayer_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_1 != -1) {
    dispatch_once(&log_onceToken_1, block);
  }
  v2 = (void *)log_log_1;
  return (OS_os_log *)v2;
}

void __28__ECLocalActionReplayer_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_1;
  log_log_1 = (uint64_t)v1;
}

- (ECLocalActionReplayer)init
{
}

- (ECLocalActionReplayer)initWithAction:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ECLocalActionReplayer;
  v6 = [(ECLocalActionReplayer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_action, a3);
  }

  return v7;
}

- (id)replayAction
{
}

- (id)failActionWithError:(id)a3
{
  id v3 = a3;
  v4 = [[ECLocalMessageActionResults alloc] initWithError:v3];

  return v4;
}

- (ECLocalActionReplayerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ECLocalActionReplayerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ECLocalMessageAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end