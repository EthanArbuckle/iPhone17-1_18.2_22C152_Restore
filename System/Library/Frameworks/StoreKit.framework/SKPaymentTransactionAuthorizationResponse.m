@interface SKPaymentTransactionAuthorizationResponse
- (AKAuthorizationCredential)authorizationAppleIDCredential;
- (NSError)accountSignupError;
- (SKPaymentTransactionAuthorizationResponse)initWithAuthorizationCredential:(id)a3 error:(id)a4;
@end

@implementation SKPaymentTransactionAuthorizationResponse

- (SKPaymentTransactionAuthorizationResponse)initWithAuthorizationCredential:(id)a3 error:(id)a4
{
  unint64_t v7 = (unint64_t)a3;
  unint64_t v8 = (unint64_t)a4;
  if (v7 | v8)
  {
    v13.receiver = self;
    v13.super_class = (Class)SKPaymentTransactionAuthorizationResponse;
    v10 = [(SKPaymentTransactionAuthorizationResponse *)&v13 init];
    p_isa = (id *)&v10->super.isa;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_authorizationAppleIDCredential, a3);
      objc_storeStrong(p_isa + 2, a4);
    }
    self = p_isa;
    v9 = self;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SKPaymentTransactionAuthorizationResponse initWithAuthorizationCredential:error:]((uint64_t)self);
    }
    v9 = 0;
  }

  return v9;
}

- (AKAuthorizationCredential)authorizationAppleIDCredential
{
  return self->_authorizationAppleIDCredential;
}

- (NSError)accountSignupError
{
  return self->_accountSignupError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountSignupError, 0);

  objc_storeStrong((id *)&self->_authorizationAppleIDCredential, 0);
}

- (void)initWithAuthorizationCredential:(uint64_t)a1 error:.cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[%{public}@]: Auth credential and error are both nil", (uint8_t *)&v1, 0xCu);
}

@end