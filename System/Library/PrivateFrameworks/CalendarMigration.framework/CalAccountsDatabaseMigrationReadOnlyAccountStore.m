@interface CalAccountsDatabaseMigrationReadOnlyAccountStore
+ (id)_unarchiveData:(id)a3;
+ (int)_calendarDataClassIdentifier:(sqlite3 *)a3;
- (CalAccountsDatabaseMigrationReadOnlyAccountStore)initWithDatabaseURL:(id)a3;
- (id)accountWithIdentifier:(id)a3;
- (id)childAccountsForAccount:(id)a3 withTypeIdentifier:(id)a4;
- (id)topLevelAccountsWithAccountTypeIdentifier:(id)a3 error:(id *)a4;
- (void)dealloc;
@end

@implementation CalAccountsDatabaseMigrationReadOnlyAccountStore

- (CalAccountsDatabaseMigrationReadOnlyAccountStore)initWithDatabaseURL:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CalAccountsDatabaseMigrationReadOnlyAccountStore;
  v5 = [(CalAccountsDatabaseMigrationReadOnlyAccountStore *)&v11 init];
  if (v5
    && ([v4 path],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = sqlite3_open((const char *)[v6 UTF8String], &v5->_database),
        v6,
        v7))
  {
    v8 = +[CalMigrationLog defaultCategory];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CalAccountsDatabaseMigrationReadOnlyAccountStore initWithDatabaseURL:](&v5->_database);
    }

    sqlite3_close(v5->_database);
    v9 = 0;
  }
  else
  {
    v9 = v5;
  }

  return v9;
}

- (void)dealloc
{
  sqlite3_close(self->_database);
  v3.receiver = self;
  v3.super_class = (Class)CalAccountsDatabaseMigrationReadOnlyAccountStore;
  [(CalAccountsDatabaseMigrationReadOnlyAccountStore *)&v3 dealloc];
}

- (id)accountWithIdentifier:(id)a3
{
  id v4 = a3;
  ppStmt = 0;
  if (sqlite3_prepare_v2(self->_database, "SELECT ZACCOUNT.Z_PK, ZPARENTACCOUNT, ZACCOUNTTYPE.ZIDENTIFIER, ZACCOUNTDESCRIPTION, ZVISIBLE, ZAUTHENTICATED, ZUSERNAME, ? IN (SELECT Z_7ENABLEDDATACLASSES FROM Z_2ENABLEDDATACLASSES WHERE Z_2ENABLEDACCOUNTS = ZACCOUNT.Z_PK), ? IN (SELECT Z_7PROVISIONEDDATACLASSES FROM Z_2PROVISIONEDDATACLASSES WHERE Z_2PROVISIONEDACCOUNTS = ZACCOUNT.Z_PK) FROM ZACCOUNT JOIN ZACCOUNTTYPE ON (ZACCOUNT.ZACCOUNTTYPE = ZACCOUNTTYPE.Z_PK) WHERE ZACCOUNT.ZIDENTIFIER = ?", -1, &ppStmt, 0))
  {
    v5 = +[CalMigrationLog defaultCategory];
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
LABEL_4:

LABEL_16:
      v13 = 0;
      goto LABEL_17;
    }
LABEL_3:
    -[CalAccountsDatabaseMigrationReadOnlyAccountStore accountWithIdentifier:].cold.4(&self->_database);
    goto LABEL_4;
  }
  id v6 = ppStmt;
  int v7 = [(id)objc_opt_class() _calendarDataClassIdentifier:self->_database];
  if (sqlite3_bind_int(v6, 1, v7))
  {
    v8 = +[CalMigrationLog defaultCategory];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
LABEL_7:
    }
      -[CalAccountsDatabaseMigrationReadOnlyAccountStore accountWithIdentifier:].cold.6(&self->_database);
LABEL_14:

