@interface CKDAssetRequestPlanner
- (BOOL)hasSuccessfulAssetTokenRequests;
- (BOOL)hasSuccessfulBatches;
- (CKDAssetRequestPlanner)init;
- (CKDAssetRequestPlanner)initWithAssetTokenRequestSizeLimit:(unsigned int)a3;
- (NSArray)assetRegisterAndPutBatches;
- (NSArray)assetTokenRequests;
- (NSMutableDictionary)assetBatchesByZoneID;
- (NSMutableDictionary)assetZoneByKey;
- (NSMutableDictionary)rerefAssetBatchesByZoneID;
- (NSMutableOrderedSet)items;
- (id)CKPropertiesDescription;
- (id)description;
- (unsigned)assetTokenRequestSizeLimit;
- (void)addMMCSItem:(id)a3;
- (void)addMMCSSectionItem:(id)a3;
- (void)addRereferencedPackageItem:(id)a3;
- (void)failBatch:(id)a3;
- (void)planAssetRequests;
- (void)planRegisterBatches;
- (void)resetAssetTokenRequests;
- (void)setAssetBatchesByZoneID:(id)a3;
- (void)setAssetRegisterAndPutBatches:(id)a3;
- (void)setAssetTokenRequests:(id)a3;
- (void)setAssetZoneByKey:(id)a3;
- (void)setItems:(id)a3;
- (void)setRerefAssetBatchesByZoneID:(id)a3;
@end

@implementation CKDAssetRequestPlanner

- (CKDAssetRequestPlanner)init
{
  return (CKDAssetRequestPlanner *)objc_msgSend_initWithAssetTokenRequestSizeLimit_(self, a2, 0x200000);
}

- (CKDAssetRequestPlanner)initWithAssetTokenRequestSizeLimit:(unsigned int)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CKDAssetRequestPlanner;
  v4 = [(CKDAssetRequestPlanner *)&v14 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    items = v4->_items;
    v4->_items = (NSMutableOrderedSet *)v5;

    uint64_t v7 = objc_opt_new();
    assetZoneByKey = v4->_assetZoneByKey;
    v4->_assetZoneByKey = (NSMutableDictionary *)v7;

    v4->_assetTokenRequestSizeLimit = a3;
    uint64_t v9 = objc_opt_new();
    assetBatchesByZoneID = v4->_assetBatchesByZoneID;
    v4->_assetBatchesByZoneID = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_opt_new();
    rerefAssetBatchesByZoneID = v4->_rerefAssetBatchesByZoneID;
    v4->_rerefAssetBatchesByZoneID = (NSMutableDictionary *)v11;
  }
  return v4;
}

- (void)addMMCSItem:(id)a3
{
  id v15 = a3;
  if (objc_msgSend_containsObject_(self->_items, v4, (uint64_t)v15)) {
    __assert_rtn("-[CKDAssetRequestPlanner addMMCSItem:]", "CKDAssetRequestPlanner.m", 58, "![_items containsObject:item]");
  }
  objc_msgSend_addObject_(self->_items, v5, (uint64_t)v15);
  v8 = objc_msgSend_assetZoneKey(v15, v6, v7);
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(self->_assetZoneByKey, v9, (uint64_t)v8);
  if (!v11)
  {
    v12 = [CKDAssetZone alloc];
    uint64_t v11 = objc_msgSend_initWithAssetZoneKey_(v12, v13, (uint64_t)v8);
    objc_msgSend_setObject_forKeyedSubscript_(self->_assetZoneByKey, v14, (uint64_t)v11, v8);
  }
  objc_msgSend_addMMCSItem_(v11, v10, (uint64_t)v15);
}

