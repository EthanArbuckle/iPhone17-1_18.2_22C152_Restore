@interface CNQuickActionsManager
+ (BOOL)hasActionsForContact:(id)a3;
+ (id)actionsManagerForContacts:(id)a3;
+ (id)defaultCategories;
+ (id)descriptorForRequiredKeys;
- (BOOL)_shouldGroupActionsInCategory:(id)a3;
- (BOOL)bypassActionValidation;
- (BOOL)sortsWithDuet;
- (BOOL)useDuetIfAvailable;
- (CNContact)contact;
- (CNQuickActionsManager)initWithContacts:(id)a3;
- (CNQuickActionsManagerDelegate)delegate;
- (CNQuickActionsUsageManager)usageManager;
- (CNQuickFaceTimeAction)faceTimeAudioAction;
- (CNQuickFaceTimeAction)faceTimeVideoAction;
- (NSArray)actions;
- (NSArray)categories;
- (NSArray)contacts;
- (NSArray)subManagers;
- (NSDictionary)groups;
- (NSMutableArray)updateBlocks;
- (id)_addActionForPropertyItem:(id)a3 category:(id)a4 propertyActionClass:(Class)a5;
- (id)_groupedActionsFromOrderedActionsByCategories:(id)a3;
- (id)_hierarchicalActionsForCategory:(id)a3 fromActions:(id)a4 askDelegate:(BOOL)a5;
- (id)_ignoredLabels;
- (id)_orderedLabels;
- (id)_propertyItemsForKey:(id)a3;
- (id)quickActions;
- (unint64_t)desiredNumberOfActions;
- (void)_actionsUpdated;
- (void)_addAction:(id)a3;
- (void)_createGroupsForPropertyKeys:(id)a3;
- (void)_openURL:(id)a3;
- (void)_updateActionsForPropertyItems:(id)a3 category:(id)a4 propertyActionClass:(Class)a5;
- (void)_updateIDSActionsForPropertyItems:(id)a3 category:(id)a4 serviceName:(id)a5 propertyActionClass:(Class)a6;
- (void)_updateMultiContactActions;
- (void)_updateSingleContactActions;
- (void)actionPerformed:(id)a3;
- (void)contactAction:(id)a3 presentViewController:(id)a4;
- (void)contactActionDidUpdate:(id)a3;
- (void)dealloc;
- (void)refreshActions;
- (void)refreshActionsAndForceSendUpdate:(BOOL)a3;
- (void)setBypassActionValidation:(BOOL)a3;
- (void)setCategories:(id)a3;
- (void)setContacts:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDesiredNumberOfActions:(unint64_t)a3;
- (void)setFaceTimeAudioAction:(id)a3;
- (void)setFaceTimeVideoAction:(id)a3;
- (void)setGroups:(id)a3;
- (void)setSortsWithDuet:(BOOL)a3;
- (void)setSubManagers:(id)a3;
- (void)setUpdateBlocks:(id)a3;
- (void)setUsageManager:(id)a3;
- (void)setUseDuetIfAvailable:(BOOL)a3;
- (void)stopUpdatingActions;
- (void)updateActionsWithBlock:(id)a3;
@end

@implementation CNQuickActionsManager

void __50__CNQuickActionsManager_descriptorForRequiredKeys__block_invoke()
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1B8F8];
  uint64_t v1 = *MEMORY[0x1E4F1ADC8];
  v6[0] = *MEMORY[0x1E4F1AEE0];
  v6[1] = v1;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  v3 = [NSString stringWithUTF8String:"+[CNQuickActionsManager descriptorForRequiredKeys]_block_invoke"];
  uint64_t v4 = [v0 descriptorWithKeyDescriptors:v2 description:v3];
  v5 = (void *)descriptorForRequiredKeys_cn_once_object_3;
  descriptorForRequiredKeys_cn_once_object_3 = v4;
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_3 != -1) {
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_3, &__block_literal_global_1888);
  }
  v2 = (void *)descriptorForRequiredKeys_cn_once_object_3;

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subManagers, 0);
  objc_storeStrong((id *)&self->_usageManager, 0);
  objc_storeStrong((id *)&self->_faceTimeAudioAction, 0);
  objc_storeStrong((id *)&self->_faceTimeVideoAction, 0);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_updateBlocks, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_actions, 0);

  objc_storeStrong((id *)&self->_actionsByCategories, 0);
}

- (void)setSubManagers:(id)a3
{
}

- (NSArray)subManagers
{
  return self->_subManagers;
}

- (void)setUsageManager:(id)a3
{
}

- (CNQuickActionsUsageManager)usageManager
{
  return self->_usageManager;
}

- (void)setFaceTimeAudioAction:(id)a3
{
}

- (CNQuickFaceTimeAction)faceTimeAudioAction
{
  return self->_faceTimeAudioAction;
}

- (void)setFaceTimeVideoAction:(id)a3
{
}

