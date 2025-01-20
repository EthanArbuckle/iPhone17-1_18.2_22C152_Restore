@interface FHBatchProcessor
+ (FHBatchProcessor)initWithBuilder:(id)a3;
- (FHDatabaseManager)databaseManager;
- (NSArray)filteredTransaction;
- (NSSet)merchantsWithSignificantCount;
- (id)_init:(id)a3;
- (void)fetchAndProcessInBatchMode;
- (void)processBatch:(id)a3;
@end

@implementation FHBatchProcessor

+ (FHBatchProcessor)initWithBuilder:(id)a3
{
  v3 = (void (**)(id, void *))a3;
  v4 = objc_opt_new();
  v3[2](v3, v4);

  id v5 = [[FHBatchProcessor alloc] _init:v4];
  return (FHBatchProcessor *)v5;
}

- (id)_init:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)FHBatchProcessor;
  id v5 = [(FHBatchProcessor *)&v46 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263F087B0];
    v7 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", 86400);
    uint64_t v8 = [v6 decimalNumberWithString:v7];
    secondsInDay = v5->_secondsInDay;
    v5->_secondsInDay = (NSDecimalNumber *)v8;

    uint64_t v10 = objc_opt_new();
    merchantWithTimeStampPairs = v5->_merchantWithTimeStampPairs;
    v5->_merchantWithTimeStampPairs = (NSMutableArray *)v10;

    uint64_t v12 = objc_opt_new();
    indexedAmountArray = v5->_indexedAmountArray;
    v5->_indexedAmountArray = (NSMutableArray *)v12;

    v14 = objc_opt_new();
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v41 = v4;
    v15 = [v4 internalStates];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v43 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"SELF.%K == %lu", @"transactionInternalState", objc_msgSend(*(id *)(*((void *)&v42 + 1) + 8 * i), "integerValue"));
          [v14 addObject:v20];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v17);
    }

    v21 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"SELF.%K != nil", @"displayName");
    v22 = (void *)MEMORY[0x263F08730];
    v23 = [MEMORY[0x263EFF8C0] arrayWithArray:v14];
    v24 = [v22 orPredicateWithSubpredicates:v23];

    v25 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"SELF.%K == %lu AND SELF.%K == %lu AND SELF.%K == %lu", @"transactionStatus", 1, @"transactionType", 0, @"accountType", 2);
    v26 = (void *)MEMORY[0x263F08730];
    v27 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v21, v24, v25, 0);
    uint64_t v28 = [v26 andPredicateWithSubpredicates:v27];
    predicates = v5->_predicates;
    v5->_predicates = (NSPredicate *)v28;

    id v4 = v41;
    v30 = [v41 databaseManager];
    objc_storeWeak((id *)&v5->_databaseManager, v30);

    uint64_t v31 = [v41 startDate];
    if (v31)
    {
      v32 = (void *)v31;
      v33 = [v41 endDate];

      if (v33)
      {
        uint64_t v34 = [v41 startDate];
        startDate = v5->_startDate;
        v5->_startDate = (NSDate *)v34;

        uint64_t v36 = [v41 endDate];
        endDate = v5->_endDate;
        v5->_endDate = (NSDate *)v36;

        uint64_t v38 = objc_opt_new();
        resultArray = v5->_resultArray;
        v5->_resultArray = (NSMutableArray *)v38;
      }
    }
    v5->_computeMerchantCounts = [v41 computeMerchantCounts];
  }
  return v5;
}

- (void)fetchAndProcessInBatchMode
{
  [(NSMutableArray *)self->_resultArray removeAllObjects];
  [(NSMutableArray *)self->_indexedAmountArray removeAllObjects];
  [(NSMutableArray *)self->_merchantWithTimeStampPairs removeAllObjects];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_databaseManager);
  [WeakRetained setDelegate:self];

  id v4 = objc_loadWeakRetained((id *)&self->_databaseManager);
  [v4 retrieveAll];
}

