@interface EKBirthdayListener
+ (BOOL)areBirthdaysEnabled;
+ (id)sharedListener;
- (id)allContactsWithBirthdays;
- (id)birthdayCalendarsCreateIfNeeded:(BOOL)a3 inStore:(id)a4 originalIdentifier:(id)a5 originalAlarms:(id)a6 ignoreAlarms:(BOOL)a7;
- (id)birthdayCalendarsInStore:(id)a3;
- (id)eventStore;
- (id)eventStoreProvider;
- (id)eventStoreProviderWithReset:(BOOL)a3;
- (id)eventStoreWithReset:(BOOL)a3;
- (id)initSingleton;
- (void)_insertEventsForContact:(id)a3 intoCalendar:(id)a4 inStore:(id)a5;
- (void)_localeChanged;
- (void)_performUpdateWithContext:(id)a3;
- (void)_start;
- (void)addBirthdayCalendars;
- (void)checkForFailures;
- (void)contactsInserted:(id)a3 updated:(id)a4 deleted:(id)a5;
- (void)disableBirthdayCalendars;
- (void)disableBirthdayCalendarsInStore:(id)a3;
- (void)incrementalUpdateWithContext:(id)a3;
- (void)insertEventWithContact:(id)a3 forDateComponents:(id)a4 intoCalendar:(id)a5 inStore:(id)a6;
- (void)reset;
- (void)resetAllBirthdaysInStore:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation EKBirthdayListener

+ (id)sharedListener
{
  if (sharedListener_onceToken != -1) {
    dispatch_once(&sharedListener_onceToken, &__block_literal_global_38);
  }
  v2 = (void *)sharedListener_listener;

  return v2;
}

uint64_t __36__EKBirthdayListener_sharedListener__block_invoke()
{
  id v0 = [[EKBirthdayListener alloc] initSingleton];
  uint64_t v1 = sharedListener_listener;
  sharedListener_listener = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)initSingleton
{
  v15.receiver = self;
  v15.super_class = (Class)EKBirthdayListener;
  v2 = [(EKBirthdayListener *)&v15 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v5 = dispatch_queue_create("EKBirthdayListener", v4);
    updateJobQueue = v2->_updateJobQueue;
    v2->_updateJobQueue = (OS_dispatch_queue *)v5;

    id v7 = objc_alloc(MEMORY[0x1E4F57668]);
    v8 = v2->_updateJobQueue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __35__EKBirthdayListener_initSingleton__block_invoke;
    v12[3] = &unk_1E5B97E50;
    objc_copyWeak(&v13, &location);
    uint64_t v9 = [v7 initWithQueue:v8 andBlock:v12];
    updateQueue = v2->_updateQueue;
    v2->_updateQueue = (CalAccumulatingQueue *)v9;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __35__EKBirthdayListener_initSingleton__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if (!WeakRetained[33]) {
      [WeakRetained _performUpdateWithContext:v4];
    }
  }
  else
  {
    id v7 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __35__EKBirthdayListener_initSingleton__block_invoke_cold_1(v7);
    }
  }
}

- (void)_performUpdateWithContext:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0 && (_os_feature_enabled_impl() & 1) == 0)
  {
    BOOL v5 = +[EKBirthdayListener areBirthdaysEnabled];
    v6 = self;
    objc_sync_enter(v6);
    BOOL needsReset = v6->_needsReset;
    v6->_BOOL needsReset = 0;
    objc_sync_exit(v6);

    v8 = [(EKBirthdayListener *)v6 eventStoreWithReset:needsReset];
    if (v5)
    {
      if (needsReset
        || ([(EKBirthdayListener *)v6 birthdayCalendarsInStore:v8],
            uint64_t v9 = objc_claimAutoreleasedReturnValue(),
            uint64_t v10 = [v9 count],
            v9,
            v10 != 1))
      {
        [(EKBirthdayListener *)v6 resetAllBirthdaysInStore:v8];
      }
      else
      {
        [(EKBirthdayListener *)v6 incrementalUpdateWithContext:v4];
      }
    }
    else
    {
      [(EKBirthdayListener *)v6 disableBirthdayCalendarsInStore:v8];
      v11 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        v12[0] = 67109376;
        v12[1] = needsReset;
        __int16 v13 = 1024;
        int v14 = 0;
        _os_log_impl(&dword_1A4E47000, v11, OS_LOG_TYPE_DEFAULT, "Not updating birthday events -- need reset? [%{BOOL}d] birthdays enabled? [%{BOOL}d]", (uint8_t *)v12, 0xEu);
      }
    }
  }
}

