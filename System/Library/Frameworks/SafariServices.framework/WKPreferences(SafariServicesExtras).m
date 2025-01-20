@interface WKPreferences(SafariServicesExtras)
- (void)sf_applySafariStorageBlockingPolicy;
@end

@implementation WKPreferences(SafariServicesExtras)

- (void)sf_applySafariStorageBlockingPolicy
{
  id v4 = [MEMORY[0x1E4F18D30] sharedHTTPCookieStorage];
  unint64_t v2 = [v4 cookieAcceptPolicy] - 1;
  if (v2 > 2) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = qword_1A6A8A780[v2];
  }
  [a1 _setStorageBlockingPolicy:v3];
}

@end