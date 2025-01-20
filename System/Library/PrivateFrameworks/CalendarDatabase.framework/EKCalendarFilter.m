@interface EKCalendarFilter
+ (void)_addCalendarUIDsFromPrefs:(id)a3 toSet:(id)a4 database:(CalDatabase *)a5;
+ (void)_addCalendarWithUID:(id)a3 toSet:(id)a4 database:(CalDatabase *)a5;
+ (void)_addCalendarsForStoreWithUID:(id)a3 toSet:(id)a4 database:(CalDatabase *)a5;
- (BOOL)_isFilteringAllWhileLocked;
- (BOOL)includeDisabledStores;
- (BOOL)isCalendarUIDVisible:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFilteringAll;
- (BOOL)isShowingAll;
- (EKCalendarFilter)initWithDatabase:(CalDatabase *)a3;
- (EKCalendarFilter)initWithDatabase:(CalDatabase *)a3 entityType:(int)a4;
- (EKCalendarFilter)initWithDatabase:(CalDatabase *)a3 entityType:(int)a4 calendarUIDs:(id)a5;
- (EKCalendarFilter)initWithDatabase:(CalDatabase *)a3 entityType:(int)a4 filteringCalendars:(id)a5;
- (EKCalendarFilter)initWithDatabase:(CalDatabase *)a3 entityType:(int)a4 filteringCalendarsWithUIDs:(id)a5;
- (EKCalendarFilter)initWithDatabase:(CalDatabase *)a3 entityType:(int)a4 showingCalendarsWithUIDs:(id)a5;
- (EKCalendarFilter)initWithDatabase:(CalDatabase *)a3 showingCalendars:(id)a4;
- (EKCalendarFilter)initWithDatabase:(CalDatabase *)a3 showingCalendarsWithUIDs:(id)a4;
- (NSString)searchTerm;
- (id)_UIDAntiSetWithCalendars:(id)a3;
- (id)_UIDSetWithCalendars:(id)a3;
- (id)_addFilterToQuery:(id)a3 creator:(void *)a4 userInfo:(void *)a5;
- (id)_generateUIDSetToFilterAllCalendars;
- (id)_generateUIDSetToFilterCalendars:(id)a3;
- (id)_generateUIDSetToShowCalendarUIDs:(id)a3;
- (id)_generateUIDSetToShowCalendars:(id)a3;
- (id)_visibleCalendarsWithOptions:(int)a3;
- (id)calendarIDClauseForQueryWithVariableName:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)filterQueryForKey:(id)a3 prefix:(id)a4 whereClause:(id)a5 creator:(void *)a6 userInfo:(void *)a7;
- (id)filterQueryForQueryString:(id)a3 creator:(void *)a4 userInfo:(void *)a5;
- (id)filteredCalendars;
- (id)initFilteringAllWithDatabase:(CalDatabase *)a3;
- (id)visibleCalendarsWithOptions:(int)a3;
- (int)visibleCalendarCountWithOptions:(int)a3;
- (void)dealloc;
- (void)removeCalendarWithUID:(id)a3;
- (void)setIncludeDisabledStores:(BOOL)a3;
- (void)setSearchTerm:(id)a3;
- (void)validate;
@end

@implementation EKCalendarFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_storeStrong((id *)&self->_calendarUIDs, 0);
}

