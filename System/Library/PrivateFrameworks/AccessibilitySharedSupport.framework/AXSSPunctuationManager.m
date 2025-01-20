@interface AXSSPunctuationManager
+ (NSString)overrideDatabasePath;
+ (id)sharedDatabase;
+ (void)initialize;
+ (void)setOverrideDatabasePath:(id)a3;
- (AXSSPunctuationManager)init;
- (BOOL)_saveIfPossible;
- (BOOL)cloudKitPushInSameProcess;
- (BOOL)cloudKitSync;
- (BOOL)isBasePunctuationGroup:(id)a3;
- (BOOL)isProtectedDataAvailable;
- (NSArray)punctuationGroups;
- (id)_databaseDirectoryPath;
- (id)_databaseFilePath;
- (id)_punctuationEntryFromManagedObject:(id)a3;
- (id)_punctuationGroupForEntry:(id)a3;
- (id)_punctuationGroupFromManagedObject:(id)a3;
- (id)allPunctuationGroup;
- (id)cloudRecordsToPurge:(id)a3;
- (id)mostBasePunctuationGroupForGroup:(id)a3;
- (id)nextDefaultGroupName;
- (id)nonePunctuationGroup;
- (id)parentPunctuationGroup:(id)a3;
- (id)punctuationEntriesForGroupUUID:(id)a3;
- (id)punctuationEntryForUUID:(id)a3;
- (id)punctuationEntryObjectFromLocalObjects:(id)a3;
- (id)punctuationGroupForUUID:(id)a3;
- (id)punctuationGroupsForContexts;
- (id)ruleToString:(int64_t)a3;
- (id)somePunctuationGroup;
- (int64_t)stringToRule:(id)a3;
- (void)_cloudKitUpdated:(id)a3;
- (void)_filterAutoswitchContexts:(id)a3 punctuationGroupsForContexts:(id)a4;
- (void)_initializeCloudKitHelpers;
- (void)_initializeDatabaseStartup;
- (void)_initializeSystemGroups;
- (void)_managedObjectChanged:(id)a3;
- (void)_saveIfPossible;
- (void)_setupDatabase;
- (void)_updateCloudKitHelpers;
- (void)addCloudRecordToPurge:(id)a3 recordEntityType:(id)a4;
- (void)importPunctuationGroup:(id)a3;
- (void)removeAllRecordsForPurge;
- (void)removeCloudRecordForPurge:(id)a3;
- (void)removeEntry:(id)a3;
- (void)removePunctuationGroup:(id)a3;
- (void)setCloudKitPushInSameProcess:(BOOL)a3;
- (void)setCloudKitSync:(BOOL)a3;
- (void)updateEntry:(id)a3;
- (void)updateEntry:(id)a3 fromCloudKit:(BOOL)a4;
- (void)updatePunctuationGroup:(id)a3;
- (void)updatePunctuationGroup:(id)a3 fromCloudKit:(BOOL)a4;
- (void)userAuthChanged;
@end

@implementation AXSSPunctuationManager

+ (NSString)overrideDatabasePath
{
  return (NSString *)(id)OverrideDatabasePath;
}

+ (void)setOverrideDatabasePath:(id)a3
{
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"00000000-0000-0000-0000-000000000001"];
    v3 = (void *)AXSSVoiceOverPunctuationGroupAll;
    AXSSVoiceOverPunctuationGroupAll = v2;

    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"00000000-0000-0000-0000-000000000002"];
    v5 = (void *)AXSSVoiceOverPunctuationGroupSome;
    AXSSVoiceOverPunctuationGroupSome = v4;

    AXSSVoiceOverPunctuationGroupNone = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"00000000-0000-0000-0000-000000000003"];
    MEMORY[0x1F41817F8]();
  }
}

+ (id)sharedDatabase
{
  if (sharedDatabase_onceToken != -1) {
    dispatch_once(&sharedDatabase_onceToken, &__block_literal_global);
  }
  uint64_t v2 = (void *)sharedDatabase_SharedDatabase;

  return v2;
}

uint64_t __40__AXSSPunctuationManager_sharedDatabase__block_invoke()
{
  sharedDatabase_SharedDatabase = [[AXSSPunctuationManager alloc] init];

  return MEMORY[0x1F41817F8]();
}

- (AXSSPunctuationManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)AXSSPunctuationManager;
  uint64_t v2 = [(AXSSDatabaseManager *)&v9 init];
  [(AXSSPunctuationManager *)v2 _initializeDatabaseStartup];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = *MEMORY[0x1E4F1BE30];
  v5 = [(AXSSDatabaseManager *)v2 managedObjectContext];
  [v3 addObserver:v2 selector:sel__managedObjectChanged_ name:v4 object:v5];

  v6 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v6 addObserver:v2 selector:sel__cloudKitUpdated_ name:@"AXSSVoiceOverPunctuationCloudKitUpdateNotification" object:0];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)onKeybagLockStatusChange, (CFStringRef)[NSString stringWithUTF8String:*MEMORY[0x1E4F78160]], 0, CFNotificationSuspensionBehaviorDrop);
  return v2;
}

- (void)_initializeDatabaseStartup
{
  if ([(AXSSPunctuationManager *)self isProtectedDataAvailable])
  {
    if (self->_finishedInitialization) {
      return;
    }
    [(AXSSPunctuationManager *)self _setupDatabase];
    [(AXSSPunctuationManager *)self _initializeSystemGroups];
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:@"AXSSVoiceOverPunctuationGroupsChangedNotification" object:0 userInfo:0];

    uint64_t v4 = AXLogPunctuationStorage();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      __int16 v8 = 0;
      v5 = "Finished initialization of database, posting groups have changed locally";
      v6 = (uint8_t *)&v8;
LABEL_7:
      _os_log_impl(&dword_1B3B9D000, v4, OS_LOG_TYPE_INFO, v5, v6, 2u);
    }
  }
  else
  {
    uint64_t v4 = AXLogPunctuationStorage();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      __int16 v7 = 0;
      v5 = "Protected data not available, not setting up database";
      v6 = (uint8_t *)&v7;
      goto LABEL_7;
    }
  }
}

- (void)_initializeSystemGroups
{
  id v6 = [(AXSSPunctuationManager *)self punctuationGroups];
  if ((objc_msgSend(v6, "ax_containsObjectUsingBlock:", &__block_literal_global_18) & 1) == 0)
  {
    v3 = objc_opt_new();
    [v3 setUuid:AXSSVoiceOverPunctuationGroupAll];
    [(AXSSPunctuationManager *)self updatePunctuationGroup:v3];
  }
  if ((objc_msgSend(v6, "ax_containsObjectUsingBlock:", &__block_literal_global_21) & 1) == 0)
  {
    uint64_t v4 = objc_opt_new();
    [v4 setUuid:AXSSVoiceOverPunctuationGroupSome];
    [(AXSSPunctuationManager *)self updatePunctuationGroup:v4];
  }
  if ((objc_msgSend(v6, "ax_containsObjectUsingBlock:", &__block_literal_global_23) & 1) == 0)
  {
    v5 = objc_opt_new();
    [v5 setUuid:AXSSVoiceOverPunctuationGroupNone];
    [(AXSSPunctuationManager *)self updatePunctuationGroup:v5];
  }
}

uint64_t __49__AXSSPunctuationManager__initializeSystemGroups__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 uuid];
  uint64_t v3 = [v2 isEqual:AXSSVoiceOverPunctuationGroupAll];

  return v3;
}

uint64_t __49__AXSSPunctuationManager__initializeSystemGroups__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 uuid];
  uint64_t v3 = [v2 isEqual:AXSSVoiceOverPunctuationGroupSome];

  return v3;
}

uint64_t __49__AXSSPunctuationManager__initializeSystemGroups__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 uuid];
  uint64_t v3 = [v2 isEqual:AXSSVoiceOverPunctuationGroupNone];

  return v3;
}

