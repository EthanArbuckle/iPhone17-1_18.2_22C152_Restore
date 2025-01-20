@interface MPModelLibraryAlbumAppDataChangeRequestOperation
- (MPModelLibraryAlbumAppDataChangeRequest)request;
- (id)responseHandler;
- (void)execute;
- (void)setRequest:(id)a3;
- (void)setResponseHandler:(id)a3;
@end

@implementation MPModelLibraryAlbumAppDataChangeRequestOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);

  objc_storeStrong(&self->_responseHandler, 0);
}

- (void)setRequest:(id)a3
{
}

- (MPModelLibraryAlbumAppDataChangeRequest)request
{
  return self->_request;
}

- (void)setResponseHandler:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)execute
{
  v25[1] = *MEMORY[0x1E4F143B8];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __59__MPModelLibraryAlbumAppDataChangeRequestOperation_execute__block_invoke;
  v23[3] = &unk_1E57FA170;
  v23[4] = self;
  v3 = (void (**)(void, void, void))MEMORY[0x19971E0F0](v23, a2);
  v4 = [(MPModelLibraryAlbumAppDataChangeRequestOperation *)self request];
  v5 = [v4 albumAppData];
  v6 = [v5 createAppDataDictionary];

  id v22 = 0;
  v7 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v6 format:200 options:0 error:&v22];
  id v8 = v22;
  if (v7)
  {
    v9 = [(MPModelLibraryAlbumAppDataChangeRequestOperation *)self request];
    v10 = [v9 modelObject];
    v11 = [v10 identifiers];
    v12 = [v11 library];
    uint64_t v13 = [v12 persistentID];

    v14 = [MEMORY[0x1E4F79AA0] predicateWithProperty:*MEMORY[0x1E4F79350] equalToInt64:v13];
    v15 = (void *)MEMORY[0x1E4F79A50];
    v16 = [MEMORY[0x1E4F79AF8] autoupdatingSharedLibrary];
    v17 = [v15 anyInLibrary:v16 predicate:v14];

    if (v17)
    {
      v25[0] = v7;
      v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
      uint64_t v24 = *MEMORY[0x1E4F79028];
      v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __59__MPModelLibraryAlbumAppDataChangeRequestOperation_execute__block_invoke_2;
      v20[3] = &unk_1E57F9168;
      v21 = v3;
      [v17 setValues:v18 forProperties:v19 async:1 withCompletionBlock:v20];
    }
    else
    {
      v3[2](v3, 0, 0);
    }
  }
  else
  {
    ((void (**)(void, void, id))v3)[2](v3, 0, v8);
  }
}

uint64_t __59__MPModelLibraryAlbumAppDataChangeRequestOperation_execute__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = v4[34];
  if (v5)
  {
    (*(void (**)(void, uint64_t))(v5 + 16))(v4[34], a3);
    v4 = *(void **)(a1 + 32);
  }

  return [v4 finish];
}

uint64_t __59__MPModelLibraryAlbumAppDataChangeRequestOperation_execute__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end