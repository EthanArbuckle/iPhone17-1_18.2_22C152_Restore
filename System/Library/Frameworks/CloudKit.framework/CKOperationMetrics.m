@interface CKOperationMetrics
+ (BOOL)supportsSecureCoding;
- (CKMetric)MMCSMetrics;
- (CKMetric)cloudKitMetrics;
- (CKOperationMetrics)initWithCloudKitMetrics:(id)a3 MMCSMetrics:(id)a4;
- (CKOperationMetrics)initWithCoder:(id)a3;
- (id)CKPropertiesDescription;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKOperationMetrics

- (CKOperationMetrics)initWithCloudKitMetrics:(id)a3 MMCSMetrics:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CKOperationMetrics;
  v11 = [(CKOperationMetrics *)&v20 init];
  if (v11)
  {
    uint64_t v12 = objc_msgSend_copy(v6, v8, v9, v10);
    cloudKitMetrics = v11->_cloudKitMetrics;
    v11->_cloudKitMetrics = (CKMetric *)v12;

    uint64_t v17 = objc_msgSend_copy(v7, v14, v15, v16);
    MMCSMetrics = v11->_MMCSMetrics;
    v11->_MMCSMetrics = (CKMetric *)v17;
  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_MMCSMetrics(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, @"MMCSMetrics");

  objc_msgSend_cloudKitMetrics(self, v10, v11, v12);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)v14, @"CloudKitMetrics");
}

- (CKOperationMetrics)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKOperationMetrics;
  v5 = [(CKOperationMetrics *)&v15 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"MMCSMetrics");
    MMCSMetrics = v5->_MMCSMetrics;
    v5->_MMCSMetrics = (CKMetric *)v8;

    uint64_t v10 = objc_opt_class();
    uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, @"CloudKitMetrics");
    cloudKitMetrics = v5->_cloudKitMetrics;
    v5->_cloudKitMetrics = (CKMetric *)v12;
  }
  return v5;
}

- (id)CKPropertiesDescription
{
  v3 = objc_opt_new();
  uint64_t v7 = objc_msgSend_cloudKitMetrics(self, v4, v5, v6);

  if (v7)
  {
    uint64_t v11 = NSString;
    uint64_t v12 = objc_msgSend_cloudKitMetrics(self, v8, v9, v10);
    objc_super v15 = objc_msgSend_stringWithFormat_(v11, v13, @"cloudKitMetrics=%@", v14, v12);
    objc_msgSend_addObject_(v3, v16, (uint64_t)v15, v17);
  }
  v18 = objc_msgSend_MMCSMetrics(self, v8, v9, v10);

  if (v18)
  {
    v22 = NSString;
    v23 = objc_msgSend_MMCSMetrics(self, v19, v20, v21);
    v26 = objc_msgSend_stringWithFormat_(v22, v24, @"MMCSMetrics=%@", v25, v23);
    objc_msgSend_addObject_(v3, v27, (uint64_t)v26, v28);
  }
  v29 = objc_msgSend_componentsJoinedByString_(v3, v19, @", ", v21);

  return v29;
}

- (id)description
{
  return (id)((uint64_t (*)(CKOperationMetrics *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (CKMetric)cloudKitMetrics
{
  return self->_cloudKitMetrics;
}

- (CKMetric)MMCSMetrics
{
  return self->_MMCSMetrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_MMCSMetrics, 0);

  objc_storeStrong((id *)&self->_cloudKitMetrics, 0);
}

@end