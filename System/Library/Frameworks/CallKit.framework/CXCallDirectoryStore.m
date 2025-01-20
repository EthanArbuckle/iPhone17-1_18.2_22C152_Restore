@interface CXCallDirectoryStore
+ (BOOL)initializeDatabaseIfNecessaryAtURL:(id)a3 usingTemplateAtURL:(id)a4 error:(id *)a5;
+ (NSURL)databaseTemplateURL;
+ (id)databaseURLUsingTemporaryDirectory:(BOOL)a3 error:(id *)a4;
- (BOOL)_addBlockingEntriesWithData:(id)a3 startIndex:(unint64_t)a4 count:(unint64_t)a5 extensionID:(int64_t)a6 error:(id *)a7;
- (BOOL)_addIdentificationEntriesWithData:(id)a3 startIndex:(unint64_t)a4 count:(unint64_t)a5 extensionID:(int64_t)a6 error:(id *)a7;
- (BOOL)_addPhoneNumbersWithEntryData:(id)a3 startIndex:(unint64_t)a4 count:(unint64_t)a5 error:(id *)a6;
- (BOOL)_containsBlockingEntryWithSQL:(id)a3 bindings:(id)a4 error:(id *)a5;
- (BOOL)_parseFirstIdentificationEntriesForSQL:(id)a3 bindings:(id)a4 handler:(id)a5 error:(id *)a6;
- (BOOL)_parseIdentificationEntriesForSQL:(id)a3 bindings:(id)a4 handler:(id)a5 error:(id *)a6;
- (BOOL)_removeBlockingEntriesWithData:(id)a3 startIndex:(unint64_t)a4 count:(unint64_t)a5 extensionID:(int64_t)a6 error:(id *)a7;
- (BOOL)_removeIdentificationEntriesWithData:(id)a3 startIndex:(unint64_t)a4 count:(unint64_t)a5 extensionID:(int64_t)a6 error:(id *)a7;
- (BOOL)_removeUnreferencedLabelsWithError:(id *)a3;
- (BOOL)_removeUnreferencedPhoneNumbersWithError:(id *)a3;
- (BOOL)addBlockingEntriesWithData:(id)a3 extensionID:(int64_t)a4 error:(id *)a5;
- (BOOL)addBlockingEntryWithPhoneNumber:(int64_t)a3 extensionID:(int64_t)a4 error:(id *)a5;
- (BOOL)addIdentificationEntriesWithData:(id)a3 extensionID:(int64_t)a4 error:(id *)a5;
- (BOOL)addIdentificationEntryWithPhoneNumber:(int64_t)a3 labelID:(int64_t)a4 extensionID:(int64_t)a5 error:(id *)a6;
- (BOOL)containsBlockingEntryForEnabledExtensionWithPhoneNumber:(id)a3 error:(id *)a4;
- (BOOL)containsBlockingEntryForEnabledExtensionWithPhoneNumberInArray:(id)a3 error:(id *)a4;
- (BOOL)containsBlockingEntryWithPhoneNumber:(id)a3 error:(id *)a4;
- (BOOL)containsBlockingEntryWithPhoneNumberInArray:(id)a3 error:(id *)a4;
- (BOOL)containsExtensionWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)isCorrupt;
- (BOOL)isTemporary;
- (BOOL)performTransactionWithBlock:(id)a3 error:(id *)a4;
- (BOOL)removeBlockingEntriesForExtensionWithID:(int64_t)a3 error:(id *)a4;
- (BOOL)removeBlockingEntriesWithData:(id)a3 extensionID:(int64_t)a4 error:(id *)a5;
- (BOOL)removeExtensionWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)removeIdentificationEntriesForExtensionWithID:(int64_t)a3 error:(id *)a4;
- (BOOL)removeIdentificationEntriesWithData:(id)a3 extensionID:(int64_t)a4 error:(id *)a5;
- (BOOL)removeUnreferencedRecordsWithError:(id *)a3;
- (BOOL)setPrioritizedExtensionIdentifiers:(id)a3 error:(id *)a4;
- (BOOL)setState:(int64_t)a3 forExtensionWithID:(int64_t)a4 error:(id *)a5;
- (BOOL)setState:(int64_t)a3 forExtensionWithIdentifier:(id)a4 error:(id *)a5;
- (BOOL)setStateForAllExtensions:(int64_t)a3 error:(id *)a4;
- (BOOL)setStateLastModifiedDate:(id)a3 forExtensionWithID:(int64_t)a4 error:(id *)a5;
- (BOOL)vacuumWithError:(id *)a3;
- (CXCallDirectoryStore)init;
- (CXCallDirectoryStore)initWithTemplateURL:(id)a3 readOnly:(BOOL)a4 temporary:(BOOL)a5 error:(id *)a6;
- (CXDatabase)database;
- (NSString)addBlockingEntriesInsertPhoneNumberBlockingEntrySQL;
- (NSString)addIdentificationEntriesInsertLabelsSQL;
- (NSString)addIdentificationEntriesInsertPhoneNumberIdentificationEntrySQL;
- (NSString)addPhoneNumbersSQL;
- (NSString)removeBlockingEntriesSQL;
- (NSString)removeIdentificationEntriesSQL;
- (NSURL)url;
- (id)_firstIdentificationEntriesForSQL:(id)a3 bindings:(id)a4 error:(id *)a5;
- (id)_firstIdentificationEntryForSQL:(id)a3 bindings:(id)a4 error:(id *)a5;
- (id)_sqlBindingsForPrioritizedExtensionIdentifiers:(id)a3 withPriorityOffset:(int64_t)a4;
- (id)_sqlCaseMappingPlaceholderStringWithKeyColumnName:(id)a3 defaultValue:(id)a4 numberOfPairs:(unint64_t)a5;
- (id)_sqlStringListPlaceholderStringWithNumberOfEntries:(int64_t)a3;
- (id)_sqlValuesListPlaceholderStringWithNumberOfEntries:(int64_t)a3 entryString:(id)a4;
- (id)_storeIdentificationEntryWithExtensionBundleID:(id)a3 localizedLabel:(id)a4;
- (id)description;
- (id)extensionWithIdentifier:(id)a3 error:(id *)a4;
- (id)firstEnabledBlockingExtensionIdentifierForPhoneNumber:(id)a3 error:(id *)a4;
- (id)firstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers:(id)a3 error:(id *)a4;
- (id)firstIdentificationEntriesForPhoneNumbers:(id)a3 error:(id *)a4;
- (id)firstIdentificationEntryForEnabledExtensionWithPhoneNumber:(id)a3 error:(id *)a4;
- (id)firstIdentificationEntryForPhoneNumber:(id)a3 error:(id *)a4;
- (id)initForReadingAndWritingWithError:(id *)a3;
- (id)initForReadingWithError:(id *)a3;
- (id)initReadOnly:(BOOL)a3 temporary:(BOOL)a4 error:(id *)a5;
- (id)prioritizedExtensionIdentifiersWithError:(id *)a3;
- (id)prioritizedExtensionsWithError:(id *)a3;
- (int64_t)_findOrCreateIDForPhoneNumber:(int64_t)a3 error:(id *)a4;
- (int64_t)addExtensionWithIdentifier:(id)a3 error:(id *)a4;
- (int64_t)addExtensionWithIdentifier:(id)a3 priority:(int64_t)a4 error:(id *)a5;
- (int64_t)addLabel:(id)a3 error:(id *)a4;
- (int64_t)idForExtensionWithIdentifier:(id)a3 error:(id *)a4;
- (int64_t)idForLabel:(id)a3 error:(id *)a4;
- (int64_t)idForPhoneNumber:(int64_t)a3 error:(id *)a4;
- (int64_t)lastAddBlockingEntriesCount;
- (int64_t)lastAddIdentificationEntriesCount;
- (int64_t)lastAddPhoneNumbersCount;
- (int64_t)lastRemoveBlockingEntriesCount;
- (int64_t)lastRemoveIdentificationEntriesCount;
- (int64_t)schemaVersion;
- (int64_t)schemaVersionWithError:(id *)a3;
- (void)dealloc;
- (void)setAddBlockingEntriesInsertPhoneNumberBlockingEntrySQL:(id)a3;
- (void)setAddIdentificationEntriesInsertLabelsSQL:(id)a3;
- (void)setAddIdentificationEntriesInsertPhoneNumberIdentificationEntrySQL:(id)a3;
- (void)setAddPhoneNumbersSQL:(id)a3;
- (void)setDatabase:(id)a3;
- (void)setLastAddBlockingEntriesCount:(int64_t)a3;
- (void)setLastAddIdentificationEntriesCount:(int64_t)a3;
- (void)setLastAddPhoneNumbersCount:(int64_t)a3;
- (void)setLastRemoveBlockingEntriesCount:(int64_t)a3;
- (void)setLastRemoveIdentificationEntriesCount:(int64_t)a3;
- (void)setRemoveBlockingEntriesSQL:(id)a3;
- (void)setRemoveIdentificationEntriesSQL:(id)a3;
- (void)setTemporary:(BOOL)a3;
@end

@implementation CXCallDirectoryStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removeIdentificationEntriesSQL, 0);
  objc_storeStrong((id *)&self->_addPhoneNumbersSQL, 0);
  objc_storeStrong((id *)&self->_addIdentificationEntriesInsertPhoneNumberIdentificationEntrySQL, 0);
  objc_storeStrong((id *)&self->_addIdentificationEntriesInsertLabelsSQL, 0);
  objc_storeStrong((id *)&self->_removeBlockingEntriesSQL, 0);
  objc_storeStrong((id *)&self->_addBlockingEntriesInsertPhoneNumberBlockingEntrySQL, 0);

  objc_storeStrong((id *)&self->_database, 0);
}

