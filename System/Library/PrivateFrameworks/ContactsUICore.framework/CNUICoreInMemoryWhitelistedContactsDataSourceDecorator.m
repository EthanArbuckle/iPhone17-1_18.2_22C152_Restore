@interface CNUICoreInMemoryWhitelistedContactsDataSourceDecorator
+ (id)modelBuilderForAddedContacts:(id)a3 withContactTypeAssessor:(id)a4;
+ (id)modelBuilderForContacts:(id)a3 withContactTypeAssessor:(id)a4;
- (BOOL)familyMemberContainerIsEmpty;
- (CNCancelable)endEditingNotificationToken;
- (CNSchedulerProvider)schedulerProvider;
- (CNUICoreContactEditingSession)editingSession;
- (CNUICoreContactStoreFacade)mainContactStore;
- (CNUICoreContactTypeAssessor)contactTypeAssessor;
- (CNUICoreFamilyInfoFetching)familyInfoRetriever;
- (CNUICoreFamilyMemberContactsObserver)observer;
- (CNUICoreFamilyMemberWhitelistedContactsDataSource)dataSource;
- (CNUICoreInMemoryWhitelistedContactsDataSourceDecorator)initWithDataSource:(id)a3 familyInfoRetriever:(id)a4 schedulerProvider:(id)a5;
- (CNUICoreInMemoryWhitelistedContactsDataSourceDecorator)initWithDataSource:(id)a3 schedulerProvider:(id)a4;
- (NSArray)familyMemberContactItems;
- (NSArray)familyMemberContactItemsSnapshot;
- (id)contactRepresentingItem:(id)a3;
- (id)contactTypeAssesor;
- (id)familyMemberContactItemsFromDataSource;
- (id)familyMemberContactItemsFromDataSourceAugmentedWithInMemoryEdits;
- (int64_t)fetchStatus;
- (void)dealloc;
- (void)executeBlockIfEditingSessionNotInProgress:(id)a3;
- (void)familyMemberContactItemsDidChange;
- (void)finishPersistenceOfInMemoryContactsWhitelistState;
- (void)flushEditingSession;
- (void)notifyObserverContactItemsChange;
- (void)persistInMemoryContactsWhitelistState;
- (void)setEditingSession:(id)a3;
- (void)setEndEditingNotificationToken:(id)a3;
- (void)setFamilyMemberContactItemsSnapshot:(id)a3;
- (void)setObserver:(id)a3;
- (void)startEditingSessionIfNecessary;
- (void)startEditingSessionIfNecessaryWithSnapshotOfItems:(id)a3;
- (void)startImplicitEditngSessionForAnyItemsNotPersistedInItems:(id)a3;
- (void)updateWhitelistByAddingContacts:(id)a3;
- (void)updateWhitelistByRemovingContacts:(id)a3;
- (void)updateWhitelistByUpdatingContacts:(id)a3;
@end

@implementation CNUICoreInMemoryWhitelistedContactsDataSourceDecorator

- (CNUICoreInMemoryWhitelistedContactsDataSourceDecorator)initWithDataSource:(id)a3 schedulerProvider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [CNUICoreContactStoreProductionFacade alloc];
  id v9 = objc_alloc_init(MEMORY[0x263EFEA58]);
  v10 = [(CNUICoreContactStoreProductionFacade *)v8 initWithContactStore:v9];

  v11 = [[CNUICoreFamilyInfoRetriever alloc] initWithMainContactStoreFacade:v10 matchFamilyMembersWithContacts:1 schedulerProvider:v6];
  v12 = [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self initWithDataSource:v7 familyInfoRetriever:v11 schedulerProvider:v6];

  return v12;
}

- (CNUICoreInMemoryWhitelistedContactsDataSourceDecorator)initWithDataSource:(id)a3 familyInfoRetriever:(id)a4 schedulerProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9) {
    goto LABEL_5;
  }
  if (CNGuardOSLog_cn_once_token_0_1 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_1, &__block_literal_global_162);
  }
  v12 = CNGuardOSLog_cn_once_object_0_1;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_1, OS_LOG_TYPE_FAULT))
  {
    -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator initWithDataSource:familyInfoRetriever:schedulerProvider:](v12, v13, v14, v15, v16, v17, v18, v19);
    if (v10) {
      goto LABEL_10;
    }
  }
  else
  {
LABEL_5:
    if (v10) {
      goto LABEL_10;
    }
  }
  if (CNGuardOSLog_cn_once_token_0_1 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_1, &__block_literal_global_162);
  }
  v20 = CNGuardOSLog_cn_once_object_0_1;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_1, OS_LOG_TYPE_FAULT)) {
    -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator initWithDataSource:familyInfoRetriever:schedulerProvider:](v20, v21, v22, v23, v24, v25, v26, v27);
  }
