@interface MSPSharedTripContactController
- (BOOL)_contactIsActive:(id)a3;
- (BOOL)contactIsActive:(id)a3;
- (MSPSharedTripContactController)initWithSharedTripServer:(id)a3;
- (MSPSharedTripContactControllerDelegate)delegate;
- (MSPSharingRestorationStorage)archivedSharingStorage;
- (NSOrderedSet)activeContactsValues;
- (id)_archivedSharingStorage;
- (unint64_t)_activeCapabilityTypeForContact:(id)a3 serviceName:(id *)a4;
- (unint64_t)activeCapabilityTypeForContact:(id)a3 serviceName:(id *)a4;
- (void)_didStartSharingWithContact:(id)a3 withCapabilityType:(unint64_t)a4 serviceName:(id)a5 error:(id)a6 queue:(id)a7 completion:(id)a8;
- (void)_notifyDelegateContactsChanged;
- (void)_reset;
- (void)_shareWithContactValue:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)_stopAllSharingWithReason:(unint64_t)a3 queue:(id)a4 completion:(id)a5;
- (void)_stopSharingWithContactValue:(id)a3 reason:(unint64_t)a4 queue:(id)a5 completion:(id)a6;
- (void)_updateActiveSharingHandles:(id)a3 serviceNames:(id)a4;
- (void)reset;
- (void)setDelegate:(id)a3;
- (void)shareWithContactValue:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)stopAllSharingWithReason:(unint64_t)a3 queue:(id)a4 completion:(id)a5;
- (void)stopSharingWithContactValue:(id)a3 reason:(unint64_t)a4 queue:(id)a5 completion:(id)a6;
- (void)updateActiveSharingHandles:(id)a3 serviceNames:(id)a4;
@end

@implementation MSPSharedTripContactController

void __74__MSPSharedTripContactController_updateActiveSharingHandles_serviceNames___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _updateActiveSharingHandles:*(void *)(a1 + 32) serviceNames:*(void *)(a1 + 40)];
}

- (void)_updateActiveSharingHandles:(id)a3 serviceNames:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v8 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v6];
  activeHandles = self->_activeHandles;
  unint64_t v10 = v8;
  id v11 = activeHandles;
  if (v10 | (unint64_t)v11)
  {
    v12 = v11;
    char v13 = [(id)v10 isEqual:v11];

    if ((v13 & 1) == 0)
    {
      v14 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        unint64_t v57 = v10;
        _os_log_impl(&dword_1B87E5000, v14, OS_LOG_TYPE_DEFAULT, "[ContactController] updating _activeHandles with: %{private}@", buf, 0xCu);
      }

      objc_storeStrong((id *)&self->_activeHandles, v8);
      objc_storeStrong((id *)&self->_serviceNamesByActiveHandle, a4);
      v41 = self;
      v15 = (void *)[(NSOrderedSet *)self->_activeContacts mutableCopy];
      v16 = (void *)[(id)v10 mutableCopy];
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v17 = v15;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v50 objects:v55 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v51;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v51 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = [*(id *)(*((void *)&v50 + 1) + 8 * i) handleForIDS];
            [v16 removeObject:v22];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v50 objects:v55 count:16];
        }
        while (v19);
      }

      v23 = [MEMORY[0x1E4F64860] sharedPlatform];
      int v24 = [v23 isInternalInstall];

      if (v24)
      {
        id v39 = v7;
        id v40 = v6;
        v25 = MSPSharedTripGetVirtualReceivers(v16);
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v46 objects:v54 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v47;
          do
          {
            for (uint64_t j = 0; j != v27; ++j)
            {
              if (*(void *)v47 != v28) {
                objc_enumerationMutation(v25);
              }
              uint64_t v30 = *(void *)(*((void *)&v46 + 1) + 8 * j);
              v31 = +[MSPSharedTripContact virtualReceiverWithHandle:v30];
              [v17 addObject:v31];

              [v16 removeObject:v30];
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v46 objects:v54 count:16];
          }
          while (v27);
        }

        id v7 = v39;
        id v6 = v40;
      }
      if ([v16 count])
      {
        v32 = [v16 allObjects];
        v33 = +[MSPSharedTripContact contactsFromIDSHandles:v32];
        [v17 addObjectsFromArray:v33];
      }
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __75__MSPSharedTripContactController__updateActiveSharingHandles_serviceNames___block_invoke;
      v44[3] = &unk_1E617DB88;
      id v34 = (id)v10;
      id v45 = v34;
      v35 = [v17 indexesOfObjectsPassingTest:v44];
      [v17 removeObjectsAtIndexes:v35];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __75__MSPSharedTripContactController__updateActiveSharingHandles_serviceNames___block_invoke_2;
      v42[3] = &unk_1E617DBB0;
      id v43 = v34;
      [v17 sortUsingComparator:v42];
      uint64_t v36 = [v17 copy];
      activeContacts = v41->_activeContacts;
      v41->_activeContacts = (NSOrderedSet *)v36;

      v38 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        unint64_t v57 = (unint64_t)v17;
        _os_log_impl(&dword_1B87E5000, v38, OS_LOG_TYPE_DEFAULT, "[ContactController] activeContacts is now: %{private}@", buf, 0xCu);
      }

      [(MSPSharedTripContactController *)v41 _notifyDelegateContactsChanged];
    }
  }
}