- (void)start
{
  if ((_os_feature_enabled_impl() & 1) == 0 && (_os_feature_enabled_impl() & 1) == 0)
  {
    [(EKBirthdayListener *)self _start];
  }
}

- (void)_start
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  updateJobQueue = self->_updateJobQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__EKBirthdayListener__start__block_invoke;
  block[3] = &unk_1E5B96E08;
  block[4] = self;
  dispatch_sync(updateJobQueue, block);
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__localeChanged name:*MEMORY[0x1E4F1C370] object:0];

  BOOL v5 = [MEMORY[0x1E4F576E0] shared];
  v6 = [v5 objectForKey:@"BirthdayEventsGenerationLastLocale"];

  id v7 = [MEMORY[0x1E4F1CA20] currentLocale];
  v8 = [v7 localeIdentifier];
  char v9 = [v6 isEqualToString:v8];

  if ((v9 & 1) == 0)
  {
    uint64_t v10 = [MEMORY[0x1E4F576E0] shared];
    v11 = [MEMORY[0x1E4F1CA20] currentLocale];
    v12 = [v11 localeIdentifier];
    [v10 setObject:v12 forKey:@"BirthdayEventsGenerationLastLocale"];

    __int16 v13 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = (void *)MEMORY[0x1E4F1CA20];
      uint64_t v15 = v13;
      v16 = [v14 currentLocale];
      v17 = [v16 localeIdentifier];
      *(_DWORD *)buf = 138412546;
      v24 = v6;
      __int16 v25 = 2112;
      v26 = v17;
      _os_log_impl(&dword_1A4E47000, v15, OS_LOG_TYPE_DEFAULT, "BirthdayEventsGenerationLocale (%@) does not match current (%@). Forcing regeneration.", buf, 0x16u);
    }
    v18 = self;
    objc_sync_enter(v18);
    v18->_BOOL needsReset = 1;
    objc_sync_exit(v18);
  }
  v19 = self;
  objc_sync_enter(v19);
  BOOL needsReset = v19->_needsReset;
  objc_sync_exit(v19);

  if (!needsReset) {
    [(EKBirthdayListener *)v19 checkForFailures];
  }
  [(CalAccumulatingQueue *)v19->_updateQueue updateTagsAndExecuteBlock:0 withContext:&unk_1EF9531F8];
  v21 = [MEMORY[0x1E4F576B0] defaultProvider];
  [v21 registerForContactChangeNotifications:v19];
}

void __28__EKBirthdayListener__start__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 33) = 0;
  v2 = [*(id *)(a1 + 32) eventStore];
  int v3 = [v2 birthdayCalendarVersion];
  if (v3 != 13)
  {
    int v4 = v3;
    [v2 setBirthdayCalendarVersion:13];
    BOOL v5 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109376;
      v7[1] = v4;
      __int16 v8 = 1024;
      int v9 = 13;
      _os_log_impl(&dword_1A4E47000, v5, OS_LOG_TYPE_DEFAULT, "birthdayCalendarVersion (%d) does not match current version (%d). Forcing regeneration.", (uint8_t *)v7, 0xEu);
    }
    id v6 = *(id *)(a1 + 32);
    objc_sync_enter(v6);
    *(unsigned char *)(*(void *)(a1 + 32) + 32) = 1;
    objc_sync_exit(v6);
  }
}

- (void)stop
{
  int v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  int v4 = [MEMORY[0x1E4F576B0] defaultProvider];
  [v4 deregisterForContactChangeNotifications:self];

  updateJobQueue = self->_updateJobQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__EKBirthdayListener_stop__block_invoke;
  block[3] = &unk_1E5B96E08;
  block[4] = self;
  dispatch_sync(updateJobQueue, block);
}

uint64_t __26__EKBirthdayListener_stop__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 33) = 1;
  return result;
}

