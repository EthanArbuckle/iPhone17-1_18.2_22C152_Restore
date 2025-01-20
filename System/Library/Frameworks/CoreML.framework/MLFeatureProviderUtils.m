@interface MLFeatureProviderUtils
+ (BOOL)_vectorizeWithoutSizeCheckFeatureValues:(id)a3 intoDoubleVector:(double *)a4 stride:(unint64_t)a5 error:(id *)a6;
+ (BOOL)canVectorizeAllFeaturesWithDescriptions:(id)a3;
+ (BOOL)canVectorizeFeatureWithDescription:(id)a3;
+ (BOOL)vectorizeFeaturesProvidedBy:(id)a3 featureNames:(id)a4 intoDoubleVector:(double *)a5 length:(unint64_t)a6 stride:(unint64_t)a7 error:(id *)a8;
+ (id)_featureValuesForNames:(id)a3 providedBy:(id)a4 error:(id *)a5;
+ (id)lazyProviderWithFeaturesProvidedBy:(id)a3 addedToFeaturesProvidedBy:(id)a4;
+ (id)providerWithSubsetOfFeaturesNamed:(id)a3 providedBy:(id)a4;
+ (id)vectorizeFeaturesProvidedBy:(id)a3 featureNames:(id)a4 error:(id *)a5;
+ (int64_t)_vectorizedSizeOfFeatureValues:(id)a3 error:(id *)a4;
@end

@implementation MLFeatureProviderUtils

+ (BOOL)canVectorizeAllFeaturesWithDescriptions:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = objc_msgSend(v3, "allKeys", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = [v3 objectForKeyedSubscript:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        BOOL v9 = +[MLFeatureProviderUtils canVectorizeFeatureWithDescription:v8];

        if (!v9)
        {
          BOOL v10 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

+ (BOOL)canVectorizeFeatureWithDescription:(id)a3
{
  unint64_t v3 = [a3 type];
  return (v3 > 8) | (0x26u >> v3) & 1;
}

+ (id)vectorizeFeaturesProvidedBy:(id)a3 featureNames:(id)a4 error:(id *)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [a1 _featureValuesForNames:v9 providedBy:v8 error:a5];
  if (!v10 || (uint64_t v11 = [a1 _vectorizedSizeOfFeatureValues:v10 error:a5], v11 < 0))
  {
    uint64_t v17 = 0;
  }
  else
  {
    long long v12 = [MLMultiArray alloc];
    long long v13 = [NSNumber numberWithInteger:v11];
    v19[0] = v13;
    long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    long long v15 = [(MLMultiArray *)v12 initWithShape:v14 dataType:65600 error:a5];

    v16 = v15;
    if (objc_msgSend(a1, "_vectorizeWithoutSizeCheckFeatureValues:intoDoubleVector:stride:error:", v10, -[MLMultiArray mutableBytes](v16, "mutableBytes"), 1, a5))uint64_t v17 = v16; {
    else
    }
      uint64_t v17 = 0;
  }

  return v17;
}

+ (BOOL)vectorizeFeaturesProvidedBy:(id)a3 featureNames:(id)a4 intoDoubleVector:(double *)a5 length:(unint64_t)a6 stride:(unint64_t)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  v16 = [a1 _featureValuesForNames:v15 providedBy:v14 error:a8];
  if (!v16) {
    goto LABEL_7;
  }
  uint64_t v17 = [a1 _vectorizedSizeOfFeatureValues:v16 error:a8];
  uint64_t v18 = v17;
  if (v17 < 0) {
    goto LABEL_7;
  }
  if (v17 != a6)
  {
    if (!a8) {
      goto LABEL_8;
    }
    v19 = [NSNumber numberWithUnsignedInteger:a6];
    v20 = [NSNumber numberWithInteger:v18];
    *a8 = +[MLModelErrorUtils genericErrorWithFormat:@"Incorrect 'doubleVector' length of %@ (expected %@)", v19, v20];

LABEL_7:
    LOBYTE(a8) = 0;
    goto LABEL_8;
  }
  LOBYTE(a8) = [a1 _vectorizeWithoutSizeCheckFeatureValues:v16 intoDoubleVector:a5 stride:a7 error:a8];
LABEL_8:

  return (char)a8;
}

+ (BOOL)_vectorizeWithoutSizeCheckFeatureValues:(id)a3 intoDoubleVector:(double *)a4 stride:(unint64_t)a5 error:(id *)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = a3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v24;
LABEL_3:
    uint64_t v12 = 0;
    while (2)
    {
      if (*(void *)v24 != v11) {
        objc_enumerationMutation(v8);
      }
      long long v13 = *(void **)(*((void *)&v23 + 1) + 8 * v12);
      id v14 = &a4[v10 * a5];
      switch([v13 type])
      {
        case 0:
        case 3:
        case 4:
        case 6:
        case 7:
        case 8:
          if (!a6) {
            goto LABEL_21;
          }
          +[MLModelErrorUtils genericErrorWithFormat:@"Internal programming error."];
          BOOL v18 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_22;
        case 1:
          double v15 = (double)[v13 int64Value];
          goto LABEL_9;
        case 2:
          [v13 doubleValue];
LABEL_9:
          *id v14 = v15;
          ++v10;
          goto LABEL_12;
        case 5:
          v21 = [v13 multiArrayValue];
          uint64_t v16 = [v21 multiArrayBuffer];
          if (v16)
          {
            uint64_t v17 = *(void *)(v16 + 80);
            *(void *)operator new(8uLL) = v17;
            *(void *)operator new(8uLL) = a5;
            CoreML::MultiArrayBuffer::MultiArrayBuffer(v22, (uint64_t)v14);
          }
          if (a6)
          {
            *a6 = +[MLModelErrorUtils genericErrorWithFormat:@"Failed to vectorize %@ (%p)", v21, 0];
          }

LABEL_21:
          BOOL v18 = 0;
          goto LABEL_22;
        default:
LABEL_12:
          if (v9 != ++v12) {
            continue;
          }
          uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
          BOOL v18 = 1;
          if (!v9) {
            goto LABEL_22;
          }
          goto LABEL_3;
      }
    }
  }
  BOOL v18 = 1;