- (void)setCloudKitPushInSameProcess:(BOOL)a3
{
  self->_BOOL cloudKitPushInSameProcess = a3;
  -[AXSSCloudKitHelper setObserveLocalDatabaseChanges:](self->_punctuationEntryCloudKitHelper, "setObserveLocalDatabaseChanges:");
  BOOL cloudKitPushInSameProcess = self->_cloudKitPushInSameProcess;
  punctuationGroupCloudKitHelper = self->_punctuationGroupCloudKitHelper;

  [(AXSSCloudKitHelper *)punctuationGroupCloudKitHelper setObserveLocalDatabaseChanges:cloudKitPushInSameProcess];
}

- (id)punctuationEntriesForGroupUUID:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [(AXSSDatabaseManager *)self managedObjectContext];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__AXSSPunctuationManager_punctuationEntriesForGroupUUID___block_invoke;
  v12[3] = &unk_1E606C898;
  id v13 = v4;
  v14 = self;
  id v7 = v5;
  id v15 = v7;
  id v8 = v4;
  [v6 performBlockAndWait:v12];

  objc_super v9 = v15;
  id v10 = v7;

  return v10;
}

void __57__AXSSPunctuationManager_punctuationEntriesForGroupUUID___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[AXSS_PunctuationEntry fetchRequest];
  uint64_t v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"groupUUID = %@", *(void *)(a1 + 32)];
  [v2 setPredicate:v3];

  [v2 setReturnsObjectsAsFaults:0];
  id v4 = [*(id *)(a1 + 40) managedObjectContext];
  id v18 = 0;
  v5 = [v4 executeFetchRequest:v2 error:&v18];
  id v6 = v18;

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(a1 + 48);
        id v13 = [*(id *)(a1 + 40) _punctuationEntryFromManagedObject:*(void *)(*((void *)&v14 + 1) + 8 * v11)];
        [v12 addObject:v13];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)_initializeCloudKitHelpers
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = AXLogPunctuationStorage();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(AXSSDatabaseManager *)self managedObjectContext];
    int v14 = 138412290;
    long long v15 = v4;
    _os_log_impl(&dword_1B3B9D000, v3, OS_LOG_TYPE_INFO, "Initialization cloud kit helpers with object context: %@", (uint8_t *)&v14, 0xCu);
  }
  v5 = [(AXSSDatabaseManager *)self managedObjectContext];

  if (v5)
  {
    id v6 = [(AXSSCloudKitHelper *)[AXSSPunctuationEntryCloudKitHelper alloc] initWithContainerIdentifier:@"com.apple.accessibility.VoiceOverPunctuation" zoneName:@"com.accessibility.voiceover.punctuation"];
    punctuationEntryCloudKitHelper = self->_punctuationEntryCloudKitHelper;
    self->_punctuationEntryCloudKitHelper = v6;

    uint64_t v8 = [(AXSSCloudKitHelper *)[AXSSPunctuationGroupCloudKitHelper alloc] initWithContainerIdentifier:@"com.apple.accessibility.VoiceOverPunctuation" zoneName:@"com.accessibility.voiceover.punctuation"];
    punctuationGroupCloudKitHelper = self->_punctuationGroupCloudKitHelper;
    self->_punctuationGroupCloudKitHelper = v8;

    [(AXSSPunctuationManager *)self _updateCloudKitHelpers];
    uint64_t v10 = self->_punctuationEntryCloudKitHelper;
    uint64_t v11 = [(AXSSDatabaseManager *)self managedObjectContext];
    [(AXSSCloudKitHelper *)v10 observeChangesForManagedContext:v11];

    v12 = self->_punctuationGroupCloudKitHelper;
    id v13 = [(AXSSDatabaseManager *)self managedObjectContext];
    [(AXSSCloudKitHelper *)v12 observeChangesForManagedContext:v13];
  }
}

- (void)_updateCloudKitHelpers
{
  BOOL v3 = [(AXSSPunctuationManager *)self isProtectedDataAvailable];
  [(AXSSCloudKitHelper *)self->_punctuationEntryCloudKitHelper setIsProtectedDataAvailable:v3];
  punctuationGroupCloudKitHelper = self->_punctuationGroupCloudKitHelper;

  [(AXSSCloudKitHelper *)punctuationGroupCloudKitHelper setIsProtectedDataAvailable:v3];
}

- (BOOL)isProtectedDataAvailable
{
  return MKBGetDeviceLockState() != 1;
}

- (void)setCloudKitSync:(BOOL)a3
{
  self->_cloudKitSync = a3;
  if (self->_punctuationEntryCloudKitHelper) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = !a3;
  }
  if (v4)
  {
    if (!a3)
    {
      punctuationGroupCloudKitHelper = self->_punctuationGroupCloudKitHelper;
      self->_punctuationGroupCloudKitHelper = 0;

      punctuationEntryCloudKitHelper = self->_punctuationEntryCloudKitHelper;
      self->_punctuationEntryCloudKitHelper = 0;
    }
  }
  else
  {
    [(AXSSPunctuationManager *)self _initializeCloudKitHelpers];
  }
  [(AXSSCloudKitHelper *)self->_punctuationEntryCloudKitHelper setObserveLocalDatabaseChanges:self->_cloudKitPushInSameProcess];
  [(AXSSCloudKitHelper *)self->_punctuationGroupCloudKitHelper setObserveLocalDatabaseChanges:self->_cloudKitPushInSameProcess];
  id v7 = [(AXSSDatabaseManager *)self managedObjectContext];
  [v7 setStalenessInterval:0.0];
}

- (void)_cloudKitUpdated:(id)a3
{
  BOOL v4 = AXLogPunctuationStorage();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[AXSSPunctuationManager _cloudKitUpdated:](self, v4);
  }

  if (![(AXSSPunctuationManager *)self cloudKitSync])
  {
    v5 = [(AXSSDatabaseManager *)self managedObjectContext];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __43__AXSSPunctuationManager__cloudKitUpdated___block_invoke;
    v7[3] = &unk_1E606C8C0;
    v7[4] = self;
    [v5 performBlock:v7];

    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:@"AXSSVoiceOverPunctuationGroupsChangedNotification" object:0 userInfo:0];
  }
}

void __43__AXSSPunctuationManager__cloudKitUpdated___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) managedObjectContext];
  [v1 refreshAllObjects];
}

- (void)_managedObjectChanged:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(AXSSPunctuationManager *)self cloudKitPushInSameProcess]
    || ![(AXSSPunctuationManager *)self cloudKitSync])
  {
    id v6 = [v4 userInfo];
    uint64_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F1BDF8]];

    uint64_t v8 = [v4 userInfo];
    v37 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F1BDC0]];

    uint64_t v9 = AXLogPunctuationStorage();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = [v4 userInfo];
      uint64_t v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      *(_DWORD *)buf = 138412546;
      v45 = v10;
      __int16 v46 = 2112;
      v47 = v11;
      _os_log_impl(&dword_1B3B9D000, v9, OS_LOG_TYPE_INFO, "MOC changed: %@ %@", buf, 0x16u);
    }
    v12 = [MEMORY[0x1E4F1CA80] set];
    id v13 = [v4 userInfo];
    uint64_t v14 = *MEMORY[0x1E4F1BFA8];
    long long v15 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F1BFA8]];

    if (v15)
    {
      uint64_t v16 = [v15 allObjects];
      [v12 addObjectsFromArray:v16];
    }
    v38 = v7;
    long long v17 = [v4 userInfo];
    id v18 = [v17 objectForKeyedSubscript:v14];

    if (v18)
    {
      v19 = [v18 allObjects];
      [v12 addObjectsFromArray:v19];
    }
    v36 = v18;
    uint64_t v20 = [v4 userInfo];
    v21 = [v20 objectForKeyedSubscript:v14];

    if (v21)
    {
      v22 = [v21 allObjects];
      [v12 addObjectsFromArray:v22];
    }
    v35 = v21;
    v23 = [MEMORY[0x1E4F1CA80] set];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v24 = v12;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v40 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = *(void *)(*((void *)&v39 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v23 addObject:v29];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v30 = [(AXSSPunctuationManager *)self _punctuationGroupForEntry:v29];
              if (v30) {
                [v23 addObject:v30];
              }
            }
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v26);
    }

    v5 = v38;
    if (-[NSObject count](v38, "count") || [v37 count] || -[NSObject count](v23, "count"))
    {
      v31 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v31 postNotificationName:@"AXSSVoiceOverPunctuationGroupsChangedNotification" object:0];

      v32 = [MEMORY[0x1E4F28C40] defaultCenter];
      [v32 postNotificationName:@"AXSSVoiceOverPunctuationGroupsChangedNotification" object:0];

      v33 = AXLogPunctuationStorage();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v45 = v38;
        __int16 v46 = 2112;
        v47 = v37;
        _os_log_impl(&dword_1B3B9D000, v33, OS_LOG_TYPE_INFO, "MOC changed - posting groups changed because inserted/deleted count: %@/%@", buf, 0x16u);
      }
    }
    v34 = AXLogPunctuationStorage();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v23;
      _os_log_impl(&dword_1B3B9D000, v34, OS_LOG_TYPE_INFO, "Processing changes for groups: %@", buf, 0xCu);
    }
  }
  else
  {
    v5 = AXLogPunctuationStorage();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[AXSSPunctuationManager _managedObjectChanged:](v5);
    }
  }
}

