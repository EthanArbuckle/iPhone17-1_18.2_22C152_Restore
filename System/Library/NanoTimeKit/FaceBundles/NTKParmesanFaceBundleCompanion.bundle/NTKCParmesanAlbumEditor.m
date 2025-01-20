@interface NTKCParmesanAlbumEditor
- (BOOL)_writeImageList:(id)a3 version:(int64_t)a4 toDirectory:(id)a5;
- (BOOL)setShuffleSelection:(id)a3 withKeyAssetIdentifier:(id)a4 albumName:(id)a5;
- (BOOL)shouldFinalize;
- (NSString)albumIdentifier;
- (NSString)albumName;
- (NSString)keyAssetIdentifier;
- (NSString)uuidString;
- (NTKCParmesanAlbumEditor)initWithResourceDirectory:(id)a3 forDevice:(id)a4 shouldFinalize:(BOOL)a5;
- (NTKParmesanShuffleSelection)shuffleSelection;
- (id)_fetchSingleAsset;
- (id)localizedShuffleDescription;
- (id)optionsForSingleAsset;
- (id)titleForCollectionWithIdentifier:(id)a3;
- (void)_createResourceDirectoryForSinglePHAssetWithPreviewOnly:(BOOL)a3 completion:(id)a4;
- (void)finalizeWithProgress:(id)a3 completion:(id)a4;
- (void)generateGalleryPreviewResourceDirectoryWithCompletion:(id)a3;
- (void)setAlbumIdentifier:(id)a3;
- (void)setAlbumName:(id)a3;
- (void)setKeyAssetIdentifier:(id)a3;
- (void)setShouldFinalize:(BOOL)a3;
- (void)setShuffleSelection:(id)a3;
- (void)setUuidString:(id)a3;
@end

@implementation NTKCParmesanAlbumEditor

- (NTKCParmesanAlbumEditor)initWithResourceDirectory:(id)a3 forDevice:(id)a4 shouldFinalize:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v49.receiver = self;
  v49.super_class = (Class)NTKCParmesanAlbumEditor;
  v9 = [(NTKCompanionResourceDirectoryEditor *)&v49 initWithResourceDirectory:v8 forDevice:a4];
  v12 = v9;
  if (v9)
  {
    objc_msgSend_setShouldFinalize_(v9, v10, v5, v11);
    v15 = objc_msgSend_readerForResourceDirectory_(NTKParmesanAssetReader, v13, (uint64_t)v8, v14);
    if (objc_msgSend_isShuffle(v15, v16, v17, v18))
    {
      objc_msgSend_shuffleSelection(v15, v19, v20, v21);
      v22 = (NTKParmesanShuffleSelection *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = objc_msgSend_assetCollectionIdentifier(v15, v19, v20, v21);
      if (v26)
      {
        v27 = [NTKParmesanShuffleSelection alloc];
        v22 = (NTKParmesanShuffleSelection *)objc_msgSend_initWithCollection_(v27, v28, (uint64_t)v26, v29);
      }
      else
      {
        v30 = objc_msgSend_logObject(NTKParmesanFaceBundle, v23, v24, v25);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          sub_246C2B1D8();
        }

        v22 = 0;
      }
    }
    shuffleSelection = v12->_shuffleSelection;
    v12->_shuffleSelection = v22;
    v32 = v22;

    v36 = objc_msgSend_firstObject(v15, v33, v34, v35);
    uint64_t v40 = objc_msgSend_localIdentifier(v36, v37, v38, v39);
    keyAssetIdentifier = v12->_keyAssetIdentifier;
    v12->_keyAssetIdentifier = (NSString *)v40;

    uint64_t v45 = objc_msgSend_uuidString(v15, v42, v43, v44);
    uuidString = v12->_uuidString;
    v12->_uuidString = (NSString *)v45;

    albumName = v12->_albumName;
    v12->_albumName = 0;
  }
  return v12;
}

