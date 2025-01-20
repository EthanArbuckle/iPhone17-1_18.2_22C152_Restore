@interface DEPDeviceUploadOrganization
+ (BOOL)supportsSecureCoding;
- (BOOL)deviceAdditionDepEnabled;
- (BOOL)deviceAdditionGbiEnabled;
- (BOOL)idmsRemoveDeviceEnabled;
- (BOOL)idmsWhitelistingEnabled;
- (BOOL)skipItrackCheck;
- (DEPDeviceUploadOrganization)initWithCoder:(id)a3;
- (DEPDeviceUploadOrganization)initWithDict:(id)a3;
- (DEPDeviceUploadOrganization)initWithOrgId:(id)a3 orgName:(id)a4 approvers:(id)a5 skipItrackCheck:(BOOL)a6 deviceAdditionDepEnabled:(BOOL)a7 idmsWhitelistingEnabled:(BOOL)a8 idmsRemoveDeviceEnabled:(BOOL)a9 deviceAdditionGbiEnabled:(BOOL)a10;
- (NSArray)approvers;
- (NSNumber)deviceAdditionDepEnabledNum;
- (NSNumber)deviceAdditionGbiEnabledNum;
- (NSNumber)idmsRemoveDeviceEnabledNum;
- (NSNumber)idmsWhitelistingEnabledNum;
- (NSNumber)skipItrackCheckNum;
- (NSString)orgId;
- (NSString)orgName;
- (id)_approversFromApproversArray:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceAdditionDepEnabledNum:(id)a3;
- (void)setDeviceAdditionGbiEnabledNum:(id)a3;
- (void)setIdmsRemoveDeviceEnabledNum:(id)a3;
- (void)setIdmsWhitelistingEnabledNum:(id)a3;
- (void)setSkipItrackCheckNum:(id)a3;
@end

@implementation DEPDeviceUploadOrganization

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DEPDeviceUploadOrganization)initWithOrgId:(id)a3 orgName:(id)a4 approvers:(id)a5 skipItrackCheck:(BOOL)a6 deviceAdditionDepEnabled:(BOOL)a7 idmsWhitelistingEnabled:(BOOL)a8 idmsRemoveDeviceEnabled:(BOOL)a9 deviceAdditionGbiEnabled:(BOOL)a10
{
  BOOL v10 = a8;
  BOOL v11 = a7;
  BOOL v12 = a6;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  v33.receiver = self;
  v33.super_class = (Class)DEPDeviceUploadOrganization;
  v20 = [(DEPDeviceUploadOrganization *)&v33 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_orgId, a3);
    objc_storeStrong((id *)&v21->_orgName, a4);
    objc_storeStrong((id *)&v21->_approvers, a5);
    uint64_t v22 = [MEMORY[0x1E4F28ED0] numberWithBool:v12];
    skipItrackCheckNum = v21->_skipItrackCheckNum;
    v21->_skipItrackCheckNum = (NSNumber *)v22;

    uint64_t v24 = [MEMORY[0x1E4F28ED0] numberWithBool:v11];
    deviceAdditionDepEnabledNum = v21->_deviceAdditionDepEnabledNum;
    v21->_deviceAdditionDepEnabledNum = (NSNumber *)v24;

    uint64_t v26 = [MEMORY[0x1E4F28ED0] numberWithBool:v10];
    idmsWhitelistingEnabledNum = v21->_idmsWhitelistingEnabledNum;
    v21->_idmsWhitelistingEnabledNum = (NSNumber *)v26;

    uint64_t v28 = [MEMORY[0x1E4F28ED0] numberWithBool:a9];
    idmsRemoveDeviceEnabledNum = v21->_idmsRemoveDeviceEnabledNum;
    v21->_idmsRemoveDeviceEnabledNum = (NSNumber *)v28;

    uint64_t v30 = [MEMORY[0x1E4F28ED0] numberWithBool:a10];
    deviceAdditionGbiEnabledNum = v21->_deviceAdditionGbiEnabledNum;
    v21->_deviceAdditionGbiEnabledNum = (NSNumber *)v30;
  }
  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  orgId = self->_orgId;
  id v5 = a3;
  [v5 encodeObject:orgId forKey:@"orgId"];
  [v5 encodeObject:self->_orgName forKey:@"orgName"];
  [v5 encodeObject:self->_approvers forKey:@"approvers"];
  [v5 encodeObject:self->_skipItrackCheckNum forKey:@"skipItrackCheckNum"];
  [v5 encodeObject:self->_deviceAdditionDepEnabledNum forKey:@"deviceAdditionDepEnabledNum"];
  [v5 encodeObject:self->_idmsWhitelistingEnabledNum forKey:@"idmsWhitelistingEnabledNum"];
  [v5 encodeObject:self->_idmsRemoveDeviceEnabledNum forKey:@"idmsRemoveDeviceEnabledNum"];
  [v5 encodeObject:self->_deviceAdditionGbiEnabledNum forKey:@"deviceAdditionGbiEnabledNum"];
}

