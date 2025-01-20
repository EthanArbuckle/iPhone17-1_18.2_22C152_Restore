@interface IAMStorageCoordinator
+ (id)_propertyNameForGlobalPresentationPolicyGroupLastDisplayTime:(int)a3;
- (IAMICStorageProvider)iTunesCloudStorageProvider;
- (IAMStorageCoordinator)initWithMessageEntryProvider:(id)a3 messageMetadataStorage:(id)a4 propertyStorage:(id)a5 messageBundleIdentifiers:(id)a6;
- (IAMStorageCoordinatorDelegate)delegate;
- (void)_fetchLastDisplayTimeForGlobalPresentationPolicyGroup:(int)a3 completion:(id)a4;
- (void)_fetchMessageEntries:(id)a3;
- (void)_fetchMessagesMetadata:(id)a3;
- (void)_updateLastDisplayTime:(id)a3 forGlobalPresentationPolicyGroup:(int)a4;
- (void)downloadResourcesForMessageEntry:(id)a3 completion:(id)a4;
- (void)fetchGlobalPresentationPolicyGroupDisplayTimes:(id)a3;
- (void)fetchMessagesEntriesAndMetadata:(id)a3;
- (void)messageEntriesDidChange:(id)a3;
- (void)removeApplicationBadgeFromMessageEntry:(id)a3 completion:(id)a4;
- (void)removeMessageEntry:(id)a3 completion:(id)a4;
- (void)reportEventForMessageIdentifier:(id)a3 withParams:(id)a4 completion:(id)a5;
- (void)setDelegate:(id)a3;
- (void)updateLastDisplayTimeGlobalPresentationPolicyGroupNormal:(id)a3;
- (void)updateLastDisplayTimeGlobalPresentationPolicyGroupRestricted:(id)a3;
- (void)updateMetadata:(id)a3 forMessageEntry:(id)a4 completion:(id)a5;
@end

@implementation IAMStorageCoordinator

- (IAMStorageCoordinator)initWithMessageEntryProvider:(id)a3 messageMetadataStorage:(id)a4 propertyStorage:(id)a5 messageBundleIdentifiers:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)IAMStorageCoordinator;
  v14 = [(IAMStorageCoordinator *)&v25 init];
  v15 = v14;
  if (v14)
  {
    if (v10)
    {
      p_messageEntryProvider = (id *)&v14->_messageEntryProvider;
      objc_storeWeak((id *)&v14->_messageEntryProvider, v10);
    }
    else
    {
      v17 = [(IAMStorageCoordinator *)v14 iTunesCloudStorageProvider];
      v18 = [v17 messageEntryProvider];
      p_messageEntryProvider = (id *)&v15->_messageEntryProvider;
      objc_storeWeak((id *)&v15->_messageEntryProvider, v18);
    }
    id WeakRetained = objc_loadWeakRetained(p_messageEntryProvider);
    [WeakRetained setDelegate:v15];

    if (v11)
    {
      objc_storeWeak((id *)&v15->_messageMetadataStorage, v11);
      if (v12)
      {
LABEL_7:
        objc_storeWeak((id *)&v15->_propertyStorage, v12);
LABEL_10:
        objc_storeStrong((id *)&v15->_messageBundleIdentifiers, a6);
        goto LABEL_11;
      }
    }
    else
    {
      v20 = [(IAMStorageCoordinator *)v15 iTunesCloudStorageProvider];
      v21 = [v20 messageMetadataStorage];
      objc_storeWeak((id *)&v15->_messageMetadataStorage, v21);

      if (v12) {
        goto LABEL_7;
      }
    }
    v22 = [(IAMStorageCoordinator *)v15 iTunesCloudStorageProvider];
    v23 = [v22 propertyStorage];
    objc_storeWeak((id *)&v15->_propertyStorage, v23);

    goto LABEL_10;
  }
LABEL_11:

  return v15;
}

- (IAMICStorageProvider)iTunesCloudStorageProvider
{
  iTunesCloudStorageProvider = self->_iTunesCloudStorageProvider;
  if (!iTunesCloudStorageProvider)
  {
    v4 = objc_alloc_init(IAMICStorageProvider);
    v5 = self->_iTunesCloudStorageProvider;
    self->_iTunesCloudStorageProvider = v4;

    iTunesCloudStorageProvider = self->_iTunesCloudStorageProvider;
  }

  return iTunesCloudStorageProvider;
}

