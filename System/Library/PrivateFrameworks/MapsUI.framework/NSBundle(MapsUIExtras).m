@interface NSBundle(MapsUIExtras)
+ (id)_mapsuiBundle;
@end

@implementation NSBundle(MapsUIExtras)

+ (id)_mapsuiBundle
{
  if (qword_1EB4F70C8 != -1) {
    dispatch_once(&qword_1EB4F70C8, &__block_literal_global_2);
  }
  v0 = (void *)_MergedGlobals_114;
  return v0;
}

@end