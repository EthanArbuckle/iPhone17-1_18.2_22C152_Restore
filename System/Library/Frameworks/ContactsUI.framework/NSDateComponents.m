@interface NSDateComponents
@end

@implementation NSDateComponents

void __55__NSDateComponents_ABSimplePropertyCell__displayString__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)fullFormatter_43643;
  fullFormatter_43643 = (uint64_t)v0;

  [(id)fullFormatter_43643 setTimeStyle:0];
  [(id)fullFormatter_43643 setDateStyle:3];
  v2 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [(id)fullFormatter_43643 setTimeZone:v2];

  id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v4 = (void *)yearlessFormatter_43642;
  yearlessFormatter_43642 = (uint64_t)v3;

  [(id)yearlessFormatter_43642 setTimeStyle:0];
  [(id)yearlessFormatter_43642 setDateStyle:3];
  id v5 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [(id)yearlessFormatter_43642 setTimeZone:v5];
}

@end