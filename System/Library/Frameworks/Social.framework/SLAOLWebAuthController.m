@interface SLAOLWebAuthController
- (id)_extentionIdentifier;
- (id)_webClient;
@end

@implementation SLAOLWebAuthController

- (id)_webClient
{
  v2 = objc_alloc_init(SLAOLWebClient);

  return v2;
}

- (id)_extentionIdentifier
{
  return @"com.apple.social.SLYahooAuth.SLYahooAuthService";
}

@end