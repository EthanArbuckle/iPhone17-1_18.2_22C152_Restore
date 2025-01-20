@interface FinHealthStateController
- (BOOL)deleteAllMarkedTransactionFeatures;
- (BOOL)deleteAllRecordsFromTransactionFeatures;
- (BOOL)insertInstrumentationRecord:(id)a3;
- (BOOL)insertReceiptData:(id)a3 identifier:(id)a4 title:(id)a5 subtitle:(id)a6 quantity:(unint64_t)a7 amount:(id)a8 currencyCode:(id)a9 adamIdentifier:(unint64_t)a10;
- (BOOL)invalidateTransactionByIdentifier:(id)a3;
- (BOOL)invalidateTransactionByTransaction:(id)a3;
- (BOOL)recordPeerPaymentForecastingSuggestionStatus:(unint64_t)a3 counterpartHandle:(id)a4 amount:(id)a5;
- (BOOL)resetTransactionStateToStateRawConsistent:(id)a3;
- (BOOL)shouldCallGetAllTransactions;
- (BOOL)suggestAutoReload;
- (BOOL)updateDeleteFlagInTransactionFeatures:(unint64_t)a3 forID:(id)a4;
- (BOOL)updateGetAllStatus:(unint64_t)a3;
- (BOOL)updatePeerPaymentAccountBalance:(id)a3 amount:(id)a4 currencyCode:(id)a5;
- (BOOL)updateTransactionsInternalStateToState:(id)a3 oldInternalState:(unint64_t)a4 newInternalState:(unint64_t)a5;
- (FinHealthBankConnectController)bankConnectController;
- (FinHealthStateController)init;
- (NSXPCConnection)connection;
- (id)_checkEventDeletion;
- (id)_clientConnection;
- (id)_getRecurringChangeOverTimePeriod:(int64_t)a3;
- (id)_init:(BOOL)a3 bypassMapService:(BOOL)a4;
- (id)_insertOrUpdateTransactionPostDirtyState:(id)a3;
- (id)_newClientConnection;
- (id)_processAggregateFeaturesWithHardReset:(BOOL)a3;
- (id)_remoteObjectProxyWithErrorHandler;
- (id)compoundFeaturesForTransaction:(id)a3;
- (id)featuresWithAmountSums:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (id)getAllPredictedPeerPaymentsAfterDate:(id)a3;
- (id)getCompundFeaturesOverTimRangeFrom:(id)a3 to:(id)a4;
- (id)getDetailedCategoryAggregateRecordsWithCountryCode:(id)a3 timeWindow:(unint64_t)a4 timeOfDay:(unint64_t)a5;
- (id)getFHAmountSmartFeatureByType:(id)a3;
- (id)getFHDateTimeSmartFeatureByType:(id)a3;
- (id)getFHMerchantSmartFeatureByType:(id)a3;
- (id)getLostSavingsOverTime:(id)a3 from:(id)a4 to:(id)a5;
- (id)getLostSavingsValueFromCompoundFeatures:(id)a3;
- (id)getMerchantForTransactionId:(id)a3;
- (id)getRecurringChangeForMessagingOverTimePeriod:(int64_t)a3;
- (id)getTransactionByIdentifier:(id)a3;
- (id)getTransactionByTransaction:(id)a3;
- (id)getTransactionSmartFeaturesForApplication:(id)a3;
- (id)getTransactionsSmartFeatures;
- (id)initForTest:(BOOL)a3 bypassMapService:(BOOL)a4;
- (id)insertOrUpdateTransaction:(id)a3;
- (id)insertOrUpdateTransactions:(id)a3;
- (id)processAggregateFeatures;
- (id)transactionsByInternalState:(unint64_t)a3 internalState:(unint64_t)a4;
- (id)transactionsInInternalAnyState:(unint64_t)a3 forPass:(id)a4;
- (id)transactionsInInternalStateConsistent:(unint64_t)a3;
- (id)transactionsInInternalStateDirty:(unint64_t)a3;
- (id)transactionsInInternalStateInvalid:(unint64_t)a3;
- (id)transactionsInInternalStateRawConsistent:(unint64_t)a3;
- (id)transactionsInInternalStateUpdatedBatch:(unint64_t)a3;
- (id)transactionsInInternalStateUpdatedRealtime:(unint64_t)a3;
- (int64_t)mostRecentTransactionDate;
- (os_unfair_lock_s)lockAggregationComputation;
- (os_unfair_lock_s)lockConnection;
- (void)_createDBManagerAndAssociatedProperties:(BOOL)a3;
- (void)_deleteAllDataForPass:(id)a3 force:(BOOL)a4 completion:(id)a5;
- (void)_excludeRecurringFromEventTaggingCandidates:(id)a3;
- (void)_tagFlightTransactionsWithTripEvents:(id)a3;
- (void)_transactionWithTransactionID:(id)a3 completion:(id)a4;
- (void)aggregateFeaturesWithHandler:(id)a3;
- (void)computeAndPersistDetailedCategoryRecords:(id)a3 withRecurringCounts:(id)a4;
- (void)countMerchantDetailedCategoryRecordsWithDictionary:(id)a3 fHTransaction:(id)a4;
- (void)countRecurringMerchantDetailedCategoryRecords:(id)a3;
- (void)deleteAllData:(id)a3;
- (void)deleteAllDataForPasses:(id)a3 force:(BOOL)a4 completion:(id)a5;
- (void)deleteAllDetailedCategoryRecords;
- (void)insertDetailedCategoryAggregateFeature:(id)a3 amountSpent:(id)a4 transactionCount:(unint64_t)a5 countryCode:(id)a6 recurringTransactionRatio:(double)a7 timeOfDay:(unint64_t)a8 timeWindow:(unint64_t)a9 startDate:(id)a10 endDate:(id)a11;
- (void)removeAllEntriesFromTable:(id)a3;
- (void)setConnection:(id)a3;
- (void)setLockAggregationComputation:(os_unfair_lock_s)a3;
- (void)setLockConnection:(os_unfair_lock_s)a3;
- (void)syncBankConnectTransactionsWithCompletion:(id)a3;
- (void)transactionBatches:(unint64_t)a3 batch:(id)a4;
- (void)updateModelProcessingIdentifier:(id)a3 withIdentifier:(id)a4;
@end

@implementation FinHealthStateController

- (id)initForTest:(BOOL)a3 bypassMapService:(BOOL)a4
{
  return [(FinHealthStateController *)self _init:a3 bypassMapService:a4];
}

- (FinHealthStateController)init
{
  return (FinHealthStateController *)[(FinHealthStateController *)self _init:0 bypassMapService:0];
}

- (id)_init:(BOOL)a3 bypassMapService:(BOOL)a4
{
  BOOL v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FinHealthStateController;
  v6 = [(FinHealthStateController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_lockConnection._os_unfair_lock_opaque = 0;
    v6->_lockAggregationComputation._os_unfair_lock_opaque = 0;
    v6->_bypassMapService = a4;
    [(FinHealthStateController *)v6 _createDBManagerAndAssociatedProperties:v5];
    v8 = [[FinHealthBankConnectController alloc] initWithDatabaseManager:v7->_dbMgr];
    bankConnectController = v7->_bankConnectController;
    v7->_bankConnectController = v8;
  }
  return v7;
}

- (void)_createDBManagerAndAssociatedProperties:(BOOL)a3
{
  self->_dbMgr = (FHDatabaseManager *)[objc_alloc((Class)FHDatabaseManager) init:a3];
  _objc_release_x1();
}

- (id)insertOrUpdateTransactions:(id)a3
{
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = [(FinHealthStateController *)self insertOrUpdateTransaction:*(void *)(*((void *)&v15 + 1) + 8 * i)];
      }
      v9 += (uint64_t)v8;
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
  else
  {
    uint64_t v9 = 0;
  }

  v13 = +[NSString stringWithFormat:@"%@ :%lu", FHBatchInsertStatusSuccess, v9, (void)v15];

  return v13;
}

- (id)insertOrUpdateTransaction:(id)a3
{
  id v4 = a3;
  BOOL v5 = FinHealthLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [v4 identifier];
    [v4 accountType];
    FHTransactionAccountTypeToString();
    id v7 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "-[FinHealthStateController insertOrUpdateTransaction:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%s]. Received transaction.identifier: %@ accountType: %@", buf, 0x20u);
  }
  if (![v4 accountType]
    || [v4 accountType] != (id)2
    && [v4 accountType] != (id)1
    && [v4 accountType] != (id)4)
  {
    goto LABEL_10;
  }
  id v8 = [(FHDatabaseManager *)self->_dbMgr getTransactionInternalState:v4];
  if (v8 == (id)1)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v14 = sub_100003D00;
    long long v15 = sub_100003D10;
    id v16 = 0;
    uint64_t v10 = [v4 identifier];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100003D18;
    v12[3] = &unk_100031368;
    v12[4] = self;
    v12[5] = buf;
    [(FinHealthStateController *)self _transactionWithTransactionID:v10 completion:v12];

    id v9 = *(id *)(*(void *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (!v8
      && ![(FHDatabaseManager *)self->_dbMgr insertTransactionInInternalStateDirty:v4])
    {
LABEL_10:
      id v9 = 0;
      goto LABEL_13;
    }
    id v9 = [(FinHealthStateController *)self _insertOrUpdateTransactionPostDirtyState:v4];
  }
LABEL_13:

  return v9;
}

