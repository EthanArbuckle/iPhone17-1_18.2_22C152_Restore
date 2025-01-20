@interface NTKCParmesanPhotosEditor
- (BOOL)_assetExistsInEditor:(id)a3;
- (BOOL)_ensureUserOverrideSessionIsLoadedForPhotoAtIndex:(int64_t)a3;
- (BOOL)addAssetsFromAssetList:(id)a3;
- (BOOL)addAssetsFromAssetList:(id)a3 maxPhotosCount:(unint64_t)a4;
- (BOOL)addAssetsFromUIImagePicker:(id)a3;
- (BOOL)allowAddingPhotoAssets;
- (BOOL)canChangeOriginalCropOfPhotoAtIndex:(int64_t)a3;
- (BOOL)savePreview:(id)a3 forPhotoAtIndex:(int64_t)a4;
- (CGSize)minimumNormalizedCropSizeForPhotoAtIndex:(int64_t)a3;
- (NSArray)imageIdentifiers;
- (NSMutableArray)orderList;
- (NTKCParmesanPhotosEditor)initWithResourceDirectory:(id)a3 forDevice:(id)a4;
- (id)_fetchAssetsForNewPhotos:(id)a3;
- (id)_makeLayoutForEditedAsset:(id)a3 userOverride:(id)a4;
- (id)replaceAssetAtIndex:(int64_t)a3 withAsset:(id)a4;
- (int64_t)photosCount;
- (void)_copyOrTranscodeAssetWithIds:(id)a3 to:(id)a4 shouldPurgeOriginalData:(BOOL)a5 progress:(id)a6 completion:(id)a7;
- (void)_generateOverrideLayersForEditedAsset:(id)a3 dstDir:(id)a4;
- (void)_readResourceDirectoryPhotosFrom:(id)a3;
- (void)_reinitializeWithImageList:(id)a3 andResourceDirectory:(id)a4;
- (void)deletePhotoAtIndex:(int64_t)a3;
- (void)finalizeWithProgress:(id)a3 completion:(id)a4;
- (void)generateGalleryPreviewResourceDirectoryWithCompletion:(id)a3;
- (void)movePhotoAtIndex:(int64_t)a3 toIndex:(int64_t)a4;
- (void)previewOfLibraryPhotoAtIndex:(int64_t)a3 completion:(id)a4;
- (void)purgeResourcesForPreviewAtIndex:(int64_t)a3;
- (void)resetCropOfPhotoAtIndex:(int64_t)a3 completion:(id)a4;
- (void)setImageOrder:(id)a3;
- (void)setOrderList:(id)a3;
- (void)thumbnailInfoForPhotoAtIndex:(int64_t)a3 completion:(id)a4;
@end

@implementation NTKCParmesanPhotosEditor

- (NTKCParmesanPhotosEditor)initWithResourceDirectory:(id)a3 forDevice:(id)a4
{
  v23.receiver = self;
  v23.super_class = (Class)NTKCParmesanPhotosEditor;
  v4 = [(NTKCompanionResourceDirectoryEditor *)&v23 initWithResourceDirectory:a3 forDevice:a4];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    assets = v4->_assets;
    v4->_assets = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    orderList = v4->_orderList;
    v4->_orderList = (NSMutableArray *)v7;

    uint64_t v9 = objc_opt_new();
    scaledImageCache = v4->_scaledImageCache;
    v4->_scaledImageCache = (NSCache *)v9;

    userOverrideSession = v4->_userOverrideSession;
    v4->_userOverrideSession = 0;

    v4->_userOverrideSessionIndex = -1;
    v4->_galleryPreviewIsValid = 0;
    v15 = objc_msgSend_resourceDirectory(v4, v12, v13, v14);

    if (v15)
    {
      v19 = objc_msgSend_resourceDirectory(v4, v16, v17, v18);
      objc_msgSend__readResourceDirectoryPhotosFrom_(v4, v20, (uint64_t)v19, v21);
    }
    objc_msgSend_setState_(v4, v16, 1, v18);
  }
  return v4;
}

- (void)generateGalleryPreviewResourceDirectoryWithCompletion:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v8 = objc_msgSend_logObject(NTKParmesanFaceBundle, v5, v6, v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v37 = (id)objc_opt_class();
    id v9 = v37;
    _os_log_impl(&dword_246B51000, v8, OS_LOG_TYPE_DEFAULT, "generateGalleryPreviewResourceDirectoryWithCompletion: generating preview for %@", buf, 0xCu);
  }
  uint64_t v13 = objc_msgSend_state(self, v10, v11, v12);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_246B663C8;
  aBlock[3] = &unk_2651FBDC8;
  uint64_t v35 = v13;
  aBlock[4] = self;
  id v14 = v4;
  id v34 = v14;
  v15 = _Block_copy(aBlock);
  if (objc_msgSend_state(self, v16, v17, v18) && objc_msgSend_state(self, v19, v20, v21) < 3)
  {
    if (objc_msgSend_state(self, v22, v23, v24) == 1)
    {
      uint64_t v28 = objc_msgSend_resourceDirectory(self, v25, v26, v27);
    }
    else
    {
      if (!self->_galleryPreviewIsValid)
      {
        objc_msgSend_setState_(self, v25, 3, v27);
        v30 = dispatch_get_global_queue(2, 0);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = sub_246B66558;
        block[3] = &unk_2651FBE38;
        block[4] = self;
        id v32 = v15;
        dispatch_async(v30, block);

        goto LABEL_11;
      }
      uint64_t v28 = objc_msgSend_galleryPreviewResourceDirectory(self, v25, v26, v27);
    }
    v29 = (void *)v28;
    (*((void (**)(void *, uint64_t, uint64_t))v15 + 2))(v15, 1, v28);
  }
  else
  {
    (*((void (**)(void *, void, void))v15 + 2))(v15, 0, 0);
  }
LABEL_11:
}

