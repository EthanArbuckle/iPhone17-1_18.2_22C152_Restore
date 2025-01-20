@interface InAppReceiptDatabaseTransaction
- (BOOL)cacheLegacyTransactionsForBundleID:(id)a3 transactions:(id)a4 logKey:(id)a5;
- (BOOL)clearLegacyTransactionsLastUpdatedForBundleID:(id)a3;
- (BOOL)reconcileUnfinishedTransactionIDs:(id)a3 forBundleID:(id)a4 logKey:(id)a5;
- (BOOL)removeCachedLegacyTransactionWithID:(id)a3 forBundleID:(id)a4;
- (BOOL)removeCachedLegacyTransactionsForBundleID:(id)a3;
- (BOOL)removeReceiptsForBundleID:(id)a3;
- (BOOL)removeStatusesForBundleID:(id)a3;
- (BOOL)resetLegacyTransactionsLastUpdatedForBundleID:(id)a3;
- (BOOL)setAppTransaction:(id)a3 forBundleID:(id)a4 bundleVersion:(id)a5 token:(id)a6;
- (BOOL)setFinishedForTransactionID:(id)a3 bundleID:(id)a4 logKey:(id)a5;
- (BOOL)setLegacyTransactionsLastUpdatedForBundleID:(id)a3 token:(id)a4;
- (BOOL)setRevision:(id)a3 includesFinishedConsumables:(BOOL)a4 token:(id)a5 forBundleID:(id)a6;
- (BOOL)setSubscriptionRenewalInfo:(id)a3 forGroupID:(id)a4 bundleID:(id)a5 gracePeriodExpirationDate:(id)a6 logKey:(id)a7;
- (BOOL)setTransactionInfo:(id)a3 unfinishedIDs:(id)a4 forBundleID:(id)a5 logKey:(id)a6 containsSubscriptions:(BOOL *)a7;
@end

@implementation InAppReceiptDatabaseTransaction

- (BOOL)cacheLegacyTransactionsForBundleID:(id)a3 transactions:(id)a4 logKey:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v37 = a5;
  v39 = v7;
  if (v7)
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v9 = [v8 countByEnumeratingWithState:&v42 objects:v52 count:16];
    if (v9)
    {
      id v11 = v9;
      uint64_t v12 = *(void *)v43;
      unsigned __int8 v13 = 1;
      *(void *)&long long v10 = 138543874;
      long long v36 = v10;
      id obj = v8;
      do
      {
        v14 = 0;
        do
        {
          if (*(void *)v43 != v12) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v42 + 1) + 8 * (void)v14);
          v16 = objc_msgSend(v15, "objectForKeyedSubscript:", @"tid", v36);
          if ([v16 length])
          {
            v17 = +[NSMutableDictionary dictionaryWithCapacity:12];
            [v17 setObject:v39 forKeyedSubscript:@"bundle_id"];
            [v17 setObject:v16 forKeyedSubscript:@"transaction_id"];
            v18 = [v15 objectForKeyedSubscript:@"otid"];
            [v17 setObject:v18 forKeyedSubscript:@"original_transaction_id"];

            v19 = [v15 objectForKeyedSubscript:off_100399560[0]];
            [v17 setObject:v19 forKeyedSubscript:@"product_id"];

            v20 = [v15 objectForKeyedSubscript:off_100399388[0]];
            [v17 setObject:v20 forKeyedSubscript:@"item_id"];

            v21 = [v15 objectForKeyedSubscript:@"odate"];
            [v17 setObject:v21 forKeyedSubscript:@"transaction_date"];

            v22 = [v15 objectForKeyedSubscript:@"date"];
            [v17 setObject:v22 forKeyedSubscript:@"original_transaction_date"];

            v23 = [v15 objectForKeyedSubscript:@"rcpt"];
            [v17 setObject:v23 forKeyedSubscript:@"receipt"];

            v24 = [v15 objectForKeyedSubscript:off_100399568[0]];
            [v17 setObject:v24 forKeyedSubscript:@"quantity"];

            v25 = [v15 objectForKeyedSubscript:off_100399570[0]];
            [v17 setObject:v25 forKeyedSubscript:@"request_data"];

            v26 = [v15 objectForKeyedSubscript:off_1003994D0[0]];
            [v17 setObject:v26 forKeyedSubscript:@"transaction_receipt"];

            v27 = [v15 objectForKeyedSubscript:@"assets"];
            if (v27)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v41 = 0;
                v28 = +[NSKeyedArchiver archivedDataWithRootObject:v27 requiringSecureCoding:1 error:&v41];
                id v29 = v41;
                v30 = v29;
                if (!v28 || v29)
                {
                  if (qword_1003A05A0 != -1) {
                    dispatch_once(&qword_1003A05A0, &stru_10035A610);
                  }
                  v31 = qword_1003A0580;
                  if (os_log_type_enabled((os_log_t)qword_1003A0580, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = v36;
                    v47 = self;
                    __int16 v48 = 2114;
                    id v49 = v37;
                    __int16 v50 = 2114;
                    v51 = v30;
                    _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "[%{public}@][%{public}@] Error caching assets: %{public}@", buf, 0x20u);
                  }
                  unsigned __int8 v13 = 0;
                }
                [v17 setObject:v28 forKeyedSubscript:@"assets"];
              }
            }
            v32 = [InAppPendingTransactionsDatabaseEntity alloc];
            v33 = [(InAppReceiptDatabaseSession *)self connection];
            v34 = [(SQLiteEntity *)v32 initWithPropertyValues:v17 onConnection:v33];

            if (v13) {
              unsigned __int8 v13 = [(SQLiteEntity *)v34 existsInDatabase];
            }
            else {
              unsigned __int8 v13 = 0;
            }
          }
          v14 = (char *)v14 + 1;
        }
        while (v11 != v14);
        id v8 = obj;
        id v11 = [obj countByEnumeratingWithState:&v42 objects:v52 count:16];
      }
      while (v11);
    }
    else
    {
      unsigned __int8 v13 = 1;
    }
  }
  else
  {
    if (qword_1003A05A0 != -1) {
      dispatch_once(&qword_1003A05A0, &stru_10035A610);
    }
    if (os_log_type_enabled((os_log_t)qword_1003A0580, OS_LOG_TYPE_ERROR)) {
      sub_1002CA3DC();
    }
    unsigned __int8 v13 = 0;
  }

  return v13 & 1;
}

