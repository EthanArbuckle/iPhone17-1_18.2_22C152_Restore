@interface ASCPasswordCredential
+ (BOOL)supportsSecureCoding;
- (ASCPasswordCredential)initWithCoder:(id)a3;
- (ASCPasswordCredential)initWithUser:(id)a3 password:(id)a4 site:(id)a5 creationDate:(id)a6 externalProviderBundleIdentifier:(id)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExternal;
- (NSDate)creationDate;
- (NSString)externalProviderBundleIdentifier;
- (NSString)password;
- (NSString)site;
- (NSString)user;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCPasswordCredential

- (ASCPasswordCredential)initWithUser:(id)a3 password:(id)a4 site:(id)a5 creationDate:(id)a6 externalProviderBundleIdentifier:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v28.receiver = self;
  v28.super_class = (Class)ASCPasswordCredential;
  v17 = [(ASCPasswordCredential *)&v28 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    user = v17->_user;
    v17->_user = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    password = v17->_password;
    v17->_password = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    site = v17->_site;
    v17->_site = (NSString *)v22;

    objc_storeStrong((id *)&v17->_creationDate, a6);
    uint64_t v24 = [v16 copy];
    externalProviderBundleIdentifier = v17->_externalProviderBundleIdentifier;
    v17->_externalProviderBundleIdentifier = (NSString *)v24;

    v26 = v17;
  }

  return v17;
}

- (BOOL)isExternal
{
  return self->_externalProviderBundleIdentifier != 0;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ASCPasswordCredential *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v16 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      user = self->_user;
      v8 = [(ASCPasswordCredential *)v6 user];
      if ([(NSString *)user isEqual:v8])
      {
        password = self->_password;
        v10 = [(ASCPasswordCredential *)v6 password];
        if ([(NSString *)password isEqual:v10])
        {
          site = self->_site;
          id v12 = [(ASCPasswordCredential *)v6 site];
          if ([(NSString *)site isEqual:v12])
          {
            creationDate = self->_creationDate;
            id v14 = [(ASCPasswordCredential *)v6 creationDate];
            if ([(NSDate *)creationDate isEqual:v14])
            {
              id v15 = [(ASCPasswordCredential *)v6 externalProviderBundleIdentifier];
              char v16 = WBSIsEqual();
            }
            else
            {
              char v16 = 0;
            }
          }
          else
          {
            char v16 = 0;
          }
        }
        else
        {
          char v16 = 0;
        }
      }
      else
      {
        char v16 = 0;
      }
    }
    else
    {
      char v16 = 0;
    }
  }
  return v16;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_user hash];
  NSUInteger v4 = [(NSString *)self->_password hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_site hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSDate *)self->_creationDate hash];
  return v6 ^ [(NSString *)self->_externalProviderBundleIdentifier hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCPasswordCredential)initWithCoder:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"user"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"password"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"site"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalProviderBundleIdentifier"];

  v10 = [(ASCPasswordCredential *)self initWithUser:v5 password:v6 site:v7 creationDate:v8 externalProviderBundleIdentifier:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  user = self->_user;
  id v5 = a3;
  [v5 encodeObject:user forKey:@"user"];
  [v5 encodeObject:self->_password forKey:@"password"];
  [v5 encodeObject:self->_site forKey:@"site"];
  [v5 encodeObject:self->_creationDate forKey:@"date"];
  [v5 encodeObject:self->_externalProviderBundleIdentifier forKey:@"externalProviderBundleIdentifier"];
}

- (NSString)user
{
  return self->_user;
}

- (NSString)password
{
  return self->_password;
}

- (NSString)site
{
  return self->_site;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSString)externalProviderBundleIdentifier
{
  return self->_externalProviderBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalProviderBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_site, 0);
  objc_storeStrong((id *)&self->_password, 0);

  objc_storeStrong((id *)&self->_user, 0);
}

@end