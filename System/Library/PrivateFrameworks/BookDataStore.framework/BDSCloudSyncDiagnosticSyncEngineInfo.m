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
    LOBYTE(v12) = 1;
  }
  else
  {
    id v12 = a3;
    objc_opt_class();
    v4 = BUDynamicCast();

    LOBYTE(v12) = 0;
    if (self && v4)
    {
      int v13 = objc_msgSend_establishedSalt(self, v5, v6, v7, v8, v9, v10, v11);
      LODWORD(v12) = v13 ^ objc_msgSend_establishedSalt(v4, v14, v15, v16, v17, v18, v19, v20) ^ 1;
    }
  }
  return (char)v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BDSCloudSyncDiagnosticSyncEngineInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v18 = (BDSCloudSyncDiagnosticSyncEngineInfo *)objc_msgSend_init(self, v5, v6, v7, v8, v9, v10, v11);
  if (v18) {
    v18->_establishedSalt = objc_msgSend_decodeBoolForKey_(v4, v12, @"establishedSalt", v13, v14, v15, v16, v17);
  }

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v17 = a3;
  uint64_t v11 = objc_msgSend_establishedSalt(self, v4, v5, v6, v7, v8, v9, v10);
  objc_msgSend_encodeBool_forKey_(v17, v12, v11, @"establishedSalt", v13, v14, v15, v16);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v11 = objc_alloc_init(BDSCloudSyncDiagnosticSyncEngineInfo);
  if (v11)
  {
    uint64_t v12 = objc_msgSend_establishedSalt(self, v4, v5, v6, v7, v8, v9, v10);
    objc_msgSend_setEstablishedSalt_(v11, v13, v12, v14, v15, v16, v17, v18);
  }
  return v11;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unsigned int v12 = objc_msgSend_establishedSalt(self, v5, v6, v7, v8, v9, v10, v11);
  return (id)objc_msgSend_stringWithFormat_(v3, v13, @"<%@: establishedSalt:%d>", v14, v15, v16, v17, v18, v4, v12);
}

- (NSDictionary)stateForLog
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v4 = NSNumber;
  uint64_t v12 = objc_msgSend_establishedSalt(self, v5, v6, v7, v8, v9, v10, v11);
  uint64_t v19 = objc_msgSend_numberWithBool_(v4, v13, v12, v14, v15, v16, v17, v18);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v20, (uint64_t)v19, @"establishedSalt", v21, v22, v23, v24);

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