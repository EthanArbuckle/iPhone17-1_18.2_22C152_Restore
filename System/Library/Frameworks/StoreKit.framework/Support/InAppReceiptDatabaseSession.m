@interface InAppReceiptDatabaseSession
- (BOOL)cacheIncludesFinishedConsumablesForBundleID:(id)a3;
- (BOOL)hasTransactionWithSubscriptionOfferType:(unsigned __int8)a3 forSubscriptionGroupID:(id)a4 bundleID:(id)a5;
- (BOOL)isTransactionFinishedForID:(id)a3 bundleID:(id)a4;
- (InAppReceiptDatabaseSession)initWithConnection:(id)a3;
- (SQLiteConnection)connection;
- (id)_inAppPendingTransactionsPropertyForKey:(id)a3 bundleID:(id)a4;
- (id)_latestTransactionReceiptForUnarchivedRenewalInfo:(id)a3 subscriptionGroupID:(id)a4 bundleID:(id)a5 outProductID:(id *)a6;
- (id)_propertyForKey:(id)a3 bundleID:(id)a4;
- (id)_statusesForRenewalInfoBlob:(id)a3 subscriptionGroupID:(id)a4 bundleID:(id)a5;
- (id)accountTokenForBundleID:(id)a3;
- (id)appTransactionForBundleID:(id)a3 bundleVersion:(id)a4 accountToken:(id)a5;
- (id)currentRevisionForBundleID:(id)a3;
- (id)lastUpdatedForBundleID:(id)a3;
- (id)pendingLegacyTransactionsAccountTokenForBundleID:(id)a3;
- (id)pendingLegacyTransactionsForBundleID:(id)a3 logKey:(id)a4 error:(id *)a5;
- (id)pendingLegacyTransactionsLastUpdatedForBundleID:(id)a3;
- (id)statusHashesForBundleID:(id)a3;
- (id)subscriptionStatusForSubscriptionGroupID:(id)a3 bundleID:(id)a4;
- (id)transactionForID:(id)a3 bundleID:(id)a4;
- (id)transactionHashesForBundleID:(id)a3 totalCount:(unint64_t *)a4;
- (void)_enumerateSubscriptionStatusForBundleID:(id)a3 alsoMatchingPredicate:(id)a4 ignoreEmptyStatus:(BOOL)a5 usingBlock:(id)a6;
- (void)enumerateCurrentReceiptsForProductID:(id)a3 bundleID:(id)a4 usingBlock:(id)a5;
- (void)enumerateReceiptsForProductID:(id)a3 bundleID:(id)a4 usingBlock:(id)a5;
- (void)enumerateReceiptsForSubscriptionsInGracePeriodForBundleID:(id)a3 usingBlock:(id)a4;
- (void)enumerateSubscriptionStatusForBundleID:(id)a3 usingBlock:(id)a4;
- (void)enumerateUnfinishedTransactionReceiptsForBundleID:(id)a3 usingBlock:(id)a4;
@end

@implementation InAppReceiptDatabaseSession

