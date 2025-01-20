@interface HKFHIRServerAuthenticationInformation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKFHIRServerAuthenticationInformation)initWithClientID:(id)a3 clientSecret:(id)a4 PKCEAlgorithm:(int64_t)a5;
- (HKFHIRServerAuthenticationInformation)initWithCoder:(id)a3;
- (NSString)clientID;
- (NSString)clientSecret;
- (id)description;
- (int64_t)PKCEAlgorithm;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKFHIRServerAuthenticationInformation

- (HKFHIRServerAuthenticationInformation)initWithClientID:(id)a3 clientSecret:(id)a4 PKCEAlgorithm:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HKFHIRServerAuthenticationInformation;
  v10 = [(HKFHIRServerAuthenticationInformation *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    clientID = v10->_clientID;
    v10->_clientID = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    clientSecret = v10->_clientSecret;
    v10->_clientSecret = (NSString *)v13;

    v10->_PKCEAlgorithm = a5;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HKFHIRServerAuthenticationInformation *)a3;
  v6 = v5;
  if (self != v5)
  {
    v7 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v13 = 0;
LABEL_21:

      goto LABEL_22;
    }
    clientID = self->_clientID;
    id v9 = [(HKFHIRServerAuthenticationInformation *)v7 clientID];
    if (clientID != v9)
    {
      uint64_t v10 = [(HKFHIRServerAuthenticationInformation *)v7 clientID];
      if (!v10)
      {
        BOOL v13 = 0;
        goto LABEL_20;
      }
      v3 = (void *)v10;
      uint64_t v11 = self->_clientID;
      v12 = [(HKFHIRServerAuthenticationInformation *)v7 clientID];
      if (![(NSString *)v11 isEqualToString:v12])
      {
        BOOL v13 = 0;
LABEL_19:

        goto LABEL_20;
      }
      v24 = v12;
    }
    clientSecret = self->_clientSecret;
    uint64_t v15 = [(HKFHIRServerAuthenticationInformation *)v7 clientSecret];
    if (clientSecret == (NSString *)v15)
    {
      int64_t PKCEAlgorithm = self->_PKCEAlgorithm;
      BOOL v13 = PKCEAlgorithm == [(HKFHIRServerAuthenticationInformation *)v7 PKCEAlgorithm];
    }
    else
    {
      objc_super v16 = (void *)v15;
      uint64_t v17 = [(HKFHIRServerAuthenticationInformation *)v7 clientSecret];
      if (v17)
      {
        v18 = (void *)v17;
        v19 = self->_clientSecret;
        v20 = [(HKFHIRServerAuthenticationInformation *)v7 clientSecret];
        if ([(NSString *)v19 isEqualToString:v20])
        {
          int64_t v21 = self->_PKCEAlgorithm;
          BOOL v13 = v21 == [(HKFHIRServerAuthenticationInformation *)v7 PKCEAlgorithm];

          goto LABEL_18;
        }
      }
      BOOL v13 = 0;
    }
LABEL_18:
    v12 = v24;
    if (clientID != v9) {
      goto LABEL_19;
    }
LABEL_20:

    goto LABEL_21;
  }
  BOOL v13 = 1;
LABEL_22:

  return v13;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  clientID = self->_clientID;
  uint64_t v7 = HKStringFromBool();
  id v8 = (void *)v7;
  unint64_t v9 = self->_PKCEAlgorithm - 1;
  if (v9 > 2) {
    uint64_t v10 = @"none";
  }
  else {
    uint64_t v10 = off_2645EEDE8[v9];
  }
  uint64_t v11 = [v3 stringWithFormat:@"<%@ %p, client ID: %@, has client secret: %@, PKCE: %@>", v5, self, clientID, v7, v10];

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  clientID = self->_clientID;
  id v5 = a3;
  [v5 encodeObject:clientID forKey:@"clientID"];
  [v5 encodeObject:self->_clientSecret forKey:@"clientSecret"];
  [v5 encodeInteger:self->_PKCEAlgorithm forKey:@"PKCEAlgorithm"];
}

- (HKFHIRServerAuthenticationInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientID"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientSecret"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"PKCEAlgorithm"];

  id v8 = [(HKFHIRServerAuthenticationInformation *)self initWithClientID:v5 clientSecret:v6 PKCEAlgorithm:v7];
  return v8;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (NSString)clientSecret
{
  return self->_clientSecret;
}

- (int64_t)PKCEAlgorithm
{
  return self->_PKCEAlgorithm;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientSecret, 0);

  objc_storeStrong((id *)&self->_clientID, 0);
}

@end