- (id)_UIDAntiSetWithCalendars:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        CFTypeRef Store = _CalCalendarGetStore(v11);
        if (!Store
          || (uint64_t v13 = (uint64_t)Store, !_CalStoreIsEnabled((uint64_t)Store))
          || self->_entityType == 2 && !_CalStoreAllowsEvents(v13)
          || _CalCalendarIsHidden(v11)
          || (_CalCalendarCanContainEntityType(v11, self->_entityType) & 1) == 0)
        {
          v14 = objc_msgSend(NSNumber, "numberWithInt:", CPRecordGetID(), (void)v16);
          [v5 addObject:v14];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_UIDSetWithCalendars:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        if (_CalCalendarCanContainEntityType(*(void *)(*((void *)&v13 + 1) + 8 * i), self->_entityType))
        {
          uint64_t v11 = objc_msgSend(NSNumber, "numberWithInt:", CPRecordGetID(), (void)v13);
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (EKCalendarFilter)initWithDatabase:(CalDatabase *)a3 entityType:(int)a4 filteringCalendarsWithUIDs:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  uint64_t v9 = [(EKCalendarFilter *)self initWithDatabase:a3 entityType:v5 calendarUIDs:0];
  if (v9)
  {
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v8];
    calendarUIDs = v9->_calendarUIDs;
    v9->_calendarUIDs = (NSMutableSet *)v10;
  }
  return v9;
}

- (EKCalendarFilter)initWithDatabase:(CalDatabase *)a3 entityType:(int)a4 showingCalendarsWithUIDs:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  uint64_t v9 = [(EKCalendarFilter *)self initWithDatabase:a3 entityType:v5 calendarUIDs:0];
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = [(EKCalendarFilter *)v9 _generateUIDSetToShowCalendarUIDs:v8];
    calendarUIDs = v10->_calendarUIDs;
    v10->_calendarUIDs = (NSMutableSet *)v11;
  }
  return v10;
}

- (EKCalendarFilter)initWithDatabase:(CalDatabase *)a3 showingCalendarsWithUIDs:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(EKCalendarFilter *)self initWithDatabase:a3 entityType:2 calendarUIDs:0];
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = [(EKCalendarFilter *)v7 _generateUIDSetToShowCalendarUIDs:v6];
    calendarUIDs = v8->_calendarUIDs;
    v8->_calendarUIDs = (NSMutableSet *)v9;
  }
  return v8;
}

- (EKCalendarFilter)initWithDatabase:(CalDatabase *)a3 entityType:(int)a4 calendarUIDs:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)EKCalendarFilter;
  uint64_t v9 = [(EKCalendarFilter *)&v14 init];
  uint64_t v10 = v9;
  if (v9)
  {
    v9->_lock.__sig = 850045863;
    *(_OWORD *)v9->_lock.__opaque = 0u;
    *(_OWORD *)&v9->_lock.__opaque[16] = 0u;
    *(_OWORD *)&v9->_lock.__opaque[32] = 0u;
    *(void *)&v9->_lock.__opaque[48] = 0;
    v9->_database = (CalDatabase *)CFRetain(a3);
    uint64_t v11 = [v8 mutableCopy];
    calendarUIDs = v10->_calendarUIDs;
    v10->_calendarUIDs = (NSMutableSet *)v11;

    v10->_entityType = a4;
  }

  return v10;
}

- (id)filterQueryForQueryString:(id)a3 creator:(void *)a4 userInfo:(void *)a5
{
  p_lock = &self->_lock;
  id v9 = a3;
  pthread_mutex_lock(p_lock);
  uint64_t v10 = [(EKCalendarFilter *)self _addFilterToQuery:v9 creator:a4 userInfo:a5];

  pthread_mutex_unlock(p_lock);
  return v10;
}

