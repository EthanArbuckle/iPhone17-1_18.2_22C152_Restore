@interface AVTNodeDeepCopy
@end

@implementation AVTNodeDeepCopy

void ___AVTNodeDeepCopy_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [v3 animationKeys];
  if ([v4 count])
  {
    uint64_t v23 = a1;
    v5 = [*(id *)(a1 + 32) objectForKey:v3];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v29 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          v12 = [v3 animationPlayerForKey:v11];
          v13 = (void *)[v12 copy];
          [v5 addAnimationPlayer:v13 forKey:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v8);
    }

    a1 = v23;
  }
  v14 = [v3 actionKeys];
  if ([v14 count])
  {
    v15 = [*(id *)(a1 + 32) objectForKey:v3];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v16 = v14;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v24 + 1) + 8 * j);
          v22 = [v3 actionForKey:v21];
          [v15 runAction:v22 forKey:v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v18);
    }
  }
}

@end