- (CNQuickFaceTimeAction)faceTimeVideoAction
{
  return self->_faceTimeVideoAction;
}

- (void)setGroups:(id)a3
{
}

- (NSDictionary)groups
{
  return self->_groups;
}

- (void)setUpdateBlocks:(id)a3
{
}

- (NSMutableArray)updateBlocks
{
  return self->_updateBlocks;
}

- (void)setUseDuetIfAvailable:(BOOL)a3
{
  self->_useDuetIfAvailable = a3;
}

- (BOOL)useDuetIfAvailable
{
  return self->_useDuetIfAvailable;
}

- (void)setBypassActionValidation:(BOOL)a3
{
  self->_bypassActionValidation = a3;
}

- (BOOL)bypassActionValidation
{
  return self->_bypassActionValidation;
}

- (void)setDesiredNumberOfActions:(unint64_t)a3
{
  self->_desiredNumberOfActions = a3;
}

- (unint64_t)desiredNumberOfActions
{
  return self->_desiredNumberOfActions;
}

- (void)setCategories:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (CNQuickActionsManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNQuickActionsManagerDelegate *)WeakRetained;
}

- (void)setContacts:(id)a3
{
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void)contactAction:(id)a3 presentViewController:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  v7 = [(CNQuickActionsManager *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [(CNQuickActionsManager *)self delegate];
    v10 = [v9 actionsManager:self presentingViewControllerForAction:v11];

    if (v10) {
      [v10 presentViewController:v6 animated:1 completion:0];
    }
  }
}

- (void)contactActionDidUpdate:(id)a3
{
  uint64_t v4 = [(CNQuickActionsManager *)self faceTimeVideoAction];

  if (v4)
  {
    v5 = [(CNQuickActionsManager *)self faceTimeVideoAction];
    [v5 setCached:0];

    usageManager = self->_usageManager;
    v7 = [(CNQuickActionsManager *)self faceTimeVideoAction];
    [(CNQuickActionsUsageManager *)usageManager cacheEnabledStateForAction:v7];
  }
  char v8 = [(CNQuickActionsManager *)self faceTimeAudioAction];

  if (v8)
  {
    v9 = [(CNQuickActionsManager *)self faceTimeAudioAction];
    [v9 setCached:0];

    v10 = self->_usageManager;
    id v11 = [(CNQuickActionsManager *)self faceTimeAudioAction];
    [(CNQuickActionsUsageManager *)v10 cacheEnabledStateForAction:v11];
  }

  [(CNQuickActionsManager *)self refreshActionsAndForceSendUpdate:0];
}

- (id)quickActions
{
  v2 = [(CNQuickActionsManager *)self actions];
  v3 = [v2 indexesOfObjectsPassingTest:&__block_literal_global_78];
  uint64_t v4 = [v2 objectsAtIndexes:v3];

  return v4;
}

uint64_t __37__CNQuickActionsManager_quickActions__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 category];
  uint64_t v3 = [v2 isEqualToString:CNQuickActionCategoryMail] ^ 1;

  return v3;
}

- (NSArray)actions
{
  return [(NSOrderedSet *)self->_actions array];
}

- (void)actionPerformed:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(CNQuickActionsManager *)self usageManager];
  [v4 actionPerformed:v8];

  v5 = [(CNQuickActionsManager *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(CNQuickActionsManager *)self delegate];
    [v7 actionsManager:self actionDidPerform:v8];
  }
  [(CNQuickActionsManager *)self refreshActionsAndForceSendUpdate:0];
}

- (void)_actionsUpdated
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_updateBlocks;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v7 + 1) + 8 * v6) + 16))(*(void *)(*((void *)&v7 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)stopUpdatingActions
{
  [(NSMutableSet *)self->_requests makeObjectsPerformSelector:sel_cancel];
  requests = self->_requests;
  self->_requests = 0;
}

- (void)refreshActions
{
}

- (void)refreshActionsAndForceSendUpdate:(BOOL)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(CNQuickActionsManager *)self contact];

  if (v5)
  {
    BOOL v18 = a3;
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_actionsByCategories, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v7 = [(CNQuickActionsManager *)self categories];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          v13 = [(NSMutableDictionary *)self->_actionsByCategories objectForKeyedSubscript:v12];
          v14 = [(CNQuickActionsManager *)self usageManager];
          v15 = [v14 sortedActions:v13];

          if ([v15 count])
          {
            [v6 setObject:v15 forKeyedSubscript:v12];
            [v15 count];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v9);
    }

    v16 = [(CNQuickActionsManager *)self _groupedActionsFromOrderedActionsByCategories:v6];
    v17 = v16;
    if (v18 || ([v16 isEqualToOrderedSet:self->_actions] & 1) == 0)
    {
      objc_storeStrong((id *)&self->_actions, v17);
      [(CNQuickActionsManager *)self _actionsUpdated];
    }
  }
}

