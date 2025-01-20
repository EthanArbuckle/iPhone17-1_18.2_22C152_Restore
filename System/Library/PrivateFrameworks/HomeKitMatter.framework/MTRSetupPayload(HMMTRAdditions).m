@interface MTRSetupPayload(HMMTRAdditions)
- (uint64_t)isEqualAsOnboarding:()HMMTRAdditions;
@end

@implementation MTRSetupPayload(HMMTRAdditions)

- (uint64_t)isEqualAsOnboarding:()HMMTRAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 qrCodeString:0];
  uint64_t v6 = [v4 qrCodeString:0];
  if (v5 | v6 && ![(id)v5 isEqual:v6])
  {
    uint64_t v9 = 0;
  }
  else
  {
    v7 = [a1 manualEntryCode];
    v8 = [v4 manualEntryCode];
    uint64_t v9 = [v7 isEqual:v8];
  }
  return v9;
}

@end