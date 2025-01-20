@interface NSError
@end

@implementation NSError

void __60__NSError_BaseBoard__descriptionBuilderWithMultilinePrefix___block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F28578], *MEMORY[0x1E4F28588], @"BSErrorCodeDescription", *MEMORY[0x1E4F28A50], *MEMORY[0x1E4F28750], @"NSDetailedErrors", 0);
  v1 = (void *)_MergedGlobals_23;
  _MergedGlobals_23 = v0;
}

void __60__NSError_BaseBoard__descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v17 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v7 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v6, (void)v16);
        int v8 = _NSIsNSArray();
        v9 = *(void **)(a1 + 48);
        if (v8) {
          [v9 appendArraySection:v7 withName:v6 skipIfEmpty:1];
        }
        else {
          id v10 = (id)[v9 appendObject:v7 withName:v6 skipIfNil:1];
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v3);
  }

  v11 = (id *)(a1 + 56);
  uint64_t v12 = [*(id *)(a1 + 56) count];
  v13 = *(void **)(a1 + 48);
  if (v12 == 1)
  {
    v14 = [*v11 firstObject];
    id v15 = (id)[v13 appendObject:v14 withName:*MEMORY[0x1E4F28A50]];
  }
  else
  {
    [v13 appendCollectionSection:*v11 withName:*MEMORY[0x1E4F28750] skipIfEmpty:1];
  }
}

@end