@interface CKDUpdateMissingAssetStatusURLRequest
- (BOOL)isPackage;
- (BOOL)recovered;
- (CKDUpdateMissingAssetStatusURLRequest)initWithOperation:(id)a3 recoveredAssetRepairRecordID:(id)a4 size:(unint64_t)a5 putReceipt:(id)a6;
- (CKDUpdateMissingAssetStatusURLRequest)initWithOperation:(id)a3 recoveredPackageRepairRecordID:(id)a4 sizes:(id)a5 putReceipts:(id)a6;
- (CKDUpdateMissingAssetStatusURLRequest)initWithOperation:(id)a3 repairRecordID:(id)a4 recovered:(BOOL)a5 package:(BOOL)a6 sizes:(id)a7 putReceipts:(id)a8;
- (CKDUpdateMissingAssetStatusURLRequest)initWithOperation:(id)a3 unrecoveredRepairRecordID:(id)a4;
- (CKRecordID)repairRecordID;
- (NSArray)assetPutReceipts;
- (NSArray)assetSizes;
- (id)generateRequestOperations;
- (id)recordIDsUsedInZones:(id)a3;
- (id)requestDidParseProtobufObject:(id)a3;
- (id)requestOperationClasses;
- (void)fillOutEquivalencyPropertiesBuilder:(id)a3;
- (void)fillOutRequestProperties:(id)a3;
- (void)setAssetPutReceipts:(id)a3;
- (void)setAssetSizes:(id)a3;
- (void)setIsPackage:(BOOL)a3;
- (void)setRecovered:(BOOL)a3;
- (void)setRepairRecordID:(id)a3;
@end

@implementation CKDUpdateMissingAssetStatusURLRequest

- (CKDUpdateMissingAssetStatusURLRequest)initWithOperation:(id)a3 unrecoveredRepairRecordID:(id)a4
{
  return (CKDUpdateMissingAssetStatusURLRequest *)objc_msgSend_initWithOperation_repairRecordID_recovered_package_sizes_putReceipts_(self, a2, (uint64_t)a3, a4, 0, 0, 0, 0);
}

- (CKDUpdateMissingAssetStatusURLRequest)initWithOperation:(id)a3 recoveredAssetRepairRecordID:(id)a4 size:(unint64_t)a5 putReceipt:(id)a6
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v14 = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E4F28ED0], v13, a5);
  v23[0] = v14;
  v17 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v15, (uint64_t)v23, 1);
  if (v12)
  {
    id v22 = v12;
    v18 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v16, (uint64_t)&v22, 1);
    v20 = (CKDUpdateMissingAssetStatusURLRequest *)(id)objc_msgSend_initWithOperation_repairRecordID_recovered_package_sizes_putReceipts_(self, v19, (uint64_t)v10, v11, 1, 0, v17, v18);
  }
  else
  {
    v20 = (CKDUpdateMissingAssetStatusURLRequest *)(id)objc_msgSend_initWithOperation_repairRecordID_recovered_package_sizes_putReceipts_(self, v16, (uint64_t)v10, v11, 1, 0, v17, MEMORY[0x1E4F1CBF0]);
  }

  return v20;
}

- (CKDUpdateMissingAssetStatusURLRequest)initWithOperation:(id)a3 recoveredPackageRepairRecordID:(id)a4 sizes:(id)a5 putReceipts:(id)a6
{
  return (CKDUpdateMissingAssetStatusURLRequest *)objc_msgSend_initWithOperation_repairRecordID_recovered_package_sizes_putReceipts_(self, a2, (uint64_t)a3, a4, 1, 1, a5, a6);
}

- (CKDUpdateMissingAssetStatusURLRequest)initWithOperation:(id)a3 repairRecordID:(id)a4 recovered:(BOOL)a5 package:(BOOL)a6 sizes:(id)a7 putReceipts:(id)a8
{
  id v15 = a4;
  id v16 = a7;
  id v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)CKDUpdateMissingAssetStatusURLRequest;
  v18 = [(CKDURLRequest *)&v21 initWithOperation:a3];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_repairRecordID, a4);
    v19->_recovered = a5;
    v19->_isPackage = a6;
    objc_storeStrong((id *)&v19->_assetSizes, a7);
    objc_storeStrong((id *)&v19->_assetPutReceipts, a8);
  }

  return v19;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CKDUpdateMissingAssetStatusURLRequest;
  id v4 = a3;
  [(CKDURLRequest *)&v13 fillOutEquivalencyPropertiesBuilder:v4];
  v7 = objc_msgSend_repairRecordID(self, v5, v6, v13.receiver, v13.super_class);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v8, (uint64_t)v7, @"repairRecordID");

  id v11 = objc_msgSend_assetSizes(self, v9, v10);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v12, (uint64_t)v11, @"assetSizes");
}

