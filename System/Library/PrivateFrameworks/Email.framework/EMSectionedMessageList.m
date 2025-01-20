@interface EMSectionedMessageList
- (BOOL)anyExpandedThreadContainsItemID:(id)a3;
- (BOOL)containsItemID:(id)a3;
- (BOOL)isThreaded;
- (BOOL)recentlyCollapsedThreadContainsItemID:(id)a3;
- (EFFuture)allItemIDs;
- (EFScheduler)observerScheduler;
- (EMSectionedMessageList)initWithMessageListSections:(id)a3;
- (EMSectionedMessageList)unfilteredMessageList;
- (NSPredicate)filterPredicate;
- (NSSet)expandedThreadItemIDs;
- (NSString)ef_publicDescription;
- (id)_boxItemIDForItemID:(id)a3 inSection:(id)a4;
- (id)_boxItemIDsForItemIDs:(id)a3 inSection:(id)a4;
- (id)_firstItemIDOfSectionAfterSection:(unint64_t)a3;
- (id)_itemIDsGroupedBySection:(id)a3;
- (id)_lastItemIDOfSectionBeforeSection:(unint64_t)a3;
- (id)_sectionedItemIDForItemID:(id)a3;
- (id)_sectionedMessageListItemForMessageListItem:(id)a3;
- (id)_sectionedObjectIDForObjectID:(id)a3;
- (id)filteredMessageListWithPredicate:(id)a3 ignoredMessagesPredicate:(id)a4 userFiltered:(BOOL)a5;
- (id)itemIDOfFirstMessageListItemMatchingPredicate:(id)a3;
- (id)itemIDOfMessageListItemWithDisplayMessage:(id)a3;
- (id)messageListItemForItemID:(id)a3;
- (id)messageListItemForItemID:(id)a3 ifAvailable:(BOOL)a4;
- (id)messageListItemsForItemIDs:(id)a3;
- (id)messageListItemsForItemIDs:(id)a3 ifAvailable:(BOOL)a4;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (id)objectIDForItemID:(id)a3;
- (unint64_t)_sectionIndexForCollection:(id)a3;
- (void)_collection:(id)a3 addedItemIDs:(id)a4 toThreadWithItemID:(id)a5 before:(BOOL)a6 existingItemID:(id)a7 notifyObserverBlock:(id)a8;
- (void)_collection:(id)a3 addedItemIDs:(id)a4 toThreadWithItemID:(id)a5 before:(BOOL)a6 existingItemID:(id)a7 unreadItemIDs:(id)a8;
- (void)_collection:(id)a3 movedItemIDs:(id)a4 before:(BOOL)a5 existingItemID:(id)a6;
- (void)beginObserving:(id)a3;
- (void)clearRecentlyCollapsedThread;
- (void)collapseThread:(id)a3;
- (void)collection:(id)a3 addedItemIDs:(id)a4 after:(id)a5;
- (void)collection:(id)a3 addedItemIDs:(id)a4 before:(id)a5;
- (void)collection:(id)a3 addedItemIDs:(id)a4 toThreadWithItemID:(id)a5 after:(id)a6 unreadItemIDs:(id)a7;
- (void)collection:(id)a3 addedItemIDs:(id)a4 toThreadWithItemID:(id)a5 before:(id)a6 unreadItemIDs:(id)a7;
- (void)collection:(id)a3 changedItemIDs:(id)a4;
- (void)collection:(id)a3 changedItemIDs:(id)a4 itemIDsWithCountChanges:(id)a5;
- (void)collection:(id)a3 deletedItemIDs:(id)a4;
- (void)collection:(id)a3 didFinishInitialLoadForThreadWithItemID:(id)a4;
- (void)collection:(id)a3 movedItemIDs:(id)a4 after:(id)a5;
- (void)collection:(id)a3 movedItemIDs:(id)a4 before:(id)a5;
- (void)collection:(id)a3 oldestItemsUpdatedForMailboxes:(id)a4;
- (void)collection:(id)a3 replacedExistingItemID:(id)a4 withNewItemID:(id)a5;
- (void)collection:(id)a3 shouldHighlightSnippetHints:(id)a4;
- (void)collectionDidFinishInitialLoad:(id)a3;
- (void)didFinishRecoveryForCollection:(id)a3;
- (void)didFinishRemoteSearchForCollection:(id)a3;
- (void)expandThread:(id)a3;
- (void)expandThreadsFromThreadItemIDs:(id)a3;
- (void)invalidateCacheForItemIDs:(id)a3;
- (void)refresh;
- (void)setFilterPredicate:(id)a3;
- (void)setUnfilteredMessageList:(id)a3;
- (void)stopObserving:(id)a3;
@end

@implementation EMSectionedMessageList

- (EMSectionedMessageList)initWithMessageListSections:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)EMSectionedMessageList;
  v5 = [(EMSectionedMessageList *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    sections = v5->_sections;
    v5->_sections = (EFOrderedDictionary *)v6;

    id v8 = objc_alloc(MEMORY[0x1E4F60DA0]);
    v9 = [v4 allKeys];
    v10 = [v9 set];
    v11 = (void *)[v10 mutableCopy];
    uint64_t v12 = [v8 initWithObject:v11];
    sectionsAwaitingInitialLoad = v5->_sectionsAwaitingInitialLoad;
    v5->_sectionsAwaitingInitialLoad = (EFLocked *)v12;

    id v14 = objc_alloc(MEMORY[0x1E4F60DA0]);
    v15 = [v4 allKeys];
    v16 = [v15 set];
    v17 = (void *)[v16 mutableCopy];
    uint64_t v18 = [v14 initWithObject:v17];
    sectionsAwaitingRemoteSearch = v5->_sectionsAwaitingRemoteSearch;
    v5->_sectionsAwaitingRemoteSearch = (EFLocked *)v18;

    uint64_t v20 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    changeObservers = v5->_changeObservers;
    v5->_changeObservers = (NSHashTable *)v20;
  }
  return v5;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  if ([(EFOrderedDictionary *)self->_sections count] <= a3)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(EFOrderedDictionary *)self->_sections objectAtIndexedSubscript:a3];
  }
  return v5;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(EFOrderedDictionary *)self->_sections objectForKeyedSubscript:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_sectionedItemIDForItemID:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)_sectionedObjectIDForObjectID:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)_sectionedMessageListItemForMessageListItem:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)_itemIDsGroupedBySection:(id)a3
{
  id v3 = objc_msgSend(a3, "ef_compactMap:", &__block_literal_global_48);
  id v4 = objc_msgSend(v3, "ef_groupBy:", &__block_literal_global_10_0);

  return v4;
}