- (id)firstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = -[CXCallDirectoryStore _sqlStringListPlaceholderStringWithNumberOfEntries:](self, "_sqlStringListPlaceholderStringWithNumberOfEntries:", [v6 count]);
  v8 = [NSString stringWithFormat:@"SELECT Extension.bundle_id, Label.localized_label, PhoneNumber.number FROM Label INNER JOIN PhoneNumberIdentificationEntry ON (Label.id = PhoneNumberIdentificationEntry.label_id) INNER JOIN PhoneNumber ON (PhoneNumber.id = PhoneNumberIdentificationEntry.phone_number_id) INNER JOIN Extension ON (Extension.id = PhoneNumberIdentificationEntry.extension_id) WHERE (Extension.state = %ld AND PhoneNumber.number IN %@) GROUP BY PhoneNumber.number HAVING MIN(Extension.priority)", 4, v7];
  v9 = [(CXCallDirectoryStore *)self _firstIdentificationEntriesForSQL:v8 bindings:v6 error:a4];

  return v9;
}

- (id)_firstIdentificationEntriesForSQL:(id)a3 bindings:(id)a4 error:(id *)a5
{
  v8 = (void *)MEMORY[0x1E4F1CA60];
  id v9 = a4;
  id v10 = a3;
  v11 = [v8 dictionary];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __73__CXCallDirectoryStore__firstIdentificationEntriesForSQL_bindings_error___block_invoke;
  v16[3] = &unk_1E5CAE260;
  id v12 = v11;
  id v17 = v12;
  v13 = (void *)MEMORY[0x1AD0C5BA0](v16);
  LOBYTE(a5) = [(CXCallDirectoryStore *)self _parseFirstIdentificationEntriesForSQL:v10 bindings:v9 handler:v13 error:a5];

  if ((a5 & 1) == 0)
  {

    id v12 = 0;
  }
  v14 = (void *)[v12 copy];

  return v14;
}

- (BOOL)_parseFirstIdentificationEntriesForSQL:(id)a3 bindings:(id)a4 handler:(id)a5 error:(id *)a6
{
  id v10 = a5;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __86__CXCallDirectoryStore__parseFirstIdentificationEntriesForSQL_bindings_handler_error___block_invoke;
  v20 = &unk_1E5CAE288;
  v21 = self;
  id v22 = v10;
  id v11 = v10;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)MEMORY[0x1AD0C5BA0](&v17);
  v15 = [(CXCallDirectoryStore *)self database];
  LOBYTE(a6) = [v15 selectSQL:v13 withBindings:v12 expectedColumnCount:3 transient:1 resultRowHandler:v14 error:a6];

  return (char)a6;
}

- (CXDatabase)database
{
  return self->_database;
}

- (id)_sqlStringListPlaceholderStringWithNumberOfEntries:(int64_t)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
  if (a3 >= 1)
  {
    unint64_t v5 = a3 + 1;
    do
    {
      [v4 addObject:@"?"];
      --v5;
    }
    while (v5 > 1);
  }
  id v6 = NSString;
  v7 = [v4 componentsJoinedByString:@", "];
  v8 = [v6 stringWithFormat:@"(%@)", v7];

  return v8;
}

- (id)initReadOnly:(BOOL)a3 temporary:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  id v9 = [(id)objc_opt_class() databaseTemplateURL];
  if (v9)
  {
    id v10 = [(CXCallDirectoryStore *)self initWithTemplateURL:v9 readOnly:v7 temporary:v6 error:a5];
  }
  else
  {

    id v10 = 0;
  }

  return v10;
}

- (CXCallDirectoryStore)initWithTemplateURL:(id)a3 readOnly:(BOOL)a4 temporary:(BOOL)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CXCallDirectoryStore;
  id v11 = [(CXCallDirectoryStore *)&v18 init];
  id v12 = v11;
  if (v11)
  {
    v11->_temporary = a5;
    id v13 = [(id)objc_opt_class() databaseURLUsingTemporaryDirectory:v11->_temporary error:a6];
    if (!v13) {
      goto LABEL_9;
    }
    if (![(id)objc_opt_class() initializeDatabaseIfNecessaryAtURL:v13 usingTemplateAtURL:v10 error:a6])goto LABEL_9; {
    v14 = [[CXDatabase alloc] initWithURL:v13 readOnly:v8 error:a6];
    }
    database = v12->_database;
    v12->_database = v14;

    v16 = v12->_database;
    if (!v16) {
      goto LABEL_9;
    }
    if (!v8)
    {
      if (![(CXDatabase *)v16 enableForeignKeysWithError:a6]) {
        goto LABEL_9;
      }
      v16 = v12->_database;
    }
    if ([(CXDatabase *)v16 setBusyTimeout:a6 error:120.0])
    {
LABEL_10:

      goto LABEL_11;
    }
LABEL_9:

    id v12 = 0;
    goto LABEL_10;
  }
LABEL_11:

  return v12;
}

+ (id)databaseURLUsingTemporaryDirectory:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  BOOL v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  BOOL v7 = (void *)MEMORY[0x1E4F1CB10];
  if (v5)
  {
    BOOL v8 = NSTemporaryDirectory();
    id v9 = [MEMORY[0x1E4F28F80] processInfo];
    id v10 = [v9 globallyUniqueString];
    id v11 = [v8 stringByAppendingPathComponent:v10];
    id v12 = [v7 fileURLWithPath:v11 isDirectory:1];

    if (v12) {
      goto LABEL_3;
    }
LABEL_8:
    uint64_t v17 = 0;
    goto LABEL_9;
  }
  id v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/var/mobile/Library"];
  if (!v12) {
    goto LABEL_8;
  }
LABEL_3:
  id v13 = [v12 URLByAppendingPathComponent:@"CallDirectory" isDirectory:1];
  v14 = [v13 path];
  char v15 = [v6 fileExistsAtPath:v14];

  if ((v15 & 1) != 0
    || (int v16 = [v6 createDirectoryAtURL:v13 withIntermediateDirectories:1 attributes:0 error:a4],
        uint64_t v17 = 0,
        v16))
  {
    uint64_t v17 = [v13 URLByAppendingPathComponent:@"CallDirectory.db"];
  }

LABEL_9:

  return v17;
}

+ (BOOL)initializeDatabaseIfNecessaryAtURL:(id)a3 usingTemplateAtURL:(id)a4 error:(id *)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v10 = [v7 path];
  char v11 = [v9 fileExistsAtPath:v10];

  if ((v11 & 1) == 0)
  {
    id v12 = [v8 path];
    int v13 = [v9 fileExistsAtPath:v12];

    if (v13)
    {
      int v14 = [v9 copyItemAtURL:v8 toURL:v7 error:a5];
      char v15 = CXDefaultLog();
      int v16 = v15;
      if (v14)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 138412546;
          id v20 = v8;
          __int16 v21 = 2112;
          id v22 = v7;
          _os_log_impl(&dword_1A6E3A000, v16, OS_LOG_TYPE_DEFAULT, "Copied database template from URL %@ to URL %@", (uint8_t *)&v19, 0x16u);
        }

        goto LABEL_7;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        +[CXCallDirectoryStore initializeDatabaseIfNecessaryAtURL:usingTemplateAtURL:error:]((uint64_t)v8, (uint64_t)v7, v16);
      }
    }
    else if (a5)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "cx_callDirectoryStoreErrorWithCode:", 1);
      BOOL v17 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    BOOL v17 = 0;
    goto LABEL_14;
  }
LABEL_7:
  BOOL v17 = 1;
LABEL_14:

  return v17;
}

+ (NSURL)databaseTemplateURL
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v3 = [v2 URLForResource:@"CallDirectoryTemplate.db" withExtension:0];

  return (NSURL *)v3;
}

- (id)initForReadingAndWritingWithError:(id *)a3
{
  return [(CXCallDirectoryStore *)self initReadOnly:0 temporary:0 error:a3];
}

- (void)dealloc
{
  v1 = [a1 database];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_0(&dword_1A6E3A000, v2, v3, "Error closing database %@: %@", v4, v5, v6, v7, v8);
}

- (BOOL)isTemporary
{
  return self->_temporary;
}

- (id)initForReadingWithError:(id *)a3
{
  return [(CXCallDirectoryStore *)self initReadOnly:1 temporary:0 error:a3];
}

- (CXCallDirectoryStore)init
{
  return 0;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(CXCallDirectoryStore *)self database];
  uint64_t v6 = [v3 stringWithFormat:@"<%@ %p database=%@>", v4, self, v5];

  return v6;
}

- (NSURL)url
{
  uint64_t v2 = [(CXCallDirectoryStore *)self database];
  uint64_t v3 = [v2 url];

  return (NSURL *)v3;
}

- (int64_t)schemaVersion
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v6 = 0;
  int64_t v2 = [(CXCallDirectoryStore *)self schemaVersionWithError:&v6];
  id v3 = v6;
  if (v2 == -1)
  {
    uint64_t v4 = CXDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_1A6E3A000, v4, OS_LOG_TYPE_DEFAULT, "[WARN] Error querying schema version, possibly because the schema is too old. Error: %@", buf, 0xCu);
    }

    int64_t v2 = 0;
  }

  return v2;
}

- (int64_t)schemaVersionWithError:(id *)a3
{
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = -1;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__CXCallDirectoryStore_schemaVersionWithError___block_invoke;
  v9[3] = &unk_1E5CAE148;
  v9[4] = &v10;
  uint64_t v5 = (void *)MEMORY[0x1AD0C5BA0](v9, a2);
  id v6 = [(CXCallDirectoryStore *)self database];
  [v6 selectSQL:@"SELECT MAX(version) FROM SchemaVersion" withBindings:MEMORY[0x1E4F1CBF0] expectedColumnCount:1 resultRowHandler:v5 error:a3];

  int64_t v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

void __47__CXCallDirectoryStore_schemaVersionWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 objectAtIndexedSubscript:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 longLongValue];
}

