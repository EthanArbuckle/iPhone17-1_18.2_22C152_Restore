@interface CKDAssetBatch
- (BOOL)isEmptyOfAssets;
- (BOOL)isEmptyOfRereferencesAssets;
- (BOOL)isFailed;
- (BOOL)isPackageSectionBatch;
- (BOOL)isRereferenceAssetBatch;
- (BOOL)useMMCSEncryptionV2;
- (CKDAssetBatch)initWithAssetZone:(id)a3;
- (CKDAssetTokenRequest)assetTokenRequest;
- (CKDAssetZone)assetZone;
- (NSArray)allMMCSItems;
- (NSArray)allMMCSSectionItems;
- (NSArray)allRegularAndSectionAndRereferenceItems;
- (NSArray)allRereferenceMMCSPackageItems;
- (NSArray)assetRecords;
- (NSData)authPutRequest;
- (NSData)authPutResponse;
- (NSDictionary)authPutResponseHeaders;
- (id)CKPropertiesDescription;
- (id)allMMCSAndSectionItems;
- (id)description;
- (id)firstMMCSItemError;
- (unsigned)size;
- (unsigned)sizeUpperBound;
- (void)addAssetRecord:(id)a3;
- (void)failIfNotDoneAllRegularAndSectionAndRereferenceItemsWithError:(id)a3;
- (void)setAssetTokenRequest:(id)a3;
- (void)setAuthPutRequest:(id)a3;
- (void)setAuthPutResponse:(id)a3;
- (void)setAuthPutResponseHeaders:(id)a3;
- (void)setIsFailed:(BOOL)a3;
- (void)setUseMMCSEncryptionV2:(BOOL)a3;
@end

@implementation CKDAssetBatch

- (CKDAssetBatch)initWithAssetZone:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CKDAssetBatch;
  v6 = [(CKDAssetBatch *)&v21 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_assetZone, a3);
    uint64_t v8 = objc_opt_new();
    assetRecords = v7->_assetRecords;
    v7->_assetRecords = (NSArray *)v8;

    v12 = objc_msgSend_assetZoneKey(v5, v10, v11);
    v15 = objc_msgSend_useMMCSEncryptionV2(v12, v13, v14);
    int v18 = objc_msgSend_BOOLValue(v15, v16, v17);

    if (v18) {
      objc_msgSend_setUseMMCSEncryptionV2_(v7, v19, 1);
    }
  }

  return v7;
}

- (void)addAssetRecord:(id)a3
{
}

- (unsigned)sizeUpperBound
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = self->_assetRecords;
  uint64_t v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v3, (uint64_t)&v12, v16, 16);
  if (v4)
  {
    uint64_t v7 = v4;
    unsigned int v8 = 0;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v2);
        }
        v8 += objc_msgSend_sizeUpperBound(*(void **)(*((void *)&v12 + 1) + 8 * i), v5, v6, (void)v12);
      }
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v5, (uint64_t)&v12, v16, 16);
    }
    while (v7);
  }
  else
  {
    unsigned int v8 = 0;
  }

  return v8;
}

- (unsigned)size
{
  return objc_msgSend_length(self->_authPutRequest, a2, v2);
}

- (NSArray)allMMCSItems
{
  return (NSArray *)objc_msgSend_CKFlatMap_(self->_assetRecords, a2, (uint64_t)&unk_1F2044BD0);
}

- (NSArray)allRereferenceMMCSPackageItems
{
  return (NSArray *)objc_msgSend_CKFlatMap_(self->_assetRecords, a2, (uint64_t)&unk_1F2044BF0);
}

- (NSArray)allMMCSSectionItems
{
  return (NSArray *)objc_msgSend_CKFlatMap_(self->_assetRecords, a2, (uint64_t)&unk_1F2044C10);
}

- (id)allMMCSAndSectionItems
{
  return (id)objc_msgSend_CKFlatMap_(self->_assetRecords, a2, (uint64_t)&unk_1F2044C30);
}

- (NSArray)allRegularAndSectionAndRereferenceItems
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v4 = self->_assetRecords;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v20, v24, 16);
  if (v6)
  {
    uint64_t v9 = v6;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v4);
        }
        long long v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v13 = objc_msgSend_allMMCSAndSectionItems(v12, v7, v8, (void)v20);
        objc_msgSend_addObjectsFromArray_(v3, v14, (uint64_t)v13);

        uint64_t v17 = objc_msgSend_allRereferenceMMCSPackageItems(v12, v15, v16);
        objc_msgSend_addObjectsFromArray_(v3, v18, (uint64_t)v17);
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v20, v24, 16);
    }
    while (v9);
  }

  return (NSArray *)v3;
}