- (void)finalizeWithProgress:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_logObject(NTKParmesanFaceBundle, v8, v9, v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_246B51000, v11, OS_LOG_TYPE_DEFAULT, "finalizeWithProgress:completion: finalizing NTKParmesanPhotosEditor", buf, 2u);
  }

  if (objc_msgSend_state(self, v12, v13, v14) && objc_msgSend_state(self, v15, v16, v17) < 3)
  {
    if (objc_msgSend_state(self, v18, v19, v20) == 1)
    {
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = sub_246B66A2C;
      v32[3] = &unk_2651FBE38;
      v32[4] = self;
      id v33 = v7;
      dispatch_async(MEMORY[0x263EF83A0], v32);
      uint64_t v21 = v33;
    }
    else
    {
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = sub_246B66A88;
      aBlock[3] = &unk_2651FBE60;
      aBlock[4] = self;
      id v31 = v7;
      v22 = _Block_copy(aBlock);
      objc_msgSend_setState_(self, v23, 4, v24);
      v25 = dispatch_get_global_queue(2, 0);
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = sub_246B66BD8;
      v27[3] = &unk_2651FBF00;
      v27[4] = self;
      id v28 = v22;
      id v29 = v6;
      id v26 = v22;
      dispatch_async(v25, v27);

      uint64_t v21 = v31;
    }
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_246B66A18;
    block[3] = &unk_2651FBB10;
    id v35 = v7;
    dispatch_async(MEMORY[0x263EF83A0], block);
    uint64_t v21 = v35;
  }
}

- (int64_t)photosCount
{
  return objc_msgSend_count(self->_orderList, a2, v2, v3);
}

- (NSArray)imageIdentifiers
{
  id v4 = objc_msgSend_copy(self->_orderList, a2, v2, v3);

  return (NSArray *)v4;
}

- (BOOL)allowAddingPhotoAssets
{
  return 1;
}

- (BOOL)addAssetsFromUIImagePicker:(id)a3
{
  id v4 = self;
  uint64_t v5 = objc_msgSend__fetchAssetsForNewPhotos_(self, a2, (uint64_t)a3, v3);
  uint64_t v6 = NTKMaxParmesanPhotos();
  LOBYTE(v4) = objc_msgSend_addAssetsFromAssetList_maxPhotosCount_(v4, v7, (uint64_t)v5, v6);

  return (char)v4;
}

- (BOOL)addAssetsFromAssetList:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NTKMaxParmesanPhotos();
  LOBYTE(self) = objc_msgSend_addAssetsFromAssetList_maxPhotosCount_(self, v6, (uint64_t)v4, v5);

  return (char)self;
}

- (BOOL)addAssetsFromAssetList:(id)a3 maxPhotosCount:(unint64_t)a4
{
  uint64_t v120 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (!objc_msgSend_state(self, v7, v8, v9)
    || objc_msgSend_state(self, v10, v11, v12) > 2
    || (uint64_t v16 = objc_msgSend_photosCount(self, v13, v14, v15), objc_msgSend_count(v6, v17, v18, v19) + v16 > a4))
  {
    BOOL v23 = 0;
    goto LABEL_5;
  }
  v109 = objc_msgSend_firstObject(self->_orderList, v20, v21, v22);
  id v110 = v6;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  id obj = v6;
  uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v25, (uint64_t)&v113, (uint64_t)v119, 16);
  if (!v26) {
    goto LABEL_28;
  }
  uint64_t v30 = v26;
  uint64_t v112 = *(void *)v114;
  do
  {
    for (uint64_t i = 0; i != v30; ++i)
    {
      if (*(void *)v114 != v112) {
        objc_enumerationMutation(obj);
      }
      id v32 = *(void **)(*((void *)&v113 + 1) + 8 * i);
      id v33 = objc_msgSend__key(v32, v27, v28, v29);
      id v34 = [_NTKEditedParmesanAsset alloc];
      v36 = objc_msgSend_initWithParmesanAsset_phAsset_(v34, v35, 0, (uint64_t)v32);
      v39 = objc_msgSend_objectForKeyedSubscript_(self->_assets, v37, (uint64_t)v33, v38);
      v43 = v39;
      if (v39)
      {
        if (objc_msgSend_isInResourceDirectory(v39, v40, v41, v42))
        {
          v47 = objc_msgSend_asset(v43, v44, v45, v46);
          v51 = objc_msgSend_modificationDate(v47, v48, v49, v50);
          v55 = objc_msgSend_ntk_modificationDate(v32, v52, v53, v54);
          objc_msgSend_timeIntervalSince1970(v51, v56, v57, v58);
          double v60 = v59;
          objc_msgSend_timeIntervalSince1970(v55, v61, v62, v63);
          double v65 = vabdd_f64(v60, v64);

          v69 = objc_msgSend_logObject(NTKParmesanFaceBundle, v66, v67, v68);
          BOOL v70 = os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT);
          if (v65 > 2.0)
          {
            if (v70)
            {
              v74 = objc_msgSend_asset(v43, v71, v72, v73);
              v78 = objc_msgSend_localIdentifier(v74, v75, v76, v77);
              *(_DWORD *)buf = 138412290;
              v118 = v78;
              _os_log_impl(&dword_246B51000, v69, OS_LOG_TYPE_DEFAULT, "addAssetsFromAssetList: replacing existing asset %@ because it was modified", buf, 0xCu);
            }
            objc_msgSend_setObject_forKeyedSubscript_(self->_assets, v79, (uint64_t)v36, (uint64_t)v33);
            goto LABEL_26;
          }
          if (v70)
          {
            v95 = objc_msgSend_asset(v43, v71, v72, v73);
            v99 = objc_msgSend_localIdentifier(v95, v102, v103, v104);
            *(_DWORD *)buf = 138412290;
            v118 = v99;
            v100 = v69;
            v101 = "addAssetsFromAssetList: not adding existing asset %@";
LABEL_24:
            _os_log_impl(&dword_246B51000, v100, OS_LOG_TYPE_DEFAULT, v101, buf, 0xCu);
          }
        }
        else
        {
          v69 = objc_msgSend_logObject(NTKParmesanFaceBundle, v44, v45, v46);
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
          {
            v95 = objc_msgSend_asset(v36, v92, v93, v94);
            v99 = objc_msgSend_localIdentifier(v95, v96, v97, v98);
            *(_DWORD *)buf = 138412290;
            v118 = v99;
            v100 = v69;
            v101 = "addAssetsFromAssetList: not adding new asset again %@";
            goto LABEL_24;
          }
        }

        goto LABEL_26;
      }
      v80 = objc_msgSend_logObject(NTKParmesanFaceBundle, v40, v41, v42);
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
      {
        v84 = objc_msgSend_phAsset(v36, v81, v82, v83);
        v88 = objc_msgSend_localIdentifier(v84, v85, v86, v87);
        *(_DWORD *)buf = 138412290;
        v118 = v88;
        _os_log_impl(&dword_246B51000, v80, OS_LOG_TYPE_DEFAULT, "addAssetsFromAssetList: adding new asset %@", buf, 0xCu);
      }
      objc_msgSend_setObject_forKeyedSubscript_(self->_assets, v89, (uint64_t)v36, (uint64_t)v33);
      objc_msgSend_addObject_(self->_orderList, v90, (uint64_t)v33, v91);
LABEL_26:
    }
    uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v27, (uint64_t)&v113, (uint64_t)v119, 16);
  }
  while (v30);