- (BOOL)clearLegacyTransactionsLastUpdatedForBundleID:(id)a3
{
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"bundle_id" equalToValue:a3];
  v5 = [(InAppReceiptDatabaseSession *)self connection];
  v6 = +[SQLiteEntity queryOnConnection:v5 predicate:v4];

  LOBYTE(v5) = [v6 deleteAllEntities];
  return (char)v5;
}

- (BOOL)reconcileUnfinishedTransactionIDs:(id)a3 forBundleID:(id)a4 logKey:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  unsigned __int8 v29 = [(InAppReceiptDatabaseSession *)self cacheIncludesFinishedConsumablesForBundleID:v10];
  id v11 = +[SQLiteComparisonPredicate predicateWithProperty:@"bundle_id" value:v10 comparisonType:1];

  uint64_t v12 = +[SQLiteComparisonPredicate predicateWithProperty:@"is_finished" equalToValue:&__kCFBooleanFalse];
  if ([v8 count])
  {
    unsigned __int8 v13 = [v8 allObjects];
    +[SQLiteContainsPredicate containsPredicateWithProperty:@"transaction_id" values:v13];
    id v28 = v9;
    v14 = v12;
    v16 = v15 = v11;

    v38[0] = v14;
    v38[1] = v16;
    v17 = +[NSArray arrayWithObjects:v38 count:2];
    v18 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v17];

    v37[0] = v15;
    v37[1] = v18;
    v19 = +[NSArray arrayWithObjects:v37 count:2];
    v20 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v19];

    id v11 = v15;
    uint64_t v12 = v14;
    id v9 = v28;
  }
  else
  {
    v36[0] = v11;
    v36[1] = v12;
    v21 = +[NSArray arrayWithObjects:v36 count:2];
    v20 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v21];
  }
  v35[0] = @"transaction_id";
  v35[1] = @"product_type";
  v35[2] = @"is_finished";
  v22 = +[NSArray arrayWithObjects:v35 count:3];
  v23 = [(InAppReceiptDatabaseSession *)self connection];
  v24 = +[SQLiteEntity queryOnConnection:v23 predicate:v20];

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100093640;
  v30[3] = &unk_10035A5C8;
  id v31 = v8;
  v32 = self;
  unsigned __int8 v34 = v29;
  id v33 = v9;
  id v25 = v9;
  id v26 = v8;
  [v24 enumeratePersistentIDsAndProperties:v22 usingBlock:v30];

  return 1;
}

