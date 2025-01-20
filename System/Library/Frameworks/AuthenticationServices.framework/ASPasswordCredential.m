@interface ASPasswordCredential
+ (ASPasswordCredential)credentialWithUser:(NSString *)user password:(NSString *)password;
+ (BOOL)supportsSecureCoding;
- (ASPasswordCredential)initWithCoder:(id)a3;
- (ASPasswordCredential)initWithUser:(NSString *)user password:(NSString *)password;
- (NSString)password;
- (NSString)user;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASPasswordCredential

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (ASPasswordCredential)credentialWithUser:(NSString *)user password:(NSString *)password
{
  v6 = password;
  v7 = user;
  v8 = (void *)[objc_alloc((Class)a1) initWithUser:v7 password:v6];

  return (ASPasswordCredential *)v8;
}

- (ASPasswordCredential)initWithUser:(NSString *)user password:(NSString *)password
{
  v6 = user;
  v7 = password;
  v15.receiver = self;
  v15.super_class = (Class)ASPasswordCredential;
  v8 = [(ASPasswordCredential *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [(NSString *)v6 copy];
    v10 = v8->_user;
    v8->_user = (NSString *)v9;

    uint64_t v11 = [(NSString *)v7 copy];
    v12 = v8->_password;
    v8->_password = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (ASPasswordCredential)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"User"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Password"];

  v7 = [(ASPasswordCredential *)self initWithUser:v5 password:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  user = self->_user;
  id v5 = a3;
  [v5 encodeObject:user forKey:@"User"];
  [v5 encodeObject:self->_password forKey:@"Password"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  user = self->_user;
  password = self->_password;

  return (id)[v4 initWithUser:user password:password];
}

- (NSString)user
{
  return self->_user;
}

- (NSString)password
{
  return self->_password;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);

  objc_storeStrong((id *)&self->_user, 0);
}

@end