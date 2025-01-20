@interface AFDeviceContextConnection
- (AFDeviceContextConnection)initWithQueue:(id)a3 instanceContext:(id)a4 delegate:(id)a5;
- (NSString)description;
- (id)_remoteServiceWithErrorHandler:(id)a3;
- (id)_xpcConnection;
- (void)_beginUpdateLocalDeviceContext;
- (void)_clearXPCConnection;
- (void)_endUpdateLocalDeviceContext;
- (void)_fetchLocalDeviceContextWithCompletion:(id)a3;
- (void)_handleXPCConnectionInterruption;
- (void)_handleXPCConnectionInvalidation;
- (void)_invalidate;
- (void)_updateLocalDeviceContext:(id)a3;
- (void)beginUpdateLocalDeviceContext;
- (void)dealloc;
- (void)donateSerializedContextMapByPrivacyClass:(id)a3 withMetadataMap:(id)a4 forType:(id)a5 pushToRemote:(BOOL)a6 completion:(id)a7;
- (void)endUpdateLocalDeviceContext;
- (void)getLocalDeviceContextWithCompletion:(id)a3;
- (void)invalidate;
@end

@implementation AFDeviceContextConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDeviceContext, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serviceDelegateProxy, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_updateLocalDeviceContext:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = self->_localDeviceContext;
  v6 = (AFDeviceContext *)v4;
  v7 = v6;
  if (v5 == v6)
  {
  }
  else
  {
    if (v6 && v5)
    {
      BOOL v8 = [(AFDeviceContext *)v5 isEqual:v6];

      if (v8) {
        goto LABEL_13;
      }
    }
    else
    {
    }
    v9 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      localDeviceContext = self->_localDeviceContext;
      v11 = v9;
      v12 = [(AFDeviceContext *)localDeviceContext identifier];
      v13 = [(AFDeviceContext *)v7 identifier];
      int v20 = 136315906;
      v21 = "-[AFDeviceContextConnection _updateLocalDeviceContext:]";
      __int16 v22 = 2048;
      v23 = self;
      __int16 v24 = 2112;
      v25 = v12;
      __int16 v26 = 2112;
      v27 = v13;
      _os_log_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_INFO, "%s %p localDeviceContext (old) = %@ (new) = %@", (uint8_t *)&v20, 0x2Au);
    }
    v14 = (AFDeviceContext *)[(AFDeviceContext *)v7 copy];
    v15 = self->_localDeviceContext;
    self->_localDeviceContext = v14;

    if (self->_isUpdatingLocalDeviceContext)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v17 = objc_opt_respondsToSelector();

      if (v17)
      {
        id v18 = objc_loadWeakRetained((id *)&self->_delegate);
        v19 = (void *)[(AFDeviceContext *)self->_localDeviceContext copy];
        [v18 deviceContextConnection:self didUpdateLocalDeviceContext:v19];
      }
    }
  }
LABEL_13:
}

- (void)_endUpdateLocalDeviceContext
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_isInvalid)
  {
    v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[AFDeviceContextConnection _endUpdateLocalDeviceContext]";
      __int16 v11 = 2048;
      v12 = self;
      _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s %p Ignored because the connection is invalidated.", buf, 0x16u);
    }
  }
  else if (self->_isUpdatingLocalDeviceContext)
  {
    self->_isUpdatingLocalDeviceContext = 0;
    localDeviceContext = self->_localDeviceContext;
    self->_localDeviceContext = 0;

    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[AFDeviceContextConnection _endUpdateLocalDeviceContext]";
      __int16 v11 = 2048;
      v12 = self;
      _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__AFDeviceContextConnection__endUpdateLocalDeviceContext__block_invoke;
    v7[3] = &unk_1E592C5E8;
    objc_copyWeak(&v8, (id *)buf);
    v6 = [(AFDeviceContextConnection *)self _remoteServiceWithErrorHandler:v7];
    [v6 endUpdateLocalDeviceContext];

    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);
  }
}

void __57__AFDeviceContextConnection__endUpdateLocalDeviceContext__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v7 = 136315650;
    id v8 = "-[AFDeviceContextConnection _endUpdateLocalDeviceContext]_block_invoke";
    __int16 v9 = 2048;
    id v10 = WeakRetained;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_error_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_ERROR, "%s %p error = %@", (uint8_t *)&v7, 0x20u);
  }
}