LABEL_10:
  if (!v11)
  {
    if (CNGuardOSLog_cn_once_token_0_1 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_1, &__block_literal_global_162);
    }
    v28 = CNGuardOSLog_cn_once_object_0_1;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_1, OS_LOG_TYPE_FAULT)) {
      -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator initWithDataSource:familyInfoRetriever:schedulerProvider:](v28, v29, v30, v31, v32, v33, v34, v35);
    }
  }
  v42.receiver = self;
  v42.super_class = (Class)CNUICoreInMemoryWhitelistedContactsDataSourceDecorator;
  v36 = [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)&v42 init];
  v37 = v36;
  if (v36)
  {
    objc_storeStrong((id *)&v36->_dataSource, a3);
    [(CNUICoreFamilyMemberWhitelistedContactsDataSource *)v37->_dataSource setObserver:v37];
    objc_storeStrong((id *)&v37->_familyInfoRetriever, a4);
    objc_storeStrong((id *)&v37->_schedulerProvider, a5);
    v38 = objc_alloc_init(CNUICoreContactEditingSession);
    editingSession = v37->_editingSession;
    v37->_editingSession = v38;

    v40 = v37;
  }

  return v37;
}

- (void)dealloc
{
  v3 = [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self endEditingNotificationToken];
  [v3 cancel];

  v4.receiver = self;
  v4.super_class = (Class)CNUICoreInMemoryWhitelistedContactsDataSourceDecorator;
  [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)&v4 dealloc];
}

- (id)contactTypeAssesor
{
  v2 = cn_objectResultWithObjectLock();
  return v2;
}

id __76__CNUICoreInMemoryWhitelistedContactsDataSourceDecorator_contactTypeAssesor__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 48);
  if (!v2)
  {
    v3 = [CNUICoreContactTypeAssessor alloc];
    objc_super v4 = [*(id *)(a1 + 32) familyInfoRetriever];
    v5 = [v4 familyInfo];
    uint64_t v6 = [(CNUICoreContactTypeAssessor *)v3 initWithFamilyInfoFuture:v5];
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = *(void **)(v7 + 48);
    *(void *)(v7 + 48) = v6;

    v2 = *(void **)(*(void *)(a1 + 32) + 48);
  }
  return v2;
}

- (void)familyMemberContactItemsDidChange
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __91__CNUICoreInMemoryWhitelistedContactsDataSourceDecorator_familyMemberContactItemsDidChange__block_invoke;
  v2[3] = &unk_264017748;
  v2[4] = self;
  [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self executeBlockIfEditingSessionNotInProgress:v2];
}

uint64_t __91__CNUICoreInMemoryWhitelistedContactsDataSourceDecorator_familyMemberContactItemsDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyObserverContactItemsChange];
}

- (void)notifyObserverContactItemsChange
{
  id v2 = [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self observer];
  [v2 familyMemberContactItemsDidChange];
}

- (void)executeBlockIfEditingSessionNotInProgress:(id)a3
{
  id v7 = a3;
  objc_super v4 = [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self editingSession];
  char v5 = [v4 inProgress];

  uint64_t v6 = v7;
  if (v7 && (v5 & 1) == 0)
  {
    (*((void (**)(id))v7 + 2))(v7);
    uint64_t v6 = v7;
  }
}

- (void)startEditingSessionIfNecessary
{
}

- (void)startEditingSessionIfNecessaryWithSnapshotOfItems:(id)a3
{
  id v6 = a3;
  objc_super v4 = [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self familyMemberContactItemsSnapshot];

  if (!v4)
  {
    if (v6)
    {
      [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self setFamilyMemberContactItemsSnapshot:v6];
    }
    else
    {
      char v5 = [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self familyMemberContactItemsFromDataSource];
      [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self setFamilyMemberContactItemsSnapshot:v5];
    }
  }
}

