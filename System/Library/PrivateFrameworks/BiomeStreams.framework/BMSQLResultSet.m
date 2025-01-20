@interface BMSQLResultSet
- (BMSQLDatabase)database;
- (BMSQLResultSet)initWithQuery:(id)a3 error:(id)a4 database:(id)a5;
- (BMSQLResultSet)initWithStatement:(sqlite3_stmt *)a3 database:(id)a4;
- (BOOL)_next;
- (BOOL)next;
- (NSArray)columns;
- (NSDictionary)row;
- (NSError)error;
- (NSString)query;
- (id)description;
- (sqlite3_stmt)stmt;
- (void)_next;
- (void)dealloc;
@end

@implementation BMSQLResultSet

- (BMSQLResultSet)initWithStatement:(sqlite3_stmt *)a3 database:(id)a4
{
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BMSQLResultSet;
  v8 = [(BMSQLResultSet *)&v14 init];
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    v8->_stmt = a3;
    objc_storeStrong((id *)&v8->_database, a4);
    v9->_finished = 0;
    v9->_cursor = 0;
    if (a3)
    {
      v10 = sqlite3_sql(a3);
      if (v10)
      {
        uint64_t v11 = [[NSString alloc] initWithUTF8String:v10];
        query = v9->_query;
        v9->_query = (NSString *)v11;
      }
    }
  }

  return v9;
}

- (BMSQLResultSet)initWithQuery:(id)a3 error:(id)a4 database:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(BMSQLResultSet *)self initWithStatement:0 database:a5];
  uint64_t v11 = v10;
  if (v10)
  {
    v10->_lock._os_unfair_lock_opaque = 0;
    uint64_t v12 = [v8 copy];
    query = v11->_query;
    v11->_query = (NSString *)v12;

    objc_storeStrong((id *)&v11->_error, a4);
    v11->_finished = 1;
  }

  return v11;
}

- (void)dealloc
{
  sqlite3_finalize(self->_stmt);
  v3.receiver = self;
  v3.super_class = (Class)BMSQLResultSet;
  [(BMSQLResultSet *)&v3 dealloc];
}

- (BOOL)next
{
  v2 = self;
  objc_super v3 = (void *)MEMORY[0x192FB0D60](self, a2);
  LOBYTE(v2) = [(BMSQLResultSet *)v2 _next];
  return (char)v2;
}

