@interface FHDatabaseManager
- (BOOL)_computeSingleAmountAggregateFeature:(id)a3;
- (BOOL)_computeSingleDatetimeAggregateFeature:(id)a3;
- (BOOL)_computeSingleMerchantAggregateFeature:(id)a3;
- (BOOL)_execute:(id)a3;
- (BOOL)_executeRaw:(id)a3;
- (BOOL)_hasDeterministicRealtime:(id)a3;
- (BOOL)_insertModelRecord:(id)a3;
- (BOOL)_insertOrUpdateTransactionFeatures:(id)a3 compoundFeatures:(id)a4 transactionID:(id)a5 financeTransactionID:(id)a6;
- (BOOL)_isDatabaseCorrupt;
- (BOOL)_isEligibleForSchemaMigration;
- (BOOL)_signalMatchesSendSuggestionCriteria:(int64_t)a3 periodicCategory:(unint64_t)a4;
- (BOOL)_truncateDatabase;
- (BOOL)_updateTransaction:(id)a3 withNewInternalState:(unint64_t)a4;
- (BOOL)computeAmountAggregateFeatures;
- (BOOL)computeDatetimeAggregateFeatures;
- (BOOL)computeMerchantAggregateFeatures;
- (BOOL)deleteAllFeatureRecordsForTransaction:(id)a3;
- (BOOL)deleteAllMarkedTransactionFeatures;
- (BOOL)deleteAllRecordsFromTransactionFeatures;
- (BOOL)deleteAllRecordsInAccountInfoForTransactionSource:(id)a3;
- (BOOL)deleteAllRecordsInPeerPaymentFeatures:(id)a3;
- (BOOL)deleteAllRecordsInTransactionFeatures:(id)a3;
- (BOOL)deleteAllRecordsInTransactions:(id)a3;
- (BOOL)deleteBankConnectTransactionWithFinanceTransactionIdentifier:(id)a3;
- (BOOL)deleteDatabase:(id *)a3;
- (BOOL)deleteTaggedButDeletedEvent:(id)a3;
- (BOOL)deleteTaggedEventsInTimeRange:(id)a3 startDate:(id)a4 comparatorOfEndDate:(id)a5 endDate:(id)a6;
- (BOOL)deleteTransactionWithIdentifier:(id)a3;
- (BOOL)deleteWithRollBack:(BOOL)a3 SQL:(id)a4 args:(char *)a5;
- (BOOL)deleteWithSQL:(id)a3;
- (BOOL)executeAsPreparedStatement:(id)a3 values:(id)a4;
- (BOOL)insertFeatures:(id)a3 realtimeFeatures:(id)a4;
- (BOOL)insertFeaturesCompoundRealtime:(id)a3 realtimeFeatures:(id)a4;
- (BOOL)insertFeaturesCompoundRealtimeWithoutEvents:(id)a3 realtimeFeatures:(id)a4;
- (BOOL)insertFeaturesDeterminiticRealtime:(id)a3 realtimeFeatures:(id)a4;
- (BOOL)insertFeaturesEvents:(id)a3;
- (BOOL)insertFeaturesGrouping:(id)a3 realtimeFeatures:(id)a4;
- (BOOL)insertFeaturesPredictedRealtime:(id)a3 realtimeFeatures:(id)a4;
- (BOOL)insertInstrumentationRecord:(id)a3;
- (BOOL)insertOrUpdateBankConnectAccount:(id)a3;
- (BOOL)insertReceiptData:(id)a3 identifier:(id)a4 title:(id)a5 subtitle:(id)a6 quantity:(unint64_t)a7 amount:(id)a8 currencyCode:(id)a9 adamIdentifier:(unint64_t)a10;
- (BOOL)insertTransactionInInternalStateDirty:(id)a3;
- (BOOL)recordPeerPaymentForecastingStatus:(unint64_t)a3 counterpartHandle:(id)a4 amount:(id)a5;
- (BOOL)removeFinanceTransactionIdentifier:(id)a3;
- (BOOL)shouldCallGetAllTransactions;
- (BOOL)updateDeleteFlagInTransactionFeatures:(unint64_t)a3 forID:(id)a4;
- (BOOL)updateFinanceTransactionIdentifier:(id)a3;
- (BOOL)updateGetAllStatus:(unint64_t)a3;
- (BOOL)updatePeerPaymentAccountBalance:(id)a3 amount:(id)a4 currencyCode:(id)a5;
- (BOOL)updateTransactionInternalStateByIdentifier:(id)a3 newInternalState:(unint64_t)a4;
- (BOOL)updateTransactionWholeRaw:(id)a3;
- (BOOL)updateTransactionsInternalStateToState:(id)a3 oldInternalState:(unint64_t)a4 newInternalState:(unint64_t)a5;
- (FHFetchAllTransactionsDelegate)delegate;
- (id)_computeDisputeFeaturesForTransaction:(id)a3;
- (id)_computePaymentFeaturesForTransaction:(id)a3;
- (id)_createFeatureResponseFromFeatures:(id)a3 compoundFeatures:(id)a4 locale:(id)a5 forTxnID:(id)a6;
- (id)_createFeatureResponseFromFeatures:(id)a3 compoundFeatures:(id)a4 locale:(id)a5 forTxnID:(id)a6 forApplication:(id)a7;
- (id)_fetch:(id)a3;
- (id)_fetchv:(id)a3 args:(char *)a4;
- (id)_filterAggregateFeatureByCurrentWindow:(id)a3;
- (id)_filterPeriodicCategories:(id)a3;
- (id)_getAllTransactions:(unint64_t)a3 limit:(unint64_t)a4;
- (id)_getDisputeFeaturesForTransaction:(id)a3;
- (id)_getTransactionByIdentifier:(id)a3;
- (id)_getTransactionsMarkedForRecurrChange;
- (id)_lockFreeFetch:(id)a3;
- (id)compoundFeaturesForTransaction:(id)a3;
- (id)featuresForTransaction:(id)a3;
- (id)getAllPeerPaymentSignalsFilterDismissed:(BOOL)a3;
- (id)getCurrentCashBalance;
- (id)getDatabaseFileName;
- (id)getDateFormatter;
- (id)getExpectedWeeklySpend;
- (id)getFHAccounts;
- (id)getFHSmartFeatureByAmountType:(id)a3;
- (id)getFHSmartFeatureByDateTimeType:(id)a3;
- (id)getFHSmartFeatureByMerchantType:(id)a3;
- (id)getFeaturePredicate:(id)a3 FHSmartFeatureAggregateType:(id)a4;
- (id)getFilteredPeerPaymentForecastingSignals;
- (id)getRecurringTransactionIdentifiers;
- (id)getRecurringTransactionIdentifiersByClass:(unint64_t)a3;
- (id)getTaggedPastCalendarEvents;
- (id)getTransactionByFinanceTransactionIdentifier:(id)a3;
- (id)getTransactionIdsInTimeRangeFrom:(id)a3 to:(id)a4;
- (id)getTransactionSmartFeaturesForApplication:(id)a3;
- (id)getTransactionsByDetailedCategory:(id)a3;
- (id)getTransactionsByInternalState:(unint64_t)a3 internalState:(unint64_t)a4;
- (id)getTransactionsByInternalState:(unint64_t)a3 internalState:(unint64_t)a4 offSet:(unint64_t)a5;
- (id)getTransactionsByInternalState:(unint64_t)a3 internalState:(unint64_t)a4 offSet:(unint64_t)a5 addCompoundFeatures:(BOOL)a6;
- (id)init:(BOOL)a3;
- (id)init:(BOOL)a3 multiThreadingEnabled:(BOOL)a4;
- (id)processingDataForFeature:(id)a3;
- (id)reconstructTransaction:(id)a3;
- (id)retrieveGroups;
- (int)streamTransactionsWithLimit:(unint64_t)a3 internalState:(unint64_t)a4 offSet:(unint64_t)a5 onTransaction:(id)a6;
- (int)streamTransactionsWithLimit:(unint64_t)a3 internalState:(unint64_t)a4 onTransaction:(id)a5;
- (int64_t)_mostRecentTransactionDate;
- (int64_t)_startingDateSmartFeatureComputation;
- (unint64_t)getTransactionInternalState:(id)a3;
- (unint64_t)processingTimeForFeature:(id)a3;
- (unint64_t)streamGenericSQLFetch:(id)a3 predicate:(id)a4 sqlFetchQuery:(id)a5;
- (unint64_t)streamQueryResults:(id)a3 usingFetchHandler:(id)a4;
- (void)_checkUniqueConstraints:(id)a3 uniqueConstraintSet:(id)a4;
- (void)_computeAllAggregateFeaturesWithTransactionId:(id)a3;
- (void)_createDataDirectory;
- (void)_instrumentationTableMigration;
- (void)_invertFeaturesForTransactions:(id)a3;
- (void)_logSchema:(id)a3;
- (void)_rebuildTablesAndIndexes:(BOOL)a3;
- (void)_updateAggregateTablesSchema;
- (void)_updateProcessingTimeForFeature:(id)a3 processingDate:(unint64_t)a4;
- (void)_updateProcessingTimeForFeature:(id)a3 processingDate:(unint64_t)a4 data:(id)a5;
- (void)clearCardProcessingHistory;
- (void)closeAndUnlock:(id)a3;
- (void)computeAllAggregateFeatures;
- (void)computeAndPersistDisputeFeaturesForPendingTransactions;
- (void)computeAndPersistTransactionGroupings;
- (void)computePaymentFeatures;
- (void)computeRecurringClassesWithMerchantCounts:(id)a3 peerPaymentCounts:(id)a4 merchantDetailedCategoryCounts:(id)a5;
- (void)populateMerchantRecurringClassHistograms:(id)a3 transaction:(id)a4;
- (void)populateRecurringClassHistogramsWithMerchantDetailedCategoryCounts:(id)a3 histogram:(id)a4 transaction:(id)a5;
- (void)populateRecurringClassHistogramsWithPeerPaymentsCounts:(id)a3 histogram:(id)a4 transaction:(id)a5;
- (void)predictAndPersistCashCardRecurringTransactions;
- (void)publishEventsToBiome;
- (void)retrieveAll;
- (void)setDelegate:(id)a3;
- (void)updateProcessingTimeForFeature:(id)a3;
- (void)updateProcessingTimeForFeature:(id)a3 data:(id)a4;
@end

@implementation FHDatabaseManager

- (void)_createDataDirectory
{
  v3 = [MEMORY[0x263F08850] defaultManager];
  v4 = [(FHDatabaseManager *)self _getDataDirectory];
  uint64_t v5 = 0;
  [v3 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v5];
}

- (id)getDateFormatter
{
  return self->_dateFormatter;
}

- (id)getDatabaseFileName
{
  return @"finhealth.db";
}

- (BOOL)_isEligibleForSchemaMigration
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  -[FHDatabaseManager _fetch:](self, "_fetch:", @"select sch_version_id, sch_upgrade_status from fh_schema order by sch_id desc limit %d;",
  v3 = 1);
  v4 = [MEMORY[0x263F087B0] decimalNumberWithString:@"10.72"];
  uint64_t v5 = [MEMORY[0x263F087B0] decimalNumberWithString:@"0.0"];
  if ([v3 next])
  {
    v6 = (void *)MEMORY[0x263F087B0];
    v7 = [v3 stringAtIndex:0];
    uint64_t v8 = [v6 decimalNumberWithString:v7];

    uint64_t v9 = [v3 unsignedIntegerAtIndex:1];
    uint64_t v5 = (void *)v8;
  }
  else
  {
    uint64_t v9 = 0;
  }
  v10 = [MEMORY[0x263F087B0] decimalNumberWithString:@"0.0"];
  int v11 = [v5 isEqual:v10];

  if (v11)
  {
    v12 = [MEMORY[0x263EFF910] now];
    [v12 timeIntervalSinceReferenceDate];
    uint64_t v14 = (int)v13;

    BOOL v15 = [(FHDatabaseManager *)self _execute:@"insert into fh_schema (sch_version_id, sch_upgrade_status, sch_date, sch_getall_status) values (%@, %d, %d, %d)", @"10.72", 2, v14, 0];
    v16 = FinHealthLogObject(@"FinHealthCore");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = @"Fail";
      if (v15) {
        v17 = @"Success";
      }
      *(_DWORD *)buf = 138412290;
      v22 = v17;
      _os_log_impl(&dword_24E029000, v16, OS_LOG_TYPE_DEBUG, "createSchemaVersionRecord: %@", buf, 0xCu);
    }
  }
  [(FHDatabaseManager *)self closeAndUnlock:v3];
  int v18 = [v5 isEqual:v4] ^ 1;
  if (v9 == 2) {
    BOOL v19 = v18;
  }
  else {
    BOOL v19 = 1;
  }

  return v19;
}

- (void)_logSchema:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  -[FHDatabaseManager _fetch:](self, "_fetch:", @"select sql from sqlite_master where type='table' and name=%@;",
  v4 = a3);
  if ([v4 next])
  {
    uint64_t v5 = FinHealthLogObject(@"FinHealthCore");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = [v4 stringAtIndex:0];
      *(_DWORD *)buf = 138412290;
      uint64_t v8 = v6;
      _os_log_impl(&dword_24E029000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  [(FHDatabaseManager *)self closeAndUnlock:v4];
}

- (void)_updateAggregateTablesSchema
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  v3 = [(FHDatabaseManager *)self _fetch:@"select count(*) from PRAGMA_TABLE_INFO('features_datetime');"];
  if ([v3 next])
  {
    int v4 = [v3 intAtIndex:0];
    [(FHDatabaseManager *)self closeAndUnlock:v3];
    if (v4 <= 4)
    {
      uint64_t v5 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"features_datetime", @"features_amount", @"features_detailed_category", 0);
      v6 = FinHealthLogObject(@"FinHealthCore");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_24E029000, v6, OS_LOG_TYPE_DEBUG, "Aggreagate tables are out of date. Drop and re-create", buf, 2u);
      }

      v7 = FinHealthLogObject(@"FinHealthCore");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_24E029000, v7, OS_LOG_TYPE_DEBUG, "Schema before change:", buf, 2u);
      }

      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v8 = v5;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v41 objects:v47 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v42 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v41 + 1) + 8 * i);
            [(FHDatabaseManager *)self _logSchema:v13];
            uint64_t v14 = [NSString stringWithFormat:@"drop table if exists %@;", v13];
            [(FHDatabaseManager *)self _executeRaw:v14];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v41 objects:v47 count:16];
        }
        while (v10);
      }

      objc_msgSend(NSString, "stringWithFormat:", @"create table %@ %@;",
        @"features_merchant",
      BOOL v15 = @"(merchant_aggregate_id integer primary key autoincrement, merchant_aggregate_type text, merchant_aggregate_value text, start_date integer, end_date integer, UNIQUE(merchant_aggregate_type, start_date, end_date))");
      [(FHDatabaseManager *)self _executeRaw:v15];

      objc_msgSend(NSString, "stringWithFormat:", @"create table %@ %@;",
        @"features_detailed_category",
      v16 = @"(category_aggregate_id integer primary key autoincrement, detailed_category text, amount integer, transaction_count integer, country_code text, recurring_transaction_ratio real, time_of_day integer, time_window integer, start_date real, end_date real,  UNIQUE(detailed_category, time_of_day, time_window, country_code))");
      [(FHDatabaseManager *)self _executeRaw:v16];

      objc_msgSend(NSString, "stringWithFormat:", @"create table %@ %@;",
        @"features_datetime",
      v17 = @"(datetime_aggregate_id integer primary key autoincrement, datetime_aggregate_type text, datetime_aggregate_value_start_date integer, datetime_aggregate_value_end_date integer, start_date integer, end_date integer, UNIQUE(datetime_aggregate_type, start_date, end_date))");
      [(FHDatabaseManager *)self _executeRaw:v17];

      objc_msgSend(NSString, "stringWithFormat:", @"create table %@ %@;",
        @"features_amount",
      int v18 = @"(amount_aggregate_id integer primary key autoincrement, amount_aggregate_type text, amount_aggregate_value integer, comparison_operator text, start_date integer, end_date integer, UNIQUE(amount_aggregate_type, start_date, end_date))");
      [(FHDatabaseManager *)self _executeRaw:v18];

      BOOL v19 = FinHealthLogObject(@"FinHealthCore");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_24E029000, v19, OS_LOG_TYPE_DEBUG, "Schema after change:", buf, 2u);
      }

      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v20 = v8;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v46 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v38;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v38 != v23) {
              objc_enumerationMutation(v20);
            }
            [(FHDatabaseManager *)self _logSchema:*(void *)(*((void *)&v37 + 1) + 8 * j)];
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v37 objects:v46 count:16];
        }
        while (v22);
      }
    }
  }
  else
  {
    [(FHDatabaseManager *)self closeAndUnlock:v3];
  }
  v25 = (void *)-[PQLConnection fetch:](self->_db, "fetch:", @"select sql from sqlite_master where type='table' and name=%@;",
                  @"features_events");

  if ([v25 next])
  {
    v26 = [v25 stringAtIndex:0];
  }
  else
  {
    v26 = &stru_27001CD40;
  }
  v36 = v25;
  [v25 close];
  v27 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@";"];
  objc_msgSend(NSString, "stringWithFormat:", @"create table %@ %@;",
    @"features_events",
  v28 = @"(e_id integer primary key autoincrement, e_identifier text, start_date integer, end_date integer, UNIQUE(e_identifier, start_date, end_date))");
  v35 = v26;
  v29 = [(__CFString *)v26 lowercaseString];
  v30 = [v29 stringByTrimmingCharactersInSet:v27];
  v31 = [v28 lowercaseString];
  v32 = [v31 stringByTrimmingCharactersInSet:v27];
  char v33 = [v30 isEqualToString:v32];

  if ((v33 & 1) == 0)
  {
    [(FHDatabaseManager *)self _logSchema:@"features_events"];
    v34 = [NSString stringWithFormat:@"drop table if exists %@;", @"features_events"];
    [(FHDatabaseManager *)self _executeRaw:v34];

    [(FHDatabaseManager *)self _executeRaw:v28];
    [(FHDatabaseManager *)self _logSchema:@"features_events"];
  }
}

- (id)init:(BOOL)a3
{
  return [(FHDatabaseManager *)self init:a3 multiThreadingEnabled:1];
}

- (id)init:(BOOL)a3 multiThreadingEnabled:(BOOL)a4
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  v54.receiver = self;
  v54.super_class = (Class)FHDatabaseManager;
  int v4 = [(FHDatabaseManager *)&v54 init];
  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x263F087B0];
    v6 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", 86400);
    uint64_t v7 = [v5 decimalNumberWithString:v6];
    secondsInDay = v4->_secondsInDay;
    v4->_secondsInDay = (NSDecimalNumber *)v7;

    uint64_t v9 = (void *)MEMORY[0x263F087B0];
    uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%f", 0x4000000000000000);
    uint64_t v11 = [v9 decimalNumberWithString:v10];
    decimalRmseThreshold = v4->_decimalRmseThreshold;
    v4->_decimalRmseThreshold = (NSDecimalNumber *)v11;

    uint64_t v13 = objc_opt_new();
    amountAggregatesCache = v4->_amountAggregatesCache;
    v4->_amountAggregatesCache = (NSMutableDictionary *)v13;

    uint64_t v15 = objc_opt_new();
    merchantAggregatesCache = v4->_merchantAggregatesCache;
    v4->_merchantAggregatesCache = (NSMutableDictionary *)v15;

    uint64_t v17 = objc_opt_new();
    dateTimeAggregatesCache = v4->_dateTimeAggregatesCache;
    v4->_dateTimeAggregatesCache = (NSMutableDictionary *)v17;

    BOOL v19 = [(FHDatabaseManager *)v4 _getDataDirectory];
    id v20 = (PQLConnection *)objc_alloc_init(MEMORY[0x263F8C708]);
    db = v4->_db;
    v4->_db = v20;

    v4->_transactionFeaturesOffset = 0;
    *(void *)&v4->_lockDatabaseBookKeeping._os_unfair_lock_opaque = 0;
    *(void *)&v4->_lockDatabaseFetch._os_unfair_lock_opaque = 0;
    v4->_lockSQLStreaming._os_unfair_lock_opaque = 0;
    uint64_t v22 = objc_opt_new();
    transactionFeaturesCache = v4->_transactionFeaturesCache;
    v4->_transactionFeaturesCache = (NSMutableArray *)v22;

    [(PQLConnection *)v4->_db setSqliteErrorHandler:&__block_literal_global_107];
    [(PQLConnection *)v4->_db setBusyHandler:&__block_literal_global_111];
    v24 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x263F08790]);
    dateFormatter = v4->_dateFormatter;
    v4->_dateFormatter = v24;

    [(NSDateFormatter *)v4->_dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss Z"];
    if (v19)
    {
      [(FHDatabaseManager *)v4 _createDataDirectory];
      v26 = [(FHDatabaseManager *)v4 getDatabaseFileName];
      v27 = NSURL;
      v28 = [v19 stringByAppendingPathComponent:v26];
      v29 = [v27 URLWithString:v28];

      v30 = FinHealthLogObject(@"FinHealthCore");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v56 = v29;
        _os_log_impl(&dword_24E029000, v30, OS_LOG_TYPE_DEBUG, "dbUrl: %@", buf, 0xCu);
      }

      v31 = v4->_db;
      id v53 = 0;
      int v32 = [(PQLConnection *)v31 openAtURL:v29 withFlags:3211270 error:&v53];
      id v33 = v53;
      v34 = (void *)[(PQLConnection *)v4->_db fetch:@"PRAGMA journal_mode"];
      if ([v34 next])
      {
        v35 = FinHealthLogObject(@"FinHealthCore");
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          v36 = [v34 stringAtIndex:0];
          *(_DWORD *)buf = 138412290;
          v56 = v36;
          _os_log_impl(&dword_24E029000, v35, OS_LOG_TYPE_DEBUG, "Before Journal mode: %@", buf, 0xCu);
        }
      }
      [v34 close];
      long long v37 = (void *)[(PQLConnection *)v4->_db fetch:@"PRAGMA journal_mode=WAL"];

      if ([v37 next])
      {
        long long v38 = FinHealthLogObject(@"FinHealthCore");
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          long long v39 = [v37 stringAtIndex:0];
          *(_DWORD *)buf = 138412290;
          v56 = v39;
          _os_log_impl(&dword_24E029000, v38, OS_LOG_TYPE_DEBUG, "After Journal mode: %@", buf, 0xCu);
        }
      }
      [v37 close];
      if (v32)
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __48__FHDatabaseManager_init_multiThreadingEnabled___block_invoke_123;
        block[3] = &unk_265314800;
        v51 = v4;
        BOOL v52 = a3;
        if (init_multiThreadingEnabled__onceToken != -1) {
          dispatch_once(&init_multiThreadingEnabled__onceToken, block);
        }
      }
    }
    objc_initWeak((id *)buf, v4);
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __48__FHDatabaseManager_init_multiThreadingEnabled___block_invoke_2;
    v48[3] = &unk_265314828;
    objc_copyWeak(&v49, (id *)buf);
    uint64_t v40 = +[FHBatchProcessor initWithBuilder:v48];
    batchProcessor = v4->_batchProcessor;
    v4->_batchProcessor = (FHBatchProcessor *)v40;

    long long v42 = [FHDatabaseEntity alloc];
    id WeakRetained = objc_loadWeakRetained((id *)buf);
    uint64_t v44 = [(FHDatabaseEntity *)v42 initWithEntity:@"transactions" databaseManager:WeakRetained];
    transactionsEntity = v4->_transactionsEntity;
    v4->_transactionsEntity = (FHDatabaseEntity *)v44;

    objc_destroyWeak(&v49);
    objc_destroyWeak((id *)buf);
  }
  return v4;
}

void __48__FHDatabaseManager_init_multiThreadingEnabled___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  id v8 = FinHealthLogObject(@"FinHealthCore");
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (a3)
  {
    if (v9)
    {
LABEL_7:
      int v10 = 138543618;
      id v11 = v7;
      __int16 v12 = 2080;
      uint64_t v13 = "-[FHDatabaseManager init:multiThreadingEnabled:]_block_invoke";
      _os_log_impl(&dword_24E029000, v8, OS_LOG_TYPE_ERROR, "Sqlite error: [%{public}@], %s", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    if (v9)
    {
      int v10 = 138543618;
      id v11 = v6;
      __int16 v12 = 2080;
      uint64_t v13 = "-[FHDatabaseManager init:multiThreadingEnabled:]_block_invoke";
      _os_log_impl(&dword_24E029000, v8, OS_LOG_TYPE_ERROR, "Sqlite [no statement available] failed on %{public}@:, %s", (uint8_t *)&v10, 0x16u);
    }

    id v8 = FinHealthLogObject(@"FinHealthCore");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
  }
}

BOOL __48__FHDatabaseManager_init_multiThreadingEnabled___block_invoke_108(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v4 = FinHealthLogObject(@"FinHealthCore");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  if (a3 >= 0xA)
  {
    if (v5)
    {
      int v7 = 67109378;
      unsigned int v8 = a3;
      __int16 v9 = 2080;
      int v10 = "-[FHDatabaseManager init:multiThreadingEnabled:]_block_invoke";
      _os_log_impl(&dword_24E029000, v4, OS_LOG_TYPE_ERROR, "Exhautsed all retries :%d, %s", (uint8_t *)&v7, 0x12u);
    }
  }
  else
  {
    if (v5)
    {
      int v7 = 67109378;
      unsigned int v8 = a3;
      __int16 v9 = 2080;
      int v10 = "-[FHDatabaseManager init:multiThreadingEnabled:]_block_invoke";
      _os_log_impl(&dword_24E029000, v4, OS_LOG_TYPE_ERROR, "Database is locked, retrying. retries :%d, %s", (uint8_t *)&v7, 0x12u);
    }

    sqlite3_sleep(200);
  }
  return a3 < 0xA;
}

uint64_t __48__FHDatabaseManager_init_multiThreadingEnabled___block_invoke_123(uint64_t a1)
{
  return [*(id *)(a1 + 32) _rebuildTablesAndIndexes:*(unsigned __int8 *)(a1 + 40)];
}

void __48__FHDatabaseManager_init_multiThreadingEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    [v3 enableMerchantCounts];
    [v3 setDatabaseManager:WeakRetained];
    [v3 addInternalState:2];
  }
  else
  {
    BOOL v5 = FinHealthLogObject(@"FinHealthCore");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      int v7 = "-[FHDatabaseManager init:multiThreadingEnabled:]_block_invoke_2";
      _os_log_impl(&dword_24E029000, v5, OS_LOG_TYPE_ERROR, "%s strongSelf is nil", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (BOOL)insertTransactionInInternalStateDirty:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 transactionServiceIdentifier];

  if (v5)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __59__FHDatabaseManager_insertTransactionInInternalStateDirty___block_invoke;
    v11[3] = &unk_265314850;
    id v12 = v4;
    int v6 = +[FHDatabaseClauseFromBuilder initWithBuilder:v11];
    [(FHDatabaseEntity *)self->_transactionsEntity clearDataWithClauseBuilder:v6];
  }
  int v7 = [v4 identifier];
  uint64_t v8 = [v4 transactionServiceIdentifier];
  BOOL v9 = [(FHDatabaseManager *)self _execute:@"insert into transactions (t_identifier, t_service_identifier, t_fh_internal_state) values (%@, %@, %d)", v7, v8, 1];

  return v9;
}

void __59__FHDatabaseManager_insertTransactionInInternalStateDirty___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 transactionServiceIdentifier];
  [v3 addStringClause:@"==" fieldName:@"transactions.t_service_identifier" expression:v4];
}

- (BOOL)updateFinanceTransactionIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 financeTransactionIdentifier];
  int v6 = [v4 identifier];

  LOBYTE(self) = [(FHDatabaseManager *)self _execute:@"update transactions set t_finance_transaction_id = %@ where t_identifier == %@", v5, v6];
  return (char)self;
}

- (BOOL)updateTransactionWholeRaw:(id)a3
{
  return [(FHDatabaseManager *)self _updateTransaction:a3 withNewInternalState:2];
}

- (BOOL)updateTransactionInternalStateByIdentifier:(id)a3 newInternalState:(unint64_t)a4
{
  int v6 = [(FHDatabaseManager *)self getTransactionByIdentifier:a3];
  LOBYTE(a4) = [(FHDatabaseManager *)self _updateTransaction:v6 withNewInternalState:a4];

  return a4;
}