- (InAppReceiptDatabaseSession)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)InAppReceiptDatabaseSession;
  v6 = [(InAppReceiptDatabaseSession *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (id)accountTokenForBundleID:(id)a3
{
  return [(InAppReceiptDatabaseSession *)self _propertyForKey:@"token" bundleID:a3];
}

- (BOOL)cacheIncludesFinishedConsumablesForBundleID:(id)a3
{
  v3 = [(InAppReceiptDatabaseSession *)self _propertyForKey:@"finished_consumables" bundleID:a3];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (id)appTransactionForBundleID:(id)a3 bundleVersion:(id)a4 accountToken:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[NSMutableArray array];
  v12 = +[SQLiteComparisonPredicate predicateWithProperty:@"bundle_id" value:v8 comparisonType:1];
  [v11 addObject:v12];
  if (v9)
  {
    v13 = +[SQLiteComparisonPredicate predicateWithProperty:@"bundle_version" value:v9 comparisonType:1];
    [v11 addObject:v13];
  }
  if (v10)
  {
    v14 = +[SQLiteComparisonPredicate predicateWithProperty:@"token" value:v10 comparisonType:1];
    [v11 addObject:v14];
  }
  v15 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v11];
  CFStringRef v28 = @"receipt";
  v16 = +[NSArray arrayWithObjects:&v28 count:1];
  v17 = [(InAppReceiptDatabaseSession *)self connection];
  v18 = +[SQLiteEntity queryOnConnection:v17 predicate:v15];

  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_10005124C;
  v26 = sub_10005125C;
  id v27 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100051264;
  v21[3] = &unk_1003588C8;
  v21[4] = &v22;
  [v18 enumeratePersistentIDsAndProperties:v16 usingBlock:v21];
  id v19 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v19;
}

- (id)currentRevisionForBundleID:(id)a3
{
  return [(InAppReceiptDatabaseSession *)self _propertyForKey:@"revision" bundleID:a3];
}

- (void)enumerateCurrentReceiptsForProductID:(id)a3 bundleID:(id)a4 usingBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v35 = a5;
  id v9 = +[NSMutableArray array];
  id v10 = +[SQLiteComparisonPredicate predicateWithProperty:@"bundle_id" value:v8 comparisonType:1];
  [v9 addObject:v10];

  if ([v7 length])
  {
    v11 = +[SQLiteComparisonPredicate predicateWithProperty:@"product_id" value:v7 comparisonType:1];
    [v9 addObject:v11];
  }
  v37 = v7;
  v12 = +[SQLiteNullPredicate isNullPredicateWithProperty:@"revocation_date"];
  [v9 addObject:v12];

  v13 = +[SecureClock now];
  if (!v13)
  {
    if (qword_10039FB40 != -1) {
      dispatch_once(&qword_10039FB40, &stru_100358A78);
    }
    if (os_log_type_enabled((os_log_t)qword_10039FAF8, OS_LOG_TYPE_ERROR)) {
      sub_1002C3AAC();
    }
    v13 = +[NSDate now];
  }
  v14 = +[SQLiteNullPredicate isNullPredicateWithProperty:@"expiration_date"];
  v49[0] = v14;
  [v13 timeIntervalSinceReferenceDate];
  v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v16 = +[SQLiteComparisonPredicate predicateWithProperty:@"expiration_date" value:v15 comparisonType:5];
  v49[1] = v16;
  v17 = +[NSArray arrayWithObjects:v49 count:2];
  v18 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v17];
  [v9 addObject:v18];

  id v19 = +[SQLiteComparisonPredicate predicateWithProperty:@"product_type" equalToValue:&off_100373B00];
  v48[0] = v19;
  v20 = +[SQLiteComparisonPredicate predicateWithProperty:@"product_type" equalToValue:&off_100373B18];
  v48[1] = v20;
  v21 = +[SQLiteComparisonPredicate predicateWithProperty:@"product_type" equalToValue:&off_100373B30];
  v48[2] = v21;
  uint64_t v22 = +[NSArray arrayWithObjects:v48 count:3];
  v23 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v22];
  [v9 addObject:v23];

  uint64_t v24 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v9];
  v47[0] = @"product_id";
  v47[1] = @"receipt";
  v25 = +[NSArray arrayWithObjects:v47 count:2];
  v26 = [(InAppReceiptDatabaseSession *)self connection];
  CFStringRef v46 = @"transaction_date";
  id v27 = +[NSArray arrayWithObjects:&v46 count:1];
  CFStringRef v45 = @"DESC";
  CFStringRef v28 = +[NSArray arrayWithObjects:&v45 count:1];
  v29 = +[SQLiteEntity queryOnConnection:v26 predicate:v24 orderingProperties:v27 orderingDirections:v28];

  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100051844;
  v41[3] = &unk_1003588F0;
  id v42 = v13;
  id v30 = objc_alloc_init((Class)NSMutableSet);
  id v43 = v30;
  id v31 = v35;
  id v44 = v31;
  id v32 = v13;
  [v29 enumeratePersistentIDsAndProperties:v25 usingBlock:v41];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100051ADC;
  v38[3] = &unk_100358918;
  id v39 = v30;
  id v40 = v31;
  id v33 = v31;
  id v34 = v30;
  [(InAppReceiptDatabaseSession *)self enumerateReceiptsForSubscriptionsInGracePeriodForBundleID:v8 usingBlock:v38];
}

