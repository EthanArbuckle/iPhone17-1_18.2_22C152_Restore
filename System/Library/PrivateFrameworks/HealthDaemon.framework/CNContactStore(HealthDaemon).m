@interface CNContactStore(HealthDaemon)
+ (id)_healthAppTCCIdentity;
+ (id)hd_contactStoreWithHealthAppIdentity;
+ (uint64_t)hd_authorizationStatusForHealthApp;
@end

@implementation CNContactStore(HealthDaemon)

+ (id)hd_contactStoreWithHealthAppIdentity
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1B990]);
  v1 = [(id)objc_opt_class() _healthAppTCCIdentity];
  [v0 setAssumedIdentity:v1];

  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithConfiguration:v0];

  return v2;
}

+ (id)_healthAppTCCIdentity
{
  [(id)*MEMORY[0x1E4F2BDC0] UTF8String];
  id v0 = (void *)tcc_identity_create();

  return v0;
}

+ (uint64_t)hd_authorizationStatusForHealthApp
{
  id v0 = [(id)objc_opt_class() _healthAppTCCIdentity];
  if (v0) {
    uint64_t v1 = [(id)objc_opt_class() authorizationStatusForEntityType:0 assumedIdentity:v0];
  }
  else {
    uint64_t v1 = 0;
  }

  return v1;
}

@end