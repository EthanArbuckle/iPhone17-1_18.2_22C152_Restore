@interface DNDModeAssertionDetails
+ (BOOL)supportsSecureCoding;
+ (DNDModeAssertionDetails)detailsWithIdentifier:(id)a3 modeIdentifier:(id)a4 lifetime:(id)a5;
+ (DNDModeAssertionDetails)detailsWithIdentifier:(id)a3 modeIdentifier:(id)a4 lifetime:(id)a5 reason:(unint64_t)a6;
+ (id)userRequestedAssertionDetailsWithIdentifier:(id)a3 modeIdentifier:(id)a4 lifetime:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUserRequested;
- (DNDModeAssertionDetails)init;
- (DNDModeAssertionDetails)initWithCoder:(id)a3;
- (DNDModeAssertionLifetime)lifetime;
- (NSDate)modeConfigurationModifiedDate;
- (NSDate)userVisibleEndDate;
- (NSString)identifier;
- (NSString)modeIdentifier;
- (id)_initWithDetails:(id)a3;
- (id)_initWithIdentifier:(id)a3 modeIdentifier:(id)a4 modeConfigurationModifiedDate:(id)a5 lifetime:(id)a6 reason:(unint64_t)a7 userVisibleEndDate:(id)a8;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)reason;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DNDModeAssertionDetails

+ (DNDModeAssertionDetails)detailsWithIdentifier:(id)a3 modeIdentifier:(id)a4 lifetime:(id)a5
{
  return (DNDModeAssertionDetails *)[a1 detailsWithIdentifier:a3 modeIdentifier:a4 lifetime:a5 reason:0];
}

+ (DNDModeAssertionDetails)detailsWithIdentifier:(id)a3 modeIdentifier:(id)a4 lifetime:(id)a5 reason:(unint64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v13 = 0;
  }
  else {
    v13 = v10;
  }
  id v14 = v13;

  v15 = (void *)[objc_alloc((Class)a1) _initWithIdentifier:v12 modeIdentifier:v11 modeConfigurationModifiedDate:0 lifetime:v14 reason:a6 userVisibleEndDate:0];
  return (DNDModeAssertionDetails *)v15;
}

- (DNDModeAssertionDetails)init
{
  return (DNDModeAssertionDetails *)[(DNDModeAssertionDetails *)self _initWithDetails:0];
}

- (id)_initWithDetails:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  v6 = [v4 modeIdentifier];
  v7 = [v4 modeConfigurationModifiedDate];
  v8 = [v4 lifetime];
  uint64_t v9 = [v4 reason];
  id v10 = [v4 userVisibleEndDate];

  id v11 = [(DNDModeAssertionDetails *)self _initWithIdentifier:v5 modeIdentifier:v6 modeConfigurationModifiedDate:v7 lifetime:v8 reason:v9 userVisibleEndDate:v10];
  return v11;
}

- (id)_initWithIdentifier:(id)a3 modeIdentifier:(id)a4 modeConfigurationModifiedDate:(id)a5 lifetime:(id)a6 reason:(unint64_t)a7 userVisibleEndDate:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  v33.receiver = self;
  v33.super_class = (Class)DNDModeAssertionDetails;
  v19 = [(DNDModeAssertionDetails *)&v33 init];
  if (v19)
  {
    uint64_t v20 = [v14 copy];
    v21 = (void *)v20;
    if (v20) {
      v22 = (__CFString *)v20;
    }
    else {
      v22 = &stru_1EEDCFB98;
    }
    objc_storeStrong((id *)&v19->_identifier, v22);

    uint64_t v23 = [v15 copy];
    v24 = (void *)v23;
    if (v23) {
      v25 = (__CFString *)v23;
    }
    else {
      v25 = @"com.apple.donotdisturb.mode.default";
    }
    objc_storeStrong((id *)&v19->_modeIdentifier, v25);

    uint64_t v26 = [v16 copy];
    modeConfigurationModifiedDate = v19->_modeConfigurationModifiedDate;
    v19->_modeConfigurationModifiedDate = (NSDate *)v26;

    uint64_t v28 = [v17 copy];
    lifetime = v19->_lifetime;
    v19->_lifetime = (DNDModeAssertionLifetime *)v28;

    v19->_reason = a7;
    uint64_t v30 = [v18 copy];
    userVisibleEndDate = v19->_userVisibleEndDate;
    v19->_userVisibleEndDate = (NSDate *)v30;
  }
  return v19;
}