- (void)flushEditingSession
{
  [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self setFamilyMemberContactItemsSnapshot:0];
  v3 = objc_alloc_init(CNUICoreContactEditingSession);
  [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self setEditingSession:v3];
}

- (BOOL)familyMemberContainerIsEmpty
{
  id v2 = [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self dataSource];
  char v3 = [v2 familyMemberContainerIsEmpty];

  return v3;
}

- (int64_t)fetchStatus
{
  id v2 = [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self dataSource];
  int64_t v3 = [v2 fetchStatus];

  return v3;
}

- (NSArray)familyMemberContactItems
{
  int64_t v3 = [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self editingSession];
  int v4 = [v3 inProgress];

  if (v4) {
    [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self familyMemberContactItemsFromDataSourceAugmentedWithInMemoryEdits];
  }
  else {
  char v5 = [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self familyMemberContactItemsFromDataSource];
  }
  return (NSArray *)v5;
}

- (id)familyMemberContactItemsFromDataSourceAugmentedWithInMemoryEdits
{
  int64_t v3 = objc_opt_class();
  int v4 = [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self editingSession];
  char v5 = [v4 addedContacts];
  id v6 = [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self contactTypeAssesor];
  id v7 = [v3 modelBuilderForAddedContacts:v5 withContactTypeAssessor:v6];
  v8 = [v7 build];

  id v9 = objc_opt_class();
  id v10 = [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self editingSession];
  id v11 = [v10 updatedContacts];
  v12 = [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self contactTypeAssesor];
  uint64_t v13 = [v9 modelBuilderForContacts:v11 withContactTypeAssessor:v12];
  uint64_t v14 = [v13 build];

  uint64_t v15 = [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self editingSession];
  uint64_t v16 = [v15 removedContacts];
  uint64_t v17 = objc_msgSend(v16, "_cn_map:", &__block_literal_global_8);

  uint64_t v18 = [v14 items];
  uint64_t v19 = objc_msgSend(v18, "_cn_indexBy:", &__block_literal_global_17);

  v20 = [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self familyMemberContactItemsSnapshot];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __122__CNUICoreInMemoryWhitelistedContactsDataSourceDecorator_familyMemberContactItemsFromDataSourceAugmentedWithInMemoryEdits__block_invoke;
  v34[3] = &unk_264017770;
  id v35 = v17;
  id v21 = v17;
  uint64_t v22 = objc_msgSend(v20, "_cn_filter:", v34);

  uint64_t v29 = MEMORY[0x263EF8330];
  uint64_t v30 = 3221225472;
  uint64_t v31 = __122__CNUICoreInMemoryWhitelistedContactsDataSourceDecorator_familyMemberContactItemsFromDataSourceAugmentedWithInMemoryEdits__block_invoke_2;
  uint64_t v32 = &unk_264017798;
  id v33 = v19;
  id v23 = v19;
  uint64_t v24 = objc_msgSend(v22, "_cn_map:", &v29);
  uint64_t v25 = objc_msgSend(v8, "items", v29, v30, v31, v32);
  uint64_t v26 = [v24 arrayByAddingObjectsFromArray:v25];

  uint64_t v27 = +[CNUICoreFamilyMemberContactsModelBuilder itemsBySortingItems:v26];

  return v27;
}

uint64_t __122__CNUICoreInMemoryWhitelistedContactsDataSourceDecorator_familyMemberContactItemsFromDataSourceAugmentedWithInMemoryEdits__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  int64_t v3 = [a2 contactIdentifier];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

id __122__CNUICoreInMemoryWhitelistedContactsDataSourceDecorator_familyMemberContactItemsFromDataSourceAugmentedWithInMemoryEdits__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  char v5 = [v3 contactIdentifier];
  id v6 = [v4 objectForKeyedSubscript:v5];
  if (v6)
  {
    id v7 = *(void **)(a1 + 32);
    v8 = [v3 contactIdentifier];
    id v9 = [v7 objectForKeyedSubscript:v8];
  }
  else
  {
    id v9 = v3;
  }

  return v9;
}

