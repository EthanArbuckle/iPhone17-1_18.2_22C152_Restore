@interface NSBundle(GeoServicesBundle)
+ (id)__geoBundle;
@end

@implementation NSBundle(GeoServicesBundle)

+ (id)__geoBundle
{
  if (qword_1EB2A01D0 != -1) {
    dispatch_once(&qword_1EB2A01D0, &__block_literal_global_150);
  }
  v0 = (void *)_MergedGlobals_291;

  return v0;
}

@end