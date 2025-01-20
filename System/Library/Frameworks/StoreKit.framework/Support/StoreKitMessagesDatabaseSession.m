@interface StoreKitMessagesDatabaseSession
- (BOOL)bundleIDHasMessagesForUserID:(id)a3 bundleID:(id)a4;
- (SQLiteConnection)connection;
- (StoreKitMessagesDatabaseSession)initWithConnection:(id)a3;
- (id)bundleIDsWithMessagesForUserID:(id)a3;
- (id)bundleIDsWithMessagesInBundleIDs:(id)a3 accountID:(id)a4;
- (id)messageForUserID:(id)a3 inApp:(id)a4 messageType:(id)a5;
- (id)revocationsForUserID:(id)a3 inApp:(id)a4;
@end

@implementation StoreKitMessagesDatabaseSession

- (StoreKitMessagesDatabaseSession)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)StoreKitMessagesDatabaseSession;
  v6 = [(StoreKitMessagesDatabaseSession *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (id)messageForUserID:(id)a3 inApp:(id)a4 messageType:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc((Class)NSMutableArray);
  v22 = v7;
  v11 = +[SQLiteComparisonPredicate predicateWithProperty:equalToLongLong:](SQLiteComparisonPredicate, "predicateWithProperty:equalToLongLong:", @"dsid", [v7 longLongValue]);
  v32[0] = v11;
  v12 = +[SQLiteComparisonPredicate predicateWithProperty:@"bundle_id" equalToValue:v8];
  v32[1] = v12;
  v13 = +[NSArray arrayWithObjects:v32 count:2];
  id v14 = [v10 initWithArray:v13];

  if (v9)
  {
    v15 = +[SQLiteComparisonPredicate predicateWithProperty:equalToLongLong:](SQLiteComparisonPredicate, "predicateWithProperty:equalToLongLong:", @"message_type", [v9 longLongValue]);
    [v14 addObject:v15];
  }
  v16 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v14];
  v31[0] = @"dsid";
  v31[1] = @"bundle_id";
  v31[2] = @"status";
  v31[3] = @"allow_developer_control";
  v31[4] = @"message_type";
  v17 = +[NSArray arrayWithObjects:v31 count:5];
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_1000974D8;
  v29 = sub_1000974E8;
  id v30 = 0;
  v18 = [(StoreKitMessagesDatabaseSession *)self connection];
  v19 = +[SQLiteEntity queryOnConnection:v18 predicate:v16];

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000974F0;
  v24[3] = &unk_1003588C8;
  v24[4] = &v25;
  [v19 enumeratePersistentIDsAndProperties:v17 usingBlock:v24];
  id v20 = (id)v26[5];

  _Block_object_dispose(&v25, 8);

  return v20;
}

- (id)revocationsForUserID:(id)a3 inApp:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[SQLiteComparisonPredicate predicateWithProperty:equalToLongLong:](SQLiteComparisonPredicate, "predicateWithProperty:equalToLongLong:", @"dsid", [v6 longLongValue]);
  v30[0] = v8;
  id v9 = +[SQLiteComparisonPredicate predicateWithProperty:@"bundle_id" equalToValue:v7];
  v30[1] = v9;
  id v10 = +[NSArray arrayWithObjects:v30 count:2];
  v11 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v10];

  CFStringRef v29 = @"product_id";
  v12 = +[NSArray arrayWithObjects:&v29 count:1];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_1000974D8;
  uint64_t v27 = sub_1000974E8;
  id v28 = objc_alloc_init((Class)NSMutableArray);
  v13 = [(StoreKitMessagesDatabaseSession *)self connection];
  id v14 = +[SQLiteEntity queryOnConnection:v13 predicate:v11];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10009792C;
  v19[3] = &unk_10035A6D0;
  id v15 = v6;
  id v20 = v15;
  id v16 = v7;
  id v21 = v16;
  v22 = &v23;
  [v14 enumeratePersistentIDsAndProperties:v12 usingBlock:v19];
  id v17 = (id)v24[5];

  _Block_object_dispose(&v23, 8);

  return v17;
}

