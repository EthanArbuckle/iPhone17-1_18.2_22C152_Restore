@interface EKCalendarVisibilityManager
+ (NSArray)deselectedCalendarIdentifiers;
+ (NSArray)unselectedCalendarIdentifiersForFocusMode;
+ (NSString)focusModeConfigurationChangedName;
+ (NSString)visibilityChangedNotificationName;
+ (id)_defaultQueue;
+ (id)reminderCalendarInEventStore:(id)a3;
+ (id)unselectedCalendarsForFocusModeInEventStore:(id)a3;
+ (void)setUnselectedCalendarIdentifiersForFocusMode:(id)a3;
- (BOOL)active;
- (CalDarwinNotificationListener)notificationListener;
- (EKCalendarVisibilityManager)initWithEventStore:(id)a3 limitedToSource:(id)a4 visibilityChangedCallback:(id)a5;
- (EKCalendarVisibilityManager)initWithEventStore:(id)a3 limitedToSource:(id)a4 visibilityChangedCallback:(id)a5 queue:(id)a6;
- (EKCalendarVisibilityManager)initWithEventStore:(id)a3 limitedToSource:(id)a4 visibilityChangedCallback:(id)a5 queue:(id)a6 activate:(BOOL)a7;
- (EKCalendarVisibilityManager)initWithEventStore:(id)a3 visibilityChangedCallback:(id)a4;
- (EKCalendarVisibilityManager)initWithEventStore:(id)a3 visibilityChangedCallback:(id)a4 queue:(id)a5;
- (EKEventStore)eventStore;
- (EKSource)limitedToSource;
- (NSArray)invisibleCalendars;
- (NSArray)invisibleCalendarsForAllIdentities;
- (NSArray)visibleCalendars;
- (NSArray)visibleCalendarsForAllIdentities;
- (id)_calendarsThatAreVisible:(BOOL)a3 filteredByIdentity:(BOOL)a4;
- (id)_deselectedCalendarIdentifiers;
- (id)visibilityChangedCallback;
- (void)activate;
- (void)deactivate;
- (void)dealloc;
- (void)setActive:(BOOL)a3;
@end

@implementation EKCalendarVisibilityManager

uint64_t __75__EKCalendarVisibilityManager__calendarsThatAreVisible_filteredByIdentity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(unsigned char *)(a1 + 40))
  {
    v7 = [*(id *)(a1 + 32) limitedToSource];

    v8 = [v5 source];
    v9 = v8;
    if (v7)
    {
      v10 = [v8 externalID];
      v11 = [*(id *)(a1 + 32) limitedToSource];
      v12 = [v11 externalID];
      uint64_t v13 = [v10 isEqualToString:v12];
    }
    else
    {
      uint64_t v13 = [v8 isDelegate] ^ 1;
    }
  }
  else
  {
    uint64_t v13 = 1;
  }

  return v13;
}

- (EKSource)limitedToSource
{
  return self->_limitedToSource;
}

- (NSArray)visibleCalendars
{
  return (NSArray *)[(EKCalendarVisibilityManager *)self _calendarsThatAreVisible:1 filteredByIdentity:1];
}

+ (NSArray)unselectedCalendarIdentifiersForFocusMode
{
  v2 = +[EKPreferences shared];
  v3 = [v2 unselectedCalendarIdentifiersForFocusMode];

  return (NSArray *)v3;
}

