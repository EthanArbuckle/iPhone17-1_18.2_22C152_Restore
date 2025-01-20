@interface COTimerServiceClient
- (COTimerServiceClient)initWithConnection:(id)a3;
- (OS_nw_activity)clientLifetimeActivity;
- (OS_xpc_object)clientLifetimeActivityMetrics;
- (int)clientLifetimeActivityCompletionReason;
- (void)changeClientLifetimeActivityMetrics:(id)a3;
- (void)dealloc;
- (void)donateClientLifetimeActivityCompletionReason:(int)a3;
- (void)setClientLifetimeActivityCompletionReason:(int)a3;
@end

@implementation COTimerServiceClient

- (COTimerServiceClient)initWithConnection:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)COTimerServiceClient;
  v3 = [(COCoordinationServiceClient *)&v13 initWithConnection:a3];
  v4 = v3;
  if (v3)
  {
    v3->_clientLifetimeActivityCompletionReason = 2;
    uint64_t v5 = +[CONetworkActivityFactory activityWithLabel:6 parentActivity:0];
    clientLifetimeActivity = v4->_clientLifetimeActivity;
    v4->_clientLifetimeActivity = (OS_nw_activity *)v5;

    nw_activity_activate();
    v7 = (OS_xpc_object *)xpc_dictionary_create(0, 0, 0);
    clientLifetimeActivityMetrics = v4->_clientLifetimeActivityMetrics;
    v4->_clientLifetimeActivityMetrics = v7;

    v9 = v4->_clientLifetimeActivityMetrics;
    if (v9)
    {
      xpc_dictionary_set_uint64(v9, "service", 1uLL);
      v10 = v4->_clientLifetimeActivityMetrics;
      id v11 = [(COCoordinationServiceClient *)v4 clientBundleIdentifier];
      xpc_dictionary_set_string(v10, "client", (const char *)[v11 UTF8String]);
    }
  }
  return v4;
}

- (void)dealloc
{
  if (self->_clientLifetimeActivityMetrics) {
    nw_activity_submit_metrics();
  }
  nw_activity_complete_with_reason();
  v3.receiver = self;
  v3.super_class = (Class)COTimerServiceClient;
  [(COTimerServiceClient *)&v3 dealloc];
}

- (void)donateClientLifetimeActivityCompletionReason:(int)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __69__COTimerServiceClient_donateClientLifetimeActivityCompletionReason___block_invoke;
  v3[3] = &unk_2645CD470;
  int v4 = a3;
  v3[4] = self;
  [(COCoordinationServiceClient *)self _withLock:v3];
}

uint64_t __69__COTimerServiceClient_donateClientLifetimeActivityCompletionReason___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(unsigned int *)(result + 40);
  if (v2 != 3)
  {
    if (v2 != 2) {
      return result;
    }
    result = [*(id *)(result + 32) clientLifetimeActivityCompletionReason];
    if (result == 3) {
      return result;
    }
    uint64_t v2 = *(unsigned int *)(v1 + 40);
  }
  objc_super v3 = *(void **)(v1 + 32);
  return [v3 setClientLifetimeActivityCompletionReason:v2];
}

- (void)changeClientLifetimeActivityMetrics:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__COTimerServiceClient_changeClientLifetimeActivityMetrics___block_invoke;
  v6[3] = &unk_2645CB170;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(COCoordinationServiceClient *)self _withLock:v6];
}

void __60__COTimerServiceClient_changeClientLifetimeActivityMetrics___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) clientLifetimeActivityMetrics];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (OS_nw_activity)clientLifetimeActivity
{
  return self->_clientLifetimeActivity;
}

- (OS_xpc_object)clientLifetimeActivityMetrics
{
  return self->_clientLifetimeActivityMetrics;
}

- (int)clientLifetimeActivityCompletionReason
{
  return self->_clientLifetimeActivityCompletionReason;
}

- (void)setClientLifetimeActivityCompletionReason:(int)a3
{
  self->_clientLifetimeActivityCompletionReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientLifetimeActivityMetrics, 0);
  objc_storeStrong((id *)&self->_clientLifetimeActivity, 0);
}

@end