- (id)_insertOrUpdateTransactionPostDirtyState:(id)a3
{
  id v4 = a3;
  if ([(FHDatabaseManager *)self->_dbMgr updateTransactionWholeRaw:v4])
  {
    dbMgr = self->_dbMgr;
    id v6 = [v4 identifier];
    id v7 = [(FHDatabaseManager *)dbMgr featuresForTransaction:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)countMerchantDetailedCategoryRecordsWithDictionary:(id)a3 fHTransaction:(id)a4
{
  id v61 = a3;
  id v5 = a4;
  id v6 = [v5 merchantDetailedCategory];
  id v7 = [v61 objectForKey:v6];

  if (!v7)
  {
    id v8 = v5;
    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    do
    {
      id v10 = objc_alloc_init((Class)NSMutableDictionary);
      for (uint64_t i = 0; i != 5; ++i)
      {
        id v13 = objc_alloc_init((Class)NSMutableDictionary);
        v14 = +[NSDecimalNumber numberWithUnsignedInteger:i];
        [v10 setObject:v13 forKey:v14];
      }
      long long v15 = +[NSDecimalNumber numberWithUnsignedInteger:v7];
      [v9 setObject:v10 forKey:v15];

      ++v7;
    }
    while (v7 != (char *)4);
    id v5 = v8;
    id v16 = [v8 merchantDetailedCategory];
    [v61 setObject:v9 forKey:v16];
  }
  long long v17 = [v5 transactionDate];
  long long v18 = [v5 timeZone];
  uint64_t TimeOfDay = GetTimeOfDay();

  v19 = GetProcessingDate();
  uint64_t v20 = [v5 countryCode];
  v21 = (void *)v20;
  v22 = &stru_100031E08;
  if (v20) {
    v22 = (__CFString *)v20;
  }
  v23 = v22;

  uint64_t v24 = 0;
  uint64_t v59 = FHMapsRecordDictAmountKey;
  uint64_t v54 = FHMapsRecordDictCountKey;
  v55 = v19;
  v25 = NSJSONSerialization_ptr;
  v60 = v23;
  v58 = v5;
  do
  {
    TimeWindowToSeconds();
    uint64_t v27 = objc_msgSend(v19, "dateByAddingTimeInterval:");
    v28 = [v5 transactionDate];
    v62 = (void *)v27;
    id v29 = [v28 compare:v27];

    if (v29 == (id)1)
    {
      v57 = v26;
      v30 = [v5 merchantDetailedCategory];
      v31 = [v61 objectForKeyedSubscript:v30];
      v32 = [v25[6] numberWithUnsignedInteger:v24];
      v33 = [v31 objectForKeyedSubscript:v32];
      v34 = [v25[6] numberWithUnsignedInteger:TimeOfDay];
      v35 = [v33 objectForKeyedSubscript:v34];

      v36 = [v35 objectForKey:v60];

      if (!v36)
      {
        id v37 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithObjectsAndKeys:", &off_1000328A0, v59, &off_100032850, v54, 0);
        [v35 setObject:v37 forKey:v60];
      }
      v38 = [v35 objectForKeyedSubscript:v60];
      v39 = +[NSDecimalNumber one];
      [v38 setOrAddToDecimalValue:v39 forKey:v54];

      v40 = [v35 objectForKeyedSubscript:v60];
      v41 = [v58 amount];
      [v40 setOrAddToDecimalValue:v41 forKey:v59];

      v42 = [v58 merchantDetailedCategory];
      v43 = [v61 objectForKeyedSubscript:v42];
      v44 = [v25[6] numberWithUnsignedInteger:v24];
      v45 = [v43 objectForKeyedSubscript:v44];
      v46 = [v45 objectForKeyedSubscript:&off_100032868];

      v23 = v60;
      v47 = [v46 objectForKey:v60];

      if (!v47)
      {
        id v48 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithObjectsAndKeys:", &off_1000328A0, v59, &off_100032850, v54, 0);
        [v46 setObject:v48 forKey:v60];
      }
      v49 = [v46 objectForKeyedSubscript:v60];
      v50 = +[NSDecimalNumber one];
      [v49 setOrAddToDecimalValue:v50 forKey:v54];

      v51 = [v46 objectForKeyedSubscript:v60];
      v52 = [v58 amount];
      [v51 setOrAddToDecimalValue:v52 forKey:v59];

      id v5 = v58;
      v19 = v55;
      v25 = NSJSONSerialization_ptr;
      v26 = v57;
    }

    ++v24;
  }
  while (v24 != 4);
}

- (void)countRecurringMerchantDetailedCategoryRecords:(id)a3
{
  id v4 = a3;
  id v6 = [(FHDatabaseManager *)self->_dbMgr getRecurringTransactionIdentifiersByClass:9];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = [(FHDatabaseManager *)self->_dbMgr getTransactionByIdentifier:*(void *)(*((void *)&v14 + 1) + 8 * (void)v10)];
        id v12 = v11;
        if (v11)
        {
          id v13 = [v11 merchantDetailedCategory];

          if (v13) {
            [(FinHealthStateController *)self countMerchantDetailedCategoryRecordsWithDictionary:v4 fHTransaction:v12];
          }
        }

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)computeAndPersistDetailedCategoryRecords:(id)a3 withRecurringCounts:(id)a4
{
  id v5 = a3;
  id v55 = a4;
  v60 = GetProcessingDate();
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id obj = v5;
  id v51 = [obj countByEnumeratingWithState:&v70 objects:v75 count:16];
  if (v51)
  {
    uint64_t v50 = *(void *)v71;
    uint64_t v6 = FHMapsRecordDictCountKey;
    uint64_t v58 = FHMapsRecordDictAmountKey;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v71 != v50) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = 0;
        uint64_t v52 = v7;
        uint64_t v9 = *(void *)(*((void *)&v70 + 1) + 8 * v7);
        uint64_t v56 = v9;
        do
        {
          TimeWindowToSeconds();
          id v61 = objc_msgSend(v60, "dateByAddingTimeInterval:");
          uint64_t v10 = 0;
          uint64_t v57 = v8;
          do
          {
            objc_super v11 = [obj objectForKeyedSubscript:v9];
            id v12 = +[NSNumber numberWithUnsignedInteger:v8];
            id v13 = [v11 objectForKeyedSubscript:v12];
            uint64_t v64 = v10;
            long long v14 = +[NSNumber numberWithUnsignedInteger:v10];
            [v13 objectForKeyedSubscript:v14];
            v16 = uint64_t v15 = v9;

            long long v68 = 0u;
            long long v69 = 0u;
            long long v66 = 0u;
            long long v67 = 0u;
            id v17 = v16;
            uint64_t v9 = v15;
            id v65 = v17;
            id v63 = [v17 countByEnumeratingWithState:&v66 objects:v74 count:16];
            if (v63)
            {
              uint64_t v62 = *(void *)v67;
              do
              {
                for (uint64_t i = 0; i != v63; uint64_t i = (char *)i + 1)
                {
                  if (*(void *)v67 != v62) {
                    objc_enumerationMutation(v65);
                  }
                  uint64_t v19 = *(void *)(*((void *)&v66 + 1) + 8 * i);
                  uint64_t v20 = [v65 objectForKeyedSubscript:v19];
                  v21 = [v20 objectForKeyedSubscript:v6];
                  int v22 = [v21 intValue];

                  if (v22 >= 1)
                  {
                    double v23 = 0.0;
                    if (_os_feature_enabled_impl())
                    {
                      uint64_t v24 = [v55 objectForKeyedSubscript:v9];
                      v25 = +[NSNumber numberWithUnsignedInteger:v8];
                      v26 = [v24 objectForKeyedSubscript:v25];
                      uint64_t v27 = +[NSNumber numberWithUnsignedInteger:v64];
                      [v26 objectForKeyedSubscript:v27];
                      id v29 = v28 = v6;
                      v30 = [v29 objectForKeyedSubscript:v19];
                      v31 = [v30 objectForKeyedSubscript:v28];

                      uint64_t v8 = v57;
                      uint64_t v6 = v28;

                      uint64_t v32 = v56;
                      if (v31)
                      {
                        v33 = [v55 objectForKeyedSubscript:v56];
                        v34 = +[NSNumber numberWithUnsignedInteger:v57];
                        v35 = [v33 objectForKeyedSubscript:v34];
                        v36 = +[NSNumber numberWithUnsignedInteger:v64];
                        id v37 = [v35 objectForKeyedSubscript:v36];
                        v38 = [v37 objectForKeyedSubscript:v19];
                        v39 = [v38 objectForKeyedSubscript:v28];

                        uint64_t v8 = v57;
                        uint64_t v6 = v28;

                        [v39 doubleValue];
                        double v41 = v40;
                        v42 = [v65 objectForKeyedSubscript:v19];
                        v43 = [v42 objectForKeyedSubscript:v28];
                        [v43 doubleValue];
                        double v23 = v41 / v44;

                        uint64_t v32 = v56;
                      }
                    }
                    else
                    {
                      uint64_t v32 = v9;
                    }
                    v45 = [v65 objectForKeyedSubscript:v19];
                    v46 = [v45 objectForKeyedSubscript:v58];
                    v47 = [v65 objectForKeyedSubscript:v19];
                    id v48 = [v47 objectForKeyedSubscript:v6];
                    -[FinHealthStateController insertDetailedCategoryAggregateFeature:amountSpent:transactionCount:countryCode:recurringTransactionRatio:timeOfDay:timeWindow:startDate:endDate:](self, "insertDetailedCategoryAggregateFeature:amountSpent:transactionCount:countryCode:recurringTransactionRatio:timeOfDay:timeWindow:startDate:endDate:", v32, v46, (int)[v48 intValue], v19, v64, v8, v23, v61, v60);

                    uint64_t v9 = v32;
                  }
                }
                id v63 = [v65 countByEnumeratingWithState:&v66 objects:v74 count:16];
              }
              while (v63);
            }

            uint64_t v10 = v64 + 1;
          }
          while (v64 != 4);

          ++v8;
        }
        while (v8 != 4);
        uint64_t v7 = v52 + 1;
      }
      while ((id)(v52 + 1) != v51);
      id v51 = [obj countByEnumeratingWithState:&v70 objects:v75 count:16];
    }
    while (v51);
  }
}

