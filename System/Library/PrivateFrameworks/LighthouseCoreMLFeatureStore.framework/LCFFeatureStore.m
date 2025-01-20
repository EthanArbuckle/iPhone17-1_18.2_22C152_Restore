@interface LCFFeatureStore
- (BOOL)pruneFrom:(id)a3 endDate:(id)a4 option:(unint64_t)a5;
- (BOOL)updateFeatureSet:(id)a3;
- (BOOL)updateFeatureSet:(id)a3 featureVestion:(id)a4 featureValues:(id)a5;
- (BOOL)useSqlite;
- (LCFBiomeManager)biomeManagerLabeledDataStore;
- (LCFDatabaseConnection)dbFeatureStore;
- (NSString)featureStoreKey;
- (id)featureProviderFromfeatureSet:(id)a3 featureNames:(id)a4;
- (id)getFeatureSets:(id)a3 startDate:(id)a4 endDate:(id)a5 option:(unint64_t)a6;
- (id)getFeatureVector:(id)a3 atTime:(id)a4 option:(unint64_t)a5;
- (id)getFeatureVector:(id)a3 option:(unint64_t)a4;
- (id)getFeatureVectorTimestamps;
- (id)getFeatureVectorWithStoreEvents:(id)a3 storeEventsInReversedOrder:(id)a4 option:(unint64_t)a5;
- (id)getFeatureVectors:(id)a3 option:(unint64_t)a4;
- (id)getFeatureVectors:(id)a3 startDate:(id)a4 endDate:(id)a5 option:(unint64_t)a6;
- (id)getMultiArrayFeatureVectors:(id)a3 vectorName:(id)a4 srcLabelName:(id)a5 destLabelName:(id)a6 option:(unint64_t)a7;
- (id)getMultiArrayFeatureVectors:(id)a3 vectorName:(id)a4 srcLabelName:(id)a5 destLabelName:(id)a6 startDate:(id)a7 endDate:(id)a8 option:(unint64_t)a9;
- (id)init:(id)a3 url:(id)a4 useSqlite:(BOOL)a5;
@end

@implementation LCFFeatureStore

- (id)init:(id)a3 url:(id)a4 useSqlite:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v21.receiver = self;
  v21.super_class = (Class)LCFFeatureStore;
  v11 = [(LCFFeatureStore *)&v21 init];
  if (v11)
  {
    LCFLoggingUtilsInit();
    objc_storeStrong((id *)&v11->_featureStoreKey, a3);
    v11->_useSqlite = v5;
    if (v5)
    {
      v12 = [[LCFDatabaseConnection alloc] init:v10 databaseName:v9 tableName:@"featureStore"];
      dbFeatureStore = v11->_dbFeatureStore;
      v11->_dbFeatureStore = v12;
    }
    else
    {
      v14 = [LCFBiomeManager alloc];
      dbFeatureStore = BiomeLibrary();
      v15 = [dbFeatureStore MLSE];
      v16 = [v15 ShareSheet];
      v17 = [v16 LabeledDataStore];
      uint64_t v18 = [(LCFBiomeManager *)v14 init:v17];
      biomeManagerLabeledDataStore = v11->_biomeManagerLabeledDataStore;
      v11->_biomeManagerLabeledDataStore = (LCFBiomeManager *)v18;
    }
  }

  return v11;
}

- (BOOL)updateFeatureSet:(id)a3
{
  if (self->_useSqlite)
  {
    dbFeatureStore = self->_dbFeatureStore;
    return [(LCFDatabaseConnection *)dbFeatureStore writeFeatures:a3];
  }
  else
  {
    biomeManagerLabeledDataStore = self->_biomeManagerLabeledDataStore;
    v6 = +[LCFFeatureConverter fromFeatureSetToLabeledData:a3];
    LOBYTE(biomeManagerLabeledDataStore) = [(LCFBiomeManager *)biomeManagerLabeledDataStore writeData:v6];

    return (char)biomeManagerLabeledDataStore;
  }
}

- (BOOL)updateFeatureSet:(id)a3 featureVestion:(id)a4 featureValues:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [LCFFeatureSet alloc];
  v12 = [MEMORY[0x263EFF910] date];
  v13 = [(LCFFeatureSet *)v11 initWithIdentifier:v10 featureVersion:v9 timestamp:v12 featureValues:v8];

  LOBYTE(v9) = [(LCFFeatureStore *)self updateFeatureSet:v13];
  return (char)v9;
}

