@interface NSXPCConnection(CX)
- (__CFString)cx_bundleIdentifier;
- (id)cx_applicationIdentifier;
- (id)cx_capabilities;
- (id)cx_developerTeamIdentifier;
- (id)cx_processName;
- (uint64_t)cx_clientSandboxCanAccessFileURL:()CX;
- (uint64_t)cx_isProcessOnDemandInstallCapable;
@end

@implementation NSXPCConnection(CX)

- (id)cx_applicationIdentifier
{
  v1 = [a1 valueForEntitlement:@"application-identifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (__CFString)cx_bundleIdentifier
{
  memset(&v5[1], 0, sizeof(audit_token_t));
  [a1 auditToken];
  v5[0] = v5[1];
  v1 = SecTaskCreateWithAuditToken(0, v5);
  if (v1)
  {
    id v2 = v1;
    v3 = (__CFString *)SecTaskCopySigningIdentifier(v1, 0);
    CFRelease(v2);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)cx_developerTeamIdentifier
{
  v1 = [a1 valueForEntitlement:@"com.apple.developer.team-identifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (id)cx_processName
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (proc_name(objc_msgSend(a1, "processIdentifier", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0),
         &v3,
         0x100u) < 1)
  {
    v1 = 0;
  }
  else
  {
    v1 = [NSString stringWithUTF8String:&v3];
  }

  return v1;
}

- (uint64_t)cx_isProcessOnDemandInstallCapable
{
  v1 = [a1 valueForEntitlement:@"com.apple.developer.on-demand-install-capable"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = [v1 BOOLValue];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

- (id)cx_capabilities
{
  uint64_t v2 = [MEMORY[0x1E4F1CAD0] set];
  long long v3 = [a1 valueForEntitlement:@"com.apple.callkit"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [MEMORY[0x1E4F1CAD0] setWithArray:v3];

    uint64_t v2 = (void *)v4;
  }

  return v2;
}

- (uint64_t)cx_clientSandboxCanAccessFileURL:()CX
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v33 = 0u;
  long long v34 = 0u;
  [a1 auditToken];
  if ([v4 isFileURL])
  {
    id v32 = 0;
    char v5 = [v4 checkResourceIsReachableAndReturnError:&v32];
    v6 = v32;
    if (v5)
    {
      id v7 = v4;
      if ([v7 fileSystemRepresentation])
      {
        *(_OWORD *)buf = v33;
        *(_OWORD *)&buf[16] = v34;
        if (!sandbox_check_by_audit_token())
        {
          uint64_t v30 = 1;
          goto LABEL_15;
        }
        v8 = CXDefaultLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = *__error();
          v10 = __error();
          v11 = strerror(*v10);
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = v9;
          *(_WORD *)&buf[8] = 2080;
          *(void *)&buf[10] = v11;
          _os_log_impl(&dword_1A6E3A000, v8, OS_LOG_TYPE_DEFAULT, "[WARN] Client sandbox does not have access to the given file! (Error %i: %s)", buf, 0x12u);
        }
      }
      else
      {
        v8 = CXDefaultLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          -[CXServiceClient clientCanAccessSandboxFileURL:]((uint64_t)v7, v8, v24, v25, v26, v27, v28, v29);
        }
      }
    }
    else
    {
      v8 = CXDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[CXServiceClient clientCanAccessSandboxFileURL:]((uint64_t)v6, v8, v18, v19, v20, v21, v22, v23);
      }
    }
  }
  else
  {
    v6 = CXDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CXServiceClient clientCanAccessSandboxFileURL:]((uint64_t)v4, v6, v12, v13, v14, v15, v16, v17);
    }
  }
  uint64_t v30 = 0;
LABEL_15:

  return v30;
}

@end