- (void)insertDetailedCategoryAggregateFeature:(id)a3 amountSpent:(id)a4 transactionCount:(unint64_t)a5 countryCode:(id)a6 recurringTransactionRatio:(double)a7 timeOfDay:(unint64_t)a8 timeWindow:(unint64_t)a9 startDate:(id)a10 endDate:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a6;
  id v20 = a10;
  id v21 = a11;
  id v22 = objc_alloc((Class)FHDatabaseEntity);
  id v23 = [v22 initWithEntity:FHDetailedCategoryAggregateFeaturesTableName];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100004C0C;
  v30[3] = &unk_100031390;
  id v31 = v17;
  id v32 = v18;
  double v37 = a7;
  unint64_t v38 = a8;
  unint64_t v39 = a9;
  id v33 = v19;
  id v34 = v20;
  id v35 = v21;
  unint64_t v36 = a5;
  id v24 = v21;
  id v25 = v20;
  id v26 = v19;
  id v27 = v18;
  id v28 = v17;
  id v29 = +[FHDatabaseInsertOrUpdateFromBuilder initWithBuilder:v30];
  [v23 insertOrUpdate:v29 upsert:1];
}

- (id)getDetailedCategoryAggregateRecordsWithCountryCode:(id)a3 timeWindow:(unint64_t)a4 timeOfDay:(unint64_t)a5
{
  id v7 = a3;
  id v8 = objc_alloc((Class)FHDatabaseEntity);
  id v9 = [v8 initWithEntity:FHDetailedCategoryAggregateFeaturesTableName];
  uint64_t v10 = [v9 fieldsInOrder];
  objc_super v11 = objc_msgSend(v10, "subarrayWithRange:", 1, (char *)objc_msgSend(v10, "count") - 1);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100005008;
  v32[3] = &unk_1000313B8;
  unint64_t v34 = a4;
  unint64_t v35 = a5;
  id v12 = v7;
  id v33 = v12;
  id v13 = +[FHDatabaseClauseFromBuilder initWithBuilder:v32];
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = sub_100003D00;
  v30 = sub_100003D10;
  id v31 = (id)objc_opt_new();
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = sub_100003D00;
  v24[4] = sub_100003D10;
  id v25 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v14 = FHLogicalOperatorAnd;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000050A0;
  v18[3] = &unk_1000313E0;
  id v15 = v12;
  unint64_t v22 = a4;
  unint64_t v23 = a5;
  id v19 = v15;
  id v20 = v24;
  id v21 = &v26;
  [v9 queryDataWithBlock:v13 logicalOperator:v14 selectFields:v11 usingBlock:v18];
  [(id)v27[5] sortUsingComparator:&stru_100031420];
  id v16 = [(id)v27[5] copy];

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v26, 8);

  return v16;
}

- (void)deleteAllDetailedCategoryRecords
{
  id v2 = objc_alloc((Class)FHDatabaseEntity);
  id v3 = [v2 initWithEntity:FHDetailedCategoryAggregateFeaturesTableName];
  [v3 clearData];
}

- (id)processAggregateFeatures
{
  return [(FinHealthStateController *)self _processAggregateFeaturesWithHardReset:1];
}

- (void)aggregateFeaturesWithHandler:(id)a3
{
  if (a3)
  {
    id v4 = (void (**)(id, void *, void))a3;
    id v6 = [(FinHealthStateController *)self _processAggregateFeaturesWithHardReset:1];
    id v5 = [v6 description];
    v4[2](v4, v5, 0);
  }
}

- (id)_processAggregateFeaturesWithHardReset:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = FinHealthLogObject();
  id v5 = FinHealthLogObject();
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);

  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "processAggregateFeatures", "", buf, 2u);
  }

  id v7 = FinHealthLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "BEGIN \"processAggregateFeatures\"", buf, 2u);
  }

  long long v71 = objc_opt_new();
  uint64_t v8 = FHSmartFeatureCompoundTypePointsOfInterest;
  id v9 = (char *)[(FHDatabaseManager *)self->_dbMgr processingTimeForFeature:FHSmartFeatureCompoundTypePointsOfInterest];
  uint64_t v10 = +[NSDate now];
  [v10 timeIntervalSinceReferenceDate];
  double v12 = v11;

  if (v9) {
    BOOL v13 = (unint64_t)v12 - (unint64_t)v9 >= secondsInDay * timePeriodNinetyDays;
  }
  else {
    BOOL v13 = 1;
  }
  uint64_t v14 = FinHealthLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v15 = @"NO";
    if (v13) {
      CFStringRef v15 = @"YES";
    }
    *(_DWORD *)buf = 134218242;
    v101 = v9;
    __int16 v102 = 2112;
    CFStringRef v103 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "lastProcessingDateForPOI: %lu, poiStalenessCheck: %@", buf, 0x16u);
  }

  if (v13) {
    [(FHDatabaseManager *)self->_dbMgr updateProcessingTimeForFeature:v8];
  }
  id v81 = objc_alloc_init((Class)NSMutableDictionary);
  id v79 = objc_alloc_init((Class)NSMutableDictionary);
  id v80 = objc_alloc_init((Class)NSMutableDictionary);
  id v77 = objc_alloc_init((Class)NSMutableDictionary);
  id v66 = objc_alloc_init((Class)NSMutableDictionary);
  long long v72 = objc_alloc_init(FinHealthRealtimeFeaturesRequest);
  if (v3)
  {
    long long v69 = objc_alloc_init(FinHealthGeoFeatures);
    BOOL bypassMapService = self->_bypassMapService;
    self->_BOOL bypassMapService = 1;
    id v65 = [(FinHealthStateController *)self _checkEventDeletion];
    long long v68 = [v65 firstObject];
    id v16 = [v65 objectAtIndexedSubscript:1];
    [(FinHealthRealtimeFeaturesRequest *)v72 setPastTimeRangesToRetagEvents:v16];

    long long v67 = [v65 lastObject];
    id v17 = 0;
    v76 = 0;
    unsigned int v70 = !v13;
    uint64_t v74 = sqlDefaultBatchSize;
    while (1)
    {
      id v18 = [(FHDatabaseManager *)self->_dbMgr getTransactionsByInternalState:v74 internalState:2 offSet:v76 addCompoundFeatures:v70];

      long long v97 = 0u;
      long long v98 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      id v19 = v18;
      id v20 = [v19 countByEnumeratingWithState:&v95 objects:v99 count:16];
      if (!v20) {
        goto LABEL_43;
      }
      uint64_t v21 = *(void *)v96;
      do
      {
        for (uint64_t i = 0; i != v20; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v96 != v21) {
            objc_enumerationMutation(v19);
          }
          unint64_t v23 = *(void **)(*((void *)&v95 + 1) + 8 * i);
          id v24 = [v23 displayName];

          if (v24)
          {
            id v25 = [v23 displayName];
            uint64_t v26 = [v81 objectForKey:v25];

            if (v26)
            {
              id v27 = objc_msgSend(objc_alloc((Class)NSDecimalNumber), "initWithInteger:", (char *)objc_msgSend(v26, "integerValue") + 1);
            }
            else
            {
              id v27 = +[NSDecimalNumber one];
            }
            id v31 = [v23 displayName];
            [v81 setObject:v27 forKey:v31];
          }
          else
          {
            uint64_t v28 = [v23 peerPaymentCounterpartHandle];

            if (!v28) {
              goto LABEL_33;
            }
            id v29 = [v23 peerPaymentCounterpartHandle];
            v30 = [v79 objectForKey:v29];

            if (v30)
            {
              id v27 = objc_msgSend(objc_alloc((Class)NSDecimalNumber), "initWithInteger:", (char *)objc_msgSend(v30, "integerValue") + 1);
            }
            else
            {
              id v27 = +[NSDecimalNumber one];
            }
            id v31 = [v23 peerPaymentCounterpartHandle];
            [v79 setObject:v27 forKey:v31];
          }

LABEL_33:
          id v32 = [v23 merchantDetailedCategory];

          if (v32)
          {
            id v33 = +[NSDecimalNumber one];
            unint64_t v34 = [v23 merchantDetailedCategory];
            [v80 setOrAddToDecimalValue:v33 forKey:v34];
          }
          if (_os_feature_enabled_impl())
          {
            unint64_t v35 = [v23 merchantDetailedCategory];
            if (v35)
            {
              unint64_t v36 = [v23 merchantDetailedCategory];
              if ([v36 isEqual:@"undefined"])
              {
              }
              else
              {
                double v37 = [v23 merchantDetailedCategory];
                unsigned __int8 v38 = [v37 isEqual:&stru_100031E08];

                if ((v38 & 1) == 0) {
                  [(FinHealthStateController *)self countMerchantDetailedCategoryRecordsWithDictionary:v77 fHTransaction:v23];
                }
              }
            }
          }
        }
        id v20 = [v19 countByEnumeratingWithState:&v95 objects:v99 count:16];
      }
      while (v20);
LABEL_43:

      unint64_t v39 = FinHealthLogObject();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v101 = v76;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "Batch offSet: %lu", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      v85[0] = _NSConcreteStackBlock;
      v85[1] = 3221225472;
      v85[2] = sub_100006234;
      v85[3] = &unk_100031498;
      objc_copyWeak(&v93, (id *)buf);
      double v40 = v69;
      v86 = v40;
      id v17 = v19;
      id v87 = v17;
      BOOL v94 = bypassMapService;
      id v41 = v68;
      id v88 = v41;
      v89 = self;
      v42 = v72;
      v90 = v42;
      id v43 = v67;
      id v91 = v43;
      id v92 = v71;
      [(FinHealthRealtimeFeaturesRequest *)v42 evaluateEventTagging:v17 bypassMapService:bypassMapService completion:v85];

      objc_destroyWeak(&v93);
      objc_destroyWeak((id *)buf);
      if (v17)
      {
        v76 += v74;
        if ([v17 count]) {
          continue;
        }
      }
      self->_BOOL bypassMapService = bypassMapService;
      double v44 = FinHealthLogObject();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "Resetting fhGeoFeatures records processed counter", buf, 2u);
      }

      [(FinHealthGeoFeatures *)v40 resetTotalRecordsProcessed];
      break;
    }
  }
  v45 = objc_opt_new();
  p_lockAggregationComputation = &self->_lockAggregationComputation;
  os_unfair_lock_lock(&self->_lockAggregationComputation);
  v47 = +[NSNumber numberWithBool:[(FHDatabaseManager *)self->_dbMgr computeMerchantAggregateFeatures]];
  [v45 addObject:v47];

  os_unfair_lock_unlock(&self->_lockAggregationComputation);
  os_unfair_lock_lock(&self->_lockAggregationComputation);
  id v48 = +[NSNumber numberWithBool:[(FHDatabaseManager *)self->_dbMgr computeAmountAggregateFeatures]];
  [v45 addObject:v48];

  os_unfair_lock_unlock(&self->_lockAggregationComputation);
  os_unfair_lock_lock(&self->_lockAggregationComputation);
  v49 = +[NSNumber numberWithBool:[(FHDatabaseManager *)self->_dbMgr computeDatetimeAggregateFeatures]];
  [v45 addObject:v49];

  os_unfair_lock_unlock(&self->_lockAggregationComputation);
  os_unfair_lock_lock(&self->_lockAggregationComputation);
  [(FHDatabaseManager *)self->_dbMgr computeRecurringClassesWithMerchantCounts:v81 peerPaymentCounts:v79 merchantDetailedCategoryCounts:v80];
  os_unfair_lock_unlock(&self->_lockAggregationComputation);
  os_unfair_lock_lock(&self->_lockAggregationComputation);
  uint64_t v50 = [v71 allObjects];
  [(FinHealthStateController *)self _excludeRecurringFromEventTaggingCandidates:v50];

  os_unfair_lock_unlock(&self->_lockAggregationComputation);
  os_unfair_lock_lock(&self->_lockAggregationComputation);
  [(FinHealthStateController *)self _tagFlightTransactionsWithTripEvents:v72];
  os_unfair_lock_unlock(&self->_lockAggregationComputation);
  +[NSNumber numberWithBool:1];
  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472;
  v82[2] = sub_100006B44;
  v82[3] = &unk_1000314C0;
  id v51 = (id)objc_claimAutoreleasedReturnValue();
  id v83 = v51;
  v84 = self;
  [v45 enumerateObjectsUsingBlock:v82];
  os_unfair_lock_lock(&self->_lockAggregationComputation);
  [(FHDatabaseManager *)self->_dbMgr predictAndPersistCashCardRecurringTransactions];
  os_unfair_lock_unlock(&self->_lockAggregationComputation);
  os_unfair_lock_lock(&self->_lockAggregationComputation);
  [(FHDatabaseManager *)self->_dbMgr publishEventsToBiome];
  os_unfair_lock_unlock(&self->_lockAggregationComputation);
  os_unfair_lock_lock(&self->_lockAggregationComputation);
  [(FHDatabaseManager *)self->_dbMgr computePaymentFeatures];
  os_unfair_lock_unlock(&self->_lockAggregationComputation);
  os_unfair_lock_lock(&self->_lockAggregationComputation);
  [(FHDatabaseManager *)self->_dbMgr computeAndPersistDisputeFeaturesForPendingTransactions];
  os_unfair_lock_unlock(&self->_lockAggregationComputation);
  if (_os_feature_enabled_impl())
  {
    os_unfair_lock_lock(p_lockAggregationComputation);
    uint64_t v52 = FinHealthLogObject();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEBUG, "Started computing trends..", buf, 2u);
    }

    id v53 = objc_alloc((Class)FHInsightsSpendingTrends);
    id v54 = [v81 copy];
    id v55 = [v53 initWithMerchantCounts:v54];

    [v55 trendsWithCompletion:&stru_100031500];
    os_unfair_lock_unlock(p_lockAggregationComputation);
  }
  if (_os_feature_enabled_impl())
  {
    [(FinHealthStateController *)self deleteAllDetailedCategoryRecords];
    os_unfair_lock_lock(p_lockAggregationComputation);
    [(FinHealthStateController *)self countRecurringMerchantDetailedCategoryRecords:v66];
    os_unfair_lock_unlock(p_lockAggregationComputation);
    os_unfair_lock_lock(p_lockAggregationComputation);
    id v56 = [v77 copy];
    id v57 = [v66 copy];
    [(FinHealthStateController *)self computeAndPersistDetailedCategoryRecords:v56 withRecurringCounts:v57];

    os_unfair_lock_unlock(p_lockAggregationComputation);
  }
  uint64_t v58 = FinHealthLogObject();
  uint64_t v59 = FinHealthLogObject();
  os_signpost_id_t v60 = os_signpost_id_make_with_pointer(v59, self);

  if (v60 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v58))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v58, OS_SIGNPOST_INTERVAL_END, v60, "processAggregateFeatures", "", buf, 2u);
  }

  id v61 = FinHealthLogObject();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_INFO, "END \"processAggregateFeatures\"", buf, 2u);
  }

  uint64_t v62 = +[NSArray arrayWithArray:v45];

  return v62;
}

