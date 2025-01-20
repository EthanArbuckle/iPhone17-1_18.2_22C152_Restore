@interface CXAbstractProviderSource
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)isConnected;
- (BOOL)isPermittedToUseBluetoothAccessories;
- (BOOL)isPermittedToUsePrivateAPI;
- (BOOL)isPermittedToUsePublicAPI;
- (CXAbstractProviderSource)initWithIdentifier:(id)a3;
- (CXAbstractProviderSourceDelegate)delegate;
- (CXAbstractProviderSourceDelegateInternal)internalDelegate;
- (CXAbstractProviderVendorProtocol)vendorProtocolDelegate;
- (NSString)bundleIdentifier;
- (NSString)description;
- (NSString)identifier;
- (NSString)localizedName;
- (NSURL)bundleURL;
- (OS_dispatch_queue)queue;
- (int)processIdentifier;
- (void)actionCompleted:(id)a3 completionHandler:(id)a4;
- (void)beginWithCompletionHandler:(id)a3;
- (void)commitTransaction:(id)a3;
- (void)handleActionTimeout:(id)a3;
- (void)requestTransaction:(id)a3 completionHandler:(id)a4;
- (void)setConnected:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setInternalDelegate:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CXAbstractProviderSource

- (CXAbstractProviderSource)initWithIdentifier:(id)a3
{
  id v5 = a3;
  if ([v5 length])
  {
    v13.receiver = self;
    v13.super_class = (Class)CXAbstractProviderSource;
    v6 = [(CXAbstractProviderSource *)&v13 init];
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_identifier, a3);
      v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v9 = dispatch_queue_create("com.apple.callkit.providersource", v8);
      queue = v7->_queue;
      v7->_queue = (OS_dispatch_queue *)v9;
    }
    self = v7;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  *(void *)&long long v3 = -1;
  *((void *)&v3 + 1) = -1;
  *(_OWORD *)retstr->var0 = v3;
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (NSString)bundleIdentifier
{
  return 0;
}

- (NSURL)bundleURL
{
  return 0;
}

- (CXAbstractProviderSourceDelegateInternal)internalDelegate
{
  long long v3 = [(CXAbstractProviderSource *)self delegate];
  if ([v3 conformsToProtocol:&unk_1EFC4A0F8])
  {
    v4 = [(CXAbstractProviderSource *)self delegate];
  }
  else
  {
    v4 = 0;
  }

  return (CXAbstractProviderSourceDelegateInternal *)v4;
}

- (NSString)localizedName
{
  return 0;
}

- (int)processIdentifier
{
  return -1;
}

- (BOOL)isPermittedToUsePublicAPI
{
  return 0;
}

- (BOOL)isPermittedToUsePrivateAPI
{
  return 0;
}

- (BOOL)isPermittedToUseBluetoothAccessories
{
  return 0;
}

- (CXAbstractProviderVendorProtocol)vendorProtocolDelegate
{
  return 0;
}

- (void)setConnected:(BOOL)a3
{
  if (self->_connected != a3)
  {
    BOOL v3 = a3;
    self->_connected = a3;
    id v5 = [(CXAbstractProviderSource *)self internalDelegate];
    id v6 = v5;
    if (v3) {
      [v5 providerSourceConnectionStarted:self];
    }
    else {
      [v5 providerSourceConnectionEnded:self];
    }
  }
}

- (void)beginWithCompletionHandler:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
}

- (void)actionCompleted:(id)a3 completionHandler:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  v8 = CXDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v39 = "-[CXAbstractProviderSource actionCompleted:completionHandler:]";
    __int16 v40 = 2112;
    id v41 = v6;
    _os_log_impl(&dword_1A6E3A000, v8, OS_LOG_TYPE_DEFAULT, "Received %s with action: %@", buf, 0x16u);
  }

  if (v7)
  {
    if (v6)
    {
      if ([(CXAbstractProviderSource *)self isPermittedToUsePublicAPI])
      {
        if (![(CXAbstractProviderSource *)self isPermittedToUsePrivateAPI])
        {
          uint64_t v9 = [v6 sanitizedCopy];

          id v6 = (id)v9;
        }
        v10 = [(CXAbstractProviderSource *)self internalDelegate];
        [v10 providerSource:self actionCompleted:v6];

        v7[2](v7, 0);
      }
      else
      {
        v27 = CXDefaultLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          -[CXAbstractProviderSource actionCompleted:completionHandler:]((uint64_t)self, v27, v28, v29, v30, v31, v32, v33);
        }

        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __62__CXAbstractProviderSource_actionCompleted_completionHandler___block_invoke_60;
        v34[3] = &unk_1E5CAE408;
        v35 = v7;
        __62__CXAbstractProviderSource_actionCompleted_completionHandler___block_invoke_60((uint64_t)v34);
      }
    }
    else
    {
      v19 = CXDefaultLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[CXCallSource actionCompleted:completionHandler:](v19, v20, v21, v22, v23, v24, v25, v26);
      }

      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __62__CXAbstractProviderSource_actionCompleted_completionHandler___block_invoke_59;
      v36[3] = &unk_1E5CAE408;
      v37 = v7;
      __62__CXAbstractProviderSource_actionCompleted_completionHandler___block_invoke_59((uint64_t)v36);
      id v6 = v37;
    }
  }
  else
  {
    v11 = CXDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CXCallSource requestTransaction:completionHandler:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
}

