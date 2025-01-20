@interface ASAuthorizationAppleIDCredential
+ (ASAuthorizationAppleIDCredential)new;
+ (BOOL)supportsSecureCoding;
- (ASAuthorizationAppleIDCredential)init;
- (ASAuthorizationAppleIDCredential)initWithCoder:(id)a3;
- (ASAuthorizationAppleIDCredential)initWithUser:(id)a3 authorizedScopes:(id)a4;
- (ASUserDetectionStatus)realUserStatus;
- (NSArray)authorizedScopes;
- (NSData)accessToken;
- (NSData)authorizationCode;
- (NSData)identityToken;
- (NSData)refreshToken;
- (NSPersonNameComponents)fullName;
- (NSString)description;
- (NSString)email;
- (NSString)state;
- (NSString)user;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)userAgeRange;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessToken:(id)a3;
- (void)setAuthorizationCode:(id)a3;
- (void)setAuthorizedScopes:(id)a3;
- (void)setEmail:(id)a3;
- (void)setFullName:(id)a3;
- (void)setIdentityToken:(id)a3;
- (void)setRealUserStatus:(int64_t)a3;
- (void)setRefreshToken:(id)a3;
- (void)setState:(id)a3;
- (void)setUser:(id)a3;
- (void)setUserAgeRange:(int64_t)a3;
@end

@implementation ASAuthorizationAppleIDCredential

+ (ASAuthorizationAppleIDCredential)new
{
  return 0;
}

- (ASAuthorizationAppleIDCredential)init
{
  return 0;
}

- (ASAuthorizationAppleIDCredential)initWithUser:(id)a3 authorizedScopes:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"ASAuthorizationAppleIDCredential.m", 49, @"Invalid parameter not satisfying: %@", @"user" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x263F08690] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"ASAuthorizationAppleIDCredential.m", 50, @"Invalid parameter not satisfying: %@", @"authorizedScopes" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)ASAuthorizationAppleIDCredential;
  v10 = [(ASAuthorizationAppleIDCredential *)&v18 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    user = v10->_user;
    v10->_user = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    authorizedScopes = v10->_authorizedScopes;
    v10->_authorizedScopes = (NSArray *)v13;

    v10->_internalLock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p { userIdentifier: %@, authorizedScopes: %@ }>", v5, self, self->_user, self->_authorizedScopes];

  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [[ASAuthorizationAppleIDCredential alloc] initWithUser:self->_user authorizedScopes:self->_authorizedScopes];
  [(ASAuthorizationAppleIDCredential *)v4 setState:self->_state];
  [(ASAuthorizationAppleIDCredential *)v4 setAuthorizationCode:self->_authorizationCode];
  [(ASAuthorizationAppleIDCredential *)v4 setIdentityToken:self->_identityToken];
  [(ASAuthorizationAppleIDCredential *)v4 setEmail:self->_email];
  [(ASAuthorizationAppleIDCredential *)v4 setFullName:self->_fullName];
  [(ASAuthorizationAppleIDCredential *)v4 setRealUserStatus:self->_realUserStatus];
  [(ASAuthorizationAppleIDCredential *)v4 setUserAgeRange:self->_userAgeRange];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  user = self->_user;
  id v5 = a3;
  [v5 encodeObject:user forKey:@"_user"];
  [v5 encodeObject:self->_state forKey:@"_state"];
  [v5 encodeObject:self->_authorizedScopes forKey:@"_authorizedScopes"];
  [v5 encodeObject:self->_authorizationCode forKey:@"_authorizationCode"];
  [v5 encodeObject:self->_identityToken forKey:@"_identityToken"];
  [v5 encodeObject:self->_email forKey:@"_email"];
  [v5 encodeObject:self->_fullName forKey:@"_fullName"];
  [v5 encodeInteger:self->_realUserStatus forKey:@"_realUserStatus"];
  [v5 encodeInteger:self->_userAgeRange forKey:@"_userAgeRange"];
}

