@interface AKAuthorizationSharedAccountLoginChoice
+ (BOOL)supportsSecureCoding;
- (AKAuthorizationSharedAccountLoginChoice)initWithCoder:(id)a3;
- (AKAuthorizationSharedAccountLoginChoice)initWithSignInWithAppleAccount:(id)a3;
- (AKSignInWithAppleAccount)sharedAccount;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AKAuthorizationSharedAccountLoginChoice

- (AKAuthorizationSharedAccountLoginChoice)initWithSignInWithAppleAccount:(id)a3
{
  id v5 = a3;
  v6 = [v5 shareInfo];
  v7 = [v6 participantName];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    v10 = [v5 shareInfo];
    id v9 = [v10 participantHandle];
  }
  v11 = [v5 clientID];
  v14.receiver = self;
  v14.super_class = (Class)AKAuthorizationSharedAccountLoginChoice;
  v12 = [(AKAuthorizationLoginChoice *)&v14 initWithUser:v9 site:v11];

  if (v12)
  {
    objc_storeStrong((id *)&v12->_sharedAccount, a3);
    [(AKAuthorizationLoginChoice *)v12 setAppleIDAuth:1];
  }

  return v12;
}

- (AKAuthorizationSharedAccountLoginChoice)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKAuthorizationSharedAccountLoginChoice;
  id v5 = [(AKAuthorizationLoginChoice *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharedAccount"];
    sharedAccount = v5->_sharedAccount;
    v5->_sharedAccount = (AKSignInWithAppleAccount *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AKAuthorizationSharedAccountLoginChoice;
  id v4 = a3;
  [(AKAuthorizationLoginChoice *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_sharedAccount, @"sharedAccount", v5.receiver, v5.super_class);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AKAuthorizationSharedAccountLoginChoice;
  id v4 = [(AKAuthorizationLoginChoice *)&v8 copyWithZone:a3];
  uint64_t v5 = [(AKSignInWithAppleAccount *)self->_sharedAccount copy];
  uint64_t v6 = (void *)v4[4];
  v4[4] = v5;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p {\n\tsharedAccount: %@, \n}>", v5, self, self->_sharedAccount];

  return v6;
}

- (AKSignInWithAppleAccount)sharedAccount
{
  return self->_sharedAccount;
}

- (void).cxx_destruct
{
}

@end