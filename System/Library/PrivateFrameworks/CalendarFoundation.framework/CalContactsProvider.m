@interface CalContactsProvider
+ (BOOL)birthdayIsYearless:(id)a3;
+ (BOOL)isCalendarIslamic:(id)a3;
+ (BOOL)shouldPermitOrganizerEmailFromJunkChecks:(id)a3 inReputationStore:(id)a4;
+ (BOOL)shouldPermitOrganizerPhoneNumberFromJunkChecks:(id)a3 inReputationStore:(id)a4;
+ (id)birthdayStringForContactName:(id)a3 eventDate:(id)a4 birthDate:(id)a5 lunarCalendar:(id)a6;
+ (id)defaultProvider;
+ (id)reputationForHandle:(id)a3 inStore:(id)a4;
- (BOOL)contactAccessResolved;
- (BOOL)contactIdentifierIsMe:(id)a3;
- (BOOL)matchesOneOfMyEmails:(id)a3;
- (BOOL)matchesOneOfMyPhoneNumbers:(id)a3;
- (BOOL)shouldPermitOrganizerEmailFromJunkChecks:(id)a3;
- (BOOL)shouldPermitOrganizerPhoneNumberFromJunkChecks:(id)a3;
- (BOOL)urlMatchesOneOfMyEmails:(id)a3;
- (CNContact)meContact;
- (CNContactStore)store;
- (CNReputationStore)reputationStore;
- (CalContactsProvider)init;
- (CalContactsProvider)initWithStore:(id)a3;
- (NSArray)loadedMyEmailAddresses;
- (NSArray)unitTestEmails;
- (NSMutableSet)delegates;
- (NSString)testMeContactIdentifer;
- (OS_dispatch_queue)contactStoreWorkQueue;
- (OS_dispatch_queue)syncQueue;
- (id)_fetchedUnifiedMeContact;
- (id)_fullNameForFirstContactMatchingPredicate:(id)a3;
- (id)_lastHistoryToken;
- (id)_meWithKeys:(id)a3;
- (id)cachedEmailAddress;
- (id)cachedEmailAddressArray;
- (id)cachedEmailAddresses;
- (id)contactsFromContactIdentifiers:(id)a3 withKeys:(id)a4;
- (id)fullNameForFirstContactMatchingEmailAddress:(id)a3;
- (id)fullNameForFirstContactMatchingPhoneNumber:(id)a3;
- (id)myAddressForLabel:(id)a3;
- (id)myEmailAddress;
- (id)myEmailAddresses;
- (id)myFullName;
- (id)myHomeAddress;
- (id)myNameWithStyle:(int64_t)a3;
- (id)myPhoneNumbers;
- (id)myShortDisplayName;
- (id)myWorkAddress;
- (id)nullableContactStore;
- (id)unifiedContactMatchingName:(id)a3 email:(id)a4 url:(id)a5 keysToFetch:(id)a6;
- (id)unifiedContactMatchingString:(id)a3 keysToFetch:(id)a4 matchType:(int64_t *)a5;
- (id)unifiedContactWithEmailAddress:(id)a3;
- (id)unifiedContactWithIdentifier:(id)a3;
- (id)unifiedContactWithIdentifier:(id)a3 keysToFetch:(id)a4;
- (id)unifiedContactWithName:(id)a3;
- (id)unifiedContactWithPhoneNumber:(id)a3;
- (id)unifiedContactsDictionaryForHandleStrings:(id)a3 keysToFetch:(id)a4;
- (id)unifiedContactsForHandleStrings:(id)a3 keysToFetch:(id)a4;
- (id)unifiedContactsMatchingPredicate:(id)a3 keysToFetch:(id)a4;
- (void)_setLastHistoryToken:(id)a3;
- (void)_syncContacts;
- (void)contactAccessResolved;
- (void)contactsChanged:(id)a3;
- (void)deregisterForContactChangeNotifications:(id)a3;
- (void)meCardChanged:(id)a3;
- (void)registerForContactChangeNotifications:(id)a3;
- (void)setContactStoreWorkQueue:(id)a3;
- (void)setDelegates:(id)a3;
- (void)setLoadedMyEmailAddresses:(id)a3;
- (void)setMeCardEmailsForUnitTesting:(id)a3;
- (void)setMeContact:(id)a3;
- (void)setReputationStore:(id)a3;
- (void)setStore:(id)a3;
- (void)setSyncQueue:(id)a3;
- (void)setTestMeContactIdentifer:(id)a3;
- (void)setTestMeContactIdentifier:(id)a3;
- (void)setUnitTestEmails:(id)a3;
@end

@implementation CalContactsProvider

+ (id)defaultProvider
{
  if (defaultProvider_onceToken_0 != -1) {
    dispatch_once(&defaultProvider_onceToken_0, &__block_literal_global_7_0);
  }
  v2 = (void *)defaultProvider__defaultProvider_0;

  return v2;
}

uint64_t __38__CalContactsProvider_defaultProvider__block_invoke()
{
  defaultProvider__defaultProvider_0 = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

- (CalContactsProvider)init
{
  v3 = (OS_dispatch_queue *)dispatch_queue_create("Contact Store Work", 0);
  contactStoreWorkQueue = self->_contactStoreWorkQueue;
  self->_contactStoreWorkQueue = v3;

  v5 = self->_contactStoreWorkQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__CalContactsProvider_init__block_invoke;
  block[3] = &unk_1E56CD9A0;
  v6 = self;
  v17 = v6;
  dispatch_async(v5, block);
  v7 = dispatch_get_global_queue(0, 0);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __27__CalContactsProvider_init__block_invoke_13;
  v14 = &unk_1E56CD9A0;
  v8 = v6;
  v15 = v8;
  dispatch_async(v7, &v11);

  v9 = -[CalContactsProvider initWithStore:](v8, "initWithStore:", 0, v11, v12, v13, v14);
  return v9;
}

void __27__CalContactsProvider_init__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1B990]);
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1B980]) initWithConfiguration:v2];
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __27__CalContactsProvider_init__block_invoke_2;
  v11[3] = &unk_1E56CDDF8;
  v5 = v4;
  uint64_t v12 = v5;
  [v3 requestAccessForEntityType:0 completionHandler:v11];
  dispatch_time_t v6 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v5, v6) >= 1)
  {
    v7 = +[CalFoundationLogSubsystem contacts];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __27__CalContactsProvider_init__block_invoke_cold_1();
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(void **)(v8 + 16);
  *(void *)(v8 + 16) = v3;
  id v10 = v3;
}

