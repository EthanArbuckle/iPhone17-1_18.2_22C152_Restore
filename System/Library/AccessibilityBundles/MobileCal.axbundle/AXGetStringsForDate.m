@interface AXGetStringsForDate
@end

@implementation AXGetStringsForDate

void ___AXGetStringsForDate_block_invoke(void *a1)
{
  v2 = (void *)a1[6];
  uint64_t v3 = a1[4];
  MEMORY[0x245654930]();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v2 overlayShortStringForDate:v3 inCalendar:v7];
  uint64_t v5 = *(void *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

@end