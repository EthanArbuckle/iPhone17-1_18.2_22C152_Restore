@interface DMFCertificate
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIdentity;
- (DMFCertificate)initWithCoder:(id)a3;
- (DMFCertificate)initWithCommonName:(id)a3 data:(id)a4 isIdentity:(BOOL)a5;
- (NSData)data;
- (NSString)commonName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DMFCertificate

- (DMFCertificate)initWithCommonName:(id)a3 data:(id)a4 isIdentity:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)DMFCertificate;
  v10 = [(DMFCertificate *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    commonName = v10->_commonName;
    v10->_commonName = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    data = v10->_data;
    v10->_data = (NSData *)v13;

    v10->_isIdentity = a5;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(DMFCertificate *)self commonName];
  v6 = [(DMFCertificate *)self data];
  v7 = objc_msgSend(v4, "initWithCommonName:data:isIdentity:", v5, v6, -[DMFCertificate isIdentity](self, "isIdentity"));

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFCertificate)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DMFCertificate;
  v5 = [(DMFCertificate *)&v14 init];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"commonName"];
    commonName = v5->_commonName;
    v5->_commonName = (NSString *)v7;

    id v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"data"];
    data = v5->_data;
    v5->_data = (NSData *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isIdentity"];
    v5->_isIdentity = [v12 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DMFCertificate *)self commonName];
  [v4 encodeObject:v5 forKey:@"commonName"];

  v6 = [(DMFCertificate *)self data];
  [v4 encodeObject:v6 forKey:@"data"];

  objc_msgSend(NSNumber, "numberWithBool:", -[DMFCertificate isIdentity](self, "isIdentity"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"isIdentity"];
}

- (unint64_t)hash
{
  v3 = [(DMFCertificate *)self commonName];
  uint64_t v4 = [v3 hash];
  v5 = [(DMFCertificate *)self data];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = v6 ^ [(DMFCertificate *)self isIdentity];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (DMFCertificate *)a3;
  if (self == v4)
  {
    LOBYTE(v17) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(DMFCertificate *)self commonName];
      unint64_t v7 = [(DMFCertificate *)v5 commonName];
      unint64_t v8 = v6;
      unint64_t v9 = v7;
      if (v8 | v9 && (int v10 = [(id)v8 isEqual:v9], (id)v9, (id)v8, !v10))
      {
        LOBYTE(v17) = 0;
      }
      else
      {
        uint64_t v11 = [(DMFCertificate *)self data];
        v12 = [(DMFCertificate *)v5 data];
        unint64_t v13 = v11;
        unint64_t v14 = v12;
        if (v13 | v14
          && (int v15 = [(id)v13 isEqual:v14], (id)v14, (id)v13, !v15))
        {
          LOBYTE(v17) = 0;
        }
        else
        {
          BOOL v16 = [(DMFCertificate *)self isIdentity];
          BOOL v17 = v16 ^ [(DMFCertificate *)v5 isIdentity] ^ 1;
        }
      }
    }
    else
    {
      LOBYTE(v17) = 0;
    }
  }

  return v17;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@:%p {\n", objc_opt_class(), self];
  uint64_t v4 = [(DMFCertificate *)self commonName];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    uint64_t v6 = [(DMFCertificate *)self commonName];
    [v3 appendFormat:@"\tCommon Name     : “%@”\n", v6];
  }
  unint64_t v7 = [(DMFCertificate *)self data];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    unint64_t v9 = [(DMFCertificate *)self data];
    [v3 appendFormat:@"\tData            : %@\n", v9];
  }
  BOOL v10 = [(DMFCertificate *)self isIdentity];
  uint64_t v11 = @"NO";
  if (v10) {
    uint64_t v11 = @"YES";
  }
  [v3 appendFormat:@"\tIs Identity     : %@\n", v11];
  [v3 appendString:@"}>"];
  v12 = (void *)[v3 copy];

  return v12;
}

- (NSString)commonName
{
  return self->_commonName;
}

- (NSData)data
{
  return self->_data;
}

- (BOOL)isIdentity
{
  return self->_isIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_commonName, 0);
}

@end