LABEL_15:
    sqlite3_finalize(ppStmt);
    goto LABEL_16;
  }
  v9 = ppStmt;
  int v10 = [(id)objc_opt_class() _calendarDataClassIdentifier:self->_database];
  if (sqlite3_bind_int(v9, 2, v10))
  {
    v8 = +[CalMigrationLog defaultCategory];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    goto LABEL_7;
  }
  objc_super v11 = ppStmt;
  id v12 = v4;
  if (sqlite3_bind_text(v11, 3, (const char *)[v12 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    v8 = +[CalMigrationLog defaultCategory];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CalAccountsDatabaseMigrationReadOnlyAccountStore accountWithIdentifier:].cold.5(&self->_database);
    }
    goto LABEL_14;
  }
  int v15 = sqlite3_step(ppStmt);
  if (v15 != 100)
  {
    if (v15 == 101)
    {
      v16 = +[CalMigrationLog defaultCategory];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[CalAccountsDatabaseMigrationReadOnlyAccountStore accountWithIdentifier:]();
      }

      goto LABEL_15;
    }
    v8 = +[CalMigrationLog defaultCategory];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CalAccountsDatabaseMigrationReadOnlyAccountStore accountWithIdentifier:](&self->_database);
    }
    goto LABEL_14;
  }
  int v50 = sqlite3_column_int(ppStmt, 0);
  v49 = sqlite3_column_text(ppStmt, 1);
  v48 = sqlite3_column_text(ppStmt, 2);
  v17 = sqlite3_column_text(ppStmt, 3);
  int v18 = sqlite3_column_int(ppStmt, 4);
  int v19 = sqlite3_column_int(ppStmt, 5);
  v20 = sqlite3_column_text(ppStmt, 6);
  int v21 = sqlite3_column_int(ppStmt, 7);
  int v22 = sqlite3_column_int(ppStmt, 8);
  sqlite3_finalize(ppStmt);
  if (sqlite3_prepare_v2(self->_database, "SELECT ZKEY, ZVALUE FROM ZACCOUNTPROPERTY WHERE ZOWNER = ?", -1, &ppStmt, 0))
  {
    v5 = +[CalMigrationLog defaultCategory];
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  int v45 = v22;
  int v46 = v21;
  v47 = v20;
  if (sqlite3_bind_int(ppStmt, 1, v50))
  {
    v8 = +[CalMigrationLog defaultCategory];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CalAccountsDatabaseMigrationReadOnlyAccountStore accountWithIdentifier:](&self->_database);
    }
    goto LABEL_14;
  }
  *(void *)v51 = v17;
  v23 = objc_opt_new();
  while (sqlite3_step(ppStmt) == 100)
  {
    v24 = sqlite3_column_text(ppStmt, 0);
    v25 = sqlite3_column_blob(ppStmt, 1);
    int v26 = sqlite3_column_bytes(ppStmt, 1);
    if (v24) {
      BOOL v27 = v25 == 0;
    }
    else {
      BOOL v27 = 1;
    }
    if (!v27 && v26 != 0)
    {
      int v29 = v26;
      v30 = objc_opt_class();
      v31 = [MEMORY[0x263EFF8F8] dataWithBytes:v25 length:v29];
      v32 = [v30 _unarchiveData:v31];

      v33 = [NSString stringWithUTF8String:v24];
      [v23 setObject:v32 forKeyedSubscript:v33];
    }
  }
  sqlite3_finalize(ppStmt);
  v43 = [CalAccountsDatabaseMigrationReadOnlyAccount alloc];
  v34 = v49;
  if (v49)
  {
    uint64_t v35 = [NSString stringWithUTF8String:v49];
  }
  else
  {
    uint64_t v35 = 0;
  }
  v36 = v48;
  uint64_t v37 = *(void *)v51;
  v44 = (void *)v35;
  if (v48)
  {
    v38 = [NSString stringWithUTF8String:v48];
  }
  else
  {
    v38 = 0;
  }
  if (*(void *)v51)
  {
    v39 = [NSString stringWithUTF8String:*(void *)v51];
  }
  else
  {
    v39 = 0;
  }
  if (v47)
  {
    v40 = objc_msgSend(NSString, "stringWithUTF8String:");
    BYTE1(v42) = v19 != 0;
    uint64_t v37 = *(void *)v51;
    LOBYTE(v42) = v18 != 0;
    v41 = v44;
    v13 = -[CalAccountsDatabaseMigrationReadOnlyAccount initWithIdentifier:parentIdentifier:accountTypeIdentifier:description:enabledForCalendarDataClass:provisionedForCalendarDataClass:visible:authenticated:username:properties:](v43, "initWithIdentifier:parentIdentifier:accountTypeIdentifier:description:enabledForCalendarDataClass:provisionedForCalendarDataClass:visible:authenticated:username:properties:", v12, v44, v38, v39, v46 != 0, v45 != 0, v42, v40, v23);

    v36 = v48;
    v34 = v49;
  }
  else
  {
    BYTE1(v42) = v19 != 0;
    LOBYTE(v42) = v18 != 0;
    v41 = v44;
    v13 = -[CalAccountsDatabaseMigrationReadOnlyAccount initWithIdentifier:parentIdentifier:accountTypeIdentifier:description:enabledForCalendarDataClass:provisionedForCalendarDataClass:visible:authenticated:username:properties:](v43, "initWithIdentifier:parentIdentifier:accountTypeIdentifier:description:enabledForCalendarDataClass:provisionedForCalendarDataClass:visible:authenticated:username:properties:", v12, v44, v38, v39, v46 != 0, v45 != 0, v42, 0, v23);
  }
  if (v37) {

  }
  if (v36) {
  if (v34)
  }

