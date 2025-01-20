@interface BSDescriptionStream(BacklightServices)
- (id)bls_appendTimeInterval:()BacklightServices withName:decomposeUnits:;
- (void)bls_appendBoundedCollection:()BacklightServices withName:maximumItems:itemBlock:;
@end

@implementation BSDescriptionStream(BacklightServices)

- (void)bls_appendBoundedCollection:()BacklightServices withName:maximumItems:itemBlock:
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  unint64_t v13 = [v10 count];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __102__BSDescriptionStream_BacklightServices__bls_appendBoundedCollection_withName_maximumItems_itemBlock___block_invoke;
  v44[3] = &__block_descriptor_40_e43_v16__0___BSDescriptionStringAppendTarget__8l;
  v44[4] = v13;
  [a1 appendCustomFormatWithName:0 block:v44];
  uint64_t v14 = _NSIsNSSet();
  id v15 = v10;
  v16 = v15;
  if (v13 <= a5) {
    goto LABEL_24;
  }
  v17 = v15;
  if (([a1 sortKeys] & v14) == 1)
  {
    id v35 = v11;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v18 = v15;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v41;
      v22 = &off_1E6108000;
      while (2)
      {
        uint64_t v23 = v14;
        uint64_t v24 = 0;
        v25 = (char *)v22[175];
        do
        {
          if (*(void *)v41 != v21) {
            objc_enumerationMutation(v18);
          }
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            v17 = v18;
            LODWORD(v14) = v23;
            goto LABEL_15;
          }
          ++v24;
        }
        while (v20 != v24);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v40 objects:v48 count:16];
        uint64_t v14 = v23;
        v22 = &off_1E6108000;
        if (v20) {
          continue;
        }
        break;
      }
    }
    else
    {
      v25 = sel_compare_;
    }

    v26 = [v18 allObjects];
    v17 = [v26 sortedArrayUsingSelector:v25];

    id v18 = v26;
LABEL_15:

    id v11 = v35;
  }
  unint64_t v27 = a5 - 1;
  if (a5 == 1)
  {
    v28 = [v17 allObjects];
    v29 = [v28 firstObject];
    v46[0] = v29;
    v46[1] = @"…";
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
  }
  else
  {
    if (!a5)
    {
      v47 = @"…";
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
      goto LABEL_22;
    }
    v28 = [v17 allObjects];
    v30 = objc_msgSend(v28, "subarrayWithRange:", 0, v27);

    v45[0] = @"…";
    v31 = [v28 lastObject];
    v45[1] = v31;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
    v16 = [v30 arrayByAddingObjectsFromArray:v32];
  }
  v17 = v28;
LABEL_22:

  if (v14)
  {
    uint64_t v33 = [MEMORY[0x1E4F1CAD0] setWithArray:v16];

    v16 = (void *)v33;
  }
LABEL_24:
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __102__BSDescriptionStream_BacklightServices__bls_appendBoundedCollection_withName_maximumItems_itemBlock___block_invoke_2;
  v36[3] = &unk_1E6107060;
  v37 = @"…";
  v38 = a1;
  id v39 = v12;
  id v34 = v12;
  [a1 appendCollection:v16 withName:v11 itemBlock:v36];
}

- (id)bls_appendTimeInterval:()BacklightServices withName:decomposeUnits:
{
  if (a2 >= 1.0 || (a5 & 1) != 0)
  {
    objc_msgSend(a1, "appendTimeInterval:withName:decomposeUnits:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __89__BSDescriptionStream_BacklightServices__bls_appendTimeInterval_withName_decomposeUnits___block_invoke;
    v8[3] = &__block_descriptor_40_e43_v16__0___BSDescriptionStringAppendTarget__8l;
    *(double *)&v8[4] = a2;
    [a1 appendCustomFormatWithName:a4 block:v8];
    id v6 = a1;
  }

  return v6;
}

@end