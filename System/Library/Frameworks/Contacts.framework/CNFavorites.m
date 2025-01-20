@interface CNFavorites
+ (id)favoritesPath;
+ (id)sharedInstance;
+ (void)flushSingleton;
- (BOOL)_isValueForEntry:(id)a3 equalToValue:(id)a4;
- (BOOL)addEntryForContact:(id)a3 propertyKey:(id)a4 withIdentifier:(id)a5;
- (BOOL)containsEntryWithType:(int64_t)a3 forContact:(id)a4 propertyKey:(id)a5 identifier:(id)a6;
- (BOOL)dirty;
- (BOOL)isFull;
- (BOOL)needsReload;
- (BOOL)shouldSimulateCrashReportForError:(id)a3;
- (BOOL)writeFavoritesToFile:(id)a3;
- (CNContactStore)contactStore;
- (CNFavorites)init;
- (CNFavorites)initWithContactStore:(id)a3;
- (CNFavorites)initWithContactStore:(id)a3 logger:(id)a4;
- (CNFavoritesLogger)logger;
- (NSArray)entries;
- (NSMutableDictionary)uidToEntry;
- (id)XPCDataMapper;
- (id)_entryDictionaries;
- (id)_uniqueRematchedEntries:(id)a3;
- (id)entriesForContact:(id)a3;
- (id)entriesForContact:(id)a3 propertyKey:(id)a4 labeledValueIdentifier:(id)a5 actionType:(id)a6 bundleIdentifier:(id)a7;
- (id)entryWithIdentifier:(id)a3 forContact:(id)a4;
- (id)entryWithType:(int64_t)a3 forContact:(id)a4 propertyKey:(id)a5 identifier:(id)a6;
- (unint64_t)postCount;
- (void)_addEntryToMap:(id)a3;
- (void)_entriesChangedExternally;
- (void)_postChangeNotification;
- (void)_removeEntryFromMap:(id)a3 withUid:(int)a4;
- (void)addEntry:(id)a3;
- (void)dealloc;
- (void)loadEntriesIfNecessary;
- (void)moveEntryAtIndex:(int64_t)a3 toIndex:(int64_t)a4;
- (void)registerForDistributedNotifications;
- (void)rematchEntriesWithOptions:(unint64_t)a3;
- (void)removeAllEntries;
- (void)removeEntryAtIndex:(int64_t)a3;
- (void)save;
- (void)setContactStore:(id)a3;
- (void)setDirty:(BOOL)a3;
- (void)setNeedsReload:(BOOL)a3;
- (void)setPostCount:(unint64_t)a3;
- (void)setUidToEntry:(id)a3;
- (void)unregisterForDistributedNotifications;
@end

@implementation CNFavorites

- (void)loadEntriesIfNecessary
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_entries)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:50];
    entries = v2->_entries;
    v2->_entries = (NSArray *)v3;
  }
  if (!v2->_uidToEntry)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:50];
    uidToEntry = v2->_uidToEntry;
    v2->_uidToEntry = (NSMutableDictionary *)v5;
  }
  if ([(CNFavorites *)v2 needsReload]
    && +[CNContactStore authorizationStatusForEntityType:0] == CNAuthorizationStatusAuthorized)
  {
    [(NSMutableDictionary *)v2->_uidToEntry removeAllObjects];
    [(CNFavorites *)v2 setNeedsReload:0];
    v19 = [(CNFavorites *)v2 _entryDictionaries];
    if ([v19 count])
    {
      v7 = objc_opt_new();
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v8 = v19;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v21;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v21 != v10) {
              objc_enumerationMutation(v8);
            }
            uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * v11);
            v13 = [CNFavoritesEntry alloc];
            v14 = [(CNFavorites *)v2 contactStore];
            v15 = [(CNFavoritesEntry *)v13 initWithDictionaryRepresentation:v12 store:v14];

            [v7 addObject:v15];
            [(CNFavorites *)v2 _addEntryToMap:v15];

            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v9);
      }

      uint64_t v16 = [v7 copy];
      v17 = v2->_entries;
      v2->_entries = (NSArray *)v16;
    }
    else
    {
      v18 = v2->_entries;
      v2->_entries = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
  }
  objc_sync_exit(v2);
}

