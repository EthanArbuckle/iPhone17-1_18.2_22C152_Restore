@interface DMCDateFormatterFactory
+ (id)isoDateFormatter;
+ (id)isoLocalTimeZoneDateFormatter;
@end

@implementation DMCDateFormatterFactory

+ (id)isoDateFormatter
{
  if (isoDateFormatter_onceToken != -1) {
    dispatch_once(&isoDateFormatter_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)isoDateFormatter_dateFormatter;
  return v2;
}

uint64_t __43__DMCDateFormatterFactory_isoDateFormatter__block_invoke()
{
  isoDateFormatter_dateFormatter = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

+ (id)isoLocalTimeZoneDateFormatter
{
  if (isoLocalTimeZoneDateFormatter_onceToken != -1) {
    dispatch_once(&isoLocalTimeZoneDateFormatter_onceToken, &__block_literal_global_2_1);
  }
  v2 = (void *)isoLocalTimeZoneDateFormatter_dateFormatter;
  return v2;
}

uint64_t __56__DMCDateFormatterFactory_isoLocalTimeZoneDateFormatter__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)isoLocalTimeZoneDateFormatter_dateFormatter;
  isoLocalTimeZoneDateFormatter_dateFormatter = v0;

  v2 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  [(id)isoLocalTimeZoneDateFormatter_dateFormatter setTimeZone:v2];

  v3 = (void *)isoLocalTimeZoneDateFormatter_dateFormatter;
  return [v3 setFormatOptions:1907];
}

@end