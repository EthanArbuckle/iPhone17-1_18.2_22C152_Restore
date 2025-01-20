@interface BCConstants
+ (BOOL)isRunningInMac;
+ (BOOL)isRunningInMacCatalyst;
+ (id)allowedAppleURNs;
@end

@implementation BCConstants

+ (id)allowedAppleURNs
{
  if (qword_2682A3618 != -1) {
    dispatch_once(&qword_2682A3618, &__block_literal_global_5);
  }
  v2 = (void *)qword_2682A3610;

  return v2;
}

void __31__BCConstants_allowedAppleURNs__block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithObjects:", @"urn:biz:b15ed773-9eed-11e7-baa2-7b88b04daa8e", 0);
  v1 = (void *)qword_2682A3610;
  qword_2682A3610 = v0;

  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  if ([v2 BOOLForKey:@"AllowsInternalTestURIs"]) {
    BOOL v3 = CFPreferencesAppValueIsForced(@"AllowsInternalTestURIs", (CFStringRef)*MEMORY[0x263EFFE60]) != 0;
  }
  else {
    BOOL v3 = 0;
  }

  if ((MEMORY[0x22A6A8300]("+[BCConstants allowedAppleURNs]_block_invoke") & 1) != 0 || v3)
  {
    id v6 = [(id)qword_2682A3610 setByAddingObjectsFromArray:&unk_26DD2FCF0];
    uint64_t v4 = [v6 copy];
    v5 = (void *)qword_2682A3610;
    qword_2682A3610 = v4;
  }
}

+ (BOOL)isRunningInMacCatalyst
{
  return 0;
}

+ (BOOL)isRunningInMac
{
  return 0;
}

@end