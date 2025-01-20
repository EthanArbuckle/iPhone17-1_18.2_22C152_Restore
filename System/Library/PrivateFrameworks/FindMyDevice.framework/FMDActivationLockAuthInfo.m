@interface FMDActivationLockAuthInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isAccountHSA2;
- (BOOL)isActivationLockEnabled;
- (BOOL)isFindMyON;
- (BOOL)isSignedIntoICloud;
- (FMDActivationLockAuthInfo)initWithCoder:(id)a3;
- (NSString)altDsid;
- (NSString)dsid;
- (NSString)pet;
- (NSString)username;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAltDsid:(id)a3;
- (void)setDsid:(id)a3;
- (void)setIsAccountHSA2:(BOOL)a3;
- (void)setIsActivationLockEnabled:(BOOL)a3;
- (void)setIsFindMyON:(BOOL)a3;
- (void)setIsSignedIntoICloud:(BOOL)a3;
- (void)setPet:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation FMDActivationLockAuthInfo

- (FMDActivationLockAuthInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FMDActivationLockAuthInfo;
  v5 = [(FMDActivationLockAuthInfo *)&v11 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"username"];
    [(FMDActivationLockAuthInfo *)v5 setUsername:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pet"];
    [(FMDActivationLockAuthInfo *)v5 setPet:v7];

    -[FMDActivationLockAuthInfo setIsAccountHSA2:](v5, "setIsAccountHSA2:", [v4 decodeBoolForKey:@"isAccountHSA2"]);
    -[FMDActivationLockAuthInfo setIsSignedIntoICloud:](v5, "setIsSignedIntoICloud:", [v4 decodeBoolForKey:@"isSignedIntoICloud"]);
    -[FMDActivationLockAuthInfo setIsFindMyON:](v5, "setIsFindMyON:", [v4 decodeBoolForKey:@"isFindMyON"]);
    -[FMDActivationLockAuthInfo setIsActivationLockEnabled:](v5, "setIsActivationLockEnabled:", [v4 decodeBoolForKey:@"isActivationLockEnabled"]);
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dsid"];
    [(FMDActivationLockAuthInfo *)v5 setDsid:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"altDsid"];
    [(FMDActivationLockAuthInfo *)v5 setAltDsid:v9];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(FMDActivationLockAuthInfo *)self username];
  [v4 encodeObject:v5 forKey:@"username"];

  v6 = [(FMDActivationLockAuthInfo *)self pet];
  [v4 encodeObject:v6 forKey:@"pet"];

  objc_msgSend(v4, "encodeBool:forKey:", -[FMDActivationLockAuthInfo isAccountHSA2](self, "isAccountHSA2"), @"isAccountHSA2");
  objc_msgSend(v4, "encodeBool:forKey:", -[FMDActivationLockAuthInfo isSignedIntoICloud](self, "isSignedIntoICloud"), @"isSignedIntoICloud");
  objc_msgSend(v4, "encodeBool:forKey:", -[FMDActivationLockAuthInfo isFindMyON](self, "isFindMyON"), @"isFindMyON");
  objc_msgSend(v4, "encodeBool:forKey:", -[FMDActivationLockAuthInfo isActivationLockEnabled](self, "isActivationLockEnabled"), @"isActivationLockEnabled");
  v7 = [(FMDActivationLockAuthInfo *)self dsid];
  [v4 encodeObject:v7 forKey:@"dsid"];

  id v8 = [(FMDActivationLockAuthInfo *)self altDsid];
  [v4 encodeObject:v8 forKey:@"altDsid"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(FMDActivationLockAuthInfo *)self username];
  v5 = [(FMDActivationLockAuthInfo *)self pet];
  BOOL v6 = [(FMDActivationLockAuthInfo *)self isFindMyON];
  BOOL v7 = [(FMDActivationLockAuthInfo *)self isSignedIntoICloud];
  BOOL v8 = [(FMDActivationLockAuthInfo *)self isAccountHSA2];
  BOOL v9 = [(FMDActivationLockAuthInfo *)self isActivationLockEnabled];
  v10 = [(FMDActivationLockAuthInfo *)self dsid];
  objc_super v11 = [(FMDActivationLockAuthInfo *)self altDsid];
  v12 = [v3 stringWithFormat:@"username = %@, pet = %@, isFindMyON = %d, isSignedIntoICloud %d, isAccountHSA2 = %d isActivationLockEnabled = %d dsid = %@, altDsid = %@", v4, v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (NSString)pet
{
  return self->_pet;
}

- (void)setPet:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (BOOL)isFindMyON
{
  return self->_isFindMyON;
}

- (void)setIsFindMyON:(BOOL)a3
{
  self->_isFindMyON = a3;
}

- (BOOL)isActivationLockEnabled
{
  return self->_isActivationLockEnabled;
}

- (void)setIsActivationLockEnabled:(BOOL)a3
{
  self->_isActivationLockEnabled = a3;
}

- (BOOL)isSignedIntoICloud
{
  return self->_isSignedIntoICloud;
}

- (void)setIsSignedIntoICloud:(BOOL)a3
{
  self->_isSignedIntoICloud = a3;
}

- (BOOL)isAccountHSA2
{
  return self->_isAccountHSA2;
}

- (void)setIsAccountHSA2:(BOOL)a3
{
  self->_isAccountHSA2 = a3;
}

- (NSString)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
}

- (NSString)altDsid
{
  return self->_altDsid;
}

- (void)setAltDsid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDsid, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_username, 0);

  objc_storeStrong((id *)&self->_pet, 0);
}

@end