void __27__CalContactsProvider_init__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    dispatch_time_t v6 = +[CalFoundationLogSubsystem contacts];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __27__CalContactsProvider_init__block_invoke_2_cold_1();
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __27__CalContactsProvider_init__block_invoke_13(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _fetchedUnifiedMeContact];
  [*(id *)(a1 + 32) setMeContact:v2];
}

- (CalContactsProvider)initWithStore:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CalContactsProvider;
  dispatch_time_t v6 = [(CalContactsProvider *)&v18 init];
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_store, a3);
      dispatch_queue_t v8 = dispatch_queue_create("Contact Store Work", 0);
      contactStoreWorkQueue = v7->_contactStoreWorkQueue;
      v7->_contactStoreWorkQueue = (OS_dispatch_queue *)v8;
    }
    uint64_t v10 = objc_opt_new();
    reputationStore = v7->_reputationStore;
    v7->_reputationStore = (CNReputationStore *)v10;

    uint64_t v12 = objc_opt_new();
    delegates = v7->_delegates;
    v7->_delegates = (NSMutableSet *)v12;

    v14 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v15 = dispatch_queue_create("CalendarFoundation.contacts", v14);
    [(CalContactsProvider *)v7 setSyncQueue:v15];

    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v7 selector:sel_meCardChanged_ name:*MEMORY[0x1E4F1AF88] object:0];
  }
  return v7;
}

- (void)registerForContactChangeNotifications:(id)a3
{
  id v5 = a3;
  if (![(NSMutableSet *)self->_delegates count])
  {
    dispatch_semaphore_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:self selector:sel_contactsChanged_ name:*MEMORY[0x1E4F1AF80] object:0];
  }
  [(NSMutableSet *)self->_delegates addObject:v5];
}

- (void)deregisterForContactChangeNotifications:(id)a3
{
  [(NSMutableSet *)self->_delegates removeObject:a3];
  if (![(NSMutableSet *)self->_delegates count])
  {
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:self name:*MEMORY[0x1E4F1AF80] object:0];
  }
}

- (BOOL)contactAccessResolved
{
  uint64_t v5 = 0;
  dispatch_time_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  id v2 = (unsigned int (*)(__CFString *))getMGGetBoolAnswerSymbolLoc_ptr;
  dispatch_queue_t v8 = getMGGetBoolAnswerSymbolLoc_ptr;
  if (!getMGGetBoolAnswerSymbolLoc_ptr)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __getMGGetBoolAnswerSymbolLoc_block_invoke;
    v4[3] = &unk_1E56CD8C0;
    v4[4] = &v5;
    __getMGGetBoolAnswerSymbolLoc_block_invoke((uint64_t)v4);
    id v2 = (unsigned int (*)(__CFString *))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v2) {
    -[CalContactsProvider contactAccessResolved]();
  }
  return !v2(@"green-tea") || [MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0] != 0;
}

- (CNContact)meContact
{
  if ([(CalContactsProvider *)self contactAccessResolved])
  {
    v3 = self;
    objc_sync_enter(v3);
    id v4 = v3->_meContact;
    objc_sync_exit(v3);

    if (!v4)
    {
      id v4 = [(CalContactsProvider *)v3 _fetchedUnifiedMeContact];
    }
    [(CalContactsProvider *)v3 setMeContact:v4];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)setMeContact:(id)a3
{
  id v11 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  meContact = v5->_meContact;
  uint64_t v7 = [(CalContactsProvider *)v5 loadedMyEmailAddresses];
  objc_storeStrong((id *)&v5->_meContact, a3);
  dispatch_queue_t v8 = [(CNContact *)v5->_meContact CalEmailAddresses];
  char v9 = [v8 isEqualToArray:v7];
  [(CalContactsProvider *)v5 setLoadedMyEmailAddresses:v8];
  if (meContact) {
    char v9 = 1;
  }

  objc_sync_exit(v5);
  if ((v9 & 1) == 0)
  {
    uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 postNotificationName:@"CalMeCardChangedNotification" object:0];
  }
}

- (void)setMeCardEmailsForUnitTesting:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(CalContactsProvider *)v4 setUnitTestEmails:v5];
  objc_sync_exit(v4);
}

- (id)nullableContactStore
{
  if ([(CalContactsProvider *)self contactAccessResolved])
  {
    uint64_t v7 = 0;
    dispatch_queue_t v8 = &v7;
    uint64_t v9 = 0x3032000000;
    uint64_t v10 = __Block_byref_object_copy__5;
    id v11 = __Block_byref_object_dispose__5;
    id v12 = 0;
    contactStoreWorkQueue = self->_contactStoreWorkQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __43__CalContactsProvider_nullableContactStore__block_invoke;
    v6[3] = &unk_1E56CDE20;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(contactStoreWorkQueue, v6);
    id v4 = (id)v8[5];
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

uint64_t __43__CalContactsProvider_nullableContactStore__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) store];

  return MEMORY[0x1F41817F8]();
}

- (void)contactsChanged:(id)a3
{
  id v4 = [(CalContactsProvider *)self syncQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__CalContactsProvider_contactsChanged___block_invoke;
  block[3] = &unk_1E56CD9A0;
  void block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __39__CalContactsProvider_contactsChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _syncContacts];
}

- (void)meCardChanged:(id)a3
{
  id v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__CalContactsProvider_meCardChanged___block_invoke;
  block[3] = &unk_1E56CD9A0;
  void block[4] = self;
  dispatch_async(v4, block);
}

void __37__CalContactsProvider_meCardChanged___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _fetchedUnifiedMeContact];
  [*(id *)(a1 + 32) setMeContact:v2];

  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"CalMeCardChangedNotification" object:0];
}

- (void)_syncContacts
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 startingToken];
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_190D88000, a2, OS_LOG_TYPE_DEBUG, "Syncing contacts with starting token [%@]", v4, 0xCu);
}

- (id)_lastHistoryToken
{
  id v2 = +[CalDefaults thisProcess];
  id v3 = [v2 valueForKey:@"CalContactsProviderHistoryToken"];

  return v3;
}

- (void)_setLastHistoryToken:(id)a3
{
  id v3 = a3;
  id v4 = +[CalDefaults thisProcess];
  [v4 setObject:v3 forKey:@"CalContactsProviderHistoryToken"];
}

