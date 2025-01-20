@interface GEONavdClientInfo
+ (BOOL)supportsSecureCoding;
+ (id)clientInfoForNavdPredictions;
- (BOOL)isCalendarClientInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNavdClientInfo;
- (GEOApplicationAuditToken)auditToken;
- (GEONavdClientInfo)initWithCanonicalName:(id)a3 instanceId:(unint64_t)a4;
- (GEONavdClientInfo)initWithCanonicalName:(id)a3 instanceId:(unint64_t)a4 auditToken:(id)a5;
- (GEONavdClientInfo)initWithCoder:(id)a3;
- (NSString)canonicalName;
- (NSString)uniqueClientId;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAuditToken:(id)a3;
- (void)setCanonicalName:(id)a3;
- (void)setUniqueClientId:(id)a3;
@end

@implementation GEONavdClientInfo

- (GEONavdClientInfo)initWithCanonicalName:(id)a3 instanceId:(unint64_t)a4 auditToken:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v22.receiver = self;
  v22.super_class = (Class)GEONavdClientInfo;
  v10 = [(GEONavdClientInfo *)&v22 init];
  if (v10)
  {
    id v11 = [NSString alloc];
    v12 = [MEMORY[0x1E4F28F80] processInfo];
    uint64_t v13 = [v12 processIdentifier];
    v14 = [MEMORY[0x1E4F28F80] processInfo];
    v15 = [v14 processName];
    uint64_t v16 = [v11 initWithFormat:@"%@-%d-%@", v8, v13, v15];
    canonicalName = v10->_canonicalName;
    v10->_canonicalName = (NSString *)v16;

    uint64_t v18 = [[NSString alloc] initWithFormat:@"%lu-%@", a4, v10->_canonicalName];
    uniqueClientId = v10->_uniqueClientId;
    v10->_uniqueClientId = (NSString *)v18;

    objc_storeStrong((id *)&v10->_auditToken, a5);
    v20 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEONavdClientInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEONavdClientInfo;
  v5 = [(GEONavdClientInfo *)&v15 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GEONavdClientInfoCanonicalNameKey"];
    uint64_t v7 = [v6 copy];
    canonicalName = v5->_canonicalName;
    v5->_canonicalName = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GEONavdClientInfoUniqueClientIdKey"];
    uint64_t v10 = [v9 copy];
    uniqueClientId = v5->_uniqueClientId;
    v5->_uniqueClientId = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GEONavdClientInfoUniqueAuditTokenKey"];
    auditToken = v5->_auditToken;
    v5->_auditToken = (GEOApplicationAuditToken *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(GEONavdClientInfo *)self canonicalName];
  [v4 encodeObject:v5 forKey:@"GEONavdClientInfoCanonicalNameKey"];

  v6 = [(GEONavdClientInfo *)self uniqueClientId];
  [v4 encodeObject:v6 forKey:@"GEONavdClientInfoUniqueClientIdKey"];

  id v7 = [(GEONavdClientInfo *)self auditToken];
  [v4 encodeObject:v7 forKey:@"GEONavdClientInfoUniqueAuditTokenKey"];
}

- (GEONavdClientInfo)initWithCanonicalName:(id)a3 instanceId:(unint64_t)a4
{
  v6 = (void *)MEMORY[0x1E4F28F80];
  id v7 = a3;
  id v8 = [v6 processInfo];
  id v9 = [v8 processName];

  if ([v9 isEqualToString:@"navd"])
  {
    uint64_t v10 = +[GEOApplicationAuditToken currentProcessAuditToken];
    id v11 = [(GEONavdClientInfo *)self initWithCanonicalName:v7 instanceId:a4 auditToken:v10];

    uint64_t v12 = v11;
  }
  else
  {
    uint64_t v13 = [GEOApplicationAuditToken alloc];
    uint64_t v10 = [MEMORY[0x1E4F28B50] mainBundle];
    v14 = [v10 bundleIdentifier];
    objc_super v15 = [(GEOApplicationAuditToken *)v13 initWithProxiedExternalApplicationBundleId:v14];
    uint64_t v16 = [(GEONavdClientInfo *)self initWithCanonicalName:v7 instanceId:a4 auditToken:v15];

    uint64_t v12 = v16;
  }

  return v12;
}

+ (id)clientInfoForNavdPredictions
{
  if (qword_1EB29FEC0 != -1) {
    dispatch_once(&qword_1EB29FEC0, &__block_literal_global_125);
  }
  v2 = (void *)_MergedGlobals_268;

  return v2;
}

void __49__GEONavdClientInfo_clientInfoForNavdPredictions__block_invoke()
{
  v0 = [[GEONavdClientInfo alloc] initWithCanonicalName:@"com.apple.navd.predictions" instanceId:0];
  v1 = (void *)_MergedGlobals_268;
  _MergedGlobals_268 = (uint64_t)v0;
}

- (BOOL)isCalendarClientInfo
{
  return [(NSString *)self->_canonicalName containsString:@"calaccessd"];
}

- (BOOL)isNavdClientInfo
{
  return [(NSString *)self->_canonicalName containsString:@"com.apple.navd.predictions"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 canonicalName];
    id v7 = [(GEONavdClientInfo *)self canonicalName];
    if ([v6 isEqualToString:v7])
    {
      id v8 = [v5 uniqueClientId];
      id v9 = [(GEONavdClientInfo *)self uniqueClientId];
      char v10 = [v8 isEqualToString:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[GEONavdClientInfo allocWithZone:a3] init];
  [(GEONavdClientInfo *)v4 setCanonicalName:self->_canonicalName];
  [(GEONavdClientInfo *)v4 setUniqueClientId:self->_uniqueClientId];
  [(GEONavdClientInfo *)v4 setAuditToken:self->_auditToken];
  return v4;
}

- (unint64_t)hash
{
  return [(NSString *)self->_uniqueClientId hash];
}

- (NSString)canonicalName
{
  return self->_canonicalName;
}

- (void)setCanonicalName:(id)a3
{
}

- (NSString)uniqueClientId
{
  return self->_uniqueClientId;
}

- (void)setUniqueClientId:(id)a3
{
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (void)setAuditToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_uniqueClientId, 0);

  objc_storeStrong((id *)&self->_canonicalName, 0);
}

@end