- (void)enumerateReceiptsForProductID:(id)a3 bundleID:(id)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = +[SQLiteComparisonPredicate predicateWithProperty:@"bundle_id" value:a4 comparisonType:1];
  if ([v8 length])
  {
    v11 = +[SQLiteComparisonPredicate predicateWithProperty:@"product_id" value:v8 comparisonType:1];
    v25[0] = v10;
    v25[1] = v11;
    v12 = +[NSArray arrayWithObjects:v25 count:2];
    id v13 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v12];
  }
  else
  {
    id v13 = v10;
  }
  CFStringRef v24 = @"receipt";
  v14 = +[NSArray arrayWithObjects:&v24 count:1];
  v15 = [(InAppReceiptDatabaseSession *)self connection];
  CFStringRef v23 = @"transaction_date";
  v16 = +[NSArray arrayWithObjects:&v23 count:1];
  CFStringRef v22 = @"DESC";
  v17 = +[NSArray arrayWithObjects:&v22 count:1];
  v18 = +[SQLiteEntity queryOnConnection:v15 predicate:v13 orderingProperties:v16 orderingDirections:v17];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100051DEC;
  v20[3] = &unk_100358940;
  id v21 = v9;
  id v19 = v9;
  [v18 enumeratePersistentIDsAndProperties:v14 usingBlock:v20];
}

- (void)enumerateReceiptsForSubscriptionsInGracePeriodForBundleID:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[SQLiteComparisonPredicate predicateWithProperty:@"bundle_id" equalToValue:v6];
  id v9 = +[SecureClock now];
  if (!v9)
  {
    if (qword_10039FB40 != -1) {
      dispatch_once(&qword_10039FB40, &stru_100358A78);
    }
    if (os_log_type_enabled((os_log_t)qword_10039FB20, OS_LOG_TYPE_ERROR)) {
      sub_1002C3AAC();
    }
    id v9 = +[NSDate now];
  }
  [v9 timeIntervalSinceReferenceDate];
  id v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v11 = +[SQLiteComparisonPredicate predicateWithProperty:@"grace_period_expiration_date" value:v10 comparisonType:5];

  v24[0] = v8;
  v24[1] = v11;
  v12 = +[NSArray arrayWithObjects:v24 count:2];
  id v13 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v12];

  CFStringRef v23 = @"renewal_info";
  v14 = +[NSArray arrayWithObjects:&v23 count:1];
  v15 = [(InAppReceiptDatabaseSession *)self connection];
  v16 = +[SQLiteEntity queryOnConnection:v15 predicate:v13];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100052118;
  v19[3] = &unk_1003588F0;
  id v20 = v6;
  id v21 = self;
  id v22 = v7;
  id v17 = v7;
  id v18 = v6;
  [v16 enumeratePersistentIDsAndProperties:v14 usingBlock:v19];
}

- (void)enumerateUnfinishedTransactionReceiptsForBundleID:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = +[SQLiteComparisonPredicate predicateWithProperty:@"bundle_id" value:a3 comparisonType:1];
  id v8 = +[SQLiteComparisonPredicate predicateWithProperty:@"is_finished" value:&__kCFBooleanFalse comparisonType:1];
  v22[0] = v7;
  v22[1] = v8;
  id v9 = +[NSArray arrayWithObjects:v22 count:2];
  id v10 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v9];

  CFStringRef v21 = @"receipt";
  v11 = +[NSArray arrayWithObjects:&v21 count:1];
  v12 = [(InAppReceiptDatabaseSession *)self connection];
  CFStringRef v20 = @"transaction_date";
  id v13 = +[NSArray arrayWithObjects:&v20 count:1];
  CFStringRef v19 = @"DESC";
  v14 = +[NSArray arrayWithObjects:&v19 count:1];
  v15 = +[SQLiteEntity queryOnConnection:v12 predicate:v10 orderingProperties:v13 orderingDirections:v14];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100052814;
  v17[3] = &unk_100358940;
  id v18 = v6;
  id v16 = v6;
  [v15 enumeratePersistentIDsAndProperties:v11 usingBlock:v17];
}