- (void)updateActiveSharingHandles:(id)a3 serviceNames:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__MSPSharedTripContactController_updateActiveSharingHandles_serviceNames___block_invoke;
  v11[3] = &unk_1E617DB60;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(isolationQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)setDelegate:(id)a3
{
}

- (MSPSharedTripContactController)initWithSharedTripServer:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MSPSharedTripContactController;
  v5 = [(MSPSharedTripContactController *)&v24 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_sharedTripServer, v4);
    uint64_t v7 = [MEMORY[0x1E4F29128] UUID];
    sessionIdentifier = v6->_sessionIdentifier;
    v6->_sessionIdentifier = (NSUUID *)v7;

    id v9 = (NSOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CAA0]);
    activeHandles = v6->_activeHandles;
    v6->_activeHandles = v9;

    id v11 = (NSOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CAA0]);
    activeContacts = v6->_activeContacts;
    v6->_activeContacts = v11;

    id v13 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    serviceNamesByActiveHandle = v6->_serviceNamesByActiveHandle;
    v6->_serviceNamesByActiveHandle = v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    pendingContacts = v6->_pendingContacts;
    v6->_pendingContacts = v15;

    id v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.Maps.SharedTrip.ContactController", v17);
    isolationQueue = v6->_isolationQueue;
    v6->_isolationQueue = (OS_dispatch_queue *)v18;

    uint64_t v20 = [MEMORY[0x1E4F28B50] mainBundle];
    v21 = [v20 bundleIdentifier];
    char v22 = [v21 isEqualToString:*MEMORY[0x1E4F64320]];

    if ((v22 & 1) == 0) {
      [MEMORY[0x1E4F64B90] setInitialShareSessionWithMaps:1];
    }
  }

  return v6;
}

- (void)_notifyDelegateContactsChanged
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v3 = [(MSPSharedTripContactController *)self delegate];
  if (v3)
  {
    id v4 = self->_activeContacts;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__MSPSharedTripContactController__notifyDelegateContactsChanged__block_invoke;
    block[3] = &unk_1E617C940;
    id v7 = v3;
    v8 = self;
    id v9 = v4;
    v5 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __64__MSPSharedTripContactController__notifyDelegateContactsChanged__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sharedTripContactController:*(void *)(a1 + 40) didUpdateActiveContactsValues:*(void *)(a1 + 48)];
}

- (void)shareWithContactValue:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__MSPSharedTripContactController_shareWithContactValue_queue_completion___block_invoke;
  block[3] = &unk_1E617D958;
  objc_copyWeak(&v19, &location);
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(isolationQueue, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __73__MSPSharedTripContactController_shareWithContactValue_queue_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _shareWithContactValue:*(void *)(a1 + 32) queue:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_shareWithContactValue:(id)a3 queue:(id)a4 completion:(id)a5
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sharedTripServer);
  if (!v8)
  {
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __74__MSPSharedTripContactController__shareWithContactValue_queue_completion___block_invoke;
    v76[3] = &unk_1E617D980;
    id v77 = v10;
    dispatch_async(v9, v76);
    id v12 = v77;
    goto LABEL_25;
  }
  if ([(MSPSharedTripContactController *)self _contactIsActive:v8])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__MSPSharedTripContactController__shareWithContactValue_queue_completion___block_invoke_2;
    block[3] = &unk_1E617D980;
    id v75 = v10;
    dispatch_async(v9, block);
    id v12 = v75;
