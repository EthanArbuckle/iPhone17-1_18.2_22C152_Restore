@interface CRKFeatureDataStoreHeuristics_MCX
+ (id)overrideFeaturesByFeature;
+ (id)overrideIsForcedByFeature;
- (BOOL)applyIsForcedHeuristicsToFeature:(id)a3 isForced:(BOOL)a4;
- (CRKFeatureDataStoreHeuristics_MCX)initWithDataStore:(id)a3;
- (CRKFeatureDataStoreProtocol)dataStore;
- (unint64_t)applyHeuristicsToFeature:(id)a3 BOOLType:(unint64_t)a4;
- (void)setDataStore:(id)a3;
@end

@implementation CRKFeatureDataStoreHeuristics_MCX

- (CRKFeatureDataStoreHeuristics_MCX)initWithDataStore:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRKFeatureDataStoreHeuristics_MCX;
  v5 = [(CRKFeatureDataStoreHeuristics_MCX *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_dataStore, v4);
  }

  return v6;
}

- (BOOL)applyIsForcedHeuristicsToFeature:(id)a3 isForced:(BOOL)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (a4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_super v8 = [(CRKFeatureDataStoreHeuristics_MCX *)self dataStore];
    char v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0
      && ([(id)objc_opt_class() overrideIsForcedByFeature],
          v10 = objc_claimAutoreleasedReturnValue(),
          [v10 allKeys],
          v11 = objc_claimAutoreleasedReturnValue(),
          int v12 = [v11 containsObject:v6],
          v11,
          v10,
          v12))
    {
      v13 = [(id)objc_opt_class() overrideIsForcedByFeature];
      v14 = [v13 objectForKeyedSubscript:v6];

      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v24;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v24 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void *)(*((void *)&v23 + 1) + 8 * i);
            v21 = [(CRKFeatureDataStoreHeuristics_MCX *)self dataStore];
            LOBYTE(v20) = [v21 isFeatureForced:v20];

            if (v20)
            {
              BOOL v7 = 1;
              goto LABEL_16;
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }
      BOOL v7 = 0;
LABEL_16:
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)applyHeuristicsToFeature:(id)a3 BOOLType:(unint64_t)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = [(id)objc_opt_class() overrideFeaturesByFeature];
  objc_super v8 = [v7 allKeys];
  int v9 = [v8 containsObject:v6];

  if (v9)
  {
    v10 = [(id)objc_opt_class() overrideFeaturesByFeature];
    v11 = [v10 objectForKeyedSubscript:v6];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v18 = [(CRKFeatureDataStoreHeuristics_MCX *)self dataStore];
          uint64_t v19 = [v18 BOOLRestrictionForFeature:v17];

          if (v19 == 2)
          {
            a4 = 2;
            goto LABEL_12;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  return a4;
}

+ (id)overrideIsForcedByFeature
{
  if (overrideIsForcedByFeature_onceToken != -1) {
    dispatch_once(&overrideIsForcedByFeature_onceToken, &__block_literal_global_24);
  }
  v2 = (void *)overrideIsForcedByFeature_overrideIsForcedByFeature;

  return v2;
}

+ (id)overrideFeaturesByFeature
{
  if (overrideFeaturesByFeature_onceToken != -1) {
    dispatch_once(&overrideFeaturesByFeature_onceToken, &__block_literal_global_6_0);
  }
  v2 = (void *)overrideFeaturesByFeature_overrideFeaturesByFeature;

  return v2;
}

- (CRKFeatureDataStoreProtocol)dataStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataStore);

  return (CRKFeatureDataStoreProtocol *)WeakRetained;
}

- (void)setDataStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end