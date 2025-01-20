@interface ATXHeuristicDevice
+ (MTAlarmManager)sharedAlarmManager;
- (ATXHeuristicDevice)initWithLocationManager:(id)a3;
- (ATXLocationManager)locationManager;
- (EKEventStore)eventStore;
- (NSDate)now;
- (id)_calendarVisibilityManager;
- (id)_contactForPredicate:(id)a3;
- (id)_contactKeysToFetch;
- (id)_dictContactForIdentifier:(id)a3;
- (id)_dictContactForParticipant:(id)a3 contactCache:(id)a4;
- (id)_dictForAttachment:(id)a3;
- (id)_dictForEvent:(id)a3 contactCache:(id)a4;
- (id)_unwrap:(id)a3;
- (id)_wrap:(id)a3;
- (id)contactForParticipant:(id)a3;
- (id)contactStore;
- (id)contactsForPredicate:(id)a3;
- (id)dictContactForCNContact:(id)a3;
- (id)dictForEvent:(id)a3;
- (id)dictForEvent:(id)a3 contactCache:(id)a4;
- (id)meContact;
- (id)organizerContactWithEvent:(id)a3;
- (id)resolveContact:(id)a3;
- (id)visibleCalendarsInCurrentFocus;
- (id)visibleCalendarsRegardlessOfFocus;
- (id)wrap:(id)a3;
- (void)accessFavoriteContacts:(id)a3;
- (void)dealloc;
- (void)meContact;
- (void)setNow:(id)a3;
- (void)updateMeContact;
@end

@implementation ATXHeuristicDevice

- (ATXHeuristicDevice)initWithLocationManager:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXHeuristicDevice;
  v6 = [(ATXHeuristicDevice *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_locationManager, a3);
    uint64_t v8 = objc_opt_new();
    cachedCalendarDicts = v7->_cachedCalendarDicts;
    v7->_cachedCalendarDicts = (NSMutableDictionary *)v8;
  }
  return v7;
}

uint64_t __52__ATXHeuristicDevice_visibleCalendarsInCurrentFocus__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 calendarIdentifier];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    v7 = [v3 calendarIdentifier];
    uint64_t v8 = [v6 containsObject:v7] ^ 1;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)setNow:(id)a3
{
  self->_now = (NSDate *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (NSDate)now
{
  now = self->_now;
  if (!now)
  {
    v4 = (NSDate *)objc_opt_new();
    uint64_t v5 = self->_now;
    self->_now = v4;

    now = self->_now;
  }

  return now;
}

- (id)visibleCalendarsRegardlessOfFocus
{
  v2 = [(ATXHeuristicDevice *)self _calendarVisibilityManager];
  id v3 = [v2 visibleCalendars];

  return v3;
}

- (id)visibleCalendarsInCurrentFocus
{
  id v3 = [MEMORY[0x1E4F254E8] unselectedCalendarIdentifiersForFocusMode];
  v4 = [(ATXHeuristicDevice *)self visibleCalendarsRegardlessOfFocus];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__ATXHeuristicDevice_visibleCalendarsInCurrentFocus__block_invoke;
  v8[3] = &unk_1E68A4CD8;
  id v9 = v3;
  id v5 = v3;
  v6 = objc_msgSend(v4, "_pas_filteredArrayWithTest:", v8);

  return v6;
}

- (EKEventStore)eventStore
{
  v2 = self;
  objc_sync_enter(v2);
  eventStore = v2->_eventStore;
  if (!eventStore)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F25550]) initWithEKOptions:128];
    id v5 = v2->_eventStore;
    v2->_eventStore = (EKEventStore *)v4;

    eventStore = v2->_eventStore;
  }
  v6 = eventStore;
  objc_sync_exit(v2);

  return v6;
}

- (id)_calendarVisibilityManager
{
  if (_calendarVisibilityManager_onceToken != -1) {
    dispatch_once(&_calendarVisibilityManager_onceToken, &__block_literal_global_0);
  }
  id v3 = objc_alloc(MEMORY[0x1E4F254E8]);
  uint64_t v4 = [(ATXHeuristicDevice *)self eventStore];
  id v5 = (void *)[v3 initWithEventStore:v4 limitedToSource:0 visibilityChangedCallback:0 queue:0];

  return v5;
}

