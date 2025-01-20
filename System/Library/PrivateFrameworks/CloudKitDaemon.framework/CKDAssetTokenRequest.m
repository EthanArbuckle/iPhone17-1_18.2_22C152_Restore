@interface CKDAssetTokenRequest
- (BOOL)hasSuccessfulBatches;
- (BOOL)isEmpty;
- (CKDAssetTokenRequest)init;
- (NSMutableArray)assetBatches;
- (NSMutableSet)failedAssetBatches;
- (id)CKPropertiesDescription;
- (id)description;
- (id)successfulBatches;
- (unsigned)size;
- (unsigned)sizeUpperBound;
- (void)addAssetBatch:(id)a3;
- (void)addFailedBatch:(id)a3;
- (void)setAssetBatches:(id)a3;
- (void)setFailedAssetBatches:(id)a3;
- (void)setSize:(unsigned int)a3;
- (void)setSizeUpperBound:(unsigned int)a3;
@end

@implementation CKDAssetTokenRequest

- (CKDAssetTokenRequest)init
{
  v8.receiver = self;
  v8.super_class = (Class)CKDAssetTokenRequest;
  v2 = [(CKDAssetTokenRequest *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    assetBatches = v2->_assetBatches;
    v2->_assetBatches = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    failedAssetBatches = v2->_failedAssetBatches;
    v2->_failedAssetBatches = (NSMutableSet *)v5;
  }
  return v2;
}

- (void)addAssetBatch:(id)a3
{
  id v12 = a3;
  objc_msgSend_assetTokenRequest(v12, v4, v5);
  if (objc_claimAutoreleasedReturnValue()) {
    __assert_rtn("-[CKDAssetTokenRequest addAssetBatch:]", "CKDAssetTokenRequest.m", 35, "!assetBatch.assetTokenRequest");
  }
  objc_msgSend_setAssetTokenRequest_(v12, v6, (uint64_t)self);
  objc_msgSend_addObject_(self->_assetBatches, v7, (uint64_t)v12);
  self->_sizeUpperBound += objc_msgSend_sizeUpperBound(v12, v8, v9);
  self->_size += objc_msgSend_size(v12, v10, v11);
}

- (void)addFailedBatch:(id)a3
{
}

- (unsigned)sizeUpperBound
{
  return self->_sizeUpperBound;
}

- (BOOL)hasSuccessfulBatches
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  assetBatches = self->_assetBatches;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1C4D845E0;
  v5[3] = &unk_1E64F0578;
  v5[4] = &v6;
  objc_msgSend_enumerateObjectsUsingBlock_(assetBatches, a2, (uint64_t)v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)successfulBatches
{
  return (id)objc_msgSend_CKFilter_(self->_assetBatches, a2, (uint64_t)&unk_1F2042C30);
}

- (BOOL)isEmpty
{
  return objc_msgSend_count(self->_assetBatches, a2, v2) == 0;
}

- (id)CKPropertiesDescription
{
  char v3 = objc_opt_new();
  v4 = NSString;
  v7 = objc_msgSend_assetBatches(self, v5, v6);
  uint64_t v10 = objc_msgSend_count(v7, v8, v9);
  id v12 = objc_msgSend_stringWithFormat_(v4, v11, @"assetBatchCount=%lu", v10);
  objc_msgSend_addObject_(v3, v13, (uint64_t)v12);

  v14 = NSString;
  v17 = objc_msgSend_failedAssetBatches(self, v15, v16);
  uint64_t v20 = objc_msgSend_count(v17, v18, v19);
  v22 = objc_msgSend_stringWithFormat_(v14, v21, @"failedAssetBatchCount=%lu", v20);
  objc_msgSend_addObject_(v3, v23, (uint64_t)v22);

  v24 = NSString;
  unsigned int v27 = objc_msgSend_sizeUpperBound(self, v25, v26);
  v29 = objc_msgSend_stringWithFormat_(v24, v28, @"sizeUpperBound=%lu", v27);
  objc_msgSend_addObject_(v3, v30, (uint64_t)v29);

  v32 = objc_msgSend_componentsJoinedByString_(v3, v31, @", ");

  return v32;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDAssetTokenRequest *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (NSMutableArray)assetBatches
{
  return self->_assetBatches;
}

- (void)setAssetBatches:(id)a3
{
}

- (unsigned)size
{
  return self->_size;
}

- (void)setSize:(unsigned int)a3
{
  self->_size = a3;
}

- (void)setSizeUpperBound:(unsigned int)a3
{
  self->_sizeUpperBound = a3;
}

- (NSMutableSet)failedAssetBatches
{
  return self->_failedAssetBatches;
}

- (void)setFailedAssetBatches:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failedAssetBatches, 0);
  objc_storeStrong((id *)&self->_assetBatches, 0);
}

@end