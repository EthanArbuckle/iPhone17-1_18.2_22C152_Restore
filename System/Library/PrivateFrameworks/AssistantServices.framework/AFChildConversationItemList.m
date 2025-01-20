@interface AFChildConversationItemList
- (AFChildConversationItemList)init;
- (AFChildConversationItemList)initWithConversation:(id)a3 parentItemIdentifier:(id)a4;
- (AFConversation)_conversation;
- (BOOL)itemIsRestoredAtIndex:(int64_t)a3;
- (NSUUID)_parentItemIdentifier;
- (id)_identifierOfItemAtIndex:(int64_t)a3;
- (id)_indexPathForItemAtIndex:(int64_t)a3;
- (id)_indexPathForLastRestoredItem;
- (id)identifiersForItemsAtIndexes:(id)a3;
- (id)itemAtIndex:(int64_t)a3;
- (id)itemWithIdentifier:(id)a3;
- (int64_t)numberOfItems;
- (void)_addItemsForAceObjects:(id)a3 type:(int64_t)a4 dialogPhase:(id)a5 asChildrenOfItemWithIdentifier:(id)a6;
- (void)addItemsForAceObjects:(id)a3 type:(int64_t)a4 dialogPhase:(id)a5;
- (void)addItemsForAceObjects:(id)a3 type:(int64_t)a4 dialogPhase:(id)a5 asChildrenOfItemAtIndex:(int64_t)a6;
- (void)removeItemsAtIndexes:(id)a3;
- (void)removeItemsWithIdentifiers:(id)a3;
@end

@implementation AFChildConversationItemList

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentItemIdentifier, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
}

- (NSUUID)_parentItemIdentifier
{
  return self->_parentItemIdentifier;
}

- (AFConversation)_conversation
{
  return self->_conversation;
}

- (void)_addItemsForAceObjects:(id)a3 type:(int64_t)a4 dialogPhase:(id)a5 asChildrenOfItemWithIdentifier:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [(AFChildConversationItemList *)self _conversation];
  [v13 addItemsForAceObjects:v12 type:a4 dialogPhase:v11 asChildrenOfItemWithIdentifier:v10];
}

- (id)_indexPathForLastRestoredItem
{
  v2 = [(AFChildConversationItemList *)self _conversation];
  v3 = [v2 lastRestoredItem];
  v4 = v3;
  if (v3
    && ([v3 identifier],
        v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v2 hasItemWithIdentifier:v5],
        v5,
        v6))
  {
    v7 = [v4 identifier];
    v8 = [v2 indexPathForItemWithIdentifier:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_indexPathForItemAtIndex:(int64_t)a3
{
  v5 = [(AFChildConversationItemList *)self _conversation];
  int v6 = [(AFChildConversationItemList *)self _parentItemIdentifier];
  v7 = [v5 indexPathForItemWithIdentifier:v6];
  v8 = [v7 indexPathByAddingIndex:a3];

  return v8;
}

- (id)_identifierOfItemAtIndex:(int64_t)a3
{
  v3 = [(AFChildConversationItemList *)self itemAtIndex:a3];
  v4 = [v3 identifier];

  return v4;
}

- (BOOL)itemIsRestoredAtIndex:(int64_t)a3
{
  v5 = [(AFChildConversationItemList *)self _indexPathForLastRestoredItem];
  if (v5)
  {
    int v6 = [(AFChildConversationItemList *)self _indexPathForItemAtIndex:a3];
    BOOL v7 = [v6 compare:v5] != 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)removeItemsWithIdentifiers:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA80];
  id v5 = a3;
  int v6 = objc_msgSend(v4, "setWithCapacity:", objc_msgSend(v5, "count"));
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __58__AFChildConversationItemList_removeItemsWithIdentifiers___block_invoke;
  id v12 = &unk_1E592C188;
  id v13 = self;
  id v14 = v6;
  id v7 = v6;
  [v5 enumerateObjectsUsingBlock:&v9];

  v8 = [(AFChildConversationItemList *)self _conversation];
  [v8 removeItemsWithIdentifiers:v7];
}

void __58__AFChildConversationItemList_removeItemsWithIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [*(id *)(a1 + 32) _conversation];
  int v4 = [v3 hasItemWithIdentifier:v5];

  if (v4) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

- (void)removeItemsAtIndexes:(id)a3
{
  int v4 = (void *)MEMORY[0x1E4F1CA80];
  id v5 = a3;
  int v6 = objc_msgSend(v4, "setWithCapacity:", objc_msgSend(v5, "count"));
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __52__AFChildConversationItemList_removeItemsAtIndexes___block_invoke;
  id v12 = &unk_1E592C160;
  id v13 = v6;
  id v14 = self;
  id v7 = v6;
  [v5 enumerateIndexesUsingBlock:&v9];

  v8 = [(AFChildConversationItemList *)self _conversation];
  [v8 removeItemsWithIdentifiers:v7];
}

void __52__AFChildConversationItemList_removeItemsAtIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) _identifierOfItemAtIndex:a2];
  [v2 addObject:v3];
}