id __51__EMSectionedMessageList__itemIDsGroupedBySection___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

id __51__EMSectionedMessageList__itemIDsGroupedBySection___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 sectionID];
  return v2;
}

- (unint64_t)_sectionIndexForCollection:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  sections = self->_sections;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__EMSectionedMessageList__sectionIndexForCollection___block_invoke;
  v9[3] = &unk_1E63E6358;
  id v10 = v4;
  v11 = &v12;
  id v6 = v4;
  [(EFOrderedDictionary *)sections enumerateKeysAndObjectsUsingBlock:v9];
  unint64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __53__EMSectionedMessageList__sectionIndexForCollection___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = [*(id *)(a1 + 32) isEqual:a4];
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
    *a5 = 1;
  }
  return result;
}

- (id)_boxItemIDForItemID:(id)a3 inSection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    unint64_t v7 = +[EMSectionedMessageListObjectConverter itemIDForItemID:v5 inSection:v6];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (id)_boxItemIDsForItemIDs:(id)a3 inSection:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__EMSectionedMessageList__boxItemIDsForItemIDs_inSection___block_invoke;
  v9[3] = &unk_1E63E6380;
  id v10 = v5;
  id v6 = v5;
  unint64_t v7 = objc_msgSend(a3, "ef_map:", v9);

  return v7;
}

id __58__EMSectionedMessageList__boxItemIDsForItemIDs_inSection___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = +[EMSectionedMessageListObjectConverter itemIDForItemID:a2 inSection:*(void *)(a1 + 32)];
  return v2;
}

- (id)_lastItemIDOfSectionBeforeSection:(unint64_t)a3
{
  if (a3)
  {
    unint64_t v4 = a3 - 1;
    while (1)
    {
      id v5 = [(EMSectionedMessageList *)self objectAtIndexedSubscript:v4];
      id v6 = [v5 allItemIDs];
      unint64_t v7 = [v6 resultIfAvailable];
      id v8 = [v7 lastObject];

      if (v8) {
        break;
      }
      if (--v4 == -1) {
        goto LABEL_5;
      }
    }
    id v10 = [(EFOrderedDictionary *)self->_sections keyAtIndex:v4];
    v9 = [(EMSectionedMessageList *)self _boxItemIDForItemID:v8 inSection:v10];
  }
  else
  {
LABEL_5:
    v9 = 0;
  }
  return v9;
}

- (id)_firstItemIDOfSectionAfterSection:(unint64_t)a3
{
  unint64_t v4 = a3 + 1;
  for (i = self->_sections; ; i = self->_sections)
  {
    if (v4 >= [(EFOrderedDictionary *)i count])
    {
      id v10 = 0;
      goto LABEL_7;
    }
    id v6 = [(EMSectionedMessageList *)self objectAtIndexedSubscript:v4];
    unint64_t v7 = [v6 allItemIDs];
    id v8 = [v7 resultIfAvailable];
    v9 = [v8 lastObject];

    if (v9) {
      break;
    }
    ++v4;
  }
  v11 = [(EFOrderedDictionary *)self->_sections keyAtIndex:v4];
  id v10 = [(EMSectionedMessageList *)self _boxItemIDForItemID:v9 inSection:v11];

LABEL_7:
  return v10;
}

- (NSString)ef_publicDescription
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"Sectioned Message List:"];
  sections = self->_sections;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__EMSectionedMessageList_ef_publicDescription__block_invoke;
  v7[3] = &unk_1E63E63A8;
  id v5 = v3;
  id v8 = v5;
  [(EFOrderedDictionary *)sections enumerateKeysAndObjectsUsingBlock:v7];

  return (NSString *)v5;
}

uint64_t __46__EMSectionedMessageList_ef_publicDescription__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) appendFormat:@"\n  %@: %@", a3, a4];
}

- (EFFuture)allItemIDs
{
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[EFOrderedDictionary count](self->_sections, "count"));
  sections = self->_sections;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __36__EMSectionedMessageList_allItemIDs__block_invoke;
  uint64_t v12 = &unk_1E63E63F8;
  v13 = self;
  id v5 = v3;
  id v14 = v5;
  [(EFOrderedDictionary *)sections enumerateKeysAndObjectsUsingBlock:&v9];
  id v6 = objc_msgSend(MEMORY[0x1E4F60D70], "join:", v5, v9, v10, v11, v12, v13);
  unint64_t v7 = [v6 then:&__block_literal_global_22];

  return (EFFuture *)v7;
}

void __36__EMSectionedMessageList_allItemIDs__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  unint64_t v7 = [a4 allItemIDs];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __36__EMSectionedMessageList_allItemIDs__block_invoke_2;
  v13 = &unk_1E63E63D0;
  uint64_t v14 = *(void *)(a1 + 32);
  id v8 = v6;
  id v15 = v8;
  uint64_t v9 = [v7 then:&v10];
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v9, v10, v11, v12, v13, v14);
}

