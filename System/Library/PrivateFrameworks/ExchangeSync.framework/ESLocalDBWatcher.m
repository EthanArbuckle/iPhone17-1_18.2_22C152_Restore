@interface ESLocalDBWatcher
+ (id)_canonicalizePath:(id)a3;
+ (id)sharedDBWatcher;
- (ESLocalDBWatcher)init;
- (id)_dbInfoForAccountID:(id)a3 create:(BOOL)a4;
- (int)lastSavedABSequenceNumber;
- (int)lastSavedCalSequenceNumberForDatabaseInContainer:(id)a3;
- (void)_handleABChangeNotificationWithInfo:(id)a3;
- (void)_handleCalChangeNotification;
- (void)_notesChangedExternally;
- (void)dealloc;
- (void)didReceiveDarwinNotification:(id)a3;
- (void)noteABDBDirChanged;
- (void)noteCalDBDirChanged;
- (void)registerConcernedABParty:(id)a3 withChangedBlock:(id)a4;
- (void)registerConcernedCalParty:(id)a3 forAccountID:(id)a4 withChangedBlock:(id)a5;
- (void)registerConcernedNoteParty:(id)a3 withChangedBlock:(id)a4;
- (void)removeConcernedABParty:(id)a3;
- (void)removeConcernedCalParty:(id)a3 forAccountID:(id)a4;
- (void)removeConcernedNoteParty:(id)a3;
- (void)setLastSavedABSequenceNumber:(int)a3;
- (void)setLastSavedCalSequenceNumber:(int)a3 forDatabaseInContainer:(id)a4;
@end

@implementation ESLocalDBWatcher

+ (id)sharedDBWatcher
{
  if (sharedDBWatcher_onceToken != -1) {
    dispatch_once(&sharedDBWatcher_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedDBWatcher___sharedInstance;
  return v2;
}

uint64_t __35__ESLocalDBWatcher_sharedDBWatcher__block_invoke()
{
  sharedDBWatcher___sharedInstance = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (ESLocalDBWatcher)init
{
  v12.receiver = self;
  v12.super_class = (Class)ESLocalDBWatcher;
  v2 = [(ESLocalDBWatcher *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08968] mapTableWithWeakToStrongObjects];
    concernedABPartyToBlockMap = v2->_concernedABPartyToBlockMap;
    v2->_concernedABPartyToBlockMap = (NSMapTable *)v3;

    uint64_t v5 = [MEMORY[0x263F08968] mapTableWithWeakToStrongObjects];
    concernedNotePartyToBlockMap = v2->_concernedNotePartyToBlockMap;
    v2->_concernedNotePartyToBlockMap = (NSMapTable *)v5;

    v7 = [[ESCalDBHelper alloc] initWithDatabaseInitOptions:6];
    calDBHelper = v2->_calDBHelper;
    v2->_calDBHelper = v7;

    uint64_t v9 = objc_opt_new();
    calDBInfosByPath = v2->_calDBInfosByPath;
    v2->_calDBInfosByPath = (NSMutableDictionary *)v9;
  }
  return v2;
}

- (void)dealloc
{
  abWatcher = self->_abWatcher;
  if (abWatcher)
  {
    CFRelease(abWatcher);
    self->_abWatcher = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)ESLocalDBWatcher;
  [(ESLocalDBWatcher *)&v4 dealloc];
}

- (void)_handleABChangeNotificationWithInfo:(id)a3
{
  *(void *)&v26[5] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_abWatcher)
  {
    objc_super v12 = DALoggingwithCategory();
    os_log_type_t v21 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
    if (os_log_type_enabled(v12, v21))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v26 = v4;
      _os_log_impl(&dword_239784000, v12, v21, "AddressBook database not yet initialize. Notification info: %@", buf, 0xCu);
    }
    goto LABEL_14;
  }
  int SequenceNumber = ABAddressBookGetSequenceNumber();
  v6 = DALoggingwithCategory();
  uint64_t v7 = MEMORY[0x263F38F90];
  os_log_type_t v8 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v6, v8))
  {
    lastSavedABint SequenceNumber = self->_lastSavedABSequenceNumber;
    *(_DWORD *)buf = 67109376;
    v26[0] = SequenceNumber;
    LOWORD(v26[1]) = 1024;
    *(_DWORD *)((char *)&v26[1] + 2) = lastSavedABSequenceNumber;
    _os_log_impl(&dword_239784000, v6, v8, "__ABDatabaseChangedExternally - comparing current sequence number %d to saved sequence number %d", buf, 0xEu);
  }

  if (SequenceNumber > self->_lastSavedABSequenceNumber + 1)
  {
    v10 = [v4 objectForKeyedSubscript:@"isLocal"];
    int v11 = [v10 intValue];

    if (!v11)
    {
      objc_super v12 = objc_opt_new();
      v13 = DALoggingwithCategory();
      os_log_type_t v14 = *(unsigned char *)(v7 + 6);
      if (os_log_type_enabled(v13, v14))
      {
        v15 = [v12 transactionId];
        *(_DWORD *)buf = 138412290;
        *(void *)v26 = v15;
        _os_log_impl(&dword_239784000, v13, v14, "DATransaction starting, ID: %@", buf, 0xCu);
      }
      v16 = [(NSMapTable *)self->_concernedABPartyToBlockMap objectEnumerator];
      uint64_t v17 = [v16 nextObject];
      if (v17)
      {
        v18 = (void *)v17;
        do
        {
          v19 = dataaccess_get_global_queue();
          v22[0] = MEMORY[0x263EF8330];
          v22[1] = 3221225472;
          v22[2] = __56__ESLocalDBWatcher__handleABChangeNotificationWithInfo___block_invoke;
          v22[3] = &unk_264DA1C20;
          id v24 = v18;
          v23 = v12;
          id v20 = v18;
          dispatch_async(v19, v22);

          v18 = [v16 nextObject];
        }
        while (v18);
      }

LABEL_14:
    }
  }
}

