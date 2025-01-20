@interface DMFProfilePayload
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (DMFProfilePayload)initWithCoder:(id)a3;
- (DMFProfilePayload)initWithType:(id)a3 identifier:(id)a4 payloadVersion:(int64_t)a5 displayName:(id)a6 organization:(id)a7 payloadDescription:(id)a8;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)organization;
- (NSString)payloadDescription;
- (NSString)type;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)payloadVersion;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DMFProfilePayload

- (DMFProfilePayload)initWithType:(id)a3 identifier:(id)a4 payloadVersion:(int64_t)a5 displayName:(id)a6 organization:(id)a7 payloadDescription:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v31.receiver = self;
  v31.super_class = (Class)DMFProfilePayload;
  v19 = [(DMFProfilePayload *)&v31 init];
  if (v19)
  {
    uint64_t v20 = [v14 copy];
    type = v19->_type;
    v19->_type = (NSString *)v20;

    uint64_t v22 = [v15 copy];
    identifier = v19->_identifier;
    v19->_identifier = (NSString *)v22;

    v19->_payloadVersion = a5;
    uint64_t v24 = [v16 copy];
    displayName = v19->_displayName;
    v19->_displayName = (NSString *)v24;

    uint64_t v26 = [v17 copy];
    organization = v19->_organization;
    v19->_organization = (NSString *)v26;

    uint64_t v28 = [v18 copy];
    payloadDescription = v19->_payloadDescription;
    v19->_payloadDescription = (NSString *)v28;
  }
  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(DMFProfilePayload *)self type];
  v6 = [(DMFProfilePayload *)self identifier];
  int64_t v7 = [(DMFProfilePayload *)self payloadVersion];
  v8 = [(DMFProfilePayload *)self displayName];
  v9 = [(DMFProfilePayload *)self organization];
  v10 = [(DMFProfilePayload *)self payloadDescription];
  v11 = (void *)[v4 initWithType:v5 identifier:v6 payloadVersion:v7 displayName:v8 organization:v9 payloadDescription:v10];

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFProfilePayload)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)DMFProfilePayload;
  v5 = [(DMFProfilePayload *)&v23 init];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"type"];
    type = v5->_type;
    v5->_type = (NSString *)v7;

    v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payloadVersion"];
    v5->_payloadVersion = [v12 integerValue];

    v13 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v14;

    id v16 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"organization"];
    organization = v5->_organization;
    v5->_organization = (NSString *)v17;

    v19 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"payloadDescription"];
    payloadDescription = v5->_payloadDescription;
    v5->_payloadDescription = (NSString *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DMFProfilePayload *)self type];
  [v4 encodeObject:v5 forKey:@"type"];

  v6 = [(DMFProfilePayload *)self identifier];
  [v4 encodeObject:v6 forKey:@"identifier"];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[DMFProfilePayload payloadVersion](self, "payloadVersion"));
  [v4 encodeObject:v7 forKey:@"payloadVersion"];

  v8 = [(DMFProfilePayload *)self displayName];
  [v4 encodeObject:v8 forKey:@"displayName"];

  v9 = [(DMFProfilePayload *)self organization];
  [v4 encodeObject:v9 forKey:@"organization"];

  id v10 = [(DMFProfilePayload *)self payloadDescription];
  [v4 encodeObject:v10 forKey:@"payloadDescription"];
}

- (unint64_t)hash
{
  v3 = [(DMFProfilePayload *)self type];
  uint64_t v4 = [v3 hash];
  v5 = [(DMFProfilePayload *)self identifier];
  uint64_t v6 = [v5 hash] ^ v4;
  int64_t v7 = [(DMFProfilePayload *)self payloadVersion];
  v8 = [(DMFProfilePayload *)self displayName];
  uint64_t v9 = v6 ^ v7 ^ [v8 hash];
  id v10 = [(DMFProfilePayload *)self organization];
  uint64_t v11 = [v10 hash];
  v12 = [(DMFProfilePayload *)self payloadDescription];
  unint64_t v13 = v9 ^ v11 ^ [v12 hash];

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (DMFProfilePayload *)a3;
  if (self == v4)
  {
    char v27 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(DMFProfilePayload *)self type];
      int64_t v7 = [(DMFProfilePayload *)v5 type];
      unint64_t v8 = v6;
      unint64_t v9 = v7;
      if (v8 | v9 && (int v10 = [(id)v8 isEqual:v9], (id)v9, (id)v8, !v10))
      {
        char v27 = 0;
      }
      else
      {
        uint64_t v11 = [(DMFProfilePayload *)self identifier];
        v12 = [(DMFProfilePayload *)v5 identifier];
        unint64_t v13 = v11;
        unint64_t v14 = v12;
        if ((!(v13 | v14)
           || (int v15 = [(id)v13 isEqual:v14], (id)v14, (id)v13, v15))
          && (int64_t v16 = [(DMFProfilePayload *)self payloadVersion],
              v16 == [(DMFProfilePayload *)v5 payloadVersion]))
        {
          uint64_t v17 = [(DMFProfilePayload *)self displayName];
          id v18 = [(DMFProfilePayload *)v5 displayName];
          unint64_t v19 = v17;
          unint64_t v20 = v18;
          if (v19 | v20
            && (int v21 = [(id)v19 isEqual:v20], (id)v20, (id)v19, !v21))
          {
            char v27 = 0;
          }
          else
          {
            unint64_t v31 = v20;
            uint64_t v22 = [(DMFProfilePayload *)self organization];
            objc_super v23 = [(DMFProfilePayload *)v5 organization];
            unint64_t v24 = v22;
            unint64_t v32 = v23;
            if (v24 | v32
              && (int v29 = [(id)v24 isEqual:v32], (id)v32, (id)v24, !v29))
            {
              char v27 = 0;
            }
            else
            {
              uint64_t v25 = [(DMFProfilePayload *)self payloadDescription];
              uint64_t v26 = [(DMFProfilePayload *)v5 payloadDescription];
              if (v25 | v26) {
                char v27 = [(id)v25 isEqual:v26];
              }
              else {
                char v27 = 1;
              }

              unint64_t v19 = v30;
            }

            unint64_t v20 = v31;
          }
        }
        else
        {
          char v27 = 0;
        }
      }
    }
    else
    {
      char v27 = 0;
    }
  }

  return v27;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(DMFProfilePayload *)self identifier];
  uint64_t v6 = [(DMFProfilePayload *)self type];
  int64_t v7 = [(DMFProfilePayload *)self displayName];
  unint64_t v8 = [v3 stringWithFormat:@"<%@: %p { identifier = %@, type = %@, displayName = %@ }>", v4, self, v5, v6, v7];

  return v8;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)payloadVersion
{
  return self->_payloadVersion;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)organization
{
  return self->_organization;
}

- (NSString)payloadDescription
{
  return self->_payloadDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadDescription, 0);
  objc_storeStrong((id *)&self->_organization, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end