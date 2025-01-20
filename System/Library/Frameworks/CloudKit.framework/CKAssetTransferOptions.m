@interface CKAssetTransferOptions
+ (BOOL)supportsSecureCoding;
- (CKAssetTransferOptions)initWithCoder:(id)a3;
- (NSNumber)shouldFetchAssetContent;
- (NSNumber)shouldFetchAssetContentInMemory;
- (NSNumber)sparseAware;
- (NSNumber)useMMCSEncryptionV2;
- (id)CKPropertiesDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setShouldFetchAssetContent:(id)a3;
- (void)setShouldFetchAssetContentInMemory:(id)a3;
- (void)setSparseAware:(id)a3;
- (void)setUseMMCSEncryptionV2:(id)a3;
@end

@implementation CKAssetTransferOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v25 = a3;
  v4 = (void *)MEMORY[0x18C12ADA0]();
  v8 = objc_msgSend_sparseAware(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v25, v9, (uint64_t)v8, @"AssetTransferOptionSparseAware");

  v13 = objc_msgSend_shouldFetchAssetContent(self, v10, v11, v12);
  objc_msgSend_encodeObject_forKey_(v25, v14, (uint64_t)v13, @"AssetTransferOptionShouldFetchAssetContent");

  v18 = objc_msgSend_shouldFetchAssetContentInMemory(self, v15, v16, v17);
  objc_msgSend_encodeObject_forKey_(v25, v19, (uint64_t)v18, @"AssetTransferOptionShouldFetchAssetContentInMemory");

  v23 = objc_msgSend_useMMCSEncryptionV2(self, v20, v21, v22);
  objc_msgSend_encodeObject_forKey_(v25, v24, (uint64_t)v23, @"AssetTransferOptionUseMMCSEncryptionV2");
}

- (CKAssetTransferOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CKAssetTransferOptions;
  v5 = [(CKAssetTransferOptions *)&v24 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"AssetTransferOptionSparseAware");
    sparseAware = v5->_sparseAware;
    v5->_sparseAware = (NSNumber *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v13 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"AssetTransferOptionShouldFetchAssetContent");
    shouldFetchAssetContent = v5->_shouldFetchAssetContent;
    v5->_shouldFetchAssetContent = (NSNumber *)v13;

    uint64_t v15 = objc_opt_class();
    uint64_t v17 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, @"AssetTransferOptionShouldFetchAssetContentInMemory");
    shouldFetchAssetContentInMemory = v5->_shouldFetchAssetContentInMemory;
    v5->_shouldFetchAssetContentInMemory = (NSNumber *)v17;

    uint64_t v19 = objc_opt_class();
    uint64_t v21 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, @"AssetTransferOptionUseMMCSEncryptionV2");
    useMMCSEncryptionV2 = v5->_useMMCSEncryptionV2;
    v5->_useMMCSEncryptionV2 = (NSNumber *)v21;
  }

  return v5;
}

- (id)CKPropertiesDescription
{
  id v4 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], a2, 6, v2);
  uint64_t v7 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v5, 3, v6);
  uint64_t v11 = objc_msgSend_sparseAware(self, v8, v9, v10);
  int v15 = objc_msgSend_BOOLValue(v11, v12, v13, v14);

  if (v15) {
    objc_msgSend_addObject_(v7, v16, @"sparse-aware", v18);
  }
  uint64_t v19 = objc_msgSend_shouldFetchAssetContent(self, v16, v17, v18);
  int v23 = objc_msgSend_BOOLValue(v19, v20, v21, v22);

  if (v23) {
    objc_msgSend_addObject_(v7, v24, @"fetch-asset-content", v26);
  }
  v27 = objc_msgSend_shouldFetchAssetContentInMemory(self, v24, v25, v26);
  int v31 = objc_msgSend_BOOLValue(v27, v28, v29, v30);

  if (v31) {
    objc_msgSend_addObject_(v7, v32, @"fetch-asset-content-in-memory", v34);
  }
  v35 = objc_msgSend_useMMCSEncryptionV2(self, v32, v33, v34);
  v39 = v35;
  if (v35)
  {
    if (objc_msgSend_BOOLValue(v35, v36, v37, v38)) {
      objc_msgSend_addObject_(v7, v40, @"force-v2-encryption", v41);
    }
    else {
      objc_msgSend_addObject_(v7, v40, @"force-v1-encryption", v41);
    }
  }
  if (objc_msgSend_count(v7, v36, v37, v38))
  {
    v44 = NSString;
    v45 = objc_msgSend_componentsJoinedByString_(v7, v42, @"|", v43);
    v48 = objc_msgSend_stringWithFormat_(v44, v46, @"flags=%@", v47, v45);
    objc_msgSend_addObject_(v4, v49, (uint64_t)v48, v50);
  }
  v51 = objc_msgSend_componentsJoinedByString_(v4, v42, @", ", v43);

  return v51;
}

- (id)description
{
  return (id)((uint64_t (*)(CKAssetTransferOptions *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(CKAssetTransferOptions);
  v8 = objc_msgSend_sparseAware(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_copy(v8, v9, v10, v11);
  sparseAware = v4->_sparseAware;
  v4->_sparseAware = (NSNumber *)v12;

  uint64_t v17 = objc_msgSend_shouldFetchAssetContent(self, v14, v15, v16);
  uint64_t v21 = objc_msgSend_copy(v17, v18, v19, v20);
  shouldFetchAssetContent = v4->_shouldFetchAssetContent;
  v4->_shouldFetchAssetContent = (NSNumber *)v21;

  uint64_t v26 = objc_msgSend_shouldFetchAssetContentInMemory(self, v23, v24, v25);
  uint64_t v30 = objc_msgSend_copy(v26, v27, v28, v29);
  shouldFetchAssetContentInMemory = v4->_shouldFetchAssetContentInMemory;
  v4->_shouldFetchAssetContentInMemory = (NSNumber *)v30;

  v35 = objc_msgSend_useMMCSEncryptionV2(self, v32, v33, v34);
  uint64_t v39 = objc_msgSend_copy(v35, v36, v37, v38);
  useMMCSEncryptionV2 = v4->_useMMCSEncryptionV2;
  v4->_useMMCSEncryptionV2 = (NSNumber *)v39;

  return v4;
}

- (NSNumber)sparseAware
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSparseAware:(id)a3
{
}

- (NSNumber)shouldFetchAssetContent
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setShouldFetchAssetContent:(id)a3
{
}

- (NSNumber)shouldFetchAssetContentInMemory
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setShouldFetchAssetContentInMemory:(id)a3
{
}

- (NSNumber)useMMCSEncryptionV2
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUseMMCSEncryptionV2:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_useMMCSEncryptionV2, 0);
  objc_storeStrong((id *)&self->_shouldFetchAssetContentInMemory, 0);
  objc_storeStrong((id *)&self->_shouldFetchAssetContent, 0);

  objc_storeStrong((id *)&self->_sparseAware, 0);
}

@end