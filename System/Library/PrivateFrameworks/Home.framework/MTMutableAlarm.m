@interface MTMutableAlarm
@end

@implementation MTMutableAlarm

uint64_t __71__MTMutableAlarm_HFAdditions__hf_moveToRoom_withMediaProfileContainer___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 room];
  v4 = [v3 uniqueIdentifier];
  v5 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v6 = objc_msgSend(v4, "hmf_isEqualToUUID:", v5);

  return v6;
}

@end