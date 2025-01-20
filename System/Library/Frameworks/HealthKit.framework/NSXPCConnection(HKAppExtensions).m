@interface NSXPCConnection(HKAppExtensions)
- (BOOL)hk_isAppExtension;
@end

@implementation NSXPCConnection(HKAppExtensions)

- (BOOL)hk_isAppExtension
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [a1 auditToken];
  v2 = +[_HKXPCAuditToken signingIdentifierFromAuditToken:v10];
  if (v2)
  {
    id v9 = 0;
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F223A0]) initWithBundleIdentifier:v2 error:&v9];
    id v4 = v9;
    v5 = v4;
    if (v4)
    {
      if ((objc_msgSend(v4, "hk_isErrorInDomain:code:", *MEMORY[0x1E4F28760], -10814) & 1) == 0)
      {
        _HKInitializeLogging();
        v6 = HKLogDefault;
        if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v12 = a1;
          __int16 v13 = 2114;
          v14 = v2;
          __int16 v15 = 2114;
          v16 = v5;
          _os_log_error_impl(&dword_19C023000, v6, OS_LOG_TYPE_ERROR, "Failed to create bundle record for connection %{public}@ with bundleID %{public}@, error %{public}@", buf, 0x20u);
        }
      }
    }
    BOOL v7 = v3 != 0;
  }
  else
  {
    v5 = 0;
    BOOL v7 = 0;
  }

  return v7;
}

@end