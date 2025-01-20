@interface HFTriggerActionSetsBuilder(HRETriggerRecommendation)
- (id)hre_recommendedActions;
@end

@implementation HFTriggerActionSetsBuilder(HRETriggerRecommendation)

- (id)hre_recommendedActions
{
  v4 = objc_getAssociatedObject(a1, a2);
  if (!v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F47BC0]);
    v6 = [MEMORY[0x263EFFA08] set];
    v4 = (void *)[v5 initWithFromSet:v6];

    objc_setAssociatedObject(a1, a2, v4, (void *)0x301);
  }

  return v4;
}

@end