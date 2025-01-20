@interface AKBasicLoginActions
- (id)ak_cancelAction;
- (id)authenticateAction;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createIDAction;
- (id)forgotIDAction;
- (id)forgotPasswordAction;
- (id)useIDAction;
- (void)setAk_cancelAction:(id)a3;
- (void)setAuthenticateAction:(id)a3;
- (void)setCreateIDAction:(id)a3;
- (void)setForgotIDAction:(id)a3;
- (void)setForgotPasswordAction:(id)a3;
- (void)setUseIDAction:(id)a3;
@end

@implementation AKBasicLoginActions

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [self->_authenticateAction copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [self->_ak_cancelAction copy];
  v8 = (void *)v4[2];
  v4[2] = v7;

  uint64_t v9 = [self->_createIDAction copy];
  v10 = (void *)v4[3];
  v4[3] = v9;

  uint64_t v11 = [self->_useIDAction copy];
  v12 = (void *)v4[4];
  v4[4] = v11;

  uint64_t v13 = [self->_forgotPasswordAction copy];
  v14 = (void *)v4[6];
  v4[6] = v13;

  return v4;
}

- (id)authenticateAction
{
  return self->_authenticateAction;
}

- (void)setAuthenticateAction:(id)a3
{
}

- (id)ak_cancelAction
{
  return self->_ak_cancelAction;
}

- (void)setAk_cancelAction:(id)a3
{
}

- (id)createIDAction
{
  return self->_createIDAction;
}

- (void)setCreateIDAction:(id)a3
{
}

- (id)useIDAction
{
  return self->_useIDAction;
}

- (void)setUseIDAction:(id)a3
{
}

- (id)forgotIDAction
{
  return self->_forgotIDAction;
}

- (void)setForgotIDAction:(id)a3
{
}

- (id)forgotPasswordAction
{
  return self->_forgotPasswordAction;
}

- (void)setForgotPasswordAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_forgotPasswordAction, 0);
  objc_storeStrong(&self->_forgotIDAction, 0);
  objc_storeStrong(&self->_useIDAction, 0);
  objc_storeStrong(&self->_createIDAction, 0);
  objc_storeStrong(&self->_ak_cancelAction, 0);

  objc_storeStrong(&self->_authenticateAction, 0);
}

@end