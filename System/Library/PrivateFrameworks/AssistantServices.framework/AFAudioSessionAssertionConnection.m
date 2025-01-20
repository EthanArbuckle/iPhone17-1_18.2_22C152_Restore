@interface AFAudioSessionAssertionConnection
- (AFAssertionContext)context;
- (AFAudioSessionAssertionConnection)initWithInstanceContext:(id)a3 acquisitionContext:(id)a4 relinquishmentHandler:(id)a5;
- (NSString)description;
- (NSUUID)uuid;
- (id)_xpcConnection;
- (void)_acquireWithContext:(id)a3;
- (void)_clearXPCConnection;
- (void)_finalizeWithContext:(id)a3 error:(id)a4;
- (void)_relinquishWithContext:(id)a3 error:(id)a4 options:(unint64_t)a5;
- (void)dealloc;
- (void)handleXPCConnectionInterrupted;
- (void)handleXPCConnectionInvalidated;
- (void)invalidate;
- (void)relinquishWithContext:(id)a3 options:(unint64_t)a4;
- (void)relinquishWithError:(id)a3 options:(unint64_t)a4;
@end

@implementation AFAudioSessionAssertionConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_relinquishmentHandler, 0);
  objc_storeStrong((id *)&self->_acquisitionContext, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (AFAssertionContext)context
{
  return self->_acquisitionContext;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)_clearXPCConnection
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 136315394;
      v7 = "-[AFAudioSessionAssertionConnection _clearXPCConnection]";
      __int16 v8 = 2048;
      v9 = xpcConnection;
      _os_log_debug_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_DEBUG, "%s Destroy XPC connection %p.", (uint8_t *)&v6, 0x16u);
      xpcConnection = self->_xpcConnection;
    }
    [(NSXPCConnection *)xpcConnection setExportedObject:0];
    [(NSXPCConnection *)self->_xpcConnection invalidate];
    v5 = self->_xpcConnection;
    self->_xpcConnection = 0;
  }
}

- (id)_xpcConnection
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    v4 = [(AFInstanceContext *)self->_instanceContext createXPCConnectionWithMachServiceName:@"com.apple.assistant.audio-session-assertion" options:0];
    v5 = self->_xpcConnection;
    self->_xpcConnection = v4;

    [(NSXPCConnection *)self->_xpcConnection _setQueue:self->_queue];
    objc_initWeak(&location, self);
    int v6 = self->_xpcConnection;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __51__AFAudioSessionAssertionConnection__xpcConnection__block_invoke;
    v15[3] = &unk_1E592B978;
    objc_copyWeak(&v16, &location);
    [(NSXPCConnection *)v6 setInvalidationHandler:v15];
    v7 = self->_xpcConnection;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __51__AFAudioSessionAssertionConnection__xpcConnection__block_invoke_2;
    v13[3] = &unk_1E592B978;
    objc_copyWeak(&v14, &location);
    [(NSXPCConnection *)v7 setInterruptionHandler:v13];
    __int16 v8 = self->_xpcConnection;
    id v9 = (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEEE6E28];
    [(NSXPCConnection *)v8 setRemoteObjectInterface:v9];

    [(NSXPCConnection *)self->_xpcConnection resume];
    uint64_t v10 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      v12 = self->_xpcConnection;
      *(_DWORD *)buf = 136315394;
      v19 = "-[AFAudioSessionAssertionConnection _xpcConnection]";
      __int16 v20 = 2048;
      v21 = v12;
      _os_log_debug_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_DEBUG, "%s Create XPC connection %p.", buf, 0x16u);
    }
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    xpcConnection = self->_xpcConnection;
  }
  return xpcConnection;
}

void __51__AFAudioSessionAssertionConnection__xpcConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

void __51__AFAudioSessionAssertionConnection__xpcConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