- (void)setNeedsReload:(BOOL)a3
{
  self->_needsReload = a3;
}

- (BOOL)needsReload
{
  return self->_needsReload;
}

- (id)_entryDictionaries
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__36;
  uint64_t v11 = __Block_byref_object_dispose__36;
  id v12 = 0;
  uint64_t v3 = [(CNFavorites *)self logger];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__CNFavorites__entryDictionaries__block_invoke;
  v6[3] = &unk_1E56B6F00;
  v6[4] = self;
  v6[5] = &v7;
  [v3 readingFavorites:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (CNFavoritesLogger)logger
{
  return self->_logger;
}

- (CNFavorites)initWithContactStore:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[CNContactsEnvironment currentEnvironment];
  v6 = [v5 loggerProvider];
  uint64_t v7 = [v6 favoritesLogger];

  id v8 = [(CNFavorites *)self initWithContactStore:v4 logger:v7];
  return v8;
}

- (CNFavorites)initWithContactStore:(id)a3 logger:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNFavorites;
  uint64_t v9 = [(CNFavorites *)&v13 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contactStore, a3);
    objc_storeStrong((id *)&v10->_logger, a4);
    v10->_needsReload = 1;
    [(CNFavorites *)v10 registerForDistributedNotifications];
    uint64_t v11 = v10;
  }

  return v10;
}

- (void)registerForDistributedNotifications
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_handleFavoritesChangedExternally, @"CNFavoritesChangedExternallyNotification", 0, (CFNotificationSuspensionBehavior)1025);
}

- (void)dealloc
{
  [(CNFavorites *)self unregisterForDistributedNotifications];
  uint64_t v3 = [MEMORY[0x1E4F5A3B0] sharedInstance];
  [v3 removeUnlockHandlerWithIdentifier:@"CNFavorites"];

  v4.receiver = self;
  v4.super_class = (Class)CNFavorites;
  [(CNFavorites *)&v4 dealloc];
}

- (void)unregisterForDistributedNotifications
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"CNFavoritesChangedExternallyNotification", 0);
}

- (NSArray)entries
{
  [(CNFavorites *)self loadEntriesIfNecessary];
  uint64_t v3 = self;
  objc_sync_enter(v3);
  objc_super v4 = v3->_entries;
  objc_sync_exit(v3);

  return v4;
}

void __33__CNFavorites__entryDictionaries__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = [MEMORY[0x1E4F5A3B0] sharedInstance];
  char v5 = [v4 isUnlockedSinceBoot];

  if (v5)
  {
    v6 = +[CNFavorites favoritesPath];
    id v7 = [*(id *)(a1 + 32) XPCDataMapper];
    id v8 = v7;
    if (v7)
    {
      id v26 = 0;
      uint64_t v9 = [v7 favoritesEntryDictionariesAtPath:v6 error:&v26];
      id v10 = v26;
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v9;

      objc_super v13 = *(void **)(a1 + 32);
      uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      v15 = [v13 logger];
      uint64_t v16 = v15;
      if (v14) {
        [v15 finishedReadingRemoteFavorites];
      }
      else {
        [v15 failedToReadRemoteFavorites:v10];
      }
    }
    else
    {
      uint64_t v16 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6 isDirectory:0];
      id v25 = 0;
      uint64_t v19 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithContentsOfURL:v16 error:&v25];
      id v10 = v25;
      uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
      long long v21 = *(void **)(v20 + 40);
      *(void *)(v20 + 40) = v19;

      long long v22 = *(void **)(a1 + 32);
      if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
      {
        long long v23 = [v22 logger];
        objc_msgSend(v23, "finishedReadingFavoritesFromPath:entriesCount:", v6, objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "count"));
      }
      else
      {
        uint64_t v24 = [v22 shouldSimulateCrashReportForError:v10];
        long long v23 = [*(id *)(a1 + 32) logger];
        [v23 failedToReadFavoritesFromPath:v6 error:v10 simulateCrashReport:v24];
      }
    }
  }
  else
  {
    v17 = [*(id *)(a1 + 32) logger];
    [v17 reportFavoritesAccessedBeforeFirstUnlock];

    objc_initWeak(&location, *(id *)(a1 + 32));
    v18 = [MEMORY[0x1E4F5A3B0] sharedInstance];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __33__CNFavorites__entryDictionaries__block_invoke_2;
    v27[3] = &unk_1E56B8580;
    objc_copyWeak(&v28, &location);
    [v18 addUnlockHandlerWithIdentifier:@"CNFavorites" block:v27];

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
}

