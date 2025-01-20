@interface ESLocalDBHelper
+ (OS_os_log)os_log;
+ (id)abTestABDBDir;
+ (id)calTestCalDBDir;
+ (id)sharedInstanceForAccountType:(id)a3 creatingClass:(Class)a4;
+ (void)abSetTestABDBDir:(id)a3;
+ (void)calSetTestCalDBDir:(id)a3;
- (BOOL)_abOpenDBWithClientIdentifier:(id)a3;
- (BOOL)abCloseDBAndSave:(BOOL)a3;
- (BOOL)abSaveDB;
- (BOOL)calCloseDatabaseForAccountID:(id)a3 save:(BOOL)a4;
- (BOOL)calCloseDatabaseForAuxDatabaseRef:(void *)a3 save:(BOOL)a4;
- (BOOL)calSaveDatabaseAndFlushCachesForAccountID:(id)a3;
- (BOOL)calSaveDatabaseForAccountID:(id)a3;
- (BOOL)calSaveDatabaseForAuxDatabaseRef:(void *)a3;
- (BOOL)noteCloseDBAndSave:(BOOL)a3;
- (BOOL)noteSaveDB;
- (BOOL)useContacts;
- (CNContactStore)contactStore;
- (CalDatabase)calDB;
- (CalDatabase)calDatabaseForAccountID:(id)a3;
- (CalDatabase)calDatabaseForAuxDatabaseRef:(void *)a3;
- (ESCalDBHelper)calDBHelper;
- (ESLocalDBHelper)init;
- (NSMutableArray)saveRequests;
- (NSString)clientIdentifier;
- (NoteContext)noteDB;
- (id)abConstraintPlistPath;
- (id)calUnitTestCallbackBlock;
- (id)changeTrackingID;
- (int)abConnectionCount;
- (int)calConnectionCount;
- (int)noteConnectionCount;
- (void)_registerForAddressBookYieldNotifications;
- (void)abDB;
- (void)abDBThrowOnNil:(BOOL)a3;
- (void)abOpenDBAsGenericClient;
- (void)abOpenDBWithClientIdentifier:(id)a3;
- (void)abProcessAddedImages;
- (void)abProcessAddedRecords;
- (void)abSaveDB;
- (void)addSaveRequest:(id)a3;
- (void)calOpenDatabaseAsGenericClientForAccountID:(id)a3;
- (void)calOpenDatabaseAsGenericClientForAuxDatabaseRef:(void *)a3;
- (void)calOpenDatabaseForAccountID:(id)a3 clientID:(id)a4;
- (void)calOpenDatabaseForAuxDatabaseRef:(void *)a3 clientID:(id)a4;
- (void)calUnitTestsSetCallbackBlockForSave:(id)a3;
- (void)dealloc;
- (void)executeAllSaveRequests;
- (void)noteOpenDB;
- (void)setAbConnectionCount:(int)a3;
- (void)setAbDB:(void *)a3;
- (void)setCalConnectionCount:(int)a3;
- (void)setCalDB:(CalDatabase *)a3;
- (void)setCalDBHelper:(id)a3;
- (void)setCalUnitTestCallbackBlock:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setNoteConnectionCount:(int)a3;
- (void)setNoteDB:(id)a3;
- (void)setSaveRequests:(id)a3;
@end

@implementation ESLocalDBHelper

