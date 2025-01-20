@interface DKSandboxExtension
+ (BOOL)releaseSandboxExtensionWithHandle:(id)a3 error:(id *)a4;
+ (id)consumeSandboxExtensionWithToken:(id)a3 error:(id *)a4;
+ (id)consumeSandboxExtensionsWithTokens:(id)a3;
+ (id)issueSandboxExtensionForFile:(id)a3 toAuditToken:(id *)a4 error:(id *)a5;
+ (id)issueSandboxExtensionsForFiles:(id)a3 toAuditToken:(id *)a4;
+ (void)releaseSandboxExtensionsWithHandles:(id)a3;
@end

@implementation DKSandboxExtension

+ (id)issueSandboxExtensionForFile:(id)a3 toAuditToken:(id *)a4 error:(id *)a5
{
  id v7 = [a3 path];
  [v7 UTF8String];
  $115C4C562B26FF47E01F9F4EA65B5887 v12 = *a4;
  uint64_t v8 = sandbox_extension_issue_file_to_process();

  if (v8)
  {
    v9 = objc_msgSend([NSString alloc], "initWithUTF8String:", v8, *(_OWORD *)v12.var0, *(_OWORD *)&v12.var0[4]);
  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"com.apple.DiagnosticsKit.SandboxExtensionError", *__error(), 0, *(_OWORD *)v12.var0, *(_OWORD *)&v12.var0[4]);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    *a5 = v10;
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

+ (id)issueSandboxExtensionsForFiles:(id)a3 toAuditToken:(id *)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [MEMORY[0x263EFF980] array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v25;
    *(void *)&long long v9 = 138412546;
    long long v22 = v9;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v24 + 1) + 8 * v12);
        id v23 = 0;
        long long v14 = *(_OWORD *)&a4->var0[4];
        *(_OWORD *)buf = *(_OWORD *)a4->var0;
        *(_OWORD *)&buf[16] = v14;
        v15 = +[DKSandboxExtension issueSandboxExtensionForFile:toAuditToken:error:](DKSandboxExtension, "issueSandboxExtensionForFile:toAuditToken:error:", v13, buf, &v23, v22);
        id v16 = v23;
        v17 = DiagnosticsKitLogHandleForCategory(2);
        v18 = v17;
        if (v15)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v19 = [v13 path];
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v19;
            _os_log_impl(&dword_23D039000, v18, OS_LOG_TYPE_DEFAULT, "[Sandbox] Issued sandbox extension for file: %@", buf, 0xCu);
          }
          [v6 addObject:v15];
        }
        else
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v20 = [v13 path];
            *(_DWORD *)buf = v22;
            *(void *)&buf[4] = v20;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v16;
            _os_log_error_impl(&dword_23D039000, v18, OS_LOG_TYPE_ERROR, "[Sandbox] Error issuing sandbox extension for file: %@ \n%@", buf, 0x16u);
          }
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v10);
  }

  return v6;
}

+ (id)consumeSandboxExtensionWithToken:(id)a3 error:(id *)a4
{
  [a3 UTF8String];
  uint64_t v5 = sandbox_extension_consume();
  if (v5 == -1)
  {
    if (a4)
    {
      id v7 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.DiagnosticsKit.SandboxExtensionError" code:*__error() userInfo:0];
      v6 = 0;
      *a4 = v7;
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = (void *)[objc_alloc(NSNumber) initWithLongLong:v5];
  }
  return v6;
}

+ (id)consumeSandboxExtensionsWithTokens:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF980] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v20;
    *(void *)&long long v7 = 138412546;
    long long v17 = v7;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * v10);
        id v18 = 0;
        uint64_t v12 = +[DKSandboxExtension consumeSandboxExtensionWithToken:error:](DKSandboxExtension, "consumeSandboxExtensionWithToken:error:", v11, &v18, v17);
        id v13 = v18;
        long long v14 = DiagnosticsKitLogHandleForCategory(1);
        v15 = v14;
        if (v12)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            long long v24 = v12;
            _os_log_impl(&dword_23D039000, v15, OS_LOG_TYPE_DEFAULT, "[Sandbox] Consumed sandbox extension, handle: %@", buf, 0xCu);
          }

          [v4 addObject:v12];
        }
        else
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v17;
            long long v24 = 0;
            __int16 v25 = 2112;
            id v26 = v13;
            _os_log_error_impl(&dword_23D039000, v15, OS_LOG_TYPE_ERROR, "[Sandbox] Failed to consume sandbox extension with handle: %@ \n%@", buf, 0x16u);
          }
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v8);
  }

  return v4;
}

+ (BOOL)releaseSandboxExtensionWithHandle:(id)a3 error:(id *)a4
{
  [a3 longLongValue];
  int v5 = sandbox_extension_release();
  int v6 = v5;
  if (a4 && v5)
  {
    *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.DiagnosticsKit.SandboxExtensionError" code:*__error() userInfo:0];
  }
  return v6 == 0;
}

+ (void)releaseSandboxExtensionsWithHandles:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v17;
    *(void *)&long long v5 = 138412546;
    long long v14 = v5;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * v8);
        id v15 = 0;
        BOOL v10 = +[DKSandboxExtension releaseSandboxExtensionWithHandle:error:](DKSandboxExtension, "releaseSandboxExtensionWithHandle:error:", v9, &v15, v14);
        id v11 = v15;
        uint64_t v12 = DiagnosticsKitLogHandleForCategory(1);
        id v13 = v12;
        if (v10)
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v21 = v9;
            _os_log_impl(&dword_23D039000, v13, OS_LOG_TYPE_DEFAULT, "[Sandbox] Released sandbox extension with handle: %@", buf, 0xCu);
          }
        }
        else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v14;
          uint64_t v21 = v9;
          __int16 v22 = 2112;
          id v23 = v11;
          _os_log_error_impl(&dword_23D039000, v13, OS_LOG_TYPE_ERROR, "[Sandbox] Failed to release sandbox extension with handle: %@ \n%@", buf, 0x16u);
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v6);
  }
}

@end