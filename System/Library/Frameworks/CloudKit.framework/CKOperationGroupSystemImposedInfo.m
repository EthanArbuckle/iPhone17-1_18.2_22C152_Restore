@interface CKOperationGroupSystemImposedInfo
+ (BOOL)supportsSecureCoding;
- (CKOperationGroupSystemImposedInfo)initWithCoder:(id)a3;
- (NSDictionary)networkServiceTypePerConfig;
- (int64_t)expectedReceiveSize;
- (int64_t)expectedSendSize;
- (void)encodeWithCoder:(id)a3;
- (void)setExpectedReceiveSize:(int64_t)a3;
- (void)setExpectedSendSize:(int64_t)a3;
- (void)setNetworkServiceTypePerConfig:(id)a3;
@end

@implementation CKOperationGroupSystemImposedInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v20 = a3;
  v4 = (void *)MEMORY[0x18C12ADA0]();
  v8 = objc_msgSend_networkServiceTypePerConfig(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v20, v9, (uint64_t)v8, @"ServiceTypePerConfig");

  uint64_t v13 = objc_msgSend_expectedSendSize(self, v10, v11, v12);
  objc_msgSend_encodeInt64_forKey_(v20, v14, v13, @"ExpectedSendSize");
  uint64_t v18 = objc_msgSend_expectedReceiveSize(self, v15, v16, v17);
  objc_msgSend_encodeInt64_forKey_(v20, v19, v18, @"ExpectedReceiveSize");
}

- (CKOperationGroupSystemImposedInfo)initWithCoder:(id)a3
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CKOperationGroupSystemImposedInfo;
  v5 = [(CKOperationGroupSystemImposedInfo *)&v21 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    v22[2] = objc_opt_class();
    v9 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v8, (uint64_t)v22, 3);
    uint64_t v12 = objc_msgSend_setWithArray_(v7, v10, (uint64_t)v9, v11);
    uint64_t v14 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, @"ServiceTypePerConfig");
    networkServiceTypePerConfig = v5->_networkServiceTypePerConfig;
    v5->_networkServiceTypePerConfig = (NSDictionary *)v14;

    v5->_expectedSendSize = objc_msgSend_decodeInt64ForKey_(v4, v16, @"ExpectedSendSize", v17);
    v5->_expectedReceiveSize = objc_msgSend_decodeInt64ForKey_(v4, v18, @"ExpectedReceiveSize", v19);
  }

  return v5;
}

- (NSDictionary)networkServiceTypePerConfig
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setNetworkServiceTypePerConfig:(id)a3
{
}

- (int64_t)expectedSendSize
{
  return self->_expectedSendSize;
}

- (void)setExpectedSendSize:(int64_t)a3
{
  self->_expectedSendSize = a3;
}

- (int64_t)expectedReceiveSize
{
  return self->_expectedReceiveSize;
}

- (void)setExpectedReceiveSize:(int64_t)a3
{
  self->_expectedReceiveSize = a3;
}

- (void).cxx_destruct
{
}

@end