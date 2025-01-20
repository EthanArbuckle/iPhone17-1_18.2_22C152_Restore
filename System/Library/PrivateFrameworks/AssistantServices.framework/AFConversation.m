@interface AFConversation
- (AFConversation)initWithIdentifier:(id)a3 languageCode:(id)a4;
- (AFConversation)initWithIdentifier:(id)a3 languageCode:(id)a4 rootNode:(id)a5;
- (AFConversation)initWithLanguageCode:(id)a3;
- (AFConversation)initWithPropertyListRepresentation:(id)a3;
- (AFConversationDelegate)delegate;
- (AFConversationStorable)lastRestoredItem;
- (AFTreeNode)_rootNode;
- (BOOL)_nodeContainsProvisionalItems:(id)a3;
- (BOOL)containsItemForAceViewWithIdentifier:(id)a3;
- (BOOL)containsItemWithIdentifier:(id)a3;
- (BOOL)hasItemWithIdentifier:(id)a3;
- (BOOL)isSynchronizedWithServer;
- (BOOL)itemAtIndexPathIsVirgin:(id)a3;
- (NSString)languageCode;
- (NSUUID)identifier;
- (id)_changePresentationStateForNodes:(id)a3;
- (id)_childOfNode:(id)a3 withItemWhichCanBeUpdatedWithAceObject:(id)a4 inDialogPhase:(id)a5;
- (id)_indexPathForItemWithIdentifier:(id)a3 ignoreNonExistent:(BOOL)a4;
- (id)_indexPathsForAddingItemsWithCount:(int64_t)a3 asChildrenOfItemWithIdentifier:(id)a4;
- (id)_itemAtIndexPath:(id)a3;
- (id)_nodeAtIndexPath:(id)a3;
- (id)aceCommandIdentifierForItemAtIndexPath:(id)a3;
- (id)aceObjectForItemAtIndexPath:(id)a3;
- (id)additionalSpeechInterpretationsForRefId:(id)a3;
- (id)dialogPhaseForItemAtIndexPath:(id)a3;
- (id)identifierOfItemAtIndexPath:(id)a3;
- (id)indexPathForItemWithIdentifier:(id)a3;
- (id)itemAtIndexPath:(id)a3;
- (id)itemWithIdentifier:(id)a3;
- (id)lastItem;
- (id)parentOfItemWithIdentifier:(id)a3;
- (id)propertyListRepresentation;
- (id)updatedUserUtteranceForRefId:(id)a3;
- (int64_t)numberOfChildrenForItemAtIndexPath:(id)a3;
- (int64_t)numberOfChildrenForItemWithIdentifier:(id)a3;
- (int64_t)presentationStateForItemAtIndexPath:(id)a3;
- (int64_t)typeForItemAtIndexPath:(id)a3;
- (void)_addItemsForAceObjects:(id)a3 type:(int64_t)a4 aceCommandIdentifier:(id)a5 dialogPhase:(id)a6 asChildrenOfItemWithIdentifier:(id)a7;
- (void)_addItemsForAceViews:(id)a3 withDialogPhase:(id)a4 fromCommandWithIdentifier:(id)a5 asChildrenOfItemWithIdentifier:(id)a6;
- (void)_addItemsForAceViews:(id)a3 withDialogPhase:(id)a4 fromCommandWithIdentifier:(id)a5 asChildrenOfItemWithIdentifier:(id)a6 isSupplemental:(BOOL)a7 isImmersiveExperience:(BOOL)a8 isPersistentAcrossInvocations:(BOOL)a9;
- (void)_addItemsForAceViews:(id)a3 withDialogPhase:(id)a4 fromCommandWithIdentifier:(id)a5 atIndexPaths:(id)a6;
- (void)_addItemsForAceViews:(id)a3 withDialogPhase:(id)a4 fromCommandWithIdentifier:(id)a5 atIndexPaths:(id)a6 isSupplemental:(BOOL)a7 isImmersiveExperience:(BOOL)a8 isPersistentAcrossInvocations:(BOOL)a9;
- (void)_enumerateItemsUsingBlock:(id)a3;
- (void)_processInsertions:(id)a3 inDialogPhase:(id)a4;
- (void)_removeNodes:(id)a3;
- (void)_setLastRestoredItem:(id)a3;
- (void)_setRootNode:(id)a3;
- (void)addAdditionalSpeechInterpretation:(id)a3 refId:(id)a4;
- (void)addItemForMusicStartSessionCommand:(id)a3;
- (void)addItemForPartialResultCommand:(id)a3;
- (void)addItemForSpeechRecognizedCommand:(id)a3;
- (void)addItemsForAceObjects:(id)a3 type:(int64_t)a4 dialogPhase:(id)a5 asChildrenOfItemWithIdentifier:(id)a6;
- (void)addItemsForAceViews:(id)a3 withDialogPhase:(id)a4 asChildrenOfItemWithIdentifier:(id)a5;
- (void)addItemsForAddViewsCommand:(id)a3;
- (void)addItemsForShowHelpCommand:(id)a3;
- (void)addRecognitionUpdateWithPhrases:(id)a3 utterances:(id)a4 refId:(id)a5;
- (void)addSelectionResponse:(id)a3;
- (void)cancelItemWithIdentifier:(id)a3;
- (void)insertItemsForAceViews:(id)a3 withDialogPhase:(id)a4 atIndexPaths:(id)a5;
- (void)notifyDelegateOfUpdates:(id)a3 inserts:(id)a4 presentationChanges:(id)a5;
- (void)removeItemsAtIndexPaths:(id)a3;
- (void)removeItemsFollowingItemAtIndexPath:(id)a3;
- (void)removeItemsWithIdentifiers:(id)a3;
- (void)removeTransientItems;
- (void)setDelegate:(id)a3;
- (void)setSynchronizedWithServer:(BOOL)a3;
- (void)updateWithUpdateViewsCommand:(id)a3;
@end

@implementation AFConversation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRestoredItem, 0);
  objc_storeStrong((id *)&self->_rootNode, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_updatedUserUtteranceForRefId, 0);
  objc_storeStrong((id *)&self->_additionalInterpretationsForRefId, 0);
}

- (void)_setLastRestoredItem:(id)a3
{
}

- (AFConversationStorable)lastRestoredItem
{
  return self->_lastRestoredItem;
}

- (void)_setRootNode:(id)a3
{
}

- (AFTreeNode)_rootNode
{
  return self->_rootNode;
}

- (void)setDelegate:(id)a3
{
}

- (AFConversationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AFConversationDelegate *)WeakRetained;
}

- (void)setSynchronizedWithServer:(BOOL)a3
{
  self->_synchronizedWithServer = a3;
}