LABEL_25:

    goto LABEL_26;
  }
  id v13 = [MEMORY[0x1E4F28B50] mainBundle];
  id v14 = [v13 bundleIdentifier];
  char v15 = [v14 isEqualToString:*MEMORY[0x1E4F64320]];

  if ((v15 & 1) == 0) {
    [MEMORY[0x1E4F63E30] captureUserAction:9025 target:0 value:0];
  }
  id v16 = [v8 handleForIDS];

  if (v16)
  {
    id v12 = +[MSPSharedTripCapabilityLevelFetcher sharedFetcher];
    uint64_t v70 = 0;
    v71 = &v70;
    uint64_t v72 = 0x2020000000;
    uint64_t v73 = 0;
    uint64_t v73 = [v12 capabilityLevelForContact:v8];
    uint64_t v64 = 0;
    v65 = &v64;
    uint64_t v66 = 0x3032000000;
    v67 = __Block_byref_object_copy__1;
    v68 = __Block_byref_object_dispose__1;
    id v69 = [v12 serviceNameForContact:v8];
    v41 = (void *)[(NSUUID *)self->_sessionIdentifier copy];
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __74__MSPSharedTripContactController__shareWithContactValue_queue_completion___block_invoke_19;
    v58[3] = &unk_1E617D9D0;
    v58[4] = self;
    id v17 = v8;
    id v59 = v17;
    v62 = &v70;
    v63 = &v64;
    id v18 = v9;
    v60 = v18;
    id v19 = v10;
    id v61 = v19;
    v42 = (void *)MEMORY[0x1BA9C2AF0](v58);
    uint64_t v20 = v71[3];
    if ((unint64_t)(v20 - 2) >= 3)
    {
      if (v20)
      {
        if (v20 == 1)
        {
          uint64_t v26 = MSPGetSharedTripLog();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            uint64_t v27 = [v17 handleForIDS];
            *(_DWORD *)buf = 138412290;
            uint64_t v80 = (uint64_t)v27;
            _os_log_impl(&dword_1B87E5000, v26, OS_LOG_TYPE_ERROR, "[ContactController] shareWithContactValue called for handle %@ with MSPSharedTripCapabilityType_Invalid. Exiting Early.", buf, 0xCu);
          }
          v54[0] = MEMORY[0x1E4F143A8];
          v54[1] = 3221225472;
          v54[2] = __74__MSPSharedTripContactController__shareWithContactValue_queue_completion___block_invoke_22;
          v54[3] = &unk_1E617D9F8;
          id v56 = v19;
          unint64_t v57 = &v70;
          id v55 = v17;
          dispatch_async(v18, v54);
        }
      }
      else
      {
        id v40 = v18;
        int v28 = [(NSMutableSet *)self->_pendingContacts containsObject:v17];
        v29 = MSPGetSharedTripLog();
        BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_INFO);
        if (v28)
        {
          if (v30)
          {
            v31 = [v17 handleForIDS];
            *(_DWORD *)buf = 138412290;
            uint64_t v80 = (uint64_t)v31;
            _os_log_impl(&dword_1B87E5000, v29, OS_LOG_TYPE_INFO, "[ContactController] shareWithContactValue called for handle %@ with MSPSharedTripCapabilityType_Unknown. Already waiting for response.", buf, 0xCu);
          }
        }
        else
        {
          if (v30)
          {
            v37 = [v17 handleForIDS];
            *(_DWORD *)buf = 138412290;
            uint64_t v80 = (uint64_t)v37;
            _os_log_impl(&dword_1B87E5000, v29, OS_LOG_TYPE_INFO, "[ContactController] shareWithContactValue called for handle %@ with MSPSharedTripCapabilityType_Unknown. Will wait for response.", buf, 0xCu);
          }
          [(NSMutableSet *)self->_pendingContacts addObject:v17];
          v38 = +[MSPSharedTripCapabilityLevelFetcher sharedFetcher];
          isolationQueue = self->_isolationQueue;
          v45[0] = MEMORY[0x1E4F143A8];
          v45[1] = 3221225472;
          v45[2] = __74__MSPSharedTripContactController__shareWithContactValue_queue_completion___block_invoke_24;
          v45[3] = &unk_1E617DA48;
          v45[4] = self;
          id v46 = v41;
          id v47 = v17;
          long long v52 = &v70;
          long long v53 = &v64;
          id v48 = WeakRetained;
          id v50 = v42;
          long long v49 = v40;
          id v51 = v19;
          [v38 fetchCapabilityLevelForContact:v47 timeout:isolationQueue queue:v45 completion:0.0];
        }
      }
    }
    else
    {
      v21 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        uint64_t v22 = [v17 handleForIDS];
        v23 = (void *)v22;
        unint64_t v24 = v71[3];
        if (v24 > 4) {
          v25 = @"Unknown";
        }
        else {
          v25 = off_1E617DC30[v24];
        }
        uint64_t v32 = v65[5];
        *(_DWORD *)buf = 138412802;
        uint64_t v80 = v22;
        __int16 v81 = 2114;
        v82 = v25;
        __int16 v83 = 2114;
        uint64_t v84 = v32;
        _os_log_impl(&dword_1B87E5000, v21, OS_LOG_TYPE_INFO, "[ContactController] shareWithContactValue called for handle %@ with %{public}@/%{public}@. Will pass to trip service.", buf, 0x20u);
      }
      v33 = [v17 handleForIDS];
      v78 = v33;
      id v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v78 count:1];
      uint64_t v35 = v71[3];
      uint64_t v36 = v65[5];
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __74__MSPSharedTripContactController__shareWithContactValue_queue_completion___block_invoke_27;
      v43[3] = &unk_1E617DA20;
      id v44 = v42;
      [WeakRetained startSharingTripWithContacts:v34 capabilityType:v35 serviceName:v36 completion:v43];
    }
    _Block_object_dispose(&v64, 8);

    _Block_object_dispose(&v70, 8);
    goto LABEL_25;
  }