- (id)_meWithKeys:(id)a3
{
  id v4 = a3;
  if ([(CalContactsProvider *)self contactAccessResolved])
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__5;
    dispatch_queue_t v15 = __Block_byref_object_dispose__5;
    id v16 = 0;
    contactStoreWorkQueue = self->_contactStoreWorkQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__CalContactsProvider__meWithKeys___block_invoke;
    block[3] = &unk_1E56CDAE0;
    void block[4] = self;
    uint64_t v10 = &v11;
    id v9 = v4;
    dispatch_sync(contactStoreWorkQueue, block);
    id v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __35__CalContactsProvider__meWithKeys___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) testMeContactIdentifer];

  id v3 = [*(id *)(a1 + 32) store];
  id v4 = v3;
  if (v2)
  {
    uint64_t v5 = [*(id *)(a1 + 32) testMeContactIdentifer];
    uint64_t v6 = *(void *)(a1 + 40);
    id v16 = 0;
    uint64_t v7 = [v4 unifiedContactWithIdentifier:v5 keysToFetch:v6 error:&v16];
    id v8 = v16;
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v7;
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 40);
    id v15 = 0;
    uint64_t v12 = [v3 _crossPlatformUnifiedMeContactWithKeysToFetch:v11 error:&v15];
    id v8 = v15;
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v5 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }

  if (v8)
  {
    v14 = +[CalFoundationLogSubsystem contacts];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __35__CalContactsProvider__meWithKeys___block_invoke_cold_1();
    }
  }
}

- (id)_fetchedUnifiedMeContact
{
  v8[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F1AF10];
  v8[0] = *MEMORY[0x1E4F1ADC8];
  v8[1] = v3;
  v8[2] = *MEMORY[0x1E4F1AEE0];
  id v4 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  v8[3] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  uint64_t v6 = [(CalContactsProvider *)self _meWithKeys:v5];

  return v6;
}

- (void)setTestMeContactIdentifier:(id)a3
{
  [(CalContactsProvider *)self setTestMeContactIdentifer:a3];
  id v4 = [(CalContactsProvider *)self _fetchedUnifiedMeContact];
  [(CalContactsProvider *)self setMeContact:v4];
}

- (id)unifiedContactsMatchingPredicate:(id)a3 keysToFetch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    if ([(CalContactsProvider *)self contactAccessResolved])
    {
      uint64_t v16 = 0;
      v17 = &v16;
      uint64_t v18 = 0x3032000000;
      v19 = __Block_byref_object_copy__5;
      v20 = __Block_byref_object_dispose__5;
      id v21 = 0;
      contactStoreWorkQueue = self->_contactStoreWorkQueue;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __68__CalContactsProvider_unifiedContactsMatchingPredicate_keysToFetch___block_invoke;
      v12[3] = &unk_1E56CDE48;
      id v15 = &v16;
      v12[4] = self;
      id v13 = v6;
      id v14 = v7;
      dispatch_sync(contactStoreWorkQueue, v12);
      id v9 = (id)v17[5];

      _Block_object_dispose(&v16, 8);
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v10 = +[CalFoundationLogSubsystem contacts];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CalContactsProvider unifiedContactsMatchingPredicate:keysToFetch:]();
    }
  }
  id v9 = 0;
LABEL_8:

  return v9;
}

void __68__CalContactsProvider_unifiedContactsMatchingPredicate_keysToFetch___block_invoke(uint64_t a1)
{
  v1 = (void *)a1;
  id v2 = [*(id *)(a1 + 32) store];
  uint64_t v3 = v1[5];
  uint64_t v4 = v1[6];
  v1 += 5;
  id v10 = 0;
  uint64_t v5 = [v2 unifiedContactsMatchingPredicate:v3 keysToFetch:v4 error:&v10];
  id v6 = v10;
  uint64_t v7 = *(void *)(v1[2] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;

  if (!*(void *)(*(void *)(v1[2] + 8) + 40))
  {
    id v9 = +[CalFoundationLogSubsystem contacts];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __68__CalContactsProvider_unifiedContactsMatchingPredicate_keysToFetch___block_invoke_cold_1();
    }
  }
}

- (id)unifiedContactsForHandleStrings:(id)a3 keysToFetch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CalContactsProvider *)self contactAccessResolved])
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__5;
    v20 = __Block_byref_object_dispose__5;
    id v21 = 0;
    contactStoreWorkQueue = self->_contactStoreWorkQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __67__CalContactsProvider_unifiedContactsForHandleStrings_keysToFetch___block_invoke;
    v11[3] = &unk_1E56CDE70;
    id v15 = &v16;
    id v12 = v6;
    id v13 = self;
    id v14 = v7;
    dispatch_sync(contactStoreWorkQueue, v11);
    id v9 = (id)v17[5];

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __67__CalContactsProvider_unifiedContactsForHandleStrings_keysToFetch___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingHandleStrings:*(void *)(a1 + 32)];
  uint64_t v3 = [*(id *)(a1 + 40) store];
  uint64_t v4 = *(void *)(a1 + 48);
  id v10 = 0;
  uint64_t v5 = [v3 unifiedContactsMatchingPredicate:v2 keysToFetch:v4 error:&v10];
  id v6 = v10;
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    id v9 = +[CalFoundationLogSubsystem contacts];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __67__CalContactsProvider_unifiedContactsForHandleStrings_keysToFetch___block_invoke_cold_1();
    }
  }
}

- (id)unifiedContactsDictionaryForHandleStrings:(id)a3 keysToFetch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CalContactsProvider *)self contactAccessResolved])
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__5;
    v20 = __Block_byref_object_dispose__5;
    id v21 = 0;
    contactStoreWorkQueue = self->_contactStoreWorkQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __77__CalContactsProvider_unifiedContactsDictionaryForHandleStrings_keysToFetch___block_invoke;
    v11[3] = &unk_1E56CDE98;
    id v12 = v7;
    id v13 = v6;
    id v14 = self;
    id v15 = &v16;
    dispatch_sync(contactStoreWorkQueue, v11);
    id v9 = (id)v17[5];

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __77__CalContactsProvider_unifiedContactsDictionaryForHandleStrings_keysToFetch___block_invoke(uint64_t a1)
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F1B908]) initWithKeysToFetch:*(void *)(a1 + 32)];
  uint64_t v3 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingHandleStrings:*(void *)(a1 + 40)];
  [v2 setPredicate:v3];

  uint64_t v4 = [*(id *)(a1 + 48) store];
  id v10 = 0;
  uint64_t v5 = [v4 executeFetchRequest:v2 error:&v10];
  id v6 = v10;

  if (v5)
  {
    uint64_t v7 = [v5 value];
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    id v9 = *(NSObject **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  else
  {
    id v9 = +[CalFoundationLogSubsystem contacts];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __77__CalContactsProvider_unifiedContactsDictionaryForHandleStrings_keysToFetch___block_invoke_cold_1();
    }
  }
}

