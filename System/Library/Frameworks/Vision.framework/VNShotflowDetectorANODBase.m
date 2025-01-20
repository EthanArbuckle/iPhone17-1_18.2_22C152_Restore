@interface VNShotflowDetectorANODBase
- (id)mergeHeadsBoxes:(id)a3;
@end

@implementation VNShotflowDetectorANODBase

- (id)mergeHeadsBoxes:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v3 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_185_11889];
  v25 = [v24 filteredArrayUsingPredicate:v3];

  v4 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_187];
  v5 = [v24 filteredArrayUsingPredicate:v4];

  v6 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_189];
  v7 = [v24 filteredArrayUsingPredicate:v6];

  v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"confidence" ascending:0];
  v27[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  v10 = [v25 sortedArrayUsingDescriptors:v9];

  uint64_t v11 = [v10 count];
  uint64_t v12 = [v5 count];
  if (v11)
  {
    uint64_t v13 = v12;
    for (uint64_t i = 0; i != v11; ++i)
    {
      v15 = [v10 objectAtIndexedSubscript:i];
      if (!v13) {
        goto LABEL_11;
      }
      uint64_t v16 = 0;
      BOOL v17 = 1;
      do
      {
        while (!v17)
        {
          BOOL v17 = 0;
          if (++v16 == v13) {
            goto LABEL_12;
          }
        }
        v18 = [v5 objectAtIndexedSubscript:v16];
        [v15 intersectionOverArea:v18];
        float v20 = v19;
        BOOL v17 = v19 <= 0.8;

        ++v16;
      }
      while (v16 != v13);
      if (v20 <= 0.8) {
LABEL_11:
      }
        [v26 addObject:v15];
LABEL_12:
    }
  }
  for (unint64_t j = 0; j < [v7 count]; ++j)
  {
    v22 = [v7 objectAtIndexedSubscript:j];
    [v26 addObject:v22];
  }

  return v26;
}

BOOL __46__VNShotflowDetectorANODBase_mergeHeadsBoxes___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 label] != 2;
}

BOOL __46__VNShotflowDetectorANODBase_mergeHeadsBoxes___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 label] == 1;
}

BOOL __46__VNShotflowDetectorANODBase_mergeHeadsBoxes___block_invoke(uint64_t a1, void *a2)
{
  return [a2 label] == 2;
}

@end