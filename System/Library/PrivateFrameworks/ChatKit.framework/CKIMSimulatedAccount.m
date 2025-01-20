@interface CKIMSimulatedAccount
- (IMHandle)loginHandle;
- (void)setLoginHandle:(id)a3;
@end

@implementation CKIMSimulatedAccount

- (void)setLoginHandle:(id)a3
{
  objc_storeStrong((id *)&self->_loginHandle, a3);
  id v5 = a3;
  id v6 = [v5 ID];

  [(CKIMSimulatedAccount *)self setLogin:v6];
}

- (IMHandle)loginHandle
{
  return self->_loginHandle;
}

- (void).cxx_destruct
{
}

@end