- (void)_beginUpdateLocalDeviceContext
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_isInvalid)
  {
    id v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[AFDeviceContextConnection _beginUpdateLocalDeviceContext]";
      __int16 v16 = 2048;
      char v17 = self;
      _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s %p Ignored because the connection is invalidated.", buf, 0x16u);
    }
  }
  else if (!self->_isUpdatingLocalDeviceContext)
  {
    self->_isUpdatingLocalDeviceContext = 1;
    localDeviceContext = self->_localDeviceContext;
    self->_localDeviceContext = 0;

    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[AFDeviceContextConnection _beginUpdateLocalDeviceContext]";
      __int16 v16 = 2048;
      char v17 = self;
      _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __59__AFDeviceContextConnection__beginUpdateLocalDeviceContext__block_invoke;
    v12[3] = &unk_1E592C5E8;
    objc_copyWeak(&v13, (id *)buf);
    v6 = [(AFDeviceContextConnection *)self _remoteServiceWithErrorHandler:v12];
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    __int16 v9 = __59__AFDeviceContextConnection__beginUpdateLocalDeviceContext__block_invoke_13;
    id v10 = &unk_1E592B978;
    objc_copyWeak(&v11, (id *)buf);
    [v6 beginUpdateLocalDeviceContextWithReply:&v7];

    -[AFDeviceContextConnection _fetchLocalDeviceContextWithCompletion:](self, "_fetchLocalDeviceContextWithCompletion:", 0, v7, v8, v9, v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
}

void __59__AFDeviceContextConnection__beginUpdateLocalDeviceContext__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v8 = 136315650;
    __int16 v9 = "-[AFDeviceContextConnection _beginUpdateLocalDeviceContext]_block_invoke";
    __int16 v10 = 2048;
    id v11 = WeakRetained;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_error_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_ERROR, "%s %p error = %@", (uint8_t *)&v8, 0x20u);
  }
  id v5 = objc_loadWeakRetained((id *)(a1 + 32));
  [v5 _endUpdateLocalDeviceContext];
}

void __59__AFDeviceContextConnection__beginUpdateLocalDeviceContext__block_invoke_13(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    id v3 = v2;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v6 = 136315394;
    uint64_t v7 = "-[AFDeviceContextConnection _beginUpdateLocalDeviceContext]_block_invoke";
    __int16 v8 = 2048;
    id v9 = WeakRetained;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s %p reply", (uint8_t *)&v6, 0x16u);
  }
  id v5 = objc_loadWeakRetained((id *)(a1 + 32));
  [v5 _endUpdateLocalDeviceContext];
}

- (void)_fetchLocalDeviceContextWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = AFSiriLogContextConnection;
  if (self->_isInvalid)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v13 = "-[AFDeviceContextConnection _fetchLocalDeviceContextWithCompletion:]";
      __int16 v14 = 2048;
      v15 = self;
      _os_log_error_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_ERROR, "%s %p Ignored because the connection is invalidated.", buf, 0x16u);
      if (!v4) {
        goto LABEL_8;
      }
      goto LABEL_4;
    }
    if (v4) {
LABEL_4:
    }
      v4[2](v4, 0);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v13 = "-[AFDeviceContextConnection _fetchLocalDeviceContextWithCompletion:]";
      __int16 v14 = 2048;
      v15 = self;
      _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __68__AFDeviceContextConnection__fetchLocalDeviceContextWithCompletion___block_invoke;
    v10[3] = &unk_1E592C5E8;
    objc_copyWeak(&v11, (id *)buf);
    int v6 = [(AFDeviceContextConnection *)self _remoteServiceWithErrorHandler:v10];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __68__AFDeviceContextConnection__fetchLocalDeviceContextWithCompletion___block_invoke_11;
    v7[3] = &unk_1E592B1D8;
    objc_copyWeak(&v9, (id *)buf);
    __int16 v8 = v4;
    [v6 getLocalDeviceContextWithReply:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
LABEL_8:
}