- (id)_calendarsThatAreVisible:(BOOL)a3 filteredByIdentity:(BOOL)a4
{
  BOOL v5 = a3;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  v7 = [(EKCalendarVisibilityManager *)self eventStore];
  v8 = [v7 calendarsForEntityType:0];

  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __75__EKCalendarVisibilityManager__calendarsThatAreVisible_filteredByIdentity___block_invoke;
  v38[3] = &unk_1E5B99928;
  BOOL v39 = a4;
  v38[4] = self;
  v9 = [MEMORY[0x1E4F28F60] predicateWithBlock:v38];
  v10 = [v8 filteredArrayUsingPredicate:v9];

  v28 = [(EKCalendarVisibilityManager *)self _deselectedCalendarIdentifiers];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v28];
  v29 = v8;
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  id v33 = (id)objc_claimAutoreleasedReturnValue();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v54 count:16];
  if (!v13)
  {
    uint64_t v30 = 0;
    uint64_t v31 = 0;
    uint64_t v32 = 0;
    uint64_t v15 = 0;
    goto LABEL_26;
  }
  uint64_t v14 = v13;
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = *(void *)v35;
  do
  {
    uint64_t v17 = 0;
    do
    {
      if (*(void *)v35 != v16) {
        objc_enumerationMutation(v12);
      }
      v18 = *(void **)(*((void *)&v34 + 1) + 8 * v17);
      v19 = [v18 calendarIdentifier];
      if (v19)
      {
        if ([v11 containsObject:v19])
        {
          if (v5) {
            goto LABEL_18;
          }
        }
        else if (!v5)
        {
          goto LABEL_18;
        }
        [v33 addObject:v18];
        if ([v18 isHolidayCalendar])
        {
          ++v15;
        }
        else if ([v18 type] == 5 || objc_msgSend(v18, "isSuggestedEventCalendar"))
        {
          ++v32;
        }
        else if ([v18 type] == 4)
        {
          ++v30;
        }
        else
        {
          ++v31;
        }
      }
      else
      {
        v20 = EKLogHandle;
        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v41 = (uint64_t)v18;
          _os_log_error_impl(&dword_1A4E47000, v20, OS_LOG_TYPE_ERROR, "No calendar identifier found.  Will not be able to find all visible calendars.  Calendar: [%@]", buf, 0xCu);
        }
      }
LABEL_18:

      ++v17;
    }
    while (v14 != v17);
    uint64_t v21 = [v12 countByEnumeratingWithState:&v34 objects:v54 count:16];
    uint64_t v14 = v21;
  }
  while (v21);
LABEL_26:

  v22 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    v23 = v22;
    uint64_t v24 = [v33 count];
    if (v5) {
      v25 = @"visibleCalendars";
    }
    else {
      v25 = @"invisibleCalendars";
    }
    uint64_t v26 = [v29 count];
    *(_DWORD *)buf = 134219522;
    uint64_t v41 = v24;
    __int16 v42 = 2112;
    v43 = v25;
    __int16 v44 = 2048;
    uint64_t v45 = v26;
    __int16 v46 = 2048;
    uint64_t v47 = v15;
    __int16 v48 = 2048;
    uint64_t v49 = v32;
    __int16 v50 = 2048;
    uint64_t v51 = v30;
    __int16 v52 = 2048;
    uint64_t v53 = v31;
    _os_log_impl(&dword_1A4E47000, v23, OS_LOG_TYPE_DEFAULT, "Returning [%lu] %@ of [%lu] calendars: [%ld] holiday [%ld] suggestion [%ld] birthday [%ld] other", buf, 0x48u);
  }

  return v33;
}

- (EKEventStore)eventStore
{
  return self->_eventStore;
}

- (id)_deselectedCalendarIdentifiers
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(id)objc_opt_class() deselectedCalendarIdentifiers];
  if (v3)
  {
    v4 = (void *)v3;
    BOOL v5 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v5;
      *(_DWORD *)buf = 134218242;
      uint64_t v38 = [v4 count];
      __int16 v39 = 2112;
      v40 = v4;
      _os_log_impl(&dword_1A4E47000, v6, OS_LOG_TYPE_DEFAULT, "Returning [%lu] stored deselectedCalendarIdentifiers: %@", buf, 0x16u);
    }
    id v7 = v4;
    v8 = v7;
  }
  else
  {
    v9 = +[EKPreferences shared];
    v10 = [v9 selectedCalendarIdentifiers];

    v11 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
    {
      id v12 = v11;
      *(_DWORD *)buf = 134217984;
      uint64_t v38 = [v10 count];
      _os_log_impl(&dword_1A4E47000, v12, OS_LOG_TYPE_INFO, "Store contains [%lu] selectedCalendarIdentifiers", buf, 0xCu);
    }
    if (v10)
    {
      uint64_t v31 = v10;
      uint64_t v13 = [(EKCalendarVisibilityManager *)self eventStore];
      uint64_t v14 = [v13 calendarsForEntityType:0];

      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v16 = v14;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v33 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            v22 = [v21 calendarIdentifier];
            if (v22)
            {
              [v15 addObject:v22];
            }
            else
            {
              v23 = EKLogHandle;
              if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v38 = (uint64_t)v21;
                _os_log_error_impl(&dword_1A4E47000, v23, OS_LOG_TYPE_ERROR, "No calendar identifier found.  Will not be able get all deselected calendar identifiers.  Calendar: [%@]", buf, 0xCu);
              }
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
        }
        while (v18);
      }

      v10 = v31;
      uint64_t v24 = [MEMORY[0x1E4F1CAD0] setWithArray:v31];
      [v15 minusSet:v24];
      v25 = [v15 allObjects];
      uint64_t v26 = (void *)EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        v27 = v26;
        uint64_t v28 = [v25 count];
        *(_DWORD *)buf = 134218242;
        uint64_t v38 = v28;
        __int16 v39 = 2112;
        v40 = v25;
        _os_log_impl(&dword_1A4E47000, v27, OS_LOG_TYPE_DEFAULT, "Returning [%lu] computed deselectedCalendarIdentifiers: %@", buf, 0x16u);
      }
      id v7 = v25;

      v8 = v7;
    }
    else
    {
      v29 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4E47000, v29, OS_LOG_TYPE_DEFAULT, "Returning [0] deselectedCalendarIdentifiers: deselected and selected are nil", buf, 2u);
      }
      id v7 = 0;
      v8 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }

  return v8;
}

