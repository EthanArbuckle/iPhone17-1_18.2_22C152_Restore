@interface INIntent(ACSCardRequesting)
- (uint64_t)acs_needsTitleCardSection;
- (uint64_t)servicePriorityForCardRequest:()ACSCardRequesting;
- (void)requestCard:()ACSCardRequesting reply:;
@end

@implementation INIntent(ACSCardRequesting)

- (uint64_t)acs_needsTitleCardSection
{
  v1 = [a1 extensionBundleId];
  uint64_t v2 = [v1 isEqualToString:@"com.apple.PassKit.PassKitIntentsExtension"] ^ 1;

  return v2;
}

- (void)requestCard:()ACSCardRequesting reply:
{
  v15[1] = *MEMORY[0x263EF8340];
  v6 = (void *)MEMORY[0x263F087E8];
  uint64_t v7 = *MEMORY[0x263F31628];
  uint64_t v14 = *MEMORY[0x263F07F80];
  v8 = NSString;
  v9 = a4;
  v10 = [a3 content];
  v11 = [v8 stringWithFormat:@"Content %@ is incompatible with this service", v10, v14];
  v15[0] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v13 = [v6 errorWithDomain:v7 code:400 userInfo:v12];
  ((void (**)(void, void, void *))a4)[2](v9, 0, v13);
}

- (uint64_t)servicePriorityForCardRequest:()ACSCardRequesting
{
  return 0;
}

@end