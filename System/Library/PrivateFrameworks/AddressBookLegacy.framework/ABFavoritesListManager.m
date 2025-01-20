@interface ABFavoritesListManager
+ (id)sharedInstance;
+ (id)sharedInstanceWithAddressBook:(void *)a3;
- (ABFavoritesListManager)initWithAddressBook:(void *)a3;
- (BOOL)_isValueForEntry:(id)a3 equalToValue:(id)a4;
- (BOOL)addEntryForPerson:(void *)a3 property:(int)a4 withIdentifier:(int)a5;
- (BOOL)containsEntryWithIdentifier:(int)a3 forPerson:(void *)a4;
- (BOOL)containsEntryWithType:(int)a3 forPerson:(void *)a4 property:(int)a5 identifier:(int)a6;
- (BOOL)entryIsDuplicateAndThusRemoved:(id)a3 oldUid:(int)a4;
- (BOOL)isFull;
- (BOOL)shouldNotReportFavoritesError:(id)a3;
- (id)entries;
- (id)entriesForPeople:(id)a3;
- (id)entriesForPerson:(void *)a3;
- (id)entryFromEntries:(id)a3 type:(int)a4 property:(int)a5 identifier:(int)a6 value:(id)a7 label:(id)a8;
- (id)entryFromEntries:(id)a3 type:(int)a4 property:(int)a5 value:(id)a6 label:(id)a7;
- (id)entryWithIdentifier:(int)a3 forPerson:(void *)a4;
- (id)entryWithType:(int)a3 forPerson:(void *)a4 property:(int)a5 identifier:(int)a6;
- (void)_addEntryToMap:(id)a3;
- (void)_delayedLookup;
- (void)_entryIdentityChanged:(id)a3;
- (void)_listChangedExternally;
- (void)_loadList;
- (void)_loadListWithAddressBook:(void *)a3;
- (void)_postChangeNotification;
- (void)_removeEntryFromMap:(id)a3 withUid:(int)a4;
- (void)_scheduleSave;
- (void)addEntry:(id)a3;
- (void)dealloc;
- (void)moveEntryAtIndex:(int64_t)a3 toIndex:(int64_t)a4;
- (void)recacheIdentitiesSoon;
- (void)removeAllEntries;
- (void)removeEntryAtIndex:(int64_t)a3;
- (void)reportFavoritesIssue:(id)a3;
- (void)save;
- (void)saveImmediately;
@end

@implementation ABFavoritesListManager

+ (id)sharedInstance
{
  return +[ABFavoritesListManager sharedInstanceWithAddressBook:0];
}

+ (id)sharedInstanceWithAddressBook:(void *)a3
{
  id result = (id)sharedInstanceWithAddressBook____SpeedDialListManager;
  if (!sharedInstanceWithAddressBook____SpeedDialListManager)
  {
    id result = [[ABFavoritesListManager alloc] initWithAddressBook:a3];
    sharedInstanceWithAddressBook____SpeedDialListManager = (uint64_t)result;
  }
  return result;
}

- (void)reportFavoritesIssue:(id)a3
{
  ABDiagnosticsEnabled();
  _ABLog2(3, (uint64_t)"-[ABFavoritesListManager reportFavoritesIssue:]", 68, 0, @"%@", v4, v5, v6, (uint64_t)a3);
  ABLogSimulateCrashReport((uint64_t)a3);
  ABLogDisplayInternalAlert((uint64_t)a3);
}