uint64_t __56__ESLocalDBWatcher__handleABChangeNotificationWithInfo___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)registerConcernedABParty:(id)a3 withChangedBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  objc_sync_enter(v9);
  if (!v9->_abWatcher)
  {
    CFErrorRef error = 0;
    v10 = +[ESLocalDBHelper abTestABDBDir];
    if (v10)
    {
      v9->_abWatcher = (void *)ABAddressBookCreateWithDatabaseDirectory();
    }
    else
    {
      int v11 = (void *)ABAddressBookCreateWithOptions(0, &error);
      CFErrorRef v12 = error;
      v9->_abWatcher = v11;
      if (v12) {
        CFRelease(v12);
      }
    }
  }
  v13 = [(NSMapTable *)v9->_concernedABPartyToBlockMap objectForKey:v7];

  if (v13)
  {
    uint64_t v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, v9, @"ESLocalDBWatcher.m", 128, @"Someone registered themselves for the AB notification more than once: %@", v7 object file lineNumber description];
  }
  os_log_type_t v14 = (void *)[v8 copy];

  concernedABPartyToBlockMap = v9->_concernedABPartyToBlockMap;
  v16 = (void *)MEMORY[0x23ECA4FC0](v14);
  [(NSMapTable *)concernedABPartyToBlockMap setObject:v16 forKey:v7];

  objc_sync_exit(v9);
}

- (void)removeConcernedABParty:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [(NSMapTable *)v4->_concernedABPartyToBlockMap objectForKey:v7];

  if (v5)
  {
    [(NSMapTable *)v4->_concernedABPartyToBlockMap removeObjectForKey:v7];
    if (![(NSMapTable *)v4->_concernedABPartyToBlockMap count])
    {
      abWatcher = v4->_abWatcher;
      if (abWatcher)
      {
        CFRelease(abWatcher);
        v4->_abWatcher = 0;
      }
      v4->_lastSavedABint SequenceNumber = 0;
    }
  }
  objc_sync_exit(v4);
}