- (void)dealloc
{
  v2 = self;
  uint64_t v3 = objc_sync_enter(v2);
  uint64_t v4 = (void *)MEMORY[0x1D25F43D0](v3);
  favoriteContactsLazy = v2->_favoriteContactsLazy;
  v2->_favoriteContactsLazy = 0;

  objc_sync_exit(v2);

  v6.receiver = v2;
  v6.super_class = (Class)ATXHeuristicDevice;
  [(ATXHeuristicDevice *)&v6 dealloc];
}

void __48__ATXHeuristicDevice__calendarVisibilityManager__block_invoke()
{
  id v2 = [MEMORY[0x1E4F254E8] visibilityChangedNotificationName];
  v0 = (const char *)[v2 UTF8String];
  v1 = dispatch_get_global_queue(25, 0);
  notify_register_dispatch(v0, (int *)&_calendarVisibilityManager_calendarVisibilityToken, v1, &__block_literal_global_20);
}

void __48__ATXHeuristicDevice__calendarVisibilityManager__block_invoke_2()
{
  v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:*MEMORY[0x1E4F25460] object:0];

  v1 = __atxlog_handle_default();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl(&dword_1D0F43000, v1, OS_LOG_TYPE_DEFAULT, "Reposting EKEventStoreChangedNotification because calendar visibility has changed", v2, 2u);
  }
}

+ (MTAlarmManager)sharedAlarmManager
{
  if (sharedAlarmManager_onceToken != -1) {
    dispatch_once(&sharedAlarmManager_onceToken, &__block_literal_global_24);
  }
  id v2 = (void *)sharedAlarmManager_alarmManager;

  return (MTAlarmManager *)v2;
}

uint64_t __40__ATXHeuristicDevice_sharedAlarmManager__block_invoke()
{
  sharedAlarmManager_alarmManager = (uint64_t)objc_alloc_init(MEMORY[0x1E4F78B50]);

  return MEMORY[0x1F41817F8]();
}

- (id)meContact
{
  if (!self->_meContactChecked)
  {
    self->_meContactChecked = 1;
    uint64_t v3 = [(ATXHeuristicDevice *)self contactStore];
    uint64_t v4 = [(ATXHeuristicDevice *)self _contactKeysToFetch];
    id v11 = 0;
    id v5 = [v3 _crossPlatformUnifiedMeContactWithKeysToFetch:v4 error:&v11];
    id v6 = v11;
    meContactLazy = self->_meContactLazy;
    self->_meContactLazy = v5;

    if (v6)
    {
      uint64_t v8 = __atxlog_handle_heuristic();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        [(ATXHeuristicDevice *)(uint64_t)v6 meContact];
      }
    }
  }
  id v9 = self->_meContactLazy;

  return v9;
}

- (void)updateMeContact
{
  self->_meContactChecked = 0;
  id v2 = [(ATXHeuristicDevice *)self meContact];
}

- (id)contactStore
{
  id v2 = self;
  objc_sync_enter(v2);
  contactStoreLazy = v2->_contactStoreLazy;
  if (!contactStoreLazy)
  {
    uint64_t v4 = objc_opt_new();
    id v5 = v2->_contactStoreLazy;
    v2->_contactStoreLazy = (CNContactStore *)v4;

    contactStoreLazy = v2->_contactStoreLazy;
  }
  id v6 = contactStoreLazy;
  objc_sync_exit(v2);

  return v6;
}

- (void)accessFavoriteContacts:(id)a3
{
  id v11 = (void (**)(id, CNFavorites *))a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  id v5 = v11;
  favoriteContactsLazy = v4->_favoriteContactsLazy;
  if (!favoriteContactsLazy)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1B9E8]);
    uint64_t v8 = [(ATXHeuristicDevice *)v4 contactStore];
    uint64_t v9 = [v7 initWithContactStore:v8];
    v10 = v4->_favoriteContactsLazy;
    v4->_favoriteContactsLazy = (CNFavorites *)v9;

    favoriteContactsLazy = v4->_favoriteContactsLazy;
    id v5 = v11;
  }
  v5[2](v5, favoriteContactsLazy);
  objc_sync_exit(v4);
}