- (BOOL)shouldSimulateCrashReportForError:(id)a3
{
  id v3 = a3;
  objc_super v4 = v3;
  if (v3)
  {
    char v5 = [v3 domain];
    uint64_t v6 = *MEMORY[0x1E4F281F8];
    if ([v5 isEqualToString:*MEMORY[0x1E4F281F8]] && objc_msgSend(v4, "code") == 260)
    {
      BOOL v7 = 0;
    }
    else
    {
      id v8 = [v4 domain];
      if ([v8 isEqualToString:v6] && objc_msgSend(v4, "code") == 257)
      {
        BOOL v7 = 0;
      }
      else
      {
        uint64_t v9 = [v4 domain];
        if ([v9 isEqualToString:v6]) {
          BOOL v7 = [v4 code] != 513;
        }
        else {
          BOOL v7 = 1;
        }
      }
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)XPCDataMapper
{
  objc_opt_class();
  id v3 = [(CNFavorites *)self contactStore];
  if (objc_opt_isKindOfClass()) {
    objc_super v4 = v3;
  }
  else {
    objc_super v4 = 0;
  }
  id v5 = v4;

  if (v5) {
    [v5 XPCDataMapperStore];
  }
  else {
  uint64_t v6 = [(CNFavorites *)self contactStore];
  }
  objc_opt_class();
  id v7 = v6;
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  objc_opt_class();
  id v10 = [v9 mapper];

  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;

  return v12;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

+ (id)favoritesPath
{
  v2 = [(id)softLinkCPSharedResourcesDirectory() stringByAppendingPathComponent:@"Library/Preferences"];
  if ((favoritesPath_sCheckedForDir & 1) == 0)
  {
    id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    if (([v3 fileExistsAtPath:v2] & 1) == 0)
    {
      objc_super v4 = [v2 stringByDeletingLastPathComponent];
      if (([v3 fileExistsAtPath:v4] & 1) == 0) {
        mkdir((const char *)[v4 fileSystemRepresentation], 0x1C0u);
      }
      mkdir((const char *)[v2 fileSystemRepresentation], 0x1C0u);
    }
    favoritesPath_sCheckedForDir = 1;
  }
  id v5 = [v2 stringByAppendingPathComponent:@"com.apple.mobilephone.speeddial.plist"];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_uidToEntry, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);

  objc_storeStrong((id *)&self->_entries, 0);
}

+ (id)sharedInstance
{
  if (sFavoritesOnceToken != -1) {
    dispatch_once(&sFavoritesOnceToken, &__block_literal_global_14_2);
  }
  v2 = (void *)sFavorites;

  return v2;
}

void __29__CNFavorites_sharedInstance__block_invoke()
{
  v2 = objc_alloc_init(CNContactStore);
  v0 = [[CNFavorites alloc] initWithContactStore:v2];
  v1 = (void *)sFavorites;
  sFavorites = (uint64_t)v0;
}

+ (void)flushSingleton
{
  v2 = (void *)sFavorites;
  sFavorites = 0;

  sFavoritesOnceToken = 0;
}

- (CNFavorites)init
{
  id v3 = [(id)objc_opt_class() sharedInstance];

  return v3;
}

void __33__CNFavorites__entryDictionaries__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _postChangeNotification];
}

- (NSMutableDictionary)uidToEntry
{
  [(CNFavorites *)self loadEntriesIfNecessary];
  uidToEntry = self->_uidToEntry;

  return uidToEntry;
}

- (BOOL)isFull
{
  v2 = [(CNFavorites *)self entries];
  BOOL v3 = (unint64_t)[v2 count] > 0x31;

  return v3;
}

- (id)entriesForContact:(id)a3
{
  id v4 = a3;
  id v5 = [(CNFavorites *)self uidToEntry];

  if (v5)
  {
    uint64_t v6 = [(CNFavorites *)self uidToEntry];
    id v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "iOSLegacyIdentifier"));
    id v8 = [v6 objectForKeyedSubscript:v7];

    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [MEMORY[0x1E4F1C978] arrayWithArray:v8];
      }
      else {
      id v5 = [MEMORY[0x1E4F1C978] arrayWithObject:v8];
      }
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