- (id)unifiedContactWithEmailAddress:(id)a3
{
  id v4 = a3;
  if ([(CalContactsProvider *)self contactAccessResolved])
  {
    uint64_t v5 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingEmailAddress:v4];
    id v6 = [MEMORY[0x1E4F1B8F8] CalKeys];
    uint64_t v20 = 0;
    id v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__5;
    v24 = __Block_byref_object_dispose__5;
    id v25 = 0;
    contactStoreWorkQueue = self->_contactStoreWorkQueue;
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __54__CalContactsProvider_unifiedContactWithEmailAddress___block_invoke;
    id v15 = &unk_1E56CDE48;
    v19 = &v20;
    uint64_t v16 = self;
    id v8 = v5;
    id v17 = v8;
    id v9 = v6;
    id v18 = v9;
    dispatch_sync(contactStoreWorkQueue, &v12);
    id v10 = objc_msgSend((id)v21[5], "firstObject", v12, v13, v14, v15, v16);

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void __54__CalContactsProvider_unifiedContactWithEmailAddress___block_invoke(uint64_t a1)
{
  v1 = (void *)a1;
  id v2 = [*(id *)(a1 + 32) store];
  uint64_t v3 = v1[5];
  uint64_t v4 = v1[6];
  v1 += 5;
  id v10 = 0;
  uint64_t v5 = [v2 unifiedContactsMatchingPredicate:v3 keysToFetch:v4 error:&v10];
  id v6 = v10;
  uint64_t v7 = *(void *)(v1[2] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;

  if (!*(void *)(*(void *)(v1[2] + 8) + 40))
  {
    id v9 = +[CalFoundationLogSubsystem contacts];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __68__CalContactsProvider_unifiedContactsMatchingPredicate_keysToFetch___block_invoke_cold_1();
    }
  }
}

- (id)unifiedContactWithPhoneNumber:(id)a3
{
  id v4 = a3;
  if ([(CalContactsProvider *)self contactAccessResolved])
  {
    uint64_t v5 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v4];
    id v6 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingPhoneNumber:v5];
    uint64_t v7 = [MEMORY[0x1E4F1B8F8] CalKeys];
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__5;
    id v25 = __Block_byref_object_dispose__5;
    id v26 = 0;
    contactStoreWorkQueue = self->_contactStoreWorkQueue;
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __53__CalContactsProvider_unifiedContactWithPhoneNumber___block_invoke;
    uint64_t v16 = &unk_1E56CDE48;
    uint64_t v20 = &v21;
    id v17 = self;
    id v9 = v6;
    id v18 = v9;
    id v10 = v7;
    id v19 = v10;
    dispatch_sync(contactStoreWorkQueue, &v13);
    uint64_t v11 = objc_msgSend((id)v22[5], "firstObject", v13, v14, v15, v16, v17);

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

void __53__CalContactsProvider_unifiedContactWithPhoneNumber___block_invoke(uint64_t a1)
{
  v1 = (void *)a1;
  id v2 = [*(id *)(a1 + 32) store];
  uint64_t v3 = v1[5];
  uint64_t v4 = v1[6];
  v1 += 5;
  id v10 = 0;
  uint64_t v5 = [v2 unifiedContactsMatchingPredicate:v3 keysToFetch:v4 error:&v10];
  id v6 = v10;
  uint64_t v7 = *(void *)(v1[2] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;

  if (!*(void *)(*(void *)(v1[2] + 8) + 40))
  {
    id v9 = +[CalFoundationLogSubsystem contacts];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __68__CalContactsProvider_unifiedContactsMatchingPredicate_keysToFetch___block_invoke_cold_1();
    }
  }
}

- (id)unifiedContactWithName:(id)a3
{
  id v4 = a3;
  if ([(CalContactsProvider *)self contactAccessResolved])
  {
    uint64_t v5 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingName:v4];
    id v6 = [MEMORY[0x1E4F1B8F8] CalKeys];
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x3032000000;
    uint64_t v23 = __Block_byref_object_copy__5;
    v24 = __Block_byref_object_dispose__5;
    id v25 = 0;
    contactStoreWorkQueue = self->_contactStoreWorkQueue;
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __46__CalContactsProvider_unifiedContactWithName___block_invoke;
    id v15 = &unk_1E56CDE48;
    id v19 = &v20;
    uint64_t v16 = self;
    id v8 = v5;
    id v17 = v8;
    id v9 = v6;
    id v18 = v9;
    dispatch_sync(contactStoreWorkQueue, &v12);
    id v10 = objc_msgSend((id)v21[5], "firstObject", v12, v13, v14, v15, v16);

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void __46__CalContactsProvider_unifiedContactWithName___block_invoke(uint64_t a1)
{
  v1 = (void *)a1;
  id v2 = [*(id *)(a1 + 32) store];
  uint64_t v3 = v1[5];
  uint64_t v4 = v1[6];
  v1 += 5;
  id v10 = 0;
  uint64_t v5 = [v2 unifiedContactsMatchingPredicate:v3 keysToFetch:v4 error:&v10];
  id v6 = v10;
  uint64_t v7 = *(void *)(v1[2] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;

  if (!*(void *)(*(void *)(v1[2] + 8) + 40))
  {
    id v9 = +[CalFoundationLogSubsystem contacts];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __68__CalContactsProvider_unifiedContactsMatchingPredicate_keysToFetch___block_invoke_cold_1();
    }
  }
}

- (id)unifiedContactWithIdentifier:(id)a3 keysToFetch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    if ([(CalContactsProvider *)self contactAccessResolved])
    {
      uint64_t v16 = 0;
      id v17 = &v16;
      uint64_t v18 = 0x3032000000;
      id v19 = __Block_byref_object_copy__5;
      uint64_t v20 = __Block_byref_object_dispose__5;
      id v21 = 0;
      contactStoreWorkQueue = self->_contactStoreWorkQueue;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __64__CalContactsProvider_unifiedContactWithIdentifier_keysToFetch___block_invoke;
      v12[3] = &unk_1E56CDE48;
      id v15 = &v16;
      v12[4] = self;
      id v13 = v6;
      id v14 = v7;
      dispatch_sync(contactStoreWorkQueue, v12);
      id v9 = (id)v17[5];

      _Block_object_dispose(&v16, 8);
      goto LABEL_8;
    }
  }
  else
  {
    id v10 = +[CalFoundationLogSubsystem contacts];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CalContactsProvider unifiedContactWithIdentifier:keysToFetch:]();
    }
  }
  id v9 = 0;
