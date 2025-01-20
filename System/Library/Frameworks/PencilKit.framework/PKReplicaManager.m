@interface PKReplicaManager
+ (id)sharedReplicaManager;
- (BOOL)isValidBundleIDForSaving:(id)a3;
- (BOOL)testMode;
- (NSArray)replicaManagerErrors;
- (PKReplicaManager)init;
- (id)checkoutReplicaUUIDForDrawing:(id)a3;
- (id)description;
- (void)_applicationWillTerminate;
- (void)_loadState;
- (void)_resetAllReplicaUUIDs;
- (void)_saveStateImmediately;
- (void)_scheduleSaveState;
- (void)_setReplicasDirtyToken;
- (void)persistIfNeeded;
- (void)returnReplicaForDrawing:(id)a3;
- (void)setTestMode:(BOOL)a3;
- (void)updateVersionForDrawing:(id)a3;
@end

@implementation PKReplicaManager

- (void)setTestMode:(BOOL)a3
{
  self->_testMode = a3;
  if (a3)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    replicaManagerErrors = self->_replicaManagerErrors;
    self->_replicaManagerErrors = v4;
  }
}

- (NSArray)replicaManagerErrors
{
  return (NSArray *)self->_replicaManagerErrors;
}

+ (id)sharedReplicaManager
{
  if (_MergedGlobals_168 != -1) {
    dispatch_once(&_MergedGlobals_168, &__block_literal_global_97);
  }
  v2 = (void *)qword_1EB3C63B8;

  return v2;
}

void __40__PKReplicaManager_sharedReplicaManager__block_invoke()
{
  v0 = objc_alloc_init(PKReplicaManager);
  v1 = (void *)qword_1EB3C63B8;
  qword_1EB3C63B8 = (uint64_t)v0;
}

- (PKReplicaManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)PKReplicaManager;
  v2 = [(PKReplicaManager *)&v7 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.PencilKit.replicas", 0);
    uuidAccessQueue = v2->_uuidAccessQueue;
    v2->_uuidAccessQueue = (OS_dispatch_queue *)v3;

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel__applicationWillTerminate name:*MEMORY[0x1E4FB2740] object:0];
  }
  return v2;
}

- (void)_applicationWillTerminate
{
  uuidAccessQueue = self->_uuidAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__PKReplicaManager__applicationWillTerminate__block_invoke;
  block[3] = &unk_1E64C5368;
  block[4] = self;
  dispatch_sync(uuidAccessQueue, block);
}

void *__45__PKReplicaManager__applicationWillTerminate__block_invoke(uint64_t a1)
{
  result = *(void **)(*(void *)(a1 + 32) + 40);
  if (result)
  {
    dispatch_block_cancel(result);
    dispatch_queue_t v3 = *(void **)(a1 + 32);
    return (void *)[v3 _saveStateImmediately];
  }
  return result;
}