LABEL_28:

  if (self->_galleryPreviewIsValid)
  {
    v108 = objc_msgSend_firstObject(self->_orderList, v105, v106, v107);
    self->_galleryPreviewIsValid = NTKEqualStrings();
  }
  objc_msgSend_setState_(self, v105, 2, v107);

  BOOL v23 = 1;
  id v6 = v110;
LABEL_5:

  return v23;
}

- (void)deletePhotoAtIndex:(int64_t)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  if (!objc_msgSend_state(self, a2, a3, v3)) {
    return;
  }
  uint64_t v9 = objc_msgSend_state(self, v6, v7, v8);
  if (a3 < 0 || v9 > 2 || objc_msgSend_count(self->_orderList, v10, v11, v12) <= (unint64_t)a3) {
    return;
  }
  uint64_t v15 = objc_msgSend_objectAtIndexedSubscript_(self->_orderList, v13, a3, v14);
  objc_msgSend_removeObject_(self->_orderList, v16, (uint64_t)v15, v17);
  uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(self->_assets, v18, (uint64_t)v15, v19);
  if (objc_msgSend_isInResourceDirectory(v20, v21, v22, v23))
  {
    uint64_t v27 = objc_msgSend_logObject(NTKParmesanFaceBundle, v24, v25, v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      id v31 = objc_msgSend_asset(v20, v28, v29, v30);
      id v35 = objc_msgSend_localIdentifier(v31, v32, v33, v34);
      *(_DWORD *)double v59 = 138412546;
      *(void *)&v59[4] = v35;
      *(_WORD *)&v59[12] = 2048;
      *(void *)&v59[14] = a3;
      v36 = "deletePhotoAtIndex: deleting existing photo %@ at index %ld";
LABEL_10:
      _os_log_impl(&dword_246B51000, v27, OS_LOG_TYPE_DEFAULT, v36, v59, 0x16u);
    }
  }
  else
  {
    scaledImageCache = self->_scaledImageCache;
    uint64_t v38 = objc_msgSend_asset(v20, v24, v25, v26);
    uint64_t v42 = objc_msgSend_localIdentifier(v38, v39, v40, v41);
    objc_msgSend_removeObjectForKey_(scaledImageCache, v43, (uint64_t)v42, v44);

    uint64_t v27 = objc_msgSend_logObject(NTKParmesanFaceBundle, v45, v46, v47);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      id v31 = objc_msgSend_asset(v20, v48, v49, v50);
      id v35 = objc_msgSend_localIdentifier(v31, v51, v52, v53);
      *(_DWORD *)double v59 = 138412546;
      *(void *)&v59[4] = v35;
      *(_WORD *)&v59[12] = 2048;
      *(void *)&v59[14] = a3;
      v36 = "deletePhotoAtIndex: deleting new asset id %@ at index %ld";
      goto LABEL_10;
    }
  }

  objc_msgSend_removeObjectForKey_(self->_assets, v54, (uint64_t)v15, v55);
  if (self->_userOverrideSessionIndex == a3)
  {
    self->_userOverrideSessionIndex = -1;
    userOverrideSession = self->_userOverrideSession;
    self->_userOverrideSession = 0;
  }
  if (self->_galleryPreviewIsValid) {
    self->_galleryPreviewIsValid = a3 != 0;
  }
  objc_msgSend_setState_(self, v56, 2, v57, *(_OWORD *)v59, *(void *)&v59[16]);
}

- (void)movePhotoAtIndex:(int64_t)a3 toIndex:(int64_t)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if (objc_msgSend_state(self, a2, a3, a4))
  {
    uint64_t v10 = objc_msgSend_state(self, v7, v8, v9);
    if ((a3 & 0x8000000000000000) == 0 && v10 <= 2)
    {
      unint64_t v14 = objc_msgSend_count(self->_orderList, v11, v12, v13);
      if ((a4 & 0x8000000000000000) == 0
        && v14 > a3
        && objc_msgSend_count(self->_orderList, v15, v16, v17) > (unint64_t)a4)
      {
        uint64_t v20 = objc_msgSend_objectAtIndexedSubscript_(self->_orderList, v18, a3, v19);
        uint64_t v24 = objc_msgSend_logObject(NTKParmesanFaceBundle, v21, v22, v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          int v33 = 134218240;
          int64_t v34 = a3;
          __int16 v35 = 2048;
          int64_t v36 = a4;
          _os_log_impl(&dword_246B51000, v24, OS_LOG_TYPE_DEFAULT, "movePhotoAtIndex: moving photo from index %ld to index %ld", (uint8_t *)&v33, 0x16u);
        }

        objc_msgSend_removeObjectAtIndex_(self->_orderList, v25, a3, v26);
        objc_msgSend_insertObject_atIndex_(self->_orderList, v27, (uint64_t)v20, a4);
        if (self->_userOverrideSessionIndex == a3) {
          self->_userOverrideSessionIndex = a4;
        }
        if (self->_galleryPreviewIsValid)
        {
          if (a3) {
            BOOL v30 = a4 == 0;
          }
          else {
            BOOL v30 = 1;
          }
          BOOL v32 = !v30 || a3 == a4;
          self->_galleryPreviewIsValid = v32;
        }
        objc_msgSend_setState_(self, v28, 2, v29);
      }
    }
  }
}

- (BOOL)_assetExistsInEditor:(id)a3
{
  uint64_t v5 = objc_msgSend__key(a3, a2, (uint64_t)a3, v3);
  uint64_t v8 = objc_msgSend_objectForKeyedSubscript_(self->_assets, v6, (uint64_t)v5, v7);
  LOBYTE(self) = v8 != 0;

  return (char)self;
}