LABEL_8:

  return v9;
}

void __64__CalContactsProvider_unifiedContactWithIdentifier_keysToFetch___block_invoke(uint64_t a1)
{
  v1 = (void *)a1;
  id v2 = [*(id *)(a1 + 32) store];
  uint64_t v3 = v1[5];
  uint64_t v4 = v1[6];
  v1 += 5;
  id v10 = 0;
  uint64_t v5 = [v2 unifiedContactWithIdentifier:v3 keysToFetch:v4 error:&v10];
  id v6 = v10;
  uint64_t v7 = *(void *)(v1[2] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;

  if (!*(void *)(*(void *)(v1[2] + 8) + 40))
  {
    id v9 = +[CalFoundationLogSubsystem contacts];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __64__CalContactsProvider_unifiedContactWithIdentifier_keysToFetch___block_invoke_cold_1();
    }
  }
}

- (id)unifiedContactWithIdentifier:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1B8F8];
  id v5 = a3;
  id v6 = [v4 CalKeys];
  uint64_t v7 = [(CalContactsProvider *)self unifiedContactWithIdentifier:v5 keysToFetch:v6];

  return v7;
}

- (id)unifiedContactMatchingString:(id)a3 keysToFetch:(id)a4 matchType:(int64_t *)a5
{
  id v7 = a3;
  uint64_t v8 = [(CalContactsProvider *)self unifiedContactWithEmailAddress:v7];
  if (v8)
  {
    id v9 = (void *)v8;
    if (!a5) {
      goto LABEL_9;
    }
    int64_t v10 = 2;
  }
  else
  {
    uint64_t v11 = [(CalContactsProvider *)self unifiedContactWithPhoneNumber:v7];
    if (v11)
    {
      id v9 = (void *)v11;
      if (!a5) {
        goto LABEL_9;
      }
      int64_t v10 = 3;
    }
    else
    {
      id v9 = [(CalContactsProvider *)self unifiedContactWithName:v7];
      int64_t v10 = v9 != 0;
      if (!a5) {
        goto LABEL_9;
      }
    }
  }
  *a5 = v10;
LABEL_9:

  return v9;
}

- (id)unifiedContactMatchingName:(id)a3 email:(id)a4 url:(id)a5 keysToFetch:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(CalContactsProvider *)self contactAccessResolved])
  {
    v51[0] = 0;
    v51[1] = v51;
    v51[2] = 0x3032000000;
    v51[3] = __Block_byref_object_copy__5;
    v51[4] = __Block_byref_object_dispose__5;
    id v52 = 0;
    id v14 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingEmailAddress:v11];
    uint64_t v45 = 0;
    v46 = &v45;
    uint64_t v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__5;
    v49 = __Block_byref_object_dispose__5;
    id v50 = 0;
    contactStoreWorkQueue = self->_contactStoreWorkQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__CalContactsProvider_unifiedContactMatchingName_email_url_keysToFetch___block_invoke;
    block[3] = &unk_1E56CDEC0;
    v43 = &v45;
    void block[4] = self;
    id v16 = v14;
    id v41 = v16;
    id v17 = v13;
    id v42 = v17;
    v44 = v51;
    dispatch_sync(contactStoreWorkQueue, block);
    uint64_t v18 = [(id)v46[5] count];
    id v19 = (void *)v46[5];
    if (v18)
    {
      uint64_t v20 = [v19 firstObject];
    }
    else
    {
      if (!v19)
      {
        id v21 = +[CalFoundationLogSubsystem contacts];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[CalContactsProvider unifiedContactMatchingName:email:url:keysToFetch:]();
        }
      }
      uint64_t v22 = [MEMORY[0x1E4F1B8F8] predicateForContactMatchingURLString:v12];

      uint64_t v23 = self->_contactStoreWorkQueue;
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __72__CalContactsProvider_unifiedContactMatchingName_email_url_keysToFetch___block_invoke_33;
      v35[3] = &unk_1E56CDEC0;
      v38 = &v45;
      v35[4] = self;
      id v16 = v22;
      id v36 = v16;
      id v24 = v17;
      id v37 = v24;
      v39 = v51;
      dispatch_sync(v23, v35);
      if ([(id)v46[5] count])
      {
        uint64_t v20 = [(id)v46[5] firstObject];
      }
      else
      {
        if (!v46[5])
        {
          id v25 = +[CalFoundationLogSubsystem contacts];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            -[CalContactsProvider unifiedContactMatchingName:email:url:keysToFetch:]();
          }
        }
        id v26 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingName:v10];

        v27 = self->_contactStoreWorkQueue;
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __72__CalContactsProvider_unifiedContactMatchingName_email_url_keysToFetch___block_invoke_34;
        v30[3] = &unk_1E56CDEC0;
        v33 = &v45;
        v30[4] = self;
        id v16 = v26;
        id v31 = v16;
        id v32 = v24;
        v34 = v51;
        dispatch_sync(v27, v30);
        if ([(id)v46[5] count])
        {
          uint64_t v20 = [(id)v46[5] firstObject];
        }
        else
        {
          if (!v46[5])
          {
            v28 = +[CalFoundationLogSubsystem contacts];
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
              -[CalContactsProvider unifiedContactMatchingName:email:url:keysToFetch:]();
            }
          }
          uint64_t v20 = 0;
        }
      }
    }

    _Block_object_dispose(&v45, 8);
    _Block_object_dispose(v51, 8);
  }
  else
  {
    uint64_t v20 = 0;
  }

  return v20;
}

