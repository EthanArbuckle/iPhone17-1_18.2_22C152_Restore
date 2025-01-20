@interface SFAnalyticsSQLiteStore
+ (SFAnalyticsSQLiteStore)storeWithPath:(id)a3 schema:(id)a4;
- (BOOL)tryToOpenDatabase;
- (NSArray)allEvents;
- (NSArray)hardFailures;
- (NSArray)rockwells;
- (NSArray)samples;
- (NSArray)softFailures;
- (NSDate)uploadDate;
- (NSString)metricsAccountID;
- (id)summaryCounts;
- (int64_t)hardFailureCountForEventType:(id)a3;
- (int64_t)softFailureCountForEventType:(id)a3;
- (int64_t)successCountForEventType:(id)a3;
- (void)addEventDict:(id)a3 toTable:(id)a4;
- (void)addEventDict:(id)a3 toTable:(id)a4 timestampBucket:(unsigned int)a5;
- (void)addRockwellDict:(id)a3 userinfo:(id)a4 toTable:(id)a5 timestampBucket:(unsigned int)a6;
- (void)addSample:(id)a3 forName:(id)a4;
- (void)clearAllData;
- (void)dealloc;
- (void)incrementHardFailureCountForEventType:(id)a3;
- (void)incrementSoftFailureCountForEventType:(id)a3;
- (void)incrementSuccessCountForEventType:(id)a3;
- (void)removeAllSamplesForName:(id)a3;
- (void)setMetricsAccountID:(id)a3;
- (void)setUploadDate:(id)a3;
@end

@implementation SFAnalyticsSQLiteStore

- (void)addEventDict:(id)a3 toTable:(id)a4 timestampBucket:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  v22[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([(SFAnalyticsSQLiteStore *)self tryToOpenDatabase])
  {
    v10 = [MEMORY[0x1E4F1C9C8] date];
    [v10 timeIntervalSince1970WithBucket:v5];
    double v12 = v11;

    id v18 = 0;
    v13 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v8 format:200 options:0 error:&v18];
    id v14 = v18;
    v15 = v14;
    if (v14 || !v13)
    {
      if (!v14 || v13) {
        goto LABEL_10;
      }
      v16 = secLogObjForScope("SecError");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v15;
        _os_log_impl(&dword_18B299000, v16, OS_LOG_TYPE_DEFAULT, "Couldn't serialize failure record: %@", buf, 0xCu);
      }
    }
    else
    {
      v21[0] = @"timestamp";
      v16 = [NSNumber numberWithDouble:v12];
      v21[1] = @"data";
      v22[0] = v16;
      v22[1] = v13;
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
      [(SFSQLite *)self insertOrReplaceInto:v9 values:v17];
    }
LABEL_10:
  }
}

- (void)incrementHardFailureCountForEventType:(id)a3
{
  v13[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SFAnalyticsSQLiteStore *)self tryToOpenDatabase])
  {
    int64_t v5 = [(SFAnalyticsSQLiteStore *)self successCountForEventType:v4];
    int64_t v6 = [(SFAnalyticsSQLiteStore *)self hardFailureCountForEventType:v4];
    int64_t v7 = [(SFAnalyticsSQLiteStore *)self softFailureCountForEventType:v4];
    v13[0] = v4;
    v12[0] = @"event_type";
    v12[1] = @"success_count";
    id v8 = [NSNumber numberWithInteger:v5];
    v13[1] = v8;
    v12[2] = @"hard_failure_count";
    id v9 = [NSNumber numberWithInteger:v6 + 1];
    v13[2] = v9;
    v12[3] = @"soft_failure_count";
    v10 = [NSNumber numberWithInteger:v7];
    v13[3] = v10;
    double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];
    [(SFSQLite *)self insertOrReplaceInto:@"success_count" values:v11];
  }
}