- (void)addRereferencedPackageItem:(id)a3
{
  id v23 = a3;
  if (objc_msgSend_containsObject_(self->_items, v4, (uint64_t)v23)) {
    __assert_rtn("-[CKDAssetRequestPlanner addRereferencedPackageItem:]", "CKDAssetRequestPlanner.m", 71, "![_items containsObject:item]");
  }
  objc_msgSend_addObject_(self->_items, v5, (uint64_t)v23);
  assetZoneByKey = self->_assetZoneByKey;
  uint64_t v9 = objc_msgSend_assetZoneKey(v23, v7, v8);
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(assetZoneByKey, v10, (uint64_t)v9);

  if (!v11)
  {
    v13 = [CKDAssetZone alloc];
    v16 = objc_msgSend_assetZoneKey(v23, v14, v15);
    uint64_t v11 = objc_msgSend_initWithAssetZoneKey_(v13, v17, (uint64_t)v16);

    v18 = self->_assetZoneByKey;
    v21 = objc_msgSend_assetZoneKey(v23, v19, v20);
    objc_msgSend_setObject_forKeyedSubscript_(v18, v22, (uint64_t)v11, v21);
  }
  objc_msgSend_addRereferencedMMCSPackageItem_(v11, v12, (uint64_t)v23);
}

- (void)addMMCSSectionItem:(id)a3
{
  id v18 = a3;
  if (objc_msgSend_containsObject_(self->_items, v4, (uint64_t)v18)) {
    __assert_rtn("-[CKDAssetRequestPlanner addMMCSSectionItem:]", "CKDAssetRequestPlanner.m", 83, "![_items containsObject:item]");
  }
  objc_msgSend_addObject_(self->_items, v5, (uint64_t)v18);
  assetZoneByKey = self->_assetZoneByKey;
  uint64_t v9 = objc_msgSend_assetZoneKey(v18, v7, v8);
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(assetZoneByKey, v10, (uint64_t)v9);

  if (!v11)
  {
    v13 = [CKDAssetZone alloc];
    v16 = objc_msgSend_assetZoneKey(v18, v14, v15);
    uint64_t v11 = objc_msgSend_initWithAssetZoneKey_(v13, v17, (uint64_t)v16);
  }
  objc_msgSend_addMMCSSectionItem_(v11, v12, (uint64_t)v18);
}

- (void)resetAssetTokenRequests
{
  self->_assetTokenRequests = 0;
  MEMORY[0x1F41817F8]();
}