- (id)replaceAssetAtIndex:(int64_t)a3 withAsset:(id)a4
{
  v34[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (!objc_msgSend_state(self, v7, v8, v9) || objc_msgSend_state(self, v10, v11, v12) >= 3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v10, @"com.apple.parmesan.editor", 1, 0);
    uint64_t v22 = LABEL_13:;
    goto LABEL_14;
  }
  if (a3 < 0 || objc_msgSend_count(self->_orderList, v10, v13, v14) <= (unint64_t)a3)
  {
    uint64_t v20 = objc_msgSend_logObject(NTKParmesanFaceBundle, v10, v13, v14);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_246C2A744(a3, v20);
    }

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v21, @"com.apple.parmesan.editor", 2, 0);
    goto LABEL_13;
  }
  if (objc_msgSend__assetExistsInEditor_(self, v10, (uint64_t)v6, v14))
  {
    uint64_t v18 = objc_msgSend_logObject(NTKParmesanFaceBundle, v15, v16, v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v33 = 0;
      _os_log_impl(&dword_246B51000, v18, OS_LOG_TYPE_DEFAULT, "Cannot replace an asset with an existing asset, ignoring…", v33, 2u);
    }

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v19, @"com.apple.parmesan.editor", 3, 0);
    goto LABEL_13;
  }
  objc_msgSend_deletePhotoAtIndex_(self, v15, a3, v17);
  v34[0] = v6;
  uint64_t v25 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v24, (uint64_t)v34, 1);
  objc_msgSend_addAssetsFromAssetList_(self, v26, (uint64_t)v25, v27);

  uint64_t v31 = objc_msgSend_photosCount(self, v28, v29, v30);
  objc_msgSend_movePhotoAtIndex_toIndex_(self, v32, v31 - 1, a3);
  uint64_t v22 = 0;
LABEL_14:

  return v22;
}

- (void)setImageOrder:(id)a3
{
  id v31 = a3;
  if (objc_msgSend_state(self, v4, v5, v6) && objc_msgSend_state(self, v7, v8, v9) <= 2)
  {
    uint64_t v13 = objc_msgSend_firstObject(self->_orderList, v10, v11, v12);
    uint64_t v17 = objc_msgSend_firstObject(v31, v14, v15, v16);
    uint64_t v20 = (void *)v17;
    BOOL v21 = (v13 | v17) == 0;
    if (v13) {
      BOOL v22 = v17 == 0;
    }
    else {
      BOOL v22 = 1;
    }
    if (v22) {
      char isEqualToString = 0;
    }
    else {
      char isEqualToString = objc_msgSend_isEqualToString_((void *)v13, v18, v17, v19);
    }
    if (self->_galleryPreviewIsValid) {
      self->_galleryPreviewIsValid = v21 | isEqualToString;
    }
    if ((objc_msgSend_isEqualToArray_(self->_orderList, v18, (uint64_t)v31, v19) & 1) == 0)
    {
      uint64_t v27 = (NSMutableArray *)objc_msgSend_mutableCopy(v31, v24, v25, v26);
      orderList = self->_orderList;
      self->_orderList = v27;

      objc_msgSend_setState_(self, v29, 2, v30);
    }
  }
}

- (void)thumbnailInfoForPhotoAtIndex:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_246B67F70;
  aBlock[3] = &unk_2651FBF50;
  id v7 = v6;
  id v88 = v7;
  uint64_t v11 = _Block_copy(aBlock);
  if (a3 < 0 || objc_msgSend_count(self->_orderList, v8, v9, v10) <= (unint64_t)a3)
  {
    (*((void (**)(void *, void, void, double, double, double, double))v11 + 2))(v11, 0, 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  }
  else
  {
    uint64_t v14 = objc_msgSend_objectAtIndexedSubscript_(self->_orderList, v12, a3, v13);
    uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(self->_assets, v15, (uint64_t)v14, v16);
    uint64_t v18 = NSNumber;
    uint64_t EditedUserOverride = objc_msgSend_lastEditedUserOverride(v17, v19, v20, v21);
    uint64_t v25 = objc_msgSend_numberWithInteger_(v18, v23, EditedUserOverride, v24);
    uint64_t v29 = objc_msgSend_userOverrides(v17, v26, v27, v28);
    BOOL v32 = objc_msgSend_objectForKey_(v29, v30, (uint64_t)v25, v31);

    if (v32)
    {
      int64_t v36 = objc_opt_class();
      uint64_t v40 = objc_msgSend_phAsset(v17, v37, v38, v39);
      v84[0] = MEMORY[0x263EF8330];
      v84[1] = 3221225472;
      v84[2] = sub_246B6811C;
      v84[3] = &unk_2651FBF98;
      id v85 = v32;
      id v86 = v11;
      objc_msgSend__imageDataForAsset_completion_(v36, v41, (uint64_t)v40, (uint64_t)v84);

      uint64_t v42 = v85;
    }
    else
    {
      v43 = objc_msgSend_asset(v17, v33, v34, v35);
      uint64_t v47 = v43;
      if (v43)
      {
        id v48 = v43;
      }
      else
      {
        objc_msgSend_originalAsset(v17, v44, v45, v46);
        id v48 = (id)objc_claimAutoreleasedReturnValue();
      }
      uint64_t v42 = v48;

      uint64_t v52 = objc_msgSend_preferredLayout(v42, v49, v50, v51);
      v56 = objc_msgSend_timeLayout(v52, v53, v54, v55);

      if (v42)
      {
        uint64_t v60 = objc_msgSend_preferredLayoutImageURL(v42, v57, v58, v59);
        v61 = NTKPhotosImageForURL();

        sub_246B68090(v62, v61);
        (*((void (**)(void *, void *, void *))v11 + 2))(v11, v61, v56);
      }
      else
      {
        uint64_t v77 = v56;
        v78 = v14;
        scaledImageCache = self->_scaledImageCache;
        double v64 = objc_msgSend_asset(v17, v57, v58, v59);
        uint64_t v68 = objc_msgSend_localIdentifier(v64, v65, v66, v67);
        v61 = objc_msgSend_objectForKey_(scaledImageCache, v69, (uint64_t)v68, v70);

        if (v61)
        {
          sub_246B68090(v71, v61);
          v56 = v77;
          (*((void (**)(void *, void *, void *))v11 + 2))(v11, v61, v77);
        }
        else
        {
          v75 = objc_msgSend_phAsset(v17, v72, v73, v74);
          v79[0] = MEMORY[0x263EF8330];
          v79[1] = 3221225472;
          v79[2] = sub_246B681E8;
          v79[3] = &unk_2651FBFC0;
          v79[4] = self;
          id v80 = v17;
          id v82 = v11;
          id v81 = v77;
          id v83 = &unk_26FB1C1E0;
          objc_msgSend__imageForAsset_forSize_completion_(NTKCParmesanPhotosEditor, v76, (uint64_t)v75, (uint64_t)v79, *MEMORY[0x263F5DEA0], *(double *)(MEMORY[0x263F5DEA0] + 8));

          v56 = v77;
        }
        uint64_t v14 = v78;
      }
    }
  }
}