- (BOOL)_isValueForEntry:(id)a3 equalToValue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 contactProperty];
  id v8 = [v7 value];
  char v9 = [v6 isEqualToString:v8];

  if (v9)
  {
    char v10 = 1;
  }
  else
  {
    uint64_t v11 = [v5 contactProperty];
    id v12 = [v11 key];
    int v13 = [v12 isEqualToString:@"phoneNumbers"];

    if (v13)
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F498A0];
      v15 = [v5 contactProperty];
      uint64_t v16 = [v15 value];
      v17 = [v14 abNormalizedPhoneNumberFromString:v16];

      v18 = [MEMORY[0x1E4F498A0] abNormalizedPhoneNumberFromString:v6];
      char v10 = [v17 isEqualToString:v18];
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (id)entriesForContact:(id)a3 propertyKey:(id)a4 labeledValueIdentifier:(id)a5 actionType:(id)a6 bundleIdentifier:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v37 = a5;
  id v39 = a6;
  id v34 = a7;
  id v32 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:50];
  v36 = v13;
  v15 = [(CNFavorites *)self entriesForContact:v13];
  if ([v15 count])
  {
    uint64_t v16 = 0;
    if (v14) {
      BOOL v17 = v37 == 0;
    }
    else {
      BOOL v17 = 1;
    }
    int v18 = !v17;
    int v33 = v18;
    while (1)
    {
      uint64_t v19 = [v15 objectAtIndexedSubscript:v16];
      if (v18)
      {
        id v38 = a5;
        uint64_t v20 = [v36 valueForKey:v14];
        long long v21 = +[CNLabeledValue labeledValueWithIdentifier:v37 inArray:v20];

        if (!v21)
        {
          a5 = v38;
          goto LABEL_31;
        }
        [v36 valueForKey:v14];
        v23 = long long v22 = v7;
        uint64_t v24 = +[CNLabeledValue labeledValueWithIdentifier:v37 inArray:v23];
        int v25 = [v24 iOSLegacyIdentifier];

        id v7 = v22;
        LODWORD(v24) = [v19 abIdentifier];

        BOOL v17 = v25 == v24;
        int v18 = v33;
        a5 = v38;
        if (!v17) {
          goto LABEL_31;
        }
      }
      if (v39)
      {
        v35 = [v19 actionType];
        if (!objc_msgSend(v39, "isEqualToString:"))
        {
LABEL_24:

          goto LABEL_31;
        }
      }
      if (!v14) {
        break;
      }
      a5 = [v19 contactProperty];
      id v7 = [a5 key];
      if ([v14 isEqual:v7])
      {
        if (!v34)
        {
          id v26 = v19;
          int v27 = 1;
          goto LABEL_22;
        }
LABEL_21:
        id v28 = v7;
        id v29 = a5;
        id v26 = v19;
        v30 = [v19 bundleIdentifier];
        int v27 = [v34 isEqualToString:v30];

        a5 = v29;
        id v7 = v28;
        if (v14)
        {
LABEL_22:
        }
        goto LABEL_26;
      }

      if (v39) {
        goto LABEL_24;
      }
LABEL_31:

      if (++v16 >= (unint64_t)[v15 count]) {
        goto LABEL_32;
      }
    }
    if (v34) {
      goto LABEL_21;
    }
    id v26 = v19;
    int v27 = 1;
LABEL_26:
    if (v39)
    {

      if ((v27 & 1) == 0) {
        goto LABEL_30;
      }
    }
    else if (!v27)
    {
LABEL_30:
      uint64_t v19 = v26;
      goto LABEL_31;
    }
    uint64_t v19 = v26;
    [v32 addObject:v26];
    goto LABEL_31;
  }
LABEL_32:

  return v32;
}

- (id)entryWithIdentifier:(id)a3 forContact:(id)a4
{
  id v4 = [(CNFavorites *)self entriesForContact:a4 propertyKey:0 labeledValueIdentifier:a3 actionType:0 bundleIdentifier:0];
  id v5 = [v4 firstObject];

  return v5;
}