- (void)_updateMultiContactActions
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_contacts, "count"));
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__CNQuickActionsManager__updateMultiContactActions__block_invoke;
  aBlock[3] = &unk_1E549B488;
  aBlock[4] = self;
  uint64_t v4 = (void (**)(void))_Block_copy(aBlock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  obj = self->_contacts;
  uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v14 + 1) + 8 * v8);
        uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
        uint64_t v10 = +[CNQuickActionsManager actionsManagerForContacts:v9];

        id v11 = [(CNQuickActionsManager *)self categories];
        [v10 setCategories:v11];

        objc_msgSend(v10, "setBypassActionValidation:", -[CNQuickActionsManager bypassActionValidation](self, "bypassActionValidation"));
        uint64_t v12 = [(CNQuickActionsManager *)self delegate];
        [v10 setDelegate:v12];

        [v3 addObject:v10];
        [v10 updateActionsWithBlock:v4];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v6);
  }

  [(CNQuickActionsManager *)self setSubManagers:v3];
  v4[2](v4);
}

void __51__CNQuickActionsManager__updateMultiContactActions__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) subManagers];

  if (v2)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CA70];
    uint64_t v4 = [*(id *)(a1 + 32) subManagers];
    uint64_t v5 = objc_msgSend(v3, "orderedSetWithCapacity:", objc_msgSend(v4, "count"));

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "subManagers", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = [*(id *)(*((void *)&v15 + 1) + 8 * v10) actions];
          [v5 addObjectsFromArray:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    uint64_t v12 = *(void *)(a1 + 32);
    v13 = *(void **)(v12 + 16);
    *(void *)(v12 + 16) = v5;
    id v14 = v5;

    [*(id *)(a1 + 32) _actionsUpdated];
  }
}

- (void)_updateSingleContactActions
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CNQuickActionsManager *)self _propertyItemsForKey:*MEMORY[0x1E4F1AEE0]];
  v48 = [(CNQuickActionsManager *)self _propertyItemsForKey:*MEMORY[0x1E4F1ADC8]];
  uint64_t v4 = +[CNCapabilitiesManager defaultCapabilitiesManager];
  if ([v4 isFaceTimeAppAvailable]) {
    char v5 = [v4 isConferencingAvailable];
  }
  else {
    char v5 = 0;
  }
  int v6 = [v4 isFaceTimeAudioAvailable];
  if ([v3 count]) {
    char v7 = [v4 hasCellularTelephonyCapability];
  }
  else {
    char v7 = 0;
  }
  if ([v3 count]) {
    char v8 = [v4 hasSMSCapability];
  }
  else {
    char v8 = 0;
  }
  LODWORD(v47) = v6;
  if ([v4 isMessagesAppAvailable]
    && ([v3 count] || objc_msgSend(v48, "count")))
  {
    HIDWORD(v47) = objc_msgSend(v4, "isMadridConfigured", v47);
  }
  else
  {
    HIDWORD(v47) = 0;
  }
  if ((v7 & 1) != 0 || [(CNQuickActionsManager *)self bypassActionValidation])
  {
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v9 = v3;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v52 objects:v56 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v53 != v11) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(*(id *)(*((void *)&v52 + 1) + 8 * i), "setAllowsPhone:", 1, v47);
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v52 objects:v56 count:16];
      }
      while (v10);
    }

    [(CNQuickActionsManager *)self _updateActionsForPropertyItems:v9 category:CNQuickActionCategoryAudioCall propertyActionClass:objc_opt_class()];
  }
  if ((v8 & 1) != 0 || [(CNQuickActionsManager *)self bypassActionValidation]) {
    [(CNQuickActionsManager *)self _updateActionsForPropertyItems:v3 category:CNQuickActionCategoryInstantMessage propertyActionClass:objc_opt_class()];
  }
  [(CNQuickActionsManager *)self _updateActionsForPropertyItems:v48 category:CNQuickActionCategoryMail propertyActionClass:objc_opt_class()];
  if ((v5 & 1) != 0 || [(CNQuickActionsManager *)self bypassActionValidation])
  {
    v13 = [(CNQuickActionsManager *)self categories];
    if ([v13 containsObject:CNQuickActionCategoryVideoCall])
    {
    }
    else
    {
      id v14 = [(CNQuickActionsManager *)self categories];
      int v15 = [v14 containsObject:CNQuickActionCategoryAudioCall];

      if (!v15) {
        goto LABEL_39;
      }
    }
    long long v16 = [MEMORY[0x1E4F1CA48] array];
    [v16 addObjectsFromArray:v3];
    [v16 addObjectsFromArray:v48];
    long long v17 = [CNPropertyFaceTimeAction alloc];
    long long v18 = [(CNQuickActionsManager *)self contact];
    uint64_t v19 = [(CNPropertyFaceTimeAction *)v17 initWithContact:v18 propertyItems:v16];

    uint64_t v20 = [(CNQuickActionsManager *)self categories];
    int v21 = [v20 containsObject:CNQuickActionCategoryVideoCall];

    if (v21)
    {
      long long v22 = [(CNQuickPropertyAction *)[CNQuickFaceTimeAction alloc] initWithPropertyAction:v19];
      [(CNQuickFaceTimeAction *)v22 setAudioOnly:0];
      [(CNQuickActionsUsageManager *)self->_usageManager updateCachedEnabledStateForAction:v22];
      [(CNQuickActionsManager *)self setFaceTimeVideoAction:v22];
      [(CNQuickActionsManager *)self _addAction:v22];
    }
    if (v47)
    {
      v23 = [(CNQuickActionsManager *)self categories];
      int v24 = [v23 containsObject:CNQuickActionCategoryAudioCall];

      if (v24)
      {
        v25 = [(CNQuickPropertyAction *)[CNQuickFaceTimeAction alloc] initWithPropertyAction:v19];
        [(CNQuickFaceTimeAction *)v25 setAudioOnly:1];
        [(CNQuickActionsUsageManager *)self->_usageManager updateCachedEnabledStateForAction:v25];
        [(CNQuickActionsManager *)self setFaceTimeAudioAction:v25];
        [(CNQuickActionsManager *)self _addAction:v25];
      }
    }
  }