- (DEPDeviceUploadOrganization)initWithCoder:(id)a3
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)DEPDeviceUploadOrganization;
  id v5 = [(DEPDeviceUploadOrganization *)&v26 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"orgId"];
    orgId = v5->_orgId;
    v5->_orgId = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"orgName"];
    orgName = v5->_orgName;
    v5->_orgName = (NSString *)v8;

    BOOL v10 = (void *)MEMORY[0x1E4F1CAD0];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    BOOL v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
    BOOL v12 = [v10 setWithArray:v11];
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"approvers"];
    approvers = v5->_approvers;
    v5->_approvers = (NSArray *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"skipItrackCheckNum"];
    skipItrackCheckNum = v5->_skipItrackCheckNum;
    v5->_skipItrackCheckNum = (NSNumber *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceAdditionDepEnabledNum"];
    deviceAdditionDepEnabledNum = v5->_deviceAdditionDepEnabledNum;
    v5->_deviceAdditionDepEnabledNum = (NSNumber *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"idmsWhitelistingEnabledNum"];
    idmsWhitelistingEnabledNum = v5->_idmsWhitelistingEnabledNum;
    v5->_idmsWhitelistingEnabledNum = (NSNumber *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"idmsRemoveDeviceEnabledNum"];
    idmsRemoveDeviceEnabledNum = v5->_idmsRemoveDeviceEnabledNum;
    v5->_idmsRemoveDeviceEnabledNum = (NSNumber *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceAdditionGbiEnabledNum"];
    deviceAdditionGbiEnabledNum = v5->_deviceAdditionGbiEnabledNum;
    v5->_deviceAdditionGbiEnabledNum = (NSNumber *)v23;
  }
  return v5;
}

- (DEPDeviceUploadOrganization)initWithDict:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)DEPDeviceUploadOrganization;
  id v5 = [(DEPDeviceUploadOrganization *)&v24 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"orgId"];
    orgId = v5->_orgId;
    v5->_orgId = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"orgName"];
    orgName = v5->_orgName;
    v5->_orgName = (NSString *)v8;

    BOOL v10 = [v4 objectForKeyedSubscript:@"approverList"];
    uint64_t v11 = [(DEPDeviceUploadOrganization *)v5 _approversFromApproversArray:v10];
    approvers = v5->_approvers;
    v5->_approvers = (NSArray *)v11;

    uint64_t v13 = [v4 objectForKeyedSubscript:@"skipItrackCheck"];
    skipItrackCheckNum = v5->_skipItrackCheckNum;
    v5->_skipItrackCheckNum = (NSNumber *)v13;

    uint64_t v15 = [v4 objectForKeyedSubscript:@"deviceAdditionDepEnabled"];
    deviceAdditionDepEnabledNum = v5->_deviceAdditionDepEnabledNum;
    v5->_deviceAdditionDepEnabledNum = (NSNumber *)v15;

    uint64_t v17 = [v4 objectForKeyedSubscript:@"idmsWhitelistingEnabled"];
    idmsWhitelistingEnabledNum = v5->_idmsWhitelistingEnabledNum;
    v5->_idmsWhitelistingEnabledNum = (NSNumber *)v17;

    uint64_t v19 = [v4 objectForKeyedSubscript:@"idmsRemoveDeviceEnabled"];
    idmsRemoveDeviceEnabledNum = v5->_idmsRemoveDeviceEnabledNum;
    v5->_idmsRemoveDeviceEnabledNum = (NSNumber *)v19;

    uint64_t v21 = [v4 objectForKeyedSubscript:@"deviceAdditionGbiEnabled"];
    deviceAdditionGbiEnabledNum = v5->_deviceAdditionGbiEnabledNum;
    v5->_deviceAdditionGbiEnabledNum = (NSNumber *)v21;
  }
  return v5;
}