- (id)entryWithType:(int64_t)a3 forContact:(id)a4 propertyKey:(id)a5 identifier:(id)a6
{
  id v6 = [(CNFavorites *)self entriesForContact:a4 propertyKey:a5 labeledValueIdentifier:a6 actionType:0 bundleIdentifier:0];
  id v7 = [v6 firstObject];

  return v7;
}

- (BOOL)containsEntryWithType:(int64_t)a3 forContact:(id)a4 propertyKey:(id)a5 identifier:(id)a6
{
  id v6 = [(CNFavorites *)self entriesForContact:a4 propertyKey:a5 labeledValueIdentifier:a6 actionType:0 bundleIdentifier:0];
  BOOL v7 = [v6 count] != 0;

  return v7;
}

- (BOOL)addEntryForContact:(id)a3 propertyKey:(id)a4 withIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(CNFavorites *)self isFull])
  {
    BOOL v11 = 0;
  }
  else
  {
    id v12 = [CNFavoritesEntry alloc];
    id v13 = [(CNFavorites *)self contactStore];
    id v14 = [(CNFavoritesEntry *)v12 initWithContact:v8 propertyKey:v9 labeledValueIdentifier:v10 actionType:@"AudioCallActionType" bundleIdentifier:@"com.apple.mobilephone" store:v13];

    BOOL v11 = v14 != 0;
    if (v14) {
      [(CNFavorites *)self addEntry:v14];
    }
  }
  return v11;
}

- (void)_addEntryToMap:(id)a3
{
  id v13 = a3;
  if (([v13 abUid] & 0x80000000) == 0)
  {
    id v4 = [(CNFavorites *)self uidToEntry];

    if (v4)
    {
      id v5 = [(CNFavorites *)self uidToEntry];
      id v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v13, "abUid"));
      BOOL v7 = [v5 objectForKeyedSubscript:v6];

      if (v7)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v8 = (void *)[v7 mutableCopy];
          [v8 addObject:v13];
          id v9 = [(CNFavorites *)self uidToEntry];
          id v10 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v13, "abUid"));
          [v9 setObject:v8 forKeyedSubscript:v10];
        }
        else
        {
          uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v7, v13, 0);

          id v8 = [(CNFavorites *)self uidToEntry];
          id v12 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v13, "abUid"));
          [v8 setObject:v11 forKeyedSubscript:v12];

          BOOL v7 = (void *)v11;
        }
      }
      else
      {
        BOOL v7 = [(CNFavorites *)self uidToEntry];
        id v8 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v13, "abUid"));
        [v7 setObject:v13 forKeyedSubscript:v8];
      }
    }
  }
}

- (void)_removeEntryFromMap:(id)a3 withUid:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v15 = a3;
  id v6 = [(CNFavorites *)self uidToEntry];

  if ((v4 & 0x80000000) == 0 && v6)
  {
    BOOL v7 = [(CNFavorites *)self uidToEntry];
    id v8 = [NSNumber numberWithInt:v4];
    id v9 = [v7 objectForKeyedSubscript:v8];

    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_11;
      }
      if ([v9 count])
      {
        uint64_t v10 = 0;
        while (1)
        {
          id v11 = [v9 objectAtIndex:v10];

          if (v11 == v15) {
            break;
          }
          if (++v10 >= (unint64_t)[v9 count]) {
            goto LABEL_13;
          }
        }
        if ([v9 count] != 1)
        {
          if ([v9 count] == 2)
          {
            id v12 = [v9 objectAtIndex:v10 == 0];
          }
          else
          {
            id v12 = (void *)[v9 mutableCopy];
            [v12 removeObjectAtIndex:v10];
          }
          id v13 = [(CNFavorites *)self uidToEntry];
          id v14 = [NSNumber numberWithInt:v4];
          [v13 setObject:v12 forKeyedSubscript:v14];

          goto LABEL_12;
        }
LABEL_11:
        id v12 = [(CNFavorites *)self uidToEntry];
        id v13 = [NSNumber numberWithInt:v4];
        [v12 removeObjectForKey:v13];
LABEL_12:
      }
    }
LABEL_13:
  }
}