- (BOOL)removeCachedLegacyTransactionsForBundleID:(id)a3
{
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"bundle_id" equalToValue:a3];
  v5 = [(InAppReceiptDatabaseSession *)self connection];
  v6 = +[SQLiteEntity queryOnConnection:v5 predicate:v4];

  LOBYTE(v5) = [v6 deleteAllEntities];
  return (char)v5;
}

- (BOOL)removeCachedLegacyTransactionWithID:(id)a3 forBundleID:(id)a4
{
  id v6 = a3;
  id v7 = +[SQLiteComparisonPredicate predicateWithProperty:@"bundle_id" equalToValue:a4];
  id v8 = +[SQLiteComparisonPredicate predicateWithProperty:@"transaction_id" equalToValue:v6];

  v14[0] = v7;
  v14[1] = v8;
  id v9 = +[NSArray arrayWithObjects:v14 count:2];
  id v10 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v9];

  id v11 = [(InAppReceiptDatabaseSession *)self connection];
  uint64_t v12 = +[SQLiteEntity queryOnConnection:v11 predicate:v10];

  LOBYTE(v11) = [v12 deleteAllEntities];
  return (char)v11;
}

- (BOOL)removeReceiptsForBundleID:(id)a3
{
  id v4 = a3;
  v5 = +[SQLiteComparisonPredicate predicateWithProperty:@"bundle_id" equalToValue:v4];
  id v6 = [(InAppReceiptDatabaseSession *)self connection];
  id v7 = +[SQLiteEntity queryOnConnection:v6 predicate:v5];

  id v8 = +[SQLiteComparisonPredicate predicateWithProperty:@"bundle_id" equalToValue:v4];

  id v9 = [(InAppReceiptDatabaseSession *)self connection];
  id v10 = +[SQLiteEntity queryOnConnection:v9 predicate:v8];

  if ([v7 deleteAllEntities]) {
    unsigned __int8 v11 = [v10 deleteAllEntities];
  }
  else {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (BOOL)removeStatusesForBundleID:(id)a3
{
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"bundle_id" equalToValue:a3];
  v5 = [(InAppReceiptDatabaseSession *)self connection];
  id v6 = +[SQLiteEntity queryOnConnection:v5 predicate:v4];

  LOBYTE(v5) = [v6 deleteAllEntities];
  return (char)v5;
}

- (BOOL)setAppTransaction:(id)a3 forBundleID:(id)a4 bundleVersion:(id)a5 token:(id)a6
{
  v20[0] = @"bundle_id";
  v20[1] = @"bundle_version";
  v21[0] = a4;
  v21[1] = a5;
  v20[2] = @"last_updated";
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = +[NSDate now];
  v21[2] = v14;
  v21[3] = v13;
  v20[3] = @"receipt";
  v20[4] = @"token";
  v21[4] = v10;
  v15 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:5];

  v16 = [AppTransactionDatabaseEntity alloc];
  v17 = [(InAppReceiptDatabaseSession *)self connection];
  v18 = [(SQLiteEntity *)v16 initWithPropertyValues:v15 onConnection:v17];

  LOBYTE(v17) = [(SQLiteEntity *)v18 existsInDatabase];
  return (char)v17;
}

- (BOOL)setFinishedForTransactionID:(id)a3 bundleID:(id)a4 logKey:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  unsigned __int8 v11 = [(InAppReceiptDatabaseSession *)self cacheIncludesFinishedConsumablesForBundleID:v9];
  id v12 = +[SQLiteComparisonPredicate predicateWithProperty:@"bundle_id" value:v9 comparisonType:1];

  id v13 = +[SQLiteComparisonPredicate predicateWithProperty:@"transaction_id" value:v10 comparisonType:1];

  v14 = +[SQLiteComparisonPredicate predicateWithProperty:@"is_finished" value:&__kCFBooleanFalse comparisonType:1];
  v26[0] = v12;
  v26[1] = v13;
  v26[2] = v14;
  v15 = +[NSArray arrayWithObjects:v26 count:3];
  v16 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v15];

  v17 = [(InAppReceiptDatabaseSession *)self connection];
  v18 = +[SQLiteEntity queryOnConnection:v17 predicate:v16];

  CFStringRef v25 = @"product_type";
  v19 = +[NSArray arrayWithObjects:&v25 count:1];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100093F6C;
  v22[3] = &unk_10035A5F0;
  unsigned __int8 v24 = v11;
  v22[4] = self;
  id v23 = v8;
  id v20 = v8;
  [v18 enumeratePersistentIDsAndProperties:v19 usingBlock:v22];

  return 1;
}