- (void)planRegisterBatches
{
  uint64_t v152 = *MEMORY[0x1E4F143B8];
  v123 = objc_opt_new();
  unsigned int assetTokenRequestSizeLimit = self->_assetTokenRequestSizeLimit;
  objc_msgSend_setAssetRegisterAndPutBatches_(self, v3, 0);
  long long v145 = 0u;
  long long v146 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  v121 = self;
  objc_msgSend_allKeys(self->_assetZoneByKey, v4, v5);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v119 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v143, v151, 16);
  if (v119)
  {
    uint64_t v118 = *(void *)v144;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v144 != v118) {
          objc_enumerationMutation(obj);
        }
        uint64_t v120 = v8;
        uint64_t v9 = *(void **)(*((void *)&v143 + 1) + 8 * v8);
        v10 = objc_msgSend_objectForKeyedSubscript_(v121->_assetZoneByKey, v7, (uint64_t)v9);
        uint64_t v11 = [CKDAssetBatch alloc];
        v13 = objc_msgSend_initWithAssetZone_(v11, v12, (uint64_t)v10);
        v16 = objc_msgSend_useMMCSEncryptionV2(v9, v14, v15);
        uint64_t v19 = objc_msgSend_BOOLValue(v16, v17, v18);

        v122 = v13;
        unsigned int v124 = v19;
        objc_msgSend_setUseMMCSEncryptionV2_(v13, v20, v19);
        long long v141 = 0u;
        long long v142 = 0u;
        long long v139 = 0u;
        long long v140 = 0u;
        v125 = v10;
        id v23 = objc_msgSend_assetRecords(v10, v21, v22);
        uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v139, v150, 16);
        if (v25)
        {
          uint64_t v28 = v25;
          uint64_t v29 = *(void *)v140;
          do
          {
            for (uint64_t i = 0; i != v28; ++i)
            {
              if (*(void *)v140 != v29) {
                objc_enumerationMutation(v23);
              }
              v31 = *(void **)(*((void *)&v139 + 1) + 8 * i);
              if (objc_msgSend_isAssetRecord(v31, v26, v27))
              {
                v32 = [CKDAssetRecord alloc];
                v35 = objc_msgSend_recordType(v31, v33, v34);
                v38 = objc_msgSend_recordID(v31, v36, v37);
                v40 = objc_msgSend_initWithRecordType_recordID_(v32, v39, (uint64_t)v35, v38);

                long long v137 = 0u;
                long long v138 = 0u;
                long long v135 = 0u;
                long long v136 = 0u;
                v43 = objc_msgSend_allMMCSSectionItems(v31, v41, v42);
                uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v135, v149, 16);
                if (v45)
                {
                  uint64_t v47 = v45;
                  uint64_t v48 = *(void *)v136;
                  do
                  {
                    for (uint64_t j = 0; j != v47; ++j)
                    {
                      if (*(void *)v136 != v48) {
                        objc_enumerationMutation(v43);
                      }
                      objc_msgSend_addMMCSSectionItem_(v40, v46, *(void *)(*((void *)&v135 + 1) + 8 * j));
                    }
                    uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v46, (uint64_t)&v135, v149, 16);
                  }
                  while (v47);
                }

                long long v133 = 0u;
                long long v134 = 0u;
                long long v131 = 0u;
                long long v132 = 0u;
                v52 = objc_msgSend_allMMCSItems(v31, v50, v51);
                uint64_t v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v53, (uint64_t)&v131, v148, 16);
                if (v54)
                {
                  uint64_t v56 = v54;
                  uint64_t v57 = *(void *)v132;
                  do
                  {
                    for (uint64_t k = 0; k != v56; ++k)
                    {
                      if (*(void *)v132 != v57) {
                        objc_enumerationMutation(v52);
                      }
                      objc_msgSend_addMMCSItem_(v40, v55, *(void *)(*((void *)&v131 + 1) + 8 * k));
                    }
                    uint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v55, (uint64_t)&v131, v148, 16);
                  }
                  while (v56);
                }

                if ((objc_msgSend_isEmpty(v40, v59, v60) & 1) == 0)
                {
                  if (objc_msgSend_sizeUpperBound(v40, v61, v62) > assetTokenRequestSizeLimit
                    || objc_msgSend_isPackageSectionRecord(v40, v63, v64))
                  {
                    v67 = [CKDAssetBatch alloc];
                    v69 = objc_msgSend_initWithAssetZone_(v67, v68, (uint64_t)v125);
                    objc_msgSend_setUseMMCSEncryptionV2_(v69, v70, v124);
                    objc_msgSend_addAssetRecord_(v69, v71, (uint64_t)v31);
                    objc_msgSend_addObject_(v123, v72, (uint64_t)v69);
                  }
                  else
                  {
                    int v73 = objc_msgSend_sizeUpperBound(v40, v65, v66);
                    if (objc_msgSend_sizeUpperBound(v122, v74, v75) + v73 <= assetTokenRequestSizeLimit)
                    {
                      v81 = v122;
                    }
                    else
                    {
                      objc_msgSend_addObject_(v123, v76, (uint64_t)v122);
                      v77 = [CKDAssetBatch alloc];
                      v79 = objc_msgSend_initWithAssetZone_(v77, v78, (uint64_t)v125);

                      objc_msgSend_setUseMMCSEncryptionV2_(v79, v80, v124);
                      v81 = v79;
                    }
                    v122 = v81;
                    objc_msgSend_addAssetRecord_(v81, v76, (uint64_t)v40);
                  }
                }
              }
            }
            uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v139, v150, 16);
          }
          while (v28);
        }

        if ((objc_msgSend_isEmptyOfRereferencesAssets(v122, v82, v83) & 1) == 0) {
          objc_msgSend_addObject_(v123, v84, (uint64_t)v122);
        }

        uint64_t v8 = v120 + 1;
      }
      while (v120 + 1 != v119);
      uint64_t v119 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v143, v151, 16);
    }
    while (v119);
  }

  long long v129 = 0u;
  long long v130 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  id v85 = v123;
  uint64_t v87 = objc_msgSend_countByEnumeratingWithState_objects_count_(v85, v86, (uint64_t)&v127, v147, 16);
  if (v87)
  {
    uint64_t v90 = v87;
    uint64_t v91 = *(void *)v128;
    do
    {
      for (uint64_t m = 0; m != v90; ++m)
      {
        if (*(void *)v128 != v91) {
          objc_enumerationMutation(v85);
        }
        v93 = *(void **)(*((void *)&v127 + 1) + 8 * m);
        assetBatchesByZoneID = v121->_assetBatchesByZoneID;
        v95 = objc_msgSend_assetZone(v93, v88, v89);
        v98 = objc_msgSend_assetZoneKey(v95, v96, v97);
        v101 = objc_msgSend_destinationZoneID(v98, v99, v100);
        v103 = objc_msgSend_objectForKeyedSubscript_(assetBatchesByZoneID, v102, (uint64_t)v101);

        if (!v103)
        {
          v103 = objc_opt_new();
          v105 = v121->_assetBatchesByZoneID;
          v108 = objc_msgSend_assetZone(v93, v106, v107);
          v111 = objc_msgSend_assetZoneKey(v108, v109, v110);
          v114 = objc_msgSend_destinationZoneID(v111, v112, v113);
          objc_msgSend_setObject_forKeyedSubscript_(v105, v115, (uint64_t)v103, v114);
        }
        objc_msgSend_addObject_(v103, v104, (uint64_t)v93);
      }
      uint64_t v90 = objc_msgSend_countByEnumeratingWithState_objects_count_(v85, v88, (uint64_t)&v127, v147, 16);
    }
    while (v90);
  }

  objc_msgSend_setAssetRegisterAndPutBatches_(v121, v116, (uint64_t)v85);
}

