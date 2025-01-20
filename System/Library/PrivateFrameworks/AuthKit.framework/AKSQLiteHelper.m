@interface AKSQLiteHelper
+ (id)dataFromColumn:(int64_t)a3 inStatement:(sqlite3_stmt *)a4;
+ (id)doubleFromColumn:(int64_t)a3 inStatement:(sqlite3_stmt *)a4;
+ (id)integerFromColumn:(int64_t)a3 inStatement:(sqlite3_stmt *)a4;
+ (id)stringFromColumn:(int64_t)a3 inStatement:(sqlite3_stmt *)a4;
+ (id)tableInfoForTable:(id)a3 withExecutor:(id)a4;
+ (int)numberOfRowsForTable:(id)a3 withExecutor:(id)a4;
@end

@implementation AKSQLiteHelper

+ (id)stringFromColumn:(int64_t)a3 inStatement:(sqlite3_stmt *)a4
{
  v4 = (void *)sqlite3_column_text(a4, a3);
  if (v4)
  {
    v4 = +[NSString stringWithUTF8String:v4];
  }

  return v4;
}

+ (id)integerFromColumn:(int64_t)a3 inStatement:(sqlite3_stmt *)a4
{
  uint64_t v4 = sqlite3_column_int(a4, a3);

  return +[NSNumber numberWithInt:v4];
}

+ (id)doubleFromColumn:(int64_t)a3 inStatement:(sqlite3_stmt *)a4
{
  double v4 = sqlite3_column_double(a4, a3);

  return +[NSNumber numberWithDouble:v4];
}

+ (id)dataFromColumn:(int64_t)a3 inStatement:(sqlite3_stmt *)a4
{
  int v5 = a3;
  id v6 = objc_alloc((Class)NSData);
  v7 = sqlite3_column_blob(a4, v5);
  id v8 = objc_msgSend(v6, "initWithBytes:length:", v7, sqlite3_column_bytes(a4, v5));

  return v8;
}

+ (int)numberOfRowsForTable:(id)a3 withExecutor:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  v7 = +[NSString stringWithFormat:@"SELECT COUNT(*) FROM %@", v5];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10009EAE8;
  v10[3] = &unk_100229938;
  v10[4] = &v11;
  [v6 performQuery:v7 rowHandler:v10];
  int v8 = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return v8;
}

+ (id)tableInfoForTable:(id)a3 withExecutor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = +[NSMutableDictionary dictionary];
  v9 = +[NSString stringWithFormat:@"PRAGMA table_info('%@')", v7];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10009EC88;
  v13[3] = &unk_10022A6C0;
  id v14 = v8;
  id v15 = a1;
  id v10 = v8;
  [v6 performQuery:v9 rowHandler:v13];

  id v11 = [v10 copy];

  return v11;
}

@end