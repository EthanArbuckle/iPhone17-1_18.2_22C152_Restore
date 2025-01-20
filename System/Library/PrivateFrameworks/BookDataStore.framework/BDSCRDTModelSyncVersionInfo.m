@interface BDSCRDTModelSyncVersionInfo
+ (BOOL)supportsSecureCoding;
- (BDSCRDTModelSyncVersionInfo)initWithCoder:(id)a3;
- (BDSCRDTModelSyncVersionInfo)initWithData:(id)a3;
- (NSData)data;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
@end

@implementation BDSCRDTModelSyncVersionInfo

- (BDSCRDTModelSyncVersionInfo)initWithData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BDSCRDTModelSyncVersionInfo;
  v6 = [(BDSCRDTModelSyncVersionInfo *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_data, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BDSCRDTModelSyncVersionInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v12 = (BDSCRDTModelSyncVersionInfo *)objc_msgSend_init(self, v5, v6, v7, v8, v9, v10, v11);
  if (v12)
  {
    uint64_t v13 = objc_opt_class();
    uint64_t v19 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, @"data", v15, v16, v17, v18);
    data = v12->_data;
    v12->_data = (NSData *)v19;
  }
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend_data(self, v5, v6, v7, v8, v9, v10, v11);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v17, @"data", v13, v14, v15, v16);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v11 = objc_alloc_init(BDSCRDTModelSyncVersionInfo);
  if (v11)
  {
    v12 = objc_msgSend_data(self, v4, v5, v6, v7, v8, v9, v10);
    objc_msgSend_setData_(v11, v13, (uint64_t)v12, v14, v15, v16, v17, v18);
  }
  return v11;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end