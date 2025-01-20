@interface ABFacebookMigrator
+ (BOOL)_performQuery:(id)a3 withStoreID:(int)a4 connection:(CPSqliteConnection *)a5;
+ (BOOL)isAccountTypeFacebook:(id)a3;
+ (BOOL)isSourceFacebook:(void *)a3;
+ (BOOL)mayHaveFacebookContacts:(void *)a3;
+ (BOOL)removeFacebookSensitiveInformation:(CPSqliteConnection *)a3;
+ (int)_findFacebookStoreID:(CPSqliteConnection *)a3;
- (ABFacebookMigrator)initWithAddressBook:(void *)a3;
- (ABFacebookMigrator)initWithAddressBook:(void *)a3 accountStore:(id)a4;
- (ACAccountStore)accountStore;
- (BOOL)_mergeContactsFromAccount:(void *)a3 toDestinationSourceID:(int)a4;
- (BOOL)_removeContactsAccount:(void *)a3;
- (BOOL)canMergeFacebookContacts;
- (BOOL)isCheckDone;
- (BOOL)mayHaveFacebookSource;
- (NSString)destinationDescription;
- (int)findBestMergeDestinationSourceID;
- (int)mergeDestinationSourceID;
- (unint64_t)facebookContactsCount;
- (void)_detectFacebookSource;
- (void)_startDatabaseDoctorToPerformAction:(id)a3;
- (void)addressBook;
- (void)dealloc;
- (void)deleteFacebookContacts;
- (void)facebookSource;
- (void)mergeFacebookContacts;
- (void)performPendingMergeOrDeleteAction;
- (void)setAccountStore:(id)a3;
- (void)setAddressBook:(void *)a3;
- (void)setCheckDone:(BOOL)a3;
- (void)setDestinationDescription:(id)a3;
- (void)setFacebookContactsCount:(unint64_t)a3;
- (void)setFacebookSource:(void *)a3;
- (void)setMayHaveFacebookSource:(BOOL)a3;
- (void)setMergeDestinationSourceID:(int)a3;
@end

@implementation ABFacebookMigrator

- (ABFacebookMigrator)initWithAddressBook:(void *)a3
{
  v5 = [MEMORY[0x1E4F179C8] defaultStore];
  v6 = [(ABFacebookMigrator *)self initWithAddressBook:a3 accountStore:v5];

  return v6;
}

- (ABFacebookMigrator)initWithAddressBook:(void *)a3 accountStore:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ABFacebookMigrator;
  v8 = [(ABFacebookMigrator *)&v12 init];
  if (v8)
  {
    if (a3) {
      v9 = (void *)CFRetain(a3);
    }
    else {
      v9 = 0;
    }
    v8->_addressBook = v9;
    objc_storeStrong((id *)&v8->_accountStore, a4);
    v8->_facebookSource = 0;
    v8->_mayHaveFacebookSource = 0;
    v10 = v8;
  }

  return v8;
}

- (void)dealloc
{
  addressBook = self->_addressBook;
  if (addressBook) {
    CFRelease(addressBook);
  }
  facebookSource = self->_facebookSource;
  if (facebookSource) {
    CFRelease(facebookSource);
  }
  v5.receiver = self;
  v5.super_class = (Class)ABFacebookMigrator;
  [(ABFacebookMigrator *)&v5 dealloc];
}

+ (BOOL)isSourceFacebook:(void *)a3
{
  v4 = ABAccountStoreGetAccountTypeForSource(0, (uint64_t)a3);
  LOBYTE(a1) = [a1 isAccountTypeFacebook:v4];

  return (char)a1;
}

+ (BOOL)isAccountTypeFacebook:(id)a3
{
  return [@"com.apple.account.facebookLegacy" isEqualToString:a3];
}

+ (BOOL)mayHaveFacebookContacts:(void *)a3
{
  v3 = [[ABFacebookMigrator alloc] initWithAddressBook:a3];
  [(ABFacebookMigrator *)v3 _detectFacebookSource];
  if ([(ABFacebookMigrator *)v3 facebookSource]) {
    char v4 = 1;
  }
  else {
    char v4 = [(ABFacebookMigrator *)v3 mayHaveFacebookSource];
  }

  return v4;
}

- (void)setCheckDone:(BOOL)a3
{
  v3 = [(ABFacebookMigrator *)self addressBook];
  ABAddressBookSetIntegerProperty((uint64_t)v3, @"FacebookCheckDone", 1, v4, v5, v6, v7, v8, v10);
}

- (BOOL)isCheckDone
{
  return ABAddressBookGetIntegerProperty((uint64_t)[(ABFacebookMigrator *)self addressBook]) == 1;
}

