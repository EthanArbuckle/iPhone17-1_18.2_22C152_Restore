@interface AKSRPAuthorizationContextHelper
- (AKAuthorizationContext)authContext;
- (AKSRPAuthorizationContextHelper)initWithContext:(id)a3;
- (void)authenticationParametersWithCompletion:(id)a3;
- (void)setAuthContext:(id)a3;
@end

@implementation AKSRPAuthorizationContextHelper

- (AKSRPAuthorizationContextHelper)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKSRPAuthorizationContextHelper;
  v6 = [(AKSRPContextHelper *)&v9 initWithContext:v5];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_authContext, a3);
  }

  return v7;
}

- (void)authenticationParametersWithCompletion:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000AA2C0;
  v5[3] = &unk_100227DB0;
  v6 = self;
  id v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)AKSRPAuthorizationContextHelper;
  id v3 = v7;
  [(AKSRPContextHelper *)&v4 authenticationParametersWithCompletion:v5];
}

- (AKAuthorizationContext)authContext
{
  return self->_authContext;
}

- (void)setAuthContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end