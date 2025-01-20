@interface MPModelLibraryGlobalPlaylistImportChangeRequestOperation
- (BOOL)shouldLibraryAdd;
- (MPMediaLibrary)mediaLibrary;
- (NSString)globalPlaylistID;
- (id)responseHandler;
- (void)execute;
- (void)setGlobalPlaylistID:(id)a3;
- (void)setMediaLibrary:(id)a3;
- (void)setResponseHandler:(id)a3;
- (void)setShouldLibraryAdd:(BOOL)a3;
@end

@implementation MPModelLibraryGlobalPlaylistImportChangeRequestOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_mediaLibrary, 0);

  objc_storeStrong((id *)&self->_globalPlaylistID, 0);
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

- (void)setMediaLibrary:(id)a3
{
}

- (MPMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (void)setGlobalPlaylistID:(id)a3
{
}

- (NSString)globalPlaylistID
{
  return self->_globalPlaylistID;
}

- (void)execute
{
  v3 = [(MPModelLibraryGlobalPlaylistImportChangeRequestOperation *)self globalPlaylistID];
  BOOL v4 = [(MPModelLibraryGlobalPlaylistImportChangeRequestOperation *)self shouldLibraryAdd];
  v5 = [(MPModelLibraryGlobalPlaylistImportChangeRequestOperation *)self mediaLibrary];
  v6 = v5;
  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __67__MPModelLibraryGlobalPlaylistImportChangeRequestOperation_execute__block_invoke;
    v8[3] = &unk_1E57FA148;
    id v9 = v3;
    v10 = self;
    [v6 addGlobalPlaylistWithID:v9 andAddToCloudLibrary:1 completion:v8];
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __67__MPModelLibraryGlobalPlaylistImportChangeRequestOperation_execute__block_invoke_2;
    v7[3] = &unk_1E57EF5A0;
    v7[4] = self;
    [v5 addNonLibraryOwnedPlaylistWithGlobalID:v3 completion:v7];
  }
}

void __67__MPModelLibraryGlobalPlaylistImportChangeRequestOperation_execute__block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  v3 = [MPMediaQuery alloc];
  BOOL v4 = (void *)MEMORY[0x1E4F1CAD0];
  v5 = +[MPMediaPropertyPredicate predicateWithValue:*(void *)(a1 + 32) forProperty:@"cloudGlobalID"];
  v6 = [v4 setWithObject:v5];
  v7 = [(MPMediaQuery *)v3 initWithFilterPredicates:v6];

  v8 = [*(id *)(a1 + 40) mediaLibrary];
  [(MPMediaQuery *)v7 setMediaLibrary:v8];

  [(MPMediaQuery *)v7 setGroupingType:6];
  [(MPMediaQuery *)v7 setEntityLimit:1];
  [(MPMediaQuery *)v7 setIgnoreRestrictionsPredicates:1];
  [(MPMediaQuery *)v7 setShouldIncludeNonLibraryEntities:1];
  id v9 = [(MPMediaQuery *)v7 collections];
  v10 = [v9 firstObject];

  uint64_t v11 = [*(id *)(a1 + 40) responseHandler];
  v12 = (void *)v11;
  if (v11) {
    (*(void (**)(uint64_t, void *, id))(v11 + 16))(v11, v10, v13);
  }
  [*(id *)(a1 + 40) finishWithError:v13];
}

void __67__MPModelLibraryGlobalPlaylistImportChangeRequestOperation_execute__block_invoke_2(uint64_t a1, void *a2, void *a3)
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