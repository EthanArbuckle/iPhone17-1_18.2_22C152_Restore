@interface NSLocale(ATXExtras)
+ (BOOL)atx_usesTwelveHourClockWithLocaleIdentifier:()ATXExtras;
+ (uint64_t)atx_usesTwelveHourClock;
@end

@implementation NSLocale(ATXExtras)

+ (uint64_t)atx_usesTwelveHourClock
{
  v2 = [MEMORY[0x1E4F1CA20] preferredLocale];
  v3 = [v2 localeIdentifier];
  uint64_t v4 = objc_msgSend(a1, "atx_usesTwelveHourClockWithLocaleIdentifier:", v3);

  return v4;
}

+ (BOOL)atx_usesTwelveHourClockWithLocaleIdentifier:()ATXExtras
{
  v0 = objc_msgSend(MEMORY[0x1E4F1CA20], "localeWithLocaleIdentifier:");
  id v1 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v1 setLocale:v0];
  [v1 setDateStyle:0];
  [v1 setTimeStyle:1];
  v2 = [v1 dateFormat];
  if ([v2 length])
  {
    unint64_t v3 = 0;
    uint64_t v4 = 0;
    char v5 = 0;
    do
    {
      int v6 = [v2 characterAtIndex:v3];
      if (v6 == 104 || v6 == 75)
      {
        v4 += (v5 & 1) == 0;
      }
      else if (v6 == 39)
      {
        v5 ^= 1u;
      }
      ++v3;
    }
    while (v3 < [v2 length]);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4 != 0;
}

@end