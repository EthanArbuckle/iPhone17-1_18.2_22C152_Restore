@interface APSigningClientValidator
+ (BOOL)_validateAllowListingForPoolCreation:(id)a3;
+ (BOOL)hasEntitlement:(id)a3;
+ (BOOL)isAllowedClient;
+ (id)mockXPCObject;
+ (void)setMockXPCObject:(id)a3;
@end

@implementation APSigningClientValidator

+ (id)mockXPCObject
{
  id v2 = a1;
  objc_sync_enter(v2);
  id v3 = (id)qword_1EA81B908;
  objc_sync_exit(v2);

  return v3;
}

+ (void)setMockXPCObject:(id)a3
{
  id v4 = a3;
  id obj = a1;
  objc_sync_enter(obj);
  v5 = (void *)qword_1EA81B908;
  qword_1EA81B908 = (uint64_t)v4;

  objc_sync_exit(obj);
}

+ (BOOL)isAllowedClient
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  id v3 = [v2 bundleIdentifier];

  if (v3
    && ([v3 isEqualToString:&stru_1F2EA2540] & 1) == 0
    && +[APSigningClientValidator _validateAllowListingForPoolCreation:](APSigningClientValidator, "_validateAllowListingForPoolCreation:", v3)&& +[APSigningClientValidator hasEntitlement:@"com.apple.ap.signingservice.client"])
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [NSString stringWithFormat:@"Client bundle id %@ is nil, not allow listed or not entitled to use signing service.", v3];
    v6 = APLogForCategory(0x2BuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v9 = v5;
      _os_log_impl(&dword_1D70B2000, v6, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    APSimulateCrash(5, v5, 0);
    BOOL v4 = 0;
  }

  return v4;
}

+ (BOOL)hasEntitlement:(id)a3
{
  id v3 = a3;
  [v3 UTF8String];
  BOOL v4 = (void *)xpc_copy_entitlement_for_self();
  if (v4) {
    goto LABEL_4;
  }
  v5 = +[APSigningClientValidator mockXPCObject];
  if (v5)
  {
    BOOL v4 = xpc_dictionary_get_value(v5, (const char *)[v3 UTF8String]);

LABEL_4:
    LOBYTE(v5) = xpc_BOOL_get_value(v4);
  }
  return (char)v5;
}

+ (BOOL)_validateAllowListingForPoolCreation:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = [@"com.apple.ap.promotedcontentd" sha256hash];
  v8[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  v6 = [v3 sha256hash];

  LOBYTE(v4) = [v5 containsObject:v6];
  return (char)v4;
}

@end