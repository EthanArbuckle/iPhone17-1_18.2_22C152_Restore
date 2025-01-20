@interface SGNestedArray
+ (void)traversalWithNestedArray:(id)a3 depthCallback:(id)a4 itemCallback:(id)a5;
@end

@implementation SGNestedArray

+ (void)traversalWithNestedArray:(id)a3 depthCallback:(id)a4 itemCallback:(id)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = (void (**)(void))a4;
  id v9 = a5;
  v10 = objc_opt_new();
  v11 = objc_opt_new();
  v12 = objc_opt_new();
  v36 = v7;
  [v10 addObject:v7];
  v13 = (void *)[objc_alloc(NSNumber) initWithInteger:-1];
  [v11 addObject:v13];

  if ([v10 count])
  {
    v37 = v12;
    uint64_t v14 = -1;
    id v38 = v9;
    v39 = v8;
    do
    {
      v15 = [v10 lastObject];
      v16 = [v11 lastObject];
      uint64_t v17 = [v16 integerValue];

      [v10 removeLastObject];
      [v11 removeLastObject];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v18 = v15;
        uint64_t v19 = [v18 count];
        BOOL v43 = v19 != 0;
        if (v19)
        {
          id v40 = v18;
          v41 = v15;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          v20 = [v18 reverseObjectEnumerator];
          uint64_t v21 = [v20 countByEnumeratingWithState:&v44 objects:v48 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v45;
            do
            {
              for (uint64_t i = 0; i != v22; ++i)
              {
                if (*(void *)v45 != v23) {
                  objc_enumerationMutation(v20);
                }
                [v10 addObject:*(void *)(*((void *)&v44 + 1) + 8 * i)];
                v25 = (void *)[objc_alloc(NSNumber) initWithInteger:v17 + 1];
                [v11 addObject:v25];
              }
              uint64_t v22 = [v20 countByEnumeratingWithState:&v44 objects:v48 count:16];
            }
            while (v22);
          }

          id v9 = v38;
          v8 = v39;
          v12 = v37;
          v15 = v41;
          id v18 = v40;
        }
      }
      else
      {
        BOOL v43 = 0;
      }
      if (v17 > v14)
      {
        v26 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:-1];
        [v12 addObject:v26];

        uint64_t v14 = v17;
        if (v8)
        {
          v8[2](v8);
          uint64_t v14 = v17;
        }
      }
      if ((v17 & 0x8000000000000000) == 0)
      {
        v27 = [v12 objectAtIndexedSubscript:v17];
        uint64_t v42 = v17;
        v28 = v12;
        id v29 = v9;
        v30 = v8;
        uint64_t v31 = v14;
        v32 = v15;
        uint64_t v33 = [v27 unsignedIntegerValue];

        uint64_t v34 = v33 + 1;
        v15 = v32;
        uint64_t v14 = v31;
        v8 = v30;
        id v9 = v29;
        v12 = v28;
        v35 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:v34];
        [v28 setObject:v35 atIndexedSubscript:v42];

        (*((void (**)(id, void *, void *, uint64_t, uint64_t, BOOL))v9 + 2))(v9, v15, v28, v42, v14, v43);
      }
    }
    while ([v10 count]);
  }
}

@end