- (void)addEntry:(id)a3
{
  id v9 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  id v5 = [(CNFavorites *)v4 entries];
  unint64_t v6 = [v5 count];

  if (v9 && v6 <= 0x31)
  {
    uint64_t v7 = [(NSArray *)v4->_entries arrayByAddingObject:v9];
    entries = v4->_entries;
    v4->_entries = (NSArray *)v7;

    [(CNFavorites *)v4 _addEntryToMap:v9];
    [(CNFavorites *)v4 setDirty:1];
  }
  objc_sync_exit(v4);
}

- (void)removeEntryAtIndex:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  uint64_t v4 = [(CNFavorites *)obj entries];
  id v5 = [v4 objectAtIndexedSubscript:a3];

  -[CNFavorites _removeEntryFromMap:withUid:](obj, "_removeEntryFromMap:withUid:", v5, [v5 abUid]);
  unint64_t v6 = (void *)[(NSArray *)obj->_entries mutableCopy];
  [v6 removeObjectAtIndex:a3];
  uint64_t v7 = [v6 copy];
  entries = obj->_entries;
  obj->_entries = (NSArray *)v7;

  [(CNFavorites *)obj setDirty:1];
  objc_sync_exit(obj);
}

- (void)moveEntryAtIndex:(int64_t)a3 toIndex:(int64_t)a4
{
  obj = self;
  objc_sync_enter(obj);
  if (a4 <= a3)
  {
    if (a4 >= a3) {
      goto LABEL_6;
    }
    unint64_t v6 = (void *)[(NSArray *)obj->_entries mutableCopy];
    objc_msgSend(v6, "_cn_rotateRange:by:", a4, a3 - a4 + 1, 1);
    uint64_t v9 = [v6 mutableCopy];
    entries = obj->_entries;
    obj->_entries = (NSArray *)v9;

    [(CNFavorites *)obj setDirty:1];
  }
  else
  {
    unint64_t v6 = (void *)[(NSArray *)obj->_entries mutableCopy];
    objc_msgSend(v6, "_cn_rotateRange:by:", a3, a4 - a3 + 1, -1);
    uint64_t v7 = [v6 mutableCopy];
    id v8 = obj->_entries;
    obj->_entries = (NSArray *)v7;

    [(CNFavorites *)obj setDirty:1];
  }

LABEL_6:
  objc_sync_exit(obj);
}

- (void)removeAllEntries
{
  obj = self;
  objc_sync_enter(obj);
  [(CNFavorites *)obj setUidToEntry:0];
  entries = obj->_entries;
  obj->_entries = 0;

  [(CNFavorites *)obj setDirty:1];
  [(CNFavorites *)obj setNeedsReload:0];
  objc_sync_exit(obj);
}

- (BOOL)writeFavoritesToFile:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v5 = [(CNFavorites *)self logger];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36__CNFavorites_writeFavoritesToFile___block_invoke;
  v8[3] = &unk_1E56B9210;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  uint64_t v10 = &v11;
  [v5 writingFavorites:v8];

  LOBYTE(v5) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