+ (id)_canonicalizePath:(id)a3
{
  return (id)[a3 removeSlashIfNeeded];
}

- (void)_handleCalChangeNotification
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  p_isa = (id *)&v2->super.isa;
  uint64_t v3 = [(ESCalDBHelper *)v2->_calDBHelper allOpenDatabases];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v45 objects:v54 count:16];
  if (v4)
  {
    uint64_t v34 = *(void *)v46;
    os_log_type_t type = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
    os_log_type_t v32 = *(unsigned char *)(MEMORY[0x263F38F90] + 5);
    os_log_type_t v33 = *(unsigned char *)(MEMORY[0x263F38F90] + 6);
    *(void *)&long long v5 = 138412290;
    long long v30 = v5;
    id obj = v3;
    do
    {
      uint64_t v6 = 0;
      uint64_t v35 = v4;
      do
      {
        if (*(void *)v46 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v45 + 1) + 8 * v6);
        id v8 = objc_opt_class();
        uint64_t v9 = (void *)CalDatabaseCopyDirectoryPathForDatabase();
        v10 = [v8 _canonicalizePath:v9];

        int v11 = [p_isa[7] objectForKeyedSubscript:v10];
        int SequenceNumber = CalDatabaseGetSequenceNumber();
        int v13 = [v11 lastSavedSequenceNumber];
        os_log_type_t v14 = DALoggingwithCategory();
        if (os_log_type_enabled(v14, type))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v51 = SequenceNumber;
          *(_WORD *)&v51[4] = 1024;
          *(_DWORD *)&v51[6] = v13;
          __int16 v52 = 2112;
          uint64_t v53 = v7;
          _os_log_impl(&dword_239784000, v14, type, "__CalDatabaseChangedExternally - comparing current sequence number %d to saved sequence number %d in database: %@", buf, 0x18u);
        }

        if (SequenceNumber > v13 + 1)
        {
          v15 = objc_opt_new();
          v16 = DALoggingwithCategory();
          if (os_log_type_enabled(v16, v33))
          {
            uint64_t v17 = [v15 transactionId];
            *(_DWORD *)buf = v30;
            *(void *)v51 = v17;
            _os_log_impl(&dword_239784000, v16, v33, "DATransaction starting, ID: %@", buf, 0xCu);
          }
          v18 = DALoggingwithCategory();
          if (os_log_type_enabled(v18, v32))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_239784000, v18, v32, "Notifying agents that the Calendar database has changed.", buf, 2u);
          }

          v19 = objc_opt_new();
          id v20 = [v11 blocksByConcernedParty];
          v42[0] = MEMORY[0x263EF8330];
          v42[1] = 3221225472;
          v42[2] = __48__ESLocalDBWatcher__handleCalChangeNotification__block_invoke;
          v42[3] = &unk_264DA1C48;
          id v21 = v19;
          id v43 = v21;
          id v22 = v15;
          id v44 = v22;
          [v20 enumerateKeysAndObjectsUsingBlock:v42];

          long long v40 = 0u;
          long long v41 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          id v23 = v21;
          uint64_t v24 = [v23 countByEnumeratingWithState:&v38 objects:v49 count:16];
          if (v24)
          {
            uint64_t v25 = *(void *)v39;
            do
            {
              for (uint64_t i = 0; i != v24; ++i)
              {
                if (*(void *)v39 != v25) {
                  objc_enumerationMutation(v23);
                }
                uint64_t v27 = *(void *)(*((void *)&v38 + 1) + 8 * i);
                v28 = objc_msgSend(v11, "blocksByConcernedParty", v30);
                [v28 setObject:0 forKeyedSubscript:v27];

                v29 = [v11 blocksByConcernedParty];
                LODWORD(v27) = [v29 count] == 0;

                if (v27) {
                  [v11 setLastSavedSequenceNumber:0];
                }
              }
              uint64_t v24 = [v23 countByEnumeratingWithState:&v38 objects:v49 count:16];
            }
            while (v24);
          }
        }
        ++v6;
      }
      while (v6 != v35);
      uint64_t v3 = obj;
      uint64_t v4 = [obj countByEnumeratingWithState:&v45 objects:v54 count:16];
    }
    while (v4);
  }

  objc_sync_exit(p_isa);
}