- (id)familyMemberContactItemsFromDataSource
{
  id v3 = [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self dataSource];
  uint64_t v4 = [v3 familyMemberContactItems];

  [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self startImplicitEditngSessionForAnyItemsNotPersistedInItems:v4];
  return v4;
}

- (void)startImplicitEditngSessionForAnyItemsNotPersistedInItems:(id)a3
{
  id v4 = a3;
  char v5 = objc_msgSend(v4, "_cn_filter:", &__block_literal_global_19);
  id v6 = objc_msgSend(v4, "_cn_filter:", &__block_literal_global_21);
  if (((*(uint64_t (**)(void))(*MEMORY[0x263F334B0] + 16))() & 1) == 0)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __115__CNUICoreInMemoryWhitelistedContactsDataSourceDecorator_startImplicitEditngSessionForAnyItemsNotPersistedInItems___block_invoke;
    v10[3] = &unk_2640177C0;
    v10[4] = self;
    id v7 = objc_msgSend(v4, "_cn_map:", v10);
    v8 = objc_msgSend(v7, "_cn_filter:", *MEMORY[0x263F334C8]);

    [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self startEditingSessionIfNecessaryWithSnapshotOfItems:v6];
    id v9 = [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self editingSession];
    [v9 addContacts:v8];
  }
}

id __115__CNUICoreInMemoryWhitelistedContactsDataSourceDecorator_startImplicitEditngSessionForAnyItemsNotPersistedInItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 dataSource];
  char v5 = [v4 contactRepresentingItem:v3];

  return v5;
}

- (void)updateWhitelistByAddingContacts:(id)a3
{
  id v4 = a3;
  [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self startEditingSessionIfNecessary];
  char v5 = [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self editingSession];
  [v5 addContacts:v4];

  [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self notifyObserverContactItemsChange];
}

- (void)updateWhitelistByUpdatingContacts:(id)a3
{
  id v4 = a3;
  [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self startEditingSessionIfNecessary];
  char v5 = [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self editingSession];
  [v5 updateContacts:v4];

  [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self notifyObserverContactItemsChange];
}

- (void)updateWhitelistByRemovingContacts:(id)a3
{
  id v4 = a3;
  [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self startEditingSessionIfNecessary];
  char v5 = [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self editingSession];
  [v5 removeContacts:v4];

  [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self notifyObserverContactItemsChange];
}

- (id)contactRepresentingItem:(id)a3
{
  id v4 = a3;
  char v5 = [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self editingSession];
  id v6 = [v5 addedContacts];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __82__CNUICoreInMemoryWhitelistedContactsDataSourceDecorator_contactRepresentingItem___block_invoke;
  v22[3] = &unk_2640176E0;
  id v7 = v4;
  id v23 = v7;
  v8 = objc_msgSend(v6, "_cn_firstObjectPassingTest:", v22);

  id v9 = [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self editingSession];
  id v10 = [v9 updatedContacts];
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __82__CNUICoreInMemoryWhitelistedContactsDataSourceDecorator_contactRepresentingItem___block_invoke_2;
  v20 = &unk_2640176E0;
  id v11 = v7;
  id v21 = v11;
  v12 = objc_msgSend(v10, "_cn_firstObjectPassingTest:", &v17);

  if (v8)
  {
    id v13 = v8;
LABEL_5:
    uint64_t v14 = v13;
    goto LABEL_6;
  }
  if (v12)
  {
    id v13 = v12;
    goto LABEL_5;
  }
  uint64_t v16 = [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self dataSource];
  uint64_t v14 = [v16 contactRepresentingItem:v11];

LABEL_6:
  return v14;
}

