@interface AKDeveloperTeam
+ (BOOL)supportsSecureCoding;
- (AKDeveloperTeam)initWithCoder:(id)a3;
- (AKDeveloperTeam)initWithResponseInfo:(id)a3;
- (NSDictionary)apps;
- (NSString)privateEmail;
- (NSString)teamID;
- (NSString)userIdentifier;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setApps:(id)a3;
- (void)setPrivateEmail:(id)a3;
- (void)setTeamID:(id)a3;
- (void)setUserIdentifier:(id)a3;
@end

@implementation AKDeveloperTeam

- (AKDeveloperTeam)initWithResponseInfo:(id)a3
{
  id v4 = a3;
  v5 = [(AKDeveloperTeam *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"uid"];
    userIdentifier = v5->_userIdentifier;
    v5->_userIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"team_id"];
    teamID = v5->_teamID;
    v5->_teamID = (NSString *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"privateEmail"];
    privateEmail = v5->_privateEmail;
    v5->_privateEmail = (NSString *)v10;

    v12 = [MEMORY[0x1E4F1CA60] dictionary];
    v13 = [v4 objectForKeyedSubscript:@"apps"];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __40__AKDeveloperTeam_initWithResponseInfo___block_invoke;
    v18[3] = &unk_1E5761110;
    id v19 = v12;
    id v14 = v12;
    [v13 enumerateObjectsUsingBlock:v18];

    uint64_t v15 = [v14 copy];
    apps = v5->_apps;
    v5->_apps = (NSDictionary *)v15;
  }
  return v5;
}

void __40__AKDeveloperTeam_initWithResponseInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v6 = [[AKConsentedApplication alloc] initWithResponseInfo:v3];

  id v4 = *(void **)(a1 + 32);
  v5 = [(AKConsentedApplication *)v6 clientID];
  [v4 setObject:v6 forKeyedSubscript:v5];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKDeveloperTeam)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AKDeveloperTeam *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uid"];
    userIdentifier = v5->_userIdentifier;
    v5->_userIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"team_id"];
    teamID = v5->_teamID;
    v5->_teamID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"privateEmail"];
    privateEmail = v5->_privateEmail;
    v5->_privateEmail = (NSString *)v10;

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"apps"];
    apps = v5->_apps;
    v5->_apps = (NSDictionary *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  userIdentifier = self->_userIdentifier;
  id v5 = a3;
  [v5 encodeObject:userIdentifier forKey:@"uid"];
  [v5 encodeObject:self->_teamID forKey:@"team_id"];
  [v5 encodeObject:self->_privateEmail forKey:@"privateEmail"];
  [v5 encodeObject:self->_apps forKey:@"apps"];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p> team: %@, user: %@, email: %@, apps: {\n%@\n}", objc_opt_class(), self, self->_teamID, self->_userIdentifier, self->_privateEmail, self->_apps];
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (void)setUserIdentifier:(id)a3
{
}

- (NSString)teamID
{
  return self->_teamID;
}

- (void)setTeamID:(id)a3
{
}

- (NSString)privateEmail
{
  return self->_privateEmail;
}

- (void)setPrivateEmail:(id)a3
{
}

- (NSDictionary)apps
{
  return self->_apps;
}

- (void)setApps:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apps, 0);
  objc_storeStrong((id *)&self->_privateEmail, 0);
  objc_storeStrong((id *)&self->_teamID, 0);

  objc_storeStrong((id *)&self->_userIdentifier, 0);
}

@end