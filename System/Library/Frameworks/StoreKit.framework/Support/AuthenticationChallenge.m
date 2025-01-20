@interface AuthenticationChallenge
+ (id)_messageForProtectionSpace:(id)a3;
+ (id)_titleForProtectionSpace:(id)a3;
- (AuthenticationChallenge)initWithAuthenticationChallenge:(id)a3;
- (NSString)localizedMessage;
- (NSString)localizedTitle;
- (NSString)user;
- (void)setLocalizedMessage:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setUser:(id)a3;
@end

@implementation AuthenticationChallenge

- (AuthenticationChallenge)initWithAuthenticationChallenge:(id)a3
{
  id v5 = a3;
  v6 = [(AuthenticationChallenge *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_challenge, a3);
    v8 = [v5 protectionSpace];
    uint64_t v9 = [(id)objc_opt_class() _messageForProtectionSpace:v8];
    localizedMessage = v7->_localizedMessage;
    v7->_localizedMessage = (NSString *)v9;

    uint64_t v11 = [(id)objc_opt_class() _titleForProtectionSpace:v8];
    localizedTitle = v7->_localizedTitle;
    v7->_localizedTitle = (NSString *)v11;
  }
  return v7;
}

- (NSString)user
{
  v2 = [(NSURLAuthenticationChallenge *)self->_challenge proposedCredential];
  v3 = [v2 user];

  return (NSString *)v3;
}

+ (id)_messageForProtectionSpace:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableString string];
  id v5 = [v3 host];
  id v6 = [v3 port];
  if ((uint64_t)v6 <= 0)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = +[NSString stringWithFormat:@"%@:%ld", v5, v6];
  }
  v8 = v7;
  if ([v3 isProxy])
  {
    uint64_t v9 = ASDLocalizedString();
    v10 = [v3 protocol];
    uint64_t v11 = +[NSString stringWithValidatedFormat:v9, @"%@%@", 0, v10, v8 validFormatSpecifiers error];
    [v4 appendString:v11];
  }
  else
  {
    uint64_t v9 = ASDLocalizedString();
    v10 = +[NSString stringWithValidatedFormat:v9, @"%@", 0, v8 validFormatSpecifiers error];
    [v4 appendString:v10];
  }

  [v3 receivesCredentialSecurely];
  v12 = ASDLocalizedString();
  [v4 appendFormat:@" %@", v12];

  return v4;
}

+ (id)_titleForProtectionSpace:(id)a3
{
  [a3 isProxy];

  return (id)ASDLocalizedString();
}

- (NSString)localizedMessage
{
  return self->_localizedMessage;
}

- (void)setLocalizedMessage:(id)a3
{
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
}

- (void)setUser:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_localizedMessage, 0);

  objc_storeStrong((id *)&self->_challenge, 0);
}

@end