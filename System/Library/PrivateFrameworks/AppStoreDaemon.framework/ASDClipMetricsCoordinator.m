@interface ASDClipMetricsCoordinator
- (ASDClipMetricsCoordinator)init;
- (void)sendClipCardMetricsEvent:(id)a3 completionHandler:(id)a4;
@end

@implementation ASDClipMetricsCoordinator

- (ASDClipMetricsCoordinator)init
{
  v6.receiver = self;
  v6.super_class = (Class)ASDClipMetricsCoordinator;
  v2 = [(ASDClipMetricsCoordinator *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[ASDServiceBroker defaultBroker];
    broker = v2->_broker;
    v2->_broker = (ASDClipServiceBroker *)v3;
  }
  return v2;
}

- (void)sendClipCardMetricsEvent:(id)a3 completionHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  broker = self->_broker;
  id v18 = 0;
  v9 = [(ASDClipServiceBroker *)broker getClipServiceWithError:&v18];
  id v10 = v18;
  if (v9)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __72__ASDClipMetricsCoordinator_sendClipCardMetricsEvent_completionHandler___block_invoke;
    v16[3] = &unk_1E58B2CB8;
    id v11 = v7;
    id v17 = v11;
    v12 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v16];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __72__ASDClipMetricsCoordinator_sendClipCardMetricsEvent_completionHandler___block_invoke_1;
    v14[3] = &unk_1E58B2CE0;
    id v15 = v11;
    [v12 clipCardMetricsEvent:v6 withReplyHandler:v14];
  }
  else
  {
    v13 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v10;
      _os_log_error_impl(&dword_19BF6A000, v13, OS_LOG_TYPE_ERROR, "Request to service failed with error: %@", buf, 0xCu);
    }

    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v10);
  }
}

void __72__ASDClipMetricsCoordinator_sendClipCardMetricsEvent_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "Request to make a connection with error: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __72__ASDClipMetricsCoordinator_sendClipCardMetricsEvent_completionHandler___block_invoke_1(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

@end