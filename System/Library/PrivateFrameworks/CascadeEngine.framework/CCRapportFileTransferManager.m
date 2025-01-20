@interface CCRapportFileTransferManager
+ (CCRapportFileTransferManager)defaultInstance;
+ (void)defaultInstance;
- (CCRapportFileTransferManager)initWithDirectoryURL:(id)a3 accessAssertion:(id)a4;
- (NSURL)directoryURL;
- (OS_dispatch_queue)fileTransferQueue;
- (id)buildFileTransferSessionWithTargetDeviceIdentifier:(id)a3;
- (id)initiateFileTransferSesionBackToTargetDeviceWithIdentifier:(id)a3 withExchangedPeerPublicKey:(id)a4;
- (void)closeAllFileTransferSessions;
- (void)closeFileTransferSessionWithDeviceIdentifier:(id)a3;
@end

@implementation CCRapportFileTransferManager

+ (CCRapportFileTransferManager)defaultInstance
{
  v35[2] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F327E8]);
  char v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) == 0)
  {
    v13 = NSURL;
    v14 = NSTemporaryDirectory();
    v35[0] = v14;
    v35[1] = @"CloudKitDistributedSync";
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:2];
    v16 = [v13 fileURLWithPathComponents:v15];

    v17 = [MEMORY[0x263F08850] defaultManager];
    id v28 = 0;
    [v17 createDirectoryAtURL:v16 withIntermediateDirectories:1 attributes:0 error:&v28];
    id v18 = v28;

    v19 = __biome_log_for_category();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v32 = v16;
      __int16 v33 = 2112;
      id v34 = v18;
      _os_log_impl(&dword_249B69000, v19, OS_LOG_TYPE_DEFAULT, "CCRapportFileTransferManager: created directory at path %@ with error %@", buf, 0x16u);
    }

    v8 = 0;
    goto LABEL_17;
  }
  id v4 = objc_alloc(MEMORY[0x263F29E48]);
  v5 = (void *)[v4 initWithUseCase:*MEMORY[0x263F29E38]];
  id v6 = objc_alloc(MEMORY[0x263F29E98]);
  v7 = (void *)[v6 initWithType:5 name:*MEMORY[0x263F29E08] descriptors:MEMORY[0x263EFFA68] options:1];
  id v30 = 0;
  v8 = [v5 requestAccessToResource:v7 mode:3 error:&v30];
  id v9 = v30;
  if (v8) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (!v10)
  {
    id v11 = v9;
    v12 = __biome_log_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[CCRapportFileTransferManager defaultInstance]();
    }
LABEL_15:
    char v25 = 0;
    v16 = 0;
    goto LABEL_16;
  }
  v20 = NSURL;
  v21 = [v8 path];
  v12 = [v20 fileURLWithPath:v21];

  v22 = [MEMORY[0x263F08850] defaultManager];
  id v29 = 0;
  [v22 createDirectoryAtURL:v12 withIntermediateDirectories:1 attributes:0 error:&v29];
  id v11 = v29;

  v23 = __biome_log_for_category();
  v24 = v23;
  if (v11)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      +[CCRapportFileTransferManager defaultInstance]();
    }

    goto LABEL_15;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v12;
    _os_log_impl(&dword_249B69000, v24, OS_LOG_TYPE_DEFAULT, "CCRapportFileTransferManager: initializing file transfer diretory with url %@", buf, 0xCu);
  }

  v12 = v12;
  char v25 = 1;
  v16 = v12;
LABEL_16:

  if (v25)
  {
LABEL_17:
    v26 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDirectoryURL:v16 accessAssertion:v8];
    goto LABEL_19;
  }
  v26 = 0;
LABEL_19:

  return (CCRapportFileTransferManager *)v26;
}

- (CCRapportFileTransferManager)initWithDirectoryURL:(id)a3 accessAssertion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CCRapportFileTransferManager;
  id v9 = [(CCRapportFileTransferManager *)&v17 init];
  BOOL v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_directoryURL, a3);
    objc_storeStrong((id *)&v10->_accessAssertion, a4);
    uint64_t v11 = objc_opt_new();
    fileTransferSessions = v10->_fileTransferSessions;
    v10->_fileTransferSessions = (NSMutableDictionary *)v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.biomesyncd.fileTransferSessionManager", v13);
    fileTransferQueue = v10->_fileTransferQueue;
    v10->_fileTransferQueue = (OS_dispatch_queue *)v14;
  }
  return v10;
}