void __48__ESLocalDBWatcher__handleCalChangeNotification__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 concernedParty];

  if (v7)
  {
    id v8 = dataaccess_get_global_queue();
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __48__ESLocalDBWatcher__handleCalChangeNotification__block_invoke_2;
    v9[3] = &unk_264DA1C20;
    id v11 = v6;
    id v10 = *(id *)(a1 + 40);
    dispatch_async(v8, v9);
  }
  else
  {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

uint64_t __48__ESLocalDBWatcher__handleCalChangeNotification__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_dbInfoForAccountID:(id)a3 create:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(ESCalDBHelper *)self->_calDBHelper databaseForAccountID:v6];
  if (!v7)
  {
    id v11 = DALoggingwithCategory();
    os_log_type_t v14 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    if (os_log_type_enabled(v11, v14))
    {
      int v23 = 138543362;
      uint64_t v24 = v6;
      _os_log_impl(&dword_239784000, v11, v14, "No database for account: %{public}@", (uint8_t *)&v23, 0xCu);
    }
    goto LABEL_15;
  }
  id v8 = v7;
  uint64_t v9 = objc_opt_class();
  id v10 = (void *)CalDatabaseCopyDirectoryPathForDatabase();
  id v11 = [v9 _canonicalizePath:v10];

  if (v11)
  {
    uint64_t v12 = [(NSMutableDictionary *)self->_calDBInfosByPath objectForKeyedSubscript:v11];
    if (v12)
    {
      int v13 = (ESLocalDBWatcherDBInfo *)v12;
      goto LABEL_16;
    }
    if (v4)
    {
      int v13 = [[ESLocalDBWatcherDBInfo alloc] initWithPath:v11];
      [(NSMutableDictionary *)self->_calDBInfosByPath setObject:v13 forKeyedSubscript:v11];
      goto LABEL_16;
    }
    v15 = DALoggingwithCategory();
    int v21 = *(unsigned __int8 *)(MEMORY[0x263F38F90] + 3);
    if (!os_log_type_enabled(v15, *(os_log_type_t *)(MEMORY[0x263F38F90] + 3))) {
      goto LABEL_14;
    }
    int v23 = 138543874;
    uint64_t v24 = v11;
    __int16 v25 = 2048;
    v26 = v8;
    __int16 v27 = 2114;
    v28 = v6;
    uint64_t v17 = "No dbInfo for path: %{public}@, database: %p, account: %{public}@";
    v18 = v15;
    os_log_type_t v19 = v21;
    uint32_t v20 = 32;
    goto LABEL_13;
  }
  v15 = DALoggingwithCategory();
  os_log_type_t v16 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
  if (os_log_type_enabled(v15, v16))
  {
    int v23 = 134218242;
    uint64_t v24 = v8;
    __int16 v25 = 2114;
    v26 = (CalDatabase *)v6;
    uint64_t v17 = "no path for database: %p, account: %{public}@";
    v18 = v15;
    os_log_type_t v19 = v16;
    uint32_t v20 = 22;
LABEL_13:
    _os_log_impl(&dword_239784000, v18, v19, v17, (uint8_t *)&v23, v20);
  }
LABEL_14:

LABEL_15:
  int v13 = 0;
LABEL_16:

  return v13;
}