- (id)_contactKeysToFetch
{
  v8[5] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1B910], "descriptorForRequiredKeysForStyle:", 1000, v2);
  uint64_t v4 = *MEMORY[0x1E4F1AEE0];
  v8[1] = v3;
  v8[2] = v4;
  uint64_t v5 = *MEMORY[0x1E4F1ADC8];
  v8[3] = *MEMORY[0x1E4F1AE60];
  void v8[4] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:5];

  return v6;
}

- (id)contactsForPredicate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ATXHeuristicDevice *)self contactStore];
  id v6 = [(ATXHeuristicDevice *)self _contactKeysToFetch];
  id v12 = 0;
  id v7 = [v5 unifiedContactsMatchingPredicate:v4 keysToFetch:v6 error:&v12];
  id v8 = v12;

  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    v10 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ATXHeuristicDevice contactsForPredicate:]();
    }

    id v9 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

- (id)resolveContact:(id)a3
{
  v18[4] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F1B910];
  id v5 = a3;
  id v6 = [v4 descriptorForRequiredKeysForStyle:0];
  uint64_t v7 = *MEMORY[0x1E4F1AFA8];
  v18[0] = v6;
  v18[1] = v7;
  uint64_t v8 = *MEMORY[0x1E4F1ADC8];
  v18[2] = *MEMORY[0x1E4F1AEE0];
  v18[3] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:4];

  id v10 = objc_alloc(MEMORY[0x1E4F89C68]);
  id v11 = [(ATXHeuristicDevice *)self contactStore];
  id v12 = (void *)[v10 initWithContactStore:v11 keysToFetch:v9];

  v13 = [v12 contactWithIdentifier:v5];

  if ([v13 contactType])
  {
    v14 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1D0F43000, v14, OS_LOG_TYPE_DEFAULT, "ATXOngoingCall: Contact found is not a CNContactTypePerson", v17, 2u);
    }

    id v15 = 0;
  }
  else
  {
    id v15 = v13;
  }

  return v15;
}

- (id)organizerContactWithEvent:(id)a3
{
  id v4 = [a3 organizer];
  id v5 = [(ATXHeuristicDevice *)self contactForParticipant:v4];

  return v5;
}

- (id)contactForParticipant:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F1B910];
  id v5 = a3;
  id v6 = [v4 descriptorForRequiredKeysForStyle:0];
  uint64_t v7 = [v5 contactPredicate];

  uint64_t v8 = [(ATXHeuristicDevice *)self contactStore];
  v21[0] = v6;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  id v16 = 0;
  id v10 = [v8 unifiedContactsMatchingPredicate:v7 keysToFetch:v9 error:&v16];
  id v11 = v16;

  if (v11)
  {
    id v12 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ATXHeuristicDevice contactsForPredicate:]();
    }
LABEL_10:

    id v12 = 0;
    goto LABEL_11;
  }
  id v12 = [v10 firstObject];
  v13 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v18 = v10;
    __int16 v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_1D0F43000, v13, OS_LOG_TYPE_DEFAULT, "contacts: %@ found with predicate:%@", buf, 0x16u);
  }

  if ([v12 contactType])
  {
    v14 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0F43000, v14, OS_LOG_TYPE_DEFAULT, "Contact found is not a CNContactTypePerson", buf, 2u);
    }

    goto LABEL_10;
  }
LABEL_11:

  return v12;
}

- (id)_contactForPredicate:(id)a3
{
  uint64_t v3 = [(ATXHeuristicDevice *)self contactsForPredicate:a3];
  id v4 = [v3 firstObject];

  return v4;
}