- (id)checkoutReplicaUUIDForDrawing:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__37;
  v16 = __Block_byref_object_dispose__37;
  id v17 = 0;
  uuidAccessQueue = self->_uuidAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__PKReplicaManager_checkoutReplicaUUIDForDrawing___block_invoke;
  block[3] = &unk_1E64C9198;
  block[4] = self;
  id v10 = v4;
  v11 = &v12;
  id v6 = v4;
  dispatch_sync(uuidAccessQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __50__PKReplicaManager_checkoutReplicaUUIDForDrawing___block_invoke(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  if (!v2[2])
  {
    [v2 _loadState];
    v2 = *(void **)(a1 + 32);
  }
  dispatch_queue_t v3 = (void *)v2[3];
  id v4 = [*(id *)(a1 + 40) nsuuid];
  uint64_t v5 = [v3 objectForKey:v4];

  v41 = (void *)v5;
  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    id v7 = *(void **)(*(void *)(a1 + 32) + 24);
    v8 = [*(id *)(a1 + 40) nsuuid];
    [v7 setObject:v6 forKey:v8];

    v41 = (void *)v6;
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v9 = (PKReplicaEntry *)*(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v10 = [(PKReplicaEntry *)v9 countByEnumeratingWithState:&v46 objects:v53 count:16];
  if (v10)
  {
    uint64_t v40 = *(void *)v47;
    obj = v9;
    while (1)
    {
      uint64_t v39 = v10;
      uint64_t v11 = 0;
LABEL_8:
      if (*(void *)v47 != v40) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void **)(*((void *)&v46 + 1) + 8 * v11);
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      v13 = v41;
      uint64_t v14 = [(PKReplicaEntry *)v13 countByEnumeratingWithState:&v42 objects:v52 count:16];
      if (!v14) {
        break;
      }
      uint64_t v15 = *(void *)v43;
LABEL_12:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v43 != v15) {
          objc_enumerationMutation(v13);
        }
        id v17 = *(void **)(*((void *)&v42 + 1) + 8 * v16);
        v18 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "objectAtIndex:", objc_msgSend(v17, "replicaUUIDIndex"));
        if ([v18 isEqual:v12]) {
          break;
        }

        if (v14 == ++v16)
        {
          uint64_t v14 = [(PKReplicaEntry *)v13 countByEnumeratingWithState:&v42 objects:v52 count:16];
          if (v14) {
            goto LABEL_12;
          }
          goto LABEL_36;
        }
      }
      if (([v17 inUse] & 1) == 0)
      {
        v19 = [*(id *)(a1 + 40) version];
        os_log_t v20 = [v19 clockElementForUUID:v12];

        unint64_t v21 = [v20 clock];
        unsigned int v22 = [v17 clock];
        uint64_t v23 = [v20 clock];
        if (v23 == [v17 clock])
        {
          unint64_t v24 = [v20 subclock];
          BOOL v25 = v24 > [v17 subclock];
        }
        else
        {
          BOOL v25 = 0;
        }
        if (v21 > v22 || v25)
        {
          v26 = NSString;
          v27 = [*(id *)(a1 + 40) uuid];
          v28 = [v26 stringWithFormat:@"Replica Manager Error: Invalid entry for drawing with UUID: %@ (%p) and replica UUID: %@", v27, *(void *)(a1 + 40), v12];

          v29 = os_log_create("com.apple.pencilkit", "");
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v51 = (uint64_t)v28;
            _os_log_error_impl(&dword_1C44F8000, v29, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }

          if ([*(id *)(a1 + 32) testMode]) {
            [*(id *)(*(void *)(a1 + 32) + 32) addObject:v28];
          }
        }
        uint64_t v30 = [v20 clock];
        if (v30 == [v17 clock])
        {
          uint64_t v31 = [v20 subclock];
          if (v31 == [v17 subclock])
          {
            [v17 setDrawing:*(void *)(a1 + 40)];
            [v17 setInUse:1];
            objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v12);
            goto LABEL_40;
          }
        }
      }
      if (++v11 != v39) {
        goto LABEL_8;
      }
      v9 = obj;
      uint64_t v10 = [(PKReplicaEntry *)obj countByEnumeratingWithState:&v46 objects:v53 count:16];
      if (!v10) {
        goto LABEL_35;
      }
    }
LABEL_36:

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v12);
    v36 = -[PKReplicaEntry initWithReplicaUUIDIndex:clock:subclock:inUse:forDrawing:]([PKReplicaEntry alloc], "initWithReplicaUUIDIndex:clock:subclock:inUse:forDrawing:", [*(id *)(*(void *)(a1 + 32) + 16) indexOfObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)], 0, 0, 1, *(void *)(a1 + 40));
    [(PKReplicaEntry *)v13 addObject:v36];
    if ((unint64_t)[(PKReplicaEntry *)v13 count] < 4)
    {
      v13 = v36;
    }
    else
    {
      os_log_t v20 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v37 = [(PKReplicaEntry *)v13 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v51 = v37;
        _os_log_impl(&dword_1C44F8000, v20, OS_LOG_TYPE_INFO, "Drawing has claimed %ld replicas.", buf, 0xCu);
      }
      v18 = v20;
      v13 = v36;
LABEL_40:
    }
    v35 = obj;
  }
  else
  {
LABEL_35:

    uint64_t v32 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v33 = *(void *)(*(void *)(a1 + 48) + 8);
    v34 = *(void **)(v33 + 40);
    *(void *)(v33 + 40) = v32;

    [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    v35 = -[PKReplicaEntry initWithReplicaUUIDIndex:clock:subclock:inUse:forDrawing:]([PKReplicaEntry alloc], "initWithReplicaUUIDIndex:clock:subclock:inUse:forDrawing:", [*(id *)(*(void *)(a1 + 32) + 16) indexOfObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)], 0, 0, 1, *(void *)(a1 + 40));
    [v41 addObject:v35];
  }
}