- (void)registerConcernedCalParty:(id)a3 forAccountID:(id)a4 withChangedBlock:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = DALoggingwithCategory();
  os_log_type_t v12 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v11, v12))
  {
    int v17 = 138412546;
    id v18 = v8;
    __int16 v19 = 2114;
    id v20 = v9;
    _os_log_impl(&dword_239784000, v11, v12, "Registering concerned cal party: %@ for account: %{public}@", (uint8_t *)&v17, 0x16u);
  }

  int v13 = self;
  objc_sync_enter(v13);
  [(ESCalDBHelper *)v13->_calDBHelper openDatabaseForAccountID:v9 clientID:0];
  os_log_type_t v14 = [(ESLocalDBWatcher *)v13 _dbInfoForAccountID:v9 create:1];
  v15 = [v14 blocksByConcernedParty];
  BOOL v16 = [v15 count] == 0;

  if (!v16) {
    [(ESCalDBHelper *)v13->_calDBHelper closeDatabaseForAccountID:v9 save:0];
  }
  [v14 addBlock:v10 forConcernedParty:v8 account:v9];

  objc_sync_exit(v13);
}

- (void)removeConcernedCalParty:(id)a3 forAccountID:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = self;
    objc_sync_enter(v7);
    id v8 = [(ESLocalDBWatcher *)v7 _dbInfoForAccountID:v6 create:0];
    id v9 = v8;
    if (v8)
    {
      [v8 removeBlockForConcernedParty:v14 account:v6];
      id v10 = [v9 blocksByConcernedParty];
      if ([v10 count])
      {
      }
      else
      {
        id v11 = [v9 path];

        if (v11)
        {
          calDBInfosByPath = v7->_calDBInfosByPath;
          int v13 = [v9 path];
          [(NSMutableDictionary *)calDBInfosByPath setObject:0 forKeyedSubscript:v13];

          [(ESCalDBHelper *)v7->_calDBHelper closeDatabaseForAccountID:v6 save:0];
        }
      }
    }

    objc_sync_exit(v7);
  }
}

- (int)lastSavedCalSequenceNumberForDatabaseInContainer:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _canonicalizePath:v4];

  id v6 = [(NSMutableDictionary *)self->_calDBInfosByPath objectForKeyedSubscript:v5];
  uint64_t v7 = v6;
  if (v6) {
    int v8 = [v6 lastSavedSequenceNumber];
  }
  else {
    int v8 = 0;
  }

  return v8;
}

- (void)setLastSavedCalSequenceNumber:(int)a3 forDatabaseInContainer:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v8 = [(id)objc_opt_class() _canonicalizePath:v6];

  uint64_t v7 = [(NSMutableDictionary *)self->_calDBInfosByPath objectForKeyedSubscript:v8];
  [v7 setLastSavedSequenceNumber:v4];
}

- (void)_notesChangedExternally
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = DALoggingwithCategory();
  os_log_type_t v4 = *(unsigned char *)(MEMORY[0x263F38F90] + 6);
  if (os_log_type_enabled(v3, v4))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_239784000, v3, v4, "__NotesChanged externally.", buf, 2u);
  }

  id v5 = objc_opt_new();
  id v6 = DALoggingwithCategory();
  if (os_log_type_enabled(v6, v4))
  {
    uint64_t v7 = [v5 transactionId];
    *(_DWORD *)buf = 138412290;
    int v17 = v7;
    _os_log_impl(&dword_239784000, v6, v4, "DATransaction starting, ID: %@", buf, 0xCu);
  }
  id v8 = [(NSMapTable *)self->_concernedNotePartyToBlockMap objectEnumerator];
  uint64_t v9 = [v8 nextObject];
  if (v9)
  {
    id v10 = (void *)v9;
    do
    {
      id v11 = dataaccess_get_global_queue();
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __43__ESLocalDBWatcher__notesChangedExternally__block_invoke;
      v13[3] = &unk_264DA1C20;
      id v15 = v10;
      id v14 = v5;
      id v12 = v10;
      dispatch_async(v11, v13);

      id v10 = [v8 nextObject];
    }
    while (v10);
  }
}

