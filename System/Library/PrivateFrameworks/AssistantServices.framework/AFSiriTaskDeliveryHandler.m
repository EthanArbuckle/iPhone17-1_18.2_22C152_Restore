@interface AFSiriTaskDeliveryHandler
- (AFSiriTaskService)service;
- (AFSiriTaskServiceDelegate)delegate;
- (OS_dispatch_queue)queue;
- (void)deliverSiriTask:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
- (void)setService:(id)a3;
@end

@implementation AFSiriTaskDeliveryHandler

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_service);
}

- (void)setDelegate:(id)a3
{
}

- (AFSiriTaskServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AFSiriTaskServiceDelegate *)WeakRetained;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setService:(id)a3
{
}

- (AFSiriTaskService)service
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  return (AFSiriTaskService *)WeakRetained;
}

- (void)deliverSiriTask:(id)a3 completionHandler:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[AFSiriTaskDeliveryHandler deliverSiriTask:completionHandler:]";
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __63__AFSiriTaskDeliveryHandler_deliverSiriTask_completionHandler___block_invoke;
  v17[3] = &unk_1E592B9A0;
  id v18 = v7;
  id v9 = v7;
  v10 = (void *)MEMORY[0x19F3A50D0](v17);
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__AFSiriTaskDeliveryHandler_deliverSiriTask_completionHandler___block_invoke_2;
  v14[3] = &unk_1E592C598;
  id v15 = v6;
  id v16 = v10;
  v14[4] = self;
  id v12 = v6;
  id v13 = v10;
  dispatch_async(queue, v14);
}

uint64_t __63__AFSiriTaskDeliveryHandler_deliverSiriTask_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __63__AFSiriTaskDeliveryHandler_deliverSiriTask_completionHandler___block_invoke_2(void *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24));

  if (WeakRetained)
  {
    v3 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = a1[4];
      v5 = v3;
      id v6 = objc_loadWeakRetained((id *)(v4 + 24));
      uint64_t v7 = a1[5];
      *(_DWORD *)buf = 136315906;
      id v13 = "-[AFSiriTaskDeliveryHandler deliverSiriTask:completionHandler:]_block_invoke_2";
      __int16 v14 = 2112;
      uint64_t v15 = v4;
      __int16 v16 = 2112;
      id v17 = v6;
      __int16 v18 = 2112;
      uint64_t v19 = v7;
      _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s %@ asking %@ to handle task %@", buf, 0x2Au);
    }
    id v8 = objc_loadWeakRetained((id *)(a1[4] + 24));
    id v9 = objc_loadWeakRetained((id *)(a1[4] + 8));
    [v8 siriTaskService:v9 handleSiriTask:a1[5]];

    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    uint64_t v10 = a1[6];
    id v11 = +[AFError errorWithCode:700];
    (*(void (**)(uint64_t))(v10 + 16))(v10);
  }
}

@end