- (BOOL)isSynchronizedWithServer
{
  return self->_synchronizedWithServer;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)notifyDelegateOfUpdates:(id)a3 inserts:(id)a4 presentationChanges:(id)a5
{
  id v23 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v23 count])
  {
    v10 = [(AFConversation *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      v12 = [(AFConversation *)self delegate];
      [v12 conversation:self didUpdateItemsAtIndexPaths:v23];
    }
  }
  if ([v8 count])
  {
    v13 = [(AFConversation *)self delegate];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      v15 = [(AFConversation *)self delegate];
      [v15 conversation:self didInsertItemsAtIndexPaths:v8];
    }
  }
  if ([v9 count])
  {
    v16 = [(AFConversation *)self delegate];
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      v18 = [(AFConversation *)self delegate];
      [v18 conversation:self presentationStateDidChangeForItemsAtIndexPaths:v9];
    }
  }
  if ([v23 count] || objc_msgSend(v8, "count") || objc_msgSend(v9, "count"))
  {
    v19 = [[AFConversationTransaction alloc] initWithUpdatedItemIndexPaths:v23 insertedItemIndexPaths:v8 presentationStateChangedItemIndexPaths:v9];
    v20 = [(AFConversation *)self delegate];
    char v21 = objc_opt_respondsToSelector();

    if (v21)
    {
      v22 = [(AFConversation *)self delegate];
      [v22 conversation:self didChangeWithTransaction:v19];
    }
  }
}

- (AFConversation)initWithPropertyListRepresentation:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_alloc_init(AFDictionarySchema);
  v6 = +[AFCoercion stringToUUIDCoercion];
  [(AFDictionarySchema *)v5 setObjectCoercion:v6 forKey:@"Identifier"];

  v7 = +[AFCoercion typeAssertionWithClass:objc_opt_class()];
  [(AFDictionarySchema *)v5 setObjectCoercion:v7 forKey:@"Version"];

  id v8 = +[AFCoercion typeAssertionWithClass:objc_opt_class()];
  [(AFDictionarySchema *)v5 setObjectCoercion:v8 forKey:@"LanguageCode"];

  id v9 = +[AFCoercion typeAssertionWithClass:objc_opt_class()];
  [(AFDictionarySchema *)v5 setObjectCoercion:v9 forKey:@"SynchronizedWithServer"];

  v10 = [[AFCoercion alloc] initWithBlock:&__block_literal_global_64];
  [(AFDictionarySchema *)v5 setObjectCoercion:v10 forKey:@"RootNode"];

  id v29 = 0;
  char v11 = [(AFDictionarySchema *)v5 coerceObject:v4 error:&v29];
  id v12 = v29;
  if (!v11)
  {
    v24 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v25 = v24;
      v26 = [v12 localizedFailureReason];
      *(_DWORD *)buf = 136315650;
      v31 = "-[AFConversation initWithPropertyListRepresentation:]";
      __int16 v32 = 2112;
      uint64_t v33 = (uint64_t)v26;
      __int16 v34 = 2114;
      id v35 = v4;
      _os_log_error_impl(&dword_19CF1D000, v25, OS_LOG_TYPE_ERROR, "%s passed invalid property list (%@): %{public}@", buf, 0x20u);
    }
    goto LABEL_10;
  }
  v13 = [v11 objectForKey:@"Version"];
  uint64_t v14 = [v13 integerValue];

  if (v14 != 1)
  {
    v27 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "-[AFConversation initWithPropertyListRepresentation:]";
      __int16 v32 = 2050;
      uint64_t v33 = v14;
      _os_log_error_impl(&dword_19CF1D000, v27, OS_LOG_TYPE_ERROR, "%s Unable to create conversation from property list with version %{public}ld", buf, 0x16u);
    }
LABEL_10:
    id v23 = 0;
    goto LABEL_11;
  }
  v15 = [v11 objectForKey:@"Identifier"];
  v16 = [v11 objectForKey:@"LanguageCode"];
  char v17 = [v11 objectForKey:@"SynchronizedWithServer"];
  uint64_t v18 = [v17 BOOLValue];

  v19 = [v11 objectForKey:@"RootNode"];
  self = [(AFConversation *)self initWithIdentifier:v15 languageCode:v16 rootNode:v19];
  [(AFConversation *)self setSynchronizedWithServer:v18];
  v20 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    char v21 = v20;
    v22 = [(AFConversation *)self _rootNode];
    *(_DWORD *)buf = 136315394;
    v31 = "-[AFConversation initWithPropertyListRepresentation:]";
    __int16 v32 = 2112;
    uint64_t v33 = (uint64_t)v22;
    _os_log_impl(&dword_19CF1D000, v21, OS_LOG_TYPE_INFO, "%s rootNode=%@", buf, 0x16u);
  }
  id v23 = self;
LABEL_11:

  return v23;
}

id __53__AFConversation_initWithPropertyListRepresentation___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  v5 = objc_alloc_init(AFTreeNodePropertyListSerialization);
  v6 = [(AFTreeNodePropertyListSerialization *)v5 treeNodeWithPropertyList:v4 error:a3 itemCreation:&__block_literal_global_66];

  return v6;
}

AFMutableConversationItem *__53__AFConversation_initWithPropertyListRepresentation___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[AFMutableConversationItem alloc] initWithPropertyListRepresentation:v2];

  return v3;
}

- (id)propertyListRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:&unk_1EEE96DD0 forKey:@"Version"];
  id v4 = [(AFConversation *)self identifier];
  v5 = [v4 UUIDString];
  [v3 setObject:v5 forKey:@"Identifier"];

  v6 = [(AFConversation *)self languageCode];
  [v3 setObject:v6 forKey:@"LanguageCode"];

  v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AFConversation isSynchronizedWithServer](self, "isSynchronizedWithServer"));
  [v3 setObject:v7 forKey:@"SynchronizedWithServer"];

  id v8 = objc_alloc_init(AFTreeNodePropertyListSerialization);
  id v9 = [(AFConversation *)self _rootNode];
  v10 = [(AFTreeNodePropertyListSerialization *)v8 propertyListWithTreeNode:v9 itemPropertyListCreation:&__block_literal_global_58];

  [v3 setObject:v10 forKey:@"RootNode"];
  return v3;
}

uint64_t __44__AFConversation_propertyListRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 propertyListRepresentation];
}

- (id)_changePresentationStateForNodes:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  if ([v3 count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          char v11 = objc_msgSend(v10, "parentNode", (void)v14);

          if (v11)
          {
            id v12 = [v10 absoluteIndexPath];
            [v4 addObject:v12];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
  return v4;
}

- (BOOL)_nodeContainsProvisionalItems:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__AFConversation__nodeContainsProvisionalItems___block_invoke;
  v6[3] = &unk_1E5926CB8;
  v6[4] = &v7;
  [v3 enumerateChildNodesWithOptions:2 usingBlock:v6];
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __48__AFConversation__nodeContainsProvisionalItems___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 item];
  if ([v6 presentationState] == 2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (BOOL)containsItemForAceViewWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__AFConversation_containsItemForAceViewWithIdentifier___block_invoke;
  v7[3] = &unk_1E5926C90;
  id v5 = v4;
  id v8 = v5;
  uint64_t v9 = &v10;
  [(AFConversation *)self _enumerateItemsUsingBlock:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __55__AFConversation_containsItemForAceViewWithIdentifier___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v10 = a2;
  BOOL v5 = [v10 type] == 3;
  id v6 = v10;
  if (v5)
  {
    uint64_t v7 = [v10 aceObject];
    id v8 = [v7 viewId];
    int v9 = [v8 isEqualToString:*(void *)(a1 + 32)];

    if (v9)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *a3 = 1;
    }

    id v6 = v10;
  }
}

- (void)_enumerateItemsUsingBlock:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AFConversation *)self _rootNode];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__AFConversation__enumerateItemsUsingBlock___block_invoke;
  v7[3] = &unk_1E5926C68;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateDescendentNodesUsingBlock:v7];
}

