@interface GEOConfigAddDelegateListenerForKey
@end

@implementation GEOConfigAddDelegateListenerForKey

id *___GEOConfigAddDelegateListenerForKey_block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, BOOL *a5)
{
  id v8 = a2;
  id v9 = a3;
  v10 = *(void **)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v12 = v10;
  id v13 = v8;
  v14 = (id *)objc_alloc((Class)self);
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  v18 = v17;
  v19 = 0;
  if (v14 && v15 && v16 && v17)
  {
    v24.receiver = v14;
    v24.super_class = (Class)_GEOConfigChangedDelegateListener;
    v20 = (id *)objc_msgSendSuper2(&v24, sel_init);
    v19 = v20;
    if (v20)
    {
      objc_storeWeak(v20 + 1, v15);
      objc_storeStrong(v19 + 2, v10);
      objc_storeWeak(v19 + 3, v18);
      v14 = v19;
      v19 = v14;
    }
    else
    {
      v14 = 0;
    }
  }

  uint64_t v21 = [v9 objectForKeyedSubscript:v15];
  v22 = (void *)v21;
  if (!v21)
  {
    v22 = [MEMORY[0x1E4F1CA48] array];
    [v9 setObject:v22 forKeyedSubscript:v15];
  }
  [v22 addObject:v19];
  *a5 = v21 == 0;

  return v19;
}

@end