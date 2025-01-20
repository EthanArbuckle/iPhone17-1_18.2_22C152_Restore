@interface ASDBaseClient
- (BOOL)_clientHasASDEntitlement:(uint64_t)a1;
- (BOOL)_clientHasEntitlement:(uint64_t)a1;
- (void)_call:(id)a3 run:(id)a4 error:(id)a5;
@end

@implementation ASDBaseClient

- (BOOL)_clientHasEntitlement:(uint64_t)a1
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  if (a1)
  {
    v4 = SecTaskCreateFromSelf(0);
    if (v4)
    {
      v5 = v4;
      CFErrorRef error = 0;
      CFTypeRef v6 = SecTaskCopyValueForEntitlement(v4, v3, &error);
      if (error && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v11 = objc_opt_class();
        *(_DWORD *)buf = 138412802;
        id v17 = v11;
        __int16 v18 = 2112;
        v19 = v3;
        __int16 v20 = 2112;
        CFErrorRef v21 = error;
        id v12 = v11;
        _os_log_error_impl(&dword_19BF6A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[%@]: Unable to get entitlements: %@ error: %@", buf, 0x20u);

        if (v6) {
          goto LABEL_6;
        }
      }
      else if (v6)
      {
LABEL_6:
        CFTypeID TypeID = CFBooleanGetTypeID();
        BOOL v8 = TypeID == CFGetTypeID(v6) && CFBooleanGetValue((CFBooleanRef)v6) != 0;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          v9 = objc_opt_class();
          *(_DWORD *)buf = 138412802;
          id v17 = v9;
          __int16 v18 = 2112;
          v19 = v3;
          __int16 v20 = 1024;
          LODWORD(v21) = v8;
          id v10 = v9;
          _os_log_impl(&dword_19BF6A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[%@]: We have the entitlement: %@ result: %d", buf, 0x1Cu);
        }
        CFRelease(v6);
        goto LABEL_17;
      }
      BOOL v8 = 0;
LABEL_17:
      CFRelease(v5);
      goto LABEL_18;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = (id)objc_opt_class();
      __int16 v18 = 2112;
      v19 = v3;
      id v14 = v17;
      _os_log_error_impl(&dword_19BF6A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[%@]: No task for entitlement: %@", buf, 0x16u);
    }
  }
  BOOL v8 = 0;
LABEL_18:

  return v8;
}

- (void)_call:(id)a3 run:(id)a4 error:(id)a5
{
  v7 = (void (**)(id, void *))a4;
  id v8 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __33__ASDBaseClient__call_run_error___block_invoke;
  v12[3] = &unk_1E58B2CB8;
  id v9 = v8;
  id v13 = v9;
  id v10 = [a3 remoteObjectProxyWithErrorHandler:v12];
  if (v10)
  {
    v7[2](v7, v10);
  }
  else
  {
    v11 = ASDErrorWithUnderlyingErrorAndInfo(0, @"ASDErrorDomain", 508, 0, 0, 0);
    (*((void (**)(id, void *))v9 + 2))(v9, v11);
  }
}

uint64_t __33__ASDBaseClient__call_run_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_clientHasASDEntitlement:(uint64_t)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    v4 = SecTaskCreateFromSelf(0);
    if (v4)
    {
      v5 = v4;
      CFErrorRef error = 0;
      CFTypeRef v6 = (void *)SecTaskCopyValueForEntitlement(v4, @"com.apple.private.appstored", &error);
      if (error && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v12 = objc_opt_class();
        *(_DWORD *)buf = 138412802;
        id v18 = v12;
        __int16 v19 = 2112;
        id v20 = v3;
        __int16 v21 = 2112;
        CFErrorRef v22 = error;
        id v13 = v12;
        _os_log_error_impl(&dword_19BF6A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[%@]: Unable to get entitlements: %@ error: %@", buf, 0x20u);

        if (v6) {
          goto LABEL_6;
        }
      }
      else if (v6)
      {
LABEL_6:
        CFTypeID TypeID = CFArrayGetTypeID();
        if (TypeID == CFGetTypeID(v6)) {
          int v8 = [v6 containsObject:v3];
        }
        else {
          int v8 = 0;
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          id v10 = objc_opt_class();
          *(_DWORD *)buf = 138412802;
          id v18 = v10;
          __int16 v19 = 2112;
          id v20 = v3;
          __int16 v21 = 1024;
          LODWORD(v22) = v8;
          id v11 = v10;
          _os_log_impl(&dword_19BF6A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[%@]: Results for entitlement: %@ result: %d", buf, 0x1Cu);
        }
        CFRelease(v6);
        goto LABEL_17;
      }
      int v8 = 0;
LABEL_17:
      CFRelease(v5);
      BOOL v9 = v8 != 0;
      goto LABEL_18;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = (id)objc_opt_class();
      __int16 v19 = 2112;
      id v20 = v3;
      id v15 = v18;
      _os_log_error_impl(&dword_19BF6A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[%@]: No task for entitlement: %@", buf, 0x16u);
    }
  }
  BOOL v9 = 0;
LABEL_18:

  return v9;
}

@end