void __44__AFConversation__enumerateItemsUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [a2 item];
  (*(void (**)(uint64_t, id, uint64_t))(v4 + 16))(v4, v5, a3);
}

- (BOOL)itemAtIndexPathIsVirgin:(id)a3
{
  id v3 = [(AFConversation *)self _itemAtIndexPath:a3];
  char v4 = [v3 isVirgin];

  return v4;
}

- (id)aceCommandIdentifierForItemAtIndexPath:(id)a3
{
  id v3 = [(AFConversation *)self _itemAtIndexPath:a3];
  char v4 = [v3 aceCommandIdentifier];

  return v4;
}

- (int64_t)numberOfChildrenForItemAtIndexPath:(id)a3
{
  id v3 = [(AFConversation *)self _nodeAtIndexPath:a3];
  int64_t v4 = [v3 numberOfChildNodes];

  return v4;
}

- (int64_t)numberOfChildrenForItemWithIdentifier:(id)a3
{
  int64_t v4 = [(AFConversation *)self indexPathForItemWithIdentifier:a3];
  int64_t v5 = [(AFConversation *)self numberOfChildrenForItemAtIndexPath:v4];

  return v5;
}

- (int64_t)presentationStateForItemAtIndexPath:(id)a3
{
  id v3 = [(AFConversation *)self _itemAtIndexPath:a3];
  int64_t v4 = [v3 presentationState];

  return v4;
}

- (id)aceObjectForItemAtIndexPath:(id)a3
{
  id v3 = [(AFConversation *)self _itemAtIndexPath:a3];
  int64_t v4 = [v3 aceObject];

  return v4;
}

- (id)dialogPhaseForItemAtIndexPath:(id)a3
{
  id v3 = [(AFConversation *)self _itemAtIndexPath:a3];
  int64_t v4 = [v3 dialogPhase];

  return v4;
}

- (int64_t)typeForItemAtIndexPath:(id)a3
{
  id v3 = [(AFConversation *)self _itemAtIndexPath:a3];
  int64_t v4 = [v3 type];

  return v4;
}

- (id)lastItem
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28D58]);
  uint64_t v4 = [(AFConversation *)self numberOfChildrenForItemAtIndexPath:v3];

  if (v4 < 1)
  {
    id v6 = 0;
  }
  else
  {
    int64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F28D58]) initWithIndex:v4 - 1];
    id v6 = [(AFConversation *)self _itemAtIndexPath:v5];
  }
  return v6;
}

- (id)itemAtIndexPath:(id)a3
{
  id v3 = [(AFConversation *)self _itemAtIndexPath:a3];
  uint64_t v4 = (void *)[v3 copy];

  return v4;
}

- (id)parentOfItemWithIdentifier:(id)a3
{
  uint64_t v4 = [(AFConversation *)self indexPathForItemWithIdentifier:a3];
  int64_t v5 = [v4 indexPathByRemovingLastIndex];
  id v6 = [(AFConversation *)self _itemAtIndexPath:v5];

  return v6;
}

- (id)itemWithIdentifier:(id)a3
{
  uint64_t v4 = [(AFConversation *)self indexPathForItemWithIdentifier:a3];
  int64_t v5 = [(AFConversation *)self itemAtIndexPath:v4];

  return v5;
}

- (BOOL)hasItemWithIdentifier:(id)a3
{
  id v3 = [(AFConversation *)self _indexPathForItemWithIdentifier:a3 ignoreNonExistent:1];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)_indexPathForItemWithIdentifier:(id)a3 ignoreNonExistent:(BOOL)a4
{
  id v7 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  char v21 = __Block_byref_object_copy__12048;
  v22 = __Block_byref_object_dispose__12049;
  id v23 = 0;
  if (v7)
  {
    id v8 = [(AFConversation *)self _rootNode];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __68__AFConversation__indexPathForItemWithIdentifier_ignoreNonExistent___block_invoke;
    v15[3] = &unk_1E5926C40;
    id v16 = v7;
    long long v17 = &v18;
    [v8 enumerateDescendentNodesUsingBlock:v15];

    int v9 = v16;
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F28D58]);
    int v9 = (void *)v19[5];
    v19[5] = (uint64_t)v10;
  }

  char v11 = v19;
  if (!a4 && !v19[5])
  {
    long long v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"AFConversation.m" lineNumber:726 description:@"Cannot return an index path to an item that is not contained in the conversation"];

    char v11 = v19;
  }
  id v12 = (id)v11[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

void __68__AFConversation__indexPathForItemWithIdentifier_ignoreNonExistent___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v11 = a2;
  int64_t v5 = [v11 item];
  id v6 = *(void **)(a1 + 32);
  id v7 = [v5 identifier];
  LODWORD(v6) = [v6 isEqual:v7];

  if (v6)
  {
    uint64_t v8 = [v11 absoluteIndexPath];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    *a3 = 1;
  }
}

- (id)indexPathForItemWithIdentifier:(id)a3
{
  return [(AFConversation *)self _indexPathForItemWithIdentifier:a3 ignoreNonExistent:0];
}

- (id)identifierOfItemAtIndexPath:(id)a3
{
  id v3 = [(AFConversation *)self _itemAtIndexPath:a3];
  BOOL v4 = [v3 identifier];

  return v4;
}

- (BOOL)containsItemWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  int64_t v5 = [(AFConversation *)self _rootNode];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__AFConversation_containsItemWithIdentifier___block_invoke;
  v8[3] = &unk_1E5926C40;
  id v6 = v4;
  id v9 = v6;
  id v10 = &v11;
  [v5 enumerateDescendentNodesUsingBlock:v8];

  LOBYTE(v5) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

void __45__AFConversation_containsItemWithIdentifier___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v7 = [a2 item];
  int64_t v5 = [v7 identifier];
  int v6 = [v5 isEqual:*(void *)(a1 + 32)];

  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (void)cancelItemWithIdentifier:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(AFConversation *)self _indexPathForItemWithIdentifier:a3 ignoreNonExistent:0];
  int64_t v5 = [(AFConversation *)self _itemAtIndexPath:v4];
  if ([v5 presentationState] != 3)
  {
    [v5 setPresentationState:3];
    v7[0] = v4;
    int v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    [(AFConversation *)self notifyDelegateOfUpdates:0 inserts:0 presentationChanges:v6];
  }
}

- (void)removeTransientItems
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(AFConversation *)self _rootNode];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__AFConversation_removeTransientItems__block_invoke;
  v6[3] = &unk_1E5926C18;
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateDescendentNodesUsingBlock:v6];

  [(AFConversation *)self _removeNodes:v5];
}

void __38__AFConversation_removeTransientItems__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [v4 item];
  if ([v3 isTransient]) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