+ (OS_os_log)os_log
{
  if (os_log_onceToken != -1) {
    dispatch_once(&os_log_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)os_log_os_log;
  return (OS_os_log *)v2;
}

uint64_t __25__ESLocalDBHelper_os_log__block_invoke()
{
  os_log_os_log = (uint64_t)os_log_create("com.apple.dataaccess", "CardDAV-dbhelper");
  return MEMORY[0x270F9A758]();
}

+ (id)sharedInstanceForAccountType:(id)a3 creatingClass:(Class)a4
{
  id v4 = a3;
  v5 = (void *)sharedInstanceForAccountType_creatingClass____sharedInstances;
  if (!sharedInstanceForAccountType_creatingClass____sharedInstances)
  {
    uint64_t v6 = objc_opt_new();
    v7 = (void *)sharedInstanceForAccountType_creatingClass____sharedInstances;
    sharedInstanceForAccountType_creatingClass____sharedInstances = v6;

    v5 = (void *)sharedInstanceForAccountType_creatingClass____sharedInstances;
  }
  v8 = [v5 objectForKeyedSubscript:v4];
  if (!v8)
  {
    v8 = objc_opt_new();
    [(id)sharedInstanceForAccountType_creatingClass____sharedInstances setObject:v8 forKeyedSubscript:v4];
  }

  return v8;
}

- (ESLocalDBHelper)init
{
  v16.receiver = self;
  v16.super_class = (Class)ESLocalDBHelper;
  v2 = [(ESLocalDBHelper *)&v16 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.dataaccessd.abDBQueue", 0);
    abDBQueue = v2->_abDBQueue;
    v2->_abDBQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.dataaccessd.calDBQueue", 0);
    calDBQueue = v2->_calDBQueue;
    v2->_calDBQueue = (OS_dispatch_queue *)v5;

    v7 = [[ESCalDBHelper alloc] initWithDatabaseInitOptions:6];
    calDBHelper = v2->_calDBHelper;
    v2->_calDBHelper = v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.dataaccessd.noteDBQueue", 0);
    noteDBQueue = v2->_noteDBQueue;
    v2->_noteDBQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = [MEMORY[0x263EFF980] array];
    saveRequests = v2->_saveRequests;
    v2->_saveRequests = (NSMutableArray *)v11;

    v13 = (CNContactStore *)objc_alloc_init(MEMORY[0x263EFEA58]);
    contactStore = v2->_contactStore;
    v2->_contactStore = v13;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(NSMutableArray *)self->_saveRequests count];
  if (v3)
  {
    uint64_t v4 = v3;
    dispatch_queue_t v5 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v8 = v4;
      _os_log_impl(&dword_239784000, v5, OS_LOG_TYPE_DEFAULT, "Unexpected unsaved contact changes: %lu", buf, 0xCu);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)ESLocalDBHelper;
  [(ESLocalDBHelper *)&v6 dealloc];
}

- (id)changeTrackingID
{
  uint64_t v3 = [(ESCalDBHelper *)self->_calDBHelper clientIdentifier];
  clientIdentifier = v3;
  if (!v3) {
    clientIdentifier = self->_clientIdentifier;
  }
  dispatch_queue_t v5 = clientIdentifier;

  if ([(NSString *)v5 isEqualToString:@"com.apple.dataaccessd.changeinserter"])
  {

    dispatch_queue_t v5 = 0;
  }
  return v5;
}

- (void)abDBThrowOnNil:(BOOL)a3
{
  if (a3 && !self->_abDB)
  {
    objc_super v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"ESLocalDBHelper.m", 128, @"You can't ask for an AddressBook db if you didn't open it.  Geez! %@", objc_opt_class() object file lineNumber description];
  }
  return self->_abDB;
}

- (void)abDB
{
  v0 = [MEMORY[0x263F08B88] callStackSymbols];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_239784000, v1, v2, "abDB is unsupported under modern Contacts framework :%@", v3, v4, v5, v6, v7);
}

- (void)addSaveRequest:(id)a3
{
  id v4 = a3;
  abDBQueue = self->_abDBQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__ESLocalDBHelper_addSaveRequest___block_invoke;
  v7[3] = &unk_264DA1A80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(abDBQueue, v7);
}

uint64_t __34__ESLocalDBHelper_addSaveRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) addObject:*(void *)(a1 + 40)];
}

- (void)executeAllSaveRequests
{
  id v6 = [MEMORY[0x263F08B88] callStackSymbols];
  *(_DWORD *)a1 = 138412290;
  *a2 = v6;
  _os_log_error_impl(&dword_239784000, a3, OS_LOG_TYPE_ERROR, "Unexpected error committing save request :%@", a1, 0xCu);
}

- (BOOL)useContacts
{
  return [MEMORY[0x263F38F30] useContactsFramework];
}

- (void)_registerForAddressBookYieldNotifications
{
  v0 = [MEMORY[0x263F08B88] callStackSymbols];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_239784000, v1, v2, "_registerForAddressBookYieldNotifications is unsupported under modern Contacts framework :%@", v3, v4, v5, v6, v7);
}