+ (NSArray)deselectedCalendarIdentifiers
{
  v2 = +[EKPreferences shared];
  uint64_t v3 = [v2 deselectedCalendarIdentifiers];

  return (NSArray *)v3;
}

+ (NSString)focusModeConfigurationChangedName
{
  return (NSString *)@"com.apple.eventkit.preference.notification.UnselectedCalendarIdentifiersForFocusMode";
}

- (EKCalendarVisibilityManager)initWithEventStore:(id)a3 limitedToSource:(id)a4 visibilityChangedCallback:(id)a5 queue:(id)a6
{
  return [(EKCalendarVisibilityManager *)self initWithEventStore:a3 limitedToSource:a4 visibilityChangedCallback:a5 queue:a6 activate:1];
}

- (NSArray)invisibleCalendars
{
  return (NSArray *)[(EKCalendarVisibilityManager *)self _calendarsThatAreVisible:0 filteredByIdentity:1];
}

- (NSArray)invisibleCalendarsForAllIdentities
{
  return (NSArray *)[(EKCalendarVisibilityManager *)self _calendarsThatAreVisible:0 filteredByIdentity:0];
}

- (void)deactivate
{
  [(EKCalendarVisibilityManager *)self setActive:0];
  id v3 = [(EKCalendarVisibilityManager *)self notificationListener];
  [v3 deactivate];
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (CalDarwinNotificationListener)notificationListener
{
  return self->_notificationListener;
}

- (void)dealloc
{
  [(EKCalendarVisibilityManager *)self deactivate];
  v3.receiver = self;
  v3.super_class = (Class)EKCalendarVisibilityManager;
  [(EKCalendarVisibilityManager *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationListener, 0);
  objc_storeStrong(&self->_visibilityChangedCallback, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);

  objc_storeStrong((id *)&self->_limitedToSource, 0);
}

void __44__EKCalendarVisibilityManager__defaultQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("EKCalendarVisibilityManagerDefaultQ", v2);
  v1 = (void *)_defaultQueue_queue;
  _defaultQueue_queue = (uint64_t)v0;
}

- (EKCalendarVisibilityManager)initWithEventStore:(id)a3 limitedToSource:(id)a4 visibilityChangedCallback:(id)a5 queue:(id)a6 activate:(BOOL)a7
{
  BOOL v7 = a7;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v32.receiver = self;
  v32.super_class = (Class)EKCalendarVisibilityManager;
  uint64_t v17 = [(EKCalendarVisibilityManager *)&v32 init];
  uint64_t v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_eventStore, a3);
    uint64_t v19 = MEMORY[0x1A6266730](v15);
    id visibilityChangedCallback = v18->_visibilityChangedCallback;
    v18->_id visibilityChangedCallback = (id)v19;

    objc_storeStrong((id *)&v18->_limitedToSource, a4);
    if (v16)
    {
      if (!v15) {
        goto LABEL_9;
      }
    }
    else
    {
      id v16 = [(id)objc_opt_class() _defaultQueue];
      if (!v15) {
        goto LABEL_9;
      }
    }
    objc_initWeak(&location, v18);
    id v21 = objc_alloc(MEMORY[0x1E4F576C0]);
    v22 = [(id)objc_opt_class() visibilityChangedNotificationName];
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    uint64_t v28 = __107__EKCalendarVisibilityManager_initWithEventStore_limitedToSource_visibilityChangedCallback_queue_activate___block_invoke;
    v29 = &unk_1E5B96DE0;
    objc_copyWeak(&v30, &location);
    uint64_t v23 = [v21 initWithNotificationName:v22 callback:&v26 queue:v16];
    notificationListener = v18->_notificationListener;
    v18->_notificationListener = (CalDarwinNotificationListener *)v23;

    if (v7) {
      [(EKCalendarVisibilityManager *)v18 activate];
    }
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
LABEL_9:

  return v18;
}

