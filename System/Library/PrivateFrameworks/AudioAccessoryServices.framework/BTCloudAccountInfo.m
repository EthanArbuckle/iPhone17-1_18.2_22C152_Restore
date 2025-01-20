@interface BTCloudAccountInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isSignedIn;
- (BOOL)manateeAvailable;
- (BTCloudAccountInfo)initWithCoder:(id)a3;
- (NSString)accountIdentifier;
- (NSString)loginID;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setIsSignedIn:(BOOL)a3;
- (void)setLoginID:(id)a3;
- (void)setManateeAvailable:(BOOL)a3;
@end

@implementation BTCloudAccountInfo

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(BTCloudAccountInfo *)self accountIdentifier];
  v6 = NSStringFromSelector(sel_accountIdentifier);
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(BTCloudAccountInfo *)self loginID];
  v8 = NSStringFromSelector(sel_loginID);
  [v4 encodeObject:v7 forKey:v8];

  BOOL v9 = [(BTCloudAccountInfo *)self isSignedIn];
  v10 = NSStringFromSelector(sel_isSignedIn);
  [v4 encodeBool:v9 forKey:v10];

  BOOL v11 = [(BTCloudAccountInfo *)self manateeAvailable];
  NSStringFromSelector(sel_manateeAvailable);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeBool:v11 forKey:v12];
}

- (BTCloudAccountInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BTCloudAccountInfo;
  v5 = [(BTCloudAccountInfo *)&v15 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_accountIdentifier);
    v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    [(BTCloudAccountInfo *)v5 setAccountIdentifier:v8];

    uint64_t v9 = objc_opt_class();
    v10 = NSStringFromSelector(sel_loginID);
    BOOL v11 = [v4 decodeObjectOfClass:v9 forKey:v10];
    [(BTCloudAccountInfo *)v5 setLoginID:v11];

    id v12 = NSStringFromSelector(sel_isSignedIn);
    -[BTCloudAccountInfo setIsSignedIn:](v5, "setIsSignedIn:", [v4 decodeBoolForKey:v12]);

    v13 = NSStringFromSelector(sel_manateeAvailable);
    -[BTCloudAccountInfo setManateeAvailable:](v5, "setManateeAvailable:", [v4 decodeBoolForKey:v13]);
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  int v3 = IsAppleInternalBuild();
  id v4 = NSString;
  v5 = [(BTCloudAccountInfo *)self accountIdentifier];
  if (v3)
  {
    uint64_t v6 = [(BTCloudAccountInfo *)self loginID];
    v7 = [v4 stringWithFormat:@"BTCloudAccountInfo - Account(%@): %@, signedIn: %d, manatee: %d", v5, v6, -[BTCloudAccountInfo isSignedIn](self, "isSignedIn"), -[BTCloudAccountInfo manateeAvailable](self, "manateeAvailable")];
  }
  else
  {
    v7 = [v4 stringWithFormat:@"BTCloudAccountInfo - AccountID: %@, signedIn: %d, manatee: %d", v5, -[BTCloudAccountInfo isSignedIn](self, "isSignedIn"), -[BTCloudAccountInfo manateeAvailable](self, "manateeAvailable")];
  }

  return v7;
}

- (BOOL)isSignedIn
{
  return self->_isSignedIn;
}

- (void)setIsSignedIn:(BOOL)a3
{
  self->_isSignedIn = a3;
}

- (BOOL)manateeAvailable
{
  return self->_manateeAvailable;
}

- (void)setManateeAvailable:(BOOL)a3
{
  self->_manateeAvailable = a3;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSString)loginID
{
  return self->_loginID;
}

- (void)setLoginID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loginID, 0);

  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end