uint64_t __43__ESLocalDBWatcher__notesChangedExternally__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)registerConcernedNoteParty:(id)a3 withChangedBlock:(id)a4
{
  id v14 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  uint64_t v9 = [(NSMapTable *)v8->_concernedNotePartyToBlockMap objectForKey:v14];

  if (v9)
  {
    int v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, v8, @"ESLocalDBWatcher.m", 283, @"Someone registered themselves for the Note notification more than once: %@", v14 object file lineNumber description];
  }
  id v10 = (void *)[v7 copy];

  concernedNotePartyToBlockMap = v8->_concernedNotePartyToBlockMap;
  id v12 = (void *)MEMORY[0x23ECA4FC0](v10);
  [(NSMapTable *)concernedNotePartyToBlockMap setObject:v12 forKey:v14];

  objc_sync_exit(v8);
}

- (void)removeConcernedNoteParty:(id)a3
{
  id v6 = a3;
  os_log_type_t v4 = self;
  objc_sync_enter(v4);
  id v5 = [(NSMapTable *)v4->_concernedNotePartyToBlockMap objectForKey:v6];

  if (v5) {
    [(NSMapTable *)v4->_concernedNotePartyToBlockMap removeObjectForKey:v6];
  }
  objc_sync_exit(v4);
}

- (void)noteABDBDirChanged
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  abWatcher = v2->_abWatcher;
  if (abWatcher)
  {
    ABAddressBookUnregisterExternalChangeCallback(abWatcher, (ABExternalChangeCallback)__ABDatabaseChangedExternally, v2);
    os_log_type_t v4 = v2->_abWatcher;
    if (v4)
    {
      CFRelease(v4);
      v2->_abWatcher = 0;
    }
    v2->_lastSavedABint SequenceNumber = 0;
    CFErrorRef error = 0;
    id v5 = +[ESLocalDBHelper abTestABDBDir];
    if (v5) {
      id v6 = (void *)ABAddressBookCreateWithDatabaseDirectory();
    }
    else {
      id v6 = (void *)ABAddressBookCreateWithOptions(0, &error);
    }
    v2->_abWatcher = v6;
    if (v6)
    {
      ABAddressBookRegisterExternalChangeCallback(v6, (ABExternalChangeCallback)__ABDatabaseChangedExternally, v2);
    }
    else
    {
      id v7 = DALoggingwithCategory();
      os_log_type_t v8 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
      if (os_log_type_enabled(v7, v8))
      {
        *(_DWORD *)buf = 138412290;
        CFErrorRef v11 = error;
        _os_log_impl(&dword_239784000, v7, v8, "Couldn't create an address book DB: %@", buf, 0xCu);
      }
    }
    if (error) {
      CFRelease(error);
    }
  }
  objc_sync_exit(v2);
}