LABEL_39:
  if ((v47 & 0x100000000) != 0 || [(CNQuickActionsManager *)self bypassActionValidation])
  {
    uint64_t v26 = CNQuickActionCategoryInstantMessage;
    v27 = getIDSServiceNameiMessage_1840();
    [(CNQuickActionsManager *)self _updateIDSActionsForPropertyItems:v48 category:v26 serviceName:v27 propertyActionClass:objc_opt_class()];

    uint64_t v28 = CNQuickActionCategoryInstantMessage;
    v29 = getIDSServiceNameiMessage_1840();
    [(CNQuickActionsManager *)self _updateIDSActionsForPropertyItems:v3 category:v28 serviceName:v29 propertyActionClass:objc_opt_class()];
  }
  v30 = [(CNQuickActionsManager *)self categories];
  if ([(CNContactCreateNewContactAction *)v30 containsObject:CNQuickActionCategoryAddToContacts])
  {
    v31 = [(CNQuickActionsManager *)self contact];
    int v32 = [v31 isUnknown];

    if (!v32) {
      goto LABEL_46;
    }
    v33 = [CNContactCreateNewContactAction alloc];
    v34 = [(CNQuickActionsManager *)self contact];
    v30 = [(CNContactAction *)v33 initWithContact:v34];

    v35 = [[CNQuickContactAction alloc] initWithContactAction:v30];
    [(CNQuickAction *)v35 setCategory:CNQuickActionCategoryAddToContacts];
    v36 = CNContactsUIBundle();
    v37 = [v36 localizedStringForKey:@"UNKNOWN_CARD_CREATE_NEW_CONTACT" value:&stru_1ED8AC728 table:@"Localized"];
    [(CNQuickAction *)v35 setTitle:v37];

    [(CNQuickAction *)v35 setIdentifier:@"create-new"];
    [(CNQuickActionsManager *)self _addAction:v35];
    v38 = [CNContactAddToExistingContactAction alloc];
    v39 = [(CNQuickActionsManager *)self contact];
    v40 = [(CNContactAction *)v38 initWithContact:v39];

    v41 = [[CNQuickContactAction alloc] initWithContactAction:v40];
    [(CNQuickAction *)v41 setCategory:CNQuickActionCategoryAddToContacts];
    v42 = CNContactsUIBundle();
    v43 = [v42 localizedStringForKey:@"UNKNOWN_CARD_ADD_TO_EXISTING_CONTACT" value:&stru_1ED8AC728 table:@"Localized"];
    [(CNQuickAction *)v41 setTitle:v43];

    [(CNQuickAction *)v41 setIdentifier:@"add-existing"];
    [(CNQuickActionsManager *)self _addAction:v41];
  }
LABEL_46:
  v44 = [(CNQuickActionsManager *)self categories];
  if (![(CNQuickAction *)v44 containsObject:CNQuickActionCategoryInfo])
  {
LABEL_49:

    goto LABEL_50;
  }
  v45 = [(CNQuickActionsManager *)self contact];
  char v46 = [v45 isUnknown];

  if ((v46 & 1) == 0)
  {
    v44 = objc_alloc_init(CNQuickAction);
    [(CNQuickAction *)v44 setCategory:CNQuickActionCategoryInfo];
    [(CNQuickAction *)v44 setIdentifier:@"info"];
    objc_initWeak(&location, self);
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __52__CNQuickActionsManager__updateSingleContactActions__block_invoke;
    v49[3] = &unk_1E549B600;
    objc_copyWeak(&v50, &location);
    [(CNQuickAction *)v44 setPerformBlock:v49];
    [(CNQuickActionsManager *)self _addAction:v44];
    objc_destroyWeak(&v50);
    objc_destroyWeak(&location);
    goto LABEL_49;
  }