id __36__EMSectionedMessageList_allItemIDs__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) _boxItemIDsForItemIDs:a2 inSection:*(void *)(a1 + 40)];
  id v3 = [MEMORY[0x1E4F60D70] futureWithResult:v2];

  return v3;
}

id __36__EMSectionedMessageList_allItemIDs__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F60D70];
  id v3 = objc_msgSend(a2, "ef_flatten");
  unint64_t v4 = [v2 futureWithResult:v3];

  return v4;
}

- (void)beginObserving:(id)a3
{
  id v4 = a3;
  id v5 = [(EMSectionedMessageList *)self observerScheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__EMSectionedMessageList_beginObserving___block_invoke;
  v7[3] = &unk_1E63E2760;
  void v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [v5 performBlock:v7];
}

uint64_t __41__EMSectionedMessageList_beginObserving___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) anyObject];

  uint64_t v3 = *(void *)(a1 + 32);
  if (v2)
  {
    [*(id *)(v3 + 32) addObject:*(void *)(a1 + 40)];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 8);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __41__EMSectionedMessageList_beginObserving___block_invoke_3;
    v8[3] = &unk_1E63E63A8;
    v8[4] = v4;
    return [v5 enumerateKeysAndObjectsUsingBlock:v8];
  }
  else
  {
    unint64_t v7 = *(void **)(v3 + 8);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __41__EMSectionedMessageList_beginObserving___block_invoke_2;
    v9[3] = &unk_1E63E63A8;
    void v9[4] = v3;
    [v7 enumerateKeysAndObjectsUsingBlock:v9];
    return [*(id *)(*(void *)(a1 + 32) + 32) addObject:*(void *)(a1 + 40)];
  }
}

uint64_t __41__EMSectionedMessageList_beginObserving___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return [a4 beginObserving:*(void *)(a1 + 32)];
}

uint64_t __41__EMSectionedMessageList_beginObserving___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return [a4 notifyNewChangeObserverAboutExistingState:*(void *)(a1 + 32)];
}

- (void)stopObserving:(id)a3
{
  id v4 = a3;
  id v5 = [(EMSectionedMessageList *)self observerScheduler];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__EMSectionedMessageList_stopObserving___block_invoke;
  v6[3] = &unk_1E63E5C88;
  v6[4] = self;
  v6[5] = v4;
  [v5 performBlock:v6];
}

void __40__EMSectionedMessageList_stopObserving___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v3)
  {

LABEL_12:
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void **)(v9 + 8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __40__EMSectionedMessageList_stopObserving___block_invoke_2;
    v11[3] = &unk_1E63E63A8;
    v11[4] = v9;
    [v10 enumerateKeysAndObjectsUsingBlock:v11];
    return;
  }
  char v4 = 0;
  uint64_t v5 = *(void *)v13;
  int v6 = 1;
  do
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if (*(void *)v13 != v5) {
        objc_enumerationMutation(v2);
      }
      BOOL v8 = *(void *)(*((void *)&v12 + 1) + 8 * i) == *(void *)(a1 + 40);
      v4 |= v8;
      v6 &= v8;
    }
    uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  }
  while (v3);

  if (v4)
  {
    [*(id *)(*(void *)(a1 + 32) + 32) removeObject:*(void *)(a1 + 40)];
    if (v6) {
      goto LABEL_12;
    }
  }
}

uint64_t __40__EMSectionedMessageList_stopObserving___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return [a4 stopObserving:*(void *)(a1 + 32)];
}

- (void)refresh
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = [(EFOrderedDictionary *)self->_sections allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * v5++) refresh];
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (id)objectIDForItemID:(id)a3
{
  uint64_t v4 = [(EMSectionedMessageList *)self _sectionedItemIDForItemID:a3];
  uint64_t v5 = v4;
  if (v4)
  {
    long long v6 = [v4 sectionID];
    long long v7 = [v5 underlyingItemID];
    long long v8 = [(EMSectionedMessageList *)self objectForKeyedSubscript:v6];
    long long v9 = [v8 objectIDForItemID:v7];

    uint64_t v10 = [v5 sectionID];
    uint64_t v11 = +[EMSectionedMessageListObjectConverter objectIDForObjectID:v9 inSection:v10];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (BOOL)containsItemID:(id)a3
{
  uint64_t v4 = [(EMSectionedMessageList *)self _sectionedItemIDForItemID:a3];
  uint64_t v5 = [v4 sectionID];
  long long v6 = [(EMSectionedMessageList *)self objectForKeyedSubscript:v5];
  long long v7 = [v4 underlyingItemID];
  char v8 = [v6 containsItemID:v7];

  return v8;
}

- (BOOL)isThreaded
{
  id v2 = [(EFOrderedDictionary *)self->_sections allValues];
  char v3 = objc_msgSend(v2, "ef_any:", &__block_literal_global_26);

  return v3;
}

uint64_t __36__EMSectionedMessageList_isThreaded__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isThreaded];
}

- (NSSet)expandedThreadItemIDs
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  sections = self->_sections;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__EMSectionedMessageList_expandedThreadItemIDs__block_invoke;
  v9[3] = &unk_1E63E63F8;
  void v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  [(EFOrderedDictionary *)sections enumerateKeysAndObjectsUsingBlock:v9];
  long long v6 = v10;
  long long v7 = (NSSet *)v5;

  return v7;
}