- (void)fetchMessagesEntriesAndMetadata:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__IAMStorageCoordinator_fetchMessagesEntriesAndMetadata___block_invoke;
  v6[3] = &unk_264342128;
  id v5 = v4;
  id v7 = v5;
  objc_copyWeak(&v8, &location);
  [(IAMStorageCoordinator *)self _fetchMessageEntries:v6];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

- (void)fetchGlobalPresentationPolicyGroupDisplayTimes:(id)a3
{
  id v4 = a3;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__1;
  v29[4] = __Block_byref_object_dispose__1;
  id v30 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2810000000;
  v27[3] = "";
  int v28 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  char v26 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__1;
  v23[4] = __Block_byref_object_dispose__1;
  id v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  char v22 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__1;
  v19[4] = __Block_byref_object_dispose__1;
  id v20 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__3;
  v17[4] = __Block_byref_object_dispose__4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__IAMStorageCoordinator_fetchGlobalPresentationPolicyGroupDisplayTimes___block_invoke;
  v10[3] = &unk_264341F00;
  id v12 = v29;
  id v5 = v4;
  id v11 = v5;
  id v13 = v25;
  v14 = v21;
  v15 = v23;
  v16 = v19;
  id v18 = (id)MEMORY[0x21D475810](v10);
  v6 = IAMLogCategoryDefault();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188AF000, v6, OS_LOG_TYPE_DEFAULT, "Fetching last display times for global presentation policy groups.", buf, 2u);
  }

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __72__IAMStorageCoordinator_fetchGlobalPresentationPolicyGroupDisplayTimes___block_invoke_5;
  v8[3] = &unk_264342178;
  v8[4] = v27;
  v8[5] = v17;
  v8[6] = v23;
  v8[7] = v25;
  [(IAMStorageCoordinator *)self _fetchLastDisplayTimeForGlobalPresentationPolicyGroup:0 completion:v8];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__IAMStorageCoordinator_fetchGlobalPresentationPolicyGroupDisplayTimes___block_invoke_2;
  v7[3] = &unk_264342178;
  v7[4] = v27;
  v7[5] = v17;
  v7[6] = v19;
  v7[7] = v21;
  [(IAMStorageCoordinator *)self _fetchLastDisplayTimeForGlobalPresentationPolicyGroup:1 completion:v7];
  _Block_object_dispose(v17, 8);

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v29, 8);
}

- (void)_fetchLastDisplayTimeForGlobalPresentationPolicyGroup:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = +[IAMStorageCoordinator _propertyNameForGlobalPresentationPolicyGroupLastDisplayTime:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_propertyStorage);
  v9 = [MEMORY[0x263F086E0] mainBundle];
  id v10 = [v9 bundleIdentifier];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __90__IAMStorageCoordinator__fetchLastDisplayTimeForGlobalPresentationPolicyGroup_completion___block_invoke;
  v13[3] = &unk_264342218;
  id v14 = v7;
  id v15 = v6;
  id v11 = v7;
  id v12 = v6;
  [WeakRetained getPropertyForKey:v11 bundleIdentifier:v10 completion:v13];
}

+ (id)_propertyNameForGlobalPresentationPolicyGroupLastDisplayTime:(int)a3
{
  if (a3 == 1) {
    return @"LastDisplayTime_GlobalPresentationPolicyGroup_Restricted";
  }
  else {
    return @"LastDisplayTime_GlobalPresentationPolicyGroup_Normal";
  }
}

- (void)_fetchMessageEntries:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = self->_messageBundleIdentifiers;
  id v6 = IAMLogCategoryDefault();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = v5;
    _os_log_impl(&dword_2188AF000, v6, OS_LOG_TYPE_DEFAULT, "Fetching message entries with bundle identifiers = %{public}@", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageEntryProvider);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__IAMStorageCoordinator__fetchMessageEntries___block_invoke;
  v9[3] = &unk_2643421C8;
  id v10 = v4;
  id v8 = v4;
  [WeakRetained messageEntriesForBundleIdentifiers:v5 completion:v9];
}

