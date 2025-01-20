@interface HKClinicalAccountEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToClinicalAccountEvent:(id)a3;
- (HKClinicalAccountEvent)eventWithAppendedEventDescription:(id)a3;
- (HKClinicalAccountEvent)eventWithAppendedRefreshToken:(id)a3 description:(id)a4;
- (HKClinicalAccountEvent)eventWithUpdatedCredentialStateAfter:(int64_t)a3;
- (HKClinicalAccountEvent)eventWithUpdatedCredentialStateBefore:(int64_t)a3;
- (HKClinicalAccountEvent)init;
- (HKClinicalAccountEvent)initWithAccountIdentifier:(id)a3 type:(int64_t)a4 caller:(id)a5 timestamp:(id)a6 eventDescription:(id)a7;
- (HKClinicalAccountEvent)initWithAccountIdentifier:(id)a3 type:(int64_t)a4 caller:(id)a5 timestamp:(id)a6 eventDescription:(id)a7 credentialStateBefore:(int64_t)a8 credentialStateAfter:(int64_t)a9;
- (HKClinicalAccountEvent)initWithAccountIdentifier:(id)a3 type:(int64_t)a4 caller:(id)a5 timestamp:(id)a6 eventDescription:(id)a7 incomingToken:(id)a8 currentToken:(id)a9;
- (HKClinicalAccountEvent)initWithCoder:(id)a3;
- (NSDate)timestamp;
- (NSString)caller;
- (NSString)credentialStateAfterDescription;
- (NSString)credentialStateBeforeDescription;
- (NSString)eventDescription;
- (NSString)typeDescription;
- (NSUUID)accountIdentifier;
- (id)eventMarkedAsFailedWithError:(id)a3;
- (int64_t)credentialStateAfter;
- (int64_t)credentialStateBefore;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKClinicalAccountEvent

- (HKClinicalAccountEvent)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKClinicalAccountEvent)initWithAccountIdentifier:(id)a3 type:(int64_t)a4 caller:(id)a5 timestamp:(id)a6 eventDescription:(id)a7 credentialStateBefore:(int64_t)a8 credentialStateAfter:(int64_t)a9
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v29.receiver = self;
  v29.super_class = (Class)HKClinicalAccountEvent;
  v19 = [(HKClinicalAccountEvent *)&v29 init];
  if (v19)
  {
    uint64_t v20 = [v15 copy];
    accountIdentifier = v19->_accountIdentifier;
    v19->_accountIdentifier = (NSUUID *)v20;

    v19->_type = a4;
    uint64_t v22 = [v16 copy];
    caller = v19->_caller;
    v19->_caller = (NSString *)v22;

    uint64_t v24 = [v17 copy];
    timestamp = v19->_timestamp;
    v19->_timestamp = (NSDate *)v24;

    uint64_t v26 = [v18 copy];
    eventDescription = v19->_eventDescription;
    v19->_eventDescription = (NSString *)v26;

    v19->_credentialStateBefore = a8;
    v19->_credentialStateAfter = a9;
  }

  return v19;
}

- (HKClinicalAccountEvent)initWithAccountIdentifier:(id)a3 type:(int64_t)a4 caller:(id)a5 timestamp:(id)a6 eventDescription:(id)a7
{
  return [(HKClinicalAccountEvent *)self initWithAccountIdentifier:a3 type:a4 caller:a5 timestamp:a6 eventDescription:a7 credentialStateBefore:0 credentialStateAfter:0];
}

- (HKClinicalAccountEvent)initWithAccountIdentifier:(id)a3 type:(int64_t)a4 caller:(id)a5 timestamp:(id)a6 eventDescription:(id)a7 incomingToken:(id)a8 currentToken:(id)a9
{
  id v16 = NSString;
  id v17 = a9;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a3;
  uint64_t v22 = objc_msgSend(a8, "hk_SHA256Hash");
  v23 = objc_msgSend(v17, "hk_SHA256Hash");

  uint64_t v24 = [v16 stringWithFormat:@"%@ - %@: %@ - %@: %@", v18, @"Incoming Token", v22, @"Current Token", v23];

  v25 = [(HKClinicalAccountEvent *)self initWithAccountIdentifier:v21 type:a4 caller:v20 timestamp:v19 eventDescription:v24 credentialStateBefore:0 credentialStateAfter:0];
  return v25;
}