- (BOOL)canChangeOriginalCropOfPhotoAtIndex:(int64_t)a3
{
  if (a3 < 0 || objc_msgSend_count(self->_orderList, a2, a3, v3) <= (unint64_t)a3) {
    return 0;
  }
  uint64_t v8 = objc_msgSend_objectAtIndexedSubscript_(self->_orderList, v6, a3, v7);
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(self->_assets, v9, (uint64_t)v8, v10);
  uint64_t v15 = objc_msgSend_phAsset(v11, v12, v13, v14);
  BOOL v16 = v15 != 0;

  return v16;
}

- (void)previewOfLibraryPhotoAtIndex:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = dispatch_get_global_queue(2, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_246B68408;
  block[3] = &unk_2651FBFE8;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)resetCropOfPhotoAtIndex:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = dispatch_get_global_queue(2, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_246B6880C;
  block[3] = &unk_2651FBFE8;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (CGSize)minimumNormalizedCropSizeForPhotoAtIndex:(int64_t)a3
{
  double v4 = 1.0;
  if (a3 < 0)
  {
    double v9 = 1.0;
  }
  else
  {
    double v9 = 1.0;
    if (objc_msgSend_count(self->_orderList, a2, a3, v3) > (unint64_t)a3)
    {
      id v10 = objc_msgSend_objectAtIndexedSubscript_(self->_orderList, v7, a3, v8);
      uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(self->_assets, v11, (uint64_t)v10, v12);
      uint64_t v17 = objc_msgSend_phAsset(v13, v14, v15, v16);

      uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(self->_assets, v18, (uint64_t)v10, v19);
      uint64_t v24 = objc_msgSend_subsampleFactor(v20, v21, v22, v23);

      if (v17)
      {
        double v28 = (double)(unint64_t)objc_msgSend_pixelWidth(v17, v25, v26, v27);
        uint64_t v32 = objc_msgSend_pixelHeight(v17, v29, v30, v31);
        if (*MEMORY[0x263F5DEA0] * (double)(unint64_t)v24 / v28 <= 1.0) {
          double v9 = *MEMORY[0x263F5DEA0] * (double)(unint64_t)v24 / v28;
        }
        else {
          double v9 = 1.0;
        }
        if (*(double *)(MEMORY[0x263F5DEA0] + 8) * (double)(unint64_t)v24 / (double)(unint64_t)v32 <= 1.0) {
          double v4 = *(double *)(MEMORY[0x263F5DEA0] + 8) * (double)(unint64_t)v24 / (double)(unint64_t)v32;
        }
        else {
          double v4 = 1.0;
        }
      }
    }
  }
  double v33 = v9;
  double v34 = v4;
  result.height = v34;
  result.width = v33;
  return result;
}

- (BOOL)savePreview:(id)a3 forPhotoAtIndex:(int64_t)a4
{
  uint64_t v136 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v10 = objc_msgSend_logObject(NTKParmesanFaceBundle, v7, v8, v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v135 = a4;
    _os_log_impl(&dword_246B51000, v10, OS_LOG_TYPE_DEFAULT, "savePreview:%ld", buf, 0xCu);
  }

  if (!objc_msgSend_state(self, v11, v12, v13)) {
    goto LABEL_19;
  }
  uint64_t v17 = objc_msgSend_state(self, v14, v15, v16);
  BOOL v21 = 0;
  if (a4 < 0 || v17 > 2) {
    goto LABEL_20;
  }
  if (objc_msgSend_count(self->_orderList, v18, v19, v20) <= (unint64_t)a4
    || !objc_msgSend_canChangeOriginalCropOfPhotoAtIndex_(self, v22, a4, v23))
  {
LABEL_19:
    BOOL v21 = 0;
    goto LABEL_20;
  }
  uint64_t v27 = objc_msgSend_logObject(NTKParmesanFaceBundle, v24, v25, v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
    sub_246C2A860();
  }

  uint64_t v30 = objc_msgSend_objectAtIndexedSubscript_(self->_orderList, v28, a4, v29);
  double v33 = objc_msgSend_objectForKeyedSubscript_(self->_assets, v31, (uint64_t)v30, v32);
  uint64_t v37 = objc_msgSend_crop(v6, v34, v35, v36);
  objc_msgSend_cgRect(v37, v38, v39, v40);
  CGFloat v42 = v41;
  CGFloat v44 = v43;
  CGFloat v46 = v45;
  CGFloat v48 = v47;
  CGFloat v52 = (double)(unint64_t)objc_msgSend_subsampleFactor(v33, v49, v50, v51);
  uint64_t v56 = objc_msgSend_subsampleFactor(v33, v53, v54, v55);
  CGAffineTransformMakeScale(&v133, v52, (double)(unint64_t)v56);
  v137.origin.double x = v42;
  v137.origin.double y = v44;
  v137.size.double width = v46;
  v137.size.double height = v48;
  CGRect v138 = CGRectApplyAffineTransform(v137, &v133);
  double x = v138.origin.x;
  double y = v138.origin.y;
  double width = v138.size.width;
  double height = v138.size.height;

  double v64 = objc_msgSend_phAsset(v33, v61, v62, v63);
  double v68 = (double)(unint64_t)objc_msgSend_pixelWidth(v64, v65, v66, v67);
  uint64_t v72 = objc_msgSend_phAsset(v33, v69, v70, v71);
  double v76 = (double)(unint64_t)objc_msgSend_pixelHeight(v72, v73, v74, v75);

  double v80 = v68 - width;
  if (x < v68 - width) {
    double v80 = x;
  }
  double v81 = fmax(v80, 0.0);
  double v82 = v76 - height;
  if (y < v76 - height) {
    double v82 = y;
  }
  double v83 = fmax(v82, 0.0);
  v84 = objc_msgSend_currentOverride(self->_userOverrideSession, v77, v78, v79);
  id v88 = objc_msgSend_timeLayout(v84, v85, v86, v87);
  v92 = objc_msgSend_timeLayout(v6, v89, v90, v91);

  objc_msgSend_crop(v84, v93, v94, v95);
  if (CLKRectEqualsRect()) {
    BOOL v98 = v88 == v92;
  }
  else {
    BOOL v98 = 0;
  }
  if (v98)
  {
    v99 = 0;
  }
  else
  {
    v99 = objc_alloc_init(NTKParmesanLayoutUserOverride);
    objc_msgSend_setCrop_(v99, v100, v101, v102, v81, v83, width, height);
    uint64_t v106 = objc_msgSend_timeLayout(v6, v103, v104, v105);
    objc_msgSend_setTimeLayout_(v99, v107, (uint64_t)v106, v108);

    uint64_t v112 = objc_msgSend_useDepthEffect(v6, v109, v110, v111);
    objc_msgSend_setUseDepthEffect_(v99, v113, v112, v114);
    objc_msgSend_addUserOverride_(v33, v115, (uint64_t)v99, v116);
    scaledImageCache = self->_scaledImageCache;
    v121 = objc_msgSend_asset(v33, v118, v119, v120);
    v125 = objc_msgSend_localIdentifier(v121, v122, v123, v124);
    objc_msgSend_removeObjectForKey_(scaledImageCache, v126, (uint64_t)v125, v127);
  }
  objc_msgSend_purgeResourcesForPreviewAtIndex_(self, v96, a4, v97);
  if (self->_galleryPreviewIsValid)
  {
    if (a4) {
      BOOL v131 = 1;
    }
    else {
      BOOL v131 = v99 == 0;
    }
    BOOL v132 = v131;
    self->_galleryPreviewIsValid = v132;
  }
  objc_msgSend_setState_(self, v129, 2, v130);

  BOOL v21 = 1;
LABEL_20:

  return v21;
}

- (void)purgeResourcesForPreviewAtIndex:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v6 = objc_msgSend_logObject(NTKParmesanFaceBundle, a2, a3, v3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    int64_t v9 = a3;
    _os_log_impl(&dword_246B51000, v6, OS_LOG_TYPE_DEFAULT, "purgeResourcesForPreviewAtIndex: %ld", (uint8_t *)&v8, 0xCu);
  }

  if (self->_userOverrideSessionIndex == a3)
  {
    self->_userOverrideSessionIndedouble x = -1;
    userOverrideSession = self->_userOverrideSession;
    self->_userOverrideSession = 0;
  }
}