void __90__IAMStorageCoordinator__fetchLastDisplayTimeForGlobalPresentationPolicyGroup_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = IAMLogCategoryDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v10 = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2114;
      id v13 = v6;
      _os_log_impl(&dword_2188AF000, v7, OS_LOG_TYPE_ERROR, "Error fetching last display time for global presentation policy group = %{public}@ :\n %{public}@", (uint8_t *)&v10, 0x16u);
    }

    v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v9();
}

void __72__IAMStorageCoordinator_fetchGlobalPresentationPolicyGroupDisplayTimes___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1[4] + 8) + 32));
  if (!v6)
  {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  }
  (*(void (**)(void))(*(void *)(*(void *)(a1[5] + 8) + 40) + 16))();
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1[4] + 8) + 32));
}

uint64_t __72__IAMStorageCoordinator_fetchGlobalPresentationPolicyGroupDisplayTimes___block_invoke(void *a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(a1[5] + 8);
  uint64_t v7 = *(void *)(v5 + 40);
  id v6 = (id *)(v5 + 40);
  if (!v7)
  {
    if (v4)
    {
      objc_storeStrong(v6, a2);
      uint64_t v8 = *(uint64_t (**)(void))(a1[4] + 16);
LABEL_7:
      id v6 = (id *)v8();
      goto LABEL_8;
    }
    if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24) && *(unsigned char *)(*(void *)(a1[7] + 8) + 24))
    {
      uint64_t v8 = *(uint64_t (**)(void))(a1[4] + 16);
      goto LABEL_7;
    }
  }
LABEL_8:

  return MEMORY[0x270F9A828](v6);
}

void __72__IAMStorageCoordinator_fetchGlobalPresentationPolicyGroupDisplayTimes___block_invoke_5(void *a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1[4] + 8) + 32));
  if (!v6)
  {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  }
  (*(void (**)(void))(*(void *)(*(void *)(a1[5] + 8) + 40) + 16))();
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1[4] + 8) + 32));
}

- (void)setDelegate:(id)a3
{
}

void __46__IAMStorageCoordinator__fetchMessageEntries___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = IAMLogCategoryDefault();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543362;
      uint64_t v10 = (uint64_t)v6;
      _os_log_impl(&dword_2188AF000, v8, OS_LOG_TYPE_ERROR, "Error fetching message entries. %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    uint64_t v10 = [v5 count];
    _os_log_impl(&dword_2188AF000, v8, OS_LOG_TYPE_DEFAULT, "Received %lu message entries from storage.", (uint8_t *)&v9, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __57__IAMStorageCoordinator_fetchMessagesEntriesAndMetadata___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_9:
    v7();
    goto LABEL_10;
  }
  if (!v5 || ![v5 count])
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_9;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __57__IAMStorageCoordinator_fetchMessagesEntriesAndMetadata___block_invoke_2;
    v9[3] = &unk_264342100;
    id v11 = *(id *)(a1 + 32);
    id v10 = v5;
    [WeakRetained _fetchMessagesMetadata:v9];
  }
LABEL_10:
}

uint64_t __57__IAMStorageCoordinator_fetchMessagesEntriesAndMetadata___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 40);
  if (a3) {
    a2 = 0;
  }
  return (*(uint64_t (**)(uint64_t, void, uint64_t))(v6 + 16))(v6, *(void *)(a1 + 32), a2);
}

- (void)downloadResourcesForMessageEntry:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = IAMLogCategoryDefault();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [v6 applicationMessage];
    id v10 = [v9 identifier];
    *(_DWORD *)buf = 138543362;
    v21 = v10;
    _os_log_impl(&dword_2188AF000, v8, OS_LOG_TYPE_DEFAULT, "Asking storage to download resources for message with identifier = %{public}@", buf, 0xCu);
  }
  id v11 = [v6 applicationMessage];
  __int16 v12 = [v11 identifier];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageEntryProvider);
  uint64_t v14 = [v6 bundleIdentifier];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __69__IAMStorageCoordinator_downloadResourcesForMessageEntry_completion___block_invoke;
  v17[3] = &unk_264342150;
  id v18 = v12;
  id v19 = v7;
  id v15 = v7;
  id v16 = v12;
  [WeakRetained downloadResourcesForMessageWithIdentifier:v16 bundleIdentifier:v14 completion:v17];
}

