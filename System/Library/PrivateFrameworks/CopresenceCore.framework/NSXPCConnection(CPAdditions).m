@interface NSXPCConnection(CPAdditions)
- (__CFString)cp_clientProcessBundleIdentifier;
- (id)cp_clientProcessName;
- (uint64_t)cp_clientSandboxCanAccessFileURL:()CPAdditions;
@end

@implementation NSXPCConnection(CPAdditions)

- (id)cp_clientProcessName
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

- (__CFString)cp_clientProcessBundleIdentifier
{
  memset(&v5[1], 0, sizeof(audit_token_t));
  [a1 auditToken];
  v5[0] = v5[1];
  v1 = SecTaskCreateWithAuditToken(0, v5);
  if (v1)
  {
    v2 = v1;
    long long v3 = (__CFString *)SecTaskCopySigningIdentifier(v1, 0);
    CFRelease(v2);
  }
  else
  {
    long long v3 = 0;
  }
  return v3;
}

- (uint64_t)cp_clientSandboxCanAccessFileURL:()CPAdditions
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  [a1 auditToken];
  if ([v4 isFileURL])
  {
    id v10 = 0;
    char v5 = [v4 checkResourceIsReachableAndReturnError:&v10];
    v6 = v10;
    if (v5)
    {
      if ([v4 fileSystemRepresentation])
      {
        if (!sandbox_check_by_audit_token())
        {
          uint64_t v8 = 1;
          goto LABEL_15;
        }
        v7 = CPDefaultLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          -[NSXPCConnection(CPAdditions) cp_clientSandboxCanAccessFileURL:](v7);
        }
      }
      else
      {
        v7 = CPDefaultLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          -[NSXPCConnection(CPAdditions) cp_clientSandboxCanAccessFileURL:]();
        }
      }
    }
    else
    {
      v7 = CPDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[NSXPCConnection(CPAdditions) cp_clientSandboxCanAccessFileURL:]();
      }
    }
  }
  else
  {
    v6 = CPDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[NSXPCConnection(CPAdditions) cp_clientSandboxCanAccessFileURL:].cold.4();
    }
  }
  uint64_t v8 = 0;
LABEL_15:

  return v8;
}

- (void)cp_clientSandboxCanAccessFileURL:()CPAdditions .cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1B0DF7000, v0, v1, "%s Could not get file system representation for URL: %@", v2, v3, v4, v5, 2u);
}

- (void)cp_clientSandboxCanAccessFileURL:()CPAdditions .cold.2(NSObject *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v2 = *__error();
  uint64_t v3 = __error();
  uint64_t v4 = strerror(*v3);
  int v5 = 136315650;
  v6 = "-[NSXPCConnection(CPAdditions) cp_clientSandboxCanAccessFileURL:]";
  __int16 v7 = 1024;
  int v8 = v2;
  __int16 v9 = 2080;
  id v10 = v4;
  _os_log_error_impl(&dword_1B0DF7000, a1, OS_LOG_TYPE_ERROR, "%s Client sandbox does not have access to the given file! (Error %i: %s)", (uint8_t *)&v5, 0x1Cu);
}

- (void)cp_clientSandboxCanAccessFileURL:()CPAdditions .cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1B0DF7000, v0, v1, "%s URL resource is not reachable: %@", v2, v3, v4, v5, 2u);
}

- (void)cp_clientSandboxCanAccessFileURL:()CPAdditions .cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1B0DF7000, v0, v1, "%s URL is not a file system URL: %@", v2, v3, v4, v5, 2u);
}

@end