- (void)checkForFailures
{
  int v3 = [MEMORY[0x1E4F576E0] shared];
  int v4 = [v3 objectForKey:@"BirthdayEventsGenerationLastAttemptTimeResetKey"];

  if (v4)
  {
    BOOL v5 = [MEMORY[0x1E4F576E0] shared];
    uint64_t v6 = [v5 integerForKey:@"BirthdayEventsGenerationAttemptsToResetKey"];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __38__EKBirthdayListener_checkForFailures__block_invoke;
    v10[3] = &unk_1E5B97E78;
    id v11 = v4;
    v12 = self;
    uint64_t v7 = MEMORY[0x1A6266730](v10);
    __int16 v8 = (void *)v7;
    if ((unint64_t)(v6 - 1) > 2) {
      uint64_t v9 = 84600;
    }
    else {
      uint64_t v9 = qword_1A4F8FF08[v6 - 1];
    }
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, v9);
  }
}

void __38__EKBirthdayListener_checkForFailures__block_invoke(uint64_t a1, uint64_t a2)
{
  double v3 = (double)a2;
  int v4 = [MEMORY[0x1E4F1C9C8] date];
  [v4 timeIntervalSinceDate:*(void *)(a1 + 32)];
  double v6 = v3 - v5;

  if (v6 >= 0.0)
  {
    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    __int16 v8 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__EKBirthdayListener_checkForFailures__block_invoke_2;
    block[3] = &unk_1E5B96E08;
    block[4] = *(void *)(a1 + 40);
    dispatch_after(v7, v8, block);
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 40) + 32) = 1;
  }
}

uint64_t __38__EKBirthdayListener_checkForFailures__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reset];
}

- (id)eventStoreProvider
{
  return [(EKBirthdayListener *)self eventStoreProviderWithReset:0];
}

- (id)eventStoreProviderWithReset:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_updateJobQueue);
  eventStoreProvider = self->_eventStoreProvider;
  if (eventStoreProvider) {
    BOOL v6 = !v3;
  }
  else {
    BOOL v6 = 0;
  }
  if (!v6)
  {
    dispatch_time_t v7 = [[EKEphemeralCacheEventStoreProvider alloc] initWithCreationBlock:&__block_literal_global_47];
    __int16 v8 = self->_eventStoreProvider;
    self->_eventStoreProvider = (EKEventStoreProvider *)v7;

    eventStoreProvider = self->_eventStoreProvider;
  }

  return eventStoreProvider;
}

EKEventStore *__50__EKBirthdayListener_eventStoreProviderWithReset___block_invoke()
{
  id v0 = [[EKEventStore alloc] initWithBirthdayCalendarModifications];

  return v0;
}

- (id)eventStore
{
  return [(EKBirthdayListener *)self eventStoreWithReset:0];
}

- (id)eventStoreWithReset:(BOOL)a3
{
  BOOL v3 = [(EKBirthdayListener *)self eventStoreProviderWithReset:a3];
  int v4 = [v3 eventStore];

  return v4;
}

+ (BOOL)areBirthdaysEnabled
{
  v2 = [MEMORY[0x1E4F576E0] shared];
  char v3 = [v2 BOOLForKey:*MEMORY[0x1E4F57570]];

  return v3;
}

- (void)addBirthdayCalendars
{
  id v3 = [MEMORY[0x1E4F576E0] shared];
  [v3 setBool:1 forKey:*MEMORY[0x1E4F57570]];
  [(CalAccumulatingQueue *)self->_updateQueue updateTagsAndExecuteBlock:0 withContext:&unk_1EF953220];
}

- (void)_localeChanged
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F576E0] shared];
  int v4 = [v3 objectForKey:@"BirthdayEventsGenerationLastLocale"];

  double v5 = [MEMORY[0x1E4F1CA20] currentLocale];
  BOOL v6 = [v5 localeIdentifier];
  char v7 = [v4 isEqualToString:v6];

  if (v7)
  {
    __int16 v8 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      v18 = v4;
      _os_log_impl(&dword_1A4E47000, v8, OS_LOG_TYPE_DEFAULT, "BirthdayEventsGenerationLocale ignoring locale change because locale identifier has not changed (%@)", (uint8_t *)&v17, 0xCu);
    }
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F576E0] shared];
    uint64_t v10 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v11 = [v10 localeIdentifier];
    [v9 setObject:v11 forKey:@"BirthdayEventsGenerationLastLocale"];

    v12 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = (void *)MEMORY[0x1E4F1CA20];
      int v14 = v12;
      uint64_t v15 = [v13 currentLocale];
      v16 = [v15 localeIdentifier];
      int v17 = 138412546;
      v18 = v4;
      __int16 v19 = 2112;
      v20 = v16;
      _os_log_impl(&dword_1A4E47000, v14, OS_LOG_TYPE_DEFAULT, "BirthdayEventsGenerationLocale (%@) does not match current (%@). Forcing regeneration.", (uint8_t *)&v17, 0x16u);
    }
    [(EKBirthdayListener *)self reset];
  }
}

