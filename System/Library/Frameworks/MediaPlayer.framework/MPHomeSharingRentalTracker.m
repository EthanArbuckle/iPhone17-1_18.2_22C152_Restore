@interface MPHomeSharingRentalTracker
+ (id)sharedInstance;
- (id)_init;
- (void)_saveRentals;
- (void)addRentalWithItemID:(unint64_t)a3 databaseID:(id)a4;
- (void)removeAllRentalsForDatabaseID:(id)a3;
- (void)removeRentalWithItemID:(unint64_t)a3;
@end

@implementation MPHomeSharingRentalTracker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rentals, 0);

  objc_storeStrong((id *)&self->_rentalTrackerQueue, 0);
}

- (void)_saveRentals
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(id)CPSharedResourcesDirectory() stringByAppendingPathComponent:@"Media/HomeSharingRentals.plist"];
    int v7 = 138543362;
    v8 = v4;
    _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingRentalTracker] Saving rentals to %{public}@", (uint8_t *)&v7, 0xCu);
  }
  rentals = self->_rentals;
  v6 = [(id)CPSharedResourcesDirectory() stringByAppendingPathComponent:@"Media/HomeSharingRentals.plist"];
  [(NSMutableDictionary *)rentals writeToFile:v6 atomically:1];
}

- (void)removeAllRentalsForDatabaseID:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingRentalTracker] Removing all rentals for database ID: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__35705;
  v24 = __Block_byref_object_dispose__35706;
  id v25 = 0;
  rentalTrackerQueue = self->_rentalTrackerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__MPHomeSharingRentalTracker_removeAllRentalsForDatabaseID___block_invoke;
  block[3] = &unk_1E57F9F20;
  block[4] = self;
  block[5] = &buf;
  dispatch_sync(rentalTrackerQueue, block);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = [*(id *)(*((void *)&buf + 1) + 40) allKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = [*(id *)(*((void *)&buf + 1) + 40) objectForKey:v10];
        v12 = [v11 objectForKey:@"databaseID"];
        int v13 = [v12 isEqual:v3];

        if (v13) {
          -[MPHomeSharingRentalTracker removeRentalWithItemID:](self, "removeRentalWithItemID:", [v10 longLongValue]);
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v7);
  }

  _Block_object_dispose(&buf, 8);
}

void __60__MPHomeSharingRentalTracker_removeAllRentalsForDatabaseID___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)removeRentalWithItemID:(unint64_t)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"MPHomeSharingRentalTracker.m" lineNumber:75 description:@"attempted to remove rental with no item ID"];
  }
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", a3);
  v6 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingRentalTracker] Removing rental with item ID: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__35705;
  v46 = __Block_byref_object_dispose__35706;
  id v47 = 0;
  rentalTrackerQueue = self->_rentalTrackerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__MPHomeSharingRentalTracker_removeRentalWithItemID___block_invoke;
  block[3] = &unk_1E57F9F48;
  p_long long buf = &buf;
  block[4] = self;
  id v24 = v5;
  id v35 = v24;
  dispatch_sync(rentalTrackerQueue, block);
  uint64_t v8 = *(void **)(*((void *)&buf + 1) + 40);
  if (v8)
  {
    uint64_t v9 = [v8 objectForKey:@"databaseID"];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v10 = +[MPMediaLibrary mediaLibraries];
    v11 = (void *)[v10 countByEnumeratingWithState:&v30 objects:v42 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v31;
LABEL_8:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = *(void **)(*((void *)&v30 + 1) + 8 * v13);
        long long v15 = [v14 uniqueIdentifier];
        int v16 = [v15 isEqual:v9];

        if (v16) {
          break;
        }
        if (v11 == (void *)++v13)
        {
          v11 = (void *)[v10 countByEnumeratingWithState:&v30 objects:v42 count:16];
          if (v11) {
            goto LABEL_8;
          }
          goto LABEL_14;
        }
      }
      long long v17 = [v14 itemWithPersistentID:a3];
      v11 = [v14 libraryDataProvider];

      if (!v17) {
        goto LABEL_23;
      }
      v10 = [v17 valueForProperty:@"storeAccountID"];
      long long v18 = [v17 valueForProperty:@"storeRentalID"];
      if ([v10 unsignedLongLongValue] && objc_msgSend(v18, "unsignedLongLongValue"))
      {
        uint64_t v38 = 0;
        v39 = &v38;
        uint64_t v40 = 0x2050000000;
        v19 = (void *)getSSRentalCheckinRequestClass_softClass;
        uint64_t v41 = getSSRentalCheckinRequestClass_softClass;
        if (!getSSRentalCheckinRequestClass_softClass)
        {
          v37[0] = MEMORY[0x1E4F143A8];
          v37[1] = 3221225472;
          v37[2] = __getSSRentalCheckinRequestClass_block_invoke;
          v37[3] = &unk_1E57FA300;
          v37[4] = &v38;
          __getSSRentalCheckinRequestClass_block_invoke((uint64_t)v37);
          v19 = (void *)v39[3];
        }
        v20 = v19;
        _Block_object_dispose(&v38, 8);
        v21 = (void *)[[v20 alloc] initWithAccountIdentifier:v10 rentalKeyIdentifier:v18];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __53__MPHomeSharingRentalTracker_removeRentalWithItemID___block_invoke_2;
        v25[3] = &unk_1E57FA060;
        id v26 = v11;
        id v27 = v17;
        v28 = self;
        id v29 = v24;
        [v21 startWithCompletionBlock:v25];
      }
    }
    else
    {
LABEL_14:
      long long v17 = 0;
    }