- (void)_readResourceDirectoryPhotosFrom:(id)a3
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v81 = objc_opt_new();
  uint64_t v79 = v4;
  objc_msgSend_readerForResourceDirectory_(NTKParmesanAssetReader, v5, (uint64_t)v4, v6);
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v90, (uint64_t)v96, 16);
  if (v8)
  {
    uint64_t v12 = v8;
    uint64_t v13 = *(void *)v91;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v91 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v90 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend__key(v15, v9, v10, v11);
        uint64_t v17 = [_NTKEditedParmesanAsset alloc];
        uint64_t v19 = objc_msgSend_initWithParmesanAsset_phAsset_(v17, v18, (uint64_t)v15, 0);
        uint64_t v23 = objc_msgSend_localIdentifier(v15, v20, v21, v22);

        if (v23)
        {
          uint64_t v27 = objc_msgSend_localIdentifier(v15, v24, v25, v26);
          objc_msgSend_addObject_(v81, v28, (uint64_t)v27, v29);
        }
        objc_msgSend_setObject_forKeyedSubscript_(self->_assets, v24, (uint64_t)v19, (uint64_t)v16);
        objc_msgSend_addObject_(self->_orderList, v30, (uint64_t)v16, v31);
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v90, (uint64_t)v96, 16);
    }
    while (v12);
  }
  uint64_t v32 = NTKPHAssetsForLocalIdentifiers();
  id v33 = objc_alloc(MEMORY[0x263EFF9A0]);
  uint64_t v37 = objc_msgSend_count(v32, v34, v35, v36);
  uint64_t v40 = objc_msgSend_initWithCapacity_(v33, v38, v37, v39);
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v41 = v32;
  uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v86, (uint64_t)v95, 16);
  if (v43)
  {
    uint64_t v47 = v43;
    uint64_t v48 = *(void *)v87;
    do
    {
      for (uint64_t j = 0; j != v47; ++j)
      {
        if (*(void *)v87 != v48) {
          objc_enumerationMutation(v41);
        }
        uint64_t v50 = *(void **)(*((void *)&v86 + 1) + 8 * j);
        uint64_t v51 = objc_msgSend_localIdentifier(v50, v44, v45, v46);
        objc_msgSend_setObject_forKeyedSubscript_(v40, v52, (uint64_t)v50, (uint64_t)v51);
      }
      uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v44, (uint64_t)&v86, (uint64_t)v95, 16);
    }
    while (v47);
  }

  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  uint64_t v56 = objc_msgSend_allValues(self->_assets, v53, v54, v55);
  uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v56, v57, (uint64_t)&v82, (uint64_t)v94, 16);
  if (v58)
  {
    uint64_t v62 = v58;
    uint64_t v63 = *(void *)v83;
    do
    {
      for (uint64_t k = 0; k != v62; ++k)
      {
        if (*(void *)v83 != v63) {
          objc_enumerationMutation(v56);
        }
        double v65 = *(void **)(*((void *)&v82 + 1) + 8 * k);
        uint64_t v66 = objc_msgSend_asset(v65, v59, v60, v61);
        uint64_t v70 = objc_msgSend_localIdentifier(v66, v67, v68, v69);

        if (v70)
        {
          uint64_t v73 = objc_msgSend_objectForKeyedSubscript_(v40, v71, (uint64_t)v70, v72);
          objc_msgSend_setPhAsset_(v65, v74, (uint64_t)v73, v75);
          uint64_t v76 = sub_246B65014(v73);
          objc_msgSend_setSubsampleFactor_(v65, v77, v76, v78);
        }
      }
      uint64_t v62 = objc_msgSend_countByEnumeratingWithState_objects_count_(v56, v59, (uint64_t)&v82, (uint64_t)v94, 16);
    }
    while (v62);
  }
}