- (BOOL)isCorrupt
{
  id v8 = 0;
  int64_t v2 = [(CXCallDirectoryStore *)self schemaVersionWithError:&v8];
  id v3 = v8;
  uint64_t v4 = v3;
  if (v2 == -1)
  {
    id v6 = [v3 domain];
    if ([v6 isEqualToString:@"com.apple.callkit.database.sqlite"]) {
      BOOL v5 = [v4 code] == 11;
    }
    else {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)containsExtensionWithIdentifier:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  int64_t v7 = [(CXCallDirectoryStore *)self database];
  v15[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__CXCallDirectoryStore_containsExtensionWithIdentifier_error___block_invoke;
  v10[3] = &unk_1E5CAE148;
  v10[4] = &v11;
  [v7 selectSQL:@"SELECT EXISTS (SELECT 1 FROM Extension WHERE bundle_id = ?)" withBindings:v8 expectedColumnCount:1 resultRowHandler:v10 error:a4];

  LOBYTE(a4) = *((unsigned char *)v12 + 24) != 0;
  _Block_object_dispose(&v11, 8);

  return (char)a4;
}

void __62__CXCallDirectoryStore_containsExtensionWithIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 firstObject];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 BOOLValue];
}

- (id)extensionWithIdentifier:(id)a3 error:(id *)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v14 = 0;
  char v15 = &v14;
  uint64_t v16 = 0x3032000000;
  BOOL v17 = __Block_byref_object_copy__1;
  objc_super v18 = __Block_byref_object_dispose__1;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__CXCallDirectoryStore_extensionWithIdentifier_error___block_invoke;
  v13[3] = &unk_1E5CAE148;
  v13[4] = &v14;
  int64_t v7 = (void *)MEMORY[0x1AD0C5BA0](v13);
  id v8 = [(CXCallDirectoryStore *)self database];
  v20[0] = v6;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  LODWORD(a4) = [v8 selectSQL:@"SELECT id, bundle_id, priority, state, state_last_modified FROM Extension WHERE bundle_id = ?", v9, 5, v7, a4 withBindings expectedColumnCount resultRowHandler error];

  if (a4) {
    id v10 = (id)v15[5];
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  _Block_object_dispose(&v14, 8);

  return v11;
}

void __54__CXCallDirectoryStore_extensionWithIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_alloc_init(CXCallDirectoryStoreExtension);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  int64_t v7 = [v3 objectAtIndexedSubscript:0];
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "setPrimaryKey:", objc_msgSend(v7, "longLongValue"));

  id v8 = [v3 objectAtIndexedSubscript:1];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setIdentifier:v8];

  uint64_t v9 = [v3 objectAtIndexedSubscript:2];
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "setPriority:", objc_msgSend(v9, "longLongValue"));

  id v10 = [v3 objectAtIndexedSubscript:3];
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "setState:", objc_msgSend(v10, "longLongValue"));

  id v11 = (void *)MEMORY[0x1E4F1C9C8];
  id v13 = [v3 objectAtIndexedSubscript:4];

  [v13 doubleValue];
  uint64_t v12 = objc_msgSend(v11, "dateWithTimeIntervalSince1970:");
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setStateLastModified:v12];
}

- (int64_t)addExtensionWithIdentifier:(id)a3 error:(id *)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int64_t v7 = [(CXCallDirectoryStore *)self database];
  v12[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];

  LODWORD(a4) = [v7 executeSQL:@"INSERT INTO Extension (bundle_id, priority, state_last_modified) VALUES (?, (SELECT IFNULL(MAX(priority), 0) + 1 FROM Extension), ((julianday('now') - 2440587.5)*86400.0))", v8, a4 withBindings error];
  if (!a4) {
    return -1;
  }
  uint64_t v9 = [(CXCallDirectoryStore *)self database];
  int64_t v10 = [v9 lastInsertedRowID];

  notify_post("com.apple.callkit.calldirectorystore.extensionschanged");
  return v10;
}

- (int64_t)addExtensionWithIdentifier:(id)a3 priority:(int64_t)a4 error:(id *)a5
{
  void v15[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [(CXCallDirectoryStore *)self database];
  v15[0] = v8;
  int64_t v10 = [NSNumber numberWithLongLong:a4];
  v15[1] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];

  LODWORD(a5) = [v9 executeSQL:@"INSERT INTO Extension (bundle_id, priority, state_last_modified) VALUES (?, ?, ((julianday('now') - 2440587.5)*86400.0))", v11, a5 withBindings error];
  if (!a5) {
    return -1;
  }
  uint64_t v12 = [(CXCallDirectoryStore *)self database];
  int64_t v13 = [v12 lastInsertedRowID];

  notify_post("com.apple.callkit.calldirectorystore.extensionschanged");
  return v13;
}

- (BOOL)removeExtensionWithIdentifier:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int64_t v7 = [(CXCallDirectoryStore *)self database];
  v13[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];

  int v9 = [v7 executeSQL:@"DELETE FROM Extension WHERE (bundle_id = ?)" withBindings:v8 transient:1 error:a4];
  if (v9)
  {
    int64_t v10 = [(CXCallDirectoryStore *)self database];
    int v11 = [v10 countOfRecordsModifiedByLastQuery];

    if (v11 >= 1) {
      notify_post("com.apple.callkit.calldirectorystore.extensionschanged");
    }
  }
  return v9;
}

- (BOOL)setState:(int64_t)a3 forExtensionWithIdentifier:(id)a4 error:(id *)a5
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  int v9 = [(CXCallDirectoryStore *)self database];
  int64_t v10 = [NSNumber numberWithInteger:a3];
  v16[0] = v10;
  v16[1] = v8;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];

  int v12 = [v9 executeSQL:@"UPDATE Extension SET state = ?, state_last_modified = ((julianday('now') - 2440587.5)*86400.0) WHERE (bundle_id = ?)", v11, a5 withBindings error];
  if (v12)
  {
    int64_t v13 = [(CXCallDirectoryStore *)self database];
    int v14 = [v13 countOfRecordsModifiedByLastQuery];

    if (v14 >= 1) {
      notify_post("com.apple.callkit.calldirectorystore.extensionschanged");
    }
  }
  return v12;
}

- (BOOL)setState:(int64_t)a3 forExtensionWithID:(int64_t)a4 error:(id *)a5
{
  v17[2] = *MEMORY[0x1E4F143B8];
  int v9 = [(CXCallDirectoryStore *)self database];
  int64_t v10 = [NSNumber numberWithInteger:a3];
  v17[0] = v10;
  int v11 = [NSNumber numberWithLongLong:a4];
  v17[1] = v11;
  int v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  int v13 = [v9 executeSQL:@"UPDATE Extension SET state = ?, state_last_modified = ((julianday('now') - 2440587.5)*86400.0) WHERE (id = ?)", v12, a5 withBindings error];

  if (v13)
  {
    int v14 = [(CXCallDirectoryStore *)self database];
    int v15 = [v14 countOfRecordsModifiedByLastQuery];

    if (v15 >= 1) {
      notify_post("com.apple.callkit.calldirectorystore.extensionschanged");
    }
  }
  return v13;
}

- (BOOL)setStateLastModifiedDate:(id)a3 forExtensionWithID:(int64_t)a4 error:(id *)a5
{
  void v20[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  int v9 = [(CXCallDirectoryStore *)self database];
  int64_t v10 = NSNumber;
  [v8 timeIntervalSince1970];
  double v12 = v11;

  int v13 = [v10 numberWithDouble:v12];
  v20[0] = v13;
  int v14 = [NSNumber numberWithLongLong:a4];
  v20[1] = v14;
  int v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  int v16 = [v9 executeSQL:@"UPDATE Extension SET state_last_modified = ? WHERE (id = ?)" withBindings:v15 error:a5];

  if (v16)
  {
    BOOL v17 = [(CXCallDirectoryStore *)self database];
    int v18 = [v17 countOfRecordsModifiedByLastQuery];

    if (v18 >= 1) {
      notify_post("com.apple.callkit.calldirectorystore.extensionschanged");
    }
  }
  return v16;
}

- (BOOL)setStateForAllExtensions:(int64_t)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  int64_t v7 = [(CXCallDirectoryStore *)self database];
  id v8 = [NSNumber numberWithInteger:a3];
  v14[0] = v8;
  int v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  int v10 = [v7 executeSQL:@"UPDATE Extension SET state = ?, state_last_modified = ((julianday('now') - 2440587.5)*86400.0)", v9, a4 withBindings error];

  if (v10)
  {
    double v11 = [(CXCallDirectoryStore *)self database];
    int v12 = [v11 countOfRecordsModifiedByLastQuery];

    if (v12 >= 1) {
      notify_post("com.apple.callkit.calldirectorystore.extensionschanged");
    }
  }
  return v10;
}

- (BOOL)removeUnreferencedRecordsWithError:(id *)a3
{
  BOOL v5 = -[CXCallDirectoryStore _removeUnreferencedPhoneNumbersWithError:](self, "_removeUnreferencedPhoneNumbersWithError:");
  if (v5)
  {
    LOBYTE(v5) = [(CXCallDirectoryStore *)self _removeUnreferencedLabelsWithError:a3];
  }
  return v5;
}

- (BOOL)_removeUnreferencedPhoneNumbersWithError:(id *)a3
{
  uint64_t v4 = [(CXCallDirectoryStore *)self database];
  LOBYTE(a3) = [v4 executeSQL:@"DELETE FROM PhoneNumber WHERE id NOT IN (SELECT DISTINCT phone_number_id FROM PhoneNumberIdentificationEntry UNION SELECT DISTINCT phone_number_id FROM PhoneNumberBlockingEntry)" error:a3];

  return (char)a3;
}