- (HKClinicalAccountEvent)eventWithAppendedEventDescription:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  v6 = [(HKClinicalAccountEvent *)self accountIdentifier];
  int64_t v7 = [(HKClinicalAccountEvent *)self type];
  v8 = [(HKClinicalAccountEvent *)self caller];
  v9 = [(HKClinicalAccountEvent *)self timestamp];
  v10 = NSString;
  v11 = [(HKClinicalAccountEvent *)self eventDescription];
  v12 = [v10 stringWithFormat:@"%@ - %@", v11, v4];

  v13 = objc_msgSend(v5, "initWithAccountIdentifier:type:caller:timestamp:eventDescription:credentialStateBefore:credentialStateAfter:", v6, v7, v8, v9, v12, -[HKClinicalAccountEvent credentialStateBefore](self, "credentialStateBefore"), -[HKClinicalAccountEvent credentialStateAfter](self, "credentialStateAfter"));

  return (HKClinicalAccountEvent *)v13;
}

- (HKClinicalAccountEvent)eventWithAppendedRefreshToken:(id)a3 description:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v18 = objc_alloc((Class)objc_opt_class());
  v8 = [(HKClinicalAccountEvent *)self accountIdentifier];
  int64_t v9 = [(HKClinicalAccountEvent *)self type];
  v10 = [(HKClinicalAccountEvent *)self caller];
  v11 = [(HKClinicalAccountEvent *)self timestamp];
  v12 = NSString;
  v13 = [(HKClinicalAccountEvent *)self eventDescription];
  v14 = objc_msgSend(v7, "hk_SHA256Hash");

  id v15 = [v12 stringWithFormat:@"%@ - %@: %@", v13, v6, v14];

  id v16 = objc_msgSend(v18, "initWithAccountIdentifier:type:caller:timestamp:eventDescription:credentialStateBefore:credentialStateAfter:", v8, v9, v10, v11, v15, -[HKClinicalAccountEvent credentialStateBefore](self, "credentialStateBefore"), -[HKClinicalAccountEvent credentialStateAfter](self, "credentialStateAfter"));

  return (HKClinicalAccountEvent *)v16;
}

- (HKClinicalAccountEvent)eventWithUpdatedCredentialStateBefore:(int64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  id v6 = [(HKClinicalAccountEvent *)self accountIdentifier];
  int64_t v7 = [(HKClinicalAccountEvent *)self type];
  v8 = [(HKClinicalAccountEvent *)self caller];
  int64_t v9 = [(HKClinicalAccountEvent *)self timestamp];
  v10 = [(HKClinicalAccountEvent *)self eventDescription];
  v11 = objc_msgSend(v5, "initWithAccountIdentifier:type:caller:timestamp:eventDescription:credentialStateBefore:credentialStateAfter:", v6, v7, v8, v9, v10, a3, -[HKClinicalAccountEvent credentialStateAfter](self, "credentialStateAfter"));

  return (HKClinicalAccountEvent *)v11;
}

- (HKClinicalAccountEvent)eventWithUpdatedCredentialStateAfter:(int64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  id v6 = [(HKClinicalAccountEvent *)self accountIdentifier];
  int64_t v7 = [(HKClinicalAccountEvent *)self type];
  v8 = [(HKClinicalAccountEvent *)self caller];
  int64_t v9 = [(HKClinicalAccountEvent *)self timestamp];
  v10 = [(HKClinicalAccountEvent *)self eventDescription];
  v11 = objc_msgSend(v5, "initWithAccountIdentifier:type:caller:timestamp:eventDescription:credentialStateBefore:credentialStateAfter:", v6, v7, v8, v9, v10, -[HKClinicalAccountEvent credentialStateBefore](self, "credentialStateBefore"), a3);

  return (HKClinicalAccountEvent *)v11;
}

- (id)eventMarkedAsFailedWithError:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  id v6 = [(HKClinicalAccountEvent *)self accountIdentifier];
  int64_t v7 = [(HKClinicalAccountEvent *)self type];
  v8 = [(HKClinicalAccountEvent *)self caller];
  int64_t v9 = [(HKClinicalAccountEvent *)self timestamp];
  v10 = NSString;
  v11 = [(HKClinicalAccountEvent *)self eventDescription];
  v12 = objc_msgSend(v4, "hrs_completeDescription");

  v13 = [v10 stringWithFormat:@"Action: (%@) failed: (%@)", v11, v12];
  v14 = objc_msgSend(v5, "initWithAccountIdentifier:type:caller:timestamp:eventDescription:credentialStateBefore:credentialStateAfter:", v6, v7, v8, v9, v13, -[HKClinicalAccountEvent credentialStateBefore](self, "credentialStateBefore"), -[HKClinicalAccountEvent credentialStateAfter](self, "credentialStateAfter"));

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKClinicalAccountEvent *)a3;
  id v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(HKClinicalAccountEvent *)self isEqualToClinicalAccountEvent:v5];

  return v6;
}

