@interface HDClinicalAuthorizationSessionJournalEntry
+ (BOOL)supportsSecureCoding;
- (HDClinicalAuthorizationSessionJournalEntry)initWithCoder:(id)a3;
- (HDClinicalAuthorizationSessionJournalEntry)initWithState:(id)a3;
- (NSUUID)state;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDClinicalAuthorizationSessionJournalEntry

- (HDClinicalAuthorizationSessionJournalEntry)initWithState:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDClinicalAuthorizationSessionJournalEntry;
  v5 = [(HDClinicalAuthorizationSessionJournalEntry *)&v9 init];
  if (v5)
  {
    v6 = (NSUUID *)[v4 copy];
    state = v5->_state;
    v5->_state = v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDClinicalAuthorizationSessionJournalEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"state"];
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)HDClinicalAuthorizationSessionJournalEntry;
    v6 = [(HDClinicalAuthorizationSessionJournalEntry *)&v11 initWithCoder:v4];

    if (v6)
    {
      v7 = (NSUUID *)[v5 copy];
      state = v6->_state;
      v6->_state = v7;
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
  v5 = [(HDClinicalAuthorizationSessionJournalEntry *)self state];
  [v4 encodeObject:v5 forKey:@"state"];

  v6.receiver = self;
  v6.super_class = (Class)HDClinicalAuthorizationSessionJournalEntry;
  [(HDClinicalAuthorizationSessionJournalEntry *)&v6 encodeWithCoder:v4];
}

- (NSUUID)state
{
  return self->_state;
}

- (void).cxx_destruct
{
}

@end