- (id)dictContactForCNContact:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  [v5 setObject:v4 forKeyedSubscript:@"CNContact"];
  id v6 = [v4 identifier];
  [v5 setObject:v6 forKeyedSubscript:@"identifier"];

  uint64_t v7 = NSNumber;
  uint64_t v8 = [v4 identifier];
  id v9 = [(ATXHeuristicDevice *)self meContact];
  id v10 = [v9 identifier];
  id v11 = objc_msgSend(v7, "numberWithBool:", objc_msgSend(v8, "isEqualToString:", v10));
  [v5 setObject:v11 forKeyedSubscript:@"isMeContact"];

  id v12 = [MEMORY[0x1E4F1B910] stringFromContact:v4 style:1000];
  [v5 setObject:v12 forKeyedSubscript:@"displayName"];

  v13 = [MEMORY[0x1E4F1B910] stringFromContact:v4 style:0];
  [v5 setObject:v13 forKeyedSubscript:@"fullName"];

  v14 = [v4 givenName];
  [v5 setObject:v14 forKeyedSubscript:@"givenName"];

  id v15 = [v4 familyName];
  [v5 setObject:v15 forKeyedSubscript:@"familyName"];

  id v16 = [v4 emailAddresses];
  uint64_t v17 = [v16 count];

  if (v17)
  {
    v18 = objc_opt_new();
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    __int16 v19 = objc_msgSend(v4, "emailAddresses", 0);
    uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v27 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = [*(id *)(*((void *)&v26 + 1) + 8 * i) value];
          [v18 addObject:v24];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v21);
    }

    [v5 setObject:v18 forKeyedSubscript:@"emailAddresses"];
  }

  return v5;
}

- (id)_dictContactForIdentifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F1B8F8];
  id v12 = a3;
  id v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a3;
  uint64_t v7 = [v5 arrayWithObjects:&v12 count:1];
  uint64_t v8 = objc_msgSend(v4, "predicateForContactsWithIdentifiers:", v7, v12, v13);

  id v9 = [(ATXHeuristicDevice *)self _contactForPredicate:v8];

  if (v9)
  {
    id v10 = [(ATXHeuristicDevice *)self dictContactForCNContact:v9];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)_dictContactForParticipant:(id)a3 contactCache:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 URL];
  id v9 = [v7 objectForKey:v8];
  id v10 = (void *)[v9 mutableCopy];

  if (v10)
  {
    id v11 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[ATXHeuristicDevice _dictContactForParticipant:contactCache:](v10, (uint64_t)v8, v11);
    }
    goto LABEL_8;
  }
  id v12 = [v6 contactPredicate];
  id v11 = [(ATXHeuristicDevice *)self _contactForPredicate:v12];

  uint64_t v13 = [(ATXHeuristicDevice *)self dictContactForCNContact:v11];
  id v10 = (void *)[v13 mutableCopy];

  v14 = [v10 objectForKeyedSubscript:@"displayName"];

  if (!v14)
  {
    id v15 = [v6 name];
    [v10 setObject:v15 forKeyedSubscript:@"displayName"];
  }
  id v16 = [v10 objectForKeyedSubscript:@"displayName"];

  if (v16)
  {
    uint64_t v17 = (void *)[v10 copy];
    [v7 setObject:v17 forKey:v8];

LABEL_8:
    unint64_t v18 = [v6 participantRole];
    if (v18 > 4) {
      __int16 v19 = 0;
    }
    else {
      __int16 v19 = off_1E68A4D20[v18];
    }
    [v10 setObject:v19 forKeyedSubscript:@"role"];
    unint64_t v20 = [v6 participantType];
    if (v20 > 4) {
      uint64_t v21 = 0;
    }
    else {
      uint64_t v21 = off_1E68A4D48[v20];
    }
    [v10 setObject:v21 forKeyedSubscript:@"type"];
    unint64_t v22 = [v6 participantStatus];
    if (v22 > 7) {
      v23 = 0;
    }
    else {
      v23 = off_1E68A4D70[v22];
    }
    [v10 setObject:v23 forKeyedSubscript:@"status"];
    v24 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "isCurrentUser"));
    [v10 setObject:v24 forKeyedSubscript:@"isCurrentUser"];

    v25 = [(ATXHeuristicDevice *)self wrap:v6];
    [v10 setObject:v25 forKeyedSubscript:@"EKParticipant"];

    if ([v10 count]) {
      long long v26 = v10;
    }
    else {
      long long v26 = 0;
    }
    id v27 = v26;
    goto LABEL_21;
  }

  id v27 = 0;