- (void)removeItemsFollowingItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v6 = objc_msgSend(v4, "indexAtPosition:", objc_msgSend(v4, "length") - 1);
    id v7 = [v4 indexPathByRemovingLastIndex];
    uint64_t v8 = [(AFConversation *)self _nodeAtIndexPath:v7];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __54__AFConversation_removeItemsFollowingItemAtIndexPath___block_invoke;
    uint64_t v13 = &unk_1E5926BF0;
    id v14 = v5;
    uint64_t v15 = v6;
    id v9 = v5;
    [v8 enumerateChildNodesWithOptions:2 usingBlock:&v10];
    -[AFConversation _removeNodes:](self, "_removeNodes:", v9, v10, v11, v12, v13);
  }
}

uint64_t __54__AFConversation_removeItemsFollowingItemAtIndexPath___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (*(void *)(result + 40) < a3) {
    return [*(id *)(result + 32) addObject:a2];
  }
  *a4 = 1;
  return result;
}

- (void)removeItemsAtIndexPaths:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[AFConversation _nodeAtIndexPath:](self, "_nodeAtIndexPath:", *(void *)(*((void *)&v12 + 1) + 8 * v10), (void)v12);
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [(AFConversation *)self _removeNodes:v5];
}

- (void)removeItemsWithIdentifiers:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[AFConversation indexPathForItemWithIdentifier:](self, "indexPathForItemWithIdentifier:", *(void *)(*((void *)&v12 + 1) + 8 * v10), (void)v12);
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [(AFConversation *)self removeItemsAtIndexPaths:v5];
}

- (void)updateWithUpdateViewsCommand:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v12 = v4;
  id obj = [v4 views];
  uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * v9);
        uint64_t v11 = [(AFConversation *)self _rootNode];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __47__AFConversation_updateWithUpdateViewsCommand___block_invoke;
        v14[3] = &unk_1E5926BC8;
        v14[4] = v10;
        id v15 = v5;
        [v11 enumerateDescendentNodesUsingBlock:v14];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  [(AFConversation *)self notifyDelegateOfUpdates:v5 inserts:0 presentationChanges:0];
}

void __47__AFConversation_updateWithUpdateViewsCommand___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = [v10 item];
  if ([v3 type] == 3)
  {
    id v4 = [v3 aceObject];
    id v5 = [v4 viewId];
    uint64_t v6 = [*(id *)(a1 + 32) viewId];
    int v7 = [v5 isEqualToString:v6];

    if (v7)
    {
      [v3 setAceObject:*(void *)(a1 + 32)];
      uint64_t v8 = *(void **)(a1 + 40);
      uint64_t v9 = [v10 absoluteIndexPath];
      [v8 addObject:v9];
    }
  }
}

- (void)addSelectionResponse:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  uint64_t v6 = [v4 arrayWithObjects:&v8 count:1];
  int v7 = +[AFDialogPhase userRequestDialogPhase];

  [(AFConversation *)self addItemsForAceViews:v6 withDialogPhase:v7 asChildrenOfItemWithIdentifier:0];
}

- (void)addItemForMusicStartSessionCommand:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  uint64_t v6 = [v4 arrayWithObjects:&v9 count:1];
  int v7 = objc_msgSend(v5, "aceId", v9, v10);
  id v8 = +[AFDialogPhase reflectionDialogPhase];

  [(AFConversation *)self _addItemsForAceObjects:v6 type:5 aceCommandIdentifier:v7 dialogPhase:v8 asChildrenOfItemWithIdentifier:0];
}

- (void)addItemsForShowHelpCommand:(id)a3
{
  id v20 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [(AFConversation *)self _indexPathsForAddingItemsWithCount:2 asChildrenOfItemWithIdentifier:0];
  uint64_t v6 = (void *)[v5 mutableCopy];

  int v7 = [v20 text];
  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F96AD0]);
    [v8 setText:v7];
    id v9 = [v20 speakableText];
    [v8 setSpeakableText:v9];

    uint64_t v10 = [v6 firstObject];
    [v6 removeObjectAtIndex:0];
    uint64_t v11 = [AFConversationInsertion alloc];
    long long v12 = [v20 aceId];
    LOBYTE(v19) = 0;
    long long v13 = [(AFConversationInsertion *)v11 initWithConversationItemType:3 aceObject:v8 aceCommandIdentifier:v12 transient:0 supplemental:0 immersiveExperience:0 persistentAcrossInvocations:v19 indexPath:v10];
    [v4 addObject:v13];
  }
  long long v14 = [AFConversationInsertion alloc];
  id v15 = [v20 aceId];
  long long v16 = [v6 firstObject];
  LOBYTE(v19) = 0;
  long long v17 = [(AFConversationInsertion *)v14 initWithConversationItemType:4 aceObject:v20 aceCommandIdentifier:v15 transient:0 supplemental:0 immersiveExperience:0 persistentAcrossInvocations:v19 indexPath:v16];
  [v4 addObject:v17];

  long long v18 = +[AFDialogPhase completionDialogPhase];
  [(AFConversation *)self _processInsertions:v4 inDialogPhase:v18];
}

- (void)addItemForPartialResultCommand:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [v4 refId];
  int v7 = [(AFConversation *)self _rootNode];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __49__AFConversation_addItemForPartialResultCommand___block_invoke;
  v14[3] = &unk_1E5926BA0;
  id v8 = v6;
  id v15 = v8;
  id v9 = v4;
  id v16 = v9;
  id v10 = v5;
  id v17 = v10;
  [v7 enumerateDescendentNodesUsingBlock:v14];

  if ([v10 count])
  {
    [(AFConversation *)self notifyDelegateOfUpdates:v10 inserts:0 presentationChanges:0];
  }
  else
  {
    v18[0] = v9;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    long long v12 = [v9 aceId];
    long long v13 = +[AFDialogPhase userRequestDialogPhase];
    [(AFConversation *)self _addItemsForAceObjects:v11 type:2 aceCommandIdentifier:v12 dialogPhase:v13 asChildrenOfItemWithIdentifier:0];
  }
}

void __49__AFConversation_addItemForPartialResultCommand___block_invoke(void *a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 item];
  if ([v3 type] == 2)
  {
    id v4 = [v3 aceObject];
    id v5 = [v4 refId];
    int v6 = [v5 isEqualToString:a1[4]];

    if (v6)
    {
      [v3 setAceObject:a1[5]];
      int v7 = (void *)a1[6];
      id v8 = [v9 absoluteIndexPath];
      [v7 addObject:v8];
    }
  }
}

- (id)updatedUserUtteranceForRefId:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_updatedUserUtteranceForRefId objectForKey:a3];
}

- (void)addRecognitionUpdateWithPhrases:(id)a3 utterances:(id)a4 refId:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!self->_updatedUserUtteranceForRefId)
  {
    id v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    updatedUserUtteranceForRefId = self->_updatedUserUtteranceForRefId;
    self->_updatedUserUtteranceForRefId = v10;
  }
  long long v12 = [[AFUserUtterance alloc] initWithPhrases:v13 utterances:v8];
  [(NSMutableDictionary *)self->_updatedUserUtteranceForRefId setObject:v12 forKey:v9];
}