- (NSString)albumIdentifier
{
  return (NSString *)objc_msgSend_collectionIdentifier(self->_shuffleSelection, a2, v2, v3);
}

- (void)setAlbumIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    BOOL v5 = [NTKParmesanShuffleSelection alloc];
    id v8 = (NTKParmesanShuffleSelection *)objc_msgSend_initWithCollection_(v5, v6, (uint64_t)v4, v7);

    shuffleSelection = self->_shuffleSelection;
    self->_shuffleSelection = v8;
  }
}

- (BOOL)shouldFinalize
{
  return objc_msgSend_state(self, a2, v2, v3) == 2;
}

- (void)setShouldFinalize:(BOOL)a3
{
  BOOL v4 = a3;
  if (objc_msgSend_state(self, a2, a3, v3) < 3)
  {
    if (v4) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = 1;
    }
    objc_msgSend_setState_(self, v6, v10, v8);
  }
  else
  {
    v9 = objc_msgSend_logObject(NTKParmesanFaceBundle, v6, v7, v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_246C2B240(v9);
    }
  }
}

- (BOOL)setShuffleSelection:(id)a3 withKeyAssetIdentifier:(id)a4 albumName:(id)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v47 = a5;
  uint64_t v14 = objc_msgSend_shuffleTypesAsNSNumbers(v9, v11, v12, v13);
  uint64_t v18 = objc_msgSend_count(v14, v15, v16, v17);
  v22 = objc_msgSend_collectionIdentifier(v9, v19, v20, v21);
  BOOL v23 = v22 == 0;

  if ((v18 != 0) != v23)
  {
    v27 = objc_msgSend_logObject(NTKParmesanFaceBundle, v24, v25, v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_246C2B284();
    }
LABEL_13:

    BOOL v45 = 0;
    goto LABEL_14;
  }
  if (v18)
  {
    char v28 = objc_msgSend_containsObject_(v14, v24, (uint64_t)&unk_26FB35358, v26);
    v32 = objc_msgSend_personIdentifiers(v9, v29, v30, v31);
    char v36 = v28 ^ (objc_msgSend_count(v32, v33, v34, v35) == 0);

    if ((v36 & 1) == 0)
    {
      v27 = objc_msgSend_logObject(NTKParmesanFaceBundle, v24, v37, v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_246C2B2EC();
      }
      goto LABEL_13;
    }
  }
  if ((objc_msgSend_isEqual_(self->_shuffleSelection, v24, (uint64_t)v9, v26) & 1) == 0)
  {
    v41 = objc_msgSend_logObject(NTKParmesanFaceBundle, v38, v39, v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v49 = v9;
      __int16 v50 = 2112;
      id v51 = v10;
      _os_log_impl(&dword_246B51000, v41, OS_LOG_TYPE_DEFAULT, "setShuffleSelection: setting new shuffle selection to %@, keyAsset: %@", buf, 0x16u);
    }

    objc_storeStrong((id *)&self->_shuffleSelection, a3);
    objc_storeStrong((id *)&self->_albumName, a5);
    objc_storeStrong((id *)&self->_keyAssetIdentifier, a4);
    uuidString = self->_uuidString;
    self->_uuidString = 0;

    objc_msgSend_setState_(self, v43, 2, v44);
  }
  BOOL v45 = 1;
LABEL_14:

  return v45;
}