- (BOOL)setLegacyTransactionsLastUpdatedForBundleID:(id)a3 token:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSMutableDictionary dictionaryWithCapacity:3];
  [v8 setObject:v7 forKeyedSubscript:@"bundle_id"];

  [v8 setObject:v6 forKeyedSubscript:@"token"];
  id v9 = +[NSDate now];
  [v8 setObject:v9 forKeyedSubscript:@"last_updated"];

  id v10 = [InAppPendingTransactionsPropertiesDatabaseEntity alloc];
  unsigned __int8 v11 = [(InAppReceiptDatabaseSession *)self connection];
  id v12 = [(SQLiteEntity *)v10 initWithPropertyValues:v8 onConnection:v11];

  LOBYTE(v11) = [(SQLiteEntity *)v12 existsInDatabase];
  return (char)v11;
}

- (BOOL)resetLegacyTransactionsLastUpdatedForBundleID:(id)a3
{
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"bundle_id" equalToValue:a3];
  v5 = [(InAppReceiptDatabaseSession *)self connection];
  id v6 = +[SQLiteEntity anyOnConnection:v5 predicate:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = +[NSDate distantPast];
    unsigned __int8 v8 = [v6 setValue:v7 forProperty:@"last_updated"];
  }
  else
  {
    unsigned __int8 v8 = 1;
  }

  return v8;
}

