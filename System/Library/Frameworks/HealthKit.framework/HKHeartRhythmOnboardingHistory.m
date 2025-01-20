@interface HKHeartRhythmOnboardingHistory
- (BOOL)containsOnboardedVersion:(int64_t)a3;
- (HKHeartRhythmOnboardingHistory)initWithDictionary:(id)a3;
- (NSDictionary)dataSource;
- (id)_emptyHistory;
- (id)_filterLessThanOrEqualToVersion:(int64_t)a3;
- (id)_filterOnlyLessThanVersion:(int64_t)a3;
- (id)description;
- (id)filteredHistoryByVersion:(int64_t)a3 filterType:(int64_t)a4;
- (int64_t)count;
- (int64_t)maxOnboardedVersion;
@end

@implementation HKHeartRhythmOnboardingHistory

- (HKHeartRhythmOnboardingHistory)initWithDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKHeartRhythmOnboardingHistory;
  v6 = [(HKHeartRhythmOnboardingHistory *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    v7->_count = [v5 count];
  }

  return v7;
}

- (id)filteredHistoryByVersion:(int64_t)a3 filterType:(int64_t)a4
{
  if (a4 == 2)
  {
    v4 = [(HKHeartRhythmOnboardingHistory *)self _filterOnlyLessThanVersion:a3];
  }
  else
  {
    if (a4 != 1) {
      goto LABEL_6;
    }
    v4 = [(HKHeartRhythmOnboardingHistory *)self _filterLessThanOrEqualToVersion:a3];
  }
  a2 = v4;
LABEL_6:

  return (id)(id)a2;
}

- (id)_filterLessThanOrEqualToVersion:(int64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F1CA60];
  v6 = [(HKHeartRhythmOnboardingHistory *)self dataSource];
  v7 = objc_msgSend(v5, "dictionaryWithCapacity:", objc_msgSend(v6, "count"));

  v8 = [(HKHeartRhythmOnboardingHistory *)self dataSource];
  objc_super v9 = [v8 allKeys];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v15, "integerValue", (void)v20) <= a3)
        {
          v16 = [(HKHeartRhythmOnboardingHistory *)self dataSource];
          v17 = [v16 objectForKeyedSubscript:v15];
          [v7 setObject:v17 forKeyedSubscript:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }

  v18 = [[HKHeartRhythmOnboardingHistory alloc] initWithDictionary:v7];

  return v18;
}

- (id)_filterOnlyLessThanVersion:(int64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = [(HKHeartRhythmOnboardingHistory *)self dataSource];
  v6 = [v5 allKeys];

  if ([v6 count])
  {
    v7 = (void *)MEMORY[0x1E4F1CA60];
    v8 = [(HKHeartRhythmOnboardingHistory *)self dataSource];
    objc_super v9 = objc_msgSend(v7, "dictionaryWithCapacity:", objc_msgSend(v8, "count"));

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v20 = v6;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ([v15 integerValue] >= a3)
          {
            v18 = [(HKHeartRhythmOnboardingHistory *)self _emptyHistory];

            goto LABEL_12;
          }
          v16 = [(HKHeartRhythmOnboardingHistory *)self dataSource];
          v17 = [v16 objectForKeyedSubscript:v15];
          [v9 setObject:v17 forKeyedSubscript:v15];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    v18 = [[HKHeartRhythmOnboardingHistory alloc] initWithDictionary:v9];
LABEL_12:

    v6 = v20;
  }
  else
  {
    v18 = [(HKHeartRhythmOnboardingHistory *)self _emptyHistory];
  }

  return v18;
}

- (id)_emptyHistory
{
  v2 = [HKHeartRhythmOnboardingHistory alloc];
  v3 = [(HKHeartRhythmOnboardingHistory *)v2 initWithDictionary:MEMORY[0x1E4F1CC08]];

  return v3;
}

- (int64_t)maxOnboardedVersion
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [(HKHeartRhythmOnboardingHistory *)self dataSource];
  v3 = [v2 allKeys];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int64_t v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "integerValue", (void)v12) > v7) {
          int64_t v7 = [v10 integerValue];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (BOOL)containsOnboardedVersion:(int64_t)a3
{
  id v4 = [(HKHeartRhythmOnboardingHistory *)self dataSource];
  uint64_t v5 = [v4 allKeys];

  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%i", a3);
  LOBYTE(v4) = [v5 containsObject:v6];

  return (char)v4;
}

- (id)description
{
  v2 = NSString;
  v3 = [(HKHeartRhythmOnboardingHistory *)self dataSource];
  id v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (NSDictionary)dataSource
{
  return self->_dataSource;
}

- (int64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
}

@end