- (id)birthdayCalendarsInStore:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = objc_opt_new();
  double v5 = [v3 calendarsForEntityType:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 type] == 4) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  id v11 = [MEMORY[0x1E4F1C978] arrayWithArray:v4];

  return v11;
}

- (void)disableBirthdayCalendars
{
  id v3 = [MEMORY[0x1E4F576E0] shared];
  [v3 setBool:0 forKey:*MEMORY[0x1E4F57570]];
  if ((_os_feature_enabled_impl() & 1) == 0 && (_os_feature_enabled_impl() & 1) == 0)
  {
    updateJobQueue = self->_updateJobQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__EKBirthdayListener_disableBirthdayCalendars__block_invoke;
    block[3] = &unk_1E5B96E08;
    block[4] = self;
    dispatch_sync(updateJobQueue, block);
  }
}

void __46__EKBirthdayListener_disableBirthdayCalendars__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [v1 eventStore];
  [v1 disableBirthdayCalendarsInStore:v2];
}

- (void)disableBirthdayCalendarsInStore:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  double v5 = [(EKBirthdayListener *)self birthdayCalendarsInStore:v4];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    id v9 = 0;
    uint64_t v10 = *(void *)v22;
    *(void *)&long long v7 = 138412546;
    long long v18 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        v12 = v9;
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v5);
        }
        uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        id v20 = v9;
        char v14 = objc_msgSend(v4, "removeCalendar:commit:error:", v13, 0, &v20, v18);
        id v9 = v20;

        if ((v14 & 1) == 0)
        {
          long long v15 = EKLogHandle;
          if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v18;
            uint64_t v26 = v13;
            __int16 v27 = 2112;
            id v28 = v9;
            _os_log_error_impl(&dword_1A4E47000, v15, OS_LOG_TYPE_ERROR, "EKBirthdayListener unable to delete birthday calendar %@, %@", buf, 0x16u);
          }
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }

  id v19 = v9;
  char v16 = [v4 commitWithRollback:&v19];
  id v17 = v19;

  if ((v16 & 1) == 0 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
    -[EKBirthdayListener disableBirthdayCalendarsInStore:]();
  }
}

- (id)birthdayCalendarsCreateIfNeeded:(BOOL)a3 inStore:(id)a4 originalIdentifier:(id)a5 originalAlarms:(id)a6 ignoreAlarms:(BOOL)a7
{
  BOOL v8 = a3;
  v26[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  v12 = [(EKBirthdayListener *)self birthdayCalendarsInStore:v10];
  uint64_t v13 = v12;
  if (!v8 || [v12 count])
  {
    id v14 = v13;
    goto LABEL_4;
  }
  char v16 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4E47000, v16, OS_LOG_TYPE_DEFAULT, "Creating Birthday Calendar", buf, 2u);
  }
  id v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v24 = 0;
  long long v18 = [v10 localBirthdayCalendarCreateIfNeededWithError:&v24];
  id v19 = v24;
  if (v11) {
    [v18 setCalendarIdentifier:v11];
  }
  id v20 = [v17 localizedStringForKey:@"Birthdays" value:@"Birthdays" table:0];
  [v18 setTitle:v20];

  id v23 = v19;
  char v21 = [v10 saveCalendar:v18 commit:1 error:&v23];
  id v22 = v23;

  if ((v21 & 1) == 0 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKBirthdayListener birthdayCalendarsCreateIfNeeded:inStore:originalIdentifier:originalAlarms:ignoreAlarms:]();
    if (v18) {
      goto LABEL_14;
    }