LABEL_26:
}

void __74__MSPSharedTripContactController__shareWithContactValue_queue_completion___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v4 = *MEMORY[0x1E4F28228];
  v5[0] = @"No contacts provided";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Maps.SharedTrip" code:10 userInfo:v2];

  (*(void (**)(uint64_t, void, void, void *))(v1 + 16))(v1, 0, 0, v3);
}

void __74__MSPSharedTripContactController__shareWithContactValue_queue_completion___block_invoke_2(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v4 = *MEMORY[0x1E4F28228];
  v5[0] = @"Already sharing with contacts";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Maps.SharedTrip" code:12 userInfo:v2];

  (*(void (**)(uint64_t, void, void, void *))(v1 + 16))(v1, 0, 0, v3);
}

void __74__MSPSharedTripContactController__shareWithContactValue_queue_completion___block_invoke_19(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 48);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__MSPSharedTripContactController__shareWithContactValue_queue_completion___block_invoke_2_20;
  block[3] = &unk_1E617D9A8;
  void block[4] = v4;
  id v6 = *(id *)(a1 + 40);
  long long v13 = *(_OWORD *)(a1 + 64);
  id v9 = v6;
  id v10 = v3;
  id v11 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  id v7 = v3;
  dispatch_async(v5, block);
}

uint64_t __74__MSPSharedTripContactController__shareWithContactValue_queue_completion___block_invoke_2_20(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didStartSharingWithContact:*(void *)(a1 + 40) withCapabilityType:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) serviceName:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) error:*(void *)(a1 + 48) queue:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
}

void __74__MSPSharedTripContactController__shareWithContactValue_queue_completion___block_invoke_22(void *a1)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1[5];
  uint64_t v2 = *(void *)(*(void *)(a1[6] + 8) + 24);
  uint64_t v7 = a1[4];
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
  if ([v3 count])
  {
    uint64_t v4 = *MEMORY[0x1E4F28228];
    v8[0] = @"InvalidContacts";
    v8[1] = v4;
    v9[0] = v3;
    v9[1] = @"Contacts not valid due to missing/unusable handles";
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Maps.SharedTrip" code:14 userInfo:v5];
  }
  else
  {
    id v6 = 0;
  }

  (*(void (**)(uint64_t, uint64_t, void, void *))(v1 + 16))(v1, v2, 0, v6);
}

