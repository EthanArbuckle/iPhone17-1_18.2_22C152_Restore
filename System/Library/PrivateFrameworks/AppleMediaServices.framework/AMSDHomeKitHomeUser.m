@interface AMSDHomeKitHomeUser
- (AMSDHomeKitHomeUser)initWithUser:(id)a3;
- (HMUser)user;
- (NSString)hashedDescription;
- (NSString)name;
- (NSUUID)identifier;
- (void)setUser:(id)a3;
@end

@implementation AMSDHomeKitHomeUser

- (AMSDHomeKitHomeUser)initWithUser:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSDHomeKitHomeUser;
  v6 = [(AMSDHomeKitHomeUser *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_user, a3);
  }

  return v7;
}

- (NSUUID)identifier
{
  v2 = [(AMSDHomeKitHomeUser *)self user];
  v3 = [v2 uniqueIdentifier];

  return (NSUUID *)v3;
}

- (NSString)name
{
  v2 = [(AMSDHomeKitHomeUser *)self user];
  v3 = [v2 name];

  return (NSString *)v3;
}

- (NSString)hashedDescription
{
  uint64_t v3 = objc_opt_class();
  v4 = [(AMSDHomeKitHomeUser *)self name];
  id v5 = AMSHashIfNeeded();
  v6 = [(AMSDHomeKitHomeUser *)self identifier];
  v7 = AMSHashIfNeeded();
  v8 = +[NSString stringWithFormat:@"<%@: %p name = %@ | identifier = %@>", v3, self, v5, v7];

  return (NSString *)v8;
}

- (HMUser)user
{
  return self->_user;
}

- (void)setUser:(id)a3
{
}

- (void).cxx_destruct
{
}

@end