LABEL_23:
  }

  _Block_object_dispose(&buf, 8);
}

void __53__MPHomeSharingRentalTracker_removeRentalWithItemID___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __53__MPHomeSharingRentalTracker_removeRentalWithItemID___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_ERROR, "Failed to checkin rental to iTunes Store.", v7, 2u);
    }
  }
  else
  {
    uint64_t v2 = [*(id *)(a1 + 32) homeSharingLibrary];
    v4 = [*(id *)(a1 + 40) valueForProperty:@"homeSharingID"];
    v5 = objc_msgSend(MEMORY[0x1E4F6A360], "requestWithDatabaseID:itemID:", -[NSObject databaseID](v2, "databaseID"), objc_msgSend(v4, "unsignedLongLongValue"));
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __53__MPHomeSharingRentalTracker_removeRentalWithItemID___block_invoke_3;
    v8[3] = &unk_1E57F54F0;
    v6 = *(void **)(a1 + 56);
    v8[4] = *(void *)(a1 + 48);
    id v9 = v6;
    [v2 sendRequest:v5 withResponseHandler:v8];
  }
}

void __53__MPHomeSharingRentalTracker_removeRentalWithItemID___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    uint64_t v12 = (uint64_t)v3;
    _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingRentalTracker] iTunes rental checkout response: %{public}@", buf, 0xCu);
  }

  if ((unint64_t)[v3 responseCode] > 0x12B)
  {
    uint64_t v7 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [v3 responseCode];
      *(_DWORD *)long long buf = 134217984;
      uint64_t v12 = v8;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_ERROR, "Failed iTunes side checkout request (response code = %lu)", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(NSObject **)(v5 + 8);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53__MPHomeSharingRentalTracker_removeRentalWithItemID___block_invoke_24;
    v9[3] = &unk_1E57F9F98;
    v9[4] = v5;
    id v10 = *(id *)(a1 + 40);
    dispatch_sync(v6, v9);
  }
}

uint64_t __53__MPHomeSharingRentalTracker_removeRentalWithItemID___block_invoke_24(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _saveRentals];
}

- (void)addRentalWithItemID:(unint64_t)a3 databaseID:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = v7;
  if (!a3 || !v7)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"MPHomeSharingRentalTracker.m", 62, @"attempted to add rental with item ID: %llu, databaseID: %@", a3, v8 object file lineNumber description];
  }
  id v9 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218242;
    unint64_t v18 = a3;
    __int16 v19 = 2114;
    v20 = v8;
    _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingRentalTracker] Adding rental with item ID: %llu, database ID: %{public}@", buf, 0x16u);
  }

  rentalTrackerQueue = self->_rentalTrackerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__MPHomeSharingRentalTracker_addRentalWithItemID_databaseID___block_invoke;
  block[3] = &unk_1E57F9250;
  id v14 = v8;
  long long v15 = self;
  unint64_t v16 = a3;
  id v11 = v8;
  dispatch_sync(rentalTrackerQueue, block);
}

void __61__MPHomeSharingRentalTracker_addRentalWithItemID_databaseID___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  v6 = @"databaseID";
  v7[0] = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  v4 = *(void **)(*(void *)(a1 + 40) + 16);
  uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", *(void *)(a1 + 48));
  [v4 setObject:v3 forKey:v5];

  [*(id *)(a1 + 40) _saveRentals];
}

- (id)_init
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)MPHomeSharingRentalTracker;
  uint64_t v2 = [(MPHomeSharingRentalTracker *)&v15 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.mobileipod.home-sharing-rental-tracker", 0);
    rentalTrackerQueue = v2->_rentalTrackerQueue;
    v2->_rentalTrackerQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(id)CPSharedResourcesDirectory() stringByAppendingPathComponent:@"Media/HomeSharingRentals.plist"];
      *(_DWORD *)long long buf = 138543362;
      long long v17 = v6;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingRentalTracker] Loading rentals from %{public}@", buf, 0xCu);
    }
    id v7 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v8 = [(id)CPSharedResourcesDirectory() stringByAppendingPathComponent:@"Media/HomeSharingRentals.plist"];
    id v9 = [v7 dictionaryWithContentsOfFile:v8];
    id v10 = (void *)[v9 mutableCopy];
    id v11 = v10;
    if (v10) {
      uint64_t v12 = v10;
    }
    else {
      uint64_t v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    rentals = v2->_rentals;
    v2->_rentals = v12;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance___once != -1) {
    dispatch_once(&sharedInstance___once, &__block_literal_global_35749);
  }
  uint64_t v2 = (void *)sharedInstance___sharedInstance;

  return v2;
}

void __44__MPHomeSharingRentalTracker_sharedInstance__block_invoke()
{
  id v0 = [[MPHomeSharingRentalTracker alloc] _init];
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;
}

@end