LABEL_16:
    id v14 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_17;
  }
  if (!v18) {
    goto LABEL_16;
  }
LABEL_14:
  v26[0] = v18;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
LABEL_17:

LABEL_4:

  return v14;
}

- (id)allContactsWithBirthdays
{
  id v2 = [MEMORY[0x1E4F576B0] defaultProvider];
  id v3 = [v2 contactStore];

  id v4 = objc_alloc(MEMORY[0x1E4F1B908]);
  double v5 = [MEMORY[0x1E4F1B8F8] CalKeys];
  uint64_t v6 = (void *)[v4 initWithKeysToFetch:v5];

  id v15 = (id)objc_opt_new();
  id v16 = 0;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __46__EKBirthdayListener_allContactsWithBirthdays__block_invoke;
  id v14 = &unk_1E5B97EC0;
  id v7 = v15;
  [v3 enumerateContactsWithFetchRequest:v6 error:&v16 usingBlock:&v11];
  id v8 = v16;
  id v9 = objc_msgSend(v7, "copy", v11, v12, v13, v14);

  return v9;
}

void __46__EKBirthdayListener_allContactsWithBirthdays__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 birthday];
  if (v3)
  {
  }
  else
  {
    id v4 = [v5 nonGregorianBirthday];

    if (!v4) {
      goto LABEL_5;
    }
  }
  [*(id *)(a1 + 32) addObject:v5];
LABEL_5:
}

- (void)insertEventWithContact:(id)a3 forDateComponents:(id)a4 intoCalendar:(id)a5 inStore:(id)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  context = (void *)MEMORY[0x1A62664B0]();
  v38 = v12;
  uint64_t v13 = +[EKEvent eventWithEventStore:v12];
  [v13 setCalendar:v11];
  id v14 = [MEMORY[0x1E4F1C9A8] CalDateFromBirthdayComponents:v10];
  id v15 = [v10 calendar];
  [v13 setAllDay:1];
  id v16 = (void *)MEMORY[0x1E4F576B0];
  id v17 = [v9 CalDisplayName];
  long long v18 = [v15 calendarIdentifier];
  id v19 = [v16 birthdayStringForContactName:v17 eventDate:0 birthDate:v14 lunarCalendar:v18];

  [v13 setAlarms:0];
  v37 = v11;
  id v20 = [v11 source];
  char v21 = [v20 defaultAlarmOffset];

  if (v21)
  {
    uint64_t v22 = [v21 intValue];
    id v23 = +[EKAlarm alarmWithRelativeOffset:(double)(int)v22];
    id v24 = objc_msgSend(NSString, "stringWithFormat:", @"relative=%i", v22);
    [v23 setExternalID:v24];

    [v13 addAlarm:v23];
  }
  __int16 v25 = NSString;
  uint64_t v26 = [v15 calendarIdentifier];
  __int16 v27 = [v9 identifier];
  id v28 = [v25 stringWithFormat:@"%@/%@", v26, v27];
  [v13 setUniqueID:v28];

  [v13 setTitle:v19];
  [v13 setStartDate:v14];
  [v13 setEndDateUnadjustedForLegacyClients:v14];
  v29 = [[EKRecurrenceRule alloc] initRecurrenceWithFrequency:3 interval:1 end:0];
  [v13 addRecurrenceRule:v29];
  [v13 setBirthdayContact:v9];
  uint64_t v30 = [v15 calendarIdentifier];
  [v13 setLunarCalendarString:v30];

  v31 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    v32 = v31;
    v33 = [v9 identifier];
    *(_DWORD *)buf = 138412546;
    v41 = v19;
    __int16 v42 = 2112;
    v43 = v33;
    _os_log_impl(&dword_1A4E47000, v32, OS_LOG_TYPE_DEFAULT, "EKBirthdayListener inserting birthday for %@ (%@)", buf, 0x16u);
  }
  id v39 = 0;
  char v34 = [v38 saveEvent:v13 span:1 commit:0 error:&v39];
  id v35 = v39;
  if ((v34 & 1) == 0 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
    -[EKBirthdayListener insertEventWithContact:forDateComponents:intoCalendar:inStore:]();
  }
}