- (void)updateVersionForDrawing:(id)a3
{
  id v4 = a3;
  uuidAccessQueue = self->_uuidAccessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__PKReplicaManager_updateVersionForDrawing___block_invoke;
  v7[3] = &unk_1E64C5870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(uuidAccessQueue, v7);
}

void __44__PKReplicaManager_updateVersionForDrawing___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  dispatch_queue_t v3 = [*(id *)(a1 + 40) nsuuid];
  id v4 = [v2 objectForKey:v3];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "objectAtIndex:", objc_msgSend(v9, "replicaUUIDIndex"));
        uint64_t v11 = [*(id *)(a1 + 40) replicaUUID];
        int v12 = [v11 isEqual:v10];

        if (v12)
        {
          if (([v9 inUse] & 1) == 0)
          {
            v13 = NSString;
            uint64_t v14 = [*(id *)(a1 + 40) replicaUUID];
            uint64_t v15 = [*(id *)(a1 + 40) uuid];
            uint64_t v16 = [v13 stringWithFormat:@"Replica Manager Error: Attempt to update version of replica UUID %@ for drawing with UUID: %@ (%p)", v14, v15, *(void *)(a1 + 40)];

            id v17 = os_log_create("com.apple.pencilkit", "");
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v34 = v16;
              _os_log_error_impl(&dword_1C44F8000, v17, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
            }

            if ([*(id *)(a1 + 32) testMode]) {
              [*(id *)(*(void *)(a1 + 32) + 32) addObject:v16];
            }
          }
          v18 = *(void **)(a1 + 40);
          v19 = [v9 drawing];
          LOBYTE(v18) = v18 == v19;

          if ((v18 & 1) == 0)
          {
            os_log_t v20 = NSString;
            unint64_t v21 = [*(id *)(a1 + 40) replicaUUID];
            unsigned int v22 = [*(id *)(a1 + 40) uuid];
            uint64_t v23 = [v9 drawing];
            unint64_t v24 = [v20 stringWithFormat:@"Replica Manager Error: Attempt to update version of replica UUID %@ for drawing with UUID: %@ (%p) from invalid drawing instance (%p)", v21, v22, v23, *(void *)(a1 + 40), (void)v29];

            BOOL v25 = os_log_create("com.apple.pencilkit", "");
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v34 = v24;
              _os_log_error_impl(&dword_1C44F8000, v25, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
            }

            if ([*(id *)(a1 + 32) testMode]) {
              [*(id *)(*(void *)(a1 + 32) + 32) addObject:v24];
            }
          }
          v26 = [*(id *)(a1 + 40) version];
          v27 = [*(id *)(a1 + 40) replicaUUID];
          v28 = [v26 clockElementForUUID:v27];

          objc_msgSend(v9, "setClock:", objc_msgSend(v28, "clock"));
          objc_msgSend(v9, "setSubclock:", objc_msgSend(v28, "subclock"));

          *(unsigned char *)(*(void *)(a1 + 32) + 49) = 1;
          goto LABEL_24;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

LABEL_24:
}

- (void)persistIfNeeded
{
  uuidAccessQueue = self->_uuidAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__PKReplicaManager_persistIfNeeded__block_invoke;
  block[3] = &unk_1E64C5368;
  block[4] = self;
  dispatch_sync(uuidAccessQueue, block);
}

unsigned char *__35__PKReplicaManager_persistIfNeeded__block_invoke(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (result[49])
  {
    [result _setReplicasDirtyToken];
    dispatch_queue_t v3 = *(void **)(a1 + 32);
    return (unsigned char *)[v3 _scheduleSaveState];
  }
  return result;
}

- (void)returnReplicaForDrawing:(id)a3
{
  id v4 = a3;
  [(PKReplicaManager *)self updateVersionForDrawing:v4];
  uuidAccessQueue = self->_uuidAccessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__PKReplicaManager_returnReplicaForDrawing___block_invoke;
  v7[3] = &unk_1E64C5870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(uuidAccessQueue, v7);
}

