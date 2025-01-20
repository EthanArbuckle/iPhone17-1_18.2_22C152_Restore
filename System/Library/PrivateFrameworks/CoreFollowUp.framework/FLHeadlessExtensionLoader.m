@interface FLHeadlessExtensionLoader
+ (id)sharedExtensionQueue;
- (BOOL)_loadExtension:(id *)a3;
- (BOOL)_setupSessionIfNeeded:(id *)a3;
- (FLHeadlessExtensionLoader)initWithFollowUp:(id)a3 andDelegate:(id)a4;
- (FLHeadlessExtensionLoader)initWithIdentifier:(id)a3;
- (NSExtension)extension;
- (NSString)identifier;
- (NSUUID)sessionID;
- (id)_hostContextForExtension:(id)a3;
- (id)_loadExtensionForIdentifier:(id)a3 error:(id *)a4;
- (id)description;
- (id)remoteInterface;
- (id)requestInterruptionBlock;
- (void)_terminate;
- (void)dealloc;
- (void)setRequestInterruptionBlock:(id)a3;
- (void)setSessionID:(id)a3;
@end

@implementation FLHeadlessExtensionLoader

- (FLHeadlessExtensionLoader)initWithFollowUp:(id)a3 andDelegate:(id)a4
{
  id v6 = a4;
  v7 = [a3 extensionIdentifier];
  v8 = [(FLHeadlessExtensionLoader *)self initWithIdentifier:v7];

  if (v8) {
    objc_storeWeak((id *)&v8->_delegate, v6);
  }

  return v8;
}

- (FLHeadlessExtensionLoader)initWithIdentifier:(id)a3
{
  id v5 = a3;
  id v6 = [(FLHeadlessExtensionLoader *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

- (NSExtension)extension
{
  extension = self->_extension;
  if (!extension)
  {
    v4 = [(FLHeadlessExtensionLoader *)self identifier];
    id v5 = [(FLHeadlessExtensionLoader *)self _loadExtensionForIdentifier:v4 error:0];
    id v6 = self->_extension;
    self->_extension = v5;

    extension = self->_extension;
  }

  return extension;
}

- (void)_terminate
{
  if (self->_extension && self->_sessionID)
  {
    v3 = _FLLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1BE24A000, v3, OS_LOG_TYPE_DEFAULT, "Terminating extension...", v4, 2u);
    }

    [(NSExtension *)self->_extension cancelExtensionRequestWithIdentifier:self->_sessionID];
  }
}

- (id)remoteInterface
{
  extensionContext = self->_extensionContext;
  if (!extensionContext)
  {
    [(FLHeadlessExtensionLoader *)self _loadExtension:0];
    extensionContext = self->_extensionContext;
  }

  return extensionContext;
}

- (BOOL)_loadExtension:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v23 = 0;
  BOOL v5 = [(FLHeadlessExtensionLoader *)self _setupSessionIfNeeded:&v23];
  id v6 = v23;
  if (v5)
  {
    v7 = [(FLHeadlessExtensionLoader *)self extension];
    v8 = [(FLHeadlessExtensionLoader *)self _hostContextForExtension:v7];
    v9 = [v8 remoteContextWithErrorHandler:&__block_literal_global_10];
    extensionContext = self->_extensionContext;
    self->_extensionContext = v9;
  }
  if (a3) {
    *a3 = v6;
  }
  v11 = self->_extensionContext;
  v12 = _FLLogSystem();
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = self->_extensionContext;
      *(_DWORD *)buf = 138412290;
      v25 = v14;
      _os_log_impl(&dword_1BE24A000, v13, OS_LOG_TYPE_DEFAULT, "Extension context %@ loaded successfully", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    -[FLHeadlessExtensionLoader _loadExtension:]((uint64_t)v6, v13, v15, v16, v17, v18, v19, v20);
  }

  BOOL v21 = self->_extensionContext != 0;
  return v21;
}