void __68__AFDeviceContextConnection__fetchLocalDeviceContextWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    id v5 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v7 = 136315650;
    __int16 v8 = "-[AFDeviceContextConnection _fetchLocalDeviceContextWithCompletion:]_block_invoke";
    __int16 v9 = 2048;
    id v10 = WeakRetained;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_error_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_ERROR, "%s %p error = %@", (uint8_t *)&v7, 0x20u);
  }
}

void __68__AFDeviceContextConnection__fetchLocalDeviceContextWithCompletion___block_invoke_11(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    id v5 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    int v7 = [v3 identifier];
    int v10 = 136315650;
    __int16 v11 = "-[AFDeviceContextConnection _fetchLocalDeviceContextWithCompletion:]_block_invoke";
    __int16 v12 = 2048;
    id v13 = WeakRetained;
    __int16 v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s %p localDeviceContext = %@", (uint8_t *)&v10, 0x20u);
  }
  id v8 = objc_loadWeakRetained((id *)(a1 + 40));
  [v8 _updateLocalDeviceContext:v3];

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v3);
  }
}

- (id)_remoteServiceWithErrorHandler:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_isInvalid)
  {
    int v6 = [(AFDeviceContextConnection *)self _xpcConnection];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __60__AFDeviceContextConnection__remoteServiceWithErrorHandler___block_invoke;
    v9[3] = &unk_1E592B9A0;
    id v10 = v4;
    int v7 = [v6 remoteObjectProxyWithErrorHandler:v9];

    goto LABEL_6;
  }
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v12 = "-[AFDeviceContextConnection _remoteServiceWithErrorHandler:]";
    __int16 v13 = 2048;
    __int16 v14 = self;
    _os_log_error_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_ERROR, "%s %p Ignored because the connection is invalidated.", buf, 0x16u);
    if (v4) {
      goto LABEL_4;
    }
  }
  else if (v4)
  {
LABEL_4:
    int v6 = +[AFError errorWithCode:23];
    (*((void (**)(id, void *))v4 + 2))(v4, v6);
    int v7 = 0;
LABEL_6:

    goto LABEL_9;
  }
  int v7 = 0;
LABEL_9:

  return v7;
}

uint64_t __60__AFDeviceContextConnection__remoteServiceWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_invalidate
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(AFDeviceContextConnection *)self _endUpdateLocalDeviceContext];
  if (!self->_isInvalid)
  {
    self->_isInvalid = 1;
    id v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v5 = 136315394;
      int v6 = "-[AFDeviceContextConnection _invalidate]";
      __int16 v7 = 2048;
      id v8 = self;
      _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v5, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained deviceContextConnectionDidInvalidate:self];

    objc_storeWeak((id *)&self->_delegate, 0);
  }
  [(AFDeviceContextConnection *)self _clearXPCConnection];
}

- (void)_clearXPCConnection
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    id v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315650;
      __int16 v7 = "-[AFDeviceContextConnection _clearXPCConnection]";
      __int16 v8 = 2048;
      uint64_t v9 = self;
      __int16 v10 = 2112;
      __int16 v11 = xpcConnection;
      _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s %p xpcConnection = %@", (uint8_t *)&v6, 0x20u);
      xpcConnection = self->_xpcConnection;
    }
    [(NSXPCConnection *)xpcConnection invalidate];
    int v5 = self->_xpcConnection;
    self->_xpcConnection = 0;
  }
}

- (void)_handleXPCConnectionInterruption
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    xpcConnection = self->_xpcConnection;
    int v5 = 136315650;
    int v6 = "-[AFDeviceContextConnection _handleXPCConnectionInterruption]";
    __int16 v7 = 2048;
    __int16 v8 = self;
    __int16 v9 = 2112;
    __int16 v10 = xpcConnection;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s %p xpcConnection = %@", (uint8_t *)&v5, 0x20u);
  }
  [(AFDeviceContextConnection *)self _invalidate];
}

- (void)_handleXPCConnectionInvalidation
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    xpcConnection = self->_xpcConnection;
    int v5 = 136315650;
    int v6 = "-[AFDeviceContextConnection _handleXPCConnectionInvalidation]";
    __int16 v7 = 2048;
    __int16 v8 = self;
    __int16 v9 = 2112;
    __int16 v10 = xpcConnection;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s %p xpcConnection = %@", (uint8_t *)&v5, 0x20u);
  }
  [(AFDeviceContextConnection *)self _invalidate];
}

