@interface NSString
- (id)_bsui_rangesOfEmojiTokens:(void *)a1;
@end

@implementation NSString

- (id)_bsui_rangesOfEmojiTokens:(void *)a1
{
  if (a1)
  {
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__1;
    v31 = __Block_byref_object_dispose__1;
    id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__1;
    v25 = __Block_byref_object_dispose__1;
    if (a2) {
      id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v4 = 0;
    }
    id v26 = v4;
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x3010000000;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    v18 = &unk_1A2B2EB5E;
    [a1 length];
    CEMEnumerateEmojiTokensInStringWithBlock();
    if (v22[5])
    {
      uint64_t v5 = v16[4];
      uint64_t v6 = v16[5];
      if (v6 + v5 < (unint64_t)[a1 length])
      {
        uint64_t v7 = v16[4];
        uint64_t v8 = v16[5];
        uint64_t v9 = [a1 length];
        uint64_t v10 = v8 + v7;
        v11 = (void *)v22[5];
        v12 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v10, v9 - (v16[4] + v16[5]));
        [v11 addObject:v12];
      }
      if (a2) {
        *a2 = (id) v22[5];
      }
    }
    id v13 = (id)v28[5];
    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v21, 8);

    _Block_object_dispose(&v27, 8);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

void __67__NSString_BSUIPartialStylingAdditions___bsui_rangesOfEmojiTokens___block_invoke(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3 != -1 && a4 != -1)
  {
    uint64_t v7 = *(void **)(*(void *)(a1[4] + 8) + 40);
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:");
    [v7 addObject:v8];

    uint64_t v9 = *(void **)(*(void *)(a1[5] + 8) + 40);
    if (v9)
    {
      uint64_t v10 = *(void *)(*(void *)(a1[6] + 8) + 40) + *(void *)(*(void *)(a1[6] + 8) + 32);
      v11 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v10, a3 - v10);
      [v9 addObject:v11];

      uint64_t v12 = *(void *)(a1[6] + 8);
      *(void *)(v12 + 32) = a3;
      *(void *)(v12 + 40) = a4;
    }
  }
}

@end