- (id)nextDefaultGroupName
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v2 = [(AXSSPunctuationManager *)self punctuationGroups];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v2);
        }
        uint64_t v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (([v9 isSystemPunctuationGroup] & 1) == 0)
        {
          ++v5;
          uint64_t v10 = (void *)MEMORY[0x1E4F28FE8];
          uint64_t v11 = [v9 name];
          v12 = [v10 localizedScannerWithString:v11];

          id v13 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
          uint64_t v14 = [v13 invertedSet];
          [v12 setCharactersToBeSkipped:v14];

          int v21 = 0;
          [v12 scanInt:&v21];
          if (v6 <= v21) {
            uint64_t v6 = v21;
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }

  long long v15 = NSString;
  uint64_t v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
  long long v17 = [v16 localizedStringForKey:@"PUNCTUATION_DEFUALT_GROUP_NAME" value:&stru_1F0C5BA58 table:@"AccessibilitySharedSupport"];
  if (v6 <= 0) {
    uint64_t v18 = v5;
  }
  else {
    uint64_t v18 = v6;
  }
  v19 = objc_msgSend(v15, "localizedStringWithFormat:", v17, v18 + 1);

  return v19;
}

- (id)_databaseDirectoryPath
{
  uint64_t v2 = [(id)AXCPSharedResourcesDirectory() stringByAppendingPathComponent:@"Library"];
  uint64_t v3 = [(id)objc_opt_class() overrideDatabasePath];

  if (v3)
  {
    uint64_t v4 = [(id)objc_opt_class() overrideDatabasePath];

    uint64_t v2 = (void *)v4;
  }
  uint64_t v5 = [v2 stringByAppendingPathComponent:@"Accessibility"];
  uint64_t v6 = [v5 stringByAppendingPathComponent:@"AXSSPunctuation"];

  return v6;
}

- (id)_databaseFilePath
{
  uint64_t v2 = [(AXSSPunctuationManager *)self _databaseDirectoryPath];
  uint64_t v3 = [v2 stringByAppendingPathComponent:@"AXSSPunctuation.sqlite"];

  return v3;
}

- (void)userAuthChanged
{
  [(AXSSPunctuationManager *)self _setupDatabase];
  uint64_t v3 = [(AXSSDatabaseManager *)self managedObjectContext];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__AXSSPunctuationManager_userAuthChanged__block_invoke;
  v4[3] = &unk_1E606C8C0;
  v4[4] = self;
  [v3 performBlockAndWait:v4];
}

uint64_t __41__AXSSPunctuationManager_userAuthChanged__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _saveIfPossible];
}

- (void)_setupDatabase
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1(&dword_1B3B9D000, v0, v1, "Punctuation db: %@", v2, v3, v4, v5, v6);
}

void __40__AXSSPunctuationManager__setupDatabase__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void **)(a1 + 32);
  uint8_t v6 = [*(id *)(a1 + 40) URL];
  uint64_t v7 = [v5 persistentStoreForURL:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if (v4 || !*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    uint64_t v10 = AXLogPunctuationStorage();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __40__AXSSPunctuationManager__setupDatabase__block_invoke_cold_1();
    }

    [*(id *)(a1 + 48) setPersistentStoreCoordinator:0];
  }
  *(unsigned char *)(*(void *)(a1 + 56) + 56) = 0;
}

- (BOOL)_saveIfPossible
{
  BOOL v3 = [(AXSSDatabaseManager *)self canSave];
  if (v3)
  {
    id v4 = [(AXSSDatabaseManager *)self managedObjectContext];
    uint64_t v5 = [v4 persistentStoreCoordinator];
    uint8_t v6 = [v5 persistentStores];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      uint64_t v8 = [(AXSSDatabaseManager *)self managedObjectContext];
      id v12 = 0;
      [v8 save:&v12];
      id v9 = v12;

      if (!v9)
      {
        LOBYTE(v3) = 1;
        return v3;
      }
      uint64_t v10 = AXLogPunctuationStorage();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[AXSSPunctuationManager _saveIfPossible]();
      }
    }
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)isBasePunctuationGroup:(id)a3
{
  id v3 = a3;
  if (([v3 isEqual:AXSSVoiceOverPunctuationGroupSome] & 1) != 0
    || ([v3 isEqual:AXSSVoiceOverPunctuationGroupAll] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqual:AXSSVoiceOverPunctuationGroupNone];
  }

  return v4;
}

- (void)addCloudRecordToPurge:(id)a3 recordEntityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = [(AXSSDatabaseManager *)self managedObjectContext];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __65__AXSSPunctuationManager_addCloudRecordToPurge_recordEntityType___block_invoke;
    v10[3] = &unk_1E606C898;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    [v8 performBlockAndWait:v10];
  }
  else
  {
    id v9 = AXLogPunctuationStorage();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[AXSSPunctuationManager addCloudRecordToPurge:recordEntityType:](v9);
    }
  }
}

void __65__AXSSPunctuationManager_addCloudRecordToPurge_recordEntityType___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F1C0A8];
  id v3 = [*(id *)(a1 + 32) managedObjectContext];
  char v4 = [v2 insertNewObjectForEntityForName:@"AXSS_PunctuationCloudDeletionCache" inManagedObjectContext:v3];

  [v4 setUuid:*(void *)(a1 + 40)];
  [v4 setEntityType:*(void *)(a1 + 48)];
  uint64_t v5 = AXLogPunctuationStorage();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    int v8 = 138412546;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    _os_log_impl(&dword_1B3B9D000, v5, OS_LOG_TYPE_INFO, "Store purge record: %@ for %@", (uint8_t *)&v8, 0x16u);
  }

  [*(id *)(a1 + 32) _saveIfPossible];
}

- (id)cloudRecordsToPurge:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy_;
  long long v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  uint64_t v5 = [(AXSSDatabaseManager *)self managedObjectContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__AXSSPunctuationManager_cloudRecordsToPurge___block_invoke;
  v9[3] = &unk_1E606C950;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = self;
  uint64_t v12 = &v13;
  [v5 performBlockAndWait:v9];

  id v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __46__AXSSPunctuationManager_cloudRecordsToPurge___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"AXSS_PunctuationCloudDeletionCache"];
  id v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"entityType = %@", *(void *)(a1 + 32)];
  [v2 setPredicate:v3];

  [v2 setReturnsObjectsAsFaults:0];
  id v4 = [*(id *)(a1 + 40) managedObjectContext];
  id v12 = 0;
  uint64_t v5 = [v4 executeFetchRequest:v2 error:&v12];
  id v6 = v12;

  if (v6)
  {
    id v7 = AXLogPunctuationStorage();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __46__AXSSPunctuationManager_cloudRecordsToPurge___block_invoke_cold_1();
    }
  }
  int v8 = objc_msgSend(v5, "ax_filteredArrayUsingBlock:", &__block_literal_global_87);

  uint64_t v9 = objc_msgSend(v8, "ax_mappedArrayUsingBlock:", &__block_literal_global_90);
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

BOOL __46__AXSSPunctuationManager_cloudRecordsToPurge___block_invoke_84(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 uuid];
  BOOL v3 = v2 != 0;

  return v3;
}

uint64_t __46__AXSSPunctuationManager_cloudRecordsToPurge___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

