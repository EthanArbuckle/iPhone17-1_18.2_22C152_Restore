@interface CDPSimpleModel
@end

@implementation CDPSimpleModel

void __29___CDPSimpleModel_loadModel___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [v7 peopleIdentifiers];
  if ([v3 count] && (unint64_t)objc_msgSend(v3, "count") <= 0x14)
  {
    while (1)
    {
      v4 = *(void **)(a1 + 32);
      if (v4[2] < v4[3]) {
        break;
      }
      [v4 _reallocModel];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 48) + *(void *)(*(void *)(a1 + 32) + 16)) = [v7 userIsSender];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 56) + *(void *)(*(void *)(a1 + 32) + 16)) = [v7 userIsThreadInitiator];
    v5 = [v7 timestamp];
    [v5 timeIntervalSince1970];
    *(void *)(*(void *)(*(void *)(a1 + 32) + 40) + 8 * *(void *)(*(void *)(a1 + 32) + 16)) = v6;

    ++*(void *)(*(void *)(a1 + 32) + 16);
    [*(id *)(a1 + 40) addObject:v3];
  }
}

void __29___CDPSimpleModel_loadModel___block_invoke_2(uint64_t a1)
{
  v52[1] = *MEMORY[0x1E4F143B8];
  unint64_t v2 = *(void *)(*(void *)(a1 + 32) + 16);
  if (v2)
  {
    if (v2 < 0x9C5)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v3 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v49 = *MEMORY[0x1E4F28568];
    v50 = @"Too many interactions as input.";
    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
    v5 = v3;
    uint64_t v6 = 1;
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v51 = *MEMORY[0x1E4F28568];
    v52[0] = @"No past interactions with the specified seed";
    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
    v5 = v7;
    uint64_t v6 = 0;
  }
  v8 = [v5 errorWithDomain:@"com.apple.coreduet.people" code:v6 userInfo:v4];

LABEL_7:
  size_t v9 = *(void *)(*(void *)(a1 + 32) + 16);
  if (v9 && (v9 <= 0x9C4 ? (BOOL v10 = v8 == 0) : (BOOL v10 = 0), v10))
  {
    *(void *)(*(void *)(a1 + 32) + 64) = malloc_type_calloc(v9, 8uLL, 0x10040436913F5uLL);
    *(void *)(*(void *)(a1 + 32) + 72) = malloc_type_calloc(*(void *)(*(void *)(a1 + 32) + 16), 8uLL, 0x100004000313F17uLL);
    *(void *)(*(void *)(a1 + 32) + 80) = malloc_type_calloc(*(void *)(*(void *)(a1 + 32) + 16), 4uLL, 0x100004052888210uLL);
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:256];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v12 = *(id *)(a1 + 40);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v44 != v15) {
            objc_enumerationMutation(v12);
          }
          [v11 addObjectsFromArray:*(void *)(*((void *)&v43 + 1) + 8 * i)];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v14);
    }

    v17 = [v11 allObjects];
    uint64_t v18 = [v17 sortedArrayUsingSelector:sel_compare_];
    uint64_t v19 = *(void *)(a1 + 32);
    v20 = *(void **)(v19 + 104);
    *(void *)(v19 + 104) = v18;

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v21 = *(id *)(a1 + 40);
    uint64_t v22 = [v21 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      int v24 = 0;
      uint64_t v25 = *(void *)v40;
      do
      {
        uint64_t v26 = 0;
        int v27 = v24;
        uint64_t v28 = 8 * v24;
        do
        {
          if (*(void *)v40 != v25) {
            objc_enumerationMutation(v21);
          }
          *(void *)(*(void *)(*(void *)(a1 + 32) + 64) + v28) = objc_msgSend(*(id *)(a1 + 32), "_newIdsForPeople:length:", *(void *)(*((void *)&v39 + 1) + 8 * v26++), *(void *)(*(void *)(a1 + 32) + 72) + v28, (void)v39);
          v28 += 8;
        }
        while (v23 != v26);
        uint64_t v23 = [v21 countByEnumeratingWithState:&v39 objects:v47 count:16];
        int v24 = v27 + v26;
      }
      while (v23);
    }

    *(void *)(*(void *)(a1 + 32) + 32) = [v11 count];
    *(void *)(*(void *)(a1 + 32) + 88) = malloc_type_calloc(*(void *)(*(void *)(a1 + 32) + 32), 8uLL, 0x10040436913F5uLL);
    *(void *)(*(void *)(a1 + 32) + 96) = malloc_type_calloc(*(void *)(*(void *)(a1 + 32) + 32), 8uLL, 0x100004000313F17uLL);
    uint64_t v29 = *(void *)(a1 + 32);
    if (*(void *)(v29 + 32))
    {
      uint64_t v30 = 0;
      unsigned int v31 = 1;
      do
      {
        *(void *)(*(void *)(*(void *)(a1 + 32) + 88) + 8 * v30) = malloc_type_calloc(4uLL, 4uLL, 0x100004052888210uLL);
        *(void *)(*(void *)(*(void *)(a1 + 32) + 96) + 8 * v30) = 0;
        uint64_t v30 = v31;
        uint64_t v29 = *(void *)(a1 + 32);
        BOOL v38 = *(void *)(v29 + 32) > (unint64_t)v31++;
      }
      while (v38);
    }
    if (*(void *)(v29 + 16))
    {
      uint64_t v32 = 0;
      unsigned int v33 = 0;
      do
      {
        if (*(void *)(*(void *)(v29 + 72) + 8 * v32))
        {
          unint64_t v34 = 0;
          do
          {
            uint64_t v35 = *(unsigned int *)(*(void *)(*(void *)(v29 + 64) + 8 * v32) + 4 * v34);
            int8x8_t v36 = *(int8x8_t *)(*(void *)(v29 + 96) + 8 * v35);
            uint8x8_t v37 = (uint8x8_t)vcnt_s8(v36);
            v37.i16[0] = vaddlv_u8(v37);
            BOOL v38 = *(void *)&v36 < 4uLL || v37.u32[0] > 1uLL;
            if (!v38)
            {
              *(void *)(*(void *)(*(void *)(a1 + 32) + 88) + 8 * v35) = malloc_type_realloc(*(void **)(*(void *)(v29 + 88)+ 8 * v35), 8 * *(void *)&v36, 0x100004052888210uLL);
              uint64_t v29 = *(void *)(a1 + 32);
            }
            *(_DWORD *)(*(void *)(*(void *)(v29 + 88) + 8 * v35) + 4 * *(void *)&v36) = v33;
            ++*(void *)(*(void *)(*(void *)(a1 + 32) + 96) + 8 * v35);
            ++v34;
            uint64_t v29 = *(void *)(a1 + 32);
          }
          while (*(void *)(*(void *)(v29 + 72) + 8 * v32) > v34);
        }
        uint64_t v32 = ++v33;
      }
      while (*(void *)(v29 + 16) > (unint64_t)v33);
    }
    *(unsigned char *)(v29 + 9) = 1;
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __43___CDPSimpleModel__newIdsForPeople_length___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

unint64_t __36___CDPSimpleModel__printPrediction___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (__PAIR64__(*(float *)(a2 + 4) < *(float *)(a3 + 4), *(_DWORD *)(a3 + 4)) - *(unsigned int *)(a2 + 4)) >> 32;
}

@end