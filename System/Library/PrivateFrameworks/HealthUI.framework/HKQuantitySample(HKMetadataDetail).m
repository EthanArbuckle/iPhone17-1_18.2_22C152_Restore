@interface HKQuantitySample(HKMetadataDetail)
- (id)hk_additionalMetadataSectionsWithHealthStore:()HKMetadataDetail displayTypeController:unitController:subsampleDelegate:;
@end

@implementation HKQuantitySample(HKMetadataDetail)

- (id)hk_additionalMetadataSectionsWithHealthStore:()HKMetadataDetail displayTypeController:unitController:subsampleDelegate:
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [a1 quantityType];
  if ([v14 code] != 139)
  {

LABEL_5:
    v21 = [a1 quantityType];
    if ([v21 code] == 14)
    {
      v22 = [a1 sourceRevision];
      v23 = [v22 source];
      int v24 = [v23 _hasFirstPartyBundleID];

      if (v24)
      {
        v25 = [a1 metadata];
        uint64_t v26 = *MEMORY[0x1E4F2A228];
        uint64_t v27 = [v25 objectForKeyedSubscript:*MEMORY[0x1E4F2A228]];
        if (!v27)
        {

LABEL_13:
          v18 = [[HKDataMetadataOxygenSaturationSection alloc] initWithSample:a1 healthStore:v10 displayTypeController:v11 unitController:v12 subsampleDelegate:v13];
          v34 = v18;
          v19 = (void *)MEMORY[0x1E4F1C978];
          v20 = &v34;
          goto LABEL_14;
        }
        v28 = (void *)v27;
        v29 = [a1 metadata];
        v30 = [v29 objectForKeyedSubscript:v26];
        int v31 = [v30 isEqual:MEMORY[0x1E4F1CC28]];

        if (v31) {
          goto LABEL_13;
        }
      }
    }
    else
    {
    }
    v32 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_15;
  }
  v15 = [a1 sourceRevision];
  v16 = [v15 source];
  int v17 = [v16 _isAppleWatch];

  if (!v17) {
    goto LABEL_5;
  }
  v18 = [[HKDataMetadataBeatToBeatSection alloc] initWithSample:a1 healthStore:v10 displayTypeController:v11 unitController:v12];
  v35[0] = v18;
  v19 = (void *)MEMORY[0x1E4F1C978];
  v20 = (HKDataMetadataOxygenSaturationSection **)v35;
LABEL_14:
  v32 = [v19 arrayWithObjects:v20 count:1];

LABEL_15:
  return v32;
}

@end