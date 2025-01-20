@interface GEOConfigAddBlockListenerForKey
@end

@implementation GEOConfigAddBlockListenerForKey

id *___GEOConfigAddBlockListenerForKey_block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, BOOL *a5)
{
  id v8 = a2;
  id v9 = a4;
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
    v27.receiver = v14;
    v27.super_class = (Class)_GEOConfigChangedBlockListener;
    v20 = (id *)objc_msgSendSuper2(&v27, sel_init);
    v19 = v20;
    if (v20)
    {
      objc_storeWeak(v20 + 1, v15);
      objc_storeStrong(v19 + 2, v10);
      uint64_t v21 = [v18 copy];
      id v22 = v19[3];
      v19[3] = (id)v21;

      v14 = v19;
      v19 = v14;
    }
    else
    {
      v14 = 0;
    }
  }

  v23 = [v9 objectForKeyedSubscript:v15];
  v24 = v23;
  if (v23)
  {
    [v23 compact];
    v25 = v24;
  }
  else
  {
    v25 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    [v9 setObject:v25 forKeyedSubscript:v15];
  }
  [v25 addPointer:v19];
  *a5 = v24 == 0;

  return v19;
}

@end