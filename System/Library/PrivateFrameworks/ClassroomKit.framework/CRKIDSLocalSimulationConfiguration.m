@interface CRKIDSLocalSimulationConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldForceAccountsInactive;
- (BOOL)shouldForceRemoteUsersNotRegistered;
- (CRKIDSLocalSimulationConfiguration)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setShouldForceAccountsInactive:(BOOL)a3;
- (void)setShouldForceRemoteUsersNotRegistered:(BOOL)a3;
@end

@implementation CRKIDSLocalSimulationConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithBool:", -[CRKIDSLocalSimulationConfiguration shouldForceAccountsInactive](self, "shouldForceAccountsInactive"));
  [v5 encodeObject:v6 forKey:@"shouldForceAccountsInactive"];

  objc_msgSend(NSNumber, "numberWithBool:", -[CRKIDSLocalSimulationConfiguration shouldForceRemoteUsersNotRegistered](self, "shouldForceRemoteUsersNotRegistered"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v7 forKey:@"shouldForceRemoteUsersNotRegistered"];
}

- (CRKIDSLocalSimulationConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKIDSLocalSimulationConfiguration;
  id v5 = [(CRKIDSLocalSimulationConfiguration *)&v9 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shouldForceAccountsInactive"];
    v5->_shouldForceAccountsInactive = [v6 BOOLValue];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shouldForceRemoteUsersNotRegistered"];
    v5->_shouldForceRemoteUsersNotRegistered = [v7 BOOLValue];
  }
  return v5;
}

- (BOOL)shouldForceAccountsInactive
{
  return self->_shouldForceAccountsInactive;
}

- (void)setShouldForceAccountsInactive:(BOOL)a3
{
  self->_shouldForceAccountsInactive = a3;
}

- (BOOL)shouldForceRemoteUsersNotRegistered
{
  return self->_shouldForceRemoteUsersNotRegistered;
}

- (void)setShouldForceRemoteUsersNotRegistered:(BOOL)a3
{
  self->_shouldForceRemoteUsersNotRegistered = a3;
}

@end