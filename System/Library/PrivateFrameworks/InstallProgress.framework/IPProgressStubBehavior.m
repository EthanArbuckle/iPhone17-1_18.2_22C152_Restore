@interface IPProgressStubBehavior
- (IPProgressServerBehaviorDelegate)delegate;
- (IPProgressStubBehavior)initWithEventStreamName:(id)a3;
- (OS_dispatch_queue)queue;
- (void)resume;
- (void)setDelegate:(id)a3;
@end

@implementation IPProgressStubBehavior

- (IPProgressStubBehavior)initWithEventStreamName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IPProgressStubBehavior;
  v5 = [(IPProgressStubBehavior *)&v9 init];
  if (v5)
  {
    v6 = [[IPXPCEventSubscriptionBlackhole alloc] initWithStreamName:v4];
    streamBlackhole = v5->_streamBlackhole;
    v5->_streamBlackhole = v6;
  }
  return v5;
}

- (OS_dispatch_queue)queue
{
  if (queue_onceToken != -1) {
    dispatch_once(&queue_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)queue_queue;

  return (OS_dispatch_queue *)v2;
}

void __31__IPProgressStubBehavior_queue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.InstallProgress.IPProgressStubBehavior", v2);
  v1 = (void *)queue_queue;
  queue_queue = (uint64_t)v0;
}

- (void)resume
{
  v3 = _IPServerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_252AA9000, v3, OS_LOG_TYPE_DEFAULT, "Resuming stub behavior. The sand exerts a comforting influence on the buried head.", v4, 2u);
  }

  [(IPXPCEventSubscriptionBlackhole *)self->_streamBlackhole resume];
}

- (IPProgressServerBehaviorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IPProgressServerBehaviorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_streamBlackhole, 0);
}

@end