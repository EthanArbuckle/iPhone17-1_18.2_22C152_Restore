@interface CKDOperationCombinedMetrics
+ (BOOL)supportsSecureCoding;
- (CKDOperationCombinedMetrics)initWithCloudKitMetrics:(id)a3 andMMCSMetrics:(id)a4;
- (CKDOperationCombinedMetrics)initWithCoder:(id)a3;
- (CKDOperationMetrics)MMCSMetrics;
- (CKDOperationMetrics)cloudKitMetrics;
- (id)CKPropertiesDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKDOperationCombinedMetrics

- (CKDOperationCombinedMetrics)initWithCloudKitMetrics:(id)a3 andMMCSMetrics:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CKDOperationCombinedMetrics;
  v8 = [(CKDOperationCombinedMetrics *)&v19 init];
  if (v8)
  {
    v9 = (void *)MEMORY[0x1C8789E70]();
    uint64_t v12 = objc_msgSend_copy(v6, v10, v11);
    cloudKitMetrics = v8->_cloudKitMetrics;
    v8->_cloudKitMetrics = (CKDOperationMetrics *)v12;

    uint64_t v16 = objc_msgSend_copy(v7, v14, v15);
    MMCSMetrics = v8->_MMCSMetrics;
    v8->_MMCSMetrics = (CKDOperationMetrics *)v16;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v13 = a3;
  v4 = (void *)MEMORY[0x1C8789E70]();
  id v7 = objc_msgSend_MMCSMetrics(self, v5, v6);
  objc_msgSend_encodeObject_forKey_(v13, v8, (uint64_t)v7, @"MMCSMetrics");

  uint64_t v11 = objc_msgSend_cloudKitMetrics(self, v9, v10);
  objc_msgSend_encodeObject_forKey_(v13, v12, (uint64_t)v11, @"CloudKitMetrics");
}

- (CKDOperationCombinedMetrics)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKDOperationCombinedMetrics;
  v5 = [(CKDOperationCombinedMetrics *)&v15 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"MMCSMetrics");
    MMCSMetrics = v5->_MMCSMetrics;
    v5->_MMCSMetrics = (CKDOperationMetrics *)v8;

    uint64_t v10 = objc_opt_class();
    uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, @"CloudKitMetrics");
    cloudKitMetrics = v5->_cloudKitMetrics;
    v5->_cloudKitMetrics = (CKDOperationMetrics *)v12;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(CKDOperationCombinedMetrics);
  id v7 = objc_msgSend_cloudKitMetrics(self, v5, v6);
  uint64_t v10 = objc_msgSend_copy(v7, v8, v9);
  cloudKitMetrics = v4->_cloudKitMetrics;
  v4->_cloudKitMetrics = (CKDOperationMetrics *)v10;

  v14 = objc_msgSend_MMCSMetrics(self, v12, v13);
  uint64_t v17 = objc_msgSend_copy(v14, v15, v16);
  MMCSMetrics = v4->_MMCSMetrics;
  v4->_MMCSMetrics = (CKDOperationMetrics *)v17;

  return v4;
}

- (id)CKPropertiesDescription
{
  v3 = objc_opt_new();
  uint64_t v6 = objc_msgSend_cloudKitMetrics(self, v4, v5);

  if (v6)
  {
    uint64_t v9 = NSString;
    uint64_t v10 = objc_msgSend_cloudKitMetrics(self, v7, v8);
    uint64_t v12 = objc_msgSend_stringWithFormat_(v9, v11, @"cloudKitMetrics=%@", v10);
    objc_msgSend_addObject_(v3, v13, (uint64_t)v12);
  }
  v14 = objc_msgSend_MMCSMetrics(self, v7, v8);

  if (v14)
  {
    uint64_t v17 = NSString;
    v18 = objc_msgSend_MMCSMetrics(self, v15, v16);
    v20 = objc_msgSend_stringWithFormat_(v17, v19, @"MMCSMetrics=%@", v18);
    objc_msgSend_addObject_(v3, v21, (uint64_t)v20);
  }
  v22 = objc_msgSend_componentsJoinedByString_(v3, v15, @", ");

  return v22;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDOperationCombinedMetrics *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (CKDOperationMetrics)cloudKitMetrics
{
  return self->_cloudKitMetrics;
}

- (CKDOperationMetrics)MMCSMetrics
{
  return self->_MMCSMetrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_MMCSMetrics, 0);
  objc_storeStrong((id *)&self->_cloudKitMetrics, 0);
}

@end