- (void)failIfNotDoneAllRegularAndSectionAndRereferenceItemsWithError:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = objc_msgSend_allRegularAndSectionAndRereferenceItems(self, v5, v6, 0);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v17, v21, 16);
  if (v9)
  {
    uint64_t v12 = v9;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v7);
        }
        long long v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend_error(v15, v10, v11);

        if (!v16) {
          objc_msgSend_setError_(v15, v10, (uint64_t)v4);
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v17, v21, 16);
    }
    while (v12);
  }
}

- (id)firstMMCSItemError
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1C502B2F4;
  uint64_t v10 = sub_1C502B304;
  id v11 = 0;
  assetRecords = self->_assetRecords;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1C502B30C;
  v5[3] = &unk_1E64F0578;
  v5[4] = &v6;
  objc_msgSend_enumerateObjectsUsingBlock_(assetRecords, a2, (uint64_t)v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)isPackageSectionBatch
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  assetRecords = self->_assetRecords;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1C502B428;
  v5[3] = &unk_1E64F0578;
  v5[4] = &v6;
  objc_msgSend_enumerateObjectsUsingBlock_(assetRecords, a2, (uint64_t)v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isRereferenceAssetBatch
{
  char v3 = objc_msgSend_assetZoneKey(self->_assetZone, a2, v2);
  char isReReference = objc_msgSend_isReReference(v3, v4, v5);

  return isReReference;
}

- (BOOL)isEmptyOfAssets
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  assetRecords = self->_assetRecords;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1C502B590;
  v5[3] = &unk_1E64F0578;
  v5[4] = &v6;
  objc_msgSend_enumerateObjectsUsingBlock_(assetRecords, a2, (uint64_t)v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isEmptyOfRereferencesAssets
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  assetRecords = self->_assetRecords;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1C502B6AC;
  v5[3] = &unk_1E64F0578;
  v5[4] = &v6;
  objc_msgSend_enumerateObjectsUsingBlock_(assetRecords, a2, (uint64_t)v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)CKPropertiesDescription
{
  char v3 = objc_opt_new();
  id v4 = NSString;
  uint64_t v7 = objc_msgSend_assetZone(self, v5, v6);
  char v9 = objc_msgSend_stringWithFormat_(v4, v8, @"zone=%@", v7);
  objc_msgSend_addObject_(v3, v10, (uint64_t)v9);

  id v11 = NSString;
  long long v14 = objc_msgSend_assetRecords(self, v12, v13);
  uint64_t v17 = objc_msgSend_count(v14, v15, v16);
  long long v19 = objc_msgSend_stringWithFormat_(v11, v18, @"recordCount=%llu", v17);
  objc_msgSend_addObject_(v3, v20, (uint64_t)v19);

  if (objc_msgSend_isPackageSectionBatch(self, v21, v22)) {
    objc_msgSend_addObject_(v3, v23, @"isPackageSectionBatch");
  }
  v24 = objc_msgSend_componentsJoinedByString_(v3, v23, @", ");

  return v24;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDAssetBatch *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (NSArray)assetRecords
{
  return self->_assetRecords;
}

- (CKDAssetZone)assetZone
{
  return self->_assetZone;
}

- (NSData)authPutRequest
{
  return self->_authPutRequest;
}

- (void)setAuthPutRequest:(id)a3
{
}

- (NSData)authPutResponse
{
  return self->_authPutResponse;
}

- (void)setAuthPutResponse:(id)a3
{
}

- (NSDictionary)authPutResponseHeaders
{
  return self->_authPutResponseHeaders;
}

- (void)setAuthPutResponseHeaders:(id)a3
{
}

- (BOOL)isFailed
{
  return self->_isFailed;
}

- (void)setIsFailed:(BOOL)a3
{
  self->_isFailed = a3;
}

- (CKDAssetTokenRequest)assetTokenRequest
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assetTokenRequest);
  return (CKDAssetTokenRequest *)WeakRetained;
}

- (void)setAssetTokenRequest:(id)a3
{
}

- (BOOL)useMMCSEncryptionV2
{
  return self->_useMMCSEncryptionV2;
}

- (void)setUseMMCSEncryptionV2:(BOOL)a3
{
  self->_useMMCSEncryptionV2 = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_assetTokenRequest);
  objc_storeStrong((id *)&self->_authPutResponseHeaders, 0);
  objc_storeStrong((id *)&self->_authPutResponse, 0);
  objc_storeStrong((id *)&self->_authPutRequest, 0);
  objc_storeStrong((id *)&self->_assetZone, 0);
  objc_storeStrong((id *)&self->_assetRecords, 0);
}

@end