- (BOOL)_removeUnreferencedLabelsWithError:(id *)a3
{
  uint64_t v4 = [(CXCallDirectoryStore *)self database];
  LOBYTE(a3) = [v4 executeSQL:@"DELETE FROM Label WHERE id NOT IN (SELECT DISTINCT label_id FROM PhoneNumberIdentificationEntry)" error:a3];

  return (char)a3;
}

- (id)prioritizedExtensionsWithError:(id *)a3
{
  BOOL v5 = [MEMORY[0x1E4F1CA48] array];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__CXCallDirectoryStore_prioritizedExtensionsWithError___block_invoke;
  v11[3] = &unk_1E5CAE170;
  id v6 = v5;
  id v12 = v6;
  int64_t v7 = (void *)MEMORY[0x1AD0C5BA0](v11);
  id v8 = [(CXCallDirectoryStore *)self database];
  LOBYTE(a3) = [v8 selectSQL:@"SELECT id, bundle_id, priority, state, state_last_modified FROM Extension ORDER BY priority", MEMORY[0x1E4F1CBF0], 5, v7, a3 withBindings expectedColumnCount resultRowHandler error];

  if ((a3 & 1) == 0)
  {

    id v6 = 0;
  }
  int v9 = (void *)[v6 copy];

  return v9;
}

void __55__CXCallDirectoryStore_prioritizedExtensionsWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v11 = objc_alloc_init(CXCallDirectoryStoreExtension);
  uint64_t v4 = [v3 objectAtIndexedSubscript:0];
  -[CXCallDirectoryStoreExtension setPrimaryKey:](v11, "setPrimaryKey:", [v4 longLongValue]);

  BOOL v5 = [v3 objectAtIndexedSubscript:1];
  [(CXCallDirectoryStoreExtension *)v11 setIdentifier:v5];

  id v6 = [v3 objectAtIndexedSubscript:2];
  -[CXCallDirectoryStoreExtension setPriority:](v11, "setPriority:", [v6 longLongValue]);

  int64_t v7 = [v3 objectAtIndexedSubscript:3];
  -[CXCallDirectoryStoreExtension setState:](v11, "setState:", [v7 longLongValue]);

  id v8 = (void *)MEMORY[0x1E4F1C9C8];
  int v9 = [v3 objectAtIndexedSubscript:4];

  [v9 doubleValue];
  int v10 = objc_msgSend(v8, "dateWithTimeIntervalSince1970:");
  [(CXCallDirectoryStoreExtension *)v11 setStateLastModified:v10];

  [*(id *)(a1 + 32) addObject:v11];
}

- (id)prioritizedExtensionIdentifiersWithError:(id *)a3
{
  BOOL v5 = [MEMORY[0x1E4F1CA48] array];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__CXCallDirectoryStore_prioritizedExtensionIdentifiersWithError___block_invoke;
  v11[3] = &unk_1E5CAE170;
  id v6 = v5;
  id v12 = v6;
  int64_t v7 = (void *)MEMORY[0x1AD0C5BA0](v11);
  id v8 = [(CXCallDirectoryStore *)self database];
  LOBYTE(a3) = [v8 selectSQL:@"SELECT bundle_id FROM Extension ORDER BY priority" withBindings:MEMORY[0x1E4F1CBF0] expectedColumnCount:1 resultRowHandler:v7 error:a3];

  if ((a3 & 1) == 0)
  {

    id v6 = 0;
  }
  int v9 = (void *)[v6 copy];

  return v9;
}

void __65__CXCallDirectoryStore_prioritizedExtensionIdentifiersWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 firstObject];
  [*(id *)(a1 + 32) addObject:v3];
}

- (BOOL)setPrioritizedExtensionIdentifiers:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    int64_t v7 = -[CXCallDirectoryStore _sqlCaseMappingPlaceholderStringWithKeyColumnName:defaultValue:numberOfPairs:](self, "_sqlCaseMappingPlaceholderStringWithKeyColumnName:defaultValue:numberOfPairs:", @"bundle_id", @"priority", [v6 count]);
    id v8 = [NSString stringWithFormat:@"UPDATE Extension SET priority = %@", v7];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __65__CXCallDirectoryStore_setPrioritizedExtensionIdentifiers_error___block_invoke;
    v12[3] = &unk_1E5CAE198;
    v12[4] = self;
    id v13 = v6;
    id v14 = v8;
    id v9 = v8;
    BOOL v10 = [(CXCallDirectoryStore *)self performTransactionWithBlock:v12 error:a4];
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

uint64_t __65__CXCallDirectoryStore_setPrioritizedExtensionIdentifiers_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  BOOL v5 = a2;
  id v6 = [*(id *)(a1 + 32) _sqlBindingsForPrioritizedExtensionIdentifiers:*(void *)(a1 + 40) withPriorityOffset:0x3FFFFFFFFFFFFFFFLL];
  int64_t v7 = [*(id *)(a1 + 32) database];
  uint64_t v8 = *(void *)(a1 + 48);
  id v9 = (void *)[v6 copy];
  LODWORD(v8) = [v7 executeSQL:v8 withBindings:v9 error:a3];

  if (!v8) {
    goto LABEL_4;
  }
  BOOL v10 = [*(id *)(a1 + 32) _sqlBindingsForPrioritizedExtensionIdentifiers:*(void *)(a1 + 40) withPriorityOffset:0];
  double v11 = [*(id *)(a1 + 32) database];
  uint64_t v12 = *(void *)(a1 + 48);
  id v13 = (void *)[v10 copy];
  int v14 = [v11 executeSQL:v12 withBindings:v13 error:a3];

  if (v14)
  {
    notify_post("com.apple.callkit.calldirectorystore.extensionschanged");
    uint64_t v15 = 1;
  }
  else
  {
LABEL_4:
    id v20 = 0;
    char v16 = v5[2](v5, &v20);
    id v17 = v20;
    if ((v16 & 1) == 0)
    {
      int v18 = CXDefaultLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        __65__CXCallDirectoryStore_setPrioritizedExtensionIdentifiers_error___block_invoke_cold_1();
      }
    }
    uint64_t v15 = 0;
  }

  return v15;
}

- (id)_sqlCaseMappingPlaceholderStringWithKeyColumnName:(id)a3 defaultValue:(id)a4 numberOfPairs:(unint64_t)a5
{
  id v7 = a4;
  for (i = [MEMORY[0x1E4F28E78] stringWithFormat:@"CASE %@ ", a3];
    [i appendFormat:@"WHEN ? THEN ? "];
  [i appendFormat:@"ELSE %@ END", v7];
  id v9 = (void *)[i copy];

  return v9;
}

- (id)_sqlBindingsForPrioritizedExtensionIdentifiers:(id)a3 withPriorityOffset:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(v6, "addObject:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        uint64_t v12 = [NSNumber numberWithLongLong:a4 + i + 1];
        [v6 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      a4 += i;
    }
    while (v9);
  }

  id v13 = (void *)[v6 copy];

  return v13;
}

- (BOOL)addBlockingEntryWithPhoneNumber:(int64_t)a3 extensionID:(int64_t)a4 error:(id *)a5
{
  uint64_t v9 = objc_alloc_init(CXCallDirectoryMutablePhoneNumberEntryData);
  [(CXCallDirectoryMutablePhoneNumberEntryData *)v9 appendPhoneNumber:a3];
  LOBYTE(a5) = [(CXCallDirectoryStore *)self addBlockingEntriesWithData:v9 extensionID:a4 error:a5];

  return (char)a5;
}

- (BOOL)addBlockingEntriesWithData:(id)a3 extensionID:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [(CXCallDirectoryStore *)self database];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __69__CXCallDirectoryStore_addBlockingEntriesWithData_extensionID_error___block_invoke;
  v12[3] = &unk_1E5CAE1C0;
  id v13 = v8;
  int v14 = self;
  int64_t v15 = a4;
  id v10 = v8;
  LOBYTE(a5) = [v9 performTransactionWithBlock:v12 error:a5];

  return (char)a5;
}

uint64_t __69__CXCallDirectoryStore_addBlockingEntriesWithData_extensionID_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) count])
  {
    unint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = [*(id *)(a1 + 32) count];
      uint64_t v8 = v7 - v6 >= 0x1F4 ? 500 : v7 - v6;
      if (([*(id *)(a1 + 40) _addBlockingEntriesWithData:*(void *)(a1 + 32) startIndex:v6 count:v8 extensionID:*(void *)(a1 + 48) error:a3] & 1) == 0)break; {
      v6 += v8;
      }
      if (v6 >= [*(id *)(a1 + 32) count]) {
        goto LABEL_8;
      }
    }
    id v14 = 0;
    char v10 = v5[2](v5, &v14);
    id v11 = v14;
    if ((v10 & 1) == 0)
    {
      uint64_t v12 = CXDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __69__CXCallDirectoryStore_addBlockingEntriesWithData_extensionID_error___block_invoke_cold_1();
      }
    }
    uint64_t v9 = 0;
  }
  else
  {
LABEL_8:
    uint64_t v9 = 1;
  }

  return v9;
}