- (int64_t)hardFailureCountForEventType:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SFAnalyticsSQLiteStore *)self tryToOpenDatabase])
  {
    v13[0] = @"hard_failure_count";
    int64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    id v12 = v4;
    int64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
    int64_t v7 = [(SFSQLite *)self select:v5 from:@"success_count" where:@"event_type = ?" bindings:v6];
    id v8 = [v7 firstObject];
    id v9 = [v8 valueForKey:@"hard_failure_count"];
    int64_t v10 = [v9 integerValue];
  }
  else
  {
    int64_t v10 = 0;
  }

  return v10;
}

- (int64_t)softFailureCountForEventType:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SFAnalyticsSQLiteStore *)self tryToOpenDatabase])
  {
    v13[0] = @"soft_failure_count";
    int64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    id v12 = v4;
    int64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
    int64_t v7 = [(SFSQLite *)self select:v5 from:@"success_count" where:@"event_type = ?" bindings:v6];
    id v8 = [v7 firstObject];
    id v9 = [v8 valueForKey:@"soft_failure_count"];
    int64_t v10 = [v9 integerValue];
  }
  else
  {
    int64_t v10 = 0;
  }

  return v10;
}

- (BOOL)tryToOpenDatabase
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (![(SFSQLite *)self isOpen])
  {
    id v10 = 0;
    BOOL v3 = [(SFSQLite *)self openWithError:&v10];
    id v4 = v10;
    if (v3)
    {
      int64_t v5 = secLogObjForScope("SFAnalytics");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        int64_t v6 = "successfully opened analytics db";
        int64_t v7 = v5;
        uint32_t v8 = 2;
LABEL_8:
        _os_log_impl(&dword_18B299000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
    else
    {
      int64_t v5 = secLogObjForScope("SecError");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v4;
        int64_t v6 = "SFAnalytics: failed to open analytics db: %@";
        int64_t v7 = v5;
        uint32_t v8 = 12;
        goto LABEL_8;
      }
    }

    return v3;
  }
  return 1;
}

- (int64_t)successCountForEventType:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SFAnalyticsSQLiteStore *)self tryToOpenDatabase])
  {
    v13[0] = @"success_count";
    int64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    id v12 = v4;
    int64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
    int64_t v7 = [(SFSQLite *)self select:v5 from:@"success_count" where:@"event_type = ?" bindings:v6];
    uint32_t v8 = [v7 firstObject];
    id v9 = [v8 valueForKey:@"success_count"];
    int64_t v10 = [v9 integerValue];
  }
  else
  {
    int64_t v10 = 0;
  }

  return v10;
}

- (void)clearAllData
{
  if ([(SFAnalyticsSQLiteStore *)self tryToOpenDatabase])
  {
    [(SFSQLite *)self deleteFrom:@"success_count" where:@"event_type like ?" bindings:&unk_1ED86CB70];
    [(SFSQLite *)self deleteFrom:@"hard_failures" where:@"id >= 0" bindings:0];
    [(SFSQLite *)self deleteFrom:@"soft_failures" where:@"id >= 0" bindings:0];
    [(SFSQLite *)self deleteFrom:@"samples" where:@"id >= 0" bindings:0];
    [(SFSQLite *)self deleteFrom:@"rockwell" where:@"event_type like ?" bindings:&unk_1ED86CB88];
  }
}

- (void)setMetricsAccountID:(id)a3
{
  id v4 = a3;
  if ([(SFAnalyticsSQLiteStore *)self tryToOpenDatabase])
  {
    if (v4) {
      [(SFSQLite *)self setProperty:v4 forKey:@"account_id"];
    }
    else {
      [(SFSQLite *)self removePropertyForKey:@"account_id"];
    }
  }
}

