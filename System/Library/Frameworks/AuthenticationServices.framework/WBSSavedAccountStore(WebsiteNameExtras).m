@interface WBSSavedAccountStore(WebsiteNameExtras)
- (id)websiteNameProvider;
@end

@implementation WBSSavedAccountStore(WebsiteNameExtras)

- (id)websiteNameProvider
{
  if (websiteNameProvider_once != -1) {
    dispatch_once(&websiteNameProvider_once, &__block_literal_global_29);
  }
  v0 = (void *)websiteNameProvider_websiteNameProvider;

  return v0;
}

@end