- (BOOL)_addBlockingEntriesWithData:(id)a3 startIndex:(unint64_t)a4 count:(unint64_t)a5 extensionID:(int64_t)a6 error:(id *)a7
{
  id v12 = a3;
  if (a5)
  {
    if ([(CXCallDirectoryStore *)self lastAddBlockingEntriesCount] != a5)
    {
      id v13 = [(CXCallDirectoryStore *)self _sqlValuesListPlaceholderStringWithNumberOfEntries:a5 entryString:@"(?, (SELECT id FROM PhoneNumber WHERE (number = ?)))"];
      id v14 = [NSString stringWithFormat:@"INSERT INTO PhoneNumberBlockingEntry (extension_id, phone_number_id) VALUES %@", v13];
      [(CXCallDirectoryStore *)self setAddBlockingEntriesInsertPhoneNumberBlockingEntrySQL:v14];

      [(CXCallDirectoryStore *)self setLastAddBlockingEntriesCount:a5];
    }
    if ([(CXCallDirectoryStore *)self _addPhoneNumbersWithEntryData:v12 startIndex:a4 count:a5 error:a7])
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      void v20[2] = __87__CXCallDirectoryStore__addBlockingEntriesWithData_startIndex_count_extensionID_error___block_invoke;
      void v20[3] = &unk_1E5CAE1E8;
      unint64_t v22 = a5;
      unint64_t v23 = a4;
      int64_t v24 = a6;
      id v21 = v12;
      int64_t v15 = (void *)MEMORY[0x1AD0C5BA0](v20);
      long long v16 = [(CXCallDirectoryStore *)self database];
      long long v17 = [(CXCallDirectoryStore *)self addBlockingEntriesInsertPhoneNumberBlockingEntrySQL];
      char v18 = [v16 executeSQL:v17 withStatementPreparationBlock:v15 error:a7];
    }
    else
    {
      char v18 = 0;
    }
  }
  else
  {
    char v18 = 1;
  }

  return v18;
}

BOOL __87__CXCallDirectoryStore__addBlockingEntriesWithData_startIndex_count_extensionID_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  unint64_t v6 = 0;
  uint64_t v7 = 1;
  do
  {
    unint64_t v8 = v6;
    unint64_t v9 = *(void *)(a1 + 40);
    if (v9 <= v6) {
      break;
    }
    uint64_t v10 = *(void *)(a1 + 48);
    if (![v5 bindInt64:*(void *)(a1 + 56) atIndex:v7 error:a3]) {
      break;
    }
    char v11 = objc_msgSend(v5, "bindInt64:atIndex:error:", objc_msgSend(*(id *)(a1 + 32), "phoneNumberAtIndex:", (int)v8 + (int)v10), (v7 + 1), a3);
    unint64_t v6 = v8 + 1;
    uint64_t v7 = (v7 + 2);
  }
  while ((v11 & 1) != 0);

  return v9 <= v8;
}

- (BOOL)removeBlockingEntriesWithData:(id)a3 extensionID:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  unint64_t v9 = [(CXCallDirectoryStore *)self database];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __72__CXCallDirectoryStore_removeBlockingEntriesWithData_extensionID_error___block_invoke;
  v12[3] = &unk_1E5CAE1C0;
  id v13 = v8;
  id v14 = self;
  int64_t v15 = a4;
  id v10 = v8;
  LOBYTE(a5) = [v9 performTransactionWithBlock:v12 error:a5];

  return (char)a5;
}

uint64_t __72__CXCallDirectoryStore_removeBlockingEntriesWithData_extensionID_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) count])
  {
    unint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = [*(id *)(a1 + 32) count];
      uint64_t v8 = v7 - v6 >= 0x1F4 ? 500 : v7 - v6;
      if (([*(id *)(a1 + 40) _removeBlockingEntriesWithData:*(void *)(a1 + 32) startIndex:v6 count:v8 extensionID:*(void *)(a1 + 48) error:a3] & 1) == 0)break; {
      v6 += v8;
      }
      if (v6 >= [*(id *)(a1 + 32) count]) {
        goto LABEL_8;
      }
    }
    id v14 = 0;
    char v10 = v5[2](v5, &v14);
    id v11 = v14;
    if ((v10 & 1) == 0)
    {
      id v12 = CXDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __69__CXCallDirectoryStore_addBlockingEntriesWithData_extensionID_error___block_invoke_cold_1();
      }
    }
    uint64_t v9 = 0;
  }
  else
  {
LABEL_8:
    uint64_t v9 = 1;
  }

  return v9;
}

- (BOOL)_removeBlockingEntriesWithData:(id)a3 startIndex:(unint64_t)a4 count:(unint64_t)a5 extensionID:(int64_t)a6 error:(id *)a7
{
  id v12 = a3;
  if (a5)
  {
    if ([(CXCallDirectoryStore *)self lastRemoveBlockingEntriesCount] != a5)
    {
      id v13 = [(CXCallDirectoryStore *)self _sqlStringListPlaceholderStringWithNumberOfEntries:a5];
      id v14 = [NSString stringWithFormat:@"DELETE FROM PhoneNumberBlockingEntry WHERE extension_id = ? AND phone_number_id IN (SELECT id FROM PhoneNumber WHERE number IN %@)", v13];
      [(CXCallDirectoryStore *)self setRemoveBlockingEntriesSQL:v14];

      [(CXCallDirectoryStore *)self setLastRemoveBlockingEntriesCount:a5];
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    void v20[2] = __90__CXCallDirectoryStore__removeBlockingEntriesWithData_startIndex_count_extensionID_error___block_invoke;
    void v20[3] = &unk_1E5CAE1E8;
    int64_t v22 = a6;
    unint64_t v23 = a5;
    unint64_t v24 = a4;
    id v21 = v12;
    int64_t v15 = (void *)MEMORY[0x1AD0C5BA0](v20);
    long long v16 = [(CXCallDirectoryStore *)self database];
    long long v17 = [(CXCallDirectoryStore *)self removeBlockingEntriesSQL];
    char v18 = [v16 executeSQL:v17 withStatementPreparationBlock:v15 error:a7];
  }
  else
  {
    char v18 = 1;
  }

  return v18;
}

BOOL __90__CXCallDirectoryStore__removeBlockingEntriesWithData_startIndex_count_extensionID_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([v5 bindInt64:*(void *)(a1 + 40) atIndex:1 error:a3])
  {
    unint64_t v6 = 0;
    do
    {
      unint64_t v7 = *(void *)(a1 + 48);
      BOOL v8 = v7 <= v6;
      if (v7 <= v6) {
        break;
      }
      char v9 = objc_msgSend(v5, "bindInt64:atIndex:error:", objc_msgSend(*(id *)(a1 + 32), "phoneNumberAtIndex:", (int)v6 + *(_DWORD *)(a1 + 56)), (v6 + 2), a3);
      ++v6;
    }
    while ((v9 & 1) != 0);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)removeBlockingEntriesForExtensionWithID:(int64_t)a3 error:(id *)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  unint64_t v6 = [(CXCallDirectoryStore *)self database];
  unint64_t v7 = [NSNumber numberWithLongLong:a3];
  v10[0] = v7;
  BOOL v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  LOBYTE(a4) = [v6 executeSQL:@"DELETE FROM PhoneNumberBlockingEntry WHERE extension_id = ?" withBindings:v8 error:a4];

  return (char)a4;
}

- (BOOL)addIdentificationEntryWithPhoneNumber:(int64_t)a3 labelID:(int64_t)a4 extensionID:(int64_t)a5 error:(id *)a6
{
  v19[3] = *MEMORY[0x1E4F143B8];
  int64_t v10 = [(CXCallDirectoryStore *)self _findOrCreateIDForPhoneNumber:a3 error:a6];
  if (v10 == -1) {
    return 0;
  }
  int64_t v11 = v10;
  id v12 = [(CXCallDirectoryStore *)self database];
  id v13 = [NSNumber numberWithLongLong:a5];
  id v14 = objc_msgSend(NSNumber, "numberWithLongLong:", v11, v13);
  v19[1] = v14;
  int64_t v15 = [NSNumber numberWithLongLong:a4];
  v19[2] = v15;
  long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
  char v17 = [v12 executeSQL:@"INSERT INTO PhoneNumberIdentificationEntry (extension_id, phone_number_id, label_id) VALUES (?, ?, ?)", v16, a6 withBindings error];

  return v17;
}

- (int64_t)_findOrCreateIDForPhoneNumber:(int64_t)a3 error:(id *)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  int64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = -1;
  unint64_t v6 = [NSNumber numberWithLongLong:a3];
  v18[0] = v6;
  unint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];

  BOOL v8 = [(CXCallDirectoryStore *)self database];
  int v9 = [v8 executeSQL:@"INSERT OR IGNORE INTO PhoneNumber (number) VALUES (?)" withBindings:v7 error:a4];

  if (v9)
  {
    int64_t v10 = [(CXCallDirectoryStore *)self database];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __60__CXCallDirectoryStore__findOrCreateIDForPhoneNumber_error___block_invoke;
    v13[3] = &unk_1E5CAE148;
    v13[4] = &v14;
    [v10 selectSQL:@"SELECT id FROM PhoneNumber WHERE (number = ?)" withBindings:v7 expectedColumnCount:1 resultRowHandler:v13 error:a4];
  }
  int64_t v11 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v11;
}

void __60__CXCallDirectoryStore__findOrCreateIDForPhoneNumber_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 firstObject];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 longLongValue];
}

- (int64_t)idForExtensionWithIdentifier:(id)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = -1;
  v16[0] = v6;
  unint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  BOOL v8 = [(CXCallDirectoryStore *)self database];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__CXCallDirectoryStore_idForExtensionWithIdentifier_error___block_invoke;
  v11[3] = &unk_1E5CAE148;
  void v11[4] = &v12;
  [v8 selectSQL:@"SELECT id FROM Extension WHERE (bundle_id = ?)" withBindings:v7 expectedColumnCount:1 resultRowHandler:v11 error:a4];

  int64_t v9 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __59__CXCallDirectoryStore_idForExtensionWithIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 firstObject];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 longLongValue];
}

- (int64_t)idForPhoneNumber:(int64_t)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = -1;
  id v6 = [NSNumber numberWithLongLong:a3];
  v16[0] = v6;
  unint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];

  BOOL v8 = [(CXCallDirectoryStore *)self database];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__CXCallDirectoryStore_idForPhoneNumber_error___block_invoke;
  v11[3] = &unk_1E5CAE148;
  void v11[4] = &v12;
  [v8 selectSQL:@"SELECT id FROM PhoneNumber WHERE (number = ?)" withBindings:v7 expectedColumnCount:1 resultRowHandler:v11 error:a4];

  int64_t v9 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v9;
}

