@interface NSDateComponentsFormatter
@end

@implementation NSDateComponentsFormatter

uint64_t __74__NSDateComponentsFormatter_HealthUI__hk_fullStyleDateComponentsFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C00]);
  v1 = (void *)hk_fullStyleDateComponentsFormatter___dateComponentsFormatter;
  hk_fullStyleDateComponentsFormatter___dateComponentsFormatter = (uint64_t)v0;

  v2 = (void *)hk_fullStyleDateComponentsFormatter___dateComponentsFormatter;
  return [v2 setUnitsStyle:3];
}

@end