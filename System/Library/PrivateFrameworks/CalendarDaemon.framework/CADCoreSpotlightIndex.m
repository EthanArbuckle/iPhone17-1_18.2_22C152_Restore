@interface CADCoreSpotlightIndex
- (CADCoreSpotlightIndex)initWithBundleID:(id)a3;
- (void)deleteAllSearchableItemsForBundleID:(id)a3 completionHandler:(id)a4;
- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)indexSearchableItems:(id)a3 completionHandler:(id)a4;
@end

@implementation CADCoreSpotlightIndex

- (CADCoreSpotlightIndex)initWithBundleID:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CADCoreSpotlightIndex;
  v5 = [(CADCoreSpotlightIndex *)&v10 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F23838]);
    uint64_t v7 = [v6 initWithName:@"events" protectionClass:*MEMORY[0x1E4F28358] bundleIdentifier:v4];
    index = v5->_index;
    v5->_index = (CSSearchableIndex *)v7;
  }
  return v5;
}

- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  +[CADSpotlightLogger log:@"started deleteSearchableItemsWithDomainIdentifiers: %@", v7];
  index = self->_index;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __86__CADCoreSpotlightIndex_deleteSearchableItemsWithDomainIdentifiers_completionHandler___block_invoke;
  v10[3] = &unk_1E624EB90;
  id v11 = v6;
  id v9 = v6;
  [(CSSearchableIndex *)index deleteSearchableItemsWithDomainIdentifiers:v7 completionHandler:v10];
}

void __86__CADCoreSpotlightIndex_deleteSearchableItemsWithDomainIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = v4;
  if (a2) {
    +[CADSpotlightLogger logError:@"finished deleteSearchableItemsWithDomainIdentifiers: %@", v4];
  }
  else {
    +[CADSpotlightLogger log:@"finished deleteSearchableItemsWithDomainIdentifiers"];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)indexSearchableItems:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 CalMap:&__block_literal_global_18];
  +[CADSpotlightLogger log:@"started indexSearchableItems: %@", v8];
  index = self->_index;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__CADCoreSpotlightIndex_indexSearchableItems_completionHandler___block_invoke_2;
  v11[3] = &unk_1E624EB90;
  id v12 = v6;
  id v10 = v6;
  [(CSSearchableIndex *)index indexSearchableItems:v7 completionHandler:v11];
}

id __64__CADCoreSpotlightIndex_indexSearchableItems_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSString;
  id v3 = a2;
  id v4 = [v3 domainIdentifier];
  id v5 = [v3 uniqueIdentifier];

  id v6 = [v2 stringWithFormat:@"%@, %@", v4, v5];

  return v6;
}

void __64__CADCoreSpotlightIndex_indexSearchableItems_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = v4;
  if (a2) {
    +[CADSpotlightLogger logError:@"finished indexSearchableItems: %@", v4];
  }
  else {
    +[CADSpotlightLogger log:@"finished indexSearchableItems"];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteAllSearchableItemsForBundleID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  +[CADSpotlightLogger log:@"started deleteAllSearchableItemsForBundleID: %@", v7];
  index = self->_index;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__CADCoreSpotlightIndex_deleteAllSearchableItemsForBundleID_completionHandler___block_invoke;
  v10[3] = &unk_1E624EB90;
  id v11 = v6;
  id v9 = v6;
  [(CSSearchableIndex *)index deleteAllSearchableItemsForBundleID:v7 completionHandler:v10];
}

void __79__CADCoreSpotlightIndex_deleteAllSearchableItemsForBundleID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = v4;
  if (a2) {
    +[CADSpotlightLogger logError:@"finished deleteAllSearchableItemsForBundleID: %@", v4];
  }
  else {
    +[CADSpotlightLogger log:@"finished deleteAllSearchableItemsForBundleID"];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

@end