LABEL_21:

  return v27;
}

- (id)_dictForAttachment:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [v4 URL];
  [v5 setObject:v6 forKeyedSubscript:@"URL"];

  id v7 = [v4 fileName];
  [v5 setObject:v7 forKeyedSubscript:@"fileName"];

  uint64_t v8 = [v4 fileSize];
  [v5 setObject:v8 forKeyedSubscript:@"fileSize"];

  id v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isBinary"));
  [v5 setObject:v9 forKeyedSubscript:@"isBinary"];

  id v10 = [v4 fileFormat];
  [v5 setObject:v10 forKeyedSubscript:@"fileFormat"];

  id v11 = [(ATXHeuristicDevice *)self wrap:v4];

  [v5 setObject:v11 forKeyedSubscript:@"EKAttachment"];

  return v5;
}

- (id)dictForEvent:(id)a3
{
  return [(ATXHeuristicDevice *)self dictForEvent:a3 contactCache:0];
}

- (id)dictForEvent:(id)a3 contactCache:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  id v9 = [v6 uniqueId];
  id v10 = (void *)[v9 copy];

  if (v10)
  {
    id v11 = [(NSMutableDictionary *)v8->_cachedCalendarDicts objectForKeyedSubscript:v10];
    if (v11)
    {
      id v12 = __atxlog_handle_heuristic();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[ATXHeuristicDevice dictForEvent:contactCache:]();
      }

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v13 = 0;
      }
      else {
        id v13 = v11;
      }
    }
    else
    {
      id v15 = __atxlog_handle_heuristic();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[ATXHeuristicDevice dictForEvent:contactCache:]();
      }

      id v13 = [(ATXHeuristicDevice *)v8 _dictForEvent:v6 contactCache:v7];
      if (v13)
      {
        [(NSMutableDictionary *)v8->_cachedCalendarDicts setObject:v13 forKeyedSubscript:v10];
        id v16 = v13;
      }
      else
      {
        uint64_t v17 = objc_opt_new();
        [(NSMutableDictionary *)v8->_cachedCalendarDicts setObject:v17 forKeyedSubscript:v10];
      }
    }
  }
  else
  {
    v14 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[ATXHeuristicDevice dictForEvent:contactCache:](v14);
    }

    id v13 = [(ATXHeuristicDevice *)v8 _dictForEvent:v6 contactCache:v7];
  }

  objc_sync_exit(v8);

  return v13;
}

- (id)_dictForEvent:(id)a3 contactCache:(id)a4
{
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1D25F43D0]();
  if ([v6 junkStatus] == 1 || objc_msgSend(v6, "junkStatus") == 3)
  {
    id v9 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v6 junkStatus];
      id v11 = [v6 eventIdentifier];
      *(_DWORD *)buf = 134218242;
      uint64_t v127 = v10;
      __int16 v128 = 2112;
      v129 = v11;
      _os_log_impl(&dword_1D0F43000, v9, OS_LOG_TYPE_DEFAULT, "Ignore event: junkStatus [%lu], id %@", buf, 0x16u);
    }
