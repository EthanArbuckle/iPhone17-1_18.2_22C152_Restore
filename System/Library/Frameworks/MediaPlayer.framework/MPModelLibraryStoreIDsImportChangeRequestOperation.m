@interface MPModelLibraryStoreIDsImportChangeRequestOperation
- (BOOL)shouldLibraryAdd;
- (MPMediaLibrary)mediaLibrary;
- (MPModelObject)referralObject;
- (NSArray)storeIDs;
- (id)responseHandler;
- (void)execute;
- (void)setMediaLibrary:(id)a3;
- (void)setReferralObject:(id)a3;
- (void)setResponseHandler:(id)a3;
- (void)setShouldLibraryAdd:(BOOL)a3;
- (void)setStoreIDs:(id)a3;
@end

@implementation MPModelLibraryStoreIDsImportChangeRequestOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_storeIDs, 0);
  objc_storeStrong((id *)&self->_referralObject, 0);

  objc_storeStrong((id *)&self->_mediaLibrary, 0);
}

- (void)setResponseHandler:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setShouldLibraryAdd:(BOOL)a3
{
  self->_shouldLibraryAdd = a3;
}

- (BOOL)shouldLibraryAdd
{
  return self->_shouldLibraryAdd;
}

- (void)setStoreIDs:(id)a3
{
}

- (NSArray)storeIDs
{
  return self->_storeIDs;
}

- (void)setReferralObject:(id)a3
{
}

- (MPModelObject)referralObject
{
  return self->_referralObject;
}

- (void)setMediaLibrary:(id)a3
{
}

- (MPMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (void)execute
{
  v3 = [(MPModelLibraryStoreIDsImportChangeRequestOperation *)self mediaLibrary];
  v4 = [(MPModelLibraryStoreIDsImportChangeRequestOperation *)self storeIDs];
  v5 = [(MPModelLibraryStoreIDsImportChangeRequestOperation *)self referralObject];
  BOOL v6 = [(MPModelLibraryStoreIDsImportChangeRequestOperation *)self shouldLibraryAdd];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__MPModelLibraryStoreIDsImportChangeRequestOperation_execute__block_invoke;
  v7[3] = &unk_1E57F9EF8;
  v7[4] = self;
  [v3 addStoreItemIDs:v4 referralObject:v5 andAddTracksToCloudLibrary:v6 withCompletion:v7];
}

void __61__MPModelLibraryStoreIDsImportChangeRequestOperation_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) responseHandler];
  v7 = (void *)v6;
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v8, v5);
  }
  [*(id *)(a1 + 32) finishWithError:v5];
}

@end