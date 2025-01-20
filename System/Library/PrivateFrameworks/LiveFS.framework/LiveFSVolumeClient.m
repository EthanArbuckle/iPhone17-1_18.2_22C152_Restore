@interface LiveFSVolumeClient
+ (id)exportedClientInterface;
- (LiveFSVolumeClient)init;
- (NSMapTable)updateHandlers;
- (NSMutableDictionary)searchCompletionBlocks;
- (NSMutableDictionary)searchResultsBlocks;
- (int)LISCAddSearchHandlers:(id)a3 resultHandler:(id)a4 completionHandler:(id)a5;
- (int)LISCAddUpdateHandler:(id)a3 forInterestedItem:(id)a4;
- (void)LISCDropSearchHandlers:(id)a3;
- (void)LISCDropUpdateHandlerForInterestedItem:(id)a3;
- (void)connectionWasInvalidated;
- (void)deletedItem:(id)a3 name:(id)a4 how:(int)a5 interestedItem:(id)a6;
- (void)deletedName:(id)a3 item:(id)a4 how:(int)a5 interestedItem:(id)a6;
- (void)historyResetItem:(id)a3 interestedItem:(id)a4;
- (void)historyResetName:(id)a3 interestedItem:(id)a4;
- (void)renamedItem:(id)a3 named:(id)a4 fromDirectory:(id)a5 intoDirectory:(id)a6 newName:(id)a7 atopItem:(id)a8;
- (void)searchResults:(id)a3 paths:(id)a4 attributes:(id)a5 attributeSize:(unsigned int)a6 xAttrs:(id)a7 resumePath:(id)a8;
- (void)setSearchCompletionBlocks:(id)a3;
- (void)setSearchResultsBlocks:(id)a3;
- (void)setUpdateHandlers:(id)a3;
- (void)tokenDone:(id)a3 result:(int)a4;
- (void)updatedItem:(id)a3 name:(id)a4 interestedItem:(id)a5;
- (void)updatedName:(id)a3 interestedItem:(id)a4;
- (void)updatesDoneFor:(id)a3;
- (void)volumeWideDeletedName:(id)a3 interestedItem:(id)a4;
- (void)volumeWideUpdatedName:(id)a3 interestedItem:(id)a4;
@end

@implementation LiveFSVolumeClient

+ (id)exportedClientInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26EE23288];
}

- (LiveFSVolumeClient)init
{
  v10.receiver = self;
  v10.super_class = (Class)LiveFSVolumeClient;
  v2 = [(LiveFSVolumeClient *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    searchResultsBlocks = v2->_searchResultsBlocks;
    v2->_searchResultsBlocks = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    searchCompletionBlocks = v2->_searchCompletionBlocks;
    v2->_searchCompletionBlocks = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    updateHandlers = v2->_updateHandlers;
    v2->_updateHandlers = (NSMapTable *)v7;
  }
  return v2;
}

- (void)connectionWasInvalidated
{
  obj = self;
  objc_sync_enter(obj);
  [(NSMutableDictionary *)obj->_searchCompletionBlocks enumerateKeysAndObjectsUsingBlock:&__block_literal_global_1];
  v2 = [(NSMapTable *)obj->_updateHandlers objectEnumerator];
  for (i = 0; ; i = v4)
  {
    v4 = [v2 nextObject];

    if (!v4) {
      break;
    }
    [v4 updatesDoneFor:@"NSFileProviderRootContainerItemIdentifier"];
  }
  [(NSMutableDictionary *)obj->_searchResultsBlocks removeAllObjects];
  [(NSMutableDictionary *)obj->_searchCompletionBlocks removeAllObjects];
  [(NSMapTable *)obj->_updateHandlers removeAllObjects];

  objc_sync_exit(obj);
}

void __46__LiveFSVolumeClient_connectionWasInvalidated__block_invoke(int a1, int a2, void *aBlock, unsigned char *a4)
{
  *a4 = 0;
  v4 = (void (**)(id, uint64_t))_Block_copy(aBlock);
  v4[2](v4, 54);
}

- (int)LISCAddSearchHandlers:(id)a3 resultHandler:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  objc_sync_enter(v11);
  v12 = [(NSMutableDictionary *)v11->_searchCompletionBlocks objectForKey:v8];

  if (v12)
  {
    int v13 = 17;
  }
  else
  {
    searchCompletionBlocks = v11->_searchCompletionBlocks;
    v15 = (void *)[v10 copy];
    [(NSMutableDictionary *)searchCompletionBlocks setObject:v15 forKey:v8];

    searchResultsBlocks = v11->_searchResultsBlocks;
    v17 = (void *)[v9 copy];
    [(NSMutableDictionary *)searchResultsBlocks setObject:v17 forKey:v8];

    int v13 = 0;
  }
  objc_sync_exit(v11);

  return v13;
}

