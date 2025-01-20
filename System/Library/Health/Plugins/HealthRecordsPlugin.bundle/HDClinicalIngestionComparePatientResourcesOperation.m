@interface HDClinicalIngestionComparePatientResourcesOperation
- (HDClinicalIngestionComparePatientResourcesOperation)initWithTask:(id)a3 account:(id)a4 existingResourceData:(id)a5 incomingResourceData:(id)a6;
- (HKFHIRPatientResourceComparisonResult)result;
- (void)_cancelWithError:(id)a3;
- (void)main;
- (void)setResult:(id)a3;
@end

@implementation HDClinicalIngestionComparePatientResourcesOperation

- (HDClinicalIngestionComparePatientResourcesOperation)initWithTask:(id)a3 account:(id)a4 existingResourceData:(id)a5 incomingResourceData:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HDClinicalIngestionComparePatientResourcesOperation;
  v12 = [(HDClinicalIngestionPerAccountOperation *)&v18 initWithTask:a3 account:a4 nextOperation:0];
  if (v12)
  {
    v13 = (HDFHIRResourceData *)[v10 copy];
    existingResourceData = v12->_existingResourceData;
    v12->_existingResourceData = v13;

    v15 = (HDFHIRResourceData *)[v11 copy];
    incomingResourceData = v12->_incomingResourceData;
    v12->_incomingResourceData = v15;
  }
  return v12;
}

- (void)main
{
  _HKInitializeLogging();
  v3 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
    sub_B5658(v3, self);
  }
  v4 = [(HDClinicalIngestionOperation *)self profile];
  v5 = [v4 database];
  unsigned __int8 v6 = [v5 isProtectedDataAvailable];

  if (v6)
  {
    v7 = [(HDClinicalIngestionOperation *)self task];
    v8 = [v7 healthRecordsServiceClient];

    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    existingResourceData = self->_existingResourceData;
    incomingResourceData = self->_incomingResourceData;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_A8274;
    v14[3] = &unk_114F20;
    v14[4] = self;
    v12 = v9;
    v15 = v12;
    [v8 compareExistingPatientResourceData:existingResourceData incomingPatientResourceData:incomingResourceData completion:v14];
    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
    _HKInitializeLogging();
    v13 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
      sub_B55C0(v13, self);
    }
  }
  else
  {
    v8 = +[NSError hk_protectedDataInaccessibilityError];
    [(HDClinicalIngestionComparePatientResourcesOperation *)self _cancelWithError:v8];
  }
}

- (void)_cancelWithError:(id)a3
{
  id v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
    sub_B57A0(v5, self);
  }
  [(HDClinicalIngestionOperation *)self setOperationError:v4];
  [(HDClinicalIngestionComparePatientResourcesOperation *)self cancel];
}

- (HKFHIRPatientResourceComparisonResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_incomingResourceData, 0);

  objc_storeStrong((id *)&self->_existingResourceData, 0);
}

@end