- (id)_generateUIDSetToShowCalendarUIDs:(id)a3
{
  id v4 = a3;
  if (CalDatabaseLockForThread((os_unfair_lock_s *)self->_database))
  {
    uint64_t v5 = _CalDatabaseCopyOfAllCalendarsInStoreWithOptions((uint64_t)self->_database, 0, 0);
    id v6 = [(EKCalendarFilter *)self _UIDSetWithCalendars:v5];
    [v6 minusSet:v4];
    CalDatabaseUnlockForThread((const os_unfair_lock *)self->_database);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_addFilterToQuery:(id)a3 creator:(void *)a4 userInfo:(void *)a5
{
  uint64_t v5 = (void *)((uint64_t (*)(EKCalendarFilter *, CalDatabase *, id, void *))a4)(self, self->_database, a3, a5);
  return v5;
}

- (BOOL)includeDisabledStores
{
  return self->_includeDisabledStores;
}

- (id)calendarIDClauseForQueryWithVariableName:(id)a3
{
  id v4 = a3;
  if ([(NSMutableSet *)self->_calendarUIDs count])
  {
    if ([(EKCalendarFilter *)self _isFilteringAllWhileLocked])
    {
      uint64_t v5 = [NSString stringWithFormat:@"%@ in ()", v4];
    }
    else
    {
      id v6 = _CalDatabaseCopyOfAllCalendarsInStoreWithOptions((uint64_t)self->_database, 0, 2);
      uint64_t v7 = [(EKCalendarFilter *)self _UIDSetWithCalendars:v6];
      id v8 = v7;
      if (v7 && ![v7 isSubsetOfSet:self->_calendarUIDs])
      {
        id v9 = _CalDatabaseCopyOfAllCalendarsInStoreWithOptions((uint64_t)self->_database, 0, 0);
        uint64_t v10 = [(EKCalendarFilter *)self _UIDAntiSetWithCalendars:v9];
        [v10 unionSet:self->_calendarUIDs];
        [v8 minusSet:self->_calendarUIDs];
        unint64_t v11 = [v10 count];
        if (v11 >= [v8 count])
        {
          if ([v8 count] == 1)
          {
            objc_super v14 = NSString;
            long long v13 = [v8 anyObject];
            [v14 stringWithFormat:@"%@ = %@", v4, v13];
          }
          else
          {
            long long v15 = [v8 allObjects];
            long long v13 = [v15 componentsJoinedByString:@","];

            [NSString stringWithFormat:@"%@ IN (%@)", v4, v13];
          }
        }
        else
        {
          v12 = [v10 allObjects];
          long long v13 = [v12 componentsJoinedByString:@","];

          [NSString stringWithFormat:@"%@ NOT IN (%@)", v4, v13];
        uint64_t v5 = };
      }
      else
      {
        uint64_t v5 = [NSString stringWithFormat:@"%@ IN ()", v4];
      }
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)_isFilteringAllWhileLocked
{
  v2 = self;
  v3 = _CalDatabaseCopyOfAllCalendarsInStoreWithOptions((uint64_t)self->_database, 0, 2);
  id v4 = [(EKCalendarFilter *)v2 _UIDSetWithCalendars:v3];
  [v4 minusSet:v2->_calendarUIDs];
  LOBYTE(v2) = [v4 count] == 0;

  return (char)v2;
}

- (id)_visibleCalendarsWithOptions:(int)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = _CalDatabaseCopyOfAllCalendarsInStoreWithOptions((uint64_t)self->_database, 0, a3 | 2u);
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v4;
    uint64_t v7 = [(__CFArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          if (_CalCalendarCanContainEntityTypeAndStoreAllowsIt(v11, 2))
          {
            v12 = objc_msgSend(NSNumber, "numberWithInt:", CPRecordGetID(), (void)v14);
            if (([(NSMutableSet *)self->_calendarUIDs containsObject:v12] & 1) == 0) {
              [v5 addObject:v11];
            }
          }
        }
        uint64_t v8 = [(__CFArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_lock);
  database = self->_database;
  if (database) {
    CFRelease(database);
  }
  v4.receiver = self;
  v4.super_class = (Class)EKCalendarFilter;
  [(EKCalendarFilter *)&v4 dealloc];
}

- (EKCalendarFilter)initWithDatabase:(CalDatabase *)a3
{
  return [(EKCalendarFilter *)self initWithDatabase:a3 entityType:2 calendarUIDs:0];
}

- (EKCalendarFilter)initWithDatabase:(CalDatabase *)a3 entityType:(int)a4
{
  return [(EKCalendarFilter *)self initWithDatabase:a3 entityType:*(void *)&a4 calendarUIDs:0];
}

- (id)initFilteringAllWithDatabase:(CalDatabase *)a3
{
  v3 = [(EKCalendarFilter *)self initWithDatabase:a3 entityType:2 calendarUIDs:0];
  objc_super v4 = v3;
  if (v3)
  {
    uint64_t v5 = [(EKCalendarFilter *)v3 _generateUIDSetToFilterAllCalendars];
    calendarUIDs = v4->_calendarUIDs;
    v4->_calendarUIDs = (NSMutableSet *)v5;
  }
  return v4;
}

- (EKCalendarFilter)initWithDatabase:(CalDatabase *)a3 showingCalendars:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(EKCalendarFilter *)self initWithDatabase:a3 entityType:2 calendarUIDs:0];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [(EKCalendarFilter *)v7 _generateUIDSetToShowCalendars:v6];
    calendarUIDs = v8->_calendarUIDs;
    v8->_calendarUIDs = (NSMutableSet *)v9;
  }
  return v8;
}

- (EKCalendarFilter)initWithDatabase:(CalDatabase *)a3 entityType:(int)a4 filteringCalendars:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  uint64_t v9 = [(EKCalendarFilter *)self initWithDatabase:a3 entityType:v5 calendarUIDs:0];
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = [(EKCalendarFilter *)v9 _generateUIDSetToFilterCalendars:v8];
    calendarUIDs = v10->_calendarUIDs;
    v10->_calendarUIDs = (NSMutableSet *)v11;
  }
  return v10;
}

