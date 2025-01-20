@interface NSDate
@end

@implementation NSDate

uint64_t __37__NSDate_RTExtensions__dateFormatter__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_MergedGlobals_10;
  _MergedGlobals_10 = v0;

  v2 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [(id)_MergedGlobals_10 setLocale:v2];

  [(id)_MergedGlobals_10 setDateStyle:1];
  v3 = (void *)_MergedGlobals_10;
  return [v3 setTimeStyle:3];
}

@end