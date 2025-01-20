@interface HUStoreUtilities
+ (NSString)accessoryStoreButtonTitle;
+ (NSURL)accessoryStoreURL;
@end

@implementation HUStoreUtilities

+ (NSURL)accessoryStoreURL
{
  v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v3 = [v2 countryCode];
  v4 = (void *)v3;
  v5 = &stru_1F18F92B8;
  if (v3) {
    v5 = (__CFString *)v3;
  }
  v6 = v5;

  v7 = (void *)MEMORY[0x1E4F1CB10];
  v8 = [NSString stringWithFormat:@"https://apple.com/go/homekit/accessories/%@", v6];

  v9 = [v7 URLWithString:v8];

  return (NSURL *)v9;
}

+ (NSString)accessoryStoreButtonTitle
{
  return (NSString *)_HULocalizedStringWithDefaultValue(@"HUAccessoryStoreButtonTitle", @"HUAccessoryStoreButtonTitle", 1);
}

@end