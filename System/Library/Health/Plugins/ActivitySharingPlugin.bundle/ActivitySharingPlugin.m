uint64_t sub_241DD6348(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x263EF8340];
  v8 = a3;
  ASLoggingInitialize();
  v9 = *MEMORY[0x263F23AB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v17 = a4;
    _os_log_impl(&dword_241DD4000, v9, OS_LOG_TYPE_DEFAULT, "Running Activity Sharing migration from %ld, creating tables", buf, 0xCu);
  }
  v10 = [v8 protectedDatabase];

  v11 = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@_%@                      (%@ INTEGER PRIMARY KEY AUTOINCREMENT, %@ BLOB, %@ BLOB, %@ INTEGER, %@ INTEGER, %@ INTEGER, %@ BLOB, %@ BLOB, %@ BLOB, %@ BLOB, UNIQUE(%@, %@))", *MEMORY[0x263F23C58], *MEMORY[0x263F23C50], *MEMORY[0x263F42FE0], *MEMORY[0x263F24038], *MEMORY[0x263F24020], *MEMORY[0x263F24090], *MEMORY[0x263F24028], *MEMORY[0x263F24040], *MEMORY[0x263F24080], *MEMORY[0x263F24070], *MEMORY[0x263F24088], *MEMORY[0x263F24030], *MEMORY[0x263F24038], *MEMORY[0x263F24020]];
  v12 = [v10 executeSQL:v11 error:a5 bindingHandler:0 enumerationHandler:0];
  v13 = [*(id *)(a1 + 32) _createTableSQLStringForCompetitionLists];
  v14 = [v10 executeSQL:v13 error:a5 bindingHandler:0 enumerationHandler:0];

  return v12 & v14 ^ 1u;
}

uint64_t sub_241DD6548(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  ASLoggingInitialize();
  v9 = *MEMORY[0x263F23AB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v17 = a4;
    _os_log_impl(&dword_241DD4000, v9, OS_LOG_TYPE_DEFAULT, "Running Activity Sharing migration from %ld, dropping competitions table and re-creating with badge styles", buf, 0xCu);
  }
  v10 = [v8 protectedDatabase];

  v11 = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@_%@                      (%@ INTEGER PRIMARY KEY AUTOINCREMENT, %@ BLOB, %@ BLOB, %@ INTEGER, %@ INTEGER, %@ INTEGER, %@ BLOB, %@ BLOB, %@ BLOB, %@ BLOB, %@ BLOB, UNIQUE(%@, %@))", *MEMORY[0x263F23C58], *MEMORY[0x263F23C50], *MEMORY[0x263F42FE0], *MEMORY[0x263F24038], *MEMORY[0x263F24020], *MEMORY[0x263F24090], *MEMORY[0x263F24028], *MEMORY[0x263F24040], *MEMORY[0x263F24080], *MEMORY[0x263F24070], *MEMORY[0x263F24088], *MEMORY[0x263F24030], *MEMORY[0x263F24078], *MEMORY[0x263F24038], *MEMORY[0x263F24020]];
  v12 = [*(id *)(a1 + 32) _dropTableSQLStringForCompetitions];
  int v13 = [v10 executeSQL:v12 error:a5 bindingHandler:0 enumerationHandler:0];

  int v14 = [v10 executeSQL:v11 error:a5 bindingHandler:0 enumerationHandler:0];
  return v13 & v14 ^ 1u;
}

uint64_t sub_241DD6758(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  ASLoggingInitialize();
  v9 = *MEMORY[0x263F23AB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB8], OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 134217984;
    uint64_t v17 = a4;
    _os_log_impl(&dword_241DD4000, v9, OS_LOG_TYPE_DEFAULT, "Running Activity Sharing migration from %ld, dropping competition lists table and re-creating with owner", (uint8_t *)&v16, 0xCu);
  }
  v10 = [v8 protectedDatabase];

  v11 = [*(id *)(a1 + 32) _dropTableSQLStringForCompetitionLists];
  int v12 = [v10 executeSQL:v11 error:a5 bindingHandler:0 enumerationHandler:0];

  int v13 = [*(id *)(a1 + 32) _createTableSQLStringForCompetitionLists];
  int v14 = [v10 executeSQL:v13 error:a5 bindingHandler:0 enumerationHandler:0];

  return v12 & v14 ^ 1u;
}

uint64_t sub_241DD68A0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  ASLoggingInitialize();
  id v8 = *MEMORY[0x263F23AB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v17 = a4;
    _os_log_impl(&dword_241DD4000, v8, OS_LOG_TYPE_DEFAULT, "Running Activity Sharing migration from %ld, migrating competitions table to fixup unique constraint", buf, 0xCu);
  }
  v9 = [v7 protectedDatabase];

  v10 = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@_%@                      (%@ INTEGER PRIMARY KEY AUTOINCREMENT, %@ BLOB, %@ BLOB, %@ INTEGER, %@ INTEGER, %@ INTEGER, %@ BLOB, %@ BLOB, %@ BLOB, %@ BLOB, %@ BLOB, UNIQUE(%@, %@))", *MEMORY[0x263F23C58], *MEMORY[0x263F23C50], *MEMORY[0x263F42FE0], *MEMORY[0x263F24038], *MEMORY[0x263F24020], *MEMORY[0x263F24090], *MEMORY[0x263F24028], *MEMORY[0x263F24040], *MEMORY[0x263F24080], *MEMORY[0x263F24070], *MEMORY[0x263F24088], *MEMORY[0x263F24030], *MEMORY[0x263F24078], *MEMORY[0x263F24038], *MEMORY[0x263F24020]];
  int v11 = [v9 executeSQL:@"ALTER TABLE activitysharing_competitions RENAME TO activitysharing_competitions_old" error:a5 bindingHandler:0 enumerationHandler:0];
  int v12 = [v9 executeSQL:v10 error:a5 bindingHandler:0 enumerationHandler:0];
  int v13 = [v9 executeSQL:@"INSERT INTO activitysharing_competitions SELECT * FROM activitysharing_competitions_old" error:a5 bindingHandler:0 enumerationHandler:0];
  int v14 = [v9 executeSQL:@"DROP TABLE activitysharing_competitions_old" error:a5 bindingHandler:0 enumerationHandler:0];

  return v11 & v13 & v14 & v12 ^ 1u;
}

uint64_t sub_241DD6AE4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = a3;
  ASLoggingInitialize();
  id v8 = *MEMORY[0x263F23AB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v14 = a4;
    _os_log_impl(&dword_241DD4000, v8, OS_LOG_TYPE_DEFAULT, "Running Activity Sharing migration from %ld, migrating competitions table to add score cap", buf, 0xCu);
  }
  v9 = [NSString stringWithFormat:@"ALTER TABLE activitysharing_competitions ADD COLUMN %@ INTEGER", *MEMORY[0x263F24068]];
  v10 = [v7 protectedDatabase];

  int v11 = [v10 executeSQL:v9 error:a5 bindingHandler:0 enumerationHandler:0];
  return v11 ^ 1u;
}

void sub_241DD6D38(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_241DD4000, log, OS_LOG_TYPE_ERROR, "Not creating profile extension for non-primary profile.", v1, 2u);
}

void sub_241DD6D7C(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_241DD4000, log, OS_LOG_TYPE_ERROR, "Not creating profile extension, Health Daemon does not support Activity Sharing.", v1, 2u);
}

uint64_t ASActivitySharingDaemonEnabled()
{
  return MEMORY[0x270F0ABD0]();
}

uint64_t ASLoggingInitialize()
{
  return MEMORY[0x270F0ADA8]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}