- (NSSet)merchantsWithSignificantCount
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  context = (void *)MEMORY[0x253330BB0]();
  id v4 = (void *)MEMORY[0x263F087B0];
  id v5 = NSString;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_databaseManager);
  v7 = objc_msgSend(v5, "stringWithFormat:", @"%lu", objc_msgSend(WeakRetained, "mostRecentTransactionDate"));
  v30 = [v4 decimalNumberWithString:v7];

  uint64_t v8 = FinHealthLogObject(@"FinHealthCore");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = [v30 stringValue];
    *(_DWORD *)buf = 138412290;
    v40 = v9;
    _os_log_impl(&dword_24E029000, v8, OS_LOG_TYPE_DEBUG, "mostRecentDate %@", buf, 0xCu);
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obj = self->_merchantWithTimeStampPairs;
  uint64_t v10 = v30;
  uint64_t v33 = [(NSMutableArray *)obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v33)
  {
    uint64_t v11 = 0;
    uint64_t v32 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        v13 = v3;
        if (*(void *)v35 != v32) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v15 = [v14 featureRank];
        uint64_t v16 = [v10 decimalNumberBySubtracting:v15];
        uint64_t v17 = [v16 decimalNumberByDividingBy:self->_secondsInDay];

        uint64_t v18 = [(NSMutableArray *)self->_indexedAmountArray objectAtIndex:v11 + i];
        [v18 doubleValue];
        double v20 = v19;

        [v17 doubleValue];
        if (v20 > 0.0 && v20 * exp(v21 * -0.074) >= 0.1)
        {
          v22 = [v14 featureLabel];
          v23 = [v13 objectForKey:v22];

          if (!v23)
          {
            v23 = [MEMORY[0x263F087B0] zero];
          }
          v24 = [MEMORY[0x263F087B0] one];
          v25 = [v23 decimalNumberByAdding:v24];
          v26 = [v14 featureLabel];
          [v13 setValue:v25 forKey:v26];

          uint64_t v10 = v30;
        }

        v3 = v13;
      }
      v11 += i;
      uint64_t v33 = [(NSMutableArray *)obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v33);
  }

  v27 = [v3 keysOfEntriesPassingTest:&__block_literal_global_3];

  return (NSSet *)v27;
}

BOOL __49__FHBatchProcessor_merchantsWithSignificantCount__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return (int)[a3 intValue] > 1;
}

- (void)processBatch:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 filteredArrayUsingPredicate:self->_predicates];
  v6 = v5;
  if (self->_computeMerchantCounts)
  {
    v30 = v5;
    id v31 = v4;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = v5;
    uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v34 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          uint64_t v12 = [v11 transactionDate];
          [v12 timeIntervalSinceReferenceDate];
          unint64_t v14 = (unint64_t)v13;

          v15 = (void *)MEMORY[0x253330BB0]();
          uint64_t v16 = (void *)MEMORY[0x263F087B0];
          uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v14);
          uint64_t v18 = [v16 decimalNumberWithString:v17];

          double v19 = [FHSmartCompoundFeatureRankedValue alloc];
          double v20 = [v11 displayName];
          double v21 = [(FHSmartCompoundFeatureRankedValue *)v19 initWithLabelAndRank:v20 featureRank:v18];

          [(NSMutableArray *)self->_merchantWithTimeStampPairs addObject:v21];
          indexedAmountArray = self->_indexedAmountArray;
          v23 = [v11 amount];
          [(NSMutableArray *)indexedAmountArray addObject:v23];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v8);
    }

    v6 = v30;
    id v4 = v31;
  }
  startDate = self->_startDate;
  if (startDate)
  {
    endDate = self->_endDate;
    if (endDate)
    {
      resultArray = self->_resultArray;
      v27 = [MEMORY[0x263F08A98] predicateWithFormat:@"(SELF.%K >= %@) AND (SELF.%K <= %@)", @"transactionDate", startDate, @"transactionDate", endDate];
      uint64_t v28 = [v6 filteredArrayUsingPredicate:v27];
      v29 = [v28 valueForKey:@"amountFromDatabase"];
      [(NSMutableArray *)resultArray addObjectsFromArray:v29];
    }
  }
}

- (NSArray)filteredTransaction
{
  return (NSArray *)[MEMORY[0x263EFF8C0] arrayWithArray:self->_resultArray];
}

- (FHDatabaseManager)databaseManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_databaseManager);
  return (FHDatabaseManager *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_databaseManager);
  objc_storeStrong((id *)&self->_predicates, 0);
  objc_storeStrong((id *)&self->_secondsInDay, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_resultArray, 0);
  objc_storeStrong((id *)&self->_indexedAmountArray, 0);
  objc_storeStrong((id *)&self->_merchantWithTimeStampPairs, 0);
}

@end