- (id)getFeatureVector:(id)a3 option:(unint64_t)a4
{
  return [(LCFFeatureStore *)self getFeatureVector:a3 atTime:0 option:a4];
}

- (id)getFeatureVector:(id)a3 atTime:(id)a4 option:(unint64_t)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = v8;
  if (self->_useSqlite)
  {
    id v10 = [(LCFDatabaseConnection *)self->_dbFeatureStore query:0 startDate:a4 endDate:0 reversed:1];
    v11 = [(LCFFeatureStore *)self getFeatureVectorWithStoreEvents:v9 storeEventsInReversedOrder:v10 option:a5];
  }
  else
  {
    id v27 = v8;
    v26 = self;
    v12 = [(LCFBiomeManager *)self->_biomeManagerLabeledDataStore readDataWithTimestamp:a4 endDate:0 reversed:1];
    id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v14 = v12;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v20 = [v19 objectAtIndexedSubscript:1];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            v22 = [v19 objectAtIndexedSubscript:1];
            v23 = [v19 objectAtIndexedSubscript:0];
            v24 = +[LCFFeatureConverter fromLabeledDataBiomeFeatureStore:v22 timestamp:v23];
            [v13 addObject:v24];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v16);
    }

    id v9 = v27;
    v11 = [(LCFFeatureStore *)v26 getFeatureVectorWithStoreEvents:v27 storeEventsInReversedOrder:v13 option:a5];
  }
  return v11;
}