- (BOOL)isShowingAll
{
  return [(NSMutableSet *)self->_calendarUIDs count] == 0;
}

- (BOOL)isFilteringAll
{
  int v3 = CalDatabaseLockForThread((os_unfair_lock_s *)self->_database);
  if (v3)
  {
    BOOL v4 = [(EKCalendarFilter *)self _isFilteringAllWhileLocked];
    CalDatabaseUnlockForThread((const os_unfair_lock *)self->_database);
    LOBYTE(v3) = v4;
  }
  return v3;
}

- (id)_generateUIDSetToShowCalendars:(id)a3
{
  id v4 = a3;
  if (CalDatabaseLockForThread((os_unfair_lock_s *)self->_database))
  {
    uint64_t v5 = [(EKCalendarFilter *)self _UIDSetWithCalendars:v4];
    id v6 = _CalDatabaseCopyOfAllCalendarsInStoreWithOptions((uint64_t)self->_database, 0, 0);
    uint64_t v7 = [(EKCalendarFilter *)self _UIDSetWithCalendars:v6];
    [v7 minusSet:v5];
    CalDatabaseUnlockForThread((const os_unfair_lock *)self->_database);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)_generateUIDSetToFilterCalendars:(id)a3
{
  id v4 = a3;
  if (CalDatabaseLockForThread((os_unfair_lock_s *)self->_database))
  {
    uint64_t v5 = [(EKCalendarFilter *)self _UIDSetWithCalendars:v4];
    CalDatabaseUnlockForThread((const os_unfair_lock *)self->_database);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_generateUIDSetToFilterAllCalendars
{
  if (CalDatabaseLockForThread((os_unfair_lock_s *)self->_database))
  {
    int v3 = _CalDatabaseCopyOfAllCalendarsInStoreWithOptions((uint64_t)self->_database, 0, 0);
    id v4 = [(EKCalendarFilter *)self _UIDSetWithCalendars:v3];
    CalDatabaseUnlockForThread((const os_unfair_lock *)self->_database);
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)filteredCalendars
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
  if (CalDatabaseLockForThread((os_unfair_lock_s *)self->_database))
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = self->_calendarUIDs;
    uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          RecordCFTypeRef Store = _CalDatabaseGetRecordStore((uint64_t)self->_database);
          objc_msgSend(v9, "intValue", (void)v13);
          uint64_t CalendarWithUID = _CalGetCalendarWithUID(RecordStore);
          if (CalendarWithUID) {
            [v3 addObject:CalendarWithUID];
          }
        }
        uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }

    CalDatabaseUnlockForThread((const os_unfair_lock *)self->_database);
  }
  return v3;
}

