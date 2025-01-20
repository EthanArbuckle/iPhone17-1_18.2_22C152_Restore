@interface AKAuthorizationScopesUserSelection
+ (BOOL)supportsSecureCoding;
- (AKAuthorizationScopesUserSelection)initWithCoder:(id)a3;
- (AKUserInformation)userInformation;
- (BOOL)makePrivateEmail;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setMakePrivateEmail:(BOOL)a3;
- (void)setUserInformation:(id)a3;
@end

@implementation AKAuthorizationScopesUserSelection

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKAuthorizationScopesUserSelection)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKAuthorizationScopesUserSelection;
  v5 = [(AKAuthorizationScopesUserSelection *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_userInformation"];
    userInformation = v5->_userInformation;
    v5->_userInformation = (AKUserInformation *)v6;

    v5->_makePrivateEmail = [v4 decodeBoolForKey:@"_makePrivateEmail"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  userInformation = self->_userInformation;
  id v5 = a3;
  [v5 encodeObject:userInformation forKey:@"_userInformation"];
  [v5 encodeBool:self->_makePrivateEmail forKey:@"_makePrivateEmail"];
}

- (id)description
{
  v3 = NSString;
  id v4 = [(AKAuthorizationScopesUserSelection *)self userInformation];
  BOOL v5 = [(AKAuthorizationScopesUserSelection *)self makePrivateEmail];
  uint64_t v6 = @"NO";
  if (v5) {
    uint64_t v6 = @"YES";
  }
  v7 = [v3 stringWithFormat:@"{ userInformation: %@, makePrivateEmail: %@}", v4, v6];

  return v7;
}

- (AKUserInformation)userInformation
{
  return self->_userInformation;
}

- (void)setUserInformation:(id)a3
{
}

- (BOOL)makePrivateEmail
{
  return self->_makePrivateEmail;
}

- (void)setMakePrivateEmail:(BOOL)a3
{
  self->_makePrivateEmail = a3;
}

- (void).cxx_destruct
{
}

@end