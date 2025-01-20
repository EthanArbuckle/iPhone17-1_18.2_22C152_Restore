@interface InAppPromotionDatabaseSession
- (InAppPromotionDatabaseSession)initWithConnection:(id)a3;
- (SQLiteConnection)connection;
- (id)promotionInfoForProductIdentifiers:(id)a3 bundleID:(id)a4 error:(id *)a5;
@end

@implementation InAppPromotionDatabaseSession

- (InAppPromotionDatabaseSession)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)InAppPromotionDatabaseSession;
  v6 = [(InAppPromotionDatabaseSession *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (id)promotionInfoForProductIdentifiers:(id)a3 bundleID:(id)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = +[SQLiteComparisonPredicate predicateWithProperty:@"bundle_id" value:a4 comparisonType:1];
  if ([v7 count])
  {
    objc_super v9 = [v7 allObjects];
    v10 = +[SQLiteContainsPredicate containsPredicateWithProperty:@"product_id" values:v9];

    v24[0] = v8;
    v24[1] = v10;
    v11 = +[NSArray arrayWithObjects:v24 count:2];
    uint64_t v12 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v11];

    v8 = (void *)v12;
  }
  v23[0] = @"product_id";
  v23[1] = @"promo_order";
  v23[2] = @"visibility";
  v13 = +[NSArray arrayWithObjects:v23 count:3];
  v14 = +[NSMutableArray array];
  v15 = [(InAppPromotionDatabaseSession *)self connection];
  CFStringRef v22 = @"promo_order";
  v16 = +[NSArray arrayWithObjects:&v22 count:1];
  v17 = +[SQLiteEntity queryOnConnection:v15 predicate:v8 orderingProperties:v16];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100024D10;
  v20[3] = &unk_100357140;
  id v18 = v14;
  id v21 = v18;
  [v17 enumeratePersistentIDsAndProperties:v13 usingBlock:v20];

  return v18;
}

- (SQLiteConnection)connection
{
  return (SQLiteConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end