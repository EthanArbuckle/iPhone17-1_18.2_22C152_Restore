@interface WFOAuth2Credential
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExpired;
- (BOOL)isValid;
- (NSDate)expirationDate;
- (NSDictionary)responseObject;
- (NSString)accessToken;
- (NSString)refreshToken;
- (NSString)tokenType;
- (WFOAuth2Credential)initWithCoder:(id)a3;
- (WFOAuth2Credential)initWithResponseObject:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFOAuth2Credential

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseObject, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_refreshToken, 0);
  objc_storeStrong((id *)&self->_accessToken, 0);
  objc_storeStrong((id *)&self->_tokenType, 0);
}

- (NSDictionary)responseObject
{
  return self->_responseObject;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSString)refreshToken
{
  return self->_refreshToken;
}

- (NSString)accessToken
{
  return self->_accessToken;
}

- (void)encodeWithCoder:(id)a3
{
  accessToken = self->_accessToken;
  id v5 = a3;
  [v5 encodeObject:accessToken forKey:@"accessToken"];
  [v5 encodeObject:self->_tokenType forKey:@"tokenType"];
  [v5 encodeObject:self->_refreshToken forKey:@"refreshToken"];
  [v5 encodeObject:self->_expirationDate forKey:@"expirationDate"];
}

- (WFOAuth2Credential)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WFOAuth2Credential;
  id v5 = [(WFOAuth2Credential *)&v16 init];
  if (v5
    && ([v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessToken"],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        accessToken = v5->_accessToken,
        v5->_accessToken = (NSString *)v6,
        accessToken,
        [(NSString *)v5->_accessToken length]))
  {
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tokenType"];
    tokenType = v5->_tokenType;
    v5->_tokenType = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"refreshToken"];
    refreshToken = v5->_refreshToken;
    v5->_refreshToken = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v12;

    v14 = v5;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_accessToken hash];
  NSUInteger v4 = [(NSString *)self->_refreshToken hash] ^ v3;
  return v4 ^ [(NSDate *)self->_expirationDate hash];
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (WFOAuth2Credential *)a3;
  if (self == v5)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      accessToken = self->_accessToken;
      v7 = [(WFOAuth2Credential *)v5 accessToken];
      if (![(NSString *)accessToken isEqualToString:v7])
      {
        char v10 = 0;
LABEL_19:

        goto LABEL_20;
      }
      uint64_t v8 = [(WFOAuth2Credential *)self tokenType];
      v9 = [(WFOAuth2Credential *)v5 tokenType];
      if ([v8 compare:v9 options:1])
      {
        char v10 = 0;
LABEL_18:

        goto LABEL_19;
      }
      refreshToken = self->_refreshToken;
      uint64_t v12 = [(WFOAuth2Credential *)v5 refreshToken];
      if (refreshToken == v12
        || (v13 = self->_refreshToken,
            [(WFOAuth2Credential *)v5 refreshToken],
            NSUInteger v3 = objc_claimAutoreleasedReturnValue(),
            [(NSString *)v13 isEqualToString:v3]))
      {
        expirationDate = self->_expirationDate;
        uint64_t v15 = [(WFOAuth2Credential *)v5 expirationDate];
        if (expirationDate == (NSDate *)v15)
        {

          char v10 = 1;
        }
        else
        {
          objc_super v16 = (void *)v15;
          v17 = self->_expirationDate;
          v18 = [(WFOAuth2Credential *)v5 expirationDate];
          char v10 = [(NSDate *)v17 isEqualToDate:v18];
        }
        if (refreshToken == v12) {
          goto LABEL_17;
        }
      }
      else
      {
        char v10 = 0;
      }

LABEL_17:
      goto LABEL_18;
    }
    char v10 = 0;
  }
LABEL_20:

  return v10;
}

- (BOOL)isExpired
{
  v2 = [(WFOAuth2Credential *)self expirationDate];
  [v2 timeIntervalSinceNow];
  BOOL v4 = v3 < 0.0;

  return v4;
}

- (BOOL)isValid
{
  double v3 = [(WFOAuth2Credential *)self refreshToken];
  if (v3)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    id v5 = [(WFOAuth2Credential *)self accessToken];
    if (v5) {
      BOOL v4 = ![(WFOAuth2Credential *)self isExpired];
    }
    else {
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

- (NSString)tokenType
{
  if (self->_tokenType) {
    return self->_tokenType;
  }
  else {
    return (NSString *)@"bearer";
  }
}

- (WFOAuth2Credential)initWithResponseObject:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)WFOAuth2Credential;
  id v5 = [(WFOAuth2Credential *)&v35 init];
  if (!v5) {
    goto LABEL_17;
  }
  uint64_t v6 = [v4 copy];
  responseObject = v5->_responseObject;
  v5->_responseObject = (NSDictionary *)v6;

  uint64_t v8 = [v4 objectForKeyedSubscript:@"access_token"];
  objc_opt_class();
  id v9 = v8;
  id v10 = (objc_opt_isKindOfClass() & 1) != 0 ? v9 : 0;
  id v11 = v10;

  uint64_t v12 = [v11 copy];
  accessToken = v5->_accessToken;
  v5->_accessToken = (NSString *)v12;

  if ([(NSString *)v5->_accessToken length])
  {
    v14 = [v4 objectForKeyedSubscript:@"token_type"];
    objc_opt_class();
    id v15 = v14;
    if (objc_opt_isKindOfClass()) {
      objc_super v16 = v15;
    }
    else {
      objc_super v16 = 0;
    }
    id v17 = v16;

    uint64_t v18 = [v17 copy];
    tokenType = v5->_tokenType;
    v5->_tokenType = (NSString *)v18;

    v20 = [v4 objectForKeyedSubscript:@"refresh_token"];
    objc_opt_class();
    id v21 = v20;
    if (objc_opt_isKindOfClass()) {
      v22 = v21;
    }
    else {
      v22 = 0;
    }
    id v23 = v22;

    uint64_t v24 = [v23 copy];
    refreshToken = v5->_refreshToken;
    v5->_refreshToken = (NSString *)v24;

    v26 = [v4 objectForKeyedSubscript:@"expires_in"];
    objc_opt_class();
    id v27 = v26;
    if (objc_opt_isKindOfClass()) {
      v28 = v27;
    }
    else {
      v28 = 0;
    }
    id v29 = v28;

    if (v29)
    {
      v30 = (void *)MEMORY[0x263EFF910];
      [v29 doubleValue];
      uint64_t v31 = objc_msgSend(v30, "dateWithTimeIntervalSinceNow:");
      expirationDate = v5->_expirationDate;
      v5->_expirationDate = (NSDate *)v31;
    }
    else
    {
      expirationDate = v5->_expirationDate;
      v5->_expirationDate = 0;
    }

    v33 = v5;
  }
  else
  {
LABEL_17:
    v33 = 0;
  }

  return v33;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end