void __62__CXAbstractProviderSource_actionCompleted_completionHandler___block_invoke_59(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __62__CXAbstractProviderSource_actionCompleted_completionHandler___block_invoke_60(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)requestTransaction:(id)a3 completionHandler:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = CXDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "-[CXAbstractProviderSource requestTransaction:completionHandler:]";
    __int16 v38 = 2112;
    id v39 = v6;
    _os_log_impl(&dword_1A6E3A000, v8, OS_LOG_TYPE_DEFAULT, "Received %s with transaction: %@", buf, 0x16u);
  }

  if (v7)
  {
    if (v6)
    {
      if ([(CXAbstractProviderSource *)self isPermittedToUsePrivateAPI])
      {
        uint64_t v9 = [(CXAbstractProviderSource *)self delegate];
        [v9 providerSource:self requestedTransaction:v6 completionHandler:v7];
      }
      else
      {
        uint64_t v25 = CXDefaultLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          -[CXAbstractProviderSource requestTransaction:completionHandler:]((uint64_t)self, v25, v26, v27, v28, v29, v30, v31);
        }

        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __65__CXAbstractProviderSource_requestTransaction_completionHandler___block_invoke_67;
        v32[3] = &unk_1E5CAE408;
        uint64_t v33 = v7;
        __65__CXAbstractProviderSource_requestTransaction_completionHandler___block_invoke_67((uint64_t)v32);
        uint64_t v9 = v33;
      }
    }
    else
    {
      uint64_t v17 = CXDefaultLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[CXCallSource requestTransaction:completionHandler:](v17, v18, v19, v20, v21, v22, v23, v24);
      }

      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __65__CXAbstractProviderSource_requestTransaction_completionHandler___block_invoke_66;
      v34[3] = &unk_1E5CAE408;
      v35 = v7;
      __65__CXAbstractProviderSource_requestTransaction_completionHandler___block_invoke_66((uint64_t)v34);
      uint64_t v9 = v35;
    }
  }
  else
  {
    uint64_t v9 = CXDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CXCallSource requestTransaction:completionHandler:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

void __65__CXAbstractProviderSource_requestTransaction_completionHandler___block_invoke_66(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __65__CXAbstractProviderSource_requestTransaction_completionHandler___block_invoke_67(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_requestTransactionErrorWithCode:", 1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)commitTransaction:(id)a3
{
  id v4 = a3;
  id v5 = [(CXAbstractProviderSource *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__CXAbstractProviderSource_commitTransaction___block_invoke;
  v7[3] = &unk_1E5CADC68;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __46__CXAbstractProviderSource_commitTransaction___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 136315394;
    id v7 = "-[CXAbstractProviderSource commitTransaction:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Sending %s with transaction: %@", (uint8_t *)&v6, 0x16u);
  }

  id v4 = [*(id *)(a1 + 40) vendorProtocolDelegate];
  id v5 = (void *)[*(id *)(a1 + 32) copy];
  [v4 commitTransaction:v5];
}

- (void)handleActionTimeout:(id)a3
{
  id v4 = a3;
  id v5 = [(CXAbstractProviderSource *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__CXAbstractProviderSource_handleActionTimeout___block_invoke;
  v7[3] = &unk_1E5CADC68;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __48__CXAbstractProviderSource_handleActionTimeout___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 136315394;
    id v7 = "-[CXAbstractProviderSource handleActionTimeout:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Sending %s with action: %@", (uint8_t *)&v6, 0x16u);
  }

  id v4 = [*(id *)(a1 + 40) vendorProtocolDelegate];
  id v5 = (void *)[*(id *)(a1 + 32) copy];
  [v4 handleActionTimeout:v5];
}

- (NSString)description
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  id v4 = NSStringFromSelector(sel_identifier);
  id v5 = [(CXAbstractProviderSource *)self identifier];
  [v3 appendFormat:@" %@=%@", v4, v5];

  [v3 appendFormat:@", "];
  int v6 = NSStringFromSelector(sel_isConnected);
  [v3 appendFormat:@" %@=%d", v6, -[CXAbstractProviderSource isConnected](self, "isConnected")];

  [v3 appendFormat:@", "];
  id v7 = NSStringFromSelector(sel_processIdentifier);
  [v3 appendFormat:@" %@=%d", v7, -[CXAbstractProviderSource processIdentifier](self, "processIdentifier")];

  [v3 appendFormat:@", "];
  __int16 v8 = NSStringFromSelector(sel_isPermittedToUsePublicAPI);
  [v3 appendFormat:@" %@=%d", v8, -[CXAbstractProviderSource isPermittedToUsePublicAPI](self, "isPermittedToUsePublicAPI")];

  [v3 appendFormat:@", "];
  uint64_t v9 = NSStringFromSelector(sel_isPermittedToUsePrivateAPI);
  [v3 appendFormat:@" %@=%d", v9, -[CXAbstractProviderSource isPermittedToUsePrivateAPI](self, "isPermittedToUsePrivateAPI")];

  [v3 appendString:@">"];

  return (NSString *)v3;
}

- (CXAbstractProviderSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CXAbstractProviderSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (void)setInternalDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_internalDelegate);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)actionCompleted:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)requestTransaction:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end