- (BOOL)isTransactionFinishedForID:(id)a3 bundleID:(id)a4
{
  unsigned __int8 v4 = [(InAppReceiptDatabaseSession *)self transactionForID:a3 bundleID:a4];
  id v5 = v4;
  if (v4) {
    unsigned __int8 v6 = [v4 isFinished];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (BOOL)hasTransactionWithSubscriptionOfferType:(unsigned __int8)a3 forSubscriptionGroupID:(id)a4 bundleID:(id)a5
{
  uint64_t v6 = a3;
  id v35 = a4;
  id v32 = a5;
  id v34 = +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:](SQLiteComparisonPredicate, "predicateWithProperty:equalToValue:", @"bundle_id");
  id v33 = +[SQLiteComparisonPredicate predicateWithProperty:@"product_type" equalToValue:&off_100373B30];
  id v7 = +[NSNumber numberWithUnsignedChar:v6];
  v37 = +[SQLiteComparisonPredicate predicateWithProperty:@"receipt" equalToValue:v7];

  id v8 = +[SQLiteFunction extractJWSPayload];
  v49[0] = v8;
  id v9 = +[SQLiteExtractJSONTransform extractJSONAtKey:@"offerType"];
  v49[1] = v9;
  id v10 = +[NSArray arrayWithObjects:v49 count:2];
  v11 = +[SQLiteSequentialValueTransform composingTransforms:v10];
  [v37 setTransform:v11];

  v12 = +[SQLiteComparisonPredicate predicateWithProperty:@"receipt" equalToValue:v35];
  id v13 = +[SQLiteFunction extractJWSPayload];
  v48[0] = v13;
  v14 = +[SQLiteExtractJSONTransform extractJSONAtKey:@"subscriptionGroupIdentifier"];
  v48[1] = v14;
  v15 = +[NSArray arrayWithObjects:v48 count:2];
  id v16 = +[SQLiteSequentialValueTransform composingTransforms:v15];
  [v12 setTransform:v16];

  v47[0] = v34;
  v47[1] = v33;
  void v47[2] = v37;
  v47[3] = v12;
  id v17 = +[NSArray arrayWithObjects:v47 count:4];
  id v18 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v17];

  CFStringRef v19 = [(InAppReceiptDatabaseSession *)self connection];
  CFStringRef v20 = +[SQLiteFunction extractJWSPayload];
  [v19 addFunction:v20];

  CFStringRef v21 = [(InAppReceiptDatabaseSession *)self connection];
  CFStringRef v46 = @"transaction_date";
  id v22 = +[NSArray arrayWithObjects:&v46 count:1];
  CFStringRef v45 = @"ASC";
  CFStringRef v23 = +[NSArray arrayWithObjects:&v45 count:1];
  CFStringRef v24 = +[SQLiteEntity queryOnConnection:v21 predicate:v18 orderingProperties:v22 orderingDirections:v23];

  v25 = [v24 queryDescriptor];
  [v25 setLimitCount:1];

  uint64_t v41 = 0;
  id v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 0;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100052DAC;
  v38[3] = &unk_100358968;
  id v26 = v32;
  id v39 = v26;
  id v40 = &v41;
  [v24 enumerateMemoryEntitiesUsingBlock:v38];
  id v27 = [(InAppReceiptDatabaseSession *)self connection];
  CFStringRef v28 = +[SQLiteFunction extractJWSPayload];
  v29 = [v28 name];
  id v30 = +[SQLiteFunction extractJWSPayload];
  objc_msgSend(v27, "removeFunctionNamed:withArgumentCount:", v29, objc_msgSend(v30, "argumentCount"));

  LOBYTE(v27) = *((unsigned char *)v42 + 24) == 0;
  _Block_object_dispose(&v41, 8);

  return (char)v27;
}