LABEL_22:

  return v18;
}

+ (int64_t)_vectorizedSizeOfFeatureValues:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = a3;
  int64_t v6 = 0;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        unint64_t v11 = [v10 type];
        if (v11 <= 8)
        {
          if (((1 << v11) & 6) != 0)
          {
            ++v6;
          }
          else
          {
            if (v11 != 5)
            {
              if (a4)
              {
                id v14 = +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:", [v10 type]);
                *a4 = +[MLModelErrorUtils genericErrorWithFormat:@"Feature type %@ cannot be vectorized", v14];
              }
              int64_t v6 = -1;
              goto LABEL_17;
            }
            uint64_t v12 = [v10 multiArrayValue];
            uint64_t v13 = [v12 count];

            v6 += v13;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  return v6;
}

+ (id)_featureValuesForNames:(id)a3 providedBy:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  for (unint64_t i = 0; ; ++i)
  {
    if (i >= [v7 count])
    {
      id v13 = v9;
      goto LABEL_9;
    }
    unint64_t v11 = [v7 objectAtIndexedSubscript:i];
    uint64_t v12 = [v8 featureValueForName:v11];
    if (!v12) {
      break;
    }
    [v9 addObject:v12];
  }
  if (a5)
  {
    *a5 = +[MLModelErrorUtils genericErrorWithFormat:@"Feature '%@' not provided.", v11];
  }

  id v13 = 0;
LABEL_9:

  return v13;
}

+ (id)lazyProviderWithFeaturesProvidedBy:(id)a3 addedToFeaturesProvidedBy:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [[MLLazyUnionFeatureProvider alloc] initWithFeaturesFrom:v5 addedToFeaturesFrom:v6];

  return v7;
}

+ (id)providerWithSubsetOfFeaturesNamed:(id)a3 providedBy:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v13 = objc_msgSend(v6, "featureValueForName:", v12, (void)v16);
        if (v13) {
          [v7 setObject:v13 forKeyedSubscript:v12];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  id v14 = [[MLDictionaryFeatureProvider alloc] initWithFeatureValueDictionary:v7];

  return v14;
}

@end