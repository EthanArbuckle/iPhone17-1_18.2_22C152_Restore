@interface AKAuthorizationLoginChoice
+ (BOOL)supportsSecureCoding;
- (AKAuthorizationLoginChoice)initWithCoder:(id)a3;
- (AKAuthorizationLoginChoice)initWithUser:(id)a3 site:(id)a4;
- (BOOL)isAppleIDAuthorization;
- (BOOL)shouldCreateAppleID;
- (NSString)site;
- (NSString)user;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAppleIDAuth:(BOOL)a3;
- (void)setCreateAppleID:(BOOL)a3;
- (void)setSite:(id)a3;
- (void)setUser:(id)a3;
@end

@implementation AKAuthorizationLoginChoice

- (AKAuthorizationLoginChoice)initWithUser:(id)a3 site:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AKAuthorizationLoginChoice;
  v9 = [(AKAuthorizationLoginChoice *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_user, a3);
    objc_storeStrong((id *)&v10->_site, a4);
    *(_WORD *)&v10->_appleIDAuth = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKAuthorizationLoginChoice)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AKAuthorizationLoginChoice;
  v5 = [(AKAuthorizationLoginChoice *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_user"];
    user = v5->_user;
    v5->_user = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_site"];
    site = v5->_site;
    v5->_site = (NSString *)v8;

    v5->_appleIDAuth = [v4 decodeBoolForKey:@"_appleIDAuth"];
    v5->_createAppleID = [v4 decodeBoolForKey:@"_createAppleID"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  user = self->_user;
  id v5 = a3;
  [v5 encodeObject:user forKey:@"_user"];
  [v5 encodeObject:self->_site forKey:@"_site"];
  [v5 encodeBool:self->_appleIDAuth forKey:@"_appleIDAuth"];
  [v5 encodeBool:self->_createAppleID forKey:@"_createAppleID"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSString *)self->_user copy];
  uint64_t v6 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v5;

  uint64_t v7 = [(NSString *)self->_site copy];
  uint64_t v8 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v7;

  *(unsigned char *)(v4 + 8) = self->_appleIDAuth;
  *(unsigned char *)(v4 + 9) = self->_createAppleID;
  return (id)v4;
}

- (id)description
{
  if (self->_appleIDAuth) {
    v2 = @"YES";
  }
  else {
    v2 = @"NO";
  }
  return (id)[NSString stringWithFormat:@"AKAuthorizationLoginChoice:\nUser: %@    Site: %@    AppleIDAuth: %@", self->_user, self->_site, v2];
}

- (NSString)user
{
  return self->_user;
}

- (void)setUser:(id)a3
{
}

- (NSString)site
{
  return self->_site;
}

- (void)setSite:(id)a3
{
}

- (BOOL)isAppleIDAuthorization
{
  return self->_appleIDAuth;
}

- (void)setAppleIDAuth:(BOOL)a3
{
  self->_appleIDAuth = a3;
}

- (BOOL)shouldCreateAppleID
{
  return self->_createAppleID;
}

- (void)setCreateAppleID:(BOOL)a3
{
  self->_createAppleID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_site, 0);

  objc_storeStrong((id *)&self->_user, 0);
}

@end