- (void)syncBankConnectTransactionsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = FinHealthLogObject();
  os_signpost_id_t v6 = FinHealthLogObject();
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, self);

  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "bankconnect:sync", "", (uint8_t *)buf, 2u);
  }

  uint64_t v8 = FinHealthLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "BEGIN \"bankconnect:sync\"", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  bankConnectController = self->_bankConnectController;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100006DC0;
  v11[3] = &unk_100031528;
  objc_copyWeak(&v13, buf);
  id v10 = v4;
  id v12 = v10;
  [(FinHealthBankConnectController *)bankConnectController updateTransactionsWithCompletion:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(buf);
}

- (void)updateModelProcessingIdentifier:(id)a3 withIdentifier:(id)a4
{
  dbMgr = self->_dbMgr;
  id v6 = a4;
  id v7 = a3;
  id v10 = [v7 modelName];
  uint64_t v8 = [v7 modelVersion];

  id v9 = +[NSString stringWithFormat:@"%@:%@", v10, v8];
  [(FHDatabaseManager *)dbMgr updateProcessingTimeForFeature:v9 data:v6];
}

- (id)_checkEventDeletion
{
  BOOL v3 = [(FHDatabaseManager *)self->_dbMgr getTaggedPastCalendarEvents];
  id v4 = objc_opt_new();
  id v54 = objc_opt_new();
  id v53 = objc_opt_new();
  if ([v3 count])
  {
    uint64_t v50 = v4;
    uint64_t v5 = FHFeatureEventDateRangeKey;
    id v6 = +[NSString stringWithFormat:@"@distinctUnionOfObjects.%@", FHFeatureEventDateRangeKey];
    id v7 = [v3 valueForKeyPath:v6];
    uint64_t v52 = +[NSMutableArray arrayWithArray:v7];

    id v8 = [objc_alloc((Class)EKEventStore) initWithEKOptions:128];
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v51 = v3;
    id obj = v3;
    id v9 = [obj countByEnumeratingWithState:&v64 objects:v77 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v65;
      uint64_t v12 = FHFeatureEventIdKey;
      do
      {
        for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v65 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          CFStringRef v15 = [v14 valueForKey:v5];
          id v16 = [v14 valueForKey:v12];
          id v17 = [v8 eventWithIdentifier:v16];

          if (!v17)
          {
            [v53 addObject:v16];
            [v52 removeObject:v15];
            [v54 addObject:v15];
          }
        }
        id v10 = [obj countByEnumeratingWithState:&v64 objects:v77 count:16];
      }
      while (v10);
    }

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v18 = v54;
    id v19 = [v18 countByEnumeratingWithState:&v60 objects:v76 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v61;
      uint64_t v22 = FHComparisonOperatorEquals;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v61 != v21) {
            objc_enumerationMutation(v18);
          }
          id v24 = *(void **)(*((void *)&v60 + 1) + 8 * (void)j);
          dbMgr = self->_dbMgr;
          uint64_t v26 = [v24 firstObject];
          id v27 = [v24 lastObject];
          [(FHDatabaseManager *)dbMgr deleteTaggedEventsInTimeRange:v22 startDate:v26 comparatorOfEndDate:v22 endDate:v27];
        }
        id v20 = [v18 countByEnumeratingWithState:&v60 objects:v76 count:16];
      }
      while (v20);
    }

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v28 = v52;
    id v29 = [v28 countByEnumeratingWithState:&v56 objects:v75 count:16];
    id v4 = v50;
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v57;
      do
      {
        for (k = 0; k != v30; k = (char *)k + 1)
        {
          if (*(void *)v57 != v31) {
            objc_enumerationMutation(v28);
          }
          id v33 = *(void **)(*((void *)&v56 + 1) + 8 * (void)k);
          unint64_t v34 = self->_dbMgr;
          unint64_t v35 = [v33 firstObject];
          unint64_t v36 = [v33 lastObject];
          double v37 = [(FHDatabaseManager *)v34 getTransactionIdsInTimeRangeFrom:v35 to:v36];
          [v50 addObjectsFromArray:v37];
        }
        id v30 = [v28 countByEnumeratingWithState:&v56 objects:v75 count:16];
      }
      while (v30);
    }

    unsigned __int8 v38 = FinHealthLogObject();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v70 = obj;
      __int16 v71 = 2112;
      id v72 = v28;
      __int16 v73 = 2112;
      uint64_t v74 = v50;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "taggedPastEvents %@, dateRanges :%@, transactionIdsWithValidPastEvents %@", buf, 0x20u);
    }

    BOOL v3 = v51;
  }
  unint64_t v39 = self->_dbMgr;
  uint64_t v40 = FHComparisonOperatorGreaterThanOrEquals;
  id v41 = +[NSDate now];
  v42 = [v41 dateByAddingTimeInterval:-secondsInOneYear];
  uint64_t v43 = FHComparisonOperatorLessThanOrEquals;
  double v44 = +[NSDate now];
  [(FHDatabaseManager *)v39 deleteTaggedEventsInTimeRange:v40 startDate:v42 comparatorOfEndDate:v43 endDate:v44];

  v45 = [v4 allObjects];
  v68[0] = v45;
  v46 = [v54 allObjects];
  v68[1] = v46;
  v47 = [v53 allObjects];
  v68[2] = v47;
  id v48 = +[NSArray arrayWithObjects:v68 count:3];

  return v48;
}

