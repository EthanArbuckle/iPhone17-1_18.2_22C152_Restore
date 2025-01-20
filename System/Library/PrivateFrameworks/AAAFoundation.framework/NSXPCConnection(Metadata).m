@interface NSXPCConnection(Metadata)
- (__CFString)aaf_processName;
- (id)aaf_bundleID;
- (void)aaf_bundleID;
@end

@implementation NSXPCConnection(Metadata)

- (__CFString)aaf_processName
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v1 = [a1 processIdentifier];
  if (proc_name(v1, buffer, 0x20u) >= 1)
  {
    v2 = NSString;
    v3 = buffer;
LABEL_3:
    v4 = [v2 stringWithUTF8String:v3];
    goto LABEL_5;
  }
  *(void *)v9 = 0xE00000001;
  int v10 = 1;
  int v11 = v1;
  size_t v7 = 648;
  memset(v8, 0, 512);
  int v5 = sysctl(v9, 4u, v8, &v7, 0, 0);
  v4 = 0;
  if (!v5)
  {
    if (BYTE3(v8[15]))
    {
      v3 = (char *)&v8[15] + 3;
      v2 = NSString;
      goto LABEL_3;
    }
    v4 = @"exited?";
  }
LABEL_5:
  return v4;
}

- (id)aaf_bundleID
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [a1 auditToken];
  v2 = SecTaskCreateWithAuditToken(0, &token);
  if (v2)
  {
    v3 = v2;
    CFErrorRef error = 0;
    CFStringRef v4 = SecTaskCopySigningIdentifier(v2, &error);
    int v5 = (void *)v4;
    if (error)
    {
      v6 = _AAFLogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v14 = a1;
        __int16 v15 = 2112;
        v16 = v3;
        __int16 v17 = 2112;
        CFErrorRef v18 = error;
        _os_log_error_impl(&dword_1DD937000, v6, OS_LOG_TYPE_ERROR, "%@: Failed to copy signing ID from task (%@) with error (%@)", buf, 0x20u);
      }

      CFRelease(error);
      if (!v5) {
        goto LABEL_15;
      }
      CFRelease(v5);
    }
    else
    {
      if (v4)
      {
LABEL_15:
        CFRelease(v3);
        goto LABEL_16;
      }
      v8 = _AAFLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        [(NSXPCConnection(Metadata) *)(uint64_t)a1 aaf_bundleID];
      }
    }
    int v5 = 0;
    goto LABEL_15;
  }
  size_t v7 = _AAFLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    [(NSXPCConnection(Metadata) *)(uint64_t)a1 aaf_bundleID];
  }

  int v5 = 0;
LABEL_16:
  if (![v5 length])
  {
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"UNKNOWN-%0000x", arc4random_uniform(0xFFFFu));

    int v5 = (void *)v9;
  }
  return v5;
}

- (void)aaf_bundleID
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DD937000, a2, OS_LOG_TYPE_ERROR, "%@: Failed to retrieve signing ID (using framework-provided identifier)", (uint8_t *)&v2, 0xCu);
}

@end