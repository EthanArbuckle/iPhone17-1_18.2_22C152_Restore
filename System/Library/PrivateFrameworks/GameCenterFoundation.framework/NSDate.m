@interface NSDate
@end

@implementation NSDate

uint64_t __58__NSDate_GKExtensions___gkFormattedDateForStyle_relative___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_gkFormattedDateForStyle_relative__sDateFormatter;
  _gkFormattedDateForStyle_relative__sDateFormatter = (uint64_t)v0;

  v2 = (void *)_gkFormattedDateForStyle_relative__sDateFormatter;

  return [v2 setTimeStyle:0];
}

@end