- (BOOL)_updateTransaction:(id)a3 withNewInternalState:(unint64_t)a4
{
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x263F087B0];
  int v6 = [v4 amount];
  int v7 = v6;
  if (v6)
  {
    [v6 decimalValue];
  }
  else
  {
    v87[0] = 0;
    v87[1] = 0;
    int v88 = 0;
  }
  uint64_t v8 = [v5 decimalNumberWithDecimal:v87];

  BOOL v9 = [MEMORY[0x263F087B0] defaultDatabaseAmountMultiplier];
  v71 = v8;
  int v10 = [v8 decimalNumberByMultiplyingBy:v9];
  uint64_t v67 = [v10 intValue];

  uint64_t v11 = [v4 transactionDate];
  [v11 timeIntervalSinceReferenceDate];
  double v13 = v12;

  uint64_t v14 = [v4 transactionStatusChangedDate];
  [v14 timeIntervalSinceReferenceDate];
  double v16 = v15;

  if ([v4 mapsMerchantID])
  {
    v86 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", objc_msgSend(v4, "mapsMerchantID"));
  }
  else
  {
    v86 = 0;
  }
  if ([v4 mapsMerchantBrandID])
  {
    v85 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", objc_msgSend(v4, "mapsMerchantBrandID"));
  }
  else
  {
    v85 = 0;
  }
  uint64_t v17 = [v4 merchantDetailedCategory];
  if (v17)
  {
    int v18 = [v4 merchantDetailedCategory];
  }
  else
  {
    int v18 = @"undefined";
  }
  v84 = v18;

  BOOL v19 = [v4 timeZone];
  if (v19)
  {
    id v20 = NSNumber;
    uint64_t v21 = [v4 timeZone];
    v83 = objc_msgSend(v20, "numberWithInteger:", objc_msgSend(v21, "secondsFromGMT"));
  }
  else
  {
    v83 = 0;
  }

  uint64_t v22 = [v4 peerPaymentCounterpartHandle];
  if (v22)
  {
    v82 = [v4 peerPaymentCounterpartHandle];
  }
  else
  {
    v82 = 0;
  }

  if ([v4 peerPaymentType]) {
    uint64_t v63 = [v4 peerPaymentType];
  }
  else {
    uint64_t v63 = 0;
  }
  uint64_t v65 = (int)v16;
  uint64_t v66 = (int)v13;
  v78 = [v4 transactionDescription];
  unsigned int v64 = [v4 recurring];
  uint64_t v23 = [v4 disputeOpenDate];
  [v23 timeIntervalSinceReferenceDate];
  uint64_t v62 = (int)v24;

  v25 = [v4 disputeLastUpdatedDate];
  [v25 timeIntervalSinceReferenceDate];
  uint64_t v59 = (int)v26;

  v81 = [v4 transactionServiceIdentifier];
  v77 = [v4 financeTransactionIdentifier];
  v80 = [v4 paymentHash];
  v79 = [v4 transactionSourceIdentifier];
  v76 = [v4 currencyCode];
  uint64_t v61 = [v4 transactionStatus];
  uint64_t v60 = [v4 transactionSource];
  uint64_t v58 = [v4 cardType];
  uint64_t v57 = [v4 transactionType];
  uint64_t v55 = [v4 accountType];
  v75 = [v4 altDSID];
  v72 = [v4 receiptIdentifier];
  v74 = [v4 associatedReceiptUniqueID];
  v73 = [v4 merchantUniqueIdentifier];
  uint64_t v51 = [v4 industryCode];
  v56 = [v4 name];
  objc_super v54 = [v4 rawName];
  uint64_t v50 = [v4 category];
  id v53 = [v4 displayName];
  BOOL v52 = [v4 street];
  v27 = [v4 city];
  v28 = [v4 state];
  v29 = [v4 zip];
  v30 = [v4 countryCode];
  v31 = [v4 country];
  uint64_t v32 = [v4 mapsMerchantResultProviderID];
  uint64_t v33 = [v4 mapsMerchantBrandResultProviderID];
  id v49 = [v4 location];
  [v49 coordinate];
  uint64_t v35 = v34;
  uint64_t v48 = [v4 location];
  [v48 coordinate];
  uint64_t v37 = v36;
  v47 = [v4 location];
  [v47 verticalAccuracy];
  uint64_t v39 = v38;
  v46 = [v4 location];
  [v46 horizontalAccuracy];
  uint64_t v41 = v40;
  uint64_t v42 = [v4 disputeType];
  uint64_t v43 = [v4 disputeStatus];
  v45 = [v4 identifier];
  BOOL v70 = -[FHDatabaseManager _execute:](self, "_execute:", @"update transactions set t_service_identifier = %@, t_finance_transaction_id = %@, t_payment_hash = %@, t_source_identifier = %@, t_amount = %d, t_currencycode = %@, t_timezone = %@, t_date = %d, t_status = %d, t_status_changed_date = %d, t_source = %d, t_card_type = %d, t_type = %d, a_type = %d, t_altDSID = %@, t_receipt_identifier = %@, t_associated_receipt_unique_id = %@, t_fh_internal_state = %d, m_merchant_identifier = %@, m_industrycode = %d, m_name = %@, m_raw_name = %@, m_category = %d, m_detailed_category = %@, m_displayname = %@, m_street = %@, m_city = %@, m_state = %@, m_zip = %@, m_country_code = %@, m_country = %@, m_maps_merchant_id = %@, m_maps_merchant_result_id = %d, m_maps_merchant_brand_id = %@, m_maps_merchant_brand_result_id = %d, lat = %f, long = %f, v_accuracy = %f, h_accuracy = %f, dispute_type = %d, dispute_status = %d, peer_pay_counterpart = %@, peer_pay_type = %d, t_description = %@, peer_pay_is_recurring = %d, dispute_open_date = %d, dispute_last_updated_date = %d where t_identifier == %@", v81, v77, v80, v79, v67, v76, v83, v66, v61, v65, v60, v58, v57, v55, v75, v72,
          v74,
          a4,
          v73,
          v51,
          v56,
          v54,
          v50,
          v84,
          v53,
          v52,
          v27,
          v28,
          v29,
          v30,
          v31,
          v86,
          v32,
          v85,
          v33,
          v35,
          v37,
          v39,
          v41,
          v42,
          v43,
          v82,
          v63,
          v78,
          v64,
          v62,
          v59,
          v45);

  return v70;
}

- (BOOL)updateTransactionsInternalStateToState:(id)a3 oldInternalState:(unint64_t)a4 newInternalState:(unint64_t)a5
{
  uint64_t v8 = NSString;
  id v9 = a3;
  int v10 = [v8 stringWithFormat:@"update transactions set t_fh_internal_state = %d where t_date >= %d and t_date <= %d and t_fh_internal_state %@ %d and t_fh_internal_state != %d", a5, -[FHDatabaseManager _startingDateSmartFeatureComputation](self, "_startingDateSmartFeatureComputation"), -[FHDatabaseManager mostRecentTransactionDate](self, "mostRecentTransactionDate"), v9, a4, 6];

  LOBYTE(a4) = [(FHDatabaseManager *)self _executeRaw:v10];
  return a4;
}

- (BOOL)insertInstrumentationRecord:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = FinHealthLogObject(@"FinHealthCore");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v4;
    _os_log_impl(&dword_24E029000, v5, OS_LOG_TYPE_DEBUG, "instrumentationRecord: %@", buf, 0xCu);
  }

  int v6 = [v4 objectForKey:@"Source"];
  uint64_t v7 = [v6 unsignedIntegerValue];

  uint64_t v8 = [v4 objectForKey:@"TagType"];
  uint64_t v9 = [v8 unsignedIntegerValue];

  int v10 = [v4 objectForKey:@"PassType"];
  uint64_t v11 = [v10 unsignedIntegerValue];

  double v12 = [MEMORY[0x263EFF910] now];
  [v12 timeIntervalSinceReferenceDate];
  unint64_t v14 = (unint64_t)v13;

  double v15 = [v4 objectForKey:@"HeuristicIdentifier"];
  double v16 = [v4 objectForKey:@"AccountState"];
  uint64_t v17 = [v16 unsignedIntegerValue];

  int v18 = [v4 objectForKey:@"PaidUsingRing"];
  uint64_t v19 = [v18 unsignedIntegerValue];

  BOOL v20 = [(FHDatabaseManager *)self _execute:@"insert into features_instrumentation (tag_source, tag_type, tag_click_date, pass_type, heuristics_identifier, account_state, paid_using_ring) values (%d, %d, %d, %d, %@, %d, %d)", v7, v9, v14, v11, v15, v17, v19];
  return v20;
}

- (BOOL)insertReceiptData:(id)a3 identifier:(id)a4 title:(id)a5 subtitle:(id)a6 quantity:(unint64_t)a7 amount:(id)a8 currencyCode:(id)a9 adamIdentifier:(unint64_t)a10
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a9;
  uint64_t v19 = (void *)MEMORY[0x263F087B0];
  if (a8)
  {
    [a8 decimalValue];
  }
  else
  {
    v27[0] = 0;
    v27[1] = 0;
    int v28 = 0;
  }
  BOOL v20 = [v19 decimalNumberWithDecimal:v27];
  uint64_t v21 = [MEMORY[0x263F087B0] defaultDatabaseAmountMultiplier];
  uint64_t v22 = [v20 decimalNumberByMultiplyingBy:v21];
  uint64_t v23 = [v22 intValue];

  LOBYTE(v23) = [(FHDatabaseManager *)self _execute:@"insert into fh_receipt_data(receiptIdentifier, line_item_index, title, subtitle, quantity, amount, currencyCode, adamIdentifier) values (%@, %@, %@, %@, %d, %d, %@, %d)", v14, v15, v16, v17, a7, v23, v18, a10];
  return v23;
}

- (BOOL)_insertModelRecord:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 objectForKey:@"modelName"];
  int v6 = [v4 objectForKey:@"modelVersion"];
  uint64_t v7 = [v4 objectForKey:@"dataType"];
  uint64_t v8 = [v7 unsignedIntegerValue];

  uint64_t v9 = [v4 objectForKey:@"dataIdentifier"];
  int v10 = [v4 objectForKey:@"predictedScore"];

  LOBYTE(self) = [(FHDatabaseManager *)self _execute:@"insert or replace into features_predicted_realtime (identifier, feature_name, feature_predicted_class, version, data_type, predicted_score) values (%@, %@, %d, %@, %d, %f)", v9, v5, 0, v6, v8, v10];
  return (char)self;
}

- (unint64_t)getTransactionInternalState:(id)a3
{
  id v4 = [a3 identifier];
  BOOL v5 = [(FHDatabaseManager *)self _fetch:@"select * from transactions t where t.t_identifier == %@ order by t_date desc limit %d", v4, 1];

  if ([v5 next]) {
    unint64_t v6 = [v5 unsignedIntegerAtIndex:19];
  }
  else {
    unint64_t v6 = 0;
  }
  [(FHDatabaseManager *)self closeAndUnlock:v5];

  return v6;
}

- (id)getTransactionByFinanceTransactionIdentifier:(id)a3
{
  id v4 = (void *)[(PQLConnection *)self->_db fetch:@"select * from transactions where t_finance_transaction_id == %@", a3];
  if ([v4 next])
  {
    BOOL v5 = [(FHDatabaseManager *)self reconstructTransaction:v4];
  }
  else
  {
    BOOL v5 = 0;
  }
  [v4 close];

  return v5;
}

- (id)_getTransactionByIdentifier:(id)a3
{
  id v4 = (void *)[(PQLConnection *)self->_db fetch:@"select * from transactions t where t.t_identifier == %@ order by t_date desc limit %d", a3, 1];
  if ([v4 next])
  {
    BOOL v5 = [(FHDatabaseManager *)self reconstructTransaction:v4];
  }
  else
  {
    BOOL v5 = 0;
  }
  [v4 close];

  return v5;
}

- (id)getTransactionsByInternalState:(unint64_t)a3 internalState:(unint64_t)a4
{
  return [(FHDatabaseManager *)self getTransactionsByInternalState:a3 internalState:a4 offSet:0];
}

- (int)streamTransactionsWithLimit:(unint64_t)a3 internalState:(unint64_t)a4 onTransaction:(id)a5
{
  return [(FHDatabaseManager *)self streamTransactionsWithLimit:a3 internalState:a4 offSet:0 onTransaction:a5];
}

- (int)streamTransactionsWithLimit:(unint64_t)a3 internalState:(unint64_t)a4 offSet:(unint64_t)a5 onTransaction:(id)a6
{
  int v10 = (void (**)(id, void *))a6;
  uint64_t v11 = [(FHDatabaseManager *)self _fetch:@"select * from transactions t where t_fh_internal_state == %d order by t_date desc limit %d offset %d", a4, a3, a5];
  int v12 = 0;
  if ([v11 next])
  {
    do
    {
      double v13 = (void *)MEMORY[0x253330BB0]();
      id v14 = [(FHDatabaseManager *)self reconstructTransaction:v11];
      v10[2](v10, v14);
      ++v12;
    }
    while (([v11 next] & 1) != 0);
  }
  [(FHDatabaseManager *)self closeAndUnlock:v11];

  return v12;
}

- (id)getTransactionsByInternalState:(unint64_t)a3 internalState:(unint64_t)a4 offSet:(unint64_t)a5
{
  return [(FHDatabaseManager *)self getTransactionsByInternalState:a3 internalState:a4 offSet:a5 addCompoundFeatures:0];
}

- (id)getTransactionsByInternalState:(unint64_t)a3 internalState:(unint64_t)a4 offSet:(unint64_t)a5 addCompoundFeatures:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  int v12 = [(FHDatabaseManager *)self _fetch:@"select * from transactions t where t_fh_internal_state == %d order by t_date desc limit %d offset %d", a4, a3, a5];
  if ([v12 next])
  {
    do
    {
      double v13 = [(FHDatabaseManager *)self reconstructTransaction:v12];
      if ([v13 transactionType]) {
        BOOL v14 = 0;
      }
      else {
        BOOL v14 = [v13 transactionStatus] == 1;
      }
      uint64_t v15 = [v13 transactionType];
      if (v14 || v15 == 3) {
        [v11 addObject:v13];
      }
    }
    while (([v12 next] & 1) != 0);
  }
  [(FHDatabaseManager *)self closeAndUnlock:v12];
  if (v6)
  {
    v30 = v12;
    id v31 = v11;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    obuint64_t j = v11;
    uint64_t v16 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v34 != v18) {
            objc_enumerationMutation(obj);
          }
          BOOL v20 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          uint64_t v21 = [v20 identifier];
          uint64_t v22 = [(FHDatabaseManager *)self compoundFeaturesForTransaction:v21];

          uint64_t v23 = [v22 objectForKey:@"FHSmartFeatureCompoundTypePointsOfInterest"];
          uint64_t v24 = v23;
          if (v23 && [v23 count])
          {
            id v25 = objc_alloc(NSDictionary);
            double v26 = [MEMORY[0x263EFF8C0] arrayWithArray:v24];
            v27 = objc_msgSend(v25, "initWithObjectsAndKeys:", v26, @"FHSmartFeatureCompoundTypePointsOfInterest", 0);

            [v20 setCompoundFeatures:v27];
          }
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v17);
    }

    int v12 = v30;
    id v11 = v31;
  }
  int v28 = [MEMORY[0x263EFF8C0] arrayWithArray:v11];

  return v28;
}

- (id)getTransactionsByDetailedCategory:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_opt_new();
  BOOL v6 = [(FHDatabaseManager *)self _fetch:@"select * from transactions where m_detailed_category == %@ order by t_date desc", v4];
  if ([v6 next])
  {
    do
    {
      uint64_t v7 = [(FHDatabaseManager *)self reconstructTransaction:v6];
      [v5 addObject:v7];
    }
    while (([v6 next] & 1) != 0);
  }
  [(FHDatabaseManager *)self closeAndUnlock:v6];
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithArray:v5];

  return v8;
}

- (id)getRecurringTransactionIdentifiers
{
  return [(FHDatabaseManager *)self getRecurringTransactionIdentifiersByClass:0];
}

- (id)getRecurringTransactionIdentifiersByClass:(unint64_t)a3
{
  BOOL v5 = objc_opt_new();
  BOOL v6 = [(FHDatabaseManager *)self _fetch:@"select identifier from features_predicted_realtime where feature_name='FHSmartFeatureAggregateTypeRecurring' and feature_predicted_class=%d limit %d", a3, -1];
  if ([v6 next])
  {
    do
    {
      uint64_t v7 = [v6 stringAtIndex:0];
      [v5 addObject:v7];
    }
    while (([v6 next] & 1) != 0);
  }
  [(FHDatabaseManager *)self closeAndUnlock:v6];
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithArray:v5];

  return v8;
}

- (id)getTransactionIdsInTimeRangeFrom:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  [v6 timeIntervalSinceReferenceDate];
  uint64_t v10 = (int)v9;
  [v7 timeIntervalSinceReferenceDate];
  int v12 = [(FHDatabaseManager *)self _fetch:@"select * from transactions t where t_date >= %d and t_date <= %d and a_type == %d order by t_date desc limit %d", v10, (int)v11, 2, -1];
  if ([v12 next])
  {
    do
    {
      double v13 = [v12 stringAtIndex:1];
      [v8 addObject:v13];
    }
    while (([v12 next] & 1) != 0);
  }
  [(FHDatabaseManager *)self closeAndUnlock:v12];
  BOOL v14 = [MEMORY[0x263EFF8C0] arrayWithArray:v8];

  return v14;
}

- (BOOL)insertFeatures:(id)a3 realtimeFeatures:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 identifier];
  uint64_t v9 = [v7 accountType];

  BOOL v10 = v9 == 2
     && [(FHDatabaseManager *)self insertFeaturesDeterminiticRealtime:v8 realtimeFeatures:v6]&& [(FHDatabaseManager *)self insertFeaturesPredictedRealtime:v8 realtimeFeatures:v6]&& [(FHDatabaseManager *)self insertFeaturesCompoundRealtime:v8 realtimeFeatures:v6];

  return v10;
}

- (BOOL)insertFeaturesDeterminiticRealtime:(id)a3 realtimeFeatures:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v6 timeOfDay];
  uint64_t v9 = [v6 transactionDateAtZerothHour];
  uint64_t v10 = [v6 merchantCategory];
  unsigned int v11 = [v6 isInternationalSpend];
  unsigned int v12 = [v6 isTapToPay];

  LOBYTE(self) = [(FHDatabaseManager *)self _execute:@"insert or replace into features_deterministic_realtime (t_identifier, a, b, c, f, g) values (%@, %d, %d, %d, %d, %d)", v7, v8, v9, v10, v11, v12];
  return (char)self;
}

- (BOOL)insertFeaturesPredictedRealtime:(id)a3 realtimeFeatures:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 repeatingPatternClass];
  if ((unint64_t)[v7 repeatingPatternClass] <= 2) {
    [(FHDatabaseManager *)self deleteWithSQL:@"delete from features_predicted_realtime where identifier == %@ and feature_name == %@", v6, @"FHSmartFeatureAggregateTypeRecurring"];
  }
  BOOL v8 = -[FHDatabaseManager _execute:](self, "_execute:", @"insert or replace into features_predicted_realtime (identifier, feature_name, feature_predicted_class, version, data_type, predicted_score) values (%@, %@, %d, %@, %d, %f)", v6, @"FHSmartFeatureAggregateTypeRecurring", [v7 repeatingPatternClass], @"0", 0, 0);

  return v8;
}

- (BOOL)insertFeaturesCompoundRealtime:(id)a3 realtimeFeatures:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 smartCompoundFeatures];
  if (!v8) {
    goto LABEL_6;
  }
  uint64_t v9 = (void *)v8;
  uint64_t v10 = [v7 smartCompoundFeatures];
  unsigned int v11 = [v10 objectForKey:@"FHSmartFeatureCompoundTypeEventTagging"];
  if (!v11)
  {
    unsigned int v12 = [v7 smartCompoundFeatures];
    double v13 = [v12 objectForKey:@"FHSmartFeatureCompoundTypeTripEvents"];

    if (v13) {
      goto LABEL_5;
    }
LABEL_6:
    BOOL v17 = 1;
    goto LABEL_7;
  }

LABEL_5:
  BOOL v14 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v15 = [v7 smartCompoundFeatures];
  uint64_t v16 = [v14 arrayWithObject:v15];
  BOOL v17 = [(FHDatabaseManager *)self insertFeaturesEvents:v16];

LABEL_7:
  BOOL v18 = v17 & [(FHDatabaseManager *)self insertFeaturesCompoundRealtimeWithoutEvents:v6 realtimeFeatures:v7];

  return v18;
}

- (BOOL)insertFeaturesCompoundRealtimeWithoutEvents:(id)a3 realtimeFeatures:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x253330BB0]();
  uint64_t v9 = (void *)MEMORY[0x263F08900];
  uint64_t v10 = [v7 smartCompoundFeaturesDictionaryForJson];
  id v17 = 0;
  unsigned int v11 = [v9 dataWithJSONObject:v10 options:0 error:&v17];
  id v12 = v17;

  if (v11)
  {
    double v13 = [[NSString alloc] initWithData:v11 encoding:4];
    BOOL v14 = [(FHDatabaseManager *)self _execute:@"insert or replace into features_compound_realtime (t_identifier, t_compound_feature_value) values (%@, %@)", v6, v13];
  }
  else
  {
    double v13 = FinHealthLogObject(@"FinHealthCore");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = [v12 localizedDescription];
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v15;
      _os_log_impl(&dword_24E029000, v13, OS_LOG_TYPE_DEBUG, "Failed to parse smartCompoundFeaturesDictionaryForJson: %@", buf, 0xCu);
    }
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)insertFeaturesEvents:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x263EFF9C0];
  id v6 = [v4 valueForKeyPath:@"@distinctUnionOfArrays.FHSmartFeatureCompoundTypeEventTagging"];
  id v7 = [v5 setWithArray:v6];

  uint64_t v8 = [v4 valueForKeyPath:@"@distinctUnionOfArrays.FHSmartFeatureCompoundTypeTripEvents"];
  [v7 addObjectsFromArray:v8];

  if ([v7 count])
  {
    uint64_t v9 = FinHealthLogObject(@"FinHealthCore");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v39 = v7;
      _os_log_impl(&dword_24E029000, v9, OS_LOG_TYPE_DEBUG, "Distinct event ranked values: %@", buf, 0xCu);
    }
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = v7;
  uint64_t v27 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v27)
  {
    uint64_t v26 = *(void *)v33;
    int v10 = 1;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v33 != v26) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        double v13 = [v12 eventStartDate];
        [v13 timeIntervalSinceReferenceDate];
        double v15 = v14;

        uint64_t v16 = [v12 eventEndDate];
        [v16 timeIntervalSinceReferenceDate];
        double v18 = v17;

        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        uint64_t v19 = [v12 eventIdentifiers];
        uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v29;
          do
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v29 != v22) {
                objc_enumerationMutation(v19);
              }
              v10 &= [(FHDatabaseManager *)self _execute:@"insert or replace into features_events (e_identifier, start_date, end_date) values (%@, %d, %d)", *(void *)(*((void *)&v28 + 1) + 8 * j), (int)v15, (int)v18];
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
          }
          while (v21);
        }
      }
      uint64_t v27 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v27);
  }
  else
  {
    LOBYTE(v10) = 1;
  }

  return v10 & 1;
}

- (BOOL)insertFeaturesGrouping:(id)a3 realtimeFeatures:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 mapsMerchantID])
  {
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", objc_msgSend(v7, "mapsMerchantID"));
  }
  else
  {
    uint64_t v8 = 0;
  }
  if ([v7 mapsMerchantBrandID])
  {
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", objc_msgSend(v7, "mapsMerchantBrandID"));
    if (!v8)
    {
LABEL_11:
      int v17 = 1;
      if (!v9) {
        goto LABEL_14;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if (!v8) {
      goto LABEL_11;
    }
  }
  if (![v8 length]) {
    goto LABEL_11;
  }
  int v10 = NSString;
  id v11 = v6;
  id v12 = self;
  uint64_t v13 = [v8 integerValue];
  double v14 = [MEMORY[0x263F087B0] zero];
  double v15 = [v14 stringValue];
  uint64_t v24 = v13;
  self = v12;
  id v6 = v11;
  uint64_t v16 = [v10 stringWithFormat:@"insert or replace into fh_grouping (t_identifier, group_id, similarity_score, group_type) values ('%@', %d, %@, %d)", v11, v24, v15, 2];

  int v17 = [(FHDatabaseManager *)self _execute:v16];
  if (!v9) {
    goto LABEL_14;
  }
LABEL_12:
  if ([v9 length])
  {
    double v18 = NSString;
    uint64_t v19 = [v9 integerValue];
    uint64_t v20 = [MEMORY[0x263F087B0] zero];
    uint64_t v21 = [v20 stringValue];
    uint64_t v22 = [v18 stringWithFormat:@"insert or replace into fh_grouping (t_identifier, group_id, similarity_score, group_type) values ('%@', %d, %@, %d)", v6, v19, v21, 1];

    v17 &= [(FHDatabaseManager *)self _execute:v22];
  }
LABEL_14:

  return v17;
}

- (id)getTaggedPastCalendarEvents
{
  id v3 = objc_opt_new();
  id v4 = [MEMORY[0x263EFF910] now];
  BOOL v5 = [v4 dateByAddingTimeInterval:-31536000.0];
  [v5 timeIntervalSinceReferenceDate];
  uint64_t v7 = (int)v6;

  double v18 = self;
  uint64_t v8 = [(FHDatabaseManager *)self _fetch:@"select * from features_events where end_date < %d limit %d", v7, -1];
  if ([v8 next])
  {
    do
    {
      uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF910]), "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v8, "unsignedIntAtIndex:", 2));
      int v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF910]), "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v8, "unsignedIntAtIndex:", 3));
      id v11 = NSDictionary;
      [v8 stringAtIndex:1];
      uint64_t v13 = v12 = v3;
      double v14 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v9, v10, 0);
      double v15 = objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", v13, @"featureEventIdentifiers", v9, @"featureEventStartDate", v10, @"featureEventEndDate", v14, @"featureEventDateRangeKey", 0);

      id v3 = v12;
      [v12 addObject:v15];
    }
    while (([v8 next] & 1) != 0);
  }
  [(FHDatabaseManager *)v18 closeAndUnlock:v8];
  uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithArray:v3];

  return v16;
}

- (id)getFeaturePredicate:(id)a3 FHSmartFeatureAggregateType:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = FHSmartFeaturesDict();
  uint64_t v8 = [v7 objectForKey:v6];

  uint64_t v9 = [v8 objectForKey:v5];

  int v10 = [v9 objectForKey:@"predicate"];

  if (v10)
  {
    id v11 = NSString;
    id v12 = [v10 objectForKey:@"index"];
    uint64_t v13 = [v10 objectForKey:@"filteringOperator"];
    double v14 = [v10 objectForKey:@"match"];
    double v15 = [v11 stringWithFormat:@"SELF[%@] %@ '%@'", v12, v13, v14];

    uint64_t v16 = [MEMORY[0x263F08A98] predicateWithFormat:v15];
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

- (BOOL)_computeSingleMerchantAggregateFeature:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = FHSmartFeaturesDict();
  id v6 = [v5 objectForKey:@"FHMerchantSmartFeatures"];
  uint64_t v7 = [v6 objectForKey:v4];

  uint64_t v8 = [v7 objectForKey:@"featureValueIndex"];
  int v38 = [v8 intValue];

  uint64_t v9 = [(FHDatabaseManager *)self getFeaturePredicate:@"FHMerchantSmartFeatures" FHSmartFeatureAggregateType:v4];
  uint64_t v39 = v7;
  int v10 = [v7 objectForKey:@"aggrWindow"];
  if (!v10)
  {
    int v10 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", 30);
  }
  id v11 = [NSString stringWithFormat:@"%@", v10];
  id v12 = [(NSMutableDictionary *)self->_merchantAggregatesCache objectForKey:v11];
  uint64_t v13 = (int)[v10 intValue];
  int64_t v14 = [(FHDatabaseManager *)self mostRecentTransactionDate];
  int64_t v15 = v14 - 86400 * v13;
  int64_t v36 = v14;
  if (v12)
  {
    uint64_t v16 = FinHealthLogObject(@"FinHealthCore");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v41 = "-[FHDatabaseManager _computeSingleMerchantAggregateFeature:]";
      __int16 v42 = 2112;
      uint64_t v43 = v11;
      _os_log_impl(&dword_24E029000, v16, OS_LOG_TYPE_DEBUG, "%s resultArray for %@ is already cached", buf, 0x16u);
    }
  }
  else
  {
    int64_t v17 = v14;
    long long v34 = v9;
    id v35 = v4;
    uint64_t v16 = objc_alloc_init(MEMORY[0x263EFF980]);
    double v18 = [(FHDatabaseManager *)self _fetch:@"select m_displayname, count(*) c, m_detailed_category from transactions where transactions.t_date >= %d and transactions.t_date <= %d and transactions.t_type == %lu and transactions.t_status == %lu and transactions.a_type == %d group by m_displayname order by c desc", v15, v17, 0, 1, 2];
    if ([v18 next])
    {
      do
      {
        uint64_t v19 = (void *)MEMORY[0x263EFF8C0];
        uint64_t v20 = [v18 stringAtIndex:0];
        uint64_t v21 = [v18 stringAtIndex:1];
        uint64_t v22 = [v18 stringAtIndex:2];
        uint64_t v23 = objc_msgSend(v19, "arrayWithObjects:", v20, v21, v22, 0);

        if ([v23 count]) {
          [v16 addObject:v23];
        }
      }
      while (([v18 next] & 1) != 0);
    }
    [(FHDatabaseManager *)self closeAndUnlock:v18];
    id v12 = [MEMORY[0x263EFF8C0] arrayWithArray:v16];
    [(NSMutableDictionary *)self->_merchantAggregatesCache setObject:v12 forKey:v11];
    uint64_t v24 = FinHealthLogObject(@"FinHealthCore");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v41 = "-[FHDatabaseManager _computeSingleMerchantAggregateFeature:]";
      __int16 v42 = 2112;
      uint64_t v43 = v11;
      _os_log_impl(&dword_24E029000, v24, OS_LOG_TYPE_DEBUG, "%s resultArray %@ added to cache", buf, 0x16u);
    }

    uint64_t v9 = v34;
    id v4 = v35;
  }

  id v25 = [v12 filteredArrayUsingPredicate:v9];
  if ([v25 count])
  {
    uint64_t v26 = v9;
    uint64_t v27 = [v25 firstObject];
    unint64_t v28 = [v27 count];

    if (v28 <= v38)
    {
      BOOL v32 = 1;
    }
    else
    {
      int64_t v37 = v15;
      id v29 = v4;
      long long v30 = [v25 firstObject];
      long long v31 = [v30 objectAtIndex:v38];

      if (v31)
      {
        id v4 = v29;
        BOOL v32 = [(FHDatabaseManager *)self _execute:@"insert or replace into features_merchant (merchant_aggregate_type, merchant_aggregate_value, start_date, end_date) values (%@, %@, %d, %d)", v29, v31, v37, v36];
      }
      else
      {
        BOOL v32 = 1;
        id v4 = v29;
      }
    }
    uint64_t v9 = v26;
  }
  else
  {
    BOOL v32 = 1;
  }

  return v32;
}

- (BOOL)computeMerchantAggregateFeatures
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  id v3 = FHMerchantSmartFeaturesArray();
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__FHDatabaseManager_computeMerchantAggregateFeatures__block_invoke;
  v5[3] = &unk_265314878;
  v5[4] = self;
  v5[5] = &v6;
  [v3 enumerateObjectsUsingBlock:v5];

  [(NSMutableDictionary *)self->_merchantAggregatesCache removeAllObjects];
  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

