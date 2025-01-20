@interface CRKMDMIdentityProvider
+ (CRKIdentity)identity;
+ (id)new;
+ (void)identity;
- (CRKMDMIdentityProvider)init;
@end

@implementation CRKMDMIdentityProvider

+ (CRKIdentity)identity
{
  v2 = CFBundleCreate(0, (CFURLRef)[NSURL fileURLWithPath:@"/System/Library/PrivateFrameworks/ManagedConfiguration.framework"]);
  v3 = v2;
  if (v2)
  {
    if (CFBundleLoadExecutable(v2))
    {
      FunctionPointerForName = (uint64_t (*)(void))CFBundleGetFunctionPointerForName(v3, @"MCMDMFilePath");
      if (FunctionPointerForName)
      {
        v5 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:FunctionPointerForName()];
        v6 = [MEMORY[0x263F08AC0] propertyListWithData:v5 options:0 format:0 error:0];
        v7 = [v6 valueForKey:*MEMORY[0x263F529F0]];
        if (v7)
        {
          v8 = +[CRKKeychainProvider sharedProvider];
          v9 = [v8 keychain];
          v10 = [v9 identityWithPersistentID:v7];
        }
        else
        {
          v10 = 0;
        }

LABEL_12:
        CFRelease(v3);
        goto LABEL_13;
      }
    }
  }
  v11 = _CRKLogGeneral_4();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    +[CRKMDMIdentityProvider identity](v11);
  }

  v10 = 0;
  if (v3) {
    goto LABEL_12;
  }
LABEL_13:

  return (CRKIdentity *)v10;
}

- (CRKMDMIdentityProvider)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"CRKMDMIdentityProvider.m", 83, @"%@ is unavailable for %@", v5, self object file lineNumber description];

  return 0;
}

+ (id)new
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, a1, @"CRKMDMIdentityProvider.m", 88, @"%@ is unavailable for %@", v5, a1 object file lineNumber description];

  return 0;
}

+ (void)identity
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_224C00000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch the MDM identity %{public}@", (uint8_t *)&v2, 0xCu);
}

@end