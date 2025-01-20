@interface CTRoadsideProvider
+ (BOOL)supportsSecureCoding;
- (BOOL)isActive;
- (BOOL)isCarrierProvider;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToProvider:(id)a3;
- (BOOL)supportsPayPerUse;
- (CTRoadsideProvider)initWithCoder:(id)a3;
- (NSArray)associatedPhoneNumbers;
- (NSString)bizId;
- (NSString)providerName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)providerId;
- (void)encodeWithCoder:(id)a3;
- (void)setAssociatedPhoneNumbers:(id)a3;
- (void)setBizId:(id)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setIsCarrierProvider:(BOOL)a3;
- (void)setProviderId:(int64_t)a3;
- (void)setProviderName:(id)a3;
- (void)setSupportsPayPerUse:(BOOL)a3;
@end

@implementation CTRoadsideProvider

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v3 appendFormat:@", providerId=%ld", -[CTRoadsideProvider providerId](self, "providerId")];
  v4 = [(CTRoadsideProvider *)self providerName];
  [v3 appendFormat:@", providerName=%@", v4];

  v5 = [(CTRoadsideProvider *)self bizId];
  [v3 appendFormat:@", bizId=%@", v5];

  if ([(CTRoadsideProvider *)self supportsPayPerUse]) {
    v6 = "YES";
  }
  else {
    v6 = "NO";
  }
  [v3 appendFormat:@", supportsPayPerUse=%s", v6];
  if ([(CTRoadsideProvider *)self isActive]) {
    v7 = "YES";
  }
  else {
    v7 = "NO";
  }
  [v3 appendFormat:@", isActive=%s", v7];
  if ([(CTRoadsideProvider *)self isCarrierProvider]) {
    v8 = "YES";
  }
  else {
    v8 = "NO";
  }
  [v3 appendFormat:@", isCarrierProvider=%s", v8];
  v9 = [(CTRoadsideProvider *)self associatedPhoneNumbers];
  [v3 appendFormat:@", associatedPhoneNumbers=%@", v9];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToProvider:(id)a3
{
  id v7 = a3;
  int64_t v8 = [(CTRoadsideProvider *)self providerId];
  if (v8 == [v7 providerId])
  {
    v9 = [(CTRoadsideProvider *)self providerName];
    v10 = [v7 providerName];
    if (v9 != v10)
    {
      v23 = [(CTRoadsideProvider *)self providerName];
      v3 = [v7 providerName];
      if (![v23 isEqual:v3])
      {
        char v11 = 0;
        goto LABEL_17;
      }
    }
    v12 = [(CTRoadsideProvider *)self bizId];
    v13 = [v7 bizId];
    if (v12 == v13
      || ([(CTRoadsideProvider *)self bizId],
          v4 = objc_claimAutoreleasedReturnValue(),
          [v7 bizId],
          v5 = objc_claimAutoreleasedReturnValue(),
          [v4 isEqual:v5]))
    {
      int v14 = [(CTRoadsideProvider *)self supportsPayPerUse];
      if (v14 == [v7 supportsPayPerUse]
        && (int v15 = -[CTRoadsideProvider isActive](self, "isActive"), v15 == [v7 isActive])
        && (int v16 = [(CTRoadsideProvider *)self isCarrierProvider],
            v16 == [v7 isCarrierProvider]))
      {
        v22 = [(CTRoadsideProvider *)self associatedPhoneNumbers];
        v21 = [v7 associatedPhoneNumbers];
        if (v22 == v21)
        {

          char v11 = 1;
          char v17 = 1;
        }
        else
        {
          v20 = [(CTRoadsideProvider *)self associatedPhoneNumbers];
          v19 = [v7 associatedPhoneNumbers];
          char v11 = [v20 isEqual:v19];

          char v17 = v11;
        }
      }
      else
      {
        char v11 = 0;
        char v17 = 0;
      }
      if (v12 == v13)
      {

        char v11 = v17;
LABEL_16:
        if (v9 == v10)
        {
LABEL_18:

          goto LABEL_19;
        }
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
      char v11 = 0;
    }

    goto LABEL_16;
  }
  char v11 = 0;
LABEL_19:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTRoadsideProvider *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(CTRoadsideProvider *)self isEqualToProvider:v4];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setProviderId:", -[CTRoadsideProvider providerId](self, "providerId"));
  v6 = [(CTRoadsideProvider *)self providerName];
  id v7 = (void *)[v6 copyWithZone:a3];
  [v5 setProviderName:v7];

  int64_t v8 = [(CTRoadsideProvider *)self bizId];
  v9 = (void *)[v8 copyWithZone:a3];
  [v5 setBizId:v9];

  objc_msgSend(v5, "setSupportsPayPerUse:", -[CTRoadsideProvider supportsPayPerUse](self, "supportsPayPerUse"));
  objc_msgSend(v5, "setIsActive:", -[CTRoadsideProvider isActive](self, "isActive"));
  objc_msgSend(v5, "setIsCarrierProvider:", -[CTRoadsideProvider isCarrierProvider](self, "isCarrierProvider"));
  v10 = [(CTRoadsideProvider *)self associatedPhoneNumbers];
  char v11 = (void *)[v10 copyWithZone:a3];
  [v5 setAssociatedPhoneNumbers:v11];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  objc_msgSend(v7, "encodeInteger:forKey:", -[CTRoadsideProvider providerId](self, "providerId"), @"providerId");
  v4 = [(CTRoadsideProvider *)self providerName];
  [v7 encodeObject:v4 forKey:@"providerName"];

  BOOL v5 = [(CTRoadsideProvider *)self bizId];
  [v7 encodeObject:v5 forKey:@"bizId"];

  objc_msgSend(v7, "encodeBool:forKey:", -[CTRoadsideProvider supportsPayPerUse](self, "supportsPayPerUse"), @"supportsPayPerUse");
  objc_msgSend(v7, "encodeBool:forKey:", -[CTRoadsideProvider isActive](self, "isActive"), @"isActive");
  objc_msgSend(v7, "encodeBool:forKey:", -[CTRoadsideProvider isCarrierProvider](self, "isCarrierProvider"), @"isCarrierProvider");
  v6 = [(CTRoadsideProvider *)self associatedPhoneNumbers];
  [v7 encodeObject:v6 forKey:@"associatedPhoneNumbers"];
}

