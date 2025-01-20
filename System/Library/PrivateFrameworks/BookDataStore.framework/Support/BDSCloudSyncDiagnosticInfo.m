@interface BDSCloudSyncDiagnosticInfo
+ (BOOL)supportsSecureCoding;
- (BDSCloudSyncDiagnosticDatabaseInfo)privateDatabaseInfo;
- (BDSCloudSyncDiagnosticInfo)initWithCoder:(id)a3;
- (BDSCloudSyncDiagnosticInfo)initWithEnabledSync:(BOOL)a3 accountStatus:(int64_t)a4 container:(id)a5 gettingAccountInfo:(BOOL)a6 privateDatabaseInfo:(id)a7 privateDatabaseSyncEngineInfo:(id)a8 entityInfos:(id)a9;
- (BDSCloudSyncDiagnosticSyncEngineInfo)privateDatabaseSyncEngineInfo;
- (BOOL)enabledSync;
- (BOOL)gettingAccountInfo;
- (NSArray)entityInfos;
- (NSDictionary)stateForLog;
- (NSString)container;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)accountStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountStatus:(int64_t)a3;
- (void)setContainer:(id)a3;
- (void)setEnabledSync:(BOOL)a3;
- (void)setEntityInfos:(id)a3;
- (void)setGettingAccountInfo:(BOOL)a3;
- (void)setPrivateDatabaseInfo:(id)a3;
- (void)setPrivateDatabaseSyncEngineInfo:(id)a3;
@end

@implementation BDSCloudSyncDiagnosticInfo

