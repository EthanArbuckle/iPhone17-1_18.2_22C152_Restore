@interface FPUIAuthenticationCredentialDescriptor
- (NSString)password;
- (NSString)username;
- (unint64_t)type;
- (void)setPassword:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)setUsername:(id)a3;
@end

@implementation FPUIAuthenticationCredentialDescriptor

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);

  objc_storeStrong((id *)&self->_username, 0);
}

@end