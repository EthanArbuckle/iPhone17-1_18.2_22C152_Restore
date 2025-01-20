@interface DNDModeAssertionInvalidation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (DNDModeAssertion)assertion;
- (DNDModeAssertionInvalidation)initWithAssertion:(id)a3 invalidationDate:(id)a4 details:(id)a5 source:(id)a6 reason:(unint64_t)a7 reasonOverride:(unint64_t)a8;
- (DNDModeAssertionInvalidation)initWithCoder:(id)a3;
- (DNDModeAssertionInvalidationDetails)details;
- (DNDModeAssertionSource)source;
- (NSDate)invalidationDate;
- (id)description;
- (unint64_t)hash;
- (unint64_t)reason;
- (unint64_t)reasonOverride;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DNDModeAssertionInvalidation

- (DNDModeAssertionInvalidation)initWithAssertion:(id)a3 invalidationDate:(id)a4 details:(id)a5 source:(id)a6 reason:(unint64_t)a7 reasonOverride:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v28.receiver = self;
  v28.super_class = (Class)DNDModeAssertionInvalidation;
  v18 = [(DNDModeAssertionInvalidation *)&v28 init];
  if (v18)
  {
    uint64_t v19 = [v14 copy];
    assertion = v18->_assertion;
    v18->_assertion = (DNDModeAssertion *)v19;

    uint64_t v21 = [v15 copy];
    invalidationDate = v18->_invalidationDate;
    v18->_invalidationDate = (NSDate *)v21;

    uint64_t v23 = [v16 copy];
    details = v18->_details;
    v18->_details = (DNDModeAssertionInvalidationDetails *)v23;

    uint64_t v25 = [v17 copy];
    source = v18->_source;
    v18->_source = (DNDModeAssertionSource *)v25;

    v18->_reason = a7;
    v18->_reasonOverride = a8;
  }

  return v18;
}

- (unint64_t)hash
{
  v3 = [(DNDModeAssertionInvalidation *)self assertion];
  uint64_t v4 = [v3 hash];
  v5 = [(DNDModeAssertionInvalidation *)self invalidationDate];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(DNDModeAssertionInvalidation *)self details];
  uint64_t v8 = [v7 hash];
  v9 = [(DNDModeAssertionInvalidation *)self source];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  unint64_t v11 = [(DNDModeAssertionInvalidation *)self reason];
  unint64_t v12 = v10 ^ v11 ^ [(DNDModeAssertionInvalidation *)self reasonOverride];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (DNDModeAssertionInvalidation *)a3;
  if (self == v6)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = v6;
      uint64_t v8 = [(DNDModeAssertionInvalidation *)self assertion];
      v9 = [(DNDModeAssertionInvalidation *)v7 assertion];
      if (v8 != v9)
      {
        uint64_t v10 = [(DNDModeAssertionInvalidation *)self assertion];
        if (!v10)
        {
          BOOL v13 = 0;
          goto LABEL_65;
        }
        v3 = (void *)v10;
        unint64_t v11 = [(DNDModeAssertionInvalidation *)v7 assertion];
        if (!v11)
        {
          BOOL v13 = 0;
LABEL_64:

          goto LABEL_65;
        }
        unint64_t v12 = [(DNDModeAssertionInvalidation *)self assertion];
        uint64_t v4 = [(DNDModeAssertionInvalidation *)v7 assertion];
        if (![v12 isEqual:v4])
        {
          BOOL v13 = 0;
LABEL_63:

          goto LABEL_64;
        }
        v57 = v3;
        v54 = v4;
        v55 = v12;
        v56 = v11;
      }
      id v14 = [(DNDModeAssertionInvalidation *)self invalidationDate];
      id v15 = [(DNDModeAssertionInvalidation *)v7 invalidationDate];
      if (v14 != v15)
      {
        uint64_t v16 = [(DNDModeAssertionInvalidation *)self invalidationDate];
        if (v16)
        {
          id v17 = (void *)v16;
          v58 = v14;
          uint64_t v18 = [(DNDModeAssertionInvalidation *)v7 invalidationDate];
          if (v18)
          {
            uint64_t v19 = (void *)v18;
            v3 = [(DNDModeAssertionInvalidation *)self invalidationDate];
            uint64_t v4 = [(DNDModeAssertionInvalidation *)v7 invalidationDate];
            if ([v3 isEqual:v4])
            {
              v47 = v19;
              v48 = v17;
              goto LABEL_17;
            }
          }
        }
        else
        {
        }
LABEL_45:
        BOOL v13 = 0;
        goto LABEL_62;
      }
      v58 = v14;