- (BDSCloudSyncDiagnosticInfo)initWithEnabledSync:(BOOL)a3 accountStatus:(int64_t)a4 container:(id)a5 gettingAccountInfo:(BOOL)a6 privateDatabaseInfo:(id)a7 privateDatabaseSyncEngineInfo:(id)a8 entityInfos:(id)a9
{
  id v22 = a5;
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  v23.receiver = self;
  v23.super_class = (Class)BDSCloudSyncDiagnosticInfo;
  v18 = [(BDSCloudSyncDiagnosticInfo *)&v23 init];
  v19 = v18;
  if (v18)
  {
    v18->_enabledSync = a3;
    v18->_accountStatus = a4;
    objc_storeStrong((id *)&v18->_container, a5);
    v19->_gettingAccountInfo = a6;
    objc_storeStrong((id *)&v19->_privateDatabaseInfo, a7);
    objc_storeStrong((id *)&v19->_privateDatabaseSyncEngineInfo, a8);
    objc_storeStrong((id *)&v19->_entityInfos, a9);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BDSCloudSyncDiagnosticInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(BDSCloudSyncDiagnosticInfo *)self init];
  if (v5)
  {
    v5->_enabledSync = [v4 decodeBoolForKey:@"enabledSync"];
    v5->_accountStatus = (int64_t)[v4 decodeIntegerForKey:@"accountStatus"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"container"];
    container = v5->_container;
    v5->_container = (NSString *)v6;

    v5->_gettingAccountInfo = [v4 decodeBoolForKey:@"gettingAccountInfo"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"privateDatabaseInfo"];
    privateDatabaseInfo = v5->_privateDatabaseInfo;
    v5->_privateDatabaseInfo = (BDSCloudSyncDiagnosticDatabaseInfo *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"privateDatabaseSyncEngineInfo"];
    privateDatabaseSyncEngineInfo = v5->_privateDatabaseSyncEngineInfo;
    v5->_privateDatabaseSyncEngineInfo = (BDSCloudSyncDiagnosticSyncEngineInfo *)v10;

    uint64_t v12 = objc_opt_class();
    v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"entityInfos"];
    entityInfos = v5->_entityInfos;
    v5->_entityInfos = (NSArray *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[BDSCloudSyncDiagnosticInfo enabledSync](self, "enabledSync"), @"enabledSync");
  objc_msgSend(v4, "encodeInteger:forKey:", -[BDSCloudSyncDiagnosticInfo accountStatus](self, "accountStatus"), @"accountStatus");
  v5 = [(BDSCloudSyncDiagnosticInfo *)self container];
  [v4 encodeObject:v5 forKey:@"container"];

  objc_msgSend(v4, "encodeBool:forKey:", -[BDSCloudSyncDiagnosticInfo gettingAccountInfo](self, "gettingAccountInfo"), @"gettingAccountInfo");
  uint64_t v6 = [(BDSCloudSyncDiagnosticInfo *)self privateDatabaseInfo];
  [v4 encodeObject:v6 forKey:@"privateDatabaseInfo"];

  v7 = [(BDSCloudSyncDiagnosticInfo *)self privateDatabaseSyncEngineInfo];
  [v4 encodeObject:v7 forKey:@"privateDatabaseSyncEngineInfo"];

  id v8 = [(BDSCloudSyncDiagnosticInfo *)self entityInfos];
  [v4 encodeObject:v8 forKey:@"entityInfos"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(BDSCloudSyncDiagnosticInfo);
  if (v4)
  {
    [(BDSCloudSyncDiagnosticInfo *)v4 setEnabledSync:[(BDSCloudSyncDiagnosticInfo *)self enabledSync]];
    [(BDSCloudSyncDiagnosticInfo *)v4 setAccountStatus:[(BDSCloudSyncDiagnosticInfo *)self accountStatus]];
    v5 = [(BDSCloudSyncDiagnosticInfo *)self container];
    [(BDSCloudSyncDiagnosticInfo *)v4 setContainer:v5];

    [(BDSCloudSyncDiagnosticInfo *)v4 setGettingAccountInfo:[(BDSCloudSyncDiagnosticInfo *)self gettingAccountInfo]];
    uint64_t v6 = [(BDSCloudSyncDiagnosticInfo *)self privateDatabaseInfo];
    id v7 = [v6 copy];
    [(BDSCloudSyncDiagnosticInfo *)v4 setPrivateDatabaseInfo:v7];

    id v8 = [(BDSCloudSyncDiagnosticInfo *)self privateDatabaseSyncEngineInfo];
    id v9 = [v8 copy];
    [(BDSCloudSyncDiagnosticInfo *)v4 setPrivateDatabaseSyncEngineInfo:v9];

    uint64_t v10 = [(BDSCloudSyncDiagnosticInfo *)self entityInfos];
    id v11 = [v10 copy];
    [(BDSCloudSyncDiagnosticInfo *)v4 setEntityInfos:v11];
  }
  return v4;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  unsigned int v4 = [(BDSCloudSyncDiagnosticInfo *)self enabledSync];
  int64_t v5 = [(BDSCloudSyncDiagnosticInfo *)self accountStatus];
  uint64_t v6 = [(BDSCloudSyncDiagnosticInfo *)self container];
  unsigned int v7 = [(BDSCloudSyncDiagnosticInfo *)self gettingAccountInfo];
  id v8 = [(BDSCloudSyncDiagnosticInfo *)self privateDatabaseInfo];
  id v9 = [(BDSCloudSyncDiagnosticInfo *)self privateDatabaseSyncEngineInfo];
  uint64_t v10 = [(BDSCloudSyncDiagnosticInfo *)self entityInfos];
  id v11 = +[NSString stringWithFormat:@"<%@: enabledSync:%d, accountStatus:%ld, container:%@, gettingAccountInfo:%d, privateDatabase:%@, privateDatabaseSyncEngine:%@, entities:%@>", v3, v4, v5, v6, v7, v8, v9, v10];

  return v11;
}

- (NSDictionary)stateForLog
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned int v4 = +[NSNumber numberWithBool:[(BDSCloudSyncDiagnosticInfo *)self enabledSync]];
  [v3 setObject:v4 forKeyedSubscript:@"enabledSync"];

  int64_t v5 = +[NSNumber numberWithInteger:[(BDSCloudSyncDiagnosticInfo *)self accountStatus]];
  [v3 setObject:v5 forKeyedSubscript:@"accountStatus"];

  uint64_t v6 = [(BDSCloudSyncDiagnosticInfo *)self container];
  [v3 setObject:v6 forKeyedSubscript:@"container"];

  unsigned int v7 = +[NSNumber numberWithBool:[(BDSCloudSyncDiagnosticInfo *)self gettingAccountInfo]];
  [v3 setObject:v7 forKeyedSubscript:@"gettingAccountInfo"];

  id v8 = [(BDSCloudSyncDiagnosticInfo *)self privateDatabaseInfo];
  id v9 = [v8 stateForLog];
  [v3 setObject:v9 forKeyedSubscript:@"privateDatabaseInfo"];

  uint64_t v10 = [(BDSCloudSyncDiagnosticInfo *)self privateDatabaseSyncEngineInfo];
  id v11 = [v10 stateForLog];
  [v3 setObject:v11 forKeyedSubscript:@"privateDatabaseSyncEngineInfo"];

  uint64_t v12 = [(BDSCloudSyncDiagnosticInfo *)self entityInfos];

  if (v12)
  {
    v13 = [(BDSCloudSyncDiagnosticInfo *)self entityInfos];
    uint64_t v14 = [v13 valueForKey:@"stateForLog"];
    [v3 setObject:v14 forKeyedSubscript:@"entityInfos"];
  }
  return (NSDictionary *)v3;
}

- (BOOL)enabledSync
{
  return self->_enabledSync;
}

- (void)setEnabledSync:(BOOL)a3
{
  self->_enabledSync = a3;
}

- (int64_t)accountStatus
{
  return self->_accountStatus;
}

- (void)setAccountStatus:(int64_t)a3
{
  self->_accountStatus = a3;
}

- (NSString)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (BOOL)gettingAccountInfo
{
  return self->_gettingAccountInfo;
}

- (void)setGettingAccountInfo:(BOOL)a3
{
  self->_gettingAccountInfo = a3;
}

- (BDSCloudSyncDiagnosticDatabaseInfo)privateDatabaseInfo
{
  return self->_privateDatabaseInfo;
}

- (void)setPrivateDatabaseInfo:(id)a3
{
}

- (BDSCloudSyncDiagnosticSyncEngineInfo)privateDatabaseSyncEngineInfo
{
  return self->_privateDatabaseSyncEngineInfo;
}

- (void)setPrivateDatabaseSyncEngineInfo:(id)a3
{
}

- (NSArray)entityInfos
{
  return self->_entityInfos;
}

- (void)setEntityInfos:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityInfos, 0);
  objc_storeStrong((id *)&self->_privateDatabaseSyncEngineInfo, 0);
  objc_storeStrong((id *)&self->_privateDatabaseInfo, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

@end