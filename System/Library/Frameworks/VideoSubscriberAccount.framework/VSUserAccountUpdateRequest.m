@interface VSUserAccountUpdateRequest
- (NSError)updateError;
- (VSUserAccount)updatedUserAccount;
- (VSUserAccount)userAccount;
- (VSUserAccountUpdateRequest)initWithUserAccount:(id)a3;
- (id)description;
- (void)setUpdateError:(id)a3;
- (void)setUpdatedUserAccount:(id)a3;
- (void)setUserAccount:(id)a3;
@end

@implementation VSUserAccountUpdateRequest

- (VSUserAccountUpdateRequest)initWithUserAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VSUserAccountUpdateRequest;
  v6 = [(VSUserAccountUpdateRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_userAccount, a3);
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(VSUserAccountUpdateRequest *)self userAccount];
  v7 = [(VSUserAccountUpdateRequest *)self updatedUserAccount];
  v8 = [(VSUserAccountUpdateRequest *)self updateError];
  objc_super v9 = [v3 stringWithFormat:@"<%@ %p %@=%@, %@=%@, %@=%@>", v5, self, @"userAccount", v6, @"updatedUserAccount", v7, @"updateError", v8];

  return v9;
}

- (VSUserAccount)userAccount
{
  return self->_userAccount;
}

- (void)setUserAccount:(id)a3
{
}

- (VSUserAccount)updatedUserAccount
{
  return self->_updatedUserAccount;
}

- (void)setUpdatedUserAccount:(id)a3
{
}

- (NSError)updateError
{
  return self->_updateError;
}

- (void)setUpdateError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateError, 0);
  objc_storeStrong((id *)&self->_updatedUserAccount, 0);

  objc_storeStrong((id *)&self->_userAccount, 0);
}

@end