@interface INUpdateMediaAffinityIntentResponse(CMSCoding)
+ (id)instanceFromCMSCoded:()CMSCoding;
- (id)cmsCoded;
@end

@implementation INUpdateMediaAffinityIntentResponse(CMSCoding)

+ (id)instanceFromCMSCoded:()CMSCoding
{
  v3 = cmsSafeDictionary(a3);
  if (v3)
  {
    v4 = [v3 cmsOptionalDecodedClass:objc_opt_class() forKey:@"userActivity"];
    v5 = [v3 cmsOptionalStringForKey:@"code"];
    uint64_t v6 = INUpdateMediaAffinityIntentResponseCodeFromString(v5);

    v7 = (void *)[objc_alloc(MEMORY[0x263F100A8]) initWithCode:v6 userActivity:v4];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)cmsCoded
{
  v8.receiver = a1;
  v8.super_class = (Class)&off_26DE6DD30;
  v2 = objc_msgSendSuper2(&v8, sel_cmsCoded);
  [v2 setObject:@"UpdateMediaAffinityIntentResponse" forKey:@"class"];
  v3 = [a1 userActivity];
  v4 = v3;
  if (v3) {
    [v3 cmsCoded];
  }
  else {
  v5 = [MEMORY[0x263EFF9D0] null];
  }
  [v2 setObject:v5 forKey:@"userActivity"];

  uint64_t v6 = INUpdateMediaAffinityIntentResponseCodeToString([a1 code]);
  [v2 setObject:v6 forKey:@"code"];

  return v2;
}

@end