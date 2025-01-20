@interface HMFMessage(LocationMessage)
+ (id)homeLocationAuthorizedAndEntitledMessageWithName:()LocationMessage target:messagePayload:;
+ (id)locationAuthorizedMessageWithName:()LocationMessage messagePayload:;
- (uint64_t)isLocationAuthorized;
- (uint64_t)requiresHomeLocationEntitlement;
@end

@implementation HMFMessage(LocationMessage)

- (uint64_t)requiresHomeLocationEntitlement
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:@"HMDMessageRequiresHomeLocationEntitlement"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  uint64_t v5 = [v4 BOOLValue];
  return v5;
}

- (uint64_t)isLocationAuthorized
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:@"locationAuthorized"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  uint64_t v5 = [v4 BOOLValue];
  return v5;
}

+ (id)homeLocationAuthorizedAndEntitledMessageWithName:()LocationMessage target:messagePayload:
{
  v7 = (void *)MEMORY[0x1E4F654B0];
  id v8 = a4;
  v9 = [v7 entitledMessageWithName:a3 messagePayload:a5];
  uint64_t v10 = MEMORY[0x1E4F1CC38];
  [v9 setUserInfoValue:MEMORY[0x1E4F1CC38] forKey:@"locationAuthorized"];
  [v9 setUserInfoValue:v10 forKey:@"HMDMessageRequiresHomeLocationEntitlement"];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F65488]) initWithTarget:v8];

  [v9 setDestination:v11];
  v12 = (void *)[v9 copy];

  return v12;
}

+ (id)locationAuthorizedMessageWithName:()LocationMessage messagePayload:
{
  v0 = objc_msgSend(MEMORY[0x1E4F654B0], "messageWithName:messagePayload:");
  [v0 setUserInfoValue:MEMORY[0x1E4F1CC38] forKey:@"locationAuthorized"];
  v1 = (void *)[v0 copy];

  return v1;
}

@end