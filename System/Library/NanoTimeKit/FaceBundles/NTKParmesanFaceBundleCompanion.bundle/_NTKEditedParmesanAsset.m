@interface _NTKEditedParmesanAsset
- (BOOL)addOriginalAssetAndMaskData;
- (BOOL)isInResourceDirectory;
- (CGRect)currentCrop;
- (NSData)fullSizeMaskData;
- (NSMutableDictionary)userOverrides;
- (NTKParmesanAsset)asset;
- (NTKParmesanAsset)originalAsset;
- (PHAsset)phAsset;
- (_NTKEditedParmesanAsset)initWithParmesanAsset:(id)a3 phAsset:(id)a4;
- (int64_t)lastEditedUserOverride;
- (unint64_t)subsampleFactor;
- (void)addUserOverride:(id)a3;
- (void)purgeOriginalAssetAndMaskData;
- (void)setAsset:(id)a3;
- (void)setFullSizeMaskData:(id)a3;
- (void)setLastEditedUserOverride:(int64_t)a3;
- (void)setOriginalAsset:(id)a3;
- (void)setPhAsset:(id)a3;
- (void)setSubsampleFactor:(unint64_t)a3;
- (void)setUserOverrides:(id)a3;
@end

@implementation _NTKEditedParmesanAsset

- (_NTKEditedParmesanAsset)initWithParmesanAsset:(id)a3 phAsset:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)_NTKEditedParmesanAsset;
  v9 = [(_NTKEditedParmesanAsset *)&v21 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_asset, a3);
    objc_storeStrong((id *)&v10->_phAsset, a4);
    phAsset = v10->_phAsset;
    if (phAsset) {
      uint64_t v15 = sub_246B65014(phAsset);
    }
    else {
      uint64_t v15 = 1;
    }
    v10->_subsampleFactor = v15;
    uint64_t v16 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v11, v12, v13);
    userOverrides = v10->_userOverrides;
    v10->_userOverrides = (NSMutableDictionary *)v16;

    fullSizeMaskData = v10->_fullSizeMaskData;
    v10->_lastEditedUserOverride = 1;
    v10->_fullSizeMaskData = 0;

    originalAsset = v10->_originalAsset;
    v10->_originalAsset = 0;
  }
  return v10;
}

- (BOOL)isInResourceDirectory
{
  v4 = objc_msgSend_asset(self, a2, v2, v3);
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)addUserOverride:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_timeLayout(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_scale(v8, v9, v10, v11);

  userOverrides = self->_userOverrides;
  uint64_t v16 = objc_msgSend_numberWithInteger_(NSNumber, v14, v12, v15);
  objc_msgSend_setObject_forKeyedSubscript_(userOverrides, v17, (uint64_t)v4, (uint64_t)v16);

  self->_lastEditedUserOverride = v12;
}

