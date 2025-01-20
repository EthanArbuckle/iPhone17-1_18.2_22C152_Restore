@interface SQLiteDatabaseStoreSchema
- (BOOL)column:(id)a3 existsInTable:(id)a4;
- (BOOL)migrateToVersion:(int64_t)a3 usingBlock:(id)a4;
- (BOOL)tableExists:(id)a3;
- (SQLiteDatabaseStoreSchema)initWithConnection:(id)a3 schemaName:(id)a4;
- (int64_t)currentSchemaVersion;
@end

@implementation SQLiteDatabaseStoreSchema

- (SQLiteDatabaseStoreSchema)initWithConnection:(id)a3 schemaName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SQLiteDatabaseStoreSchema;
  v9 = [(SQLiteDatabaseStoreSchema *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    objc_storeStrong((id *)&v10->_schemaName, a4);
    connection = v10->_connection;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100085B08;
    v13[3] = &unk_10035A178;
    v14 = v10;
    [(SQLiteConnection *)connection performTransaction:v13];
  }
  return v10;
}

- (int64_t)currentSchemaVersion
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  connection = self->_connection;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100085C28;
  v5[3] = &unk_100357318;
  v5[4] = self;
  v5[5] = &v6;
  [(SQLiteConnection *)connection executeQuery:@"SELECT schema_version FROM schema_version WHERE schema_name = ?" withResults:v5];
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)column:(id)a3 existsInTable:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v8 = +[NSString stringWithFormat:@"PRAGMA table_info(%@)", v7];
  connection = self->_connection;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100085DB8;
  v12[3] = &unk_100358828;
  v14 = &v15;
  id v10 = v6;
  id v13 = v10;
  [(SQLiteConnection *)connection executeQuery:v8 withResults:v12];
  LOBYTE(connection) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)connection;
}

- (BOOL)migrateToVersion:(int64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  connection = self->_connection;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100085F70;
  v10[3] = &unk_10035A1A0;
  v10[4] = self;
  id v11 = v6;
  int64_t v12 = a3;
  id v8 = v6;
  LOBYTE(self) = [(SQLiteConnection *)connection performSavepoint:v10];

  return (char)self;
}

- (BOOL)tableExists:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  int64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  connection = self->_connection;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000861A8;
  v8[3] = &unk_100357318;
  id v6 = v4;
  id v9 = v6;
  id v10 = &v11;
  [(SQLiteConnection *)connection executeQuery:@"SELECT name FROM sqlite_master where name = ?" withResults:v8];
  LOBYTE(connection) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schemaName, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end