@interface HDClinicalIngestionTaskWorkItemOutcome
+ (HDClinicalIngestionTaskWorkItemOutcome)new;
- (BOOL)fetchSuccess;
- (HDClinicalIngestionTaskWorkItemOutcome)init;
- (HDClinicalIngestionTaskWorkItemOutcome)initWithFetchSuccess:(BOOL)a3 saveableResources:(id)a4 followUpWorkItems:(id)a5;
- (NSArray)followUpWorkItems;
- (NSArray)saveableResources;
@end

@implementation HDClinicalIngestionTaskWorkItemOutcome

+ (HDClinicalIngestionTaskWorkItemOutcome)new
{
  v2 = NSStringFromSelector(a2);
  +[NSException raise:NSInvalidArgumentException, @"The -%@ method is not available on %@", v2, objc_opt_class() format];

  return 0;
}

- (HDClinicalIngestionTaskWorkItemOutcome)init
{
  v3 = NSStringFromSelector(a2);
  +[NSException raise:NSInvalidArgumentException, @"The -%@ method is not available on %@", v3, objc_opt_class() format];

  return 0;
}

- (HDClinicalIngestionTaskWorkItemOutcome)initWithFetchSuccess:(BOOL)a3 saveableResources:(id)a4 followUpWorkItems:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HDClinicalIngestionTaskWorkItemOutcome;
  v10 = [(HDClinicalIngestionTaskWorkItemOutcome *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_fetchSuccess = a3;
    v12 = (NSArray *)[v8 copy];
    saveableResources = v11->_saveableResources;
    v11->_saveableResources = v12;

    v14 = (NSArray *)[v9 copy];
    followUpWorkItems = v11->_followUpWorkItems;
    v11->_followUpWorkItems = v14;
  }
  return v11;
}

- (BOOL)fetchSuccess
{
  return self->_fetchSuccess;
}

- (NSArray)saveableResources
{
  return self->_saveableResources;
}

- (NSArray)followUpWorkItems
{
  return self->_followUpWorkItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followUpWorkItems, 0);

  objc_storeStrong((id *)&self->_saveableResources, 0);
}

@end