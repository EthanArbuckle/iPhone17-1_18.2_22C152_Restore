@interface HKHeartbeatSeriesSample(HKMetadataDetail)
- (id)hk_additionalMetadataSectionsWithHealthStore:()HKMetadataDetail displayTypeController:unitController:subsampleDelegate:;
@end

@implementation HKHeartbeatSeriesSample(HKMetadataDetail)

- (id)hk_additionalMetadataSectionsWithHealthStore:()HKMetadataDetail displayTypeController:unitController:subsampleDelegate:
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[HKDataMetadataBeatToBeatSection alloc] initWithSample:a1 healthStore:v10 displayTypeController:v9 unitController:v8];

  v14[0] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];

  return v12;
}

@end