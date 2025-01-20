@interface CDPInteractionStoreDataHarvester
@end

@implementation CDPInteractionStoreDataHarvester

void __78___CDPInteractionStoreDataHarvester_loadWithLimit_dataPointReader_completion___block_invoke(void *a1)
{
  v32[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = a1[4];
  v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  uint64_t v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
  v6 = (void *)a1[4];
  v7 = (void *)v6[2];
  v8 = [v6 predicate];
  v25 = (void *)v5;
  v32[0] = v5;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  uint64_t v10 = objc_msgSend(v7, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:", v8, v9, +[_CDPSimpleModel maxNumberOfEmailsSupported](_CDPSimpleModel, "maxNumberOfEmailsSupported"), 0);
  uint64_t v11 = a1[4];
  v12 = *(void **)(v11 + 32);
  *(void *)(v11 + 32) = v10;

  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __78___CDPInteractionStoreDataHarvester_loadWithLimit_dataPointReader_completion___block_invoke_2;
  v30[3] = &unk_1E56107E8;
  v30[4] = a1[4];
  v13 = (void (**)(void, void))MEMORY[0x192FB31A0](v30);
  unint64_t v14 = [*(id *)(a1[4] + 32) count];
  unint64_t v15 = a1[7];
  if (v14 <= v15) {
    LODWORD(v15) = [*(id *)(a1[4] + 32) count];
  }
  if ((int)v15 >= 1)
  {
    uint64_t v16 = v15;
    do
    {
      v17 = [*(id *)(a1[4] + 32) objectAtIndexedSubscript:(v16 - 1)];
      v18 = [v17 sender];
      ((void (**)(void, void *))v13)[2](v13, v18);

      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      v19 = [v17 recipients];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v27;
        do
        {
          uint64_t v23 = 0;
          do
          {
            if (*(void *)v27 != v22) {
              objc_enumerationMutation(v19);
            }
            v13[2](v13, *(void *)(*((void *)&v26 + 1) + 8 * v23++));
          }
          while (v21 != v23);
          uint64_t v21 = [v19 countByEnumeratingWithState:&v26 objects:v31 count:16];
        }
        while (v21);
      }

      (*(void (**)(void))(a1[5] + 16))();
    }
    while (v16-- > 1);
  }
  (*(void (**)(void))(a1[6] + 16))();
}

void __78___CDPInteractionStoreDataHarvester_loadWithLimit_dataPointReader_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = [v9 identifier];

  if (v3)
  {
    v4 = *(void **)(*(void *)(a1 + 32) + 8);
    uint64_t v5 = [v9 identifier];
    v6 = [v4 objectForKeyedSubscript:v5];

    if (v6)
    {
      [v6 mergeWithContact:v9];
    }
    else
    {
      v7 = *(void **)(*(void *)(a1 + 32) + 8);
      v8 = [v9 identifier];
      [v7 setObject:v9 forKeyedSubscript:v8];
    }
  }
}

@end