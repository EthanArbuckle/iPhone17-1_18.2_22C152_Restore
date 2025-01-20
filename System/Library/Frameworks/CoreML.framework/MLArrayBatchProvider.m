@interface MLArrayBatchProvider
- (MLArrayBatchProvider)initWithDictionary:(NSDictionary *)dictionary error:(NSError *)error;
- (MLArrayBatchProvider)initWithFeatureProviderArray:(NSArray *)array;
- (NSArray)array;
- (id)featuresAtIndex:(int64_t)a3;
- (int64_t)count;
@end

@implementation MLArrayBatchProvider

- (void).cxx_destruct
{
}

- (NSArray)array
{
  return self->_array;
}

- (id)featuresAtIndex:(int64_t)a3
{
  int64_t v3 = a3;
  if (a3 < 0) {
    int64_t v3 = [(NSArray *)self->_array count] + a3;
  }
  array = self->_array;

  return [(NSArray *)array objectAtIndexedSubscript:v3];
}

- (int64_t)count
{
  return [(NSArray *)self->_array count];
}

- (MLArrayBatchProvider)initWithDictionary:(NSDictionary *)dictionary error:(NSError *)error
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  v45 = dictionary;
  v4 = [(NSDictionary *)v45 allKeys];
  v40 = [MEMORY[0x1E4F1C9E8] sharedKeySetForKeys:v4];
  v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithSharedKeySet:");
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v53;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v53 != v9) {
        objc_enumerationMutation(obj);
      }
      uint64_t v11 = *(void *)(*((void *)&v52 + 1) + 8 * v10);
      v12 = [(NSDictionary *)v45 objectForKeyedSubscript:v11];
      if ([v5 count])
      {
        if ([v12 count] != v8) {
          break;
        }
      }
      uint64_t v8 = [v12 count];
      id v51 = 0;
      int64_t v13 = +[MLFeatureTypeUtils featureTypeForValuesInArray:v12 error:&v51];
      id v14 = v51;
      if (v14)
      {
        v16 = v14;
        v17 = +[MLModelErrorUtils errorWithCode:0, v14, @"Failed to determine type of feature '%@'.", v11 underlyingError format];
        goto LABEL_16;
      }
      v15 = [NSNumber numberWithInteger:v13];
      [v5 setObject:v15 forKeyedSubscript:v11];

      if (v7 == ++v10)
      {
        uint64_t v7 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }
    v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
    v18 = [NSNumber numberWithUnsignedInteger:v8];
    v17 = +[MLModelErrorUtils genericErrorWithFormat:@"The must be the same value count for each feature. Feature '%@' has %@ values. Expected %@", v11, v16, v18];

LABEL_16:
    if (!v17) {
      goto LABEL_19;
    }
    if (error)
    {
      v17 = v17;
      v19 = 0;
      *error = v17;
    }
    else
    {
      v19 = 0;
    }
    v34 = self;
  }
  else
  {
    uint64_t v8 = 0;
LABEL_13:

LABEL_19:
    uint64_t v20 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8];
    v21 = (void *)v20;
    v17 = 0;
    if (v8)
    {
      uint64_t v44 = 0;
      v37 = (void *)v20;
      do
      {
        v43 = [MEMORY[0x1E4F1CA60] dictionaryWithSharedKeySet:v40];
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v41 = obj;
        uint64_t v22 = [v41 countByEnumeratingWithState:&v47 objects:v56 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v48;
          while (2)
          {
            uint64_t v25 = 0;
            v26 = v17;
            do
            {
              if (*(void *)v48 != v24) {
                objc_enumerationMutation(v41);
              }
              uint64_t v27 = *(void *)(*((void *)&v47 + 1) + 8 * v25);
              v28 = [(NSDictionary *)v45 objectForKeyedSubscript:v27];
              v29 = [v28 objectAtIndexedSubscript:v44];

              v30 = [v5 objectForKeyedSubscript:v27];
              uint64_t v31 = [v30 integerValue];

              v46 = v26;
              v32 = +[MLFeatureValue featureValueOfType:v31 fromObject:v29 error:&v46];
              v17 = v46;

              if (!v32)
              {
                if (error)
                {
                  v35 = [NSNumber numberWithUnsignedInteger:v44];
                  *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
                }
                v19 = 0;
                v34 = self;
                v21 = v37;
                goto LABEL_34;
              }
              [v43 setObject:v32 forKeyedSubscript:v27];

              ++v25;
              v26 = v17;
            }
            while (v23 != v25);
            uint64_t v23 = [v41 countByEnumeratingWithState:&v47 objects:v56 count:16];
            if (v23) {
              continue;
            }
            break;
          }
        }

        v33 = [[MLDictionaryFeatureProvider alloc] initWithFeatureValueDictionary:v43];
        v21 = v37;
        [v37 addObject:v33];

        ++v44;
      }
      while (v44 != v8);
    }
    v34 = [(MLArrayBatchProvider *)self initWithFeatureProviderArray:v21];
    v19 = v34;
LABEL_34:
  }
  return v19;
}

- (MLArrayBatchProvider)initWithFeatureProviderArray:(NSArray *)array
{
  v5 = array;
  v9.receiver = self;
  v9.super_class = (Class)MLArrayBatchProvider;
  uint64_t v6 = [(MLArrayBatchProvider *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_array, array);
  }

  return v7;
}

@end