@interface IDSTemporaryPhoneUserRemoveTransaction
- (IDSTemporaryPhoneUser)user;
- (IDSTemporaryPhoneUserRemoveTransaction)initWithUser:(id)a3 alertType:(int64_t)a4;
- (NSString)description;
- (int64_t)alertType;
- (int64_t)type;
- (void)setUser:(id)a3;
@end

@implementation IDSTemporaryPhoneUserRemoveTransaction

- (IDSTemporaryPhoneUserRemoveTransaction)initWithUser:(id)a3 alertType:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IDSTemporaryPhoneUserRemoveTransaction;
  v8 = [(IDSTemporaryPhoneUserRemoveTransaction *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_user, a3);
    v9->_alertType = a4;
  }

  return v9;
}

- (int64_t)type
{
  return 1;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(IDSTemporaryPhoneUserRemoveTransaction *)self user];
  v5 = +[NSString stringWithFormat:@"<%@:%p user: %@>", v3, self, v4];

  return (NSString *)v5;
}

- (IDSTemporaryPhoneUser)user
{
  return self->_user;
}

- (void)setUser:(id)a3
{
}

- (int64_t)alertType
{
  return self->_alertType;
}

- (void).cxx_destruct
{
}

@end