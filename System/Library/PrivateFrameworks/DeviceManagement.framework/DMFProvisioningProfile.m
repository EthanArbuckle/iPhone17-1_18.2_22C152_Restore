@interface DMFProvisioningProfile
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (DMFProvisioningProfile)initWithCoder:(id)a3;
- (DMFProvisioningProfile)initWithUUID:(id)a3 name:(id)a4 expirationDate:(id)a5;
- (NSDate)expirationDate;
- (NSString)UUID;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DMFProvisioningProfile

- (DMFProvisioningProfile)initWithUUID:(id)a3 name:(id)a4 expirationDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)DMFProvisioningProfile;
  v11 = [(DMFProvisioningProfile *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    UUID = v11->_UUID;
    v11->_UUID = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    name = v11->_name;
    v11->_name = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    expirationDate = v11->_expirationDate;
    v11->_expirationDate = (NSDate *)v16;
  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(DMFProvisioningProfile *)self UUID];
  v6 = [(DMFProvisioningProfile *)self name];
  v7 = [(DMFProvisioningProfile *)self expirationDate];
  id v8 = (void *)[v4 initWithUUID:v5 name:v6 expirationDate:v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFProvisioningProfile)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DMFProvisioningProfile;
  v5 = [(DMFProvisioningProfile *)&v16 init];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"UUID"];
    UUID = v5->_UUID;
    v5->_UUID = (NSString *)v7;

    id v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v10;

    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"expirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DMFProvisioningProfile *)self UUID];
  [v4 encodeObject:v5 forKey:@"UUID"];

  v6 = [(DMFProvisioningProfile *)self name];
  [v4 encodeObject:v6 forKey:@"name"];

  id v7 = [(DMFProvisioningProfile *)self expirationDate];
  [v4 encodeObject:v7 forKey:@"expirationDate"];
}

- (unint64_t)hash
{
  v3 = [(DMFProvisioningProfile *)self UUID];
  uint64_t v4 = [v3 hash];
  v5 = [(DMFProvisioningProfile *)self name];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(DMFProvisioningProfile *)self expirationDate];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (DMFProvisioningProfile *)a3;
  if (self == v4)
  {
    char v18 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(DMFProvisioningProfile *)self UUID];
      id v7 = [(DMFProvisioningProfile *)v5 UUID];
      unint64_t v8 = v6;
      unint64_t v9 = v7;
      if (v8 | v9 && (int v10 = [(id)v8 isEqual:v9], (id)v9, (id)v8, !v10))
      {
        char v18 = 0;
      }
      else
      {
        v11 = [(DMFProvisioningProfile *)self name];
        uint64_t v12 = [(DMFProvisioningProfile *)v5 name];
        unint64_t v13 = v11;
        unint64_t v14 = v12;
        if (v13 | v14
          && (int v15 = [(id)v13 isEqual:v14], (id)v14, (id)v13, !v15))
        {
          char v18 = 0;
        }
        else
        {
          uint64_t v16 = [(DMFProvisioningProfile *)self expirationDate];
          uint64_t v17 = [(DMFProvisioningProfile *)v5 expirationDate];
          if (v16 | v17) {
            char v18 = [(id)v16 isEqual:v17];
          }
          else {
            char v18 = 1;
          }
        }
      }
    }
    else
    {
      char v18 = 0;
    }
  }

  return v18;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@:%p {\n", objc_opt_class(), self];
  uint64_t v4 = [(DMFProvisioningProfile *)self name];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    uint64_t v6 = [(DMFProvisioningProfile *)self name];
    [v3 appendFormat:@"\tName            : “%@”\n", v6];
  }
  id v7 = [(DMFProvisioningProfile *)self UUID];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    unint64_t v9 = [(DMFProvisioningProfile *)self UUID];
    [v3 appendFormat:@"\tUUID            : %@\n", v9];
  }
  int v10 = [(DMFProvisioningProfile *)self expirationDate];

  if (v10)
  {
    v11 = [(DMFProvisioningProfile *)self expirationDate];
    [v3 appendFormat:@"\tExpiration Date : %@\n", v11];
  }
  [v3 appendString:@"}>"];
  uint64_t v12 = (void *)[v3 copy];

  return v12;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (NSString)name
{
  return self->_name;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end