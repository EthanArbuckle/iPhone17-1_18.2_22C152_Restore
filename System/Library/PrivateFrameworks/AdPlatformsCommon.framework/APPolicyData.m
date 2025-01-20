@interface APPolicyData
+ (BOOL)supportsSecureCoding;
- (APPolicyData)initWithCoder:(id)a3;
- (BOOL)isEqualToAPPolicyData:(id)a3;
- (NSDictionary)policyValue;
- (NSString)creativeIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setCreativeIdentifier:(id)a3;
- (void)setPolicyValue:(id)a3;
@end

@implementation APPolicyData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (APPolicyData)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)APPolicyData;
  v5 = [(APPolicyData *)&v30 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v11 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"creativeIdentifier", v8, v9, v10);
    creativeIdentifier = v5->_creativeIdentifier;
    v5->_creativeIdentifier = (NSString *)v11;

    v13 = (void *)MEMORY[0x263EFFA08];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    v22 = objc_msgSend_setWithObjects_(v13, v17, v14, v18, v19, v20, v21, v15, v16, 0);
    uint64_t v27 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v23, (uint64_t)v22, @"policyValue", v24, v25, v26);
    policyValue = v5->_policyValue;
    v5->_policyValue = (NSDictionary *)v27;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  creativeIdentifier = self->_creativeIdentifier;
  id v13 = a3;
  objc_msgSend_encodeObject_forKey_(v13, v5, (uint64_t)creativeIdentifier, @"creativeIdentifier", v6, v7, v8);
  objc_msgSend_encodeObject_forKey_(v13, v9, (uint64_t)self->_policyValue, @"policyValue", v10, v11, v12);
}

- (BOOL)isEqualToAPPolicyData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v11 = objc_msgSend_creativeIdentifier(self, v5, v6, v7, v8, v9, v10);
    uint64_t v18 = objc_msgSend_creativeIdentifier(v4, v12, v13, v14, v15, v16, v17);
    if (objc_msgSend_isEqualToString_(v11, v19, (uint64_t)v18, v20, v21, v22, v23))
    {
      objc_super v30 = objc_msgSend_policyValue(self, v24, v25, v26, v27, v28, v29);
      v37 = objc_msgSend_policyValue(v4, v31, v32, v33, v34, v35, v36);
      char isEqualToDictionary = objc_msgSend_isEqualToDictionary_(v30, v38, (uint64_t)v37, v39, v40, v41, v42);
    }
    else
    {
      char isEqualToDictionary = 0;
    }
  }
  else
  {
    char isEqualToDictionary = 0;
  }

  return isEqualToDictionary;
}

- (NSString)creativeIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCreativeIdentifier:(id)a3
{
}

- (NSDictionary)policyValue
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPolicyValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policyValue, 0);
  objc_storeStrong((id *)&self->_creativeIdentifier, 0);
}

@end