@interface EDSpotlightDaemonClient
- (EDMessagePersistence)persistence;
- (EDSearchableIndex)searchableIndex;
- (EDSpotlightDaemonClient)initWithSearchableIndex:(id)a3 persistence:(id)a4;
- (id)fetchRepresentationForSearchableItemId:(id)a3 typeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)provideDataForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8;
- (void)provideFileURLForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8;
- (void)reindexAllItemsForBundleID:(id)a3 protectionClass:(id)a4 acknowledgementHandler:(id)a5;
- (void)reindexItemsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 acknowledgementHandler:(id)a6;
- (void)searchableItemsDidUpdate:(id)a3 mask:(int64_t)a4;
- (void)setPersistence:(id)a3;
- (void)setSearchableIndex:(id)a3;
@end

@implementation EDSpotlightDaemonClient

void ___ef_log_EDSpotlightDaemonClient_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "EDSpotlightDaemonClient");
  v1 = (void *)_ef_log_EDSpotlightDaemonClient_log;
  _ef_log_EDSpotlightDaemonClient_log = (uint64_t)v0;
}

- (EDSpotlightDaemonClient)initWithSearchableIndex:(id)a3 persistence:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)EDSpotlightDaemonClient;
  v8 = [(EDSpotlightDaemonClient *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(EDSpotlightDaemonClient *)v8 setSearchableIndex:v6];
    [(EDSpotlightDaemonClient *)v9 setPersistence:v7];
    SpotlightDaemonClientRegister();
  }

  return v9;
}

- (void)reindexAllItemsForBundleID:(id)a3 protectionClass:(id)a4 acknowledgementHandler:(id)a5
{
  id v7 = a5;
  id v6 = [(EDSpotlightDaemonClient *)self searchableIndex];
  [v6 reindexAllSearchableItemsWithAcknowledgementHandler:v7];
}

- (void)reindexItemsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 acknowledgementHandler:(id)a6
{
  id v10 = a3;
  id v8 = a6;
  v9 = [(EDSpotlightDaemonClient *)self searchableIndex];
  [v9 reindexSearchableItemsWithIdentifiers:v10 acknowledgementHandler:v8];
}

- (void)provideDataForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  id v11 = a6;
  id v12 = a8;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __122__EDSpotlightDaemonClient_provideDataForBundleID_protectionClass_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke;
  v16[3] = &unk_1E6C06648;
  id v17 = v11;
  id v18 = v12;
  id v13 = v11;
  id v14 = v12;
  id v15 = [(EDSpotlightDaemonClient *)self fetchRepresentationForSearchableItemId:a5 typeIdentifier:v13 completionHandler:v16];
}

void __122__EDSpotlightDaemonClient_provideDataForBundleID_protectionClass_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = a4;
  if (v9)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    uint64_t v10 = 0;
  }
  else
  {
    id v11 = [MEMORY[0x1E4F442D8] typeWithIdentifier:*(void *)(a1 + 32)];
    int v12 = [v11 conformsToType:*MEMORY[0x1E4F443A8]];

    if (v12)
    {
      id v13 = (void *)MEMORY[0x1E4F1C9B8];
      id v14 = [v7 contentURL];
      uint64_t v10 = [v13 dataWithContentsOfURL:v14];

      uint64_t v9 = 0;
    }
    else
    {
      id v15 = [v8 subject];
      v16 = [v15 subjectString];
      if ([v16 length])
      {
        id v17 = [v8 subject];
        id v18 = [v17 subjectString];
      }
      else
      {
        id v18 = 0;
      }

      v19 = [v7 publicMessageURL];
      if ([v18 length] && v19)
      {
        uint64_t v22 = *MEMORY[0x1E4FB12C8];
        v23[0] = v19;
        v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
        v21 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v18 attributes:v20];
        uint64_t v10 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v21 requiringSecureCoding:1 error:0];

        uint64_t v9 = 0;
      }
      else
      {
        uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"EDMailSpotlightIndexErrorDomain" code:11 userInfo:0];
        uint64_t v10 = 0;
      }
    }
    if (!(v10 | v9))
    {
      uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"EDMailSpotlightIndexErrorDomain" code:13 userInfo:0];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)provideFileURLForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  id v11 = a6;
  id v12 = a8;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __125__EDSpotlightDaemonClient_provideFileURLForBundleID_protectionClass_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke;
  v16[3] = &unk_1E6C06670;
  id v17 = v11;
  id v18 = v12;
  id v13 = v12;
  id v14 = v11;
  id v15 = [(EDSpotlightDaemonClient *)self fetchRepresentationForSearchableItemId:a5 typeIdentifier:v14 completionHandler:v16];
}