- (BOOL)canMergeFacebookContacts
{
  if ([(ABFacebookMigrator *)self isCheckDone]) {
    return 0;
  }
  [(ABFacebookMigrator *)self _detectFacebookSource];
  if (![(ABFacebookMigrator *)self facebookSource])
  {
    if (![(ABFacebookMigrator *)self mayHaveFacebookSource]) {
      [(ABFacebookMigrator *)self setCheckDone:1];
    }
    return 0;
  }
  if (![(ABFacebookMigrator *)self facebookContactsCount])
  {
    [(ABFacebookMigrator *)self deleteFacebookContacts];
    return 0;
  }
  [(ABFacebookMigrator *)self setMergeDestinationSourceID:[(ABFacebookMigrator *)self findBestMergeDestinationSourceID]];
  return 1;
}

- (void)mergeFacebookContacts
{
}

- (void)deleteFacebookContacts
{
}

- (void)_detectFacebookSource
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (![(ABFacebookMigrator *)self isCheckDone])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v3 = (id)ABAddressBookCopyArrayOfAllSourcesIncludingDisabledSources((uint64_t)[(ABFacebookMigrator *)self addressBook], 1);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      char v11 = 0;
      uint64_t v6 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(const void **)(*((void *)&v12 + 1) + 8 * i);
          if (ABRecordGetIntValue((uint64_t)v8, kABSourceTypeProperty))
          {
            v9 = [(ABFacebookMigrator *)self accountStore];
            uint64_t v10 = ABAccountStoreGetAccountTypeForSource(v9, (uint64_t)v8);

            if (v10)
            {
              if (+[ABFacebookMigrator isAccountTypeFacebook:v10])
              {
                [(ABFacebookMigrator *)self setFacebookSource:CFRetain(v8)];

                goto LABEL_17;
              }
            }
            else
            {
              char v11 = 1;
            }
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
    }
    else
    {
      char v11 = 0;
    }
LABEL_17:

    if ([(ABFacebookMigrator *)self facebookSource]) {
      [(ABFacebookMigrator *)self setFacebookContactsCount:ABAddressBookGetPersonCountInSource((uint64_t)[(ABFacebookMigrator *)self addressBook], [(ABFacebookMigrator *)self facebookSource])];
    }
    else {
      [(ABFacebookMigrator *)self setMayHaveFacebookSource:v11 & 1];
    }
  }
}

- (int)findBestMergeDestinationSourceID
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  ABRecordRef v3 = ABAddressBookCopyDefaultSource([(ABFacebookMigrator *)self addressBook]);
  unsigned int RecordID = ABRecordGetRecordID(v3);
  CFRelease(v3);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v4 = (id)ABAddressBookCopyArrayOfAllAccounts((uint64_t)[(ABFacebookMigrator *)self addressBook]);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (!v5)
  {

    uint64_t v7 = 0;
    goto LABEL_16;
  }
  uint64_t v6 = v5;
  id obj = v4;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = *(void *)v38;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v38 != v9) {
        objc_enumerationMutation(obj);
      }
      uint64_t v11 = *(void *)(*((void *)&v37 + 1) + 8 * i);
      long long v12 = [ABAccountScorer alloc];
      long long v13 = [(ABFacebookMigrator *)self addressBook];
      long long v14 = [(ABFacebookMigrator *)self accountStore];
      long long v15 = [(ABAccountScorer *)v12 initWithAddressBook:v13 accountStore:v14 account:v11 defaultSourceID:RecordID];

      [(ABAccountScorer *)v15 calculateScore];
      [(ABAccountScorer *)v15 score];
      double v17 = v16;
      [(ABAccountScorer *)v8 score];
      if (v17 <= v18)
      {
        [(ABAccountScorer *)v15 score];
        double v21 = v20;
        [(ABAccountScorer *)v7 score];
        v19 = v15;
        if (v21 <= v22) {
          goto LABEL_10;
        }
      }
      else
      {
        v19 = v8;

        uint64_t v7 = v19;
        uint64_t v8 = v15;
      }
      v23 = v15;

      uint64_t v7 = v19;
