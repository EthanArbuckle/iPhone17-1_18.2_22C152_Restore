@interface FMDFMIPSharedStateManager
+ (id)sharedInstance;
- (BOOL)_removeSharedInfo;
- (BOOL)_writeSharedInfo:(id)a3;
- (BOOL)fmipActive;
- (FMDFMIPSharedStateManager)init;
- (NSURL)fmipSharedFileStaticURL;
- (OS_dispatch_queue)stateManagerQueue;
- (id)_fmipSharedFileURL;
- (id)_readSharedInfo;
- (unint64_t)lostModeType;
- (void)_removeSharedInfo;
- (void)recalculateLostMode;
- (void)setFMiPActive:(BOOL)a3;
- (void)setFmipSharedFileStaticURL:(id)a3;
- (void)setStateManagerQueue:(id)a3;
@end

@implementation FMDFMIPSharedStateManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_3);
  }
  v2 = (void *)sharedInstance__instance_0;

  return v2;
}

uint64_t __43__FMDFMIPSharedStateManager_sharedInstance__block_invoke()
{
  sharedInstance__instance_0 = objc_alloc_init(FMDFMIPSharedStateManager);

  return MEMORY[0x1F41817F8]();
}

- (FMDFMIPSharedStateManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)FMDFMIPSharedStateManager;
  v2 = [(FMDFMIPSharedStateManager *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.icloud.FindMyDevice.stateManager", 0);
    stateManagerQueue = v2->_stateManagerQueue;
    v2->_stateManagerQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)setFMiPActive:(BOOL)a3
{
  BOOL v3 = a3;
  v13[1] = *MEMORY[0x1E4F143B8];
  v5 = [(FMDFMIPSharedStateManager *)self _fmipSharedFileURL];
  if (v5)
  {
    objc_super v6 = [(FMDFMIPSharedStateManager *)self _readSharedInfo];
    if (!v6)
    {
      v12 = @"fmipActive";
      v7 = [NSNumber numberWithBool:v3];
      v13[0] = v7;
      objc_super v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    }
    v8 = LogCategory_Unspecified();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1D0E93000, v8, OS_LOG_TYPE_DEFAULT, "Shared file present. Writing new FMiP sate.", v11, 2u);
    }

    v9 = (void *)[v6 mutableCopy];
    v10 = [NSNumber numberWithBool:v3];
    [v9 setObject:v10 forKey:@"fmipActive"];

    [(FMDFMIPSharedStateManager *)self _writeSharedInfo:v9];
  }
}

- (void)recalculateLostMode
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v3 = +[FMDFMIPManager sharedInstance];
  v4 = [v3 lostModeInfo];

  v5 = LogCategory_Unspecified();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v13 = [v4 lostModeType];
    _os_log_impl(&dword_1D0E93000, v5, OS_LOG_TYPE_DEFAULT, "Updating shared file with lost mode - %lu", buf, 0xCu);
  }

  objc_super v6 = [(FMDFMIPSharedStateManager *)self _readSharedInfo];
  v7 = v6;
  if (v6)
  {
    v8 = (void *)[v6 mutableCopy];
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "lostModeType"));
    [v8 setObject:v9 forKey:@"fmipLostModeType"];
  }
  else
  {
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "lostModeType", @"fmipLostModeType"));
    v11 = v9;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  }

  [(FMDFMIPSharedStateManager *)self _writeSharedInfo:v8];
}

