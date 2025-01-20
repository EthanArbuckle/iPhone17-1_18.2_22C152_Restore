@interface EDSubjectTokenizer
+ (id)tokenizeString:(id)a3;
@end

@implementation EDSubjectTokenizer

+ (id)tokenizeString:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__39;
  v21 = __Block_byref_object_dispose__39;
  id v22 = (id)0xAAAAAAAAAAAAAAAALL;
  id v22 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v5 = (void *)MEMORY[0x1E4F28DF0];
  uint64_t v6 = [v3 length];
  uint64_t v7 = *MEMORY[0x1E4F28540];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __37__EDSubjectTokenizer_tokenizeString___block_invoke;
  v13[3] = &unk_1E6C066E8;
  id v8 = v3;
  id v14 = v8;
  v16 = &v17;
  id v9 = v4;
  id v15 = v9;
  objc_msgSend(v5, "enumerateTagsForString:range:unit:scheme:options:orthography:usingBlock:", v8, 0, v6, 0, v7, 4, 0, v13);
  if ([(id)v18[5] length]) {
    [v9 addObject:v18[5]];
  }
  v10 = v15;
  id v11 = v9;

  _Block_object_dispose(&v17, 8);

  return v11;
}

void __37__EDSubjectTokenizer_tokenizeString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v15 = a2;
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a3, a4);
  int v8 = [v15 isEqualToString:*MEMORY[0x1E4F28508]];
  id v9 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v8)
  {
    [v9 appendString:v7];
  }
  else
  {
    if ([v9 length])
    {
      [*(id *)(a1 + 40) addObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      id v10 = objc_alloc_init(MEMORY[0x1E4F28E78]);
      uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
      v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }
    v13 = *(void **)(a1 + 40);
    id v14 = [v7 lowercaseString];
    [v13 addObject:v14];
  }
}

@end