LABEL_10:
    }
    uint64_t v6 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  }
  while (v6);
  id v4 = obj;

  if (!v8)
  {
LABEL_16:
    v32 = ABAddressBookCopyLocalSource((uint64_t)[(ABFacebookMigrator *)self addressBook]);
    ABRecordID v24 = ABRecordGetRecordID(v32);
    CFRelease(v32);
    uint64_t v8 = 0;
    goto LABEL_18;
  }
  ABRecordID v24 = [(ABAccountScorer *)v8 sourceID];
  v25 = [(ABAccountScorer *)v8 accountType];
  v26 = [(ABAccountScorer *)v7 accountType];
  int v27 = [v25 isEqualToString:v26];

  if (v27)
  {
    v28 = NSString;
    v29 = [(ABAccountScorer *)v8 accountTypeDescription];
    v30 = [(ABAccountScorer *)v8 accountDisambiguationDescription];
    v31 = [v28 stringWithFormat:@"%@ - %@", v29, v30];
    [(ABFacebookMigrator *)self setDestinationDescription:v31];
  }
  else
  {
    v33 = [(ABAccountScorer *)v8 accountTypeDescription];
    [(ABFacebookMigrator *)self setDestinationDescription:v33];
  }
LABEL_18:

  return v24;
}

- (void)_startDatabaseDoctorToPerformAction:(id)a3
{
  id v22 = a3;
  AccountForSource = (const void *)ABAddressBookGetAccountForSource((uint64_t)[(ABFacebookMigrator *)self addressBook], (uint64_t)[(ABFacebookMigrator *)self facebookSource]);
  if (AccountForSource)
  {
    CFTypeRef v5 = ABAccountCopyIdentifier(AccountForSource);
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = [(ABFacebookMigrator *)self addressBook];
      ABAddressBookSetValueForProperty((uint64_t)v7, (uint64_t)v22, (uint64_t)v6, v8, v9, v10, v11, v12, v20);
      CFRelease(v6);
      if ([v22 isEqualToString:@"MergeFacebookContacts"])
      {
        long long v13 = [(ABFacebookMigrator *)self addressBook];
        uint64_t v14 = [(ABFacebookMigrator *)self mergeDestinationSourceID];
        ABAddressBookSetIntegerProperty((uint64_t)v13, @"MergeFacebookContactsToSourceID", v14, v15, v16, v17, v18, v19, v21);
      }
      ABStartDatabaseDoctor((uint64_t)[(ABFacebookMigrator *)self addressBook]);
    }
  }
}

- (void)performPendingMergeOrDeleteAction
{
  if (![(ABFacebookMigrator *)self isCheckDone])
  {
    uint64_t v3 = ABAddressBookCopyValueForProperty((uint64_t)[(ABFacebookMigrator *)self addressBook]);
    if (v3)
    {
      id v4 = (const void *)v3;
      CFTypeRef v5 = ABAddressBookCopyAccountWithIdentifier((uint64_t)[(ABFacebookMigrator *)self addressBook], v3);
      CFRelease(v4);
      uint64_t IntegerProperty = ABAddressBookGetIntegerProperty((uint64_t)[(ABFacebookMigrator *)self addressBook]);
      if (v5)
      {
        if ([(ABFacebookMigrator *)self _mergeContactsFromAccount:v5 toDestinationSourceID:IntegerProperty])
        {
          BOOL v7 = [(ABFacebookMigrator *)self _removeContactsAccount:v5];
          CFRelease(v5);
          if (v7)
          {
            uint64_t v8 = [(ABFacebookMigrator *)self addressBook];
            ABAddressBookSetValueForProperty((uint64_t)v8, @"MergeFacebookContacts", 0, v9, v10, v11, v12, v13, v24);
            [(ABFacebookMigrator *)self setCheckDone:1];
          }
        }
        else
        {
          CFRelease(v5);
        }
      }
    }
    uint64_t v14 = ABAddressBookCopyValueForProperty((uint64_t)[(ABFacebookMigrator *)self addressBook]);
    if (v14)
    {
      uint64_t v15 = (const void *)v14;
      uint64_t v16 = ABAddressBookCopyAccountWithIdentifier((uint64_t)[(ABFacebookMigrator *)self addressBook], v14);
      CFRelease(v15);
      if (v16)
      {
        BOOL v17 = [(ABFacebookMigrator *)self _removeContactsAccount:v16];
        CFRelease(v16);
        if (v17)
        {
          uint64_t v18 = [(ABFacebookMigrator *)self addressBook];
          ABAddressBookSetValueForProperty((uint64_t)v18, @"DeleteFacebookContacts", 0, v19, v20, v21, v22, v23, v24);
          [(ABFacebookMigrator *)self setCheckDone:1];
        }
      }
    }
  }
}

