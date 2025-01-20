@interface AXSSDatabaseManager
+ (id)sharedDatabase;
+ (int64_t)preferredContextType;
- (AXSSDatabaseManager)init;
- (BOOL)canSave;
- (BOOL)clientCloudKitSyncs;
- (BOOL)saveIfPossible:(id *)a3;
- (NSManagedObjectContext)managedObjectContext;
- (id)apsConnectionMachServiceName;
- (id)cloudKitContainer;
- (id)cloudObjectFromLocalObjects:(id)a3 withTable:(id)a4 andObjectID:(id)a5;
- (id)containerIdentifier;
- (id)databaseFilePath;
- (id)managedObjectModelName;
- (void)_contentDidUpdate:(id)a3;
- (void)_identityDidChange:(id)a3;
- (void)_storesWillChange:(id)a3;
- (void)dealloc;
- (void)setClientCloudKitSyncs:(BOOL)a3;
- (void)setManagedObjectContext:(id)a3;
- (void)setupDatabase;
- (void)userAuthChanged;
@end

@implementation AXSSDatabaseManager

+ (int64_t)preferredContextType
{
  return 0;
}

- (AXSSDatabaseManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)AXSSDatabaseManager;
  v2 = [(AXSSDatabaseManager *)&v16 init];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)userAuthDidChange, (CFStringRef)*MEMORY[0x1E4FB90C8], 0, (CFNotificationSuspensionBehavior)0);
  id v4 = objc_alloc(MEMORY[0x1E4F48318]);
  uint64_t v5 = [v4 initWithTargetSerialQueue:MEMORY[0x1E4F14428]];
  identityChangeTimer = v2->_identityChangeTimer;
  v2->_identityChangeTimer = (AXDispatchTimer *)v5;

  [(AXDispatchTimer *)v2->_identityChangeTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
  v2->_lockNotificationToken = -1;
  p_lockNotificationToken = &v2->_lockNotificationToken;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  v8 = (const char **)getkSBSLockStateNotifyKeySymbolLoc_ptr;
  uint64_t v21 = getkSBSLockStateNotifyKeySymbolLoc_ptr;
  if (!getkSBSLockStateNotifyKeySymbolLoc_ptr)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __getkSBSLockStateNotifyKeySymbolLoc_block_invoke;
    v17[3] = &unk_1E606CF80;
    v17[4] = &v18;
    __getkSBSLockStateNotifyKeySymbolLoc_block_invoke((uint64_t)v17);
    v8 = (const char **)v19[3];
  }
  _Block_object_dispose(&v18, 8);
  if (!v8)
  {
    v13 = (_Unwind_Exception *)+[AXSSMotionTrackingCameraInput motionTrackingCameraInputWithAVCaptureDevice:]();
    _Block_object_dispose(&v18, 8);
    _Unwind_Resume(v13);
  }
  v9 = *v8;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __27__AXSSDatabaseManager_init__block_invoke;
  v14[3] = &unk_1E606DD00;
  v10 = v2;
  v15 = v10;
  v11 = (void *)MEMORY[0x1E4F14428];
  notify_register_dispatch(v9, p_lockNotificationToken, MEMORY[0x1E4F14428], v14);

  return v10;
}

uint64_t __27__AXSSDatabaseManager_init__block_invoke(uint64_t a1)
{
  uint64_t state64 = 0;
  uint64_t result = notify_get_state(*(_DWORD *)(*(void *)(a1 + 32) + 8), &state64);
  *(unsigned char *)(*(void *)(a1 + 32) + 12) = state64 == 1;
  return result;
}

- (id)databaseFilePath
{
  v3 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  id v4 = [v3 lastObject];

  uint64_t v5 = [v4 stringByAppendingPathComponent:@"Accessibility"];
  v6 = [(AXSSDatabaseManager *)self managedObjectModelName];
  v7 = [v5 stringByAppendingPathComponent:v6];
  v8 = [v7 stringByAppendingPathExtension:@"sqlite"];

  v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8];

  return v9;
}

- (void)setupDatabase
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1B3B9D000, log, OS_LOG_TYPE_ERROR, "Could not make directory: %@. error: %@", (uint8_t *)&v3, 0x16u);
}

void __36__AXSSDatabaseManager_setupDatabase__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = AXLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __36__AXSSDatabaseManager_setupDatabase__block_invoke_cold_1((uint64_t)v3, v4);
    }
  }
}

- (void)dealloc
{
  notify_cancel(self->_lockNotificationToken);
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AXSSDatabaseManager;
  [(AXSSDatabaseManager *)&v4 dealloc];
}

- (BOOL)canSave
{
  if (self->_isScreenedLocked)
  {
    v2 = [MEMORY[0x1E4F74230] sharedConnection];
    int v3 = [v2 isPasscodeSet] ^ 1;
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (id)cloudObjectFromLocalObjects:(id)a3 withTable:(id)a4 andObjectID:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [MEMORY[0x1E4F1CA80] set];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v8;
  uint64_t v31 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v31)
  {
    uint64_t v12 = *(void *)v35;
    uint64_t v28 = *(void *)v35;
    v29 = v11;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        v15 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:v9];
        uint64_t v32 = v14;
        objc_super v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ = %@", v10, v14];
        [v15 setPredicate:v16];

        [v15 setReturnsObjectsAsFaults:0];
        v17 = [(AXSSDatabaseManager *)self managedObjectContext];
        id v33 = 0;
        uint64_t v18 = [v17 executeFetchRequest:v15 error:&v33];
        id v19 = v33;

        uint64_t v20 = [v18 lastObject];
        if (v20) {
          BOOL v21 = v19 == 0;
        }
        else {
          BOOL v21 = 0;
        }
        if (!v21)
        {
          v22 = (void *)MEMORY[0x1E4F1C0A8];
          [(AXSSDatabaseManager *)self managedObjectContext];
          id v23 = v10;
          v25 = v24 = self;
          v26 = [v22 insertNewObjectForEntityForName:v9 inManagedObjectContext:v25];

          self = v24;
          id v10 = v23;
          uint64_t v12 = v28;
          [v26 setValue:v32 forKey:v10];
          uint64_t v20 = v26;
          v11 = v29;
        }
        [v11 addObject:v20];
      }
      uint64_t v31 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v31);
  }

  return v11;
}