void __74__MSPSharedTripContactController__shareWithContactValue_queue_completion___block_invoke_24(uint64_t a1, unint64_t a2)
{
  v29[1] = *MEMORY[0x1E4F143B8];
  if (([*(id *)(*(void *)(a1 + 32) + 56) isEqual:*(void *)(a1 + 40)] & 1) == 0)
  {
    id v9 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = [*(id *)(a1 + 48) handleForIDS];
      *(_DWORD *)buf = 138477827;
      uint64_t v24 = (uint64_t)v10;
      id v11 = "[ContactController] shareWithContactValue will not retry sharing for pending handle %{private}@ as that session is over";
LABEL_11:
      _os_log_impl(&dword_1B87E5000, v9, OS_LOG_TYPE_INFO, v11, buf, 0xCu);
    }
LABEL_12:

    return;
  }
  if (([*(id *)(*(void *)(a1 + 32) + 32) containsObject:*(void *)(a1 + 48)] & 1) == 0)
  {
    id v9 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = [*(id *)(a1 + 48) handleForIDS];
      *(_DWORD *)buf = 138477827;
      uint64_t v24 = (uint64_t)v10;
      id v11 = "[ContactController] shareWithContactValue will not retry sharing for pending handle %{private}@ as it was re"
            "moved from the pending set";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  [*(id *)(*(void *)(a1 + 32) + 32) removeObject:*(void *)(a1 + 48)];
  uint64_t v4 = MSPGetSharedTripLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (a2)
  {
    if (v5)
    {
      uint64_t v6 = [*(id *)(a1 + 48) handleForIDS];
      uint64_t v7 = (void *)v6;
      if (a2 > 4) {
        id v8 = @"Unknown";
      }
      else {
        id v8 = off_1E617DBF8[a2 - 1];
      }
      uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
      *(_DWORD *)buf = 138478339;
      uint64_t v24 = v6;
      __int16 v25 = 2114;
      uint64_t v26 = v8;
      __int16 v27 = 2114;
      uint64_t v28 = v20;
      _os_log_impl(&dword_1B87E5000, v4, OS_LOG_TYPE_INFO, "[ContactController] shareWithContactValue received capability for pending contact %{private}@: %{public}@/%{public}@", buf, 0x20u);
    }
    [*(id *)(a1 + 32) _shareWithContactValue:*(void *)(a1 + 48) queue:*(void *)(a1 + 64) completion:*(void *)(a1 + 80)];
  }
  else
  {
    if (v5)
    {
      id v12 = [*(id *)(a1 + 48) handleForIDS];
      *(_DWORD *)buf = 138477827;
      uint64_t v24 = (uint64_t)v12;
      _os_log_impl(&dword_1B87E5000, v4, OS_LOG_TYPE_INFO, "[ContactController] shareWithContactValue timed out waiting for pending contact %{private}@. falling back to messages", buf, 0xCu);
    }
    *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 3;
    uint64_t v13 = *(void *)(*(void *)(a1 + 96) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = 0;

    char v15 = *(void **)(a1 + 56);
    id v16 = [*(id *)(a1 + 48) handleForIDS];
    v29[0] = v16;
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
    uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
    uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __74__MSPSharedTripContactController__shareWithContactValue_queue_completion___block_invoke_25;
    v21[3] = &unk_1E617DA20;
    id v22 = *(id *)(a1 + 72);
    [v15 startSharingTripWithContacts:v17 capabilityType:v18 serviceName:v19 completion:v21];
  }
}

uint64_t __74__MSPSharedTripContactController__shareWithContactValue_queue_completion___block_invoke_25(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __74__MSPSharedTripContactController__shareWithContactValue_queue_completion___block_invoke_27(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_didStartSharingWithContact:(id)a3 withCapabilityType:(unint64_t)a4 serviceName:(id)a5 error:(id)a6 queue:(id)a7 completion:(id)a8
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  char v15 = (__CFString *)a5;
  id v16 = (__CFString *)a6;
  id v17 = a8;
  isolationQueue = self->_isolationQueue;
  uint64_t v19 = a7;
  dispatch_assert_queue_V2(isolationQueue);
  if (v16)
  {
    uint64_t v20 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v40 = v16;
      _os_log_impl(&dword_1B87E5000, v20, OS_LOG_TYPE_ERROR, "[ContactController] Error trying to start sharing: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v20 = [(NSDictionary *)self->_serviceNamesByActiveHandle mutableCopy];
    v21 = v15;
    if (!v15)
    {
      if (a4 - 2 > 2)
      {
        v33 = 0;
        v21 = 0;
      }
      else
      {
        v21 = *off_1E617DC18[a4 - 2];
        v33 = v21;
      }
    }
    id v22 = [v14 handleForIDS];
    [v20 setObject:v21 forKeyedSubscript:v22];

    if (!v15) {
    v23 = [v20 copy];
    }
    serviceNamesByActiveHandle = self->_serviceNamesByActiveHandle;
    self->_serviceNamesByActiveHandle = v23;

    __int16 v25 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v26 = [v25 bundleIdentifier];
    char v27 = [v26 isEqualToString:*MEMORY[0x1E4F64320]];

    if ((v27 & 1) == 0) {
      [MEMORY[0x1E4F63E30] captureUserAction:104 target:0 value:0];
    }
    uint64_t v28 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      if (a4 > 4) {
        v29 = @"Unknown";
      }
      else {
        v29 = off_1E617DC30[a4];
      }
      *(_DWORD *)buf = 138543362;
      id v40 = v29;
      _os_log_impl(&dword_1B87E5000, v28, OS_LOG_TYPE_DEFAULT, "[ContactController] Did start sharing via %{public}@", buf, 0xCu);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __116__MSPSharedTripContactController__didStartSharingWithContact_withCapabilityType_serviceName_error_queue_completion___block_invoke;
  block[3] = &unk_1E617DA70;
  id v37 = v17;
  unint64_t v38 = a4;
  uint64_t v35 = v15;
  uint64_t v36 = v16;
  BOOL v30 = v16;
  v31 = v15;
  id v32 = v17;
  dispatch_async(v19, block);
}

uint64_t __116__MSPSharedTripContactController__didStartSharingWithContact_withCapabilityType_serviceName_error_queue_completion___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[7], a1[4], a1[5]);
}

- (void)stopSharingWithContactValue:(id)a3 reason:(unint64_t)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __86__MSPSharedTripContactController_stopSharingWithContactValue_reason_queue_completion___block_invoke;
  v17[3] = &unk_1E617DA98;
  objc_copyWeak(v21, &location);
  id v18 = v10;
  id v19 = v11;
  v21[1] = (id)a4;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(isolationQueue, v17);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void __86__MSPSharedTripContactController_stopSharingWithContactValue_reason_queue_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _stopSharingWithContactValue:*(void *)(a1 + 32) reason:*(void *)(a1 + 64) queue:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_stopSharingWithContactValue:(id)a3 reason:(unint64_t)a4 queue:(id)a5 completion:(id)a6
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (v10)
  {
    activeHandles = self->_activeHandles;
    id v14 = [v10 handleForIDS];
    LOBYTE(activeHandles) = [(NSOrderedSet *)activeHandles containsObject:v14];

    if (activeHandles)
    {
      [(NSMutableSet *)self->_pendingContacts removeObject:v10];
      id v15 = [MEMORY[0x1E4F28B50] mainBundle];
      id v16 = [v15 bundleIdentifier];
      char v17 = [v16 isEqualToString:*MEMORY[0x1E4F64320]];

      if ((v17 & 1) == 0) {
        [MEMORY[0x1E4F63E30] captureUserAction:9026 target:0 value:0];
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_sharedTripServer);
      id v19 = [v10 handleForIDS];
      v25[0] = v19;
      id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
      [WeakRetained stopSharingTripWithContacts:v20 reason:a4 completion:v12];
    }
    else
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      id v21[2] = __87__MSPSharedTripContactController__stopSharingWithContactValue_reason_queue_completion___block_invoke_2;
      v21[3] = &unk_1E617D980;
      id v22 = v12;
      dispatch_async(v11, v21);
      id WeakRetained = v22;
    }
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__MSPSharedTripContactController__stopSharingWithContactValue_reason_queue_completion___block_invoke;
    block[3] = &unk_1E617D980;
    id v24 = v12;
    dispatch_async(v11, block);
    id WeakRetained = v24;
  }
}