uint64_t __53__FHDatabaseManager_computeMerchantAggregateFeatures__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) _computeSingleMerchantAggregateFeature:a2];
  if ((result & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  return result;
}

- (BOOL)_computeSingleDatetimeAggregateFeature:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = FHSmartFeaturesDict();
  uint64_t v6 = [v5 objectForKey:@"FHDateTimeSmartFeatures"];
  uint64_t v7 = [v6 objectForKey:v4];

  uint64_t v8 = [v7 objectForKey:@"featureValueIndex"];
  int v36 = [v8 intValue];

  int64_t v37 = v7;
  char v9 = [v7 objectForKey:@"aggrWindow"];
  if (!v9)
  {
    char v9 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", 30);
  }
  int v10 = [NSString stringWithFormat:@"%@", v9];
  id v11 = [(NSMutableDictionary *)self->_dateTimeAggregatesCache objectForKey:v10];
  uint64_t v12 = (int)[v9 intValue];
  int64_t v13 = [(FHDatabaseManager *)self mostRecentTransactionDate];
  int64_t v14 = v13 - 86400 * v12;
  int64_t v34 = v14;
  int64_t v35 = v13;
  if (v11)
  {
    int64_t v15 = FinHealthLogObject(@"FinHealthCore");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v39 = "-[FHDatabaseManager _computeSingleDatetimeAggregateFeature:]";
      __int16 v40 = 2112;
      uint64_t v41 = v10;
      _os_log_impl(&dword_24E029000, v15, OS_LOG_TYPE_DEBUG, "%s resultArray for %@ is already cached", buf, 0x16u);
    }
  }
  else
  {
    int64_t v16 = v13;
    id v33 = v4;
    id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
    double v18 = [(FHDatabaseManager *)self _fetch:@"select sum(t.t_amount) daily_spend, f.b from transactions t inner join features_deterministic_realtime f on t.t_identifier = f.t_identifier where t.t_date >= %d and t.t_date <= %d and t.t_type == %lu and t.t_status == %lu and t.a_type == %d group by f.b order by daily_spend desc limit %d", v14, v16, 0, 1, 2, 1];
    if ([v18 next])
    {
      do
      {
        uint64_t v19 = (void *)MEMORY[0x263EFF8C0];
        uint64_t v20 = [v18 numberAtIndex:0];
        uint64_t v21 = [v18 numberAtIndex:1];
        uint64_t v22 = objc_msgSend(v19, "arrayWithObjects:", v20, v21, 0);

        [v17 addObject:v22];
      }
      while (([v18 next] & 1) != 0);
    }
    [(FHDatabaseManager *)self closeAndUnlock:v18];
    id v11 = [MEMORY[0x263EFF8C0] arrayWithArray:v17];
    [(NSMutableDictionary *)self->_dateTimeAggregatesCache setObject:v11 forKey:v10];

    id v4 = v33;
  }
  uint64_t v23 = [(FHDatabaseManager *)self getFeaturePredicate:@"FHDateTimeSmartFeatures" FHSmartFeatureAggregateType:v4];
  if (v23)
  {
    id v24 = [v11 filteredArrayUsingPredicate:v23];
  }
  else
  {
    id v24 = v11;
  }
  id v25 = v24;
  if ([v24 count]
    && ([v25 firstObject],
        uint64_t v26 = objc_claimAutoreleasedReturnValue(),
        unint64_t v27 = [v26 count],
        v26,
        v27 > v36))
  {
    id v28 = v4;
    id v29 = [v25 firstObject];
    long long v30 = [v29 objectAtIndex:v36];

    if (v30)
    {
      id v4 = v28;
      BOOL v31 = -[FHDatabaseManager _execute:](self, "_execute:", @"insert or replace into features_datetime (datetime_aggregate_type, datetime_aggregate_value_start_date, datetime_aggregate_value_end_date, start_date, end_date) values (%@, %d, %d, %d, %d)", v28, [v30 intValue], (int)objc_msgSend(v30, "intValue") + 86399, v34, v35);
    }
    else
    {
      BOOL v31 = 0;
      id v4 = v28;
    }
  }
  else
  {
    BOOL v31 = 0;
  }

  return v31;
}

- (BOOL)computeDatetimeAggregateFeatures
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  id v3 = FHDateTimeSmartFeaturesArray();
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__FHDatabaseManager_computeDatetimeAggregateFeatures__block_invoke;
  v5[3] = &unk_265314878;
  v5[4] = self;
  v5[5] = &v6;
  [v3 enumerateObjectsUsingBlock:v5];

  [(NSMutableDictionary *)self->_dateTimeAggregatesCache removeAllObjects];
  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

uint64_t __53__FHDatabaseManager_computeDatetimeAggregateFeatures__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) _computeSingleDatetimeAggregateFeature:a2];
  if ((result & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  return result;
}

- (BOOL)_computeSingleAmountAggregateFeature:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = FHSmartFeaturesDict();
  uint64_t v6 = [v5 objectForKey:@"FHAmountSmartFeatures"];
  uint64_t v39 = v4;
  uint64_t v7 = [v6 objectForKey:v4];

  uint64_t v8 = [v7 objectForKey:@"expression"];
  char v9 = [v7 objectForKey:@"aggrWindow"];
  if (!v9)
  {
    char v9 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", 30);
  }
  int v10 = [NSString stringWithFormat:@"%@", v9];
  id v11 = [(NSMutableDictionary *)self->_amountAggregatesCache objectForKey:v10];
  uint64_t v12 = (int)[v9 intValue];
  unint64_t v13 = [(FHDatabaseManager *)self mostRecentTransactionDate];
  unint64_t v14 = v13;
  unint64_t v15 = v13 - 86400 * v12;
  if (v11)
  {
    int64_t v16 = FinHealthLogObject(@"FinHealthCore");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v44 = "-[FHDatabaseManager _computeSingleAmountAggregateFeature:]";
      __int16 v45 = 2112;
      v46 = v10;
      _os_log_impl(&dword_24E029000, v16, OS_LOG_TYPE_DEBUG, "%s resultArray for %@ is already cached", buf, 0x16u);
    }
  }
  else
  {
    unint64_t v35 = v13;
    int64_t v37 = v8;
    id v17 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:(double)v13];
    unint64_t v34 = v15;
    double v18 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:(double)v15];
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __58__FHDatabaseManager__computeSingleAmountAggregateFeature___block_invoke;
    v40[3] = &unk_2653148A0;
    v40[4] = self;
    id v19 = v18;
    id v41 = v19;
    id v20 = v17;
    id v42 = v20;
    uint64_t v21 = +[FHBatchProcessor initWithBuilder:v40];
    [v21 fetchAndProcessInBatchMode];
    id v11 = [v21 filteredTransaction];
    [(NSMutableDictionary *)self->_amountAggregatesCache setObject:v11 forKey:v10];
    uint64_t v22 = FinHealthLogObject(@"FinHealthCore");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v44 = "-[FHDatabaseManager _computeSingleAmountAggregateFeature:]";
      __int16 v45 = 2112;
      v46 = v10;
      _os_log_impl(&dword_24E029000, v22, OS_LOG_TYPE_DEBUG, "%s resultArray %@ added to cache", buf, 0x16u);
    }

    unint64_t v14 = v35;
    uint64_t v8 = v37;
    unint64_t v15 = v34;
    if (!v11) {
      goto LABEL_15;
    }
  }
  if (![v11 count])
  {
LABEL_15:
    BOOL v32 = 1;
    goto LABEL_18;
  }
  int v38 = v10;
  uint64_t v23 = objc_opt_new();
  id v24 = [v8 componentsSeparatedByString:@"%@"];
  uint64_t v25 = [v24 count] - 1;

  if (v25 >= 1)
  {
    do
    {
      [v23 addObject:v11];
      --v25;
    }
    while (v25);
  }
  int v36 = v7;
  uint64_t v26 = [v7 objectForKey:@"comparator"];
  unint64_t v27 = v8;
  id v28 = [MEMORY[0x263F087F0] expressionWithFormat:v8 argumentArray:v23];
  id v29 = [v28 expressionValueWithObject:0 context:0];
  long long v30 = v29;
  if (v29)
  {
    [v29 doubleValue];
    BOOL v32 = [(FHDatabaseManager *)self _execute:@"insert or replace into features_amount (amount_aggregate_type, amount_aggregate_value, comparison_operator, start_date, end_date) values (%@, %d, %@, %d, %d)", v39, (int)v31, v26, v15, v14];
  }
  else
  {
    BOOL v32 = 1;
  }

  uint64_t v8 = v27;
  uint64_t v7 = v36;
  int v10 = v38;
LABEL_18:

  return v32;
}

void __58__FHDatabaseManager__computeSingleAmountAggregateFeature___block_invoke(uint64_t *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 setDatabaseManager:v3];
  [v4 addInternalState:2];
  objc_msgSend(v4, "setMostRecentTransactionFromDatabase:", objc_msgSend((id)a1[4], "mostRecentTransactionDate"));
  [v4 setStartDate:a1[5]];
  [v4 setEndDate:a1[6]];
}

- (BOOL)computeAmountAggregateFeatures
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  uint64_t v3 = FHAmountSmartFeaturesArray();
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__FHDatabaseManager_computeAmountAggregateFeatures__block_invoke;
  v5[3] = &unk_265314878;
  v5[4] = self;
  v5[5] = &v6;
  [v3 enumerateObjectsUsingBlock:v5];

  [(NSMutableDictionary *)self->_amountAggregatesCache removeAllObjects];
  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

uint64_t __51__FHDatabaseManager_computeAmountAggregateFeatures__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) _computeSingleAmountAggregateFeature:a2];
  if ((result & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  return result;
}

- (id)getFHSmartFeatureByMerchantType:(id)a3
{
  id v4 = [(FHDatabaseManager *)self _fetch:@"select merchant_aggregate_value, start_date, end_date from features_merchant where merchant_aggregate_type == %@ order by end_date desc", a3];
  if ([v4 next])
  {
    id v5 = objc_opt_new();
    uint64_t v6 = [v4 stringAtIndex:0];
    [v5 setMerchantDisplayName:v6];

    uint64_t v7 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v4, "integerAtIndex:", 1));
    [v5 setProcessingWindowStartDate:v7];

    uint64_t v8 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v4, "integerAtIndex:", 2));
    [v5 setProcessingWindowEndDate:v8];
  }
  else
  {
    id v5 = 0;
  }
  [(FHDatabaseManager *)self closeAndUnlock:v4];

  return v5;
}

- (id)getFHSmartFeatureByAmountType:(id)a3
{
  id v4 = [(FHDatabaseManager *)self _fetch:@"select amount_aggregate_value, comparison_operator, start_date, end_date from features_amount where amount_aggregate_type == %@ order by end_date desc", a3];
  if ([v4 next])
  {
    id v5 = objc_opt_new();
    objc_msgSend(v5, "setAmount:", objc_msgSend(v4, "integerAtIndex:", 0));
    uint64_t v6 = [v4 stringAtIndex:1];
    [v5 setComparator:v6];

    uint64_t v7 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v4, "integerAtIndex:", 2));
    [v5 setProcessingWindowStartDate:v7];

    uint64_t v8 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v4, "integerAtIndex:", 3));
    [v5 setProcessingWindowEndDate:v8];
  }
  else
  {
    id v5 = 0;
  }
  [(FHDatabaseManager *)self closeAndUnlock:v4];

  return v5;
}

- (id)getFHSmartFeatureByDateTimeType:(id)a3
{
  id v4 = [(FHDatabaseManager *)self _fetch:@"select datetime_aggregate_value_start_date, datetime_aggregate_value_end_date, start_date, end_date from features_datetime where datetime_aggregate_type == %@ order by end_date desc", a3];
  if ([v4 next])
  {
    id v5 = objc_opt_new();
    uint64_t v6 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v4, "integerAtIndex:", 0));
    [v5 setStartDate:v6];

    uint64_t v7 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v4, "integerAtIndex:", 1));
    [v5 setEndDate:v7];

    uint64_t v8 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v4, "integerAtIndex:", 2));
    [v5 setProcessingWindowStartDate:v8];

    char v9 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v4, "integerAtIndex:", 3));
    [v5 setProcessingWindowEndDate:v9];
  }
  else
  {
    id v5 = 0;
  }
  [(FHDatabaseManager *)self closeAndUnlock:v4];

  return v5;
}

- (BOOL)deleteAllFeatureRecordsForTransaction:(id)a3
{
  id v4 = a3;
  id v5 = [[FHDatabaseEntity alloc] initWithEntity:@"fh_card_recurring_predictions" databaseManager:self];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __59__FHDatabaseManager_deleteAllFeatureRecordsForTransaction___block_invoke;
  unint64_t v13 = &unk_265314850;
  id v6 = v4;
  id v14 = v6;
  uint64_t v7 = +[FHDatabaseClauseFromBuilder initWithBuilder:&v10];
  BOOL v8 = -[FHDatabaseManager deleteWithSQL:](self, "deleteWithSQL:", @"delete from features_deterministic_realtime where t_identifier in (select t_identifier from transactions t where t.t_source_identifier == %@)", v6, v10, v11, v12, v13)&& -[FHDatabaseManager deleteWithSQL:](self, "deleteWithSQL:", @"delete from features_predicted_realtime where identifier in (select t_identifier from transactions t where t.t_source_identifier == %@)", v6)&& -[FHDatabaseManager deleteWithSQL:](self, "deleteWithSQL:", @"delete from features_compound_realtime where t_identifier in (select t_identifier from transactions t where t.t_source_identifier == %@)", v6)&& -[FHDatabaseManager deleteWithSQL:](
         self,
         "deleteWithSQL:",
         @"delete from features_heuristics where t_identifier in (select t_identifier from transactions t where t.t_source_identifier == %@)",
         v6)
    && [(FHDatabaseEntity *)v5 clearDataWithClauseBuilder:v7];

  return v8;
}

uint64_t __59__FHDatabaseManager_deleteAllFeatureRecordsForTransaction___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addStringClause:@"==" fieldName:@"fh_card_recurring_predictions.source_identifier" expression:*(void *)(a1 + 32)];
}

- (BOOL)deleteAllRecordsInTransactions:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__FHDatabaseManager_deleteAllRecordsInTransactions___block_invoke;
  v8[3] = &unk_265314850;
  id v9 = v4;
  id v5 = v4;
  id v6 = +[FHDatabaseClauseFromBuilder initWithBuilder:v8];
  LOBYTE(self) = [(FHDatabaseEntity *)self->_transactionsEntity clearDataWithClauseBuilder:v6];

  return (char)self;
}

uint64_t __52__FHDatabaseManager_deleteAllRecordsInTransactions___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addStringClause:@"==" fieldName:@"transactions.t_source_identifier" expression:*(void *)(a1 + 32)];
}

- (BOOL)deleteTransactionWithIdentifier:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__FHDatabaseManager_deleteTransactionWithIdentifier___block_invoke;
  v8[3] = &unk_265314850;
  id v9 = v4;
  id v5 = v4;
  id v6 = +[FHDatabaseClauseFromBuilder initWithBuilder:v8];
  LOBYTE(self) = [(FHDatabaseEntity *)self->_transactionsEntity clearDataWithClauseBuilder:v6];

  return (char)self;
}

uint64_t __53__FHDatabaseManager_deleteTransactionWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addStringClause:@"==" fieldName:@"transactions.t_identifier" expression:*(void *)(a1 + 32)];
}

- (BOOL)deleteBankConnectTransactionWithFinanceTransactionIdentifier:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __82__FHDatabaseManager_deleteBankConnectTransactionWithFinanceTransactionIdentifier___block_invoke;
  v8[3] = &unk_265314850;
  id v9 = v4;
  id v5 = v4;
  id v6 = +[FHDatabaseClauseFromBuilder initWithBuilder:v8];
  LOBYTE(self) = [(FHDatabaseEntity *)self->_transactionsEntity clearDataWithClauseBuilder:v6];

  return (char)self;
}

void __82__FHDatabaseManager_deleteBankConnectTransactionWithFinanceTransactionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 addStringClause:@"==" fieldName:@"transactions.t_identifier" expression:v3];
  [v4 addStringClause:@"==" fieldName:@"transactions.t_finance_transaction_id" expression:*(void *)(a1 + 32)];
}

- (BOOL)removeFinanceTransactionIdentifier:(id)a3
{
  return [(FHDatabaseManager *)self _execute:@"update transactions set t_finance_transaction_id=null where t_identifier != t_finance_transaction_id and t_finance_transaction_id = %@", a3];
}

- (BOOL)deleteAllRecordsInPeerPaymentFeatures:(id)a3
{
  id v4 = a3;
  id v5 = [[FHDatabaseEntity alloc] initWithEntity:@"features_peer_payments" databaseManager:self];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__FHDatabaseManager_deleteAllRecordsInPeerPaymentFeatures___block_invoke;
  v10[3] = &unk_265314850;
  id v11 = v4;
  id v6 = v4;
  uint64_t v7 = +[FHDatabaseClauseFromBuilder initWithBuilder:v10];
  BOOL v8 = [(FHDatabaseEntity *)v5 clearDataWithClauseBuilder:v7];

  return v8;
}

uint64_t __59__FHDatabaseManager_deleteAllRecordsInPeerPaymentFeatures___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addStringClause:@"==" fieldName:@"features_peer_payments.source_identifier" expression:*(void *)(a1 + 32)];
}

- (BOOL)deleteAllRecordsInAccountInfoForTransactionSource:(id)a3
{
  id v4 = a3;
  id v5 = [[FHDatabaseEntity alloc] initWithEntity:@"fh_account_information" databaseManager:self];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __71__FHDatabaseManager_deleteAllRecordsInAccountInfoForTransactionSource___block_invoke;
  v10[3] = &unk_265314850;
  id v11 = v4;
  id v6 = v4;
  uint64_t v7 = +[FHDatabaseClauseFromBuilder initWithBuilder:v10];
  BOOL v8 = [(FHDatabaseEntity *)v5 clearDataWithClauseBuilder:v7];

  return v8;
}

uint64_t __71__FHDatabaseManager_deleteAllRecordsInAccountInfoForTransactionSource___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addStringClause:@"==" fieldName:@"fh_account_information.source_identifier" expression:*(void *)(a1 + 32)];
}

- (BOOL)updateGetAllStatus:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v4 = [(FHDatabaseManager *)self _execute:@"update fh_schema set sch_getall_status = %d where sch_version_id == %@", a3, @"10.72"];
  id v5 = FinHealthLogObject(@"FinHealthCore");
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24E029000, v6, OS_LOG_TYPE_DEBUG, "updateGetAllStatus successful", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = [(PQLConnection *)self->_db lastError];
    BOOL v8 = [v7 localizedDescription];
    *(_DWORD *)buf = 138412290;
    id v11 = v8;
    _os_log_impl(&dword_24E029000, v6, OS_LOG_TYPE_ERROR, "Update failed with error: %@", buf, 0xCu);
  }
  return v4;
}

- (BOOL)shouldCallGetAllTransactions
{
  -[FHDatabaseManager _fetch:](self, "_fetch:", @"select sch_getall_status from fh_schema where sch_version_id == %@;",
  uint64_t v3 = @"10.72");
  if ([v3 next]) {
    BOOL v4 = [v3 unsignedIntegerAtIndex:0] != 1;
  }
  else {
    BOOL v4 = 1;
  }
  [(FHDatabaseManager *)self closeAndUnlock:v3];

  return v4;
}

- (id)compoundFeaturesForTransaction:(id)a3
{
  BOOL v4 = [(FHDatabaseManager *)self _fetch:@"select t_identifier, t_compound_feature_value from features_compound_realtime where t_identifier == %@", a3];
  id v5 = objc_alloc_init(NSDictionary);
  if ([v4 next])
  {
    id v6 = [v4 stringAtIndex:1];
    uint64_t v7 = +[FinHealthFeatureHelper reconstructCompoundFeatures:v6];

    id v5 = (id)v7;
  }
  [(FHDatabaseManager *)self closeAndUnlock:v4];

  return v5;
}

- (id)reconstructTransaction:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_alloc_init(FHTransaction);
  uint64_t v5 = (int)[v3 intAtIndex:6];
  id v6 = (void *)[objc_alloc(MEMORY[0x263F087B0]) initWithInteger:v5];
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF910]), "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v3, "unsignedIntAtIndex:", 9));
  BOOL v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF910]), "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v3, "unsignedIntAtIndex:", 11));
  id v9 = [v3 stringAtIndex:1];
  [(FHTransaction *)v4 setIdentifier:v9];

  uint64_t v10 = [v3 stringAtIndex:2];
  [(FHTransaction *)v4 setTransactionServiceIdentifier:v10];

  id v11 = [v3 stringAtIndex:3];
  [(FHTransaction *)v4 setFinanceTransactionIdentifier:v11];

  uint64_t v12 = [v3 stringAtIndex:4];
  [(FHTransaction *)v4 setPaymentHash:v12];

  unint64_t v13 = [v3 stringAtIndex:5];
  [(FHTransaction *)v4 setTransactionSourceIdentifier:v13];

  id v14 = [MEMORY[0x263F087B0] defaultDatabaseAmountMultiplier];
  unint64_t v15 = [v6 decimalNumberByDividingBy:v14];
  [(FHTransaction *)v4 setAmount:v15];

  [(FHTransaction *)v4 setAmountFromDatabase:v5];
  int64_t v16 = [v3 stringAtIndex:7];
  [(FHTransaction *)v4 setCurrencyCode:v16];

  [(FHTransaction *)v4 setTransactionDate:v7];
  -[FHTransaction setTransactionStatus:](v4, "setTransactionStatus:", (int)[v3 intAtIndex:10]);
  [(FHTransaction *)v4 setTransactionStatusChangedDate:v8];
  -[FHTransaction setTransactionSource:](v4, "setTransactionSource:", (int)[v3 intAtIndex:12]);
  -[FHTransaction setCardType:](v4, "setCardType:", (int)[v3 intAtIndex:13]);
  -[FHTransaction setTransactionType:](v4, "setTransactionType:", (int)[v3 intAtIndex:14]);
  -[FHTransaction setAccountType:](v4, "setAccountType:", (int)[v3 intAtIndex:15]);
  id v17 = [v3 stringAtIndex:16];
  [(FHTransaction *)v4 setAltDSID:v17];

  double v18 = [v3 stringAtIndex:17];
  [(FHTransaction *)v4 setReceiptIdentifier:v18];

  -[FHTransaction setTransactionInternalState:](v4, "setTransactionInternalState:", (int)[v3 intAtIndex:19]);
  id v19 = [v3 stringAtIndex:20];
  [(FHTransaction *)v4 setMerchantUniqueIdentifier:v19];

  -[FHTransaction setIndustryCode:](v4, "setIndustryCode:", (int)[v3 intAtIndex:21]);
  id v20 = [v3 stringAtIndex:22];
  [(FHTransaction *)v4 setName:v20];

  uint64_t v21 = [v3 stringAtIndex:23];
  [(FHTransaction *)v4 setRawName:v21];

  -[FHTransaction setCategory:](v4, "setCategory:", (int)[v3 intAtIndex:24]);
  uint64_t v22 = [v3 stringAtIndex:25];
  [(FHTransaction *)v4 setMerchantDetailedCategory:v22];

  uint64_t v23 = [v3 stringAtIndex:26];
  [(FHTransaction *)v4 setDisplayName:v23];

  id v24 = [v3 stringAtIndex:27];
  [(FHTransaction *)v4 setStreet:v24];

  uint64_t v25 = [v3 stringAtIndex:28];
  [(FHTransaction *)v4 setCity:v25];

  uint64_t v26 = [v3 stringAtIndex:29];
  [(FHTransaction *)v4 setState:v26];

  unint64_t v27 = [v3 stringAtIndex:30];
  [(FHTransaction *)v4 setZip:v27];

  id v28 = [v3 stringAtIndex:31];
  [(FHTransaction *)v4 setCountryCode:v28];

  id v29 = [v3 stringAtIndex:32];
  [(FHTransaction *)v4 setCountry:v29];

  long long v30 = [v3 stringAtIndex:33];
  -[FHTransaction setMapsMerchantID:](v4, "setMapsMerchantID:", [v30 longLongValue]);

  -[FHTransaction setMapsMerchantResultProviderID:](v4, "setMapsMerchantResultProviderID:", [v3 intAtIndex:34]);
  double v31 = [v3 stringAtIndex:35];
  -[FHTransaction setMapsMerchantBrandID:](v4, "setMapsMerchantBrandID:", [v31 longLongValue]);

  -[FHTransaction setMapsMerchantBrandResultProviderID:](v4, "setMapsMerchantBrandResultProviderID:", [v3 intAtIndex:36]);
  BOOL v32 = [v3 stringAtIndex:43];
  [(FHTransaction *)v4 setPeerPaymentCounterpartHandle:v32];

  -[FHTransaction setPeerPaymentType:](v4, "setPeerPaymentType:", (int)[v3 intAtIndex:44]);
  id v33 = [v3 stringAtIndex:45];
  [(FHTransaction *)v4 setTransactionDescription:v33];

  -[FHTransaction setRecurring:](v4, "setRecurring:", [v3 intAtIndex:46] != 0);
  [v3 doubleAtIndex:37];
  CLLocationDegrees v35 = v34;
  [v3 doubleAtIndex:38];
  double v37 = v36;
  CLLocationCoordinate2D v38 = CLLocationCoordinate2DMake(v35, v36);
  if ((v35 != 0.0 || v37 != 0.0) && CLLocationCoordinate2DIsValid(v38))
  {
    id v39 = objc_alloc(MEMORY[0x263F00A50]);
    [v3 doubleAtIndex:40];
    double v41 = v40;
    [v3 doubleAtIndex:39];
    double v43 = v42;
    uint64_t v44 = [MEMORY[0x263EFF910] now];
    __int16 v45 = objc_msgSend(v39, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v44, v38.latitude, v38.longitude, 0.0, v41, v43);
    [(FHTransaction *)v4 setLocation:v45];
  }
  if ([v3 intAtIndex:8])
  {
    v46 = objc_msgSend(MEMORY[0x263EFFA18], "timeZoneForSecondsFromGMT:", (int)objc_msgSend(v3, "intAtIndex:", 8));
    [(FHTransaction *)v4 setTimeZone:v46];
  }
  -[FHTransaction setDisputeType:](v4, "setDisputeType:", (int)[v3 intAtIndex:41]);
  -[FHTransaction setDisputeStatus:](v4, "setDisputeStatus:", (int)[v3 intAtIndex:42]);
  uint64_t v47 = [v3 stringAtIndex:43];
  [(FHTransaction *)v4 setPeerPaymentCounterpartHandle:v47];

  -[FHTransaction setPeerPaymentType:](v4, "setPeerPaymentType:", (int)[v3 intAtIndex:44]);
  int v48 = [v3 unsignedIntAtIndex:47];
  int v49 = [v3 unsignedIntAtIndex:48];
  if (v48 >= 1)
  {
    int v50 = v49;
    if (v49 >= 1)
    {
      uint64_t v51 = (void *)[objc_alloc(MEMORY[0x263EFF910]) initWithTimeIntervalSinceReferenceDate:(double)v48];
      [(FHTransaction *)v4 setDisputeOpenDate:v51];

      BOOL v52 = (void *)[objc_alloc(MEMORY[0x263EFF910]) initWithTimeIntervalSinceReferenceDate:(double)v50];
      [(FHTransaction *)v4 setDisputeLastUpdatedDate:v52];
    }
  }

  return v4;
}

- (id)featuresForTransaction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FHDatabaseManager *)self getTransactionByIdentifier:v4];
  if ([(FHDatabaseManager *)self _hasDeterministicRealtime:v4]
    && ![v5 transactionType]
    && [v5 transactionStatus] == 1
    && [v5 accountType] == 2)
  {
    [(FHDatabaseManager *)self _computeAllAggregateFeaturesWithTransactionId:v4];
    id v6 = [(FHDatabaseManager *)self _fetch:@"select t_features, t_compound_features, locale from transaction_features where t_identifier == %@", v4];
    if ([v6 next])
    {
      uint64_t v7 = [v6 stringAtIndex:0];
      BOOL v8 = [v6 stringAtIndex:1];
      id v9 = [v6 stringAtIndex:2];
      uint64_t v10 = [(FHDatabaseManager *)self _createFeatureResponseFromFeatures:v7 compoundFeatures:v8 locale:v9 forTxnID:v4];
    }
    else
    {
      uint64_t v10 = 0;
    }
    [(FHDatabaseManager *)self closeAndUnlock:v6];
    goto LABEL_16;
  }
  if ([v5 transactionType] == 10 && objc_msgSend(v5, "accountType") == 2)
  {
    id v11 = [(FHDatabaseManager *)self _computePaymentFeaturesForTransaction:v5];
    goto LABEL_10;
  }
  id v6 = [(FHDatabaseManager *)self _getDisputeFeaturesForTransaction:v5];
  if (!v6 || [v5 transactionType] || objc_msgSend(v5, "transactionStatus")) {
    goto LABEL_15;
  }
  uint64_t v15 = [v5 accountType];

  if (v15 == 2)
  {
    id v11 = [(FHDatabaseManager *)self _computeDisputeFeaturesForTransaction:v5];
LABEL_10:
    id v6 = v11;
    if (v11)
    {
      uint64_t v12 = [v11 allObjects];
      unint64_t v13 = [v12 componentsJoinedByString:@"|"];
      uint64_t v10 = [(FHDatabaseManager *)self _createFeatureResponseFromFeatures:v13 compoundFeatures:0 locale:0 forTxnID:v4];

LABEL_16:
      goto LABEL_17;
    }
LABEL_15:
    uint64_t v10 = 0;
    goto LABEL_16;
  }
  uint64_t v10 = 0;
LABEL_17:

  return v10;
}

- (BOOL)_hasDeterministicRealtime:(id)a3
{
  id v4 = [(FHDatabaseManager *)self _fetch:@"select * from features_deterministic_realtime where t_identifier == %@", a3];
  char v5 = [v4 next];
  [(FHDatabaseManager *)self closeAndUnlock:v4];

  return v5;
}

- (id)_filterAggregateFeatureByCurrentWindow:(id)a3
{
  id v4 = a3;
  char v5 = NSStringFromSelector(sel_timeIntervalSinceReferenceDate);
  id v6 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"(SELF.%K == nil and SELF.%K == nil) or %lu - SELF.%K.%K < SELF.%K.%K - SELF.%K.%K", @"processingWindowStartDate", @"processingWindowEndDate", -[FHDatabaseManager _mostRecentTransactionDate](self, "_mostRecentTransactionDate"), @"processingWindowEndDate", v5, @"processingWindowEndDate", v5, @"processingWindowStartDate", v5);
  uint64_t v7 = [v4 filteredArrayUsingPredicate:v6];

  BOOL v8 = [v7 valueForKey:@"name"];

  return v8;
}

- (id)_createFeatureResponseFromFeatures:(id)a3 compoundFeatures:(id)a4 locale:(id)a5 forTxnID:(id)a6
{
  return [(FHDatabaseManager *)self _createFeatureResponseFromFeatures:a3 compoundFeatures:a4 locale:a5 forTxnID:a6 forApplication:@"Search"];
}

