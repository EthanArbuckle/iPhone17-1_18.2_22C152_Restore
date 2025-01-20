@interface NSArray(BacklightServices)
- (id)bls_boundedDescriptionWithMax:()BacklightServices transformer:;
- (uint64_t)bls_boundedDescription;
- (uint64_t)bls_boundedDescriptionWithMax:()BacklightServices;
- (uint64_t)bls_boundedDescriptionWithTransformer:()BacklightServices;
@end

@implementation NSArray(BacklightServices)

- (uint64_t)bls_boundedDescription
{
  return objc_msgSend(a1, "bls_boundedDescriptionWithMax:transformer:", 4, &__block_literal_global_18);
}

- (uint64_t)bls_boundedDescriptionWithTransformer:()BacklightServices
{
  return objc_msgSend(a1, "bls_boundedDescriptionWithMax:transformer:", 4, a3);
}

- (uint64_t)bls_boundedDescriptionWithMax:()BacklightServices
{
  return objc_msgSend(a1, "bls_boundedDescriptionWithMax:transformer:", a3, &__block_literal_global_2_0);
}

- (id)bls_boundedDescriptionWithMax:()BacklightServices transformer:
{
  v28[2] = *MEMORY[0x1E4F143B8];
  v6 = a4;
  v7 = objc_opt_new();
  unint64_t v8 = [a1 count];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __72__NSArray_BacklightServices__bls_boundedDescriptionWithMax_transformer___block_invoke;
  v25[3] = &unk_1E6107BF0;
  id v9 = v7;
  id v26 = v9;
  unint64_t v27 = v8;
  [v9 appendProem:0 block:v25];
  uint64_t v10 = a3 - 1;
  if (a3 >= 1)
  {
    if (v8 <= a3)
    {
      v18 = objc_msgSend(a1, "bs_mapNoNulls:", v6, v10);
    }
    else
    {
      v11 = objc_msgSend(a1, "subarrayWithRange:", 0, v10);
      v12 = objc_msgSend(v11, "bs_mapNoNulls:", v6);
      v28[0] = @"...";
      v13 = [a1 lastObject];
      uint64_t v14 = v6[2](v6, v13);
      v15 = (void *)v14;
      v16 = @"<NULL>";
      if (v14) {
        v16 = (__CFString *)v14;
      }
      v28[1] = v16;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
      v18 = [v12 arrayByAddingObjectsFromArray:v17];
    }
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __72__NSArray_BacklightServices__bls_boundedDescriptionWithMax_transformer___block_invoke_2;
    v22[3] = &unk_1E6106FA8;
    id v23 = v18;
    id v24 = v9;
    id v19 = v18;
    [v24 appendBodySectionWithOpenDelimiter:@" {" closeDelimiter:@"} " block:v22];
  }
  v20 = [v9 description];

  return v20;
}

@end