void __36__CNFavorites_writeFavoritesToFile___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F5A3B0] sharedInstance];
  char v3 = [v2 isUnlockedSinceBoot];

  if (v3)
  {
    if (+[CNContactStore authorizationStatusForEntityType:0] == CNAuthorizationStatusAuthorized)
    {
      id v4 = +[CNFavorites favoritesPath];
      uint64_t v5 = *(void *)(a1 + 40);
      id v33 = 0;
      id v6 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v5 format:200 options:0 error:&v33];
      id v7 = v33;
      if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A268] + 16))())
      {
        id v8 = [*(id *)(a1 + 32) logger];
        [v8 failedToConvertFavoritesToPropertyList:v7];
      }
      else
      {
        id v9 = dispatch_get_global_queue(0, 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __36__CNFavorites_writeFavoritesToFile___block_invoke_2;
        block[3] = &unk_1E56B4508;
        id v10 = v6;
        id v30 = v10;
        id v11 = *(id *)(a1 + 40);
        uint64_t v12 = *(void *)(a1 + 32);
        id v31 = v11;
        uint64_t v32 = v12;
        dispatch_async(v9, block);

        uint64_t v13 = [*(id *)(a1 + 32) XPCDataMapper];
        char v14 = v13;
        if (v13)
        {
          id v28 = 0;
          char v15 = [v13 writeFavoritesPropertyListData:v10 toPath:v4 error:&v28];
          id v16 = v28;
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v15;
          int v17 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
          int v18 = [*(id *)(a1 + 32) logger];
          uint64_t v19 = v18;
          if (v17) {
            [v18 finishedWritingRemoteFavorites];
          }
          else {
            [v18 failedToWriteRemoteFavorites:v16];
          }
        }
        else
        {
          id v27 = v7;
          char v20 = [v10 writeToFile:v4 options:1073741825 error:&v27];
          id v21 = v27;

          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v20;
          if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
          {
            long long v22 = [MEMORY[0x1E4F28CB8] defaultManager];
            int v23 = [v22 fileExistsAtPath:v4];

            uint64_t v24 = [*(id *)(a1 + 32) logger];
            id v16 = v24;
            if (v23) {
              objc_msgSend(v24, "finishedWritingFavoritesToPath:entriesCount:", v4, objc_msgSend(*(id *)(a1 + 40), "count"));
            }
            else {
              [v24 failedToVerifyWrittenFavoritesExistsAtPath:v4];
            }
          }
          else
          {
            uint64_t v25 = [*(id *)(a1 + 32) shouldSimulateCrashReportForError:v21];
            id v16 = [*(id *)(a1 + 32) logger];
            [v16 failedToWriteFavoritesToPath:v4 error:v21 simulateCrashReport:v25];
          }
          id v7 = v21;
        }

        id v8 = v30;
      }
    }
  }
  else
  {
    id v26 = [*(id *)(a1 + 32) logger];
    [v26 reportFavoritesAccessedBeforeFirstUnlock];
  }
}

void __36__CNFavorites_writeFavoritesToFile___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v6 = 0;
  char v3 = [MEMORY[0x1E4F28F98] propertyListWithData:v2 options:0 format:0 error:&v6];
  id v4 = v6;
  if (([*(id *)(a1 + 40) isEqualToArray:v3] & 1) == 0)
  {
    uint64_t v5 = [*(id *)(a1 + 48) logger];
    [v5 failedToVerifyFavorites:*(void *)(a1 + 40) withPropertyListFavorites:v3 error:v4];
  }
}

- (void)save
{
  if ([(CNFavorites *)self needsReload])
  {
    char v3 = 1;
  }
  else
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v5 = self;
    objc_sync_enter(v5);
    for (unint64_t i = 0; ; ++i)
    {
      id v7 = [(CNFavorites *)v5 entries];
      unint64_t v8 = [v7 count];

      if (i >= v8) {
        break;
      }
      char v16 = 0;
      id v9 = [(CNFavorites *)v5 entries];
      id v10 = [v9 objectAtIndexedSubscript:i];
      id v15 = 0;
      [v10 dictionaryRepresentation:&v15 isDirty:&v16];
      id v11 = v15;

      [v4 addObject:v11];
      if (v16) {
        [(CNFavorites *)v5 setDirty:1];
      }
    }
    objc_sync_exit(v5);

    BOOL v12 = [(CNFavorites *)v5 dirty];
    if (v12) {
      [(CNFavorites *)v5 writeFavoritesToFile:v4];
    }

    char v3 = !v12;
  }
  [(CNFavorites *)self setDirty:0];
  BOOL v13 = [(CNFavorites *)self needsReload];
  if ((v3 & 1) == 0 && !v13)
  {
    [(CNFavorites *)self setPostCount:[(CNFavorites *)self postCount] + 1];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"CNFavoritesChangedExternallyNotification", 0, 0, 1u);
  }
}

- (void)rematchEntriesWithOptions:(unint64_t)a3
{
  uint64_t v5 = [(CNFavorites *)self logger];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__CNFavorites_rematchEntriesWithOptions___block_invoke;
  v6[3] = &unk_1E56B9288;
  v6[4] = self;
  v6[5] = a3;
  [v5 rematchingFavorites:v6];
}

