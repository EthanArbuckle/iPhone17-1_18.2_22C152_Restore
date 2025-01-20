@interface MLBatchProviderUtils
+ (BOOL)vectorizeFeaturesNamed:(id)a3 fromBatch:(id)a4 intoRowsOfDoubleMatrix:(id)a5 error:(id *)a6;
+ (id)batchFromConcatinatingBatches:(id)a3;
+ (id)batchWithSubsetOfFeaturesNamed:(id)a3 fromBatch:(id)a4;
+ (id)dictionaryFromBatch:(id)a3;
+ (id)dictionaryFromBatch:(id)a3 featureNames:(id)a4;
+ (id)featureDescriptionsByNameForBatch:(id)a3 error:(id *)a4;
+ (id)featureNamesInBatch:(id)a3;
+ (id)featureProviderArrayFromBatch:(id)a3;
+ (id)featureValueArrayForName:(id)a3 batch:(id)a4 error:(id *)a5;
+ (id)lazyBatchIndexIntoBatch:(id)a3 indices:(id)a4 error:(id *)a5;
+ (id)lazyBatchWindowIntoBatch:(id)a3 startIndex:(unint64_t)a4 windowLength:(unint64_t)a5 error:(id *)a6;
+ (id)lazyBatchWithFeaturesInBatch:(id)a3 addedToBatch:(id)a4 error:(id *)a5;
@end

@implementation MLBatchProviderUtils

+ (id)featureDescriptionsByNameForBatch:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v5 = [a1 dictionaryFromBatch:a3];
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v7 = objc_msgSend(v5, "allKeys", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v13 = [v5 objectForKeyedSubscript:v12];
        v14 = +[MLFeatureTypeUtils featureDescriptionWithName:v12 consistentWithFeatureValues:v13 error:a4];

        if (!v14)
        {

          id v15 = 0;
          goto LABEL_11;
        }
        [v6 setObject:v14 forKeyedSubscript:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v15 = v6;
LABEL_11:

  return v15;
}

+ (id)featureValueArrayForName:(id)a3 batch:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [a1 featureNamesInBatch:v9];
  if ([v10 containsObject:v8])
  {
    v11 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v8, 0);
    uint64_t v12 = [a1 dictionaryFromBatch:v9 featureNames:v11];

    v13 = [v12 objectForKeyedSubscript:v8];
  }
  else if (a5)
  {
    +[MLModelErrorUtils genericErrorWithFormat:@"Feature '%@' is not provided", v8];
    v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)dictionaryFromBatch:(id)a3
{
  id v4 = a3;
  v5 = [a1 featureNamesInBatch:v4];
  v6 = [a1 dictionaryFromBatch:v4 featureNames:v5];

  return v6;
}

+ (id)dictionaryFromBatch:(id)a3 featureNames:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v33 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
        [v7 setObject:v14 forKeyedSubscript:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v10);
  }

  if ([v5 count] >= 1)
  {
    uint64_t v15 = 0;
    id v26 = v8;
    do
    {
      uint64_t v27 = v15;
      v16 = objc_msgSend(v5, "featuresAtIndex:", v15, v26);
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v17 = v8;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v29;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v29 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void *)(*((void *)&v28 + 1) + 8 * j);
            v23 = [v16 featureValueForName:v22];
            if (!v23)
            {
              v23 = +[MLFeatureValue undefinedFeatureValueWithType:0];
            }
            v24 = [v7 objectForKeyedSubscript:v22];
            [v24 addObject:v23];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
        }
        while (v19);
      }

      uint64_t v15 = v27 + 1;
      id v8 = v26;
    }
    while (v27 + 1 < [v5 count]);
  }

  return v7;
}

+ (id)featureProviderArrayFromBatch:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 array];
  }
  else
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
    if ([v3 count] >= 1)
    {
      uint64_t v5 = 0;
      do
      {
        id v6 = [v3 featuresAtIndex:v5];
        [v4 addObject:v6];

        ++v5;
      }
      while (v5 < [v3 count]);
    }
  }

  return v4;
}

+ (id)featureNamesInBatch:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if ([v3 count] >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      id v6 = [v3 featuresAtIndex:v5];
      v7 = [v6 featureNames];
      id v8 = [v7 allObjects];
      [v4 addObjectsFromArray:v8];

      ++v5;
    }
    while (v5 < [v3 count]);
  }

  return v4;
}

+ (id)batchWithSubsetOfFeaturesNamed:(id)a3 fromBatch:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  if ([v6 count] >= 1)
  {
    uint64_t v8 = 0;
    do
    {
      uint64_t v9 = [v6 featuresAtIndex:v8];
      uint64_t v10 = +[MLFeatureProviderUtils providerWithSubsetOfFeaturesNamed:v5 providedBy:v9];
      [v7 setObject:v10 atIndexedSubscript:v8];

      ++v8;
    }
    while (v8 < [v6 count]);
  }
  uint64_t v11 = [[MLArrayBatchProvider alloc] initWithFeatureProviderArray:v7];

  return v11;
}