- (id)visibleCalendarsWithOptions:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  os_unfair_lock_lock(&self->_database->var9);
  uint64_t v5 = [(EKCalendarFilter *)self _visibleCalendarsWithOptions:v3];
  p_var9 = &self->_database->var9;
  if (CDBLockingAssertionsEnabled) {
    os_unfair_lock_assert_owner(p_var9);
  }
  os_unfair_lock_unlock(p_var9);
  return v5;
}

- (int)visibleCalendarCountWithOptions:(int)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = CalDatabaseCopyOfAllCalendarsInStoreWithOptions(self->_database, 0, a3 | 2u);
  uint64_t v5 = v4;
  if (v4)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = v4;
    uint64_t v7 = [(__CFArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      int v9 = 0;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v6);
          }
          if (CalCalendarCanContainEntityTypeAndStoreAllowsIt(*(void *)(*((void *)&v14 + 1) + 8 * i), 2))
          {
            v12 = objc_msgSend(NSNumber, "numberWithInt:", CalCalendarGetUID(), (void)v14);
            v9 += [(NSMutableSet *)self->_calendarUIDs containsObject:v12] ^ 1;
          }
        }
        uint64_t v8 = [(__CFArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
    else
    {
      int v9 = 0;
    }
  }
  else
  {
    int v9 = 0;
  }

  return v9;
}

- (BOOL)isCalendarUIDVisible:(id)a3
{
  id v4 = a3;
  if ([(EKCalendarFilter *)self isShowingAll]) {
    LOBYTE(v5) = 1;
  }
  else {
    int v5 = [(NSMutableSet *)self->_calendarUIDs containsObject:v4] ^ 1;
  }

  return v5;
}

- (void)removeCalendarWithUID:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [EKCalendarFilter alloc];
  uint64_t entityType = self->_entityType;
  calendarUIDs = self->_calendarUIDs;
  database = self->_database;
  return [(EKCalendarFilter *)v4 initWithDatabase:database entityType:entityType calendarUIDs:calendarUIDs];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(NSMutableSet *)self->_calendarUIDs count];
    if (v6 == [*((id *)v5 + 9) count])
    {
      searchTerm = self->_searchTerm;
      uint64_t v8 = *((void *)v5 + 11);
      if (searchTerm)
      {
        if (v8 && -[NSString isEqualToString:](searchTerm, "isEqualToString:"))
        {
LABEL_6:
          calendarUIDs = self->_calendarUIDs;
          uint64_t v10 = *((void *)v5 + 9);
          char v11 = ((unint64_t)calendarUIDs | v10) == 0;
          if (calendarUIDs && v10) {
            char v11 = -[NSMutableSet isEqual:](calendarUIDs, "isEqual:");
          }
          goto LABEL_12;
        }
      }
      else if (!v8)
      {
        goto LABEL_6;
      }
    }
    char v11 = 0;
LABEL_12:

    goto LABEL_13;
  }
  char v11 = 0;
LABEL_13:

  return v11;
}

+ (void)_addCalendarWithUID:(id)a3 toSet:(id)a4 database:(CalDatabase *)a5
{
  id v10 = a3;
  id v7 = a4;
  [v10 intValue];
  uint64_t v8 = CalDatabaseCopyCalendarWithUID((os_unfair_lock_s *)a5);
  if (v8)
  {
    int v9 = v8;
    if (!CalCalendarIsHidden((uint64_t)v8)) {
      [v7 addObject:v10];
    }
    CFRelease(v9);
  }
}

+ (void)_addCalendarUIDsFromPrefs:(id)a3 toSet:(id)a4 database:(CalDatabase *)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v15 + 1) + 8 * v13);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [a1 _addCalendarWithUID:v14 toSet:v9 database:a5];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