- (void)LISCDropSearchHandlers:(id)a3
{
  id v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [(NSMutableDictionary *)v4->_searchCompletionBlocks objectForKey:v6];

  if (v5)
  {
    [(NSMutableDictionary *)v4->_searchCompletionBlocks setValue:0 forKey:v6];
    [(NSMutableDictionary *)v4->_searchResultsBlocks setValue:0 forKey:v6];
  }
  objc_sync_exit(v4);
}

- (void)searchResults:(id)a3 paths:(id)a4 attributes:(id)a5 attributeSize:(unsigned int)a6 xAttrs:(id)a7 resumePath:(id)a8
{
  uint64_t v10 = *(void *)&a6;
  id v20 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  v18 = self;
  objc_sync_enter(v18);
  v19 = [(NSMutableDictionary *)v18->_searchResultsBlocks objectForKey:v20];
  objc_sync_exit(v18);

  if (v19) {
    ((void (**)(void, id, id, uint64_t, id, id))v19)[2](v19, v14, v15, v10, v16, v17);
  }
}

- (void)tokenDone:(id)a3 result:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v8 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = [(NSMutableDictionary *)v6->_searchCompletionBlocks objectForKey:v8];

  if (v7)
  {
    uint64_t v7 = [(NSMutableDictionary *)v6->_searchCompletionBlocks objectForKey:v8];
    [(NSMutableDictionary *)v6->_searchCompletionBlocks setValue:0 forKey:v8];
    [(NSMutableDictionary *)v6->_searchResultsBlocks setValue:0 forKey:v8];
  }
  objc_sync_exit(v6);

  if (v7) {
    v7[2](v7, v4);
  }
}

- (int)LISCAddUpdateHandler:(id)a3 forInterestedItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  id v9 = [(NSMapTable *)v8->_updateHandlers objectForKey:v7];

  if (v9)
  {
    int v10 = 17;
  }
  else
  {
    [(NSMapTable *)v8->_updateHandlers setObject:v6 forKey:v7];
    int v10 = 0;
  }
  objc_sync_exit(v8);

  return v10;
}

- (void)LISCDropUpdateHandlerForInterestedItem:(id)a3
{
  id v6 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [(NSMapTable *)v4->_updateHandlers objectForKey:v6];

  if (v5) {
    [(NSMapTable *)v4->_updateHandlers setObject:0 forKey:v6];
  }
  objc_sync_exit(v4);
}

- (void)updatedItem:(id)a3 name:(id)a4 interestedItem:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = self;
  objc_sync_enter(v10);
  v11 = [(NSMapTable *)v10->_updateHandlers objectForKey:v9];
  objc_sync_exit(v10);

  if (v11) {
    [v11 updatedItem:v12 name:v8 interestedItem:v9];
  }
}

- (void)updatedName:(id)a3 interestedItem:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  id v8 = [(NSMapTable *)v7->_updateHandlers objectForKey:v6];
  objc_sync_exit(v7);

  if (v8) {
    [v8 updatedName:v9 interestedItem:v6];
  }
}

- (void)deletedItem:(id)a3 name:(id)a4 how:(int)a5 interestedItem:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v14 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = self;
  objc_sync_enter(v12);
  int v13 = [(NSMapTable *)v12->_updateHandlers objectForKey:v11];
  objc_sync_exit(v12);

  if (v13) {
    [v13 deletedItem:v14 name:v10 how:v7 interestedItem:v11];
  }
}

- (void)deletedName:(id)a3 item:(id)a4 how:(int)a5 interestedItem:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v14 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = self;
  objc_sync_enter(v12);
  int v13 = [(NSMapTable *)v12->_updateHandlers objectForKey:v11];
  objc_sync_exit(v12);

  if (v13) {
    [v13 deletedName:v14 item:v10 how:v7 interestedItem:v11];
  }
}