- (void)_tagFlightTransactionsWithTripEvents:(id)a3
{
  id v54 = a3;
  id v4 = [v54 getEvents];
  id v33 = +[NSPredicate predicateWithFormat:@"self isKindOfClass: %@", objc_opt_class()];
  unint64_t v34 = objc_msgSend(v4, "filteredArrayUsingPredicate:");
  if ([v34 count])
  {
    long long v57 = [(FHDatabaseManager *)self->_dbMgr getTransactionsByDetailedCategory:merchantDetailedCategoryAirline];
    if ([v57 count])
    {
      id v32 = v4;
      id v46 = [objc_alloc((Class)EKEventStore) initWithEKOptions:128];
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id obj = v34;
      id v37 = [obj countByEnumeratingWithState:&v72 objects:v79 count:16];
      if (v37)
      {
        uint64_t v36 = *(void *)v73;
        uint64_t v45 = eventMetadataKey;
        uint64_t v44 = eventMetadataSchemaOrgKey;
        uint64_t v55 = FHSmartFeatureCompoundTypeTripEvents;
        long long v56 = self;
        do
        {
          uint64_t v5 = 0;
          do
          {
            if (*(void *)v73 != v36) {
              objc_enumerationMutation(obj);
            }
            uint64_t v38 = v5;
            id v6 = *(void **)(*((void *)&v72 + 1) + 8 * v5);
            long long v68 = 0u;
            long long v69 = 0u;
            long long v70 = 0u;
            long long v71 = 0u;
            id v53 = v6;
            id v41 = [v6 tripParts];
            id v7 = [v41 countByEnumeratingWithState:&v68 objects:v78 count:16];
            if (v7)
            {
              id v8 = v7;
              uint64_t v9 = *(void *)v69;
              uint64_t v39 = *(void *)v69;
              do
              {
                id v10 = 0;
                id v40 = v8;
                do
                {
                  if (*(void *)v69 != v9) {
                    objc_enumerationMutation(v41);
                  }
                  uint64_t v11 = *(void **)(*((void *)&v68 + 1) + 8 * (void)v10);
                  if ([v11 tripMode] == (id)1)
                  {
                    v42 = v10;
                    long long v66 = 0u;
                    long long v67 = 0u;
                    long long v64 = 0u;
                    long long v65 = 0u;
                    id v43 = [v11 eventIdentifiers];
                    id v48 = [v43 countByEnumeratingWithState:&v64 objects:v77 count:16];
                    if (v48)
                    {
                      uint64_t v47 = *(void *)v65;
                      do
                      {
                        uint64_t v12 = 0;
                        do
                        {
                          if (*(void *)v65 != v47) {
                            objc_enumerationMutation(v43);
                          }
                          uint64_t v51 = v12;
                          uint64_t v50 = [v46 eventWithIdentifier:*(void *)(*((void *)&v64 + 1) + 8 * v12)];
                          id v13 = [v50 customObjectForKey:v45];
                          long long v60 = 0u;
                          long long v61 = 0u;
                          long long v62 = 0u;
                          long long v63 = 0u;
                          v49 = v13;
                          id v52 = [v13 valueForKey:v44];
                          id v59 = [v52 countByEnumeratingWithState:&v60 objects:v76 count:16];
                          if (v59)
                          {
                            uint64_t v58 = *(void *)v61;
                            do
                            {
                              for (uint64_t i = 0; i != v59; uint64_t i = (char *)i + 1)
                              {
                                if (*(void *)v61 != v58) {
                                  objc_enumerationMutation(v52);
                                }
                                CFStringRef v15 = [*(id *)(*((void *)&v60 + 1) + 8 * i) objectForKeyedSubscript:@"reservationFor"];
                                id v16 = [v15 objectForKeyedSubscript:@"airline"];
                                id v17 = [v16 objectForKeyedSubscript:@"name"];

                                id v18 = +[NSPredicate predicateWithFormat:@"displayName CONTAINS[c] %@", v17];
                                id v19 = [v57 filteredArrayUsingPredicate:v18];
                                if ([v19 count])
                                {
                                  id v20 = objc_alloc((Class)FHSmartCompoundFeatureRankedValue);
                                  uint64_t v21 = [v54 tripEventTitleNomalization:v53];
                                  id v22 = [objc_alloc((Class)NSDecimalNumber) initWithInteger:300];
                                  id v23 = [v20 initWithLabelAndRank:v21 featureRank:v22];

                                  id v24 = [v19 firstObject];
                                  id v25 = [v24 identifier];

                                  id v26 = objc_alloc_init((Class)FHRealtimeFeaturesResponse);
                                  id v27 = [(FinHealthStateController *)self compoundFeaturesForTransaction:v25];
                                  id v28 = +[NSMutableDictionary dictionaryWithDictionary:v27];

                                  id v29 = [v28 valueForKey:v55];
                                  id v30 = +[NSMutableArray arrayWithArray:v29];

                                  if (([v30 containsObject:v23] & 1) == 0)
                                  {
                                    [v30 addObject:v23];
                                    uint64_t v31 = +[NSArray arrayWithArray:v30];
                                    [v28 setObject:v31 forKey:v55];

                                    [v26 setSmartCompoundFeatures:v28];
                                    [(FHDatabaseManager *)v56->_dbMgr insertFeaturesCompoundRealtime:v25 realtimeFeatures:v26];
                                  }

                                  self = v56;
                                }
                              }
                              id v59 = [v52 countByEnumeratingWithState:&v60 objects:v76 count:16];
                            }
                            while (v59);
                          }

                          uint64_t v12 = v51 + 1;
                        }
                        while ((id)(v51 + 1) != v48);
                        id v48 = [v43 countByEnumeratingWithState:&v64 objects:v77 count:16];
                      }
                      while (v48);
                    }

                    uint64_t v9 = v39;
                    id v8 = v40;
                    id v10 = v42;
                  }
                  id v10 = (char *)v10 + 1;
                }
                while (v10 != v8);
                id v8 = [v41 countByEnumeratingWithState:&v68 objects:v78 count:16];
              }
              while (v8);
            }

            uint64_t v5 = v38 + 1;
          }
          while ((id)(v38 + 1) != v37);
          id v37 = [obj countByEnumeratingWithState:&v72 objects:v79 count:16];
        }
        while (v37);
      }

      id v4 = v32;
    }
  }
}

- (void)_excludeRecurringFromEventTaggingCandidates:(id)a3
{
  id v4 = +[NSMutableSet setWithArray:a3];
  uint64_t v5 = [(FHDatabaseManager *)self->_dbMgr getRecurringTransactionIdentifiers];
  id v6 = +[NSSet setWithArray:v5];
  [v4 intersectSet:v6];

  id v17 = v4;
  [v4 allObjects];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    uint64_t v10 = FHSmartFeatureCompoundTypeEventTagging;
    uint64_t v11 = FHSmartFeatureCompoundTypeTripEvents;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v12);
        id v14 = objc_alloc_init((Class)FHRealtimeFeaturesResponse);
        CFStringRef v15 = [(FinHealthStateController *)self compoundFeaturesForTransaction:v13];
        id v16 = +[NSMutableDictionary dictionaryWithDictionary:v15];

        [v16 removeObjectForKey:v10];
        [v16 removeObjectForKey:v11];
        [v14 setSmartCompoundFeatures:v16];
        [(FHDatabaseManager *)self->_dbMgr insertFeaturesCompoundRealtime:v13 realtimeFeatures:v14];

        uint64_t v12 = (char *)v12 + 1;
      }
      while (v8 != v12);
      id v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }
}

- (id)getFHMerchantSmartFeatureByType:(id)a3
{
  return [(FHDatabaseManager *)self->_dbMgr getFHSmartFeatureByMerchantType:a3];
}

- (id)getFHAmountSmartFeatureByType:(id)a3
{
  return [(FHDatabaseManager *)self->_dbMgr getFHSmartFeatureByAmountType:a3];
}

- (id)getFHDateTimeSmartFeatureByType:(id)a3
{
  return [(FHDatabaseManager *)self->_dbMgr getFHSmartFeatureByDateTimeType:a3];
}

