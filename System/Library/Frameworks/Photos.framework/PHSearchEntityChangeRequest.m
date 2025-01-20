@interface PHSearchEntityChangeRequest
+ (id)changeRequestForSearchRanking:(id)a3;
- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5;
- (NSArray)synonyms;
- (NSString)managedEntityName;
- (PHSearchEntityChangeRequest)initWithUUID:(id)a3 objectID:(id)a4;
- (PHSearchEntityChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5;
- (double)rankingScore;
- (void)encodeToXPCDict:(id)a3;
- (void)setRankingScore:(double)a3;
- (void)setSynonyms:(id)a3;
@end

@implementation PHSearchEntityChangeRequest

- (void).cxx_destruct
{
}

- (NSArray)synonyms
{
  return self->_synonyms;
}

- (double)rankingScore
{
  return self->_rankingScore;
}

- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  v6 = objc_msgSend(MEMORY[0x1E4F8AB90], "newNodeContainerWithNode:", a3, a4, a5);
  v7 = v6;
  if (self->_didSetRankingScore) {
    [v6 setRankingScore:self->_rankingScore];
  }
  if (self->_didSetSynonyms) {
    [v7 setSynonyms:self->_synonyms];
  }

  return 1;
}

- (PHSearchEntityChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)PHSearchEntityChangeRequest;
  v11 = [(PHChangeRequest *)&v24 init];
  if (v11)
  {
    v12 = [[PHChangeRequestHelper alloc] initWithXPCDict:v8 changeRequest:v11 request:v9 clientAuthorization:v10];
    helper = v11->super._helper;
    v11->super._helper = v12;

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __75__PHSearchEntityChangeRequest_initWithXPCDict_request_clientAuthorization___block_invoke;
    v21[3] = &unk_1E5848DF0;
    v14 = v11;
    v22 = v14;
    id v23 = v9;
    v15 = (void (**)(void))_Block_copy(v21);
    v16 = xpc_dictionary_get_value(v8, "rankingScoreKey");
    v17 = v16;
    if (v16)
    {
      v14->_rankingScore = xpc_double_get_value(v16);
      v14->_didSetRankingScore = 1;
      v15[2](v15);
    }
    uint64_t v18 = PLArrayFromXPCDictionary();
    synonyms = v14->_synonyms;
    v14->_synonyms = (NSArray *)v18;

    if (v14->_synonyms)
    {
      v14->_didSetSynonyms = 1;
      v15[2](v15);
    }
  }
  return v11;
}

uint64_t __75__PHSearchEntityChangeRequest_initWithXPCDict_request_clientAuthorization___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) setMutated:1];
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);

  return [v2 recordUpdateRequest:v3];
}

- (void)encodeToXPCDict:(id)a3
{
  xpc_object_t xdict = a3;
  v4 = [(PHChangeRequest *)self helper];
  [v4 encodeToXPCDict:xdict];

  if (self->_didSetRankingScore) {
    xpc_dictionary_set_double(xdict, "rankingScoreKey", self->_rankingScore);
  }
  if (self->_didSetSynonyms) {
    PLXPCDictionarySetArray();
  }
}

- (PHSearchEntityChangeRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PHSearchEntityChangeRequest;
  id v8 = [(PHChangeRequest *)&v12 init];
  if (v8)
  {
    id v9 = [[PHChangeRequestHelper alloc] initWithUUID:v6 objectID:v7 changeRequest:v8];
    helper = v8->super._helper;
    v8->super._helper = v9;
  }
  return v8;
}

- (void)setSynonyms:(id)a3
{
  objc_storeStrong((id *)&self->_synonyms, a3);
  self->_didSetSynonyms = 1;

  [(PHChangeRequest *)self didMutate];
}

- (void)setRankingScore:(double)a3
{
  self->_rankingScore = a3;
  self->_didSetRankingScore = 1;
  [(PHChangeRequest *)self didMutate];
}

- (NSString)managedEntityName
{
  return (NSString *)[MEMORY[0x1E4F8A858] entityName];
}

+ (id)changeRequestForSearchRanking:(id)a3
{
  id v3 = a3;
  v4 = [PHSearchEntityChangeRequest alloc];
  v5 = [v3 uuid];
  id v6 = [v3 objectID];

  id v7 = [(PHSearchEntityChangeRequest *)v4 initWithUUID:v5 objectID:v6];

  return v7;
}

@end