- (id)additionalSpeechInterpretationsForRefId:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_additionalInterpretationsForRefId objectForKey:a3];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (void)addAdditionalSpeechInterpretation:(id)a3 refId:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    additionalInterpretationsForRefId = self->_additionalInterpretationsForRefId;
    if (!additionalInterpretationsForRefId)
    {
      id v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v10 = self->_additionalInterpretationsForRefId;
      self->_additionalInterpretationsForRefId = v9;

      additionalInterpretationsForRefId = self->_additionalInterpretationsForRefId;
    }
    id v11 = [(NSMutableDictionary *)additionalInterpretationsForRefId objectForKey:v7];
    if (!v11)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [(NSMutableDictionary *)self->_additionalInterpretationsForRefId setValue:v11 forKey:v7];
    }
    [v11 addObject:v6];
    long long v12 = [MEMORY[0x1E4F1CA48] array];
    id v13 = [(AFConversation *)self _rootNode];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    long long v18 = __58__AFConversation_addAdditionalSpeechInterpretation_refId___block_invoke;
    uint64_t v19 = &unk_1E5926BC8;
    id v20 = v7;
    id v14 = v12;
    id v21 = v14;
    [v13 enumerateDescendentNodesUsingBlock:&v16];

    if (objc_msgSend(v14, "count", v16, v17, v18, v19)) {
      [(AFConversation *)self notifyDelegateOfUpdates:v14 inserts:0 presentationChanges:0];
    }
  }
  else
  {
    id v15 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v23 = "-[AFConversation addAdditionalSpeechInterpretation:refId:]";
      _os_log_error_impl(&dword_19CF1D000, v15, OS_LOG_TYPE_ERROR, "%s Unable to add additional speech interpretation, invalid refId", buf, 0xCu);
    }
  }
}

void __58__AFConversation_addAdditionalSpeechInterpretation_refId___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 item];
  id v4 = [v3 aceObject];
  id v5 = [v4 refId];
  int v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  if (v6)
  {
    id v7 = *(void **)(a1 + 40);
    id v8 = [v9 absoluteIndexPath];
    [v7 addObject:v8];
  }
}

- (void)addItemForSpeechRecognizedCommand:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  int v6 = [v4 refId];
  id v7 = [(AFConversation *)self _rootNode];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52__AFConversation_addItemForSpeechRecognizedCommand___block_invoke;
  v14[3] = &unk_1E5926BA0;
  id v8 = v6;
  id v15 = v8;
  id v9 = v4;
  id v16 = v9;
  id v10 = v5;
  id v17 = v10;
  [v7 enumerateDescendentNodesUsingBlock:v14];

  if ([v10 count])
  {
    [(AFConversation *)self notifyDelegateOfUpdates:v10 inserts:0 presentationChanges:0];
  }
  else
  {
    v18[0] = v9;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    long long v12 = [v9 aceId];
    id v13 = +[AFDialogPhase userRequestDialogPhase];
    [(AFConversation *)self _addItemsForAceObjects:v11 type:1 aceCommandIdentifier:v12 dialogPhase:v13 asChildrenOfItemWithIdentifier:0];
  }
}

void __52__AFConversation_addItemForSpeechRecognizedCommand___block_invoke(void *a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 item];
  id v4 = [v3 aceObject];
  id v5 = [v4 refId];
  if ([v5 isEqualToString:a1[4]])
  {
    uint64_t v6 = [v3 type];

    if (v6 != 2) {
      goto LABEL_6;
    }
    [v3 setAceObject:a1[5]];
    [v3 setType:1];
    id v7 = (void *)a1[6];
    id v4 = [v8 absoluteIndexPath];
    [v7 addObject:v4];
  }
  else
  {
  }
LABEL_6:
}

- (void)addItemsForAceObjects:(id)a3 type:(int64_t)a4 dialogPhase:(id)a5 asChildrenOfItemWithIdentifier:(id)a6
{
}

- (void)_addItemsForAceObjects:(id)a3 type:(int64_t)a4 aceCommandIdentifier:(id)a5 dialogPhase:(id)a6 asChildrenOfItemWithIdentifier:(id)a7
{
  id v12 = a5;
  id v13 = a7;
  id v14 = a6;
  id v15 = a3;
  uint64_t v16 = [v15 count];
  id v17 = [(AFConversation *)self _indexPathsForAddingItemsWithCount:v16 asChildrenOfItemWithIdentifier:v13];

  long long v18 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v16];
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  v25 = __110__AFConversation__addItemsForAceObjects_type_aceCommandIdentifier_dialogPhase_asChildrenOfItemWithIdentifier___block_invoke;
  v26 = &unk_1E5926B78;
  id v27 = v17;
  id v28 = v12;
  id v29 = v18;
  int64_t v30 = a4;
  id v19 = v18;
  id v20 = v12;
  id v21 = v17;
  [v15 enumerateObjectsUsingBlock:&v23];

  v22 = objc_msgSend(v19, "copy", v23, v24, v25, v26);
  [(AFConversation *)self _processInsertions:v22 inDialogPhase:v14];
}

void __110__AFConversation__addItemsForAceObjects_type_aceCommandIdentifier_dialogPhase_asChildrenOfItemWithIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v9 = [v5 objectAtIndex:a3];
  LOBYTE(v8) = 0;
  id v7 = [[AFConversationInsertion alloc] initWithConversationItemType:*(void *)(a1 + 56) aceObject:v6 aceCommandIdentifier:*(void *)(a1 + 40) transient:0 supplemental:0 immersiveExperience:0 persistentAcrossInvocations:v8 indexPath:v9];

  [*(id *)(a1 + 48) addObject:v7];
}

- (void)addItemsForAddViewsCommand:(id)a3
{
  id v4 = a3;
  id v5 = [v4 dialogPhase];
  id v12 = +[AFDialogPhase dialogPhaseForAceDialogPhase:v5];

  id v6 = [v4 views];
  id v7 = [v4 aceId];
  uint64_t v8 = [v4 supplemental];
  uint64_t v9 = [v4 immersiveExperience];
  char v10 = [v4 persistentAcrossInvocations];

  LOBYTE(v11) = v10;
  [(AFConversation *)self _addItemsForAceViews:v6 withDialogPhase:v12 fromCommandWithIdentifier:v7 asChildrenOfItemWithIdentifier:0 isSupplemental:v8 isImmersiveExperience:v9 isPersistentAcrossInvocations:v11];
}

- (void)addItemsForAceViews:(id)a3 withDialogPhase:(id)a4 asChildrenOfItemWithIdentifier:(id)a5
{
}

- (void)insertItemsForAceViews:(id)a3 withDialogPhase:(id)a4 atIndexPaths:(id)a5
{
}

- (void)_addItemsForAceViews:(id)a3 withDialogPhase:(id)a4 fromCommandWithIdentifier:(id)a5 asChildrenOfItemWithIdentifier:(id)a6
{
  LOBYTE(v6) = 0;
  [(AFConversation *)self _addItemsForAceViews:a3 withDialogPhase:a4 fromCommandWithIdentifier:a5 asChildrenOfItemWithIdentifier:a6 isSupplemental:0 isImmersiveExperience:0 isPersistentAcrossInvocations:v6];
}