- (id)identifiersForItemsAtIndexes:(id)a3
{
  int v4 = (void *)MEMORY[0x1E4F1CA80];
  id v5 = a3;
  int v6 = objc_msgSend(v4, "setWithCapacity:", objc_msgSend(v5, "count"));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__AFChildConversationItemList_identifiersForItemsAtIndexes___block_invoke;
  v10[3] = &unk_1E592C160;
  id v7 = v6;
  id v11 = v7;
  id v12 = self;
  [v5 enumerateIndexesUsingBlock:v10];

  id v8 = v7;
  return v8;
}

void __60__AFChildConversationItemList_identifiersForItemsAtIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) _identifierOfItemAtIndex:a2];
  [v2 addObject:v3];
}

- (void)addItemsForAceObjects:(id)a3 type:(int64_t)a4 dialogPhase:(id)a5 asChildrenOfItemAtIndex:(int64_t)a6
{
  id v10 = a5;
  id v11 = a3;
  id v12 = [(AFChildConversationItemList *)self _identifierOfItemAtIndex:a6];
  [(AFChildConversationItemList *)self _addItemsForAceObjects:v11 type:a4 dialogPhase:v10 asChildrenOfItemWithIdentifier:v12];
}

- (void)addItemsForAceObjects:(id)a3 type:(int64_t)a4 dialogPhase:(id)a5
{
}

- (id)itemWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(AFChildConversationItemList *)self _conversation];
  int v6 = [v5 itemWithIdentifier:v4];

  id v7 = [v6 identifier];
  id v8 = [v5 parentOfItemWithIdentifier:v7];

  uint64_t v9 = [v8 identifier];
  uint64_t v10 = [(AFChildConversationItemList *)self _parentItemIdentifier];
  if (v9 == (void *)v10)
  {
  }
  else
  {
    id v11 = (void *)v10;
    id v12 = [v8 identifier];
    id v13 = [(AFChildConversationItemList *)self _parentItemIdentifier];
    char v14 = [v12 isEqual:v13];

    if (v14) {
      goto LABEL_6;
    }
    uint64_t v9 = v6;
    int v6 = 0;
  }

LABEL_6:
  return v6;
}

- (id)itemAtIndex:(int64_t)a3
{
  id v5 = [(AFChildConversationItemList *)self _conversation];
  int v6 = [(AFChildConversationItemList *)self _indexPathForItemAtIndex:a3];
  id v7 = [v5 itemAtIndexPath:v6];

  return v7;
}

- (int64_t)numberOfItems
{
  id v3 = [(AFChildConversationItemList *)self _conversation];
  id v4 = [(AFChildConversationItemList *)self _parentItemIdentifier];
  int64_t v5 = [v3 numberOfChildrenForItemWithIdentifier:v4];

  return v5;
}

- (AFChildConversationItemList)init
{
  return [(AFChildConversationItemList *)self initWithConversation:0 parentItemIdentifier:0];
}

- (AFChildConversationItemList)initWithConversation:(id)a3 parentItemIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AFChildConversationItemList;
  uint64_t v9 = [(AFChildConversationItemList *)&v14 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_conversation, a3);
    uint64_t v11 = [v8 copy];
    parentItemIdentifier = v10->_parentItemIdentifier;
    v10->_parentItemIdentifier = (NSUUID *)v11;
  }
  return v10;
}

@end