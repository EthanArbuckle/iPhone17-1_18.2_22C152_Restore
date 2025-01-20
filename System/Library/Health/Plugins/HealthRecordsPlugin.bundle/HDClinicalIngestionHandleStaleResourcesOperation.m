@interface HDClinicalIngestionHandleStaleResourcesOperation
- (BOOL)_addExtractionHintToStaleResources;
- (BOOL)_ensureHasIngestStartDate;
- (BOOL)_ensureProtectedDataAvailable;
- (HDClinicalIngestionHandleStaleResourcesOperation)initWithTask:(id)a3 account:(id)a4 ingestStartDate:(id)a5 nextOperation:(id)a6;
- (NSDate)ingestStartDate;
- (NSNumber)numberOfAffectedResources;
- (void)_cancelWithError:(id)a3;
- (void)main;
@end

@implementation HDClinicalIngestionHandleStaleResourcesOperation

- (HDClinicalIngestionHandleStaleResourcesOperation)initWithTask:(id)a3 account:(id)a4 ingestStartDate:(id)a5 nextOperation:(id)a6
{
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HDClinicalIngestionHandleStaleResourcesOperation;
  v11 = [(HDClinicalIngestionPerAccountOperation *)&v15 initWithTask:a3 account:a4 nextOperation:a6];
  if (v11)
  {
    v12 = (NSDate *)[v10 copy];
    ingestStartDate = v11->_ingestStartDate;
    v11->_ingestStartDate = v12;
  }
  return v11;
}

- (void)main
{
  _HKInitializeLogging();
  v3 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
    sub_AE6FC(v3, (uint64_t)self);
  }
  if ([(HDClinicalIngestionHandleStaleResourcesOperation *)self _ensureHasIngestStartDate]
    && [(HDClinicalIngestionHandleStaleResourcesOperation *)self _ensureProtectedDataAvailable]&& [(HDClinicalIngestionHandleStaleResourcesOperation *)self _addExtractionHintToStaleResources])
  {
    _HKInitializeLogging();
    v4 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
      sub_AE58C(v4);
    }
  }
  else
  {
    _HKInitializeLogging();
    v5 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_AE630(v5, self);
    }
  }
}

- (void)_cancelWithError:(id)a3
{
  [(HDClinicalIngestionOperation *)self setOperationError:a3];

  [(HDClinicalIngestionHandleStaleResourcesOperation *)self cancel];
}

- (BOOL)_ensureHasIngestStartDate
{
  ingestStartDate = self->_ingestStartDate;
  if (!ingestStartDate)
  {
    v4 = [(HDClinicalIngestionPerAccountOperation *)self debugDescription];
    v5 = +[NSError hk_error:100, @"cannot run %@ without an ingest start date", v4 format];
    [(HDClinicalIngestionHandleStaleResourcesOperation *)self _cancelWithError:v5];
  }
  return ingestStartDate != 0;
}

- (BOOL)_ensureProtectedDataAvailable
{
  v3 = [(HDClinicalIngestionOperation *)self profile];
  v4 = [v3 database];
  unsigned __int8 v5 = [v4 isProtectedDataAvailable];

  if ((v5 & 1) == 0)
  {
    v6 = +[NSError hk_protectedDataInaccessibilityError];
    [(HDClinicalIngestionHandleStaleResourcesOperation *)self _cancelWithError:v6];
  }
  return v5;
}

- (BOOL)_addExtractionHintToStaleResources
{
  ingestStartDate = self->_ingestStartDate;
  v4 = [(HDClinicalIngestionPerAccountOperation *)self account];
  unsigned __int8 v5 = [v4 identifier];
  v6 = [(HDClinicalIngestionOperation *)self profile];
  id v18 = 0;
  v7 = +[HDOriginalFHIRResourceLastSeenEntity resourceEntitiesNotSeenSince:ingestStartDate accountIdentifier:v5 profile:v6 error:&v18];
  id v8 = v18;

  if (!v7)
  {
    [(HDClinicalIngestionHandleStaleResourcesOperation *)self _cancelWithError:v8];
    char v13 = 0;
LABEL_9:
    id v12 = v8;
    goto LABEL_12;
  }
  _HKInitializeLogging();
  v9 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
    sub_AE7C0(v9, self);
  }
  if (![v7 count])
  {
    char v13 = 1;
    goto LABEL_9;
  }
  id v10 = [(HDClinicalIngestionOperation *)self profile];
  id v17 = v8;
  v11 = +[HDOriginalFHIRResourceEntity addExtractionHints:4 toResourceEntities:v7 profile:v10 error:&v17];
  id v12 = v17;

  char v13 = v11 != 0;
  if (v11)
  {
    +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v11 count]);
    v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    numberOfAffectedResources = self->_numberOfAffectedResources;
    self->_numberOfAffectedResources = v14;
  }
  else
  {
    [(HDClinicalIngestionHandleStaleResourcesOperation *)self _cancelWithError:v12];
  }

LABEL_12:
  return v13;
}

- (NSDate)ingestStartDate
{
  return self->_ingestStartDate;
}

- (NSNumber)numberOfAffectedResources
{
  return self->_numberOfAffectedResources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberOfAffectedResources, 0);

  objc_storeStrong((id *)&self->_ingestStartDate, 0);
}

@end