@interface SGFn
+ (id)filter:(id)a3 f:(id)a4;
+ (id)map:(id)a3 f:(id)a4;
+ (id)mapAndFilter:(id)a3 f:(id)a4;
+ (id)simpleDedupe:(id)a3;
@end

@implementation SGFn

+ (id)simpleDedupe:(id)a3
{
  id v3 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__6308;
  v19 = __Block_byref_object_dispose__6309;
  id v20 = 0;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __21__SGFn_simpleDedupe___block_invoke;
  v12 = &unk_1E5B8FFF0;
  id v4 = v3;
  id v13 = v4;
  v14 = &v15;
  uint64_t v5 = [v4 enumerateObjectsUsingBlock:&v9];
  if (v16[5])
  {
    v6 = (void *)MEMORY[0x1A6265250](v5);
    v7 = objc_msgSend(v4, "objectsAtIndexes:", v16[5], v9, v10, v11, v12);
  }
  else
  {
    v7 = objc_msgSend(v4, "copy", v9, v10, v11, v12);
  }

  _Block_object_dispose(&v15, 8);

  return v7;
}

uint64_t __21__SGFn_simpleDedupe___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  if (a3 && objc_msgSend(*(id *)(a1 + 32), "indexOfObject:inRange:", v10, 0, a3) != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E60]), "initWithIndexesInRange:", 0, a3);
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
      v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;
    }
  }
  else
  {
    uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v5) {
      [v5 addIndex:a3];
    }
  }

  return MEMORY[0x1F41817F8]();
}

+ (id)mapAndFilter:(id)a3 f:(id)a4
{
  return sgMapAndFilter(a3, a4);
}

+ (id)filter:(id)a3 f:(id)a4
{
  return sgFilter(a3, a4);
}

+ (id)map:(id)a3 f:(id)a4
{
  return sgMap(a3, a4);
}

@end