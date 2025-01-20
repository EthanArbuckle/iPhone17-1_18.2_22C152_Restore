@interface HDClinicalIngestionIsAccountFetchableOperation
- (BOOL)_refreshAccountWithErrorString:(id *)a3;
- (BOOL)_verifyShouldFetchWithErrorString:(id *)a3;
- (BOOL)accountFetchable;
- (HDClinicalAccount)refreshedAccount;
- (HDClinicalIngestionManager)ingestionManager;
- (void)main;
- (void)setAccountFetchable:(BOOL)a3;
- (void)setIngestionManager:(id)a3;
- (void)setRefreshedAccount:(id)a3;
@end

@implementation HDClinicalIngestionIsAccountFetchableOperation

- (void)main
{
  v3 = [(HDClinicalIngestionOperation *)self task];
  v4 = [v3 profileExtension];
  v5 = [v4 ingestionManager];
  [(HDClinicalIngestionIsAccountFetchableOperation *)self setIngestionManager:v5];

  if (self->_ingestionManager)
  {
    id v14 = 0;
    unsigned __int8 v6 = [(HDClinicalIngestionIsAccountFetchableOperation *)self _refreshAccountWithErrorString:&v14];
    id v7 = v14;
    v8 = v7;
    if (v6)
    {
      id v13 = v7;
      BOOL v9 = [(HDClinicalIngestionIsAccountFetchableOperation *)self _verifyShouldFetchWithErrorString:&v13];
      id v10 = v13;

      [(HDClinicalIngestionIsAccountFetchableOperation *)self setAccountFetchable:v9];
      v8 = v10;
      if (v9)
      {
LABEL_10:

        return;
      }
    }
    else
    {
      [(HDClinicalIngestionIsAccountFetchableOperation *)self setAccountFetchable:0];
    }
    _HKInitializeLogging();
    v12 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_AF0DC(v12, self, (uint64_t)v8);
    }
    goto LABEL_10;
  }
  _HKInitializeLogging();
  v11 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
    sub_AEFFC(v11, self);
  }
}

- (BOOL)_refreshAccountWithErrorString:(id *)a3
{
  v5 = [(HDClinicalIngestionPerAccountOperation *)self account];
  unsigned __int8 v6 = [v5 identifier];

  if (v6)
  {
    v16 = v6;
    id v7 = +[NSArray arrayWithObjects:&v16 count:1];
    v8 = [(HDClinicalIngestionOperation *)self profile];
    id v15 = 0;
    BOOL v9 = +[HDClinicalAccountEntity fetchableAccountsWithIdentifiers:v7 profile:v8 error:&v15];
    id v10 = v15;

    if (v9)
    {
      v11 = [v9 firstObject];
      if (v11)
      {
        [(HDClinicalIngestionIsAccountFetchableOperation *)self setRefreshedAccount:v11];
        BOOL v12 = 1;
LABEL_13:

        goto LABEL_14;
      }
      if (a3)
      {
        id v13 = @"the account does not have a credential or the associated gateway is disabled";
LABEL_11:
        BOOL v12 = 0;
        *a3 = [(__CFString *)v13 copy];
        goto LABEL_13;
      }
    }
    else
    {
      id v13 = +[NSString stringWithFormat:@"account entity retrieval failed with error: %@", v10];
      v11 = v13;
      if (a3) {
        goto LABEL_11;
      }
    }
    BOOL v12 = 0;
    goto LABEL_13;
  }
  BOOL v12 = 0;
  if (a3) {
    *a3 = [@"account entity retrieval failed because there is no account identifier" copy];
  }
LABEL_14:

  return v12;
}

- (BOOL)_verifyShouldFetchWithErrorString:(id *)a3
{
  v5 = [(HDClinicalIngestionOperation *)self task];
  unsigned __int8 v6 = [v5 context];

  if (([v6 shouldFetchImmediately] & 1) == 0)
  {
    v8 = +[NSDate date];
    BOOL v9 = [(HDClinicalIngestionIsAccountFetchableOperation *)self refreshedAccount];
    if ([v6 isBackgroundTask]
      && ([v9 shouldPerformBackgroundFetchWithNowDate:v8] & 1) == 0)
    {
      if (a3)
      {
        id v10 = @"background ingest should not yet be performed";
        goto LABEL_11;
      }
    }
    else
    {
      if ([v9 shouldPerformFetchWithNowDate:v8])
      {
        BOOL v7 = 1;
LABEL_13:

        goto LABEL_14;
      }
      if (a3)
      {
        id v10 = @"account is still blocked from fetching";
LABEL_11:
        BOOL v7 = 0;
        *a3 = [(__CFString *)v10 copy];
        goto LABEL_13;
      }
    }
    BOOL v7 = 0;
    goto LABEL_13;
  }
  BOOL v7 = 1;
LABEL_14:

  return v7;
}

- (BOOL)accountFetchable
{
  return self->_accountFetchable;
}

- (void)setAccountFetchable:(BOOL)a3
{
  self->_accountFetchable = a3;
}

- (HDClinicalAccount)refreshedAccount
{
  return self->_refreshedAccount;
}

- (void)setRefreshedAccount:(id)a3
{
}

- (HDClinicalIngestionManager)ingestionManager
{
  return self->_ingestionManager;
}

- (void)setIngestionManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ingestionManager, 0);

  objc_storeStrong((id *)&self->_refreshedAccount, 0);
}

@end