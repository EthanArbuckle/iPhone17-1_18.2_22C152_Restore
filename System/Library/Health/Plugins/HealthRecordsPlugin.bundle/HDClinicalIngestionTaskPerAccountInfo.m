@interface HDClinicalIngestionTaskPerAccountInfo
- (HDClinicalIngestionTaskPerAccountInfo)initWithAccountIdentifier:(id)a3;
- (NSUUID)accountIdentifier;
- (unint64_t)outcomeInfo;
- (void)addOutcomeInfo:(unint64_t)a3;
- (void)setOutcomeInfo:(unint64_t)a3;
@end

@implementation HDClinicalIngestionTaskPerAccountInfo

- (HDClinicalIngestionTaskPerAccountInfo)initWithAccountIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDClinicalIngestionTaskPerAccountInfo;
  v5 = [(HDClinicalIngestionTaskPerAccountInfo *)&v9 init];
  if (v5)
  {
    v6 = (NSUUID *)[v4 copy];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = v6;
  }
  return v5;
}

- (void)addOutcomeInfo:(unint64_t)a3
{
  self->_outcomeInfo |= a3;
}

- (NSUUID)accountIdentifier
{
  return self->_accountIdentifier;
}

- (unint64_t)outcomeInfo
{
  return self->_outcomeInfo;
}

- (void)setOutcomeInfo:(unint64_t)a3
{
  self->_outcomeInfo = a3;
}

- (void).cxx_destruct
{
}

@end