void __72__CalContactsProvider_unifiedContactMatchingName_email_url_keysToFetch___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) store];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = [v2 unifiedContactsMatchingPredicate:v3 keysToFetch:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void __72__CalContactsProvider_unifiedContactMatchingName_email_url_keysToFetch___block_invoke_33(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) store];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = [v2 unifiedContactsMatchingPredicate:v3 keysToFetch:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void __72__CalContactsProvider_unifiedContactMatchingName_email_url_keysToFetch___block_invoke_34(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) store];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = [v2 unifiedContactsMatchingPredicate:v3 keysToFetch:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)contactsFromContactIdentifiers:(id)a3 withKeys:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F1B8F8] predicateForContactsWithIdentifiers:v5];
  uint64_t v8 = +[CalContactsProvider defaultProvider];
  id v9 = v8;
  id v24 = (void *)v7;
  if (v6)
  {
    id v10 = [v8 unifiedContactsMatchingPredicate:v7 keysToFetch:v6];
  }
  else
  {
    id v11 = [MEMORY[0x1E4F1B8F8] CalKeys];
    id v10 = [v9 unifiedContactsMatchingPredicate:v7 keysToFetch:v11];
  }
  id v12 = objc_opt_new();
  id v13 = [MEMORY[0x1E4F1CA48] arrayWithArray:v5];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v14 = v10;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v20 = [v19 identifier];
        [v12 setObject:v19 forKey:v20];

        id v21 = [v19 identifier];
        [v13 removeObject:v21];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v16);
  }

  if ([v13 count])
  {
    uint64_t v22 = +[CalFoundationLogSubsystem contacts];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[CalContactsProvider contactsFromContactIdentifiers:withKeys:]();
    }
  }

  return v12;
}

- (id)fullNameForFirstContactMatchingEmailAddress:(id)a3
{
  uint64_t v4 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingEmailAddress:a3];
  id v5 = [(CalContactsProvider *)self _fullNameForFirstContactMatchingPredicate:v4];

  return v5;
}

- (id)fullNameForFirstContactMatchingPhoneNumber:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F1BA70];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithStringValue:v5];

  uint64_t v7 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingPhoneNumber:v6];
  uint64_t v8 = [(CalContactsProvider *)self _fullNameForFirstContactMatchingPredicate:v7];

  return v8;
}

- (id)_fullNameForFirstContactMatchingPredicate:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)MEMORY[0x1E4F1B910];
  id v5 = a3;
  id v6 = [v4 descriptorForRequiredKeysForStyle:0];
  v12[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  uint64_t v8 = [(CalContactsProvider *)self unifiedContactsMatchingPredicate:v5 keysToFetch:v7];

  if (v8)
  {
    id v9 = [v8 firstObject];
    id v10 = [MEMORY[0x1E4F1B910] stringFromContact:v9 style:0];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)contactIdentifierIsMe:(id)a3
{
  id v4 = a3;
  id v5 = [(CalContactsProvider *)self meContact];
  id v6 = [v5 identifier];
  char v7 = [v6 isEqualToString:v4];

  return v7;
}

- (id)myShortDisplayName
{
  uint64_t v3 = [(CalContactsProvider *)self meContact];
  id v4 = [v3 givenName];

  if (![v4 length])
  {
    id v5 = [(CalContactsProvider *)self meContact];
    uint64_t v6 = [v5 nickname];

    id v4 = (void *)v6;
  }

  return v4;
}

- (id)myNameWithStyle:(int64_t)a3
{
  id v5 = [(CalContactsProvider *)self meContact];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1B910];
    char v7 = [(CalContactsProvider *)self meContact];
    uint64_t v8 = [v6 stringFromContact:v7 style:a3];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)myFullName
{
  return [(CalContactsProvider *)self myNameWithStyle:0];
}

- (id)myHomeAddress
{
  return [(CalContactsProvider *)self myAddressForLabel:*MEMORY[0x1E4F1B6F8]];
}

- (id)myWorkAddress
{
  return [(CalContactsProvider *)self myAddressForLabel:*MEMORY[0x1E4F1B770]];
}

- (id)myAddressForLabel:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CalContactsProvider *)self meContact];
  uint64_t v6 = [v5 postalAddresses];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v6;
  uint64_t v8 = (void *)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "label", (void)v15);
        char v13 = [v12 isEqualToString:v4];

        if (v13)
        {
          uint64_t v8 = [v11 value];
          goto LABEL_11;
        }
      }
      uint64_t v8 = (void *)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (id)myEmailAddress
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(CalContactsProvider *)v2 unitTestEmails];

  if (v3)
  {
    id v4 = [(CalContactsProvider *)v2 unitTestEmails];
    id v5 = [v4 firstObject];

    objc_sync_exit(v2);
  }
  else
  {
    objc_sync_exit(v2);

    uint64_t v6 = [(CalContactsProvider *)v2 meContact];
    id v7 = [v6 emailAddresses];
    id v2 = [v7 firstObject];

    id v5 = [(CalContactsProvider *)v2 value];
  }

  return v5;
}

- (id)cachedEmailAddressArray
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(CalContactsProvider *)v2 unitTestEmails];

  if (v3)
  {
    uint64_t v4 = [(CalContactsProvider *)v2 unitTestEmails];
LABEL_5:
    uint64_t v6 = (void *)v4;
    goto LABEL_6;
  }
  id v5 = [(CalContactsProvider *)v2 loadedMyEmailAddresses];

  if (v5)
  {
    uint64_t v4 = [(CalContactsProvider *)v2 loadedMyEmailAddresses];
    goto LABEL_5;
  }
  uint64_t v8 = [(CalContactsProvider *)v2 meContact];
  uint64_t v9 = [v8 CalEmailAddresses];

  if (!v9) {
    uint64_t v9 = objc_opt_new();
  }
  [(CalContactsProvider *)v2 setLoadedMyEmailAddresses:v9];
  uint64_t v6 = [(CalContactsProvider *)v2 loadedMyEmailAddresses];

LABEL_6:
  objc_sync_exit(v2);

  return v6;
}

- (id)cachedEmailAddress
{
  id v2 = [(CalContactsProvider *)self cachedEmailAddressArray];
  uint64_t v3 = [v2 firstObject];

  return v3;
}

