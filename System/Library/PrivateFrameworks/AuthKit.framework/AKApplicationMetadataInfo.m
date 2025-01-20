@interface AKApplicationMetadataInfo
+ (BOOL)supportsSecureCoding;
- (AKApplicationMetadataInfo)initWithCoder:(id)a3;
- (AKApplicationMetadataInfo)initWithResponseInfo:(id)a3;
- (NSDictionary)teams;
- (NSString)authorizedAppListVersion;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AKApplicationMetadataInfo

- (AKApplicationMetadataInfo)initWithResponseInfo:(id)a3
{
  id v4 = a3;
  v5 = [(AKApplicationMetadataInfo *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"authorizedAppListVersion"];
    authorizedAppListVersion = v5->_authorizedAppListVersion;
    v5->_authorizedAppListVersion = (NSString *)v6;

    v8 = [MEMORY[0x1E4F1CA60] dictionary];
    objc_opt_class();
    id v9 = [v4 objectForKeyedSubscript:@"teams"];
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __50__AKApplicationMetadataInfo_initWithResponseInfo___block_invoke;
    v15[3] = &unk_1E5761110;
    id v16 = v8;
    id v11 = v8;
    [v10 enumerateObjectsUsingBlock:v15];
    uint64_t v12 = [v11 copy];
    teams = v5->_teams;
    v5->_teams = (NSDictionary *)v12;
  }
  return v5;
}

void __50__AKApplicationMetadataInfo_initWithResponseInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v6 = [[AKDeveloperTeam alloc] initWithResponseInfo:v3];

  id v4 = *(void **)(a1 + 32);
  v5 = [(AKDeveloperTeam *)v6 teamID];
  [v4 setObject:v6 forKeyedSubscript:v5];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKApplicationMetadataInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AKApplicationMetadataInfo *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authorizedAppListVersion"];
    authorizedAppListVersion = v5->_authorizedAppListVersion;
    v5->_authorizedAppListVersion = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    id v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"teams"];
    teams = v5->_teams;
    v5->_teams = (NSDictionary *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  authorizedAppListVersion = self->_authorizedAppListVersion;
  id v5 = a3;
  [v5 encodeObject:authorizedAppListVersion forKey:@"authorizedAppListVersion"];
  [v5 encodeObject:self->_teams forKey:@"teams"];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p> version: %@, teams: {\n%@\n}", objc_opt_class(), self, self->_authorizedAppListVersion, self->_teams];
}

- (NSString)authorizedAppListVersion
{
  return self->_authorizedAppListVersion;
}

- (NSDictionary)teams
{
  return self->_teams;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teams, 0);

  objc_storeStrong((id *)&self->_authorizedAppListVersion, 0);
}

@end