- (void)_insertEventsForContact:(id)a3 intoCalendar:(id)a4 inStore:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v14 birthday];

  if (v10)
  {
    id v11 = [v14 birthday];
    [(EKBirthdayListener *)self insertEventWithContact:v14 forDateComponents:v11 intoCalendar:v8 inStore:v9];
  }
  id v12 = [v14 nonGregorianBirthday];

  if (v12)
  {
    uint64_t v13 = [v14 nonGregorianBirthday];
    [(EKBirthdayListener *)self insertEventWithContact:v14 forDateComponents:v13 intoCalendar:v8 inStore:v9];
  }
}

- (void)resetAllBirthdaysInStore:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F576E0] shared];
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
  [v5 setObject:v6 forKey:@"BirthdayEventsGenerationLastAttemptTimeResetKey"];

  id v7 = [MEMORY[0x1E4F576E0] shared];
  uint64_t v8 = [v7 integerForKey:@"BirthdayEventsGenerationAttemptsToResetKey"];

  id v9 = [MEMORY[0x1E4F576E0] shared];
  [v9 setInteger:v8 + 1 forKey:@"BirthdayEventsGenerationAttemptsToResetKey"];

  id v10 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4E47000, v10, OS_LOG_TYPE_DEFAULT, "Resetting All Birthdays in Store", buf, 2u);
  }
  id v11 = [(EKBirthdayListener *)self birthdayCalendarsInStore:v4];
  if ([v11 count] == 1)
  {
    id v12 = [v11 objectAtIndexedSubscript:0];
  }
  else
  {
    id v12 = 0;
  }
  uint64_t v13 = [v12 calendarIdentifier];
  [(EKBirthdayListener *)self disableBirthdayCalendarsInStore:v4];
  id v14 = [(EKBirthdayListener *)self birthdayCalendarsCreateIfNeeded:1 inStore:v4 originalIdentifier:v13 originalAlarms:0 ignoreAlarms:0];

  if ([v14 count] == 1)
  {
    id v15 = [v14 objectAtIndexedSubscript:0];
    id v16 = [(EKBirthdayListener *)self allContactsWithBirthdays];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v28;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(v16);
          }
          [(EKBirthdayListener *)self _insertEventsForContact:*(void *)(*((void *)&v27 + 1) + 8 * v20++) intoCalendar:v15 inStore:v4];
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v18);
    }
    id v26 = 0;
    char v21 = [v4 commitWithRollback:&v26];
    id v22 = v26;
    if ((v21 & 1) == 0 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      -[EKBirthdayListener resetAllBirthdaysInStore:]();
    }
    id v23 = [MEMORY[0x1E4F576E0] shared];
    [v23 setObject:0 forKey:@"BirthdayEventsGenerationLastAttemptTimeResetKey"];

    id v24 = [MEMORY[0x1E4F576E0] shared];
    [v24 setInteger:0 forKey:@"BirthdayEventsGenerationAttemptsToResetKey"];
  }
  else
  {
    __int16 v25 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      -[EKBirthdayListener resetAllBirthdaysInStore:](v25, v14);
    }
  }
}