- (ASAuthorizationAppleIDCredential)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)ASAuthorizationAppleIDCredential;
  id v5 = [(ASAuthorizationAppleIDCredential *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_user"];
    user = v5->_user;
    v5->_user = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_state"];
    state = v5->_state;
    v5->_state = (NSString *)v8;

    v10 = (void *)MEMORY[0x263EFFA08];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"_authorizedScopes"];
    authorizedScopes = v5->_authorizedScopes;
    v5->_authorizedScopes = (NSArray *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_authorizationCode"];
    authorizationCode = v5->_authorizationCode;
    v5->_authorizationCode = (NSData *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identityToken"];
    identityToken = v5->_identityToken;
    v5->_identityToken = (NSData *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_email"];
    email = v5->_email;
    v5->_email = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_fullName"];
    fullName = v5->_fullName;
    v5->_fullName = (NSPersonNameComponents *)v21;

    v5->_realUserStatus = [v4 decodeIntegerForKey:@"_realUserStatus"];
    v5->_userAgeRange = [v4 decodeIntegerForKey:@"_userAgeRange"];
    v23 = v5;
  }

  return v5;
}

- (NSString)user
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  id v4 = self->_user;
  os_unfair_lock_unlock(p_internalLock);

  return v4;
}

- (void)setUser:(id)a3
{
  id v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  user = self->_user;
  self->_user = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (NSString)state
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  id v4 = self->_state;
  os_unfair_lock_unlock(p_internalLock);

  return v4;
}

- (void)setState:(id)a3
{
  id v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  state = self->_state;
  self->_state = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (NSArray)authorizedScopes
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  id v4 = self->_authorizedScopes;
  os_unfair_lock_unlock(p_internalLock);

  return v4;
}

- (void)setAuthorizedScopes:(id)a3
{
  id v4 = (NSArray *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  authorizedScopes = self->_authorizedScopes;
  self->_authorizedScopes = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (NSData)authorizationCode
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  id v4 = self->_authorizationCode;
  os_unfair_lock_unlock(p_internalLock);

  return v4;
}

- (void)setAuthorizationCode:(id)a3
{
  id v4 = (NSData *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  authorizationCode = self->_authorizationCode;
  self->_authorizationCode = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (NSData)identityToken
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  id v4 = self->_identityToken;
  os_unfair_lock_unlock(p_internalLock);

  return v4;
}

- (void)setIdentityToken:(id)a3
{
  id v4 = (NSData *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  identityToken = self->_identityToken;
  self->_identityToken = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (NSString)email
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  id v4 = self->_email;
  os_unfair_lock_unlock(p_internalLock);

  return v4;
}

- (void)setEmail:(id)a3
{
  id v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  email = self->_email;
  self->_email = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (NSPersonNameComponents)fullName
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  id v4 = self->_fullName;
  os_unfair_lock_unlock(p_internalLock);

  return v4;
}

- (void)setFullName:(id)a3
{
  id v4 = (NSPersonNameComponents *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  fullName = self->_fullName;
  self->_fullName = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (NSData)accessToken
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  id v4 = self->_accessToken;
  os_unfair_lock_unlock(p_internalLock);

  return v4;
}

- (void)setAccessToken:(id)a3
{
  id v4 = (NSData *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  accessToken = self->_accessToken;
  self->_accessToken = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (NSData)refreshToken
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  id v4 = self->_refreshToken;
  os_unfair_lock_unlock(p_internalLock);

  return v4;
}

- (void)setRefreshToken:(id)a3
{
  id v4 = (NSData *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  refreshToken = self->_refreshToken;
  self->_refreshToken = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (ASUserDetectionStatus)realUserStatus
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  ASUserDetectionStatus realUserStatus = self->_realUserStatus;
  os_unfair_lock_unlock(p_internalLock);
  return realUserStatus;
}

- (void)setRealUserStatus:(int64_t)a3
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  self->_ASUserDetectionStatus realUserStatus = a3;

  os_unfair_lock_unlock(p_internalLock);
}

- (int64_t)userAgeRange
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  int64_t userAgeRange = self->_userAgeRange;
  os_unfair_lock_unlock(p_internalLock);
  return userAgeRange;
}

- (void)setUserAgeRange:(int64_t)a3
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  self->_int64_t userAgeRange = a3;

  os_unfair_lock_unlock(p_internalLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizedScopes, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_refreshToken, 0);
  objc_storeStrong((id *)&self->_accessToken, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_identityToken, 0);
  objc_storeStrong((id *)&self->_authorizationCode, 0);

  objc_storeStrong((id *)&self->_state, 0);
}

@end