void __47__CXCallDirectoryStore_idForPhoneNumber_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 firstObject];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 longLongValue];
}

- (int64_t)idForLabel:(id)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = -1;
  v16[0] = v6;
  unint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  BOOL v8 = [(CXCallDirectoryStore *)self database];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __41__CXCallDirectoryStore_idForLabel_error___block_invoke;
  v11[3] = &unk_1E5CAE148;
  void v11[4] = &v12;
  [v8 selectSQL:@"SELECT id FROM Label WHERE (localized_label = ?)" withBindings:v7 expectedColumnCount:1 resultRowHandler:v11 error:a4];

  int64_t v9 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __41__CXCallDirectoryStore_idForLabel_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 firstObject];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 longLongValue];
}

- (int64_t)addLabel:(id)a3 error:(id *)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a3;
  BOOL v8 = [v6 arrayWithObjects:&v13 count:1];

  int64_t v9 = [(CXCallDirectoryStore *)self database];
  LODWORD(a4) = [v9 executeSQL:@"INSERT INTO Label (localized_label) VALUES (?)" withBindings:v8 error:a4];

  if (a4)
  {
    int64_t v10 = [(CXCallDirectoryStore *)self database];
    int64_t v11 = [v10 lastInsertedRowID];
  }
  else
  {
    int64_t v11 = -1;
  }

  return v11;
}

- (BOOL)addIdentificationEntriesWithData:(id)a3 extensionID:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  int64_t v9 = [(CXCallDirectoryStore *)self database];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __75__CXCallDirectoryStore_addIdentificationEntriesWithData_extensionID_error___block_invoke;
  v12[3] = &unk_1E5CAE1C0;
  id v13 = v8;
  uint64_t v14 = self;
  int64_t v15 = a4;
  id v10 = v8;
  LOBYTE(a5) = [v9 performTransactionWithBlock:v12 error:a5];

  return (char)a5;
}

uint64_t __75__CXCallDirectoryStore_addIdentificationEntriesWithData_extensionID_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) count])
  {
    unint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = [*(id *)(a1 + 32) count];
      uint64_t v8 = v7 - v6 >= 0x1F4 ? 500 : v7 - v6;
      if (([*(id *)(a1 + 40) _addIdentificationEntriesWithData:*(void *)(a1 + 32) startIndex:v6 count:v8 extensionID:*(void *)(a1 + 48) error:a3] & 1) == 0)break; {
      v6 += v8;
      }
      if (v6 >= [*(id *)(a1 + 32) count]) {
        goto LABEL_8;
      }
    }
    id v14 = 0;
    char v10 = v5[2](v5, &v14);
    id v11 = v14;
    if ((v10 & 1) == 0)
    {
      uint64_t v12 = CXDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __69__CXCallDirectoryStore_addBlockingEntriesWithData_extensionID_error___block_invoke_cold_1();
      }
    }
    uint64_t v9 = 0;
  }
  else
  {
LABEL_8:
    uint64_t v9 = 1;
  }

  return v9;
}

- (BOOL)_addIdentificationEntriesWithData:(id)a3 startIndex:(unint64_t)a4 count:(unint64_t)a5 extensionID:(int64_t)a6 error:(id *)a7
{
  id v12 = a3;
  if (a5)
  {
    if ([(CXCallDirectoryStore *)self lastAddIdentificationEntriesCount] != a5)
    {
      id v13 = [(CXCallDirectoryStore *)self _sqlValuesListPlaceholderStringWithNumberOfEntries:a5 entryString:@"(?)"];
      id v14 = [NSString stringWithFormat:@"INSERT OR IGNORE INTO Label (localized_label) VALUES %@", v13];
      [(CXCallDirectoryStore *)self setAddIdentificationEntriesInsertLabelsSQL:v14];

      int64_t v15 = [(CXCallDirectoryStore *)self _sqlValuesListPlaceholderStringWithNumberOfEntries:a5 entryString:@"(?, (SELECT id FROM PhoneNumber WHERE (number = ?)), (SELECT id FROM Label WHERE (localized_label = ?)))"];
      uint64_t v16 = [NSString stringWithFormat:@"INSERT INTO PhoneNumberIdentificationEntry (extension_id, phone_number_id, label_id) VALUES %@", v15];
      [(CXCallDirectoryStore *)self setAddIdentificationEntriesInsertPhoneNumberIdentificationEntrySQL:v16];

      [(CXCallDirectoryStore *)self setLastAddIdentificationEntriesCount:a5];
    }
    if ([(CXCallDirectoryStore *)self _addPhoneNumbersWithEntryData:v12 startIndex:a4 count:a5 error:a7])
    {
      int64_t v27 = a6;
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __93__CXCallDirectoryStore__addIdentificationEntriesWithData_startIndex_count_extensionID_error___block_invoke;
      v33[3] = &unk_1E5CAE210;
      unint64_t v35 = a5;
      unint64_t v36 = a4;
      id v17 = v12;
      id v34 = v17;
      char v18 = (void *)MEMORY[0x1AD0C5BA0](v33);
      id v19 = [(CXCallDirectoryStore *)self database];
      uint64_t v20 = [(CXCallDirectoryStore *)self addIdentificationEntriesInsertLabelsSQL];
      int v21 = [v19 executeSQL:v20 withStatementPreparationBlock:v18 error:a7];

      if (v21)
      {
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __93__CXCallDirectoryStore__addIdentificationEntriesWithData_startIndex_count_extensionID_error___block_invoke_2;
        v28[3] = &unk_1E5CAE1E8;
        unint64_t v30 = a5;
        unint64_t v31 = a4;
        id v29 = v17;
        int64_t v32 = v27;
        int64_t v22 = (void *)MEMORY[0x1AD0C5BA0](v28);
        unint64_t v23 = [(CXCallDirectoryStore *)self database];
        unint64_t v24 = [(CXCallDirectoryStore *)self addIdentificationEntriesInsertPhoneNumberIdentificationEntrySQL];
        char v25 = [v23 executeSQL:v24 withStatementPreparationBlock:v22 error:a7];
      }
      else
      {
        char v25 = 0;
      }
    }
    else
    {
      char v25 = 0;
    }
  }
  else
  {
    char v25 = 1;
  }

  return v25;
}

uint64_t __93__CXCallDirectoryStore__addIdentificationEntriesWithData_startIndex_count_extensionID_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (*(void *)(a1 + 40))
  {
    unint64_t v6 = 0;
    while (1)
    {
      int v7 = v6 + *(_DWORD *)(a1 + 48);
      unsigned __int16 v11 = 0;
      uint64_t v8 = [*(id *)(a1 + 32) utf8LabelAtIndex:v7 length:&v11];
      if (!v8) {
        break;
      }
      uint64_t v9 = [v5 bindText:v8 ofLength:v11 atIndex:++v6 error:a3];
      if ((v9 & 1) == 0 || *(void *)(a1 + 40) <= v6) {
        goto LABEL_9;
      }
    }
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = 1;
  }
LABEL_9:

  return v9;
}

uint64_t __93__CXCallDirectoryStore__addIdentificationEntriesWithData_startIndex_count_extensionID_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (*(void *)(a1 + 40))
  {
    unint64_t v6 = 0;
    uint64_t v7 = 3;
    while (1)
    {
      uint64_t v8 = (int)v6 + *(_DWORD *)(a1 + 48);
      uint64_t v9 = [*(id *)(a1 + 32) phoneNumberAtIndex:v8];
      unsigned __int16 v13 = 0;
      uint64_t v10 = [*(id *)(a1 + 32) utf8LabelAtIndex:v8 length:&v13];
      if (![v5 bindInt64:*(void *)(a1 + 56) atIndex:(v7 - 2) error:a3]
        || ([v5 bindInt64:v9 atIndex:(v7 - 1) error:a3] & 1) == 0)
      {
        break;
      }
      uint64_t v11 = [v5 bindText:v10 ofLength:v13 atIndex:v7 error:a3];
      if (v11)
      {
        ++v6;
        uint64_t v7 = (v7 + 3);
        if (*(void *)(a1 + 40) > v6) {
          continue;
        }
      }
      goto LABEL_10;
    }
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = 1;
  }
LABEL_10:

  return v11;
}

- (BOOL)_addPhoneNumbersWithEntryData:(id)a3 startIndex:(unint64_t)a4 count:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  if (a5)
  {
    if ([(CXCallDirectoryStore *)self lastAddPhoneNumbersCount] != a5)
    {
      uint64_t v11 = [(CXCallDirectoryStore *)self _sqlValuesListPlaceholderStringWithNumberOfEntries:a5 entryString:@"(?)"];
      id v12 = [NSString stringWithFormat:@"INSERT OR IGNORE INTO PhoneNumber (number) VALUES %@", v11];
      [(CXCallDirectoryStore *)self setAddPhoneNumbersSQL:v12];

      [(CXCallDirectoryStore *)self setLastAddPhoneNumbersCount:a5];
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __77__CXCallDirectoryStore__addPhoneNumbersWithEntryData_startIndex_count_error___block_invoke;
    v18[3] = &unk_1E5CAE210;
    unint64_t v20 = a5;
    unint64_t v21 = a4;
    id v19 = v10;
    unsigned __int16 v13 = (void *)MEMORY[0x1AD0C5BA0](v18);
    id v14 = [(CXCallDirectoryStore *)self database];
    int64_t v15 = [(CXCallDirectoryStore *)self addPhoneNumbersSQL];
    char v16 = [v14 executeSQL:v15 withStatementPreparationBlock:v13 error:a6];
  }
  else
  {
    char v16 = 1;
  }

  return v16;
}