- (void)_addItemsForAceViews:(id)a3 withDialogPhase:(id)a4 fromCommandWithIdentifier:(id)a5 asChildrenOfItemWithIdentifier:(id)a6 isSupplemental:(BOOL)a7 isImmersiveExperience:(BOOL)a8 isPersistentAcrossInvocations:(BOOL)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  -[AFConversation _indexPathsForAddingItemsWithCount:asChildrenOfItemWithIdentifier:](self, "_indexPathsForAddingItemsWithCount:asChildrenOfItemWithIdentifier:", [v18 count], v15);
  id v20 = (id)objc_claimAutoreleasedReturnValue();

  LOBYTE(v19) = a9;
  [(AFConversation *)self _addItemsForAceViews:v18 withDialogPhase:v17 fromCommandWithIdentifier:v16 atIndexPaths:v20 isSupplemental:v10 isImmersiveExperience:v9 isPersistentAcrossInvocations:v19];
}

- (void)_addItemsForAceViews:(id)a3 withDialogPhase:(id)a4 fromCommandWithIdentifier:(id)a5 atIndexPaths:(id)a6
{
  LOBYTE(v6) = 0;
  [(AFConversation *)self _addItemsForAceViews:a3 withDialogPhase:a4 fromCommandWithIdentifier:a5 atIndexPaths:a6 isSupplemental:0 isImmersiveExperience:0 isPersistentAcrossInvocations:v6];
}

- (id)_indexPathsForAddingItemsWithCount:(int64_t)a3 asChildrenOfItemWithIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a3];
  uint64_t v8 = [(AFConversation *)self indexPathForItemWithIdentifier:v6];
  int64_t v9 = [(AFConversation *)self numberOfChildrenForItemAtIndexPath:v8];
  if (a3 >= 1)
  {
    int64_t v10 = v9;
    int64_t v11 = v9 + a3;
    do
    {
      id v12 = [v8 indexPathByAddingIndex:v10];
      [v7 addObject:v12];

      ++v10;
    }
    while (v10 < v11);
  }

  return v7;
}

- (void)_addItemsForAceViews:(id)a3 withDialogPhase:(id)a4 fromCommandWithIdentifier:(id)a5 atIndexPaths:(id)a6 isSupplemental:(BOOL)a7 isImmersiveExperience:(BOOL)a8 isPersistentAcrossInvocations:(BOOL)a9
{
  id v15 = a5;
  id v16 = a6;
  id v17 = (void *)MEMORY[0x1E4F1CA48];
  id v18 = a4;
  id v19 = a3;
  id v20 = objc_msgSend(v17, "arrayWithCapacity:", objc_msgSend(v19, "count"));
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  v26 = __161__AFConversation__addItemsForAceViews_withDialogPhase_fromCommandWithIdentifier_atIndexPaths_isSupplemental_isImmersiveExperience_isPersistentAcrossInvocations___block_invoke;
  id v27 = &unk_1E5926B50;
  id v28 = v16;
  id v29 = v20;
  id v30 = v15;
  BOOL v31 = a7;
  BOOL v32 = a8;
  BOOL v33 = a9;
  id v21 = v15;
  id v22 = v20;
  id v23 = v16;
  [v19 enumerateObjectsUsingBlock:&v24];

  -[AFConversation _processInsertions:inDialogPhase:](self, "_processInsertions:inDialogPhase:", v22, v18, v24, v25, v26, v27);
}

void __161__AFConversation__addItemsForAceViews_withDialogPhase_fromCommandWithIdentifier_atIndexPaths_isSupplemental_isImmersiveExperience_isPersistentAcrossInvocations___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v13 = [v5 objectAtIndex:a3];
  id v7 = *(void **)(a1 + 40);
  uint64_t v8 = [AFConversationInsertion alloc];
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = [v6 isTransient];
  LOBYTE(v12) = *(unsigned char *)(a1 + 58);
  int64_t v11 = [(AFConversationInsertion *)v8 initWithConversationItemType:3 aceObject:v6 aceCommandIdentifier:v9 transient:v10 supplemental:*(unsigned __int8 *)(a1 + 56) immersiveExperience:*(unsigned __int8 *)(a1 + 57) persistentAcrossInvocations:v12 indexPath:v13];

  [v7 addObject:v11];
}

- (void)_processInsertions:(id)a3 inDialogPhase:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  id v6 = a4;
  if (!v6)
  {
    id v6 = +[AFDialogPhase completionDialogPhase];
    id v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v59 = "-[AFConversation _processInsertions:inDialogPhase:]";
      __int16 v60 = 2112;
      id v61 = v6;
      _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s No dialog phase provided for conversation insertions; defaulting to %@",
        buf,
        0x16u);
    }
  }
  if (([v6 isConfirmationDialogPhase] & 1) != 0
    || [v6 isClarificationDialogPhase])
  {
    uint64_t v8 = 2;
  }
  else
  {
    uint64_t v8 = 1;
  }
  uint64_t v36 = v8;
  v38 = [MEMORY[0x1E4F1CA70] orderedSet];
  uint64_t v9 = [MEMORY[0x1E4F1CA70] orderedSet];
  id v35 = [MEMORY[0x1E4F1CA70] orderedSet];
  BOOL v33 = [MEMORY[0x1E4F1CA70] orderedSet];
  uint64_t v10 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __51__AFConversation__processInsertions_inDialogPhase___block_invoke;
  v55[3] = &unk_1E5926AB8;
  int64_t v11 = self;
  v55[4] = self;
  id v12 = v10;
  id v56 = v12;
  [v39 enumerateObjectsUsingBlock:v55];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v37 = v12;
  id obj = [v12 keyEnumerator];
  uint64_t v13 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v52;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v52 != v15) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v51 + 1) + 8 * v16);
        id v18 = [v37 objectForKey:v17];
        id v19 = objc_msgSend(v39, "af_mappedArray:", &__block_literal_global_12068);
        if (([v6 isExpository] & 1) == 0
          && ([v6 isConfirmedDialogPhase] & 1) == 0
          && (([v19 containsObject:&unk_1EEE96D88] & 1) != 0
           || ([v19 containsObject:&unk_1EEE96DA0] & 1) != 0
           || [v19 containsObject:&unk_1EEE96DB8])
          && [(AFConversation *)v11 _nodeContainsProvisionalItems:v17])
        {
          if (([v6 isConfirmationDialogPhase] & 1) != 0
            || [v6 isClarificationDialogPhase])
          {
            v49[0] = MEMORY[0x1E4F143A8];
            v49[1] = 3221225472;
            v49[2] = __51__AFConversation__processInsertions_inDialogPhase___block_invoke_18;
            v49[3] = &unk_1E5926B00;
            id v50 = v35;
            [v17 enumerateChildNodesUsingBlock:v49];
            id v20 = &v50;
          }
          else
          {
            if ([v6 isSummaryDialogPhase]) {
              goto LABEL_23;
            }
            v47[0] = MEMORY[0x1E4F143A8];
            v47[1] = 3221225472;
            v47[2] = __51__AFConversation__processInsertions_inDialogPhase___block_invoke_2_19;
            v47[3] = &unk_1E5926B00;
            id v48 = v33;
            [v17 enumerateChildNodesWithOptions:2 usingBlock:v47];
            id v20 = &v48;
          }
        }