void __87__MSPSharedTripContactController__stopSharingWithContactValue_reason_queue_completion___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v4 = *MEMORY[0x1E4F28228];
  v5[0] = @"No contacts provided";
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Maps.SharedTrip" code:10 userInfo:v2];

  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);
}

void __87__MSPSharedTripContactController__stopSharingWithContactValue_reason_queue_completion___block_invoke_2(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v4 = *MEMORY[0x1E4F28228];
  v5[0] = @"Not currently sharing with contacts";
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Maps.SharedTrip" code:13 userInfo:v2];

  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);
}

- (void)stopAllSharingWithReason:(unint64_t)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__MSPSharedTripContactController_stopAllSharingWithReason_queue_completion___block_invoke;
  block[3] = &unk_1E617DAC0;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a3;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(isolationQueue, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __76__MSPSharedTripContactController_stopAllSharingWithReason_queue_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _stopAllSharingWithReason:*(void *)(a1 + 56) queue:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)_stopAllSharingWithReason:(unint64_t)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if ([(NSOrderedSet *)self->_activeHandles count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sharedTripServer);
    [WeakRetained stopSharingTripWithReason:a3 completion:v9];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__MSPSharedTripContactController__stopAllSharingWithReason_queue_completion___block_invoke;
    block[3] = &unk_1E617D980;
    id v12 = v9;
    dispatch_async(v8, block);
  }
}