- (NSString)metricsAccountID
{
  if ([(SFAnalyticsSQLiteStore *)self tryToOpenDatabase])
  {
    BOOL v3 = [(SFSQLite *)self propertyForKey:@"account_id"];
  }
  else
  {
    BOOL v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setUploadDate:(id)a3
{
  id v4 = a3;
  if ([(SFAnalyticsSQLiteStore *)self tryToOpenDatabase]) {
    [(SFSQLite *)self setDateProperty:v4 forKey:@"upload_date"];
  }
}

- (NSDate)uploadDate
{
  if ([(SFAnalyticsSQLiteStore *)self tryToOpenDatabase])
  {
    BOOL v3 = [(SFSQLite *)self datePropertyForKey:@"upload_date"];
  }
  else
  {
    BOOL v3 = 0;
  }

  return (NSDate *)v3;
}

- (void)removeAllSamplesForName:(id)a3
{
  id v5 = a3;
  if ([(SFAnalyticsSQLiteStore *)self tryToOpenDatabase])
  {
    id v4 = [NSString stringWithFormat:@"name == '%@'", v5];
    [(SFSQLite *)self deleteFrom:@"samples" where:v4 bindings:0];
  }
}

- (void)addSample:(id)a3 forName:(id)a4
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(SFAnalyticsSQLiteStore *)self tryToOpenDatabase])
  {
    v12[0] = @"timestamp";
    uint32_t v8 = NSNumber;
    id v9 = [MEMORY[0x1E4F1C9C8] date];
    [v9 timeIntervalSince1970];
    int64_t v10 = objc_msgSend(v8, "numberWithDouble:");
    v13[0] = v10;
    v13[1] = v7;
    v12[1] = @"name";
    v12[2] = @"value";
    void v13[2] = v6;
    double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
    [(SFSQLite *)self insertOrReplaceInto:@"samples" values:v11];
  }
}

- (void)addEventDict:(id)a3 toTable:(id)a4
{
}

- (void)addRockwellDict:(id)a3 userinfo:(id)a4 toTable:(id)a5 timestampBucket:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  v25[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([(SFAnalyticsSQLiteStore *)self tryToOpenDatabase])
  {
    uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
    [v13 timeIntervalSince1970WithBucket:v6];
    double v15 = v14;

    id v21 = 0;
    v16 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v11 format:200 options:0 error:&v21];
    id v17 = v21;
    id v18 = v17;
    if (v17 || !v16)
    {
      if (!v17 || v16) {
        goto LABEL_10;
      }
      v19 = secLogObjForScope("SecError");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v18;
        _os_log_impl(&dword_18B299000, v19, OS_LOG_TYPE_DEFAULT, "Couldn't serialize failure record: %@", buf, 0xCu);
      }
    }
    else
    {
      v25[0] = v10;
      v24[0] = @"event_type";
      v24[1] = @"timestamp";
      v19 = [NSNumber numberWithDouble:v15];
      v24[2] = @"data";
      v25[1] = v19;
      v25[2] = v16;
      v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];
      [(SFSQLite *)self insertOrReplaceInto:v12 values:v20];
    }
LABEL_10:
  }
}

- (NSArray)samples
{
  v6[2] = *MEMORY[0x1E4F143B8];
  if ([(SFAnalyticsSQLiteStore *)self tryToOpenDatabase])
  {
    v6[0] = @"name";
    v6[1] = @"value";
    BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
    id v4 = [(SFSQLite *)self select:v3 from:@"samples"];
  }
  else
  {
    id v4 = objc_opt_new();
  }

  return (NSArray *)v4;
}

