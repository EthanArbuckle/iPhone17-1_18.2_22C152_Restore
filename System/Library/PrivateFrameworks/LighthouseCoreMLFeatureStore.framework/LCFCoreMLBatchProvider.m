@interface LCFCoreMLBatchProvider
+ (id)fromMLProvider:(id)a3;
- (NSArray)featureProviders;
- (NSDate)timeFirst;
- (NSDate)timeLast;
- (NSString)featureStoreKey;
- (id)featuresAtIndex:(int64_t)a3;
- (id)init:(id)a3 featureProviders:(id)a4;
- (int64_t)count;
@end

@implementation LCFCoreMLBatchProvider

- (id)init:(id)a3 featureProviders:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v34.receiver = self;
  v34.super_class = (Class)LCFCoreMLBatchProvider;
  v9 = [(LCFCoreMLBatchProvider *)&v34 init];
  v10 = v9;
  if (v9)
  {
    id v29 = v7;
    objc_storeStrong((id *)&v9->_featureStoreKey, a3);
    v10->_count = [v8 count];
    objc_storeStrong((id *)&v10->_featureProviders, a4);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v28 = v8;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (!v12)
    {
      v14 = 0;
      uint64_t v15 = 0;
      goto LABEL_22;
    }
    uint64_t v13 = v12;
    v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v31;
    while (1)
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(v11);
        }
        v18 = *(void **)(*((void *)&v30 + 1) + 8 * v17);
        if (v14)
        {
          if (v15) {
            goto LABEL_9;
          }
        }
        else
        {
          v14 = [*(id *)(*((void *)&v30 + 1) + 8 * v17) timestamp];
          if (v15) {
            goto LABEL_9;
          }
        }
        uint64_t v15 = objc_msgSend(v18, "timestamp", v28);
LABEL_9:
        v19 = objc_msgSend(v18, "timestamp", v28);
        uint64_t v20 = [(NSDate *)v14 compare:v19];

        uint64_t v21 = [v18 timestamp];
        if (v20 == -1) {
          v22 = (void *)v15;
        }
        else {
          v22 = v14;
        }
        if (v20 == -1) {
          uint64_t v15 = v21;
        }
        else {
          v14 = (NSDate *)v21;
        }

        ++v17;
      }
      while (v13 != v17);
      uint64_t v23 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
      uint64_t v13 = v23;
      if (!v23)
      {
LABEL_22:

        timeFirst = v10->_timeFirst;
        v10->_timeFirst = v14;
        v25 = v14;

        timeLast = v10->_timeLast;
        v10->_timeLast = (NSDate *)v15;

        id v8 = v28;
        id v7 = v29;
        break;
      }
    }
  }

  return v10;
}

- (id)featuresAtIndex:(int64_t)a3
{
  return [(NSArray *)self->_featureProviders objectAtIndexedSubscript:a3];
}

+ (id)fromMLProvider:(id)a3
{
  id v3 = a3;
  return v3;
}

- (NSString)featureStoreKey
{
  return self->_featureStoreKey;
}

- (NSDate)timeFirst
{
  return self->_timeFirst;
}

- (NSDate)timeLast
{
  return self->_timeLast;
}

- (int64_t)count
{
  return self->_count;
}

- (NSArray)featureProviders
{
  return self->_featureProviders;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureProviders, 0);
  objc_storeStrong((id *)&self->_timeLast, 0);
  objc_storeStrong((id *)&self->_timeFirst, 0);
  objc_storeStrong((id *)&self->_featureStoreKey, 0);
}

@end