- (id)_createFeatureResponseFromFeatures:(id)a3 compoundFeatures:(id)a4 locale:(id)a5 forTxnID:(id)a6 forApplication:(id)a7
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = objc_opt_new();
  unsigned int v64 = v12;
  uint64_t v63 = [v12 componentsSeparatedByString:@"|"];
  double v18 = +[FinHealthFeatureHelper reconstructAggregateFeaturesWithProcessingWindow:](FinHealthFeatureHelper, "reconstructAggregateFeaturesWithProcessingWindow:");
  id v19 = FHApplicationToTagsMapping();
  id v20 = [v19 objectForKey:v16];
  uint64_t v21 = [v20 objectForKey:@"featuresWithIds"];

  uint64_t v22 = v18;
  uint64_t v23 = [MEMORY[0x263F08A98] predicateWithFormat:@"SELF.%K in %@", @"name", v21];
  id v24 = [v18 filteredArrayUsingPredicate:v23];
  uint64_t v62 = [(FHDatabaseManager *)self _filterAggregateFeatureByCurrentWindow:v24];
  v70[0] = MEMORY[0x263EF8330];
  v70[1] = 3221225472;
  v70[2] = __104__FHDatabaseManager__createFeatureResponseFromFeatures_compoundFeatures_locale_forTxnID_forApplication___block_invoke;
  v70[3] = &unk_2653148C8;
  id v60 = v21;
  id v71 = v60;
  id v61 = v17;
  id v72 = v61;
  id v25 = v14;
  id v73 = v25;
  uint64_t v26 = MEMORY[0x253330DA0](v70);
  if ([v13 length]) {
    (*(void (**)(uint64_t, id))(v26 + 16))(v26, v13);
  }
  uint64_t v65 = (void (**)(void, void))v26;
  if (_os_feature_enabled_impl())
  {
    id v59 = v25;
    unint64_t v27 = v23;
    id v28 = v22;
    id v29 = v13;
    id v30 = v15;
    id v31 = v16;
    BOOL v32 = FHDataDirectory();
    uint64_t v33 = [v32 stringByAppendingString:@"/inferred_merchants.txt"];

    double v34 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v58 = (void *)v33;
    if ([v34 fileExistsAtPath:v33])
    {
      inferredMerchants = self->_inferredMerchants;

      id v16 = v31;
      id v15 = v30;
      id v13 = v29;
      uint64_t v22 = v28;
      uint64_t v23 = v27;
      id v25 = v59;
      if (inferredMerchants)
      {
LABEL_9:
        if (self->_inferredMerchants)
        {
          id v53 = v24;
          objc_super v54 = v23;
          uint64_t v55 = v22;
          id v56 = v15;
          id v57 = v13;
          BOOL v52 = [(FHDatabaseManager *)self _getTransactionByIdentifier:v15];
          id v39 = [v52 displayName];
          long long v66 = 0u;
          long long v67 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          double v40 = self->_inferredMerchants;
          uint64_t v41 = [(NSArray *)v40 countByEnumeratingWithState:&v66 objects:v78 count:16];
          if (v41)
          {
            uint64_t v42 = v41;
            uint64_t v43 = *(void *)v67;
            do
            {
              for (uint64_t i = 0; i != v42; ++i)
              {
                if (*(void *)v67 != v43) {
                  objc_enumerationMutation(v40);
                }
                if (v39)
                {
                  __int16 v45 = *(void **)(*((void *)&v66 + 1) + 8 * i);
                  if ([v45 containsString:v39])
                  {
                    uint64_t v46 = [v45 rangeOfString:@"###"];
                    if (v46 != 0x7FFFFFFFFFFFFFFFLL)
                    {
                      uint64_t v47 = [v45 substringFromIndex:v46 + 3];
                      ((void (**)(void, void *))v65)[2](v65, v47);
                      int v48 = FinHealthLogObject(@"FinHealthCore");
                      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412546;
                        v75 = v45;
                        __int16 v76 = 2112;
                        v77 = v47;
                        _os_log_impl(&dword_24E029000, v48, OS_LOG_TYPE_DEBUG, "inferredMerchantEntry: %@, productsWithLabels: %@", buf, 0x16u);
                      }
                    }
                  }
                }
              }
              uint64_t v42 = [(NSArray *)v40 countByEnumeratingWithState:&v66 objects:v78 count:16];
            }
            while (v42);
          }

          id v15 = v56;
          id v13 = v57;
          uint64_t v22 = v55;
          id v24 = v53;
          uint64_t v23 = v54;
          id v25 = v59;
          int v49 = v52;
        }
        else
        {
          int v49 = FinHealthLogObject(@"FinHealthCore");
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v75 = v58;
            _os_log_impl(&dword_24E029000, v49, OS_LOG_TYPE_DEBUG, "check finalFilePath: %@", buf, 0xCu);
          }
        }

        goto LABEL_27;
      }
      double v34 = [NSString stringWithContentsOfFile:v58 encoding:4 error:0];
      CLLocationDegrees v36 = [MEMORY[0x263F08708] newlineCharacterSet];
      double v37 = [v34 componentsSeparatedByCharactersInSet:v36];
      CLLocationCoordinate2D v38 = self->_inferredMerchants;
      self->_inferredMerchants = v37;
    }
    else
    {
      id v16 = v31;
      id v15 = v30;
      id v13 = v29;
      uint64_t v22 = v28;
      uint64_t v23 = v27;
      id v25 = v59;
    }

    goto LABEL_9;
  }
LABEL_27:
  int v50 = [[FHFeaturesResponse alloc] initWithSmartFeatures:v62 aggregateFeatureswithProcessingWindow:v24 compoundFeatures:v61 transactionID:v15];

  return v50;
}

void __104__FHDatabaseManager__createFeatureResponseFromFeatures_compoundFeatures_locale_forTxnID_forApplication___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v3 = [a2 dataUsingEncoding:4];
  id v47 = 0;
  id v4 = [MEMORY[0x263F08900] JSONObjectWithData:v3 options:0 error:&v47];
  id v5 = v47;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !v5)
  {
    id v30 = v4;
    id v31 = v3;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v34 = v4;
    obuint64_t j = [v34 allKeys];
    uint64_t v6 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v44;
      uint64_t v32 = *(void *)v44;
      uint64_t v33 = a1;
      do
      {
        uint64_t v9 = 0;
        uint64_t v35 = v7;
        do
        {
          if (*(void *)v44 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v43 + 1) + 8 * v9);
          if ([*(id *)(a1 + 32) containsObject:v10])
          {
            uint64_t v38 = v9;
            id v11 = objc_opt_new();
            long long v39 = 0u;
            long long v40 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            uint64_t v37 = v10;
            id v12 = [v34 objectForKey:v10];
            uint64_t v13 = [v12 countByEnumeratingWithState:&v39 objects:v48 count:16];
            if (v13)
            {
              uint64_t v14 = v13;
              uint64_t v15 = *(void *)v40;
              do
              {
                for (uint64_t i = 0; i != v14; ++i)
                {
                  if (*(void *)v40 != v15) {
                    objc_enumerationMutation(v12);
                  }
                  id v17 = *(void **)(*((void *)&v39 + 1) + 8 * i);
                  double v18 = [v17 objectForKey:@"featureLabel"];
                  id v19 = NSString;
                  id v20 = [v17 objectForKey:@"featureRank"];
                  [v20 doubleValue];
                  uint64_t v22 = objc_msgSend(v19, "stringWithFormat:", @"%f", v21);

                  uint64_t v23 = [FHSmartCompoundFeatureRankedValue alloc];
                  id v24 = (void *)[objc_alloc(MEMORY[0x263F087B0]) initWithString:v22];
                  id v25 = [(FHSmartCompoundFeatureRankedValue *)v23 initWithLabelAndRank:v18 featureRank:v24];
                  [v11 addObject:v25];
                }
                uint64_t v14 = [v12 countByEnumeratingWithState:&v39 objects:v48 count:16];
              }
              while (v14);
            }

            a1 = v33;
            if ([v11 count])
            {
              uint64_t v26 = *(void **)(v33 + 40);
              unint64_t v27 = [FHSmartCompoundFeature alloc];
              id v28 = [MEMORY[0x263EFF8C0] arrayWithArray:v11];
              id v29 = [(FHSmartCompoundFeature *)v27 initWithCompoundFeatureKey:v37 smartCompoundFeatures:v28 locale:*(void *)(v33 + 48)];
              [v26 addObject:v29];
            }
            uint64_t v8 = v32;
            uint64_t v7 = v35;
            uint64_t v9 = v38;
          }
          ++v9;
        }
        while (v9 != v7);
        uint64_t v7 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v7);
    }

    id v4 = v30;
    id v3 = v31;
    id v5 = 0;
  }
}

- (int64_t)_mostRecentTransactionDate
{
  id v3 = (void *)[(PQLConnection *)self->_db fetch:@"select * from transactions t where t.t_type == %lu and t.t_status == %lu and t.a_type == %d order by t_date desc limit %d", 0, 1, 2, 1];
  if ([v3 next])
  {
    id v4 = [(FHDatabaseManager *)self reconstructTransaction:v3];
    id v5 = [v4 transactionDate];
    [v5 timeIntervalSinceReferenceDate];
    int64_t v7 = (uint64_t)v6;
  }
  else
  {
    int64_t v7 = -1;
  }
  [v3 close];

  return v7;
}

- (int64_t)_startingDateSmartFeatureComputation
{
  if ([(FHDatabaseManager *)self mostRecentTransactionDate] == -1) {
    return -1;
  }
  else {
    return 0;
  }
}

- (void)computeAllAggregateFeatures
{
}

- (void)_computeAllAggregateFeaturesWithTransactionId:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  double v6 = FHAmountSmartFeaturesArray();
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __67__FHDatabaseManager__computeAllAggregateFeaturesWithTransactionId___block_invoke;
  v43[3] = &unk_2653148F0;
  v43[4] = self;
  id v7 = v5;
  id v44 = v7;
  [v6 enumerateObjectsUsingBlock:v43];

  uint64_t v8 = FHDateTimeSmartFeaturesArray();
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __67__FHDatabaseManager__computeAllAggregateFeaturesWithTransactionId___block_invoke_2;
  v41[3] = &unk_2653148F0;
  v41[4] = self;
  id v9 = v7;
  id v42 = v9;
  [v8 enumerateObjectsUsingBlock:v41];

  uint64_t v10 = FHMerchantSmartFeaturesArray();
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __67__FHDatabaseManager__computeAllAggregateFeaturesWithTransactionId___block_invoke_3;
  v39[3] = &unk_2653148F0;
  v39[4] = self;
  id v11 = v9;
  id v40 = v11;
  [v10 enumerateObjectsUsingBlock:v39];

  id v12 = NSString;
  int64_t v13 = [(FHDatabaseManager *)self _startingDateSmartFeatureComputation];
  int64_t v14 = [(FHDatabaseManager *)self mostRecentTransactionDate];
  uint64_t v15 = FHMultiClassPredictionsSmartFeaturesAsString();
  id v16 = [v12 stringWithFormat:@"select f.identifier, l.smart_feature_name FHSmartFeatureAggregateType from features_predicted_realtime f inner join features_prediction_labels l on f.feature_name = l.feature_name and l.feature_predicted_class = f.feature_predicted_class where f.identifier in (select t_identifier from transactions where t_date >= %lu and t_date <= %lu and t_fh_internal_state == %lu) and f.feature_name in (%@)", v13, v14, 2, v15];
  [v11 addObject:v16];

  id v17 = objc_opt_new();
  objc_msgSend(v17, "appendFormat:", @"select simple_features.t_identifier, group_concat(FHSmartFeatureAggregateType, '");
  [v17 appendString:@"|||"];
  [v17 appendString:@"', compound_features.t_compound_feature_value simple_features from (")];
  double v18 = NSString;
  id v19 = [v11 componentsJoinedByString:@" union "];
  id v20 = [v18 stringWithString:v19];
  [v17 appendString:v20];

  [v17 appendString:@" simple_features left join features_compound_realtime compound_features on simple_features.t_identifier = compound_features.t_identifier "]);
  if (v4)
  {
    uint64_t v21 = NSString;
    uint64_t v22 = (void *)[v17 copy];
    uint64_t v23 = [v21 stringWithFormat:@"%@ where simple_features.t_identifier == '%@' limit %%d", v22, v4];

    [(FHDatabaseManager *)self _invertFeaturesForTransactions:v23];
  }
  else
  {
    uint64_t v33 = 0;
    id v34 = &v33;
    uint64_t v35 = 0x3032000000;
    CLLocationDegrees v36 = __Block_byref_object_copy_;
    uint64_t v37 = __Block_byref_object_dispose_;
    id v38 = objc_alloc_init(MEMORY[0x263EFF980]);
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __67__FHDatabaseManager__computeAllAggregateFeaturesWithTransactionId___block_invoke_209;
    v29[3] = &unk_265314918;
    uint64_t v32 = &v33;
    id v24 = v17;
    id v30 = v24;
    id v31 = self;
    [(FHDatabaseManager *)self streamTransactionsWithLimit:-1 internalState:2 onTransaction:v29];
    if ([(id)v34[5] count])
    {
      id v25 = [(id)v34[5] componentsJoinedByString:@", "];
      uint64_t v26 = NSString;
      unint64_t v27 = (void *)[v24 copy];
      id v28 = [v26 stringWithFormat:@"%@ where simple_features.t_identifier in (%@) GROUP BY simple_features.t_identifier limit %%d", v27, v25];

      [(FHDatabaseManager *)self _invertFeaturesForTransactions:v28];
    }

    _Block_object_dispose(&v33, 8);
  }
}

void __67__FHDatabaseManager__computeAllAggregateFeaturesWithTransactionId___block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "getFHSmartFeatureByAmountType:");
  id v4 = [v3 comparator];
  uint64_t v5 = [v3 amount];
  double v6 = [v3 processingWindowStartDate];
  [v6 timeIntervalSinceReferenceDate];
  double v8 = v7;

  id v9 = [v3 processingWindowEndDate];
  [v9 timeIntervalSinceReferenceDate];
  double v11 = v10;

  if (v4)
  {
    id v12 = (void *)MEMORY[0x253330BB0]();
    int64_t v13 = *(void **)(a1 + 40);
    int64_t v14 = [NSString stringWithFormat:@"select t_identifier, '%@,%lu,%lu' FHSmartFeatureAggregateType from transactions where t_amount %@ %lu", v15, (unint64_t)v8, (unint64_t)v11, v4, v5];
    [v13 addObject:v14];
  }
}

void __67__FHDatabaseManager__computeAllAggregateFeaturesWithTransactionId___block_invoke_2(uint64_t a1, void *a2)
{
  id v18 = a2;
  id v3 = [*(id *)(a1 + 32) getFHSmartFeatureByDateTimeType:v18];
  id v4 = [v3 startDate];
  [v4 timeIntervalSinceReferenceDate];
  unint64_t v6 = (unint64_t)v5;

  double v7 = [v3 endDate];
  [v7 timeIntervalSinceReferenceDate];
  unint64_t v9 = (unint64_t)v8;

  double v10 = [v3 processingWindowStartDate];
  [v10 timeIntervalSinceReferenceDate];
  unint64_t v12 = (unint64_t)v11;

  int64_t v13 = [v3 processingWindowEndDate];
  [v13 timeIntervalSinceReferenceDate];
  unint64_t v15 = (unint64_t)v14;

  id v16 = (void *)MEMORY[0x253330BB0]();
  id v17 = [NSString stringWithFormat:@"select t_identifier, '%@,%lu,%lu' FHSmartFeatureAggregateType from transactions where t_date >= %lu and t_date <= %lu and a_type == %d", v18, v12, v15, v6, v9, 2];
  [*(id *)(a1 + 40) addObject:v17];
}

void __67__FHDatabaseManager__computeAllAggregateFeaturesWithTransactionId___block_invoke_3(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [*(id *)(a1 + 32) getFHSmartFeatureByMerchantType:v14];
  id v4 = [v3 processingWindowStartDate];
  [v4 timeIntervalSinceReferenceDate];
  unint64_t v6 = (unint64_t)v5;

  double v7 = [v3 processingWindowEndDate];
  [v7 timeIntervalSinceReferenceDate];
  unint64_t v9 = (unint64_t)v8;

  double v10 = (void *)MEMORY[0x253330BB0]();
  double v11 = NSString;
  unint64_t v12 = [v3 merchantDisplayName];
  int64_t v13 = [v11 stringWithFormat:@"select t_identifier, '%@,%lu,%lu' FHSmartFeatureAggregateType from transactions where m_displayname == \"%@\"", v14, v6, v9, v12];

  [*(id *)(a1 + 40) addObject:v13];
}

void __67__FHDatabaseManager__computeAllAggregateFeaturesWithTransactionId___block_invoke_209(uint64_t a1, void *a2)
{
  id v12 = a2;
  if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count] == 5)
  {
    id v3 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) componentsJoinedByString:@", "];
    id v4 = NSString;
    double v5 = (void *)[*(id *)(a1 + 32) copy];
    unint64_t v6 = [v4 stringWithFormat:@"%@ where simple_features.t_identifier in (%@) GROUP BY simple_features.t_identifier limit %%d", v5, v3];

    [*(id *)(a1 + 40) _invertFeaturesForTransactions:v6];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) removeAllObjects];
  }
  if (![v12 transactionType]
    && [v12 transactionStatus] == 1
    && [v12 accountType] == 2)
  {
    double v7 = (void *)MEMORY[0x253330BB0]();
    double v8 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    unint64_t v9 = NSString;
    double v10 = [v12 identifier];
    double v11 = [v9 stringWithFormat:@"'%@'", v10];
    [v8 addObject:v11];
  }
}

- (void)_invertFeaturesForTransactions:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = -[FHDatabaseManager _lockFreeFetch:](self, "_lockFreeFetch:", v4, -1);
  if ([v5 next])
  {
    while (1)
    {
      unint64_t v6 = (void *)MEMORY[0x253330BB0]();
      double v7 = [v5 stringAtIndex:0];
      double v8 = [(FHDatabaseManager *)self _getTransactionByIdentifier:v7];
      if ([v8 transactionType]
        || [v8 transactionStatus] != 1
        || [v8 accountType] != 2)
      {
        goto LABEL_18;
      }
      context = (void *)MEMORY[0x253330BB0]();
      unint64_t v9 = (void *)MEMORY[0x263EFFA08];
      double v10 = [v5 stringAtIndex:1];
      double v11 = [v10 componentsSeparatedByString:@"|||"];
      id v12 = [v9 setWithArray:v11];

      int64_t v13 = [(FHDatabaseManager *)self _getDisputeFeaturesForTransaction:v8];
      if (v13)
      {
        uint64_t v14 = [v12 setByAddingObjectsFromSet:v13];

        id v12 = (void *)v14;
      }
      unint64_t v15 = [v5 stringAtIndex:2];
      if (v7)
      {
        if ([v12 count] || v15) {
          break;
        }
      }
LABEL_17:

LABEL_18:

      if (([v5 next] & 1) == 0) {
        goto LABEL_19;
      }
    }
    id v24 = v4;
    id v16 = [v8 financeTransactionIdentifier];
    BOOL v17 = [(FHDatabaseManager *)self _insertOrUpdateTransactionFeatures:v12 compoundFeatures:v15 transactionID:v7 financeTransactionID:v16];

    id v18 = FinHealthLogObject(@"FinHealthCore");
    id v19 = v18;
    if (v17)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        id v20 = v19;
        os_log_type_t v21 = OS_LOG_TYPE_DEBUG;
        uint64_t v22 = "_insertOrUpdateTransactionFeatures success";
        uint32_t v23 = 2;
LABEL_15:
        _os_log_impl(&dword_24E029000, v20, v21, v22, buf, v23);
      }
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v27 = v7;
      id v20 = v19;
      os_log_type_t v21 = OS_LOG_TYPE_ERROR;
      uint64_t v22 = "_insertOrUpdateTransactionFeatures fails for transactionID %@";
      uint32_t v23 = 12;
      goto LABEL_15;
    }

    id v4 = v24;
    goto LABEL_17;
  }
LABEL_19:
  [v5 close];
}

- (void)clearCardProcessingHistory
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  v2 = [FHDatabaseEntity alloc];
  id v3 = objc_loadWeakRetained(&location);
  id v4 = [(FHDatabaseEntity *)v2 initWithEntity:@"fh_processing_history" databaseManager:v3];

  double v5 = +[FHDatabaseClauseFromBuilder initWithBuilder:&__block_literal_global_222];
  BOOL v6 = [(FHDatabaseEntity *)v4 clearDataWithClauseBuilder:v5];
  double v7 = FinHealthLogObject(@"FinHealthClient");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    double v8 = @"Failed to perform";
    if (v6) {
      double v8 = @"Successfully performed operation";
    }
    *(_DWORD *)buf = 138412546;
    double v11 = v8;
    __int16 v12 = 2112;
    int64_t v13 = @"FHSmartFeatureCompoundTypePointsOfInterest";
    _os_log_impl(&dword_24E029000, v7, OS_LOG_TYPE_DEBUG, "%@: delete all card processing history records of feature %@", buf, 0x16u);
  }

  objc_destroyWeak(&location);
}

uint64_t __47__FHDatabaseManager_clearCardProcessingHistory__block_invoke(uint64_t a1, void *a2)
{
  return [a2 addStringClause:@"==" fieldName:@"fh_processing_history.feature_name" expression:@"FHSmartFeatureCompoundTypePointsOfInterest"];
}

- (BOOL)_insertOrUpdateTransactionFeatures:(id)a3 compoundFeatures:(id)a4 transactionID:(id)a5 financeTransactionID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v12) {
    goto LABEL_13;
  }
  id v33 = v11;
  uint64_t v14 = [v10 allObjects];
  unint64_t v15 = [v14 componentsJoinedByString:@"|"];

  id v16 = (void *)[(PQLConnection *)self->_db fetch:@"select t_features, t_compound_features, locale from transaction_features where t_identifier == %@", v12];
  id v34 = self;
  if (![v16 next])
  {
    uint64_t v26 = v33;
    goto LABEL_11;
  }
  id v32 = v11;
  BOOL v17 = (void *)MEMORY[0x263EFF9C0];
  id v18 = [v16 stringAtIndex:0];
  id v19 = [v18 componentsSeparatedByString:@"|"];
  id v20 = [v17 setWithArray:v19];

  os_log_type_t v21 = FHRepeatingAggregateFeatureSet();
  if (![v20 intersectsSet:v21]) {
    goto LABEL_6;
  }
  uint64_t v22 = FHRepeatingAggregateFeatureSet();
  int v23 = [v10 intersectsSet:v22];

  if (v23)
  {
    os_log_type_t v21 = FHRepeatingAggregateFeatureSet();
    [v20 minusSet:v21];
LABEL_6:
  }
  [v20 unionSet:v10];
  id v24 = [v20 allObjects];
  uint64_t v25 = [v24 componentsJoinedByString:@"|"];

  uint64_t v26 = v33;
  if (!v33)
  {
    uint64_t v26 = [v16 stringAtIndex:1];
  }

  unint64_t v15 = (void *)v25;
  id v11 = v32;
LABEL_11:
  [v16 close];
  unint64_t v27 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
  uint64_t v28 = [v27 localeIdentifier];
  BOOL v29 = [(FHDatabaseManager *)v34 _execute:@"insert or replace into transaction_features (t_identifier, t_features, t_compound_features, locale, t_mark_for_delete, t_finance_transaction_id) values (%@, %@, %@, %@, %d, %@)", v12, v15, v26, v28, 0, v13];

  if (!v29)
  {
LABEL_13:
    BOOL v30 = 0;
    goto LABEL_14;
  }
  BOOL v30 = 1;
LABEL_14:

  return v30;
}

- (id)getTransactionSmartFeaturesForApplication:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = objc_opt_new();
  BOOL v6 = FHApplications();
  int v7 = [v6 containsObject:v4];

  if (v7)
  {
    double v8 = FHApplicationToTagsMapping();
    unint64_t v9 = [v8 objectForKey:v4];
    id v10 = [v9 objectForKey:@"featuresWithIds"];

    unint64_t v27 = @"FinHealthCore";
    id v11 = FinHealthLogObject(@"FinHealthCore");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      id v38 = "-[FHDatabaseManager getTransactionSmartFeaturesForApplication:]";
      __int16 v39 = 2112;
      id v40 = v4;
      __int16 v41 = 2112;
      uint64_t v42 = (uint64_t)v10;
      _os_log_impl(&dword_24E029000, v11, OS_LOG_TYPE_DEBUG, "%s Application[%@] is asking for tags with transaction ids: %@", buf, 0x20u);
    }

    id v12 = (void *)MEMORY[0x263F08A98];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __63__FHDatabaseManager_getTransactionSmartFeaturesForApplication___block_invoke;
    v34[3] = &unk_265314960;
    id v28 = v10;
    id v29 = v4;
    id v35 = v28;
    id v13 = v4;
    id v36 = v13;
    BOOL v30 = [v12 predicateWithBlock:v34];
    if ([v13 isEqual:@"Search"]) {
      self->_unint64_t transactionFeaturesOffset = 0;
    }
    [v5 addObjectsFromArray:self->_transactionFeaturesCache];
    [(NSMutableArray *)self->_transactionFeaturesCache removeAllObjects];
    uint64_t v14 = 0;
    while (1)
    {
      unint64_t v15 = [v5 count];
      if (v15 >= 0x64) {
        break;
      }
      char v16 = [v13 isEqualToString:@"Search"];
      unint64_t transactionFeaturesOffset = self->_transactionFeaturesOffset;
      if (v16) {
        [NSString stringWithFormat:@"select t_identifier, t_features, t_compound_features, locale from transaction_features where t_mark_for_delete = %d limit %d offset %d", 0, 100, transactionFeaturesOffset, v27, v28];
      }
      else {
      id v18 = [NSString stringWithFormat:@"select t_identifier, t_features, t_compound_features, locale from transaction_features limit %d offset %d", 100, transactionFeaturesOffset, v26, v27, v28];
      }

      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __63__FHDatabaseManager_getTransactionSmartFeaturesForApplication___block_invoke_2;
      v31[3] = &unk_265314988;
      v31[4] = self;
      id v32 = v13;
      id v33 = v5;
      unint64_t v19 = [(FHDatabaseManager *)self streamGenericSQLFetch:v31 predicate:v30 sqlFetchQuery:v18];
      self->_transactionFeaturesOffset += v19;

      uint64_t v14 = v18;
      if (!v19) {
        goto LABEL_15;
      }
    }
    id v18 = v14;
LABEL_15:
    os_log_type_t v21 = FinHealthLogObject(v27);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v22 = [v5 count];
      unint64_t v23 = self->_transactionFeaturesOffset;
      id v24 = @"True";
      *(_DWORD *)buf = 136316418;
      id v38 = "-[FHDatabaseManager getTransactionSmartFeaturesForApplication:]";
      if (v15 < 0x64) {
        id v24 = @"False";
      }
      __int16 v39 = 2112;
      id v40 = v13;
      __int16 v41 = 2048;
      uint64_t v42 = v22;
      __int16 v43 = 2112;
      id v44 = v24;
      __int16 v45 = 2048;
      unint64_t v46 = v23;
      __int16 v47 = 2112;
      int v48 = v5;
      _os_log_impl(&dword_24E029000, v21, OS_LOG_TYPE_DEBUG, "%s Transaction features for Application[%@] count[%lu] moreComing[%@] scanOffset[%lu] :%@", buf, 0x3Eu);
    }

    if ([v5 count])
    {
      id v20 = [MEMORY[0x263EFF8C0] arrayWithArray:v5];
    }
    else
    {
      id v20 = 0;
    }
    id v4 = v29;
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

uint64_t __63__FHDatabaseManager_getTransactionSmartFeaturesForApplication___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    uint64_t v15 = a1;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * v8);
        id v10 = [v3 objectForKey:@"t_features"];
        if ([v10 containsString:v9])
        {

LABEL_13:
          uint64_t v13 = 1;
          goto LABEL_14;
        }
        id v11 = [v3 objectForKey:@"t_compound_features"];
        char v12 = [v11 containsString:v9];

        if (v12) {
          goto LABEL_13;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      a1 = v15;
      if (v6) {
        continue;
      }
      break;
    }
  }

  if ([*(id *)(a1 + 40) isEqualToString:@"Search"])
  {
    id v4 = [v3 objectForKey:@"t_features"];
    uint64_t v13 = [v4 isEqualToString:&stru_27001CD40];
LABEL_14:
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

void __63__FHDatabaseManager_getTransactionSmartFeaturesForApplication___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v4 objectAtIndexedSubscript:1];
  uint64_t v6 = [v5 stringValue];
  uint64_t v7 = [v4 objectAtIndexedSubscript:2];
  uint64_t v8 = [v7 stringValue];
  uint64_t v9 = [v4 objectAtIndexedSubscript:3];
  id v10 = [v9 stringValue];
  id v11 = [v4 objectAtIndexedSubscript:0];

  char v12 = [v11 stringValue];
  id v14 = [v3 _createFeatureResponseFromFeatures:v6 compoundFeatures:v8 locale:v10 forTxnID:v12 forApplication:*(void *)(a1 + 40)];

  uint64_t v13 = (id *)(a1 + 48);
  if ((unint64_t)[*(id *)(a1 + 48) count] >= 0x64) {
    uint64_t v13 = (id *)(*(void *)(a1 + 32) + 104);
  }
  [*v13 addObject:v14];
}

- (BOOL)updateDeleteFlagInTransactionFeatures:(unint64_t)a3 forID:(id)a4
{
  return [(FHDatabaseManager *)self _execute:@"update transaction_features set t_mark_for_delete = %d where t_identifier == %@", a3, a4];
}

- (BOOL)deleteAllMarkedTransactionFeatures
{
  objc_initWeak(&location, self);
  v2 = [FHDatabaseEntity alloc];
  id v3 = objc_loadWeakRetained(&location);
  id v4 = [(FHDatabaseEntity *)v2 initWithEntity:@"transaction_features" databaseManager:v3];

  uint64_t v5 = +[FHDatabaseClauseFromBuilder initWithBuilder:&__block_literal_global_242];
  BOOL v6 = [(FHDatabaseEntity *)v4 clearDataWithClauseBuilder:v5];

  objc_destroyWeak(&location);
  return v6;
}

uint64_t __55__FHDatabaseManager_deleteAllMarkedTransactionFeatures__block_invoke(uint64_t a1, void *a2)
{
  return [a2 addIntegerClause:@"==" fieldName:@"transaction_features.t_mark_for_delete" expression:1];
}