void __60__ESLocalDBHelper__registerForAddressBookYieldNotifications__block_invoke(uint64_t a1)
{
  uint64_t v2 = DALoggingwithCategory();
  os_log_type_t v3 = *(unsigned char *)(MEMORY[0x263F38F90] + 6);
  if (os_log_type_enabled(v2, v3))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_239784000, v2, v3, "Someone asked us to yield the AddressBook database. Bumping up all clients to UI priority", buf, 2u);
  }

  uint64_t v4 = [MEMORY[0x263F38DB8] sharedManager];
  [v4 bumpDataclassesToUIPriority:2];

  uint64_t v5 = dataaccess_get_global_queue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__ESLocalDBHelper__registerForAddressBookYieldNotifications__block_invoke_32;
  block[3] = &unk_264DA1B30;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v5, block);
}

uint64_t __60__ESLocalDBHelper__registerForAddressBookYieldNotifications__block_invoke_32(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 48);
  if (result) {
    return ABAddressBookRegisterYieldBlock();
  }
  return result;
}

- (BOOL)_abOpenDBWithClientIdentifier:(id)a3
{
  id v4 = a3;
  if ([(ESLocalDBHelper *)self useContacts])
  {
    uint64_t v5 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ESLocalDBHelper _abOpenDBWithClientIdentifier:]();
    }

    BOOL v6 = 0;
  }
  else
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 0;
    abDBQueue = self->_abDBQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__ESLocalDBHelper__abOpenDBWithClientIdentifier___block_invoke;
    block[3] = &unk_264DA1CB8;
    block[4] = self;
    id v10 = v4;
    uint64_t v11 = &v12;
    dispatch_sync(abDBQueue, block);
    BOOL v6 = *((unsigned char *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }

  return v6;
}

void __49__ESLocalDBHelper__abOpenDBWithClientIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  os_log_type_t v3 = (os_log_type_t *)MEMORY[0x263F38F90];
  if (*(void *)(v2 + 48))
  {
    os_log_type_t v4 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  }
  else
  {
    uint64_t v5 = DALoggingwithCategory();
    os_log_type_t v4 = *((unsigned char *)v3 + 7);
    if (os_log_type_enabled(v5, v4))
    {
      BOOL v6 = *(__CFError **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      CFErrorRef v21 = v6;
      _os_log_impl(&dword_239784000, v5, v4, "Creating ab database for client %@", buf, 0xCu);
    }

    CFErrorRef error = 0;
    if (_fakedOutABDBDir) {
      uint64_t v7 = ABAddressBookCreateWithDatabaseDirectory();
    }
    else {
      uint64_t v7 = (uint64_t)ABAddressBookCreateWithOptions(0, &error);
    }
    *(void *)(*(void *)(a1 + 32) + 48) = v7;
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 48);
    uint64_t v9 = DALoggingwithCategory();
    id v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, v4))
      {
        uint64_t v11 = *(__CFError **)(*(void *)(a1 + 32) + 48);
        *(_DWORD *)buf = 134217984;
        CFErrorRef v21 = v11;
        _os_log_impl(&dword_239784000, v10, v4, "Created ab database %p", buf, 0xCu);
      }

      ABAddressBookSetIsBackgroundProcess();
      [*(id *)(a1 + 32) _registerForAddressBookYieldNotifications];
      if ([*(id *)(a1 + 40) length]) {
        ABChangeHistorySetAddressBookClientIdentifier();
      }
      [*(id *)(a1 + 32) setClientIdentifier:*(void *)(a1 + 40)];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      uint64_t v12 = *((unsigned __int8 *)v3 + 3);
      if (os_log_type_enabled(v9, v3[3]))
      {
        *(_DWORD *)buf = 138412290;
        CFErrorRef v21 = error;
        _os_log_impl(&dword_239784000, v10, (os_log_type_t)v12, "Couldn't create ab database: %@", buf, 0xCu);
      }
    }
    if (error) {
      CFRelease(error);
    }
    uint64_t v2 = *(void *)(a1 + 32);
  }
  ++*(_DWORD *)(v2 + 32);
  v13 = DALoggingwithCategory();
  if (os_log_type_enabled(v13, v4))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    char v15 = *(__CFError **)(v14 + 48);
    LODWORD(v14) = *(_DWORD *)(v14 + 32);
    *(_DWORD *)buf = 134218240;
    CFErrorRef v21 = v15;
    __int16 v22 = 1024;
    int v23 = v14;
    _os_log_impl(&dword_239784000, v13, v4, "AB database %p opened. Connection count is now %d", buf, 0x12u);
  }

  if (*(int *)(*(void *)(a1 + 32) + 32) >= 2)
  {
    objc_super v16 = DALoggingwithCategory();
    os_log_type_t v17 = *((unsigned char *)v3 + 6);
    if (os_log_type_enabled(v16, v17))
    {
      int v18 = *(_DWORD *)(*(void *)(a1 + 32) + 32);
      *(_DWORD *)buf = 67109120;
      LODWORD(v21) = v18;
      _os_log_impl(&dword_239784000, v16, v17, "_abConnectionCount is > 1, at %d", buf, 8u);
    }
  }
}

