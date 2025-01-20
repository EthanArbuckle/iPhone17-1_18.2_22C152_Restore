@interface AKInheritanceAccessKey
+ (BOOL)supportsSecureCoding;
- (AKInheritanceAccessKey)initWithBeneficiairyIdentifier:(id)a3;
- (AKInheritanceAccessKey)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSData)claimTokenData;
- (NSData)wrappedKeyData;
- (NSData)wrappingKeyData;
- (NSString)claimTokenString;
- (NSString)wrappedKeyString;
- (NSString)wrappingKeyString;
- (NSUUID)beneficiaryID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setClaimTokenData:(id)a3;
- (void)setClaimTokenString:(id)a3;
- (void)setWrappedKeyData:(id)a3;
- (void)setWrappedKeyString:(id)a3;
- (void)setWrappingKeyData:(id)a3;
- (void)setWrappingKeyString:(id)a3;
@end

@implementation AKInheritanceAccessKey

- (AKInheritanceAccessKey)initWithBeneficiairyIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKInheritanceAccessKey;
  v6 = [(AKInheritanceAccessKey *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_beneficiaryID, a3);
  }

  return v7;
}

- (AKInheritanceAccessKey)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AKInheritanceAccessKey *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_beneficiaryID"];
    beneficiaryID = v5->_beneficiaryID;
    v5->_beneficiaryID = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_wrappingKeyData"];
    wrappingKeyData = v5->_wrappingKeyData;
    v5->_wrappingKeyData = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_wrappingKeyString"];
    wrappingKeyString = v5->_wrappingKeyString;
    v5->_wrappingKeyString = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_wrappedKeyData"];
    wrappedKeyData = v5->_wrappedKeyData;
    v5->_wrappedKeyData = (NSData *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_wrappedKeyString"];
    wrappedKeyString = v5->_wrappedKeyString;
    v5->_wrappedKeyString = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_claimTokenData"];
    claimTokenData = v5->_claimTokenData;
    v5->_claimTokenData = (NSData *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_claimTokenString"];
    claimTokenString = v5->_claimTokenString;
    v5->_claimTokenString = (NSString *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  beneficiaryID = self->_beneficiaryID;
  id v5 = a3;
  [v5 encodeObject:beneficiaryID forKey:@"_beneficiaryID"];
  [v5 encodeObject:self->_wrappingKeyData forKey:@"_wrappingKeyData"];
  [v5 encodeObject:self->_wrappingKeyString forKey:@"_wrappingKeyString"];
  [v5 encodeObject:self->_wrappedKeyData forKey:@"_wrappedKeyData"];
  [v5 encodeObject:self->_wrappedKeyString forKey:@"_wrappedKeyString"];
  [v5 encodeObject:self->_claimTokenData forKey:@"_claimTokenData"];
  [v5 encodeObject:self->_claimTokenString forKey:@"_claimTokenString"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSUUID *)self->_beneficiaryID copy];
  uint64_t v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(NSData *)self->_wrappingKeyData copy];
  uint64_t v8 = (void *)v4[2];
  v4[2] = v7;

  uint64_t v9 = [(NSString *)self->_wrappingKeyString copy];
  uint64_t v10 = (void *)v4[3];
  v4[3] = v9;

  uint64_t v11 = [(NSData *)self->_wrappedKeyData copy];
  uint64_t v12 = (void *)v4[4];
  v4[4] = v11;

  uint64_t v13 = [(NSString *)self->_wrappedKeyString copy];
  uint64_t v14 = (void *)v4[5];
  v4[5] = v13;

  uint64_t v15 = [(NSData *)self->_claimTokenData copy];
  uint64_t v16 = (void *)v4[6];
  v4[6] = v15;

  uint64_t v17 = [(NSString *)self->_claimTokenString copy];
  uint64_t v18 = (void *)v4[7];
  v4[7] = v17;

  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AKInheritanceAccessKey;
  id v4 = [(AKInheritanceAccessKey *)&v8 description];
  uint64_t v5 = [(AKInheritanceAccessKey *)self beneficiaryID];
  uint64_t v6 = [v3 stringWithFormat:@"%@\nAccess code for beneficiary %@", v4, v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    beneficiaryID = self->_beneficiaryID;
    uint64_t v7 = [v5 beneficiaryID];
    if ([(NSUUID *)beneficiaryID isEqual:v7])
    {
      claimTokenData = self->_claimTokenData;
      uint64_t v9 = [v5 claimTokenData];
      if ([(NSData *)claimTokenData isEqualToData:v9])
      {
        claimTokenString = self->_claimTokenString;
        uint64_t v11 = [v5 claimTokenString];
        if ([(NSString *)claimTokenString isEqualToString:v11])
        {
          wrappedKeyData = self->_wrappedKeyData;
          uint64_t v13 = [v5 wrappedKeyData];
          if ([(NSData *)wrappedKeyData isEqualToData:v13])
          {
            wrappedKeyString = self->_wrappedKeyString;
            uint64_t v15 = [v5 wrappedKeyString];
            if ([(NSString *)wrappedKeyString isEqualToString:v15])
            {
              wrappingKeyData = self->_wrappingKeyData;
              uint64_t v17 = [v5 wrappingKeyData];
              if ([(NSData *)wrappingKeyData isEqualToData:v17])
              {
                wrappingKeyString = self->_wrappingKeyString;
                v19 = [v5 wrappingKeyString];
                BOOL v20 = [(NSString *)wrappingKeyString isEqualToString:v19];
              }
              else
              {
                BOOL v20 = 0;
              }
            }
            else
            {
              BOOL v20 = 0;
            }
          }
          else
          {
            BOOL v20 = 0;
          }
        }
        else
        {
          BOOL v20 = 0;
        }
      }
      else
      {
        BOOL v20 = 0;
      }
    }
    else
    {
      BOOL v20 = 0;
    }
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (NSUUID)beneficiaryID
{
  return self->_beneficiaryID;
}

- (NSData)wrappingKeyData
{
  return self->_wrappingKeyData;
}

- (void)setWrappingKeyData:(id)a3
{
}

- (NSString)wrappingKeyString
{
  return self->_wrappingKeyString;
}

- (void)setWrappingKeyString:(id)a3
{
}

- (NSData)wrappedKeyData
{
  return self->_wrappedKeyData;
}

- (void)setWrappedKeyData:(id)a3
{
}

- (NSString)wrappedKeyString
{
  return self->_wrappedKeyString;
}

- (void)setWrappedKeyString:(id)a3
{
}

- (NSData)claimTokenData
{
  return self->_claimTokenData;
}

- (void)setClaimTokenData:(id)a3
{
}

- (NSString)claimTokenString
{
  return self->_claimTokenString;
}

- (void)setClaimTokenString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_claimTokenString, 0);
  objc_storeStrong((id *)&self->_claimTokenData, 0);
  objc_storeStrong((id *)&self->_wrappedKeyString, 0);
  objc_storeStrong((id *)&self->_wrappedKeyData, 0);
  objc_storeStrong((id *)&self->_wrappingKeyString, 0);
  objc_storeStrong((id *)&self->_wrappingKeyData, 0);

  objc_storeStrong((id *)&self->_beneficiaryID, 0);
}

@end