- (void)handleXPCConnectionInvalidated
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    v5 = "-[AFAudioSessionAssertionConnection handleXPCConnectionInvalidated]";
    __int16 v6 = 2048;
    v7 = self;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s %p", (uint8_t *)&v4, 0x16u);
  }
  [(AFAudioSessionAssertionConnection *)self invalidate];
}

- (void)handleXPCConnectionInterrupted
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    v5 = "-[AFAudioSessionAssertionConnection handleXPCConnectionInterrupted]";
    __int16 v6 = 2048;
    v7 = self;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s %p", (uint8_t *)&v4, 0x16u);
  }
  [(AFAudioSessionAssertionConnection *)self invalidate];
}

- (void)_finalizeWithContext:(id)a3 error:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(AFTwoArgumentSafetyBlock *)self->_relinquishmentHandler invokeWithValue:v6 andValue:v7])
  {
    uint64_t v8 = AFSiriLogContextConnection;
    if (v7)
    {
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        int v9 = 136315650;
        uint64_t v10 = "-[AFAudioSessionAssertionConnection _finalizeWithContext:error:]";
        __int16 v11 = 2048;
        v12 = self;
        __int16 v13 = 2112;
        id v14 = v7;
        _os_log_error_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_ERROR, "%s %p error = %@", (uint8_t *)&v9, 0x20u);
      }
    }
    else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315650;
      uint64_t v10 = "-[AFAudioSessionAssertionConnection _finalizeWithContext:error:]";
      __int16 v11 = 2048;
      v12 = self;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s %p context = %@", (uint8_t *)&v9, 0x20u);
    }
  }
  [(AFAudioSessionAssertionConnection *)self _clearXPCConnection];
}

- (void)_relinquishWithContext:(id)a3 error:(id)a4 options:(unint64_t)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v18 = "-[AFAudioSessionAssertionConnection _relinquishWithContext:error:options:]";
    __int16 v19 = 2048;
    __int16 v20 = self;
    __int16 v21 = 2112;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_INFO, "%s %p context = %@, error = %@", buf, 0x2Au);
  }
  objc_initWeak((id *)buf, self);
  __int16 v11 = [(AFAudioSessionAssertionConnection *)self _xpcConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__AFAudioSessionAssertionConnection__relinquishWithContext_error_options___block_invoke;
  v15[3] = &unk_1E592C5E8;
  objc_copyWeak(&v16, (id *)buf);
  v12 = [v11 remoteObjectProxyWithErrorHandler:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__AFAudioSessionAssertionConnection__relinquishWithContext_error_options___block_invoke_18;
  v13[3] = &unk_1E592B978;
  objc_copyWeak(&v14, (id *)buf);
  [v12 relinquishAudioSessionWithContext:v8 error:v9 options:a5 completion:v13];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

void __74__AFAudioSessionAssertionConnection__relinquishWithContext_error_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v7 = 136315650;
    id v8 = "-[AFAudioSessionAssertionConnection _relinquishWithContext:error:options:]_block_invoke";
    __int16 v9 = 2048;
    id v10 = WeakRetained;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_error_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_ERROR, "%s %p error = %@", (uint8_t *)&v7, 0x20u);
  }
}

void __74__AFAudioSessionAssertionConnection__relinquishWithContext_error_options___block_invoke_18(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    id v3 = v2;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v5 = 136315394;
    id v6 = "-[AFAudioSessionAssertionConnection _relinquishWithContext:error:options:]_block_invoke";
    __int16 v7 = 2048;
    id v8 = WeakRetained;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s %p done", (uint8_t *)&v5, 0x16u);
  }
}