- (id)lastUpdatedForBundleID:(id)a3
{
  return [(InAppReceiptDatabaseSession *)self _propertyForKey:@"last_updated" bundleID:a3];
}

- (id)subscriptionStatusForSubscriptionGroupID:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[SQLiteComparisonPredicate predicateWithProperty:@"subscription_group_id" value:v6 comparisonType:1];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_10005124C;
  id v16 = sub_10005125C;
  id v17 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10005302C;
  v11[3] = &unk_100358990;
  v11[4] = &v12;
  [(InAppReceiptDatabaseSession *)self _enumerateSubscriptionStatusForBundleID:v7 alsoMatchingPredicate:v8 ignoreEmptyStatus:1 usingBlock:v11];
  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (void)enumerateSubscriptionStatusForBundleID:(id)a3 usingBlock:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000530E8;
  v7[3] = &unk_100357A88;
  id v8 = a4;
  id v6 = v8;
  [(InAppReceiptDatabaseSession *)self _enumerateSubscriptionStatusForBundleID:a3 alsoMatchingPredicate:0 ignoreEmptyStatus:0 usingBlock:v7];
}

- (id)transactionForID:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[SQLiteComparisonPredicate predicateWithProperty:@"bundle_id" value:v7 comparisonType:1];
  id v9 = +[SQLiteComparisonPredicate predicateWithProperty:@"transaction_id" value:v6 comparisonType:1];
  v23[0] = v8;
  v23[1] = v9;
  id v10 = +[NSArray arrayWithObjects:v23 count:2];
  v11 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v10];

  uint64_t v12 = [(InAppReceiptDatabaseSession *)self connection];
  id v13 = +[SQLiteMemoryEntity queryOnConnection:v12 predicate:v11];

  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  CFStringRef v20 = sub_10005124C;
  CFStringRef v21 = sub_10005125C;
  id v22 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100053338;
  v16[3] = &unk_1003589B8;
  v16[4] = &v17;
  [v13 enumerateMemoryEntitiesUsingBlock:v16];
  id v14 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v14;
}

- (id)pendingLegacyTransactionsForBundleID:(id)a3 logKey:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v19 = 0;
  CFStringRef v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_10005124C;
  CFStringRef v23 = sub_10005125C;
  id v24 = objc_alloc_init((Class)NSMutableArray);
  id v9 = +[SQLiteComparisonPredicate predicateWithProperty:@"bundle_id" value:v7 comparisonType:1];
  id v10 = [(InAppReceiptDatabaseSession *)self connection];
  v11 = +[SQLiteEntity queryOnConnection:v10 predicate:v9];

  v25[0] = @"transaction_id";
  v25[1] = @"original_transaction_id";
  void v25[2] = @"product_id";
  v25[3] = @"item_id";
  v25[4] = @"transaction_date";
  v25[5] = @"original_transaction_date";
  v25[6] = @"quantity";
  v25[7] = @"request_data";
  v25[8] = @"transaction_receipt";
  v25[9] = @"receipt";
  v25[10] = @"assets";
  uint64_t v12 = +[NSArray arrayWithObjects:v25 count:11];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100053634;
  v16[3] = &unk_1003589E0;
  id v13 = v7;
  id v17 = v13;
  id v18 = &v19;
  [v11 enumeratePersistentIDsAndProperties:v12 usingBlock:v16];
  id v14 = (id)v20[5];

  _Block_object_dispose(&v19, 8);

  return v14;
}

- (id)pendingLegacyTransactionsAccountTokenForBundleID:(id)a3
{
  return [(InAppReceiptDatabaseSession *)self _inAppPendingTransactionsPropertyForKey:@"token" bundleID:a3];
}

