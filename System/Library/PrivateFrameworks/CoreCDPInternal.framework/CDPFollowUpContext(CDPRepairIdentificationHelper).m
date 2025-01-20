@interface CDPFollowUpContext(CDPRepairIdentificationHelper)
- (uint64_t)isDefaultRepairOrSOSCompatibilityFollowUp;
@end

@implementation CDPFollowUpContext(CDPRepairIdentificationHelper)

- (uint64_t)isDefaultRepairOrSOSCompatibilityFollowUp
{
  v2 = [a1 followUpType];
  if ([v2 isEqualToString:*MEMORY[0x263F34318]] && !objc_msgSend(a1, "repairType"))
  {
    uint64_t v4 = 1;
  }
  else
  {
    v3 = [a1 followUpType];
    uint64_t v4 = [v3 isEqualToString:*MEMORY[0x263F34310]];
  }
  return v4;
}

@end