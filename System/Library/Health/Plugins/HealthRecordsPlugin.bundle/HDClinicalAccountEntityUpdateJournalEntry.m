@interface HDClinicalAccountEntityUpdateJournalEntry
+ (BOOL)supportsSecureCoding;
- (HDClinicalAccountEntityUpdateJournalEntry)initWithAccountIdentifier:(id)a3;
- (HDClinicalAccountEntityUpdateJournalEntry)initWithCoder:(id)a3;
- (NSUUID)accountIdentifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDClinicalAccountEntityUpdateJournalEntry

- (HDClinicalAccountEntityUpdateJournalEntry)initWithAccountIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDClinicalAccountEntityUpdateJournalEntry;
  v5 = [(HDClinicalAccountEntityUpdateJournalEntry *)&v9 init];
  if (v5)
  {
    v6 = (NSUUID *)[v4 copy];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDClinicalAccountEntityUpdateJournalEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountIdentifier"];
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)HDClinicalAccountEntityUpdateJournalEntry;
    v6 = [(HDClinicalAccountEntityUpdateJournalEntry *)&v11 initWithCoder:v4];

    if (v6)
    {
      v7 = (NSUUID *)[v5 copy];
      accountIdentifier = v6->_accountIdentifier;
      v6->_accountIdentifier = v7;
    }
    self = v6;
    objc_super v9 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");

    objc_super v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HDClinicalAccountEntityUpdateJournalEntry *)self accountIdentifier];
  [v4 encodeObject:v5 forKey:@"accountIdentifier"];

  v6.receiver = self;
  v6.super_class = (Class)HDClinicalAccountEntityUpdateJournalEntry;
  [(HDClinicalAccountEntityUpdateJournalEntry *)&v6 encodeWithCoder:v4];
}

- (NSUUID)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void).cxx_destruct
{
}

@end