- (void)removeAllRecordsForPurge
{
  BOOL v3 = [(AXSSDatabaseManager *)self managedObjectContext];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__AXSSPunctuationManager_removeAllRecordsForPurge__block_invoke;
  v4[3] = &unk_1E606C8C0;
  v4[4] = self;
  [v3 performBlock:v4];
}

void __50__AXSSPunctuationManager_removeAllRecordsForPurge__block_invoke(uint64_t a1)
{
  uint64_t v2 = +[AXSS_PunctuationCloudDeletionCache fetchRequest];
  [v2 setReturnsObjectsAsFaults:0];
  BOOL v3 = [*(id *)(a1 + 32) managedObjectContext];
  id v8 = 0;
  id v4 = [v3 executeFetchRequest:v2 error:&v8];
  id v5 = v8;

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__AXSSPunctuationManager_removeAllRecordsForPurge__block_invoke_2;
  v7[3] = &unk_1E606C978;
  v7[4] = *(void *)(a1 + 32);
  [v4 enumerateObjectsUsingBlock:v7];
  if (v5)
  {
    id v6 = AXLogPunctuationStorage();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __50__AXSSPunctuationManager_removeAllRecordsForPurge__block_invoke_cold_1();
    }
  }
  [*(id *)(a1 + 32) _saveIfPossible];
}

void __50__AXSSPunctuationManager_removeAllRecordsForPurge__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 managedObjectContext];
  [v4 deleteObject:v3];
}

- (void)removeCloudRecordForPurge:(id)a3
{
  id v4 = a3;
  id v5 = [(AXSSDatabaseManager *)self managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__AXSSPunctuationManager_removeCloudRecordForPurge___block_invoke;
  v7[3] = &unk_1E606C9A0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  [v5 performBlock:v7];
}

void __52__AXSSPunctuationManager_removeCloudRecordForPurge___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[AXSS_PunctuationCloudDeletionCache fetchRequest];
  id v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid = %@", *(void *)(a1 + 32)];
  [v2 setPredicate:v3];

  [v2 setReturnsObjectsAsFaults:0];
  id v4 = [*(id *)(a1 + 40) managedObjectContext];
  id v9 = 0;
  id v5 = [v4 executeFetchRequest:v2 error:&v9];
  id v6 = v9;

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__AXSSPunctuationManager_removeCloudRecordForPurge___block_invoke_2;
  v8[3] = &unk_1E606C978;
  v8[4] = *(void *)(a1 + 40);
  [v5 enumerateObjectsUsingBlock:v8];
  if (v6)
  {
    id v7 = AXLogPunctuationStorage();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __50__AXSSPunctuationManager_removeAllRecordsForPurge__block_invoke_cold_1();
    }
  }
  [*(id *)(a1 + 40) _saveIfPossible];
}

void __52__AXSSPunctuationManager_removeCloudRecordForPurge___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 managedObjectContext];
  [v4 deleteObject:v3];
}

- (id)parentPunctuationGroup:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy_;
  long long v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  id v5 = [(AXSSDatabaseManager *)self managedObjectContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__AXSSPunctuationManager_parentPunctuationGroup___block_invoke;
  v9[3] = &unk_1E606C950;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = self;
  id v12 = &v13;
  [v5 performBlockAndWait:v9];

  id v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __49__AXSSPunctuationManager_parentPunctuationGroup___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[AXSS_PunctuationGroup fetchRequest];
  id v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = [*(id *)(a1 + 32) basePunctuationUUID];
  id v5 = [v3 predicateWithFormat:@"uuid = %@", v4];
  [v2 setPredicate:v5];

  [v2 setReturnsObjectsAsFaults:0];
  id v6 = [*(id *)(a1 + 40) managedObjectContext];
  id v15 = 0;
  id v7 = [v6 executeFetchRequest:v2 error:&v15];
  id v8 = v15;

  if (v8)
  {
    id v9 = AXLogPunctuationStorage();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __49__AXSSPunctuationManager_parentPunctuationGroup___block_invoke_cold_1();
    }
  }
  id v10 = *(void **)(a1 + 40);
  uint64_t v11 = [v7 lastObject];
  uint64_t v12 = [v10 _punctuationGroupFromManagedObject:v11];
  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;
}

- (id)mostBasePunctuationGroupForGroup:(id)a3
{
  id v4 = a3;
  if ([v4 isSystemPunctuationGroup])
  {
    id v5 = [v4 uuid];
  }
  else
  {
    uint64_t v6 = [v4 basePunctuationUUID];
    if (v6)
    {
      id v7 = (void *)v6;
      while (1)
      {
        id v8 = [v4 basePunctuationUUID];
        BOOL v9 = [(AXSSPunctuationManager *)self isBasePunctuationGroup:v8];

        if (v9) {
          break;
        }
        id v10 = [(AXSSPunctuationManager *)self parentPunctuationGroup:v4];
        uint64_t v11 = [v10 uuid];
        uint64_t v12 = [v4 uuid];
        int v13 = [v11 isEqual:v12];

        if (v13)
        {

          break;
        }

        id v7 = [v10 basePunctuationUUID];
        id v4 = v10;
        if (!v7) {
          goto LABEL_11;
        }
      }
    }
    id v10 = v4;
LABEL_11:
    id v5 = [v10 basePunctuationUUID];
    id v4 = v10;
  }

  return v5;
}

- (id)_punctuationGroupForEntry:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy_;
  long long v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  id v5 = [(AXSSDatabaseManager *)self managedObjectContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__AXSSPunctuationManager__punctuationGroupForEntry___block_invoke;
  v9[3] = &unk_1E606C9C8;
  id v6 = v4;
  uint64_t v11 = self;
  uint64_t v12 = &v13;
  id v10 = v6;
  [v5 performBlockAndWait:v9];

  id v7 = [(id)v14[5] lastObject];

  _Block_object_dispose(&v13, 8);

  return v7;
}

void __52__AXSSPunctuationManager__punctuationGroupForEntry___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[AXSS_PunctuationGroup fetchRequest];
  id v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = [*(id *)(a1 + 32) groupUUID];
  id v5 = [v3 predicateWithFormat:@"uuid = %@", v4];
  [v2 setPredicate:v5];

  [v2 setReturnsObjectsAsFaults:0];
  id v6 = [*(id *)(a1 + 40) managedObjectContext];
  id v12 = 0;
  uint64_t v7 = [v6 executeFetchRequest:v2 error:&v12];
  id v8 = v12;
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;

  if (v8)
  {
    uint64_t v11 = AXLogPunctuationStorage();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __52__AXSSPunctuationManager__punctuationGroupForEntry___block_invoke_cold_1();
    }
  }
}

- (void)importPunctuationGroup:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F29128] UUID];
  [v4 setUuid:v5];

  id v6 = AXLogPunctuationStorage();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v4 name];
    *(_DWORD *)buf = 138412290;
    long long v25 = v7;
    _os_log_impl(&dword_1B3B9D000, v6, OS_LOG_TYPE_DEFAULT, "Importing group: %@", buf, 0xCu);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = [v4 entries];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v20;
    *(void *)&long long v10 = 138412290;
    long long v18 = v10;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * v13);
        uint64_t v15 = objc_msgSend(MEMORY[0x1E4F29128], "UUID", v18);
        [v14 setUuid:v15];

        uint64_t v16 = [v4 uuid];
        [v14 setGroupUUID:v16];

        long long v17 = AXLogPunctuationStorage();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v18;
          long long v25 = v14;
          _os_log_impl(&dword_1B3B9D000, v17, OS_LOG_TYPE_DEFAULT, "Importing entry: %@", buf, 0xCu);
        }

        [(AXSSPunctuationManager *)self updateEntry:v14];
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  [(AXSSPunctuationManager *)self updatePunctuationGroup:v4];
}

