@interface SLYahooWebAuthController
- (id)_extentionIdentifier;
- (id)_webClient;
@end

@implementation SLYahooWebAuthController

- (id)_webClient
{
  v2 = objc_alloc_init(SLYahooWebClient);

  return v2;
}

- (id)_extentionIdentifier
{
  return @"com.apple.social.SLYahooAuth.SLYahooAuthService";
}

@end