- (void)abOpenDBWithClientIdentifier:(id)a3
{
  id v5 = a3;
  if ([(ESLocalDBHelper *)self useContacts])
  {
    BOOL v6 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ESLocalDBHelper abOpenDBWithClientIdentifier:]();
    }
  }
  else
  {
    if (!v5)
    {
      uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"ESLocalDBHelper.m" lineNumber:235 description:@"ClientIdentifier can not be nil"];
    }
    [(ESLocalDBHelper *)self _abOpenDBWithClientIdentifier:v5];
  }
}

- (void)abOpenDBAsGenericClient
{
  if (![(ESLocalDBHelper *)self useContacts]
    && [(ESLocalDBHelper *)self _abOpenDBWithClientIdentifier:0])
  {
    ABChangeHistorySetAddressBookClientIdentifier();
  }
}

- (void)abProcessAddedRecords
{
  v0 = [MEMORY[0x263F08B88] callStackSymbols];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_239784000, v1, v2, "abOpenDBAsGenericClient is unsupported under modern Contacts framework :%@", v3, v4, v5, v6, v7);
}

- (void)abProcessAddedImages
{
  if ([(ESLocalDBHelper *)self useContacts])
  {
    uint64_t v2 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      -[ESLocalDBHelper abProcessAddedRecords]();
    }
  }
  else
  {
    ABProcessAddedImages();
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x263F245E8], 0, 0, 1u);
    id v4 = [MEMORY[0x263F38DA0] sharedGateKeeper];
    [v4 claimedOwnershipOfDataclasses:2];
  }
}

- (BOOL)abSaveDB
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ([(ESLocalDBHelper *)self useContacts])
  {
    uint64_t v3 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[ESLocalDBHelper abSaveDB]();
    }
    BOOL v4 = 0;
  }
  else
  {
    uint64_t v3 = +[ESLocalDBWatcher sharedDBWatcher];
    uint64_t v5 = [v3 lastSavedABSequenceNumber];
    [v3 setLastSavedABSequenceNumber:ABAddressBookGetSequenceNumber()];
    uint64_t v6 = DALoggingwithCategory();
    os_log_type_t v7 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
    if (os_log_type_enabled(v6, v7))
    {
      abDB = self->_abDB;
      int abConnectionCount = self->_abConnectionCount;
      int v11 = 134218496;
      uint64_t v12 = abDB;
      __int16 v13 = 1024;
      int v14 = v5;
      __int16 v15 = 1024;
      int v16 = abConnectionCount;
      _os_log_impl(&dword_239784000, v6, v7, "Saving ab database %p old sequence %d. Connection count is %d", (uint8_t *)&v11, 0x18u);
    }

    BOOL v4 = ABAddressBookSave(self->_abDB, 0);
    if (!v4) {
      [v3 setLastSavedABSequenceNumber:v5];
    }
    [(ESLocalDBHelper *)self _registerForAddressBookYieldNotifications];
  }

  return v4;
}