- (id)pendingLegacyTransactionsLastUpdatedForBundleID:(id)a3
{
  return [(InAppReceiptDatabaseSession *)self _inAppPendingTransactionsPropertyForKey:@"last_updated" bundleID:a3];
}

- (id)statusHashesForBundleID:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = +[SQLiteComparisonPredicate predicateWithProperty:@"bundle_id" equalToValue:v4];

  id v7 = [(InAppReceiptDatabaseSession *)self connection];
  id v8 = +[SQLiteEntity queryOnConnection:v7 predicate:v6];
  CFStringRef v14 = @"renewal_info";
  id v9 = +[NSArray arrayWithObjects:&v14 count:1];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100053BA8;
  v12[3] = &unk_100357140;
  id v10 = v5;
  id v13 = v10;
  [v8 enumeratePersistentIDsAndProperties:v9 usingBlock:v12];

  return v10;
}

- (id)transactionHashesForBundleID:(id)a3 totalCount:(unint64_t *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  id v7 = objc_opt_new();
  id v8 = +[SQLiteComparisonPredicate predicateWithProperty:@"bundle_id" equalToValue:v6];
  id v9 = [(InAppReceiptDatabaseSession *)self connection];
  id v10 = +[SQLiteEntity queryOnConnection:v9 predicate:v8];
  CFStringRef v22 = @"receipt";
  v11 = +[NSArray arrayWithObjects:&v22 count:1];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100053E74;
  v14[3] = &unk_100358A08;
  id v16 = &v18;
  id v12 = v7;
  id v15 = v12;
  id v17 = a4;
  [v10 enumeratePersistentIDsAndProperties:v11 usingBlock:v14];

  if (a4) {
    *a4 = v19[3];
  }

  _Block_object_dispose(&v18, 8);

  return v12;
}

- (id)_inAppPendingTransactionsPropertyForKey:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[SQLiteComparisonPredicate predicateWithProperty:@"bundle_id" value:v7 comparisonType:1];
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = sub_10005124C;
  CFStringRef v22 = sub_10005125C;
  id v23 = 0;
  id v9 = [(InAppReceiptDatabaseSession *)self connection];
  id v10 = +[SQLiteEntity queryOnConnection:v9 predicate:v8];

  id v24 = v6;
  v11 = +[NSArray arrayWithObjects:&v24 count:1];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10005418C;
  v15[3] = &unk_100358A30;
  id v17 = &v18;
  id v12 = v6;
  id v16 = v12;
  [v10 enumeratePersistentIDsAndProperties:v11 usingBlock:v15];

  id v13 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v13;
}

- (id)_propertyForKey:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[SQLiteComparisonPredicate predicateWithProperty:@"bundle_id" value:v7 comparisonType:1];
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = sub_10005124C;
  CFStringRef v22 = sub_10005125C;
  id v23 = 0;
  id v9 = [(InAppReceiptDatabaseSession *)self connection];
  id v10 = +[SQLiteEntity queryOnConnection:v9 predicate:v8];

  id v24 = v6;
  v11 = +[NSArray arrayWithObjects:&v24 count:1];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000543EC;
  v15[3] = &unk_100358A30;
  id v17 = &v18;
  id v12 = v6;
  id v16 = v12;
  [v10 enumeratePersistentIDsAndProperties:v11 usingBlock:v15];

  id v13 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v13;
}

- (id)_statusesForRenewalInfoBlob:(id)a3 subscriptionGroupID:(id)a4 bundleID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v27 = 0;
  id v10 = sub_100047664(a3, &v27);
  id v11 = v27;
  if (v11)
  {
    if (qword_10039FB40 != -1) {
      dispatch_once(&qword_10039FB40, &stru_100358A78);
    }
    if (os_log_type_enabled((os_log_t)qword_10039FB20, OS_LOG_TYPE_ERROR)) {
      sub_1002C3D68((uint64_t)v8);
    }
    id v22 = 0;
  }
  else
  {
    +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v10 count]);
    uint64_t v21 = v10;
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v12 = v10;
    id v13 = [v12 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v18 = [(InAppReceiptDatabaseSession *)self _latestTransactionReceiptForUnarchivedRenewalInfo:v17 subscriptionGroupID:v8 bundleID:v9 outProductID:0];
          if (v18)
          {
            id v19 = [v17 mutableCopy];
            [v19 setObject:v18 forKeyedSubscript:@"signedTransactionInfo"];
            [v22 addObject:v19];
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v14);
    }

    id v11 = 0;
    id v10 = v21;
  }

  return v22;
}