- (BOOL)setTransactionInfo:(id)a3 unfinishedIDs:(id)a4 forBundleID:(id)a5 logKey:(id)a6 containsSubscriptions:(BOOL *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v62 = a5;
  id v57 = a6;
  if (a7) {
    *a7 = 0;
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v14 = v12;
  id v63 = [v14 countByEnumeratingWithState:&v66 objects:v74 count:16];
  if (!v63)
  {
    LOBYTE(v17) = 1;
    goto LABEL_65;
  }
  v56 = a7;
  uint64_t v16 = *(void *)v67;
  *(void *)&long long v15 = 138543362;
  long long v55 = v15;
  v59 = self;
  LODWORD(v17) = 1;
  id v60 = v14;
  id v61 = v13;
  uint64_t v58 = *(void *)v67;
  while (2)
  {
    v18 = 0;
    do
    {
      int v64 = (int)v17;
      if (*(void *)v67 != v16) {
        objc_enumerationMutation(v14);
      }
      v19 = *(void **)(*((void *)&v66 + 1) + 8 * (void)v18);
      id v65 = 0;
      id v20 = sub_100046330(v19, (uint64_t)&v65);
      id v21 = v65;
      if (v21)
      {
        v22 = v21;
        if (qword_1003A05A0 != -1) {
          dispatch_once(&qword_1003A05A0, &stru_10035A610);
        }
        id v23 = qword_1003A0580;
        if (os_log_type_enabled((os_log_t)qword_1003A0580, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          id v71 = v57;
          __int16 v72 = 2114;
          v73 = v22;
          _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "[%{public}@] Error parsing payload from transaction: %{public}@", buf, 0x16u);
        }
        LODWORD(v17) = 0;
        unsigned __int8 v24 = v20;
        goto LABEL_49;
      }
      unsigned __int8 v24 = [v20 objectForKeyedSubscript:@"transactionId"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (qword_1003A05A0 != -1) {
          dispatch_once(&qword_1003A05A0, &stru_10035A610);
        }
        v35 = qword_1003A0580;
        if (os_log_type_enabled((os_log_t)qword_1003A0580, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v55;
          id v71 = v57;
          _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "[%{public}@] Invalid transaction payload. ID = nil", buf, 0xCu);
        }
        LODWORD(v17) = 0;
        v22 = v20;
        goto LABEL_49;
      }
      CFStringRef v25 = +[NSMutableDictionary dictionary];
      [v25 setObject:v24 forKeyedSubscript:@"transaction_id"];
      id v26 = [v20 objectForKeyedSubscript:@"bundleId"];
      [v25 setObject:v26 forKeyedSubscript:@"bundle_id"];

      v27 = [v20 objectForKeyedSubscript:@"productId"];
      [v25 setObject:v27 forKeyedSubscript:@"product_id"];

      uint64_t v28 = [v20 objectForKeyedSubscript:@"isUpgraded"];
      unsigned __int8 v29 = (void *)v28;
      if (v28) {
        v30 = (void *)v28;
      }
      else {
        v30 = &__kCFBooleanFalse;
      }
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v30, @"is_upgraded", v55);

      if (v13)
      {
        id v31 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v13 containsObject:v24] ^ 1);
        [v25 setObject:v31 forKeyedSubscript:@"is_finished"];
      }
      v32 = [v20 objectForKeyedSubscript:@"type"];
      if ([v32 isEqual:@"Consumable"])
      {
        id v33 = v25;
        unsigned __int8 v34 = &off_100373C08;
      }
      else if ([v32 isEqual:@"Non-Consumable"])
      {
        id v33 = v25;
        unsigned __int8 v34 = &off_100373C20;
      }
      else
      {
        if ([v32 isEqual:@"Auto-Renewable Subscription"])
        {
          [v25 setObject:&off_100373C38 forKeyedSubscript:@"product_type"];
          if (v56) {
            BOOL *v56 = 1;
          }
          goto LABEL_30;
        }
        if ([v32 isEqual:@"Non-Renewing Subscription"])
        {
          id v33 = v25;
          unsigned __int8 v34 = &off_100373C50;
        }
        else
        {
          id v33 = v25;
          unsigned __int8 v34 = &off_100373C68;
        }
      }
      [v33 setObject:v34 forKeyedSubscript:@"product_type"];
LABEL_30:
      long long v36 = [v20 objectForKeyedSubscript:@"purchaseDate"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v37 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(uint64_t)[v36 longLongValue] / 1000.0);
        [v25 setObject:v37 forKeyedSubscript:@"transaction_date"];
      }
      v38 = [v20 objectForKeyedSubscript:@"revocationDate"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v39 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(uint64_t)[v38 longLongValue] / 1000.0);
        [v25 setObject:v39 forKeyedSubscript:@"revocation_date"];
      }
      v40 = [v20 objectForKeyedSubscript:@"expiresDate"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v41 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(uint64_t)[v40 longLongValue] / 1000.0);
        [v25 setObject:v41 forKeyedSubscript:@"expiration_date"];
      }
      [v25 setObject:v19 forKeyedSubscript:@"receipt"];
      v17 = [(InAppReceiptDatabaseSession *)self transactionForID:v24 bundleID:v62];
      if (v17)
      {
        if (qword_1003A05A0 != -1) {
          dispatch_once(&qword_1003A05A0, &stru_10035A610);
        }
        long long v42 = qword_1003A0580;
        if (os_log_type_enabled((os_log_t)qword_1003A0580, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543619;
          id v71 = v57;
          __int16 v72 = 2113;
          v73 = v24;
          _os_log_debug_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "[%{public}@] Updating transaction info for %{private}@", buf, 0x16u);
        }
        long long v43 = [InAppTransactionEntity alloc];
        id v44 = [v17 databaseID];
        long long v45 = [(InAppReceiptDatabaseSession *)self connection];
        v46 = [(SQLiteEntity *)v43 initWithPersistentID:v44 onConnection:v45];

        unsigned int v47 = [(SQLiteEntity *)v46 setValuesWithDictionary:v25];
      }
      else
      {
        if (qword_1003A05A0 != -1) {
          dispatch_once(&qword_1003A05A0, &stru_10035A610);
        }
        __int16 v48 = qword_1003A0580;
        if (os_log_type_enabled((os_log_t)qword_1003A0580, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543619;
          id v71 = v57;
          __int16 v72 = 2113;
          v73 = v24;
          _os_log_debug_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEBUG, "[%{public}@] Writing new transaction info for %{private}@", buf, 0x16u);
        }
        id v49 = [InAppTransactionEntity alloc];
        __int16 v50 = [(InAppReceiptDatabaseSession *)self connection];
        v46 = [(SQLiteEntity *)v49 initWithPropertyValues:v25 onConnection:v50];

        unsigned int v47 = [(SQLiteEntity *)v46 existsInDatabase];
      }
      unsigned int v51 = v47;

      if ((v64 & v51 & 1) == 0)
      {
        if (qword_1003A05A0 != -1) {
          dispatch_once(&qword_1003A05A0, &stru_10035A610);
        }
        v53 = qword_1003A0580;
        if (os_log_type_enabled((os_log_t)qword_1003A0580, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543619;
          id v71 = v57;
          __int16 v72 = 2113;
          v73 = v24;
          _os_log_error_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "[%{public}@] Could not write transaction info for %{private}@", buf, 0x16u);
        }

        LOBYTE(v17) = 0;
        id v14 = v60;
        id v13 = v61;
        goto LABEL_65;
      }

      LODWORD(v17) = 1;
      v22 = v20;
      id v14 = v60;
      id v13 = v61;
      uint64_t v16 = v58;
      self = v59;