- (id)_approversFromApproversArray:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = [DEPDeviceUploadUser alloc];
        BOOL v12 = -[DEPDeviceUploadUser initWithApproverDict:](v11, "initWithApproverDict:", v10, (void)v15);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  uint64_t v13 = (void *)[v4 copy];
  return v13;
}

- (BOOL)skipItrackCheck
{
  return [(NSNumber *)self->_skipItrackCheckNum BOOLValue];
}

- (BOOL)deviceAdditionDepEnabled
{
  return [(NSNumber *)self->_deviceAdditionDepEnabledNum BOOLValue];
}

- (BOOL)idmsWhitelistingEnabled
{
  return [(NSNumber *)self->_idmsWhitelistingEnabledNum BOOLValue];
}

- (BOOL)idmsRemoveDeviceEnabled
{
  return [(NSNumber *)self->_idmsRemoveDeviceEnabledNum BOOLValue];
}

- (BOOL)deviceAdditionGbiEnabled
{
  return [(NSNumber *)self->_deviceAdditionGbiEnabledNum BOOLValue];
}

- (NSString)orgId
{
  return self->_orgId;
}

- (NSString)orgName
{
  return self->_orgName;
}

- (NSArray)approvers
{
  return self->_approvers;
}

- (NSNumber)skipItrackCheckNum
{
  return self->_skipItrackCheckNum;
}

- (void)setSkipItrackCheckNum:(id)a3
{
}

- (NSNumber)deviceAdditionDepEnabledNum
{
  return self->_deviceAdditionDepEnabledNum;
}

- (void)setDeviceAdditionDepEnabledNum:(id)a3
{
}

- (NSNumber)idmsWhitelistingEnabledNum
{
  return self->_idmsWhitelistingEnabledNum;
}

- (void)setIdmsWhitelistingEnabledNum:(id)a3
{
}

- (NSNumber)idmsRemoveDeviceEnabledNum
{
  return self->_idmsRemoveDeviceEnabledNum;
}

- (void)setIdmsRemoveDeviceEnabledNum:(id)a3
{
}

- (NSNumber)deviceAdditionGbiEnabledNum
{
  return self->_deviceAdditionGbiEnabledNum;
}

- (void)setDeviceAdditionGbiEnabledNum:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceAdditionGbiEnabledNum, 0);
  objc_storeStrong((id *)&self->_idmsRemoveDeviceEnabledNum, 0);
  objc_storeStrong((id *)&self->_idmsWhitelistingEnabledNum, 0);
  objc_storeStrong((id *)&self->_deviceAdditionDepEnabledNum, 0);
  objc_storeStrong((id *)&self->_skipItrackCheckNum, 0);
  objc_storeStrong((id *)&self->_approvers, 0);
  objc_storeStrong((id *)&self->_orgName, 0);
  objc_storeStrong((id *)&self->_orgId, 0);
}

@end