- (void)deleteAllDataForPasses:(id)a3 force:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void (**)(id, uint64_t, void))a5;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 1;
  uint64_t v10 = objc_opt_new();
  uint64_t v11 = v10;
  if (v9)
  {
    id v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    id v16 = sub_10000804C;
    id v17 = &unk_100031578;
    BOOL v21 = a4;
    id v18 = self;
    long long v20 = &v22;
    id v12 = v10;
    id v19 = v12;
    [v8 enumerateObjectsUsingBlock:&v14];
    -[FinHealthStateController removeAllEntriesFromTable:](self, "removeAllEntriesFromTable:", FHFeaturesEventsTableName, v14, v15, v16, v17, v18);
    [(FinHealthStateController *)self removeAllEntriesFromTable:FHMerchantAggregateFeaturesTableName];
    [(FinHealthStateController *)self removeAllEntriesFromTable:FHDetailedCategoryAggregateFeaturesTableName];
    [(FinHealthStateController *)self removeAllEntriesFromTable:FHAmountAggregateFeaturesTableName];
    [(FinHealthStateController *)self removeAllEntriesFromTable:FHDateTimeAggregateFeaturesTableName];
    [(FinHealthStateController *)self removeAllEntriesFromTable:FHFeaturesInstrumentationTableName];
    [(FHDatabaseManager *)self->_dbMgr clearCardProcessingHistory];
    if (*((unsigned char *)v23 + 24))
    {
      v9[2](v9, 1, 0);
    }
    else
    {
      uint64_t v13 = +[NSError errorWithDomain:FHErrorDomain code:10004 userInfo:v12];
      ((void (**)(id, uint64_t, void *))v9)[2](v9, 0, v13);
    }
  }

  _Block_object_dispose(&v22, 8);
}

- (void)deleteAllData:(id)a3
{
  id v4 = (void (**)(id, id, id))a3;
  if (v4)
  {
    uint64_t v5 = FHDataDirectory();
    id v6 = [v5 stringByAppendingString:FHRelativeInferredProductsFileName];

    id v7 = +[NSFileManager defaultManager];
    id v16 = 0;
    [v7 removeItemAtPath:v6 error:&v16];
    id v8 = v16;

    uint64_t v9 = FinHealthLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = [v8 localizedDescription];
      *(_DWORD *)buf = 138412546;
      id v18 = v6;
      __int16 v19 = 2112;
      long long v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "filePath: %@ delete error: %@", buf, 0x16u);
    }
    dbMgr = self->_dbMgr;
    id v15 = v8;
    id v12 = [(FHDatabaseManager *)dbMgr deleteDatabase:&v15];
    id v13 = v15;

    if (v12)
    {
      id v14 = self->_dbMgr;
      self->_dbMgr = 0;

      [(FinHealthStateController *)self _createDBManagerAndAssociatedProperties:0];
    }
    v4[2](v4, v12, v13);
  }
}

- (void)_deleteAllDataForPass:(id)a3 force:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v20 = a3;
  id v8 = (void (**)(id, void, void *))a5;
  if (v6) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = 1;
  }
  uint64_t v10 = objc_opt_new();
  if (v8)
  {
    while (![(FHDatabaseManager *)self->_dbMgr deleteAllFeatureRecordsForTransaction:v20])
    {
      id v16 = +[NSString stringWithFormat:@"features_deterministic_realtime for id %@", v20];
      [v10 addObject:v16];

      unsigned __int8 v17 = [(FHDatabaseManager *)self->_dbMgr deleteAllRecordsInTransactionFeatures:v20];
      CFStringRef v12 = @"transaction_features for id %@";
      if ((v17 & 1) == 0) {
        goto LABEL_12;
      }
LABEL_13:
      if (v9 == 1)
      {
        __int16 v19 = +[NSArray arrayWithArray:v10];
        v8[2](v8, 0, v19);
      }
      if (!--v9) {
        goto LABEL_16;
      }
    }
    unsigned __int8 v11 = [(FHDatabaseManager *)self->_dbMgr deleteAllRecordsInTransactionFeatures:v20];
    CFStringRef v12 = @"transaction_features for id %@";
    if (v11)
    {
      unsigned int v13 = [(FHDatabaseManager *)self->_dbMgr deleteAllRecordsInTransactions:v20];
      CFStringRef v12 = @"transactions for id %@";
      if (v13)
      {
        unsigned int v14 = [(FHDatabaseManager *)self->_dbMgr deleteAllRecordsInPeerPaymentFeatures:v20];
        CFStringRef v12 = @"transactions for id %@";
        if (v14)
        {
          unsigned __int8 v15 = [(FHDatabaseManager *)self->_dbMgr deleteAllRecordsInAccountInfoForTransactionSource:v20];
          CFStringRef v12 = @"transactions for id %@";
          if (v15)
          {
            v8[2](v8, 1, 0);
            goto LABEL_16;
          }
        }
      }
    }
LABEL_12:
    id v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v20);
    [v10 addObject:v18];

    goto LABEL_13;
  }
LABEL_16:
}

- (void)_transactionWithTransactionID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = FinHealthLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    unsigned int v14 = "-[FinHealthStateController _transactionWithTransactionID:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  uint64_t v9 = [(FinHealthStateController *)self _remoteObjectProxyWithErrorHandler];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100008670;
  v11[3] = &unk_1000315A0;
  id v12 = v6;
  id v10 = v6;
  [v9 transactionWithTransactionID:v7 completion:v11];
}

- (BOOL)updateGetAllStatus:(unint64_t)a3
{
  return [(FHDatabaseManager *)self->_dbMgr updateGetAllStatus:a3];
}

- (BOOL)shouldCallGetAllTransactions
{
  return [(FHDatabaseManager *)self->_dbMgr shouldCallGetAllTransactions];
}

- (id)getTransactionByIdentifier:(id)a3
{
  return [(FHDatabaseManager *)self->_dbMgr getTransactionByIdentifier:a3];
}

- (id)getTransactionByTransaction:(id)a3
{
  dbMgr = self->_dbMgr;
  id v4 = [a3 identifier];
  uint64_t v5 = [(FHDatabaseManager *)dbMgr getTransactionByIdentifier:v4];

  return v5;
}

- (id)transactionsInInternalStateDirty:(unint64_t)a3
{
  return [(FinHealthStateController *)self transactionsByInternalState:a3 internalState:1];
}

- (id)transactionsInInternalStateRawConsistent:(unint64_t)a3
{
  return [(FinHealthStateController *)self transactionsByInternalState:a3 internalState:2];
}

- (id)transactionsInInternalStateUpdatedRealtime:(unint64_t)a3
{
  return [(FinHealthStateController *)self transactionsByInternalState:a3 internalState:3];
}

- (id)transactionsInInternalStateUpdatedBatch:(unint64_t)a3
{
  return [(FinHealthStateController *)self transactionsByInternalState:a3 internalState:4];
}

- (id)transactionsInInternalStateConsistent:(unint64_t)a3
{
  return [(FinHealthStateController *)self transactionsByInternalState:a3 internalState:5];
}

- (id)transactionsInInternalStateInvalid:(unint64_t)a3
{
  return [(FinHealthStateController *)self transactionsByInternalState:a3 internalState:6];
}

- (id)transactionsByInternalState:(unint64_t)a3 internalState:(unint64_t)a4
{
  return [(FHDatabaseManager *)self->_dbMgr getTransactionsByInternalState:a3 internalState:a4];
}

- (BOOL)resetTransactionStateToStateRawConsistent:(id)a3
{
  return [(FHDatabaseManager *)self->_dbMgr updateTransactionInternalStateByIdentifier:a3 newInternalState:2];
}

- (id)transactionsInInternalAnyState:(unint64_t)a3 forPass:(id)a4
{
  id v6 = a4;
  id v7 = objc_opt_new();
  for (uint64_t i = 0; i != 7; ++i)
  {
    uint64_t v9 = [(FHDatabaseManager *)self->_dbMgr getTransactionsByInternalState:a3 internalState:i];
    [v7 addObjectsFromArray:v9];
  }
  id v10 = +[FHTransaction fhProperties];
  unsigned __int8 v11 = [v10 containsObject:@"transactionSourceIdentifier"];

  if (v11)
  {
    id v12 = +[NSPredicate predicateWithFormat:@"SELF.%K == %@", @"transactionSourceIdentifier", v6];
    unsigned int v13 = [v7 filteredArrayUsingPredicate:v12];
    id v14 = +[NSArray arrayWithArray:v13];
  }
  else
  {
    unsigned __int8 v15 = FinHealthLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v18 = @"transactionSourceIdentifier";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "predicateKey: %@ invalid", buf, 0xCu);
    }

    id v14 = v7;
  }

  return v14;
}

- (BOOL)invalidateTransactionByIdentifier:(id)a3
{
  return [(FHDatabaseManager *)self->_dbMgr updateTransactionInternalStateByIdentifier:a3 newInternalState:6];
}

- (BOOL)invalidateTransactionByTransaction:(id)a3
{
  dbMgr = self->_dbMgr;
  id v4 = [a3 identifier];
  LOBYTE(dbMgr) = [(FHDatabaseManager *)dbMgr updateTransactionInternalStateByIdentifier:v4 newInternalState:6];

  return (char)dbMgr;
}

- (BOOL)updateTransactionsInternalStateToState:(id)a3 oldInternalState:(unint64_t)a4 newInternalState:(unint64_t)a5
{
  return [(FHDatabaseManager *)self->_dbMgr updateTransactionsInternalStateToState:a3 oldInternalState:a4 newInternalState:a5];
}

- (void)transactionBatches:(unint64_t)a3 batch:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  dbMgr = self->_dbMgr;
  uint64_t v9 = sqlRowLimitUnlimited;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100008A70;
  v13[3] = &unk_1000315C8;
  id v15 = v6;
  unint64_t v16 = a3;
  id v14 = v7;
  id v10 = (void (**)(id, id))v6;
  id v11 = v7;
  [(FHDatabaseManager *)dbMgr streamTransactionsWithLimit:v9 internalState:2 onTransaction:v13];
  id v12 = [v11 copy];
  v10[2](v10, v12);
}