LABEL_49:

      v18 = (char *)v18 + 1;
    }
    while (v63 != v18);
    id v52 = [v14 countByEnumeratingWithState:&v66 objects:v74 count:16];
    id v63 = v52;
    if (v52) {
      continue;
    }
    break;
  }
LABEL_65:

  return (char)v17;
}

- (BOOL)setRevision:(id)a3 includesFinishedConsumables:(BOOL)a4 token:(id)a5 forBundleID:(id)a6
{
  BOOL v7 = a4;
  v21[0] = a6;
  v20[0] = @"bundle_id";
  v20[1] = @"finished_consumables";
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = +[NSNumber numberWithBool:v7];
  v21[1] = v13;
  v21[2] = v12;
  v20[2] = @"revision";
  v20[3] = @"token";
  v21[3] = v11;
  v20[4] = @"last_updated";
  id v14 = +[NSDate now];
  v21[4] = v14;
  long long v15 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:5];

  uint64_t v16 = [InAppReceiptPropertiesDatabaseEntity alloc];
  v17 = [(InAppReceiptDatabaseSession *)self connection];
  v18 = [(SQLiteEntity *)v16 initWithPropertyValues:v15 onConnection:v17];

  LOBYTE(v17) = [(SQLiteEntity *)v18 existsInDatabase];
  return (char)v17;
}

- (BOOL)setSubscriptionRenewalInfo:(id)a3 forGroupID:(id)a4 bundleID:(id)a5 gracePeriodExpirationDate:(id)a6 logKey:(id)a7
{
  id v11 = a3;
  id v36 = a4;
  id v38 = a5;
  id v37 = a6;
  id v35 = a7;
  id v12 = objc_opt_new();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v11;
  id v13 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v42;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v42 != v15) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        v18 = objc_opt_new();
        v19 = [v17 objectForKeyedSubscript:@"status"];
        [v18 setObject:v19 forKeyedSubscript:@"status"];

        id v20 = [v17 objectForKeyedSubscript:@"signedRenewalInfo"];
        [v18 setObject:v20 forKeyedSubscript:@"signedRenewalInfo"];

        [v12 addObject:v18];
      }
      id v14 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v14);
  }

  id v40 = 0;
  id v21 = +[NSKeyedArchiver archivedDataWithRootObject:v12 requiringSecureCoding:1 error:&v40];
  id v22 = v40;
  if (v22)
  {
    unsigned __int8 v24 = v37;
    id v23 = v38;
    if (qword_1003A05A0 != -1) {
      dispatch_once(&qword_1003A05A0, &stru_10035A610);
    }
    CFStringRef v25 = v35;
    id v26 = v36;
    if (os_log_type_enabled((os_log_t)qword_1003A0580, OS_LOG_TYPE_ERROR)) {
      sub_1002CA534();
    }
    unsigned __int8 v27 = 0;
  }
  else
  {
    uint64_t v28 = +[NSMutableDictionary dictionaryWithCapacity:5];
    id v23 = v38;
    [v28 setObject:v38 forKeyedSubscript:@"bundle_id"];
    id v26 = v36;
    [v28 setObject:v36 forKeyedSubscript:@"subscription_group_id"];
    unsigned __int8 v29 = +[NSDate now];
    [v28 setObject:v29 forKeyedSubscript:@"last_updated"];

    [v28 setObject:v21 forKeyedSubscript:@"renewal_info"];
    unsigned __int8 v24 = v37;
    [v28 setObject:v37 forKeyedSubscript:@"grace_period_expiration_date"];
    v30 = [InAppSubscriptionStatusDatabaseEntity alloc];
    id v31 = [(InAppReceiptDatabaseSession *)self connection];
    v32 = [(SQLiteEntity *)v30 initWithPropertyValues:v28 onConnection:v31];

    unsigned __int8 v27 = [(SQLiteEntity *)v32 existsInDatabase];
    CFStringRef v25 = v35;
  }

  return v27;
}

@end