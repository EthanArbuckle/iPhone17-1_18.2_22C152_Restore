@interface SGMISubmodelsAccumulator
- (NSDictionary)submodels;
- (SGMISubmodelsAccumulator)init;
- (void)commitToStore:(id)a3 updateDate:(id)a4;
- (void)ingest:(id)a3 asSalient:(BOOL)a4;
@end

@implementation SGMISubmodelsAccumulator

- (void).cxx_destruct
{
}

- (NSDictionary)submodels
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)commitToStore:(id)a3 updateDate:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = +[SGMIFeature submodeledFeatures];
  uint64_t v8 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        submodels = self->_submodels;
        v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "submodeledFeature"));
        v15 = [(NSDictionary *)submodels objectForKeyedSubscript:v14];
        objc_msgSend(v6, "commitNaiveBayesModel:probabilityFeatureName:updateDate:", v15, objc_msgSend(v12, "submodeledFeature"), v7);
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
}

- (void)ingest:(id)a3 asSalient:(BOOL)a4
{
  BOOL v19 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = +[SGMIFeature submodeledFeatures];
  uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v11 = objc_msgSend(v5, "feature:", objc_msgSend(v10, "unigramFeature"));
        v12 = [v11 stringArrayRepresentation];

        v13 = objc_msgSend(v5, "feature:", objc_msgSend(v10, "bigramFeature"));
        v14 = [v13 stringArrayRepresentation];

        submodels = self->_submodels;
        v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "submodeledFeature"));
        long long v17 = [(NSDictionary *)submodels objectForKeyedSubscript:v16];
        [v17 ingestUnigramTokens:v12 bigramTokens:v14 asSalient:v19];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }
}

- (SGMISubmodelsAccumulator)init
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)SGMISubmodelsAccumulator;
  v2 = [(SGMISubmodelsAccumulator *)&v20 init];
  v3 = v2;
  if (v2)
  {
    v15 = v2;
    v4 = (NSDictionary *)objc_opt_new();
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = +[SGMIFeature submodeledFeatures];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
          v11 = objc_opt_new();
          v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "submodeledFeature"));
          [(NSDictionary *)v4 setObject:v11 forKeyedSubscript:v12];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v7);
    }

    v3 = v15;
    submodels = v15->_submodels;
    v15->_submodels = v4;
  }
  return v3;
}

@end