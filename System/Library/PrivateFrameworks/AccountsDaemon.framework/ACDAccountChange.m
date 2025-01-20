@interface ACDAccountChange
+ (id)changeWithChangeType:(int)a3 account:(id)a4 oldAccount:(id)a5;
- (ACAccount)account;
- (ACAccount)oldAccount;
- (ACDAccountChange)initWithChangeType:(int)a3 account:(id)a4 oldAccount:(id)a5;
- (int)changeType;
@end

@implementation ACDAccountChange

- (ACDAccountChange)initWithChangeType:(int)a3 account:(id)a4 oldAccount:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ACDAccountChange;
  v11 = [(ACDAccountChange *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_changeType = a3;
    objc_storeStrong((id *)&v11->_account, a4);
    objc_storeStrong((id *)&v12->_oldAccount, a5);
  }

  return v12;
}

+ (id)changeWithChangeType:(int)a3 account:(id)a4 oldAccount:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v7 = a5;
  id v8 = a4;
  id v9 = [[ACDAccountChange alloc] initWithChangeType:v6 account:v8 oldAccount:v7];

  return v9;
}

- (int)changeType
{
  return self->_changeType;
}

- (ACAccount)account
{
  return self->_account;
}

- (ACAccount)oldAccount
{
  return self->_oldAccount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldAccount, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end