- (id)getFeatureVectorWithStoreEvents:(id)a3 storeEventsInReversedOrder:(id)a4 option:(unint64_t)a5
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v62 = v6;
  id v8 = (void *)[objc_alloc(MEMORY[0x263F08760]) initWithArray:v6];
  id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id obj = v7;
  uint64_t v65 = [obj countByEnumeratingWithState:&v80 objects:v89 count:16];
  if (v65)
  {
    uint64_t v64 = *(void *)v81;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v81 != v64) {
        objc_enumerationMutation(obj);
      }
      uint64_t v66 = v10;
      v11 = *(void **)(*((void *)&v80 + 1) + 8 * v10);
      long long v76 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      v12 = [v11 featureValues];
      id v13 = [v12 allKeys];

      uint64_t v14 = [v13 countByEnumeratingWithState:&v76 objects:v88 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v77;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v77 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v76 + 1) + 8 * i);
            v19 = [v11 featureValues];
            v20 = [v19 objectForKeyedSubscript:v18];

            if (v18)
            {
              if ([v8 containsObject:v18])
              {
                objc_super v21 = [v9 valueForKey:v18];

                if (!v21) {
                  [v9 setObject:v20 forKeyedSubscript:v18];
                }
              }
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v76 objects:v88 count:16];
        }
        while (v15);
      }

      id v22 = objc_alloc(MEMORY[0x263F08760]);
      v23 = [v9 allKeys];
      v24 = (void *)[v22 initWithArray:v23];
      char v25 = [v8 isEqual:v24];

      if (v25) {
        break;
      }
      uint64_t v10 = v66 + 1;
      if (v66 + 1 == v65)
      {
        uint64_t v65 = [obj countByEnumeratingWithState:&v80 objects:v89 count:16];
        if (!v65) {
          goto LABEL_20;
        }
        goto LABEL_3;
      }
    }

    id v27 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v35 = v9;
    uint64_t v36 = [v35 countByEnumeratingWithState:&v68 objects:v84 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v67 = *(void *)v69;
LABEL_35:
      uint64_t v38 = 0;
      while (1)
      {
        if (*(void *)v69 != v67) {
          objc_enumerationMutation(v35);
        }
        uint64_t v39 = *(void *)(*((void *)&v68 + 1) + 8 * v38);
        v40 = [v35 objectForKeyedSubscript:v39];
        v41 = [v40 intValue];

        if (v41)
        {
          v42 = (void *)MEMORY[0x263F00D50];
          v43 = [v40 intValue];
        }
        else
        {
          v44 = [v40 BOOLValue];

          if (v44)
          {
            v42 = (void *)MEMORY[0x263F00D50];
            v43 = [v40 BOOLValue];
          }
          else
          {
            v48 = [v40 doubleValue];

            if (v48)
            {
              v49 = (void *)MEMORY[0x263F00D50];
              v45 = [v40 doubleValue];
              [v45 doubleValue];
              uint64_t v46 = objc_msgSend(v49, "featureValueWithDouble:");
              goto LABEL_43;
            }
            v50 = [v40 timeBucketValue];

            if (!v50)
            {
              v51 = [v40 doubleArray];

              if (v51)
              {
                v52 = (void *)MEMORY[0x263F00DA8];
                v53 = [v40 doubleArray];
                v45 = [v52 doubleVectorWithValues:v53];

                uint64_t v46 = [MEMORY[0x263F00D50] featureValueWithMultiArray:v45];
              }
              else
              {
                v54 = [v40 stringValue];

                if (!v54)
                {
LABEL_56:
                  v59 = LCFLogFeatureStore;
                  if (os_log_type_enabled((os_log_t)LCFLogFeatureStore, OS_LOG_TYPE_ERROR)) {
                    -[LCFFeatureStore getFeatureVectorWithStoreEvents:storeEventsInReversedOrder:option:](v39, v59);
                  }
                  id v28 = 0;
                  goto LABEL_59;
                }
                v55 = (void *)MEMORY[0x263F00D50];
                v45 = [v40 stringValue];
                uint64_t v46 = [v55 featureValueWithString:v45];
              }
              goto LABEL_43;
            }
            v42 = (void *)MEMORY[0x263F00D50];
            v43 = [v40 timeBucketValue];
          }
        }
        v45 = v43;
        uint64_t v46 = objc_msgSend(v42, "featureValueWithInt64:", objc_msgSend(v43, "longValue"));
LABEL_43:
        v47 = (void *)v46;

        if (!v47) {
          goto LABEL_56;
        }
        [v27 setObject:v47 forKeyedSubscript:v39];

        if (v37 == ++v38)
        {
          uint64_t v56 = [v35 countByEnumeratingWithState:&v68 objects:v84 count:16];
          uint64_t v37 = v56;
          if (v56) {
            goto LABEL_35;
          }
          break;
        }
      }
    }

    v57 = [LCFCoreMLFeatureProvider alloc];
    featureStoreKey = self->_featureStoreKey;
    id v35 = [obj objectAtIndexedSubscript:0];
    v40 = [v35 timestamp];
    id v28 = [(LCFCoreMLFeatureProvider *)v57 init:featureStoreKey timestamp:v40 featureValues:v27];