- (id)_xpcConnection
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_isInvalid)
  {
    id v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[AFDeviceContextConnection _xpcConnection]";
      __int16 v26 = 2048;
      v27 = self;
      _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s %p Ignored because the connection is invalidated.", buf, 0x16u);
    }
    id v4 = 0;
  }
  else
  {
    xpcConnection = self->_xpcConnection;
    if (!xpcConnection)
    {
      int v6 = [(AFInstanceContext *)self->_instanceContext createXPCConnectionWithMachServiceName:@"com.apple.assistant.device-context" options:0];
      __int16 v7 = self->_xpcConnection;
      self->_xpcConnection = v6;

      [(NSXPCConnection *)self->_xpcConnection _setQueue:self->_queue];
      __int16 v8 = self->_xpcConnection;
      __int16 v9 = AFDeviceContextServiceGetXPCInterface();
      [(NSXPCConnection *)v8 setRemoteObjectInterface:v9];

      __int16 v10 = self->_xpcConnection;
      id v11 = (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEECBE58];
      [(NSXPCConnection *)v10 setExportedInterface:v11];

      uint64_t v12 = self->_xpcConnection;
      __int16 v13 = [[_AFDeviceContextServiceDelegateProxy alloc] initWithConnection:self];
      [(NSXPCConnection *)v12 setExportedObject:v13];

      objc_initWeak(&location, self);
      __int16 v14 = self->_xpcConnection;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __43__AFDeviceContextConnection__xpcConnection__block_invoke;
      v21[3] = &unk_1E592B978;
      objc_copyWeak(&v22, &location);
      [(NSXPCConnection *)v14 setInvalidationHandler:v21];
      uint64_t v15 = self->_xpcConnection;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __43__AFDeviceContextConnection__xpcConnection__block_invoke_2;
      v19[3] = &unk_1E592B978;
      objc_copyWeak(&v20, &location);
      [(NSXPCConnection *)v15 setInterruptionHandler:v19];
      [(NSXPCConnection *)self->_xpcConnection resume];
      uint64_t v16 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        char v17 = self->_xpcConnection;
        *(_DWORD *)buf = 136315650;
        v25 = "-[AFDeviceContextConnection _xpcConnection]";
        __int16 v26 = 2048;
        v27 = self;
        __int16 v28 = 2112;
        v29 = v17;
        _os_log_impl(&dword_19CF1D000, v16, OS_LOG_TYPE_INFO, "%s %p xpcConnection = %@", buf, 0x20u);
      }
      objc_destroyWeak(&v20);
      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
      xpcConnection = self->_xpcConnection;
    }
    id v4 = xpcConnection;
  }
  return v4;
}

void __43__AFDeviceContextConnection__xpcConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleXPCConnectionInvalidation];
}

void __43__AFDeviceContextConnection__xpcConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleXPCConnectionInterruption];
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__AFDeviceContextConnection_invalidate__block_invoke;
  block[3] = &unk_1E592C678;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __39__AFDeviceContextConnection_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)donateSerializedContextMapByPrivacyClass:(id)a3 withMetadataMap:(id)a4 forType:(id)a5 pushToRemote:(BOOL)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  queue = self->_queue;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __118__AFDeviceContextConnection_donateSerializedContextMapByPrivacyClass_withMetadataMap_forType_pushToRemote_completion___block_invoke;
  v21[3] = &unk_1E592C400;
  void v21[4] = self;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  BOOL v26 = a6;
  id v25 = v15;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(queue, v21);
}

void __118__AFDeviceContextConnection_donateSerializedContextMapByPrivacyClass_withMetadataMap_forType_pushToRemote_completion___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 48))
  {
    v2 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v6 = "-[AFDeviceContextConnection donateSerializedContextMapByPrivacyClass:withMetadataMap:forType:pushToRemote:com"
           "pletion:]_block_invoke";
      __int16 v7 = 2048;
      uint64_t v8 = v1;
      _os_log_error_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_ERROR, "%s %p Ignored because the connection is invalidated.", buf, 0x16u);
    }
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) _remoteServiceWithErrorHandler:&__block_literal_global_41401];
    [v4 donateSerializedContextMapByPrivacyClass:*(void *)(a1 + 40) withMetadataMap:*(void *)(a1 + 48) forType:*(void *)(a1 + 56) pushToRemote:*(unsigned __int8 *)(a1 + 72) completion:*(void *)(a1 + 64)];
  }
}