void __47__EMSectionedMessageList_expandedThreadItemIDs__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v7 = objc_msgSend(a4, "expandedThreadItemIDs", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = [*(id *)(a1 + 32) _boxItemIDForItemID:*(void *)(*((void *)&v12 + 1) + 8 * v10) inSection:v6];
        [*(id *)(a1 + 40) addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (id)filteredMessageListWithPredicate:(id)a3 ignoredMessagesPredicate:(id)a4 userFiltered:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__13;
  v28 = __Block_byref_object_dispose__13;
  id v29 = (id)0xAAAAAAAAAAAAAAAALL;
  id v29 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F60DC0]), "initWithCapacity:", -[EFOrderedDictionary count](self->_sections, "count"));
  sections = self->_sections;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __97__EMSectionedMessageList_filteredMessageListWithPredicate_ignoredMessagesPredicate_userFiltered___block_invoke;
  v19 = &unk_1E63E6460;
  id v11 = v8;
  id v20 = v11;
  id v12 = v9;
  BOOL v23 = a5;
  id v21 = v12;
  v22 = &v24;
  [(EFOrderedDictionary *)sections enumerateKeysAndObjectsUsingBlock:&v16];
  long long v13 = [EMSectionedMessageList alloc];
  long long v14 = -[EMSectionedMessageList initWithMessageListSections:](v13, "initWithMessageListSections:", v25[5], v16, v17, v18, v19);
  [(EMSectionedMessageList *)v14 setFilterPredicate:v11];
  [(EMSectionedMessageList *)v14 setUnfilteredMessageList:self];

  _Block_object_dispose(&v24, 8);
  return v14;
}

void __97__EMSectionedMessageList_filteredMessageListWithPredicate_ignoredMessagesPredicate_userFiltered___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v6 = [a4 filteredMessageListWithPredicate:*(void *)(a1 + 32) ignoredMessagesPredicate:*(void *)(a1 + 40) userFiltered:*(unsigned __int8 *)(a1 + 56)];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setOrAddObject:v6 forKey:v7];
}

- (EMSectionedMessageList)unfilteredMessageList
{
  if (self->_unfilteredMessageList) {
    self = self->_unfilteredMessageList;
  }
  return self;
}

- (void)expandThreadsFromThreadItemIDs:(id)a3
{
  uint64_t v4 = [(EMSectionedMessageList *)self _itemIDsGroupedBySection:a3];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__EMSectionedMessageList_expandThreadsFromThreadItemIDs___block_invoke;
  v5[3] = &unk_1E63E6488;
  v5[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v5];
}

void __57__EMSectionedMessageList_expandThreadsFromThreadItemIDs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = objc_msgSend(a3, "ef_mapSelector:", sel_underlyingItemID);
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
  [v6 expandThreadsFromThreadItemIDs:v5];
}

- (void)expandThread:(id)a3
{
  id v7 = [(EMSectionedMessageList *)self _sectionedMessageListItemForMessageListItem:a3];
  uint64_t v4 = [v7 sectionID];
  id v5 = [(EMSectionedMessageList *)self objectForKeyedSubscript:v4];
  id v6 = [v7 underlyingItem];
  [v5 expandThread:v6];
}

- (void)collapseThread:(id)a3
{
  id v7 = [(EMSectionedMessageList *)self _sectionedMessageListItemForMessageListItem:a3];
  uint64_t v4 = [v7 sectionID];
  id v5 = [(EMSectionedMessageList *)self objectForKeyedSubscript:v4];
  id v6 = [v7 underlyingItem];
  [v5 collapseThread:v6];
}

- (BOOL)anyExpandedThreadContainsItemID:(id)a3
{
  uint64_t v4 = [(EMSectionedMessageList *)self _sectionedItemIDForItemID:a3];
  id v5 = [v4 sectionID];
  id v6 = [(EMSectionedMessageList *)self objectForKeyedSubscript:v5];
  id v7 = [v4 underlyingItemID];
  char v8 = [v6 anyExpandedThreadContainsItemID:v7];

  return v8;
}

- (BOOL)recentlyCollapsedThreadContainsItemID:(id)a3
{
  uint64_t v4 = [(EMSectionedMessageList *)self _sectionedItemIDForItemID:a3];
  id v5 = [v4 sectionID];
  id v6 = [(EMSectionedMessageList *)self objectForKeyedSubscript:v5];
  id v7 = [v4 underlyingItemID];
  char v8 = [v6 recentlyCollapsedThreadContainsItemID:v7];

  return v8;
}

- (void)clearRecentlyCollapsedThread
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = [(EFOrderedDictionary *)self->_sections allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * v5++) clearRecentlyCollapsedThread];
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (id)messageListItemForItemID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(EMSectionedMessageList *)self _sectionedItemIDForItemID:v4];
  long long v6 = [v5 sectionID];
  long long v7 = [(EMSectionedMessageList *)self objectForKeyedSubscript:v6];
  long long v8 = [v5 underlyingItemID];
  long long v9 = [v7 messageListItemForItemID:v8];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__EMSectionedMessageList_messageListItemForItemID___block_invoke;
  v13[3] = &unk_1E63E64B0;
  id v10 = v5;
  id v14 = v10;
  uint64_t v11 = [v9 then:v13];

  return v11;
}

id __51__EMSectionedMessageList_messageListItemForItemID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) sectionID];
  uint64_t v5 = +[EMSectionedMessageListObjectConverter messageListItemForMessageListItem:v3 inSection:v4];

  long long v6 = [MEMORY[0x1E4F60D70] futureWithResult:v5];

  return v6;
}

- (id)messageListItemForItemID:(id)a3 ifAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  long long v7 = [(EMSectionedMessageList *)self _sectionedItemIDForItemID:v6];
  long long v8 = [v7 sectionID];
  long long v9 = [(EMSectionedMessageList *)self objectForKeyedSubscript:v8];
  id v10 = [v7 underlyingItemID];
  uint64_t v11 = [v9 messageListItemForItemID:v10 ifAvailable:v4];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__EMSectionedMessageList_messageListItemForItemID_ifAvailable___block_invoke;
  v15[3] = &unk_1E63E64B0;
  id v12 = v7;
  id v16 = v12;
  long long v13 = [v11 then:v15];

  return v13;
}