- (void)_acquireWithContext:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "-[AFAudioSessionAssertionConnection _acquireWithContext:]";
    __int16 v19 = 2048;
    __int16 v20 = self;
    __int16 v21 = 2112;
    id v22 = v4;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s %p context = %@", buf, 0x20u);
  }
  id v6 = self->_queue;
  objc_initWeak((id *)buf, self);
  __int16 v7 = [(AFAudioSessionAssertionConnection *)self _xpcConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__AFAudioSessionAssertionConnection__acquireWithContext___block_invoke;
  v14[3] = &unk_1E592C5C0;
  id v8 = v6;
  uint64_t v15 = v8;
  objc_copyWeak(&v16, (id *)buf);
  uint64_t v9 = [v7 remoteObjectProxyWithErrorHandler:v14];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__AFAudioSessionAssertionConnection__acquireWithContext___block_invoke_3;
  v11[3] = &unk_1E5925720;
  id v10 = v8;
  id v12 = v10;
  objc_copyWeak(&v13, (id *)buf);
  [v9 acquireAudioSessionWithContext:v4 relinquishmentHandler:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v16);

  objc_destroyWeak((id *)buf);
}

void __57__AFAudioSessionAssertionConnection__acquireWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__AFAudioSessionAssertionConnection__acquireWithContext___block_invoke_2;
  v6[3] = &unk_1E5929FC0;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v8);
}

void __57__AFAudioSessionAssertionConnection__acquireWithContext___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__AFAudioSessionAssertionConnection__acquireWithContext___block_invoke_4;
  block[3] = &unk_1E592A3E0;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, block);

  objc_destroyWeak(&v13);
}

void __57__AFAudioSessionAssertionConnection__acquireWithContext___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _finalizeWithContext:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
}

void __57__AFAudioSessionAssertionConnection__acquireWithContext___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _finalizeWithContext:0 error:*(void *)(a1 + 32)];
}

- (void)relinquishWithError:(id)a3 options:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    id v10 = v7;
    id v11 = AFAssertionRelinquishmentOptionsGetNames(a4);
    *(_DWORD *)buf = 136315906;
    id v16 = "-[AFAudioSessionAssertionConnection relinquishWithError:options:]";
    __int16 v17 = 2048;
    v18 = self;
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v11;
    _os_log_error_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_ERROR, "%s %p error = %@, options = %@", buf, 0x2Au);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__AFAudioSessionAssertionConnection_relinquishWithError_options___block_invoke;
  block[3] = &unk_1E592B3C0;
  void block[4] = self;
  id v13 = v6;
  unint64_t v14 = a4;
  id v9 = v6;
  dispatch_async(queue, block);
}

uint64_t __65__AFAudioSessionAssertionConnection_relinquishWithError_options___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _relinquishWithContext:0 error:*(void *)(a1 + 40) options:*(void *)(a1 + 48)];
}

- (void)relinquishWithContext:(id)a3 options:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    id v8 = v7;
    id v9 = AFAssertionRelinquishmentOptionsGetNames(a4);
    *(_DWORD *)buf = 136315906;
    id v16 = "-[AFAudioSessionAssertionConnection relinquishWithContext:options:]";
    __int16 v17 = 2048;
    v18 = self;
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s %p context = %@, options = %@", buf, 0x2Au);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__AFAudioSessionAssertionConnection_relinquishWithContext_options___block_invoke;
  block[3] = &unk_1E592B3C0;
  void block[4] = self;
  id v13 = v6;
  unint64_t v14 = a4;
  id v11 = v6;
  dispatch_async(queue, block);
}

uint64_t __67__AFAudioSessionAssertionConnection_relinquishWithContext_options___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _relinquishWithContext:*(void *)(a1 + 40) error:0 options:*(void *)(a1 + 48)];
}

