@interface HDDatabaseCorruptionEvent
+ (BOOL)supportsSecureCoding;
+ (id)createForProfile:(id)a3 component:(int64_t)a4 error:(id)a5 failedObliterationReason:(id)a6;
- (HDDatabaseCorruptionEvent)initWithCoder:(id)a3;
- (HDDatabaseCorruptionEvent)initWithError:(id)a3 date:(id)a4 profileIdentifier:(id)a5 component:(int64_t)a6 build:(id)a7 failedObliterationReason:(id)a8;
- (HKProfileIdentifier)profileIdentifier;
- (NSDate)date;
- (NSError)error;
- (NSString)buildDescription;
- (NSString)failedObliterationReason;
- (int64_t)component;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDDatabaseCorruptionEvent

- (HDDatabaseCorruptionEvent)initWithError:(id)a3 date:(id)a4 profileIdentifier:(id)a5 component:(int64_t)a6 build:(id)a7 failedObliterationReason:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  v27.receiver = self;
  v27.super_class = (Class)HDDatabaseCorruptionEvent;
  v19 = [(HDDatabaseCorruptionEvent *)&v27 init];
  if (v19)
  {
    uint64_t v20 = [v14 copy];
    error = v19->_error;
    v19->_error = (NSError *)v20;

    uint64_t v22 = [v15 copy];
    date = v19->_date;
    v19->_date = (NSDate *)v22;

    uint64_t v24 = [v16 copy];
    profileIdentifier = v19->_profileIdentifier;
    v19->_profileIdentifier = (HKProfileIdentifier *)v24;

    v19->_component = a6;
    objc_storeStrong((id *)&v19->_buildDescription, a7);
    objc_storeStrong((id *)&v19->_failedObliterationReason, a8);
  }

  return v19;
}

+ (id)createForProfile:(id)a3 component:(int64_t)a4 error:(id)a5 failedObliterationReason:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = objc_alloc((Class)a1);
  id v14 = [MEMORY[0x1E4F1C9C8] now];
  id v15 = [v12 profileIdentifier];
  id v16 = [v12 daemon];

  id v17 = [v16 behavior];
  id v18 = [v17 currentOSBuild];
  v19 = (void *)[v13 initWithError:v11 date:v14 profileIdentifier:v15 component:a4 build:v18 failedObliterationReason:v10];

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  v4 = [(HDDatabaseCorruptionEvent *)self profileIdentifier];
  [v9 encodeObject:v4 forKey:@"profile"];

  objc_msgSend(v9, "encodeInt:forKey:", -[HDDatabaseCorruptionEvent component](self, "component"), @"component");
  v5 = [(HDDatabaseCorruptionEvent *)self buildDescription];
  [v9 encodeObject:v5 forKey:@"build"];

  v6 = [(HDDatabaseCorruptionEvent *)self date];
  [v9 encodeObject:v6 forKey:@"date"];

  v7 = [(HDDatabaseCorruptionEvent *)self error];
  [v9 encodeObject:v7 forKey:@"error"];

  failedObliterationReason = self->_failedObliterationReason;
  if (failedObliterationReason) {
    [v9 encodeObject:failedObliterationReason forKey:@"obliteration_reason"];
  }
}

- (HDDatabaseCorruptionEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"profile"];
  uint64_t v6 = (int)[v4 decodeIntForKey:@"component"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"build"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
  id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"obliteration_reason"];

  id v11 = [(HDDatabaseCorruptionEvent *)self initWithError:v9 date:v8 profileIdentifier:v5 component:v6 build:v7 failedObliterationReason:v10];
  return v11;
}

- (NSDate)date
{
  return self->_date;
}

- (NSError)error
{
  return self->_error;
}

- (HKProfileIdentifier)profileIdentifier
{
  return self->_profileIdentifier;
}

- (int64_t)component
{
  return self->_component;
}

- (NSString)buildDescription
{
  return self->_buildDescription;
}

- (NSString)failedObliterationReason
{
  return self->_failedObliterationReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failedObliterationReason, 0);
  objc_storeStrong((id *)&self->_buildDescription, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

@end