LABEL_5:
    id v12 = 0;
    goto LABEL_6;
  }
  if ([v6 status] == 3)
  {
    id v9 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [v6 eventIdentifier];
      *(_DWORD *)buf = 138412290;
      uint64_t v127 = (uint64_t)v14;
      _os_log_impl(&dword_1D0F43000, v9, OS_LOG_TYPE_DEFAULT, "Ignore event: Cancelled, id %@", buf, 0xCu);
    }
    goto LABEL_5;
  }
  v109 = v8;
  v108 = objc_opt_new();
  uint64_t v15 = [v6 organizer];
  id v16 = objc_opt_new();
  v121[0] = MEMORY[0x1E4F143A8];
  v121[1] = 3221225472;
  v121[2] = __49__ATXHeuristicDevice__dictForEvent_contactCache___block_invoke;
  v121[3] = &unk_1E68A4D00;
  v121[4] = self;
  id v110 = v7;
  id v122 = v7;
  id v111 = v16;
  id v123 = v111;
  uint64_t v17 = (void (**)(void, void))MEMORY[0x1D25F45D0](v121);
  v107 = (void *)v15;
  v17[2](v17, v15);
  unint64_t v18 = [v6 attendees];
  v112 = v6;
  __int16 v19 = [v6 attendees];
  unint64_t v20 = [v19 count];

  if (v20 >= 5) {
    uint64_t v21 = 5;
  }
  else {
    uint64_t v21 = v20;
  }
  unint64_t v22 = objc_msgSend(v18, "subarrayWithRange:", 0, v21);

  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  id v23 = v22;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v117 objects:v125 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v118;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v118 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void *)(*((void *)&v117 + 1) + 8 * i);
        long long v29 = (void *)MEMORY[0x1D25F43D0]();
        v17[2](v17, v28);
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v117 objects:v125 count:16];
    }
    while (v25);
  }

  id v6 = v112;
  v30 = [v112 selfAttendee];

  if (v30
    && ([v112 selfAttendee],
        uint64_t v31 = objc_claimAutoreleasedReturnValue(),
        uint64_t v32 = [v31 participantStatus],
        v31,
        v32 != 2))
  {
    v33 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v67 = [v112 selfAttendee];
      uint64_t v68 = [v67 participantStatus];
      v69 = [v112 eventIdentifier];
      *(_DWORD *)buf = 134218242;
      uint64_t v127 = v68;
      __int16 v128 = 2112;
      v129 = v69;
      _os_log_impl(&dword_1D0F43000, v33, OS_LOG_TYPE_DEFAULT, "Ignore event: Not accepted [%lu], id %@", buf, 0x16u);
    }
    id v12 = 0;
    id v9 = v108;
    uint64_t v8 = v109;
  }
  else
  {
    v33 = objc_opt_new();
    long long v113 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    v34 = [v112 attachments];
    uint64_t v35 = [v34 countByEnumeratingWithState:&v113 objects:v124 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v114;
      do
      {
        for (uint64_t j = 0; j != v36; ++j)
        {
          if (*(void *)v114 != v37) {
            objc_enumerationMutation(v34);
          }
          uint64_t v39 = *(void *)(*((void *)&v113 + 1) + 8 * j);
          v40 = (void *)MEMORY[0x1D25F43D0]();
          v41 = [(ATXHeuristicDevice *)self _dictForAttachment:v39];
          [v33 addObject:v41];
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v113 objects:v124 count:16];
      }
      while (v36);
    }

    id v6 = v112;
    v42 = [v112 title];
    id v9 = v108;
    [v108 setObject:v42 forKeyedSubscript:@"eventTitle"];

    v43 = [v112 creationDate];
    if (v43)
    {
      v44 = NSNumber;
      v45 = v108;
      [v43 timeIntervalSinceReferenceDate];
      v46 = objc_msgSend(v44, "numberWithDouble:");
      [v45 setObject:v46 forKeyedSubscript:@"creationDateTimestamp"];
    }
    v47 = [v112 lastModifiedDate];
    if (v47)
    {
      v48 = NSNumber;
      v49 = v108;
      [v47 timeIntervalSinceReferenceDate];
      v50 = objc_msgSend(v48, "numberWithDouble:");
      [v49 setObject:v50 forKeyedSubscript:@"modifiedDateTimestamp"];
    }
    v51 = [v112 startDate];
    if (v51)
    {
      v52 = NSNumber;
      v53 = v108;
      [v51 timeIntervalSinceReferenceDate];
      v54 = objc_msgSend(v52, "numberWithDouble:");
      [v53 setObject:v54 forKeyedSubscript:@"startDateTimestamp"];
    }
    v55 = [v112 endDate];
    if (v55)
    {
      v56 = NSNumber;
      v57 = v108;
      [v55 timeIntervalSinceReferenceDate];
      v58 = objc_msgSend(v56, "numberWithDouble:");
      [v57 setObject:v58 forKeyedSubscript:@"endDateTimestamp"];
    }
    v59 = [v112 startTimeZone];
    v60 = [v59 name];
    [v108 setObject:v60 forKeyedSubscript:@"startTimeZoneName"];

    v61 = [v112 endTimeZone];
    v62 = [v61 name];
    [v108 setObject:v62 forKeyedSubscript:@"endTimeZoneName"];

    v63 = (void *)MEMORY[0x1D25F43D0]();
    v106 = [v112 virtualConference];
    v105 = [v106 joinMethods];
    v64 = [v105 firstObject];
    v65 = [v64 URL];
    v66 = [v65 absoluteString];
    if (v66)
    {
      [v108 setObject:v66 forKeyedSubscript:@"conferenceURL"];
    }
    else
    {
      v103 = [v112 conferenceURLForDisplay];
      [v103 absoluteString];
      v70 = v104 = v63;
      [v108 setObject:v70 forKeyedSubscript:@"conferenceURL"];

      v63 = v104;
    }

    [v108 setObject:v111 forKeyedSubscript:@"contacts"];
    v71 = [v112 externalURL];
    v72 = [v71 absoluteString];
    [v108 setObject:v72 forKeyedSubscript:@"externalURL"];

    v73 = NSNumber;
    [v112 travelTime];
    v74 = objc_msgSend(v73, "numberWithDouble:");
    [v108 setObject:v74 forKeyedSubscript:@"travelTime"];

    v75 = [v112 notes];
    [v108 setObject:v75 forKeyedSubscript:@"notes"];

    v76 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v112, "isAllDay"));
    [v108 setObject:v76 forKeyedSubscript:@"isAllDay"];

    v77 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v112, "hasRecurrenceRules"));
    [v108 setObject:v77 forKeyedSubscript:@"hasRecurrenceRules"];

    [v108 setObject:v33 forKeyedSubscript:@"attachments"];
    v78 = [(ATXHeuristicDevice *)self wrap:v112];
    [v108 setObject:v78 forKeyedSubscript:@"EKEvent"];

    v79 = [v112 eventIdentifier];
    [v108 setObject:v79 forKeyedSubscript:@"eventIdentifier"];

    v80 = [v112 uniqueID];
    [v108 setObject:v80 forKeyedSubscript:@"uniqueID"];

    v81 = [v112 preferredLocationWithoutPrediction];
    if (v81)
    {
      v82 = objc_opt_new();
      v83 = [v81 title];

      if (v83)
      {
        v84 = [v81 title];
        [v82 setObject:v84 forKeyedSubscript:@"title"];
      }
      v85 = [v81 address];

      if (v85)
      {
        v86 = [v81 address];
        [v82 setObject:v86 forKeyedSubscript:@"address"];
      }
      if ([v82 count]) {
        [v108 setObject:v82 forKeyedSubscript:@"structuredLocation"];
      }
    }
    v87 = [v112 suggestionInfo];

    if (v87)
    {
      v88 = [v112 suggestionInfo];
      v89 = [v88 uniqueKey];
      [v108 setObject:v89 forKeyedSubscript:@"suggestionsInfoUniqueKey"];

      v90 = [v112 customObjectForKey:@"SGEventMetadataKey"];
      if (v90) {
        [v108 setObject:v90 forKeyedSubscript:@"sgEventMetadata"];
      }
    }
    v91 = NSNumber;
    v92 = [v112 calendar];
    v93 = objc_msgSend(v91, "numberWithBool:", objc_msgSend(v92, "isNaturalLanguageSuggestedEventCalendar"));
    [v108 setObject:v93 forKeyedSubscript:@"nlEventCalendar"];

    v94 = [v112 calendar];
    v95 = [v94 calendarIdentifier];
    [v108 setObject:v95 forKeyedSubscript:@"calendarID"];

    v96 = [v112 localCustomObjectForKey:@"EKEventNaturalLanguageSuggestedEventExpirationDate"];
    if (v96)
    {
      v97 = NSNumber;
      v98 = v108;
      [v96 timeIntervalSinceReferenceDate];
      v99 = objc_msgSend(v97, "numberWithDouble:");
      [v98 setObject:v99 forKeyedSubscript:@"nlEventExpirationTime"];
    }
    v100 = [v112 birthdayContactIdentifier];

    if (v100)
    {
      v101 = [v112 birthdayContactIdentifier];
      v102 = [(ATXHeuristicDevice *)self _dictContactForIdentifier:v101];
      [v108 setObject:v102 forKeyedSubscript:@"birthdayContact"];
    }
    id v12 = v108;

    uint64_t v8 = v109;
  }

  id v7 = v110;
