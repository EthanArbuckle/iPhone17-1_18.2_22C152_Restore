@interface CDFormattedDate
@end

@implementation CDFormattedDate

uint64_t ___CDFormattedDate_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_CDFormattedDate_formatter;
  _CDFormattedDate_formatter = (uint64_t)v0;

  [(id)_CDFormattedDate_formatter setTimeStyle:3];
  v2 = (void *)_CDFormattedDate_formatter;
  return [v2 setDateStyle:1];
}

@end