- (void)invalidate
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v7 = "-[AFAudioSessionAssertionConnection invalidate]";
    __int16 v8 = 2048;
    id v9 = self;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__AFAudioSessionAssertionConnection_invalidate__block_invoke;
  block[3] = &unk_1E592C678;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __47__AFAudioSessionAssertionConnection_invalidate__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v3 = (id)[[NSString alloc] initWithFormat:@"%@ is invalidated without relinquishment and finalization.", v1];
  v2 = +[AFError errorWithCode:42 description:v3];
  [v1 _finalizeWithContext:0 error:v2];
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v8 = "-[AFAudioSessionAssertionConnection dealloc]";
    __int16 v9 = 2048;
    uint64_t v10 = self;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  id v4 = (void *)[[NSString alloc] initWithFormat:@"%@ is deallocated without relinquishment and finalization.", self];
  id v5 = +[AFError errorWithCode:41 description:v4];
  [(AFAudioSessionAssertionConnection *)self _finalizeWithContext:0 error:v5];

  v6.receiver = self;
  v6.super_class = (Class)AFAudioSessionAssertionConnection;
  [(AFAudioSessionAssertionConnection *)&v6 dealloc];
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v7.receiver = self;
  v7.super_class = (Class)AFAudioSessionAssertionConnection;
  id v4 = [(AFAudioSessionAssertionConnection *)&v7 description];
  id v5 = (void *)[v3 initWithFormat:@"%@ {uuid = %@, instanceContext = %@, acquisitionContext = %@}", v4, self->_uuid, self->_instanceContext, self->_acquisitionContext];

  return (NSString *)v5;
}

- (AFAudioSessionAssertionConnection)initWithInstanceContext:(id)a3 acquisitionContext:(id)a4 relinquishmentHandler:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v33.receiver = self;
  v33.super_class = (Class)AFAudioSessionAssertionConnection;
  uint64_t v11 = [(AFAudioSessionAssertionConnection *)&v33 init];
  if (v11)
  {
    id v12 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315906;
      v35 = "-[AFAudioSessionAssertionConnection initWithInstanceContext:acquisitionContext:relinquishmentHandler:]";
      __int16 v36 = 2048;
      v37 = v11;
      __int16 v38 = 2112;
      id v39 = v8;
      __int16 v40 = 2112;
      id v41 = v9;
      _os_log_impl(&dword_19CF1D000, v12, OS_LOG_TYPE_INFO, "%s %p instanceContext = %@, acquisitionContext = %@", buf, 0x2Au);
    }
    id v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    unint64_t v14 = dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_USER_INITIATED, 0);
    uint64_t v15 = AFAudioSessionAssertionGetConnectionWorkloop();
    dispatch_queue_t v16 = dispatch_queue_create_with_target_V2("com.apple.assistant.audio-session-assertion.client-connection", v14, v15);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v16;

    if (v8)
    {
      v18 = (AFInstanceContext *)v8;
    }
    else
    {
      v18 = +[AFInstanceContext currentContext];
    }
    instanceContext = v11->_instanceContext;
    v11->_instanceContext = v18;

    uint64_t v20 = [v9 copy];
    acquisitionContext = v11->_acquisitionContext;
    v11->_acquisitionContext = (AFAssertionContext *)v20;

    id v22 = [AFTwoArgumentSafetyBlock alloc];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __102__AFAudioSessionAssertionConnection_initWithInstanceContext_acquisitionContext_relinquishmentHandler___block_invoke;
    v31[3] = &unk_1E59256F8;
    id v32 = v10;
    uint64_t v23 = +[AFError errorWithCode:40];
    uint64_t v24 = [(AFTwoArgumentSafetyBlock *)v22 initWithBlock:v31 defaultValue1:0 defaultValue2:v23];
    relinquishmentHandler = v11->_relinquishmentHandler;
    v11->_relinquishmentHandler = (AFTwoArgumentSafetyBlock *)v24;

    v26 = v11->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __102__AFAudioSessionAssertionConnection_initWithInstanceContext_acquisitionContext_relinquishmentHandler___block_invoke_2;
    block[3] = &unk_1E592C710;
    v29 = v11;
    id v30 = v9;
    dispatch_async(v26, block);
  }
  return v11;
}

uint64_t __102__AFAudioSessionAssertionConnection_initWithInstanceContext_acquisitionContext_relinquishmentHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __102__AFAudioSessionAssertionConnection_initWithInstanceContext_acquisitionContext_relinquishmentHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _acquireWithContext:*(void *)(a1 + 40)];
}

@end