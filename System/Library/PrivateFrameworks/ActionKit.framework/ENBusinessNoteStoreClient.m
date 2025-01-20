@interface ENBusinessNoteStoreClient
+ (id)noteStoreClientForBusiness;
- (ENBusinessNoteStoreClientDelegate)delegate;
- (NSString)noteStoreUrl;
- (id)authenticationToken;
- (void)createBusinessNotebook:(id)a3 completion:(id)a4;
- (void)createBusinessNotebook:(id)a3 success:(id)a4 failure:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setNoteStoreUrl:(id)a3;
@end

@implementation ENBusinessNoteStoreClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noteStoreUrl, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setNoteStoreUrl:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (ENBusinessNoteStoreClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ENBusinessNoteStoreClientDelegate *)WeakRetained;
}

- (void)createBusinessNotebook:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68__ENBusinessNoteStoreClient_createBusinessNotebook_success_failure___block_invoke;
  v12[3] = &unk_264E5C878;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENBusinessNoteStoreClient *)self createBusinessNotebook:a3 completion:v12];
}

uint64_t __68__ENBusinessNoteStoreClient_createBusinessNotebook_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)createBusinessNotebook:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __63__ENBusinessNoteStoreClient_createBusinessNotebook_completion___block_invoke;
  v8[3] = &unk_264E56BA0;
  id v9 = v6;
  id v7 = v6;
  [(ENNoteStoreClient *)self createNotebook:a3 completion:v8];
}

void __63__ENBusinessNoteStoreClient_createBusinessNotebook_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v19 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v6 = [v5 sharedNotebooks];
    id v7 = [v6 objectAtIndexedSubscript:0];

    id v8 = objc_alloc_init(EDAMLinkedNotebook);
    id v9 = [v7 globalId];
    [(EDAMLinkedNotebook *)v8 setSharedNotebookGlobalId:v9];

    id v10 = [v19 name];
    [(EDAMLinkedNotebook *)v8 setShareName:v10];

    id v11 = +[ENSession sharedSession];
    v12 = [v11 businessUser];
    id v13 = [v12 username];
    [(EDAMLinkedNotebook *)v8 setUsername:v13];

    id v14 = +[ENSession sharedSession];
    v15 = [v14 businessUser];
    v16 = [v15 shardId];
    [(EDAMLinkedNotebook *)v8 setShardId:v16];

    v17 = +[ENSession sharedSession];
    v18 = [v17 primaryNoteStore];
    [v18 createLinkedNotebook:v8 completion:*(void *)(a1 + 32)];
  }
}

- (id)authenticationToken
{
  v4 = [(ENBusinessNoteStoreClient *)self delegate];

  if (!v4)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"ENBusinessNoteStoreClient.m" lineNumber:46 description:@"ENBusinessNoteStoreClient delegate not set"];
  }
  id v5 = [(ENBusinessNoteStoreClient *)self delegate];
  id v6 = [v5 authenticationTokenForBusinessStoreClient:self];

  return v6;
}

- (NSString)noteStoreUrl
{
  v4 = [(ENBusinessNoteStoreClient *)self delegate];

  if (!v4)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"ENBusinessNoteStoreClient.m" lineNumber:40 description:@"ENBusinessNoteStoreClient delegate not set"];
  }
  id v5 = [(ENBusinessNoteStoreClient *)self delegate];
  id v6 = [v5 noteStoreUrlForBusinessStoreClient:self];

  return (NSString *)v6;
}

+ (id)noteStoreClientForBusiness
{
  v2 = objc_alloc_init(ENBusinessNoteStoreClient);
  return v2;
}

@end