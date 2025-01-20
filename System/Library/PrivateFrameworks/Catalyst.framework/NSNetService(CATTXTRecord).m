@interface NSNetService(CATTXTRecord)
+ (id)cat_dataFromDictionary:()CATTXTRecord;
+ (id)cat_dictionaryFromData:()CATTXTRecord;
@end

@implementation NSNetService(CATTXTRecord)

+ (id)cat_dictionaryFromData:()CATTXTRecord
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    v4 = objc_opt_new();
    context = (void *)MEMORY[0x2166930C0]();
    id v29 = v3;
    v5 = [MEMORY[0x263EFC5F0] dictionaryFromTXTRecordData:v3];
    v6 = [v5 allKeys];
    v7 = [MEMORY[0x263EFF9C0] setWithArray:v6];
    v26 = [v6 indexesOfObjectsPassingTest:&__block_literal_global_28];
    v27 = v6;
    v8 = objc_msgSend(v6, "objectsAtIndexes:");
    v9 = [MEMORY[0x263EFFA08] setWithArray:v8];
    [v7 minusSet:v9];

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    obuint64_t j = v8;
    uint64_t v32 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v32)
    {
      uint64_t v31 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v38 != v31) {
            objc_enumerationMutation(obj);
          }
          v11 = [*(id *)(*((void *)&v37 + 1) + 8 * i) substringToIndex:objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * i), "length") - objc_msgSend(@"-0", "length")];
          v12 = objc_opt_new();
          for (uint64_t j = 0; ; ++j)
          {
            v14 = objc_msgSend(v11, "stringByAppendingFormat:", @"-%lu", j);
            [v7 removeObject:v14];
            uint64_t v15 = [v5 objectForKeyedSubscript:v14];
            if (!v15) {
              break;
            }
            v16 = (void *)v15;
            [v12 appendData:v15];
          }
          [v4 setObject:v12 forKeyedSubscript:v11];
        }
        uint64_t v32 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v32);
    }

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v17 = v7;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v34;
      do
      {
        for (uint64_t k = 0; k != v19; ++k)
        {
          if (*(void *)v34 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v33 + 1) + 8 * k);
          v23 = [v5 objectForKeyedSubscript:v22];
          [v4 setObject:v23 forKeyedSubscript:v22];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v19);
    }

    v24 = (void *)[v4 copy];

    id v3 = v29;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

+ (id)cat_dataFromDictionary:()CATTXTRecord
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = v3;
  uint64_t v24 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v30;
    v5 = @"-%lu";
    v28 = v4;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = v6;
        v7 = *(void **)(*((void *)&v29 + 1) + 8 * v6);
        v8 = [obj objectForKeyedSubscript:v7];
        uint64_t v9 = [v7 length];
        unint64_t v10 = 249 - v9;
        unint64_t v11 = [v8 length] / (unint64_t)(249 - v9);
        if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        {
          [v4 setObject:v8 forKey:v7];
        }
        else
        {
          uint64_t v12 = 0;
          uint64_t v13 = 0;
          uint64_t v14 = 0;
          unint64_t v27 = v11 + 1;
          uint64_t v15 = v9 - 249;
          do
          {
            uint64_t v16 = [v8 length];
            if (v10 >= v16 + v12) {
              unint64_t v17 = v16 + v12;
            }
            else {
              unint64_t v17 = v10;
            }
            uint64_t v18 = objc_msgSend(v8, "subdataWithRange:", v13, v17);
            objc_msgSend(v7, "stringByAppendingFormat:", v5, v14);
            v20 = uint64_t v19 = v5;
            [v28 setObject:v18 forKey:v20];

            v5 = v19;
            ++v14;
            v13 += v10;
            v12 += v15;
          }
          while (v27 != v14);
        }

        uint64_t v6 = v26 + 1;
        v4 = v28;
      }
      while (v26 + 1 != v24);
      uint64_t v24 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v24);
  }

  v21 = [MEMORY[0x263EFC5F0] dataFromTXTRecordDictionary:v4];

  return v21;
}

@end