- (BOOL)deleteAllRecordsInTransactionFeatures:(id)a3
{
  return [(FHDatabaseManager *)self deleteWithSQL:@"delete from transaction_features where t_identifier in (select t_identifier from transactions t where t.t_source_identifier == %@)", a3];
}

- (BOOL)deleteAllRecordsFromTransactionFeatures
{
  v2 = [[FHDatabaseEntity alloc] initWithEntity:@"transaction_features" databaseManager:self];
  BOOL v3 = [(FHDatabaseEntity *)v2 clearData];

  return v3;
}

- (BOOL)deleteTaggedButDeletedEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[FHDatabaseEntity alloc] initWithEntity:@"features_events" databaseManager:self];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __49__FHDatabaseManager_deleteTaggedButDeletedEvent___block_invoke;
  v10[3] = &unk_265314850;
  id v11 = v4;
  id v6 = v4;
  uint64_t v7 = +[FHDatabaseClauseFromBuilder initWithBuilder:v10];
  BOOL v8 = [(FHDatabaseEntity *)v5 clearDataWithClauseBuilder:v7];

  return v8;
}

uint64_t __49__FHDatabaseManager_deleteTaggedButDeletedEvent___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addStringClause:@"==" fieldName:@"features_events.e_identifier" expression:*(void *)(a1 + 32)];
}

- (BOOL)deleteTaggedEventsInTimeRange:(id)a3 startDate:(id)a4 comparatorOfEndDate:(id)a5 endDate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [[FHDatabaseEntity alloc] initWithEntity:@"features_events" databaseManager:self];
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  id v24 = __89__FHDatabaseManager_deleteTaggedEventsInTimeRange_startDate_comparatorOfEndDate_endDate___block_invoke;
  uint64_t v25 = &unk_2653149B0;
  id v26 = v10;
  id v27 = v11;
  id v28 = v12;
  id v29 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  long long v19 = +[FHDatabaseClauseFromBuilder initWithBuilder:&v22];
  BOOL v20 = -[FHDatabaseEntity clearDataWithClauseBuilder:](v14, "clearDataWithClauseBuilder:", v19, v22, v23, v24, v25);

  return v20;
}

void __89__FHDatabaseManager_deleteTaggedEventsInTimeRange_startDate_comparatorOfEndDate_endDate___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  id v5 = a2;
  [v5 addDateClause:v3 fieldName:@"features_events.start_date" expression:v4];
  [v5 addDateClause:a1[6] fieldName:@"features_events.end_date" expression:a1[7]];
}

- (void)computeRecurringClassesWithMerchantCounts:(id)a3 peerPaymentCounts:(id)a4 merchantDetailedCategoryCounts:(id)a5
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = FinHealthLogObject(@"FinHealthCore");
  id v12 = FinHealthLogObject(@"FinHealthCore");
  os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);

  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_24E029000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "processAggregateFeatures:computeRecurringHistograms", "", buf, 2u);
  }

  id v14 = FinHealthLogObject(@"FinHealthCore");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24E029000, v14, OS_LOG_TYPE_INFO, "BEGIN \"processAggregateFeatures:computeRecurringHistograms\"", buf, 2u);
  }

  *(void *)buf = 0;
  v83 = buf;
  uint64_t v84 = 0x3032000000;
  v85 = __Block_byref_object_copy_;
  v86 = __Block_byref_object_dispose_;
  v87 = self->_decimalRmseThreshold;
  v80[0] = 0;
  v80[1] = v80;
  v80[2] = 0x3032000000;
  v80[3] = __Block_byref_object_copy_;
  v80[4] = __Block_byref_object_dispose_;
  v81 = self->_secondsInDay;
  v79[0] = MEMORY[0x263EF8330];
  v79[1] = 3221225472;
  v79[2] = __112__FHDatabaseManager_computeRecurringClassesWithMerchantCounts_peerPaymentCounts_merchantDetailedCategoryCounts___block_invoke;
  v79[3] = &unk_265314A48;
  v79[5] = buf;
  v79[6] = v80;
  v79[4] = self;
  __int16 v41 = (void (**)(void, void, void))MEMORY[0x253330DA0](v79);
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x3032000000;
  __int16 v76 = __Block_byref_object_copy_;
  v77 = __Block_byref_object_dispose_;
  id v78 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v67 = 0;
  long long v68 = &v67;
  uint64_t v69 = 0x3032000000;
  BOOL v70 = __Block_byref_object_copy_;
  id v71 = __Block_byref_object_dispose_;
  id v72 = (id)objc_opt_new();
  uint64_t v61 = 0;
  uint64_t v62 = &v61;
  uint64_t v63 = 0x3032000000;
  unsigned int v64 = __Block_byref_object_copy_;
  uint64_t v65 = __Block_byref_object_dispose_;
  id v66 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  __int16 v39 = objc_opt_new();
  uint64_t v55 = 0;
  id v56 = &v55;
  uint64_t v57 = 0x3032000000;
  uint64_t v58 = __Block_byref_object_copy_;
  id v59 = __Block_byref_object_dispose_;
  id v60 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v40 = objc_opt_new();
  id v38 = [v8 keysOfEntriesPassingTest:&__block_literal_global_266];
  id v15 = [v38 allObjects];
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __112__FHDatabaseManager_computeRecurringClassesWithMerchantCounts_peerPaymentCounts_merchantDetailedCategoryCounts___block_invoke_2_267;
  v46[3] = &unk_265314A90;
  v46[4] = self;
  id v35 = v9;
  id v47 = v35;
  uint64_t v51 = &v73;
  id v37 = v15;
  id v48 = v37;
  BOOL v52 = &v61;
  id v36 = v10;
  id v49 = v36;
  id v53 = &v55;
  objc_super v54 = &v67;
  id v34 = v8;
  id v50 = v34;
  [(FHDatabaseManager *)self streamTransactionsWithLimit:-1 internalState:2 onTransaction:v46];
  v41[2](v41, v74[5], v68[5]);
  [(id)v74[5] removeAllObjects];
  if ([(id)v62[5] count])
  {
    ((void (**)(void, uint64_t, void *))v41)[2](v41, v62[5], v39);
    [(id)v62[5] removeAllObjects];
  }
  ((void (**)(void, uint64_t, void *))v41)[2](v41, v56[5], v40);
  [(id)v56[5] removeAllObjects];
  [(FHDatabaseManager *)self _getTransactionsMarkedForRecurrChange];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [v16 countByEnumeratingWithState:&v42 objects:v90 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v43 != v18) {
          objc_enumerationMutation(v16);
        }
        uint64_t v20 = *(void *)(*((void *)&v42 + 1) + 8 * i);
        uint64_t v21 = objc_alloc_init(FHRealtimeFeaturesResponse);
        id v22 = objc_alloc(MEMORY[0x263EFF9A0]);
        uint64_t v23 = [(FHDatabaseManager *)self compoundFeaturesForTransaction:v20];
        id v24 = (void *)[v22 initWithDictionary:v23];

        uint64_t v25 = [v16 objectForKey:v20];
        [v24 setObject:v25 forKey:@"FHSmartFeatureCompoundTypeRecurringChange"];
        [(FHRealtimeFeaturesResponse *)v21 setSmartCompoundFeatures:v24];
        if ([(FHDatabaseManager *)self insertFeaturesCompoundRealtime:v20 realtimeFeatures:v21])
        {
          id v26 = FinHealthLogObject(@"FinHealthCore");
          if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_19;
          }
          *(_DWORD *)int v88 = 138412290;
          v89 = v25;
          id v27 = v26;
          os_log_type_t v28 = OS_LOG_TYPE_DEBUG;
          id v29 = "insertSuccess: smartFeatureValues: %@";
        }
        else
        {
          id v26 = FinHealthLogObject(@"FinHealthCore");
          if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            goto LABEL_19;
          }
          *(_DWORD *)int v88 = 138412290;
          v89 = v25;
          id v27 = v26;
          os_log_type_t v28 = OS_LOG_TYPE_ERROR;
          id v29 = "insertFailure smartFeatureValues: %@";
        }
        _os_log_impl(&dword_24E029000, v27, v28, v29, v88, 0xCu);
LABEL_19:
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v42 objects:v90 count:16];
    }
    while (v17);
  }

  BOOL v30 = FinHealthLogObject(@"FinHealthCore");
  id v31 = FinHealthLogObject(@"FinHealthCore");
  os_signpost_id_t v32 = os_signpost_id_make_with_pointer(v31, self);

  if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    *(_WORD *)int v88 = 0;
    _os_signpost_emit_with_name_impl(&dword_24E029000, v30, OS_SIGNPOST_INTERVAL_END, v32, "processAggregateFeatures:computeRecurringHistograms", "", v88, 2u);
  }

  id v33 = FinHealthLogObject(@"FinHealthCore");
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v88 = 0;
    _os_log_impl(&dword_24E029000, v33, OS_LOG_TYPE_INFO, "END \"processAggregateFeatures:computeRecurringHistograms\"", v88, 2u);
  }

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v61, 8);

  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v73, 8);

  _Block_object_dispose(v80, 8);
  _Block_object_dispose(buf, 8);
}

void __112__FHDatabaseManager_computeRecurringClassesWithMerchantCounts_peerPaymentCounts_merchantDetailedCategoryCounts___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __112__FHDatabaseManager_computeRecurringClassesWithMerchantCounts_peerPaymentCounts_merchantDetailedCategoryCounts___block_invoke_2;
  v7[3] = &unk_265314A20;
  long long v9 = *(_OWORD *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v5;
  [a2 enumerateKeysAndObjectsUsingBlock:v7];
}

void __112__FHDatabaseManager_computeRecurringClassesWithMerchantCounts_peerPaymentCounts_merchantDetailedCategoryCounts___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [v6 sortUsingComparator:&__block_literal_global_257];
  if ((unint64_t)[v6 count] >= 3)
  {
    uint64_t v7 = (void *)MEMORY[0x253330BB0]();
    id v8 = (void *)[v6 copy];
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __112__FHDatabaseManager_computeRecurringClassesWithMerchantCounts_peerPaymentCounts_merchantDetailedCategoryCounts___block_invoke_4;
    v13[3] = &unk_2653149F8;
    id v11 = v6;
    uint64_t v12 = *(void *)(a1 + 32);
    id v14 = v11;
    uint64_t v15 = v12;
    id v16 = v5;
    id v17 = *(id *)(a1 + 40);
    +[FinHealthRecurringHelper rootMeanSquareErrorForSlidingWindowWithCompletion:v8 slidingWindowWidth:3 decimalThreshold:v9 decimalDenominator:v10 decimalKeyEntry:@"transactionDate" completion:v13];
  }
}

uint64_t __112__FHDatabaseManager_computeRecurringClassesWithMerchantCounts_peerPaymentCounts_merchantDetailedCategoryCounts___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v5 objectForKey:@"repeatingClass"];
  LODWORD(a2) = [v6 intValue];

  uint64_t v7 = [v4 objectForKey:@"repeatingClass"];
  LODWORD(v6) = [v7 intValue];

  id v8 = [v5 objectForKey:@"transactionDate"];

  [v8 doubleValue];
  double v10 = v9;

  id v11 = [v4 objectForKey:@"transactionDate"];

  [v11 doubleValue];
  double v13 = v12;

  double v14 = (double)((int)a2 - (uint64_t)(int)v6);
  if (a2 == v6) {
    return (uint64_t)(v13 - v10);
  }
  return (uint64_t)v14;
}

void __112__FHDatabaseManager_computeRecurringClassesWithMerchantCounts_peerPaymentCounts_merchantDetailedCategoryCounts___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v20 = a3;
  uint64_t v5 = 3;
  do
  {
    id v6 = [*(id *)(a1 + 32) objectAtIndex:a2];
    context = (void *)MEMORY[0x253330BB0]();
    uint64_t v7 = [v6 objectForKey:@"identifier"];
    id v8 = [v6 objectForKey:@"transactionDate"];
    [v8 doubleValue];
    double v10 = v9;

    id v11 = [v6 objectForKey:@"repeatingClass"];
    int v12 = [v11 intValue];
    double v13 = *(void **)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 48);
    [v20 doubleValue];
    if (([v13 _execute:@"insert or replace into features_heuristics (t_identifier, t_heuristics_identifier, t_heuristics_value, t_heuristics_score) values (%@, %@, %d, %f)", v7, v14, (uint64_t)v10, v15] & 1) == 0)
    {
      id v16 = FinHealthLogObject(@"FinHealthCore");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = v7;
        _os_log_impl(&dword_24E029000, v16, OS_LOG_TYPE_ERROR, "FHInsertOrUpdateIntoFeaturesHeuristics failed for %@", buf, 0xCu);
      }
    }
    uint64_t v17 = v12;
    uint64_t v18 = objc_alloc_init(FHRealtimeFeaturesResponse);
    [(FHRealtimeFeaturesResponse *)v18 setRepeatingPatternClass:v17];
    if (([*(id *)(a1 + 40) insertFeaturesPredictedRealtime:v7 realtimeFeatures:v18] & 1) == 0)
    {
      long long v19 = FinHealthLogObject(@"FinHealthCore");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = v7;
        _os_log_impl(&dword_24E029000, v19, OS_LOG_TYPE_ERROR, "FHInsertIntoFeaturesPredictedRealTime failed for %@", buf, 0xCu);
      }
    }
    [*(id *)(a1 + 56) addObject:v7];

    ++a2;
    --v5;
  }
  while (v5);
}

BOOL __112__FHDatabaseManager_computeRecurringClassesWithMerchantCounts_peerPaymentCounts_merchantDetailedCategoryCounts___block_invoke_263(uint64_t a1, uint64_t a2, void *a3)
{
  return (unint64_t)[a3 integerValue] >= 3;
}

void __112__FHDatabaseManager_computeRecurringClassesWithMerchantCounts_peerPaymentCounts_merchantDetailedCategoryCounts___block_invoke_2_267(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x253330BB0]();
  [*(id *)(a1 + 32) populateRecurringClassHistogramsWithPeerPaymentsCounts:*(void *)(a1 + 40) histogram:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) transaction:v3];
  uint64_t v5 = *(void **)(a1 + 48);
  id v6 = [v3 displayName];
  LODWORD(v5) = [v5 containsObject:v6];

  if (v5) {
    [*(id *)(a1 + 32) populateMerchantRecurringClassHistograms:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) transaction:v3];
  }
  if (_os_feature_enabled_impl())
  {
    uint64_t v7 = (void *)MEMORY[0x253330BB0]();
    [*(id *)(a1 + 32) populateRecurringClassHistogramsWithMerchantDetailedCategoryCounts:*(void *)(a1 + 56) histogram:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) transaction:v3];
  }
  uint64_t v8 = [v3 displayName];
  if (v8)
  {
    double v9 = (void *)v8;
    double v10 = [v3 displayName];
    if ([v10 length] && !objc_msgSend(v3, "transactionType"))
    {
      uint64_t v11 = [v3 transactionStatus];

      if (v11 == 1)
      {
        int v12 = (void *)MEMORY[0x253330BB0]();
        double v13 = [v3 identifier];
        if (([*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) containsObject:v13] & 1) == 0)
        {
          uint64_t v14 = [v3 displayName];
          uint64_t v15 = [*(id *)(a1 + 64) objectForKey:v14];
          if ((unint64_t)[v15 integerValue] >= 3) {
            uint64_t v16 = 1;
          }
          else {
            uint64_t v16 = 2;
          }

          uint64_t v17 = objc_alloc_init(FHRealtimeFeaturesResponse);
          [(FHRealtimeFeaturesResponse *)v17 setRepeatingPatternClass:v16];
          if (([*(id *)(a1 + 32) insertFeaturesPredictedRealtime:v13 realtimeFeatures:v17] & 1) == 0)
          {
            uint64_t v18 = FinHealthLogObject(@"FinHealthCore");
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              int v19 = 138412290;
              id v20 = v13;
              _os_log_impl(&dword_24E029000, v18, OS_LOG_TYPE_ERROR, "FHInsertIntoFeaturesPredictedRealTime failed for %@", (uint8_t *)&v19, 0xCu);
            }
          }
        }
      }
    }
    else
    {
    }
  }
}

- (void)populateRecurringClassHistogramsWithPeerPaymentsCounts:(id)a3 histogram:(id)a4 transaction:(id)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  double v10 = [v9 peerPaymentCounterpartHandle];
  if ([v9 transactionType] == 3)
  {
    uint64_t v11 = [v7 objectForKey:v10];
    if ((unint64_t)[v11 integerValue] >= 3) {
      int v12 = [v9 recurring] ^ 1;
    }
    else {
      int v12 = 0;
    }
  }
  else
  {
    int v12 = 0;
  }
  BOOL v13 = [v9 accountType] == 1 && objc_msgSend(v9, "transactionType") == 6;
  if ((v12 | v13) == 1)
  {
    id v31 = v10;
    id v32 = v7;
    context = (void *)MEMORY[0x253330BB0]();
    +[FinHealthRecurringHelper histogramKeysForTransaction:v9];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v34 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v38 != v34) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          uint64_t v18 = [v17 featureLabel];
          int v19 = [v8 objectForKey:v18];
          id v20 = [v9 transactionDate];
          [v20 timeIntervalSinceReferenceDate];
          double v22 = v21;

          uint64_t v23 = (void *)MEMORY[0x263F087B0];
          uint64_t v24 = [NSNumber numberWithDouble:v22];
          uint64_t v25 = v24;
          if (v24)
          {
            [v24 decimalValue];
          }
          else
          {
            v35[0] = 0;
            v35[1] = 0;
            int v36 = 0;
          }
          id v26 = [v23 decimalNumberWithDecimal:v35];

          v42[0] = v26;
          v41[0] = @"transactionDate";
          v41[1] = @"identifier";
          id v27 = [v9 identifier];
          v42[1] = v27;
          v41[2] = @"repeatingClass";
          os_log_type_t v28 = [v17 featureRank];
          v42[2] = v28;
          id v29 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:3];

          if (v19) {
            [v19 addObject:v29];
          }
          else {
            int v19 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v29, 0);
          }
          [v8 setValue:v19 forKey:v18];
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
      }
      while (v15);
    }

    double v10 = v31;
    id v7 = v32;
  }
}

- (void)populateMerchantRecurringClassHistograms:(id)a3 transaction:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x253330BB0]();
  id v8 = [v6 displayName];
  id v9 = v8;
  if (v8
    && [v8 length]
    && ![v6 transactionType]
    && [v6 transactionStatus] == 1
    && ![v6 transactionSource]
    && ([v6 cardType] == 7 || objc_msgSend(v6, "cardType") == 6))
  {
    id v27 = v9;
    os_log_type_t v28 = v7;
    context = (void *)MEMORY[0x253330BB0]();
    +[FinHealthRecurringHelper histogramKeysForTransaction:v6];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v30 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v34 != v30) {
            objc_enumerationMutation(obj);
          }
          BOOL v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          uint64_t v14 = [v13 featureLabel];
          uint64_t v15 = [v5 objectForKey:v14];
          uint64_t v16 = [v6 transactionDate];
          [v16 timeIntervalSinceReferenceDate];
          double v18 = v17;

          int v19 = (void *)MEMORY[0x263F087B0];
          id v20 = [NSNumber numberWithDouble:v18];
          double v21 = v20;
          if (v20)
          {
            [v20 decimalValue];
          }
          else
          {
            v31[0] = 0;
            v31[1] = 0;
            int v32 = 0;
          }
          double v22 = [v19 decimalNumberWithDecimal:v31];

          v38[0] = v22;
          v37[0] = @"transactionDate";
          v37[1] = @"identifier";
          uint64_t v23 = [v6 identifier];
          v38[1] = v23;
          v37[2] = @"repeatingClass";
          uint64_t v24 = [v13 featureRank];
          v38[2] = v24;
          uint64_t v25 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:3];

          if (v15) {
            [v15 addObject:v25];
          }
          else {
            uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v25, 0);
          }
          [v5 setValue:v15 forKey:v14];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v11);
    }

    id v9 = v27;
    id v7 = v28;
  }
}

- (void)populateRecurringClassHistogramsWithMerchantDetailedCategoryCounts:(id)a3 histogram:(id)a4 transaction:(id)a5
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v9 merchantDetailedCategory];
  uint64_t v11 = v10;
  if (v10)
  {
    if ([v10 length])
    {
      if ([v9 accountType] == 2
        && ![v9 transactionType]
        && [v9 transactionStatus] == 1)
      {
        int v12 = [v7 objectForKey:v11];
        unint64_t v13 = [v12 integerValue];

        if (v13 >= 3)
        {
          id v34 = v7;
          context = (void *)MEMORY[0x253330BB0]();
          uint64_t v14 = [v9 amount];
          long long v33 = v11;
          uint64_t v15 = +[FinHealthRecurringHelper histogramKeysForMerchantDetailedCategoryTransaction:transactionAmount:transactionType:amountFromDatabase:](FinHealthRecurringHelper, "histogramKeysForMerchantDetailedCategoryTransaction:transactionAmount:transactionType:amountFromDatabase:", v11, v14, 0, [v9 amountFromDatabase]);

          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          obuint64_t j = v15;
          uint64_t v16 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v36 = *(void *)v40;
            do
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v40 != v36) {
                  objc_enumerationMutation(obj);
                }
                int v19 = *(void **)(*((void *)&v39 + 1) + 8 * i);
                id v20 = [v19 featureLabel];
                double v21 = [v8 objectForKey:v20];
                double v22 = [v9 transactionDate];
                [v22 timeIntervalSinceReferenceDate];
                double v24 = v23;

                uint64_t v25 = (void *)MEMORY[0x263F087B0];
                id v26 = [NSNumber numberWithDouble:v24];
                id v27 = v26;
                if (v26)
                {
                  [v26 decimalValue];
                }
                else
                {
                  v37[0] = 0;
                  v37[1] = 0;
                  int v38 = 0;
                }
                os_log_type_t v28 = [v25 decimalNumberWithDecimal:v37];

                v44[0] = v28;
                v43[0] = @"transactionDate";
                v43[1] = @"identifier";
                id v29 = [v9 identifier];
                v44[1] = v29;
                v43[2] = @"repeatingClass";
                uint64_t v30 = [v19 featureRank];
                v44[2] = v30;
                id v31 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:3];

                if (v21) {
                  [v21 addObject:v31];
                }
                else {
                  double v21 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v31, 0);
                }
                [v8 setValue:v21 forKey:v20];
              }
              uint64_t v17 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
            }
            while (v17);
          }

          uint64_t v11 = v33;
          id v7 = v34;
        }
      }
    }
  }
}

- (void)retrieveAll
{
  uint64_t v3 = [(FHDatabaseManager *)self delegate];
  if (v3)
  {
    id v12 = (id)v3;
    id v4 = [(FHDatabaseManager *)self delegate];
    if ([v4 conformsToProtocol:&unk_27002D228])
    {
      id v5 = [(FHDatabaseManager *)self delegate];
      char v6 = objc_opt_respondsToSelector();

      if (v6)
      {
        uint64_t v7 = 0;
        do
        {
          id v8 = (void *)MEMORY[0x253330BB0]();
          id v9 = [(FHDatabaseManager *)self _getAllTransactions:v7 limit:25];
          uint64_t v10 = [(FHDatabaseManager *)self delegate];
          [v10 processBatch:v9];

          uint64_t v11 = [v9 count];
          v7 += 25;
        }
        while (v11);
      }
    }
    else
    {
    }
  }
}

- (id)_getAllTransactions:(unint64_t)a3 limit:(unint64_t)a4
{
  uint64_t v7 = objc_opt_new();
  id v8 = [(FHDatabaseManager *)self _fetch:@"select * from transactions limit %d, %d", a3, a4];
  if ([v8 next])
  {
    do
    {
      id v9 = [(FHDatabaseManager *)self reconstructTransaction:v8];
      [v7 addObject:v9];
    }
    while (([v8 next] & 1) != 0);
  }
  [(FHDatabaseManager *)self closeAndUnlock:v8];
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithArray:v7];

  return v10;
}

- (BOOL)deleteDatabase:(id *)a3
{
  p_lockDatabaseBookKeeping = &self->_lockDatabaseBookKeeping;
  os_unfair_lock_lock(&self->_lockDatabaseBookKeeping);
  [(FHDatabaseManager *)self _rebuildTablesAndIndexes:1];
  os_unfair_lock_unlock(p_lockDatabaseBookKeeping);
  return 1;
}

- (BOOL)_execute:(id)a3
{
  uint64_t v3 = self;
  p_lockDatabaseExecute = &self->_lockDatabaseExecute;
  id v5 = a3;
  os_unfair_lock_lock(p_lockDatabaseExecute);
  LOBYTE(v3) = [(PQLConnection *)v3->_db execute:v5 args:&v7];

  os_unfair_lock_unlock(p_lockDatabaseExecute);
  return (char)v3;
}

- (BOOL)deleteWithRollBack:(BOOL)a3 SQL:(id)a4 args:(char *)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  os_unfair_lock_lock(&self->_lockDatabaseExecute);
  db = self->_db;
  if (!v6)
  {
    char v12 = [(PQLConnection *)db execute:v8 args:a5];
    goto LABEL_8;
  }
  if (![(PQLConnection *)db execute:@"BEGIN"])
  {
LABEL_7:
    char v12 = 0;
    goto LABEL_8;
  }
  int v10 = [(PQLConnection *)self->_db execute:v8 args:a5];
  uint64_t v11 = self->_db;
  if (!v10)
  {
    [(PQLConnection *)v11 execute:@"ROLLBACK"];
    goto LABEL_7;
  }
  [(PQLConnection *)v11 execute:@"COMMIT"];
  char v12 = 1;
LABEL_8:
  os_unfair_lock_unlock(&self->_lockDatabaseExecute);

  return v12;
}

- (BOOL)deleteWithSQL:(id)a3
{
  return [(FHDatabaseManager *)self deleteWithRollBack:0 SQL:a3 args:&v4];
}

- (BOOL)executeAsPreparedStatement:(id)a3 values:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  p_lockDatabaseExecute = &self->_lockDatabaseExecute;
  os_unfair_lock_lock(&self->_lockDatabaseExecute);
  ppStmt = 0;
  id v9 = (sqlite3 *)[(PQLConnection *)self->_db dbHandle];
  id v10 = v6;
  if (sqlite3_prepare_v2(v9, (const char *)[v10 UTF8String], -1, &ppStmt, 0))
  {
    uint64_t v11 = FinHealthLogObject(@"FinHealthCore");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v10;
      _os_log_impl(&dword_24E029000, v11, OS_LOG_TYPE_DEBUG, "Failed to prepare sql statement %@", buf, 0xCu);
    }
  }
  else
  {
    if ([v7 count])
    {
      uint64_t v13 = 0;
      *(void *)&long long v12 = 138412802;
      long long v21 = v12;
      do
      {
        uint64_t v14 = objc_msgSend(v7, "objectAtIndex:", v13, v21);
        uint64_t v15 = ppStmt;
        unint64_t v16 = v13 + 1;
        id v17 = v14;
        if (sqlite3_bind_text(v15, v13 + 1, (const char *)[v17 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
        {
          double v18 = FinHealthLogObject(@"FinHealthCore");
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v21;
            id v24 = v10;
            __int16 v25 = 2112;
            id v26 = v17;
            __int16 v27 = 2048;
            uint64_t v28 = v13;
            _os_log_impl(&dword_24E029000, v18, OS_LOG_TYPE_DEBUG, "sql statement %@ failed to bind %@ at index %lu", buf, 0x20u);
          }
        }
        ++v13;
      }
      while (v16 < [v7 count]);
    }
    sqlite3_step(ppStmt);
  }
  int v19 = sqlite3_finalize(ppStmt);
  os_unfair_lock_unlock(p_lockDatabaseExecute);

  return v19 == 0;
}

- (BOOL)_executeRaw:(id)a3
{
  uint64_t v3 = self;
  p_lockDatabaseExecute = &self->_lockDatabaseExecute;
  id v5 = a3;
  os_unfair_lock_lock(p_lockDatabaseExecute);
  LOBYTE(v3) = [(PQLConnection *)v3->_db executeRaw:v5];

  os_unfair_lock_unlock(p_lockDatabaseExecute);
  return (char)v3;
}

- (id)_fetch:(id)a3
{
  p_lockDatabaseFetch = &self->_lockDatabaseFetch;
  id v5 = a3;
  os_unfair_lock_lock(p_lockDatabaseFetch);
  id v6 = (void *)[(PQLConnection *)self->_db fetch:v5 args:&v9];

  return v6;
}

- (id)_fetchv:(id)a3 args:(char *)a4
{
  p_lockDatabaseFetch = &self->_lockDatabaseFetch;
  id v7 = a3;
  os_unfair_lock_lock(p_lockDatabaseFetch);
  id v8 = (void *)[(PQLConnection *)self->_db fetch:v7 args:a4];

  return v8;
}

- (id)_lockFreeFetch:(id)a3
{
  uint64_t v3 = (void *)[(PQLConnection *)self->_db fetch:a3 args:&v6];
  return v3;
}

- (void)closeAndUnlock:(id)a3
{
  [a3 close];
  os_unfair_lock_unlock(&self->_lockDatabaseFetch);
}

- (BOOL)_isDatabaseCorrupt
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  p_lockDatabaseFetch = &self->_lockDatabaseFetch;
  os_unfair_lock_lock(&self->_lockDatabaseFetch);
  uint64_t v4 = [(FHDatabaseManager *)self _getDataDirectory];
  id v5 = [MEMORY[0x263EFF910] date];
  id v6 = [v4 stringByAppendingPathComponent:@"finhealth.db"];
  [v6 UTF8String];
  int v7 = _sqlite3_integrity_check();

  id v8 = [MEMORY[0x263EFF910] date];
  uint64_t v9 = FinHealthLogObject(@"FinHealthCore");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    [v8 timeIntervalSinceDate:v5];
    int v12 = 134217984;
    uint64_t v13 = v10;
    _os_log_impl(&dword_24E029000, v9, OS_LOG_TYPE_DEBUG, "Integrity check time: %f", (uint8_t *)&v12, 0xCu);
  }

  os_unfair_lock_unlock(p_lockDatabaseFetch);
  return v7 == 11;
}

