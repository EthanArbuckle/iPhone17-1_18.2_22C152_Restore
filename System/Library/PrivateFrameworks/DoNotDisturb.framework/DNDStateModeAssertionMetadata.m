@interface DNDStateModeAssertionMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (DNDStateModeAssertionMetadata)initWithClientIdentifier:(id)a3 modeIdentifier:(id)a4 lifetimeType:(unint64_t)a5 activeDateInterval:(id)a6 userVisibleEndDate:(id)a7;
- (DNDStateModeAssertionMetadata)initWithCoder:(id)a3;
- (NSDate)userVisibleEndDate;
- (NSDateInterval)activeDateInterval;
- (NSString)clientIdentifier;
- (NSString)modeIdentifier;
- (id)description;
- (unint64_t)hash;
- (unint64_t)lifetimeType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DNDStateModeAssertionMetadata

- (DNDStateModeAssertionMetadata)initWithClientIdentifier:(id)a3 modeIdentifier:(id)a4 lifetimeType:(unint64_t)a5 activeDateInterval:(id)a6 userVisibleEndDate:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)DNDStateModeAssertionMetadata;
  v16 = [(DNDStateModeAssertionMetadata *)&v26 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    clientIdentifier = v16->_clientIdentifier;
    v16->_clientIdentifier = (NSString *)v17;

    uint64_t v19 = [v13 copy];
    modeIdentifier = v16->_modeIdentifier;
    v16->_modeIdentifier = (NSString *)v19;

    v16->_lifetimeType = a5;
    uint64_t v21 = [v14 copy];
    activeDateInterval = v16->_activeDateInterval;
    v16->_activeDateInterval = (NSDateInterval *)v21;

    uint64_t v23 = [v15 copy];
    userVisibleEndDate = v16->_userVisibleEndDate;
    v16->_userVisibleEndDate = (NSDate *)v23;
  }
  return v16;
}