void __69__IAMStorageCoordinator_downloadResourcesForMessageEntry_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = IAMLogCategoryDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v9 = 138543618;
      uint64_t v10 = v5;
      __int16 v11 = 2114;
      id v12 = v3;
      _os_log_impl(&dword_2188AF000, v4, OS_LOG_TYPE_ERROR, "Error downloading message resources for message with identifier = %{public}@ :\n %{public}@", (uint8_t *)&v9, 0x16u);
    }

    uint64_t v6 = *(void *)(a1 + 40);
    if (v6)
    {
      id v7 = *(void (**)(void))(v6 + 16);
LABEL_8:
      v7();
    }
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8)
    {
      id v7 = *(void (**)(void))(v8 + 16);
      goto LABEL_8;
    }
  }
}

- (void)removeMessageEntry:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 applicationMessage];
  int v9 = [v8 identifier];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageEntryProvider);
  __int16 v11 = [v7 bundleIdentifier];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __55__IAMStorageCoordinator_removeMessageEntry_completion___block_invoke;
  v14[3] = &unk_264342150;
  id v15 = v9;
  id v16 = v6;
  id v12 = v6;
  id v13 = v9;
  [WeakRetained removeMessageEntryWithIdentifier:v13 forBundleIdentifier:v11 completion:v14];
}

void __55__IAMStorageCoordinator_removeMessageEntry_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = IAMLogCategoryDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v9 = 138543362;
      uint64_t v10 = v5;
      _os_log_impl(&dword_2188AF000, v4, OS_LOG_TYPE_ERROR, "Error while removing message locally with identifier = %{public}@", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v6 = *(void *)(a1 + 40);
    if (v6)
    {
      id v7 = *(void (**)(void))(v6 + 16);
LABEL_8:
      v7();
    }
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8)
    {
      id v7 = *(void (**)(void))(v8 + 16);
      goto LABEL_8;
    }
  }
}

- (void)reportEventForMessageIdentifier:(id)a3 withParams:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageEntryProvider);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __79__IAMStorageCoordinator_reportEventForMessageIdentifier_withParams_completion___block_invoke;
  v12[3] = &unk_264342150;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [WeakRetained reportEventForMessageIdentifier:v11 withParams:MEMORY[0x263EFFA78] completion:v12];
}

void __79__IAMStorageCoordinator_reportEventForMessageIdentifier_withParams_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = IAMLogCategoryDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v9 = 138543362;
      uint64_t v10 = v5;
      _os_log_impl(&dword_2188AF000, v4, OS_LOG_TYPE_ERROR, "Error while removing message globally with identifier = %{public}@", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v6 = *(void *)(a1 + 40);
    if (v6)
    {
      id v7 = *(void (**)(void))(v6 + 16);
LABEL_8:
      v7();
    }
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8)
    {
      id v7 = *(void (**)(void))(v8 + 16);
      goto LABEL_8;
    }
  }
}

- (void)updateMetadata:(id)a3 forMessageEntry:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v9 applicationMessage];
  id v12 = [v11 identifier];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageMetadataStorage);
  id v14 = [v9 bundleIdentifier];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __67__IAMStorageCoordinator_updateMetadata_forMessageEntry_completion___block_invoke;
  v17[3] = &unk_264342150;
  id v18 = v12;
  id v19 = v8;
  id v15 = v8;
  id v16 = v12;
  [WeakRetained updateMetadata:v10 messageIdentifier:v16 bundleIdentifier:v14 completion:v17];
}