- (CTRoadsideProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CTRoadsideProvider;
  BOOL v5 = [(CTRoadsideProvider *)&v16 init];
  if (v5)
  {
    v5->_providerId = [v4 decodeIntegerForKey:@"providerId"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"providerName"];
    providerName = v5->_providerName;
    v5->_providerName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bizId"];
    bizId = v5->_bizId;
    v5->_bizId = (NSString *)v8;

    v5->_supportsPayPerUse = [v4 decodeBoolForKey:@"supportsPayPerUse"];
    v5->_isActive = [v4 decodeBoolForKey:@"isActive"];
    v5->_isCarrierProvider = [v4 decodeBoolForKey:@"isCarrierProvider"];
    v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"associatedPhoneNumbers"];
    associatedPhoneNumbers = v5->_associatedPhoneNumbers;
    v5->_associatedPhoneNumbers = (NSArray *)v13;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)providerId
{
  return self->_providerId;
}

- (void)setProviderId:(int64_t)a3
{
  self->_providerId = a3;
}

- (NSString)providerName
{
  return self->_providerName;
}

- (void)setProviderName:(id)a3
{
}

- (NSString)bizId
{
  return self->_bizId;
}

- (void)setBizId:(id)a3
{
}

- (BOOL)supportsPayPerUse
{
  return self->_supportsPayPerUse;
}

- (void)setSupportsPayPerUse:(BOOL)a3
{
  self->_supportsPayPerUse = a3;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (BOOL)isCarrierProvider
{
  return self->_isCarrierProvider;
}

- (void)setIsCarrierProvider:(BOOL)a3
{
  self->_isCarrierProvider = a3;
}

- (NSArray)associatedPhoneNumbers
{
  return self->_associatedPhoneNumbers;
}

- (void)setAssociatedPhoneNumbers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedPhoneNumbers, 0);
  objc_storeStrong((id *)&self->_bizId, 0);

  objc_storeStrong((id *)&self->_providerName, 0);
}

@end