- (NSArray)allEvents
{
  v20[2] = *MEMORY[0x1E4F143B8];
  if ([(SFAnalyticsSQLiteStore *)self tryToOpenDatabase])
  {
    [(SFSQLite *)self begin];
    BOOL v3 = objc_opt_new();
    v20[0] = @"timestamp";
    v20[1] = @"data";
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    id v5 = [(SFSQLite *)self select:v4 from:@"rockwell" mapEachRow:&__block_literal_global_47];

    [v3 addObjectsFromArray:v5];
    v19[0] = @"timestamp";
    v19[1] = @"data";
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    id v7 = [(SFSQLite *)self select:v6 from:@"hard_failures" mapEachRow:&__block_literal_global_47];

    [v3 addObjectsFromArray:v7];
    v18[0] = @"timestamp";
    v18[1] = @"data";
    uint32_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    id v9 = [(SFSQLite *)self select:v8 from:@"soft_failures" mapEachRow:&__block_literal_global_47];

    [v3 addObjectsFromArray:v9];
    v17[0] = @"timestamp";
    v17[1] = @"data";
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    id v11 = [(SFSQLite *)self select:v10 from:@"notes" mapEachRow:&__block_literal_global_47];

    [v3 addObjectsFromArray:v11];
    [(SFSQLite *)self end];
    id v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"timestamp" ascending:1];
    v16 = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
    [v3 sortUsingDescriptors:v13];

    double v14 = [v3 valueForKey:@"record"];
  }
  else
  {
    double v14 = objc_opt_new();
  }

  return (NSArray *)v14;
}

id __35__SFAnalyticsSQLiteStore_allEvents__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[SFAnalyticsEvent alloc] initFromRow:v2];

  return v3;
}

- (NSArray)softFailures
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if ([(SFAnalyticsSQLiteStore *)self tryToOpenDatabase])
  {
    v6[0] = @"data";
    id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    id v4 = [(SFSQLite *)self select:v3 from:@"soft_failures" mapEachRow:&__block_literal_global_44];
  }
  else
  {
    id v4 = objc_opt_new();
  }

  return (NSArray *)v4;
}

id __38__SFAnalyticsSQLiteStore_softFailures__block_invoke(uint64_t a1, void *a2)
{
  return deserializedRecordFromRow(a2);
}

- (NSArray)hardFailures
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if ([(SFAnalyticsSQLiteStore *)self tryToOpenDatabase])
  {
    v6[0] = @"data";
    id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    id v4 = [(SFSQLite *)self select:v3 from:@"hard_failures" mapEachRow:&__block_literal_global_42_5360];
  }
  else
  {
    id v4 = objc_opt_new();
  }

  return (NSArray *)v4;
}

id __38__SFAnalyticsSQLiteStore_hardFailures__block_invoke(uint64_t a1, void *a2)
{
  return deserializedRecordFromRow(a2);
}

- (NSArray)rockwells
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if ([(SFAnalyticsSQLiteStore *)self tryToOpenDatabase])
  {
    v6[0] = @"data";
    id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    id v4 = [(SFSQLite *)self select:v3 from:@"rockwell" mapEachRow:&__block_literal_global_5362];
  }
  else
  {
    id v4 = objc_opt_new();
  }

  return (NSArray *)v4;
}

id __35__SFAnalyticsSQLiteStore_rockwells__block_invoke(uint64_t a1, void *a2)
{
  return deserializedRecordFromRow(a2);
}

- (id)summaryCounts
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([(SFAnalyticsSQLiteStore *)self tryToOpenDatabase])
  {
    id v15 = [MEMORY[0x1E4F1CA60] dictionary];
    [(SFSQLite *)self selectAllFrom:@"success_count" where:0 bindings:0];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v3 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v18 != v5) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint32_t v8 = [v7 objectForKeyedSubscript:@"event_type"];
          if (v8)
          {
            v21[0] = @"success_count";
            id v9 = objc_msgSend(v7, "objectForKeyedSubscript:");
            v22[0] = v9;
            v21[1] = @"hard_failure_count";
            id v10 = [v7 objectForKeyedSubscript:@"hard_failure_count"];
            v22[1] = v10;
            void v21[2] = @"soft_failure_count";
            id v11 = [v7 objectForKeyedSubscript:@"soft_failure_count"];
            v22[2] = v11;
            id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
            [v15 setObject:v12 forKeyedSubscript:v8];
          }
          else
          {
            id v9 = secLogObjForScope("SFAnalytics");
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_18B299000, v9, OS_LOG_TYPE_DEBUG, "ignoring entry in success counts table without an event name", buf, 2u);
            }
          }
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
      }
      while (v4);
    }
  }
  else
  {
    id v15 = (id)objc_opt_new();
  }

  return v15;
}

