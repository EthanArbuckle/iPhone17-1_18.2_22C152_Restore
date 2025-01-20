@interface NSDictionary
@end

@implementation NSDictionary

void __48__NSDictionary_FPFrameworkAdditions__fp_filter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()) {
    [*(id *)(a1 + 32) setObject:v5 forKey:v6];
  }
}

void __73__NSDictionary_FPFrameworkAdditions__fp_removingObjectsNotKindOfClasses___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v18 = a1;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    v10 = 0;
    v11 = 0;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v7);
        }
        if (objc_opt_isKindOfClass())
        {
          id v14 = v5;

          v10 = v14;
        }
        if (objc_opt_isKindOfClass())
        {
          id v15 = v6;

          v11 = v15;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v16 = v18;
    uint64_t v17 = objc_msgSend(v11, "fp_removingObjectsNotKindOfClasses:", *(void *)(v18 + 32));

    v11 = (void *)v17;
    if (!v10) {
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v16 = v18;
    if (!v10) {
      goto LABEL_21;
    }
  }
  if (v11) {
    [*(id *)(v16 + 40) setObject:v11 forKeyedSubscript:v10];
  }
LABEL_21:
}

@end