+ (id)_defaultQueue
{
  if (_defaultQueue_onceToken != -1) {
    dispatch_once(&_defaultQueue_onceToken, &__block_literal_global_75);
  }
  v2 = (void *)_defaultQueue_queue;

  return v2;
}

- (EKCalendarVisibilityManager)initWithEventStore:(id)a3 visibilityChangedCallback:(id)a4 queue:(id)a5
{
  return [(EKCalendarVisibilityManager *)self initWithEventStore:a3 limitedToSource:0 visibilityChangedCallback:a4 queue:a5 activate:1];
}

void __107__EKCalendarVisibilityManager_initWithEventStore_limitedToSource_visibilityChangedCallback_queue_activate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && [WeakRetained active])
  {
    objc_super v3 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
      __107__EKCalendarVisibilityManager_initWithEventStore_limitedToSource_visibilityChangedCallback_queue_activate___block_invoke_cold_1((uint64_t)v2, v3);
    }
    v4 = [v2 visibilityChangedCallback];
    v4[2]();
  }
}

- (void)activate
{
  [(EKCalendarVisibilityManager *)self setActive:1];
  id v3 = [(EKCalendarVisibilityManager *)self notificationListener];
  [v3 activate];
}

- (NSArray)visibleCalendarsForAllIdentities
{
  return (NSArray *)[(EKCalendarVisibilityManager *)self _calendarsThatAreVisible:1 filteredByIdentity:0];
}

+ (void)setUnselectedCalendarIdentifiersForFocusMode:(id)a3
{
  id v3 = a3;
  id v4 = +[EKPreferences shared];
  [v4 setUnselectedCalendarIdentifiersForFocusMode:v3];
}

+ (id)unselectedCalendarsForFocusModeInEventStore:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [a1 unselectedCalendarIdentifiersForFocusMode];
  if (v5)
  {
    id v6 = [v4 calendarsWithIdentifiers:v5];
    BOOL v7 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
    v8 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      int v12 = 134218242;
      uint64_t v13 = [v7 count];
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_1A4E47000, v9, OS_LOG_TYPE_DEFAULT, "Returning [%lu] unselectedCalendarsForFocusMode: %@", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    v10 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1A4E47000, v10, OS_LOG_TYPE_DEFAULT, "Returning [0] unselectedCalendarsForFocusMode: nil", (uint8_t *)&v12, 2u);
    }
    BOOL v7 = 0;
  }

  return v7;
}

+ (id)reminderCalendarInEventStore:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 calendarsForEntityType:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    BOOL v7 = 0;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 type] == 6)
        {
          id v11 = v10;

          BOOL v7 = v11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (NSString)visibilityChangedNotificationName
{
  return (NSString *)@"com.apple.eventkit.preference.notification.deselectedCalendarIdentifiers";
}

- (EKCalendarVisibilityManager)initWithEventStore:(id)a3 visibilityChangedCallback:(id)a4
{
  return [(EKCalendarVisibilityManager *)self initWithEventStore:a3 limitedToSource:0 visibilityChangedCallback:a4 queue:0 activate:1];
}

- (EKCalendarVisibilityManager)initWithEventStore:(id)a3 limitedToSource:(id)a4 visibilityChangedCallback:(id)a5
{
  return [(EKCalendarVisibilityManager *)self initWithEventStore:a3 limitedToSource:a4 visibilityChangedCallback:a5 queue:0 activate:1];
}

- (id)visibilityChangedCallback
{
  return self->_visibilityChangedCallback;
}

- (BOOL)active
{
  return self->_active;
}

void __107__EKCalendarVisibilityManager_initWithEventStore_limitedToSource_visibilityChangedCallback_queue_activate___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A4E47000, a2, OS_LOG_TYPE_DEBUG, "Underlying calendar visibility preferences changed.  Notifying client of [%@]", (uint8_t *)&v2, 0xCu);
}

@end