- (id)myEmailAddresses
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(CalContactsProvider *)v2 unitTestEmails];

  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
    id v5 = [(CalContactsProvider *)v2 unitTestEmails];
    uint64_t v6 = [v4 setWithArray:v5];

    objc_sync_exit(v2);
  }
  else
  {
    objc_sync_exit(v2);

    id v7 = [(CalContactsProvider *)v2 meContact];
    id v2 = [v7 CalEmailAddresses];

    if (v2)
    {
      uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v2];
    }
    else
    {
      uint64_t v8 = objc_opt_new();
    }
    uint64_t v6 = (void *)v8;
  }

  return v6;
}

- (id)cachedEmailAddresses
{
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = [(CalContactsProvider *)self cachedEmailAddressArray];
  uint64_t v4 = [v2 setWithArray:v3];

  return v4;
}

- (BOOL)matchesOneOfMyEmails:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(CalContactsProvider *)self cachedEmailAddresses];
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __44__CalContactsProvider_matchesOneOfMyEmails___block_invoke;
    v8[3] = &unk_1E56CDEE8;
    id v9 = v4;
    id v10 = &v11;
    [v5 enumerateObjectsUsingBlock:v8];
    BOOL v6 = *((unsigned char *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

uint64_t __44__CalContactsProvider_matchesOneOfMyEmails___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) caseInsensitiveCompare:a2];
  if (!result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (BOOL)urlMatchesOneOfMyEmails:(id)a3
{
  id v4 = [a3 absoluteString];
  id v5 = [v4 stringRemovingMailto];

  LOBYTE(self) = [(CalContactsProvider *)self matchesOneOfMyEmails:v5];
  return (char)self;
}

- (id)myPhoneNumbers
{
  id v2 = [(CalContactsProvider *)self meContact];
  uint64_t v3 = [v2 CalPhoneNumbers];

  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CAD0] setWithArray:v3];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  id v5 = (void *)v4;

  return v5;
}

- (BOOL)matchesOneOfMyPhoneNumbers:(id)a3
{
  id v4 = a3;
  id v5 = [(CalContactsProvider *)self myPhoneNumbers];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__CalContactsProvider_matchesOneOfMyPhoneNumbers___block_invoke;
  v9[3] = &unk_1E56CDEE8;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];
  char v7 = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __50__CalContactsProvider_matchesOneOfMyPhoneNumbers___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) caseInsensitiveCompare:a2];
  if (!result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

+ (id)reputationForHandle:(id)a3 inStore:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v7 = v6;
  if (!v5)
  {
    uint64_t v11 = +[CalFoundationLogSubsystem junk];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[CalContactsProvider reputationForHandle:inStore:]();
    }
    uint64_t v8 = 0;
    id v9 = 0;
    goto LABEL_10;
  }
  id v13 = 0;
  uint64_t v8 = [v6 reputationForHandle:v5 timeout:&v13 error:0.2];
  id v9 = v13;
  id v10 = +[CalFoundationLogSubsystem junk];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    +[CalContactsProvider reputationForHandle:inStore:]((uint64_t)v5, v8, v10);
  }

  if (v9)
  {
    uint64_t v11 = +[CalFoundationLogSubsystem junk];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[CalContactsProvider reputationForHandle:inStore:]();
    }
LABEL_10:
  }

  return v8;
}

+ (BOOL)shouldPermitOrganizerEmailFromJunkChecks:(id)a3 inReputationStore:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1BA98];
  id v7 = a4;
  uint64_t v8 = [v6 handleWithEmailAddress:a3];
  id v9 = [a1 reputationForHandle:v8 inStore:v7];

  BOOL v10 = v9 && [v9 score] == 1;
  return v10;
}

+ (BOOL)shouldPermitOrganizerPhoneNumberFromJunkChecks:(id)a3 inReputationStore:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1BA98];
  id v7 = a4;
  uint64_t v8 = [v6 handleWithPhoneNumber:a3];
  id v9 = [a1 reputationForHandle:v8 inStore:v7];

  BOOL v10 = v9 && [v9 score] == 1;
  return v10;
}

- (BOOL)shouldPermitOrganizerEmailFromJunkChecks:(id)a3
{
  id v4 = a3;
  id v5 = [(CalContactsProvider *)self reputationStore];
  LOBYTE(self) = [(id)objc_opt_class() shouldPermitOrganizerEmailFromJunkChecks:v4 inReputationStore:v5];

  return (char)self;
}

- (BOOL)shouldPermitOrganizerPhoneNumberFromJunkChecks:(id)a3
{
  id v4 = a3;
  id v5 = [(CalContactsProvider *)self reputationStore];
  LOBYTE(self) = [(id)objc_opt_class() shouldPermitOrganizerPhoneNumberFromJunkChecks:v4 inReputationStore:v5];

  return (char)self;
}

+ (BOOL)birthdayIsYearless:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  id v5 = [v3 CalYearlessDateThreshold];
  char v6 = [v4 CalIsBeforeDate:v5];

  return v6;
}

+ (BOOL)isCalendarIslamic:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:*MEMORY[0x1E4F1C338]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F1C340]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F1C348]] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:*MEMORY[0x1E4F1C350]];
  }

  return v4;
}

