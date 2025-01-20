@interface HDClinicalIngestionPerAccountOperation
- (HDClinicalAccount)account;
- (HDClinicalIngestionPerAccountOperation)initWithTask:(id)a3 account:(id)a4 nextOperation:(id)a5;
- (id)debugDescription;
@end

@implementation HDClinicalIngestionPerAccountOperation

- (HDClinicalIngestionPerAccountOperation)initWithTask:(id)a3 account:(id)a4 nextOperation:(id)a5
{
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HDClinicalIngestionPerAccountOperation;
  v9 = [(HDClinicalIngestionOperation *)&v13 initWithTask:a3 nextOperation:a5];
  if (v9)
  {
    v10 = (HDClinicalAccount *)[v8 copy];
    account = v9->_account;
    v9->_account = v10;
  }
  return v9;
}

- (HDClinicalAccount)account
{
  return self->_account;
}

- (id)debugDescription
{
  uint64_t v3 = objc_opt_class();
  v4 = [(HDClinicalIngestionOperation *)self task];
  v5 = [v4 taskIdentifier];
  v6 = [(HDClinicalAccount *)self->_account identifier];
  v7 = +[NSString stringWithFormat:@"%@ task:%@ account:%@", v3, v5, v6];

  return v7;
}

- (void).cxx_destruct
{
}

@end