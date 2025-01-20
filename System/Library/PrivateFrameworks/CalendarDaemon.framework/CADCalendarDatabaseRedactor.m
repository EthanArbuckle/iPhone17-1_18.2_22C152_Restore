@interface CADCalendarDatabaseRedactor
- (BOOL)_redactOmatic:(sqlite3 *)a3;
- (BOOL)_specialRedactions:(sqlite3 *)a3;
- (BOOL)redact;
- (CADCalendarDatabaseRedactor)initWithPath:(id)a3 context:(id)a4;
- (NSURL)path;
- (void)setPath:(id)a3;
@end

@implementation CADCalendarDatabaseRedactor

- (CADCalendarDatabaseRedactor)initWithPath:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CADCalendarDatabaseRedactor;
  v8 = [(CADCalendarDatabaseRedactor *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    path = v8->_path;
    v8->_path = (NSURL *)v9;

    objc_storeStrong((id *)&v8->_context, a4);
  }

  return v8;
}

- (BOOL)redact
{
  id v3 = [(CADCalendarDatabaseRedactor *)self path];
  v4 = (const char *)[v3 fileSystemRepresentation];

  if (!v4) {
    return 0;
  }
  ppDb = 0;
  uint64_t v5 = sqlite3_open_v2(v4, &ppDb, 2, 0);
  if (v5)
  {
    [(CADDiagnosticLogContext *)self->_context logError:@"Sqlite error opening database: %d\n", v5];
    return 0;
  }
  if ([(CADCalendarDatabaseRedactor *)self _redactOmatic:ppDb]) {
    BOOL v6 = [(CADCalendarDatabaseRedactor *)self _specialRedactions:ppDb];
  }
  else {
    BOOL v6 = 0;
  }
  sqlite3_close(ppDb);
  return v6;
}

- (BOOL)_redactOmatic:(sqlite3 *)a3
{
  uint64_t v5 = strdup("SELECT rowid");
  BOOL v6 = strdup(" ");
  sqlite3_exec(a3, "BEGIN", 0, 0, 0);
  id v7 = (const char **)&dbRedactionActions;
  uint64_t v9 = &qword_1EC59F028;
  uint64_t v8 = qword_1EC59F028;
  while (1)
  {
    v10 = v9;
    if (v8) {
      break;
    }
    zSql = 0;
    asprintf(&zSql, "%s, %s", v5, (const char *)v9[1]);
    free(v5);
    uint64_t v5 = zSql;
    v26 = 0;
    asprintf(&v26, "%s %s = ?,", v6, (const char *)v10[1]);
    free(v6);
    BOOL v6 = v26;
LABEL_16:
    uint64_t v9 = v10 + 3;
    uint64_t v8 = v10[3];
    if (!v8 && !v10[4])
    {
      free(v5);
      free(v6);
      sqlite3_exec(a3, "COMMIT", 0, 0, 0);
      return 1;
    }
  }
  zSql = 0;
  asprintf(&zSql, "%s FROM %s", v5, *v7);
  free(v5);
  v11 = strrchr(v6, 44);
  if (v11) {
    char *v11 = 0;
  }
  v26 = 0;
  asprintf(&v26, "UPDATE %s SET %s WHERE rowid = ?", *v7, v6);
  free(v6);
  pStmt = 0;
  ppStmt = 0;
  uint64_t v12 = sqlite3_prepare_v2(a3, zSql, -1, &ppStmt, 0);
  if (v12)
  {
    [(CADDiagnosticLogContext *)self->_context logError:@"Select Prep Error: %d, statement: %s", v12, zSql];
    return 0;
  }
  uint64_t v13 = sqlite3_prepare_v2(a3, v26, -1, &pStmt, 0);
  if (v13)
  {
    [(CADDiagnosticLogContext *)self->_context logError:@"Update Prep Error: %d, statement: %s", v13, v26];
    return 0;
  }
  if (sqlite3_step(ppStmt) != 100)
  {
LABEL_14:
    sqlite3_exec(a3, "COMMIT", 0, 0, 0);
    sqlite3_finalize(ppStmt);
    sqlite3_finalize(pStmt);
    free(zSql);
    free(v26);
    uint64_t v5 = strdup("SELECT rowid");
    BOOL v6 = strdup(" ");
    sqlite3_exec(a3, "BEGIN", 0, 0, 0);
    id v7 = (const char **)v10;
    goto LABEL_16;
  }
  while (1)
  {
    int v14 = sqlite3_column_int(ppStmt, 0);
    if (v7[3])
    {
      int v15 = 1;
    }
    else
    {
      int v15 = 1;
      v16 = (uint64_t *)(v7 + 6);
      do
      {
        v17 = sqlite3_column_blob(ppStmt, v15);
        int n = 0;
        int n = sqlite3_column_bytes(ppStmt, v15);
        v18 = (const void *)((uint64_t (*)(CADCalendarDatabaseRedactor *, const void *, int *))*(v16 - 1))(self, v17, &n);
        sqlite3_bind_blob(pStmt, v15++, v18, n, MEMORY[0x1E4F14838]);
        uint64_t v19 = *v16;
        v16 += 3;
      }
      while (!v19);
    }
    sqlite3_bind_int(pStmt, v15, v14);
    uint64_t v20 = sqlite3_step(pStmt);
    if (v20 != 101) {
      break;
    }
    sqlite3_reset(pStmt);
    if (sqlite3_step(ppStmt) != 100) {
      goto LABEL_14;
    }
  }
  [(CADDiagnosticLogContext *)self->_context logError:@"Sqlite step error: %d", v20, v22];
  return 0;
}

- (BOOL)_specialRedactions:(sqlite3 *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  sqlite3_exec(a3, "BEGIN", 0, 0, 0);
  sqlite3_exec(a3, "UPDATE location SET latitude = 0, longitude = 0", 0, 0, 0);
  v4 = strdup("SELECT rowid, key from _SqliteDatabaseProperties where key like '%-CalDAVInfo'");
  uint64_t v5 = strdup("UPDATE _SqliteDatabaseProperties SET key = ? where rowid = ?");
  pStmt = 0;
  ppStmt = 0;
  sqlite3_prepare_v2(a3, v4, -1, &ppStmt, 0);
  sqlite3_prepare_v2(a3, v5, -1, &pStmt, 0);
  while (sqlite3_step(ppStmt) == 100)
  {
    uint64_t v6 = sqlite3_column_int(ppStmt, 0);
    id v7 = sqlite3_column_text(ppStmt, 1);
    strlen((const char *)v7);
    ICSRedactBytes();
    uint64_t v8 = (void *)[[NSString alloc] initWithBytes:v15 length:20 encoding:4];
    uint64_t v9 = [NSString stringWithFormat:@"%@-%d-CalDAVInfo", v8, v6];
    v10 = pStmt;
    id v11 = v9;
    sqlite3_bind_text(v10, 1, (const char *)[v11 UTF8String], -1, 0);
    sqlite3_bind_int(pStmt, 2, v6);
    sqlite3_step(pStmt);
    sqlite3_reset(pStmt);
  }
  sqlite3_finalize(ppStmt);
  sqlite3_finalize(pStmt);
  free(v4);
  free(v5);
  sqlite3_exec(a3, "COMMIT", 0, 0, 0);
  return 1;
}

- (NSURL)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end