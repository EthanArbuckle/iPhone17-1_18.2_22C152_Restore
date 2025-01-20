@interface BDSCloudSyncDiagnosticEntityInfo
+ (BOOL)supportsSecureCoding;
- (BDSCloudSyncDiagnosticEntityInfo)initWithCoder:(id)a3;
- (BDSCloudSyncDiagnosticEntityInfo)initWithName:(id)a3 enabledSync:(BOOL)a4 dirtyCloudDataInfos:(id)a5;
- (BOOL)enabledSync;
- (BOOL)isEqual:(id)a3;
- (NSArray)dirtyCloudDataInfos;
- (NSDictionary)stateForLog;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDirtyCloudDataInfos:(id)a3;
- (void)setEnabledSync:(BOOL)a3;
- (void)setName:(id)a3;
@end

@implementation BDSCloudSyncDiagnosticEntityInfo

- (BDSCloudSyncDiagnosticEntityInfo)initWithName:(id)a3 enabledSync:(BOOL)a4 dirtyCloudDataInfos:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BDSCloudSyncDiagnosticEntityInfo;
  v11 = [(BDSCloudSyncDiagnosticEntityInfo *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_name, a3);
    v12->_enabledSync = a4;
    objc_storeStrong((id *)&v12->_dirtyCloudDataInfos, a5);
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  if (self != a3)
  {
    id v4 = a3;
    objc_opt_class();
    v5 = BUDynamicCast();

    unsigned __int8 v6 = 0;
    if (!self || !v5) {
      goto LABEL_15;
    }
    v7 = [(BDSCloudSyncDiagnosticEntityInfo *)self name];
    uint64_t v8 = [v5 name];
    if (v7 == (void *)v8)
    {
    }
    else
    {
      id v9 = (void *)v8;
      id v10 = [(BDSCloudSyncDiagnosticEntityInfo *)self name];
      v11 = [v5 name];
      unsigned int v12 = [v10 isEqual:v11];

      if (!v12)
      {
LABEL_10:
        unsigned __int8 v6 = 0;
LABEL_15:

        return v6;
      }
    }
    unsigned int v13 = [(BDSCloudSyncDiagnosticEntityInfo *)self enabledSync];
    if (v13 == [v5 enabledSync])
    {
      objc_super v14 = [(BDSCloudSyncDiagnosticEntityInfo *)self dirtyCloudDataInfos];
      v15 = [v5 dirtyCloudDataInfos];
      if (v14 == v15)
      {
        unsigned __int8 v6 = 1;
      }
      else
      {
        v16 = [(BDSCloudSyncDiagnosticEntityInfo *)self dirtyCloudDataInfos];
        v17 = [v5 dirtyCloudDataInfos];
        unsigned __int8 v6 = [v16 isEqualToArray:v17];
      }
      goto LABEL_15;
    }
    goto LABEL_10;
  }
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BDSCloudSyncDiagnosticEntityInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(BDSCloudSyncDiagnosticEntityInfo *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v5->_enabledSync = [v4 decodeBoolForKey:@"enabledSync"];
    uint64_t v8 = objc_opt_class();
    id v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"dirtyCloudDataInfos"];
    dirtyCloudDataInfos = v5->_dirtyCloudDataInfos;
    v5->_dirtyCloudDataInfos = (NSArray *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(BDSCloudSyncDiagnosticEntityInfo *)self name];
  [v4 encodeObject:v5 forKey:@"name"];

  objc_msgSend(v4, "encodeBool:forKey:", -[BDSCloudSyncDiagnosticEntityInfo enabledSync](self, "enabledSync"), @"enabledSync");
  id v6 = [(BDSCloudSyncDiagnosticEntityInfo *)self dirtyCloudDataInfos];
  [v4 encodeObject:v6 forKey:@"dirtyCloudDataInfos"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(BDSCloudSyncDiagnosticEntityInfo);
  if (v4)
  {
    v5 = [(BDSCloudSyncDiagnosticEntityInfo *)self name];
    id v6 = [v5 copy];
    [(BDSCloudSyncDiagnosticEntityInfo *)v4 setName:v6];

    [(BDSCloudSyncDiagnosticEntityInfo *)v4 setEnabledSync:[(BDSCloudSyncDiagnosticEntityInfo *)self enabledSync]];
    v7 = [(BDSCloudSyncDiagnosticEntityInfo *)self dirtyCloudDataInfos];
    id v8 = [v7 copy];
    [(BDSCloudSyncDiagnosticEntityInfo *)v4 setDirtyCloudDataInfos:v8];
  }
  return v4;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(BDSCloudSyncDiagnosticEntityInfo *)self name];
  unsigned int v5 = [(BDSCloudSyncDiagnosticEntityInfo *)self enabledSync];
  id v6 = [(BDSCloudSyncDiagnosticEntityInfo *)self dirtyCloudDataInfos];
  id v7 = [v6 count];
  id v8 = [(BDSCloudSyncDiagnosticEntityInfo *)self dirtyCloudDataInfos];
  id v9 = +[NSString stringWithFormat:@"<%@: name:%@, enabledSync:%d, dirtyInfos(count=%lu):%@>", v3, v4, v5, v7, v8];

  return v9;
}

- (NSDictionary)stateForLog
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(BDSCloudSyncDiagnosticEntityInfo *)self name];
  [v3 setObject:v4 forKeyedSubscript:@"name"];

  unsigned int v5 = +[NSNumber numberWithBool:[(BDSCloudSyncDiagnosticEntityInfo *)self enabledSync]];
  [v3 setObject:v5 forKeyedSubscript:@"enabledSync"];

  id v6 = [(BDSCloudSyncDiagnosticEntityInfo *)self dirtyCloudDataInfos];

  if (v6)
  {
    id v7 = [(BDSCloudSyncDiagnosticEntityInfo *)self dirtyCloudDataInfos];
    id v8 = [v7 valueForKey:@"stateForLog"];
    [v3 setObject:v8 forKeyedSubscript:@"dirtyCloudDataInfos"];
  }
  return (NSDictionary *)v3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BOOL)enabledSync
{
  return self->_enabledSync;
}

- (void)setEnabledSync:(BOOL)a3
{
  self->_enabledSync = a3;
}

- (NSArray)dirtyCloudDataInfos
{
  return self->_dirtyCloudDataInfos;
}

- (void)setDirtyCloudDataInfos:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dirtyCloudDataInfos, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end