- (id)punctuationEntryObjectFromLocalObjects:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = __Block_byref_object_copy_;
    uint64_t v16 = __Block_byref_object_dispose_;
    id v17 = 0;
    id v5 = [(AXSSDatabaseManager *)self managedObjectContext];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __65__AXSSPunctuationManager_punctuationEntryObjectFromLocalObjects___block_invoke;
    v8[3] = &unk_1E606C9C8;
    long long v10 = self;
    uint64_t v11 = &v12;
    id v9 = v4;
    [v5 performBlockAndWait:v8];

    id v6 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v13[5]];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __65__AXSSPunctuationManager_punctuationEntryObjectFromLocalObjects___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"AXSS_PunctuationEntry"];
  id v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = objc_msgSend(*(id *)(a1 + 32), "ax_mappedArrayUsingBlock:", &__block_literal_global_104);
  id v5 = [v3 predicateWithFormat:@"uuid IN %@", v4];
  [v2 setPredicate:v5];

  [v2 setReturnsObjectsAsFaults:0];
  id v6 = [*(id *)(a1 + 40) managedObjectContext];
  id v12 = 0;
  uint64_t v7 = [v6 executeFetchRequest:v2 error:&v12];
  id v8 = v12;
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  long long v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;

  if (v8)
  {
    uint64_t v11 = AXLogPunctuationStorage();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __46__AXSSPunctuationManager_cloudRecordsToPurge___block_invoke_cold_1();
    }
  }
}

id __65__AXSSPunctuationManager_punctuationEntryObjectFromLocalObjects___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 uuid];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = AXLogPunctuationStorage();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __65__AXSSPunctuationManager_punctuationEntryObjectFromLocalObjects___block_invoke_2_cold_1();
    }

    id v5 = [MEMORY[0x1E4F29128] UUID];
  }
  uint64_t v7 = v5;

  return v7;
}

- (void)updatePunctuationGroup:(id)a3
{
}

- (void)updatePunctuationGroup:(id)a3 fromCloudKit:(BOOL)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = AXLogPunctuationStorage();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [MEMORY[0x1E4F29060] callStackSymbols];
      *(_DWORD *)buf = 138412290;
      id v17 = v8;
      _os_log_impl(&dword_1B3B9D000, v7, OS_LOG_TYPE_INFO, "1 storing entries: %@", buf, 0xCu);
    }
    uint64_t v9 = [(AXSSDatabaseManager *)self managedObjectContext];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __62__AXSSPunctuationManager_updatePunctuationGroup_fromCloudKit___block_invoke;
    v11[3] = &unk_1E606CA10;
    id v12 = v9;
    id v13 = v6;
    uint64_t v14 = self;
    BOOL v15 = a4;
    id v10 = v9;
    [v10 performBlock:v11];
  }
}

void __62__AXSSPunctuationManager_updatePunctuationGroup_fromCloudKit___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) refreshAllObjects];
  id v2 = +[AXSS_PunctuationGroup fetchRequest];
  id v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = [*(id *)(a1 + 40) uuid];
  id v5 = [v3 predicateWithFormat:@"uuid = %@", v4];
  [v2 setPredicate:v5];

  [v2 setReturnsObjectsAsFaults:0];
  id v6 = *(void **)(a1 + 32);
  id v35 = 0;
  uint64_t v7 = [v6 executeFetchRequest:v2 error:&v35];
  id v8 = v35;
  uint64_t v9 = [v7 lastObject];
  id v10 = (void *)v9;
  if (v9) {
    BOOL v11 = v8 == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    uint64_t v14 = (void *)v9;
  }
  else
  {
    id v12 = (void *)MEMORY[0x1E4F1C0A8];
    id v13 = [*(id *)(a1 + 48) managedObjectContext];
    uint64_t v14 = [v12 insertNewObjectForEntityForName:@"AXSS_PunctuationGroup" inManagedObjectContext:v13];

    if (v8)
    {
      BOOL v15 = AXLogPunctuationStorage();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __62__AXSSPunctuationManager_updatePunctuationGroup_fromCloudKit___block_invoke_cold_1();
      }
    }
  }
  uint64_t v16 = [*(id *)(a1 + 40) basePunctuationUUID];
  [v14 setBasePunctuationUUID:v16];

  id v17 = [*(id *)(a1 + 40) uuid];
  [v14 setUuid:v17];

  uint64_t v18 = *(void **)(a1 + 48);
  long long v19 = [*(id *)(a1 + 40) autoSwitchContexts];
  long long v20 = [v18 cloudObjectFromLocalObjects:v19 withTable:@"AXSS_PunctuationContext" andObjectID:@"contextIdentifier"];
  [v14 setAutoSwitchContexts:v20];

  long long v21 = [*(id *)(a1 + 40) name];
  [v14 setName:v21];

  [v14 setVersion:1];
  objc_msgSend(v14, "setInCloud:", objc_msgSend(*(id *)(a1 + 40), "inCloud"));
  long long v22 = [MEMORY[0x1E4F1C9C8] date];
  [v14 setLastModifiedDate:v22];

  if (*(unsigned char *)(a1 + 56))
  {
    long long v23 = [*(id *)(a1 + 40) ckChangeTag];
    [v14 setCkChangeTag:v23];

    long long v24 = [*(id *)(a1 + 40) ckRecordProcessDate];
    [v14 setCkRecordProcessDate:v24];
  }
  else
  {
    [v14 setCkChangeTag:0];
    [v14 setCkRecordProcessDate:0];
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v25 = [v14 autoSwitchContexts];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v31 objects:v38 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v32 != v28) {
          objc_enumerationMutation(v25);
        }
        [*(id *)(*((void *)&v31 + 1) + 8 * i) setGroup:v14];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v31 objects:v38 count:16];
    }
    while (v27);
  }

  v30 = AXLogPunctuationStorage();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v37 = v14;
    _os_log_impl(&dword_1B3B9D000, v30, OS_LOG_TYPE_INFO, "2 storing entries: %@", buf, 0xCu);
  }

  [*(id *)(a1 + 40) setInDatabase:1];
  [*(id *)(a1 + 48) _saveIfPossible];
}

- (void)removePunctuationGroup:(id)a3
{
  id v4 = a3;
  if ([v4 inCloud])
  {
    id v5 = [v4 uuid];
    id v6 = +[AXSSPunctuationGroup description];
    [(AXSSPunctuationManager *)self addCloudRecordToPurge:v5 recordEntityType:v6];
  }
  uint64_t v7 = [(AXSSDatabaseManager *)self managedObjectContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__AXSSPunctuationManager_removePunctuationGroup___block_invoke;
  v9[3] = &unk_1E606C9A0;
  id v10 = v4;
  BOOL v11 = self;
  id v8 = v4;
  [v7 performBlockAndWait:v9];
}

void __49__AXSSPunctuationManager_removePunctuationGroup___block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = [*(id *)(a1 + 32) entries];
  uint64_t v33 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
  id v2 = 0;
  if (v33)
  {
    uint64_t v32 = *(void *)v44;
    do
    {
      uint64_t v3 = 0;
      id v4 = v2;
      do
      {
        if (*(void *)v44 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v35 = v3;
        id v5 = *(void **)(*((void *)&v43 + 1) + 8 * v3);
        id v6 = +[AXSS_PunctuationEntry fetchRequest];
        uint64_t v7 = (void *)MEMORY[0x1E4F28F60];
        id v8 = [v5 uuid];
        uint64_t v9 = [v7 predicateWithFormat:@"uuid = %@", v8];
        [v6 setPredicate:v9];

        [v6 setReturnsObjectsAsFaults:0];
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v10 = [*(id *)(a1 + 40) managedObjectContext];
        id v38 = v4;
        long long v34 = v6;
        BOOL v11 = [v10 executeFetchRequest:v6 error:&v38];
        id v36 = v38;

        uint64_t v12 = [v11 countByEnumeratingWithState:&v39 objects:v47 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v40;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v40 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void **)(*((void *)&v39 + 1) + 8 * i);
              if ([v16 inCloud])
              {
                id v17 = *(void **)(a1 + 40);
                uint64_t v18 = [v16 uuid];
                long long v19 = +[AXSSPunctuationEntry description];
                [v17 addCloudRecordToPurge:v18 recordEntityType:v19];
              }
              long long v20 = [*(id *)(a1 + 40) managedObjectContext];
              [v20 deleteObject:v16];
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v39 objects:v47 count:16];
          }
          while (v13);
        }

        id v2 = v36;
        uint64_t v3 = v35 + 1;
        id v4 = v36;
      }
      while (v35 + 1 != v33);
      uint64_t v33 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v33);
  }

  long long v21 = +[AXSS_PunctuationGroup fetchRequest];
  long long v22 = (void *)MEMORY[0x1E4F28F60];
  long long v23 = [*(id *)(a1 + 32) uuid];
  long long v24 = [v22 predicateWithFormat:@"uuid = %@", v23];
  [v21 setPredicate:v24];

  [v21 setReturnsObjectsAsFaults:0];
  long long v25 = [*(id *)(a1 + 40) managedObjectContext];
  id v37 = v2;
  uint64_t v26 = [v25 executeFetchRequest:v21 error:&v37];
  id v27 = v37;

  uint64_t v28 = [v26 lastObject];
  if (v28)
  {
    uint64_t v29 = [*(id *)(a1 + 40) managedObjectContext];
    [v29 deleteObject:v28];
  }
  if (v27)
  {
    v30 = AXLogPunctuationStorage();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      __50__AXSSPunctuationManager_removeAllRecordsForPurge__block_invoke_cold_1();
    }
  }
  [*(id *)(a1 + 40) _saveIfPossible];
}

