@interface BDSCloudSyncDiagnosticDatabaseInfo
+ (BOOL)supportsSecureCoding;
- (BDSCloudSyncDiagnosticDatabaseInfo)initWithAttached:(BOOL)a3 establishedSalt:(BOOL)a4 container:(id)a5;
- (BDSCloudSyncDiagnosticDatabaseInfo)initWithCoder:(id)a3;
- (BOOL)attached;
- (BOOL)establishedSalt;
- (NSDictionary)stateForLog;
- (NSString)container;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAttached:(BOOL)a3;
- (void)setContainer:(id)a3;
- (void)setEstablishedSalt:(BOOL)a3;
@end

@implementation BDSCloudSyncDiagnosticDatabaseInfo

- (BDSCloudSyncDiagnosticDatabaseInfo)initWithAttached:(BOOL)a3 establishedSalt:(BOOL)a4 container:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)BDSCloudSyncDiagnosticDatabaseInfo;
  v10 = [(BDSCloudSyncDiagnosticDatabaseInfo *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_attached = a3;
    v10->_establishedSalt = a4;
    objc_storeStrong((id *)&v10->_container, a5);
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BDSCloudSyncDiagnosticDatabaseInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(BDSCloudSyncDiagnosticDatabaseInfo *)self init];
  if (v5)
  {
    v5->_attached = [v4 decodeBoolForKey:@"attached"];
    v5->_establishedSalt = [v4 decodeBoolForKey:@"establishedSalt"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"container"];
    container = v5->_container;
    v5->_container = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[BDSCloudSyncDiagnosticDatabaseInfo attached](self, "attached"), @"attached");
  objc_msgSend(v4, "encodeBool:forKey:", -[BDSCloudSyncDiagnosticDatabaseInfo establishedSalt](self, "establishedSalt"), @"establishedSalt");
  id v5 = [(BDSCloudSyncDiagnosticDatabaseInfo *)self container];
  [v4 encodeObject:v5 forKey:@"container"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(BDSCloudSyncDiagnosticDatabaseInfo);
  if (v4)
  {
    [(BDSCloudSyncDiagnosticDatabaseInfo *)v4 setAttached:[(BDSCloudSyncDiagnosticDatabaseInfo *)self attached]];
    [(BDSCloudSyncDiagnosticDatabaseInfo *)v4 setEstablishedSalt:[(BDSCloudSyncDiagnosticDatabaseInfo *)self establishedSalt]];
    id v5 = [(BDSCloudSyncDiagnosticDatabaseInfo *)self container];
    [(BDSCloudSyncDiagnosticDatabaseInfo *)v4 setContainer:v5];
  }
  return v4;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  unsigned int v4 = [(BDSCloudSyncDiagnosticDatabaseInfo *)self attached];
  unsigned int v5 = [(BDSCloudSyncDiagnosticDatabaseInfo *)self establishedSalt];
  uint64_t v6 = [(BDSCloudSyncDiagnosticDatabaseInfo *)self container];
  v7 = +[NSString stringWithFormat:@"<%@: attached:%d, establishedSalt:%d, container:%@>", v3, v4, v5, v6];

  return v7;
}

- (NSDictionary)stateForLog
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned int v4 = +[NSNumber numberWithBool:[(BDSCloudSyncDiagnosticDatabaseInfo *)self attached]];
  [v3 setObject:v4 forKeyedSubscript:@"attached"];

  unsigned int v5 = +[NSNumber numberWithBool:[(BDSCloudSyncDiagnosticDatabaseInfo *)self establishedSalt]];
  [v3 setObject:v5 forKeyedSubscript:@"establishedSalt"];

  uint64_t v6 = [(BDSCloudSyncDiagnosticDatabaseInfo *)self container];
  v7 = (void *)v6;
  if (v6) {
    CFStringRef v8 = (const __CFString *)v6;
  }
  else {
    CFStringRef v8 = @"<nil>";
  }
  [v3 setObject:v8 forKeyedSubscript:@"container"];

  return (NSDictionary *)v3;
}

- (BOOL)attached
{
  return self->_attached;
}

- (void)setAttached:(BOOL)a3
{
  self->_attached = a3;
}

- (BOOL)establishedSalt
{
  return self->_establishedSalt;
}

- (void)setEstablishedSalt:(BOOL)a3
{
  self->_establishedSalt = a3;
}

- (NSString)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end