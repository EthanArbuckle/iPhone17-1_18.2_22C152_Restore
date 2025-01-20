@interface MTTimer
@end

@implementation MTTimer

uint64_t __49__MTTimer_HFAdditions__hf_targetAccessoryInHome___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 uniqueIdentifier];
  uint64_t v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  return v4;
}

@end