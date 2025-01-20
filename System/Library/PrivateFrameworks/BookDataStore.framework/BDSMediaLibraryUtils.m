@interface BDSMediaLibraryUtils
+ (id)_storeRepresentativeItem:(id)a3;
+ (id)representativeDAAPMediaItemsWithAssetId:(id)a3;
@end

@implementation BDSMediaLibraryUtils

+ (id)representativeDAAPMediaItemsWithAssetId:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x237DFE9C0]();
  v13 = objc_msgSend_audiobooksQuery(MEMORY[0x263F11E68], v6, v7, v8, v9, v10, v11, v12);
  objc_msgSend_setIgnoreSystemFilterPredicates_(v13, v14, 1, v15, v16, v17, v18, v19);
  if (v13)
  {
    v25 = objc_msgSend_predicateWithValue_forProperty_(MEMORY[0x263F11E60], v20, (uint64_t)v4, *MEMORY[0x263F113D8], v21, v22, v23, v24);
    objc_msgSend_addFilterPredicate_(v13, v26, (uint64_t)v25, v27, v28, v29, v30, v31);
    v39 = objc_msgSend_collections(v13, v32, v33, v34, v35, v36, v37, v38);
    if (objc_msgSend_count(v39, v40, v41, v42, v43, v44, v45, v46))
    {
      v54 = objc_msgSend_lastObject(v39, v47, v48, v49, v50, v51, v52, v53);
      v61 = objc_msgSend__storeRepresentativeItem_(a1, v55, (uint64_t)v54, v56, v57, v58, v59, v60);

      if (v61)
      {
LABEL_12:

        goto LABEL_13;
      }
      v62 = BDSCloudKitAudiobookLog();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
        sub_2361F5D84((uint64_t)v4, v62);
      }
    }
    else
    {
      v62 = BDSCloudKitAudiobookLog();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
        sub_2361F5D0C((uint64_t)v4, v62);
      }
    }

    v61 = 0;
    goto LABEL_12;
  }
  v25 = BDSCloudKitAudiobookLog();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    sub_2361F5CC8(v25);
  }
  v61 = 0;
LABEL_13:

  return v61;
}

+ (id)_storeRepresentativeItem:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v8 = objc_msgSend_items(a3, a2, (uint64_t)a3, v3, v4, v5, v6, v7, 0);
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v42, (uint64_t)v46, 16, v10, v11, v12);
  if (v13)
  {
    uint64_t v20 = v13;
    uint64_t v21 = *(void *)v43;
    uint64_t v22 = *MEMORY[0x263F11398];
    while (2)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v43 != v21) {
          objc_enumerationMutation(v8);
        }
        uint64_t v24 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        v25 = objc_msgSend_valueForProperty_(v24, v14, v22, v15, v16, v17, v18, v19);
        if (objc_msgSend_mediaType(v24, v26, v27, v28, v29, v30, v31, v32) == 4
          && objc_msgSend_longLongValue(v25, v33, v34, v35, v36, v37, v38, v39))
        {
          id v40 = v24;

          goto LABEL_12;
        }
      }
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v14, (uint64_t)&v42, (uint64_t)v46, 16, v17, v18, v19);
      if (v20) {
        continue;
      }
      break;
    }
  }
  id v40 = 0;
LABEL_12:

  return v40;
}

@end