+ (id)birthdayStringForContactName:(id)a3 eventDate:(id)a4 birthDate:(id)a5 lunarCalendar:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  if (!v11)
  {
    long long v27 = 0;
    goto LABEL_24;
  }
  if (!v10) {
    goto LABEL_15;
  }
  uint64_t v14 = [MEMORY[0x1E4F1C9A8] CalYearlessDateThreshold];
  char v15 = [v11 isBeforeDate:v14];

  if (v15) {
    goto LABEL_15;
  }
  if (v12) {
    id v16 = v12;
  }
  else {
    id v16 = (id)*MEMORY[0x1E4F1C318];
  }
  long long v17 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:v16];
  long long v18 = [v10 dateByAddingDays:7 inCalendar:v17];
  id v19 = [v17 components:4 fromDate:v11 toDate:v18 options:0];
  uint64_t v20 = [v19 year];

  if (v20 <= 0)
  {

LABEL_15:
    if ([v12 isEqualToString:*MEMORY[0x1E4F1C2F0]])
    {
      long long v28 = NSString;
      v29 = @"%@’s Chinese Birthday";
    }
    else if ([v12 isEqualToString:*MEMORY[0x1E4F1C320]])
    {
      long long v28 = NSString;
      v29 = @"%@’s Hebrew Birthday";
    }
    else
    {
      BOOL v30 = +[CalContactsProvider isCalendarIslamic:v12];
      long long v28 = NSString;
      if (v30) {
        v29 = @"%@’s Islamic Birthday";
      }
      else {
        v29 = @"%@’s Birthday";
      }
    }
    long long v17 = [v13 localizedStringForKey:v29 value:&stru_1EE0C39E0 table:0];
    long long v27 = objc_msgSend(v28, "localizedStringWithFormat:", v17, v9);
    goto LABEL_23;
  }
  id v37 = v18;
  v38 = [v13 localizedStringForKey:@"1: ordinal | 0: cardinal" value:@"1" table:0];
  if ([v38 isEqualToString:@"1"]) {
    uint64_t v21 = 6;
  }
  else {
    uint64_t v21 = 1;
  }
  uint64_t v22 = (void *)MEMORY[0x1E4F28EE0];
  uint64_t v23 = [NSNumber numberWithLong:v20];
  id v24 = [v22 localizedStringFromNumber:v23 numberStyle:v21];

  if ([v12 isEqualToString:*MEMORY[0x1E4F1C2F0]])
  {
    long long v25 = NSString;
    long long v26 = @"birthday_chinese_count";
  }
  else
  {
    if (![v12 isEqualToString:*MEMORY[0x1E4F1C320]])
    {
      BOOL v34 = +[CalContactsProvider isCalendarIslamic:v12];
      id v36 = NSString;
      v33 = v37;
      if (v34) {
        v35 = @"birthday_islamic_count";
      }
      else {
        v35 = @"birthday_count";
      }
      id v32 = [v13 localizedStringForKey:v35 value:&stru_1EE0C39E0 table:0];
      long long v27 = objc_msgSend(v36, "localizedStringWithFormat:", v32, v20, v9, v24);
      goto LABEL_34;
    }
    long long v25 = NSString;
    long long v26 = @"birthday_hebrew_count";
  }
  id v32 = [v13 localizedStringForKey:v26 value:&stru_1EE0C39E0 table:0];
  long long v27 = objc_msgSend(v25, "localizedStringWithFormat:", v32, v20, v9, v24);
  v33 = v37;
LABEL_34:

LABEL_23:
LABEL_24:

  return v27;
}

- (CNContactStore)store
{
  return (CNContactStore *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStore:(id)a3
{
}

- (CNReputationStore)reputationStore
{
  return (CNReputationStore *)objc_getProperty(self, a2, 24, 1);
}

- (void)setReputationStore:(id)a3
{
}

- (OS_dispatch_queue)syncQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSyncQueue:(id)a3
{
}

- (OS_dispatch_queue)contactStoreWorkQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setContactStoreWorkQueue:(id)a3
{
}

- (NSString)testMeContactIdentifer
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTestMeContactIdentifer:(id)a3
{
}

- (NSMutableSet)delegates
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDelegates:(id)a3
{
}

- (NSArray)unitTestEmails
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setUnitTestEmails:(id)a3
{
}

- (NSArray)loadedMyEmailAddresses
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLoadedMyEmailAddresses:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedMyEmailAddresses, 0);
  objc_storeStrong((id *)&self->_unitTestEmails, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_testMeContactIdentifer, 0);
  objc_storeStrong((id *)&self->_contactStoreWorkQueue, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_reputationStore, 0);
  objc_storeStrong((id *)&self->_store, 0);

  objc_storeStrong((id *)&self->_meContact, 0);
}

void __27__CalContactsProvider_init__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_1(&dword_190D88000, v0, v1, "Timed out requesting access to contacts", v2, v3, v4, v5, v6);
}

void __27__CalContactsProvider_init__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_190D88000, v0, v1, "Failed to access contacts with error %@", v2, v3, v4, v5, v6);
}

- (void)contactAccessResolved
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"_Bool soft_MGGetBoolAnswer(CFStringRef)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CalContactsProvider.m", 39, @"%s", dlerror());

  __break(1u);
}

void __35__CalContactsProvider__meWithKeys___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_190D88000, v0, v1, "Failed to fetch me contact with error %@", v2, v3, v4, v5, v6);
}

- (void)unifiedContactsMatchingPredicate:keysToFetch:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_1(&dword_190D88000, v0, v1, "Attempted to fetch nil predicate", v2, v3, v4, v5, v6);
}

void __68__CalContactsProvider_unifiedContactsMatchingPredicate_keysToFetch___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1_1(&dword_190D88000, v0, v1, "Error while fetching contact for predicate %@ [%@]");
}

void __67__CalContactsProvider_unifiedContactsForHandleStrings_keysToFetch___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_190D88000, v0, v1, "Error while fetching contact for predicate %@ [%@]");
}

void __77__CalContactsProvider_unifiedContactsDictionaryForHandleStrings_keysToFetch___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_190D88000, v0, v1, "Error while fetching contact for fetchRequest %@ [%@]");
}

- (void)unifiedContactWithIdentifier:keysToFetch:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_1(&dword_190D88000, v0, v1, "Attempted to fetch nil identifier", v2, v3, v4, v5, v6);
}

void __64__CalContactsProvider_unifiedContactWithIdentifier_keysToFetch___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1_1(&dword_190D88000, v0, v1, "Error while fetching contact for identifier %@ [%@]");
}

- (void)unifiedContactMatchingName:email:url:keysToFetch:.cold.1()
{
  OUTLINED_FUNCTION_9_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_190D88000, v0, v1, "Error while fetching contact for predicate %@ [%@]");
}

- (void)contactsFromContactIdentifiers:withKeys:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_190D88000, v0, v1, "Contact Identifiers where no contact was found %@ ", v2, v3, v4, v5, v6);
}

+ (void)reputationForHandle:inStore:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_1(&dword_190D88000, v0, v1, "Reputation handle was nil in the should white list organizer junk checks.", v2, v3, v4, v5, v6);
}

+ (void)reputationForHandle:inStore:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_190D88000, v0, v1, "There was an error trying to get the reputation handle [%@]", v2, v3, v4, v5, v6);
}

+ (void)reputationForHandle:(NSObject *)a3 inStore:.cold.3(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2048;
  uint64_t v7 = [a2 score];
  _os_log_debug_impl(&dword_190D88000, a3, OS_LOG_TYPE_DEBUG, "The reputation result returned for [%@] had the score [%ld] (0==neutral, 1==good, 2==bad)", (uint8_t *)&v4, 0x16u);
}

@end