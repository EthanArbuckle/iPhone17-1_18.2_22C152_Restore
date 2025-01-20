@interface AppCrashHistoryInputs
- (BOOL)_applyCrashTypesParameter:(id)a3;
- (BOOL)_applyWhitelistParameter:(id)a3;
- (BOOL)validateAndInitializeParameters:(id)a3;
- (NSArray)logIds;
- (NSSet)whitelist;
- (int)avgCrashesToConsider;
- (int)minCrashesToConsider;
- (void)setAvgCrashesToConsider:(int)a3;
- (void)setLogIds:(id)a3;
- (void)setMinCrashesToConsider:(int)a3;
- (void)setWhitelist:(id)a3;
@end

@implementation AppCrashHistoryInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4 = a3;
  if ([(AppCrashHistoryInputs *)self _applyCrashTypesParameter:v4]) {
    unsigned __int8 v5 = 1;
  }
  else {
    unsigned __int8 v5 = [(AppCrashHistoryInputs *)self _applyWhitelistParameter:v4];
  }
  unsigned __int8 v10 = v5;
  v6 = [v4 dk_numberFromKey:@"minCrashesToConsider" lowerBound:&off_100004420 upperBound:&off_100004438 defaultValue:&off_100004420 failed:&v10];
  -[AppCrashHistoryInputs setMinCrashesToConsider:](self, "setMinCrashesToConsider:", [v6 intValue]);

  v7 = [v4 dk_numberFromKey:@"avgCrashesToConsider" lowerBound:&off_100004420 upperBound:&off_100004438 defaultValue:&off_100004420 failed:&v10];
  -[AppCrashHistoryInputs setAvgCrashesToConsider:](self, "setAvgCrashesToConsider:", [v7 intValue]);

  BOOL v8 = v10 == 0;
  return v8;
}

- (BOOL)_applyCrashTypesParameter:(id)a3
{
  id v4 = a3;
  BOOL v22 = 0;
  uint64_t v5 = objc_opt_class();
  v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, objc_opt_class(), 0);
  v7 = [v4 dk_arrayFromKey:@"crashTypes" types:v6 maxLength:10 defaultValue:&off_100004490 failed:&v22 validator:&stru_1000041C8];

  BOOL v8 = +[NSMutableArray array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v8 addObject:v14];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v15 = [v14 stringValue];
            [v8 addObject:v15];
          }
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v11);
  }

  [(AppCrashHistoryInputs *)self setLogIds:v8];
  BOOL v16 = v22;

  return v16;
}

- (BOOL)_applyWhitelistParameter:(id)a3
{
  char v9 = 0;
  id v4 = a3;
  uint64_t v5 = +[NSSet setWithObject:objc_opt_class()];
  v6 = [v4 dk_arrayFromKey:@"whitelistedAppNames" types:v5 maxLength:10000 defaultValue:&__NSArray0__struct failed:&v9 validator:&stru_1000041E8];

  v7 = +[NSSet setWithArray:v6];
  [(AppCrashHistoryInputs *)self setWhitelist:v7];

  LOBYTE(self) = v9;
  return (char)self;
}

- (int)minCrashesToConsider
{
  return self->_minCrashesToConsider;
}

- (void)setMinCrashesToConsider:(int)a3
{
  self->_minCrashesToConsider = a3;
}

- (int)avgCrashesToConsider
{
  return self->_avgCrashesToConsider;
}

- (void)setAvgCrashesToConsider:(int)a3
{
  self->_avgCrashesToConsider = a3;
}

- (NSArray)logIds
{
  return self->_logIds;
}

- (void)setLogIds:(id)a3
{
}

- (NSSet)whitelist
{
  return self->_whitelist;
}

- (void)setWhitelist:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whitelist, 0);

  objc_storeStrong((id *)&self->_logIds, 0);
}

@end