LABEL_17:
  return v13;
}

- (id)topLevelAccountsWithAccountTypeIdentifier:(id)a3 error:(id *)a4
{
  ppStmt = 0;
  p_database = &self->_database;
  if (sqlite3_prepare_v2(self->_database, "SELECT ZIDENTIFIER FROM ZACCOUNT WHERE ZPARENTACCOUNT ISNULL", -1, &ppStmt, 0))
  {
    int v7 = +[CalMigrationLog defaultCategory];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CalAccountsDatabaseMigrationReadOnlyAccountStore accountWithIdentifier:].cold.4(p_database);
    }

    if (a4)
    {
      [MEMORY[0x263F087E8] errorWithDomain:@"kCalAccountsDatabaseMigrationReadOnlyAccountStoreErrorDomain" code:0 userInfo:0];
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = objc_opt_new();
    if (sqlite3_step(ppStmt) == 100)
    {
      while (1)
      {
        v9 = sqlite3_column_text(ppStmt, 0);
        if (!v9) {
          break;
        }
        int v10 = [NSString stringWithUTF8String:v9];
        objc_super v11 = [(CalAccountsDatabaseMigrationReadOnlyAccountStore *)self accountWithIdentifier:v10];

        if (!v11) {
          goto LABEL_15;
        }
        [v8 addObject:v11];

        if (sqlite3_step(ppStmt) != 100) {
          goto LABEL_18;
        }
      }
      id v12 = +[CalMigrationLog defaultCategory];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[CalAccountsDatabaseMigrationReadOnlyAccountStore topLevelAccountsWithAccountTypeIdentifier:error:](v12);
      }

LABEL_15:
      if (a4)
      {
        *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"kCalAccountsDatabaseMigrationReadOnlyAccountStoreErrorDomain" code:0 userInfo:0];
      }

      v8 = 0;
    }
LABEL_18:
    sqlite3_finalize(ppStmt);
  }
  return v8;
}

- (id)childAccountsForAccount:(id)a3 withTypeIdentifier:(id)a4
{
  id v5 = a3;
  ppStmt = 0;
  p_database = &self->_database;
  if (sqlite3_prepare_v2(self->_database, "SELECT ZIDENTIFIER FROM ZACCOUNT WHERE ZPARENTACCOUNT = ?", -1, &ppStmt, 0))
  {
    int v7 = +[CalMigrationLog defaultCategory];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CalAccountsDatabaseMigrationReadOnlyAccountStore accountWithIdentifier:].cold.4(p_database);
    }

LABEL_9:
    objc_super v11 = 0;
    goto LABEL_10;
  }
  v8 = ppStmt;
  id v9 = [v5 identifier];
  LODWORD(v8) = sqlite3_bind_text(v8, 1, (const char *)[v9 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  if (v8)
  {
    int v10 = +[CalMigrationLog defaultCategory];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CalAccountsDatabaseMigrationReadOnlyAccountStore childAccountsForAccount:withTypeIdentifier:](p_database);
    }

    sqlite3_finalize(ppStmt);
    goto LABEL_9;
  }
  objc_super v11 = objc_opt_new();
  if (sqlite3_step(ppStmt) == 100)
  {
    while (1)
    {
      v13 = sqlite3_column_text(ppStmt, 0);
      if (!v13) {
        break;
      }
      v14 = [NSString stringWithUTF8String:v13];
      int v15 = [(CalAccountsDatabaseMigrationReadOnlyAccountStore *)self accountWithIdentifier:v14];

      if (!v15) {
        goto LABEL_21;
      }
      [v11 addObject:v15];

      if (sqlite3_step(ppStmt) != 100) {
        goto LABEL_22;
      }
    }
    v16 = +[CalMigrationLog defaultCategory];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[CalAccountsDatabaseMigrationReadOnlyAccountStore childAccountsForAccount:withTypeIdentifier:](v16);
    }

LABEL_21:
    objc_super v11 = 0;
  }
LABEL_22:
  sqlite3_finalize(ppStmt);
LABEL_10:

  return v11;
}

+ (id)_unarchiveData:(id)a3
{
  v12[4] = *MEMORY[0x263EF8340];
  objc_super v3 = (objc_class *)MEMORY[0x263EFFA08];
  id v4 = a3;
  id v5 = [v3 alloc];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  v12[2] = objc_opt_class();
  v12[3] = objc_opt_class();
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:4];
  int v7 = (void *)[v5 initWithArray:v6];

  uint64_t v11 = 0;
  v8 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v7 fromData:v4 error:&v11];

  if (v8) {
    id v9 = v8;
  }

  return v8;
}