- (BOOL)isEqualToClinicalAccountEvent:(id)a3
{
  BOOL v6 = (HKClinicalAccountEvent *)a3;
  int64_t v7 = v6;
  if (self == v6)
  {
    BOOL v13 = 1;
  }
  else
  {
    if (v6)
    {
      v8 = [(HKClinicalAccountEvent *)self accountIdentifier];
      int64_t v9 = [(HKClinicalAccountEvent *)v7 accountIdentifier];
      if (v8 != v9)
      {
        uint64_t v10 = [(HKClinicalAccountEvent *)v7 accountIdentifier];
        if (!v10)
        {
          BOOL v13 = 0;
          goto LABEL_43;
        }
        v3 = (void *)v10;
        v11 = [(HKClinicalAccountEvent *)self accountIdentifier];
        v12 = [(HKClinicalAccountEvent *)v7 accountIdentifier];
        if (![v11 isEqual:v12])
        {
          BOOL v13 = 0;
LABEL_42:

          goto LABEL_43;
        }
        v41 = v12;
        v42 = v11;
      }
      int64_t v14 = [(HKClinicalAccountEvent *)self type];
      if (v14 != [(HKClinicalAccountEvent *)v7 type]) {
        goto LABEL_40;
      }
      id v15 = [(HKClinicalAccountEvent *)self caller];
      id v16 = [(HKClinicalAccountEvent *)v7 caller];
      if (v15 != v16)
      {
        uint64_t v17 = [(HKClinicalAccountEvent *)v7 caller];
        if (!v17)
        {
LABEL_38:

LABEL_39:
LABEL_40:
          BOOL v13 = 0;
          goto LABEL_41;
        }
        v38 = (void *)v17;
        id v4 = [(HKClinicalAccountEvent *)self caller];
        id v18 = [(HKClinicalAccountEvent *)v7 caller];
        if (([v4 isEqualToString:v18] & 1) == 0)
        {

LABEL_37:
          goto LABEL_38;
        }
        v35 = v18;
      }
      id v19 = [(HKClinicalAccountEvent *)self timestamp];
      v39 = [(HKClinicalAccountEvent *)v7 timestamp];
      v40 = v19;
      if (v19 == v39)
      {
        v36 = v4;
        v37 = v15;
LABEL_21:
        uint64_t v22 = [(HKClinicalAccountEvent *)self eventDescription];
        v23 = [(HKClinicalAccountEvent *)v7 eventDescription];
        if (v22 != v23)
        {
          uint64_t v24 = [(HKClinicalAccountEvent *)v7 eventDescription];
          if (!v24) {
            goto LABEL_47;
          }
          v25 = (void *)v24;
          id v19 = [(HKClinicalAccountEvent *)self eventDescription];
          v32 = [(HKClinicalAccountEvent *)v7 eventDescription];
          v30 = v25;
          if (!objc_msgSend(v19, "isEqualToString:"))
          {
            BOOL v13 = 0;
LABEL_29:

            if (v40 == v39)
            {

              id v4 = v36;
              id v15 = v37;
              goto LABEL_32;
            }

            id v4 = v36;
            id v15 = v37;
LABEL_31:

LABEL_32:
            if (v15 != v16)
            {
            }
            goto LABEL_41;
          }
        }
        int64_t v26 = [(HKClinicalAccountEvent *)self credentialStateBefore];
        if (v26 == [(HKClinicalAccountEvent *)v7 credentialStateBefore])
        {
          int64_t v27 = [(HKClinicalAccountEvent *)self credentialStateAfter];
          BOOL v13 = v27 == [(HKClinicalAccountEvent *)v7 credentialStateAfter];
          BOOL v28 = v13;
          if (v22 != v23) {
            goto LABEL_29;
          }
          goto LABEL_51;
        }
        if (v22 == v23)
        {
          BOOL v28 = 0;
          BOOL v13 = 0;
LABEL_51:

          goto LABEL_52;
        }

LABEL_47:
        BOOL v28 = 0;
        BOOL v13 = 0;
LABEL_52:
        if (v40 != v39)
        {

          BOOL v13 = v28;
        }

        if (v37 != v16)
        {
        }
LABEL_41:
        v11 = v42;
        v12 = v41;
        if (v8 != v9) {
          goto LABEL_42;
        }
LABEL_43:

        goto LABEL_44;
      }
      uint64_t v20 = [(HKClinicalAccountEvent *)v7 timestamp];
      if (!v20)
      {
        BOOL v13 = 0;
        goto LABEL_31;
      }
      v34 = (void *)v20;
      id v21 = [(HKClinicalAccountEvent *)self timestamp];
      id v19 = [(HKClinicalAccountEvent *)v7 timestamp];
      if ([v21 isEqualToDate:v19])
      {
        v31 = v21;
        v36 = v4;
        v37 = v15;
        v33 = v19;
        goto LABEL_21;
      }

      if (v15 == v16)
      {

        goto LABEL_39;
      }

      goto LABEL_37;
    }
    BOOL v13 = 0;
  }
LABEL_44:

  return v13;
}

