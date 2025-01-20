@interface HKActivityCacheComparisonFilter
@end

@implementation HKActivityCacheComparisonFilter

uint64_t __67___HKActivityCacheComparisonFilter_areValidTypes_forKeyPath_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  if ([v4 code] == 76 || objc_msgSend(v4, "code") == 100)
  {
    uint64_t v5 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 3, @"unexpected data type %@", v4);
    uint64_t v5 = 0;
  }

  return v5;
}

@end