LABEL_59:
  }
  else
  {
LABEL_20:

    v26 = LCFLogFeatureStore;
    if (os_log_type_enabled((os_log_t)LCFLogFeatureStore, OS_LOG_TYPE_ERROR)) {
      -[LCFFeatureStore getFeatureVectorWithStoreEvents:storeEventsInReversedOrder:option:](v26);
    }
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v27 = v62;
    id v28 = (id)[v27 countByEnumeratingWithState:&v72 objects:v87 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v73;
      do
      {
        for (j = 0; j != v28; j = (char *)j + 1)
        {
          if (*(void *)v73 != v29) {
            objc_enumerationMutation(v27);
          }
          uint64_t v31 = *(void *)(*((void *)&v72 + 1) + 8 * (void)j);
          v32 = [v9 allKeys];
          char v33 = [v32 containsObject:v31];

          if ((v33 & 1) == 0)
          {
            v34 = LCFLogFeatureStore;
            if (os_log_type_enabled((os_log_t)LCFLogFeatureStore, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v86 = v31;
              _os_log_error_impl(&dword_25459C000, v34, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
            }
          }
        }
        id v28 = (id)[v27 countByEnumeratingWithState:&v72 objects:v87 count:16];
      }
      while (v28);
    }
  }

  return v28;
}

- (id)getFeatureVectors:(id)a3 option:(unint64_t)a4
{
  return [(LCFFeatureStore *)self getFeatureVectors:a3 startDate:0 endDate:0 option:a4];
}

- (id)getFeatureSets:(id)a3 startDate:(id)a4 endDate:(id)a5 option:(unint64_t)a6
{
  char v6 = a6;
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v43 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  v41 = v11;
  v42 = v10;
  if (self->_useSqlite)
  {
    id v13 = [(LCFDatabaseConnection *)self->_dbFeatureStore query:0 startDate:v10 endDate:v11 reversed:0];
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v61 objects:v68 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v62 != v16) {
            objc_enumerationMutation(v13);
          }
          [v12 addObject:*(void *)(*((void *)&v61 + 1) + 8 * i)];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v61 objects:v68 count:16];
      }
      while (v15);
    }
  }
  else
  {
    id v13 = [(LCFBiomeManager *)self->_biomeManagerLabeledDataStore readDataWithTimestamp:v10 endDate:v11 reversed:0];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    uint64_t v18 = [v13 countByEnumeratingWithState:&v57 objects:v67 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      char v47 = v6;
      uint64_t v20 = *(void *)v58;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v58 != v20) {
            objc_enumerationMutation(v13);
          }
          id v22 = *(void **)(*((void *)&v57 + 1) + 8 * j);
          v23 = [v22 objectAtIndexedSubscript:1];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            char v25 = [v22 objectAtIndexedSubscript:1];
            v26 = [v22 objectAtIndexedSubscript:0];
            id v27 = +[LCFFeatureConverter fromLabeledDataBiomeFeatureStore:v25 timestamp:v26];
            [v12 addObject:v27];
          }
        }
        uint64_t v19 = [v13 countByEnumeratingWithState:&v57 objects:v67 count:16];
      }
      while (v19);
      char v6 = v47;
    }
  }

  if ((v6 & 4) != 0)
  {
    id v44 = objc_alloc_init(MEMORY[0x263EFF980]);
    v48 = (void *)[objc_alloc(MEMORY[0x263F08760]) initWithArray:v43];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id obj = v12;
    uint64_t v28 = [obj countByEnumeratingWithState:&v53 objects:v66 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v46 = *(void *)v54;
      do
      {
        for (uint64_t k = 0; k != v29; ++k)
        {
          if (*(void *)v54 != v46) {
            objc_enumerationMutation(obj);
          }
          uint64_t v31 = *(void **)(*((void *)&v53 + 1) + 8 * k);
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          id v32 = v48;
          uint64_t v33 = [v32 countByEnumeratingWithState:&v49 objects:v65 count:16];
          if (v33)
          {
            uint64_t v34 = v33;
            uint64_t v35 = *(void *)v50;
            while (2)
            {
              for (uint64_t m = 0; m != v34; ++m)
              {
                if (*(void *)v50 != v35) {
                  objc_enumerationMutation(v32);
                }
                uint64_t v37 = *(void *)(*((void *)&v49 + 1) + 8 * m);
                uint64_t v38 = [v31 featureValues];
                uint64_t v39 = [v38 allKeys];
                LODWORD(v37) = [v39 containsObject:v37];

                if (!v37)
                {

                  goto LABEL_36;
                }
              }
              uint64_t v34 = [v32 countByEnumeratingWithState:&v49 objects:v65 count:16];
              if (v34) {
                continue;
              }
              break;
            }
          }

          [v44 addObject:v31];
LABEL_36:
          ;
        }
        uint64_t v29 = [obj countByEnumeratingWithState:&v53 objects:v66 count:16];
      }
      while (v29);
    }

    id v12 = (id)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:v44];
  }

  return v12;
}

