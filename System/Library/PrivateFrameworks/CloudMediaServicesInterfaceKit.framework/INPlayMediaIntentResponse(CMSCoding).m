@interface INPlayMediaIntentResponse(CMSCoding)
+ (id)instanceFromCMSCoded:()CMSCoding;
- (id)cmsCoded;
@end

@implementation INPlayMediaIntentResponse(CMSCoding)

+ (id)instanceFromCMSCoded:()CMSCoding
{
  v3 = cmsSafeDictionary(a3);
  v4 = v3;
  if (v3)
  {
    v5 = [v3 cmsOptionalDictionaryForKey:@"nowPlayingInfo"];
    v6 = [v4 cmsOptionalDecodedClass:objc_opt_class() forKey:@"userActivity"];
    v7 = [v4 cmsOptionalStringForKey:@"code"];
    uint64_t v8 = INPlayMediaIntentResponseCodeFromString(v7);

    v9 = (void *)[objc_alloc(MEMORY[0x263F0FD50]) initWithCode:v8 userActivity:v6];
    [v9 setNowPlayingInfo:v5];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)cmsCoded
{
  v9.receiver = a1;
  v9.super_class = (Class)&off_26DE6D1E8;
  v2 = objc_msgSendSuper2(&v9, sel_cmsCoded);
  [v2 setObject:@"PlayMediaIntentResponse" forKey:@"class"];
  v3 = [a1 nowPlayingInfo];
  if (v3) {
    [v2 setObject:v3 forKey:@"nowPlayingInfo"];
  }
  v4 = [a1 userActivity];
  v5 = v4;
  if (v4) {
    [v4 cmsCoded];
  }
  else {
  v6 = [MEMORY[0x263EFF9D0] null];
  }
  [v2 setObject:v6 forKey:@"userActivity"];

  v7 = INPlayMediaIntentResponseCodeToString([a1 code]);
  [v2 setObject:v7 forKey:@"code"];

  return v2;
}

@end