id __63__EMSectionedMessageList_messageListItemForItemID_ifAvailable___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) sectionID];
  uint64_t v5 = +[EMSectionedMessageListObjectConverter messageListItemForMessageListItem:v3 inSection:v4];

  id v6 = [MEMORY[0x1E4F60D70] futureWithResult:v5];

  return v6;
}

- (id)messageListItemsForItemIDs:(id)a3
{
  BOOL v4 = [(EMSectionedMessageList *)self _itemIDsGroupedBySection:a3];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__EMSectionedMessageList_messageListItemsForItemIDs___block_invoke;
  v10[3] = &unk_1E63E64D8;
  v10[4] = self;
  id v6 = v5;
  id v11 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v10];
  long long v7 = v11;
  id v8 = v6;

  return v8;
}

void __53__EMSectionedMessageList_messageListItemsForItemIDs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v14 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  long long v7 = [v6 messageListItemsForItemIDs:v14];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __53__EMSectionedMessageList_messageListItemsForItemIDs___block_invoke_2;
        v15[3] = &unk_1E63E64B0;
        id v16 = v5;
        long long v13 = [v12 then:v15];
        [*(id *)(a1 + 40) addObject:v13];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
}

id __53__EMSectionedMessageList_messageListItemsForItemIDs___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v2 = +[EMSectionedMessageListObjectConverter messageListItemForMessageListItem:a2 inSection:*(void *)(a1 + 32)];
  id v3 = [MEMORY[0x1E4F60D70] futureWithResult:v2];

  return v3;
}

- (id)messageListItemsForItemIDs:(id)a3 ifAvailable:(BOOL)a4
{
  id v6 = [(EMSectionedMessageList *)self _itemIDsGroupedBySection:a3];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__EMSectionedMessageList_messageListItemsForItemIDs_ifAvailable___block_invoke;
  v12[3] = &unk_1E63E6500;
  v12[4] = self;
  BOOL v14 = a4;
  id v8 = v7;
  id v13 = v8;
  [v6 enumerateKeysAndObjectsUsingBlock:v12];
  uint64_t v9 = v13;
  id v10 = v8;

  return v10;
}

void __65__EMSectionedMessageList_messageListItemsForItemIDs_ifAvailable___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v14 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  id v7 = [v6 messageListItemsForItemIDs:v14 ifAvailable:*(unsigned __int8 *)(a1 + 48)];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __65__EMSectionedMessageList_messageListItemsForItemIDs_ifAvailable___block_invoke_2;
        v15[3] = &unk_1E63E64B0;
        id v16 = v5;
        id v13 = [v12 then:v15];
        [*(id *)(a1 + 40) addObject:v13];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
}

id __65__EMSectionedMessageList_messageListItemsForItemIDs_ifAvailable___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v2 = +[EMSectionedMessageListObjectConverter messageListItemForMessageListItem:a2 inSection:*(void *)(a1 + 32)];
  id v3 = [MEMORY[0x1E4F60D70] futureWithResult:v2];

  return v3;
}

- (id)itemIDOfMessageListItemWithDisplayMessage:(id)a3
{
  BOOL v4 = [(EMSectionedMessageList *)self _sectionedMessageListItemForMessageListItem:a3];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 sectionID];
    id v7 = [(EMSectionedMessageList *)self objectForKeyedSubscript:v6];
    id v8 = [v5 underlyingItem];
    uint64_t v9 = [v7 itemIDOfMessageListItemWithDisplayMessage:v8];

    uint64_t v10 = [v5 sectionID];
    uint64_t v11 = +[EMSectionedMessageListObjectConverter itemIDForItemID:v9 inSection:v10];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)itemIDOfFirstMessageListItemMatchingPredicate:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__13;
  id v16 = __Block_byref_object_dispose__13;
  id v17 = 0;
  sections = self->_sections;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__EMSectionedMessageList_itemIDOfFirstMessageListItemMatchingPredicate___block_invoke;
  v9[3] = &unk_1E63E6358;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  [(EFOrderedDictionary *)sections enumerateKeysAndObjectsUsingBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __72__EMSectionedMessageList_itemIDOfFirstMessageListItemMatchingPredicate___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, unsigned char *a5)
{
  id v13 = a3;
  id v8 = a4;
  uint64_t v9 = [v8 itemIDOfFirstMessageListItemMatchingPredicate:*(void *)(a1 + 32)];
  if (v9)
  {
    uint64_t v10 = +[EMSectionedMessageListObjectConverter itemIDForItemID:v9 inSection:v13];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    *a5 = 1;
  }
}

- (void)invalidateCacheForItemIDs:(id)a3
{
  id v4 = [(EMSectionedMessageList *)self _itemIDsGroupedBySection:a3];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__EMSectionedMessageList_invalidateCacheForItemIDs___block_invoke;
  v5[3] = &unk_1E63E6488;
  v5[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v5];
}