- (id)featureProviderFromfeatureSet:(id)a3 featureNames:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v40;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v40 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void *)(*((void *)&v39 + 1) + 8 * v12);
      uint64_t v14 = [v5 featureValues];
      uint64_t v15 = [v14 objectForKeyedSubscript:v13];

      uint64_t v16 = [v15 intValue];

      if (v16)
      {
        uint64_t v17 = (void *)MEMORY[0x263F00D50];
        uint64_t v18 = [v15 intValue];
      }
      else
      {
        uint64_t v19 = [v15 BOOLValue];

        if (v19)
        {
          uint64_t v17 = (void *)MEMORY[0x263F00D50];
          uint64_t v18 = [v15 BOOLValue];
        }
        else
        {
          v23 = [v15 doubleValue];

          if (v23)
          {
            v24 = (void *)MEMORY[0x263F00D50];
            uint64_t v20 = [v15 doubleValue];
            [v20 doubleValue];
            uint64_t v21 = objc_msgSend(v24, "featureValueWithDouble:");
            goto LABEL_11;
          }
          char v25 = [v15 timeBucketValue];

          if (!v25)
          {
            v26 = [v15 doubleArray];

            if (v26)
            {
              id v27 = (void *)MEMORY[0x263F00DA8];
              uint64_t v28 = [v15 doubleArray];
              uint64_t v20 = [v27 doubleVectorWithValues:v28];

              uint64_t v21 = [MEMORY[0x263F00D50] featureValueWithMultiArray:v20];
            }
            else
            {
              uint64_t v29 = [v15 stringValue];

              if (!v29)
              {
LABEL_24:
                uint64_t v36 = LCFLogFeatureStore;
                if (os_log_type_enabled((os_log_t)LCFLogFeatureStore, OS_LOG_TYPE_ERROR)) {
                  -[LCFFeatureStore getFeatureVectorWithStoreEvents:storeEventsInReversedOrder:option:](v13, v36);
                }

                id v35 = 0;
                uint64_t v34 = v8;
                goto LABEL_27;
              }
              long long v30 = (void *)MEMORY[0x263F00D50];
              uint64_t v20 = [v15 stringValue];
              uint64_t v21 = [v30 featureValueWithString:v20];
            }
            goto LABEL_11;
          }
          uint64_t v17 = (void *)MEMORY[0x263F00D50];
          uint64_t v18 = [v15 timeBucketValue];
        }
      }
      uint64_t v20 = v18;
      uint64_t v21 = objc_msgSend(v17, "featureValueWithInt64:", objc_msgSend(v18, "longValue"));
LABEL_11:
      id v22 = (void *)v21;

      if (!v22) {
        goto LABEL_24;
      }
      [v7 setObject:v22 forKeyedSubscript:v13];

      if (v10 == ++v12)
      {
        uint64_t v31 = [v8 countByEnumeratingWithState:&v39 objects:v43 count:16];
        uint64_t v10 = v31;
        if (v31) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  id v32 = [LCFCoreMLFeatureProvider alloc];
  featureStoreKey = self->_featureStoreKey;
  uint64_t v34 = [v5 timestamp];
  id v35 = [(LCFCoreMLFeatureProvider *)v32 init:featureStoreKey timestamp:v34 featureValues:v7];
LABEL_27:

  return v35;
}