- (void)_identityDidChange:(id)a3
{
  objc_super v4 = [(AXSSDatabaseManager *)self managedObjectContext];
  __int16 v5 = [v4 persistentStoreCoordinator];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__AXSSDatabaseManager__identityDidChange___block_invoke;
  v7[3] = &unk_1E606C9A0;
  id v8 = v5;
  id v9 = self;
  id v6 = v5;
  [v6 performBlock:v7];
}

void __42__AXSSDatabaseManager__identityDidChange___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  int v3 = [*(id *)(a1 + 40) databaseFilePath];
  objc_super v4 = [v2 persistentStoreForURL:v3];

  [*(id *)(a1 + 32) removePersistentStore:v4 error:0];
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(v5 + 16);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__AXSSDatabaseManager__identityDidChange___block_invoke_2;
  v7[3] = &unk_1E606C8C0;
  void v7[4] = v5;
  [v6 afterDelay:v7 processBlock:0.25];
}

uint64_t __42__AXSSDatabaseManager__identityDidChange___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setupDatabase];
}

- (void)_storesWillChange:(id)a3
{
  objc_super v4 = [(AXSSDatabaseManager *)self managedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__AXSSDatabaseManager__storesWillChange___block_invoke;
  v5[3] = &unk_1E606C8C0;
  v5[4] = self;
  [v4 performBlock:v5];
}

void __41__AXSSDatabaseManager__storesWillChange___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  int v3 = [v2 hasChanges];

  objc_super v4 = *(void **)(a1 + 32);
  if (v3)
  {
    id v9 = 0;
    char v5 = [v4 saveIfPossible:&v9];
    id v6 = v9;
    if ((v5 & 1) == 0)
    {
      uint64_t v7 = AXLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = v6;
        _os_log_impl(&dword_1B3B9D000, v7, OS_LOG_TYPE_DEFAULT, "Failed to save database due to storesWillChange: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v8 = [v4 managedObjectContext];
    [v8 reset];
  }
}

- (void)_contentDidUpdate:(id)a3
{
  id v4 = a3;
  char v5 = [(AXSSDatabaseManager *)self managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__AXSSDatabaseManager__contentDidUpdate___block_invoke;
  v7[3] = &unk_1E606C9A0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

void __41__AXSSDatabaseManager__contentDidUpdate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  [v2 mergeChangesFromContextDidSaveNotification:*(void *)(a1 + 40)];
}

- (BOOL)saveIfPossible:(id *)a3
{
  uint64_t v15 = 0;
  objc_super v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__8;
  v13 = __Block_byref_object_dispose__8;
  id v14 = 0;
  char v5 = [(AXSSDatabaseManager *)self managedObjectContext];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__AXSSDatabaseManager_saveIfPossible___block_invoke;
  v8[3] = &unk_1E606DD48;
  v8[4] = self;
  v8[5] = &v9;
  v8[6] = &v15;
  [v5 performBlockAndWait:v8];

  if (a3) {
    *a3 = (id) v10[5];
  }
  char v6 = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __38__AXSSDatabaseManager_saveIfPossible___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) canSave])
  {
    id v2 = [*(id *)(a1 + 32) managedObjectContext];
    int v3 = [v2 persistentStoreCoordinator];
    id v4 = [v3 persistentStores];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      char v6 = [*(id *)(a1 + 32) managedObjectContext];
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
      id obj = *(id *)(v7 + 40);
      [v6 save:&obj];
      objc_storeStrong((id *)(v7 + 40), obj);

      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                             + 40) == 0;
    }
  }
}

- (BOOL)clientCloudKitSyncs
{
  return self->_clientCloudKitSyncs;
}

- (void)setClientCloudKitSyncs:(BOOL)a3
{
  self->_clientCloudKitSyncs = a3;
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (void)setManagedObjectContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedObjectContext, 0);

  objc_storeStrong((id *)&self->_identityChangeTimer, 0);
}

+ (id)sharedDatabase
{
  uint64_t v2 = OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2(v2);
  return 0;
}

- (id)managedObjectModelName
{
  uint64_t v2 = OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2(v2);
  return 0;
}

- (id)cloudKitContainer
{
  uint64_t v2 = OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2(v2);
  return 0;
}

- (id)containerIdentifier
{
  uint64_t v2 = OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2(v2);
  return 0;
}

- (id)apsConnectionMachServiceName
{
  uint64_t v2 = OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2(v2);
  return 0;
}

- (void)userAuthChanged
{
  uint64_t v4 = OUTLINED_FUNCTION_0_2();

  MEMORY[0x1F40E7228](v3, v2, v4);
}

void __36__AXSSDatabaseManager_setupDatabase__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B3B9D000, a2, OS_LOG_TYPE_ERROR, "DB err: resetting storage coordinator %@", (uint8_t *)&v2, 0xCu);
}

@end