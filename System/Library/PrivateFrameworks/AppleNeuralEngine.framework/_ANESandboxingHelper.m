@interface _ANESandboxingHelper
+ (BOOL)canAccessPathAt:(id)a3 methodName:(id)a4 error:(id *)a5;
+ (BOOL)releaseSandboxExtension:(id)a3 handle:(int64_t)a4;
+ (id)issueSandboxExtensionForModel:(id)a3 error:(id *)a4;
+ (id)issueSandboxExtensionForPath:(id)a3 error:(id *)a4;
+ (id)sandboxExtensionPathForModelURL:(id)a3;
+ (int64_t)consumeSandboxExtension:(id)a3 forModel:(id)a4 error:(id *)a5;
+ (int64_t)consumeSandboxExtension:(id)a3 forPath:(id)a4 error:(id *)a5;
+ (void)initialize;
@end

@implementation _ANESandboxingHelper

+ (int64_t)consumeSandboxExtension:(id)a3 forModel:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = objc_opt_class();
  v10 = [v7 modelURL];

  v11 = [v9 sandboxExtensionPathForModelURL:v10];

  int64_t v12 = [(id)objc_opt_class() consumeSandboxExtension:v8 forPath:v11 error:a5];
  return v12;
}

+ (id)issueSandboxExtensionForModel:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_opt_class();
  id v8 = [v6 modelURL];
  v9 = [v7 sandboxExtensionPathForModelURL:v8];

  v10 = (void *)gLogger_0;
  if (os_log_type_enabled((os_log_t)gLogger_0, OS_LOG_TYPE_DEBUG))
  {
    v16 = v10;
    v17 = NSStringFromSelector(a2);
    int v20 = 138412802;
    v21 = v17;
    __int16 v22 = 2112;
    id v23 = v6;
    __int16 v24 = 2112;
    v25 = v9;
    _os_log_debug_impl(&dword_1DB8AB000, v16, OS_LOG_TYPE_DEBUG, "%@: model=%@ modelPathStr=%@", (uint8_t *)&v20, 0x20u);
  }
  v11 = [(id)objc_opt_class() issueSandboxExtensionForPath:v9 error:a4];
  int64_t v12 = +[_ANEStrings noSandboxExtension];
  int v13 = [v11 isEqualToString:v12];

  if (v13)
  {
    v14 = (void *)gLogger_0;
    if (os_log_type_enabled((os_log_t)gLogger_0, OS_LOG_TYPE_DEBUG))
    {
      v18 = v14;
      v19 = NSStringFromSelector(a2);
      int v20 = 138412802;
      v21 = v19;
      __int16 v22 = 2112;
      id v23 = v6;
      __int16 v24 = 2112;
      v25 = v11;
      _os_log_debug_impl(&dword_1DB8AB000, v18, OS_LOG_TYPE_DEBUG, "%@: model=%@ sandboxExtension=%@", (uint8_t *)&v20, 0x20u);
    }
  }

  return v11;
}

+ (id)sandboxExtensionPathForModelURL:(id)a3
{
  id v3 = a3;
  if ([v3 hasDirectoryPath])
  {
    v4 = NSString;
    v5 = [v3 path];

    id v6 = [v4 stringWithFormat:@"%@/", v5];
  }
  else
  {
    v5 = [v3 URLByDeletingLastPathComponent];

    id v7 = NSString;
    id v8 = [v5 path];
    id v6 = [v7 stringWithFormat:@"%@/", v8];
  }
  return v6;
}

+ (int64_t)consumeSandboxExtension:(id)a3 forPath:(id)a4 error:(id *)a5
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v8 length])
  {
    id v10 = v8;
    [v10 UTF8String];
    int64_t v11 = sandbox_extension_consume();
    int64_t v12 = (void *)gLogger_0;
    if ((v11 & 0x8000000000000000) == 0)
    {
      if (os_log_type_enabled((os_log_t)gLogger_0, OS_LOG_TYPE_DEBUG)) {
        +[_ANESandboxingHelper consumeSandboxExtension:forPath:error:](v12, a2);
      }
      goto LABEL_15;
    }
    if (os_log_type_enabled((os_log_t)gLogger_0, OS_LOG_TYPE_INFO))
    {
      log = v12;
      v14 = NSStringFromSelector(a2);
      int v15 = *__error();
      v16 = __error();
      v17 = strerror(*v16);
      *(_DWORD *)buf = 138413058;
      v29 = v14;
      __int16 v30 = 2112;
      id v31 = v10;
      __int16 v32 = 1024;
      LODWORD(v33[0]) = v15;
      WORD2(v33[0]) = 2080;
      *(void *)((char *)v33 + 6) = v17;
      _os_log_impl(&dword_1DB8AB000, log, OS_LOG_TYPE_INFO, "%@: Sandbox extension(%@) consume failed (errno=%d) : %s", buf, 0x26u);
    }
    v18 = objc_opt_class();
    v19 = NSStringFromSelector(a2);
    id v27 = 0;
    char v20 = [v18 canAccessPathAt:v9 methodName:v19 error:&v27];
    id v21 = v27;

    if ((v20 & 1) == 0 && (__int16 v22 = (void *)gLogger_0, os_log_type_enabled((os_log_t)gLogger_0, OS_LOG_TYPE_ERROR)))
    {
      __int16 v24 = v22;
      v25 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v29 = v25;
      __int16 v30 = 2112;
      id v31 = v10;
      __int16 v32 = 2112;
      v33[0] = v21;
      _os_log_error_impl(&dword_1DB8AB000, v24, OS_LOG_TYPE_ERROR, "%@: Inaccessible file (%@) : error=%@", buf, 0x20u);

      if (!a5) {
        goto LABEL_14;
      }
    }
    else if (!a5)
    {
LABEL_14:

      goto LABEL_15;
    }
    *a5 = v21;
    goto LABEL_14;
  }
  int v13 = (void *)gLogger_0;
  if (os_log_type_enabled((os_log_t)gLogger_0, OS_LOG_TYPE_DEBUG)) {
    +[_ANESandboxingHelper consumeSandboxExtension:forPath:error:](v13, a2);
  }
  int64_t v11 = -1;