void __52__EMSectionedMessageList_invalidateCacheForItemIDs___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  [v5 invalidateCacheForItemIDs:v6];
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 after:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  [(EMSectionedMessageList *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EMSectionedMessageList collection:addedItemIDs:after:]", "EMSectionedMessageList.m", 400, "0");
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 before:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  [(EMSectionedMessageList *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EMSectionedMessageList collection:addedItemIDs:before:]", "EMSectionedMessageList.m", 404, "0");
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 toThreadWithItemID:(id)a5 after:(id)a6 unreadItemIDs:(id)a7
{
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 toThreadWithItemID:(id)a5 before:(id)a6 unreadItemIDs:(id)a7
{
}

- (void)_collection:(id)a3 addedItemIDs:(id)a4 toThreadWithItemID:(id)a5 before:(BOOL)a6 existingItemID:(id)a7 unreadItemIDs:(id)a8
{
  BOOL v9 = a6;
  id v14 = a8;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__13;
  v20[4] = __Block_byref_object_dispose__13;
  id v21 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __106__EMSectionedMessageList__collection_addedItemIDs_toThreadWithItemID_before_existingItemID_unreadItemIDs___block_invoke;
  v16[3] = &unk_1E63E6528;
  id v17 = v14;
  long long v18 = v20;
  v16[4] = self;
  BOOL v19 = v9;
  id v15 = v14;
  [(EMSectionedMessageList *)self _collection:a3 addedItemIDs:a4 toThreadWithItemID:a5 before:v9 existingItemID:a7 notifyObserverBlock:v16];

  _Block_object_dispose(v20, 8);
}

uint64_t __106__EMSectionedMessageList__collection_addedItemIDs_toThreadWithItemID_before_existingItemID_unreadItemIDs___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  char v16 = objc_opt_respondsToSelector();
  if (v16)
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      uint64_t v17 = [*(id *)(a1 + 32) _boxItemIDsForItemIDs:*(void *)(a1 + 40) inSection:v15];
      uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
      BOOL v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;
    }
    uint64_t v20 = *(void *)(a1 + 32);
    uint64_t v21 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (*(unsigned char *)(a1 + 56)) {
      [v11 collection:v20 addedItemIDs:v12 toThreadWithItemID:v13 before:v14 unreadItemIDs:v21];
    }
    else {
      [v11 collection:v20 addedItemIDs:v12 toThreadWithItemID:v13 after:v14 unreadItemIDs:v21];
    }
  }

  return v16 & 1;
}

- (void)_collection:(id)a3 addedItemIDs:(id)a4 toThreadWithItemID:(id)a5 before:(BOOL)a6 existingItemID:(id)a7 notifyObserverBlock:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v30 = a5;
  id v16 = a7;
  id v17 = a8;
  unint64_t v18 = [(EMSectionedMessageList *)self _sectionIndexForCollection:v14];
  if (v18 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v28 = v16;
    id v29 = v15;
    BOOL v19 = [(EFOrderedDictionary *)self->_sections keyAtIndex:v18];
    uint64_t v20 = [(EMSectionedMessageList *)self _boxItemIDsForItemIDs:v15 inSection:v19];
    uint64_t v21 = [(EMSectionedMessageList *)self _boxItemIDForItemID:v30 inSection:v19];
    v27 = [(EMSectionedMessageList *)self _boxItemIDForItemID:v16 inSection:v19];
    uint64_t v22 = [(EMSectionedMessageList *)self observerScheduler];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __112__EMSectionedMessageList__collection_addedItemIDs_toThreadWithItemID_before_existingItemID_notifyObserverBlock___block_invoke;
    v31[3] = &unk_1E63E6550;
    v31[4] = self;
    id v36 = v17;
    id v23 = v20;
    id v32 = v23;
    id v24 = v21;
    id v33 = v24;
    id v25 = v27;
    id v34 = v25;
    id v26 = v19;
    id v35 = v26;
    BOOL v37 = a6;
    [v22 performBlock:v31];

    id v16 = v28;
    id v15 = v29;
  }
}

void __112__EMSectionedMessageList__collection_addedItemIDs_toThreadWithItemID_before_existingItemID_notifyObserverBlock___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v7 = *(void *)(a1 + 72);
        if (!v7
          || ((*(uint64_t (**)(uint64_t, void, void, void, void, void))(v7 + 16))(v7, *(void *)(*((void *)&v11 + 1) + 8 * i), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64)) & 1) == 0)
        {
          uint64_t v8 = *(void *)(a1 + 32);
          uint64_t v9 = *(void *)(a1 + 40);
          uint64_t v10 = *(void *)(a1 + 56);
          if (*(unsigned char *)(a1 + 80)) {
            [v6 collection:v8 addedItemIDs:v9 before:v10];
          }
          else {
            objc_msgSend(v6, "collection:addedItemIDs:after:", v8, v9, v10, (void)v11);
          }
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v3);
  }
}

- (void)collection:(id)a3 movedItemIDs:(id)a4 after:(id)a5
{
}

- (void)collection:(id)a3 movedItemIDs:(id)a4 before:(id)a5
{
}

- (void)_collection:(id)a3 movedItemIDs:(id)a4 before:(BOOL)a5 existingItemID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  unint64_t v13 = [(EMSectionedMessageList *)self _sectionIndexForCollection:v10];
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v14 = [(EFOrderedDictionary *)self->_sections keyAtIndex:v13];
    id v15 = [(EMSectionedMessageList *)self _boxItemIDsForItemIDs:v11 inSection:v14];
    uint64_t v16 = [(EMSectionedMessageList *)self _boxItemIDForItemID:v12 inSection:v14];
    id v17 = [(EMSectionedMessageList *)self observerScheduler];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __73__EMSectionedMessageList__collection_movedItemIDs_before_existingItemID___block_invoke;
    v20[3] = &unk_1E63E3CD8;
    v20[4] = self;
    BOOL v23 = a5;
    id v18 = v15;
    id v21 = v18;
    id v19 = v16;
    id v22 = v19;
    [v17 performBlock:v20];
  }
}

void __73__EMSectionedMessageList__collection_movedItemIDs_before_existingItemID___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        uint64_t v7 = *(void *)(a1 + 32);
        uint64_t v8 = *(void *)(a1 + 40);
        uint64_t v9 = *(void *)(a1 + 48);
        if (*(unsigned char *)(a1 + 56)) {
          [v6 collection:v7 movedItemIDs:v8 before:v9];
        }
        else {
          objc_msgSend(v6, "collection:movedItemIDs:after:", v7, v8, v9, (void)v10);
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);
  }
}

- (void)collection:(id)a3 changedItemIDs:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(EMSectionedMessageList *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EMSectionedMessageList collection:changedItemIDs:]", "EMSectionedMessageList.m", 487, "0");
}

