@interface PHGeneratedAssetDescription
+ (id)entityKeyMap;
+ (id)fetchGeneratedAssetDescriptionsGroupedByAssetLocalIdentifierWithType:(int64_t)a3 forAssets:(id)a4;
+ (id)fetchType;
+ (id)identifierCode;
+ (id)managedEntityName;
- (NSString)descriptionText;
- (PHGeneratedAssetDescription)initWithNodeContainer:(id)a3 photoLibrary:(id)a4;
- (id)debugDescription;
- (id)description;
- (int64_t)analysisSourceType;
- (signed)analysisVersion;
- (void)setAnalysisSourceType:(int64_t)a3;
- (void)setAnalysisVersion:(signed __int16)a3;
- (void)setDescriptionText:(id)a3;
@end

@implementation PHGeneratedAssetDescription

- (void).cxx_destruct
{
}

- (void)setAnalysisSourceType:(int64_t)a3
{
  self->_analysisSourceType = a3;
}

- (int64_t)analysisSourceType
{
  return self->_analysisSourceType;
}

- (void)setAnalysisVersion:(signed __int16)a3
{
  self->_analysisVersion = a3;
}

- (signed)analysisVersion
{
  return self->_analysisVersion;
}

- (void)setDescriptionText:(id)a3
{
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (id)debugDescription
{
  v3 = [MEMORY[0x1E4F28E78] string];
  v4 = [(PHObject *)self uuid];
  [v3 appendFormat:@"UUID: %@, ", v4];

  v5 = [(PHGeneratedAssetDescription *)self descriptionText];
  [v3 appendFormat:@"descriptionText: %@, ", v5];

  [v3 appendFormat:@"analysisVersion: %d, ", -[PHGeneratedAssetDescription analysisVersion](self, "analysisVersion")];
  [v3 appendFormat:@"sourceType: %ld, ", -[PHGeneratedAssetDescription analysisSourceType](self, "analysisSourceType")];

  return v3;
}

- (id)description
{
  v2 = NSString;
  v3 = [(PHObject *)self objectID];
  v4 = [v2 stringWithFormat:@"<%@>", v3];

  return v4;
}

- (PHGeneratedAssetDescription)initWithNodeContainer:(id)a3 photoLibrary:(id)a4
{
  v18[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v18[0] = MEMORY[0x1E4F1CC28];
  v17[0] = @"deleted";
  v17[1] = @"uuid";
  id v7 = a4;
  v8 = [v6 uuid];
  v18[1] = v8;
  v17[2] = @"objectID";
  v9 = [v6 sourceNode];
  v10 = [v9 objectID];
  v18[2] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];

  v16.receiver = self;
  v16.super_class = (Class)PHGeneratedAssetDescription;
  v12 = [(PHObject *)&v16 initWithFetchDictionary:v11 propertyHint:2 photoLibrary:v7];

  if (v12)
  {
    uint64_t v13 = [v6 descriptionText];
    descriptionText = v12->_descriptionText;
    v12->_descriptionText = (NSString *)v13;

    v12->_analysisVersion = [v6 analysisVersion];
    v12->_analysisSourceType = [v6 analysisSourceType];
  }

  return v12;
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  v2 = (void *)entityKeyMap_pl_once_object_15_43323;

  return v2;
}

void __43__PHGeneratedAssetDescription_entityKeyMap__block_invoke()
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v0 = [PHEntityKeyMap alloc];
  id v7 = @"uuid";
  v8[0] = @"uuid";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
  v8[1] = @"objectID";
  v9[0] = v1;
  id v6 = @"objectID";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v6 count:1];
  v9[1] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  uint64_t v4 = [(PHEntityKeyMap *)v0 initWithPropertyKeysByEntityKey:v3];
  v5 = (void *)entityKeyMap_pl_once_object_15_43323;
  entityKeyMap_pl_once_object_15_43323 = v4;
}

+ (id)identifierCode
{
  return @"240";
}

+ (id)fetchType
{
  v2 = @"PHGeneratedAssetDescription";
  return @"PHGeneratedAssetDescription";
}

+ (id)managedEntityName
{
  return (id)[MEMORY[0x1E4F8A858] entityName];
}

+ (id)fetchGeneratedAssetDescriptionsGroupedByAssetLocalIdentifierWithType:(int64_t)a3 forAssets:(id)a4
{
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([v5 count])
  {
    id v7 = objc_msgSend(v5, "_pl_indexBy:", &__block_literal_global_43331);
    v8 = [v7 allKeys];
    v9 = [v5 firstObject];
    v10 = [v9 photoLibrary];

    v11 = [v10 photoLibraryForCurrentQueueQoS];
    v12 = [MEMORY[0x1E4F8A840] fetchGeneratedAssetDescriptionsGroupedByAssetIdWithType:a3 forAssetsIDs:v8 inLibrary:v11];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __110__PHGeneratedAssetDescription_fetchGeneratedAssetDescriptionsGroupedByAssetLocalIdentifierWithType_forAssets___block_invoke_2;
    v20[3] = &unk_1E5847D90;
    id v21 = v12;
    id v22 = v7;
    id v13 = v6;
    id v23 = v13;
    v24 = v10;
    id v14 = v10;
    id v15 = v7;
    id v16 = v12;
    [v11 performBlockAndWait:v20];
    v17 = v24;
    id v18 = v13;
  }

  return v6;
}

void __110__PHGeneratedAssetDescription_fetchGeneratedAssetDescriptionsGroupedByAssetLocalIdentifierWithType_forAssets___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v15 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:v6];
        v8 = [v7 uuid];
        v9 = +[PHObject localIdentifierWithUUID:v8];

        v10 = [PHGeneratedAssetDescription alloc];
        v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
        v12 = [(PHGeneratedAssetDescription *)v10 initWithNodeContainer:v11 photoLibrary:*(void *)(a1 + 56)];
        [*(id *)(a1 + 48) setObject:v12 forKeyedSubscript:v9];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v3);
  }
}

uint64_t __110__PHGeneratedAssetDescription_fetchGeneratedAssetDescriptionsGroupedByAssetLocalIdentifierWithType_forAssets___block_invoke(uint64_t a1, void *a2)
{
  return [a2 objectID];
}

@end