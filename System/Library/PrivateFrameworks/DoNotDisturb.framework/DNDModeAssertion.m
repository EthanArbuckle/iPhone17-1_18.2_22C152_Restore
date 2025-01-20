@interface DNDModeAssertion
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (DNDModeAssertion)initWithCoder:(id)a3;
- (DNDModeAssertion)initWithUUID:(id)a3 startDate:(id)a4 details:(id)a5 source:(id)a6;
- (DNDModeAssertionDetails)details;
- (DNDModeAssertionSource)source;
- (NSDate)startDate;
- (NSUUID)UUID;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DNDModeAssertion

- (DNDModeAssertion)initWithUUID:(id)a3 startDate:(id)a4 details:(id)a5 source:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v27.receiver = self;
  v27.super_class = (Class)DNDModeAssertion;
  v14 = [(DNDModeAssertion *)&v27 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    UUID = v14->_UUID;
    v14->_UUID = (NSUUID *)v15;

    v17 = (void *)[v11 copy];
    v18 = v17;
    if (v17)
    {
      v19 = v17;
    }
    else
    {
      v19 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
    startDate = v14->_startDate;
    v14->_startDate = v19;

    uint64_t v21 = [v12 copy];
    details = v14->_details;
    v14->_details = (DNDModeAssertionDetails *)v21;

    uint64_t v23 = [v13 copy];
    source = v14->_source;
    v14->_source = (DNDModeAssertionSource *)v23;

    if (!v11)
    {
      v25 = DNDLogModeAssertion;
      if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_FAULT)) {
        -[DNDModeAssertion initWithUUID:startDate:details:source:]((uint64_t)v14, v25);
      }
    }
  }

  return v14;
}

- (unint64_t)hash
{
  v3 = [(DNDModeAssertion *)self UUID];
  uint64_t v4 = [v3 hash];
  v5 = [(DNDModeAssertion *)self startDate];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(DNDModeAssertion *)self details];
  uint64_t v8 = [v7 hash];
  v9 = [(DNDModeAssertion *)self source];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (DNDModeAssertion *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(DNDModeAssertion *)self UUID];
      v7 = [(DNDModeAssertion *)v5 UUID];
      if (v6 != v7)
      {
        uint64_t v8 = [(DNDModeAssertion *)self UUID];
        if (!v8)
        {
          char v13 = 0;
          goto LABEL_50;
        }
        v9 = (void *)v8;
        unint64_t v10 = [(DNDModeAssertion *)v5 UUID];
        if (!v10)
        {
          char v13 = 0;
LABEL_49:

          goto LABEL_50;
        }
        id v11 = [(DNDModeAssertion *)self UUID];
        id v12 = [(DNDModeAssertion *)v5 UUID];
        if (![v11 isEqual:v12])
        {
          char v13 = 0;
LABEL_48:

          goto LABEL_49;
        }
        v49 = v12;
        v50 = v11;
        v51 = v10;
        v52 = v9;
      }
      v14 = [(DNDModeAssertion *)self startDate];
      uint64_t v15 = [(DNDModeAssertion *)v5 startDate];
      if (v14 != v15)
      {
        uint64_t v16 = [(DNDModeAssertion *)self startDate];
        if (v16)
        {
          v17 = (void *)v16;
          uint64_t v18 = [(DNDModeAssertion *)v5 startDate];
          if (v18)
          {
            v19 = (void *)v18;
            v48 = v14;
            v20 = [(DNDModeAssertion *)self startDate];
            uint64_t v21 = [(DNDModeAssertion *)v5 startDate];
            if (([v20 isEqual:v21] & 1) == 0)
            {

              goto LABEL_38;
            }
            v43 = v20;
            v44 = v19;
            v45 = v17;
            v14 = v21;
            goto LABEL_17;
          }
        }
        goto LABEL_38;
      }
      v48 = v14;
LABEL_17:
      v22 = [(DNDModeAssertion *)self details];
      v47 = [(DNDModeAssertion *)v5 details];
      if (v22 == v47)
      {
        v46 = v22;
        goto LABEL_25;
      }
      uint64_t v23 = [(DNDModeAssertion *)self details];
      if (v23)
      {
        v24 = (void *)v23;
        v25 = [(DNDModeAssertion *)v5 details];
        if (v25)
        {
          v40 = v14;
          v42 = v25;
          v26 = [(DNDModeAssertion *)self details];
          objc_super v27 = [(DNDModeAssertion *)v5 details];
          if ([v26 isEqual:v27])
          {
            v37 = v27;
            v38 = v26;
            v39 = v24;
            v46 = v22;
            v14 = v40;
LABEL_25:
            v28 = [(DNDModeAssertion *)self source];
            uint64_t v29 = [(DNDModeAssertion *)v5 source];
            if (v28 == (void *)v29)
            {

              char v13 = 1;
            }
            else
            {
              v30 = (void *)v29;
              uint64_t v31 = [(DNDModeAssertion *)self source];
              if (v31)
              {
                v41 = (void *)v31;
                v32 = [(DNDModeAssertion *)v5 source];
                if (v32)
                {
                  v36 = v32;
                  v35 = [(DNDModeAssertion *)self source];
                  v33 = [(DNDModeAssertion *)v5 source];
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
            if (v46 != v47)
            {
            }
            if (v48 != v15)
            {
            }
LABEL_47:
            unint64_t v10 = v51;
            v9 = v52;
            id v11 = v50;
            id v12 = v49;
            if (v6 != v7) {
              goto LABEL_48;
            }
LABEL_50:

            goto LABEL_51;
          }

          v14 = v40;
          v25 = v42;
        }
      }
      if (v48 != v15)
      {
      }
LABEL_38:
      char v13 = 0;
      goto LABEL_47;
    }
    char v13 = 0;
  }
LABEL_51:

  return v13;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(DNDModeAssertion *)self UUID];
  uint64_t v6 = [(DNDModeAssertion *)self startDate];
  v7 = [(DNDModeAssertion *)self details];
  uint64_t v8 = [(DNDModeAssertion *)self source];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; UUID: %@; startDate: %@; details: %@; source: %@>",
    v4,
    self,
    v5,
    v6,
    v7,
  v9 = v8);

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDModeAssertion)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"details"];
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"source"];

  v9 = [(DNDModeAssertion *)self initWithUUID:v5 startDate:v6 details:v7 source:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DNDModeAssertion *)self UUID];
  [v4 encodeObject:v5 forKey:@"UUID"];

  uint64_t v6 = [(DNDModeAssertion *)self startDate];
  [v4 encodeObject:v6 forKey:@"startDate"];

  v7 = [(DNDModeAssertion *)self details];
  [v4 encodeObject:v7 forKey:@"details"];

  id v8 = [(DNDModeAssertion *)self source];
  [v4 encodeObject:v8 forKey:@"source"];
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (DNDModeAssertionDetails)details
{
  return self->_details;
}

- (DNDModeAssertionSource)source
{
  return self->_source;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (void)initWithUUID:(uint64_t)a1 startDate:(NSObject *)a2 details:source:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_19CC2C000, a2, OS_LOG_TYPE_FAULT, "nil startDate provided to DNDModeAssertion initializer. %@", (uint8_t *)&v2, 0xCu);
}

@end