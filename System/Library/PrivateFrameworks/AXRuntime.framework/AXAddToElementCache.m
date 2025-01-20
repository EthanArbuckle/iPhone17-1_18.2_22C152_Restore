@interface AXAddToElementCache
@end

@implementation AXAddToElementCache

void ___AXAddToElementCache_block_invoke(uint64_t a1)
{
  v2 = (void **)(a1 + 32);
  NSMapGet((NSMapTable *)_ElementCache, (const void *)~*(void *)(a1 + 32));
  v3 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = AXRuntimeLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      ___AXAddToElementCache_block_invoke_cold_1((uint64_t *)(a1 + 32), v4);
    }

    v5 = v3 + 2;
  }
  else
  {
    uint64_t v6 = _ElementCacheUniqueID;
    do
    {
      BOOL v7 = v6 == 9998 || kAXLookingGlassUID - 1 == v6;
      ++v6;
    }
    while (v7);
    v5 = &_ElementCacheUniqueID;
    _ElementCacheUniqueID = v6;
    v8 = (NSMapTable *)_ElementCache;
    v9 = *v2;
    unint64_t v10 = ~(unint64_t)*v2;
    id v11 = v9;
    v12 = +[_AXObjectCacheHelper helperWithElement:uid:]((uint64_t)_AXObjectCacheHelper, (uint64_t)v11, v6);
    objc_setAssociatedObject(v11, &AXCacheHelper, v12, (void *)1);

    NSMapInsert(v8, (const void *)v10, v12);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *v5;
}

void ___AXAddToElementCache_block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1BA657000, a2, OS_LOG_TYPE_ERROR, "_AXAddToElementCache was called even though the element was in the cache: %@", (uint8_t *)&v3, 0xCu);
}

@end