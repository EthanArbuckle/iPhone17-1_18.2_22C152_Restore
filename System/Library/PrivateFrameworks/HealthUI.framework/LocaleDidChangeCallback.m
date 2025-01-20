@interface LocaleDidChangeCallback
@end

@implementation LocaleDidChangeCallback

void ___LocaleDidChangeCallback_block_invoke()
{
  v0 = (void *)__thisYearDateFormatter;
  __thisYearDateFormatter = 0;

  v1 = (void *)__timeFormatter;
  __timeFormatter = 0;
}

@end