- (id)_punctuationEntryFromManagedObject:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[AXSSPunctuationEntry alloc] init];
    id v6 = [v4 uuid];
    [(AXSSPunctuationEntry *)v5 setUuid:v6];

    uint64_t v7 = [v4 punctuation];
    [(AXSSPunctuationEntry *)v5 setPunctuation:v7];

    id v8 = [v4 replacement];
    [(AXSSPunctuationEntry *)v5 setReplacement:v8];

    uint64_t v9 = [v4 rule];
    [(AXSSPunctuationEntry *)v5 setRule:[(AXSSPunctuationManager *)self stringToRule:v9]];

    -[AXSSPunctuationEntry setVersion:](v5, "setVersion:", (unsigned __int16)[v4 version]);
    -[AXSSPunctuationEntry setInCloud:](v5, "setInCloud:", [v4 inCloud]);
    id v10 = [v4 ckChangeTag];
    [(AXSSPunctuationEntry *)v5 setCkChangeTag:v10];

    BOOL v11 = [v4 lastModifiedDate];
    [(AXSSPunctuationEntry *)v5 setLastModifiedDate:v11];

    uint64_t v12 = [v4 ckRecordProcessDate];
    [(AXSSPunctuationEntry *)v5 setCkRecordProcessDate:v12];

    uint64_t v13 = [v4 groupUUID];

    [(AXSSPunctuationEntry *)v5 setGroupUUID:v13];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_punctuationGroupFromManagedObject:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v5 = 0;
    goto LABEL_19;
  }
  id v5 = [[AXSSPunctuationGroup alloc] init];
  id v6 = [v4 uuid];
  [(AXSSPunctuationGroup *)v5 setUuid:v6];

  uint64_t v7 = [v4 name];
  [(AXSSPunctuationGroup *)v5 setName:v7];

  -[AXSSPunctuationGroup setInCloud:](v5, "setInCloud:", [v4 inCloud]);
  -[AXSSPunctuationGroup setVersion:](v5, "setVersion:", (unsigned __int16)[v4 version]);
  id v8 = [v4 ckRecordProcessDate];
  [(AXSSPunctuationGroup *)v5 setCkRecordProcessDate:v8];

  uint64_t v9 = [(AXSSPunctuationGroup *)v5 name];

  if (!v9)
  {
    id v10 = [(AXSSPunctuationGroup *)v5 uuid];
    int v11 = [v10 isEqual:AXSSVoiceOverPunctuationGroupNone];

    if (v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      uint64_t v13 = v12;
      uint64_t v14 = @"PUNCTUATION_GROUP_NONE";
LABEL_10:
      long long v19 = [v12 localizedStringForKey:v14 value:&stru_1F0C5BA58 table:@"AccessibilitySharedSupport"];
      [(AXSSPunctuationGroup *)v5 setName:v19];

      goto LABEL_11;
    }
    BOOL v15 = [(AXSSPunctuationGroup *)v5 uuid];
    int v16 = [v15 isEqual:AXSSVoiceOverPunctuationGroupSome];

    if (v16)
    {
      uint64_t v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      uint64_t v13 = v12;
      uint64_t v14 = @"PUNCTUATION_GROUP_SOME";
      goto LABEL_10;
    }
    id v17 = [(AXSSPunctuationGroup *)v5 uuid];
    int v18 = [v17 isEqual:AXSSVoiceOverPunctuationGroupAll];

    if (v18)
    {
      uint64_t v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      uint64_t v13 = v12;
      uint64_t v14 = @"PUNCTUATION_GROUP_ALL";
      goto LABEL_10;
    }
  }
LABEL_11:
  long long v20 = [MEMORY[0x1E4F1CA80] set];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v21 = objc_msgSend(v4, "autoSwitchContexts", 0);
  uint64_t v22 = [v21 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v34 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = [*(id *)(*((void *)&v33 + 1) + 8 * i) contextIdentifier];
        [v20 addObject:v26];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v23);
  }

  [(AXSSPunctuationGroup *)v5 setAutoSwitchContexts:v20];
  id v27 = [(AXSSPunctuationGroup *)v5 uuid];
  uint64_t v28 = [(AXSSPunctuationManager *)self punctuationEntriesForGroupUUID:v27];
  [(AXSSPunctuationGroup *)v5 setEntries:v28];

  uint64_t v29 = [v4 basePunctuationUUID];
  [(AXSSPunctuationGroup *)v5 setBasePunctuationUUID:v29];

  [(AXSSPunctuationGroup *)v5 setInDatabase:1];
  v30 = [v4 ckChangeTag];
  [(AXSSPunctuationGroup *)v5 setCkChangeTag:v30];

  long long v31 = [v4 lastModifiedDate];
  [(AXSSPunctuationGroup *)v5 setLastModifiedDate:v31];

LABEL_19:

  return v5;
}

- (id)punctuationGroupsForContexts
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[AXSS_PunctuationContext fetchRequest];
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy_;
  v30[4] = __Block_byref_object_dispose_;
  id v31 = 0;
  [v3 setReturnsObjectsAsFaults:0];
  uint64_t v24 = 0;
  long long v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy_;
  uint64_t v28 = __Block_byref_object_dispose_;
  id v29 = 0;
  id v4 = [(AXSSDatabaseManager *)self managedObjectContext];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __54__AXSSPunctuationManager_punctuationGroupsForContexts__block_invoke;
  v20[3] = &unk_1E606CA38;
  uint64_t v22 = &v24;
  v20[4] = self;
  id v5 = v3;
  id v21 = v5;
  uint64_t v23 = v30;
  [v4 performBlockAndWait:v20];

  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = (id)v25[5];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v7);
        }
        int v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "group", (void)v16);
        uint64_t v13 = [(AXSSPunctuationManager *)self _punctuationGroupFromManagedObject:v12];
        uint64_t v14 = [v11 contextIdentifier];
        [v6 setObject:v13 forKeyedSubscript:v14];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v32 count:16];
    }
    while (v8);
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(v30, 8);

  return v6;
}

void __54__AXSSPunctuationManager_punctuationGroupsForContexts__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 executeFetchRequest:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (NSArray)punctuationGroups
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy_;
  int v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  uint64_t v3 = [(AXSSDatabaseManager *)self managedObjectContext];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__AXSSPunctuationManager_punctuationGroups__block_invoke;
  v6[3] = &unk_1E606CA80;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performBlockAndWait:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __43__AXSSPunctuationManager_punctuationGroups__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = +[AXSS_PunctuationGroup fetchRequest];
  [v2 setReturnsObjectsAsFaults:0];
  uint64_t v3 = [*(id *)(a1 + 32) managedObjectContext];
  id v20 = 0;
  id v4 = [v3 executeFetchRequest:v2 error:&v20];
  id v5 = v20;

  uint64_t v6 = [*(id *)(a1 + 32) punctuationGroupsForContexts];
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        BOOL v15 = objc_msgSend(*(id *)(a1 + 32), "_punctuationGroupFromManagedObject:", *(void *)(*((void *)&v16 + 1) + 8 * v14), (void)v16);
        [*(id *)(a1 + 32) _filterAutoswitchContexts:v15 punctuationGroupsForContexts:v6];
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v12);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) sortUsingComparator:&__block_literal_global_130];
}