- (void)planAssetRequests
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v3 = (NSArray *)objc_opt_new();
  unsigned int assetTokenRequestSizeLimit = self->_assetTokenRequestSizeLimit;
  uint64_t v5 = objc_opt_new();
  uint64_t v42 = self;
  uint64_t v8 = objc_msgSend_assetRegisterAndPutBatches(self, v6, v7);
  id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v12 = objc_msgSend_count(v8, v10, v11);
  objc_super v14 = objc_msgSend_initWithCapacity_(v9, v13, v12);
  v16 = v14;
  if (v8) {
    objc_msgSend_addObjectsFromArray_(v14, v15, (uint64_t)v8);
  }
  v41 = v8;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v17 = v16;
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v43, v47, 16);
  if (v19)
  {
    uint64_t v22 = v19;
    uint64_t v23 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v44 != v23) {
          objc_enumerationMutation(v17);
        }
        uint64_t v25 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        if ((objc_msgSend_isFailed(v25, v20, v21, v41) & 1) == 0)
        {
          if (objc_msgSend_size(v25, v20, v21) <= assetTokenRequestSizeLimit)
          {
            int v31 = objc_msgSend_size(v25, v26, v27);
            if (objc_msgSend_size(v5, v32, v33) + v31 > assetTokenRequestSizeLimit)
            {
              objc_msgSend_addObject_(v3, v34, (uint64_t)v5);
              uint64_t v35 = objc_opt_new();

              uint64_t v5 = (void *)v35;
            }
            objc_msgSend_addAssetBatch_(v5, v34, (uint64_t)v25);
          }
          else
          {
            uint64_t v28 = objc_opt_new();
            objc_msgSend_addAssetBatch_(v28, v29, (uint64_t)v25);
            objc_msgSend_addObject_(v3, v30, (uint64_t)v28);
          }
        }
      }
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v43, v47, 16);
    }
    while (v22);
  }

  if ((objc_msgSend_isEmpty(v5, v36, v37) & 1) == 0) {
    objc_msgSend_addObject_(v3, v38, (uint64_t)v5);
  }
  assetTokenRequests = v42->_assetTokenRequests;
  v42->_assetTokenRequests = v3;
  v40 = v3;
}

