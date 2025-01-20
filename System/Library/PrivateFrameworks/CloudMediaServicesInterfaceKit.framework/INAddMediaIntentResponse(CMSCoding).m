@interface INAddMediaIntentResponse(CMSCoding)
+ (id)instanceFromCMSCoded:()CMSCoding;
- (id)cmsCoded;
@end

@implementation INAddMediaIntentResponse(CMSCoding)

+ (id)instanceFromCMSCoded:()CMSCoding
{
  v3 = cmsSafeDictionary(a3);
  v4 = v3;
  if (v3)
  {
    v5 = [v3 cmsOptionalStringForKey:@"code"];
    uint64_t v6 = INAddMediaIntentResponseCodeFromString(v5);

    v7 = [v4 cmsOptionalDecodedClass:objc_opt_class() forKey:@"userActivity"];
    v8 = (void *)[objc_alloc(MEMORY[0x263F0F940]) initWithCode:v6 userActivity:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)cmsCoded
{
  v8.receiver = a1;
  v8.super_class = (Class)&off_26DE6D778;
  v2 = objc_msgSendSuper2(&v8, sel_cmsCoded);
  [v2 setObject:@"AddMediaIntentResponse" forKey:@"class"];
  v3 = [a1 userActivity];
  v4 = v3;
  if (v3) {
    [v3 cmsCoded];
  }
  else {
  v5 = [MEMORY[0x263EFF9D0] null];
  }
  [v2 setObject:v5 forKey:@"userActivity"];

  uint64_t v6 = INAddMediaIntentResponseCodeToString([a1 code]);
  [v2 setObject:v6 forKey:@"code"];

  return v2;
}

@end