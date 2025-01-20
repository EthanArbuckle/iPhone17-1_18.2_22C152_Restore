@interface HKSample(HKMetadataDetail)
- (uint64_t)hk_additionalMetadataSectionsWithHealthStore:()HKMetadataDetail displayTypeController:unitController:subsampleDelegate:;
@end

@implementation HKSample(HKMetadataDetail)

- (uint64_t)hk_additionalMetadataSectionsWithHealthStore:()HKMetadataDetail displayTypeController:unitController:subsampleDelegate:
{
  return MEMORY[0x1E4F1CBF0];
}

@end