void __118__AFDeviceContextConnection_donateSerializedContextMapByPrivacyClass_withMetadataMap_forType_pushToRemote_completion___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    int v5 = "-[AFDeviceContextConnection donateSerializedContextMapByPrivacyClass:withMetadataMap:forType:pushToRemote:compl"
         "etion:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)endUpdateLocalDeviceContext
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__AFDeviceContextConnection_endUpdateLocalDeviceContext__block_invoke;
  block[3] = &unk_1E592C678;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __56__AFDeviceContextConnection_endUpdateLocalDeviceContext__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endUpdateLocalDeviceContext];
}

- (void)beginUpdateLocalDeviceContext
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__AFDeviceContextConnection_beginUpdateLocalDeviceContext__block_invoke;
  block[3] = &unk_1E592C678;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __58__AFDeviceContextConnection_beginUpdateLocalDeviceContext__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginUpdateLocalDeviceContext];
}

- (void)getLocalDeviceContextWithCompletion:(id)a3
{
  if (!a3)
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    queue = self->_queue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __65__AFDeviceContextConnection_getLocalDeviceContextWithCompletion___block_invoke;
    v6[3] = &unk_1E592C6E8;
    v6[4] = self;
    id v7 = 0;
    dispatch_async(queue, v6);
  }
}

void __65__AFDeviceContextConnection_getLocalDeviceContextWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 49) && *(void *)(v1 + 56))
  {
    uint64_t v2 = *(void *)(a1 + 40);
    id v5 = (id)[*(id *)(v1 + 56) copy];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v5);
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void **)(a1 + 32);
    [v4 _fetchLocalDeviceContextWithCompletion:v3];
  }
}

- (AFDeviceContextConnection)initWithQueue:(id)a3 instanceContext:(id)a4 delegate:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)AFDeviceContextConnection;
  id v11 = [(AFDeviceContextConnection *)&v21 init];
  if (v11)
  {
    if (v8)
    {
      id v12 = (OS_dispatch_queue *)v8;
      queue = v11->_queue;
      v11->_queue = v12;
    }
    else
    {
      id v14 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
      id v15 = MEMORY[0x1E4F14428];
      queue = v11->_queue;
      v11->_queue = v14;
    }

    if (v9)
    {
      uint64_t v16 = (AFInstanceContext *)v9;
    }
    else
    {
      uint64_t v16 = +[AFInstanceContext defaultContext];
    }
    instanceContext = v11->_instanceContext;
    v11->_instanceContext = v16;

    objc_storeWeak((id *)&v11->_delegate, v10);
    id v18 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      id v19 = v11->_instanceContext;
      *(_DWORD *)buf = 136315650;
      id v23 = "-[AFDeviceContextConnection initWithQueue:instanceContext:delegate:]";
      __int16 v24 = 2048;
      id v25 = v11;
      __int16 v26 = 2112;
      v27 = v19;
      _os_log_impl(&dword_19CF1D000, v18, OS_LOG_TYPE_INFO, "%s %p instanceContext = %@", buf, 0x20u);
    }
  }

  return v11;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    instanceContext = self->_instanceContext;
    *(_DWORD *)buf = 136315650;
    id v7 = "-[AFDeviceContextConnection dealloc]";
    __int16 v8 = 2048;
    id v9 = self;
    __int16 v10 = 2112;
    id v11 = instanceContext;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s %p instanceContext = %@", buf, 0x20u);
  }
  v5.receiver = self;
  v5.super_class = (Class)AFDeviceContextConnection;
  [(AFDeviceContextConnection *)&v5 dealloc];
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v7.receiver = self;
  v7.super_class = (Class)AFDeviceContextConnection;
  uint64_t v4 = [(AFDeviceContextConnection *)&v7 description];
  objc_super v5 = (void *)[v3 initWithFormat:@"%@ {instanceContext = %@}", v4, self->_instanceContext];

  return (NSString *)v5;
}

@end