- (BOOL)abCloseDBAndSave:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(ESLocalDBHelper *)self useContacts])
  {
    uint64_t v5 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ESLocalDBHelper abSaveDB]();
    }

    return 0;
  }
  else
  {
    BOOL v6 = !v3 || [(ESLocalDBHelper *)self abSaveDB];
    abDBQueue = self->_abDBQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __36__ESLocalDBHelper_abCloseDBAndSave___block_invoke;
    block[3] = &unk_264DA1B30;
    block[4] = self;
    dispatch_sync(abDBQueue, block);
  }
  return v6;
}

void __36__ESLocalDBHelper_abCloseDBAndSave___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  --*(_DWORD *)(*(void *)(a1 + 32) + 32);
  uint64_t v2 = MEMORY[0x263F38F90];
  if ((*(_DWORD *)(*(void *)(a1 + 32) + 32) & 0x80000000) != 0)
  {
    BOOL v3 = DALoggingwithCategory();
    os_log_type_t v4 = *(unsigned char *)(v2 + 3);
    if (os_log_type_enabled(v3, v4))
    {
      int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 32);
      int v14 = 67109120;
      LODWORD(v15) = v5;
      _os_log_impl(&dword_239784000, v3, v4, "_abCloseDB called too many times (connection count %d).  Resetting count to 0", (uint8_t *)&v14, 8u);
    }

    *(_DWORD *)(*(void *)(a1 + 32) + 32) = 0;
  }
  BOOL v6 = DALoggingwithCategory();
  os_log_type_t v7 = *(unsigned char *)(v2 + 7);
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(v8 + 48);
    LODWORD(v8) = *(_DWORD *)(v8 + 32);
    int v14 = 134218240;
    uint64_t v15 = v9;
    __int16 v16 = 1024;
    int v17 = v8;
    _os_log_impl(&dword_239784000, v6, v7, "Decrementing database %p reference count. _abConnectionCount is %d", (uint8_t *)&v14, 0x12u);
  }

  if (!*(_DWORD *)(*(void *)(a1 + 32) + 32))
  {
    id v10 = DALoggingwithCategory();
    if (os_log_type_enabled(v10, v7))
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 48);
      int v14 = 134217984;
      uint64_t v15 = v11;
      _os_log_impl(&dword_239784000, v10, v7, "Destroying ab database %p", (uint8_t *)&v14, 0xCu);
    }

    ABAddressBookRegisterYieldBlock();
    uint64_t v12 = *(void *)(a1 + 32);
    __int16 v13 = *(const void **)(v12 + 48);
    if (v13)
    {
      CFRelease(v13);
      *(void *)(*(void *)(a1 + 32) + 48) = 0;
      uint64_t v12 = *(void *)(a1 + 32);
    }
    *(void *)(v12 + 48) = 0;
  }
}

- (id)abConstraintPlistPath
{
  return 0;
}

- (CalDatabase)calDatabaseForAccountID:(id)a3
{
  id v4 = a3;
  int v5 = DALoggingwithCategory();
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v5, v6))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_239784000, v5, v6, "Data_Separation: Invoking calDatabaseForAccountID", v9, 2u);
  }

  os_log_type_t v7 = [(ESCalDBHelper *)self->_calDBHelper databaseForAccountID:v4];
  return v7;
}

- (CalDatabase)calDatabaseForAuxDatabaseRef:(void *)a3
{
  return [(ESCalDBHelper *)self->_calDBHelper databaseForAuxDatabaseRef:a3];
}

- (void)calOpenDatabaseForAccountID:(id)a3 clientID:(id)a4
{
  id v9 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"ESLocalDBHelper.m" lineNumber:350 description:@"ClientIdentifier can not be nil"];
  }
  [(ESCalDBHelper *)self->_calDBHelper openDatabaseForAccountID:v9 clientID:v7];
}

- (void)calOpenDatabaseForAuxDatabaseRef:(void *)a3 clientID:(id)a4
{
  id v7 = a4;
  id v9 = v7;
  if (!v7)
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"ESLocalDBHelper.m" lineNumber:355 description:@"ClientIdentifier can not be nil"];

    id v7 = 0;
  }
  [(ESCalDBHelper *)self->_calDBHelper openDatabaseForAuxDatabaseRef:a3 clientID:v7];
}

- (void)calOpenDatabaseAsGenericClientForAccountID:(id)a3
{
}

