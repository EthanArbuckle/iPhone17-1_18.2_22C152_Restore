@interface NSBundle(SafariServicesExtras)
+ (id)_sf_safariServicesBundle;
@end

@implementation NSBundle(SafariServicesExtras)

+ (id)_sf_safariServicesBundle
{
  if (_sf_safariServicesBundle_onceToken != -1) {
    dispatch_once(&_sf_safariServicesBundle_onceToken, &__block_literal_global_70);
  }
  v0 = (void *)_sf_safariServicesBundle_bundle;

  return v0;
}

@end