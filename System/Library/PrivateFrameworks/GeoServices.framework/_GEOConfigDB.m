@interface _GEOConfigDB
- (GEOSQLiteDB)db;
- (_GEOConfigDBOperationQueue)operationQueue;
- (id)init:(id)a3 cache:(id)a4 operationQueue:(id)a5 clearFunction:(void *)a6 setFunction:(void *)a7 addFunction:(void *)a8 tableName:(id)a9;
- (int64_t)nextId;
- (void)addFunction;
- (void)clearFunction;
- (void)setFunction;
@end

@implementation _GEOConfigDB

- (_GEOConfigDBOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (GEOSQLiteDB)db
{
  return self->_db;
}

- (void)setFunction
{
  return self->_setFunction;
}

- (void)clearFunction
{
  return self->_clearFunction;
}

- (id)init:(id)a3 cache:(id)a4 operationQueue:(id)a5 clearFunction:(void *)a6 setFunction:(void *)a7 addFunction:(void *)a8 tableName:(id)a9
{
  id v16 = a3;
  id v25 = a5;
  id v17 = a9;
  id v18 = a4;
  v19 = [v16 isolationQueue];
  dispatch_assert_queue_V2(v19);

  v27.receiver = self;
  v27.super_class = (Class)_GEOConfigDB;
  id v20 = [(_GEOConfigCache *)&v27 init:v18];

  if (v20)
  {
    objc_storeStrong((id *)v20 + 4, a3);
    objc_storeStrong((id *)v20 + 5, a5);
    *((void *)v20 + 6) = a6;
    *((void *)v20 + 7) = a7;
    *((void *)v20 + 8) = a8;
    uint64_t v26 = 0;
    v21 = [NSString stringWithFormat:@"SELECT max(rowid) FROM %@", v17];
    v22 = (sqlite3 *)[*((id *)v20 + 4) sqliteDB];
    id v23 = v21;
    sqlite3_exec(v22, (const char *)[v23 UTF8String], (int (__cdecl *)(void *, int, char **, char **))_getFirstColumnInt64, &v26, 0);
    atomic_store(v26 + 1, (unint64_t *)v20 + 3);
  }
  return v20;
}

- (int64_t)nextId
{
  return atomic_fetch_add(&self->_lastId, 1uLL);
}

- (void)addFunction
{
  return self->_addFunction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);

  objc_storeStrong((id *)&self->_db, 0);
}

@end