@interface COEndpointMonitor
- (COEndpointMonitor)init;
- (COEndpointMonitorDelegate)delegate;
- (void)_activateLink;
- (void)setDelegate:(id)a3;
- (void)startMonitoring;
@end

@implementation COEndpointMonitor

- (COEndpointMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)COEndpointMonitor;
  v2 = [(COEndpointMonitor *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.Coordination.EndpointMonitoring", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)startMonitoring
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2217C1000, log, OS_LOG_TYPE_DEBUG, "Start monitoring endpoints", v1, 2u);
}

- (void)_activateLink
{
  objc_initWeak(&location, self);
  client = self->_client;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __34__COEndpointMonitor__activateLink__block_invoke;
  v4[3] = &unk_2645CAEA8;
  objc_copyWeak(&v5, &location);
  [(RPCompanionLinkClient *)client activateWithCompletion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __34__COEndpointMonitor__activateLink__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    dispatch_queue_t v4 = COCoreLogForCategory(6);
    id v5 = v4;
    if (a2)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __34__COEndpointMonitor__activateLink__block_invoke_cold_1(v5);
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "Successfully activated link to monitor endpoints", v6, 2u);
    }
  }
}

- (COEndpointMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (COEndpointMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

void __34__COEndpointMonitor__activateLink__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2217C1000, log, OS_LOG_TYPE_ERROR, "Could not activate rapport link to monitor endpoints", v1, 2u);
}

@end