- (BOOL)shouldNotReportFavoritesError:(id)a3
{
  if (a3)
  {
    uint64_t v4 = (void *)[a3 domain];
    uint64_t v5 = *MEMORY[0x1E4F281F8];
    if ([v4 isEqualToString:*MEMORY[0x1E4F281F8]] && objc_msgSend(a3, "code") == 260)
    {
      LOBYTE(v6) = 1;
    }
    else
    {
      int v6 = objc_msgSend((id)objc_msgSend(a3, "domain"), "isEqualToString:", v5);
      if (v6) {
        LOBYTE(v6) = [a3 code] == 257;
      }
    }
  }
  else
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (void)_loadListWithAddressBook:(void *)a3
{
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F5A3B0], "sharedInstance"), "isUnlockedSinceBoot"))
  {
    if (a3)
    {
      uint64_t v5 = 0;
    }
    else
    {
      a3 = (void *)ABAddressBookCreateWithOptions(0, 0);
      uint64_t v5 = a3;
      if (!a3) {
        return;
      }
    }
    if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized)
    {
      id location = 0;
      v9 = (void *)[(id)CPSharedResourcesDirectory() stringByAppendingPathComponent:@"Library/Preferences"];
      if ((_SpeedDialPath__checkedForDir & 1) == 0)
      {
        v10 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
        if (([v10 fileExistsAtPath:v9] & 1) == 0)
        {
          v11 = (void *)[v9 stringByDeletingLastPathComponent];
          if (([v10 fileExistsAtPath:v11] & 1) == 0) {
            mkdir((const char *)[v11 fileSystemRepresentation], 0x1C0u);
          }
          mkdir((const char *)[v9 fileSystemRepresentation], 0x1C0u);
        }
        _SpeedDialPath__checkedForDir = 1;
      }
      uint64_t v12 = [v9 stringByAppendingPathComponent:@"com.apple.mobilephone.speeddial.plist"];
      uint64_t v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12 isDirectory:0];
      v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithContentsOfURL:v13 error:&location];
      if (v14)
      {
        ABDiagnosticsEnabled();
        [v14 count];
        _ABLog2(4, (uint64_t)"-[ABFavoritesListManager _loadListWithAddressBook:]", 109, 0, @"Read favorites file %@, count = %ld", v15, v16, v17, v12);
        uint64_t v18 = [v14 count];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = 0;
          self->_list = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:50];
          do
          {
            v21 = -[ABFavoritesEntry initWithDictionaryRepresentation:addressBook:]([ABFavoritesEntry alloc], "initWithDictionaryRepresentation:addressBook:", [v14 objectAtIndex:v20], a3);
            if (v21)
            {
              v22 = v21;
              [(NSMutableArray *)self->_list addObject:v21];
              [(ABFavoritesListManager *)self _addEntryToMap:v22];
            }
            ++v20;
          }
          while (v19 != v20);
          [(ABFavoritesListManager *)self recacheIdentitiesSoon];
        }
        *(_DWORD *)&self->_flags &= ~4u;
      }
      else if ([(ABFavoritesListManager *)self shouldNotReportFavoritesError:location])
      {
        ABDiagnosticsEnabled();
        v26 = (__CFString *)location;
        if (!location) {
          v26 = @"no error returned";
        }
        _ABLog2(4, (uint64_t)"-[ABFavoritesListManager _loadListWithAddressBook:]", 112, 0, @"Error reading favorites file, error: %@", v23, v24, v25, (uint64_t)v26);
      }
      else
      {
        -[ABFavoritesListManager reportFavoritesIssue:](self, "reportFavoritesIssue:", [NSString stringWithFormat:@"Error reading favorites file. Add a favorite as workaround. Please open a radar to PEP Contacts (New Bugs).\n\n%@", location]);
      }
    }
    if (v5) {
      CFRelease(v5);
    }
  }
  else
  {
    uint64_t v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier");
    v7 = ABOSLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[ABFavoritesListManager _loadListWithAddressBook:](v6, v7);
    }
    objc_initWeak(&location, self);
    v8 = (void *)[MEMORY[0x1E4F5A3B0] sharedInstance];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __51__ABFavoritesListManager__loadListWithAddressBook___block_invoke;
    v27[3] = &unk_1E5989428;
    objc_copyWeak(&v28, &location);
    [v8 addUnlockHandlerWithIdentifier:@"ABFavoriteListManager" block:v27];
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
}

uint64_t __51__ABFavoritesListManager__loadListWithAddressBook___block_invoke(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  return [Weak _postChangeNotification];
}

- (void)_loadList
{
}

- (ABFavoritesListManager)initWithAddressBook:(void *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ABFavoritesListManager;
  uint64_t v4 = [(ABFavoritesListManager *)&v7 init];
  if (v4)
  {
    if (a3) {
      v4->_addressBook = (void *)CFRetain(a3);
    }
    [(ABFavoritesListManager *)v4 _loadListWithAddressBook:a3];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", v4, sel__entryIdentityChanged_, @"CNFavoritesEntryChangedNotification", 0);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v4, (CFNotificationCallback)_SpeedDialListChangedExternally, @"CNFavoritesChangedExternallyNotification", 0, CFNotificationSuspensionBehaviorDrop);
  }
  return v4;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"CNFavoritesChangedExternallyNotification", 0);
  uidToEntry = self->_uidToEntry;
  if (uidToEntry) {
    CFRelease(uidToEntry);
  }

  addressBook = self->_addressBook;
  if (addressBook) {
    CFRelease(addressBook);
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F5A3B0], "sharedInstance"), "removeUnlockHandlerWithIdentifier:", @"ABFavoriteListManager");
  v6.receiver = self;
  v6.super_class = (Class)ABFavoritesListManager;
  [(ABFavoritesListManager *)&v6 dealloc];
}

