@interface AMSPaymentSheetResult
+ (BOOL)supportsSecureCoding;
- (AMSBiometricsSignatureResult)signatureResult;
- (AMSPaymentSheetResult)initWithCoder:(id)a3;
- (NSString)delegateAuthenticateToken;
- (NSString)passwordEquivalentToken;
- (NSString)paymentToken;
- (void)encodeWithCoder:(id)a3;
- (void)setDelegateAuthenticateToken:(id)a3;
- (void)setPasswordEquivalentToken:(id)a3;
- (void)setPaymentToken:(id)a3;
- (void)setSignatureResult:(id)a3;
@end

@implementation AMSPaymentSheetResult

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AMSPaymentSheetResult *)self delegateAuthenticateToken];
  [v4 encodeObject:v5 forKey:@"kDelegateAuthenticateToken"];

  v6 = [(AMSPaymentSheetResult *)self passwordEquivalentToken];
  [v4 encodeObject:v6 forKey:@"kPasswordEquivalentToken"];

  v7 = [(AMSPaymentSheetResult *)self paymentToken];
  [v4 encodeObject:v7 forKey:@"kPaymentToken"];

  id v8 = [(AMSPaymentSheetResult *)self signatureResult];
  [v4 encodeObject:v8 forKey:@"kSignatureResult"];
}

- (AMSPaymentSheetResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AMSPaymentSheetResult;
  v5 = [(AMSPaymentSheetResult *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kDelegateAuthenticateToken"];
    delegateAuthenticateToken = v5->_delegateAuthenticateToken;
    v5->_delegateAuthenticateToken = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kPasswordEquivalentToken"];
    passwordEquivalentToken = v5->_passwordEquivalentToken;
    v5->_passwordEquivalentToken = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kPaymentToken"];
    paymentToken = v5->_paymentToken;
    v5->_paymentToken = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSignatureResult"];
    signatureResult = v5->_signatureResult;
    v5->_signatureResult = (AMSBiometricsSignatureResult *)v12;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)delegateAuthenticateToken
{
  return self->_delegateAuthenticateToken;
}

- (void)setDelegateAuthenticateToken:(id)a3
{
}

- (NSString)passwordEquivalentToken
{
  return self->_passwordEquivalentToken;
}

- (void)setPasswordEquivalentToken:(id)a3
{
}

- (NSString)paymentToken
{
  return self->_paymentToken;
}

- (void)setPaymentToken:(id)a3
{
}

- (AMSBiometricsSignatureResult)signatureResult
{
  return self->_signatureResult;
}

- (void)setSignatureResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatureResult, 0);
  objc_storeStrong((id *)&self->_paymentToken, 0);
  objc_storeStrong((id *)&self->_passwordEquivalentToken, 0);
  objc_storeStrong((id *)&self->_delegateAuthenticateToken, 0);
}

@end