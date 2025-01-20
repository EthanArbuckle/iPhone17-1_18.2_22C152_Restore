@interface NSArray(WFContentSortDescriptor)
- (uint64_t)sortedArrayUsingContentSortDescriptors:()WFContentSortDescriptor completionHandler:;
- (void)sortedArrayUsingContentSortDescriptors:()WFContentSortDescriptor propertySubstitutor:completionHandler:;
@end

@implementation NSArray(WFContentSortDescriptor)

- (void)sortedArrayUsingContentSortDescriptors:()WFContentSortDescriptor propertySubstitutor:completionHandler:
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    if ([v8 count])
    {
      v11 = +[WFContentSortDescriptor randomSortDescriptor];
      int v12 = [v8 containsObject:v11];

      if (v12)
      {
        v13 = (void *)[a1 mutableCopy];
        if ((unint64_t)[a1 count] >= 2)
        {
          uint64_t v14 = [a1 count];
          uint64_t v15 = v14 - 1;
          if (v14 != 1)
          {
            do
            {
              [v13 exchangeObjectAtIndex:v15 withObjectAtIndex:arc4random_uniform(v15 + 1)];
              --v15;
            }
            while (v15);
          }
        }
        v16 = (void *)[v13 copy];
        v10[2](v10, v16);
      }
      v36 = v10;
      v45 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      obuint64_t j = a1;
      uint64_t v17 = [obj countByEnumeratingWithState:&v64 objects:v70 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v65;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v65 != v19) {
              objc_enumerationMutation(obj);
            }
            uint64_t v21 = *(void *)(*((void *)&v64 + 1) + 8 * i);
            v22 = [MEMORY[0x263EFF9A0] dictionaryWithObject:v21 forKey:@"object"];
            [v45 setObject:v22 forKey:v21];
          }
          uint64_t v18 = [obj countByEnumeratingWithState:&v64 objects:v70 count:16];
        }
        while (v18);
      }

      v44 = objc_opt_new();
      v23 = dispatch_group_create();
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v37 = v8;
      id v38 = v8;
      uint64_t v40 = [v38 countByEnumeratingWithState:&v60 objects:v69 count:16];
      if (v40)
      {
        uint64_t v39 = *(void *)v61;
        do
        {
          uint64_t v24 = 0;
          do
          {
            if (*(void *)v61 != v39) {
              objc_enumerationMutation(v38);
            }
            uint64_t v42 = v24;
            v25 = *(void **)(*((void *)&v60 + 1) + 8 * v24);
            long long v56 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            id v43 = obj;
            uint64_t v26 = [v43 countByEnumeratingWithState:&v56 objects:v68 count:16];
            if (v26)
            {
              uint64_t v27 = v26;
              uint64_t v28 = *(void *)v57;
              do
              {
                for (uint64_t j = 0; j != v27; ++j)
                {
                  if (*(void *)v57 != v28) {
                    objc_enumerationMutation(v43);
                  }
                  uint64_t v30 = *(void *)(*((void *)&v56 + 1) + 8 * j);
                  dispatch_group_enter(v23);
                  v31 = [v25 property];
                  if (v9)
                  {
                    uint64_t v32 = v9[2](v9, v30, v31);

                    v31 = (void *)v32;
                  }
                  v50[0] = MEMORY[0x263EF8330];
                  v50[1] = 3221225472;
                  v50[2] = __113__NSArray_WFContentSortDescriptor__sortedArrayUsingContentSortDescriptors_propertySubstitutor_completionHandler___block_invoke;
                  v50[3] = &unk_26428A500;
                  id v51 = v31;
                  id v52 = v44;
                  id v53 = v45;
                  uint64_t v54 = v30;
                  v55 = v23;
                  id v33 = v31;
                  [v33 getValueForObject:v30 completionHandler:v50];
                }
                uint64_t v27 = [v43 countByEnumeratingWithState:&v56 objects:v68 count:16];
              }
              while (v27);
            }

            uint64_t v24 = v42 + 1;
          }
          while (v42 + 1 != v40);
          uint64_t v40 = [v38 countByEnumeratingWithState:&v60 objects:v69 count:16];
        }
        while (v40);
      }

      v34 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __113__NSArray_WFContentSortDescriptor__sortedArrayUsingContentSortDescriptors_propertySubstitutor_completionHandler___block_invoke_83;
      block[3] = &unk_26428A9D8;
      id v47 = v45;
      id v48 = v38;
      v10 = v36;
      v49 = v36;
      id v35 = v45;
      dispatch_group_notify(v23, v34, block);

      id v8 = v37;
    }
    else
    {
      v10[2](v10, a1);
    }
  }
}

- (uint64_t)sortedArrayUsingContentSortDescriptors:()WFContentSortDescriptor completionHandler:
{
  return [a1 sortedArrayUsingContentSortDescriptors:a3 propertySubstitutor:0 completionHandler:a4];
}

@end