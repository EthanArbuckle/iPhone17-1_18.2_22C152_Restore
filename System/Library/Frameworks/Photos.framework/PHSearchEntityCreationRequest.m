@interface PHSearchEntityCreationRequest
+ (id)_placeholderForCreatedObjectWithClass:(Class)a3 uuid:(id)a4;
+ (id)creationRequestForNewSearchRankings;
- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5;
- (NSString)managedEntityName;
- (PHSearchEntityCreationRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5;
- (id)addSearchRankingWithLabel:(id)a3 identifier:(id)a4 type:(unint64_t)a5 rankingScore:(double)a6 synonyms:(id)a7;
- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4;
- (id)initForNewObject;
- (id)placeholderForCreatedSearchEntity;
- (void)encodeToXPCDict:(id)a3;
@end

@implementation PHSearchEntityCreationRequest

- (void).cxx_destruct
{
}

- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([(NSMutableArray *)self->_assetSearchEntities count])
  {
    v9 = [v8 managedObjectContext];
    [v9 deleteObject:v7];

    [MEMORY[0x1E4F8AB90] setSearchRankingsFromDictionaries:self->_assetSearchEntities inLibrary:v8];
  }

  return 1;
}

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  v5 = [a3 managedObjectContext];
  v6 = (void *)[MEMORY[0x1E4F8AB90] newNodeContainerWithManagedObjectContext:v5];
  id v7 = [(PHChangeRequest *)self uuid];
  [v6 setUuid:v7];

  id v8 = [v6 sourceNode];

  return v8;
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

- (PHSearchEntityCreationRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PHSearchEntityCreationRequest;
  v10 = [(PHSearchEntityChangeRequest *)&v24 initWithXPCDict:v8 request:v9 clientAuthorization:a5];
  v11 = v10;
  if (v10)
  {
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __77__PHSearchEntityCreationRequest_initWithXPCDict_request_clientAuthorization___block_invoke;
    v21 = &unk_1E5848DF0;
    v12 = v10;
    v22 = v12;
    id v23 = v9;
    v13 = (void (**)(void))_Block_copy(&v18);
    v14 = PLArrayFromXPCDictionary();
    uint64_t v15 = objc_msgSend(v14, "mutableCopy", v18, v19, v20, v21);
    assetSearchEntities = v12->_assetSearchEntities;
    v12->_assetSearchEntities = (NSMutableArray *)v15;

    if (v12->_assetSearchEntities) {
      v13[2](v13);
    }
  }
  return v11;
}

uint64_t __77__PHSearchEntityCreationRequest_initWithXPCDict_request_clientAuthorization___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) setMutated:1];
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);

  return [v2 recordUpdateRequest:v3];
}

- (id)initForNewObject
{
  v8.receiver = self;
  v8.super_class = (Class)PHSearchEntityCreationRequest;
  v2 = [(PHChangeRequest *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [[PHChangeRequestHelper alloc] initForNewObjectWithChangeRequest:v2];
    helper = v2->super.super._helper;
    v2->super.super._helper = v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    assetSearchEntities = v2->_assetSearchEntities;
    v2->_assetSearchEntities = (NSMutableArray *)v5;
  }
  return v2;
}

- (id)addSearchRankingWithLabel:(id)a3 identifier:(id)a4 type:(unint64_t)a5 rankingScore:(double)a6 synonyms:(id)a7
{
  unint64_t v13 = (unint64_t)a3;
  unint64_t v14 = (unint64_t)a4;
  id v15 = a7;
  if (!a5)
  {
    id v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"PHSearchEntityChangeRequest.m" lineNumber:137 description:@"Must specify a type"];
  }
  if (a6 == 0.0)
  {
    objc_super v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"PHSearchEntityChangeRequest.m" lineNumber:138 description:@"Must specify a search ranking"];
  }
  if (!(v13 | v14))
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"PHSearchEntityChangeRequest.m" lineNumber:139 description:@"Must specify a label or identifier"];
  }
  v16 = [MEMORY[0x1E4F1CA60] dictionary];
  v17 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v18 = [v17 UUIDString];

  [v16 setObject:v18 forKeyedSubscript:@"uuid"];
  uint64_t v19 = [NSNumber numberWithUnsignedInteger:a5];
  [v16 setObject:v19 forKeyedSubscript:@"type"];

  v20 = [NSNumber numberWithDouble:a6];
  [v16 setObject:v20 forKeyedSubscript:@"rankingScore"];

  if (v13) {
    [v16 setObject:v13 forKeyedSubscript:@"label"];
  }
  if (v14) {
    [v16 setObject:v14 forKeyedSubscript:@"identifier"];
  }
  if (v15) {
    [v16 setObject:v15 forKeyedSubscript:@"synonyms"];
  }
  [(NSMutableArray *)self->_assetSearchEntities addObject:v16];
  [(PHChangeRequest *)self didMutate];
  v21 = +[PHSearchEntityCreationRequest _placeholderForCreatedObjectWithClass:objc_opt_class() uuid:v18];

  return v21;
}

- (NSString)managedEntityName
{
  return (NSString *)@"GraphNode";
}

- (id)placeholderForCreatedSearchEntity
{
  uint64_t v3 = [(PHChangeRequest *)self helper];
  v4 = [v3 placeholderForCreatedObjectWithClass:objc_opt_class() changeRequest:self];

  return v4;
}

+ (id)_placeholderForCreatedObjectWithClass:(Class)a3 uuid:(id)a4
{
  id v5 = a4;
  +[PHPhotoLibrary assertTransaction];
  v6 = [PHObjectPlaceholder alloc];
  id v7 = [(objc_class *)a3 localIdentifierWithUUID:v5];

  objc_super v8 = [(PHObjectPlaceholder *)v6 initWithLocalIdentifier:v7];

  return v8;
}

+ (id)creationRequestForNewSearchRankings
{
  id v2 = [[PHSearchEntityCreationRequest alloc] initForNewObject];

  return v2;
}

@end