- (BOOL)_truncateDatabase
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_lockDatabaseExecute = &self->_lockDatabaseExecute;
  os_unfair_lock_lock(&self->_lockDatabaseExecute);
  uint64_t v4 = (sqlite3 *)[(PQLConnection *)self->_db dbHandle];
  int v5 = _sqlite3_db_truncate();
  if (v5)
  {
    id v6 = FinHealthLogObject(@"FinHealthCore");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8[0] = 67109634;
      v8[1] = v5;
      __int16 v9 = 2080;
      uint64_t v10 = sqlite3_errmsg(v4);
      __int16 v11 = 1024;
      int v12 = sqlite3_extended_errcode(v4);
      _os_log_impl(&dword_24E029000, v6, OS_LOG_TYPE_ERROR, "Failed to truncate database %d (%s, %d)", (uint8_t *)v8, 0x18u);
    }
  }
  os_unfair_lock_unlock(p_lockDatabaseExecute);
  return v5 == 0;
}

- (void)_rebuildTablesAndIndexes:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v50 = *MEMORY[0x263EF8340];
  BOOL v5 = [(FHDatabaseManager *)self _isEligibleForSchemaMigration];
  id v6 = FinHealthLogObject(@"FinHealthCore");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = @"NO";
    if (v5) {
      int v7 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    id v49 = v7;
    _os_log_impl(&dword_24E029000, v6, OS_LOG_TYPE_DEBUG, "isEligibleForSchemaMigration: %@", buf, 0xCu);
  }

  BOOL v37 = v5;
  if (v3 || v5)
  {
    if ([(FHDatabaseManager *)self _isDatabaseCorrupt])
    {
      id v8 = FinHealthLogObject(@"FinHealthCore");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_24E029000, v8, OS_LOG_TYPE_ERROR, "DB corrupted. Truncating", buf, 2u);
      }

      [(FHDatabaseManager *)self _truncateDatabase];
    }
    BOOL v36 = v3;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    __int16 v9 = DropTablesAndIndexes();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v43 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(__CFString **)(*((void *)&v42 + 1) + 8 * i);
          uint64_t v15 = FinHealthLogObject(@"FinHealthCore");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v49 = v14;
            _os_log_impl(&dword_24E029000, v15, OS_LOG_TYPE_DEBUG, "sqlExecuteCommand: %@", buf, 0xCu);
          }

          [(FHDatabaseManager *)self _executeRaw:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v11);
    }

    unint64_t v16 = FinHealthLogObject(@"FinHealthCore");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24E029000, v16, OS_LOG_TYPE_INFO, "Recreating database", buf, 2u);
    }

    LOBYTE(v3) = v36;
  }
  [(FHDatabaseManager *)self _instrumentationTableMigration];
  id v17 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"t_identifier", @"t_heuristics_identifier", 0);
  [(FHDatabaseManager *)self _checkUniqueConstraints:@"features_heuristics" uniqueConstraintSet:v17];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  double v18 = CreateTablesAndIndexes();
  uint64_t v19 = [v18 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v39;
    int v22 = 1;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v39 != v21) {
          objc_enumerationMutation(v18);
        }
        v22 &= [(FHDatabaseManager *)self _executeRaw:*(void *)(*((void *)&v38 + 1) + 8 * j)];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v20);
  }
  else
  {
    int v22 = 1;
  }

  objc_msgSend(NSString, "stringWithFormat:", @"alter table %@ add column %@ %@;",
    @"features_instrumentation",
    @"pass_type",
  id v24 = @"integer");
  [(FHDatabaseManager *)self _executeRaw:v24];

  objc_msgSend(NSString, "stringWithFormat:", @"alter table %@ add column %@ %@;",
    @"features_instrumentation",
    @"heuristics_identifier",
  __int16 v25 = @"text");
  [(FHDatabaseManager *)self _executeRaw:v25];

  objc_msgSend(NSString, "stringWithFormat:", @"alter table %@ add column %@ %@;",
    @"features_instrumentation",
    @"account_state",
  id v26 = @"integer");
  [(FHDatabaseManager *)self _execute:v26];

  objc_msgSend(NSString, "stringWithFormat:", @"alter table %@ add column %@ %@;",
    @"features_instrumentation",
    @"paid_using_ring",
  __int16 v27 = @"integer");
  [(FHDatabaseManager *)self _execute:v27];

  if (v3 || (v37 & v22) != 0)
  {
    uint64_t v28 = [MEMORY[0x263EFF910] now];
    [v28 timeIntervalSinceReferenceDate];
    uint64_t v30 = (int)v29;

    BOOL v31 = [(FHDatabaseManager *)self _execute:@"insert into fh_schema (sch_version_id, sch_upgrade_status, sch_date, sch_getall_status) values (%@, %d, %d, %d)", @"10.72", 2, v30, 0];
    int v32 = FinHealthLogObject(@"FinHealthCore");
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      long long v33 = @"Fail";
      if (v31) {
        long long v33 = @"Success";
      }
      *(_DWORD *)buf = 138412290;
      id v49 = v33;
      _os_log_impl(&dword_24E029000, v32, OS_LOG_TYPE_INFO, "createSchemaVersionRecord: %@", buf, 0xCu);
    }
  }
  for (uint64_t k = 0; k != 11; ++k)
  {
    long long v35 = FHTransactionRepeatingPatternClassToFHSmartFeature(k);
    [(FHDatabaseManager *)self _execute:@"insert or replace into features_prediction_labels (feature_name, feature_predicted_class, smart_feature_name) values (%@, %d, %@)", @"FHSmartFeatureAggregateTypeRecurring", k, v35];
  }
}

- (void)_instrumentationTableMigration
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  objc_msgSend(NSString, "stringWithFormat:", @"PRAGMA table_info('%@');",
  BOOL v3 = @"features_instrumentation");
  uint64_t v4 = [(FHDatabaseManager *)self _fetch:v3];

  if ([v4 next])
  {
    char v5 = 0;
    do
    {
      id v6 = [v4 stringAtIndex:1];
      char v7 = [v6 isEqualToString:@"source_identifier"];

      v5 |= v7;
    }
    while (([v4 next] & 1) != 0);
    [(FHDatabaseManager *)self closeAndUnlock:v4];
    if (v5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"drop table if exists %@;",
      id v8 = @"features_instrumentation");
      [(FHDatabaseManager *)self _executeRaw:v8];

      __int16 v9 = FinHealthLogObject(@"FinHealthCore");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v11 = @"features_instrumentation";
        _os_log_impl(&dword_24E029000, v9, OS_LOG_TYPE_DEBUG, "Drop table %@", buf, 0xCu);
      }
    }
  }
  else
  {
    [(FHDatabaseManager *)self closeAndUnlock:v4];
  }
}

- (void)_checkUniqueConstraints:(id)a3 uniqueConstraintSet:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [NSString stringWithFormat:@"PRAGMA index_info('%@');", v6];
  __int16 v9 = [(FHDatabaseManager *)self _fetch:v8];

  if ([v9 next])
  {
    uint64_t v10 = [v9 stringAtIndex:1];
    [(FHDatabaseManager *)self closeAndUnlock:v9];
    if (v10)
    {
      uint64_t v11 = [NSString stringWithFormat:@"PRAGMA index_list('%@');", v10];
      uint64_t v12 = [(FHDatabaseManager *)self _fetch:v11];

      uint64_t v13 = 0;
      if ([v12 next])
      {
        do
        {
          uint64_t v14 = [v12 stringAtIndex:2];
          unsigned int v15 = [v7 containsObject:v14];

          v13 += v15;
        }
        while (([v12 next] & 1) != 0);
      }
      if (v13 != [v7 count])
      {
        unint64_t v16 = [NSString stringWithFormat:@"drop table if exists %@;", v6];
        [(FHDatabaseManager *)self _executeRaw:v16];

        id v17 = FinHealthLogObject(@"FinHealthCore");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v19 = v6;
          _os_log_impl(&dword_24E029000, v17, OS_LOG_TYPE_DEBUG, "Drop table %@", buf, 0xCu);
        }
      }
      [(FHDatabaseManager *)self closeAndUnlock:v12];
    }
  }
  else
  {
    [(FHDatabaseManager *)self closeAndUnlock:v9];
  }
}

- (unint64_t)streamGenericSQLFetch:(id)a3 predicate:(id)a4 sqlFetchQuery:(id)a5
{
  id v8 = (void (**)(id, void *))a3;
  id v9 = a4;
  id v10 = a5;
  os_unfair_lock_lock(&self->_lockSQLStreaming);
  id v24 = v10;
  uint64_t v11 = [(FHDatabaseManager *)self _fetchv:v10 args:&v25];
  if ([v11 next])
  {
    do
    {
      uint64_t v12 = (void *)MEMORY[0x253330BB0]();
      uint64_t v13 = objc_opt_new();
      uint64_t v14 = objc_opt_new();
      if ([v11 columns])
      {
        unint64_t v15 = 0;
        do
        {
          uint64_t v16 = [v11 objectAtIndex:v15];
          if (v16) {
            id v17 = (__CFString *)v16;
          }
          else {
            id v17 = &stru_27001CD40;
          }
          if (v9)
          {
            double v18 = [v11 columnNameAtIndex:v15];
            [v14 setObject:v17 forKey:v18];
          }
          [v13 addObject:v17];

          ++v15;
        }
        while ([v11 columns] > v15);
      }
      if (v9)
      {
        id v19 = [MEMORY[0x263EFF8C0] arrayWithObject:v14];
        uint64_t v20 = [v19 filteredArrayUsingPredicate:v9];

        if ([v20 count])
        {
          uint64_t v21 = [MEMORY[0x263EFF8C0] arrayWithArray:v13];
          v8[2](v8, v21);
        }
      }
      else
      {
        uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithArray:v13];
        v8[2](v8, v20);
      }
    }
    while (([v11 next] & 1) != 0);
  }
  unint64_t v22 = [v11 rowNumber];
  [(FHDatabaseManager *)self closeAndUnlock:v11];
  os_unfair_lock_unlock(&self->_lockSQLStreaming);

  return v22;
}

- (unint64_t)streamQueryResults:(id)a3 usingFetchHandler:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __58__FHDatabaseManager_streamQueryResults_usingFetchHandler___block_invoke;
  v10[3] = &unk_265314AB8;
  id v11 = v6;
  id v7 = v6;
  unint64_t v8 = -[FHDatabaseManager streamGenericSQLFetch:predicate:sqlFetchQuery:](self, "streamGenericSQLFetch:predicate:sqlFetchQuery:", v10, 0, a3, 0);

  return v8;
}

uint64_t __58__FHDatabaseManager_streamQueryResults_usingFetchHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)processingTimeForFeature:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  char v5 = [NSString stringWithFormat:@"select feature_processing_date, feature_data from fh_processing_history where feature_name == '%@'", v4];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  _DWORD v8[2] = __46__FHDatabaseManager_processingTimeForFeature___block_invoke;
  v8[3] = &unk_265314AE0;
  void v8[4] = &v9;
  -[FHDatabaseManager streamGenericSQLFetch:predicate:sqlFetchQuery:](self, "streamGenericSQLFetch:predicate:sqlFetchQuery:", v8, 0, v5, 0);
  unint64_t v6 = v10[3];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __46__FHDatabaseManager_processingTimeForFeature___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 objectAtIndex:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 unsignedIntegerValue];
}

- (id)processingDataForFeature:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy_;
  uint64_t v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  char v5 = [NSString stringWithFormat:@"select feature_processing_date, feature_data from fh_processing_history where feature_name == '%@'", v4];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  _DWORD v8[2] = __46__FHDatabaseManager_processingDataForFeature___block_invoke;
  v8[3] = &unk_265314AE0;
  void v8[4] = &v9;
  -[FHDatabaseManager streamGenericSQLFetch:predicate:sqlFetchQuery:](self, "streamGenericSQLFetch:predicate:sqlFetchQuery:", v8, 0, v5, 0);
  id v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __46__FHDatabaseManager_processingDataForFeature___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 objectAtIndex:1];
  return MEMORY[0x270F9A758]();
}

- (void)updateProcessingTimeForFeature:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF910];
  id v8 = a3;
  char v5 = [v4 now];
  [v5 timeIntervalSinceReferenceDate];
  unint64_t v7 = (unint64_t)v6;

  [(FHDatabaseManager *)self _updateProcessingTimeForFeature:v8 processingDate:v7 data:0];
}

- (void)updateProcessingTimeForFeature:(id)a3 data:(id)a4
{
  double v6 = (void *)MEMORY[0x263EFF910];
  id v7 = a4;
  id v11 = a3;
  id v8 = [v6 now];
  [v8 timeIntervalSinceReferenceDate];
  unint64_t v10 = (unint64_t)v9;

  [(FHDatabaseManager *)self _updateProcessingTimeForFeature:v11 processingDate:v10 data:v7];
}

- (void)_updateProcessingTimeForFeature:(id)a3 processingDate:(unint64_t)a4
{
}

- (void)_updateProcessingTimeForFeature:(id)a3 processingDate:(unint64_t)a4 data:(id)a5
{
}

- (id)_getTransactionsMarkedForRecurrChange
{
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy_;
  v25[4] = __Block_byref_object_dispose_;
  id v26 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy_;
  v23[4] = __Block_byref_object_dispose_;
  id v24 = (id)objc_opt_new();
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy_;
  uint64_t v20 = __Block_byref_object_dispose_;
  id v21 = (id)objc_opt_new();
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  _DWORD v8[2] = __58__FHDatabaseManager__getTransactionsMarkedForRecurrChange__block_invoke;
  v8[3] = &unk_265314B08;
  objc_copyWeak(&v14, &location);
  void v8[4] = self;
  unint64_t v10 = v25;
  id v11 = v23;
  uint64_t v12 = v22;
  uint64_t v13 = &v16;
  id v4 = v3;
  double v9 = v4;
  [(FHDatabaseManager *)self streamGenericSQLFetch:v8, 0, @"select distinct t.t_identifier, ifnull(h.t_heuristics_score, -1) from transactions t left join features_heuristics h on t.t_identifier == h.t_identifier order by t.m_displayname asc, t.t_date asc limit %d", -1 predicate sqlFetchQuery];
  dispatch_time_t v5 = dispatch_time(0, 3000000000);
  dispatch_semaphore_wait(v4, v5);
  double v6 = (void *)[(id)v17[5] copy];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v23, 8);

  _Block_object_dispose(v25, 8);
  return v6;
}

void __58__FHDatabaseManager__getTransactionsMarkedForRecurrChange__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  dispatch_time_t v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    double v6 = [v3 firstObject];
    id v7 = [v6 stringValue];

    id v8 = [*(id *)(a1 + 32) getTransactionByIdentifier:v7];
    double v9 = [v8 displayName];
    unint64_t v10 = [NSString stringWithFormat:@"%@ %@", @"Price Increase for", v9];
    id v11 = [v3 lastObject];
    [v11 doubleValue];
    double v13 = v12;

    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    unint64_t v15 = *(void **)(v14 + 40);
    if (v15)
    {
      uint64_t v16 = [v15 displayName];
      id v17 = (void *)v16;
      if (v9
        && v16
        && [v9 length]
        && [v17 length]
        && ([v9 isEqualToString:v17] & 1) != 0)
      {
        if (*(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) != (double)-1)
        {
          uint64_t v18 = FinHealthLogObject(@"FinHealthCore");
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            id v19 = *(const char **)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
            *(_DWORD *)buf = 134217984;
            long long v45 = v19;
            _os_log_impl(&dword_24E029000, v18, OS_LOG_TYPE_DEBUG, "previousPreComputedRmseValue: %f", buf, 0xCu);
          }

          uint64_t v20 = [v8 transactionDate];
          [v20 timeIntervalSinceReferenceDate];
          unint64_t v42 = (unint64_t)v21;

          unint64_t v22 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) transactionDate];
          [v22 timeIntervalSinceReferenceDate];
          unint64_t v40 = (unint64_t)v23;

          id v24 = (void *)MEMORY[0x263F087B0];
          uint64_t v25 = objc_msgSend(NSString, "stringWithFormat:", @"%f", (double)(v42 - v40));
          id v26 = [v24 decimalNumberWithString:v25];

          long long v43 = [v26 decimalNumberByDividingBy:v5[3]];
          objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "addObject:");
          if (v13 == (double)-1
            && (unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count] >= 3)
          {
            long long v41 = v26;
            __int16 v27 = +[FinHealthRecurringHelper rootMeanSquareError:startIndex:arrayLength:](FinHealthRecurringHelper, "rootMeanSquareError:startIndex:arrayLength:", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count] - 3, 3);
            if ([v27 lessThan:v5[4]])
            {
              uint64_t v28 = [v8 amount];
              BOOL v37 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) amount];
              long long v38 = v28;
              long long v39 = objc_msgSend(v28, "decimalNumberBySubtracting:");
              if ([v39 isPositive])
              {
                long long v35 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
                double v29 = (void *)MEMORY[0x263EFF8C0];
                BOOL v36 = v27;
                uint64_t v30 = [[FHSmartCompoundFeatureRankedValue alloc] initWithLabelAndRank:v10 featureRank:v39];
                BOOL v31 = objc_msgSend(v29, "arrayWithObjects:", v30, 0);
                [v35 setObject:v31 forKey:v7];

                __int16 v27 = v36;
              }
              int v32 = FinHealthLogObject(@"FinHealthCore");
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                long long v45 = (const char *)v7;
                __int16 v46 = 2112;
                id v47 = v39;
                _os_log_impl(&dword_24E029000, v32, OS_LOG_TYPE_DEBUG, "currentTransactionId: %@, changeInAmount: %@", buf, 0x16u);
              }
            }
            id v26 = v41;
          }
        }
      }
      else
      {
        [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) removeAllObjects];
      }

      uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    }
    long long v33 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v8;
    id v34 = v8;

    *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v13;
LABEL_28:

    goto LABEL_29;
  }
  if (!WeakRetained)
  {
    id v7 = FinHealthLogObject(@"FinHealthCore");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      long long v45 = "-[FHDatabaseManager _getTransactionsMarkedForRecurrChange]_block_invoke";
      _os_log_impl(&dword_24E029000, v7, OS_LOG_TYPE_ERROR, "%s strongSelf is nil", buf, 0xCu);
    }
    goto LABEL_28;
  }
LABEL_29:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)publishEventsToBiome
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v30 = 0;
  BOOL v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  unint64_t v3 = [(FHDatabaseManager *)self processingTimeForFeature:@"FHProcessingHistoryInstrumentation"];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __41__FHDatabaseManager_publishEventsToBiome__block_invoke;
  v29[3] = &unk_265314AE0;
  void v29[4] = &v30;
  [(FHDatabaseManager *)self streamGenericSQLFetch:v29, 0, @"select * from features_instrumentation", 0 predicate sqlFetchQuery];
  uint64_t v4 = v31[3];
  if (v4)
  {
    uint64_t v5 = v4 - 2592000;
    double v6 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"SELF.%K > %lu AND SELF.%K <= %lu", @"tag_click_date", v4 - 2592000, @"tag_click_date", v4);
    if (v3 != v31[3])
    {
      id v7 = FinHealthLogObject(@"FinHealthCore");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        id v8 = (uint64_t (*)(uint64_t, uint64_t))v31[3];
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "-[FHDatabaseManager publishEventsToBiome]";
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v5;
        *(_WORD *)&buf[22] = 2048;
        long long v35 = v8;
        _os_log_impl(&dword_24E029000, v7, OS_LOG_TYPE_DEBUG, "[%s] starting instrumentation streaming to Biome: leastRecentInstrumentationEntryDate: %lu, mostRecentInstrumentationEntryDate: %lu", buf, 0x20u);
      }

      [(FHDatabaseManager *)self _updateProcessingTimeForFeature:@"FHProcessingHistoryInstrumentation" processingDate:v31[3]];
      *(void *)buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      long long v35 = __Block_byref_object_copy_;
      BOOL v36 = __Block_byref_object_dispose_;
      double v9 = BiomeLibrary();
      unint64_t v10 = [v9 WalletPaymentsCommerce];
      id v11 = [v10 FinancialInsights];
      id v37 = [v11 Search];

      v27[0] = 0;
      v27[1] = v27;
      void v27[2] = 0x3032000000;
      v27[3] = __Block_byref_object_copy_;
      v27[4] = __Block_byref_object_dispose_;
      double v12 = BiomeLibrary();
      double v13 = [v12 WalletPaymentsCommerce];
      uint64_t v14 = [v13 FinancialInsights];
      id v28 = [v14 PaymentRingSuggestions];

      v25[0] = 0;
      v25[1] = v25;
      v25[2] = 0x3032000000;
      v25[3] = __Block_byref_object_copy_;
      v25[4] = __Block_byref_object_dispose_;
      unint64_t v15 = BiomeLibrary();
      uint64_t v16 = [v15 WalletPaymentsCommerce];
      id v17 = [v16 FinancialInsights];
      id v26 = [v17 RecurringSendSuggestions];

      uint64_t v18 = [(FHDatabaseManager *)self getAllPeerPaymentSignalsFilterDismissed:0];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __41__FHDatabaseManager_publishEventsToBiome__block_invoke_335;
      v20[3] = &unk_265314B58;
      unint64_t v22 = buf;
      double v23 = v27;
      id v19 = v18;
      id v21 = v19;
      id v24 = v25;
      [(FHDatabaseManager *)self streamGenericSQLFetch:v20, v6, @"select * from features_instrumentation", 0 predicate sqlFetchQuery];

      _Block_object_dispose(v25, 8);
      _Block_object_dispose(v27, 8);

      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    double v6 = FinHealthLogObject(@"FinHealthCore");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[FHDatabaseManager publishEventsToBiome]";
      _os_log_impl(&dword_24E029000, v6, OS_LOG_TYPE_DEBUG, "%s No instrumentation records found", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v30, 8);
}

void __41__FHDatabaseManager_publishEventsToBiome__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v9 = v3;
    BOOL v4 = [v3 count] == 8;
    id v3 = v9;
    if (v4)
    {
      uint64_t v5 = [v9 objectAtIndex:3];
      unint64_t v6 = (int)[v5 intValue];

      id v3 = v9;
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
      unint64_t v8 = *(void *)(v7 + 24);
      if (v8 <= v6) {
        unint64_t v8 = v6;
      }
      *(void *)(v7 + 24) = v8;
    }
  }
}

void __41__FHDatabaseManager_publishEventsToBiome__block_invoke_335(uint64_t a1, void *a2)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = v3;
  if (v3 && [v3 count] == 8)
  {
    uint64_t v5 = [v4 objectAtIndex:1];
    uint64_t v6 = [v5 intValue];

    uint64_t v7 = [v4 objectAtIndex:2];
    uint64_t v8 = [v7 intValue];

    id v9 = [v4 objectAtIndex:4];
    int v10 = [v9 intValue];

    id v11 = NSNumber;
    double v12 = [v4 objectAtIndex:3];
    double v13 = objc_msgSend(v11, "numberWithInt:", objc_msgSend(v12, "intValue"));

    if (v10 == 2 && (int)v6 <= 199)
    {
      uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263F2A5C8]) initWithTagSource:v6 tagType:v8 passType:2 tagClickDate:v13];
      unint64_t v15 = FinHealthLogObject(@"FinHealthCore");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[FHDatabaseManager publishEventsToBiome]_block_invoke";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v14;
        _os_log_impl(&dword_24E029000, v15, OS_LOG_TYPE_DEBUG, "%s FH_BIOME_REPORTING search event: %@", buf, 0x16u);
      }

      uint64_t v16 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) source];
      [v16 sendEvent:v14];
    }
    else
    {
      if ((v6 - 200) <= 4)
      {
        id v17 = [v4 objectAtIndex:6];
        uint64_t v18 = [v17 intValue];

        id v19 = [v4 objectAtIndex:7];
        uint64_t v20 = [v19 intValue];

        id v21 = [v4 objectAtIndex:2];
        uint64_t v22 = [v21 intValue];

        double v23 = [v4 objectAtIndex:1];
        uint64_t v24 = [v23 intValue] - 200;

        uint64_t v25 = (void *)[objc_alloc(MEMORY[0x263F2A5B8]) initWithAccountState:v18 paidUsingRing:v20 lastPaymentCategory:v22 paymentAction:v24];
        id v26 = FinHealthLogObject(@"FinHealthCore");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "-[FHDatabaseManager publishEventsToBiome]_block_invoke";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v25;
          _os_log_impl(&dword_24E029000, v26, OS_LOG_TYPE_DEBUG, "%s FH_BIOME_REPORTING payment ring event: %@", buf, 0x16u);
        }

        __int16 v27 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) source];
        [v27 sendEvent:v25];
      }
      if (v10 == 1)
      {
        *(void *)buf = 0;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x3032000000;
        id v59 = __Block_byref_object_copy_;
        id v60 = __Block_byref_object_dispose_;
        id v61 = [v4 objectAtIndex:5];
        v53[0] = MEMORY[0x263EF8330];
        v53[1] = 3221225472;
        v53[2] = __41__FHDatabaseManager_publishEventsToBiome__block_invoke_338;
        v53[3] = &unk_265314B30;
        v53[4] = buf;
        BOOL v52 = [MEMORY[0x263F08A98] predicateWithBlock:v53];
        id v28 = objc_msgSend(*(id *)(a1 + 32), "filteredArrayUsingPredicate:");
        double v29 = [MEMORY[0x263EFF910] now];
        [v29 timeIntervalSinceReferenceDate];
        double v31 = v30;

        if ([v28 count])
        {
          uint64_t v32 = [v28 objectAtIndex:0];
          uint64_t v33 = [v32 periodicCategory];
          uint64_t v51 = FHRecurringPeerPaymentPeriodicCategoryTypeFromString(v33);

          id v34 = [v32 signalDate];

          unint64_t v35 = (unint64_t)v34 - (unint64_t)v31;
          if (v35 <= 0x93A80) {
            unsigned int v36 = 2;
          }
          else {
            unsigned int v36 = 3;
          }
          if (v35 <= 0x3F480) {
            uint64_t v37 = 1;
          }
          else {
            uint64_t v37 = v36;
          }
          uint64_t v38 = [v4 objectAtIndex:4];
          uint64_t v39 = [v38 intValue];

          unint64_t v40 = [v4 objectAtIndex:1];
          uint64_t v41 = [v40 intValue];

          unint64_t v42 = NSNumber;
          long long v43 = [v4 objectAtIndex:3];
          long long v44 = objc_msgSend(v42, "numberWithInt:", objc_msgSend(v43, "intValue"));

          unint64_t v45 = [*(id *)(a1 + 32) count];
          id v46 = objc_alloc(MEMORY[0x263F2A5C0]);
          if (v45 <= 1) {
            uint64_t v47 = 1;
          }
          else {
            uint64_t v47 = 2;
          }
          uint64_t v48 = (void *)[v46 initWithUserSelection:v41 passType:v39 tagClickDate:v44 frequency:v51 suggestionsRange:v47 dayRange:v37];
          id v49 = FinHealthLogObject(@"FinHealthCore");
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)objc_super v54 = 136315394;
            uint64_t v55 = "-[FHDatabaseManager publishEventsToBiome]_block_invoke_2";
            __int16 v56 = 2112;
            uint64_t v57 = v48;
            _os_log_impl(&dword_24E029000, v49, OS_LOG_TYPE_DEBUG, "%s FH_BIOME_REPORTING recurring send suggestion event: %@", v54, 0x16u);
          }

          uint64_t v50 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) source];
          [v50 sendEvent:v48];
        }
        _Block_object_dispose(buf, 8);
      }
    }
  }
}

uint64_t __41__FHDatabaseManager_publishEventsToBiome__block_invoke_338(uint64_t a1, void *a2)
{
  id v3 = [a2 peerPaymentHeuristicIds];
  BOOL v4 = [MEMORY[0x263EFF9D8] orderedSetWithSet:v3];
  uint64_t v5 = [v4 firstObject];
  uint64_t v6 = [v5 isEqual:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];

  return v6;
}