- (void)volumeWideUpdatedName:(id)a3 interestedItem:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  id v8 = [(NSMapTable *)v7->_updateHandlers objectForKey:v6];
  objc_sync_exit(v7);

  if (v8) {
    [v8 volumeWideUpdatedName:v9 interestedItem:v6];
  }
}

- (void)volumeWideDeletedName:(id)a3 interestedItem:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  id v8 = [(NSMapTable *)v7->_updateHandlers objectForKey:v6];
  objc_sync_exit(v7);

  if (v8) {
    [v8 volumeWideDeletedName:v9 interestedItem:v6];
  }
}

- (void)renamedItem:(id)a3 named:(id)a4 fromDirectory:(id)a5 intoDirectory:(id)a6 newName:(id)a7 atopItem:(id)a8
{
  id v27 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v19 = self;
  objc_sync_enter(v19);
  id v20 = [(NSMapTable *)v19->_updateHandlers objectForKey:v27];
  v21 = [(NSMapTable *)v19->_updateHandlers objectForKey:v15];
  if (([v27 isEqualToString:v16] & 1) == 0)
  {
    v22 = [(NSMapTable *)v19->_updateHandlers objectForKey:v16];
    if (v18) {
      goto LABEL_3;
    }
LABEL_5:
    v23 = 0;
    goto LABEL_6;
  }
  v22 = 0;
  if (!v18) {
    goto LABEL_5;
  }
LABEL_3:
  v23 = [(NSMapTable *)v19->_updateHandlers objectForKey:v18];
LABEL_6:
  objc_sync_exit(v19);

  v24 = v20;
  if (v20 || (v24 = v21) != 0)
  {
    id v25 = v24;
  }
  else
  {
    if (v22) {
      v26 = v22;
    }
    else {
      v26 = v23;
    }
    id v25 = v26;
    if (!v25) {
      goto LABEL_10;
    }
  }
  [v25 renamedItem:v27 named:v14 fromDirectory:v15 intoDirectory:v16 newName:v17 atopItem:v18];
LABEL_10:
}

- (void)historyResetItem:(id)a3 interestedItem:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  id v8 = [(NSMapTable *)v7->_updateHandlers objectForKey:v6];
  objc_sync_exit(v7);

  if (v8) {
    [v8 historyResetItem:v9 interestedItem:v6];
  }
}

- (void)historyResetName:(id)a3 interestedItem:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  id v8 = [(NSMapTable *)v7->_updateHandlers objectForKey:v6];
  objc_sync_exit(v7);

  if (v8) {
    [v8 historyResetName:v9 interestedItem:v6];
  }
}

- (void)updatesDoneFor:(id)a3
{
  id v9 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  int v5 = [@"NSFileProviderRootContainerItemIdentifier" isEqualToString:v9];
  updateHandlers = v4->_updateHandlers;
  if (v5)
  {
    uint64_t v7 = (void *)[(NSMapTable *)updateHandlers copy];
    [(NSMapTable *)v4->_updateHandlers removeAllObjects];
    id v8 = 0;
  }
  else
  {
    id v8 = [(NSMapTable *)updateHandlers objectForKey:v9];
    if (v8) {
      [(NSMapTable *)v4->_updateHandlers setObject:0 forKey:v9];
    }
    uint64_t v7 = 0;
  }
  objc_sync_exit(v4);

  if (v7)
  {
    [v7 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_69];
  }
  else if (v8)
  {
    [v8 updatesDoneFor:v9];
  }
}

uint64_t __37__LiveFSVolumeClient_updatesDoneFor___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  *a4 = 0;
  return [a3 updatesDoneFor:@"NSFileProviderRootContainerItemIdentifier"];
}

- (NSMutableDictionary)searchResultsBlocks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSearchResultsBlocks:(id)a3
{
}

- (NSMutableDictionary)searchCompletionBlocks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSearchCompletionBlocks:(id)a3
{
}

- (NSMapTable)updateHandlers
{
  return (NSMapTable *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUpdateHandlers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateHandlers, 0);
  objc_storeStrong((id *)&self->_searchCompletionBlocks, 0);

  objc_storeStrong((id *)&self->_searchResultsBlocks, 0);
}

@end