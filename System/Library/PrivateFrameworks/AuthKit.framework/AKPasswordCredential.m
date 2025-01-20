@interface AKPasswordCredential
+ (BOOL)supportsSecureCoding;
- (AKPasswordCredential)initWithCoder:(id)a3;
- (AKPasswordCredential)initWithUser:(id)a3 password:(id)a4;
- (NSString)password;
- (NSString)userIdentifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AKPasswordCredential

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKPasswordCredential)initWithUser:(id)a3 password:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AKPasswordCredential;
  v9 = [(AKPasswordCredential *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userIdentifier, a3);
    objc_storeStrong((id *)&v10->_password, a4);
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  userIdentifier = self->_userIdentifier;
  id v5 = a3;
  [v5 encodeObject:userIdentifier forKey:@"_userIdentifier"];
  [v5 encodeObject:self->_password forKey:@"_password"];
}

- (AKPasswordCredential)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AKPasswordCredential;
  id v5 = [(AKPasswordCredential *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"_userIdentifier"];
    userIdentifier = v5->_userIdentifier;
    v5->_userIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"_password"];
    password = v5->_password;
    v5->_password = (NSString *)v8;
  }
  return v5;
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (NSString)password
{
  return self->_password;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);

  objc_storeStrong((id *)&self->_userIdentifier, 0);
}

@end