LABEL_23:
        if (([v19 containsObject:&unk_1EEE96D88] & 1) != 0
          || [v19 containsObject:&unk_1EEE96DA0])
        {
          v45[0] = MEMORY[0x1E4F143A8];
          v45[1] = 3221225472;
          v45[2] = __51__AFConversation__processInsertions_inDialogPhase___block_invoke_3;
          v45[3] = &unk_1E5926B00;
          id v46 = v35;
          [v17 enumerateChildNodesUsingBlock:v45];
        }
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __51__AFConversation__processInsertions_inDialogPhase___block_invoke_4;
        v40[3] = &unk_1E5926B28;
        v40[4] = v11;
        v40[5] = v17;
        id v41 = v6;
        uint64_t v44 = v36;
        id v42 = v9;
        id v43 = v38;
        [v18 enumerateObjectsUsingBlock:v40];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v21 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
      uint64_t v14 = v21;
    }
    while (v21);
  }

  if ([v9 count])
  {
    id v22 = [v9 array];
    id v23 = +[AFTreeNode absoluteIndexPathsForTreeNodes:v22];
  }
  else
  {
    id v23 = 0;
  }
  if ([v38 count])
  {
    uint64_t v24 = [v38 array];
    uint64_t v25 = +[AFTreeNode absoluteIndexPathsForTreeNodes:v24];
  }
  else
  {
    uint64_t v25 = 0;
  }
  v26 = v11;
  if ([v33 count])
  {
    id v27 = [v33 array];
    id v28 = [(AFConversation *)v26 _changePresentationStateForNodes:v27];
  }
  else
  {
    id v28 = 0;
  }
  [(AFConversation *)v26 notifyDelegateOfUpdates:v23 inserts:v25 presentationChanges:v28];
  if ([v35 count])
  {
    id v29 = [v35 array];
    [(AFConversation *)v26 _removeNodes:v29];
  }
  id v30 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    BOOL v31 = v30;
    BOOL v32 = [(AFConversation *)v26 _rootNode];
    *(_DWORD *)buf = 136315394;
    v59 = "-[AFConversation _processInsertions:inDialogPhase:]";
    __int16 v60 = 2112;
    id v61 = v32;
    _os_log_impl(&dword_19CF1D000, v31, OS_LOG_TYPE_INFO, "%s rootNode=%@", buf, 0x16u);
  }
}

void __51__AFConversation__processInsertions_inDialogPhase___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 indexPath];
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 indexPathByRemovingLastIndex];
  id v6 = [v4 _nodeAtIndexPath:v5];

  id v7 = [*(id *)(a1 + 40) objectForKey:v6];
  if (!v7)
  {
    id v7 = [MEMORY[0x1E4F1CA48] array];
    [*(id *)(a1 + 40) setObject:v7 forKey:v6];
  }
  [v7 addObject:v8];
}

void __51__AFConversation__processInsertions_inDialogPhase___block_invoke_18(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 item];
  if ([v3 presentationState] == 2)
  {
    id v4 = [v3 aceObject];
    char v5 = objc_msgSend(v4, "af_isUtterance");

    if ((v5 & 1) == 0) {
      [*(id *)(a1 + 32) addObject:v6];
    }
  }
}

void __51__AFConversation__processInsertions_inDialogPhase___block_invoke_2_19(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  id v6 = [v10 item];
  id v7 = [v6 dialogPhase];
  if ([v7 isConfirmationDialogPhase])
  {
    id v8 = [v6 aceObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      if ([v6 presentationState] == 2)
      {
        [v6 setPresentationState:3];
        [*(id *)(a1 + 32) addObject:v10];
      }
      *a4 = 1;
    }
  }
  else
  {
  }
}

void __51__AFConversation__processInsertions_inDialogPhase___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [v4 item];
  if ([v3 isTransient]) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

void __51__AFConversation__processInsertions_inDialogPhase___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v29 = [v3 indexPath];
  id v4 = [v3 aceObject];
  uint64_t v5 = [v3 conversationItemType];
  id v6 = [v3 aceCommandIdentifier];
  uint64_t v7 = [v3 isTransient];
  uint64_t v8 = [v3 isSupplemental];
  uint64_t v9 = [v3 isImmersiveExperience];
  unsigned int v28 = [v3 isPersistentAcrossInvocations];

  id v10 = [*(id *)(a1 + 32) _childOfNode:*(void *)(a1 + 40) withItemWhichCanBeUpdatedWithAceObject:v4 inDialogPhase:*(void *)(a1 + 48)];
  int64_t v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v31 = "-[AFConversation _processInsertions:inDialogPhase:]_block_invoke_4";
    __int16 v32 = 2112;
    BOOL v33 = v4;
    _os_log_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_INFO, "%s ACE object: %@", buf, 0x16u);
  }
  if (v10)
  {
    id v12 = [v10 item];
    uint64_t v13 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 136315906;
      BOOL v31 = "-[AFConversation _processInsertions:inDialogPhase:]_block_invoke";
      __int16 v32 = 2112;
      BOOL v33 = v14;
      __int16 v34 = 2112;
      id v35 = v12;
      __int16 v36 = 2112;
      v37 = v29;
      _os_log_impl(&dword_19CF1D000, v13, OS_LOG_TYPE_INFO, "%s %@: updating item %@ at %@ from ACE object.", buf, 0x2Au);
    }
    [(AFTreeNode *)v12 setAceObject:v4];
    [(AFTreeNode *)v12 setDialogPhase:*(void *)(a1 + 48)];
    [(AFTreeNode *)v12 setPresentationState:*(void *)(a1 + 72)];
    [(AFTreeNode *)v12 setAceCommandIdentifier:v6];
    [(AFTreeNode *)v12 setTransient:v7];
    [(AFTreeNode *)v12 setSupplemental:v8];
    [(AFTreeNode *)v12 setImmersiveExperience:v9];
    [(AFTreeNode *)v12 setPersistentAcrossInvocations:v28];
    [*(id *)(a1 + 56) addObject:v10];
  }
  else
  {
    id v12 = objc_alloc_init(AFTreeNode);
    [*(id *)(a1 + 40) addChildNode:v12];
    uint64_t v15 = v5;
    uint64_t v16 = [AFMutableConversationItem alloc];
    id v27 = v6;
    uint64_t v17 = *(void *)(a1 + 48);
    uint64_t v18 = *(void *)(a1 + 72);
    id v19 = objc_alloc_init(AFDataStore);
    char v20 = v8;
    uint64_t v21 = v19;
    BYTE3(v26) = v28;
    BYTE2(v26) = v9;
    BYTE1(v26) = v20;
    LOBYTE(v26) = v7;
    uint64_t v22 = v17;
    id v6 = v27;
    id v23 = -[AFMutableConversationItem initWithType:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:persistentAcrossInvocations:associatedDataStore:](v16, "initWithType:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:persistentAcrossInvocations:associatedDataStore:", v15, v4, v22, v18, v27, 1, v26, v19);

    [(AFTreeNode *)v12 setItem:v23];
    uint64_t v24 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      uint64_t v25 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 136315906;
      BOOL v31 = "-[AFConversation _processInsertions:inDialogPhase:]_block_invoke";
      __int16 v32 = 2112;
      BOOL v33 = v25;
      __int16 v34 = 2112;
      id v35 = (AFTreeNode *)v23;
      __int16 v36 = 2112;
      v37 = v29;
      _os_log_impl(&dword_19CF1D000, v24, OS_LOG_TYPE_INFO, "%s %@: adding new item %@ at %@ for ACE object.", buf, 0x2Au);
    }
    [*(id *)(a1 + 64) addObject:v12];

    id v10 = 0;
  }
}