- (void)_scheduleSave
{
  *(_DWORD *)&self->_flags |= 1u;
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_save object:0];
  [(ABFavoritesListManager *)self performSelector:sel_save withObject:0 afterDelay:5.0];
}

- (id)entries
{
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    [(ABFavoritesListManager *)self _loadList];
  }
  return self->_list;
}

- (BOOL)isFull
{
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    [(ABFavoritesListManager *)self _loadList];
  }
  list = self->_list;
  if (list) {
    LOBYTE(list) = (unint64_t)[(NSMutableArray *)list count] > 0x31;
  }
  return (char)list;
}

- (id)entriesForPeople:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    [(ABFavoritesListManager *)self _loadList];
  }
  if (!self->_uidToEntry) {
    return 0;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  objc_super v7 = 0;
  uint64_t v8 = *(void *)v16;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v16 != v8) {
        objc_enumerationMutation(a3);
      }
      uidToEntry = self->_uidToEntry;
      ABRecordID RecordID = ABRecordGetRecordID(*(ABRecordRef *)(*((void *)&v15 + 1) + 8 * i));
      Value = CFDictionaryGetValue(uidToEntry, (const void *)RecordID);
      if (Value)
      {
        uint64_t v13 = Value;
        if (!v7) {
          objc_super v7 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:50];
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v7 addObjectsFromArray:v13];
        }
        else {
          [v7 addObject:v13];
        }
      }
    }
    uint64_t v6 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  }
  while (v6);
  return v7;
}

- (id)entriesForPerson:(void *)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:");
  return [(ABFavoritesListManager *)self entriesForPeople:v4];
}

- (BOOL)_isValueForEntry:(id)a3 equalToValue:(id)a4
{
  if (objc_msgSend(a4, "isEqualToString:", objc_msgSend(a3, "value"))) {
    return 1;
  }
  if ([a3 property] != kABPersonPhoneProperty) {
    return 0;
  }
  id v7 = +[ABPhoneFormatting abNormalizedPhoneNumberFromString:](ABPhoneFormatting, "abNormalizedPhoneNumberFromString:", [a3 value]);
  id v8 = +[ABPhoneFormatting abNormalizedPhoneNumberFromString:a4];
  return [v7 isEqualToString:v8];
}

- (id)entryFromEntries:(id)a3 type:(int)a4 property:(int)a5 identifier:(int)a6 value:(id)a7 label:(id)a8
{
  uint64_t v15 = [a3 count];
  if (!v15) {
    return 0;
  }
  unint64_t v16 = v15;
  unint64_t v17 = 1;
  do
  {
    long long v18 = (void *)[a3 objectAtIndex:v17 - 1];
    uint64_t v19 = v18;
    if (a6 != -1 && [v18 identifier] != a6
      || a4 != 3 && [v19 type] != a4
      || a5 != -1 && [v19 property] != a5
      || a7
      && (![(ABFavoritesListManager *)self _isValueForEntry:v19 equalToValue:a7]
       || a8 && !objc_msgSend(a8, "isEqualToString:", objc_msgSend(v19, "nonLocalizedLabel"))))
    {
      uint64_t v19 = 0;
    }
    if (v17 >= v16) {
      break;
    }
    ++v17;
  }
  while (!v19);
  return v19;
}

- (id)entryFromEntries:(id)a3 type:(int)a4 property:(int)a5 value:(id)a6 label:(id)a7
{
  return [(ABFavoritesListManager *)self entryFromEntries:a3 type:*(void *)&a4 property:*(void *)&a5 identifier:0xFFFFFFFFLL value:a6 label:a7];
}

- (id)entryWithType:(int)a3 forPerson:(void *)a4 property:(int)a5 identifier:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a3;
  id v10 = [(ABFavoritesListManager *)self entriesForPerson:a4];
  return [(ABFavoritesListManager *)self entryFromEntries:v10 type:v8 property:v7 identifier:v6 value:0 label:0];
}

- (id)entryWithIdentifier:(int)a3 forPerson:(void *)a4
{
  return [(ABFavoritesListManager *)self entryWithType:0 forPerson:a4 property:0xFFFFFFFFLL identifier:*(void *)&a3];
}

- (BOOL)containsEntryWithIdentifier:(int)a3 forPerson:(void *)a4
{
  return [(ABFavoritesListManager *)self entryWithIdentifier:*(void *)&a3 forPerson:a4] != 0;
}

- (BOOL)containsEntryWithType:(int)a3 forPerson:(void *)a4 property:(int)a5 identifier:(int)a6
{
  return [(ABFavoritesListManager *)self entryWithType:*(void *)&a3 forPerson:a4 property:*(void *)&a5 identifier:*(void *)&a6] != 0;
}

