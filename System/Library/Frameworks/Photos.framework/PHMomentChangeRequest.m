@interface PHMomentChangeRequest
+ (id)changeRequestForMoment:(id)a3;
- (BOOL)allowMutationToManagedObject:(id)a3 propertyKey:(id)a4 error:(id *)a5;
- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5;
- (NSArray)localizedLocationNames;
- (NSMutableArray)assetSearchEntities;
- (NSString)managedEntityName;
- (NSString)subtitle;
- (NSString)title;
- (PHMomentChangeRequest)initWithUUID:(id)a3 objectID:(id)a4;
- (PHMomentChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5;
- (float)aggregationScore;
- (unsigned)processedLocation;
- (void)addAssetSearchEntityWithLabel:(id)a3 identifier:(id)a4 type:(unint64_t)a5 confidence:(double)a6 dateInterval:(id)a7 synonyms:(id)a8;
- (void)encodeToXPCDict:(id)a3;
- (void)setAggregationScore:(float)a3;
- (void)setAssetSearchEntities:(id)a3;
- (void)setLocalizedLocationNames:(id)a3;
- (void)setProcessedLocation:(unsigned __int16)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PHMomentChangeRequest

- (void).cxx_destruct
{
}

- (void)setAssetSearchEntities:(id)a3
{
}

- (NSMutableArray)assetSearchEntities
{
  return self->_assetSearchEntities;
}

- (void)setProcessedLocation:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedShort:v3];
  v6 = [(PHChangeRequest *)self helper];
  v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"processedLocation"];
}

- (unsigned)processedLocation
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"processedLocation"];

  LOWORD(v3) = [v5 intValue];
  return (unsigned __int16)v3;
}

- (void)setLocalizedLocationNames:(id)a3
{
  id v10 = a3;
  v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  v5 = [(PHChangeRequest *)self helper];
  v6 = [v5 mutations];
  v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"localizedLocationNames"];

    id v8 = [(PHChangeRequest *)self helper];
    v9 = [v8 nilMutations];
    [v9 removeObject:@"localizedLocationNames"];
  }
  else
  {
    [v6 removeObjectForKey:@"localizedLocationNames"];

    id v8 = [(PHChangeRequest *)self helper];
    v9 = [v8 nilMutations];
    [v9 addObject:@"localizedLocationNames"];
  }
}

- (NSArray)localizedLocationNames
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"localizedLocationNames"];

  return (NSArray *)v5;
}

- (void)setSubtitle:(id)a3
{
  id v10 = a3;
  v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  v5 = [(PHChangeRequest *)self helper];
  v6 = [v5 mutations];
  v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"subtitle"];

    id v8 = [(PHChangeRequest *)self helper];
    v9 = [v8 nilMutations];
    [v9 removeObject:@"subtitle"];
  }
  else
  {
    [v6 removeObjectForKey:@"subtitle"];

    id v8 = [(PHChangeRequest *)self helper];
    v9 = [v8 nilMutations];
    [v9 addObject:@"subtitle"];
  }
}

- (NSString)subtitle
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"subtitle"];

  return (NSString *)v5;
}

- (void)setTitle:(id)a3
{
  id v10 = a3;
  v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  v5 = [(PHChangeRequest *)self helper];
  v6 = [v5 mutations];
  v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"title"];

    id v8 = [(PHChangeRequest *)self helper];
    v9 = [v8 nilMutations];
    [v9 removeObject:@"title"];
  }
  else
  {
    [v6 removeObjectForKey:@"title"];

    id v8 = [(PHChangeRequest *)self helper];
    v9 = [v8 nilMutations];
    [v9 addObject:@"title"];
  }
}

- (NSString)title
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"title"];

  return (NSString *)v5;
}

- (void)setAggregationScore:(float)a3
{
  v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  *(float *)&double v6 = a3;
  id v9 = [NSNumber numberWithFloat:v6];
  v7 = [(PHChangeRequest *)self helper];
  id v8 = [v7 mutations];
  [v8 setObject:v9 forKeyedSubscript:@"aggregationScore"];
}

- (float)aggregationScore
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"aggregationScore"];

  [v5 floatValue];
  float v7 = v6;

  return v7;
}

- (NSString)managedEntityName
{
  return (NSString *)@"Moment";
}

- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [(PHChangeRequest *)self helper];
  id v16 = 0;
  int v9 = [v8 applyMutationsToManagedObject:v7 error:&v16];
  id v10 = v16;

  if (v9)
  {
    if (!self->_assetSearchEntities)
    {
LABEL_5:
      BOOL v11 = 1;
      goto LABEL_11;
    }
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E4F8AB90], "setAssetSearchEntitiesFromDictionaries:onMoment:");
      goto LABEL_5;
    }
    v12 = PLBackendGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = [(PHChangeRequest *)self objectID];
      v14 = objc_msgSend(v13, "pl_shortURI");
      *(_DWORD *)buf = 138543362;
      v18 = v14;
      _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_ERROR, "Expected to find a moment for objectID %{public}@", buf, 0xCu);
    }
  }
  BOOL v11 = 0;
  if (a5) {
    *a5 = v10;
  }
LABEL_11:

  return v11;
}

- (BOOL)allowMutationToManagedObject:(id)a3 propertyKey:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(PHChangeRequest *)self helper];
  id v14 = 0;
  char v11 = [v10 allowMutationToManagedObject:v9 propertyKey:v8 error:&v14];

  id v12 = v14;
  if (a5 && (v11 & 1) == 0) {
    *a5 = v12;
  }

  return v11;
}

- (PHMomentChangeRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PHMomentChangeRequest;
  id v8 = [(PHChangeRequest *)&v14 init];
  if (v8)
  {
    id v9 = [[PHChangeRequestHelper alloc] initWithUUID:v6 objectID:v7 changeRequest:v8];
    helper = v8->super._helper;
    v8->super._helper = v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    assetSearchEntities = v8->_assetSearchEntities;
    v8->_assetSearchEntities = (NSMutableArray *)v11;
  }
  return v8;
}

- (void)addAssetSearchEntityWithLabel:(id)a3 identifier:(id)a4 type:(unint64_t)a5 confidence:(double)a6 dateInterval:(id)a7 synonyms:(id)a8
{
  unint64_t v25 = (unint64_t)a3;
  unint64_t v15 = (unint64_t)a4;
  id v16 = a7;
  id v17 = a8;
  if (!a5)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"PHMomentChangeRequest.m" lineNumber:72 description:@"Must specify a type"];
  }
  if (!(v25 | v15))
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"PHMomentChangeRequest.m" lineNumber:73 description:@"Must specify a label or identifier"];
  }
  v18 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v19 = [NSNumber numberWithUnsignedInteger:a5];
  [v18 setObject:v19 forKeyedSubscript:@"type"];

  if (v25) {
    [v18 setObject:v25 forKeyedSubscript:@"label"];
  }
  if (v15) {
    [v18 setObject:v15 forKeyedSubscript:@"identifier"];
  }
  if (a6 > 0.0)
  {
    v20 = [NSNumber numberWithDouble:a6];
    [v18 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F8B430]];
  }
  if (v16)
  {
    v21 = [v16 startDate];
    [v18 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F8B440]];

    v22 = [v16 endDate];
    [v18 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F8B438]];
  }
  if (v17) {
    [v18 setObject:v17 forKeyedSubscript:@"synonyms"];
  }
  [(NSMutableArray *)self->_assetSearchEntities addObject:v18];
  [(PHChangeRequest *)self didMutate];
}

- (void)encodeToXPCDict:(id)a3
{
  id v5 = a3;
  v4 = [(PHChangeRequest *)self helper];
  [v4 encodeToXPCDict:v5];

  if (self->_assetSearchEntities) {
    PLXPCDictionarySetArray();
  }
}

- (PHMomentChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)PHMomentChangeRequest;
  uint64_t v11 = [(PHChangeRequest *)&v26 init];
  if (v11)
  {
    id v12 = [[PHChangeRequestHelper alloc] initWithXPCDict:v8 changeRequest:v11 request:v9 clientAuthorization:v10];
    helper = v11->super._helper;
    v11->super._helper = v12;

    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __69__PHMomentChangeRequest_initWithXPCDict_request_clientAuthorization___block_invoke;
    v23 = &unk_1E5848DF0;
    objc_super v14 = v11;
    v24 = v14;
    id v25 = v9;
    unint64_t v15 = (void (**)(void))_Block_copy(&v20);
    id v16 = PLArrayFromXPCDictionary();
    uint64_t v17 = objc_msgSend(v16, "mutableCopy", v20, v21, v22, v23);
    id v18 = v14[4];
    v14[4] = (id)v17;

    if ([v14[4] count]) {
      v15[2](v15);
    }
  }
  return v11;
}

uint64_t __69__PHMomentChangeRequest_initWithXPCDict_request_clientAuthorization___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) setMutated:1];
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);

  return [v2 recordUpdateRequest:v3];
}

+ (id)changeRequestForMoment:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [PHMomentChangeRequest alloc];
    id v5 = [v3 uuid];
    id v6 = [v3 objectID];
    id v7 = [(PHMomentChangeRequest *)v4 initWithUUID:v5 objectID:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

@end