void __44__PKReplicaManager_returnReplicaForDrawing___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  dispatch_queue_t v3 = [*(id *)(a1 + 40) nsuuid];
  id v4 = [v2 objectForKey:v3];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v9 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "objectAtIndex:", objc_msgSend(v8, "replicaUUIDIndex"));
        uint64_t v10 = [*(id *)(a1 + 40) replicaUUID];
        int v11 = [v10 isEqual:v9];

        if (v11)
        {
          if (([v8 inUse] & 1) == 0)
          {
            int v12 = NSString;
            v13 = [*(id *)(a1 + 40) replicaUUID];
            uint64_t v14 = [*(id *)(a1 + 40) uuid];
            uint64_t v15 = [v12 stringWithFormat:@"Replica Manager Error: Attempt to return unused replica UUID %@ for drawing with UUID: %@ (%p)", v13, v14, *(void *)(a1 + 40)];

            uint64_t v16 = os_log_create("com.apple.pencilkit", "");
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              long long v31 = v15;
              _os_log_error_impl(&dword_1C44F8000, v16, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
            }

            if ([*(id *)(a1 + 32) testMode]) {
              [*(id *)(*(void *)(a1 + 32) + 32) addObject:v15];
            }
          }
          id v17 = *(void **)(a1 + 40);
          v18 = [v8 drawing];
          LOBYTE(v17) = v17 == v18;

          if ((v17 & 1) == 0)
          {
            v19 = NSString;
            os_log_t v20 = [*(id *)(a1 + 40) replicaUUID];
            unint64_t v21 = [*(id *)(a1 + 40) uuid];
            unsigned int v22 = [v8 drawing];
            uint64_t v23 = [v19 stringWithFormat:@"Replica Manager Error: Attempt to return replica UUID %@ for drawing with UUID: %@ (%p) from invalid drawing instance (%p)", v20, v21, v22, *(void *)(a1 + 40)];

            unint64_t v24 = os_log_create("com.apple.pencilkit", "");
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              long long v31 = v23;
              _os_log_error_impl(&dword_1C44F8000, v24, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
            }

            if ([*(id *)(a1 + 32) testMode]) {
              [*(id *)(*(void *)(a1 + 32) + 32) addObject:v23];
            }
          }
          [v8 setInUse:0];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v5);
  }
}

- (BOOL)isValidBundleIDForSaving:(id)a3
{
  return [a3 hasPrefix:@"com.apple.quicklook"] ^ 1;
}

- (void)_loadState
{
  dispatch_queue_t v3 = [MEMORY[0x1E4F28B50] mainBundle];
  applicationID = [v3 bundleIdentifier];

  if ([(PKReplicaManager *)self isValidBundleIDForSaving:applicationID])
  {
    BOOL v4 = [(PKReplicaManager *)self testMode];
    CFStringRef v5 = applicationID;
    if (applicationID) {
      int v6 = v4;
    }
    else {
      int v6 = 1;
    }
    if (v6 == 1)
    {

      CFStringRef v5 = @"com.apple.replicas.test";
    }
    CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
    CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
    applicationID = (__CFString *)v5;
    v9 = (void *)CFPreferencesCopyValue(@"com.apple.PencilKit.replicasDirtyToken", v5, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
    if (v9)
    {
      [(PKReplicaManager *)self _resetAllReplicaUUIDs];
    }
    else
    {
      uint64_t v10 = (void *)CFPreferencesCopyValue(@"com.apple.PencilKit.replicas", applicationID, v7, v8);
      if (v10)
      {
        int v11 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v10 error:0];
        int v12 = [v11 decodeObjectOfClass:objc_opt_class() forKey:@"ReplicaUUIDs"];
        replicaUUIDs = self->_replicaUUIDs;
        self->_replicaUUIDs = v12;

        uint64_t v14 = [v11 decodeObjectOfClass:objc_opt_class() forKey:@"ReplicaEntries"];
        replicaEntries = self->_replicaEntries;
        self->_replicaEntries = v14;
      }
      if (!self->_replicaUUIDs)
      {
        uint64_t v16 = [MEMORY[0x1E4F1CA70] orderedSet];
        id v17 = self->_replicaUUIDs;
        self->_replicaUUIDs = v16;
      }
      if (!self->_replicaEntries)
      {
        v18 = [MEMORY[0x1E4F1CA60] dictionary];
        v19 = self->_replicaEntries;
        self->_replicaEntries = v18;
      }
    }
  }
}

