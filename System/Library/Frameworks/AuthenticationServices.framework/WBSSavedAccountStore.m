@interface WBSSavedAccountStore
@end

@implementation WBSSavedAccountStore

uint64_t __62__WBSSavedAccountStore_WebsiteNameExtras__websiteNameProvider__block_invoke()
{
  id v0 = [[_ASWebsiteNameProvider alloc] initForPasswordManager];
  v1 = (void *)websiteNameProvider_websiteNameProvider;
  websiteNameProvider_websiteNameProvider = (uint64_t)v0;

  v2 = (void *)websiteNameProvider_websiteNameProvider;

  return [v2 beginLoadingBuiltInAndRemotelyUpdatableWebsiteNames];
}

@end