- (id)_clientConnection
{
  BOOL v3 = FinHealthLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315138;
    id v10 = "-[FinHealthStateController _clientConnection]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v9, 0xCu);
  }

  os_unfair_lock_lock(&self->_lockConnection);
  id v4 = [(FinHealthStateController *)self connection];

  uint64_t v5 = FinHealthLogObject();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6)
    {
      int v9 = 136315138;
      id v10 = "-[FinHealthStateController _clientConnection]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s, reusing _clientConnection", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    if (v6)
    {
      int v9 = 136315138;
      id v10 = "-[FinHealthStateController _clientConnection]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s, _clientConnection nil", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v5 = [(FinHealthStateController *)self _newClientConnection];
    [(FinHealthStateController *)self setConnection:v5];
  }

  os_unfair_lock_unlock(&self->_lockConnection);
  id v7 = [(FinHealthStateController *)self connection];
  return v7;
}

- (id)_newClientConnection
{
  BOOL v3 = FinHealthLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v15 = "-[FinHealthStateController _newClientConnection]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  id v4 = [objc_alloc((Class)NSXPCConnection) initWithServiceName:@"com.apple.FinHealth.FinHealthXPCServices"];
  uint64_t v5 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___FinHealthXPCServicesProtocol];
  [v4 setRemoteObjectInterface:v5];

  objc_initWeak((id *)buf, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100008EFC;
  v12[3] = &unk_1000315F0;
  objc_copyWeak(&v13, (id *)buf);
  [v4 setInvalidationHandler:v12];
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  int v9 = sub_100008FCC;
  id v10 = &unk_1000315F0;
  objc_copyWeak(&v11, (id *)buf);
  [v4 setInterruptionHandler:&v7];
  objc_msgSend(v4, "resume", v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
  return v4;
}

- (id)_remoteObjectProxyWithErrorHandler
{
  objc_initWeak(&location, self);
  BOOL v3 = [(FinHealthStateController *)self _clientConnection];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000919C;
  v6[3] = &unk_100031618;
  objc_copyWeak(&v7, &location);
  id v4 = [v3 remoteObjectProxyWithErrorHandler:v6];
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
  return v4;
}

- (void)removeAllEntriesFromTable:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)FHDatabaseEntity) initWithEntity:v3];
  unsigned int v5 = [v4 clearData];
  BOOL v6 = FinHealthLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v7 = @"Failed to perform";
    if (v5) {
      CFStringRef v7 = @"Successfully performed operation";
    }
    int v8 = 138412546;
    CFStringRef v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%@: delete all records on table: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (BOOL)updateDeleteFlagInTransactionFeatures:(unint64_t)a3 forID:(id)a4
{
  return [(FHDatabaseManager *)self->_dbMgr updateDeleteFlagInTransactionFeatures:a3 forID:a4];
}

- (BOOL)deleteAllMarkedTransactionFeatures
{
  return [(FHDatabaseManager *)self->_dbMgr deleteAllMarkedTransactionFeatures];
}

- (BOOL)deleteAllRecordsFromTransactionFeatures
{
  return [(FHDatabaseManager *)self->_dbMgr deleteAllRecordsFromTransactionFeatures];
}

- (id)getTransactionsSmartFeatures
{
  return [(FinHealthStateController *)self getTransactionSmartFeaturesForApplication:FHApplicationSearch];
}

- (id)getTransactionSmartFeaturesForApplication:(id)a3
{
  return [(FHDatabaseManager *)self->_dbMgr getTransactionSmartFeaturesForApplication:a3];
}

- (int64_t)mostRecentTransactionDate
{
  return (int64_t)[(FHDatabaseManager *)self->_dbMgr mostRecentTransactionDate];
}

- (id)compoundFeaturesForTransaction:(id)a3
{
  return [(FHDatabaseManager *)self->_dbMgr compoundFeaturesForTransaction:a3];
}

- (id)getMerchantForTransactionId:(id)a3
{
  id v3 = [(FHDatabaseManager *)self->_dbMgr getTransactionByIdentifier:a3];
  id v4 = [v3 displayName];

  return v4;
}

- (id)getCompundFeaturesOverTimRangeFrom:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  CFStringRef v9 = -[FHDatabaseManager getTransactionIdsInTimeRangeFrom:to:](self->_dbMgr, "getTransactionIdsInTimeRangeFrom:to:", v6, v7, 0);
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v15 = [(FHDatabaseManager *)self->_dbMgr compoundFeaturesForTransaction:v14];
        [v8 setObject:v15 forKey:v14];
      }
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)getLostSavingsValueFromCompoundFeatures:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3
    && (uint64_t v5 = FHSmartFeatureCompoundTypeLostSavings,
        [v3 objectForKeyedSubscript:FHSmartFeatureCompoundTypeLostSavings],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    id v7 = [v4 objectForKeyedSubscript:v5];
    id v8 = [v7 objectAtIndex:0];
    CFStringRef v9 = [v8 featureRank];
  }
  else
  {
    CFStringRef v9 = +[NSDecimalNumber zero];
  }

  return v9;
}

- (id)getLostSavingsOverTime:(id)a3 from:(id)a4 to:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_opt_new();
  id v30 = v10;
  uint64_t v31 = v9;
  uint64_t v12 = [(FinHealthStateController *)self getCompundFeaturesOverTimRangeFrom:v9 to:v10];
  id v13 = v12;
  if (v8)
  {
    long long v38 = 0uLL;
    long long v39 = 0uLL;
    long long v36 = 0uLL;
    long long v37 = 0uLL;
    id v14 = [v12 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v15; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v37 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          long long v19 = [(FinHealthStateController *)self getMerchantForTransactionId:v18];
          if ([v19 isEqualToString:v8])
          {
            long long v20 = [v13 objectForKeyedSubscript:v18];
            BOOL v21 = [(FinHealthStateController *)self getLostSavingsValueFromCompoundFeatures:v20];
            [v11 addObject:v21];
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v15);
    }
  }
  else
  {
    long long v34 = 0uLL;
    long long v35 = 0uLL;
    long long v32 = 0uLL;
    long long v33 = 0uLL;
    id v22 = [v12 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v33;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v33 != v24) {
            objc_enumerationMutation(v13);
          }
          id v26 = [v13 objectForKeyedSubscript:*(void *)(*((void *)&v32 + 1) + 8 * (void)j)];
          id v27 = [(FinHealthStateController *)self getLostSavingsValueFromCompoundFeatures:v26];
          [v11 addObject:v27];
        }
        id v23 = [v13 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v23);
    }
  }
  id v28 = +[NSArray arrayWithArray:v11];

  return v28;
}

- (id)getRecurringChangeForMessagingOverTimePeriod:(int64_t)a3
{
  id v3 = [(FinHealthStateController *)self _getRecurringChangeOverTimePeriod:a3];
  id v4 = objc_opt_new();
  id v5 = [v3 count];
  uint64_t v6 = messagingQueryKeyAmount;
  unint64_t v7 = messagingPriceIncreaseCount;
  if (v5)
  {
    unint64_t v8 = 0;
    double v9 = 0.0;
    double v10 = 0.0;
    do
    {
      id v11 = [v3 objectAtIndexedSubscript:v8];
      uint64_t v12 = [v11 objectForKey:v6];
      [v12 doubleValue];
      double v14 = v13;

      double v9 = v9 + v14;
      double v15 = -0.0;
      if (v7 > v8) {
        double v15 = v14;
      }
      double v10 = v10 + v15;
      ++v8;
    }
    while ((unint64_t)[v3 count] > v8);
  }
  else
  {
    double v10 = 0.0;
    double v9 = 0.0;
  }
  id v16 = [objc_alloc((Class)NSDecimalNumber) initWithDouble:v10];
  [v4 setObject:v16 forKey:messagingQueryKeySumForTopThree];

  id v17 = [objc_alloc((Class)NSDecimalNumber) initWithDouble:v9];
  [v4 setObject:v17 forKey:messagingQueryKeySumForAll];

  uint64_t v18 = messagingQueryKeyMerchant;
  long long v19 = +[NSDecimalNumber zero];
  long long v20 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", &stru_100031E08, v18, v19, v6, 0);

  BOOL v21 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", messagingQueryKeyMax, messagingQueryKeySecondMax, messagingQueryKeyThirdMax, 0);
  if (v7)
  {
    for (unint64_t i = 0; i != v7; ++i)
    {
      if ((unint64_t)[v3 count] <= i)
      {
        id v23 = [v21 objectAtIndexedSubscript:i];
        [v4 setObject:v20 forKey:v23];
      }
      else
      {
        id v23 = [v3 objectAtIndexedSubscript:i];
        uint64_t v24 = [v21 objectAtIndexedSubscript:i];
        [v4 setObject:v23 forKey:v24];
      }
    }
  }
  char v25 = +[NSDictionary dictionaryWithDictionary:v4];

  return v25;
}