BOOL __77__CXCallDirectoryStore__addPhoneNumbersWithEntryData_startIndex_count_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  unint64_t v6 = 0;
  do
  {
    unint64_t v7 = v6;
    unint64_t v8 = *(void *)(a1 + 40);
    if (v8 <= v6) {
      break;
    }
    uint64_t v9 = [*(id *)(a1 + 32) phoneNumberAtIndex:(int)v6++ + *(_DWORD *)(a1 + 48)];
  }
  while (([v5 bindInt64:v9 atIndex:v7 + 1 error:a3] & 1) != 0);

  return v8 <= v7;
}

- (BOOL)removeIdentificationEntriesWithData:(id)a3 extensionID:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [(CXCallDirectoryStore *)self database];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __78__CXCallDirectoryStore_removeIdentificationEntriesWithData_extensionID_error___block_invoke;
  v12[3] = &unk_1E5CAE1C0;
  id v13 = v8;
  id v14 = self;
  int64_t v15 = a4;
  id v10 = v8;
  LOBYTE(a5) = [v9 performTransactionWithBlock:v12 error:a5];

  return (char)a5;
}

uint64_t __78__CXCallDirectoryStore_removeIdentificationEntriesWithData_extensionID_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) count])
  {
    unint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = [*(id *)(a1 + 32) count];
      uint64_t v8 = v7 - v6 >= 0x1F4 ? 500 : v7 - v6;
      if (([*(id *)(a1 + 40) _removeIdentificationEntriesWithData:*(void *)(a1 + 32) startIndex:v6 count:v8 extensionID:*(void *)(a1 + 48) error:a3] & 1) == 0)break; {
      v6 += v8;
      }
      if (v6 >= [*(id *)(a1 + 32) count]) {
        goto LABEL_8;
      }
    }
    id v14 = 0;
    char v10 = v5[2](v5, &v14);
    id v11 = v14;
    if ((v10 & 1) == 0)
    {
      id v12 = CXDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __69__CXCallDirectoryStore_addBlockingEntriesWithData_extensionID_error___block_invoke_cold_1();
      }
    }
    uint64_t v9 = 0;
  }
  else
  {
LABEL_8:
    uint64_t v9 = 1;
  }

  return v9;
}

- (BOOL)_removeIdentificationEntriesWithData:(id)a3 startIndex:(unint64_t)a4 count:(unint64_t)a5 extensionID:(int64_t)a6 error:(id *)a7
{
  id v12 = a3;
  if (a5)
  {
    if ([(CXCallDirectoryStore *)self lastRemoveIdentificationEntriesCount] != a5)
    {
      id v13 = [(CXCallDirectoryStore *)self _sqlStringListPlaceholderStringWithNumberOfEntries:a5];
      id v14 = [NSString stringWithFormat:@"DELETE FROM PhoneNumberIdentificationEntry WHERE extension_id = ? AND phone_number_id IN (SELECT id FROM PhoneNumber WHERE number IN %@)", v13];
      [(CXCallDirectoryStore *)self setRemoveIdentificationEntriesSQL:v14];

      [(CXCallDirectoryStore *)self setLastRemoveIdentificationEntriesCount:a5];
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    void v20[2] = __96__CXCallDirectoryStore__removeIdentificationEntriesWithData_startIndex_count_extensionID_error___block_invoke;
    void v20[3] = &unk_1E5CAE1E8;
    int64_t v22 = a6;
    unint64_t v23 = a5;
    unint64_t v24 = a4;
    id v21 = v12;
    int64_t v15 = (void *)MEMORY[0x1AD0C5BA0](v20);
    char v16 = [(CXCallDirectoryStore *)self database];
    id v17 = [(CXCallDirectoryStore *)self removeIdentificationEntriesSQL];
    char v18 = [v16 executeSQL:v17 withStatementPreparationBlock:v15 error:a7];
  }
  else
  {
    char v18 = 1;
  }

  return v18;
}

BOOL __96__CXCallDirectoryStore__removeIdentificationEntriesWithData_startIndex_count_extensionID_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([v5 bindInt64:*(void *)(a1 + 40) atIndex:1 error:a3])
  {
    unint64_t v6 = 0;
    do
    {
      unint64_t v7 = *(void *)(a1 + 48);
      BOOL v8 = v7 <= v6;
      if (v7 <= v6) {
        break;
      }
      char v9 = objc_msgSend(v5, "bindInt64:atIndex:error:", objc_msgSend(*(id *)(a1 + 32), "phoneNumberAtIndex:", (int)v6 + *(_DWORD *)(a1 + 56)), (v6 + 2), a3);
      ++v6;
    }
    while ((v9 & 1) != 0);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)removeIdentificationEntriesForExtensionWithID:(int64_t)a3 error:(id *)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  unint64_t v6 = [(CXCallDirectoryStore *)self database];
  unint64_t v7 = [NSNumber numberWithLongLong:a3];
  v10[0] = v7;
  BOOL v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  LOBYTE(a4) = [v6 executeSQL:@"DELETE FROM PhoneNumberIdentificationEntry WHERE extension_id = ?" withBindings:v8 error:a4];

  return (char)a4;
}

- (BOOL)performTransactionWithBlock:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = [(CXCallDirectoryStore *)self database];
  LOBYTE(a4) = [v7 performTransactionWithBlock:v6 error:a4];

  return (char)a4;
}

- (BOOL)containsBlockingEntryWithPhoneNumber:(id)a3 error:(id *)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a3;
  BOOL v8 = [v6 arrayWithObjects:&v10 count:1];

  LOBYTE(a4) = -[CXCallDirectoryStore containsBlockingEntryWithPhoneNumberInArray:error:](self, "containsBlockingEntryWithPhoneNumberInArray:error:", v8, a4, v10, v11);
  return (char)a4;
}

- (BOOL)containsBlockingEntryWithPhoneNumberInArray:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = -[CXCallDirectoryStore _sqlStringListPlaceholderStringWithNumberOfEntries:](self, "_sqlStringListPlaceholderStringWithNumberOfEntries:", [v6 count]);
  BOOL v8 = [NSString stringWithFormat:@"SELECT EXISTS(SELECT 1 FROM PhoneNumberBlockingEntry INNER JOIN PhoneNumber ON (PhoneNumber.id = PhoneNumberBlockingEntry.phone_number_id) WHERE (PhoneNumber.number IN %@) LIMIT 1)", v7];
  LOBYTE(a4) = [(CXCallDirectoryStore *)self _containsBlockingEntryWithSQL:v8 bindings:v6 error:a4];

  return (char)a4;
}

- (BOOL)containsBlockingEntryForEnabledExtensionWithPhoneNumber:(id)a3 error:(id *)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a3;
  BOOL v8 = [v6 arrayWithObjects:&v10 count:1];

  LOBYTE(a4) = -[CXCallDirectoryStore containsBlockingEntryForEnabledExtensionWithPhoneNumberInArray:error:](self, "containsBlockingEntryForEnabledExtensionWithPhoneNumberInArray:error:", v8, a4, v10, v11);
  return (char)a4;
}

- (BOOL)containsBlockingEntryForEnabledExtensionWithPhoneNumberInArray:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = -[CXCallDirectoryStore _sqlStringListPlaceholderStringWithNumberOfEntries:](self, "_sqlStringListPlaceholderStringWithNumberOfEntries:", [v6 count]);
  BOOL v8 = [NSString stringWithFormat:@"SELECT EXISTS(SELECT 1 FROM PhoneNumberBlockingEntry INNER JOIN PhoneNumber ON (PhoneNumber.id = PhoneNumberBlockingEntry.phone_number_id) INNER JOIN Extension ON (Extension.id = PhoneNumberBlockingEntry.extension_id) WHERE (Extension.state = %ld AND PhoneNumber.number IN %@) LIMIT 1)", 4, v7];
  LOBYTE(a4) = [(CXCallDirectoryStore *)self _containsBlockingEntryWithSQL:v8 bindings:v6 error:a4];

  return (char)a4;
}

- (BOOL)_containsBlockingEntryWithSQL:(id)a3 bindings:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  id v10 = [(CXCallDirectoryStore *)self database];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __69__CXCallDirectoryStore__containsBlockingEntryWithSQL_bindings_error___block_invoke;
  v12[3] = &unk_1E5CAE148;
  void v12[4] = &v13;
  [v10 selectSQL:v8 withBindings:v9 expectedColumnCount:1 resultRowHandler:v12 error:a5];

  LOBYTE(a5) = *((unsigned char *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return (char)a5;
}

void __69__CXCallDirectoryStore__containsBlockingEntryWithSQL_bindings_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 firstObject];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 BOOLValue];
}

- (id)firstEnabledBlockingExtensionIdentifierForPhoneNumber:(id)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"SELECT extension.bundle_id FROM Extension INNER JOIN PhoneNumberBlockingEntry ON PhoneNumberBlockingEntry.extension_id = Extension.id INNER JOIN PhoneNumber ON PhoneNumber.id = PhoneNumberBlockingEntry.phone_number_id WHERE (Extension.state = %ld AND PhoneNumber.number = ?) ORDER BY Extension.priority LIMIT 1", 4);
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  char v16 = __Block_byref_object_copy__1;
  id v17 = __Block_byref_object_dispose__1;
  id v18 = 0;
  id v8 = [(CXCallDirectoryStore *)self database];
  v19[0] = v6;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __84__CXCallDirectoryStore_firstEnabledBlockingExtensionIdentifierForPhoneNumber_error___block_invoke;
  v12[3] = &unk_1E5CAE148;
  void v12[4] = &v13;
  [v8 selectSQL:v7 withBindings:v9 expectedColumnCount:1 resultRowHandler:v12 error:a4];

  id v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __84__CXCallDirectoryStore_firstEnabledBlockingExtensionIdentifierForPhoneNumber_error___block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 firstObject];
  uint64_t v3 = [v6 stringValue];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)firstIdentificationEntryForPhoneNumber:(id)a3 error:(id *)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a3;
  id v8 = [v6 arrayWithObjects:&v11 count:1];

  id v9 = [(CXCallDirectoryStore *)self _firstIdentificationEntryForSQL:@"SELECT Extension.bundle_id, Label.localized_label FROM Label INNER JOIN PhoneNumberIdentificationEntry ON (Label.id = PhoneNumberIdentificationEntry.label_id) INNER JOIN PhoneNumber ON (PhoneNumber.id = PhoneNumberIdentificationEntry.phone_number_id) INNER JOIN Extension ON (Extension.id = PhoneNumberIdentificationEntry.extension_id) WHERE (PhoneNumber.number = ?) ORDER BY Extension.priority LIMIT 1", v8, a4, v11, v12 bindings error];

  return v9;
}