- (void)_setReplicasDirtyToken
{
  if (!self->_dirtyTokenSet)
  {
    self->_dirtyTokenSet = 1;
    dispatch_queue_t v3 = [MEMORY[0x1E4F28B50] mainBundle];
    BOOL v4 = [v3 bundleIdentifier];

    BOOL v5 = [(PKReplicaManager *)self testMode];
    if (v4) {
      int v6 = v5;
    }
    else {
      int v6 = 1;
    }
    if (v6 == 1)
    {

      BOOL v4 = @"com.apple.replicas.test";
    }
    char v10 = 1;
    CFStringRef v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v10 length:1];
    CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
    CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
    CFPreferencesSetValue(@"com.apple.PencilKit.replicasDirtyToken", v7, v4, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
    CFPreferencesSynchronize(v4, v8, v9);
  }
}

- (void)_scheduleSaveState
{
  id saveStateBlock = self->_saveStateBlock;
  if (saveStateBlock) {
    dispatch_block_cancel(saveStateBlock);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__PKReplicaManager__scheduleSaveState__block_invoke;
  block[3] = &unk_1E64C5368;
  block[4] = self;
  dispatch_block_t v4 = dispatch_block_create((dispatch_block_flags_t)0, block);
  id v5 = self->_saveStateBlock;
  self->_id saveStateBlock = v4;

  dispatch_time_t v6 = dispatch_time(0, 2500000000);
  dispatch_after(v6, (dispatch_queue_t)self->_uuidAccessQueue, self->_saveStateBlock);
}

uint64_t __38__PKReplicaManager__scheduleSaveState__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  dispatch_queue_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  dispatch_block_t v4 = *(void **)(a1 + 32);

  return [v4 _saveStateImmediately];
}

- (void)_saveStateImmediately
{
  if (self->_replicaUUIDs && self->_replicaEntries)
  {
    if ([(PKReplicaManager *)self testMode])
    {
      dispatch_queue_t v3 = @"com.apple.replicas.test";
    }
    else
    {
      id v9 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v4 = [v9 bundleIdentifier];

      dispatch_queue_t v3 = (__CFString *)v4;
    }
    char v10 = v3;
    if (-[PKReplicaManager isValidBundleIDForSaving:](self, "isValidBundleIDForSaving:"))
    {
      id v5 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:0];
      [v5 encodeObject:self->_replicaUUIDs forKey:@"ReplicaUUIDs"];
      [v5 encodeObject:self->_replicaEntries forKey:@"ReplicaEntries"];
      [v5 finishEncoding];
      dispatch_time_t v6 = [v5 encodedData];
      CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
      CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
      CFPreferencesSetValue(@"com.apple.PencilKit.replicasDirtyToken", 0, v10, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
      *(_WORD *)&self->_dirtyTokenSet = 0;
      CFPreferencesSetValue(@"com.apple.PencilKit.replicas", v6, v10, v7, v8);
      CFPreferencesSynchronize(v10, v7, v8);
    }
  }
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Replica UUIDs: %@\nReplica Entries: %@\n", self->_replicaUUIDs, self->_replicaEntries];
}

- (void)_resetAllReplicaUUIDs
{
  dispatch_queue_t v3 = [MEMORY[0x1E4F1CA70] orderedSet];
  replicaUUIDs = self->_replicaUUIDs;
  self->_replicaUUIDs = v3;

  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  replicaEntries = self->_replicaEntries;
  self->_replicaEntries = v5;

  [(PKReplicaManager *)self _saveStateImmediately];
}

- (BOOL)testMode
{
  return self->_testMode;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_saveStateBlock, 0);
  objc_storeStrong((id *)&self->_replicaManagerErrors, 0);
  objc_storeStrong((id *)&self->_replicaEntries, 0);
  objc_storeStrong((id *)&self->_replicaUUIDs, 0);

  objc_storeStrong((id *)&self->_uuidAccessQueue, 0);
}

@end