uint64_t __43__AXSSPunctuationManager_punctuationGroups__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 uuid];
  char v7 = [v6 isEqual:AXSSVoiceOverPunctuationGroupAll];

  if (v7) {
    goto LABEL_6;
  }
  uint64_t v8 = [v5 uuid];
  char v9 = [v8 isEqual:AXSSVoiceOverPunctuationGroupAll];

  if (v9) {
    goto LABEL_8;
  }
  id v10 = [v4 uuid];
  char v11 = [v10 isEqual:AXSSVoiceOverPunctuationGroupSome];

  if ((v11 & 1) == 0)
  {
    uint64_t v12 = [v5 uuid];
    char v13 = [v12 isEqual:AXSSVoiceOverPunctuationGroupSome];

    if ((v13 & 1) == 0)
    {
      uint64_t v14 = [v4 uuid];
      char v15 = [v14 isEqual:AXSSVoiceOverPunctuationGroupNone];

      if (v15) {
        goto LABEL_6;
      }
      long long v17 = [v5 uuid];
      char v18 = [v17 isEqual:AXSSVoiceOverPunctuationGroupNone];

      if ((v18 & 1) == 0)
      {
        id v20 = [v4 name];
        id v21 = [v5 name];
        uint64_t v16 = [v20 localizedCompare:v21];

        goto LABEL_9;
      }
    }
LABEL_8:
    uint64_t v16 = 1;
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v16 = -1;
LABEL_9:

  return v16;
}

- (void)_filterAutoswitchContexts:(id)a3 punctuationGroupsForContexts:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  char v7 = [v5 autoSwitchContexts];
  long long v17 = (void *)[v7 mutableCopy];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = [v5 autoSwitchContexts];
  uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        char v13 = objc_msgSend(v6, "objectForKeyedSubscript:", v12, v17);
        uint64_t v14 = [v13 uuid];
        char v15 = [v5 uuid];
        char v16 = [v14 isEqual:v15];

        if ((v16 & 1) == 0) {
          [v17 removeObject:v12];
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  [v5 setAutoSwitchContexts:v17];
}

- (id)punctuationEntryForUUID:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  char v16 = __Block_byref_object_copy_;
  long long v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  id v5 = [(AXSSDatabaseManager *)self managedObjectContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__AXSSPunctuationManager_punctuationEntryForUUID___block_invoke;
  v9[3] = &unk_1E606C950;
  id v6 = v4;
  id v10 = v6;
  char v11 = self;
  uint64_t v12 = &v13;
  [v5 performBlockAndWait:v9];

  id v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __50__AXSSPunctuationManager_punctuationEntryForUUID___block_invoke(uint64_t a1)
{
  id v2 = +[AXSS_PunctuationEntry fetchRequest];
  [v2 setReturnsObjectsAsFaults:0];
  uint64_t v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid = %@", *(void *)(a1 + 32)];
  [v2 setPredicate:v3];

  id v4 = [*(id *)(a1 + 40) managedObjectContext];
  id v13 = 0;
  id v5 = [v4 executeFetchRequest:v2 error:&v13];
  id v6 = v13;

  if (v6)
  {
    id v7 = AXLogPunctuationStorage();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __50__AXSSPunctuationManager_punctuationEntryForUUID___block_invoke_cold_1();
    }
  }
  uint64_t v8 = *(void **)(a1 + 40);
  uint64_t v9 = [v5 lastObject];
  uint64_t v10 = [v8 _punctuationEntryFromManagedObject:v9];
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (id)punctuationGroupForUUID:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  char v16 = __Block_byref_object_copy_;
  long long v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  id v5 = [(AXSSDatabaseManager *)self managedObjectContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__AXSSPunctuationManager_punctuationGroupForUUID___block_invoke;
  v9[3] = &unk_1E606C950;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = self;
  uint64_t v12 = &v13;
  [v5 performBlockAndWait:v9];

  id v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __50__AXSSPunctuationManager_punctuationGroupForUUID___block_invoke(uint64_t a1)
{
  id v2 = +[AXSS_PunctuationGroup fetchRequest];
  [v2 setReturnsObjectsAsFaults:0];
  [v2 setShouldRefreshRefetchedObjects:1];
  uint64_t v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid = %@", *(void *)(a1 + 32)];
  [v2 setPredicate:v3];

  id v4 = [*(id *)(a1 + 40) managedObjectContext];
  id v15 = 0;
  id v5 = [v4 executeFetchRequest:v2 error:&v15];
  id v6 = v15;
  id v7 = [v5 firstObject];

  uint64_t v8 = [*(id *)(a1 + 40) _punctuationGroupFromManagedObject:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  if (v6)
  {
    uint64_t v11 = AXLogPunctuationStorage();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __50__AXSSPunctuationManager_punctuationGroupForUUID___block_invoke_cold_1();
    }
  }
  uint64_t v12 = *(void **)(a1 + 40);
  uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v14 = [v12 punctuationGroupsForContexts];
  [v12 _filterAutoswitchContexts:v13 punctuationGroupsForContexts:v14];
}

- (id)ruleToString:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return 0;
  }
  else {
    return off_1E606CAC8[a3];
  }
}

- (int64_t)stringToRule:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AXSSPunctuationEntryRuleReplace"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"AXSSPunctuationEntryRuleRemove"])
  {
    int64_t v4 = 2;
  }
  else
  {
    [v3 isEqualToString:@"AXSSPunctuationEntryRuleIgnore"];
    int64_t v4 = 0;
  }

  return v4;
}

- (void)updateEntry:(id)a3
{
}

- (void)updateEntry:(id)a3 fromCloudKit:(BOOL)a4
{
  id v6 = a3;
  id v7 = [v6 groupUUID];

  if (!v7)
  {
    uint64_t v8 = AXLogPunctuationStorage();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[AXSSPunctuationManager updateEntry:fromCloudKit:]();
    }
  }
  uint64_t v9 = [(AXSSDatabaseManager *)self managedObjectContext];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__AXSSPunctuationManager_updateEntry_fromCloudKit___block_invoke;
  v11[3] = &unk_1E606CAA8;
  id v12 = v6;
  uint64_t v13 = self;
  BOOL v14 = a4;
  id v10 = v6;
  [v9 performBlock:v11];
}

void __51__AXSSPunctuationManager_updateEntry_fromCloudKit___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v2 = +[AXSS_PunctuationEntry fetchRequest];
  id v3 = (void *)MEMORY[0x1E4F28F60];
  int64_t v4 = [*(id *)(a1 + 32) uuid];
  id v5 = [v3 predicateWithFormat:@"uuid = %@", v4];
  [v2 setPredicate:v5];

  [v2 setReturnsObjectsAsFaults:0];
  id v6 = [*(id *)(a1 + 40) managedObjectContext];
  id v25 = 0;
  id v7 = [v6 executeFetchRequest:v2 error:&v25];
  id v8 = v25;

  uint64_t v9 = [v7 lastObject];
  if (v9) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (!v10)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1C0A8];
    id v12 = [*(id *)(a1 + 40) managedObjectContext];
    uint64_t v13 = [v11 insertNewObjectForEntityForName:@"AXSS_PunctuationEntry" inManagedObjectContext:v12];

    uint64_t v9 = (void *)v13;
  }
  BOOL v14 = [*(id *)(a1 + 32) uuid];
  [v9 setUuid:v14];

  id v15 = [*(id *)(a1 + 32) replacement];
  [v9 setReplacement:v15];

  char v16 = [*(id *)(a1 + 32) groupUUID];
  [v9 setGroupUUID:v16];

  long long v17 = [*(id *)(a1 + 32) punctuation];
  [v9 setPunctuation:v17];

  id v18 = objc_msgSend(*(id *)(a1 + 40), "ruleToString:", objc_msgSend(*(id *)(a1 + 32), "rule"));
  [v9 setRule:v18];

  objc_msgSend(v9, "setVersion:", (__int16)objc_msgSend(*(id *)(a1 + 32), "version"));
  long long v19 = [*(id *)(a1 + 32) ckRecordProcessDate];
  [v9 setCkRecordProcessDate:v19];

  if (*(unsigned char *)(a1 + 48))
  {
    long long v20 = [*(id *)(a1 + 32) ckChangeTag];
    [v9 setCkChangeTag:v20];
  }
  else
  {
    [v9 setCkChangeTag:0];
  }
  objc_msgSend(v9, "setInCloud:", objc_msgSend(*(id *)(a1 + 32), "inCloud"));
  long long v21 = [MEMORY[0x1E4F1C9C8] date];
  [v9 setLastModifiedDate:v21];

  if (v8)
  {
    long long v22 = AXLogPunctuationStorage();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      __51__AXSSPunctuationManager_updateEntry_fromCloudKit___block_invoke_cold_1();
    }
  }
  uint64_t v23 = AXLogPunctuationStorage();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    uint64_t v24 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v27 = v24;
    _os_log_impl(&dword_1B3B9D000, v23, OS_LOG_TYPE_INFO, "Updating entry: %@", buf, 0xCu);
  }

  [*(id *)(a1 + 40) _saveIfPossible];
}