LABEL_17:
      v20 = [(DNDModeAssertionInvalidation *)self details];
      uint64_t v21 = [(DNDModeAssertionInvalidation *)v7 details];
      if (v20 == v21)
      {
        v50 = v20;
        v51 = v4;
        v53 = v3;
LABEL_26:
        uint64_t v26 = [(DNDModeAssertionInvalidation *)self source];
        v27 = [(DNDModeAssertionInvalidation *)v7 source];
        v52 = (void *)v26;
        if ((void *)v26 == v27)
        {
          v44 = v20;
        }
        else
        {
          uint64_t v28 = [(DNDModeAssertionInvalidation *)self source];
          v29 = v20;
          if (!v28)
          {

            BOOL v13 = 0;
            goto LABEL_53;
          }
          v43 = (void *)v28;
          uint64_t v30 = [(DNDModeAssertionInvalidation *)v7 source];
          if (!v30)
          {
            BOOL v13 = 0;
LABEL_52:

LABEL_53:
            v37 = v50;
            if (v50 != v21)
            {
              v39 = v45;
LABEL_58:
            }
LABEL_59:

            if (v58 != v15)
            {
            }
LABEL_62:
            unint64_t v11 = v56;
            v3 = v57;
            uint64_t v4 = v54;
            unint64_t v12 = v55;
            if (v8 != v9) {
              goto LABEL_63;
            }
LABEL_65:

            goto LABEL_66;
          }
          v42 = (void *)v30;
          uint64_t v31 = [(DNDModeAssertionInvalidation *)self source];
          uint64_t v32 = [(DNDModeAssertionInvalidation *)v7 source];
          v41 = (void *)v31;
          v33 = (void *)v31;
          v20 = (void *)v32;
          if (![v33 isEqual:v32])
          {
            BOOL v13 = 0;
LABEL_51:

            goto LABEL_52;
          }
          v44 = v29;
        }
        unint64_t v34 = [(DNDModeAssertionInvalidation *)self reason];
        if (v34 != [(DNDModeAssertionInvalidation *)v7 reason])
        {
          if (v52 != v27)
          {

            BOOL v13 = 0;
            v37 = v50;
            BOOL v38 = v50 == v21;
            v29 = v44;
            goto LABEL_57;
          }
          BOOL v13 = 0;
          v29 = v44;
LABEL_56:

          v37 = v50;
          BOOL v38 = v50 == v21;
LABEL_57:
          v39 = v45;
          if (!v38) {
            goto LABEL_58;
          }
          goto LABEL_59;
        }
        unint64_t v35 = [(DNDModeAssertionInvalidation *)self reasonOverride];
        BOOL v13 = v35 == [(DNDModeAssertionInvalidation *)v7 reasonOverride];
        v29 = v44;
        if (v52 == v27) {
          goto LABEL_56;
        }
        goto LABEL_51;
      }
      uint64_t v22 = [(DNDModeAssertionInvalidation *)self details];
      if (v22)
      {
        v49 = (void *)v22;
        uint64_t v23 = [(DNDModeAssertionInvalidation *)v7 details];
        if (v23)
        {
          v51 = v4;
          v53 = v3;
          v46 = (void *)v23;
          v24 = [(DNDModeAssertionInvalidation *)self details];
          uint64_t v25 = [(DNDModeAssertionInvalidation *)v7 details];
          if ([v24 isEqual:v25])
          {
            v50 = v20;
            v20 = v24;
            v45 = v25;
            goto LABEL_26;
          }

          v36 = v58;
          if (v58 != v15)
          {

            goto LABEL_42;
          }
          goto LABEL_43;
        }
      }
      v36 = v58;
      if (v58 != v15)
      {

LABEL_42:
LABEL_44:

        goto LABEL_45;
      }
LABEL_43:

      goto LABEL_44;
    }
    BOOL v13 = 0;
  }
LABEL_66:

  return v13;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(DNDModeAssertionInvalidation *)self assertion];
  uint64_t v6 = [(DNDModeAssertionInvalidation *)self invalidationDate];
  v7 = [(DNDModeAssertionInvalidation *)self details];
  uint64_t v8 = [(DNDModeAssertionInvalidation *)self source];
  v9 = DNDModeAssertionInvalidationReasonToString([(DNDModeAssertionInvalidation *)self reason]);
  uint64_t v10 = DNDModeAssertionInvalidationReasonOverrideToString([(DNDModeAssertionInvalidation *)self reasonOverride]);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; assertion: %@; invalidationDate: %@; details: %@; source: %@; reason: %@; reasonOverride: %@>",
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDModeAssertionInvalidation)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assertion"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"invalidationDate"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"details"];
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"source"];
  uint64_t v9 = [v4 decodeIntegerForKey:@"reason"];
  uint64_t v10 = [v4 decodeIntegerForKey:@"reasonOverride"];

  unint64_t v11 = [(DNDModeAssertionInvalidation *)self initWithAssertion:v5 invalidationDate:v6 details:v7 source:v8 reason:v9 reasonOverride:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = [(DNDModeAssertionInvalidation *)self assertion];
  [v8 encodeObject:v4 forKey:@"assertion"];

  v5 = [(DNDModeAssertionInvalidation *)self invalidationDate];
  [v8 encodeObject:v5 forKey:@"invalidationDate"];

  uint64_t v6 = [(DNDModeAssertionInvalidation *)self details];
  [v8 encodeObject:v6 forKey:@"details"];

  v7 = [(DNDModeAssertionInvalidation *)self source];
  [v8 encodeObject:v7 forKey:@"source"];

  objc_msgSend(v8, "encodeInteger:forKey:", -[DNDModeAssertionInvalidation reason](self, "reason"), @"reason");
  objc_msgSend(v8, "encodeInteger:forKey:", -[DNDModeAssertionInvalidation reasonOverride](self, "reasonOverride"), @"reasonOverride");
}

- (DNDModeAssertion)assertion
{
  return self->_assertion;
}

- (NSDate)invalidationDate
{
  return self->_invalidationDate;
}

- (DNDModeAssertionInvalidationDetails)details
{
  return self->_details;
}

- (DNDModeAssertionSource)source
{
  return self->_source;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (unint64_t)reasonOverride
{
  return self->_reasonOverride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_invalidationDate, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
}

@end