- (void)fillOutRequestProperties:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v7 = objc_msgSend_repairRecordID(self, v5, v6);
  v12[0] = v7;
  v9 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v8, (uint64_t)v12, 1);
  objc_msgSend_setModifyRecordIDs_(v4, v10, (uint64_t)v9);

  v11.receiver = self;
  v11.super_class = (Class)CKDUpdateMissingAssetStatusURLRequest;
  [(CKDURLRequest *)&v11 fillOutRequestProperties:v4];
}

- (id)recordIDsUsedInZones:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_repairRecordID(self, v5, v6);
  uint64_t v10 = objc_msgSend_zoneID(v7, v8, v9);
  int v12 = objc_msgSend_containsObject_(v4, v11, (uint64_t)v10);

  id v15 = (void *)MEMORY[0x1E4F1CAD0];
  if (v12)
  {
    id v16 = objc_msgSend_repairRecordID(self, v13, v14);
    v18 = objc_msgSend_setWithObject_(v15, v17, (uint64_t)v16);
  }
  else
  {
    v18 = objc_opt_new();
  }
  return v18;
}

- (id)requestOperationClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = objc_opt_class();
  v3 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2, (uint64_t)v5, 1);
  return v3;
}

- (id)generateRequestOperations
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_operationType(self, a2, v2);
  uint64_t v6 = objc_msgSend_operationRequestWithType_(self, v5, v4);
  v7 = objc_opt_new();
  objc_msgSend_setUpdateMissingAssetStatusRequest_(v6, v8, (uint64_t)v7);

  objc_super v11 = objc_msgSend_updateMissingAssetStatusRequest(v6, v9, v10);
  uint64_t v14 = objc_msgSend_translator(self, v12, v13);
  id v17 = objc_msgSend_repairRecordID(self, v15, v16);
  v19 = objc_msgSend_pRecordIdentifierFromRecordID_(v14, v18, (uint64_t)v17);
  objc_msgSend_setMissingAssetStatusRecordID_(v11, v20, (uint64_t)v19);

  uint64_t v23 = objc_msgSend_recovered(self, v21, v22);
  objc_msgSend_setRecovered_(v11, v24, v23);
  if (objc_msgSend_recovered(self, v25, v26))
  {
    if (objc_msgSend_isPackage(self, v27, v28))
    {
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      v31 = objc_msgSend_assetSizes(self, v29, v30, 0);
      uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v64, v69, 16);
      if (v33)
      {
        uint64_t v36 = v33;
        uint64_t v37 = *(void *)v65;
        do
        {
          for (uint64_t i = 0; i != v36; ++i)
          {
            if (*(void *)v65 != v37) {
              objc_enumerationMutation(v31);
            }
            uint64_t v39 = objc_msgSend_unsignedIntegerValue(*(void **)(*((void *)&v64 + 1) + 8 * i), v34, v35);
            objc_msgSend_addPackageAssetSize_(v11, v40, v39);
          }
          uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v34, (uint64_t)&v64, v69, 16);
        }
        while (v36);
      }

      v43 = objc_msgSend_assetPutReceipts(self, v41, v42);
      v46 = objc_msgSend_mutableCopy(v43, v44, v45);
      objc_msgSend_setPackagePutReceipts_(v11, v47, (uint64_t)v46);
    }
    else
    {
      v48 = objc_msgSend_assetSizes(self, v29, v30);
      v51 = objc_msgSend_firstObject(v48, v49, v50);
      uint64_t v54 = objc_msgSend_unsignedIntegerValue(v51, v52, v53);
      objc_msgSend_setAssetSize_(v11, v55, v54);

      v43 = objc_msgSend_assetPutReceipts(self, v56, v57);
      v46 = objc_msgSend_firstObject(v43, v58, v59);
      objc_msgSend_setAssetPutReceipt_(v11, v60, (uint64_t)v46);
    }
  }
  v68 = v6;
  v62 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v61, (uint64_t)&v68, 1);

  return v62;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  return 0;
}

- (CKRecordID)repairRecordID
{
  return self->_repairRecordID;
}

- (void)setRepairRecordID:(id)a3
{
}

- (BOOL)recovered
{
  return self->_recovered;
}

- (void)setRecovered:(BOOL)a3
{
  self->_recovered = a3;
}

- (BOOL)isPackage
{
  return self->_isPackage;
}

- (void)setIsPackage:(BOOL)a3
{
  self->_isPackage = a3;
}

- (NSArray)assetSizes
{
  return self->_assetSizes;
}

- (void)setAssetSizes:(id)a3
{
}

- (NSArray)assetPutReceipts
{
  return self->_assetPutReceipts;
}

- (void)setAssetPutReceipts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetPutReceipts, 0);
  objc_storeStrong((id *)&self->_assetSizes, 0);
  objc_storeStrong((id *)&self->_repairRecordID, 0);
}

@end