- (void)predictAndPersistCashCardRecurringTransactions
{
  id v3 = FinHealthLogObject(@"FinHealthCore");
  BOOL v4 = FinHealthLogObject(@"FinHealthCore");
  ptr = self;
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, self);

  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_24E029000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "processAggregateFeatures:computeRecurringCashTransactions", "", buf, 2u);
  }

  uint64_t v6 = FinHealthLogObject(@"FinHealthCore");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24E029000, v6, OS_LOG_TYPE_INFO, "BEGIN \"processAggregateFeatures:computeRecurringCashTransactions\"", buf, 2u);
  }

  *(void *)buf = 0;
  v103 = buf;
  uint64_t v104 = 0x3032000000;
  v105 = __Block_byref_object_copy_;
  v106 = __Block_byref_object_dispose_;
  id v107 = (id)objc_opt_new();
  uint64_t v85 = 0;
  v86 = &v85;
  uint64_t v87 = 0x2020000000;
  unint64_t v7 = 3;
  uint64_t v88 = 3;
  do
  {
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"select identifier from features_predicted_realtime where feature_name='FHSmartFeatureAggregateTypeRecurring' and feature_predicted_class=%d limit %d", v7, -1);
    id v9 = (void *)MEMORY[0x253330BB0]();
    v101[0] = MEMORY[0x263EF8330];
    v101[1] = 3221225472;
    v101[2] = __67__FHDatabaseManager_predictAndPersistCashCardRecurringTransactions__block_invoke;
    v101[3] = &unk_265314B80;
    v101[4] = &v85;
    v101[5] = buf;
    -[FHDatabaseManager streamGenericSQLFetch:predicate:sqlFetchQuery:](self, "streamGenericSQLFetch:predicate:sqlFetchQuery:", v101, 0, v8, 0);

    unint64_t v7 = v86[3] + 1;
    v86[3] = v7;
  }
  while (v7 < 0xB);
  _Block_object_dispose(&v85, 8);
  int v10 = [NSDictionary dictionaryWithDictionary:*((void *)v103 + 5)];
  uint64_t v11 = [NSString stringWithFormat:@"%@", @"select * from features_heuristics order by t_heuristics_identifier asc, t_heuristics_value asc"];
  v100[0] = 0;
  v100[1] = v100;
  v100[2] = 0x2020000000;
  v100[3] = 0;
  uint64_t v96 = 0;
  v97 = &v96;
  uint64_t v98 = 0x2020000000;
  uint64_t v99 = 0;
  uint64_t v92 = 0;
  v93 = &v92;
  uint64_t v94 = 0x2020000000;
  uint64_t v95 = 0;
  v91[0] = 0;
  v91[1] = v91;
  v91[2] = 0x2020000000;
  v91[3] = 0;
  uint64_t v85 = 0;
  v86 = &v85;
  uint64_t v87 = 0x3032000000;
  uint64_t v88 = (uint64_t)__Block_byref_object_copy_;
  v89 = __Block_byref_object_dispose_;
  id v90 = 0;
  uint64_t v79 = 0;
  v80 = &v79;
  uint64_t v81 = 0x3032000000;
  v82 = __Block_byref_object_copy_;
  v83 = __Block_byref_object_dispose_;
  id v84 = 0;
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x3032000000;
  __int16 v76 = __Block_byref_object_copy_;
  v77 = __Block_byref_object_dispose_;
  id v78 = 0;
  uint64_t v69 = 0;
  BOOL v70 = &v69;
  uint64_t v71 = 0x2020000000;
  unint64_t v72 = 0x8000000000000000;
  v58[0] = MEMORY[0x263EF8330];
  v58[1] = 3221225472;
  v58[2] = __67__FHDatabaseManager_predictAndPersistCashCardRecurringTransactions__block_invoke_2;
  v58[3] = &unk_265314BA8;
  id v55 = v10;
  id v59 = v55;
  id v60 = self;
  id v61 = &v85;
  uint64_t v62 = &v73;
  uint64_t v63 = &v92;
  unsigned int v64 = &v96;
  uint64_t v65 = v100;
  id v66 = &v69;
  uint64_t v67 = &v79;
  long long v68 = v91;
  -[FHDatabaseManager streamGenericSQLFetch:predicate:sqlFetchQuery:](self, "streamGenericSQLFetch:predicate:sqlFetchQuery:", v58, 0, v11, 0);
  objc_super v54 = (void *)v11;
  unint64_t v12 = v97[3];
  unint64_t v13 = v93[3];
  uint64_t v14 = [(id)v80[5] integerValue];
  unint64_t v15 = [(FHDatabaseManager *)ptr getTransactionByIdentifier:v74[5]];
  uint64_t v16 = v70[3];
  uint64_t v17 = [v15 amountFromDatabase];
  if (v16 <= v17) {
    uint64_t v18 = v17;
  }
  else {
    uint64_t v18 = v16;
  }
  v70[3] = v18;
  double v19 = (double)(v12 / v13);
  switch(v14)
  {
    case 0:
    case 1:
    case 2:
    case 6:
    case 9:
      uint64_t v20 = [v15 transactionSourceIdentifier];
      id v21 = [v15 displayName];
      uint64_t v22 = [v15 merchantDetailedCategory];
      uint64_t v23 = [v15 amountFromDatabase];
      uint64_t v24 = [v15 transactionType];
      uint64_t v25 = [v15 transactionSource];
      id v26 = [v15 transactionDate];
      [v26 timeIntervalSinceReferenceDate];
      [(FHDatabaseManager *)ptr _execute:@"insert or replace into fh_card_recurring_predictions (source_identifier, merchant, detailed_category, amount, frequency, transaction_type, transaction_source, forecast_date, forecast_signal_type, heuristic_identifier) values (%@, %@, %@, %d, %f, %d, %d, %f, %d, %@)", v20, v21, v22, v23, (double)(v12 / v13), v24, v25, v27 + v19, 4, v86[5]];
      goto LABEL_13;
    case 3:
      uint64_t v20 = [v15 transactionSourceIdentifier];
      id v21 = [v15 peerPaymentCounterpartHandle];
      uint64_t v32 = [v15 amountFromDatabase];
      uint64_t v33 = [v15 peerPaymentType];
      uint64_t v22 = [v15 transactionDate];
      [v22 timeIntervalSinceReferenceDate];
      [(FHDatabaseManager *)ptr _execute:@"insert or replace into features_peer_payments (source_identifier, peer_pay_counterpart, amount, frequency, peer_pay_type, forecast_date, forecast_signal_type, heuristics_identifier) values (%@, %@, %d, %f, %d, %f, %d, %@)", v20, v21, v32, (double)(v12 / v13), v33, v34 + v19, 3, v86[5]];
      goto LABEL_14;
    case 4:
      uint64_t v20 = [v15 transactionSourceIdentifier];
      id v21 = [v15 peerPaymentCounterpartHandle];
      uint64_t v35 = v70[3];
      uint64_t v36 = [v15 peerPaymentType];
      uint64_t v22 = [v15 transactionDate];
      [v22 timeIntervalSinceReferenceDate];
      [(FHDatabaseManager *)ptr _execute:@"insert or replace into features_peer_payments (source_identifier, peer_pay_counterpart, amount, frequency, peer_pay_type, forecast_date, forecast_signal_type, heuristics_identifier) values (%@, %@, %d, %f, %d, %f, %d, %@)", v20, v21, v35, *(void *)&v19, v36, v37 + v19, 2, v86[5]];
      goto LABEL_14;
    case 5:
      uint64_t v38 = NSString;
      uint64_t v39 = objc_msgSend(NSString, "stringWithFormat:", @"%lu-%f", objc_msgSend(v15, "amountFromDatabase"), (double)(v12 / v13));
      uint64_t v20 = objc_msgSend(v38, "stringWithFormat:", @"%lu", objc_msgSend(v39, "hash"));

      id v21 = [v15 transactionSourceIdentifier];
      uint64_t v40 = [v15 amountFromDatabase];
      uint64_t v22 = [v15 transactionDate];
      [v22 timeIntervalSinceReferenceDate];
      [(FHDatabaseManager *)ptr _execute:@"insert or replace into features_peer_payments (source_identifier, peer_pay_counterpart, amount, frequency, peer_pay_type, forecast_date, forecast_signal_type, heuristics_identifier) values (%@, %@, %d, %f, %d, %f, %d, %@)", v21, v20, v40, (double)(v12 / v13), 0, v41 + v19, 6, v86[5]];
      goto LABEL_14;
    case 7:
      uint64_t v20 = [v15 transactionSourceIdentifier];
      id v21 = [v15 displayName];
      uint64_t v22 = [v15 merchantDetailedCategory];
      uint64_t v42 = v70[3];
      uint64_t v43 = [v15 transactionType];
      uint64_t v44 = [v15 transactionSource];
      id v26 = [v15 transactionDate];
      [v26 timeIntervalSinceReferenceDate];
      [(FHDatabaseManager *)ptr _execute:@"insert or replace into fh_card_recurring_predictions (source_identifier, merchant, detailed_category, amount, frequency, transaction_type, transaction_source, forecast_date, forecast_signal_type, heuristic_identifier) values (%@, %@, %@, %d, %f, %d, %d, %f, %d, %@)", v20, v21, v22, v42, *(void *)&v19, v43, v44, v45 + v19, 2, v86[5]];
      goto LABEL_13;
    case 8:
      uint64_t v20 = [v15 transactionSourceIdentifier];
      id v21 = [v15 displayName];
      uint64_t v22 = [v15 merchantDetailedCategory];
      uint64_t v46 = v70[3];
      uint64_t v47 = [v15 transactionType];
      uint64_t v48 = [v15 transactionSource];
      id v26 = [v15 transactionDate];
      [v26 timeIntervalSinceReferenceDate];
      [(FHDatabaseManager *)ptr _execute:@"insert or replace into fh_card_recurring_predictions (source_identifier, merchant, detailed_category, amount, frequency, transaction_type, transaction_source, forecast_date, forecast_signal_type, heuristic_identifier) values (%@, %@, %@, %d, %f, %d, %d, %f, %d, %@)", v20, v21, v22, v46, *(void *)&v19, v47, v48, v49 + v19, 1, v86[5]];
      goto LABEL_13;
    case 10:
      uint64_t v20 = [v15 transactionSourceIdentifier];
      id v21 = [v15 displayName];
      uint64_t v22 = [v15 merchantDetailedCategory];
      uint64_t v50 = v70[3];
      uint64_t v51 = [v15 transactionType];
      uint64_t v52 = [v15 transactionSource];
      id v26 = [v15 transactionDate];
      [v26 timeIntervalSinceReferenceDate];
      [(FHDatabaseManager *)ptr _execute:@"insert or replace into fh_card_recurring_predictions (source_identifier, merchant, detailed_category, amount, frequency, transaction_type, transaction_source, forecast_date, forecast_signal_type, heuristic_identifier) values (%@, %@, %@, %d, %f, %d, %d, %f, %d, %@)", v20, v21, v22, v50, *(void *)&v19, v51, v52, v53 + v19, 3, v86[5]];
LABEL_13:

LABEL_14:
      break;
    default:
      break;
  }
  id v28 = FinHealthLogObject(@"FinHealthCore");
  double v29 = FinHealthLogObject(@"FinHealthCore");
  os_signpost_id_t v30 = os_signpost_id_make_with_pointer(v29, ptr);

  if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    *(_WORD *)uint64_t v57 = 0;
    _os_signpost_emit_with_name_impl(&dword_24E029000, v28, OS_SIGNPOST_INTERVAL_END, v30, "processAggregateFeatures:computeRecurringCashTransactions", "", v57, 2u);
  }

  double v31 = FinHealthLogObject(@"FinHealthCore");
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v57 = 0;
    _os_log_impl(&dword_24E029000, v31, OS_LOG_TYPE_INFO, "END \"processAggregateFeatures:computeRecurringCashTransactions\"", v57, 2u);
  }

  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v73, 8);

  _Block_object_dispose(&v79, 8);
  _Block_object_dispose(&v85, 8);

  _Block_object_dispose(v91, 8);
  _Block_object_dispose(&v92, 8);
  _Block_object_dispose(&v96, 8);
  _Block_object_dispose(v100, 8);

  _Block_object_dispose(buf, 8);
}

void __67__FHDatabaseManager_predictAndPersistCashCardRecurringTransactions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 objectAtIndex:0];
  BOOL v4 = [v3 stringValue];

  os_signpost_id_t v5 = (void *)MEMORY[0x263F087B0];
  uint64_t v6 = [MEMORY[0x263F087B0] numberWithInteger:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
  unint64_t v7 = v6;
  if (v6)
  {
    [v6 decimalValue];
  }
  else
  {
    v13[0] = 0;
    v13[1] = 0;
    int v14 = 0;
  }
  uint64_t v8 = [v5 decimalNumberWithDecimal:v13];

  id v9 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKey:v4];
  int v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [MEMORY[0x263F087B0] maximumDecimalNumber];
  }
  unint64_t v12 = v11;

  if ([v8 compare:v12] == -1) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v8 forKey:v4];
  }
}

void __67__FHDatabaseManager_predictAndPersistCashCardRecurringTransactions__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v98 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = [v3 objectAtIndex:1];
  os_signpost_id_t v5 = [v4 stringValue];

  uint64_t v6 = [v3 objectAtIndex:2];
  unint64_t v7 = [v6 stringValue];

  uint64_t v8 = [v3 objectAtIndex:3];
  uint64_t v92 = [v8 integerValue];

  id v9 = [*(id *)(a1 + 32) objectForKey:v5];
  int v10 = [*(id *)(a1 + 40) getTransactionByIdentifier:v5];
  id v11 = [MEMORY[0x263F087B0] numberWithInt:7];
  int v12 = [v9 isEqualToNumber:v11];

  if (v12)
  {
    uint64_t v87 = v5;
    id v13 = v3;
    int v14 = [v10 merchantDetailedCategory];
    unint64_t v15 = [v10 amount];
    id v90 = v10;
    uint64_t v16 = +[FinHealthRecurringHelper histogramKeysForMerchantDetailedCategoryTransaction:transactionAmount:transactionType:amountFromDatabase:](FinHealthRecurringHelper, "histogramKeysForMerchantDetailedCategoryTransaction:transactionAmount:transactionType:amountFromDatabase:", v14, v15, 0, [v10 amountFromDatabase]);

    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    id v17 = v16;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v93 objects:v97 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v94;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v94 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void **)(*((void *)&v93 + 1) + 8 * i);
          uint64_t v23 = [v22 featureLabel];
          if ([v23 isEqualToString:v7])
          {
            uint64_t v24 = [v22 featureRank];

            id v9 = (void *)v24;
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v93 objects:v97 count:16];
      }
      while (v19);
    }

    id v3 = v13;
    os_signpost_id_t v5 = v87;
    int v10 = v90;
  }
  uint64_t v25 = [v10 transactionDate];
  [v25 timeIntervalSinceReferenceDate];
  uint64_t v27 = v26;

  uint64_t v28 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(void *)(v28 + 40))
  {
    double v29 = [*(id *)(a1 + 40) getTransactionByIdentifier:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    uint64_t v30 = [v29 amountFromDatabase];
    if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isEqualToString:v7])
    {
      ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) += v92
                                                                   - *(void *)(*(void *)(*(void *)(a1 + 80) + 8)
                                                                               + 24);
      uint64_t v31 = *(void *)(*(void *)(a1 + 88) + 8);
      uint64_t v32 = *(void *)(v31 + 24);
      if (v32 <= v30) {
        uint64_t v32 = v30;
      }
      *(void *)(v31 + 24) = v32;
    }
    else
    {
      uint64_t v91 = v10;
      unint64_t v33 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      uint64_t v34 = *(void *)(*(void *)(a1 + 64) + 8);
      unint64_t v35 = *(void *)(v34 + 24);
      *(void *)(v34 + 24) = 0;
      *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
      double v36 = (double)(v33 / v35);
      id v86 = v3;
      switch([*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) integerValue])
      {
        case 3:
          double v37 = *(void **)(a1 + 40);
          uint64_t v38 = [v29 transactionSourceIdentifier];
          uint64_t v39 = [v29 peerPaymentCounterpartHandle];
          uint64_t v84 = [v29 amountFromDatabase];
          uint64_t v40 = [v29 peerPaymentType];
          double v41 = [v29 transactionDate];
          [v41 timeIntervalSinceReferenceDate];
          uint64_t v78 = 3;
          uint64_t v79 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          double v77 = v42 + v36;
          uint64_t v76 = v40;
          double v74 = v36;
          uint64_t v71 = v39;
          uint64_t v72 = v84;
          BOOL v70 = v38;
          goto LABEL_22;
        case 4:
          uint64_t v88 = *(void **)(a1 + 40);
          uint64_t v43 = [v29 transactionSourceIdentifier];
          uint64_t v39 = [v29 peerPaymentCounterpartHandle];
          uint64_t v44 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
          uint64_t v45 = [v29 peerPaymentType];
          double v41 = [v29 transactionDate];
          [v41 timeIntervalSinceReferenceDate];
          uint64_t v73 = v44;
          uint64_t v38 = (void *)v43;
          [v88 _execute:@"insert or replace into features_peer_payments (source_identifier, peer_pay_counterpart, amount, frequency, peer_pay_type, forecast_date, forecast_signal_type, heuristics_identifier) values (%@, %@, %d, %f, %d, %f, %d, %@)", v43, v39, v73, *(void *)&v36, v45, v46 + v36, 2, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
          goto LABEL_29;
        case 5:
          uint64_t v50 = NSString;
          uint64_t v51 = objc_msgSend(NSString, "stringWithFormat:", @"%lu-%f", objc_msgSend(v29, "amountFromDatabase"), (double)(v33 / v35));
          uint64_t v38 = objc_msgSend(v50, "stringWithFormat:", @"%lu", objc_msgSend(v51, "hash"));

          double v37 = *(void **)(a1 + 40);
          uint64_t v39 = [v29 transactionSourceIdentifier];
          uint64_t v52 = [v29 amountFromDatabase];
          double v41 = [v29 transactionDate];
          [v41 timeIntervalSinceReferenceDate];
          uint64_t v78 = 6;
          uint64_t v79 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          double v77 = v53 + v36;
          uint64_t v76 = 0;
          double v74 = v36;
          uint64_t v71 = v38;
          uint64_t v72 = v52;
          BOOL v70 = v39;
LABEL_22:
          [v37 _execute:@"insert or replace into features_peer_payments (source_identifier, peer_pay_counterpart, amount, frequency, peer_pay_type, forecast_date, forecast_signal_type, heuristics_identifier) values (%@, %@, %d, %f, %d, %f, %d, %@)", v70, v71, v72, *(void *)&v74, v76, *(void *)&v77, v78, v79];
          goto LABEL_29;
        case 7:
          v89 = *(void **)(a1 + 40);
          uint64_t v54 = [v29 transactionSourceIdentifier];
          uint64_t v39 = [v29 displayName];
          double v41 = [v29 merchantDetailedCategory];
          uint64_t v55 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
          uint64_t v83 = [v29 transactionType];
          uint64_t v81 = [v29 transactionSource];
          uint64_t v48 = [v29 transactionDate];
          [v48 timeIntervalSinceReferenceDate];
          double v57 = v56 + v36;
          uint64_t v58 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          uint64_t v59 = 2;
          goto LABEL_27;
        case 8:
          v89 = *(void **)(a1 + 40);
          uint64_t v54 = [v29 transactionSourceIdentifier];
          uint64_t v39 = [v29 displayName];
          double v41 = [v29 merchantDetailedCategory];
          uint64_t v55 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
          uint64_t v83 = [v29 transactionType];
          uint64_t v81 = [v29 transactionSource];
          uint64_t v48 = [v29 transactionDate];
          [v48 timeIntervalSinceReferenceDate];
          double v57 = v60 + v36;
          uint64_t v58 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          uint64_t v59 = 1;
          goto LABEL_27;
        case 9:
          uint64_t v47 = *(void **)(a1 + 40);
          uint64_t v38 = [v29 transactionSourceIdentifier];
          uint64_t v39 = [v29 displayName];
          double v41 = [v29 merchantDetailedCategory];
          uint64_t v85 = [v29 amountFromDatabase];
          uint64_t v82 = [v29 transactionType];
          uint64_t v80 = [v29 transactionSource];
          uint64_t v48 = [v29 transactionDate];
          [v48 timeIntervalSinceReferenceDate];
          [v47 _execute:@"insert or replace into fh_card_recurring_predictions (source_identifier, merchant, detailed_category, amount, frequency, transaction_type, transaction_source, forecast_date, forecast_signal_type, heuristic_identifier) values (%@, %@, %@, %d, %f, %d, %d, %f, %d, %@)", v38, v39, v41, v85, *(void *)&v36, v82, v80, v49 + v36, 4, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
          goto LABEL_28;
        case 10:
          v89 = *(void **)(a1 + 40);
          uint64_t v54 = [v29 transactionSourceIdentifier];
          uint64_t v39 = [v29 displayName];
          double v41 = [v29 merchantDetailedCategory];
          uint64_t v55 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
          uint64_t v83 = [v29 transactionType];
          uint64_t v81 = [v29 transactionSource];
          uint64_t v48 = [v29 transactionDate];
          [v48 timeIntervalSinceReferenceDate];
          double v57 = v61 + v36;
          uint64_t v58 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          uint64_t v59 = 3;
LABEL_27:
          uint64_t v75 = v55;
          uint64_t v38 = (void *)v54;
          [v89 _execute:@"insert or replace into fh_card_recurring_predictions (source_identifier, merchant, detailed_category, amount, frequency, transaction_type, transaction_source, forecast_date, forecast_signal_type, heuristic_identifier) values (%@, %@, %@, %d, %f, %d, %d, %f, %d, %@)", v54, v39, v41, v75, *(void *)&v36, v83, v81, *(void *)&v57, v59, v58];
LABEL_28:

LABEL_29:
          id v3 = v86;
          break;
        default:
          break;
      }
      *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0x8000000000000000;
      int v10 = v91;
    }

    uint64_t v28 = *(void *)(*(void *)(a1 + 48) + 8);
  }
  uint64_t v62 = *(void **)(v28 + 40);
  *(void *)(v28 + 40) = v7;
  id v63 = v7;

  *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v92;
  uint64_t v64 = *(void *)(*(void *)(a1 + 96) + 8);
  uint64_t v65 = *(void **)(v64 + 40);
  *(void *)(v64 + 40) = v9;
  id v66 = v9;

  uint64_t v67 = *(void *)(*(void *)(a1 + 56) + 8);
  long long v68 = *(void **)(v67 + 40);
  *(void *)(v67 + 40) = v5;
  id v69 = v5;

  *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = v27;
}

- (id)getFilteredPeerPaymentForecastingSignals
{
  id v3 = [(FHDatabaseManager *)self getAllPeerPaymentSignalsFilterDismissed:1];
  BOOL v4 = [(FHDatabaseManager *)self _filterPeriodicCategories:v3];

  return v4;
}

- (id)_filterPeriodicCategories:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v18 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v11 = (void *)MEMORY[0x253330BB0]();
        if ([v10 forecastingType] == 3)
        {
          id v12 = v10;
          uint64_t v13 = [v12 direction];
          int v14 = [v12 frequency];
          unint64_t v15 = GetPeriodicCategoryFromFrequency(v14);
          LODWORD(v13) = [(FHDatabaseManager *)self _signalMatchesSendSuggestionCriteria:v13 periodicCategory:FHRecurringPeerPaymentPeriodicCategoryTypeFromString(v15)];

          if (v13) {
            [v18 addObject:v12];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  uint64_t v16 = (void *)[v18 copy];
  return v16;
}

- (BOOL)_signalMatchesSendSuggestionCriteria:(int64_t)a3 periodicCategory:(unint64_t)a4
{
  return a3 == 1 && a4 - 3 < 3;
}

- (id)getAllPeerPaymentSignalsFilterDismissed:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v85 = *MEMORY[0x263EF8340];
  uint64_t v75 = 0;
  uint64_t v76 = &v75;
  uint64_t v77 = 0x3032000000;
  uint64_t v78 = __Block_byref_object_copy_;
  uint64_t v79 = __Block_byref_object_dispose_;
  id v80 = (id)objc_opt_new();
  id v5 = objc_opt_new();
  if (v3)
  {
    uint64_t v68 = 0;
    id v69 = &v68;
    uint64_t v70 = 0x2020000000;
    uint64_t v71 = 0;
    v74[0] = MEMORY[0x263EF8330];
    v74[1] = 3221225472;
    v74[2] = __61__FHDatabaseManager_getAllPeerPaymentSignalsFilterDismissed___block_invoke;
    v74[3] = &unk_265314B80;
    v74[4] = &v68;
    v74[5] = &v75;
    [(FHDatabaseManager *)self streamGenericSQLFetch:v74, 0, @"select * from features_instrumentation", 0 predicate sqlFetchQuery];
    _Block_object_dispose(&v68, 8);
  }
  uint64_t v68 = 0;
  id v69 = &v68;
  uint64_t v70 = 0x3032000000;
  uint64_t v71 = __Block_byref_object_copy_;
  uint64_t v72 = __Block_byref_object_dispose_;
  id v73 = 0;
  uint64_t v62 = 0;
  id v63 = &v62;
  uint64_t v64 = 0x3032000000;
  uint64_t v65 = __Block_byref_object_copy_;
  id v66 = __Block_byref_object_dispose_;
  id v67 = 0;
  uint64_t v56 = 0;
  double v57 = &v56;
  uint64_t v58 = 0x3032000000;
  uint64_t v59 = __Block_byref_object_copy_;
  double v60 = __Block_byref_object_dispose_;
  id v61 = 0;
  uint64_t v50 = 0;
  uint64_t v51 = &v50;
  uint64_t v52 = 0x3032000000;
  double v53 = __Block_byref_object_copy_;
  uint64_t v54 = __Block_byref_object_dispose_;
  id v55 = 0;
  uint64_t v44 = 0;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x3032000000;
  uint64_t v47 = __Block_byref_object_copy_;
  uint64_t v48 = __Block_byref_object_dispose_;
  id v49 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  void v43[3] = 0;
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x2020000000;
  uint64_t v42 = 0;
  uint64_t v35 = 0;
  double v36 = &v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v38 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy_;
  unint64_t v33 = __Block_byref_object_dispose_;
  id v34 = (id)objc_opt_new();
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __61__FHDatabaseManager_getAllPeerPaymentSignalsFilterDismissed___block_invoke_2;
  v17[3] = &unk_265314BD0;
  long long v19 = &v68;
  long long v20 = &v29;
  long long v21 = &v62;
  long long v22 = v43;
  uint64_t v23 = &v75;
  uint64_t v24 = &v39;
  uint64_t v25 = &v50;
  uint64_t v26 = &v44;
  uint64_t v27 = &v56;
  uint64_t v28 = &v35;
  id v6 = v5;
  id v18 = v6;
  [(FHDatabaseManager *)self streamGenericSQLFetch:v17, 0, @"select * from features_peer_payments order by peer_pay_counterpart, amount, frequency, peer_pay_type, forecast_date, forecast_signal_type limit %lu", -1 predicate sqlFetchQuery];
  if (v69[5] && ([(id)v76[5] containsObject:v63[5]] & 1) == 0)
  {
    [(id)v30[5] addObject:v63[5]];
    uint64_t v7 = FinHealthLogObject(@"FinHealthCore");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = v69[5];
      uint64_t v9 = v30[5];
      *(_DWORD *)buf = 138412546;
      uint64_t v82 = v8;
      __int16 v83 = 2112;
      uint64_t v84 = v9;
      _os_log_impl(&dword_24E029000, v7, OS_LOG_TYPE_DEBUG, "heuristicIdentifierSetByPeerPaymentHandleAndAmount %@, %@", buf, 0x16u);
    }

    uint64_t v10 = v40[3];
    switch(v10)
    {
      case 2:
        id v11 = objc_alloc_init(FHPeerPaymentForecastingSignalPerson);
        [(FHPeerPaymentForecastingSignalPerson *)v11 setPersonId:v69[5]];
        [(FHPeerPaymentForecastingSignal *)v11 setFrequency:v45[5]];
        [(FHPeerPaymentForecastingSignal *)v11 setSignalDate:v57[5]];
        [(FHPeerPaymentForecastingSignalPerson *)v11 setDirection:v36[3]];
        uint64_t v13 = (void *)[(id)v30[5] copy];
        [(FHPeerPaymentForecastingSignal *)v11 setPeerPaymentHeuristicIds:v13];

        [v6 addObject:v11];
        break;
      case 6:
        id v11 = objc_alloc_init(FHPeerPaymentForecastingSignalTopUpWithAmount);
        [(FHPeerPaymentForecastingSignalPersonWithAmount *)v11 setAmount:v51[5]];
        [(FHPeerPaymentForecastingSignal *)v11 setFrequency:v45[5]];
        [(FHPeerPaymentForecastingSignal *)v11 setSignalDate:v57[5]];
        int v14 = (void *)[(id)v30[5] copy];
        [(FHPeerPaymentForecastingSignal *)v11 setPeerPaymentHeuristicIds:v14];

        [v6 addObject:v11];
        break;
      case 3:
        id v11 = objc_alloc_init(FHPeerPaymentForecastingSignalPersonWithAmount);
        [(FHPeerPaymentForecastingSignalPerson *)v11 setPersonId:v69[5]];
        [(FHPeerPaymentForecastingSignalPersonWithAmount *)v11 setAmount:v51[5]];
        [(FHPeerPaymentForecastingSignal *)v11 setFrequency:v45[5]];
        [(FHPeerPaymentForecastingSignal *)v11 setSignalDate:v57[5]];
        [(FHPeerPaymentForecastingSignalPerson *)v11 setDirection:v36[3]];
        id v12 = (void *)[(id)v30[5] copy];
        [(FHPeerPaymentForecastingSignal *)v11 setPeerPaymentHeuristicIds:v12];

        [v6 addObject:v11];
        break;
      default:
        goto LABEL_14;
    }
  }
LABEL_14:
  unint64_t v15 = (void *)[v6 copy];

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(v43, 8);
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v56, 8);

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v68, 8);

  _Block_object_dispose(&v75, 8);
  return v15;
}

void __61__FHDatabaseManager_getAllPeerPaymentSignalsFilterDismissed___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  BOOL v3 = (void *)MEMORY[0x253330BB0]();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v9 unsignedIntAtIndex:4];
  id v4 = [v9 stringAtIndex:5];
  id v5 = v4;
  BOOL v6 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) != 1 || v4 == 0;
  if (!v6 && (unint64_t)[v4 length] >= 2)
  {
    uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v8 = [v9 stringAtIndex:5];
    [v7 addObject:v8];
  }
}

void __61__FHDatabaseManager_getAllPeerPaymentSignalsFilterDismissed___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v3 = a2;
  context = (void *)MEMORY[0x253330BB0]();
  id v4 = [v3 stringAtIndex:2];
  id v5 = [v3 stringAtIndex:8];
  BOOL v6 = (void *)MEMORY[0x263EFF910];
  uint64_t v7 = [v3 objectAtIndex:6];
  [v7 doubleValue];
  uint64_t v39 = objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");

  uint64_t v8 = (int)[v3 intAtIndex:3];
  id v9 = (void *)[objc_alloc(MEMORY[0x263F087B0]) initWithInteger:v8];
  uint64_t v10 = [MEMORY[0x263F087B0] defaultDatabaseAmountMultiplier];
  id v11 = [v9 decimalNumberByDividingBy:v10];

  id v12 = objc_alloc(MEMORY[0x263F087B0]);
  uint64_t v13 = [v3 objectAtIndex:4];
  [v13 doubleValue];
  uint64_t v38 = objc_msgSend(v12, "initWithDouble:");

  unsigned int v14 = [v3 unsignedIntAtIndex:5];
  unsigned int v15 = [v3 unsignedIntAtIndex:7];
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    if ((![v4 isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)]|| *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) != v8)&& (objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "containsObject:", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) & 1) == 0)
    {
      uint64_t v16 = FinHealthLogObject(@"FinHealthCore");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        *(_DWORD *)buf = 138412546;
        uint64_t v42 = v17;
        __int16 v43 = 2112;
        uint64_t v44 = v18;
        _os_log_impl(&dword_24E029000, v16, OS_LOG_TYPE_DEBUG, "heuristicIdentifierByPeerPaymentHandleAndAmount %@, %@", buf, 0x16u);
      }

      uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
      switch(v19)
      {
        case 2:
          long long v20 = objc_alloc_init(FHPeerPaymentForecastingSignalPerson);
          [(FHPeerPaymentForecastingSignalPerson *)v20 setPersonId:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
          break;
        case 6:
          long long v20 = objc_alloc_init(FHPeerPaymentForecastingSignalTopUpWithAmount);
          [(FHPeerPaymentForecastingSignalPersonWithAmount *)v20 setAmount:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
          [(FHPeerPaymentForecastingSignal *)v20 setFrequency:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40)];
          [(FHPeerPaymentForecastingSignal *)v20 setSignalDate:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];
          goto LABEL_14;
        case 3:
          long long v20 = objc_alloc_init(FHPeerPaymentForecastingSignalPersonWithAmount);
          [(FHPeerPaymentForecastingSignalPerson *)v20 setPersonId:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
          [(FHPeerPaymentForecastingSignalPersonWithAmount *)v20 setAmount:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
          break;
        default:
LABEL_15:
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) removeAllObjects];
          goto LABEL_16;
      }
      [(FHPeerPaymentForecastingSignal *)v20 setFrequency:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40)];
      [(FHPeerPaymentForecastingSignal *)v20 setSignalDate:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];
      [(FHPeerPaymentForecastingSignalPerson *)v20 setDirection:*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24)];