- (void)noteCalDBDirChanged
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  id obj = (id)objc_opt_new();
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v3 = [(NSMutableDictionary *)v2->_calDBInfosByPath allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v46 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        os_log_type_t v8 = objc_opt_new();
        uint64_t v9 = [v7 blocksByConcernedParty];
        v43[0] = MEMORY[0x263EF8330];
        v43[1] = 3221225472;
        v43[2] = __39__ESLocalDBWatcher_noteCalDBDirChanged__block_invoke;
        v43[3] = &unk_264DA1C70;
        id v10 = v8;
        id v44 = v10;
        [v9 enumerateKeysAndObjectsUsingBlock:v43];
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v45 objects:v52 count:16];
    }
    while (v4);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obja = obj;
  uint64_t v11 = [obja countByEnumeratingWithState:&v39 objects:v51 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v40 != v12) {
          objc_enumerationMutation(obja);
        }
        id v14 = *(void **)(*((void *)&v39 + 1) + 8 * j);
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v15 = [v14 blocksByConcernedParty];
        BOOL v16 = [v15 allKeys];

        uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v50 count:16];
        if (v17)
        {
          uint64_t v18 = *(void *)v36;
          do
          {
            for (uint64_t k = 0; k != v17; ++k)
            {
              if (*(void *)v36 != v18) {
                objc_enumerationMutation(v16);
              }
              id v20 = *(void **)(*((void *)&v35 + 1) + 8 * k);
              uint64_t v21 = [v20 concernedParty];
              id v22 = [v20 accountID];
              [(ESLocalDBWatcher *)v2 removeConcernedCalParty:v21 forAccountID:v22];
            }
            uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v50 count:16];
          }
          while (v17);
        }
      }
      uint64_t v11 = [obja countByEnumeratingWithState:&v39 objects:v51 count:16];
    }
    while (v11);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v23 = obja;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v31 objects:v49 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v32;
    do
    {
      for (uint64_t m = 0; m != v24; ++m)
      {
        if (*(void *)v32 != v25) {
          objc_enumerationMutation(v23);
        }
        __int16 v27 = [*(id *)(*((void *)&v31 + 1) + 8 * m) blocksByConcernedParty];
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __39__ESLocalDBWatcher_noteCalDBDirChanged__block_invoke_2;
        v30[3] = &unk_264DA1C70;
        v30[4] = v2;
        [v27 enumerateKeysAndObjectsUsingBlock:v30];
      }
      uint64_t v24 = [v23 countByEnumeratingWithState:&v31 objects:v49 count:16];
    }
    while (v24);
  }

  [MEMORY[0x263F30028] addObserver:v2 selector:sel__handleCalChangeNotification name:*MEMORY[0x263F2FF10]];
  objc_sync_exit(v2);
}

void __39__ESLocalDBWatcher_noteCalDBDirChanged__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v7 = (id)MEMORY[0x23ECA4FC0](a3);
  id v6 = [*(id *)(a1 + 32) blocksByConcernedParty];
  [v6 setObject:v7 forKeyedSubscript:v5];
}

void __39__ESLocalDBWatcher_noteCalDBDirChanged__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v8 = [v6 concernedParty];
  id v7 = [v6 accountID];

  [v4 registerConcernedCalParty:v8 forAccountID:v7 withChangedBlock:v5];
}

- (void)didReceiveDarwinNotification:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = DALoggingwithCategory();
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v5, v6))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_239784000, v5, v6, "Received darwin notification %@", (uint8_t *)&v7, 0xCu);
  }

  if ([v4 isEqualToString:@"_CalDatabaseChangedNotification"])
  {
    [(ESLocalDBWatcher *)self _handleCalChangeNotification];
  }
  else if ([v4 isEqualToString:@"__ABDataBaseChangedByOtherProcessNotification"])
  {
    [(ESLocalDBWatcher *)self _handleABChangeNotificationWithInfo:0];
  }
  else if ([v4 isEqualToString:@"NoteContextDarwinNotificationWithLoggedChanges"])
  {
    [(ESLocalDBWatcher *)self _notesChangedExternally];
  }
}

- (int)lastSavedABSequenceNumber
{
  return self->_lastSavedABSequenceNumber;
}

- (void)setLastSavedABSequenceNumber:(int)a3
{
  self->_lastSavedABint SequenceNumber = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calDBInfosByPath, 0);
  objc_storeStrong((id *)&self->_calDBHelper, 0);
  objc_storeStrong((id *)&self->_concernedNotePartyToBlockMap, 0);
  objc_storeStrong((id *)&self->_concernedABPartyToBlockMap, 0);
  objc_storeStrong((id *)&self->_noteWatcher, 0);
}

@end