- (unint64_t)hash
{
  v3 = [(DNDStateModeAssertionMetadata *)self clientIdentifier];
  uint64_t v4 = [v3 hash];
  v5 = [(DNDStateModeAssertionMetadata *)self modeIdentifier];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = [(DNDStateModeAssertionMetadata *)self lifetimeType];
  v8 = [(DNDStateModeAssertionMetadata *)self activeDateInterval];
  uint64_t v9 = v6 ^ v7 ^ [v8 hash];
  v10 = [(DNDStateModeAssertionMetadata *)self userVisibleEndDate];
  unint64_t v11 = v9 ^ [v10 hash];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (DNDStateModeAssertionMetadata *)a3;
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
      unint64_t v7 = [(DNDStateModeAssertionMetadata *)self clientIdentifier];
      v8 = [(DNDStateModeAssertionMetadata *)v6 clientIdentifier];
      if (v7 != v8)
      {
        uint64_t v9 = [(DNDStateModeAssertionMetadata *)self clientIdentifier];
        if (!v9)
        {
          char v13 = 0;
          goto LABEL_52;
        }
        v3 = (void *)v9;
        v10 = [(DNDStateModeAssertionMetadata *)v6 clientIdentifier];
        if (!v10)
        {
          char v13 = 0;
LABEL_51:

          goto LABEL_52;
        }
        unint64_t v11 = [(DNDStateModeAssertionMetadata *)self clientIdentifier];
        id v12 = [(DNDStateModeAssertionMetadata *)v6 clientIdentifier];
        if (![v11 isEqual:v12])
        {
          char v13 = 0;
LABEL_50:

          goto LABEL_51;
        }
        v49 = v12;
        v50 = v11;
        v51 = v10;
      }
      id v14 = [(DNDStateModeAssertionMetadata *)self modeIdentifier];
      id v15 = [(DNDStateModeAssertionMetadata *)v6 modeIdentifier];
      if (v14 != v15)
      {
        uint64_t v16 = [(DNDStateModeAssertionMetadata *)self modeIdentifier];
        if (!v16) {
          goto LABEL_39;
        }
        uint64_t v17 = (void *)v16;
        uint64_t v18 = [(DNDStateModeAssertionMetadata *)v6 modeIdentifier];
        if (!v18)
        {

          goto LABEL_39;
        }
        v46 = v17;
        v47 = (void *)v18;
        uint64_t v19 = [(DNDStateModeAssertionMetadata *)self modeIdentifier];
        v20 = [(DNDStateModeAssertionMetadata *)v6 modeIdentifier];
        if (([v19 isEqual:v20] & 1) == 0)
        {

LABEL_38:
          goto LABEL_39;
        }
        v45 = v20;
        v48 = v19;
      }
      unint64_t v21 = [(DNDStateModeAssertionMetadata *)self lifetimeType];
      if (v21 != [(DNDStateModeAssertionMetadata *)v6 lifetimeType])
      {
        char v13 = 0;
LABEL_46:
        if (v14 != v15)
        {
        }
LABEL_49:
        unint64_t v11 = v50;
        v10 = v51;
        id v12 = v49;
        if (v7 != v8) {
          goto LABEL_50;
        }
LABEL_52:

        goto LABEL_53;
      }
      v22 = [(DNDStateModeAssertionMetadata *)self activeDateInterval];
      uint64_t v23 = [(DNDStateModeAssertionMetadata *)v6 activeDateInterval];
      v24 = (void *)v23;
      if (v22 == (void *)v23)
      {
        v43 = v22;
        v44 = (void *)v23;
        goto LABEL_28;
      }
      uint64_t v25 = [(DNDStateModeAssertionMetadata *)self activeDateInterval];
      if (!v25)
      {

        uint64_t v19 = v48;
        if (v14 == v15) {
          goto LABEL_39;
        }
        goto LABEL_37;
      }
      v42 = (void *)v25;
      v43 = v22;
      v44 = v24;
      objc_super v26 = [(DNDStateModeAssertionMetadata *)v6 activeDateInterval];
      uint64_t v19 = v48;
      if (v26)
      {
        id v41 = v26;
        v27 = [(DNDStateModeAssertionMetadata *)self activeDateInterval];
        v28 = [(DNDStateModeAssertionMetadata *)v6 activeDateInterval];
        if ([v27 isEqual:v28])
        {
          v38 = v28;
          v39 = v27;
LABEL_28:
          v29 = [(DNDStateModeAssertionMetadata *)self userVisibleEndDate];
          uint64_t v30 = [(DNDStateModeAssertionMetadata *)v6 userVisibleEndDate];
          if (v29 == (void *)v30)
          {

            char v13 = 1;
          }
          else
          {
            v40 = (void *)v30;
            uint64_t v31 = [(DNDStateModeAssertionMetadata *)self userVisibleEndDate];
            if (v31)
            {
              v37 = (void *)v31;
              v32 = [(DNDStateModeAssertionMetadata *)v6 userVisibleEndDate];
              if (v32)
              {
                v36 = v32;
                v35 = [(DNDStateModeAssertionMetadata *)self userVisibleEndDate];
                v33 = [(DNDStateModeAssertionMetadata *)v6 userVisibleEndDate];
                char v13 = [v35 isEqual:v33];

                v32 = v36;
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
          }
          if (v43 != v44)
          {
          }
          goto LABEL_46;
        }

        objc_super v26 = v41;
        uint64_t v19 = v48;
      }

      if (v14 != v15)
      {
LABEL_37:

        goto LABEL_38;
      }
LABEL_39:

      char v13 = 0;
      goto LABEL_49;
    }
    char v13 = 0;
  }
LABEL_53:

  return v13;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(DNDStateModeAssertionMetadata *)self clientIdentifier];
  uint64_t v6 = [(DNDStateModeAssertionMetadata *)self modeIdentifier];
  unint64_t v7 = DNDStringFromModeAssertionLifetimeType([(DNDStateModeAssertionMetadata *)self lifetimeType]);
  v8 = [(DNDStateModeAssertionMetadata *)self activeDateInterval];
  uint64_t v9 = [(DNDStateModeAssertionMetadata *)self userVisibleEndDate];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; clientIdentifier: '%@'; modeIdentifier: '%@'; lifetimeType: %@; activeDateInterval: %@; userVisibleEndDate: %@>",
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
  v10 = v9);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDStateModeAssertionMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientIdentifier"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modeIdentifier"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"lifetimeType"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activeDateInterval"];
  uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userVisibleEndDate"];

  v10 = [(DNDStateModeAssertionMetadata *)self initWithClientIdentifier:v5 modeIdentifier:v6 lifetimeType:v7 activeDateInterval:v8 userVisibleEndDate:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DNDStateModeAssertionMetadata *)self clientIdentifier];
  [v4 encodeObject:v5 forKey:@"clientIdentifier"];

  uint64_t v6 = [(DNDStateModeAssertionMetadata *)self modeIdentifier];
  [v4 encodeObject:v6 forKey:@"modeIdentifier"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDStateModeAssertionMetadata lifetimeType](self, "lifetimeType"), @"lifetimeType");
  uint64_t v7 = [(DNDStateModeAssertionMetadata *)self activeDateInterval];
  [v4 encodeObject:v7 forKey:@"activeDateInterval"];

  id v8 = [(DNDStateModeAssertionMetadata *)self userVisibleEndDate];
  [v4 encodeObject:v8 forKey:@"userVisibleEndDate"];
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSString)modeIdentifier
{
  return self->_modeIdentifier;
}

- (unint64_t)lifetimeType
{
  return self->_lifetimeType;
}

- (NSDateInterval)activeDateInterval
{
  return self->_activeDateInterval;
}

- (NSDate)userVisibleEndDate
{
  return self->_userVisibleEndDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userVisibleEndDate, 0);
  objc_storeStrong((id *)&self->_activeDateInterval, 0);
  objc_storeStrong((id *)&self->_modeIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end