- (id)_fetchAssetsForNewPhotos:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v5 = v3;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v38, (uint64_t)v42, 16);
  if (v7)
  {
    uint64_t v10 = v7;
    uint64_t v11 = *(void *)v39;
    uint64_t v12 = *MEMORY[0x263F836A8];
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v39 != v11) {
          objc_enumerationMutation(v5);
        }
        uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(*(void **)(*((void *)&v38 + 1) + 8 * v13), v8, v12, v9, (void)v38);
        uint64_t v18 = v14;
        if (v14)
        {
          uint64_t v19 = objc_msgSend_localIdentifier(v14, v15, v16, v17);
          objc_msgSend_addObject_(v4, v20, (uint64_t)v19, v21);
        }
        ++v13;
      }
      while (v10 != v13);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v38, (uint64_t)v42, 16);
    }
    while (v10);
  }

  uint64_t v22 = NTKPHAssetsForLocalIdentifiers();
  uint64_t v26 = objc_msgSend_count(v22, v23, v24, v25);
  if (v26 != objc_msgSend_count(v4, v27, v28, v29))
  {
    id v33 = objc_msgSend_logObject(NTKParmesanFaceBundle, v30, v31, v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_246C2A8D4(v22, (char *)v4, (uint64_t)v33, v34);
    }
  }
  if (objc_msgSend_count(v22, v30, v31, v32, (void)v38)) {
    uint64_t v35 = v22;
  }
  else {
    uint64_t v35 = 0;
  }
  id v36 = v35;

  return v36;
}

- (void)_copyOrTranscodeAssetWithIds:(id)a3 to:(id)a4 shouldPurgeOriginalData:(BOOL)a5 progress:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  uint64_t v15 = (void (**)(id, void))a7;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = sub_246B64E00;
  uint64_t v35 = sub_246B64E10;
  id v36 = (id)objc_opt_new();
  uint64_t v19 = objc_msgSend_logObject(NTKParmesanFaceBundle, v16, v17, v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    sub_246C2A974();
  }

  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = sub_246B69A9C;
  v25[3] = &unk_2651FC010;
  v25[4] = self;
  id v20 = v13;
  id v26 = v20;
  id v21 = v12;
  id v27 = v21;
  uint64_t v22 = (void (**)(void, double))v14;
  BOOL v30 = a5;
  id v28 = v22;
  uint64_t v29 = &v31;
  objc_msgSend_enumerateObjectsUsingBlock_(v21, v23, (uint64_t)v25, v24);
  v22[2](v22, 1.0);
  v15[2](v15, v32[5]);

  _Block_object_dispose(&v31, 8);
}

- (void)_reinitializeWithImageList:(id)a3 andResourceDirectory:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v37 = a4;
  uint64_t v7 = (NSMutableDictionary *)objc_opt_new();
  uint64_t v8 = (NSMutableArray *)objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v6;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v38, (uint64_t)v42, 16);
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v39;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v39 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = objc_msgSend_decodeFromDictionary_inResourceDirectory_(NTKParmesanAsset, v11, *(void *)(*((void *)&v38 + 1) + 8 * v14), (uint64_t)v37);
        uint64_t v19 = objc_msgSend__key(v15, v16, v17, v18);
        uint64_t v22 = objc_msgSend_objectForKeyedSubscript_(self->_assets, v20, (uint64_t)v19, v21);
        id v26 = objc_msgSend_phAsset(v22, v23, v24, v25);

        id v27 = [_NTKEditedParmesanAsset alloc];
        uint64_t v29 = objc_msgSend_initWithParmesanAsset_phAsset_(v27, v28, (uint64_t)v15, (uint64_t)v26);
        objc_msgSend_setObject_forKeyedSubscript_(v7, v30, (uint64_t)v29, (uint64_t)v19);
        objc_msgSend_addObject_(v8, v31, (uint64_t)v19, v32);

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v38, (uint64_t)v42, 16);
    }
    while (v12);
  }

  orderList = self->_orderList;
  self->_orderList = v8;
  uint64_t v34 = v8;

  assets = self->_assets;
  self->_assets = v7;
}

- (BOOL)_ensureUserOverrideSessionIsLoadedForPhotoAtIndex:(int64_t)a3
{
  if (a3 < 0) {
    return 0;
  }
  if (objc_msgSend_count(self->_orderList, a2, a3, v3) > (unint64_t)a3)
  {
    if (self->_userOverrideSession && self->_userOverrideSessionIndex == a3) {
      return 1;
    }
    uint64_t v9 = objc_msgSend_objectAtIndexedSubscript_(self->_orderList, v6, a3, v7);
    uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(self->_assets, v10, (uint64_t)v9, v11);
    uint64_t v16 = objc_msgSend_phAsset(v12, v13, v14, v15);

    if (v16)
    {
      uint64_t v17 = [_NTKUserOverrideSession alloc];
      id v20 = (_NTKUserOverrideSession *)objc_msgSend_initWithEditedAsset_(v17, v18, (uint64_t)v12, v19);
      userOverrideSession = self->_userOverrideSession;
      self->_userOverrideSession = v20;

      self->_userOverrideSessionIndedouble x = a3;
      return self->_userOverrideSession != 0;
    }
  }
  return 0;
}