void __77__MSPSharedTripContactController__stopAllSharingWithReason_queue_completion___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v4 = *MEMORY[0x1E4F28228];
  v5[0] = @"Not currently sharing with contacts";
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Maps.SharedTrip" code:13 userInfo:v2];

  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);
}

- (NSOrderedSet)activeContactsValues
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__1;
  id v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  isolationQueue = self->_isolationQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__MSPSharedTripContactController_activeContactsValues__block_invoke;
  v6[3] = &unk_1E617DAE8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(isolationQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSOrderedSet *)v4;
}

void __54__MSPSharedTripContactController_activeContactsValues__block_invoke(uint64_t a1)
{
}

- (BOOL)contactIsActive:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __50__MSPSharedTripContactController_contactIsActive___block_invoke;
  v8[3] = &unk_1E617DB10;
  id v10 = &v13;
  objc_copyWeak(&v11, &location);
  id v9 = v4;
  id v6 = v4;
  dispatch_sync(isolationQueue, v8);
  LOBYTE(isolationQueue) = *((unsigned char *)v14 + 24);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v13, 8);
  return (char)isolationQueue;
}

void __50__MSPSharedTripContactController_contactIsActive___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [WeakRetained _contactIsActive:*(void *)(a1 + 32)];
}

- (BOOL)_contactIsActive:(id)a3
{
  isolationQueue = self->_isolationQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(isolationQueue);
  activeHandles = self->_activeHandles;
  uint64_t v7 = [v5 handleForIDS];

  LOBYTE(activeHandles) = [(NSOrderedSet *)activeHandles containsObject:v7];
  return (char)activeHandles;
}

- (unint64_t)activeCapabilityTypeForContact:(id)a3 serviceName:(id *)a4
{
  id v6 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  uint64_t v16 = 0;
  char v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__MSPSharedTripContactController_activeCapabilityTypeForContact_serviceName___block_invoke;
  block[3] = &unk_1E617DB38;
  uint64_t v13 = &v16;
  objc_copyWeak(v14, &location);
  id v12 = v6;
  v14[1] = a4;
  id v8 = v6;
  dispatch_sync(isolationQueue, block);
  unint64_t v9 = v17[3];

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v16, 8);
  return v9;
}

void __77__MSPSharedTripContactController_activeCapabilityTypeForContact_serviceName___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [WeakRetained _activeCapabilityTypeForContact:*(void *)(a1 + 32) serviceName:*(void *)(a1 + 56)];
}

- (unint64_t)_activeCapabilityTypeForContact:(id)a3 serviceName:(id *)a4
{
  isolationQueue = self->_isolationQueue;
  id v7 = a3;
  dispatch_assert_queue_V2(isolationQueue);
  serviceNamesByActiveHandle = self->_serviceNamesByActiveHandle;
  unint64_t v9 = [v7 handleForIDS];

  id v10 = [(NSDictionary *)serviceNamesByActiveHandle objectForKeyedSubscript:v9];

  if (v10)
  {
    if ([v10 isEqualToString:@"Maps"])
    {
      unint64_t v11 = 4;
      if (!a4) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if ([v10 isEqualToString:@"iMessage"]) {
      unint64_t v11 = 3;
    }
    else {
      unint64_t v11 = 2;
    }
    if (a4) {
LABEL_10:
    }
      *a4 = v10;
  }
  else
  {
    unint64_t v11 = 0;
  }
LABEL_11:

  return v11;
}

uint64_t __75__MSPSharedTripContactController__updateActiveSharingHandles_serviceNames___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 handleForIDS];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

uint64_t __75__MSPSharedTripContactController__updateActiveSharingHandles_serviceNames___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [a2 handleForIDS];
  unint64_t v8 = [v5 indexOfObject:v7];

  unint64_t v9 = *(void **)(a1 + 32);
  id v10 = [v6 handleForIDS];

  unint64_t v11 = [v9 indexOfObject:v10];
  if (v8 < v11) {
    return -1;
  }
  else {
    return v8 > v11;
  }
}