- (BOOL)_next
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  if (self->_finished || !self->_stmt) {
    goto LABEL_2;
  }
  v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = [NSNumber numberWithUnsignedInteger:self->_cursor];
    [(BMSQLResultSet *)v7 _next];
  }

  uint64_t v8 = sqlite3_step(self->_stmt);
  uint64_t v9 = v8;
  if (v8 == 101)
  {
    self->_finished = 1;
    row = self->_row;
    self->_row = 0;

    error = self->_error;
    self->_error = 0;

LABEL_27:
    _logQueryResult(self->_stmt);
LABEL_2:
    BOOL v4 = 0;
    goto LABEL_3;
  }
  if (v8 != 100)
  {
    v24 = self->_row;
    self->_row = 0;

    v25 = [(BMSQLDatabase *)self->_database db];
    v26 = NSString;
    v27 = [NSNumber numberWithUnsignedInteger:self->_cursor];
    id v28 = [v26 stringWithFormat:@"Failed to fetch row %@ in query %@", v27, self->_query];
    BMSQLDatabaseError(v9, v25, (const char *)[v28 UTF8String]);
    v29 = (NSError *)objc_claimAutoreleasedReturnValue();
    v30 = self->_error;
    self->_error = v29;

    self->_finished = 1;
    goto LABEL_27;
  }
  int v10 = sqlite3_column_count(self->_stmt);
  v35 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v10];
  if (!v10)
  {
LABEL_28:
    v31 = (NSDictionary *)[v35 copy];
    v32 = self->_row;
    self->_row = v31;

    ++self->_cursor;
    BOOL v4 = 1;
    goto LABEL_29;
  }
  BOOL v4 = 0;
  int v11 = 0;
  while (2)
  {
    uint64_t v12 = objc_msgSend([NSString alloc], "initWithUTF8String:", sqlite3_column_name(self->_stmt, v11));
    switch(sqlite3_column_type(self->_stmt, v11))
    {
      case 1:
        uint64_t v13 = objc_msgSend(NSNumber, "numberWithLongLong:", sqlite3_column_int64(self->_stmt, v11));
        goto LABEL_20;
      case 2:
        uint64_t v13 = objc_msgSend(NSNumber, "numberWithDouble:", sqlite3_column_double(self->_stmt, v11));
        goto LABEL_20;
      case 3:
        objc_super v14 = sqlite3_column_text(self->_stmt, v11);
        if (!v14) {
          goto LABEL_21;
        }
        v15 = (void *)[[NSString alloc] initWithUTF8String:v14];
        if (![v12 hasSuffix:@"_json"])
        {
          v17 = v15;
          goto LABEL_22;
        }
        uint64_t v16 = [v15 dataUsingEncoding:4];
        id v36 = 0;
        v34 = (void *)v16;
        v17 = objc_msgSend(MEMORY[0x1E4F28D90], "JSONObjectWithData:options:error:");
        v18 = (NSError *)v36;
        v19 = v18;
        if (v17)
        {
          uint64_t v20 = objc_msgSend(v12, "substringToIndex:", objc_msgSend(v12, "length") - 5);

          uint64_t v12 = (void *)v20;
LABEL_22:
          [v35 setObject:v17 forKeyedSubscript:v12];

          BOOL v4 = ++v11 >= v10;
          if (v10 == v11) {
            goto LABEL_28;
          }
          continue;
        }
        self->_finished = 1;
        v33 = self->_error;
        self->_error = v18;

LABEL_29:
LABEL_3:
        os_unfair_lock_unlock(p_lock);
        return v4;
      case 4:
        v21 = sqlite3_column_blob(self->_stmt, v11);
        if (!v21) {
          goto LABEL_21;
        }
        uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9B8]), "initWithBytes:length:", v21, sqlite3_column_bytes(self->_stmt, v11));
LABEL_20:
        v17 = (void *)v13;
        goto LABEL_22;
      default:
LABEL_21:
        v17 = 0;
        goto LABEL_22;
    }
  }
}

- (NSArray)columns
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  columns = self->_columns;
  if (!columns)
  {
    int v5 = sqlite3_column_count(self->_stmt);
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v5];
    if (v5)
    {
      for (int i = 0; i != v5; ++i)
      {
        uint64_t v8 = objc_msgSend([NSString alloc], "initWithUTF8String:", sqlite3_column_name(self->_stmt, i));
        [v6 addObject:v8];
      }
    }
    uint64_t v9 = (NSArray *)[v6 copy];
    int v10 = self->_columns;
    self->_columns = v9;

    columns = self->_columns;
  }
  int v11 = columns;
  os_unfair_lock_unlock(p_lock);

  return v11;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  int v5 = [(BMSQLResultSet *)self query];
  v6 = [NSNumber numberWithUnsignedInteger:self->_cursor];
  id v7 = (void *)[v3 initWithFormat:@"<%@ %p> query: %@, current row: %@", v4, self, v5, v6];

  return v7;
}

- (NSDictionary)row
{
  return self->_row;
}

- (NSError)error
{
  return self->_error;
}

- (sqlite3_stmt)stmt
{
  return self->_stmt;
}

- (NSString)query
{
  return self->_query;
}

- (BMSQLDatabase)database
{
  return self->_database;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_row, 0);

  objc_storeStrong((id *)&self->_columns, 0);
}

- (void)_next
{
  uint64_t v5 = *(void *)(a2 + 56);
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = v5;
  _os_log_debug_impl(&dword_18E67D000, log, OS_LOG_TYPE_DEBUG, "Fetching row %@ in result set for query %@", buf, 0x16u);
}

@end