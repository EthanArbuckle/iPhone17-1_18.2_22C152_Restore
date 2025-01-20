@interface AFClientLiteInternal
- (id)initAndHandleCommand:(id)a3 afterCurrentRequest:(BOOL)a4 isOneWay:(BOOL)a5 commandHandler:(id)a6 completion:(id)a7;
- (void)_handleCommand:(id)a3 afterCurrentRequest:(BOOL)a4 isOneWay:(BOOL)a5 completion:(id)a6;
- (void)dealloc;
- (void)handleCommand:(id)a3 completion:(id)a4;
@end

@implementation AFClientLiteInternal

- (void).cxx_destruct
{
  objc_storeStrong(&self->_commandHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)handleCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__AFClientLiteInternal_handleCommand_completion___block_invoke;
  block[3] = &unk_1E592C598;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __49__AFClientLiteInternal_handleCommand_completion___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1[4] + 16);
  if (v2)
  {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, a1[5]);
    v3 = (objc_class *)MEMORY[0x1E4F965B8];
  }
  else
  {
    v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = a1[5];
      int v8 = 136315394;
      id v9 = "-[AFClientLiteInternal handleCommand:completion:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s No command handler in client for command %@", (uint8_t *)&v8, 0x16u);
    }
    v3 = (objc_class *)MEMORY[0x1E4F965A8];
  }
  id v5 = objc_alloc_init(v3);
  uint64_t v6 = a1[6];
  if (v6) {
    (*(void (**)(uint64_t, id, void))(v6 + 16))(v6, v5, 0);
  }
}

- (void)_handleCommand:(id)a3 afterCurrentRequest:(BOOL)a4 isOneWay:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    v31 = "-[AFClientLiteInternal _handleCommand:afterCurrentRequest:isOneWay:completion:]";
    __int16 v32 = 2048;
    v33 = self;
    __int16 v34 = 2112;
    id v35 = v10;
    __int16 v36 = 1024;
    BOOL v37 = v8;
    __int16 v38 = 1024;
    BOOL v39 = v7;
    _os_log_impl(&dword_19CF1D000, v12, OS_LOG_TYPE_INFO, "%s %p Started %@ %d %d", buf, 0x2Cu);
  }
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.siri.client_lite" options:0];
  objc_initWeak((id *)buf, v13);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __79__AFClientLiteInternal__handleCommand_afterCurrentRequest_isOneWay_completion___block_invoke;
  v27[3] = &unk_1E59277F8;
  v27[4] = self;
  id v14 = v11;
  id v28 = v14;
  objc_copyWeak(&v29, (id *)buf);
  v15 = (void *)MEMORY[0x19F3A50D0](v27);
  v16 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEEB4C68];
  [v13 setExportedInterface:v16];

  [v13 setExportedObject:self];
  v17 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEEE6B28];
  [v13 setRemoteObjectInterface:v17];

  [v13 resume];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __79__AFClientLiteInternal__handleCommand_afterCurrentRequest_isOneWay_completion___block_invoke_6;
  v25[3] = &unk_1E592B9A0;
  id v18 = v15;
  id v26 = v18;
  v19 = [v13 remoteObjectProxyWithErrorHandler:v25];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __79__AFClientLiteInternal__handleCommand_afterCurrentRequest_isOneWay_completion___block_invoke_8;
  v22[3] = &unk_1E59288F0;
  id v20 = v18;
  id v24 = v20;
  id v21 = v13;
  id v23 = v21;
  [v19 handleRemoteCommand:v10 afterCurrentRequest:v8 isOneWay:v7 completion:v22];

  objc_destroyWeak(&v29);
  objc_destroyWeak((id *)buf);
}

void __79__AFClientLiteInternal__handleCommand_afterCurrentRequest_isOneWay_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  BOOL v7 = *(NSObject **)(v6 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__AFClientLiteInternal__handleCommand_afterCurrentRequest_isOneWay_completion___block_invoke_2;
  block[3] = &unk_1E59277D0;
  char v14 = a2;
  id v10 = v5;
  uint64_t v11 = v6;
  id v12 = *(id *)(a1 + 40);
  id v8 = v5;
  objc_copyWeak(&v13, (id *)(a1 + 48));
  dispatch_async(v7, block);
  objc_destroyWeak(&v13);
}

void __79__AFClientLiteInternal__handleCommand_afterCurrentRequest_isOneWay_completion___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    uint64_t v6 = "-[AFClientLiteInternal _handleCommand:afterCurrentRequest:isOneWay:completion:]_block_invoke";
    __int16 v7 = 2114;
    id v8 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %{public}@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __79__AFClientLiteInternal__handleCommand_afterCurrentRequest_isOneWay_completion___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __79__AFClientLiteInternal__handleCommand_afterCurrentRequest_isOneWay_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(a1 + 64);
  if (*(unsigned char *)(a1 + 64) && !*(void *)(a1 + 32))
  {
    id v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v12 = 136315394;
      id v13 = "-[AFClientLiteInternal _handleCommand:afterCurrentRequest:isOneWay:completion:]_block_invoke_2";
      __int16 v14 = 2048;
      uint64_t v15 = v9;
      _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s %p Finished", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    id v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      int v12 = 136315906;
      id v13 = "-[AFClientLiteInternal _handleCommand:afterCurrentRequest:isOneWay:completion:]_block_invoke";
      __int16 v14 = 2048;
      uint64_t v15 = v10;
      __int16 v16 = 1024;
      int v17 = v2;
      __int16 v18 = 2112;
      uint64_t v19 = v11;
      _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s %p Failed %d %@", (uint8_t *)&v12, 0x26u);
    }
  }
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = 0;

  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t, void, void))(v6 + 16))(v6, *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 32));
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained invalidate];
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v6 = "-[AFClientLiteInternal dealloc]";
    __int16 v7 = 2048;
    id v8 = self;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  v4.receiver = self;
  v4.super_class = (Class)AFClientLiteInternal;
  [(AFClientLiteInternal *)&v4 dealloc];
}

- (id)initAndHandleCommand:(id)a3 afterCurrentRequest:(BOOL)a4 isOneWay:(BOOL)a5 commandHandler:(id)a6 completion:(id)a7
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)AFClientLiteInternal;
  uint64_t v15 = [(AFClientLiteInternal *)&v23 init];
  if (v15)
  {
    __int16 v16 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[AFClientLiteInternal initAndHandleCommand:afterCurrentRequest:isOneWay:commandHandler:completion:]";
      __int16 v26 = 2048;
      v27 = v15;
      _os_log_impl(&dword_19CF1D000, v16, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
    }
    int v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create(0, v17);

    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v18;

    uint64_t v20 = MEMORY[0x19F3A50D0](v13);
    id commandHandler = v15->_commandHandler;
    v15->_id commandHandler = (id)v20;

    [(AFClientLiteInternal *)v15 _handleCommand:v12 afterCurrentRequest:v10 isOneWay:v9 completion:v14];
  }

  return v15;
}

@end