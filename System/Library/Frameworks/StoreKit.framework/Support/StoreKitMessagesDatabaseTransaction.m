@interface StoreKitMessagesDatabaseTransaction
- (BOOL)addMessageInfo:(id)a3 withError:(id *)a4;
- (BOOL)addRevocationInfo:(id)a3;
- (BOOL)removeMessageInfoForUser:(id)a3 inApp:(id)a4 type:(int64_t)a5 withError:(id *)a6;
- (BOOL)removeRevocationInfoForUser:(id)a3 inApp:(id)a4;
@end

@implementation StoreKitMessagesDatabaseTransaction

- (BOOL)addMessageInfo:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  v7 = [v5 userID];
  [v6 setObject:v7 forKeyedSubscript:@"dsid"];

  v8 = [v5 bundleID];
  [v6 setObject:v8 forKeyedSubscript:@"bundle_id"];

  v9 = [v5 status];
  [v6 setObject:v9 forKeyedSubscript:@"status"];

  v10 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 allowDeveloperControl]);
  [v6 setObject:v10 forKeyedSubscript:@"allow_developer_control"];

  id v11 = [v5 type];
  v12 = +[NSNumber numberWithInteger:v11];
  [v6 setObject:v12 forKeyedSubscript:@"message_type"];

  v13 = [StoreKitMessagesDatabaseEntity alloc];
  v14 = [(StoreKitMessagesDatabaseSession *)self connection];
  v15 = [(SQLiteEntity *)v13 initWithPropertyValues:v6 onConnection:v14];

  LOBYTE(v14) = [(SQLiteEntity *)v15 existsInDatabase];
  return (char)v14;
}

- (BOOL)removeMessageInfoForUser:(id)a3 inApp:(id)a4 type:(int64_t)a5 withError:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = +[NSNumber numberWithInteger:a5];
  v13 = [(StoreKitMessagesDatabaseSession *)self connection];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100079A2C;
  v18[3] = &unk_100359B90;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  LOBYTE(a6) = objc_msgSend(v13, "executeStatement:error:bindings:", @"DELETE FROM storekit_messages WHERE dsid = ? AND bundle_id = ? AND message_type = ?;",
                                  a6,
                                  v18);

  return (char)a6;
}

- (BOOL)addRevocationInfo:(id)a3
{
  v13[0] = @"dsid";
  id v4 = a3;
  id v5 = [v4 userID];
  v14[0] = v5;
  v13[1] = @"bundle_id";
  id v6 = [v4 bundleID];
  v14[1] = v6;
  v13[2] = @"product_id";
  v7 = [v4 productID];

  v14[2] = v7;
  v8 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];

  v9 = [StoreKitRevocationsDatabaseEntity alloc];
  id v10 = [(StoreKitMessagesDatabaseSession *)self connection];
  id v11 = [(SQLiteEntity *)v9 initWithPropertyValues:v8 onConnection:v10];

  LOBYTE(v10) = [(SQLiteEntity *)v11 existsInDatabase];
  return (char)v10;
}

- (BOOL)removeRevocationInfoForUser:(id)a3 inApp:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(StoreKitMessagesDatabaseSession *)self connection];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100079CDC;
  v12[3] = &unk_100357408;
  id v13 = v6;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  LOBYTE(v7) = objc_msgSend(v8, "executeStatement:error:bindings:", @"DELETE FROM storekit_revocations WHERE dsid = ? AND bundle_id = ?;",
                                  0,
                                  v12);

  return (char)v7;
}

@end