- (id)buildFileTransferSessionWithTargetDeviceIdentifier:(id)a3
{
  id v4 = a3;
  v5 = __biome_log_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CCRapportFileTransferManager buildFileTransferSessionWithTargetDeviceIdentifier:]();
  }

  id v6 = [(NSMutableDictionary *)self->_fileTransferSessions objectForKeyedSubscript:v4];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = (id)objc_opt_new();
    [v8 setDispatchQueue:self->_fileTransferQueue];
    [v8 setTargetID:v4];
    [v8 setFlags:1];
    [v8 setTemporaryDirectoryURL:self->_directoryURL];
    id v14 = 0;
    char v9 = [v8 prepareTemplateAndReturnError:&v14];
    id v10 = v14;
    uint64_t v11 = __biome_log_for_category();
    v12 = v11;
    if (v9)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[CCRapportFileTransferManager buildFileTransferSessionWithTargetDeviceIdentifier:]();
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      -[CCRapportFileTransferManager buildFileTransferSessionWithTargetDeviceIdentifier:]();
    }

    [(NSMutableDictionary *)self->_fileTransferSessions setObject:v8 forKeyedSubscript:v4];
  }

  return v8;
}

- (id)initiateFileTransferSesionBackToTargetDeviceWithIdentifier:(id)a3 withExchangedPeerPublicKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = __biome_log_for_category();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CCRapportFileTransferManager initiateFileTransferSesionBackToTargetDeviceWithIdentifier:withExchangedPeerPublicKey:]();
  }

  char v9 = [(NSMutableDictionary *)self->_fileTransferSessions objectForKeyedSubscript:v6];
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = (id)objc_opt_new();
    [v11 setDispatchQueue:self->_fileTransferQueue];
    [v11 setTargetID:v6];
    [v11 setPeerPublicKey:v7];
    [v11 setTemporaryDirectoryURL:self->_directoryURL];
    [v11 setProgressHandler:&__block_literal_global_1];
    id v17 = 0;
    char v12 = [v11 prepareTemplateAndReturnError:&v17];
    id v13 = v17;
    id v14 = __biome_log_for_category();
    v15 = v14;
    if (v12)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[CCRapportFileTransferManager buildFileTransferSessionWithTargetDeviceIdentifier:]();
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[CCRapportFileTransferManager buildFileTransferSessionWithTargetDeviceIdentifier:]();
    }

    [(NSMutableDictionary *)self->_fileTransferSessions setObject:v11 forKeyedSubscript:v6];
  }

  return v11;
}

void __118__CCRapportFileTransferManager_initiateFileTransferSesionBackToTargetDeviceWithIdentifier_withExchangedPeerPublicKey___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = __biome_log_for_category();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __118__CCRapportFileTransferManager_initiateFileTransferSesionBackToTargetDeviceWithIdentifier_withExchangedPeerPublicKey___block_invoke_cold_1();
  }
}

- (void)closeFileTransferSessionWithDeviceIdentifier:(id)a3
{
  fileTransferSessions = self->_fileTransferSessions;
  id v5 = a3;
  id v6 = [(NSMutableDictionary *)fileTransferSessions objectForKeyedSubscript:v5];
  [v6 finish];
  [(NSMutableDictionary *)self->_fileTransferSessions removeObjectForKey:v5];
}

- (void)closeAllFileTransferSessions
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  char v3 = [(NSMutableDictionary *)self->_fileTransferSessions allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) invalidate];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSMutableDictionary *)self->_fileTransferSessions removeAllObjects];
}

- (OS_dispatch_queue)fileTransferQueue
{
  return self->_fileTransferQueue;
}

- (NSURL)directoryURL
{
  return self->_directoryURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directoryURL, 0);
  objc_storeStrong((id *)&self->_fileTransferQueue, 0);
  objc_storeStrong((id *)&self->_accessAssertion, 0);
  objc_storeStrong((id *)&self->_fileTransferSessions, 0);
}

+ (void)defaultInstance
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_249B69000, v1, OS_LOG_TYPE_ERROR, "CCRapportFileTransferManager: failed to create file transfer directory %@ with error %@", v2, 0x16u);
}

- (void)buildFileTransferSessionWithTargetDeviceIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_249B69000, v0, v1, "CCRapportFileTransferManager: prepareTemplateAndReturnError %@", v2, v3, v4, v5, v6);
}

- (void)buildFileTransferSessionWithTargetDeviceIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7(&dword_249B69000, v0, v1, "CCRapportFileTransferManager: failed to prepare file transfer template %@", v2, v3, v4, v5, v6);
}

- (void)buildFileTransferSessionWithTargetDeviceIdentifier:.cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_249B69000, v0, v1, "CCRapportFileTransferManager: buildFileTransferSessionWithTargetDeviceIdentifier %@", v2, v3, v4, v5, v6);
}

- (void)initiateFileTransferSesionBackToTargetDeviceWithIdentifier:withExchangedPeerPublicKey:.cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_249B69000, v0, v1, "CCRapportFileTransferManager: initiateFileTransferSesionBackToTargetDeviceWithIdentifier %@", v2, v3, v4, v5, v6);
}

void __118__CCRapportFileTransferManager_initiateFileTransferSesionBackToTargetDeviceWithIdentifier_withExchangedPeerPublicKey___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_249B69000, v0, v1, "CCRapportFileTransferManager: progress %@", v2, v3, v4, v5, v6);
}

@end