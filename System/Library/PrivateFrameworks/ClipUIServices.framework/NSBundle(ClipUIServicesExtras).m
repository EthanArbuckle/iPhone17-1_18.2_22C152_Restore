@interface NSBundle(ClipUIServicesExtras)
+ (id)cps_clipUIServicesBundle;
@end

@implementation NSBundle(ClipUIServicesExtras)

+ (id)cps_clipUIServicesBundle
{
  if (cps_clipUIServicesBundle_onceToken != -1) {
    dispatch_once(&cps_clipUIServicesBundle_onceToken, &__block_literal_global);
  }
  v0 = (void *)cps_clipUIServicesBundle_bundle;

  return v0;
}

@end