- (void)calOpenDatabaseAsGenericClientForAuxDatabaseRef:(void *)a3
{
}

- (BOOL)calSaveDatabaseForAccountID:(id)a3
{
  return [(ESCalDBHelper *)self->_calDBHelper saveDatabaseForAccountID:a3 flushCaches:0];
}

- (BOOL)calSaveDatabaseAndFlushCachesForAccountID:(id)a3
{
  return [(ESCalDBHelper *)self->_calDBHelper saveDatabaseForAccountID:a3 flushCaches:1];
}

- (BOOL)calSaveDatabaseForAuxDatabaseRef:(void *)a3
{
  return [(ESCalDBHelper *)self->_calDBHelper saveDatabaseForAuxDatabaseRef:a3 flushCaches:0];
}

- (BOOL)calCloseDatabaseForAccountID:(id)a3 save:(BOOL)a4
{
  return [(ESCalDBHelper *)self->_calDBHelper closeDatabaseForAccountID:a3 save:a4];
}

- (BOOL)calCloseDatabaseForAuxDatabaseRef:(void *)a3 save:(BOOL)a4
{
  return [(ESCalDBHelper *)self->_calDBHelper closeDatabaseForAuxDatabaseRef:a3 save:a4];
}

- (NoteContext)noteDB
{
  noteDB = self->_noteDB;
  if (!noteDB)
  {
    os_log_type_t v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"ESLocalDBHelper.m", 390, @"You can't ask for a note db if you didn't open it.  Geez! %@", objc_opt_class() object file lineNumber description];

    noteDB = self->_noteDB;
  }
  return noteDB;
}

- (void)noteOpenDB
{
  noteDBQueue = self->_noteDBQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__ESLocalDBHelper_noteOpenDB__block_invoke;
  block[3] = &unk_264DA1B30;
  block[4] = self;
  dispatch_sync(noteDBQueue, block);
}

void __29__ESLocalDBHelper_noteOpenDB__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = MEMORY[0x263F38F90];
  if (!*(void *)(v2 + 96))
  {
    id v4 = DALoggingwithCategory();
    os_log_type_t v5 = *(unsigned char *)(v3 + 7);
    if (os_log_type_enabled(v4, v5))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_239784000, v4, v5, "Creating note database", (uint8_t *)&v19, 2u);
    }

    uint64_t v6 = objc_opt_new();
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 96);
    *(void *)(v7 + 96) = v6;

    id v9 = DALoggingwithCategory();
    if (os_log_type_enabled(v9, v5))
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 96);
      int v19 = 134217984;
      uint64_t v20 = v10;
      _os_log_impl(&dword_239784000, v9, v5, "Created note database %p", (uint8_t *)&v19, 0xCu);
    }

    uint64_t v2 = *(void *)(a1 + 32);
  }
  int v11 = *(_DWORD *)(v2 + 40);
  if (!v11)
  {
    [*(id *)(v2 + 96) enableChangeLogging:0];
    uint64_t v2 = *(void *)(a1 + 32);
    int v11 = *(_DWORD *)(v2 + 40);
  }
  *(_DWORD *)(v2 + 40) = v11 + 1;
  uint64_t v12 = DALoggingwithCategory();
  os_log_type_t v13 = *(unsigned char *)(v3 + 7);
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = *(void *)(v14 + 96);
    LODWORD(v14) = *(_DWORD *)(v14 + 40);
    int v19 = 134218240;
    uint64_t v20 = v15;
    __int16 v21 = 1024;
    int v22 = v14;
    _os_log_impl(&dword_239784000, v12, v13, "Note database %p opened. Connection count is now %d", (uint8_t *)&v19, 0x12u);
  }

  if (*(int *)(*(void *)(a1 + 32) + 40) >= 2)
  {
    __int16 v16 = DALoggingwithCategory();
    os_log_type_t v17 = *(unsigned char *)(v3 + 6);
    if (os_log_type_enabled(v16, v17))
    {
      int v18 = *(_DWORD *)(*(void *)(a1 + 32) + 40);
      int v19 = 67109120;
      LODWORD(v20) = v18;
      _os_log_impl(&dword_239784000, v16, v17, "_noteConnectionCount is > 1, at %d", (uint8_t *)&v19, 8u);
    }
  }
}