- (MSPSharingRestorationStorage)archivedSharingStorage
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__1;
  uint64_t v13 = __Block_byref_object_dispose__1;
  id v14 = 0;
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__MSPSharedTripContactController_archivedSharingStorage__block_invoke;
  block[3] = &unk_1E617DBD8;
  void block[4] = &v9;
  objc_copyWeak(&v7, &location);
  dispatch_sync(isolationQueue, block);
  id v4 = (id)v10[5];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v9, 8);

  return (MSPSharingRestorationStorage *)v4;
}

void __56__MSPSharedTripContactController_archivedSharingStorage__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained _archivedSharingStorage];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_archivedSharingStorage
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  uint64_t v3 = (void *)[(NSOrderedSet *)self->_activeHandles mutableCopy];
  if (![v3 count])
  {
    id v5 = 0;
    goto LABEL_35;
  }
  id v4 = self->_activeContacts;
  id v5 = objc_alloc_init(MSPSharingRestorationStorage);
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  -[MSPSharingRestorationStorage setCreatedTimestamp:](v5, "setCreatedTimestamp:");
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = v4;
  uint64_t v6 = [(NSOrderedSet *)obj countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (!v6) {
    goto LABEL_22;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v33;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v33 != v8) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(void **)(*((void *)&v32 + 1) + 8 * i);
      uint64_t v11 = [v10 handleForIDS];
      [v3 removeObject:v11];

      id v12 = [MEMORY[0x1E4F64860] sharedPlatform];
      if ([v12 isInternalInstall])
      {
        uint64_t v13 = [v10 handleForIDS];
        char IsValid = MSPSharedTripVirtualReceiverIsValid(v13);

        if (IsValid) {
          continue;
        }
      }
      else
      {
      }
      uint64_t v15 = +[MSPSharedTripCapabilityLevelFetcher sharedFetcher];
      uint64_t v16 = [v15 capabilityLevelForContact:v10];

      if ((unint64_t)(v16 - 2) < 2 || v16 == 0)
      {
        uint64_t v18 = [v10 stringValue];
        [(MSPSharingRestorationStorage *)v5 addMessagesIdentifier:v18];
      }
      else
      {
        if (v16 != 4) {
          continue;
        }
        uint64_t v18 = [v10 stringValue];
        [(MSPSharingRestorationStorage *)v5 addMapsIdentifier:v18];
      }
    }
    uint64_t v7 = [(NSOrderedSet *)obj countByEnumeratingWithState:&v32 objects:v41 count:16];
  }
  while (v7);
LABEL_22:

  if ([v3 count])
  {
    uint64_t v19 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      uint64_t v20 = [v3 count];
      *(_DWORD *)buf = 134218243;
      uint64_t v38 = v20;
      __int16 v39 = 2113;
      id v40 = v3;
      _os_log_impl(&dword_1B87E5000, v19, OS_LOG_TYPE_FAULT, "There are %lu leftover active handles after enumerating activeContacts: %{private}@", buf, 0x16u);
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v21 = v3;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v29;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v29 != v24) {
            objc_enumerationMutation(v21);
          }
          [(MSPSharingRestorationStorage *)v5 addMessagesIdentifier:*(void *)(*((void *)&v28 + 1) + 8 * j)];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v23);
    }
  }
LABEL_35:

  return v5;
}

- (void)reset
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__MSPSharedTripContactController_reset__block_invoke;
  v4[3] = &unk_1E617C9A8;
  objc_copyWeak(&v5, &location);
  dispatch_async(isolationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __39__MSPSharedTripContactController_reset__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reset];
}

- (void)_reset
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  uint64_t v3 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_DEFAULT, "[ContactController] Reset", v12, 2u);
  }

  id v4 = [MEMORY[0x1E4F29128] UUID];
  sessionIdentifier = self->_sessionIdentifier;
  self->_sessionIdentifier = v4;

  uint64_t v6 = (NSOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CAA0]);
  activeHandles = self->_activeHandles;
  self->_activeHandles = v6;

  uint64_t v8 = (NSOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CAA0]);
  activeContacts = self->_activeContacts;
  self->_activeContacts = v8;

  id v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  pendingContacts = self->_pendingContacts;
  self->_pendingContacts = v10;
}

- (MSPSharedTripContactControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MSPSharedTripContactControllerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_destroyWeak((id *)&self->_sharedTripServer);
  objc_storeStrong((id *)&self->_pendingContacts, 0);
  objc_storeStrong((id *)&self->_serviceNamesByActiveHandle, 0);
  objc_storeStrong((id *)&self->_activeHandles, 0);

  objc_storeStrong((id *)&self->_activeContacts, 0);
}

@end