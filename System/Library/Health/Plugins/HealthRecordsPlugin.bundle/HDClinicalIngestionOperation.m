@interface HDClinicalIngestionOperation
- (HDClinicalIngestionOperation)initWithTask:(id)a3 nextOperation:(id)a4;
- (HDClinicalIngestionTask)task;
- (HDHealthRecordsProfileExtension)profileExtension;
- (HDHealthRecordsXPCServiceClient)healthRecordsServiceClient;
- (HDProfile)profile;
- (NSError)operationError;
- (NSOperation)nextOperation;
- (NSString)debugDescription;
- (void)main;
- (void)setOperationError:(id)a3;
@end

@implementation HDClinicalIngestionOperation

- (HDClinicalIngestionOperation)initWithTask:(id)a3 nextOperation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HDClinicalIngestionOperation;
  v9 = [(HDClinicalIngestionOperation *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_task, a3);
    objc_storeStrong((id *)&v10->_nextOperation, a4);
    uint64_t v11 = [v7 profile];
    profile = v10->_profile;
    v10->_profile = (HDProfile *)v11;

    uint64_t v13 = [v7 profileExtension];
    profileExtension = v10->_profileExtension;
    v10->_profileExtension = (HDHealthRecordsProfileExtension *)v13;

    [v8 addDependency:v10];
  }

  return v10;
}

- (NSOperation)nextOperation
{
  return self->_nextOperation;
}

- (void)setOperationError:(id)a3
{
  self->_operationError = (NSError *)[a3 copy];

  _objc_release_x1();
}

- (HDHealthRecordsXPCServiceClient)healthRecordsServiceClient
{
  v2 = [(HDClinicalIngestionOperation *)self task];
  v3 = [v2 healthRecordsServiceClient];

  return (HDHealthRecordsXPCServiceClient *)v3;
}

- (NSString)debugDescription
{
  uint64_t v3 = objc_opt_class();
  v4 = [(HDClinicalIngestionTask *)self->_task taskIdentifier];
  v5 = +[NSString stringWithFormat:@"%@ task:%@", v3, v4];

  return (NSString *)v5;
}

- (HDClinicalIngestionTask)task
{
  return (HDClinicalIngestionTask *)objc_getProperty(self, a2, 32, 1);
}

- (NSError)operationError
{
  return (NSError *)objc_getProperty(self, a2, 40, 1);
}

- (HDProfile)profile
{
  return (HDProfile *)objc_getProperty(self, a2, 48, 1);
}

- (HDHealthRecordsProfileExtension)profileExtension
{
  return (HDHealthRecordsProfileExtension *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileExtension, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_operationError, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_groupCancellingDependencies, 0);
  objc_storeStrong((id *)&self->_cancellingDependencies, 0);

  objc_storeStrong((id *)&self->_nextOperation, 0);
}

- (void)main
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

@end