- (BOOL)noteSaveDB
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v3 = DALoggingwithCategory();
  uint64_t v4 = MEMORY[0x263F38F90];
  os_log_type_t v5 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v3, v5))
  {
    noteDB = self->_noteDB;
    int noteConnectionCount = self->_noteConnectionCount;
    *(_DWORD *)buf = 134218240;
    os_log_type_t v17 = noteDB;
    __int16 v18 = 1024;
    LODWORD(v19) = noteConnectionCount;
    _os_log_impl(&dword_239784000, v3, v5, "Saving notes database %p. Connection count is %d", buf, 0x12u);
  }

  uint64_t v8 = self->_noteDB;
  id v15 = 0;
  char v9 = [(NoteContext *)v8 save:&v15];
  id v10 = v15;
  if ((v9 & 1) == 0)
  {
    int v11 = DALoggingwithCategory();
    os_log_type_t v12 = *(unsigned char *)(v4 + 3);
    if (os_log_type_enabled(v11, v12))
    {
      os_log_type_t v13 = self->_noteDB;
      *(_DWORD *)buf = 134218242;
      os_log_type_t v17 = v13;
      __int16 v18 = 2112;
      id v19 = v10;
      _os_log_impl(&dword_239784000, v11, v12, "Saving notes database %p failed with error %@", buf, 0x16u);
    }
  }
  return v9;
}

- (BOOL)noteCloseDBAndSave:(BOOL)a3
{
  BOOL v4 = !a3 || [(ESLocalDBHelper *)self noteSaveDB];
  noteDBQueue = self->_noteDBQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__ESLocalDBHelper_noteCloseDBAndSave___block_invoke;
  block[3] = &unk_264DA1B30;
  block[4] = self;
  dispatch_sync(noteDBQueue, block);
  return v4;
}

void __38__ESLocalDBHelper_noteCloseDBAndSave___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  --*(_DWORD *)(*(void *)(a1 + 32) + 40);
  uint64_t v2 = DALoggingwithCategory();
  uint64_t v3 = MEMORY[0x263F38F90];
  os_log_type_t v4 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v2, v4))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(v5 + 96);
    LODWORD(v5) = *(_DWORD *)(v5 + 40);
    int v15 = 134218240;
    uint64_t v16 = v6;
    __int16 v17 = 1024;
    int v18 = v5;
    _os_log_impl(&dword_239784000, v2, v4, "Decrementing database %p reference count. _noteConnectionCount is %d", (uint8_t *)&v15, 0x12u);
  }

  int v7 = *(_DWORD *)(*(void *)(a1 + 32) + 40);
  if ((v7 & 0x80000000) == 0)
  {
    if (v7) {
      return;
    }
    goto LABEL_9;
  }
  uint64_t v8 = DALoggingwithCategory();
  os_log_type_t v9 = *(unsigned char *)(v3 + 3);
  if (os_log_type_enabled(v8, v9))
  {
    int v10 = *(_DWORD *)(*(void *)(a1 + 32) + 40);
    int v15 = 67109120;
    LODWORD(v16) = v10;
    _os_log_impl(&dword_239784000, v8, v9, "_noteCloseDB called too many times (connection count %d).  Resetting count to 0", (uint8_t *)&v15, 8u);
  }

  *(_DWORD *)(*(void *)(a1 + 32) + 40) = 0;
  if (!*(_DWORD *)(*(void *)(a1 + 32) + 40))
  {
LABEL_9:
    int v11 = DALoggingwithCategory();
    if (os_log_type_enabled(v11, v4))
    {
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 96);
      int v15 = 134217984;
      uint64_t v16 = v12;
      _os_log_impl(&dword_239784000, v11, v4, "Destroying notes database %p", (uint8_t *)&v15, 0xCu);
    }

    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void **)(v13 + 96);
    *(void *)(v13 + 96) = 0;
  }
}

- (int)noteConnectionCount
{
  return self->_noteConnectionCount;
}

