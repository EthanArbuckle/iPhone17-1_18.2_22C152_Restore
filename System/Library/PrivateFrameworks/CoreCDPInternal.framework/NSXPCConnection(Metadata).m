@interface NSXPCConnection(Metadata)
- (__CFString)processName;
- (id)bundleID;
- (void)bundleID;
@end

@implementation NSXPCConnection(Metadata)

- (__CFString)processName
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  size_t v4 = 648;
  memset(v5, 0, 512);
  dword_26AC0B4D4 = [a1 processIdentifier];
  int v1 = sysctl(processName_name, 4u, v5, &v4, 0, 0);
  v2 = @"unknown";
  if (!v1 && BYTE3(v5[15]))
  {
    v2 = [NSString stringWithUTF8String:(char *)&v5[15] + 3];
  }
  return v2;
}

- (id)bundleID
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  [a1 auditToken];
  v2 = SecTaskCreateWithAuditToken(0, &token);
  if (v2)
  {
    v3 = v2;
    CFErrorRef error = 0;
    CFStringRef v4 = SecTaskCopySigningIdentifier(v2, &error);
    v5 = (void *)v4;
    if (error)
    {
      uint64_t v6 = _CDPLogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v14 = a1;
        __int16 v15 = 2112;
        v16 = v3;
        __int16 v17 = 2112;
        CFErrorRef v18 = error;
        _os_log_error_impl(&dword_218640000, v6, OS_LOG_TYPE_ERROR, "%@: Failed to copy signing ID from task (%@) with error (%@)", buf, 0x20u);
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
      v8 = _CDPLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        [(NSXPCConnection(Metadata) *)(uint64_t)a1 bundleID];
      }
    }
    v5 = 0;
    goto LABEL_15;
  }
  v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    [(NSXPCConnection(Metadata) *)(uint64_t)a1 bundleID];
  }

  v5 = 0;
LABEL_16:
  if (![v5 length])
  {
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"UNKNOWN-%0000x", arc4random_uniform(0xFFFFu));

    v5 = (void *)v9;
  }
  return v5;
}

- (void)bundleID
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_218640000, a2, OS_LOG_TYPE_ERROR, "%@: Failed to retrieve signing ID (using framework-provided identifier)", (uint8_t *)&v2, 0xCu);
}

@end