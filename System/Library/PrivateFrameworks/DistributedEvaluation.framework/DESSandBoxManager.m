@interface DESSandBoxManager
+ (id)sandboxExtensionsToXPCConnection:(id)a3 fileURLs:(id)a4 requireWrite:(BOOL)a5 outError:(id *)a6;
- (BOOL)consumeExtensionsWithError:(id *)a3;
- (DESSandBoxManager)initWithExtensions:(id)a3;
- (void)dealloc;
- (void)releaseExtensions;
@end

@implementation DESSandBoxManager

+ (id)sandboxExtensionsToXPCConnection:(id)a3 fileURLs:(id)a4 requireWrite:(BOOL)a5 outError:(id *)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = v8;
  id v10 = 0;
  if (a3 && v8)
  {
    v36 = a6;
    long long v42 = 0u;
    long long v43 = 0u;
    [a3 auditToken];
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v12 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      +[DESSandBoxManager sandboxExtensionsToXPCConnection:fileURLs:requireWrite:outError:]((uint64_t)v9, v12, v13, v14, v15, v16, v17, v18);
    }

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = v9;
    uint64_t v19 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v39;
      while (2)
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v39 != v21) {
            objc_enumerationMutation(obj);
          }
          id v23 = *(id *)(*((void *)&v38 + 1) + 8 * i);
          [v23 fileSystemRepresentation];
          v24 = (const char *)sandbox_extension_issue_file_to_process();
          v25 = NSString;
          if (!v24)
          {
            v27 = __error();
            v28 = [v25 stringWithFormat:@"fileURL=%@: error=%s\n", v23, strerror(*v27)];
            v29 = +[DESLogging coreChannel];
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
              +[DESSandBoxManager sandboxExtensionsToXPCConnection:fileURLs:requireWrite:outError:]((uint64_t)v28, v29);
            }

            if (v36)
            {
              v30 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v31 = *MEMORY[0x1E4F28568];
              v45[0] = v28;
              uint64_t v32 = *MEMORY[0x1E4F28A50];
              v44[0] = v31;
              v44[1] = v32;
              v33 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:0];
              v45[1] = v33;
              v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:2];
              id *v36 = [v30 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:7001 userInfo:v34];
            }
            id v10 = 0;
            goto LABEL_19;
          }
          v26 = (void *)[[NSString alloc] initWithBytesNoCopy:v24 length:strlen(v24) encoding:4 freeWhenDone:1];
          [v11 addObject:v26];
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }

    id v10 = v11;
LABEL_19:
  }

  return v10;
}

- (DESSandBoxManager)initWithExtensions:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DESSandBoxManager;
  v5 = [(DESSandBoxManager *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    extensions = v5->_extensions;
    v5->_extensions = (NSArray *)v6;

    id v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    consumedSandboxExtensions = v5->_consumedSandboxExtensions;
    v5->_consumedSandboxExtensions = v8;
  }
  return v5;
}

- (void)dealloc
{
  [(DESSandBoxManager *)self releaseExtensions];
  v3.receiver = self;
  v3.super_class = (Class)DESSandBoxManager;
  [(DESSandBoxManager *)&v3 dealloc];
}

- (BOOL)consumeExtensionsWithError:(id *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  p_extensions = &self->_extensions;
  if ([(NSArray *)self->_extensions count])
  {
    uint64_t v6 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[DESSandBoxManager consumeExtensionsWithError:]((uint64_t)p_extensions, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v13 = *p_extensions;
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v29 + 1) + 8 * i) UTF8String];
        uint64_t v18 = sandbox_extension_consume();
        if (v18 == -1)
        {
          uint64_t v21 = +[DESLogging coreChannel];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            -[DESSandBoxManager consumeExtensionsWithError:](v21);
          }

          if (a3)
          {
            v22 = (void *)MEMORY[0x1E4F28C58];
            v33[0] = *MEMORY[0x1E4F28568];
            id v23 = NSString;
            v24 = __error();
            v25 = objc_msgSend(v23, "stringWithFormat:", @"Error consuming sandbox extension: %s", strerror(*v24));
            v34[0] = v25;
            v33[1] = *MEMORY[0x1E4F28A50];
            v26 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:0];
            v34[1] = v26;
            v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
            *a3 = [v22 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:7000 userInfo:v27];

            LOBYTE(a3) = 0;
          }
          goto LABEL_18;
        }
        consumedSandboxExtensions = self->_consumedSandboxExtensions;
        uint64_t v20 = [NSNumber numberWithLongLong:v18];
        [(NSMutableArray *)consumedSandboxExtensions addObject:v20];
      }
      uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v29 objects:v35 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
  LOBYTE(a3) = 1;
LABEL_18:

  return (char)a3;
}

- (void)releaseExtensions
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consumedSandboxExtensions, 0);

  objc_storeStrong((id *)&self->_extensions, 0);
}

+ (void)sandboxExtensionsToXPCConnection:(uint64_t)a1 fileURLs:(NSObject *)a2 requireWrite:outError:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BECCB000, a2, OS_LOG_TYPE_ERROR, "Failed to issue sandbox extension: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)sandboxExtensionsToXPCConnection:(uint64_t)a3 fileURLs:(uint64_t)a4 requireWrite:(uint64_t)a5 outError:(uint64_t)a6 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)consumeExtensionsWithError:(NSObject *)a1 .cold.1(NSObject *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = __error();
  uint64_t v3 = strerror(*v2);
  int v4 = 136315138;
  v5 = v3;
  _os_log_error_impl(&dword_1BECCB000, a1, OS_LOG_TYPE_ERROR, "Error consuming sandbox extension: %s", (uint8_t *)&v4, 0xCu);
}

- (void)consumeExtensionsWithError:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end