- (void)collection:(id)a3 changedItemIDs:(id)a4 itemIDsWithCountChanges:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [(EMSectionedMessageList *)self _sectionIndexForCollection:v8];
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v12 = [(EFOrderedDictionary *)self->_sections keyAtIndex:v11];
    long long v13 = [(EMSectionedMessageList *)self _boxItemIDsForItemIDs:v9 inSection:v12];
    long long v14 = [(EMSectionedMessageList *)self _boxItemIDsForItemIDs:v10 inSection:v12];
    uint64_t v15 = [(EMSectionedMessageList *)self observerScheduler];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __76__EMSectionedMessageList_collection_changedItemIDs_itemIDsWithCountChanges___block_invoke;
    v18[3] = &unk_1E63E2848;
    v18[4] = self;
    id v16 = v13;
    id v19 = v16;
    id v17 = v14;
    id v20 = v17;
    [v15 performBlock:v18];
  }
}

void __76__EMSectionedMessageList_collection_changedItemIDs_itemIDsWithCountChanges___block_invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1[4] + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v10 + 1) + 8 * v5);
        char v7 = objc_opt_respondsToSelector();
        uint64_t v8 = a1[4];
        uint64_t v9 = a1[5];
        if (v7) {
          [v6 collection:v8 changedItemIDs:v9 itemIDsWithCountChanges:a1[6]];
        }
        else {
          objc_msgSend(v6, "collection:changedItemIDs:", v8, v9, (void)v10);
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);
  }
}

- (void)collection:(id)a3 deletedItemIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(EMSectionedMessageList *)self _sectionIndexForCollection:v6];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = [(EFOrderedDictionary *)self->_sections keyAtIndex:v8];
    long long v10 = [(EMSectionedMessageList *)self _boxItemIDsForItemIDs:v7 inSection:v9];
    long long v11 = [(EMSectionedMessageList *)self observerScheduler];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __52__EMSectionedMessageList_collection_deletedItemIDs___block_invoke;
    v13[3] = &unk_1E63E2760;
    void v13[4] = self;
    id v12 = v10;
    id v14 = v12;
    [v11 performBlock:v13];
  }
}

void __52__EMSectionedMessageList_collection_deletedItemIDs___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5++), "collection:deletedItemIDs:", *(void *)(a1 + 32), *(void *)(a1 + 40), (void)v6);
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)collection:(id)a3 replacedExistingItemID:(id)a4 withNewItemID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [(EMSectionedMessageList *)self _sectionIndexForCollection:v8];
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v12 = [(EFOrderedDictionary *)self->_sections keyAtIndex:v11];
    long long v13 = [(EMSectionedMessageList *)self _boxItemIDForItemID:v9 inSection:v12];
    id v14 = [(EMSectionedMessageList *)self _boxItemIDForItemID:v10 inSection:v12];
    uint64_t v15 = [(EMSectionedMessageList *)self observerScheduler];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __74__EMSectionedMessageList_collection_replacedExistingItemID_withNewItemID___block_invoke;
    v18[3] = &unk_1E63E2848;
    v18[4] = self;
    id v16 = v13;
    id v19 = v16;
    id v17 = v14;
    id v20 = v17;
    [v15 performBlock:v18];
  }
}

void __74__EMSectionedMessageList_collection_replacedExistingItemID_withNewItemID___block_invoke(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  id v2 = *(id *)(a1[4] + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5++), "collection:replacedExistingItemID:withNewItemID:", a1[4], a1[5], a1[6], (void)v6);
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)collection:(id)a3 didFinishInitialLoadForThreadWithItemID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(EMSectionedMessageList *)self _sectionIndexForCollection:v6];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v9 = [(EFOrderedDictionary *)self->_sections keyAtIndex:v8];
    id v10 = [(EMSectionedMessageList *)self _boxItemIDForItemID:v7 inSection:v9];
    uint64_t v11 = [(EMSectionedMessageList *)self observerScheduler];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __77__EMSectionedMessageList_collection_didFinishInitialLoadForThreadWithItemID___block_invoke;
    v13[3] = &unk_1E63E2760;
    void v13[4] = self;
    id v12 = v10;
    id v14 = v12;
    [v11 performBlock:v13];
  }
}

void __77__EMSectionedMessageList_collection_didFinishInitialLoadForThreadWithItemID___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v7 + 1) + 8 * v5);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v6, "collection:didFinishInitialLoadForThreadWithItemID:", *(void *)(a1 + 32), *(void *)(a1 + 40), (void)v7);
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (void)collection:(id)a3 oldestItemsUpdatedForMailboxes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(EMSectionedMessageList *)self _sectionIndexForCollection:v6];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v9 = [(EFOrderedDictionary *)self->_sections keyAtIndex:v8];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __68__EMSectionedMessageList_collection_oldestItemsUpdatedForMailboxes___block_invoke;
    v16[3] = &unk_1E63E6578;
    v16[4] = self;
    id v10 = v9;
    id v17 = v10;
    uint64_t v11 = objc_msgSend(v7, "ef_mapValues:", v16);
    uint64_t v12 = [(EMSectionedMessageList *)self observerScheduler];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __68__EMSectionedMessageList_collection_oldestItemsUpdatedForMailboxes___block_invoke_2;
    v14[3] = &unk_1E63E2760;
    v14[4] = self;
    id v13 = v11;
    id v15 = v13;
    [v12 performBlock:v14];
  }
}

id __68__EMSectionedMessageList_collection_oldestItemsUpdatedForMailboxes___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) _boxItemIDForItemID:a2 inSection:*(void *)(a1 + 40)];
  return v2;
}