- (void)generateGalleryPreviewResourceDirectoryWithCompletion:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_logObject(NTKParmesanFaceBundle, v5, v6, v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = objc_opt_class();
    id v9 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_246B51000, v8, OS_LOG_TYPE_DEFAULT, "generateGalleryPreviewResourceDirectoryWithCompletion: generating preview for %@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v40 = 0x3032000000;
  v41 = sub_246B7694C;
  v42 = sub_246B7695C;
  id v43 = 0;
  uint64_t v13 = objc_msgSend_state(self, v10, v11, v12);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_246B76964;
  aBlock[3] = &unk_2651FC3B0;
  p_long long buf = &buf;
  uint64_t v38 = v13;
  aBlock[4] = self;
  id v14 = v4;
  id v36 = v14;
  v15 = _Block_copy(aBlock);
  if (objc_msgSend_state(self, v16, v17, v18) && objc_msgSend_state(self, v19, v20, v21) <= 2)
  {
    if (objc_msgSend_state(self, v22, v23, v24) != 1)
    {
      objc_msgSend_setState_(self, v26, 3, v28);
      uint64_t v31 = dispatch_get_global_queue(2, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_246B76A84;
      block[3] = &unk_2651FC400;
      block[4] = self;
      uint64_t v34 = &buf;
      id v33 = v15;
      dispatch_async(v31, block);

      goto LABEL_7;
    }
    uint64_t v29 = objc_msgSend_resourceDirectory(self, v26, v27, v28);
    uint64_t v30 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v29;

    uint64_t v25 = 1;
  }
  else
  {
    uint64_t v25 = 0;
  }
  (*((void (**)(void *, uint64_t))v15 + 2))(v15, v25);
LABEL_7:

  _Block_object_dispose(&buf, 8);
}

- (id)localizedShuffleDescription
{
  BOOL v5 = objc_msgSend_collectionIdentifier(self->_shuffleSelection, a2, v2, v3);

  shuffleSelection = self->_shuffleSelection;
  if (v5)
  {
    id v10 = objc_msgSend_collectionIdentifier(shuffleSelection, v6, v7, v8);
    uint64_t v13 = objc_msgSend_titleForCollectionWithIdentifier_(self, v11, (uint64_t)v10, v12);
  }
  else
  {
    uint64_t v13 = objc_msgSend_shuffleName(shuffleSelection, v6, v7, v8);
  }

  return v13;
}

- (id)titleForCollectionWithIdentifier:(id)a3
{
  v29[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x263F14E98];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_sharedPhotoLibrary(v3, v5, v6, v7);
  uint64_t v12 = objc_msgSend_librarySpecificFetchOptions(v8, v9, v10, v11);

  objc_msgSend_setWantsIncrementalChangeDetails_(v12, v13, 0, v14);
  v15 = (void *)MEMORY[0x263F14D28];
  v29[0] = v4;
  uint64_t v17 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v16, (uint64_t)v29, 1);
  v19 = objc_msgSend_fetchAssetCollectionsWithLocalIdentifiers_options_(v15, v18, (uint64_t)v17, (uint64_t)v12);

  uint64_t v23 = objc_msgSend_firstObject(v19, v20, v21, v22);
  uint64_t v27 = objc_msgSend_localizedTitle(v23, v24, v25, v26);

  return v27;
}

