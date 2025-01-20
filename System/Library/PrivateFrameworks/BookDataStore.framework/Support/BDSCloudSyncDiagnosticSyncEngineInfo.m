@interface BDSCloudSyncDiagnosticSyncEngineInfo
+ (BOOL)supportsSecureCoding;
- (BDSCloudSyncDiagnosticSyncEngineInfo)initWithCoder:(id)a3;
- (BDSCloudSyncDiagnosticSyncEngineInfo)initWithEstablishedSalt:(BOOL)a3;
- (BOOL)establishedSalt;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)stateForLog;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setEstablishedSalt:(BOOL)a3;
@end

@implementation BDSCloudSyncDiagnosticSyncEngineInfo

- (BDSCloudSyncDiagnosticSyncEngineInfo)initWithEstablishedSalt:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BDSCloudSyncDiagnosticSyncEngineInfo;
  result = [(BDSCloudSyncDiagnosticSyncEngineInfo *)&v5 init];
  if (result) {
    result->_establishedSalt = a3;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    id v5 = a3;
    objc_opt_class();
    v4 = BUDynamicCast();

    LOBYTE(v5) = 0;
    if (self && v4)
    {
      unsigned int v6 = [(BDSCloudSyncDiagnosticSyncEngineInfo *)self establishedSalt];
      LODWORD(v5) = v6 ^ [v4 establishedSalt] ^ 1;
    }
  }
  return (char)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BDSCloudSyncDiagnosticSyncEngineInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(BDSCloudSyncDiagnosticSyncEngineInfo *)self init];
  if (v5) {
    v5->_establishedSalt = [v4 decodeBoolForKey:@"establishedSalt"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[BDSCloudSyncDiagnosticSyncEngineInfo establishedSalt](self, "establishedSalt"), @"establishedSalt");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(BDSCloudSyncDiagnosticSyncEngineInfo);
  if (v4) {
    [(BDSCloudSyncDiagnosticSyncEngineInfo *)v4 setEstablishedSalt:[(BDSCloudSyncDiagnosticSyncEngineInfo *)self establishedSalt]];
  }
  return v4;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@: establishedSalt:%d>", objc_opt_class(), [(BDSCloudSyncDiagnosticSyncEngineInfo *)self establishedSalt]];
}

- (NSDictionary)stateForLog
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = +[NSNumber numberWithBool:[(BDSCloudSyncDiagnosticSyncEngineInfo *)self establishedSalt]];
  [v3 setObject:v4 forKeyedSubscript:@"establishedSalt"];

  return (NSDictionary *)v3;
}

- (BOOL)establishedSalt
{
  return self->_establishedSalt;
}

- (void)setEstablishedSalt:(BOOL)a3
{
  self->_establishedSalt = a3;
}

@end