LABEL_50:
  [(CNQuickActionsManager *)self refreshActionsAndForceSendUpdate:1];
}

void __52__CNQuickActionsManager__updateSingleContactActions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = (void *)MEMORY[0x1E4F1CB10];
  v2 = NSString;
  uint64_t v3 = [WeakRetained contact];
  uint64_t v4 = [v3 identifier];
  char v5 = [v2 stringWithFormat:@"contact://show?id=%@", v4];
  int v6 = [v1 URLWithString:v5];

  [WeakRetained _openURL:v6];
}

- (void)updateActionsWithBlock:(id)a3
{
  id aBlock = a3;
  [(CNQuickActionsManager *)self stopUpdatingActions];
  uint64_t v4 = [MEMORY[0x1E4F1CA80] set];
  requests = self->_requests;
  self->_requests = v4;

  int v6 = [MEMORY[0x1E4F1CA60] dictionary];
  actionsByCategories = self->_actionsByCategories;
  self->_actionsByCategories = v6;

  subManagers = self->_subManagers;
  self->_subManagers = 0;

  if (aBlock)
  {
    updateBlocks = self->_updateBlocks;
    uint64_t v10 = _Block_copy(aBlock);
    [(NSMutableArray *)updateBlocks addObject:v10];
  }
  uint64_t v11 = [(CNQuickActionsManager *)self contact];

  if (v11) {
    [(CNQuickActionsManager *)self _updateSingleContactActions];
  }
  else {
    [(CNQuickActionsManager *)self _updateMultiContactActions];
  }
}

- (id)_propertyItemsForKey:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(CNQuickActionsManager *)self contact];
  int v6 = [v5 valueForKey:v4];

  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v12 = [(NSDictionary *)self->_groups objectForKeyedSubscript:v4];
        v13 = [(CNQuickActionsManager *)self contact];
        id v14 = +[CNPropertyGroupItem propertyGroupItemWithLabeledValue:v11 group:v12 contact:v13];

        if (v14) {
          [v17 addObject:v14];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  return v17;
}

- (void)_openURL:(id)a3
{
  id v9 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v4 = (void *)MEMORY[0x1E4F1CB10];
  if (isKindOfClass)
  {
    char v5 = [v9 stringByReplacingOccurrencesOfString:@" " withString:&stru_1ED8AC728];
    id v6 = [v4 URLWithString:v5];

    if (!v6) {
      goto LABEL_7;
    }
LABEL_6:
    uint64_t v7 = +[CNUIContactsEnvironment currentEnvironment];
    uint64_t v8 = [v7 applicationWorkspace];
    [v8 openSensitiveURLInBackground:v6 withOptions:0];

    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v9;
    if (v6) {
      goto LABEL_6;
    }
  }
LABEL_7:
}

- (void)_updateIDSActionsForPropertyItems:(id)a3 category:(id)a4 serviceName:(id)a5 propertyActionClass:(Class)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v10 = a4;
  id v24 = a5;
  uint64_t v11 = [(CNQuickActionsManager *)self categories];
  int v12 = [v11 containsObject:v10];

  if (v12)
  {
    uint64_t v26 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    v13 = [MEMORY[0x1E4F1CA48] array];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v14 = v25;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v32 != v16) {
            objc_enumerationMutation(v14);
          }
          uint64_t v18 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          long long v19 = [(CNQuickActionsManager *)self _addActionForPropertyItem:v18 category:v10 propertyActionClass:a6];
          if (v19)
          {
            [v13 addObject:v18];
            [v26 setObject:v19 forKey:v18];
            if ([(CNQuickActionsManager *)self bypassActionValidation])
            {
              [v19 setEnabled:1];
            }
            else
            {
              long long v20 = [(CNQuickActionsManager *)self usageManager];
              [v20 updateCachedEnabledStateForAction:v19];
            }
          }
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v15);
    }

    if (![(CNQuickActionsManager *)self bypassActionValidation])
    {
      objc_initWeak(&location, self);
      long long v21 = [CNPropertyIDSRequest alloc];
      long long v22 = (void *)[v13 copy];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __100__CNQuickActionsManager__updateIDSActionsForPropertyItems_category_serviceName_propertyActionClass___block_invoke;
      v27[3] = &unk_1E54969F0;
      objc_copyWeak(&v29, &location);
      id v28 = v26;
      uint64_t v23 = [(CNPropertyIDSRequest *)v21 initWithPropertyItems:v22 service:v24 postToMainQueue:1 resultBlock:v27];

      [(NSMutableSet *)self->_requests addObject:v23];
      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
  }
}

