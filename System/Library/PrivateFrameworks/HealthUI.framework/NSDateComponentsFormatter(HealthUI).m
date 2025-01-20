@interface NSDateComponentsFormatter(HealthUI)
+ (id)hk_fullStyleDateComponentsFormatter;
@end

@implementation NSDateComponentsFormatter(HealthUI)

+ (id)hk_fullStyleDateComponentsFormatter
{
  if (hk_fullStyleDateComponentsFormatter_onceToken != -1) {
    dispatch_once(&hk_fullStyleDateComponentsFormatter_onceToken, &__block_literal_global_676);
  }
  v0 = (void *)hk_fullStyleDateComponentsFormatter___dateComponentsFormatter;
  return v0;
}

@end