@interface IDSTemporaryPhoneUserAddTransaction
- (IDSTemporaryPhoneUser)user;
- (IDSTemporaryPhoneUserAddTransaction)initWithUser:(id)a3 credential:(id)a4;
- (IDSTemporaryPhoneUserCredential)credential;
- (NSString)description;
- (int64_t)type;
- (void)setCredential:(id)a3;
- (void)setUser:(id)a3;
@end

@implementation IDSTemporaryPhoneUserAddTransaction

- (IDSTemporaryPhoneUserAddTransaction)initWithUser:(id)a3 credential:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSTemporaryPhoneUserAddTransaction;
  v9 = [(IDSTemporaryPhoneUserAddTransaction *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_user, a3);
    objc_storeStrong((id *)&v10->_credential, a4);
  }

  return v10;
}

- (int64_t)type
{
  return 0;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(IDSTemporaryPhoneUserAddTransaction *)self user];
  v5 = [(IDSTemporaryPhoneUserAddTransaction *)self credential];
  CFStringRef v6 = @"YES";
  if (!v5) {
    CFStringRef v6 = @"NO";
  }
  id v7 = +[NSString stringWithFormat:@"<%@:%p user: %@, credential: %@>", v3, self, v4, v6];

  return (NSString *)v7;
}

- (IDSTemporaryPhoneUser)user
{
  return self->_user;
}

- (void)setUser:(id)a3
{
}

- (IDSTemporaryPhoneUserCredential)credential
{
  return self->_credential;
}

- (void)setCredential:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credential, 0);

  objc_storeStrong((id *)&self->_user, 0);
}

@end