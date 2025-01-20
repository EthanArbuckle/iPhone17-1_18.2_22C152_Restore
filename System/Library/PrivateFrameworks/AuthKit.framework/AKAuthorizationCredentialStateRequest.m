@interface AKAuthorizationCredentialStateRequest
+ (BOOL)supportsSecureCoding;
- (AKAuthorizationCredentialStateRequest)initWithCoder:(id)a3;
- (BOOL)shouldIgnoreTeamID;
- (BOOL)shouldIgnoreUserID;
- (NSString)altDSID;
- (NSString)clientID;
- (NSString)teamID;
- (NSString)userID;
- (void)encodeWithCoder:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setClientID:(id)a3;
- (void)setShouldIgnoreTeamID:(BOOL)a3;
- (void)setShouldIgnoreUserID:(BOOL)a3;
- (void)setTeamID:(id)a3;
- (void)setUserID:(id)a3;
@end

@implementation AKAuthorizationCredentialStateRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKAuthorizationCredentialStateRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AKAuthorizationCredentialStateRequest;
  v5 = [(AKAuthorizationCredentialStateRequest *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_userID"];
    userID = v5->_userID;
    v5->_userID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_clientID"];
    clientID = v5->_clientID;
    v5->_clientID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_teamID"];
    teamID = v5->_teamID;
    v5->_teamID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  userID = self->_userID;
  id v5 = a3;
  [v5 encodeObject:userID forKey:@"_userID"];
  [v5 encodeObject:self->_clientID forKey:@"_clientID"];
  [v5 encodeObject:self->_teamID forKey:@"_teamID"];
  [v5 encodeObject:self->_altDSID forKey:@"_altDSID"];
}

- (NSString)userID
{
  return self->_userID;
}

- (void)setUserID:(id)a3
{
}

- (NSString)teamID
{
  return self->_teamID;
}

- (void)setTeamID:(id)a3
{
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)setClientID:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (BOOL)shouldIgnoreUserID
{
  return self->_shouldIgnoreUserID;
}

- (void)setShouldIgnoreUserID:(BOOL)a3
{
  self->_shouldIgnoreUserID = a3;
}

- (BOOL)shouldIgnoreTeamID
{
  return self->_shouldIgnoreTeamID;
}

- (void)setShouldIgnoreTeamID:(BOOL)a3
{
  self->_shouldIgnoreTeamID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_teamID, 0);

  objc_storeStrong((id *)&self->_userID, 0);
}

@end