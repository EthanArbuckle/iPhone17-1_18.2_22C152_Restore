@interface NSDateFormatter
@end

@implementation NSDateFormatter

uint64_t __58__NSDateFormatter_MessageUIAdditions__ef_isoDateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28D48]);
  v1 = (void *)ef_isoDateFormatter_dateFormatter;
  ef_isoDateFormatter_dateFormatter = (uint64_t)v0;

  v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v3 = [v2 timeZone];
  [(id)ef_isoDateFormatter_dateFormatter setTimeZone:v3];

  v4 = (void *)ef_isoDateFormatter_dateFormatter;
  return [v4 setFormatOptions:3955];
}

@end