@interface MPModelVerifyLocalFileAssetIntegrityRequest
+ (id)_operationQueue;
- (MPIdentifierSet)sourceItemIdentifiers;
- (MPModelFileAsset)fileAsset;
- (MPModelVerifyLocalFileAssetIntegrityRequest)initWithFileAsset:(id)a3 sourceItemIdentifiers:(id)a4;
- (id)mediaLibraryForItemIdentifiers:(id)a3;
- (void)performWithResponseHandler:(id)a3;
- (void)setFileAsset:(id)a3;
- (void)setSourceItemIdentifiers:(id)a3;
@end

@implementation MPModelVerifyLocalFileAssetIntegrityRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileAsset, 0);

  objc_storeStrong((id *)&self->_sourceItemIdentifiers, 0);
}

- (void)setFileAsset:(id)a3
{
}

- (MPModelFileAsset)fileAsset
{
  return self->_fileAsset;
}

- (void)setSourceItemIdentifiers:(id)a3
{
}

- (MPIdentifierSet)sourceItemIdentifiers
{
  return self->_sourceItemIdentifiers;
}

- (id)mediaLibraryForItemIdentifiers:(id)a3
{
  id v3 = a3;
  v4 = [v3 library];
  v5 = [v4 databaseID];
  uint64_t v6 = [v5 length];

  if (!v6) {
    goto LABEL_11;
  }
  v7 = [v3 library];
  v8 = [v7 databaseID];
  v9 = +[MPMediaLibrary mediaLibraryWithUniqueIdentifier:v8];

  if (!v9)
  {
LABEL_11:
    v10 = [v3 personalizedStore];
    v11 = [v10 personID];
    uint64_t v12 = [v11 longLongValue];

    if (v12 < 1) {
      goto LABEL_5;
    }
    v13 = (void *)MEMORY[0x1E4FB87B8];
    v14 = NSNumber;
    v15 = [v3 personalizedStore];
    v16 = [v15 personID];
    v17 = objc_msgSend(v14, "numberWithLongLong:", objc_msgSend(v16, "longLongValue"));
    v18 = [v13 specificAccountWithDSID:v17];

    v9 = +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:v18];

    if (!v9)
    {
LABEL_5:
      v9 = +[MPMediaLibrary deviceMediaLibrary];
    }
  }

  return v9;
}

- (void)performWithResponseHandler:(id)a3
{
  id v4 = a3;
  v5 = [(MPIdentifierSet *)self->_sourceItemIdentifiers library];
  uint64_t v6 = [v5 persistentID];

  if (v6)
  {
    v7 = [(MPModelVerifyLocalFileAssetIntegrityRequest *)self mediaLibraryForItemIdentifiers:self->_sourceItemIdentifiers];
    v8 = [(id)objc_opt_class() _operationQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__MPModelVerifyLocalFileAssetIntegrityRequest_performWithResponseHandler___block_invoke;
    v10[3] = &unk_1E57F53B8;
    id v11 = v7;
    uint64_t v13 = v6;
    id v12 = v4;
    id v9 = v7;
    [v8 addOperationWithBlock:v10];
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
  }
}

void __74__MPModelVerifyLocalFileAssetIntegrityRequest_performWithResponseHandler___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) itemWithPersistentID:*(void *)(a1 + 48) verifyExistence:0];
  v2 = [v3 valueForProperty:@"verifiedIntegrity"];
  [v2 BOOLValue];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (MPModelVerifyLocalFileAssetIntegrityRequest)initWithFileAsset:(id)a3 sourceItemIdentifiers:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPModelVerifyLocalFileAssetIntegrityRequest;
  id v9 = [(MPModelVerifyLocalFileAssetIntegrityRequest *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fileAsset, a3);
    objc_storeStrong((id *)&v10->_sourceItemIdentifiers, a4);
  }

  return v10;
}

+ (id)_operationQueue
{
  if (_operationQueue_sOnceToken != -1) {
    dispatch_once(&_operationQueue_sOnceToken, &__block_literal_global_31388);
  }
  v2 = (void *)_operationQueue_sOperationQueue;

  return v2;
}

uint64_t __62__MPModelVerifyLocalFileAssetIntegrityRequest__operationQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  v1 = (void *)_operationQueue_sOperationQueue;
  _operationQueue_sOperationQueue = (uint64_t)v0;

  [(id)_operationQueue_sOperationQueue setName:@"com.apple.MediaPlayer.MPModelVerifyLocalFileAssetIntegrityRequest.operationQueue"];
  [(id)_operationQueue_sOperationQueue setQualityOfService:25];
  v2 = (void *)_operationQueue_sOperationQueue;

  return [v2 setMaxConcurrentOperationCount:2];
}

@end