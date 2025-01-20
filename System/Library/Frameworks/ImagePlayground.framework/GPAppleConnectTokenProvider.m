@interface GPAppleConnectTokenProvider
- (GPAppleConnectAuthenticating)authenticatingProtocol;
- (GPAppleConnectTokenProvider)initWithAuthenticatingProtocol:(id)a3;
- (NSString)token;
- (void)setAuthenticatingProtocol:(id)a3;
- (void)setupTokenWithCompletion:(id)a3;
@end

@implementation GPAppleConnectTokenProvider

- (GPAppleConnectTokenProvider)initWithAuthenticatingProtocol:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GPAppleConnectTokenProvider;
  v5 = [(GPAppleConnectTokenProvider *)&v9 init];
  if (v5)
  {
    v6 = [[_TtC15ImagePlayground33GPAppleConnectTokenProvider_Swift alloc] initWithAuthenticatingProtocol:v4];
    impl = v5->_impl;
    v5->_impl = v6;
  }
  return v5;
}

- (void)setupTokenWithCompletion:(id)a3
{
}

- (NSString)token
{
  return self->_token;
}

- (GPAppleConnectAuthenticating)authenticatingProtocol
{
  return self->_authenticatingProtocol;
}

- (void)setAuthenticatingProtocol:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticatingProtocol, 0);
  objc_storeStrong((id *)&self->_token, 0);

  objc_storeStrong((id *)&self->_impl, 0);
}

@end