- (void)_generateOverrideLayersForEditedAsset:(id)a3 dstDir:(id)a4
{
  uint64_t v115 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v100 = a4;
  uint64_t v9 = objc_msgSend_userOverrides(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_count(v9, v10, v11, v12);

  if (v13)
  {
    uint64_t v17 = objc_msgSend_phAsset(v5, v14, v15, v16);
    objc_msgSend_ntk_getFullSizePHAssetData(v17, v18, v19, v20);
    CFDataRef v99 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    sub_246B6F390(v99);
    uint64_t v24 = objc_msgSend_fullSizeMaskData(v5, v21, v22, v23);

    if (v24)
    {
      objc_msgSend_fullSizeMaskData(v5, v25, v26, v27);
      CFDataRef v28 = (const __CFData *)objc_claimAutoreleasedReturnValue();
      image = sub_246B6F464(v28);
    }
    else
    {
      image = 0;
    }
    long long v104 = 0u;
    long long v105 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    id v95 = v5;
    uint64_t v29 = objc_msgSend_userOverrides(v5, v25, v26, v27);
    uint64_t v33 = objc_msgSend_allValues(v29, v30, v31, v32);

    id obj = v33;
    uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v102, (uint64_t)v114, 16);
    if (v35)
    {
      uint64_t v39 = v35;
      uint64_t v97 = *(void *)v103;
      do
      {
        for (uint64_t i = 0; i != v39; ++i)
        {
          if (*(void *)v103 != v97) {
            objc_enumerationMutation(obj);
          }
          long long v41 = *(void **)(*((void *)&v102 + 1) + 8 * i);
          CGFloat v42 = objc_msgSend_logObject(NTKParmesanFaceBundle, v36, v37, v38);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v46 = objc_msgSend_localIdentifier(v17, v43, v44, v45);
            *(_DWORD *)buf = 136315906;
            uint64_t v107 = "-[NTKCParmesanPhotosEditor _generateOverrideLayersForEditedAsset:dstDir:]";
            __int16 v108 = 2112;
            v109 = v41;
            __int16 v110 = 2112;
            uint64_t v111 = v46;
            __int16 v112 = 2112;
            id v113 = v100;
            _os_log_impl(&dword_246B51000, v42, OS_LOG_TYPE_DEFAULT, "%s: Generating user override layout for %@, asset %@, dstDir %@", buf, 0x2Au);
          }
          objc_msgSend_crop(v41, v47, v48, v49);
          CGFloat v51 = v50;
          CGFloat v53 = v52;
          CGFloat v55 = v54;
          CGFloat v57 = v56;
          CGFloat v61 = 1.0 / (double)(unint64_t)objc_msgSend_pixelWidth(v17, v58, v59, v60);
          uint64_t v65 = objc_msgSend_pixelHeight(v17, v62, v63, v64);
          CGAffineTransformMakeScale(&v101, v61, 1.0 / (double)(unint64_t)v65);
          v116.origin.double x = v51;
          v116.origin.double y = v53;
          v116.size.double width = v55;
          v116.size.double height = v57;
          CGRectApplyAffineTransform(v116, &v101);
          objc_msgSend_useDepthEffect(v41, v66, v67, v68);
          uint64_t v72 = objc_msgSend_timeLayout(v41, v69, v70, v71);
          objc_msgSend_pfcTimePosition(v72, v73, v74, v75);
          uint64_t v79 = objc_msgSend_timeLayout(v41, v76, v77, v78);
          objc_msgSend_normalizedTimeRectWithoutComplications(v79, v80, v81, v82);
          long long v85 = objc_msgSend_fileURLWithPath_(NSURL, v83, (uint64_t)v100, v84);
          long long v86 = (void *)MEMORY[0x263F14D18];
          long long v90 = objc_msgSend_localIdentifier(v17, v87, v88, v89);
          long long v93 = objc_msgSend_uuidFromLocalIdentifier_(v86, v91, (uint64_t)v90, v92);
          id v94 = (id)PFLGenerateWatchLayout();
        }
        uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v36, (uint64_t)&v102, (uint64_t)v114, 16);
      }
      while (v39);
    }

    CGImageRelease(image);
    id v5 = v95;
  }
}

- (id)_makeLayoutForEditedAsset:(id)a3 userOverride:(id)a4
{
  id v5 = a4;
  id v6 = (void *)MEMORY[0x263F14D18];
  uint64_t v10 = objc_msgSend_phAsset(a3, v7, v8, v9);
  uint64_t v14 = objc_msgSend_localIdentifier(v10, v11, v12, v13);
  uint64_t v17 = objc_msgSend_uuidFromLocalIdentifier_(v6, v15, (uint64_t)v14, v16);

  uint64_t v18 = NSString;
  uint64_t v22 = objc_msgSend_timeLayout(v5, v19, v20, v21);
  unint64_t v26 = objc_msgSend_pfcTimePosition(v22, v23, v24, v25);
  if (v26 > 8) {
    objc_msgSend_stringWithFormat_(v18, v27, @"base_%s_%@.heic", v28, "HM", v17);
  }
  else {
  uint64_t v29 = objc_msgSend_stringWithFormat_(v18, v27, @"base_%s_%@.heic", v28, off_2651FC030[v26], v17);
  }

  if (objc_msgSend_useDepthEffect(v5, v30, v31, v32))
  {
    id v36 = NSString;
    uint64_t v37 = objc_msgSend_timeLayout(v5, v33, v34, v35);
    unint64_t v41 = objc_msgSend_pfcTimePosition(v37, v38, v39, v40);
    if (v41 > 8) {
      objc_msgSend_stringWithFormat_(v36, v42, @"mask_%s_%@.png", v43, "HM", v17);
    }
    else {
    uint64_t v45 = objc_msgSend_stringWithFormat_(v36, v42, @"mask_%s_%@.png", v43, off_2651FC030[v41], v17);
    }

    uint64_t v46 = [NTKParmesanAssetMask alloc];
    uint64_t v44 = objc_msgSend_initWithImageName_style_(v46, v47, (uint64_t)v45, 0);
  }
  else
  {
    uint64_t v44 = 0;
  }
  uint64_t v48 = [NTKParmesanCrop alloc];
  objc_msgSend_crop(v5, v49, v50, v51);
  CGFloat v55 = objc_msgSend_initWithRect_(v48, v52, v53, v54);
  double v56 = [NTKParmesanAssetLayout alloc];
  uint64_t v60 = objc_msgSend_timeLayout(v5, v57, v58, v59);
  uint64_t v62 = objc_msgSend_initWithOriginalCrop_baseImageName_mask_timeLayout_colorAnalysis_imageAOTBrightness_userEdited_(v56, v61, (uint64_t)v55, (uint64_t)v29, v44, v60, 0, 1, 0.0);

  return v62;
}

- (NSMutableArray)orderList
{
  return self->_orderList;
}

- (void)setOrderList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderList, 0);
  objc_storeStrong((id *)&self->_userOverrideSession, 0);
  objc_storeStrong((id *)&self->_scaledImageCache, 0);

  objc_storeStrong((id *)&self->_assets, 0);
}

@end