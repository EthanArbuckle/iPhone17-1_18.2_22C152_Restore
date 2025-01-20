@interface NSNumber(HearingCore)
- (uint64_t)localizedFormat;
@end

@implementation NSNumber(HearingCore)

- (uint64_t)localizedFormat
{
  if (localizedFormat_HCNumberFormatterOnceToken != -1) {
    dispatch_once(&localizedFormat_HCNumberFormatterOnceToken, &__block_literal_global_128);
  }
  v2 = (void *)localizedFormat_HCNumberFormatter;
  return [v2 stringFromNumber:a1];
}

@end