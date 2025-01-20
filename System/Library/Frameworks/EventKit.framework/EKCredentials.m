@interface EKCredentials
+ (id)credentialsWithUsername:(id)a3 password:(id)a4;
- (NSString)password;
- (NSString)username;
- (id)description;
@end

@implementation EKCredentials

+ (id)credentialsWithUsername:(id)a3 password:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  v8 = (void *)v7[1];
  v7[1] = v5;
  id v9 = v5;

  v10 = (void *)v7[2];
  v7[2] = v6;

  return v7;
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)EKCredentials;
  uint64_t v4 = [(EKCredentials *)&v9 description];
  id v5 = (void *)v4;
  if (self->_password) {
    id v6 = @"******";
  }
  else {
    id v6 = 0;
  }
  v7 = [v3 stringWithFormat:@"[%@] username: [%@], password: [%@]", v4, self->_username, v6];

  return v7;
}

- (NSString)username
{
  return self->_username;
}

- (NSString)password
{
  return self->_password;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);

  objc_storeStrong((id *)&self->_username, 0);
}

@end