- (void)finalizeWithProgress:(id)a3 completion:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_logObject(NTKParmesanFaceBundle, v8, v9, v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v44 = (char *)objc_opt_class();
    uint64_t v12 = v44;
    _os_log_impl(&dword_246B51000, v11, OS_LOG_TYPE_DEFAULT, "finalizeWithProgress:completion: finalizing %@", buf, 0xCu);
  }
  if (!objc_msgSend_state(self, v13, v14, v15) || objc_msgSend_state(self, v16, v17, v18) >= 3)
  {
    v19 = objc_msgSend_logObject(NTKParmesanFaceBundle, v16, v17, v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = objc_msgSend_state(self, v20, v21, v22);
      *(_DWORD *)long long buf = 136315394;
      uint64_t v44 = "-[NTKCParmesanAlbumEditor finalizeWithProgress:completion:]";
      __int16 v45 = 2048;
      uint64_t v46 = v23;
      _os_log_impl(&dword_246B51000, v19, OS_LOG_TYPE_DEFAULT, "%s: Cannot finalize in state: %ld", buf, 0x16u);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_246B770E8;
    block[3] = &unk_2651FBB10;
    uint64_t v24 = &v42;
    id v42 = v7;
    uint64_t v25 = MEMORY[0x263EF83A0];
    uint64_t v26 = block;
LABEL_8:
    dispatch_async(v25, v26);
    goto LABEL_9;
  }
  if (objc_msgSend_state(self, v16, v17, v18) == 1)
  {
    uint64_t v30 = objc_msgSend_logObject(NTKParmesanFaceBundle, v27, v28, v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v44 = "-[NTKCParmesanAlbumEditor finalizeWithProgress:completion:]";
      _os_log_impl(&dword_246B51000, v30, OS_LOG_TYPE_INFO, "%s: Unmodified editor, no need to finalize", buf, 0xCu);
    }

    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = sub_246B770FC;
    v39[3] = &unk_2651FBE38;
    uint64_t v24 = &v40;
    v39[4] = self;
    id v40 = v7;
    uint64_t v25 = MEMORY[0x263EF83A0];
    uint64_t v26 = v39;
    goto LABEL_8;
  }
  objc_msgSend_setState_(self, v27, 4, v29);
  uint64_t v34 = objc_msgSend_logObject(NTKParmesanFaceBundle, v31, v32, v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
    sub_246C2B3E4(v34);
  }

  uint64_t v35 = dispatch_get_global_queue(2, 0);
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = sub_246B77158;
  v36[3] = &unk_2651FBF00;
  uint64_t v24 = &v37;
  v36[4] = self;
  id v37 = v6;
  id v38 = v7;
  dispatch_async(v35, v36);

LABEL_9:
}

- (id)optionsForSingleAsset
{
  v22[1] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263F14E18]);
  BOOL v5 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v3, @"(mediaType = %ld) && ((playbackStyle = %ld) || (playbackStyle = %ld))", v4, 1, 1, 3);
  objc_msgSend_setPredicate_(v2, v6, (uint64_t)v5, v7);

  uint64_t v9 = objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x263F08B30], v8, @"creationDate", 1);
  v22[0] = v9;
  uint64_t v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v10, (uint64_t)v22, 1);
  objc_msgSend_setSortDescriptors_(v2, v12, (uint64_t)v11, v13);

  uint64_t v21 = *MEMORY[0x263F15008];
  uint64_t v15 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v14, (uint64_t)&v21, 1);
  objc_msgSend_addFetchPropertySets_(v2, v16, (uint64_t)v15, v17);

  objc_msgSend_setFetchLimit_(v2, v18, 1, v19);

  return v2;
}

- (void)_createResourceDirectoryForSinglePHAssetWithPreviewOnly:(BOOL)a3 completion:(id)a4
{
  v28[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = sub_246B7694C;
  uint64_t v26 = sub_246B7695C;
  NTKPhotosCreateResourceDirectory();
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  if (v23[5])
  {
    uint64_t v9 = objc_msgSend__fetchSingleAsset(self, v6, v7, v8);
    if (v9)
    {
      uint64_t v10 = objc_opt_class();
      uint64_t v14 = objc_msgSend_localIdentifier(v9, v11, v12, v13);
      v28[0] = v14;
      uint64_t v16 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v15, (uint64_t)v28, 1);
      uint64_t v17 = v23[5];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = sub_246B777AC;
      v19[3] = &unk_2651FC450;
      v19[4] = self;
      uint64_t v21 = &v22;
      id v20 = v5;
      objc_msgSend_transcodeAssetsWithIdentifiers_to_completion_(v10, v18, (uint64_t)v16, v17, v19);
    }
    else
    {
      (*((void (**)(id, void))v5 + 2))(v5, 0);
    }
  }
  else
  {
    (*((void (**)(id, void))v5 + 2))(v5, 0);
  }
  _Block_object_dispose(&v22, 8);
}

