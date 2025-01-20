@interface SQLiteSchema
- (BOOL)column:(id)a3 existsInTable:(id)a4;
- (BOOL)migrateToVersion:(int64_t)a3 usingBlock:(id)a4;
- (BOOL)tableExists:(id)a3;
- (SQLiteSchema)initWithConnection:(id)a3;
- (int64_t)currentUserVersion;
- (void)_setUserVersion:(int64_t)a3;
@end

@implementation SQLiteSchema

- (SQLiteSchema)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SQLiteSchema;
  v6 = [(SQLiteSchema *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (BOOL)column:(id)a3 existsInTable:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  connection = self->_connection;
  objc_super v9 = +[NSString stringWithFormat:@"PRAGMA table_info(%@);", v7];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000C3F4;
  v12[3] = &unk_1002D4E78;
  v14 = &v15;
  id v10 = v6;
  id v13 = v10;
  [(SQLiteConnection *)connection executeQuery:v9 withResults:v12];

  LOBYTE(connection) = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)connection;
}

- (int64_t)currentUserVersion
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  connection = self->_connection;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000C5C4;
  v5[3] = &unk_1002D4EA0;
  v5[4] = &v6;
  -[SQLiteConnection executeQuery:withResults:](connection, "executeQuery:withResults:", @"PRAGMA user_version;",
    v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)migrateToVersion:(int64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  connection = self->_connection;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000C6EC;
  v10[3] = &unk_1002D4EC8;
  v10[4] = self;
  int64_t v13 = a3;
  id v8 = v6;
  id v11 = v8;
  v12 = &v14;
  [(SQLiteConnection *)connection performTransaction:v10];
  LOBYTE(self) = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

- (BOOL)tableExists:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  connection = self->_connection;
  id v6 = +[NSString stringWithFormat:@"SELECT name FROM sqlite_master where name = '%@'", v4];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000C9E0;
  v8[3] = &unk_1002D4EA0;
  v8[4] = &v9;
  [(SQLiteConnection *)connection executeQuery:v6 withResults:v8];

  LOBYTE(connection) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return (char)connection;
}

- (void)_setUserVersion:(int64_t)a3
{
  +[NSString stringWithFormat:@"PRAGMA user_version = %lld;", a3];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(SQLiteConnection *)self->_connection executeStatement:v4 error:0];
}

- (void).cxx_destruct
{
}

@end