- (id)_getRecurringChangeOverTimePeriod:(int64_t)a3
{
  long long v37 = objc_opt_new();
  id v5 = objc_opt_new();
  uint64_t v6 = +[NSDate now];
  id v7 = objc_alloc_init((Class)NSDateComponents);
  [v7 setDay:-a3];
  id v29 = +[NSCalendar currentCalendar];
  id v30 = v7;
  id v28 = [v29 dateByAddingComponents:v7 toDate:v6 options:0];
  uint64_t v31 = (void *)v6;
  unint64_t v8 = -[FinHealthStateController getCompundFeaturesOverTimRangeFrom:to:](self, "getCompundFeaturesOverTimRangeFrom:to:");
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v39;
    uint64_t v12 = FHSmartFeatureCompoundTypeRecurringChange;
    uint64_t v33 = messagingQueryKeyMerchant;
    uint64_t v32 = messagingQueryKeyAmount;
    long long v35 = v5;
    long long v36 = self;
    uint64_t v34 = FHSmartFeatureCompoundTypeRecurringChange;
    do
    {
      for (unint64_t i = 0; i != v10; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v39 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        double v15 = [(FinHealthStateController *)self getMerchantForTransactionId:v14];
        id v16 = [v8 objectForKey:v14];
        id v17 = [v16 objectForKey:v12];
        uint64_t v18 = v17;
        if (v17 && [v17 count] && (objc_msgSend(v5, "containsObject:", v15) & 1) == 0)
        {
          id v19 = v10;
          uint64_t v20 = v11;
          BOOL v21 = [v18 firstObject];
          [v21 featureRank];
          v23 = id v22 = v8;
          uint64_t v24 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v15, v33, v23, v32, 0);
          [v37 addObject:v24];

          uint64_t v11 = v20;
          id v10 = v19;
          uint64_t v12 = v34;

          unint64_t v8 = v22;
          id v5 = v35;
          self = v36;
          [v35 addObject:v15];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v10);
  }
  char v25 = [v37 sortedArrayUsingComparator:&stru_100031658];
  id v26 = FinHealthLogObject();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v43 = v25;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "priceIncrease rankedArray %@", buf, 0xCu);
  }

  return v25;
}

- (id)featuresWithAmountSums:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_opt_new();
  uint64_t v55 = v8;
  uint64_t v12 = [(FHDatabaseManager *)self->_dbMgr getTransactionSmartFeaturesForApplication:v8];
  id v54 = objc_opt_new();
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v13 = v12;
  uint64_t v58 = v13;
  id v59 = v10;
  id v63 = [v13 countByEnumeratingWithState:&v77 objects:v86 count:16];
  if (v63)
  {
    uint64_t v62 = *(void *)v78;
    long long v56 = self;
    id v57 = v9;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v78 != v62) {
          objc_enumerationMutation(v13);
        }
        uint64_t v64 = v14;
        double v15 = *(void **)(*((void *)&v77 + 1) + 8 * v14);
        dbMgr = self->_dbMgr;
        id v17 = [v15 transactionIdentifier];
        uint64_t v18 = [(FHDatabaseManager *)dbMgr getTransactionByIdentifier:v17];

        id v19 = [v18 transactionDate];
        [v10 timeIntervalSinceDate:v9];
        if (v20 >= 0.0)
        {
          [v19 timeIntervalSinceDate:v9];
          if (v21 >= 0.0)
          {
            [v10 timeIntervalSinceDate:v19];
            if (v22 > 0.0)
            {
              long long v60 = v15;
              long long v61 = v19;
              long long v75 = 0u;
              long long v76 = 0u;
              long long v73 = 0u;
              long long v74 = 0u;
              id v23 = [v15 aggregateFeatures];
              id v24 = [v23 countByEnumeratingWithState:&v73 objects:v85 count:16];
              if (v24)
              {
                id v25 = v24;
                uint64_t v26 = *(void *)v74;
                do
                {
                  for (unint64_t i = 0; i != v25; unint64_t i = (char *)i + 1)
                  {
                    if (*(void *)v74 != v26) {
                      objc_enumerationMutation(v23);
                    }
                    uint64_t v28 = *(void *)(*((void *)&v73 + 1) + 8 * i);
                    id v29 = [v11 objectForKey:v28];
                    id v30 = [v18 amount];
                    if (v29)
                    {
                      uint64_t v31 = [v29 decimalNumberByAdding:v30];

                      id v30 = (void *)v31;
                    }
                    [v11 setObject:v30 forKey:v28];
                  }
                  id v25 = [v23 countByEnumeratingWithState:&v73 objects:v85 count:16];
                }
                while (v25);
              }

              long long v71 = 0u;
              long long v72 = 0u;
              long long v69 = 0u;
              long long v70 = 0u;
              uint64_t v32 = [v60 compoundFeatures];
              id v33 = [v32 countByEnumeratingWithState:&v69 objects:v84 count:16];
              if (v33)
              {
                id v34 = v33;
                uint64_t v35 = *(void *)v70;
                do
                {
                  for (j = 0; j != v34; j = (char *)j + 1)
                  {
                    if (*(void *)v70 != v35) {
                      objc_enumerationMutation(v32);
                    }
                    long long v37 = *(void **)(*((void *)&v69 + 1) + 8 * (void)j);
                    long long v38 = [v37 compoundFeatureKey];
                    long long v39 = [v11 objectForKey:v38];

                    long long v40 = [v18 amount];
                    if (v39)
                    {
                      uint64_t v41 = [v39 decimalNumberByAdding:v40];

                      long long v40 = (void *)v41;
                    }
                    v42 = [v37 compoundFeatureKey];
                    [v11 setObject:v40 forKey:v42];
                  }
                  id v34 = [v32 countByEnumeratingWithState:&v69 objects:v84 count:16];
                }
                while (v34);
              }

              id v9 = v57;
              id v13 = v58;
              id v10 = v59;
              self = v56;
              id v19 = v61;
            }
          }
        }

        uint64_t v14 = v64 + 1;
      }
      while ((id)(v64 + 1) != v63);
      id v63 = [v13 countByEnumeratingWithState:&v77 objects:v86 count:16];
    }
    while (v63);
  }

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v43 = [v11 allKeys];
  id v44 = [v43 countByEnumeratingWithState:&v65 objects:v83 count:16];
  if (v44)
  {
    id v45 = v44;
    uint64_t v46 = *(void *)v66;
    do
    {
      for (k = 0; k != v45; k = (char *)k + 1)
      {
        if (*(void *)v66 != v46) {
          objc_enumerationMutation(v43);
        }
        uint64_t v48 = *(void *)(*((void *)&v65 + 1) + 8 * (void)k);
        v49 = [v11 objectForKey:v48];
        id v50 = [objc_alloc((Class)FHSmartCompoundFeatureRankedValue) initWithLabelAndRank:v48 featureRank:v49];
        [v54 addObject:v50];
      }
      id v45 = [v43 countByEnumeratingWithState:&v65 objects:v83 count:16];
    }
    while (v45);
  }

  uint64_t v51 = FinHealthLogObject();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v82 = v54;
    _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEBUG, "rankedValues: %@", buf, 0xCu);
  }

  id v52 = +[NSArray arrayWithArray:v54];

  return v52;
}

- (BOOL)insertInstrumentationRecord:(id)a3
{
  return [(FHDatabaseManager *)self->_dbMgr insertInstrumentationRecord:a3];
}

- (id)getAllPredictedPeerPaymentsAfterDate:(id)a3
{
  id v4 = +[NSPredicate predicateWithFormat:@"SELF.%K >= %@", FHPeerPaymentForecastingSignalDateKey, a3];
  id v5 = [(FHDatabaseManager *)self->_dbMgr getFilteredPeerPaymentForecastingSignals];
  uint64_t v6 = [v5 filteredArrayUsingPredicate:v4];
  id v7 = [v6 sortedArrayUsingComparator:&stru_100031698];

  return v7;
}

- (BOOL)recordPeerPaymentForecastingSuggestionStatus:(unint64_t)a3 counterpartHandle:(id)a4 amount:(id)a5
{
  return [(FHDatabaseManager *)self->_dbMgr recordPeerPaymentForecastingStatus:a3 counterpartHandle:a4 amount:a5];
}

- (BOOL)updatePeerPaymentAccountBalance:(id)a3 amount:(id)a4 currencyCode:(id)a5
{
  return [(FHDatabaseManager *)self->_dbMgr updatePeerPaymentAccountBalance:a3 amount:a4 currencyCode:a5];
}

- (BOOL)insertReceiptData:(id)a3 identifier:(id)a4 title:(id)a5 subtitle:(id)a6 quantity:(unint64_t)a7 amount:(id)a8 currencyCode:(id)a9 adamIdentifier:(unint64_t)a10
{
  return -[FHDatabaseManager insertReceiptData:identifier:title:subtitle:quantity:amount:currencyCode:adamIdentifier:](self->_dbMgr, "insertReceiptData:identifier:title:subtitle:quantity:amount:currencyCode:adamIdentifier:", a3, a4, a5, a6, a7, a8);
}

- (BOOL)suggestAutoReload
{
  id v3 = [(FHDatabaseManager *)self->_dbMgr getCurrentCashBalance];
  id v4 = +[NSDecimalNumber defaultDatabaseAmountMultiplier];
  id v5 = [v3 decimalNumberByDividingBy:v4];

  uint64_t v6 = +[NSDecimalNumber zero];
  id v7 = [v5 compare:v6];

  if (v7 == (id)-1)
  {
    BOOL v11 = 1;
  }
  else
  {
    id v8 = [(FHDatabaseManager *)self->_dbMgr getExpectedWeeklySpend];
    id v9 = [v5 decimalNumberByAdding:v8];
    id v10 = +[NSDecimalNumber zero];
    BOOL v11 = [v9 compare:v10] == (id)-1;
  }
  return v11;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (os_unfair_lock_s)lockConnection
{
  return self->_lockConnection;
}

- (void)setLockConnection:(os_unfair_lock_s)a3
{
  self->_lockConnection = a3;
}

- (os_unfair_lock_s)lockAggregationComputation
{
  return self->_lockAggregationComputation;
}

- (void)setLockAggregationComputation:(os_unfair_lock_s)a3
{
  self->_lockAggregationComputation = a3;
}

- (FinHealthBankConnectController)bankConnectController
{
  return self->_bankConnectController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bankConnectController, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_dbMgr, 0);
}

@end