LABEL_14:
      long long v21 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) copy];
      [(FHPeerPaymentForecastingSignal *)v20 setPeerPaymentHeuristicIds:v21];

      [*(id *)(a1 + 32) addObject:v20];
      goto LABEL_15;
    }
  }
LABEL_16:
  uint64_t v22 = v15;
  uint64_t v23 = v14;
  uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v25 = *(void **)(v24 + 40);
  *(void *)(v24 + 40) = v4;
  id v26 = v4;

  uint64_t v27 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v28 = *(void **)(v27 + 40);
  *(void *)(v27 + 40) = v5;
  id v29 = v5;

  uint64_t v30 = *(void *)(*(void *)(a1 + 104) + 8);
  uint64_t v31 = *(void **)(v30 + 40);
  *(void *)(v30 + 40) = v39;
  id v32 = v39;

  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v8;
  uint64_t v33 = *(void *)(*(void *)(a1 + 88) + 8);
  id v34 = *(void **)(v33 + 40);
  *(void *)(v33 + 40) = v11;
  id v35 = v11;

  *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = v23;
  *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v22;
  uint64_t v36 = *(void *)(*(void *)(a1 + 96) + 8);
  uint64_t v37 = *(void **)(v36 + 40);
  *(void *)(v36 + 40) = v38;
}

- (id)getExpectedWeeklySpend
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F087B0] zero];
  id v4 = [MEMORY[0x263EFF910] now];
  [(FHDatabaseManager *)self getAllPeerPaymentSignalsFilterDismissed:0];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v34;
    id v32 = v5;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v11 = (void *)MEMORY[0x253330BB0]();
        uint64_t v12 = [v10 forecastingType];
        uint64_t v13 = [v10 signalDate];
        unsigned int v14 = v13;
        if (v12 == 6)
        {
          [v13 timeIntervalSinceDate:v4];
          if (v25 > 0.0)
          {
            id v26 = [v4 dateByAddingTimeInterval:(double)0x93A80uLL];
            [v26 timeIntervalSinceDate:v14];
            double v28 = v27;

            if (v28 > 0.0)
            {
              id v22 = v10;
              id v20 = [v22 amount];
              uint64_t v23 = v3;
              id v24 = v20;
LABEL_16:
              uint64_t v29 = [v23 decimalNumberByAdding:v24];
LABEL_18:
              uint64_t v19 = (void *)v29;

              goto LABEL_19;
            }
          }
        }
        else if (v12 == 3)
        {
          [v13 timeIntervalSinceDate:v4];
          if (v15 > 0.0)
          {
            uint64_t v16 = [v4 dateByAddingTimeInterval:(double)0x93A80uLL];
            [v16 timeIntervalSinceDate:v14];
            double v18 = v17;

            if (v18 > 0.0)
            {
              uint64_t v19 = v3;
              id v20 = v10;
              uint64_t v21 = [v20 direction];
              id v22 = [v20 amount];
              if (v21 == 1)
              {
                id v3 = v19;
                uint64_t v29 = [v19 decimalNumberBySubtracting:v22];
                goto LABEL_18;
              }
              if (v21 == 2)
              {
                id v3 = v19;
                uint64_t v23 = v19;
                id v24 = v22;
                goto LABEL_16;
              }
LABEL_19:
              id v3 = v19;

              id v5 = v32;
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v7);
  }

  id v30 = v3;
  return v30;
}

- (BOOL)recordPeerPaymentForecastingStatus:(unint64_t)a3 counterpartHandle:(id)a4 amount:(id)a5
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)[objc_alloc(MEMORY[0x263F087B0]) initWithInteger:100];
  uint64_t v10 = [v8 decimalNumberByMultiplyingBy:v9];
  uint64_t v11 = (int)[v10 intValue];

  id v12 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  uint64_t v13 = FinHealthLogObject(@"FinHealthCore");
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v14)
    {
      *(_DWORD *)buf = 134218498;
      unint64_t v41 = a3;
      __int16 v42 = 2112;
      id v43 = v7;
      __int16 v44 = 2112;
      id v45 = v8;
      _os_log_impl(&dword_24E029000, v13, OS_LOG_TYPE_DEBUG, "Recurring peer payment setup={FHPeerPaymentSuggestionStatusType: %lu, counterpartHandle: %@, Amount: %@}", buf, 0x20u);
    }

    double v15 = +[FinHealthRecurringHelper histogramKeysForPeerPaymentTransaction:v7 transactionAmount:v8 transactionPeerPaymentSubtype:1 amountFromDatabase:v11];
  }
  else
  {
    if (v14)
    {
      *(_DWORD *)buf = 134218242;
      unint64_t v41 = a3;
      __int16 v42 = 2112;
      id v43 = v8;
      _os_log_impl(&dword_24E029000, v13, OS_LOG_TYPE_DEBUG, "Threshold based top up setup={FHPeerPaymentSuggestionStatusType: %lu, Amount: %@}", buf, 0x16u);
    }

    double v15 = +[FinHealthRecurringHelper histogramKeysForTopUpTransaction:v8 amountFromDatabase:v11];
  }
  uint64_t v16 = v15;
  double v17 = (void *)[v15 copy];

  double v18 = FinHealthLogObject(@"FinHealthCore");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    unint64_t v41 = (unint64_t)v17;
    _os_log_impl(&dword_24E029000, v18, OS_LOG_TYPE_DEBUG, "Forecasting signal uniqueHistogramIds=%@", buf, 0xCu);
  }

  id v19 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = v17;
  uint64_t v20 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    id v31 = v8;
    uint64_t v33 = *(void *)v36;
    while (2)
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v36 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        [v19 removeAllObjects];
        id v24 = [NSNumber numberWithInteger:3];
        [v19 setObject:v24 forKey:@"TagType"];

        double v25 = [NSNumber numberWithInteger:1];
        [v19 setObject:v25 forKey:@"PassType"];

        id v26 = [NSNumber numberWithInteger:101];
        [v19 setObject:v26 forKey:@"Source"];

        double v27 = [v23 featureLabel];
        [v19 setObject:v27 forKey:@"HeuristicIdentifier"];

        double v28 = (void *)[v19 copy];
        LODWORD(v26) = [(FHDatabaseManager *)self insertInstrumentationRecord:v28];

        if (!v26)
        {
          BOOL v29 = 0;
          goto LABEL_20;
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v21) {
        continue;
      }
      break;
    }
    BOOL v29 = 1;
LABEL_20:
    id v8 = v31;
  }
  else
  {
    BOOL v29 = 1;
  }

  return v29;
}

- (BOOL)insertOrUpdateBankConnectAccount:(id)a3
{
  id v3 = a3;
  id v4 = [v3 accountBalance];
  id v5 = [MEMORY[0x263F087B0] defaultDatabaseAmountMultiplier];
  uint64_t v33 = [v4 decimalNumberByMultiplyingBy:v5];

  uint64_t v6 = [v3 creditLimit];
  id v7 = [MEMORY[0x263F087B0] defaultDatabaseAmountMultiplier];
  id v32 = [v6 decimalNumberByMultiplyingBy:v7];

  id v8 = [v3 minimumPaymentAmount];
  id v9 = [MEMORY[0x263F087B0] defaultDatabaseAmountMultiplier];
  double v25 = [v8 decimalNumberByMultiplyingBy:v9];

  uint64_t v10 = [v3 overduePaymentAmount];
  uint64_t v11 = [MEMORY[0x263F087B0] defaultDatabaseAmountMultiplier];
  id v24 = [v10 decimalNumberByMultiplyingBy:v11];

  id v30 = [v3 accountID];
  uint64_t v29 = [v3 accountType];
  uint64_t v28 = [v3 sourceType];
  double v27 = [v3 currency];
  id v31 = [MEMORY[0x263EFF910] now];
  [v31 timeIntervalSinceReferenceDate];
  uint64_t v26 = (int)v12;
  uint64_t v13 = [v3 accountCategory];
  BOOL v14 = [v3 accountDescription];
  uint64_t v15 = [v3 accountStatus];
  uint64_t v16 = [v3 nextPaymentDate];
  [v16 timeIntervalSinceReferenceDate];
  uint64_t v18 = v17;
  id v19 = [v3 institutionName];
  uint64_t v20 = [v3 institutionID];
  uint64_t v21 = [v3 uniqueAccountID];

  BOOL v22 = [(FHDatabaseManager *)self _execute:@"insert or replace into fh_account_information (source_identifier, account_type, account_balance, source_type, account_currency_code, account_date, account_category, account_description, account_status, credit_limit, next_payment_date, minimum_payment_amount, overdue_payment_amount, institution_name, institution_id, unique_account_id) values (%@, %d, %@, %d, %@, %d, %d, %@, %d, %@, %f, %@, %@, %@, %@, %@)", v30, v29, v33, v28, v27, v26, v13, v14, v15, v32, v18, v25, v24, v19, v20, v21];
  return v22;
}

- (id)getFHAccounts
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy_;
  uint64_t v10 = __Block_byref_object_dispose_;
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __34__FHDatabaseManager_getFHAccounts__block_invoke;
  v5[3] = &unk_265314AE0;
  v5[4] = &v6;
  [(FHDatabaseManager *)self streamGenericSQLFetch:v5, 0, @"select * from fh_account_information", 0 predicate sqlFetchQuery];
  id v3 = (void *)[(id)v7[5] copy];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __34__FHDatabaseManager_getFHAccounts__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v25 = objc_alloc_init(FHAccount);
  id v4 = [v3 stringAtIndex:0];
  [(FHAccount *)v25 setAccountID:v4];

  id v5 = objc_msgSend(objc_alloc(MEMORY[0x263F087B0]), "initWithInteger:", (int)objc_msgSend(v3, "intAtIndex:", 2));
  uint64_t v6 = [MEMORY[0x263F087B0] defaultDatabaseAmountMultiplier];
  id v7 = [v5 decimalNumberByDividingBy:v6];
  [(FHAccount *)v25 setAccountBalance:v7];

  -[FHAccount setSourceType:](v25, "setSourceType:", (int)[v3 intAtIndex:3]);
  uint64_t v8 = [v3 stringAtIndex:4];
  [(FHAccount *)v25 setCurrency:v8];

  -[FHAccount setAccountCategory:](v25, "setAccountCategory:", (int)[v3 intAtIndex:6]);
  -[FHAccount setAccountType:](v25, "setAccountType:", (int)[v3 intAtIndex:1]);
  id v9 = [v3 stringAtIndex:7];
  [(FHAccount *)v25 setAccountDescription:v9];

  -[FHAccount setAccountStatus:](v25, "setAccountStatus:", (int)[v3 intAtIndex:8]);
  uint64_t v10 = [v3 decimalNumberAtIndex:9];
  id v11 = [MEMORY[0x263F087B0] defaultDatabaseAmountMultiplier];
  double v12 = [v10 decimalNumberByDividingBy:v11];
  [(FHAccount *)v25 setCreditLimit:v12];

  uint64_t v13 = (void *)MEMORY[0x263EFF910];
  BOOL v14 = [v3 objectAtIndex:10];
  [v14 doubleValue];
  uint64_t v15 = objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:");
  [(FHAccount *)v25 setNextPaymentDate:v15];

  uint64_t v16 = [v3 decimalNumberAtIndex:11];
  uint64_t v17 = [MEMORY[0x263F087B0] defaultDatabaseAmountMultiplier];
  uint64_t v18 = [v16 decimalNumberByDividingBy:v17];
  [(FHAccount *)v25 setMinimumPaymentAmount:v18];

  id v19 = [v3 decimalNumberAtIndex:12];
  uint64_t v20 = [MEMORY[0x263F087B0] defaultDatabaseAmountMultiplier];
  uint64_t v21 = [v19 decimalNumberByDividingBy:v20];
  [(FHAccount *)v25 setOverduePaymentAmount:v21];

  BOOL v22 = [v3 stringAtIndex:13];
  [(FHAccount *)v25 setInstitutionName:v22];

  uint64_t v23 = [v3 stringAtIndex:14];
  [(FHAccount *)v25 setInstitutionID:v23];

  id v24 = [v3 stringAtIndex:15];

  [(FHAccount *)v25 setUniqueAccountID:v24];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v25];
}

- (BOOL)updatePeerPaymentAccountBalance:(id)a3 amount:(id)a4 currencyCode:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v24 = 0;
  double v25 = &v24;
  uint64_t v26 = 0x2020000000;
  int v27 = -1;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __73__FHDatabaseManager_updatePeerPaymentAccountBalance_amount_currencyCode___block_invoke;
  v22[3] = &unk_265314B80;
  void v22[4] = v23;
  v22[5] = &v24;
  [(FHDatabaseManager *)self streamGenericSQLFetch:v22, 0, @"select * from fh_account_information", 0 predicate sqlFetchQuery];
  id v11 = [MEMORY[0x263EFF910] now];
  [v11 timeIntervalSinceReferenceDate];
  double v13 = v12;

  BOOL v14 = [MEMORY[0x263F087B0] defaultDatabaseAmountMultiplier];
  uint64_t v15 = [v9 decimalNumberByMultiplyingBy:v14];

  LODWORD(v14) = *((_DWORD *)v25 + 6);
  if (v14 != [v15 intValue] || *((_DWORD *)v25 + 6) == -1)
  {
    BOOL v16 = [(FHDatabaseManager *)self _execute:@"insert or replace into fh_account_information (source_identifier, account_type, account_balance, account_currency_code, account_date) values (%@, %d, %@, %@, %d)", v8, 1, v15, v10, (int)v13];
    if (v16)
    {
      uint64_t v17 = FinHealthLogObject(@"FinHealthCore");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v29 = v15;
        __int16 v30 = 2112;
        id v31 = v10;
        __int16 v32 = 2112;
        id v33 = v8;
        uint64_t v18 = "Updating balance of %@ %@ for transactionSourceIdentifier=%@ in fh_acount_information database table: success";
        id v19 = v17;
        os_log_type_t v20 = OS_LOG_TYPE_DEBUG;
LABEL_9:
        _os_log_impl(&dword_24E029000, v19, v20, v18, buf, 0x20u);
      }
    }
    else
    {
      uint64_t v17 = FinHealthLogObject(@"FinHealthCore");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v29 = v15;
        __int16 v30 = 2112;
        id v31 = v10;
        __int16 v32 = 2112;
        id v33 = v8;
        uint64_t v18 = "Updating balance of %@ %@ for transactionSourceIdentifier=%@ in fh_acount_information database table: failed";
        id v19 = v17;
        os_log_type_t v20 = OS_LOG_TYPE_ERROR;
        goto LABEL_9;
      }
    }

    goto LABEL_11;
  }
  LOBYTE(v16) = 1;
LABEL_11:

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v24, 8);

  return v16;
}

void __73__FHDatabaseManager_updatePeerPaymentAccountBalance_amount_currencyCode___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  unsigned int v3 = [v5 unsignedIntAtIndex:5];
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) <= (unint64_t)v3)
  {
    unsigned int v4 = v3;
    if ([v5 intAtIndex:1] == 1)
    {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v5 unsignedIntAtIndex:2];
    }
  }
}

- (id)getCurrentCashBalance
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = -1;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v6[3] = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__FHDatabaseManager_getCurrentCashBalance__block_invoke;
  v5[3] = &unk_265314B80;
  v5[4] = v6;
  void v5[5] = &v7;
  [(FHDatabaseManager *)self streamGenericSQLFetch:v5, 0, @"select * from fh_account_information", 0 predicate sqlFetchQuery];
  id v2 = objc_alloc(MEMORY[0x263F087B0]);
  unsigned int v3 = (void *)[v2 initWithInteger:*((int *)v8 + 6)];
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(&v7, 8);
  return v3;
}

void __42__FHDatabaseManager_getCurrentCashBalance__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  unsigned int v3 = [v5 unsignedIntAtIndex:5];
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) <= (unint64_t)v3)
  {
    unsigned int v4 = v3;
    if ([v5 intAtIndex:1] == 1)
    {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v5 unsignedIntAtIndex:2];
    }
  }
}

- (void)computePaymentFeatures
{
  id v3 = objc_alloc(MEMORY[0x263EFF8F0]);
  unsigned int v4 = (void *)[v3 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  id v5 = objc_msgSend(v4, "fh_dateWithStartOfDayByAddingDaysFromNow:", -7);
  uint64_t v6 = [MEMORY[0x263EFF910] now];
  [v6 timeIntervalSinceReferenceDate];
  uint64_t v8 = (int)v7;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __43__FHDatabaseManager_computePaymentFeatures__block_invoke;
  v11[3] = &unk_265314988;
  id v12 = v5;
  id v13 = v6;
  BOOL v14 = self;
  id v9 = v6;
  id v10 = v5;
  [(FHDatabaseManager *)self streamGenericSQLFetch:v11, 0, @"select * from transactions t where t_type = %d and t_date >= %d and t_date <= %d and a_type == %d order by t_date desc limit %d", 10, 0, v8, 2, -1 predicate sqlFetchQuery];
}

void __43__FHDatabaseManager_computePaymentFeatures__block_invoke(uint64_t a1, void *a2)
{
  v19[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  unsigned int v4 = [v3 objectAtIndex:1];
  id v5 = [v3 objectAtIndex:3];
  id v6 = objc_alloc(MEMORY[0x263EFF910]);
  unsigned int v7 = [v3 unsignedIntAtIndex:9];

  uint64_t v8 = (void *)[v6 initWithTimeIntervalSinceReferenceDate:(double)v7];
  if ([v8 compare:*(void *)(a1 + 32)] == -1
    || [v8 compare:*(void *)(a1 + 40)] == 1)
  {
    id v9 = 0;
  }
  else
  {
    id v10 = (void *)MEMORY[0x263EFFA08];
    v19[0] = @"FHSmartFeatureAggregateTypeRecentPayment";
    id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
    id v9 = [v10 setWithArray:v11];
  }
  int v12 = [*(id *)(a1 + 48) _insertOrUpdateTransactionFeatures:v9 compoundFeatures:0 transactionID:v4 financeTransactionID:v5];
  id v13 = FinHealthLogObject(@"FinHealthCore");
  BOOL v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v18 = 0;
      uint64_t v15 = "Insert Payment Features : succeess";
      BOOL v16 = v14;
      os_log_type_t v17 = OS_LOG_TYPE_DEBUG;
LABEL_10:
      _os_log_impl(&dword_24E029000, v16, v17, v15, v18, 2u);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v18 = 0;
    uint64_t v15 = "Insert Payment Features : failed";
    BOOL v16 = v14;
    os_log_type_t v17 = OS_LOG_TYPE_ERROR;
    goto LABEL_10;
  }
}

- (id)_computePaymentFeaturesForTransaction:(id)a3
{
  v25[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263EFF8F0]);
  id v6 = (void *)[v5 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  unsigned int v7 = objc_msgSend(v6, "fh_dateWithStartOfDayByAddingDaysFromNow:", -7);
  uint64_t v8 = [v4 identifier];
  id v9 = [v4 transactionDate];
  id v10 = 0;
  if ([v4 transactionType] == 10)
  {
    if ([v9 compare:v7] == -1
      || ([MEMORY[0x263EFF910] now],
          id v11 = objc_claimAutoreleasedReturnValue(),
          uint64_t v12 = [v9 compare:v11],
          v11,
          v12 == 1))
    {
      id v10 = 0;
      goto LABEL_12;
    }
    id v13 = (void *)MEMORY[0x263EFFA08];
    v25[0] = @"FHSmartFeatureAggregateTypeRecentPayment";
    BOOL v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
    id v10 = [v13 setWithArray:v14];

    uint64_t v15 = [v4 financeTransactionIdentifier];
    BOOL v16 = [(FHDatabaseManager *)self _insertOrUpdateTransactionFeatures:v10 compoundFeatures:0 transactionID:v8 financeTransactionID:v15];

    os_log_type_t v17 = FinHealthLogObject(@"FinHealthCore");
    uint64_t v18 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        int v23 = 138412290;
        uint64_t v24 = v8;
        id v19 = "Insert Payment Features for transaction id %@:  success";
        os_log_type_t v20 = v18;
        os_log_type_t v21 = OS_LOG_TYPE_DEBUG;
LABEL_10:
        _os_log_impl(&dword_24E029000, v20, v21, v19, (uint8_t *)&v23, 0xCu);
      }
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v23 = 138412290;
      uint64_t v24 = v8;
      id v19 = "Insert Payment Features for transaction id %@: failed";
      os_log_type_t v20 = v18;
      os_log_type_t v21 = OS_LOG_TYPE_ERROR;
      goto LABEL_10;
    }
  }
LABEL_12:

  return v10;
}

- (void)computeAndPersistDisputeFeaturesForPendingTransactions
{
  int64_t v3 = [(FHDatabaseManager *)self mostRecentTransactionDate];
  id v4 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"SELF.%K > %lu", @"t_date", v3 - 7776000);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __75__FHDatabaseManager_computeAndPersistDisputeFeaturesForPendingTransactions__block_invoke;
  v5[3] = &unk_265314BF8;
  v5[4] = self;
  [(FHDatabaseManager *)self streamGenericSQLFetch:v5, v4, @"select * from transactions t where t.t_type == %lu and t.t_status == %lu and t.a_type == %d order by t_date desc limit %d", 0, 0, 2, -1 predicate sqlFetchQuery];
}

void __75__FHDatabaseManager_computeAndPersistDisputeFeaturesForPendingTransactions__block_invoke(uint64_t a1, void *a2)
{
  TransactionFromArray(a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = (id)[*(id *)(a1 + 32) _computeDisputeFeaturesForTransaction:v4];
}

- (id)_computeDisputeFeaturesForTransaction:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(FHDatabaseManager *)self _getDisputeFeaturesForTransaction:v4];
  id v6 = v5;
  if (v5 && [v5 count])
  {
    unsigned int v7 = [v4 identifier];
    uint64_t v8 = [v4 financeTransactionIdentifier];
    BOOL v9 = [(FHDatabaseManager *)self _insertOrUpdateTransactionFeatures:v6 compoundFeatures:0 transactionID:v7 financeTransactionID:v8];

    id v10 = FinHealthLogObject(@"FinHealthCore");
    id v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        int v16 = 138412290;
        os_log_type_t v17 = v7;
        uint64_t v12 = "computeDisputeFeaturesForTransaction: _insertOrUpdateTransactionFeatures success for transactionID %@ ";
        id v13 = v11;
        os_log_type_t v14 = OS_LOG_TYPE_DEBUG;
LABEL_8:
        _os_log_impl(&dword_24E029000, v13, v14, v12, (uint8_t *)&v16, 0xCu);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412290;
      os_log_type_t v17 = v7;
      uint64_t v12 = "computeDisputeFeaturesForTransaction: _insertOrUpdateTransactionFeatures fails for transactionID %@";
      id v13 = v11;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      goto LABEL_8;
    }
  }
  return v6;
}

- (id)_getDisputeFeaturesForTransaction:(id)a3
{
  id v3 = a3;
  if (_getDisputeFeaturesForTransaction__onceToken != -1) {
    dispatch_once(&_getDisputeFeaturesForTransaction__onceToken, &__block_literal_global_354);
  }
  if (![v3 disputeStatus])
  {
    id v10 = 0;
    goto LABEL_10;
  }
  id v4 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  [v4 addObject:@"FHSmartFeatureAggregateTypeDispute"];
  id v5 = objc_alloc(MEMORY[0x263EFF8F0]);
  id v6 = (void *)[v5 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  unsigned int v7 = objc_msgSend(v6, "fh_dateWithStartOfDayByAddingDaysFromNow:", -60);
  uint64_t v8 = (void *)_getDisputeFeaturesForTransaction__openDisputeStatuses;
  BOOL v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "disputeStatus"));
  if ([v8 containsObject:v9])
  {

LABEL_8:
    [v4 addObject:@"FHSmartFeatureAggregateTypeRecentDispute"];
    goto LABEL_9;
  }
  id v11 = [v3 disputeLastUpdatedDate];
  uint64_t v12 = [v11 compare:v7];

  if (v12 != -1) {
    goto LABEL_8;
  }
LABEL_9:
  id v10 = (void *)[v4 copy];

LABEL_10:
  return v10;
}

uint64_t __55__FHDatabaseManager__getDisputeFeaturesForTransaction___block_invoke()
{
  _getDisputeFeaturesForTransaction__openDisputeStatuses = [MEMORY[0x263EFFA08] setWithArray:&unk_2700274E0];
  return MEMORY[0x270F9A758]();
}

- (void)computeAndPersistTransactionGroupings
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __58__FHDatabaseManager_computeAndPersistTransactionGroupings__block_invoke;
  v2[3] = &unk_265314BF8;
  v2[4] = self;
  [(FHDatabaseManager *)self streamGenericSQLFetch:v2, 0, @"select t_description from fts_transactions where a_type == %d AND t_description IS NOT NULL", 4 predicate sqlFetchQuery];
}

void __58__FHDatabaseManager_computeAndPersistTransactionGroupings__block_invoke(uint64_t a1, void *a2)
{
  v50[1] = *MEMORY[0x263EF8340];
  id v29 = a2;
  id v2 = [v29 objectAtIndex:0];
  id v3 = [v2 stringValue];

  id v4 = [v3 stringByReplacingOccurrencesOfString:@"'" withString:@"''"];

  uint64_t v43 = 0;
  __int16 v44 = &v43;
  uint64_t v45 = 0x3032000000;
  uint64_t v46 = __Block_byref_object_copy_;
  uint64_t v47 = __Block_byref_object_dispose_;
  id v48 = objc_alloc_init(MEMORY[0x263EFF8C0]);
  id v5 = objc_alloc(MEMORY[0x263F14038]);
  v50[0] = *MEMORY[0x263F13FC0];
  uint64_t v6 = v50[0];
  unsigned int v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:1];
  id v33 = (void *)[v5 initWithTagSchemes:v7];

  [v33 setString:v4];
  uint64_t v8 = [v4 length];
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __58__FHDatabaseManager_computeAndPersistTransactionGroupings__block_invoke_2;
  v40[3] = &unk_265314C20;
  id v28 = v4;
  id v41 = v28;
  __int16 v42 = &v43;
  objc_msgSend(v33, "enumerateTagsInRange:unit:scheme:options:usingBlock:", 0, v8, 0, v6, 46, v40);
  BOOL v9 = NSString;
  id v10 = [(id)v44[5] componentsJoinedByString:@"\" OR \""];
  __int16 v32 = [v9 stringWithFormat:@"\"%@\"", v10];

  id v11 = NSString;
  uint64_t v12 = [(id)v44[5] componentsJoinedByString:@" "];
  id v31 = [v11 stringWithFormat:@"%@", v12];

  objc_msgSend(NSString, "stringWithFormat:", @"select t_identifier, t_description, rank from fts_transactions where (t_description match '%@') OR ((fts_transactions match '%@') AND (rank < %f)) AND a_type == %d order by t_identifier;",
    v31,
    v32,
    0xC020000000000000,
  __int16 v30 = 4);
  id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v34 = [*(id *)(a1 + 32) _lockFreeFetch:v30];
  uint64_t v14 = 1;
  while ([v34 next])
  {
    uint64_t v15 = [v34 stringAtIndex:0];
    [v34 doubleAtIndex:2];
    os_log_type_t v17 = (void *)[objc_alloc(MEMORY[0x263F087B0]) initWithDouble:v16];
    [v13 setObject:v17 forKey:v15];

    uint64_t v18 = [v15 hash];
    uint64_t v14 = v18 + 32 * v14;
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v19 = v13;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v36 objects:v49 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v37 != v21) {
          objc_enumerationMutation(v19);
        }
        uint64_t v23 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v24 = NSString;
        double v25 = [v19 valueForKey:v23];
        uint64_t v26 = [v25 stringValue];
        int v27 = [v24 stringWithFormat:@"insert or replace into fh_grouping (t_identifier, group_id, similarity_score, group_type) values ('%@', %d, %@, %d)", v23, v14, v26, 3];

        [*(id *)(a1 + 32) _execute:v27];
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v36 objects:v49 count:16];
    }
    while (v20);
  }

  _Block_object_dispose(&v43, 8);
}

void __58__FHDatabaseManager_computeAndPersistTransactionGroupings__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) arrayByAddingObject:v5];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)retrieveGroups
{
  uint64_t v6 = 0;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  BOOL v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __35__FHDatabaseManager_retrieveGroups__block_invoke;
  v5[3] = &unk_265314AE0;
  v5[4] = &v6;
  [(FHDatabaseManager *)self streamGenericSQLFetch:v5, 0, @"select t_identifier, group_id from fh_grouping", 0 predicate sqlFetchQuery];
  uint64_t v3 = (void *)[(id)v7[5] copy];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __35__FHDatabaseManager_retrieveGroups__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 objectAtIndex:0];
  id v12 = [v4 stringValue];

  id v5 = objc_alloc(MEMORY[0x263F087B0]);
  int v6 = [v3 intAtIndex:1];

  unsigned int v7 = (void *)[v5 initWithInteger:v6];
  uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKey:v7];

  if (v8)
  {
    BOOL v9 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKey:v7];
    id v10 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v11 = [v9 arrayByAddingObject:v12];
    [v10 setObject:v11 forKey:v7];
  }
  else
  {
    BOOL v9 = [MEMORY[0x263EFF8C0] arrayWithObject:v12];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v9 forKey:v7];
  }
}

- (FHFetchAllTransactionsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FHFetchAllTransactionsDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_inferredMerchants, 0);
  objc_storeStrong((id *)&self->_transactionsEntity, 0);
  objc_storeStrong((id *)&self->_transactionFeaturesCache, 0);
  objc_storeStrong((id *)&self->_batchProcessor, 0);
  objc_storeStrong((id *)&self->_dateTimeAggregatesCache, 0);
  objc_storeStrong((id *)&self->_merchantAggregatesCache, 0);
  objc_storeStrong((id *)&self->_amountAggregatesCache, 0);
  objc_storeStrong((id *)&self->_decimalRmseThreshold, 0);
  objc_storeStrong((id *)&self->_secondsInDay, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

@end