uint64_t __51__AFConversation__processInsertions_inDialogPhase___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v3 = [a2 conversationItemType];
  return [v2 numberWithInteger:v3];
}

- (id)_childOfNode:(id)a3 withItemWhichCanBeUpdatedWithAceObject:(id)a4 inDialogPhase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__12048;
  unsigned int v28 = __Block_byref_object_dispose__12049;
  id v29 = 0;
  if ([(AFConversation *)self _nodeContainsProvisionalItems:v8]) {
    char v11 = [v10 isConfirmedDialogPhase];
  }
  else {
    char v11 = 0;
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __84__AFConversation__childOfNode_withItemWhichCanBeUpdatedWithAceObject_inDialogPhase___block_invoke;
  v21[3] = &unk_1E5926A68;
  char v23 = v11;
  id v12 = v9;
  id v22 = v12;
  uint64_t v13 = (void *)MEMORY[0x19F3A50D0](v21);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __84__AFConversation__childOfNode_withItemWhichCanBeUpdatedWithAceObject_inDialogPhase___block_invoke_2;
  v17[3] = &unk_1E5926A90;
  char v20 = v11;
  id v14 = v13;
  id v18 = v14;
  id v19 = &v24;
  [v8 enumerateChildNodesWithOptions:2 usingBlock:v17];
  id v15 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v15;
}

uint64_t __84__AFConversation__childOfNode_withItemWhichCanBeUpdatedWithAceObject_inDialogPhase___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 dialogPhase];
  uint64_t v5 = [v3 presentationState];
  id v6 = [v3 aceObject];

  int v7 = [v4 isExpository];
  int v8 = v7;
  if (v5 == 2)
  {
    if (*(unsigned char *)(a1 + 40)) {
      int v8 = 1;
    }
    else {
      int v8 = v7;
    }
  }
  if (([v4 isConfirmationDialogPhase] & 1) != 0
    || [v4 isClarificationDialogPhase])
  {
    int v9 = objc_msgSend(*(id *)(a1 + 32), "af_isUtterance") ^ 1;
  }
  else
  {
    int v9 = 1;
  }
  id v10 = [*(id *)(a1 + 32) encodedClassName];
  char v11 = [v6 encodedClassName];
  if ([v10 isEqualToString:v11])
  {
    id v12 = [*(id *)(a1 + 32) groupIdentifier];
    uint64_t v13 = [v6 groupIdentifier];
    unsigned int v14 = [v12 isEqualToString:v13];
  }
  else
  {
    unsigned int v14 = 0;
  }

  return v9 & v8 & v14;
}

void __84__AFConversation__childOfNode_withItemWhichCanBeUpdatedWithAceObject_inDialogPhase___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  int v7 = [v11 item];
  int v8 = v7;
  if (*(unsigned char *)(a1 + 48)
    || ([v7 dialogPhase],
        int v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v9 isUserRequestDialogPhase],
        v9,
        (v10 & 1) == 0))
  {
    if (!(*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
      goto LABEL_6;
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  *a4 = 1;
LABEL_6:
}

- (void)_removeNodes:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    id v6 = [MEMORY[0x1E4F1CA48] array];
    int v7 = [MEMORY[0x1E4F1CA48] array];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __31__AFConversation__removeNodes___block_invoke;
    v37[3] = &unk_1E5926A18;
    id v25 = v5;
    id v38 = v25;
    id v39 = self;
    id v22 = self;
    id v24 = v6;
    id v40 = v24;
    id v23 = v7;
    id v41 = v23;
    int v8 = (void (**)(void, void))MEMORY[0x19F3A50D0](v37);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v26 = v4;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v43 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v34 != v12) {
            objc_enumerationMutation(v9);
          }
          unsigned int v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          ((void (**)(void, void *))v8)[2](v8, v14);
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __31__AFConversation__removeNodes___block_invoke_2;
          v31[3] = &unk_1E5926A40;
          id v15 = v8;
          v31[4] = v14;
          id v32 = v15;
          [v14 enumerateDescendentNodesUsingBlock:v31];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v33 objects:v43 count:16];
      }
      while (v11);
    }

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v16 = v9;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v42 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(v16);
          }
          [*(id *)(*((void *)&v27 + 1) + 8 * j) removeFromParentNode];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v42 count:16];
      }
      while (v18);
    }

    if ([v25 count])
    {
      uint64_t v21 = [(AFConversation *)v22 delegate];
      [v21 conversation:v22 didRemoveItemsWithIdentifiers:v25 atIndexPaths:v24 parentItemIdentifiers:v23];
    }
    id v4 = v26;
  }
}

void __31__AFConversation__removeNodes___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [v14 item];
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 identifier];
  LOBYTE(v4) = [v4 containsObject:v5];

  if ((v4 & 1) == 0)
  {
    id v6 = [v14 parentNode];
    int v7 = [*(id *)(a1 + 40) _rootNode];
    if (v6 == v7)
    {
      id v9 = [MEMORY[0x1E4F1CA98] null];
    }
    else
    {
      int v8 = [v6 item];
      id v9 = [v8 identifier];
    }
    if (v9)
    {
      uint64_t v10 = *(void **)(a1 + 32);
      uint64_t v11 = [v3 identifier];
      [v10 addObject:v11];

      uint64_t v12 = *(void **)(a1 + 48);
      uint64_t v13 = [v14 absoluteIndexPath];
      [v12 addObject:v13];

      [*(id *)(a1 + 56) addObject:v9];
    }
  }
}

uint64_t __31__AFConversation__removeNodes___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)_itemAtIndexPath:(id)a3
{
  id v3 = [(AFConversation *)self _nodeAtIndexPath:a3];
  id v4 = [v3 item];

  return v4;
}

- (id)_nodeAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AFConversation *)self _rootNode];
  id v6 = [v5 nodeAtIndexPath:v4];

  return v6;
}

- (AFConversation)initWithLanguageCode:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F29128];
  id v5 = a3;
  id v6 = [v4 UUID];
  int v7 = [(AFConversation *)self initWithIdentifier:v6 languageCode:v5];

  return v7;
}

- (AFConversation)initWithIdentifier:(id)a3 languageCode:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = objc_alloc_init(AFTreeNode);
  id v9 = [(AFConversation *)self initWithIdentifier:v7 languageCode:v6 rootNode:v8];

  return v9;
}

- (AFConversation)initWithIdentifier:(id)a3 languageCode:(id)a4 rootNode:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AFConversation;
  uint64_t v11 = [(AFConversation *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSUUID *)v12;

    objc_storeStrong((id *)&v11->_rootNode, a5);
    uint64_t v14 = [v9 copy];
    languageCode = v11->_languageCode;
    v11->_languageCode = (NSString *)v14;

    v11->_synchronizedWithServer = 1;
  }

  return v11;
}

@end