LABEL_15:

  return v11;
}

+ (id)issueSandboxExtensionForPath:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = +[_ANEStrings systemLibraryPath];
  int v8 = [v6 hasPrefix:v7];

  if (+[_ANEDeviceInfo isInternalBuild])
  {
    id v9 = +[_ANEStrings internalLibraryPath];
    int v10 = [v6 hasPrefix:v9];
  }
  else
  {
    int v10 = 0;
  }
  int64_t v11 = +[_ANEStrings noSandboxExtension];
  int64_t v12 = objc_opt_class();
  int v13 = NSStringFromSelector(a2);
  id v27 = 0;
  int v14 = [v12 canAccessPathAt:v6 methodName:v13 error:&v27];
  id v15 = v27;

  if (!v14)
  {
    v19 = (void *)gLogger_0;
    if (os_log_type_enabled((os_log_t)gLogger_0, OS_LOG_TYPE_ERROR))
    {
      v25 = v19;
      uint64_t v26 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v29 = v26;
      __int16 v30 = 2112;
      id v31 = v6;
      __int16 v32 = 2112;
      id v33 = v15;
      _os_log_error_impl(&dword_1DB8AB000, v25, OS_LOG_TYPE_ERROR, "%@: Inaccessible file (%@) : error=%@", buf, 0x20u);

      if (!a4) {
        goto LABEL_13;
      }
    }
    else if (!a4)
    {
      goto LABEL_13;
    }
    *a4 = v15;
    goto LABEL_13;
  }
  if (((v8 | v10) & 1) == 0)
  {
    [v6 UTF8String];
    uint64_t v16 = sandbox_extension_issue_file();
    if (v16)
    {
      v17 = (void *)v16;
      uint64_t v18 = [NSString stringWithUTF8String:v16];

      free(v17);
      int64_t v11 = (void *)v18;
    }
    else
    {
      char v20 = (void *)gLogger_0;
      if (os_log_type_enabled((os_log_t)gLogger_0, OS_LOG_TYPE_ERROR)) {
        +[_ANESandboxingHelper issueSandboxExtensionForPath:error:](v20, a2);
      }
    }
  }
LABEL_13:
  id v21 = (void *)gLogger_0;
  if (os_log_type_enabled((os_log_t)gLogger_0, OS_LOG_TYPE_DEBUG))
  {
    id v23 = v21;
    __int16 v24 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v29 = v24;
    __int16 v30 = 2112;
    id v31 = v6;
    __int16 v32 = 2112;
    id v33 = v11;
    _os_log_debug_impl(&dword_1DB8AB000, v23, OS_LOG_TYPE_DEBUG, "%@: pathStr=%@ sandboxExtension=%@", buf, 0x20u);
  }
  return v11;
}

+ (BOOL)canAccessPathAt:(id)a3 methodName:(id)a4 error:(id *)a5
{
  id v7 = a4;
  int v8 = (void *)MEMORY[0x1E4F28CB8];
  id v9 = a3;
  int v10 = [v8 defaultManager];
  char v11 = [v10 fileExistsAtPath:v9];

  if (a5 && (v11 & 1) == 0)
  {
    *a5 = +[_ANEErrors fileAccessErrorForMethod:v7];
  }

  return v11;
}

+ (BOOL)releaseSandboxExtension:(id)a3 handle:(int64_t)a4
{
  return a4 < 0 || sandbox_extension_release() != -1;
}

+ (void)initialize
{
  gLogger_0 = +[_ANELog common];
  MEMORY[0x1F41817F8]();
}

+ (void)issueSandboxExtensionForPath:(void *)a1 error:(const char *)a2 .cold.1(void *a1, const char *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  v4 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_0_6();
  _os_log_error_impl(&dword_1DB8AB000, v3, OS_LOG_TYPE_ERROR, "%@: sandbox_extension_issue_file() returned NULL. path=%@", v5, 0x16u);
}

+ (void)consumeSandboxExtension:(void *)a1 forPath:(const char *)a2 error:.cold.1(void *a1, const char *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  v4 = NSStringFromSelector(a2);
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_debug_impl(&dword_1DB8AB000, v3, OS_LOG_TYPE_DEBUG, "%@: Sandbox extension is nil/not valid", (uint8_t *)&v5, 0xCu);
}

+ (void)consumeSandboxExtension:(void *)a1 forPath:(const char *)a2 error:.cold.2(void *a1, const char *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  v4 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_0_6();
  _os_log_debug_impl(&dword_1DB8AB000, v3, OS_LOG_TYPE_DEBUG, "%@: Sandbox extension(%@) consumed", v5, 0x16u);
}

@end