- (BOOL)addEntryForPerson:(void *)a3 property:(int)a4 withIdentifier:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  if ([(ABFavoritesListManager *)self isFull])
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    v9 = [[ABFavoritesEntry alloc] initWithPerson:a3 property:v6 identifier:v5];
    if (v9)
    {
      id v10 = v9;
      [(ABFavoritesListManager *)self addEntry:v9];

      LOBYTE(v9) = 1;
    }
  }
  return (char)v9;
}

- (void)_addEntryToMap:(id)a3
{
  unsigned int v5 = [a3 _abUid];
  if ((v5 & 0x80000000) != 0) {
    return;
  }
  unsigned int v6 = v5;
  uidToEntry = self->_uidToEntry;
  if (uidToEntry)
  {
    Value = (void *)CFDictionaryGetValue(uidToEntry, (const void *)v6);
    if (Value)
    {
      v9 = Value;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = (id)[v9 mutableCopy];
        [v15 addObject:a3];
        id v10 = self->_uidToEntry;
        unint64_t v11 = v6;
        uint64_t v12 = v15;
      }
      else
      {
        uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v9, a3, 0);
        id v15 = v12;
        id v10 = self->_uidToEntry;
        unint64_t v11 = v6;
      }
      CFDictionarySetValue(v10, (const void *)v11, v12);

      return;
    }
    Mutable = self->_uidToEntry;
    unint64_t v14 = v6;
  }
  else
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 50, 0, MEMORY[0x1E4F1D540]);
    self->_uidToEntry = Mutable;
    unint64_t v14 = v6;
  }
  CFDictionarySetValue(Mutable, (const void *)v14, a3);
}

- (void)_removeEntryFromMap:(id)a3 withUid:(int)a4
{
  if (a4 < 0) {
    return;
  }
  uidToEntry = self->_uidToEntry;
  if (!uidToEntry) {
    return;
  }
  unint64_t v7 = a4;
  uint64_t v8 = (void *)CFDictionaryGetValue(uidToEntry, (const void *)a4);
  if (!v8) {
    return;
  }
  v9 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_12;
  }
  uint64_t v10 = [v9 count];
  if (!v10) {
    return;
  }
  uint64_t v11 = v10;
  uint64_t v12 = 0;
  while ((id)[v9 objectAtIndex:v12] != a3)
  {
    if (v11 == ++v12) {
      return;
    }
  }
  if (v11 == 2)
  {
    unint64_t v14 = self->_uidToEntry;
    id v15 = (const void *)[v9 objectAtIndex:v12 == 0];
    CFDictionarySetValue(v14, (const void *)v7, v15);
  }
  else
  {
    if (v11 == 1)
    {
LABEL_12:
      uint64_t v13 = self->_uidToEntry;
      CFDictionaryRemoveValue(v13, (const void *)v7);
      return;
    }
    value = (void *)[v9 mutableCopy];
    [value removeObjectAtIndex:v12];
    CFDictionarySetValue(self->_uidToEntry, (const void *)v7, value);
  }
}

- (void)saveImmediately
{
  ABDiagnosticsEnabled();
  _ABLog2(4, (uint64_t)"-[ABFavoritesListManager saveImmediately]", 345, 0, @"must save changes with CNFavorites", v2, v3, v4, v6);
}

- (void)_entryIdentityChanged:(id)a3
{
  uint64_t v5 = [a3 object];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"CNFavoritesEntryOldIdentityKey");
  if (v6) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v8 = [v6 intValue];
    if ((v8 & 0x80000000) == 0) {
      [(ABFavoritesListManager *)self _removeEntryFromMap:v5 withUid:v8];
    }
    [(ABFavoritesListManager *)self _addEntryToMap:v5];
  }
  [(ABFavoritesListManager *)self _scheduleSave];
}

- (void)_postChangeNotification
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"CNFavoritesChangedNotification" object:self];
}

- (void)_listChangedExternally
{
  $9D67FB5E984A81712D1153695448EFC9 flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    self->_$9D67FB5E984A81712D1153695448EFC9 flags = ($9D67FB5E984A81712D1153695448EFC9)(*(_DWORD *)&flags & 0xFFFFFFFD);
  }
  else if ((*(unsigned char *)&flags & 4) == 0)
  {

    self->_list = 0;
    uidToEntry = self->_uidToEntry;
    if (uidToEntry) {
      CFRelease(uidToEntry);
    }
    self->_uidToEntry = 0;
    *(_DWORD *)&self->_flags |= 4u;
    [(ABFavoritesListManager *)self _postChangeNotification];
  }
}