- (void)incrementalUpdateWithContext:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"inserts"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"updates"];
  id v7 = [v4 objectForKeyedSubscript:@"deletes"];
  if ([v5 count] || objc_msgSend(v6, "count") || objc_msgSend(v7, "count"))
  {
    uint64_t v8 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v8;
      *(_DWORD *)buf = 134218496;
      uint64_t v46 = [v5 count];
      __int16 v47 = 2048;
      uint64_t v48 = [v6 count];
      __int16 v49 = 2048;
      uint64_t v50 = [v7 count];
      _os_log_impl(&dword_1A4E47000, v9, OS_LOG_TYPE_DEFAULT, "EKBirthdayListener handling a total of %ld inserted, %ld updated, %ld deleted contacts", buf, 0x20u);
    }
    id v10 = [(EKBirthdayListener *)self eventStore];
    id v11 = [(EKBirthdayListener *)self birthdayCalendarsCreateIfNeeded:0 inStore:v10 originalIdentifier:0 originalAlarms:0 ignoreAlarms:0];
    if ([v11 count])
    {
      id v30 = v4;
      id v12 = [v11 objectAtIndexedSubscript:0];
      uint64_t v13 = [v6 valueForKeyPath:@"identifier"];
      uint64_t v14 = [v5 valueForKey:@"identifier"];
      v32 = (void *)v13;
      id v15 = [MEMORY[0x1E4F1CA80] setWithArray:v13];
      v31 = (void *)v14;
      [v15 addObjectsFromArray:v14];
      uint64_t v33 = v7;
      [v15 addObjectsFromArray:v7];
      uint64_t v16 = [v10 predicateForMasterEventsInCalendar:v12];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __51__EKBirthdayListener_incrementalUpdateWithContext___block_invoke;
      v41[3] = &unk_1E5B97EE8;
      id v28 = v15;
      id v42 = v28;
      id v17 = v10;
      id v43 = v17;
      long long v29 = (void *)v16;
      [v17 enumerateEventsMatchingPredicate:v16 usingBlock:v41];
      char v34 = v6;
      id v35 = v5;
      uint64_t v18 = [v5 arrayByAddingObjectsFromArray:v6];
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v37 objects:v44 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v38;
        do
        {
          uint64_t v22 = 0;
          do
          {
            if (*(void *)v38 != v21) {
              objc_enumerationMutation(v18);
            }
            [(EKBirthdayListener *)self _insertEventsForContact:*(void *)(*((void *)&v37 + 1) + 8 * v22++) intoCalendar:v12 inStore:v17];
          }
          while (v20 != v22);
          uint64_t v20 = [v18 countByEnumeratingWithState:&v37 objects:v44 count:16];
        }
        while (v20);
      }
      id v23 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4E47000, v23, OS_LOG_TYPE_DEFAULT, "EKBirthdayListener committing changes", buf, 2u);
      }
      id v36 = 0;
      char v24 = [v17 commitWithRollback:&v36];
      id v25 = v36;
      uint64_t v6 = v34;
      id v4 = v30;
      if ((v24 & 1) == 0 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
        -[EKBirthdayListener resetAllBirthdaysInStore:]();
      }

      id v5 = v35;
      id v7 = v33;
    }
    else
    {
      id v26 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
        -[EKBirthdayListener incrementalUpdateWithContext:](v26);
      }
    }
  }
  else
  {
    long long v27 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4E47000, v27, OS_LOG_TYPE_DEFAULT, "EKBirthdayListener has nothing to do; skipping this update.",
        buf,
        2u);
    }
  }
}

void __51__EKBirthdayListener_incrementalUpdateWithContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 birthdayContactIdentifier];
  if (v4
    && (id v5 = (void *)v4,
        uint64_t v6 = *(void **)(a1 + 32),
        [v3 birthdayContactIdentifier],
        id v7 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v6) = [v6 containsObject:v7],
        v7,
        v5,
        v6))
  {
    uint64_t v8 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v8;
      id v10 = [v3 title];
      id v11 = [v3 birthdayContactIdentifier];
      *(_DWORD *)buf = 138412546;
      long long v29 = v10;
      __int16 v30 = 2112;
      v31 = v11;
      _os_log_impl(&dword_1A4E47000, v9, OS_LOG_TYPE_DEFAULT, "EKBirthdayListener removing birthday for %@ (%@)", buf, 0x16u);
    }
    id v12 = *(void **)(a1 + 40);
    id v27 = 0;
    char v13 = [v12 removeEvent:v3 span:4 commit:0 error:&v27];
    id v14 = v27;
    if ((v13 & 1) == 0 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __51__EKBirthdayListener_incrementalUpdateWithContext___block_invoke_cold_1();
    }
  }
  else
  {
    id v15 = [v3 birthdayContactName];

    if (v15)
    {
      uint64_t v16 = [MEMORY[0x1E4F576B0] defaultProvider];
      id v17 = [v3 birthdayContactIdentifier];
      uint64_t v18 = [v16 unifiedContactWithIdentifier:v17];

      if (v18)
      {
        id v14 = 0;
      }
      else
      {
        uint64_t v22 = (void *)EKLogHandle;
        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
          __51__EKBirthdayListener_incrementalUpdateWithContext___block_invoke_cold_4(v22, v3);
        }
        id v23 = *(void **)(a1 + 40);
        id v25 = 0;
        char v24 = [v23 removeEvent:v3 span:4 commit:0 error:&v25];
        id v14 = v25;
        if ((v24 & 1) == 0 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
          __51__EKBirthdayListener_incrementalUpdateWithContext___block_invoke_cold_1();
        }
      }
    }
    else
    {
      uint64_t v19 = (void *)EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
        __51__EKBirthdayListener_incrementalUpdateWithContext___block_invoke_cold_2(v19, v3);
      }
      uint64_t v20 = *(void **)(a1 + 40);
      id v26 = 0;
      char v21 = [v20 removeEvent:v3 span:4 commit:0 error:&v26];
      id v14 = v26;
      if ((v21 & 1) == 0 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
        __51__EKBirthdayListener_incrementalUpdateWithContext___block_invoke_cold_1();
      }
    }
  }
}

