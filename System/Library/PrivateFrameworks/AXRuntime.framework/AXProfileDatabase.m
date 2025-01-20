@interface AXProfileDatabase
+ (id)sharedDatabase;
- (AXProfileDatabase)init;
- (id)debugStatistics;
- (id)transactionSummary;
- (void)registerEntry:(id)a3;
@end

@implementation AXProfileDatabase

+ (id)sharedDatabase
{
  if (sharedDatabase_onceToken != -1) {
    dispatch_once(&sharedDatabase_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)sharedDatabase___sharedDatabase;
  return v2;
}

uint64_t __35__AXProfileDatabase_sharedDatabase__block_invoke()
{
  sharedDatabase___sharedDatabase = objc_alloc_init(AXProfileDatabase);
  return MEMORY[0x1F41817F8]();
}

- (AXProfileDatabase)init
{
  v7.receiver = self;
  v7.super_class = (Class)AXProfileDatabase;
  v2 = [(AXProfileDatabase *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    entries = v2->_entries;
    v2->_entries = v3;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_gatherTransactionSummary, @"AXGatherTransactionSummary", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)registerEntry:(id)a3
{
}

- (id)transactionSummary
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v19 = (id)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"app,attributeName,pid,uid,type,attribute,size,hash,duration\n"];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obj = self->_entries;
  uint64_t v20 = [(NSMutableArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v20)
  {
    uint64_t v18 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(obj);
        }
        v4 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v5 = [v4 appName];
        uint64_t v6 = [v4 attribute];
        objc_super v7 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v6);
        uint64_t v21 = [v4 pid];
        [v4 uid];
        uint64_t v9 = v8;
        uint64_t v10 = [v4 uid];
        uint64_t v11 = [v4 type];
        uint64_t v12 = [v4 attribute];
        uint64_t v13 = [v4 valueSize];
        uint64_t v14 = [v4 valueHash];
        [v4 duration];
        [v19 appendFormat:@"%@,%@,%d,%llu.%llu,%lu,%ld,%lu,%lu,%f\n", v5, v7, v21, v9, v10, v11, v12, v13, v14, v15];
      }
      uint64_t v20 = [(NSMutableArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v20);
  }

  return v19;
}

- (id)debugStatistics
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v37 = (id)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:&stru_1F141B5A8];
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obuint64_t j = self->_entries;
  uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v35 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v47 != v35) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v8, "attribute"));
        uint64_t v10 = [v3 objectForKeyedSubscript:v9];
        if (!v10)
        {
          uint64_t v10 = objc_opt_new();
          [v3 setObject:v10 forKeyedSubscript:v9];
        }
        uint64_t v11 = [v4 objectForKeyedSubscript:v9];
        if (!v11)
        {
          uint64_t v11 = objc_opt_new();
          [v4 setObject:v11 forKeyedSubscript:v9];
        }
        uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "unsignedIntegerValue") + 1);
        [v3 setObject:v12 forKeyedSubscript:v9];

        uint64_t v13 = NSNumber;
        [v11 doubleValue];
        double v15 = v14;
        [v8 duration];
        v17 = [v13 numberWithDouble:v15 + v16];
        [v4 setObject:v17 forKeyedSubscript:v9];
      }
      uint64_t v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v46 objects:v52 count:16];
    }
    while (v6);
  }

  v36 = [v4 keysSortedByValueUsingSelector:sel_compare_];
  uint64_t v18 = [v3 keysSortedByValueUsingSelector:sel_compare_];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v19 = [v18 reverseObjectEnumerator];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v42 objects:v51 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v43 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v42 + 1) + 8 * j);
        long long v25 = [v3 objectForKeyedSubscript:v24];
        [v37 appendFormat:@"%@ = %@\n", v24, v25];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v42 objects:v51 count:16];
    }
    while (v21);
  }

  [v37 appendString:@"\n"];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v26 = [v36 reverseObjectEnumerator];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v38 objects:v50 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v39;
    do
    {
      for (uint64_t k = 0; k != v28; ++k)
      {
        if (*(void *)v39 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = *(void *)(*((void *)&v38 + 1) + 8 * k);
        v32 = [v4 objectForKeyedSubscript:v31];
        [v37 appendFormat:@"%@ = %@\n", v31, v32];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v38 objects:v50 count:16];
    }
    while (v28);
  }

  return v37;
}

- (void).cxx_destruct
{
}

@end