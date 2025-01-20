@interface WKHTTPCookieStore(SafariServicesExtras)
- (void)sf_applySafariCookieStoragePolicy;
@end

@implementation WKHTTPCookieStore(SafariServicesExtras)

- (void)sf_applySafariCookieStoragePolicy
{
  id v2 = [MEMORY[0x1E4F18D30] sharedHTTPCookieStorage];
  objc_msgSend(v2, "webui_applySafariCookieAcceptPolicy");
  objc_msgSend(a1, "_setCookieAcceptPolicy:completionHandler:", objc_msgSend(v2, "cookieAcceptPolicy"), &__block_literal_global_25);
}

@end