void __44__FLHeadlessExtensionLoader__loadExtension___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = _FLLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __44__FLHeadlessExtensionLoader__loadExtension___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (BOOL)_setupSessionIfNeeded:(id *)a3
{
  uint64_t v5 = [(FLHeadlessExtensionLoader *)self extension];
  uint64_t v6 = v5;
  sessionID = self->_sessionID;
  if (sessionID) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v5 == 0;
  }
  if (!v8)
  {
    id v14 = 0;
    uint64_t v9 = [v5 beginExtensionRequestWithInputItems:MEMORY[0x1E4F1CBF0] error:&v14];
    id v10 = v14;
    v11 = self->_sessionID;
    self->_sessionID = v9;

    if (a3) {
      *a3 = v10;
    }

    sessionID = self->_sessionID;
  }
  BOOL v12 = sessionID != 0;

  return v12;
}

+ (id)sharedExtensionQueue
{
  if (sharedExtensionQueue_onceToken[0] != -1) {
    dispatch_once(sharedExtensionQueue_onceToken, &__block_literal_global_4_0);
  }
  id v2 = (void *)sharedExtensionQueue_sharedExtensionQueue;

  return v2;
}

uint64_t __49__FLHeadlessExtensionLoader_sharedExtensionQueue__block_invoke()
{
  sharedExtensionQueue_sharedExtensionQueue = (uint64_t)dispatch_queue_create("com.apple.followup-extension.queue", 0);

  return MEMORY[0x1F41817F8]();
}

- (id)_loadExtensionForIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _FLLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v6;
      _os_log_impl(&dword_1BE24A000, v7, OS_LOG_TYPE_DEFAULT, "Loading extension with identifier: %@", buf, 0xCu);
    }

    id v21 = 0;
    BOOL v8 = [MEMORY[0x1E4F28C70] extensionWithIdentifier:v6 error:&v21];
    id v9 = v21;
    objc_initWeak(&location, self);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __63__FLHeadlessExtensionLoader__loadExtensionForIdentifier_error___block_invoke;
    v18[3] = &unk_1E637B118;
    objc_copyWeak(&v19, &location);
    [v8 setRequestInterruptionBlock:v18];
    if (a4) {
      *a4 = v9;
    }
    if (v9)
    {
      id v10 = _FLLogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[FLHeadlessExtensionLoader _loadExtensionForIdentifier:error:]((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
    else
    {
      id v10 = _FLLogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v8;
        _os_log_impl(&dword_1BE24A000, v10, OS_LOG_TYPE_DEFAULT, "Loaded extension: %@", buf, 0xCu);
      }
    }

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

void __63__FLHeadlessExtensionLoader__loadExtensionForIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _FLLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __63__FLHeadlessExtensionLoader__loadExtensionForIdentifier_error___block_invoke_cold_1(v4);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = [WeakRetained requestInterruptionBlock];

  if (v6)
  {
    uint64_t v7 = [WeakRetained requestInterruptionBlock];
    ((void (**)(void, id))v7)[2](v7, v3);
  }
}

- (id)_hostContextForExtension:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FLHeadlessExtensionLoader *)self sessionID];
  id v6 = [v4 _extensionContextForUUID:v5];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [v6 setDelegate:WeakRetained];

  return v6;
}

- (id)description
{
  id v3 = NSString;
  id v4 = [(id)objc_opt_class() description];
  uint64_t v5 = [v3 stringWithFormat:@"<%@: %p>", v4, self];

  return v5;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = _FLLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v6 = self;
    _os_log_impl(&dword_1BE24A000, v3, OS_LOG_TYPE_DEFAULT, "%@ going away", buf, 0xCu);
  }

  [(FLHeadlessExtensionLoader *)self _terminate];
  v4.receiver = self;
  v4.super_class = (Class)FLHeadlessExtensionLoader;
  [(FLHeadlessExtensionLoader *)&v4 dealloc];
}

- (id)requestInterruptionBlock
{
  return self->_requestInterruptionBlock;
}

- (void)setRequestInterruptionBlock:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_requestInterruptionBlock, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_extensionContext, 0);
}

- (void)_loadExtension:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __44__FLHeadlessExtensionLoader__loadExtension___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_loadExtensionForIdentifier:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __63__FLHeadlessExtensionLoader__loadExtensionForIdentifier_error___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BE24A000, log, OS_LOG_TYPE_ERROR, "Extension interrupted", v1, 2u);
}

@end