- (id)_latestTransactionReceiptForUnarchivedRenewalInfo:(id)a3 subscriptionGroupID:(id)a4 bundleID:(id)a5 outProductID:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v10 objectForKeyedSubscript:@"signedRenewalInfo"];
  id v26 = 0;
  id v14 = sub_100046330(v13, (uint64_t)&v26);
  id v15 = v26;
  if (v15)
  {
    if (qword_10039FB40 != -1) {
      dispatch_once(&qword_10039FB40, &stru_100358A78);
    }
    if (os_log_type_enabled((os_log_t)qword_10039FB20, OS_LOG_TYPE_ERROR)) {
      sub_1002C3EB0((uint64_t)v11);
    }
    id v16 = 0;
  }
  else
  {
    id v17 = [v14 objectForKeyedSubscript:@"productId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v20 = 0;
      uint64_t v21 = &v20;
      uint64_t v22 = 0x3032000000;
      long long v23 = sub_10005124C;
      long long v24 = sub_10005125C;
      id v25 = 0;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10005498C;
      v19[3] = &unk_100357E68;
      void v19[4] = &v20;
      [(InAppReceiptDatabaseSession *)self enumerateReceiptsForProductID:v17 bundleID:v12 usingBlock:v19];
      if ([(id)v21[5] length])
      {
        if (a6) {
          *a6 = v17;
        }
        id v16 = (id)v21[5];
      }
      else
      {
        if (qword_10039FB40 != -1) {
          dispatch_once(&qword_10039FB40, &stru_100358A78);
        }
        if (os_log_type_enabled((os_log_t)qword_10039FB20, OS_LOG_TYPE_ERROR)) {
          sub_1002C3DD8();
        }
        id v16 = 0;
      }
      _Block_object_dispose(&v20, 8);
    }
    else
    {
      if (qword_10039FB40 != -1) {
        dispatch_once(&qword_10039FB40, &stru_100358A78);
      }
      if (os_log_type_enabled((os_log_t)qword_10039FB20, OS_LOG_TYPE_ERROR)) {
        sub_1002C3E40((uint64_t)v11);
      }
      id v16 = 0;
    }
  }

  return v16;
}

- (void)_enumerateSubscriptionStatusForBundleID:(id)a3 alsoMatchingPredicate:(id)a4 ignoreEmptyStatus:(BOOL)a5 usingBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = +[SQLiteComparisonPredicate predicateWithProperty:@"bundle_id" equalToValue:v10];
  id v14 = (void *)v13;
  if (v11)
  {
    v27[0] = v13;
    v27[1] = v11;
    id v15 = +[NSArray arrayWithObjects:v27 count:2];
    uint64_t v16 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v15];

    id v14 = (void *)v16;
  }
  v26[0] = @"subscription_group_id";
  v26[1] = @"last_updated";
  v26[2] = @"renewal_info";
  id v17 = +[NSArray arrayWithObjects:v26 count:3];
  uint64_t v18 = [(InAppReceiptDatabaseSession *)self connection];
  id v19 = +[SQLiteEntity queryOnConnection:v18 predicate:v14];

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  void v22[2] = sub_100054BDC;
  v22[3] = &unk_100358A58;
  v22[4] = self;
  id v23 = v10;
  BOOL v25 = a5;
  id v24 = v12;
  id v20 = v12;
  id v21 = v10;
  [v19 enumeratePersistentIDsAndProperties:v17 usingBlock:v22];
}

- (SQLiteConnection)connection
{
  return (SQLiteConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end