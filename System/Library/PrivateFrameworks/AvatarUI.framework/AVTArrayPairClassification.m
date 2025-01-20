@interface AVTArrayPairClassification
+ (id)clustersForObjectsInArray:(id)a3 withClassifier:(id)a4 likenessThreshold:(id)a5 likenessComparator:(id)a6;
+ (id)countPairTypesInArray:(id)a3 withClassifier:(id)a4;
@end

@implementation AVTArrayPairClassification

+ (id)countPairTypesInArray:(id)a3 withClassifier:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void *, void *))a4;
  if ([v5 count])
  {
    v7 = [MEMORY[0x263EFF9A0] dictionary];
    if ([v5 count] != 1)
    {
      uint64_t v8 = 0;
      do
      {
        unint64_t v18 = v8 + 1;
        if (v8 + 1 < (unint64_t)[v5 count])
        {
          unint64_t v9 = v8 + 1;
          do
          {
            v10 = [v5 objectAtIndexedSubscript:v8];
            v11 = [v5 objectAtIndexedSubscript:v9];
            v12 = v6[2](v6, v10, v11);

            v13 = NSNumber;
            v14 = [v7 objectForKeyedSubscript:v12];
            v15 = objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v14, "integerValue") + 1);

            [v7 setObject:v15 forKeyedSubscript:v12];
            ++v9;
          }
          while (v9 < [v5 count]);
        }
        ++v8;
      }
      while (v18 < [v5 count] - 1);
    }
    v16 = (void *)[v7 copy];
  }
  else
  {
    v16 = (void *)MEMORY[0x263EFFA78];
  }

  return v16;
}

+ (id)clustersForObjectsInArray:(id)a3 withClassifier:(id)a4 likenessThreshold:(id)a5 likenessComparator:(id)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v28 = a4;
  id v27 = a5;
  id v10 = a6;
  v11 = [MEMORY[0x263EFF9A0] dictionary];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v9;
  uint64_t v12 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v34 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __108__AVTArrayPairClassification_clustersForObjectsInArray_withClassifier_likenessThreshold_likenessComparator___block_invoke;
        v29[3] = &unk_263FF1390;
        id v31 = v28;
        v29[4] = v16;
        id v32 = v10;
        id v30 = v27;
        v17 = [v11 keysOfEntriesPassingTest:v29];
        unint64_t v18 = [v17 anyObject];

        if (v18) {
          v19 = v18;
        }
        else {
          v19 = v16;
        }
        v20 = NSNumber;
        id v21 = v19;
        v22 = [v11 objectForKeyedSubscript:v21];
        v23 = objc_msgSend(v20, "numberWithInteger:", objc_msgSend(v22, "integerValue") + 1);
        [v11 setObject:v23 forKeyedSubscript:v21];
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v13);
  }

  v24 = [v11 allValues];

  return v24;
}

BOOL __108__AVTArrayPairClassification_clustersForObjectsInArray_withClassifier_likenessThreshold_likenessComparator___block_invoke(uint64_t a1)
{
  v2 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  BOOL v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))() != 1;

  return v3;
}

@end