- (void)addEntry:(id)a3
{
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    [(ABFavoritesListManager *)self _loadList];
  }
  list = self->_list;
  if (!list)
  {
    list = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:50];
    self->_list = list;
  }
  unint64_t v6 = [(NSMutableArray *)list count];
  if (a3 && v6 <= 0x31)
  {
    [(NSMutableArray *)self->_list addObject:a3];
    [(ABFavoritesListManager *)self _addEntryToMap:a3];
    [(ABFavoritesListManager *)self _postChangeNotification];
    [(ABFavoritesListManager *)self _scheduleSave];
  }
}

- (void)removeEntryAtIndex:(int64_t)a3
{
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    [(ABFavoritesListManager *)self _loadList];
  }
  uint64_t v5 = (void *)[(NSMutableArray *)self->_list objectAtIndex:a3];
  -[ABFavoritesListManager _removeEntryFromMap:withUid:](self, "_removeEntryFromMap:withUid:", v5, [v5 _abUid]);
  [(NSMutableArray *)self->_list removeObjectAtIndex:a3];
  [(ABFavoritesListManager *)self _postChangeNotification];
  [(ABFavoritesListManager *)self _scheduleSave];
}

- (void)moveEntryAtIndex:(int64_t)a3 toIndex:(int64_t)a4
{
  if (a3 != a4)
  {
    list = self->_list;
    uint64_t v9 = -[NSMutableArray objectAtIndex:](list, "objectAtIndex:");
    if (a4 <= a3) {
      int64_t v10 = a4;
    }
    else {
      int64_t v10 = a4 + 1;
    }
    [(NSMutableArray *)list insertObject:v9 atIndex:v10];
    if (a3 <= a4) {
      int64_t v11 = a3;
    }
    else {
      int64_t v11 = a3 + 1;
    }
    [(NSMutableArray *)self->_list removeObjectAtIndex:v11];
    [(ABFavoritesListManager *)self _postChangeNotification];
    [(ABFavoritesListManager *)self _scheduleSave];
  }
}

- (void)save
{
  ABDiagnosticsEnabled();
  _ABLog2(4, (uint64_t)"-[ABFavoritesListManager save]", 419, 0, @"must save changes with CNFavorites", v3, v4, v5, v6);
  *(_DWORD *)&self->_flags &= ~1u;
}

- (void)recacheIdentitiesSoon
{
}

- (void)_delayedLookup
{
}

- (BOOL)entryIsDuplicateAndThusRemoved:(id)a3 oldUid:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v7 = [(NSMutableArray *)self->_list count];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    while ((id)[(NSMutableArray *)self->_list objectAtIndex:v9] != a3)
    {
      if (v8 == ++v9) {
        goto LABEL_5;
      }
    }
    uint64_t v14 = [(NSMutableArray *)self->_list count];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = 0;
      while (1)
      {
        id v17 = (id)[(NSMutableArray *)self->_list objectAtIndex:v16];
        if (v17 != a3 && ([v17 isEqual:a3] & 1) != 0) {
          break;
        }
        if (v15 == ++v16) {
          goto LABEL_6;
        }
      }
      [(NSMutableArray *)self->_list removeObjectAtIndex:v9];
      [(ABFavoritesListManager *)self _removeEntryFromMap:a3 withUid:v4];
      [(ABFavoritesListManager *)self _scheduleSave];
      [(ABFavoritesListManager *)self _postChangeNotification];
      LOBYTE(v14) = 1;
    }
  }
  else
  {
LABEL_5:
    ABDiagnosticsEnabled();
    uint64_t v10 = [a3 dictionaryRepresentation];
    _ABLog2(4, (uint64_t)"-[ABFavoritesListManager entryIsDuplicateAndThusRemoved:oldUid:]", 445, 0, @"Checking for duplicate favorites entry, but entry we were told to compare is not list! Entry: %@\nList: %@", v11, v12, v13, v10);
LABEL_6:
    LOBYTE(v14) = 0;
  }
  return v14;
}

- (void)removeAllEntries
{
  uidToEntry = self->_uidToEntry;
  if (uidToEntry)
  {
    CFRelease(uidToEntry);
    self->_uidToEntry = 0;
  }

  self->_list = 0;
  *(_DWORD *)&self->_flags |= 1u;
}

- (void)_loadListWithAddressBook:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_19DCDB000, a2, OS_LOG_TYPE_FAULT, "%@ (or something it links) is using deprecated code and contributing to the overall instability of the system.", (uint8_t *)&v2, 0xCu);
}

@end