+ (void)_addCalendarsForStoreWithUID:(id)a3 toSet:(id)a4 database:(CalDatabase *)a5
{
  id v16 = a4;
  [a3 intValue];
  id v7 = CalDatabaseCopyStoreWithUID((os_unfair_lock_s *)a5);
  if (v7)
  {
    id v8 = v7;
    CFArrayRef v9 = CalStoreCopyCalendars((uint64_t)v7);
    if (v9)
    {
      CFArrayRef v10 = v9;
      CFIndex Count = CFArrayGetCount(v9);
      if (Count >= 1)
      {
        CFIndex v12 = Count;
        for (CFIndex i = 0; i != v12; ++i)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v10, i);
          if (!CalCalendarIsHidden((uint64_t)ValueAtIndex)
            && CalCalendarCanContainEntityTypeAndStoreAllowsIt((uint64_t)ValueAtIndex, 2))
          {
            long long v15 = [NSNumber numberWithInt:CalCalendarGetUID()];
            [v16 addObject:v15];
          }
        }
      }
      CFRelease(v10);
    }
    CFRelease(v8);
  }
}

- (void)validate
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableSet *)self->_calendarUIDs count])
  {
    uint64_t v3 = (void *)[(NSMutableSet *)self->_calendarUIDs copy];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (!v5) {
      goto LABEL_16;
    }
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    while (1)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        CFArrayRef v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        database = self->_database;
        objc_msgSend(v9, "intValue", (void)v16);
        uint64_t v11 = CalDatabaseCopyCalendarWithUID((os_unfair_lock_s *)database);
        if (!v11) {
          goto LABEL_13;
        }
        CFIndex v12 = v11;
        if (CalCalendarIsHidden((uint64_t)v11) || (CFTypeRef v13 = CalCalendarCopyStore((uint64_t)v12)) == 0)
        {
          CFRelease(v12);
LABEL_13:
          [(NSMutableSet *)self->_calendarUIDs removeObject:v9];
          continue;
        }
        uint64_t v14 = v13;
        BOOL IsEnabled = CalStoreIsEnabled((uint64_t)v13);
        CFRelease(v14);
        CFRelease(v12);
        if (!IsEnabled) {
          goto LABEL_13;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (!v6)
      {
LABEL_16:

        return;
      }
    }
  }
}

- (id)filterQueryForKey:(id)a3 prefix:(id)a4 whereClause:(id)a5 creator:(void *)a6 userInfo:(void *)a7
{
  id v11 = a4;
  id v12 = a5;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  uint64_t v14 = (void *)((uint64_t (*)(EKCalendarFilter *, CalDatabase *, void *))a6)(self, self->_database, a7);
  long long v15 = v14;
  if (!v12 || !v14)
  {
    if (!v14) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  if (![v14 length] || !objc_msgSend(v12, "length"))
  {
LABEL_7:
    if ([v15 length])
    {
      long long v17 = v15;
LABEL_12:
      long long v16 = (void *)[v17 copy];
      goto LABEL_13;
    }
LABEL_9:
    if (!v12 || ![v12 length])
    {
      long long v18 = 0;
      goto LABEL_17;
    }
    long long v17 = v12;
    goto LABEL_12;
  }
  long long v16 = (void *)[[NSString alloc] initWithFormat:@"%@ AND %@", v15, v12];
LABEL_13:
  long long v18 = v16;
  if (v16 && [v16 length])
  {
    uint64_t v19 = [NSString stringWithFormat:@"%@ WHERE %@", v11, v18];
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v19 = [v11 copy];
LABEL_18:
  uint64_t v20 = (void *)v19;
  pthread_mutex_unlock(p_lock);

  return v20;
}

- (NSString)searchTerm
{
  return self->_searchTerm;
}

- (void)setSearchTerm:(id)a3
{
}

- (void)setIncludeDisabledStores:(BOOL)a3
{
  self->_includeDisabledStores = a3;
}

@end