+ (id)batchFromConcatinatingBatches:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count] == 1)
  {
    id v5 = [v4 objectAtIndexedSubscript:0];
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = objc_msgSend(a1, "featureProviderArrayFromBatch:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
          [v6 addObjectsFromArray:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    id v5 = [[MLArrayBatchProvider alloc] initWithFeatureProviderArray:v6];
  }

  return v5;
}

+ (id)lazyBatchWithFeaturesInBatch:(id)a3 addedToBatch:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [[MLLazyUnionBatchProvider alloc] initWithFeaturesFrom:v8 addedToFeaturesFrom:v7 error:a5];

  return v9;
}

+ (id)lazyBatchIndexIntoBatch:(id)a3 indices:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [[MLIndexedBatchProvider alloc] initWithBatch:v8 indices:v7 error:a5];

  return v9;
}

+ (id)lazyBatchWindowIntoBatch:(id)a3 startIndex:(unint64_t)a4 windowLength:(unint64_t)a5 error:(id *)a6
{
  id v9 = a3;
  uint64_t v10 = [[MLWindowedBatchProvider alloc] initWithBatch:v9 startIndex:a4 windowLength:a5 error:a6];

  return v10;
}

+ (BOOL)vectorizeFeaturesNamed:(id)a3 fromBatch:(id)a4 intoRowsOfDoubleMatrix:(id)a5 error:(id *)a6
{
  id v44 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v10 shape];
  uint64_t v12 = [v11 count];

  if (v12 != 2)
  {
    v36 = NSNumber;
    v37 = [v10 shape];
    uint64_t v38 = objc_msgSend(v36, "numberWithUnsignedInteger:", objc_msgSend(v37, "count"));
    id v30 = +[MLModelErrorUtils genericErrorWithFormat:@"Expected to vectorize into matrix, but was passed a %@ multiarray", v38];
    goto LABEL_10;
  }
  uint64_t v13 = [v10 shape];
  long long v14 = [v13 objectAtIndexedSubscript:0];
  uint64_t v15 = [v14 integerValue];
  uint64_t v16 = [v9 count];

  if (v15 != v16)
  {
    v37 = [v10 shape];
    uint64_t v38 = [v37 objectAtIndexedSubscript:0];
    v39 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "count"));
    id v30 = +[MLModelErrorUtils genericErrorWithFormat:@"Row count of matrix (%@) does not match batch size (%@)", v38, v39];

LABEL_10:
    if (a6)
    {
      id v30 = v30;
LABEL_12:
      BOOL v23 = 0;
      *a6 = v30;
    }
    else
    {
      BOOL v23 = 0;
    }
    goto LABEL_19;
  }
  id v17 = v10;
  uint64_t v18 = [v17 mutableBytes];
  uint64_t v19 = [v17 strides];
  uint64_t v20 = [v19 objectAtIndexedSubscript:0];
  uint64_t v21 = [v20 unsignedIntegerValue];

  uint64_t v22 = [v17 strides];
  BOOL v23 = 1;
  v24 = [v22 objectAtIndexedSubscript:1];
  uint64_t v43 = [v24 unsignedIntegerValue];

  v25 = [v17 shape];
  id v26 = [v25 objectAtIndexedSubscript:1];
  uint64_t v27 = [v26 unsignedIntegerValue];

  if ([v9 count] < 1)
  {
    id v30 = 0;
  }
  else
  {
    v41 = a6;
    id v42 = v10;
    uint64_t v28 = 0;
    uint64_t v29 = v21;
    id v30 = 0;
    uint64_t v31 = 8 * v29;
    while (1)
    {
      long long v32 = v30;
      long long v33 = [v9 featuresAtIndex:v28];
      long long v34 = (void *)MEMORY[0x19F3C29E0]();
      id v45 = v30;
      BOOL v35 = +[MLFeatureProviderUtils vectorizeFeaturesProvidedBy:v33 featureNames:v44 intoDoubleVector:v18 length:v27 stride:v43 error:&v45];
      id v30 = v45;

      if (!v35) {
        break;
      }
      ++v28;
      v18 += v31;
      if (v28 >= [v9 count])
      {
        BOOL v23 = 1;
        goto LABEL_18;
      }
    }
    a6 = v41;
    if (v41)
    {
      id v30 = v30;
      id v10 = v42;
      goto LABEL_12;
    }
    BOOL v23 = 0;
LABEL_18:
    id v10 = v42;
  }
LABEL_19:

  return v23;
}

@end