- (id)firstIdentificationEntriesForPhoneNumbers:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = -[CXCallDirectoryStore _sqlStringListPlaceholderStringWithNumberOfEntries:](self, "_sqlStringListPlaceholderStringWithNumberOfEntries:", [v6 count]);
  id v8 = [NSString stringWithFormat:@"SELECT Extension.bundle_id, Label.localized_label, PhoneNumber.number FROM Label INNER JOIN PhoneNumberIdentificationEntry ON (Label.id = PhoneNumberIdentificationEntry.label_id) INNER JOIN PhoneNumber ON (PhoneNumber.id = PhoneNumberIdentificationEntry.phone_number_id) INNER JOIN Extension ON (Extension.id = PhoneNumberIdentificationEntry.extension_id) WHERE (PhoneNumber.number IN %@) GROUP BY PhoneNumber.number HAVING MIN(Extension.priority)", v7];
  id v9 = [(CXCallDirectoryStore *)self _firstIdentificationEntriesForSQL:v8 bindings:v6 error:a4];

  return v9;
}

- (id)firstIdentificationEntryForEnabledExtensionWithPhoneNumber:(id)a3 error:(id *)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = NSString;
  id v7 = a3;
  id v8 = [v6 stringWithFormat:@"SELECT Extension.bundle_id, Label.localized_label FROM Label INNER JOIN PhoneNumberIdentificationEntry ON (Label.id = PhoneNumberIdentificationEntry.label_id) INNER JOIN PhoneNumber ON (PhoneNumber.id = PhoneNumberIdentificationEntry.phone_number_id) INNER JOIN Extension ON (Extension.id = PhoneNumberIdentificationEntry.extension_id) WHERE (Extension.state = %ld AND PhoneNumber.number = ?) ORDER BY Extension.priority LIMIT 1", 4];
  v12[0] = v7;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];

  id v10 = [(CXCallDirectoryStore *)self _firstIdentificationEntryForSQL:v8 bindings:v9 error:a4];

  return v10;
}

- (id)_firstIdentificationEntryForSQL:(id)a3 bindings:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__1;
  id v18 = __Block_byref_object_dispose__1;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __71__CXCallDirectoryStore__firstIdentificationEntryForSQL_bindings_error___block_invoke;
  v13[3] = &unk_1E5CAE238;
  v13[4] = &v14;
  id v10 = (void *)MEMORY[0x1AD0C5BA0](v13);
  [(CXCallDirectoryStore *)self _parseIdentificationEntriesForSQL:v8 bindings:v9 handler:v10 error:a5];
  id v11 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v11;
}

void __71__CXCallDirectoryStore__firstIdentificationEntryForSQL_bindings_error___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __73__CXCallDirectoryStore__firstIdentificationEntriesForSQL_bindings_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

void __86__CXCallDirectoryStore__parseFirstIdentificationEntriesForSQL_bindings_handler_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = [v3 objectAtIndexedSubscript:0];
  uint64_t v4 = [v3 objectAtIndexedSubscript:1];
  id v5 = [v3 objectAtIndexedSubscript:2];

  id v6 = [v5 stringValue];

  id v7 = [*(id *)(a1 + 32) _storeIdentificationEntryWithExtensionBundleID:v8 localizedLabel:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)_parseIdentificationEntriesForSQL:(id)a3 bindings:(id)a4 handler:(id)a5 error:(id *)a6
{
  id v10 = a5;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = __81__CXCallDirectoryStore__parseIdentificationEntriesForSQL_bindings_handler_error___block_invoke;
  unint64_t v20 = &unk_1E5CAE288;
  id v21 = self;
  id v22 = v10;
  id v11 = v10;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = (void *)MEMORY[0x1AD0C5BA0](&v17);
  uint64_t v15 = [(CXCallDirectoryStore *)self database];
  LOBYTE(a6) = [v15 selectSQL:v13 withBindings:v12 expectedColumnCount:2 resultRowHandler:v14 error:a6];

  return (char)a6;
}

void __81__CXCallDirectoryStore__parseIdentificationEntriesForSQL_bindings_handler_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = [v3 objectAtIndexedSubscript:0];
  uint64_t v4 = [v3 objectAtIndexedSubscript:1];

  id v5 = [*(id *)(a1 + 32) _storeIdentificationEntryWithExtensionBundleID:v6 localizedLabel:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_storeIdentificationEntryWithExtensionBundleID:(id)a3 localizedLabel:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(CXCallDirectoryStoreIdentificationEntry);
  [(CXCallDirectoryStoreIdentificationEntry *)v7 setExtensionBundleIdentifier:v6];

  [(CXCallDirectoryStoreIdentificationEntry *)v7 setLocalizedLabel:v5];

  return v7;
}

- (id)_sqlValuesListPlaceholderStringWithNumberOfEntries:(int64_t)a3 entryString:(id)a4
{
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F28E78] string];
  if (a3 < 2)
  {
    if (a3 != 1) {
      goto LABEL_7;
    }
  }
  else
  {
    unint64_t v7 = a3 + 1;
    do
    {
      [v6 appendString:v5];
      [v6 appendString:@", "];
      --v7;
    }
    while (v7 > 2);
  }
  [v6 appendString:v5];
LABEL_7:

  return v6;
}

- (BOOL)vacuumWithError:(id *)a3
{
  uint64_t v4 = [(CXCallDirectoryStore *)self database];
  LOBYTE(a3) = [v4 vacuumWithError:a3];

  return (char)a3;
}

- (void)setDatabase:(id)a3
{
}

- (void)setTemporary:(BOOL)a3
{
  self->_temporary = a3;
}

- (int64_t)lastAddBlockingEntriesCount
{
  return self->_lastAddBlockingEntriesCount;
}

- (void)setLastAddBlockingEntriesCount:(int64_t)a3
{
  self->_lastAddBlockingEntriesCount = a3;
}

- (NSString)addBlockingEntriesInsertPhoneNumberBlockingEntrySQL
{
  return self->_addBlockingEntriesInsertPhoneNumberBlockingEntrySQL;
}

- (void)setAddBlockingEntriesInsertPhoneNumberBlockingEntrySQL:(id)a3
{
}

- (int64_t)lastRemoveBlockingEntriesCount
{
  return self->_lastRemoveBlockingEntriesCount;
}

- (void)setLastRemoveBlockingEntriesCount:(int64_t)a3
{
  self->_lastRemoveBlockingEntriesCount = a3;
}

- (NSString)removeBlockingEntriesSQL
{
  return self->_removeBlockingEntriesSQL;
}

- (void)setRemoveBlockingEntriesSQL:(id)a3
{
}

- (int64_t)lastAddIdentificationEntriesCount
{
  return self->_lastAddIdentificationEntriesCount;
}

- (void)setLastAddIdentificationEntriesCount:(int64_t)a3
{
  self->_lastAddIdentificationEntriesCount = a3;
}

- (NSString)addIdentificationEntriesInsertLabelsSQL
{
  return self->_addIdentificationEntriesInsertLabelsSQL;
}

- (void)setAddIdentificationEntriesInsertLabelsSQL:(id)a3
{
}

- (NSString)addIdentificationEntriesInsertPhoneNumberIdentificationEntrySQL
{
  return self->_addIdentificationEntriesInsertPhoneNumberIdentificationEntrySQL;
}

- (void)setAddIdentificationEntriesInsertPhoneNumberIdentificationEntrySQL:(id)a3
{
}

- (int64_t)lastAddPhoneNumbersCount
{
  return self->_lastAddPhoneNumbersCount;
}

- (void)setLastAddPhoneNumbersCount:(int64_t)a3
{
  self->_lastAddPhoneNumbersCount = a3;
}

- (NSString)addPhoneNumbersSQL
{
  return self->_addPhoneNumbersSQL;
}

- (void)setAddPhoneNumbersSQL:(id)a3
{
}

- (int64_t)lastRemoveIdentificationEntriesCount
{
  return self->_lastRemoveIdentificationEntriesCount;
}

- (void)setLastRemoveIdentificationEntriesCount:(int64_t)a3
{
  self->_lastRemoveIdentificationEntriesCount = a3;
}

- (NSString)removeIdentificationEntriesSQL
{
  return self->_removeIdentificationEntriesSQL;
}

- (void)setRemoveIdentificationEntriesSQL:(id)a3
{
}

+ (void)initializeDatabaseIfNecessaryAtURL:(uint64_t)a1 usingTemplateAtURL:(uint64_t)a2 error:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1A6E3A000, log, OS_LOG_TYPE_ERROR, "Error copying database template from URL %@ to URL %@", (uint8_t *)&v3, 0x16u);
}

void __65__CXCallDirectoryStore_setPrioritizedExtensionIdentifiers_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_1A6E3A000, v0, v1, "Error performing rollback: %@", v2, v3, v4, v5, v6);
}

void __69__CXCallDirectoryStore_addBlockingEntriesWithData_extensionID_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_1A6E3A000, v0, v1, "Error rolling back from previous error: %@", v2, v3, v4, v5, v6);
}

@end