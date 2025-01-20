@interface IMSandboxedFileURL
+ (Class)resourceClass;
- (IMSandboxedFileURL)initWithFileURL:(id)a3;
- (IMSandboxedFileURL)initWithFileURL:(id)a3 destinationProcessPID:(int)a4;
- (char)_sandboxExtensionForAuditToken:(id *)a3;
- (char)_sandboxExtensionForPID:(int)a3;
@end

@implementation IMSandboxedFileURL

- (IMSandboxedFileURL)initWithFileURL:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)IMSandboxedFileURL;
  v4 = [(IMSandboxedFileURL *)&v7 init];
  v5 = v4;
  if (v4) {
    [(IMSandboxedResource *)v4 setResource:a3];
  }
  return v5;
}

- (IMSandboxedFileURL)initWithFileURL:(id)a3 destinationProcessPID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v9.receiver = self;
  v9.super_class = (Class)IMSandboxedFileURL;
  v6 = [(IMSandboxedFileURL *)&v9 init];
  objc_super v7 = v6;
  if (v6)
  {
    [(IMSandboxedResource *)v6 setResource:a3];
    [(IMSandboxedResource *)v7 authorizeForPID:v4];
  }
  return v7;
}

+ (Class)resourceClass
{
  return (Class)objc_opt_class();
}

- (char)_sandboxExtensionForPID:(int)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = [(IMSandboxedResource *)self resource];
  if (!v4)
  {
    if (!IMOSLoggingEnabled()) {
      return 0;
    }
    v12 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    int v13 = 138412290;
    v14 = self;
    objc_super v9 = "Unable to authorize protected resource (resource is nil) for %@";
    v10 = v12;
    uint32_t v11 = 12;
    goto LABEL_9;
  }
  uint64_t v5 = objc_msgSend((id)objc_msgSend(v4, "path"), "UTF8String");
  result = (char *)sandbox_extension_issue_file_to_process_by_pid();
  if (result) {
    return result;
  }
  if (IMOSLoggingEnabled())
  {
    objc_super v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = *__error();
      int v13 = 138412802;
      v14 = self;
      __int16 v15 = 2080;
      uint64_t v16 = v5;
      __int16 v17 = 1024;
      int v18 = v8;
      objc_super v9 = "Unable to authorize protected resource (sandbox extension is NULL) %@ (file path: %s) errno %d";
      v10 = v7;
      uint32_t v11 = 28;
LABEL_9:
      _os_log_impl(&dword_1A0772000, v10, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v13, v11);
    }
  }
  return 0;
}

- (char)_sandboxExtensionForAuditToken:(id *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = [(IMSandboxedResource *)self resource];
  if (!v5)
  {
    if (!IMOSLoggingEnabled()) {
      return 0;
    }
    v14 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    *(_DWORD *)__int16 v15 = 138412290;
    *(void *)&v15[4] = self;
    uint32_t v11 = "Unable to authorize protected resource (resource is nil) for %@";
    v12 = v14;
    uint32_t v13 = 12;
    goto LABEL_9;
  }
  uint64_t v6 = objc_msgSend((id)objc_msgSend(v5, "path"), "UTF8String");
  long long v7 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)__int16 v15 = *(_OWORD *)a3->var0;
  *(_OWORD *)&v15[16] = v7;
  result = (char *)sandbox_extension_issue_file_to_process();
  if (result) {
    return result;
  }
  if (IMOSLoggingEnabled())
  {
    objc_super v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = *__error();
      *(_DWORD *)__int16 v15 = 138412802;
      *(void *)&v15[4] = self;
      *(_WORD *)&v15[12] = 2080;
      *(void *)&v15[14] = v6;
      *(_WORD *)&v15[22] = 1024;
      *(_DWORD *)&v15[24] = v10;
      uint32_t v11 = "Unable to authorize protected resource (sandbox extension is NULL) %@ (file path: %s) errno %d";
      v12 = v9;
      uint32_t v13 = 28;
LABEL_9:
      _os_log_impl(&dword_1A0772000, v12, OS_LOG_TYPE_INFO, v11, v15, v13);
    }
  }
  return 0;
}

@end