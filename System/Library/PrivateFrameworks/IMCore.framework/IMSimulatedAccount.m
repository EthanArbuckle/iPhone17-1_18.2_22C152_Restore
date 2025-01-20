@interface IMSimulatedAccount
- (BOOL)isConnected;
- (BOOL)isOperational;
- (BOOL)supportsRegistration;
- (IMHandle)loginHandle;
- (void)setLoginHandle:(id)a3;
@end

@implementation IMSimulatedAccount

- (void)setLoginHandle:(id)a3
{
  v11 = (IMHandle *)a3;
  if (self->_loginHandle != v11)
  {
    objc_storeStrong((id *)&self->_loginHandle, a3);
    v8 = objc_msgSend_ID(v11, v5, v6, v7);
    objc_msgSend_setLogin_(self, v9, (uint64_t)v8, v10);
  }
}

- (BOOL)supportsRegistration
{
  return 1;
}

- (BOOL)isOperational
{
  return 1;
}

- (BOOL)isConnected
{
  return 1;
}

- (IMHandle)loginHandle
{
  return self->_loginHandle;
}

- (void).cxx_destruct
{
}

@end