+ (int)_calendarDataClassIdentifier:(sqlite3 *)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __81__CalAccountsDatabaseMigrationReadOnlyAccountStore__calendarDataClassIdentifier___block_invoke;
  v4[3] = &__block_descriptor_48_e5_v8__0l;
  v4[4] = a3;
  v4[5] = a1;
  if (_calendarDataClassIdentifier__onceToken != -1) {
    dispatch_once(&_calendarDataClassIdentifier__onceToken, v4);
  }
  return _calendarDataClassIdentifier__dataClassID;
}

void __81__CalAccountsDatabaseMigrationReadOnlyAccountStore__calendarDataClassIdentifier___block_invoke(uint64_t a1)
{
  ppStmt = 0;
  v2 = (sqlite3 **)(a1 + 32);
  if (sqlite3_prepare_v2(*(sqlite3 **)(a1 + 32), "SELECT Z_PK, ZNAME FROM ZDATACLASS", -1, &ppStmt, 0))
  {
    objc_super v3 = +[CalMigrationLog defaultCategory];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[CalAccountsDatabaseMigrationReadOnlyAccountStore accountWithIdentifier:].cold.4(v2);
    }
  }
  else
  {
    if (sqlite3_step(ppStmt) == 100)
    {
      while (1)
      {
        id v4 = (void *)MEMORY[0x263EFF8F8];
        id v5 = sqlite3_column_blob(ppStmt, 1);
        id v6 = objc_msgSend(v4, "dataWithBytes:length:", v5, sqlite3_column_bytes(ppStmt, 1));
        int v7 = [*(id *)(a1 + 40) _unarchiveData:v6];
        if ([@"com.apple.Dataclass.Calendars" isEqual:v7]) {
          break;
        }

        if (sqlite3_step(ppStmt) != 100) {
          goto LABEL_10;
        }
      }
      _calendarDataClassIdentifier__dataClassID = sqlite3_column_int(ppStmt, 0);
    }
LABEL_10:
    sqlite3_finalize(ppStmt);
  }
}

- (void)initWithDatabaseURL:(sqlite3 *)a1 .cold.1(sqlite3 **a1)
{
  OUTLINED_FUNCTION_2_1(a1);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_22133F000, v1, v2, "Failed to open database: %s", v3, v4, v5, v6, v7);
}

- (void)accountWithIdentifier:(sqlite3 *)a1 .cold.1(sqlite3 **a1)
{
  OUTLINED_FUNCTION_2_1(a1);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_22133F000, v1, v2, "Failed to execute query: %s", v3, v4, v5, v6, v7);
}

- (void)accountWithIdentifier:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_22133F000, v0, OS_LOG_TYPE_ERROR, "Account not found for identifier: %@", v1, 0xCu);
}

- (void)accountWithIdentifier:(sqlite3 *)a1 .cold.3(sqlite3 **a1)
{
  OUTLINED_FUNCTION_2_1(a1);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_22133F000, v1, v2, "Failed to bind account rowid: %s", v3, v4, v5, v6, v7);
}

- (void)accountWithIdentifier:(sqlite3 *)a1 .cold.4(sqlite3 **a1)
{
  OUTLINED_FUNCTION_2_1(a1);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_22133F000, v1, v2, "Failed to prepare statement: %s", v3, v4, v5, v6, v7);
}

- (void)accountWithIdentifier:(sqlite3 *)a1 .cold.5(sqlite3 **a1)
{
  OUTLINED_FUNCTION_2_1(a1);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_22133F000, v1, v2, "Failed to bind account identifier: %s", v3, v4, v5, v6, v7);
}

- (void)accountWithIdentifier:(sqlite3 *)a1 .cold.6(sqlite3 **a1)
{
  OUTLINED_FUNCTION_2_1(a1);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_22133F000, v1, v2, "Failed to bind calendar dataclass ID: %s", v3, v4, v5, v6, v7);
}

- (void)topLevelAccountsWithAccountTypeIdentifier:(os_log_t)log error:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_22133F000, log, OS_LOG_TYPE_ERROR, "Unexpected nil account identifier for account", v1, 2u);
}

- (void)childAccountsForAccount:(os_log_t)log withTypeIdentifier:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_22133F000, log, OS_LOG_TYPE_ERROR, "Unexpected nil account identifier for child account", v1, 2u);
}

- (void)childAccountsForAccount:(sqlite3 *)a1 withTypeIdentifier:.cold.2(sqlite3 **a1)
{
  OUTLINED_FUNCTION_2_1(a1);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_22133F000, v1, v2, "Failed to bind parent account identifier: %s", v3, v4, v5, v6, v7);
}

@end