- (id)getFeatureVectors:(id)a3 startDate:(id)a4 endDate:(id)a5 option:(unint64_t)a6
{
  uint64_t v104 = *MEMORY[0x263EF8340];
  id v73 = a3;
  id v9 = a4;
  id v10 = a5;
  id v76 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v72 = self;
  if (self->_useSqlite)
  {
    uint64_t v11 = -[LCFDatabaseConnection query:startDate:endDate:reversed:](self->_dbFeatureStore, "query:startDate:endDate:reversed:", 0, v9, v10, 0, v10, v9);
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v95 objects:v103 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v96;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v96 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v95 + 1) + 8 * i);
          uint64_t v17 = NSNumber;
          uint64_t v18 = [v16 timestamp];
          [v18 timeIntervalSinceReferenceDate];
          uint64_t v19 = objc_msgSend(v17, "numberWithDouble:");
          uint64_t v20 = [v19 stringValue];
          [v76 setValue:v16 forKey:v20];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v95 objects:v103 count:16];
      }
      while (v13);
    }
  }
  else
  {
    uint64_t v11 = -[LCFBiomeManager readDataWithTimestamp:endDate:reversed:](self->_biomeManagerLabeledDataStore, "readDataWithTimestamp:endDate:reversed:", v9, v10, 0, v10, v9);
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    uint64_t v21 = [v11 countByEnumeratingWithState:&v91 objects:v102 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v92;
      unint64_t v24 = 0x263F2A000uLL;
      id obj = v11;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v92 != v23) {
            objc_enumerationMutation(v11);
          }
          v26 = *(void **)(*((void *)&v91 + 1) + 8 * j);
          id v27 = [v26 objectAtIndexedSubscript:1];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            uint64_t v29 = [v26 objectAtIndexedSubscript:1];
            long long v30 = [v26 objectAtIndexedSubscript:0];
            uint64_t v31 = +[LCFFeatureConverter fromLabeledDataBiomeFeatureStore:v29 timestamp:v30];
            unint64_t v32 = v24;
            uint64_t v33 = NSNumber;
            uint64_t v34 = [v26 objectAtIndexedSubscript:0];
            [v34 timeIntervalSinceReferenceDate];
            id v35 = objc_msgSend(v33, "numberWithDouble:");
            [v35 stringValue];
            v37 = uint64_t v36 = v23;
            [v76 setValue:v31 forKey:v37];

            uint64_t v23 = v36;
            unint64_t v24 = v32;
            uint64_t v11 = obj;
          }
        }
        uint64_t v22 = [v11 countByEnumeratingWithState:&v91 objects:v102 count:16];
      }
      while (v22);
      self = v72;
    }
  }

  id v68 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ((a6 & 4) != 0)
  {
    id v40 = (id)[objc_alloc(MEMORY[0x263F08760]) initWithArray:v73];
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    id obja = [v76 allValues];
    uint64_t v71 = [obja countByEnumeratingWithState:&v87 objects:v101 count:16];
    if (v71)
    {
      uint64_t v69 = *(void *)v88;
      do
      {
        uint64_t v50 = 0;
        do
        {
          if (*(void *)v88 != v69) {
            objc_enumerationMutation(obja);
          }
          long long v51 = *(void **)(*((void *)&v87 + 1) + 8 * v50);
          long long v83 = 0u;
          long long v84 = 0u;
          long long v85 = 0u;
          long long v86 = 0u;
          id v52 = v40;
          id v53 = v40;
          uint64_t v54 = [v53 countByEnumeratingWithState:&v83 objects:v100 count:16];
          if (v54)
          {
            uint64_t v55 = v54;
            uint64_t v56 = *(void *)v84;
            while (2)
            {
              for (uint64_t k = 0; k != v55; ++k)
              {
                if (*(void *)v84 != v56) {
                  objc_enumerationMutation(v53);
                }
                uint64_t v58 = *(void *)(*((void *)&v83 + 1) + 8 * k);
                long long v59 = [v51 featureValues];
                long long v60 = [v59 allKeys];
                LODWORD(v58) = [v60 containsObject:v58];

                if (!v58)
                {
                  long long v61 = v53;
                  goto LABEL_47;
                }
              }
              uint64_t v55 = [v53 countByEnumeratingWithState:&v83 objects:v100 count:16];
              if (v55) {
                continue;
              }
              break;
            }
          }

          self = v72;
          long long v61 = [(LCFFeatureStore *)v72 featureProviderFromfeatureSet:v51 featureNames:v73];
          if (v61)
          {
            [v68 addObject:v61];
          }
          else
          {
            long long v62 = LCFLogFeatureStore;
            if (os_log_type_enabled((os_log_t)LCFLogFeatureStore, OS_LOG_TYPE_ERROR)) {
              -[LCFFeatureStore getFeatureVectors:startDate:endDate:option:](&buf, v82, v62);
            }
LABEL_47:
            self = v72;
          }
          id v40 = v52;

          ++v50;
        }
        while (v50 != v71);
        uint64_t v63 = [obja countByEnumeratingWithState:&v87 objects:v101 count:16];
        uint64_t v71 = v63;
      }
      while (v63);
      id v40 = v53;
    }
  }
  else
  {
    uint64_t v38 = [v76 allKeys];
    long long v39 = [v38 sortedArrayUsingFunction:doubleSort context:0];

    id obja = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v40 = v39;
    uint64_t v41 = [v40 countByEnumeratingWithState:&v77 objects:v99 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v78;
      do
      {
        for (uint64_t m = 0; m != v42; ++m)
        {
          if (*(void *)v78 != v43) {
            objc_enumerationMutation(v40);
          }
          v45 = [v76 objectForKeyedSubscript:*(void *)(*((void *)&v77 + 1) + 8 * m)];
          [obja addObject:v45];

          uint64_t v46 = [obja reverseObjectEnumerator];
          char v47 = [v46 allObjects];

          v48 = [(LCFFeatureStore *)self getFeatureVectorWithStoreEvents:v73 storeEventsInReversedOrder:v47 option:a6];
          if (v48)
          {
            long long v49 = +[LCFCoreMLFeatureProvider fromMLProvider:v48];
            [v68 addObject:v49];
          }
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v77 objects:v99 count:16];
      }
      while (v42);
    }
  }
  id v64 = [[LCFCoreMLBatchProvider alloc] init:self->_featureStoreKey featureProviders:v68];

  return v64;
}