void __41__CNFavorites_rematchEntriesWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((ABDeviceIsBeforeFirstUnlockWithDataProtected() & 1) == 0)
  {
    uint64_t v19 = 0;
    char v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    [*(id *)(a1 + 32) setNeedsReload:1];
    id v4 = *(id *)(a1 + 32);
    objc_sync_enter(v4);
    uint64_t v5 = (void *)MEMORY[0x1E4F1C978];
    id v6 = [*(id *)(a1 + 32) entries];
    id v7 = [v5 arrayWithArray:v6];

    objc_sync_exit(v4);
    if (*(unsigned char *)(a1 + 40))
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __41__CNFavorites_rematchEntriesWithOptions___block_invoke_2;
      v18[3] = &unk_1E56B9238;
      v18[4] = &v19;
      objc_msgSend(v7, "_cn_each:", v18);
      if (*((unsigned char *)v20 + 24))
      {
        uint64_t v8 = [*(id *)(a1 + 32) _uniqueRematchedEntries:v7];

        id v7 = (void *)v8;
      }
    }
    if ((*(unsigned char *)(a1 + 40) & 2) != 0)
    {
      id v9 = objc_alloc_init(CNGeminiManager);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __41__CNFavorites_rematchEntriesWithOptions___block_invoke_3;
      v15[3] = &unk_1E56B9260;
      int v17 = &v19;
      id v10 = v9;
      char v16 = v10;
      objc_msgSend(v7, "_cn_each:", v15);
    }
    if (*((unsigned char *)v20 + 24))
    {
      [*(id *)(a1 + 32) removeAllEntries];
      id v11 = *(id *)(a1 + 32);
      objc_sync_enter(v11);
      uint64_t v12 = [v7 mutableCopy];
      uint64_t v13 = *(void *)(a1 + 32);
      char v14 = *(void **)(v13 + 8);
      *(void *)(v13 + 8) = v12;

      objc_sync_exit(v11);
      [*(id *)(a1 + 32) save];
    }

    _Block_object_dispose(&v19, 8);
  }
}

uint64_t __41__CNFavorites_rematchEntriesWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 rematchWithContacts];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= result;
  return result;
}

uint64_t __41__CNFavorites_rematchEntriesWithOptions___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t result = [a2 rematchWithGeminiManager:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= result;
  return result;
}

- (id)_uniqueRematchedEntries:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v3, "count"));
  if ([v3 count])
  {
    unint64_t v5 = 0;
    do
    {
      id v6 = [v3 objectAtIndexedSubscript:v5];
      int v7 = [v6 oldAbUid];

      if ((v7 & 0x80000000) == 0)
      {
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __39__CNFavorites__uniqueRematchedEntries___block_invoke;
        v12[3] = &unk_1E56B92B0;
        unint64_t v15 = v5;
        id v13 = v3;
        id v14 = v4;
        [v14 enumerateIndexesUsingBlock:v12];
      }
      ++v5;
    }
    while (v5 < [v3 count]);
  }
  uint64_t v8 = [v4 count];
  if (v8 == [v3 count])
  {
    id v9 = v3;
  }
  else
  {
    id v9 = [v3 objectsAtIndexes:v4];
  }
  id v10 = v9;

  return v10;
}

void __39__CNFavorites__uniqueRematchedEntries___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  if (*(void *)(a1 + 48) != a2)
  {
    id v6 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
    int v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
    int v8 = [v6 isEqual:v7];

    if (v8)
    {
      [*(id *)(a1 + 40) removeIndex:*(void *)(a1 + 48)];
      *a3 = 1;
    }
  }
}

- (void)_entriesChangedExternally
{
  if ([(CNFavorites *)self postCount])
  {
    unint64_t v3 = [(CNFavorites *)self postCount] - 1;
    [(CNFavorites *)self setPostCount:v3];
  }
  else if (![(CNFavorites *)self needsReload] && ![(CNFavorites *)self dirty])
  {
    id v4 = self;
    objc_sync_enter(v4);
    entries = v4->_entries;
    v4->_entries = 0;

    [(CNFavorites *)v4 setUidToEntry:0];
    [(CNFavorites *)v4 setNeedsReload:1];
    objc_sync_exit(v4);

    [(CNFavorites *)v4 _postChangeNotification];
  }
}

- (void)_postChangeNotification
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"CNFavoritesChangedNotification" object:self];
}

- (void)setContactStore:(id)a3
{
}

- (void)setUidToEntry:(id)a3
{
}

- (BOOL)dirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (unint64_t)postCount
{
  return self->_postCount;
}

- (void)setPostCount:(unint64_t)a3
{
  self->_postCount = a3;
}

@end