+ (void)abSetTestABDBDir:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = DALoggingwithCategory();
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x263F38F90] + 6);
  if (os_log_type_enabled(v5, v6))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_239784000, v5, v6, "Setting unit test Address Book Database directory to: %@", (uint8_t *)&v8, 0xCu);
  }

  if ((id)_fakedOutABDBDir != v4)
  {
    objc_storeStrong((id *)&_fakedOutABDBDir, a3);
    if ([v4 length])
    {
      int v7 = +[ESLocalDBWatcher sharedDBWatcher];
      [v7 noteABDBDirChanged];
    }
  }
}

+ (id)abTestABDBDir
{
  return (id)_fakedOutABDBDir;
}

+ (void)calSetTestCalDBDir:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = DALoggingwithCategory();
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x263F38F90] + 6);
  if (os_log_type_enabled(v5, v6))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_239784000, v5, v6, "Setting unit test Calendar Database directory to: %@", (uint8_t *)&v8, 0xCu);
  }

  if ((id)_fakedOutCalDBDir != v4)
  {
    objc_storeStrong((id *)&_fakedOutCalDBDir, a3);
    if ([v4 length])
    {
      int v7 = +[ESLocalDBWatcher sharedDBWatcher];
      [v7 noteCalDBDirChanged];
    }
  }
}

+ (id)calTestCalDBDir
{
  return (id)_fakedOutCalDBDir;
}

- (void)calUnitTestsSetCallbackBlockForSave:(id)a3
{
  id v7 = a3;
  id v4 = [(ESLocalDBHelper *)self calUnitTestCallbackBlock];

  uint64_t v5 = v7;
  if (v4 != v7)
  {
    if (v7)
    {
      os_log_type_t v6 = (void *)[v7 copy];
      [(ESLocalDBHelper *)self setCalUnitTestCallbackBlock:v6];
    }
    else
    {
      [(ESLocalDBHelper *)self setCalUnitTestCallbackBlock:0];
    }
    uint64_t v5 = v7;
  }
}

- (void)setAbDB:(void *)a3
{
  self->_abDB = a3;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (NSMutableArray)saveRequests
{
  return self->_saveRequests;
}

- (void)setSaveRequests:(id)a3
{
}

- (int)abConnectionCount
{
  return self->_abConnectionCount;
}

- (void)setAbConnectionCount:(int)a3
{
  self->_int abConnectionCount = a3;
}

- (CalDatabase)calDB
{
  return self->_calDB;
}

- (void)setCalDB:(CalDatabase *)a3
{
  self->_calDB = a3;
}

- (int)calConnectionCount
{
  return self->_calConnectionCount;
}

- (void)setCalConnectionCount:(int)a3
{
  self->_calConnectionCount = a3;
}

- (ESCalDBHelper)calDBHelper
{
  return self->_calDBHelper;
}

- (void)setCalDBHelper:(id)a3
{
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (void)setNoteDB:(id)a3
{
}

- (void)setNoteConnectionCount:(int)a3
{
  self->_int noteConnectionCount = a3;
}

- (id)calUnitTestCallbackBlock
{
  return self->_calUnitTestCallbackBlock;
}

- (void)setCalUnitTestCallbackBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_calUnitTestCallbackBlock, 0);
  objc_storeStrong((id *)&self->_noteDB, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_calDBHelper, 0);
  objc_storeStrong((id *)&self->_saveRequests, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_noteDBQueue, 0);
  objc_storeStrong((id *)&self->_calDBQueue, 0);
  objc_storeStrong((id *)&self->_abDBQueue, 0);
}

- (void)_abOpenDBWithClientIdentifier:.cold.1()
{
  v0 = [MEMORY[0x263F08B88] callStackSymbols];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_239784000, v1, v2, "_abOpenDBWithClientIdentifier is unsupported under modern Contacts framework :%@", v3, v4, v5, v6, v7);
}

- (void)abOpenDBWithClientIdentifier:.cold.1()
{
  v0 = [MEMORY[0x263F08B88] callStackSymbols];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_239784000, v1, v2, "abOpenDBWithClientIdentifier is unsupported under modern Contacts framework :%@", v3, v4, v5, v6, v7);
}

- (void)abSaveDB
{
  v0 = [MEMORY[0x263F08B88] callStackSymbols];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_239784000, v1, v2, "abSaveDB is unsupported under modern Contacts framework :%@", v3, v4, v5, v6, v7);
}

@end