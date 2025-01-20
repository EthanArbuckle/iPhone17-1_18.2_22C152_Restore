@interface CAFilter(CKFilterWithDictionary)
+ (id)ck_filterWithDictionary:()CKFilterWithDictionary;
@end

@implementation CAFilter(CKFilterWithDictionary)

+ (id)ck_filterWithDictionary:()CKFilterWithDictionary
{
  id v3 = a3;
  v4 = [v3 _stringForKey:@"type"];
  if ([v4 length])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__CAFilter_CKFilterWithDictionary__ck_filterWithDictionary___block_invoke;
    aBlock[3] = &unk_1E5627B40;
    id v6 = v5;
    id v53 = v6;
    v7 = _Block_copy(aBlock);
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __60__CAFilter_CKFilterWithDictionary__ck_filterWithDictionary___block_invoke_2;
    v50[3] = &unk_1E5627B68;
    id v8 = v6;
    id v51 = v8;
    v9 = _Block_copy(v50);
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __60__CAFilter_CKFilterWithDictionary__ck_filterWithDictionary___block_invoke_3;
    v48[3] = &unk_1E5627B40;
    id v10 = v8;
    id v49 = v10;
    v11 = _Block_copy(v48);
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __60__CAFilter_CKFilterWithDictionary__ck_filterWithDictionary___block_invoke_4;
    v46[3] = &unk_1E5627B40;
    id v12 = v10;
    id v47 = v12;
    v13 = _Block_copy(v46);
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __60__CAFilter_CKFilterWithDictionary__ck_filterWithDictionary___block_invoke_5;
    v44[3] = &unk_1E5627B40;
    id v14 = v12;
    id v45 = v14;
    v15 = _Block_copy(v44);
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __60__CAFilter_CKFilterWithDictionary__ck_filterWithDictionary___block_invoke_7;
    v42[3] = &unk_1E5627B40;
    id v16 = v14;
    id v43 = v16;
    v17 = _Block_copy(v42);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __60__CAFilter_CKFilterWithDictionary__ck_filterWithDictionary___block_invoke_8;
    v34[3] = &unk_1E5627BB0;
    id v28 = v7;
    id v35 = v28;
    id v18 = v11;
    id v36 = v18;
    id v19 = v13;
    id v37 = v19;
    id v20 = v15;
    id v38 = v20;
    id v39 = &__block_literal_global_400_0;
    id v21 = v17;
    id v40 = v21;
    id v22 = v9;
    id v41 = v22;
    [v3 enumerateKeysAndObjectsUsingBlock:v34];
    v23 = (void *)[objc_alloc(MEMORY[0x1E4F39BC0]) initWithType:v4];
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    v31 = __60__CAFilter_CKFilterWithDictionary__ck_filterWithDictionary___block_invoke_9;
    v32 = &unk_1E5627BD8;
    id v24 = v23;
    id v33 = v24;
    [v16 enumerateKeysAndObjectsUsingBlock:&v29];
    v25 = [v3 _stringForKey:@"name"];
    if (v25) {
      objc_msgSend(v24, "setName:", v25, v28, v29, v30, v31, v32);
    }
    id v26 = v24;
  }
  else
  {
    id v26 = 0;
  }

  return v26;
}

@end