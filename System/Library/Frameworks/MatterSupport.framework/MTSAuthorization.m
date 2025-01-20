@interface MTSAuthorization
+ (BOOL)isDeveloperModeEnabled;
- (BOOL)allowsRestrictedCharacteristicsAccessViaDeveloperModeProfile;
- (BOOL)allowsRestrictedCharacteristicsAccessViaSkipDeveloperModeRestrictionProfile;
- (BOOL)isRestrictedCharacteristicsAccessAllowed;
- (MTSAuthorization)init;
- (MTSAuthorization)initWithServerProxy:(id)a3;
- (MTSXPCServerProxy)serverProxy;
@end

@implementation MTSAuthorization

- (void).cxx_destruct
{
}

- (MTSXPCServerProxy)serverProxy
{
  return (MTSXPCServerProxy *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)allowsRestrictedCharacteristicsAccessViaSkipDeveloperModeRestrictionProfile
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v2 = [(MTSAuthorization *)self serverProxy];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __95__MTSAuthorization_allowsRestrictedCharacteristicsAccessViaSkipDeveloperModeRestrictionProfile__block_invoke;
  v4[3] = &unk_2651C5B58;
  v4[4] = &v5;
  [v2 checkRestrictedCharacteristicsAccessAllowedWithCompletionHandler:v4];

  LOBYTE(v2) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __95__MTSAuthorization_allowsRestrictedCharacteristicsAccessViaSkipDeveloperModeRestrictionProfile__block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)allowsRestrictedCharacteristicsAccessViaDeveloperModeProfile
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  LODWORD(Int64) = [(id)objc_opt_class() isDeveloperModeEnabled];
  if (Int64)
  {
    uint64_t Int64 = CFPrefs_GetInt64();
    if (Int64)
    {
      v4 = [(MTSAuthorization *)self serverProxy];
      [v4 showRestrictedCharacteristicsAccessWarningAlert];

      LOBYTE(Int64) = 1;
    }
  }
  return Int64;
}

- (BOOL)isRestrictedCharacteristicsAccessAllowed
{
  if ([(MTSAuthorization *)self allowsRestrictedCharacteristicsAccessViaDeveloperModeProfile])
  {
    return 1;
  }

  return [(MTSAuthorization *)self allowsRestrictedCharacteristicsAccessViaSkipDeveloperModeRestrictionProfile];
}

- (MTSAuthorization)initWithServerProxy:(id)a3
{
  v4 = (MTSXPCServerProxy *)a3;
  v8.receiver = self;
  v8.super_class = (Class)MTSAuthorization;
  uint64_t v5 = [(MTSAuthorization *)&v8 init];
  serverProxy = v5->_serverProxy;
  v5->_serverProxy = v4;

  return v5;
}

- (MTSAuthorization)init
{
  v3 = objc_alloc_init(MTSXPCServerProxy);
  v4 = [(MTSAuthorization *)self initWithServerProxy:v3];

  return v4;
}

+ (BOOL)isDeveloperModeEnabled
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  size_t v11 = 8;
  uint64_t v12 = 0;
  int v3 = sysctlbyname("security.mac.amfi.developer_mode_status", &v12, &v11, 0, 0);
  if (v3)
  {
    int v4 = v3;
    uint64_t v5 = (void *)MEMORY[0x245697870]();
    id v6 = a1;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_super v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v14 = v8;
      __int16 v15 = 1024;
      int v16 = v4;
      _os_log_impl(&dword_2450FD000, v7, OS_LOG_TYPE_ERROR, "%{public}@Received bad status from sysctl for developer mode check: %d", buf, 0x12u);
    }
    LOBYTE(v9) = 0;
  }
  else
  {
    return v12 == 1;
  }
  return v9;
}

@end