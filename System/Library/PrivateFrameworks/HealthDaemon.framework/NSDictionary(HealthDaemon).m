@interface NSDictionary(HealthDaemon)
- (uint64_t)hd_validateMetadataKeysAndValuesWithClient:()HealthDaemon error:;
@end

@implementation NSDictionary(HealthDaemon)

- (uint64_t)hd_validateMetadataKeysAndValuesWithClient:()HealthDaemon error:
{
  id v6 = a3;
  v7 = [v6 entitlements];
  uint64_t v8 = [v7 hasPrivateMetadataAccess];

  v9 = [v6 configuration];

  uint64_t v10 = [v9 applicationSDKVersionToken];

  return objc_msgSend(a1, "hk_validateMetadataKeysAndValuesAllowingPrivateMetadataKeys:applicationSDKVersionToken:error:", v8, v10, a4);
}

@end