- (void)contactsInserted:(id)a3 updated:(id)a4 deleted:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    *(_DWORD *)buf = 134218496;
    uint64_t v18 = [v8 count];
    __int16 v19 = 2048;
    uint64_t v20 = [v9 count];
    __int16 v21 = 2048;
    uint64_t v22 = [v10 count];
    _os_log_impl(&dword_1A4E47000, v12, OS_LOG_TYPE_DEFAULT, "EKBirthdayListener received %ld inserted, %ld updated, %ld deleted contacts", buf, 0x20u);
  }
  updateQueue = self->_updateQueue;
  v15[0] = @"inserts";
  v15[1] = @"updates";
  v16[0] = v8;
  v16[1] = v9;
  v15[2] = @"deletes";
  v16[2] = v10;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
  [(CalAccumulatingQueue *)updateQueue updateTagsAndExecuteBlock:0 withContext:v14];
}

- (void)reset
{
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL needsReset = 1;
  [(CalAccumulatingQueue *)obj->_updateQueue updateTagsAndExecuteBlock:0 withContext:&unk_1EF953248];
  objc_sync_exit(obj);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateJobQueue, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);

  objc_storeStrong((id *)&self->_eventStoreProvider, 0);
}

void __35__EKBirthdayListener_initSingleton__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A4E47000, log, OS_LOG_TYPE_ERROR, "Unexpected nil self in birthday update block", v1, 2u);
}

- (void)disableBirthdayCalendarsInStore:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "EKBirthdayListener unable to commit birthday calendar deletion %@", v2, v3, v4, v5, v6);
}

- (void)birthdayCalendarsCreateIfNeeded:inStore:originalIdentifier:originalAlarms:ignoreAlarms:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "EKBirthdayListenerFailed to save calendar to event store with error: %@", v2, v3, v4, v5, v6);
}

- (void)insertEventWithContact:forDateComponents:intoCalendar:inStore:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11(&dword_1A4E47000, v0, v1, "EKBirthdayListener unable to save event %@, %@");
}

- (void)resetAllBirthdaysInStore:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "EKBirthdayListener unable to commit to store %@", v2, v3, v4, v5, v6);
}

- (void)resetAllBirthdaysInStore:(void *)a1 .cold.2(void *a1, void *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  [a2 count];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1A4E47000, v3, OS_LOG_TYPE_ERROR, "Expected exactly 1 birthday calendar, but instead there are %lu", v4, 0xCu);
}

- (void)incrementalUpdateWithContext:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A4E47000, log, OS_LOG_TYPE_ERROR, "No birthday calendar found when trying to add birthdays", v1, 2u);
}

void __51__EKBirthdayListener_incrementalUpdateWithContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11(&dword_1A4E47000, v0, v1, "EKBirthdayListener unable to remove event %@ %@");
}

void __51__EKBirthdayListener_incrementalUpdateWithContext___block_invoke_cold_2(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 title];
  uint64_t v5 = [a2 birthdayContactIdentifier];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5_0(&dword_1A4E47000, v6, v7, "EKBirthdayListener removing invalid birthday for %@ (%@), No Contact Name!", v8, v9, v10, v11, v12);
}

void __51__EKBirthdayListener_incrementalUpdateWithContext___block_invoke_cold_4(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 title];
  uint64_t v5 = [a2 birthdayContactIdentifier];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5_0(&dword_1A4E47000, v6, v7, "EKBirthdayListener removing invalid birthday for %@ (%@), Invalid Contact Identifier!", v8, v9, v10, v11, v12);
}

@end