void __100__CNQuickActionsManager__updateIDSActionsForPropertyItems_category_serviceName_propertyActionClass___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [*(id *)(a1 + 32) objectForKey:*(void *)(*((void *)&v26 + 1) + 8 * v12)];
        [v13 setEnabled:1];
        id v14 = [WeakRetained usageManager];
        [v14 cacheEnabledStateForAction:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v10);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v15 = v6;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *(void *)(*((void *)&v22 + 1) + 8 * v19), (void)v22);
        [v20 setEnabled:0];
        long long v21 = [WeakRetained usageManager];
        [v21 cacheEnabledStateForAction:v20];

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v17);
  }

  [WeakRetained refreshActionsAndForceSendUpdate:0];
}

- (void)_updateActionsForPropertyItems:(id)a3 category:(id)a4 propertyActionClass:(Class)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(CNQuickActionsManager *)self categories];
  int v11 = [v10 containsObject:v9];

  if (v11)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = -[CNQuickActionsManager _addActionForPropertyItem:category:propertyActionClass:](self, "_addActionForPropertyItem:category:propertyActionClass:", *(void *)(*((void *)&v18 + 1) + 8 * v16++), v9, a5, (void)v18);
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v14);
    }
  }
}

- (id)_addActionForPropertyItem:(id)a3 category:(id)a4 propertyActionClass:(Class)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 labeledValue];
  int v11 = [v10 label];
  if (v11
    && ([(CNQuickActionsManager *)self _ignoredLabels],
        id v12 = objc_claimAutoreleasedReturnValue(),
        char v13 = [v12 containsObject:v11],
        v12,
        (v13 & 1) != 0))
  {
    uint64_t v14 = 0;
  }
  else
  {
    id v15 = [a5 alloc];
    uint64_t v16 = [(CNQuickActionsManager *)self contact];
    id v17 = (void *)[v15 initWithContact:v16 propertyItem:v8];

    uint64_t v14 = [[CNQuickPropertyAction alloc] initWithPropertyAction:v17];
    [(CNQuickAction *)v14 setCategory:v9];
    long long v18 = [(CNQuickActionsManager *)self _orderedLabels];
    uint64_t v19 = [v18 indexOfObject:v11];
    if (v19 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v20 = 0;
    }
    else {
      uint64_t v20 = [v18 count] - v19 + 1;
    }
    [(CNQuickAction *)v14 setScore:v20];
    [(CNQuickActionsManager *)self _addAction:v14];
  }

  return v14;
}

- (void)_addAction:(id)a3
{
  id v4 = a3;
  id v5 = [v4 category];
  id v6 = [(NSMutableDictionary *)self->_actionsByCategories objectForKeyedSubscript:v5];
  if (!v6)
  {
    id v6 = [MEMORY[0x1E4F1CA70] orderedSet];
    [(NSMutableDictionary *)self->_actionsByCategories setObject:v6 forKeyedSubscript:v5];
  }
  [v4 setManager:self];
  objc_msgSend(v4, "setUseDuetIfAvailable:", -[CNQuickActionsManager useDuetIfAvailable](self, "useDuetIfAvailable"));
  objc_opt_class();
  id v9 = v4;
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = v9;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  if (v8) {
    [v8 setDelegate:self];
  }
  [v6 addObject:v9];
}

