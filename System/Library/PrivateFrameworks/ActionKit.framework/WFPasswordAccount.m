@interface WFPasswordAccount
+ (id)accountWithUsername:(id)a3 password:(id)a4;
- (BOOL)isValid;
- (NSString)password;
- (NSString)username;
- (void)setPassword:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation WFPasswordAccount

+ (id)accountWithUsername:(id)a3 password:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setUsername:v6];

  [v7 setPassword:v5];
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

- (void)setPassword:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setUsername:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (BOOL)isValid
{
  v3 = [(WFPasswordAccount *)self username];
  if ([v3 length])
  {
    v4 = [(WFPasswordAccount *)self password];
    BOOL v5 = [v4 length] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

@end