- (id)getMultiArrayFeatureVectors:(id)a3 vectorName:(id)a4 srcLabelName:(id)a5 destLabelName:(id)a6 option:(unint64_t)a7
{
  return [(LCFFeatureStore *)self getMultiArrayFeatureVectors:a3 vectorName:a4 srcLabelName:a5 destLabelName:a6 startDate:0 endDate:0 option:a7];
}

- (id)getMultiArrayFeatureVectors:(id)a3 vectorName:(id)a4 srcLabelName:(id)a5 destLabelName:(id)a6 startDate:(id)a7 endDate:(id)a8 option:(unint64_t)a9
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v28 = a5;
  uint64_t v15 = (void *)MEMORY[0x263EFF8C0];
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  uint64_t v22 = [v15 arrayWithObjects:&v28 count:1];
  uint64_t v23 = objc_msgSend(v21, "arrayByAddingObjectsFromArray:", v22, v28, v29);

  unint64_t v24 = [(LCFFeatureStore *)self getFeatureVectors:v23 startDate:v17 endDate:v16 option:a9];

  char v25 = +[LCFCoreMLBatchProvider fromMLProvider:v24];
  v26 = +[LCFCoreMLFeatureProviderUtils toMultiArrayTypeBatchProvider:v25 srcFeatureNames:v21 srcLabelName:v19 destFeatureName:v20 destLabelName:v18];

  return v26;
}

- (id)getFeatureVectorTimestamps
{
  return [(LCFBiomeManager *)self->_biomeManagerLabeledDataStore readTimeStamps:0 endDate:0 reversed:0];
}

- (BOOL)pruneFrom:(id)a3 endDate:(id)a4 option:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if (self->_useSqlite)
  {
    BOOL v9 = [(LCFDatabaseConnection *)self->_dbFeatureStore pruneFrom:v7 endDate:v8];
  }
  else
  {
    id v10 = LCFLogFeatureStore;
    if (os_log_type_enabled((os_log_t)LCFLogFeatureStore, OS_LOG_TYPE_ERROR)) {
      -[LCFFeatureStore pruneFrom:endDate:option:](v10);
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (NSString)featureStoreKey
{
  return self->_featureStoreKey;
}

- (LCFBiomeManager)biomeManagerLabeledDataStore
{
  return self->_biomeManagerLabeledDataStore;
}

- (LCFDatabaseConnection)dbFeatureStore
{
  return self->_dbFeatureStore;
}

- (BOOL)useSqlite
{
  return self->_useSqlite;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dbFeatureStore, 0);
  objc_storeStrong((id *)&self->_biomeManagerLabeledDataStore, 0);
  objc_storeStrong((id *)&self->_featureStoreKey, 0);
}

- (void)getFeatureVectorWithStoreEvents:(os_log_t)log storeEventsInReversedOrder:option:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_25459C000, log, OS_LOG_TYPE_ERROR, "could not find all needed features.", v1, 2u);
}

- (void)getFeatureVectorWithStoreEvents:(uint64_t)a1 storeEventsInReversedOrder:(NSObject *)a2 option:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_25459C000, a2, OS_LOG_TYPE_ERROR, "normalizedName (%@) could not construct a featurevalue", (uint8_t *)&v2, 0xCu);
}

- (void)getFeatureVectors:(os_log_t)log startDate:endDate:option:.cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_25459C000, log, OS_LOG_TYPE_ERROR, "featureProvider could not be construcd", buf, 2u);
}

- (void)pruneFrom:(os_log_t)log endDate:option:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_25459C000, log, OS_LOG_TYPE_ERROR, "prune is called on biome stream mode.", v1, 2u);
}

@end