LABEL_6:

  return v12;
}

uint64_t __49__ATXHeuristicDevice__dictForEvent_contactCache___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v6 = v3;
    if (([v3 isCurrentUser] & 1) == 0)
    {
      id v4 = [*(id *)(a1 + 32) _dictContactForParticipant:v6 contactCache:*(void *)(a1 + 40)];
      if (v4) {
        [*(id *)(a1 + 48) addObject:v4];
      }
    }
  }

  return MEMORY[0x1F41817F8]();
}

- (id)_wrap:(id)a3
{
  id v4 = a3;
  id v5 = [NSNumber numberWithUnsignedLong:v4];
  id v6 = self;
  objc_sync_enter(v6);
  wrappedObjects = v6->_wrappedObjects;
  if (!wrappedObjects)
  {
    uint64_t v8 = objc_opt_new();
    id v9 = v6->_wrappedObjects;
    v6->_wrappedObjects = (NSMutableDictionary *)v8;

    wrappedObjects = v6->_wrappedObjects;
  }
  [(NSMutableDictionary *)wrappedObjects setObject:v4 forKeyedSubscript:v5];
  objc_sync_exit(v6);

  return v5;
}

- (id)_unwrap:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)v5->_wrappedObjects objectForKeyedSubscript:v4];
  objc_sync_exit(v5);

  return v6;
}

