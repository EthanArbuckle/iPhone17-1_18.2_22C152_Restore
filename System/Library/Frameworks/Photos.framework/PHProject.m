@interface PHProject
+ (id)entityKeyMap;
+ (id)fetchProjectsWithLocalIdentifiers:(id)a3 options:(id)a4;
+ (id)fetchProjectsWithOptions:(id)a3;
+ (id)fetchType;
+ (id)identifierCode;
+ (id)localIdentifierWithUUID:(id)a3;
+ (id)managedEntityName;
+ (id)propertiesToFetchWithHint:(unint64_t)a3;
+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4;
- (BOOL)canContainCustomKeyAssets;
- (BOOL)canPerformEditOperation:(int64_t)a3;
- (BOOL)hasProjectPreview;
- (NSData)projectExtensionData;
- (NSString)projectDocumentType;
- (NSString)projectExtensionIdentifier;
- (NSString)projectRenderUuid;
- (PHProject)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5;
- (id)creationDate;
@end

@implementation PHProject

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_projectRenderUuid, 0);
  objc_storeStrong((id *)&self->_projectDocumentType, 0);
  objc_storeStrong((id *)&self->_projectExtensionIdentifier, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);

  objc_storeStrong((id *)&self->_projectExtensionData, 0);
}

- (NSString)projectRenderUuid
{
  return self->_projectRenderUuid;
}

- (NSString)projectDocumentType
{
  return self->_projectDocumentType;
}

- (NSString)projectExtensionIdentifier
{
  return self->_projectExtensionIdentifier;
}

- (id)creationDate
{
  return self->_creationDate;
}

- (NSData)projectExtensionData
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_projectExtensionData)
  {
    v3 = [(PHObject *)v2 photoLibrary];
    v4 = [v3 assetsdClient];
    v5 = [v4 resourceClient];
    v6 = [(PHObject *)v2 uuid];
    v7 = [v5 projectExtensionDataForProjectUuid:v6];
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      v9 = [MEMORY[0x1E4F1C9B8] data];
    }
    projectExtensionData = v2->_projectExtensionData;
    v2->_projectExtensionData = v9;
  }
  objc_sync_exit(v2);

  v11 = v2->_projectExtensionData;

  return v11;
}

- (BOOL)hasProjectPreview
{
  v2 = [(PHProject *)self projectRenderUuid];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)canContainCustomKeyAssets
{
  return [MEMORY[0x1E4F8A848] supportsCustomKeyAssetWithAlbumKind:1508];
}

- (BOOL)canPerformEditOperation:(int64_t)a3
{
  return a3 != 1;
}

- (PHProject)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PHProject;
  v9 = [(PHAssetCollection *)&v21 initWithFetchDictionary:v8 propertyHint:a4 photoLibrary:a5];
  if (v9)
  {
    uint64_t v10 = [v8 objectForKeyedSubscript:@"projectExtensionIdentifier"];
    projectExtensionIdentifier = v9->_projectExtensionIdentifier;
    v9->_projectExtensionIdentifier = (NSString *)v10;

    uint64_t v12 = [v8 objectForKeyedSubscript:@"projectDocumentType"];
    projectDocumentType = v9->_projectDocumentType;
    v9->_projectDocumentType = (NSString *)v12;

    uint64_t v14 = [v8 objectForKeyedSubscript:@"projectData"];
    projectExtensionData = v9->_projectExtensionData;
    v9->_projectExtensionData = (NSData *)v14;

    uint64_t v16 = [v8 objectForKeyedSubscript:@"projectRenderUuid"];
    projectRenderUuid = v9->_projectRenderUuid;
    v9->_projectRenderUuid = (NSString *)v16;

    uint64_t v18 = [v8 objectForKeyedSubscript:@"creationDate"];
    creationDate = v9->_creationDate;
    v9->_creationDate = (NSDate *)v18;

    v9->super._assetCollectionType = 10;
  }

  return v9;
}

+ (id)fetchProjectsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__PHProject_fetchProjectsWithLocalIdentifiers_options___block_invoke;
  v9[3] = &unk_1E5849048;
  id v10 = v5;
  id v6 = v5;
  v7 = +[PHObject authorizationAwareFetchResultWithOptions:a4 fetchBlock:v9];

  return v7;
}