- (id)_hierarchicalActionsForCategory:(id)a3 fromActions:(id)a4 askDelegate:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (![v9 count])
  {
    id v34 = [MEMORY[0x1E4F1CAA0] orderedSet];
    goto LABEL_33;
  }
  if ((unint64_t)[v9 count] < 2
    || ![(CNQuickActionsManager *)self _shouldGroupActionsInCategory:v8])
  {
    id v34 = v9;
LABEL_33:
    long long v33 = v34;
    goto LABEL_34;
  }
  if (!v5) {
    goto LABEL_43;
  }
  uint64_t v10 = [(CNQuickActionsManager *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) == 0) {
    goto LABEL_43;
  }
  id v12 = [MEMORY[0x1E4F1CA48] array];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (!v14)
  {
    uint64_t v16 = 0;
    goto LABEL_41;
  }
  uint64_t v15 = v14;
  uint64_t v16 = 0;
  v44 = v12;
  uint64_t v45 = *(void *)v51;
  id obj = v13;
  while (2)
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v51 != v45) {
        objc_enumerationMutation(obj);
      }
      long long v18 = *(void **)(*((void *)&v50 + 1) + 8 * i);
      objc_opt_class();
      id v19 = v18;
      if (objc_opt_isKindOfClass()) {
        uint64_t v20 = v19;
      }
      else {
        uint64_t v20 = 0;
      }
      id v21 = v20;

      if (!v21)
      {
        id v21 = v16;
LABEL_40:

        uint64_t v16 = 0;
        id v13 = obj;
        goto LABEL_41;
      }
      if (!v16)
      {
        uint64_t v16 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
      }
      long long v22 = [v21 propertyAction];
      uint64_t v23 = [v22 propertyItem];
      long long v24 = [v23 contactProperty];

      if (!v24)
      {

        id v12 = v44;
        goto LABEL_40;
      }
      [v16 setObject:v21 forKey:v24];
      id v12 = v44;
      [v44 addObject:v24];
    }
    uint64_t v15 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
    if (v15) {
      continue;
    }
    break;
  }

  if (!v16) {
    goto LABEL_42;
  }
  long long v25 = [(CNQuickActionsManager *)self delegate];
  id v13 = [v25 actionsManager:self orderedPropertiesForProperties:v44 category:v8];

  if (!v13 || ([v13 isEqualToArray:v44] & 1) != 0)
  {
LABEL_41:

LABEL_42:
LABEL_43:
    uint64_t v36 = [CNQuickDisambiguateAction alloc];
    v37 = (void *)[v9 copy];
    v38 = [(CNQuickDisambiguateAction *)v36 initWithActions:v37];

    v39 = [(CNQuickDisambiguateAction *)v38 actions];
    v40 = [v39 firstObject];

    v41 = [v9 firstObject];
    [(CNQuickDisambiguateAction *)v38 setMainAction:v40];
    [(CNQuickContactAction *)v38 setDelegate:self];
    [(CNQuickAction *)v38 setIdentifier:@"disambiguate"];
    v42 = [v41 category];
    [(CNQuickAction *)v38 setCategory:v42];

    [(CNQuickAction *)v38 setUseDuetIfAvailable:[(CNQuickActionsManager *)self useDuetIfAvailable]];
    long long v33 = [MEMORY[0x1E4F1CAA0] orderedSetWithObject:v38];

    goto LABEL_34;
  }
  long long v26 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v27 = v13;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v47;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v47 != v30) {
          objc_enumerationMutation(v27);
        }
        uint64_t v32 = [v16 objectForKey:*(void *)(*((void *)&v46 + 1) + 8 * j)];
        [v26 addObject:v32];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v29);
  }

  long long v33 = [(CNQuickActionsManager *)self _hierarchicalActionsForCategory:v8 fromActions:v26 askDelegate:0];

LABEL_34:

  return v33;
}

- (id)_groupedActionsFromOrderedActionsByCategories:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [(CNQuickActionsManager *)self categories];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v12 = [v4 objectForKeyedSubscript:v11];
        id v13 = [(CNQuickActionsManager *)self _hierarchicalActionsForCategory:v11 fromActions:v12 askDelegate:1];
        if (v13) {
          [v5 unionOrderedSet:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)_shouldGroupActionsInCategory:(id)a3
{
  return [a3 isEqualToString:CNQuickActionCategoryAddToContacts] ^ 1;
}

- (id)_ignoredLabels
{
  if (_ignoredLabels_cn_once_token_6 != -1) {
    dispatch_once(&_ignoredLabels_cn_once_token_6, &__block_literal_global_20_1871);
  }
  v2 = (void *)_ignoredLabels_cn_once_object_6;

  return v2;
}

void __39__CNQuickActionsManager__ignoredLabels__block_invoke()
{
  v7[7] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = *MEMORY[0x1E4F1B750];
  v7[0] = *MEMORY[0x1E4F1B710];
  v7[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F1B738];
  v7[2] = *MEMORY[0x1E4F1B730];
  v7[3] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1B748];
  v7[4] = *MEMORY[0x1E4F1B718];
  v7[5] = v3;
  v7[6] = *MEMORY[0x1E4F1B740];
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:7];
  uint64_t v5 = [v0 setWithArray:v4];
  id v6 = (void *)_ignoredLabels_cn_once_object_6;
  _ignoredLabels_cn_once_object_6 = v5;
}

- (id)_orderedLabels
{
  if (_orderedLabels_cn_once_token_5 != -1) {
    dispatch_once(&_orderedLabels_cn_once_token_5, &__block_literal_global_18_1874);
  }
  uint64_t v2 = (void *)_orderedLabels_cn_once_object_5;

  return v2;
}

void __39__CNQuickActionsManager__orderedLabels__block_invoke()
{
  v5[6] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F1B708];
  v5[0] = *MEMORY[0x1E4F1B758];
  v5[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F1B720];
  v5[2] = *MEMORY[0x1E4F1B728];
  v5[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F1B770];
  v5[4] = *MEMORY[0x1E4F1B6F8];
  v5[5] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:6];
  id v4 = (void *)_orderedLabels_cn_once_object_5;
  _orderedLabels_cn_once_object_5 = v3;
}

- (void)_createGroupsForPropertyKeys:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
        id v12 = [(CNQuickActionsManager *)self contact];
        id v13 = +[CNCardPropertyGroup groupForProperty:v11 contact:v12 store:0 policy:0 linkedPolicies:0];

        [v5 setObject:v13 forKey:v11];
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  [(CNQuickActionsManager *)self setGroups:v5];
}