- (id)wrap:(id)a3
{
  id v4 = a3;
  id v5 = [[ATXHeuristicObjectHandle alloc] initWithDevice:self wrapping:v4];

  return v5;
}

- (ATXLocationManager)locationManager
{
  return self->_locationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_cachedCalendarDicts, 0);
  objc_storeStrong((id *)&self->_wrappedObjects, 0);
  objc_storeStrong((id *)&self->_now, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_favoriteContactsLazy, 0);
  objc_storeStrong((id *)&self->_meContactLazy, 0);

  objc_storeStrong((id *)&self->_contactStoreLazy, 0);
}

- (void)meContact
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0F43000, a2, OS_LOG_TYPE_ERROR, "Error when fetching me contact: %@", (uint8_t *)&v2, 0xCu);
}

- (void)contactsForPredicate:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1D0F43000, v0, v1, "Error when fetching contact for predicate %@: %@");
}

- (void)_dictContactForParticipant:(NSObject *)a3 contactCache:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 objectForKeyedSubscript:@"displayName"];
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_1D0F43000, a3, OS_LOG_TYPE_DEBUG, "Re-using cached contact dictionary: %@ for id: %@", (uint8_t *)&v6, 0x16u);
}

- (void)dictForEvent:(os_log_t)log contactCache:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_fault_impl(&dword_1D0F43000, log, OS_LOG_TYPE_FAULT, "Found ekEvent with nil uniqueId, not using cache", v1, 2u);
}

- (void)dictForEvent:contactCache:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1D0F43000, v0, OS_LOG_TYPE_DEBUG, "%s: Cache miss for ekEvent.uniqueId: %@", (uint8_t *)v1, 0x16u);
}

- (void)dictForEvent:contactCache:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1D0F43000, v0, OS_LOG_TYPE_DEBUG, "%s: Cache hit for ekEvent.uniqueId: %@", (uint8_t *)v1, 0x16u);
}

@end