void __125__EDSpotlightDaemonClient_provideFileURLForBundleID_protectionClass_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F442D8] typeWithIdentifier:*(void *)(a1 + 32)];
  if ([v7 conformsToType:*MEMORY[0x1E4F443A8]]) {
    [v9 contentURL];
  }
  else {
  id v8 = [v9 publicMessageURL];
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)searchableItemsDidUpdate:(id)a3 mask:(int64_t)a4
{
  char v4 = a4;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v4)
  {
    id v7 = _ef_log_EDSpotlightDaemonClient();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      id v12 = v6;
      _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "spotlight updated items with summaries: %{public}@", (uint8_t *)&v11, 0xCu);
    }

    id v8 = [(EDSpotlightDaemonClient *)self searchableIndex];
    id v9 = [v8 dataSource];
    uint64_t v10 = [(EDSpotlightDaemonClient *)self searchableIndex];
    [v9 searchableIndex:v10 indexGeneratedSummaries:v6];
  }
}

- (id)fetchRepresentationForSearchableItemId:(id)a3 typeIdentifier:(id)a4 completionHandler:(id)a5
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if ([v7 length])
  {
    id v9 = [(EDSpotlightDaemonClient *)self persistence];
    v25[0] = v7;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    int v11 = [v9 messageObjectIDsForSearchableItemIdentifiers:v10];

    id v12 = [v11 first];
    uint64_t v13 = [v12 firstObject];

    if (!v13) {
      goto LABEL_5;
    }
    v24 = v13;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
    id v15 = [v9 messagesForMessageObjectIDs:v14 missedMessageObjectIDs:0];
    v16 = [v15 firstObject];

    if (v16)
    {
      id v17 = [MEMORY[0x1E4F60250] optionsWithRequestedRepresentationType:*MEMORY[0x1E4F5FCB0] networkUsage:0];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __99__EDSpotlightDaemonClient_fetchRepresentationForSearchableItemId_typeIdentifier_completionHandler___block_invoke;
      v22[3] = &unk_1E6C00FA0;
      id v23 = v8;
      id v18 = [v16 requestRepresentationWithOptions:v17 completionHandler:v22];
    }
    else
    {
LABEL_5:
      id v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"EDMailSpotlightIndexErrorDomain" code:12 userInfo:0];
      v16 = 0;
      (*((void (**)(id, void, void, void *))v8 + 2))(v8, 0, 0, v17);
      id v18 = 0;
    }

    id v19 = v18;
  }
  else
  {
    v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"EDMailSpotlightIndexErrorDomain" code:10 userInfo:0];
    (*((void (**)(id, void, void, void *))v8 + 2))(v8, 0, 0, v20);

    id v19 = 0;
  }

  return v19;
}

uint64_t __99__EDSpotlightDaemonClient_fetchRepresentationForSearchableItemId_typeIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (EDSearchableIndex)searchableIndex
{
  return self->_searchableIndex;
}

- (void)setSearchableIndex:(id)a3
{
}

- (EDMessagePersistence)persistence
{
  return self->_persistence;
}

- (void)setPersistence:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistence, 0);

  objc_storeStrong((id *)&self->_searchableIndex, 0);
}

@end