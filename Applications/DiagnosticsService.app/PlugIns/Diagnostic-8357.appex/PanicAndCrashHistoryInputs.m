@interface PanicAndCrashHistoryInputs
- (BOOL)_applyAppBundleFilters:(id)a3;
- (BOOL)_applylogLineTypes:(id)a3;
- (BOOL)validateAndInitializeParameters:(id)a3;
- (NSDictionary)resultLabelFilters;
- (NSSet)applicationFilters;
- (NSSet)logIds;
- (void)setApplicationFilters:(id)a3;
- (void)setLogIds:(id)a3;
- (void)setResultLabelFilters:(id)a3;
@end

@implementation PanicAndCrashHistoryInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(PanicAndCrashHistoryInputs *)self _applylogLineTypes:v4];
  char v8 = v5 | [(PanicAndCrashHistoryInputs *)self _applyAppBundleFilters:v4];
  v6 = [v4 dk_dictionaryFromKey:@"logLineReturnLabels" defaultValue:&__NSDictionary0__struct failed:&v8];

  [(PanicAndCrashHistoryInputs *)self setResultLabelFilters:v6];
  return v8 == 0;
}

- (BOOL)_applylogLineTypes:(id)a3
{
  id v4 = a3;
  BOOL v22 = 0;
  uint64_t v5 = objc_opt_class();
  v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, objc_opt_class(), 0);
  v7 = [v4 dk_arrayFromKey:@"logLineTypes" types:v6 maxLength:0x7FFFFFFFFFFFFFFFLL defaultValue:&off_100004418 failed:&v22 validator:&stru_100004198];

  char v8 = +[NSMutableSet set];
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

  [(PanicAndCrashHistoryInputs *)self setLogIds:v8];
  BOOL v16 = v22;

  return v16;
}

- (BOOL)_applyAppBundleFilters:(id)a3
{
  char v9 = 0;
  id v4 = a3;
  uint64_t v5 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
  v6 = [v4 dk_arrayFromKey:@"appBundleFilter" types:v5 maxLength:0x7FFFFFFFFFFFFFFFLL defaultValue:&off_100004430 failed:&v9 validator:&stru_1000041B8];

  id v7 = [objc_alloc((Class)NSSet) initWithArray:v6];
  [(PanicAndCrashHistoryInputs *)self setApplicationFilters:v7];

  LOBYTE(self) = v9;
  return (char)self;
}

- (NSSet)logIds
{
  return self->_logIds;
}

- (void)setLogIds:(id)a3
{
}

- (NSSet)applicationFilters
{
  return self->_applicationFilters;
}

- (void)setApplicationFilters:(id)a3
{
}

- (NSDictionary)resultLabelFilters
{
  return self->_resultLabelFilters;
}

- (void)setResultLabelFilters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultLabelFilters, 0);
  objc_storeStrong((id *)&self->_applicationFilters, 0);

  objc_storeStrong((id *)&self->_logIds, 0);
}

@end