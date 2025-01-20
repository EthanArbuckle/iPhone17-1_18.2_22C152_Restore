@interface DESUserDefaultsStoreRecord
+ (id)bmltActivatedEventDate;
+ (id)schedulerWakeupPeriodInSeconds;
+ (void)purgeObsoleted;
+ (void)setBmltActivatedEventDate:(id)a3;
+ (void)setSchedulerWakeupPeriodInSeconds:(id)a3;
- (BOOL)shouldRegisterXPCActivity;
- (DESUserDefaultsStoreRecord)initWithRecordID:(id)a3;
- (NSDate)lastCompletionDate;
- (NSDictionary)debugInfo;
- (NSNumber)maxTimeLimitInSeconds;
- (NSNumber)periodInSeconds;
- (NSString)completionDateKey;
- (NSString)recordID;
- (id)debugInfoKey;
- (id)description;
- (id)maxTimeLimitKey;
- (id)performCountKey;
- (id)periodKey;
- (id)shouldRegisterXPCActivityKey;
- (int64_t)performCount;
- (void)setDebugInfo:(id)a3;
- (void)setLastCompletionDate:(id)a3;
- (void)setMaxTimeLimitInSeconds:(id)a3;
- (void)setPerformCount:(int64_t)a3;
- (void)setPeriodInSeconds:(id)a3;
- (void)setShouldRegisterXPCActivity:(BOOL)a3;
@end

@implementation DESUserDefaultsStoreRecord

+ (void)purgeObsoleted
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1C189B250](a1, a2);
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v3 = [v2 dictionaryRepresentation];
  v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-604800.0];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v10 hasPrefix:@"LastCompletionDate-"])
        {
          v11 = [v2 objectForKey:v10];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || [v11 compare:v4] != 1)
          {
            [v2 removeObjectForKey:v10];
            v12 = [v10 substringFromIndex:objc_msgSend(@"LastCompletionDate-", "length")];
            v13 = [@"PerformCount-" stringByAppendingString:v12];

            if (v13)
            {
              v14 = [v5 objectForKeyedSubscript:v13];

              if (v14) {
                [v2 removeObjectForKey:v13];
              }
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
}

+ (id)schedulerWakeupPeriodInSeconds
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v3 = [v2 objectForKey:@"SchedulerInterval"];

  return v3;
}

+ (void)setSchedulerWakeupPeriodInSeconds:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  id v5 = [v3 standardUserDefaults];
  [v5 setObject:v4 forKey:@"SchedulerInterval"];
}

+ (id)bmltActivatedEventDate
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v3 = [v2 objectForKey:@"BMLTActivatedEventDate"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

+ (void)setBmltActivatedEventDate:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  id v5 = [v3 standardUserDefaults];
  [v5 setObject:v4 forKey:@"BMLTActivatedEventDate"];
}

- (DESUserDefaultsStoreRecord)initWithRecordID:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)DESUserDefaultsStoreRecord;
    uint64_t v6 = [(DESUserDefaultsStoreRecord *)&v10 init];
    uint64_t v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_recordID, a3);
    }
    self = v7;
    uint64_t v8 = self;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(DESUserDefaultsStoreRecord *)self recordID];
  int64_t v7 = [(DESUserDefaultsStoreRecord *)self performCount];
  uint64_t v8 = [(DESUserDefaultsStoreRecord *)self lastCompletionDate];
  v9 = [(DESUserDefaultsStoreRecord *)self periodInSeconds];
  objc_super v10 = [(DESUserDefaultsStoreRecord *)self maxTimeLimitInSeconds];
  v11 = [v3 stringWithFormat:@"%@(%@, %lu, %@, %@, %@)", v5, v6, v7, v8, v9, v10];

  return v11;
}

- (NSString)completionDateKey
{
  return (NSString *)[@"LastCompletionDate-" stringByAppendingString:self->_recordID];
}

- (NSDate)lastCompletionDate
{
  v2 = [(DESUserDefaultsStoreRecord *)self completionDateKey];
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v4 = [v3 objectForKey:v2];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  uint64_t v6 = v5;

  return (NSDate *)v6;
}

- (void)setLastCompletionDate:(id)a3
{
  id v4 = a3;
  id v6 = [(DESUserDefaultsStoreRecord *)self completionDateKey];
  id v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v5 setObject:v4 forKey:v6];
}

- (id)performCountKey
{
  return (id)[@"PerformCount-" stringByAppendingString:self->_recordID];
}

- (int64_t)performCount
{
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v4 = [(DESUserDefaultsStoreRecord *)self performCountKey];
  id v5 = [v3 objectForKey:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v6 = [v5 integerValue];
  }
  else {
    int64_t v6 = 0;
  }

  return v6;
}

- (void)setPerformCount:(int64_t)a3
{
  id v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v5 = [NSNumber numberWithInteger:a3];
  int64_t v6 = [(DESUserDefaultsStoreRecord *)self performCountKey];
  [v7 setObject:v5 forKey:v6];
}

- (id)debugInfoKey
{
  return (id)[@"DebugInfo-" stringByAppendingString:self->_recordID];
}

- (NSDictionary)debugInfo
{
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v4 = [(DESUserDefaultsStoreRecord *)self debugInfoKey];
  id v5 = [v3 dictionaryForKey:v4];

  return (NSDictionary *)v5;
}

- (void)setDebugInfo:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CB18];
  id v5 = a3;
  id v7 = [v4 standardUserDefaults];
  int64_t v6 = [(DESUserDefaultsStoreRecord *)self debugInfoKey];
  [v7 setObject:v5 forKey:v6];
}

- (id)periodKey
{
  return (id)[@"Period-" stringByAppendingString:self->_recordID];
}

- (NSNumber)periodInSeconds
{
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v4 = [(DESUserDefaultsStoreRecord *)self periodKey];
  id v5 = [v3 objectForKey:v4];

  return (NSNumber *)v5;
}

- (void)setPeriodInSeconds:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CB18];
  id v5 = a3;
  id v7 = [v4 standardUserDefaults];
  int64_t v6 = [(DESUserDefaultsStoreRecord *)self periodKey];
  [v7 setObject:v5 forKey:v6];
}

- (id)maxTimeLimitKey
{
  return (id)[@"MaxTimeLimit-" stringByAppendingString:self->_recordID];
}

- (NSNumber)maxTimeLimitInSeconds
{
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v4 = [(DESUserDefaultsStoreRecord *)self maxTimeLimitKey];
  id v5 = [v3 objectForKey:v4];

  return (NSNumber *)v5;
}

- (void)setMaxTimeLimitInSeconds:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CB18];
  id v5 = a3;
  id v7 = [v4 standardUserDefaults];
  int64_t v6 = [(DESUserDefaultsStoreRecord *)self maxTimeLimitKey];
  [v7 setObject:v5 forKey:v6];
}

- (id)shouldRegisterXPCActivityKey
{
  return (id)[@"ShouldRegisterXPCActivityKey-" stringByAppendingString:self->_recordID];
}

- (BOOL)shouldRegisterXPCActivity
{
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v4 = [(DESUserDefaultsStoreRecord *)self shouldRegisterXPCActivityKey];
  char v5 = [v3 BOOLForKey:v4];

  return v5;
}

- (void)setShouldRegisterXPCActivity:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v5 = [(DESUserDefaultsStoreRecord *)self shouldRegisterXPCActivityKey];
  [v6 setBool:v3 forKey:v5];
}

- (NSString)recordID
{
  return self->_recordID;
}

- (void).cxx_destruct
{
}

@end