- (void)failBatch:(id)a3
{
  id v9 = a3;
  objc_msgSend_setIsFailed_(v9, v3, 1);
  v6 = objc_msgSend_assetTokenRequest(v9, v4, v5);
  uint64_t v8 = v6;
  if (v6) {
    objc_msgSend_addFailedBatch_(v6, v7, (uint64_t)v9);
  }
}

- (BOOL)hasSuccessfulBatches
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = objc_msgSend_assetRegisterAndPutBatches(self, a2, v2, 0);
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v11, v15, 16);
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v3);
        }
        if (!objc_msgSend_isFailed(*(void **)(*((void *)&v11 + 1) + 8 * i), v5, v6))
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v5, (uint64_t)&v11, v15, 16);
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (BOOL)hasSuccessfulAssetTokenRequests
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = self->_assetTokenRequests;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v3, (uint64_t)&v10, v14, 16);
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend_hasSuccessfulBatches(*(void **)(*((void *)&v10 + 1) + 8 * i), v4, v5, (void)v10))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v4, (uint64_t)&v10, v14, 16);
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)CKPropertiesDescription
{
  v3 = objc_opt_new();
  v4 = NSString;
  uint64_t v7 = objc_msgSend_items(self, v5, v6);
  uint64_t v10 = objc_msgSend_count(v7, v8, v9);
  long long v12 = objc_msgSend_stringWithFormat_(v4, v11, @"itemCount=%lu", v10);
  objc_msgSend_addObject_(v3, v13, (uint64_t)v12);

  long long v14 = NSString;
  id v17 = objc_msgSend_assetRegisterAndPutBatches(self, v15, v16);
  uint64_t v20 = objc_msgSend_count(v17, v18, v19);
  uint64_t v22 = objc_msgSend_stringWithFormat_(v14, v21, @"assetRegisterAndPutBatchCount=%lu", v20);
  objc_msgSend_addObject_(v3, v23, (uint64_t)v22);

  v24 = NSString;
  uint64_t v27 = objc_msgSend_assetTokenRequests(self, v25, v26);
  uint64_t v30 = objc_msgSend_count(v27, v28, v29);
  v32 = objc_msgSend_stringWithFormat_(v24, v31, @"assetTokenRequestCount=%lu", v30);
  objc_msgSend_addObject_(v3, v33, (uint64_t)v32);

  uint64_t v35 = objc_msgSend_componentsJoinedByString_(v3, v34, @", ");

  return v35;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDAssetRequestPlanner *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (NSArray)assetRegisterAndPutBatches
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAssetRegisterAndPutBatches:(id)a3
{
}

- (unsigned)assetTokenRequestSizeLimit
{
  return self->_assetTokenRequestSizeLimit;
}

- (NSArray)assetTokenRequests
{
  return self->_assetTokenRequests;
}

- (void)setAssetTokenRequests:(id)a3
{
}

- (NSMutableDictionary)rerefAssetBatchesByZoneID
{
  return self->_rerefAssetBatchesByZoneID;
}

- (void)setRerefAssetBatchesByZoneID:(id)a3
{
}

- (NSMutableDictionary)assetBatchesByZoneID
{
  return self->_assetBatchesByZoneID;
}

- (void)setAssetBatchesByZoneID:(id)a3
{
}

- (NSMutableOrderedSet)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (NSMutableDictionary)assetZoneByKey
{
  return self->_assetZoneByKey;
}

- (void)setAssetZoneByKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetZoneByKey, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_assetBatchesByZoneID, 0);
  objc_storeStrong((id *)&self->_rerefAssetBatchesByZoneID, 0);
  objc_storeStrong((id *)&self->_assetTokenRequests, 0);
  objc_storeStrong((id *)&self->_assetRegisterAndPutBatches, 0);
}

@end