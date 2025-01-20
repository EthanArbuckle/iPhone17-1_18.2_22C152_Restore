@interface TitleForExpirationDate
@end

@implementation TitleForExpirationDate

uint64_t ___TitleForExpirationDate_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_TitleForExpirationDate_dateFormatter;
  _TitleForExpirationDate_dateFormatter = (uint64_t)v0;

  [(id)_TitleForExpirationDate_dateFormatter setTimeStyle:0];
  [(id)_TitleForExpirationDate_dateFormatter setLocalizedDateFormatFromTemplate:@"MMMd"];
  v2 = (void *)_TitleForExpirationDate_dateFormatter;

  return [v2 setFormattingContext:5];
}

@end