- (unint64_t)hash
{
  v3 = [(DNDModeAssertionDetails *)self identifier];
  uint64_t v4 = [v3 hash];
  v5 = [(DNDModeAssertionDetails *)self modeIdentifier];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(DNDModeAssertionDetails *)self modeConfigurationModifiedDate];
  uint64_t v8 = [v7 hash];
  uint64_t v9 = [(DNDModeAssertionDetails *)self lifetime];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  unint64_t v11 = [(DNDModeAssertionDetails *)self reason];
  id v12 = [(DNDModeAssertionDetails *)self userVisibleEndDate];
  unint64_t v13 = v10 ^ v11 ^ [v12 hash];

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (DNDModeAssertionDetails *)a3;
  if (self == v5)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = v5;
      v7 = [(DNDModeAssertionDetails *)self identifier];
      uint64_t v8 = [(DNDModeAssertionDetails *)v6 identifier];
      if (v7 != v8)
      {
        uint64_t v9 = [(DNDModeAssertionDetails *)self identifier];
        if (!v9)
        {
          char v13 = 0;
          goto LABEL_55;
        }
        uint64_t v10 = (void *)v9;
        v3 = [(DNDModeAssertionDetails *)v6 identifier];
        if (!v3)
        {
          char v13 = 0;
LABEL_54:

          goto LABEL_55;
        }
        unint64_t v11 = [(DNDModeAssertionDetails *)self identifier];
        id v12 = [(DNDModeAssertionDetails *)v6 identifier];
        if (![v11 isEqual:v12])
        {
          char v13 = 0;
LABEL_53:

          goto LABEL_54;
        }
        v64 = v10;
        v65 = v12;
        v66 = v11;
      }
      id v14 = [(DNDModeAssertionDetails *)self modeIdentifier];
      id v15 = [(DNDModeAssertionDetails *)v6 modeIdentifier];
      if (v14 == v15) {
        goto LABEL_16;
      }
      uint64_t v16 = [(DNDModeAssertionDetails *)self modeIdentifier];
      if (v16)
      {
        id v17 = (void *)v16;
        uint64_t v18 = [(DNDModeAssertionDetails *)v6 modeIdentifier];
        if (v18)
        {
          v61 = v3;
          v59 = (void *)v18;
          v19 = [(DNDModeAssertionDetails *)self modeIdentifier];
          uint64_t v20 = [(DNDModeAssertionDetails *)v6 modeIdentifier];
          if (([v19 isEqual:v20] & 1) == 0)
          {

            char v13 = 0;
            BOOL v32 = v7 == v8;
            id v12 = v65;
            unint64_t v11 = v66;
            v3 = v61;
            goto LABEL_52;
          }
          v54 = v17;
          v55 = v19;
          v3 = v61;
          v53 = v20;
LABEL_16:
          v21 = [(DNDModeAssertionDetails *)self modeConfigurationModifiedDate];
          uint64_t v22 = [(DNDModeAssertionDetails *)v6 modeConfigurationModifiedDate];
          uint64_t v23 = (void *)v22;
          v63 = v21;
          if (v21 == (void *)v22)
          {
            v60 = (void *)v22;
LABEL_24:
            v52 = v21;
            uint64_t v27 = [(DNDModeAssertionDetails *)self lifetime];
            [(DNDModeAssertionDetails *)v6 lifetime];
            v58 = v57 = (void *)v27;
            if ((void *)v27 == v58)
            {
              v62 = v3;
LABEL_32:
              unint64_t v33 = [(DNDModeAssertionDetails *)self reason];
              if (v33 == [(DNDModeAssertionDetails *)v6 reason])
              {
                v34 = [(DNDModeAssertionDetails *)self userVisibleEndDate];
                uint64_t v35 = [(DNDModeAssertionDetails *)v6 userVisibleEndDate];
                if (v34 != (void *)v35)
                {
                  v36 = (void *)v35;
                  uint64_t v37 = [(DNDModeAssertionDetails *)self userVisibleEndDate];
                  v3 = v62;
                  if (v37)
                  {
                    v45 = (void *)v37;
                    v38 = [(DNDModeAssertionDetails *)v6 userVisibleEndDate];
                    if (v38)
                    {
                      v44 = v38;
                      v43 = [(DNDModeAssertionDetails *)self userVisibleEndDate];
                      v39 = [(DNDModeAssertionDetails *)v6 userVisibleEndDate];
                      char v13 = [v43 isEqual:v39];

                      v3 = v62;
                      v38 = v44;
                    }
                    else
                    {
                      char v13 = 0;
                    }
                  }
                  else
                  {

                    char v13 = 0;
                  }
                  v42 = v57;
                  v41 = v58;
                  if (v57 == v58) {
                    goto LABEL_60;
                  }
                  goto LABEL_59;
                }

                char v13 = 1;
              }
              else
              {
                char v13 = 0;
              }
              v42 = v57;
              v41 = v58;
              v3 = v62;
              if (v57 == v58)
              {
LABEL_60:

                if (v63 != v60)
                {
                }
                if (v14 != v15)
                {
                }
                goto LABEL_51;
              }
LABEL_59:

              goto LABEL_60;
            }
            uint64_t v28 = [(DNDModeAssertionDetails *)self lifetime];
            if (v28)
            {
              v50 = (void *)v28;
              v29 = [(DNDModeAssertionDetails *)v6 lifetime];
              if (v29)
              {
                id v48 = v29;
                uint64_t v30 = [(DNDModeAssertionDetails *)self lifetime];
                v31 = [(DNDModeAssertionDetails *)v6 lifetime];
                if ([v30 isEqual:v31])
                {
                  v46 = v31;
                  v47 = v30;
                  v62 = v3;
                  goto LABEL_32;
                }

                v29 = v48;
              }
            }
            if (v63 != v60)
            {
            }
            if (v14 == v15) {
              goto LABEL_49;
            }
            goto LABEL_48;
          }
          uint64_t v24 = [(DNDModeAssertionDetails *)self modeConfigurationModifiedDate];
          if (v24)
          {
            v56 = (void *)v24;
            uint64_t v25 = [(DNDModeAssertionDetails *)v6 modeConfigurationModifiedDate];
            if (v25)
            {
              v60 = v23;
              v51 = (void *)v25;
              v21 = [(DNDModeAssertionDetails *)self modeConfigurationModifiedDate];
              uint64_t v26 = [(DNDModeAssertionDetails *)v6 modeConfigurationModifiedDate];
              if ([v21 isEqual:v26])
              {
                v49 = v26;
                goto LABEL_24;
              }

LABEL_41:
              if (v14 == v15)
              {

LABEL_50:
                char v13 = 0;
LABEL_51:
                BOOL v32 = v7 == v8;
                id v12 = v65;
                unint64_t v11 = v66;
LABEL_52:
                uint64_t v10 = v64;
                if (!v32) {
                  goto LABEL_53;
                }
LABEL_55:

                goto LABEL_56;
              }
LABEL_48:

              goto LABEL_49;
            }
          }
          goto LABEL_41;
        }
      }
