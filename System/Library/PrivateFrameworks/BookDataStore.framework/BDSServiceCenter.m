@interface BDSServiceCenter
+ (void)_nextSortOrderForCollectionMemberManager:(id)a3 collectionID:(id)a4 completion:(id)a5;
+ (void)addStoreID:(id)a3 toCollectionID:(id)a4 completion:(id)a5;
+ (void)fetchIsAssetID:(id)a3 inCollectionID:(id)a4 completion:(id)a5;
+ (void)setFinishedState:(BOOL)a3 assetIDs:(id)a4 completion:(id)a5;
@end

@implementation BDSServiceCenter

+ (void)addStoreID:(id)a3 toCollectionID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [BCMutableStoreItem alloc];
  v18 = objc_msgSend_initWithStoreID_(v11, v12, (uint64_t)v8, v13, v14, v15, v16, v17);
  v26 = objc_msgSend_sharedManager(BCCloudAssetManager, v19, v20, v21, v22, v23, v24, v25);
  v34 = objc_msgSend_storeAssetManager(v26, v27, v28, v29, v30, v31, v32, v33);

  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = sub_2360DE814;
  v43[3] = &unk_264CA1318;
  id v46 = v10;
  id v47 = a1;
  id v44 = v8;
  id v45 = v9;
  id v35 = v9;
  id v36 = v10;
  id v37 = v8;
  objc_msgSend_addStoreItem_completion_(v34, v38, (uint64_t)v18, (uint64_t)v43, v39, v40, v41, v42);
}

+ (void)fetchIsAssetID:(id)a3 inCollectionID:(id)a4 completion:(id)a5
{
  id v7 = a5;
  uint64_t v13 = objc_msgSend_collectionMemberIDWithCollectionID_assetID_(BCCollectionMember, v8, (uint64_t)a4, (uint64_t)a3, v9, v10, v11, v12);
  uint64_t v21 = objc_msgSend_sharedManager(BCCloudCollectionsManager, v14, v15, v16, v17, v18, v19, v20);
  uint64_t v29 = objc_msgSend_collectionMemberManager(v21, v22, v23, v24, v25, v26, v27, v28);

  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = sub_2360DEBD8;
  v36[3] = &unk_264CA1340;
  id v37 = v7;
  id v30 = v7;
  objc_msgSend_collectionMemberForCollectionMemberID_completion_(v29, v31, (uint64_t)v13, (uint64_t)v36, v32, v33, v34, v35);
}

+ (void)setFinishedState:(BOOL)a3 assetIDs:(id)a4 completion:(id)a5
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v10 = v7;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v71, (uint64_t)v75, 16, v12, v13, v14);
  if (v15)
  {
    uint64_t v23 = v15;
    uint64_t v24 = *(void *)v72;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v72 != v24) {
          objc_enumerationMutation(v10);
        }
        uint64_t v26 = *(void **)(*((void *)&v71 + 1) + 8 * i);
        if (objc_msgSend_longLongValue(v26, v16, v17, v18, v19, v20, v21, v22)) {
          BOOL v27 = v26 == 0;
        }
        else {
          BOOL v27 = 1;
        }
        if (!v27)
        {
          id v28 = v26;
          uint64_t v29 = [BCMutableStoreItem alloc];
          id v36 = objc_msgSend_initWithStoreID_(v29, v30, (uint64_t)v28, v31, v32, v33, v34, v35);
          objc_msgSend_setObject_forKeyedSubscript_(v9, v37, (uint64_t)v36, (uint64_t)v28, v38, v39, v40, v41);
        }
      }
      uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v16, (uint64_t)&v71, (uint64_t)v75, 16, v20, v21, v22);
    }
    while (v23);
  }

  v49 = objc_msgSend_sharedManager(BCCloudAssetManager, v42, v43, v44, v45, v46, v47, v48);
  v57 = objc_msgSend_storeAssetManager(v49, v50, v51, v52, v53, v54, v55, v56);

  v66[0] = MEMORY[0x263EF8330];
  v66[1] = 3221225472;
  v66[2] = sub_2360DEEBC;
  v66[3] = &unk_264CA1390;
  id v68 = v10;
  id v69 = v8;
  id v67 = v9;
  BOOL v70 = a3;
  id v58 = v10;
  id v59 = v8;
  id v60 = v9;
  objc_msgSend_addStoreItems_completion_(v57, v61, (uint64_t)v60, (uint64_t)v66, v62, v63, v64, v65);
}

+ (void)_nextSortOrderForCollectionMemberManager:(id)a3 collectionID:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    if (v7 && v8)
    {
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = sub_2360DF498;
      v16[3] = &unk_264CA13B8;
      id v17 = v9;
      objc_msgSend_fetchMaxSortOrderInCollectionID_completion_(v7, v11, (uint64_t)v8, (uint64_t)v16, v12, v13, v14, v15);
    }
    else
    {
      (*((void (**)(id, void))v9 + 2))(v9, 0);
    }
  }
}

@end