- (void)incrementSoftFailureCountForEventType:(id)a3
{
  void v13[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SFAnalyticsSQLiteStore *)self tryToOpenDatabase])
  {
    int64_t v5 = [(SFAnalyticsSQLiteStore *)self successCountForEventType:v4];
    int64_t v6 = [(SFAnalyticsSQLiteStore *)self hardFailureCountForEventType:v4];
    int64_t v7 = [(SFAnalyticsSQLiteStore *)self softFailureCountForEventType:v4];
    v13[0] = v4;
    v12[0] = @"event_type";
    v12[1] = @"success_count";
    uint32_t v8 = [NSNumber numberWithInteger:v5];
    v13[1] = v8;
    v12[2] = @"hard_failure_count";
    id v9 = [NSNumber numberWithInteger:v6];
    void v13[2] = v9;
    void v12[3] = @"soft_failure_count";
    id v10 = [NSNumber numberWithInteger:v7 + 1];
    v13[3] = v10;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];
    [(SFSQLite *)self insertOrReplaceInto:@"success_count" values:v11];
  }
}

- (void)incrementSuccessCountForEventType:(id)a3
{
  void v13[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SFAnalyticsSQLiteStore *)self tryToOpenDatabase])
  {
    int64_t v5 = [(SFAnalyticsSQLiteStore *)self successCountForEventType:v4];
    int64_t v6 = [(SFAnalyticsSQLiteStore *)self hardFailureCountForEventType:v4];
    int64_t v7 = [(SFAnalyticsSQLiteStore *)self softFailureCountForEventType:v4];
    v13[0] = v4;
    v12[0] = @"event_type";
    v12[1] = @"success_count";
    uint32_t v8 = [NSNumber numberWithInteger:v5 + 1];
    v13[1] = v8;
    v12[2] = @"hard_failure_count";
    id v9 = [NSNumber numberWithInteger:v6];
    void v13[2] = v9;
    void v12[3] = @"soft_failure_count";
    id v10 = [NSNumber numberWithInteger:v7];
    v13[3] = v10;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];
    [(SFSQLite *)self insertOrReplaceInto:@"success_count" values:v11];
  }
}

- (void)dealloc
{
  [(SFSQLite *)self close];
  v3.receiver = self;
  v3.super_class = (Class)SFAnalyticsSQLiteStore;
  [(SFSQLite *)&v3 dealloc];
}

+ (SFAnalyticsSQLiteStore)storeWithPath:(id)a3 schema:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![v6 length])
  {
    uint32_t v8 = secLogObjForScope("SecCritical");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      double v14 = "Cannot init db with empty path";
LABEL_14:
      _os_log_impl(&dword_18B299000, v8, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
    }
LABEL_15:
    id v9 = 0;
    goto LABEL_16;
  }
  if (![v7 length])
  {
    uint32_t v8 = secLogObjForScope("SecCritical");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      double v14 = "Cannot init db without schema";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  uint32_t v8 = [v6 stringByStandardizingPath];
  id v9 = (void *)[objc_alloc((Class)a1) initWithPath:v8 schema:v7];
  id v16 = 0;
  char v10 = [v9 openWithError:&v16];
  id v11 = v16;
  id v12 = v11;
  if ((v10 & 1) == 0 && (!v11 || [v11 code] != 23))
  {
    uint64_t v13 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v18 = v12;
      _os_log_impl(&dword_18B299000, v13, OS_LOG_TYPE_DEFAULT, "SFAnalytics: could not open db at init, will try again later. Error: %@", buf, 0xCu);
    }
  }
LABEL_16:

  return (SFAnalyticsSQLiteStore *)v9;
}

@end