- (id)_fetchSingleAsset
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend_shuffleSelection(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_collectionIdentifier(v5, v6, v7, v8);

  uint64_t v16 = objc_msgSend_optionsForSingleAsset(self, v10, v11, v12);
  if (v9)
  {
    uint64_t v17 = objc_msgSend_logObject(NTKParmesanFaceBundle, v13, v14, v15);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v52 = v9;
      _os_log_impl(&dword_246B51000, v17, OS_LOG_TYPE_DEFAULT, "NTKCParmesanAlbumEditor: fetching first asset in %@", buf, 0xCu);
    }

    uint64_t v18 = (void *)MEMORY[0x263F14D28];
    __int16 v50 = v9;
    id v20 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v19, (uint64_t)&v50, 1);
    uint64_t v22 = objc_msgSend_fetchAssetCollectionsWithLocalIdentifiers_options_(v18, v21, (uint64_t)v20, 0);
    uint64_t v26 = objc_msgSend_firstObject(v22, v23, v24, v25);

    uint64_t v28 = objc_msgSend_fetchAssetsInAssetCollection_options_(MEMORY[0x263F14D18], v27, (uint64_t)v26, (uint64_t)v16);
    uint64_t v32 = objc_msgSend_firstObject(v28, v29, v30, v31);

    id v36 = objc_msgSend_logObject(NTKParmesanFaceBundle, v33, v34, v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v52 = v32;
      _os_log_impl(&dword_246B51000, v36, OS_LOG_TYPE_DEFAULT, "NTKCParmesanAlbumEditor: fetched asset %@", buf, 0xCu);
    }
  }
  else
  {
    keyAssetIdentifier = self->_keyAssetIdentifier;
    if (keyAssetIdentifier)
    {
      uint64_t v39 = (void *)MEMORY[0x263F14D18];
      id v49 = keyAssetIdentifier;
      id v40 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v13, (uint64_t)&v49, 1);
      id v42 = objc_msgSend_fetchAssetsWithLocalIdentifiers_options_(v39, v41, (uint64_t)v40, (uint64_t)v16);
      uint64_t v32 = objc_msgSend_firstObject(v42, v43, v44, v45);

      uint64_t v26 = objc_msgSend_logObject(NTKParmesanFaceBundle, v46, v47, v48);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v52 = v32;
        _os_log_impl(&dword_246B51000, v26, OS_LOG_TYPE_DEFAULT, "NTKCParmesanAlbumEditor: fetched key asset %@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v26 = objc_msgSend_logObject(NTKParmesanFaceBundle, v13, v14, v15);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_246C2B4E0(v26);
      }
      uint64_t v32 = 0;
    }
  }

  return v32;
}

