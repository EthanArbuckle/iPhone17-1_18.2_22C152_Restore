@interface MULibraryUIUtilities
+ (BOOL)isMyPlacesEnabled;
@end

@implementation MULibraryUIUtilities

+ (BOOL)isMyPlacesEnabled
{
  if (qword_1EB4F7248 != -1) {
    dispatch_once(&qword_1EB4F7248, &__block_literal_global_45);
  }
  return _MergedGlobals_132;
}

uint64_t __41__MULibraryUIUtilities_isMyPlacesEnabled__block_invoke()
{
  uint64_t result = MapsFeature_IsEnabled_MyPlacesFeatures();
  _MergedGlobals_132 = result;
  return result;
}

@end