id __55__PHProject_fetchProjectsWithLocalIdentifiers_options___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = +[PHQuery queryForProjectsWithLocalIdentifiers:*(void *)(a1 + 32) options:a2];
  BOOL v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchProjectsWithOptions:(id)a3
{
  return +[PHObject authorizationAwareFetchResultWithOptions:a3 fetchBlock:&__block_literal_global_73];
}

id __38__PHProject_fetchProjectsWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = +[PHQuery queryForAssetCollectionsWithType:10 subtype:0x7FFFFFFFFFFFFFFFLL options:a2];
  BOOL v3 = [v2 executeQuery];

  return v3;
}

+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__PHProject_transformValueExpression_forKeyPath___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transformValueExpression_forKeyPath__onceToken != -1) {
    dispatch_once(&transformValueExpression_forKeyPath__onceToken, block);
  }
  if ([(id)transformValueExpression_forKeyPath___passThroughSet containsObject:v7]) {
    id v8 = v6;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

void __49__PHProject_transformValueExpression_forKeyPath___block_invoke()
{
  v4[9] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"projectExtensionIdentifier";
  v4[1] = @"projectDocumentType";
  v4[2] = @"projectExtensionData";
  v4[3] = @"projectRenderUuid";
  v4[4] = @"projectData";
  v4[5] = @"cloudGUID";
  v4[6] = @"title";
  v4[7] = @"uuid";
  v4[8] = @"creationDate";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:9];
  uint64_t v2 = [v0 setWithArray:v1];
  BOOL v3 = (void *)transformValueExpression_forKeyPath___passThroughSet;
  transformValueExpression_forKeyPath___passThroughSet = v2;
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  uint64_t v2 = (void *)entityKeyMap_pl_once_object_15_1181;

  return v2;
}

void __25__PHProject_entityKeyMap__block_invoke()
{
  v21[8] = *MEMORY[0x1E4F143B8];
  v0 = [PHEntityKeyMap alloc];
  v19 = @"projectExtensionIdentifier";
  v20[0] = @"projectExtensionIdentifier";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  v21[0] = v1;
  v20[1] = @"projectDocumentType";
  uint64_t v18 = @"projectDocumentType";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  v21[1] = v2;
  v20[2] = @"projectData";
  v17[0] = @"projectExtensionData";
  v17[1] = @"projectData";
  BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  v21[2] = v3;
  v20[3] = @"projectRenderUuid";
  uint64_t v16 = @"projectRenderUuid";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  v21[3] = v4;
  v20[4] = @"cloudGUID";
  v15 = @"cloudGUID";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  v21[4] = v5;
  v20[5] = @"title";
  uint64_t v14 = @"title";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  v21[5] = v6;
  v20[6] = @"uuid";
  v13 = @"uuid";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  v21[6] = v7;
  v20[7] = @"creationDate";
  uint64_t v12 = @"creationDate";
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  v21[7] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:8];
  uint64_t v10 = [(PHEntityKeyMap *)v0 initWithPropertyKeysByEntityKey:v9];
  v11 = (void *)entityKeyMap_pl_once_object_15_1181;
  entityKeyMap_pl_once_object_15_1181 = v10;
}

+ (id)identifierCode
{
  return @"180";
}

+ (id)fetchType
{
  uint64_t v2 = @"PHProject";
  return @"PHProject";
}

+ (id)localIdentifierWithUUID:(id)a3
{
  v4 = NSString;
  id v5 = a3;
  id v6 = [a1 identifierCode];
  id v7 = [v4 stringWithFormat:@"%@/L0/%@", v5, v6];

  return v7;
}

+ (id)managedEntityName
{
  return (id)[MEMORY[0x1E4F8AAF0] entityName];
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  if (propertiesToFetchWithHint__onceToken_1190 != -1) {
    dispatch_once(&propertiesToFetchWithHint__onceToken_1190, &__block_literal_global_1191);
  }
  BOOL v3 = (void *)propertiesToFetchWithHint__array;

  return v3;
}

void __39__PHProject_propertiesToFetchWithHint___block_invoke()
{
  v3[9] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F8A978] objectIDDescription];
  v3[0] = v0;
  v3[1] = @"trashedState";
  v3[2] = @"projectExtensionIdentifier";
  v3[3] = @"projectDocumentType";
  v3[4] = @"projectRenderUuid";
  v3[5] = @"cloudGUID";
  v3[6] = @"title";
  v3[7] = @"uuid";
  v3[8] = @"creationDate";
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:9];
  uint64_t v2 = (void *)propertiesToFetchWithHint__array;
  propertiesToFetchWithHint__array = v1;
}

@end