void __68__EMSectionedMessageList_collection_oldestItemsUpdatedForMailboxes___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v7 + 1) + 8 * v5);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v6, "collection:oldestItemsUpdatedForMailboxes:", *(void *)(a1 + 32), *(void *)(a1 + 40), (void)v7);
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (void)collection:(id)a3 shouldHighlightSnippetHints:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(EMSectionedMessageList *)self _sectionIndexForCollection:v6] != 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v8 = [(EMSectionedMessageList *)self observerScheduler];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65__EMSectionedMessageList_collection_shouldHighlightSnippetHints___block_invoke;
    v9[3] = &unk_1E63E2760;
    void v9[4] = self;
    id v10 = v7;
    [v8 performBlock:v9];
  }
}

void __65__EMSectionedMessageList_collection_shouldHighlightSnippetHints___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v7 + 1) + 8 * v5);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v6, "collection:shouldHighlightSnippetHints:", *(void *)(a1 + 32), *(void *)(a1 + 40), (void)v7);
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (void)collectionDidFinishInitialLoad:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(EMSectionedMessageList *)self _sectionIndexForCollection:v4];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = [(EFOrderedDictionary *)self->_sections keyAtIndex:v5];
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x2020000000;
    char v18 = 0;
    sectionsAwaitingInitialLoad = self->_sectionsAwaitingInitialLoad;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __57__EMSectionedMessageList_collectionDidFinishInitialLoad___block_invoke;
    v14[3] = &unk_1E63E65A0;
    id v8 = v6;
    id v15 = v8;
    id v16 = v17;
    [(EFLocked *)sectionsAwaitingInitialLoad performWhileLocked:v14];
    long long v9 = [(EMSectionedMessageList *)self observerScheduler];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __57__EMSectionedMessageList_collectionDidFinishInitialLoad___block_invoke_2;
    v11[3] = &unk_1E63E65C8;
    v11[4] = self;
    id v10 = v8;
    id v12 = v10;
    id v13 = v17;
    [v9 performBlock:v11];

    _Block_object_dispose(v17, 8);
  }
}

void __57__EMSectionedMessageList_collectionDidFinishInitialLoad___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 removeObject:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 count] == 0;
}

void __57__EMSectionedMessageList_collectionDidFinishInitialLoad___block_invoke_2(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = *(id *)(a1[4] + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v7 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v6, "collection:didFinishInitialLoadOfSection:", a1[4], a1[5], (void)v7);
        }
        if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24) && (objc_opt_respondsToSelector() & 1) != 0) {
          [v6 collectionDidFinishInitialLoad:a1[4]];
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (void)didFinishRecoveryForCollection:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(EMSectionedMessageList *)self _sectionIndexForCollection:v4];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = [(EFOrderedDictionary *)self->_sections keyAtIndex:v5];
    long long v7 = [(EFOrderedDictionary *)self->_sections allValues];
    char v8 = objc_msgSend(v7, "ef_any:", &__block_literal_global_51);

    long long v9 = [(EMSectionedMessageList *)self observerScheduler];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __57__EMSectionedMessageList_didFinishRecoveryForCollection___block_invoke_2;
    v11[3] = &unk_1E63E65F0;
    v11[4] = self;
    id v10 = v6;
    id v12 = v10;
    char v13 = v8 ^ 1;
    [v9 performBlock:v11];
  }
}

uint64_t __57__EMSectionedMessageList_didFinishRecoveryForCollection___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isRecovering];
}

void __57__EMSectionedMessageList_didFinishRecoveryForCollection___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v7 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v6, "collection:didFinishRecoveryForSection:", *(void *)(a1 + 32), *(void *)(a1 + 40), (void)v7);
        }
        if (*(unsigned char *)(a1 + 48) && (objc_opt_respondsToSelector() & 1) != 0) {
          [v6 didFinishRecoveryForCollection:*(void *)(a1 + 32)];
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (void)didFinishRemoteSearchForCollection:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(EMSectionedMessageList *)self _sectionIndexForCollection:v4];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = [(EFOrderedDictionary *)self->_sections keyAtIndex:v5];
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x2020000000;
    char v18 = 0;
    sectionsAwaitingRemoteSearch = self->_sectionsAwaitingRemoteSearch;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __61__EMSectionedMessageList_didFinishRemoteSearchForCollection___block_invoke;
    v14[3] = &unk_1E63E65A0;
    id v8 = v6;
    id v15 = v8;
    id v16 = v17;
    [(EFLocked *)sectionsAwaitingRemoteSearch performWhileLocked:v14];
    long long v9 = [(EMSectionedMessageList *)self observerScheduler];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __61__EMSectionedMessageList_didFinishRemoteSearchForCollection___block_invoke_2;
    v11[3] = &unk_1E63E65C8;
    v11[4] = self;
    id v10 = v8;
    id v12 = v10;
    char v13 = v17;
    [v9 performBlock:v11];

    _Block_object_dispose(v17, 8);
  }
}

void __61__EMSectionedMessageList_didFinishRemoteSearchForCollection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 removeObject:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 count] == 0;
}

void __61__EMSectionedMessageList_didFinishRemoteSearchForCollection___block_invoke_2(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = *(id *)(a1[4] + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v7 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v6, "collection:didFinishRemoteSearchForSection:", a1[4], a1[5], (void)v7);
        }
        if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24) && (objc_opt_respondsToSelector() & 1) != 0) {
          [v6 didFinishRemoteSearchForCollection:a1[4]];
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (void)setUnfilteredMessageList:(id)a3
{
}

- (EFScheduler)observerScheduler
{
  return self->_observerScheduler;
}

- (NSPredicate)filterPredicate
{
  return self->_filterPredicate;
}

- (void)setFilterPredicate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterPredicate, 0);
  objc_storeStrong((id *)&self->_observerScheduler, 0);
  objc_storeStrong((id *)&self->_unfilteredMessageList, 0);
  objc_storeStrong((id *)&self->_changeObservers, 0);
  objc_storeStrong((id *)&self->_sectionsAwaitingRemoteSearch, 0);
  objc_storeStrong((id *)&self->_sectionsAwaitingInitialLoad, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end