LABEL_49:

      goto LABEL_50;
    }
    char v13 = 0;
  }
LABEL_56:

  return v13;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(DNDModeAssertionDetails *)self identifier];
  uint64_t v6 = [(DNDModeAssertionDetails *)self modeIdentifier];
  v7 = [(DNDModeAssertionDetails *)self modeConfigurationModifiedDate];
  uint64_t v8 = [(DNDModeAssertionDetails *)self lifetime];
  uint64_t v9 = DNDModeAssertionReasonToString([(DNDModeAssertionDetails *)self reason]);
  uint64_t v10 = [(DNDModeAssertionDetails *)self userVisibleEndDate];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; identifier: '%@'; modeIdentifier: '%@'; modeConfigurationModifiedDate: %@; lifetime: %@; reason: %@; userVisibleEndDate: %@>",
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9,
  unint64_t v11 = v10);

  return v11;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [DNDMutableModeAssertionDetails alloc];
  return [(DNDModeAssertionDetails *)v4 _initWithDetails:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDModeAssertionDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modeIdentifier"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modeConfigurationModifiedDate"];
  uint64_t v8 = +[DNDModeAssertionLifetime _secureCodingLifetimeClasses];
  uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"lifetime"];

  uint64_t v10 = [v4 decodeIntegerForKey:@"reason"];
  unint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userVisibleEndDate"];

  id v12 = [(DNDModeAssertionDetails *)self _initWithIdentifier:v5 modeIdentifier:v6 modeConfigurationModifiedDate:v7 lifetime:v9 reason:v10 userVisibleEndDate:v11];
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DNDModeAssertionDetails *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  uint64_t v6 = [(DNDModeAssertionDetails *)self modeIdentifier];
  [v4 encodeObject:v6 forKey:@"modeIdentifier"];

  v7 = [(DNDModeAssertionDetails *)self modeConfigurationModifiedDate];
  [v4 encodeObject:v7 forKey:@"modeConfigurationModifiedDate"];

  uint64_t v8 = [(DNDModeAssertionDetails *)self lifetime];
  [v4 encodeObject:v8 forKey:@"lifetime"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDModeAssertionDetails reason](self, "reason"), @"reason");
  id v9 = [(DNDModeAssertionDetails *)self userVisibleEndDate];
  [v4 encodeObject:v9 forKey:@"userVisibleEndDate"];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)modeIdentifier
{
  return self->_modeIdentifier;
}

- (NSDate)modeConfigurationModifiedDate
{
  return self->_modeConfigurationModifiedDate;
}

- (DNDModeAssertionLifetime)lifetime
{
  return self->_lifetime;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (NSDate)userVisibleEndDate
{
  return self->_userVisibleEndDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userVisibleEndDate, 0);
  objc_storeStrong((id *)&self->_lifetime, 0);
  objc_storeStrong((id *)&self->_modeConfigurationModifiedDate, 0);
  objc_storeStrong((id *)&self->_modeIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)userRequestedAssertionDetailsWithIdentifier:(id)a3 modeIdentifier:(id)a4 lifetime:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = v7;
  }
  id v11 = v10;

  if (v11)
  {
    id v12 = v7;
  }
  else
  {
    id v12 = +[DNDModeAssertionLifetime lifetimeUntilEndOfScheduleWithIdentifier:@"com.apple.donotdisturb.schedule.default"];
  }
  char v13 = +[DNDModeAssertionDetails detailsWithIdentifier:v9 modeIdentifier:v8 lifetime:v12];

  return v13;
}

- (BOOL)isUserRequested
{
  return 0;
}

@end