void __67__IAMStorageCoordinator_updateMetadata_forMessageEntry_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = IAMLogCategoryDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v9 = 138543618;
      uint64_t v10 = v5;
      __int16 v11 = 2114;
      id v12 = v3;
      _os_log_impl(&dword_2188AF000, v4, OS_LOG_TYPE_ERROR, "Error updating metadata for message entry with identifier = %{public}@ :\n %{public}@", (uint8_t *)&v9, 0x16u);
    }

    uint64_t v6 = *(void *)(a1 + 40);
    if (v6)
    {
      id v7 = *(void (**)(void))(v6 + 16);
LABEL_8:
      v7();
    }
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8)
    {
      id v7 = *(void (**)(void))(v8 + 16);
      goto LABEL_8;
    }
  }
}

- (void)updateLastDisplayTimeGlobalPresentationPolicyGroupNormal:(id)a3
{
}

- (void)updateLastDisplayTimeGlobalPresentationPolicyGroupRestricted:(id)a3
{
}

- (void)removeApplicationBadgeFromMessageEntry:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageEntryProvider);
  int v9 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v10 = [v9 bundleIdentifier];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __75__IAMStorageCoordinator_removeApplicationBadgeFromMessageEntry_completion___block_invoke;
  v12[3] = &unk_2643421A0;
  id v13 = v6;
  id v11 = v6;
  [WeakRetained removeApplicationBadgeForBundleIdentifier:v10 fromPresentedMessageEntry:v7 completion:v12];
}

uint64_t __75__IAMStorageCoordinator_removeApplicationBadgeFromMessageEntry_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)messageEntriesDidChange:(id)a3
{
  uint64_t v4 = [(IAMStorageCoordinator *)self delegate];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    id v6 = [(IAMStorageCoordinator *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(IAMStorageCoordinator *)self delegate];
      [v8 storageCoordinatorMessageEntriesChanged:self];
    }
  }
}

- (void)_fetchMessagesMetadata:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = self->_messageBundleIdentifiers;
  id v6 = IAMLogCategoryDefault();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = v5;
    _os_log_impl(&dword_2188AF000, v6, OS_LOG_TYPE_DEFAULT, "Fetching metadata for message with bundle identifiers = %{public}@", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageMetadataStorage);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__IAMStorageCoordinator__fetchMessagesMetadata___block_invoke;
  v9[3] = &unk_2643421F0;
  id v10 = v4;
  id v8 = v4;
  [WeakRetained metadataForBundleIdentifiers:v5 completion:v9];
}

void __48__IAMStorageCoordinator__fetchMessagesMetadata___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  char v7 = IAMLogCategoryDefault();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543362;
      uint64_t v10 = (uint64_t)v6;
      _os_log_impl(&dword_2188AF000, v8, OS_LOG_TYPE_ERROR, "Error fetching metadata for all messages. %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    uint64_t v10 = [v5 count];
    _os_log_impl(&dword_2188AF000, v8, OS_LOG_TYPE_DEFAULT, "Received %lu metadata entries for messages from storage.", (uint8_t *)&v9, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_updateLastDisplayTime:(id)a3 forGlobalPresentationPolicyGroup:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  char v7 = +[IAMStorageCoordinator _propertyNameForGlobalPresentationPolicyGroupLastDisplayTime:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_propertyStorage);
  int v9 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v10 = [v9 bundleIdentifier];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __81__IAMStorageCoordinator__updateLastDisplayTime_forGlobalPresentationPolicyGroup___block_invoke;
  v12[3] = &unk_264341C30;
  id v13 = v7;
  id v11 = v7;
  [WeakRetained setProperty:v6 forKey:v11 bundleIdentifier:v10 completion:v12];
}

void __81__IAMStorageCoordinator__updateLastDisplayTime_forGlobalPresentationPolicyGroup___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = IAMLogCategoryDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138543618;
      uint64_t v7 = v5;
      __int16 v8 = 2114;
      id v9 = v3;
      _os_log_impl(&dword_2188AF000, v4, OS_LOG_TYPE_ERROR, "Error storing last display time for global presentation policy group = %{public}@ :\n %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (IAMStorageCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IAMStorageCoordinatorDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_iTunesCloudStorageProvider, 0);
  objc_storeStrong((id *)&self->_messageBundleIdentifiers, 0);
  objc_destroyWeak((id *)&self->_propertyStorage);
  objc_destroyWeak((id *)&self->_messageMetadataStorage);

  objc_destroyWeak((id *)&self->_messageEntryProvider);
}

@end