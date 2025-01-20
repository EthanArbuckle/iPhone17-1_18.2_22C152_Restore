@interface HKSampleType(HKMenstrualCycles)
- (BOOL)hkmc_requiresMultipleReplaceConfirmation;
@end

@implementation HKSampleType(HKMenstrualCycles)

- (BOOL)hkmc_requiresMultipleReplaceConfirmation
{
  uint64_t v1 = [a1 code];
  return (unint64_t)(v1 - 91) <= 6 && ((1 << (v1 - 91)) & 0x53) != 0
      || (unint64_t)(v1 - 243) < 2;
}

@end