- (BOOL)sortsWithDuet
{
  uint64_t v2 = [(CNQuickActionsManager *)self usageManager];
  char v3 = [v2 sortsWithDuet];

  return v3;
}

- (void)setSortsWithDuet:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CNQuickActionsManager *)self usageManager];
  [v4 setSortsWithDuet:v3];
}

- (NSArray)categories
{
  categories = self->_categories;
  if (categories)
  {
    BOOL v3 = categories;
  }
  else
  {
    BOOL v3 = [(id)objc_opt_class() defaultCategories];
  }

  return v3;
}

- (CNContact)contact
{
  BOOL v3 = [(CNQuickActionsManager *)self contacts];
  uint64_t v4 = [v3 count];

  if (v4 == 1)
  {
    uint64_t v5 = [(CNQuickActionsManager *)self contacts];
    id v6 = [v5 firstObject];
  }
  else
  {
    id v6 = 0;
  }

  return (CNContact *)v6;
}

- (void)dealloc
{
  [(CNQuickActionsManager *)self stopUpdatingActions];
  v3.receiver = self;
  v3.super_class = (Class)CNQuickActionsManager;
  [(CNQuickActionsManager *)&v3 dealloc];
}

- (CNQuickActionsManager)initWithContacts:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CNQuickActionsManager;
  uint64_t v5 = [(CNQuickActionsManager *)&v27 init];
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  updateBlocks = v5->_updateBlocks;
  v5->_updateBlocks = (NSMutableArray *)v6;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v23 + 1) + 8 * v12);
        long long v14 = objc_msgSend((id)objc_opt_class(), "descriptorForRequiredKeys", (void)v23);
        uint64_t v29 = v14;
        long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
        [v13 assertKeysAreAvailable:v15];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v30 count:16];
    }
    while (v10);
  }

  [(CNQuickActionsManager *)v5 setContacts:v8];
  long long v16 = [(CNQuickActionsManager *)v5 contact];

  if (v16)
  {
    uint64_t v17 = *MEMORY[0x1E4F1ADC8];
    v28[0] = *MEMORY[0x1E4F1AEE0];
    v28[1] = v17;
    long long v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
    [(CNQuickActionsManager *)v5 _createGroupsForPropertyKeys:v18];

    uint64_t v19 = [(CNQuickActionsManager *)v5 contact];
    uint64_t v20 = +[CNQuickActionsUsageManager managerForContact:v19];
    usageManager = v5->_usageManager;
    v5->_usageManager = (CNQuickActionsUsageManager *)v20;
  }
  return v5;
}

+ (id)actionsManagerForContacts:(id)a3
{
  id v3 = a3;
  id v4 = [[CNQuickActionsManager alloc] initWithContacts:v3];

  return v4;
}

+ (id)defaultCategories
{
  if (defaultCategories_cn_once_token_4 != -1) {
    dispatch_once(&defaultCategories_cn_once_token_4, &__block_literal_global_9);
  }
  uint64_t v2 = (void *)defaultCategories_cn_once_object_4;

  return v2;
}

void __42__CNQuickActionsManager_defaultCategories__block_invoke()
{
  v2[5] = *MEMORY[0x1E4F143B8];
  v2[0] = CNQuickActionCategoryAudioCall;
  v2[1] = CNQuickActionCategoryInstantMessage;
  v2[2] = CNQuickActionCategoryVideoCall;
  v2[3] = CNQuickActionCategoryMail;
  v2[4] = CNQuickActionCategoryAddToContacts;
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:5];
  uint64_t v1 = (void *)defaultCategories_cn_once_object_4;
  defaultCategories_cn_once_object_4 = v0;
}

+ (BOOL)hasActionsForContact:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3) {
    goto LABEL_7;
  }
  uint64_t v5 = [v3 phoneNumbers];
  if ([v5 count])
  {

    goto LABEL_5;
  }
  uint64_t v6 = [v4 emailAddresses];
  uint64_t v7 = [v6 count];

  if (!v7)
  {
LABEL_7:
    char v10 = 0;
    goto LABEL_9;
  }
LABEL_5:
  id v8 = [v4 phoneNumbers];
  char v9 = objc_msgSend(v8, "_cn_any:", &__block_literal_global_5);

  if (v9)
  {
    char v10 = 1;
  }
  else
  {
    uint64_t v11 = [v4 emailAddresses];
    char v10 = objc_msgSend(v11, "_cn_any:", &__block_literal_global_7);
  }
LABEL_9:

  return v10;
}

uint64_t __46__CNQuickActionsManager_hasActionsForContact___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isSuggested] ^ 1;
}

uint64_t __46__CNQuickActionsManager_hasActionsForContact___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSuggested] ^ 1;
}

@end