- (BOOL)_writeImageList:(id)a3 version:(int64_t)a4 toDirectory:(id)a5
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = objc_opt_new();
  uint64_t v13 = objc_msgSend_numberWithInteger_(NSNumber, v11, a4, v12);
  objc_msgSend_setObject_forKeyedSubscript_(v10, v14, (uint64_t)v13, (uint64_t)kParmesanReaderVersionKey);

  objc_msgSend_setObject_forKeyedSubscript_(v10, v15, (uint64_t)v9, (uint64_t)kParmesanReaderImageListKey);
  uint64_t v19 = objc_msgSend_collectionIdentifier(self->_shuffleSelection, v16, v17, v18);

  if (v19)
  {
    uint64_t v23 = objc_msgSend_collectionIdentifier(self->_shuffleSelection, v20, v21, v22);
    objc_msgSend_setObject_forKeyedSubscript_(v10, v24, (uint64_t)v23, (uint64_t)kParmesanReaderAssetCollectionIdentifierKey);
  }
  uint64_t v25 = objc_msgSend_personIdentifiers(self->_shuffleSelection, v20, v21, v22);
  uint64_t v29 = objc_msgSend_count(v25, v26, v27, v28);

  if (v29)
  {
    uint64_t v33 = objc_msgSend_personIdentifiers(self->_shuffleSelection, v30, v31, v32);
    objc_msgSend_setObject_forKeyedSubscript_(v10, v34, (uint64_t)v33, (uint64_t)kParmesanReaderPeopleIdentifiersKey);
  }
  uint64_t v35 = objc_msgSend_shuffleTypesAsNSNumbers(self->_shuffleSelection, v30, v31, v32);
  int v38 = objc_msgSend_containsObject_(v35, v36, (uint64_t)&unk_26FB35358, v37);
  uint64_t v40 = MEMORY[0x263EFFA80];
  uint64_t v41 = MEMORY[0x263EFFA88];
  if (v38) {
    objc_msgSend_setObject_forKeyedSubscript_(v10, v39, MEMORY[0x263EFFA88], (uint64_t)kParmesanReaderHasPeopleKey);
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v10, v39, MEMORY[0x263EFFA80], (uint64_t)kParmesanReaderHasPeopleKey);
  }
  if (objc_msgSend_containsObject_(v35, v42, (uint64_t)&unk_26FB35370, v43)) {
    objc_msgSend_setObject_forKeyedSubscript_(v10, v44, v41, (uint64_t)kParmesanReaderHasPetsKey);
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v10, v44, v40, (uint64_t)kParmesanReaderHasPetsKey);
  }
  if (objc_msgSend_containsObject_(v35, v45, (uint64_t)&unk_26FB35388, v46)) {
    objc_msgSend_setObject_forKeyedSubscript_(v10, v47, v41, (uint64_t)kParmesanReaderHasNatureKey);
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v10, v47, v40, (uint64_t)kParmesanReaderHasNatureKey);
  }
  if (objc_msgSend_containsObject_(v35, v48, (uint64_t)&unk_26FB353A0, v49)) {
    objc_msgSend_setObject_forKeyedSubscript_(v10, v50, v41, (uint64_t)kParmesanReaderHasCityscapesKey);
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v10, v50, v40, (uint64_t)kParmesanReaderHasCityscapesKey);
  }
  uuidString = self->_uuidString;
  if (uuidString) {
    objc_msgSend_setObject_forKeyedSubscript_(v10, v51, (uint64_t)uuidString, (uint64_t)kParmesanReaderUUIDStringKey);
  }
  v54 = objc_msgSend_stringByAppendingPathComponent_(v8, v51, (uint64_t)kParmesanReaderImagelistFileName, v52);
  v58 = objc_msgSend_logObject(NTKParmesanFaceBundle, v55, v56, v57);
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    int v63 = 138412290;
    v64 = v54;
    _os_log_impl(&dword_246B51000, v58, OS_LOG_TYPE_DEFAULT, "writing image list to path %@", (uint8_t *)&v63, 0xCu);
  }

  char v60 = objc_msgSend_writeToFile_atomically_(v10, v59, (uint64_t)v54, 0);
  if ((v60 & 1) == 0)
  {
    v61 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      sub_246C2B524();
    }
  }
  return v60;
}

- (NTKParmesanShuffleSelection)shuffleSelection
{
  return self->_shuffleSelection;
}

- (void)setShuffleSelection:(id)a3
{
}

- (NSString)keyAssetIdentifier
{
  return self->_keyAssetIdentifier;
}

- (void)setKeyAssetIdentifier:(id)a3
{
}

- (NSString)uuidString
{
  return self->_uuidString;
}

- (void)setUuidString:(id)a3
{
}

- (NSString)albumName
{
  return self->_albumName;
}

- (void)setAlbumName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_albumName, 0);
  objc_storeStrong((id *)&self->_uuidString, 0);
  objc_storeStrong((id *)&self->_keyAssetIdentifier, 0);

  objc_storeStrong((id *)&self->_shuffleSelection, 0);
}

@end