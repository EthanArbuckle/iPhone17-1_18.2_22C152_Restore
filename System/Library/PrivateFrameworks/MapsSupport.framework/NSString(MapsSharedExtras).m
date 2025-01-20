@interface NSString(MapsSharedExtras)
- (id)_maps_prefixMatchesForSearchString:()MapsSharedExtras;
@end

@implementation NSString(MapsSharedExtras)

- (id)_maps_prefixMatchesForSearchString:()MapsSharedExtras
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  v6 = (void *)MEMORY[0x1BA9C28D0]();
  v7 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v8 = [v4 length];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __65__NSString_MapsSharedExtras___maps_prefixMatchesForSearchString___block_invoke;
  v45[3] = &unk_1E617DFC0;
  id v9 = v7;
  id v46 = v9;
  objc_msgSend(v4, "enumerateSubstringsInRange:options:usingBlock:", 0, v8, 1027, v45);
  v10 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v11 = [a1 length];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __65__NSString_MapsSharedExtras___maps_prefixMatchesForSearchString___block_invoke_2;
  v43[3] = &unk_1E617DFC0;
  id v12 = v10;
  id v44 = v12;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v11, 1027, v43);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v9;
  uint64_t v34 = [obj countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v34)
  {
    v32 = v5;
    uint64_t v33 = *(void *)v40;
    context = v6;
    id v29 = v4;
    v31 = v12;
    while (1)
    {
      uint64_t v13 = 0;
LABEL_4:
      if (*(void *)v40 != v33) {
        objc_enumerationMutation(obj);
      }
      v14 = *(void **)(*((void *)&v39 + 1) + 8 * v13);
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      v15 = (void *)[v12 copy];
      uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v47 count:16];
      if (!v16) {
        break;
      }
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v36;
LABEL_8:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v36 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v35 + 1) + 8 * v19);
        v21 = [v20 objectAtIndexedSubscript:0];
        v22 = [v20 objectAtIndexedSubscript:1];
        uint64_t v23 = [v22 rangeValue];

        if (![v21 localizedStandardRangeOfString:v14]) {
          break;
        }

        if (v17 == ++v19)
        {
          uint64_t v17 = [v15 countByEnumeratingWithState:&v35 objects:v47 count:16];
          if (v17) {
            goto LABEL_8;
          }
          goto LABEL_18;
        }
      }
      uint64_t v24 = [v14 length];
      v25 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v23, v24);
      v5 = v32;
      [v32 addObject:v25];

      id v12 = v31;
      [v31 removeObject:v20];

      if (++v13 != v34) {
        goto LABEL_4;
      }
      v6 = context;
      id v4 = v29;
      uint64_t v34 = [obj countByEnumeratingWithState:&v39 objects:v48 count:16];
      if (!v34) {
        goto LABEL_17;
      }
    }
LABEL_18:

    id v26 = 0;
    id v4 = v29;
    v5 = v32;
  }
  else
  {
LABEL_17:

    id v26 = v5;
  }

  return v26;
}

@end