- (BOOL)_mergeContactsFromAccount:(void *)a3 toDestinationSourceID:(int)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  SourceWithunsigned int RecordID = ABAddressBookGetSourceWithRecordID([(ABFacebookMigrator *)self addressBook], a4);
  if (SourceWithRecordID)
  {
    BOOL v7 = SourceWithRecordID;
    if (!ABRecordGetIntValue((uint64_t)SourceWithRecordID, kABSourceTypeProperty))
    {
      ABPropertyID v8 = kABSourceEnabledProperty;
      if (!ABRecordGetIntValue((uint64_t)v7, kABSourceEnabledProperty)) {
        ABRecordSetValue(v7, v8, (CFTypeRef)*MEMORY[0x1E4F1CFD0], 0);
      }
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = (id)ABAddressBookCopyArrayOfAllSourcesInAccount((uint64_t)[(ABFacebookMigrator *)self addressBook], a3);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      int v12 = 0;
      uint64_t v13 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v9);
          }
          v12 |= ABAddressBookMergeRecordsInSourceIntoSource((const __CFString *)[(ABFacebookMigrator *)self addressBook], *(const void **)(*((void *)&v16 + 1) + 8 * i), v7);
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }
  return v12 & 1;
}

- (BOOL)_removeContactsAccount:(void *)a3
{
  BOOL v4 = ABAddressBookRemoveRecord([(ABFacebookMigrator *)self addressBook], a3, 0);
  return v4 & ABAddressBookSave([(ABFacebookMigrator *)self addressBook], 0);
}

+ (BOOL)removeFacebookSensitiveInformation:(CPSqliteConnection *)a3
{
  uint64_t v5 = objc_msgSend(a1, "_findFacebookStoreID:");
  if (v5 == -1) {
    return 1;
  }
  uint64_t v6 = v5;
  int v7 = objc_msgSend(a1, "_performQuery:withStoreID:connection:", @"delete from ABMultiValue where     record_id in (select ROWID from ABPerson where storeid = ?)     and property = 22     and value like \"%.facebook.com%\";",
         v5,
         a3);
  int v8 = v7 & objc_msgSend(a1, "_performQuery:withStoreID:connection:", @"delete from ABMultiValueEntry where parent_id in     (select abmv.UID from ABMultiValue as abmv join ABMultiValueEntry as abmve on abmv.UID = abmve.parent_id where         abmv.record_id in (select ROWID from ABPerson where StoreID = ?)         and abmv.property = 46         and abmve.key in (select ROWID from ABMultiValueEntryKey where value like \"service\")         and abmve.value like \"facebook\");",
              v6,
              a3);
  return v8 & objc_msgSend(a1, "_performQuery:withStoreID:connection:", @"delete from ABMultiValue where     record_id in (select ROWID from ABPerson where storeid = ?)     and property = 46     and UID not in (select parent_id from ABMultiValueEntry);",
                v6,
                a3);
}

+ (int)_findFacebookStoreID:(CPSqliteConnection *)a3
{
  uint64_t v3 = [MEMORY[0x1E4F179C8] defaultStore];
  if (CPSqliteConnectionStatementForSQL())
  {
    CPSqliteStatementSendResults();
    CPSqliteStatementReset();
  }

  return -1;
}

+ (BOOL)_performQuery:(id)a3 withStoreID:(int)a4 connection:(CPSqliteConnection *)a5
{
  uint64_t v6 = CPSqliteConnectionStatementForSQL();
  if (v6)
  {
    sqlite3_bind_int(*(sqlite3_stmt **)(v6 + 8), 1, a4);
    int v7 = CPSqliteStatementPerform();
    CPSqliteStatementReset();
    LOBYTE(v6) = v7 == 101;
  }
  return v6;
}

- (unint64_t)facebookContactsCount
{
  return self->_facebookContactsCount;
}

- (void)setFacebookContactsCount:(unint64_t)a3
{
  self->_facebookContactsCount = a3;
}

- (NSString)destinationDescription
{
  return self->_destinationDescription;
}

- (void)setDestinationDescription:(id)a3
{
}

- (void)addressBook
{
  return self->_addressBook;
}

- (void)setAddressBook:(void *)a3
{
  self->_addressBook = a3;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (void)facebookSource
{
  return self->_facebookSource;
}

- (void)setFacebookSource:(void *)a3
{
  self->_facebookSource = a3;
}

- (int)mergeDestinationSourceID
{
  return self->_mergeDestinationSourceID;
}

- (void)setMergeDestinationSourceID:(int)a3
{
  self->_mergeDestinationSourceID = a3;
}

- (BOOL)mayHaveFacebookSource
{
  return self->_mayHaveFacebookSource;
}

- (void)setMayHaveFacebookSource:(BOOL)a3
{
  self->_mayHaveFacebookSource = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_destinationDescription, 0);
}

@end