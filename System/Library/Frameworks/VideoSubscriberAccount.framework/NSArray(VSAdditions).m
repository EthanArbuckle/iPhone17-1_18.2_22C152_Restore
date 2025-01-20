@interface NSArray(VSAdditions)
- (id)vs_componentsJoinedByAttributedString:()VSAdditions;
@end

@implementation NSArray(VSAdditions)

- (id)vs_componentsJoinedByAttributedString:()VSAdditions
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  uint64_t v6 = [a1 count];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v7 = a1;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v33;
    uint64_t v28 = v6 - 1;
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    unint64_t v13 = 0x1E4F28000uLL;
    do
    {
      uint64_t v14 = 0;
      uint64_t v29 = v10;
      uint64_t v30 = v9;
      uint64_t v31 = v28 - v10;
      unint64_t v15 = 0x1E4F1C000uLL;
      do
      {
        if (*(void *)v33 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v16 = *(void *)(*((void *)&v32 + 1) + 8 * v14);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v17 = v11;
            uint64_t v18 = v12;
            id v19 = v5;
            id v20 = v7;
            id v21 = v4;
            v22 = *(void **)(v15 + 2560);
            v23 = (objc_class *)objc_opt_class();
            NSStringFromClass(v23);
            v25 = unint64_t v24 = v13;
            v26 = v22;
            id v4 = v21;
            id v7 = v20;
            id v5 = v19;
            uint64_t v12 = v18;
            uint64_t v11 = v17;
            uint64_t v9 = v30;
            [v26 raise:v12, @"Unexpectedly, object was %@, instead of NSAttributedString.", v25 format];

            unint64_t v13 = v24;
            unint64_t v15 = 0x1E4F1C000;
          }
          [v5 appendAttributedString:v16];
        }
        else
        {
          [*(id *)(v15 + 2560) raise:v12, @"Array contains an object that is not at attributed string: %@", v16 format];
        }
        if (v31 != v14) {
          [v5 appendAttributedString:v4];
        }
        ++v14;
      }
      while (v9 != v14);
      uint64_t v10 = v29 + v9;
      uint64_t v9 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v9);
  }

  return v5;
}

@end