- (void)removeEntry:(id)a3
{
  id v4 = a3;
  if ([v4 inCloud])
  {
    id v5 = [v4 uuid];
    id v6 = +[AXSSPunctuationEntry description];
    [(AXSSPunctuationManager *)self addCloudRecordToPurge:v5 recordEntityType:v6];
  }
  id v7 = [(AXSSDatabaseManager *)self managedObjectContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__AXSSPunctuationManager_removeEntry___block_invoke;
  v9[3] = &unk_1E606C9A0;
  id v10 = v4;
  uint64_t v11 = self;
  id v8 = v4;
  [v7 performBlock:v9];
}

void __38__AXSSPunctuationManager_removeEntry___block_invoke(uint64_t a1)
{
  id v2 = +[AXSS_PunctuationEntry fetchRequest];
  id v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = [*(id *)(a1 + 32) uuid];
  id v5 = [v3 predicateWithFormat:@"uuid = %@", v4];
  [v2 setPredicate:v5];

  [v2 setReturnsObjectsAsFaults:0];
  id v6 = [*(id *)(a1 + 40) managedObjectContext];
  id v12 = 0;
  id v7 = [v6 executeFetchRequest:v2 error:&v12];
  id v8 = v12;

  uint64_t v9 = [v7 lastObject];
  if (v9)
  {
    id v10 = [*(id *)(a1 + 40) managedObjectContext];
    [v10 deleteObject:v9];
  }
  if (v8)
  {
    uint64_t v11 = AXLogPunctuationStorage();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __38__AXSSPunctuationManager_removeEntry___block_invoke_cold_1();
    }
  }
  [*(id *)(a1 + 40) _saveIfPossible];
}

- (id)allPunctuationGroup
{
  id v2 = (void *)allPunctuationGroup_AllPunctuationGroup;
  if (!allPunctuationGroup_AllPunctuationGroup)
  {
    uint64_t v3 = [(AXSSPunctuationManager *)self punctuationGroupForUUID:AXSSVoiceOverPunctuationGroupAll];
    id v4 = (void *)allPunctuationGroup_AllPunctuationGroup;
    allPunctuationGroup_AllPunctuationGroup = v3;

    id v2 = (void *)allPunctuationGroup_AllPunctuationGroup;
  }
  id v5 = v2;

  return v5;
}

- (id)somePunctuationGroup
{
  id v2 = (void *)somePunctuationGroup_SomePunctuationGroup;
  if (!somePunctuationGroup_SomePunctuationGroup)
  {
    uint64_t v3 = [(AXSSPunctuationManager *)self punctuationGroupForUUID:AXSSVoiceOverPunctuationGroupSome];
    id v4 = (void *)somePunctuationGroup_SomePunctuationGroup;
    somePunctuationGroup_SomePunctuationGroup = v3;

    id v2 = (void *)somePunctuationGroup_SomePunctuationGroup;
  }
  id v5 = v2;

  return v5;
}

- (id)nonePunctuationGroup
{
  id v2 = (void *)nonePunctuationGroup_NonePunctuationGroup;
  if (!nonePunctuationGroup_NonePunctuationGroup)
  {
    uint64_t v3 = [(AXSSPunctuationManager *)self punctuationGroupForUUID:AXSSVoiceOverPunctuationGroupNone];
    id v4 = (void *)nonePunctuationGroup_NonePunctuationGroup;
    nonePunctuationGroup_NonePunctuationGroup = v3;

    id v2 = (void *)nonePunctuationGroup_NonePunctuationGroup;
  }
  id v5 = v2;

  return v5;
}

- (BOOL)cloudKitSync
{
  return self->_cloudKitSync;
}

- (BOOL)cloudKitPushInSameProcess
{
  return self->_cloudKitPushInSameProcess;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_punctuationGroupCloudKitHelper, 0);

  objc_storeStrong((id *)&self->_punctuationEntryCloudKitHelper, 0);
}

- (void)_cloudKitUpdated:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v4 = [a1 cloudKitSync];
  id v5 = [a1 managedObjectContext];
  v6[0] = 67109378;
  v6[1] = v4;
  __int16 v7 = 2112;
  id v8 = v5;
  _os_log_debug_impl(&dword_1B3B9D000, a2, OS_LOG_TYPE_DEBUG, "Cloud kit updated itself: %d, %@", (uint8_t *)v6, 0x12u);
}

- (void)_managedObjectChanged:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1B3B9D000, log, OS_LOG_TYPE_DEBUG, "Cloud sync process, skipping local changes", v1, 2u);
}

void __40__AXSSPunctuationManager__setupDatabase__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1B3B9D000, v0, v1, "Punctuation err: resetting storage coordinator %@", v2, v3, v4, v5, v6);
}

- (void)_saveIfPossible
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1B3B9D000, v0, v1, "Could not save punctuation: %@", v2, v3, v4, v5, v6);
}

- (void)addCloudRecordToPurge:(os_log_t)log recordEntityType:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1B3B9D000, log, OS_LOG_TYPE_ERROR, "Unable add nil uuid record to purge", v1, 2u);
}

void __46__AXSSPunctuationManager_cloudRecordsToPurge___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1B3B9D000, v0, v1, "Could not fetch entries: %@", v2, v3, v4, v5, v6);
}

void __50__AXSSPunctuationManager_removeAllRecordsForPurge__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1B3B9D000, v0, v1, "Could not remove group: %@", v2, v3, v4, v5, v6);
}

void __49__AXSSPunctuationManager_parentPunctuationGroup___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1B3B9D000, v0, v1, "Could not get parent group: %@", v2, v3, v4, v5, v6);
}

void __52__AXSSPunctuationManager__punctuationGroupForEntry___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1B3B9D000, v0, v1, "Could not fetch group for entry: %@", v2, v3, v4, v5, v6);
}

void __65__AXSSPunctuationManager_punctuationEntryObjectFromLocalObjects___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1B3B9D000, v0, v1, "Unable to fetch uuid for entry: %@", v2, v3, v4, v5, v6);
}

void __62__AXSSPunctuationManager_updatePunctuationGroup_fromCloudKit___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1B3B9D000, v0, v1, "Could not fetch group: %@", v2, v3, v4, v5, v6);
}

void __50__AXSSPunctuationManager_punctuationEntryForUUID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1B3B9D000, v0, v1, "Could not get entry: %@", v2, v3, v4, v5, v6);
}

void __50__AXSSPunctuationManager_punctuationGroupForUUID___block_invoke_cold_1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1B3B9D000, v1, OS_LOG_TYPE_ERROR, "Error getting group: %@ %@", v2, 0x16u);
}

- (void)updateEntry:fromCloudKit:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4_0();
  _os_log_fault_impl(&dword_1B3B9D000, v0, OS_LOG_TYPE_FAULT, "Every entry being updated needs a group UUID: %@", v1, 0xCu);
}

void __51__AXSSPunctuationManager_updateEntry_fromCloudKit___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1B3B9D000, v0, v1, "Could not update entry: %@", v2, v3, v4, v5, v6);
}

void __38__AXSSPunctuationManager_removeEntry___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1B3B9D000, v0, v1, "Could not delete entry: %@", v2, v3, v4, v5, v6);
}

@end