- (unint64_t)hash
{
  int64_t v3 = self->_type ^ [(NSUUID *)self->_accountIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_caller hash];
  uint64_t v5 = v3 ^ v4 ^ [(NSDate *)self->_timestamp hash];
  return v5 ^ [(NSString *)self->_eventDescription hash] ^ self->_credentialStateBefore ^ self->_credentialStateAfter;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  NSUInteger v4 = [(HKClinicalAccountEvent *)self accountIdentifier];
  [v8 encodeObject:v4 forKey:@"accountIdentifier"];

  objc_msgSend(v8, "encodeInteger:forKey:", -[HKClinicalAccountEvent type](self, "type"), @"type");
  uint64_t v5 = [(HKClinicalAccountEvent *)self caller];
  [v8 encodeObject:v5 forKey:@"caller"];

  BOOL v6 = [(HKClinicalAccountEvent *)self timestamp];
  [v8 encodeObject:v6 forKey:@"timestamp"];

  int64_t v7 = [(HKClinicalAccountEvent *)self eventDescription];
  [v8 encodeObject:v7 forKey:@"eventDescription"];

  objc_msgSend(v8, "encodeInteger:forKey:", -[HKClinicalAccountEvent credentialStateBefore](self, "credentialStateBefore"), @"credentialStateBefore");
  objc_msgSend(v8, "encodeInteger:forKey:", -[HKClinicalAccountEvent credentialStateAfter](self, "credentialStateAfter"), @"credentialStateAfter");
}

- (HKClinicalAccountEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountIdentifier"];
  unint64_t v6 = [v4 decodeIntegerForKey:@"type"];
  int64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"caller"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
  int64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventDescription"];
  unint64_t v10 = [v4 decodeIntegerForKey:@"credentialStateBefore"];
  unint64_t v11 = [v4 decodeIntegerForKey:@"credentialStateAfter"];
  if (!v5 || !v7 || !v8 || !v9)
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
LABEL_11:
    v12 = 0;
    goto LABEL_12;
  }
  if (v6 > 2 || v10 > 3 || v11 >= 4)
  {
    objc_msgSend(v4, "hrs_failWithCocoaInvalidValueError");
    goto LABEL_11;
  }
  self = [(HKClinicalAccountEvent *)self initWithAccountIdentifier:v5 type:v6 caller:v7 timestamp:v8 eventDescription:v9 credentialStateBefore:v10 credentialStateAfter:v11];
  v12 = self;
LABEL_12:

  return v12;
}

- (NSString)typeDescription
{
  int64_t v2 = [(HKClinicalAccountEvent *)self type];
  int64_t v3 = @"unknown";
  if (v2 == 1) {
    int64_t v3 = @"credential state change";
  }
  if (v2 == 2) {
    id v4 = @"ignore incoming credential from sync";
  }
  else {
    id v4 = v3;
  }

  return (NSString *)v4;
}

- (NSString)credentialStateBeforeDescription
{
  int64_t v2 = [(HKClinicalAccountEvent *)self credentialStateBefore];
  if ((unint64_t)(v2 - 1) > 2) {
    return (NSString *)@"unknown";
  }
  else {
    return &off_2645EEDD0[v2 - 1]->isa;
  }
}

- (NSString)credentialStateAfterDescription
{
  int64_t v2 = [(HKClinicalAccountEvent *)self credentialStateAfter];
  if ((unint64_t)(v2 - 1) > 2) {
    return (NSString *)@"unknown";
  }
  else {
    return &off_2645EEDD0[v2 - 1]->isa;
  }
}

- (NSUUID)accountIdentifier
{
  return self->_accountIdentifier;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)caller
{
  return self->_caller;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSString)eventDescription
{
  return self->_eventDescription;
}

- (int64_t)credentialStateBefore
{
  return self->_credentialStateBefore;
}

- (int64_t)credentialStateAfter
{
  return self->_credentialStateAfter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDescription, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_caller, 0);

  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end