uint64_t __82__CNUICoreInMemoryWhitelistedContactsDataSourceDecorator_contactRepresentingItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  id v4 = [*(id *)(a1 + 32) contactIdentifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

uint64_t __82__CNUICoreInMemoryWhitelistedContactsDataSourceDecorator_contactRepresentingItem___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  id v4 = [*(id *)(a1 + 32) contactIdentifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (void)persistInMemoryContactsWhitelistState
{
  id v16 = [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self editingSession];
  if ([v16 inProgress])
  {
    id v3 = [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self endEditingNotificationToken];

    if (!v3)
    {
      id v4 = [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self dataSource];
      uint64_t v5 = [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self editingSession];
      id v6 = [v5 addedContacts];
      [v4 updateWhitelistByAddingContacts:v6];

      id v7 = [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self dataSource];
      v8 = [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self editingSession];
      id v9 = [v8 updatedContacts];
      [v7 updateWhitelistByUpdatingContacts:v9];

      id v10 = [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self dataSource];
      id v11 = [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self editingSession];
      v12 = [v11 removedContacts];
      [v10 updateWhitelistByRemovingContacts:v12];

      objc_initWeak(&location, self);
      id v13 = [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self schedulerProvider];
      uint64_t v14 = [v13 mainThreadScheduler];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __95__CNUICoreInMemoryWhitelistedContactsDataSourceDecorator_persistInMemoryContactsWhitelistState__block_invoke;
      v17[3] = &unk_2640177E8;
      objc_copyWeak(&v18, &location);
      uint64_t v15 = [v14 afterDelay:v17 performBlock:2.5];
      [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self setEndEditingNotificationToken:v15];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
  }
  else
  {
  }
}

void __95__CNUICoreInMemoryWhitelistedContactsDataSourceDecorator_persistInMemoryContactsWhitelistState__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)MEMORY[0x210538660]();
  [WeakRetained finishPersistenceOfInMemoryContactsWhitelistState];
}

- (void)finishPersistenceOfInMemoryContactsWhitelistState
{
  [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self flushEditingSession];
  [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self notifyObserverContactItemsChange];
  [(CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)self setEndEditingNotificationToken:0];
}

+ (id)modelBuilderForAddedContacts:(id)a3 withContactTypeAssessor:(id)a4
{
  id v4 = [a1 modelBuilderForContacts:a3 withContactTypeAssessor:a4];
  [v4 setMarkItemsAsPersisted:0];
  return v4;
}

+ (id)modelBuilderForContacts:(id)a3 withContactTypeAssessor:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(CNUICoreFamilyMemberContactsModelBuilder);
  [(CNUICoreFamilyMemberContactsModelBuilder *)v7 setContacts:v6];

  [(CNUICoreFamilyMemberContactsModelBuilder *)v7 setContactTypeAssessor:v5];
  [(CNUICoreFamilyMemberContactsModelBuilder *)v7 setContactFormatterStyle:+[CNUICoreFamilyMemberContactsModelRetriever contactFormatterStyle]];
  [(CNUICoreFamilyMemberContactsModelBuilder *)v7 setSortItemsByName:1];
  return v7;
}

- (CNUICoreFamilyMemberContactsObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (CNUICoreFamilyMemberContactsObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (CNUICoreFamilyMemberWhitelistedContactsDataSource)dataSource
{
  return self->_dataSource;
}

- (CNUICoreContactStoreFacade)mainContactStore
{
  return self->_mainContactStore;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (CNUICoreFamilyInfoFetching)familyInfoRetriever
{
  return self->_familyInfoRetriever;
}

- (CNUICoreContactTypeAssessor)contactTypeAssessor
{
  return self->_contactTypeAssessor;
}

- (CNUICoreContactEditingSession)editingSession
{
  return self->_editingSession;
}

- (void)setEditingSession:(id)a3
{
}

- (NSArray)familyMemberContactItemsSnapshot
{
  return self->_familyMemberContactItemsSnapshot;
}

- (void)setFamilyMemberContactItemsSnapshot:(id)a3
{
}

- (CNCancelable)endEditingNotificationToken
{
  return self->_endEditingNotificationToken;
}

- (void)setEndEditingNotificationToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endEditingNotificationToken, 0);
  objc_storeStrong((id *)&self->_familyMemberContactItemsSnapshot, 0);
  objc_storeStrong((id *)&self->_editingSession, 0);
  objc_storeStrong((id *)&self->_contactTypeAssessor, 0);
  objc_storeStrong((id *)&self->_familyInfoRetriever, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_mainContactStore, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_observer);
}

- (void)initWithDataSource:(uint64_t)a3 familyInfoRetriever:(uint64_t)a4 schedulerProvider:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDataSource:(uint64_t)a3 familyInfoRetriever:(uint64_t)a4 schedulerProvider:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDataSource:(uint64_t)a3 familyInfoRetriever:(uint64_t)a4 schedulerProvider:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end