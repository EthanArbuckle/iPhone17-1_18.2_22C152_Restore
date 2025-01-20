@interface PHAssetAnalysisStateProperties
+ (BOOL)createsPropertySetObjectWithCustomImplementation;
+ (BOOL)isToMany;
+ (id)entityName;
+ (id)keyPathFromPrimaryObject;
+ (id)keyPathToPrimaryObject;
+ (id)propertiesToFetch;
+ (id)propertySetName;
- (NSMutableDictionary)fetchDictionariesByWorkerType;
- (PHAssetAnalysisStateProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5;
- (int)analysisStateForWorkerType:(signed __int16)a3 outLastIgnoreDate:(id *)a4 outIgnoreUntilDate:(id *)a5;
@end

@implementation PHAssetAnalysisStateProperties

- (void).cxx_destruct
{
}

- (NSMutableDictionary)fetchDictionariesByWorkerType
{
  return self->_fetchDictionariesByWorkerType;
}

- (int)analysisStateForWorkerType:(signed __int16)a3 outLastIgnoreDate:(id *)a4 outIgnoreUntilDate:(id *)a5
{
  fetchDictionariesByWorkerType = self->_fetchDictionariesByWorkerType;
  v8 = [NSNumber numberWithShort:a3];
  v9 = [(NSMutableDictionary *)fetchDictionariesByWorkerType objectForKeyedSubscript:v8];

  v10 = [v9 objectForKeyedSubscript:@"analysisState"];
  int v11 = [v10 integerValue];

  if (a4)
  {
    *a4 = [v9 objectForKeyedSubscript:@"lastIgnoredDate"];
  }
  if (a5)
  {
    *a5 = [v9 objectForKeyedSubscript:@"ignoreUntilDate"];
  }

  return v11;
}

- (PHAssetAnalysisStateProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)PHAssetAnalysisStateProperties;
  v9 = [(PHAssetAnalysisStateProperties *)&v28 init];
  v10 = v9;
  if (v9)
  {
    id v22 = v8;
    objc_storeWeak((id *)&v9->super._asset, v8);
    int v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    fetchDictionariesByWorkerType = v10->_fetchDictionariesByWorkerType;
    v10->_fetchDictionariesByWorkerType = v11;

    id v23 = v7;
    v13 = [v7 objectForKey:@"assetAnalysisStates"];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v19 = v10->_fetchDictionariesByWorkerType;
          v20 = objc_msgSend(v18, "objectForKeyedSubscript:", @"workerType", v22);
          [(NSMutableDictionary *)v19 setObject:v18 forKeyedSubscript:v20];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v15);
    }

    id v8 = v22;
    id v7 = v23;
  }

  return v10;
}

+ (id)propertiesToFetch
{
  return 0;
}

+ (BOOL)createsPropertySetObjectWithCustomImplementation
{
  return 1;
}

+ (BOOL)isToMany
{
  return 1;
}

+ (id)keyPathToPrimaryObject
{
  return 0;
}

+ (id)keyPathFromPrimaryObject
{
  return 0;
}

+ (id)entityName
{
  return @"AssetAnalysisState";
}

+ (id)propertySetName
{
  return @"PHAssetPropertySetAnalysisState";
}

@end