- (CGRect)currentCrop
{
  if (objc_msgSend_count(self->_userOverrides, a2, v2, v3))
  {
    userOverrides = self->_userOverrides;
    v9 = objc_msgSend_numberWithInteger_(NSNumber, v5, self->_lastEditedUserOverride, v7);
    uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(userOverrides, v10, (uint64_t)v9, v11);
    objc_msgSend_crop(v12, v13, v14, v15);
  }
  else
  {
    asset = self->_asset;
    if (!asset)
    {
      double v27 = *MEMORY[0x263F001A0];
      double v28 = *(double *)(MEMORY[0x263F001A0] + 8);
      double v29 = *(double *)(MEMORY[0x263F001A0] + 16);
      double v30 = *(double *)(MEMORY[0x263F001A0] + 24);
      goto LABEL_6;
    }
    v9 = objc_msgSend_preferredLayout(asset, v5, v6, v7);
    uint64_t v12 = objc_msgSend_originalCrop(v9, v21, v22, v23);
    objc_msgSend_cgRect(v12, v24, v25, v26);
  }
  double v27 = v16;
  double v28 = v17;
  double v29 = v18;
  double v30 = v19;

LABEL_6:
  double v31 = v27;
  double v32 = v28;
  double v33 = v29;
  double v34 = v30;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (BOOL)addOriginalAssetAndMaskData
{
  v50[1] = *MEMORY[0x263EF8340];
  p_originalAsset = &self->_originalAsset;
  if (self->_originalAsset) {
    return 1;
  }
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v9 = objc_msgSend_phAsset(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_localIdentifier(v9, v10, v11, v12);
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = sub_246B654BC;
  v48[3] = &unk_2651FBD50;
  v48[4] = self;
  uint64_t v14 = v5;
  v49 = v14;
  objc_msgSend_fullSizeMaskDataForAssetIdentifier_completion_(NTKParmesanPhotoProcessor, v15, (uint64_t)v13, (uint64_t)v48);

  dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  double v16 = NTKNewUniqueTeporaryResourceDirectory();
  v20 = objc_msgSend_phAsset(self, v17, v18, v19);
  v24 = objc_msgSend_localIdentifier(v20, v21, v22, v23);
  v50[0] = v24;
  uint64_t v26 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v25, (uint64_t)v50, 1);
  uint64_t v42 = MEMORY[0x263EF8330];
  uint64_t v43 = 3221225472;
  v44 = sub_246B65518;
  v45 = &unk_2651FBD78;
  v46 = self;
  double v27 = v14;
  v47 = v27;
  objc_msgSend_processAssetsWithIdentifiers_dstDir_completion_(NTKParmesanPhotoProcessor, v28, (uint64_t)v26, (uint64_t)v16, &v42);

  dispatch_semaphore_wait(v27, 0xFFFFFFFFFFFFFFFFLL);
  if (!self->_originalAsset)
  {
    double v32 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v29, v30, v31, v42, v43, v44, v45, v46);
    objc_msgSend_removeItemAtPath_error_(v32, v33, (uint64_t)v16, 0);

    objc_msgSend_logObject(NTKParmesanFaceBundle, v34, v35, v36);
    v37 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v37, OS_LOG_TYPE_ERROR)) {
      sub_246C2A45C(self, v37, v38, v39);
    }
  }
  v40 = objc_msgSend_logObject(NTKParmesanFaceBundle, v29, v30, v31, v42, v43, v44, v45, v46);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
    sub_246C2A3CC(p_originalAsset, (uint64_t)self, v40);
  }

  BOOL v3 = *p_originalAsset != 0;
  return v3;
}

- (void)purgeOriginalAssetAndMaskData
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  originalAsset = self->_originalAsset;
  if (originalAsset)
  {
    uint64_t v6 = objc_msgSend_resourceDirectory(originalAsset, a2, v2, v3);
    uint64_t v10 = objc_msgSend_logObject(NTKParmesanFaceBundle, v7, v8, v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v25 = "-[_NTKEditedParmesanAsset purgeOriginalAssetAndMaskData]";
      __int16 v26 = 2112;
      double v27 = v6;
      _os_log_impl(&dword_246B51000, v10, OS_LOG_TYPE_DEFAULT, "%s: removing temp directory at %@", buf, 0x16u);
    }

    if (v6)
    {
      uint64_t v14 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v11, v12, v13);
      id v23 = 0;
      objc_msgSend_removeItemAtURL_error_(v14, v15, (uint64_t)v6, (uint64_t)&v23);
      id v16 = v23;

      if (v16)
      {
        v20 = objc_msgSend_logObject(NTKParmesanFaceBundle, v17, v18, v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_246C2A4EC();
        }
      }
    }
    objc_super v21 = self->_originalAsset;
    self->_originalAsset = 0;

    fullSizeMaskData = self->_fullSizeMaskData;
    self->_fullSizeMaskData = 0;
  }
}

- (PHAsset)phAsset
{
  return self->_phAsset;
}

- (void)setPhAsset:(id)a3
{
}

- (unint64_t)subsampleFactor
{
  return self->_subsampleFactor;
}

- (void)setSubsampleFactor:(unint64_t)a3
{
  self->_subsampleFactor = a3;
}

- (NTKParmesanAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- (NSMutableDictionary)userOverrides
{
  return self->_userOverrides;
}

- (void)setUserOverrides:(id)a3
{
}

- (int64_t)lastEditedUserOverride
{
  return self->_lastEditedUserOverride;
}

- (void)setLastEditedUserOverride:(int64_t)a3
{
  self->_lastEditedUserOverride = a3;
}

- (NSData)fullSizeMaskData
{
  return self->_fullSizeMaskData;
}

- (void)setFullSizeMaskData:(id)a3
{
}

- (NTKParmesanAsset)originalAsset
{
  return self->_originalAsset;
}

- (void)setOriginalAsset:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalAsset, 0);
  objc_storeStrong((id *)&self->_fullSizeMaskData, 0);
  objc_storeStrong((id *)&self->_userOverrides, 0);
  objc_storeStrong((id *)&self->_asset, 0);

  objc_storeStrong((id *)&self->_phAsset, 0);
}

@end