- (id)bundleIDsWithMessagesForUserID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_1000974D8;
  id v16 = sub_1000974E8;
  id v17 = objc_alloc_init((Class)NSMutableSet);
  id v5 = +[SQLiteComparisonPredicate predicateWithProperty:equalToLongLong:](SQLiteComparisonPredicate, "predicateWithProperty:equalToLongLong:", @"dsid", [v4 longLongValue]);
  CFStringRef v18 = @"bundle_id";
  id v6 = +[NSArray arrayWithObjects:&v18 count:1];
  id v7 = [(StoreKitMessagesDatabaseSession *)self connection];
  id v8 = +[SQLiteEntity queryOnConnection:v7 predicate:v5];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100097BDC;
  v11[3] = &unk_1003588C8;
  v11[4] = &v12;
  [v8 enumeratePersistentIDsAndProperties:v6 usingBlock:v11];
  id v9 = [(id)v13[5] allObjects];

  _Block_object_dispose(&v12, 8);

  return v9;
}

- (BOOL)bundleIDHasMessagesForUserID:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  CFStringRef v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  id v8 = +[SQLiteComparisonPredicate predicateWithProperty:equalToLongLong:](SQLiteComparisonPredicate, "predicateWithProperty:equalToLongLong:", @"dsid", [v6 longLongValue]);
  v22[0] = v8;
  id v9 = +[SQLiteComparisonPredicate predicateWithProperty:@"bundle_id" equalToValue:v7];
  v22[1] = v9;
  id v10 = +[NSArray arrayWithObjects:v22 count:2];
  v11 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v10];

  CFStringRef v21 = @"bundle_id";
  uint64_t v12 = +[NSArray arrayWithObjects:&v21 count:1];
  v13 = [(StoreKitMessagesDatabaseSession *)self connection];
  uint64_t v14 = +[SQLiteEntity queryOnConnection:v13 predicate:v11];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100097E9C;
  v16[3] = &unk_1003588C8;
  v16[4] = &v17;
  [v14 enumeratePersistentIDsAndProperties:v12 usingBlock:v16];
  LOBYTE(v13) = *((unsigned char *)v18 + 24) != 0;

  _Block_object_dispose(&v17, 8);
  return (char)v13;
}

- (id)bundleIDsWithMessagesInBundleIDs:(id)a3 accountID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [v6 count];
    id v9 = &__NSArray0__struct;
    if (v7 && v8)
    {
      uint64_t v19 = 0;
      char v20 = &v19;
      uint64_t v21 = 0x3032000000;
      v22 = sub_1000974D8;
      uint64_t v23 = sub_1000974E8;
      id v24 = objc_alloc_init((Class)NSMutableSet);
      id v10 = +[SQLiteComparisonPredicate predicateWithProperty:equalToLongLong:](SQLiteComparisonPredicate, "predicateWithProperty:equalToLongLong:", @"dsid", [v7 longLongValue]);
      v26[0] = v10;
      v11 = +[SQLiteContainsPredicate containsPredicateWithProperty:@"bundle_id" values:v6];
      v26[1] = v11;
      uint64_t v12 = +[NSArray arrayWithObjects:v26 count:2];
      v13 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v12];

      CFStringRef v25 = @"bundle_id";
      uint64_t v14 = +[NSArray arrayWithObjects:&v25 count:1];
      id v15 = [(StoreKitMessagesDatabaseSession *)self connection];
      id v16 = +[SQLiteEntity queryOnConnection:v15 predicate:v13];

      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10009817C;
      v18[3] = &unk_1003588C8;
      v18[4] = &v19;
      [v16 enumeratePersistentIDsAndProperties:v14 usingBlock:v18];
      id v9 = [(id)v20[5] allObjects];

      _Block_object_dispose(&v19, 8);
    }
  }
  else
  {
    id v9 = &__NSArray0__struct;
  }

  return v9;
}

- (SQLiteConnection)connection
{
  return (SQLiteConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end