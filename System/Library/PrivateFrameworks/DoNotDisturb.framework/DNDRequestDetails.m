@interface DNDRequestDetails
+ (BOOL)supportsSecureCoding;
+ (id)detailsRepresentingNowWithClientIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (DNDRequestDetails)initWithClientIdentifier:(id)a3 auditUUID:(id)a4 timestamp:(unint64_t)a5;
- (DNDRequestDetails)initWithCoder:(id)a3;
- (NSString)clientIdentifier;
- (NSUUID)auditUUID;
- (id)debugDescription;
- (id)description;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DNDRequestDetails

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditUUID, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  v4 = [(DNDRequestDetails *)self clientIdentifier];
  [v6 encodeObject:v4 forKey:@"clientIdentifier"];

  v5 = [(DNDRequestDetails *)self auditUUID];
  [v6 encodeObject:v5 forKey:@"auditUUID"];

  objc_msgSend(v6, "encodeInt64:forKey:", -[DNDRequestDetails timestamp](self, "timestamp"), @"timestamp");
}

- (id)description
{
  v3 = NSString;
  v4 = [(DNDRequestDetails *)self clientIdentifier];
  v5 = [(DNDRequestDetails *)self auditUUID];
  id v6 = [v3 stringWithFormat:@"%@:%@", v4, v5];

  return v6;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSUUID)auditUUID
{
  return self->_auditUUID;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (DNDRequestDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientIdentifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"auditUUID"];
  uint64_t v7 = [v4 decodeInt64ForKey:@"timestamp"];

  v8 = [(DNDRequestDetails *)self initWithClientIdentifier:v5 auditUUID:v6 timestamp:v7];
  return v8;
}

- (DNDRequestDetails)initWithClientIdentifier:(id)a3 auditUUID:(id)a4 timestamp:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)DNDRequestDetails;
  v10 = [(DNDRequestDetails *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    clientIdentifier = v10->_clientIdentifier;
    v10->_clientIdentifier = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    auditUUID = v10->_auditUUID;
    v10->_auditUUID = (NSUUID *)v13;

    v10->_timestamp = a5;
  }

  return v10;
}

+ (id)detailsRepresentingNowWithClientIdentifier:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F29128];
  id v5 = a3;
  id v6 = [v4 UUID];
  uint64_t v7 = (void *)[objc_alloc((Class)a1) initWithClientIdentifier:v5 auditUUID:v6 timestamp:mach_absolute_time()];

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)((double)[(DNDRequestDetails *)self timestamp] * 1000.0);
  id v4 = [(DNDRequestDetails *)self clientIdentifier];
  uint64_t v5 = [v4 hash];
  id v6 = [(DNDRequestDetails *)self auditUUID];
  unint64_t v7 = v5 ^ [v6 hash] ^ v3;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v7 = (DNDRequestDetails *)a3;
  if (self == v7)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;
      id v9 = [(DNDRequestDetails *)self clientIdentifier];
      v10 = [(DNDRequestDetails *)v8 clientIdentifier];
      if (v9 != v10)
      {
        uint64_t v11 = [(DNDRequestDetails *)self clientIdentifier];
        if (!v11)
        {
          BOOL v14 = 0;
          goto LABEL_28;
        }
        unint64_t v3 = (void *)v11;
        uint64_t v12 = [(DNDRequestDetails *)v8 clientIdentifier];
        if (!v12)
        {
          BOOL v14 = 0;
LABEL_27:

          goto LABEL_28;
        }
        id v4 = (void *)v12;
        uint64_t v13 = [(DNDRequestDetails *)self clientIdentifier];
        uint64_t v5 = [(DNDRequestDetails *)v8 clientIdentifier];
        if (![v13 isEqual:v5])
        {
          BOOL v14 = 0;
LABEL_26:

          goto LABEL_27;
        }
        v26 = v5;
        v27 = v13;
        v28 = v4;
      }
      v15 = [(DNDRequestDetails *)self auditUUID];
      objc_super v16 = [(DNDRequestDetails *)v8 auditUUID];
      if (v15 == v16) {
        goto LABEL_16;
      }
      uint64_t v17 = [(DNDRequestDetails *)self auditUUID];
      if (!v17)
      {

        BOOL v14 = 0;
        goto LABEL_25;
      }
      uint64_t v5 = (void *)v17;
      uint64_t v18 = [(DNDRequestDetails *)v8 auditUUID];
      if (!v18)
      {
        BOOL v14 = 0;
        goto LABEL_23;
      }
      v24 = (void *)v18;
      uint64_t v19 = [(DNDRequestDetails *)self auditUUID];
      uint64_t v20 = [(DNDRequestDetails *)v8 auditUUID];
      v25 = (void *)v19;
      v21 = (void *)v19;
      id v4 = (void *)v20;
      if ([v21 isEqual:v20])
      {
LABEL_16:
        unint64_t v22 = [(DNDRequestDetails *)self timestamp];
        BOOL v14 = v22 == [(DNDRequestDetails *)v8 timestamp];
        if (v15 == v16)
        {

LABEL_24:
LABEL_25:
          uint64_t v13 = v27;
          id v4 = v28;
          uint64_t v5 = v26;
          if (v9 != v10) {
            goto LABEL_26;
          }
LABEL_28:

          goto LABEL_29;
        }
      }
      else
      {
        BOOL v14 = 0;
      }

LABEL_23:
      goto LABEL_24;
    }
    BOOL v14 = 0;
  }
LABEL_29:

  return v14;
}

- (id)debugDescription
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(DNDRequestDetails *)self clientIdentifier];
  id v6 = [(DNDRequestDetails *)self auditUUID];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; clientIdentifier: '%@'; auditUUID: %@; timestamp: %llu>",
    v4,
    self,
    v5,
    v6,
  unint64_t v7 = [(DNDRequestDetails *)self timestamp]);

  return v7;
}

@end