- (BOOL)fmipActive
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = [(FMDFMIPSharedStateManager *)self _readSharedInfo];
  BOOL v3 = v2;
  if (v2)
  {
    v4 = [v2 objectForKey:@"fmipActive"];
    int v5 = [v4 BOOLValue];

    objc_super v6 = LogCategory_Unspecified();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109120;
      v8[1] = v5;
      _os_log_impl(&dword_1D0E93000, v6, OS_LOG_TYPE_DEFAULT, "Shared file found. Returning FMiP active - %i", (uint8_t *)v8, 8u);
    }
  }
  else
  {
    objc_super v6 = LogCategory_Unspecified();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8[0]) = 0;
      _os_log_impl(&dword_1D0E93000, v6, OS_LOG_TYPE_DEFAULT, "Shared file not found. Returning FMiP active as - NO", (uint8_t *)v8, 2u);
    }
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (unint64_t)lostModeType
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [(FMDFMIPSharedStateManager *)self _readSharedInfo];
  BOOL v3 = v2;
  if (v2)
  {
    v4 = [v2 objectForKey:@"fmipLostModeType"];
    unint64_t v5 = [v4 integerValue];

    objc_super v6 = LogCategory_Unspecified();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      unint64_t v9 = v5;
      _os_log_impl(&dword_1D0E93000, v6, OS_LOG_TYPE_DEFAULT, "Shared file found. Returning lost mode type as - %lu", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    objc_super v6 = LogCategory_Unspecified();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1D0E93000, v6, OS_LOG_TYPE_DEFAULT, "Shared file not found. Returning lost mode type as - FMDLostModeTypeNone", (uint8_t *)&v8, 2u);
    }
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)_readSharedInfo
{
  v2 = [(FMDFMIPSharedStateManager *)self _fmipSharedFileURL];
  if (v2
    && ([MEMORY[0x1E4F28CB8] defaultManager],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        [v2 path],
        v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v3 fileExistsAtPath:v4],
        v4,
        v3,
        v5))
  {
    objc_super v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfURL:v2];
  }
  else
  {
    objc_super v6 = 0;
  }

  return v6;
}

- (BOOL)_writeSharedInfo:(id)a3
{
  id v4 = a3;
  int v5 = [(FMDFMIPSharedStateManager *)self _fmipSharedFileURL];
  if (v5 && (v11 = 0, [v4 writeToURL:v5 error:&v11], (id v6 = v11) != 0))
  {
    v7 = v6;
    int v8 = LogCategory_Unspecified();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[FMDFMIPSharedStateManager _writeSharedInfo:]((uint64_t)v7, v8);
    }

    BOOL v9 = 0;
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (BOOL)_removeSharedInfo
{
  v2 = [(FMDFMIPSharedStateManager *)self _fmipSharedFileURL];
  BOOL v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v7 = 0;
  [v3 removeItemAtURL:v2 error:&v7];
  id v4 = v7;

  if (v4)
  {
    int v5 = LogCategory_Unspecified();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(FMDFMIPSharedStateManager *)(uint64_t)v4 _removeSharedInfo];
    }
  }
  return v4 == 0;
}

- (id)_fmipSharedFileURL
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  BOOL v9 = __Block_byref_object_copy__1;
  uint64_t v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  stateManagerQueue = self->_stateManagerQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__FMDFMIPSharedStateManager__fmipSharedFileURL__block_invoke;
  v5[3] = &unk_1E689C2F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateManagerQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __47__FMDFMIPSharedStateManager__fmipSharedFileURL__block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) fmipSharedFileStaticURL];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F61560]);
    int v5 = (void *)[v4 initWithIdentifier:FMDManagedSystemGroupContainerIdentifier];
    uint64_t v6 = [v5 url];
    id v7 = objc_msgSend(v6, "fm_preferencesPathURLForDomain:", @"FMIPStateInfo");
    [*v2 setFmipSharedFileStaticURL:v7];

    uint64_t v8 = LogCategory_Unspecified();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __47__FMDFMIPSharedStateManager__fmipSharedFileURL__block_invoke_cold_1(v2, v8);
    }
  }
  uint64_t v9 = [*(id *)(a1 + 32) fmipSharedFileStaticURL];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

- (NSURL)fmipSharedFileStaticURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFmipSharedFileStaticURL:(id)a3
{
}

- (OS_dispatch_queue)stateManagerQueue
{
  return self->_stateManagerQueue;
}

- (void)setStateManagerQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateManagerQueue, 0);

  objc_storeStrong((id *)&self->_fmipSharedFileStaticURL, 0);
}

- (void)_writeSharedInfo:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0E93000, a2, OS_LOG_TYPE_ERROR, "Could not write the shared file. Error - %@", (uint8_t *)&v2, 0xCu);
}

- (void)_removeSharedInfo
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0E93000, a2, OS_LOG_TYPE_ERROR, "Could not remove the shared file. Error - %@", (uint8_t *)&v2, 0xCu);
}

void __47__FMDFMIPSharedStateManager__fmipSharedFileURL__block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*a1 fmipSharedFileStaticURL];
  int v4 = 138412290;
  int v5 = v3;
  _os_log_debug_impl(&dword_1D0E93000, a2, OS_LOG_TYPE_DEBUG, "Container path URL %@", (uint8_t *)&v4, 0xCu);
}

@end