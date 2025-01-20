@interface AMSFraudReportOptions
+ (BOOL)isValidAuthenticationTokenType:(unint64_t)a3;
+ (BOOL)supportsSecureCoding;
- (ACAccount)account;
- (AMSFraudReportOptions)initWithCoder:(id)a3;
- (AMSFraudReportOptions)initWithTransactionIdentifier:(id)a3 nameSpace:(id)a4 fsrData:(id)a5;
- (BOOL)shouldIncludeODIAssessment;
- (NSString)fsrData;
- (NSString)keyIdentifier;
- (NSString)nameSpace;
- (NSString)transactionIdentifier;
- (unint64_t)authenticationTokenType;
- (void)encodeWithCoder:(id)a3;
- (void)setAccount:(id)a3;
- (void)setAuthenticationTokenType:(unint64_t)a3;
- (void)setKeyIdentifier:(id)a3;
- (void)setShouldIncludeODIAssessment:(BOOL)a3;
@end

@implementation AMSFraudReportOptions

- (AMSFraudReportOptions)initWithTransactionIdentifier:(id)a3 nameSpace:(id)a4 fsrData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8 || !v9 || (v11 = v10) == 0)
  {
    id v20 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], @"transactionIdentifier, namespace and fsrData must all be non-nil", 0 reason userInfo];
    objc_exception_throw(v20);
  }
  v21.receiver = self;
  v21.super_class = (Class)AMSFraudReportOptions;
  v12 = [(AMSFraudReportOptions *)&v21 init];
  if (v12)
  {
    uint64_t v13 = [v8 copy];
    transactionIdentifier = v12->_transactionIdentifier;
    v12->_transactionIdentifier = (NSString *)v13;

    uint64_t v15 = [v9 copy];
    nameSpace = v12->_nameSpace;
    v12->_nameSpace = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    fsrData = v12->_fsrData;
    v12->_fsrData = (NSString *)v17;

    v12->_authenticationTokenType = _os_feature_enabled_impl();
    v12->_shouldIncludeODIAssessment = 0;
  }

  return v12;
}

- (void)setAuthenticationTokenType:(unint64_t)a3
{
  if (!+[AMSFraudReportOptions isValidAuthenticationTokenType:](AMSFraudReportOptions, "isValidAuthenticationTokenType:"))
  {
    v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3C8];
    v7 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown authentication token type %lu specified", a3);
    id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

    objc_exception_throw(v8);
  }
  self->_authenticationTokenType = a3;
}

+ (BOOL)isValidAuthenticationTokenType:(unint64_t)a3
{
  return a3 < 2;
}

- (AMSFraudReportOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"account"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionIdentifier"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"namespace"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fsrData"];
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyIdentifier"];
  uint64_t v10 = [v4 decodeIntegerForKey:@"authenticationTokenType"];
  char v11 = [v4 decodeBoolForKey:@"shouldIncludeODIAssessment"];

  v12 = 0;
  if (v6 && v7 && v8)
  {
    if (+[AMSFraudReportOptions isValidAuthenticationTokenType:v10])
    {
      uint64_t v13 = [(AMSFraudReportOptions *)self initWithTransactionIdentifier:v6 nameSpace:v7 fsrData:v8];
      v14 = v13;
      if (v13)
      {
        objc_storeStrong((id *)&v13->_account, v5);
        objc_storeStrong((id *)&v14->_keyIdentifier, v9);
        v14->_authenticationTokenType = v10;
        v14->_shouldIncludeODIAssessment = v11;
      }
      self = v14;
      v12 = self;
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  account = self->_account;
  id v5 = a3;
  [v5 encodeObject:account forKey:@"account"];
  [v5 encodeObject:self->_transactionIdentifier forKey:@"transactionIdentifier"];
  [v5 encodeObject:self->_nameSpace forKey:@"namespace"];
  [v5 encodeObject:self->_fsrData forKey:@"fsrData"];
  [v5 encodeObject:self->_keyIdentifier forKey:@"keyIdentifier"];
  [v5 encodeInteger:self->_authenticationTokenType forKey:@"authenticationTokenType"];
  [v5 encodeBool:self->_shouldIncludeODIAssessment forKey:@"shouldIncludeODIAssessment"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (NSString)nameSpace
{
  return self->_nameSpace;
}

- (NSString)fsrData
{
  return self->_fsrData;
}

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (void)setKeyIdentifier:(id)a3
{
}

- (BOOL)shouldIncludeODIAssessment
{
  return self->_shouldIncludeODIAssessment;
}

- (void)setShouldIncludeODIAssessment:(BOOL)a3
{
  self->_shouldIncludeODIAssessment = a3;
}

- (unint64_t)authenticationTokenType
{
  return self->_authenticationTokenType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_fsrData, 0);
  objc_storeStrong((id *)&self->_nameSpace, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end