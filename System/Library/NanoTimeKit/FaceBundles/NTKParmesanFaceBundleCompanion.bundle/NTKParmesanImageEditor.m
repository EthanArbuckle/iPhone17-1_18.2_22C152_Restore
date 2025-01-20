@interface NTKParmesanImageEditor
- (BOOL)_writeItems:(id)a3 toResourceDirectory:(id)a4;
- (BOOL)addImages:(id)a3;
- (BOOL)allowAddingPhotoAssets;
- (BOOL)canChangeOriginalCropOfPhotoAtIndex:(int64_t)a3;
- (BOOL)savePreview:(id)a3 forPhotoAtIndex:(int64_t)a4;
- (CGRect)_defaultCropForImage:(id)a3;
- (CGSize)minimumNormalizedCropSizeForPhotoAtIndex:(int64_t)a3;
- (NSArray)imageIdentifiers;
- (id)_cropPreviewModelFromItem:(id)a3;
- (id)_defaultLayoutFromImage:(id)a3;
- (id)_encodeAndCopyImageItems:(id)a3 toResourceDirectory:(id)a4;
- (id)_itemForIdentifier:(id)a3;
- (id)_itemWithDefaultLayoutFromImage:(id)a3;
- (id)_saveImage:(id)a3 withIdentifier:(id)a4 toDirectory:(id)a5;
- (id)initForDevice:(id)a3;
- (int64_t)photosCount;
- (void)deletePhotoAtIndex:(int64_t)a3;
- (void)finalizeWithProgress:(id)a3 completion:(id)a4;
- (void)generateGalleryPreviewResourceDirectoryWithCompletion:(id)a3;
- (void)movePhotoAtIndex:(int64_t)a3 toIndex:(int64_t)a4;
- (void)previewOfLibraryPhotoAtIndex:(int64_t)a3 completion:(id)a4;
- (void)resetCropOfPhotoAtIndex:(int64_t)a3 completion:(id)a4;
- (void)setImageOrder:(id)a3;
- (void)thumbnailInfoForPhotoAtIndex:(int64_t)a3 completion:(id)a4;
@end

@implementation NTKParmesanImageEditor

- (id)initForDevice:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NTKParmesanImageEditor;
  v3 = [(NTKCompanionResourceDirectoryEditor *)&v9 initWithResourceDirectory:0 forDevice:a3];
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    items = v3->_items;
    v3->_items = (NSMutableArray *)v4;

    objc_msgSend_setState_(v3, v6, 1, v7);
  }
  return v3;
}

- (int64_t)photosCount
{
  return objc_msgSend_count(self->_items, a2, v2, v3);
}

- (BOOL)allowAddingPhotoAssets
{
  return 0;
}

- (NSArray)imageIdentifiers
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v7 = objc_msgSend_count(self->_items, v4, v5, v6);
  v10 = objc_msgSend_initWithCapacity_(v3, v8, v7, v9);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v11 = self->_items;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v24, (uint64_t)v28, 16);
  if (v13)
  {
    uint64_t v17 = v13;
    uint64_t v18 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v11);
        }
        v20 = objc_msgSend_identifier(*(void **)(*((void *)&v24 + 1) + 8 * i), v14, v15, v16, (void)v24);
        objc_msgSend_addObject_(v10, v21, (uint64_t)v20, v22);
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v24, (uint64_t)v28, 16);
    }
    while (v17);
  }

  return (NSArray *)v10;
}

- (id)_itemForIdentifier:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = self->_items;
  id v10 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v19, (uint64_t)v23, 16);
  if (v10)
  {
    uint64_t v11 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v5);
        }
        uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v14 = objc_msgSend_identifier(v13, v7, v8, v9, (void)v19);
        char isEqualToString = objc_msgSend_isEqualToString_(v14, v15, (uint64_t)v4, v16);

        if (isEqualToString)
        {
          id v10 = v13;
          goto LABEL_11;
        }
      }
      id v10 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v19, (uint64_t)v23, 16);
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v10;
}

- (BOOL)addImages:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_msgSend_setState_(self, v5, 2, v6);
  id v10 = objc_opt_new();
  if (self->_previewIsValid) {
    self->_previewIsValid = objc_msgSend_count(self->_items, v7, v8, v9) != 0;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = v4;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v25, (uint64_t)v29, 16);
  if (v13)
  {
    uint64_t v16 = v13;
    uint64_t v17 = *(void *)v26;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v11);
        }
        long long v19 = objc_msgSend__itemWithDefaultLayoutFromImage_(self, v14, *(void *)(*((void *)&v25 + 1) + 8 * v18), v15, (void)v25);
        objc_msgSend_addObject_(v10, v20, (uint64_t)v19, v21);

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v25, (uint64_t)v29, 16);
    }
    while (v16);
  }

  objc_msgSend_addObjectsFromArray_(self->_items, v22, (uint64_t)v10, v23);
  return 1;
}

- (BOOL)canChangeOriginalCropOfPhotoAtIndex:(int64_t)a3
{
  return 1;
}

- (void)deletePhotoAtIndex:(int64_t)a3
{
  objc_msgSend_removeObjectAtIndex_(self->_items, a2, a3, v3);
  if (self->_previewIsValid) {
    self->_previewIsValid = a3 != 0;
  }

  objc_msgSend_setState_(self, v6, 2, v7);
}

- (CGSize)minimumNormalizedCropSizeForPhotoAtIndex:(int64_t)a3
{
  id v4 = objc_msgSend_objectAtIndexedSubscript_(self->_items, a2, a3, v3);
  uint64_t v8 = objc_msgSend_image(v4, v5, v6, v7);

  objc_msgSend_size(v8, v9, v10, v11);
  double v13 = v12;
  objc_msgSend_size(v8, v14, v15, v16);
  double v18 = *(double *)(MEMORY[0x263F5DEA0] + 8) / v17;
  if (*MEMORY[0x263F5DEA0] / v13 <= 1.0) {
    double v19 = *MEMORY[0x263F5DEA0] / v13;
  }
  else {
    double v19 = 1.0;
  }
  if (v18 <= 1.0) {
    double v20 = v18;
  }
  else {
    double v20 = 1.0;
  }

  double v21 = v19;
  double v22 = v20;
  result.height = v22;
  result.width = v21;
  return result;
}

- (void)movePhotoAtIndex:(int64_t)a3 toIndex:(int64_t)a4
{
  objc_msgSend_objectAtIndexedSubscript_(self->_items, a2, a3, a4);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectAtIndex_(self->_items, v7, a3, v8);
  objc_msgSend_insertObject_atIndex_(self->_items, v9, (uint64_t)v14, a4 - (a4 > a3));
  if (self->_previewIsValid)
  {
    if (a3) {
      BOOL v12 = a4 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    BOOL v13 = !v12;
    self->_previewIsValid = v13;
  }
  objc_msgSend_setState_(self, v10, 2, v11);
}

- (void)setImageOrder:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_state(self, v5, v6, v7) && objc_msgSend_state(self, v8, v9, v10) <= 2)
  {
    p_items = (void **)&self->_items;
    uint64_t v15 = objc_msgSend_count(self->_items, v11, v12, v13);
    if (v15 == objc_msgSend_count(v4, v16, v17, v18))
    {
      double v22 = objc_msgSend_firstObject(*p_items, v19, v20, v21);
      uint64_t v26 = objc_msgSend_identifier(v22, v23, v24, v25);

      uint64_t v30 = objc_msgSend_firstObject(v4, v27, v28, v29);
      v33 = (void *)v30;
      BOOL v34 = (v26 | v30) == 0;
      if (v26) {
        BOOL v35 = v30 == 0;
      }
      else {
        BOOL v35 = 1;
      }
      if (v35) {
        char isEqualToString = 0;
      }
      else {
        char isEqualToString = objc_msgSend_isEqualToString_((void *)v26, v31, v30, v32);
      }
      if (self->_previewIsValid) {
        self->_previewIsValid = v34 | isEqualToString;
      }
      v38 = objc_opt_new();
      uint64_t v49 = 0;
      v50 = &v49;
      uint64_t v51 = 0x2020000000;
      char v52 = 0;
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = sub_246B5BA8C;
      v46[3] = &unk_2651FBA70;
      v46[4] = self;
      v48 = &v49;
      id v39 = v38;
      id v47 = v39;
      objc_msgSend_enumerateObjectsUsingBlock_(v4, v40, (uint64_t)v46, v41);
      if (*((unsigned char *)v50 + 24)) {
        objc_msgSend_setState_(self, v42, 2, v43);
      }
      v44 = *p_items;
      *p_items = v39;
      id v45 = v39;

      _Block_object_dispose(&v49, 8);
    }
    else
    {
      uint64_t v26 = objc_msgSend_logObject(NTKParmesanFaceBundle, v19, v20, v21);
      if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR)) {
        sub_246C29D0C(v4, (const char *)&self->_items, v26, v36);
      }
    }
  }
}

- (void)previewOfLibraryPhotoAtIndex:(int64_t)a3 completion:(id)a4
{
  items = self->_items;
  uint64_t v7 = (void (**)(id, void *, void))a4;
  objc_msgSend_objectAtIndexedSubscript_(items, v8, a3, v9);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = objc_msgSend__cropPreviewModelFromItem_(self, v10, (uint64_t)v13, v11);
  v7[2](v7, v12, 0);
}

- (void)resetCropOfPhotoAtIndex:(int64_t)a3 completion:(id)a4
{
  items = self->_items;
  uint64_t v7 = (void (**)(id, void *, void))a4;
  objc_msgSend_objectAtIndexedSubscript_(items, v8, a3, v9);
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = objc_msgSend_image(v24, v10, v11, v12);
  uint64_t v16 = objc_msgSend__defaultLayoutFromImage_(self, v14, (uint64_t)v13, v15);

  objc_msgSend_setLayout_(v24, v17, (uint64_t)v16, v18);
  objc_msgSend_setCanRevert_(v24, v19, 0, v20);
  uint64_t v23 = objc_msgSend__cropPreviewModelFromItem_(self, v21, (uint64_t)v24, v22);
  v7[2](v7, v23, 0);
}

- (BOOL)savePreview:(id)a3 forPhotoAtIndex:(int64_t)a4
{
  uint64_t v136 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v10 = objc_msgSend_logObject(NTKParmesanFaceBundle, v7, v8, v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v135 = a4;
    _os_log_impl(&dword_246B51000, v10, OS_LOG_TYPE_DEFAULT, "savePreview:%ld", buf, 0xCu);
  }

  if (objc_msgSend_state(self, v11, v12, v13) && objc_msgSend_state(self, v14, v15, v16) <= 2)
  {
    uint64_t v21 = objc_msgSend_logObject(NTKParmesanFaceBundle, v17, v18, v19);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_246C29E34((uint64_t)v6, v21);
    }

    id v24 = objc_msgSend_objectAtIndexedSubscript_(self->_items, v22, a4, v23);
    uint64_t v28 = objc_msgSend_image(v24, v25, v26, v27);
    objc_msgSend__defaultCropForImage_(self, v29, (uint64_t)v28, v30);
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    CGFloat v38 = v37;

    v42 = objc_msgSend_default(NTKParmesanTimeLayout, v39, v40, v41);
    v46 = objc_msgSend_crop(v6, v43, v44, v45);
    objc_msgSend_cgRect(v46, v47, v48, v49);
    v139.origin.x = v32;
    v139.origin.y = v34;
    v139.size.width = v36;
    v139.size.height = v38;
    if (CGRectEqualToRect(v137, v139))
    {
      v53 = objc_msgSend_timeLayout(v6, v50, v51, v52);
      char isEqual = objc_msgSend_isEqual_(v53, v54, (uint64_t)v42, v55);

      if (isEqual)
      {
LABEL_13:
        v60 = objc_msgSend_layout(v24, v57, v58, v59);
        v64 = objc_msgSend_timeLayout(v60, v61, v62, v63);
        v68 = objc_msgSend_timeLayout(v6, v65, v66, v67);
        if (objc_msgSend_isEqual_(v64, v69, (uint64_t)v68, v70))
        {
          objc_msgSend_layout(v24, v71, v72, v73);
          v74 = v133 = v42;
          objc_msgSend_crop(v74, v75, v76, v77);
          CGFloat v79 = v78;
          CGFloat v81 = v80;
          CGFloat v83 = v82;
          CGFloat v85 = v84;
          v89 = objc_msgSend_crop(v6, v86, v87, v88);
          objc_msgSend_cgRect(v89, v90, v91, v92);
          v140.origin.x = v93;
          v140.origin.y = v94;
          v140.size.width = v95;
          v140.size.height = v96;
          v138.origin.x = v79;
          v138.origin.y = v81;
          v138.size.width = v83;
          v138.size.height = v85;
          BOOL v97 = CGRectEqualToRect(v138, v140);

          v42 = v133;
          if (v97)
          {
LABEL_20:

            BOOL v20 = 1;
            goto LABEL_21;
          }
        }
        else
        {
        }
        if (self->_previewIsValid) {
          self->_previewIsValid = a4 != 0;
        }
        objc_msgSend_setState_(self, v98, 2, v99);
        v103 = objc_msgSend_crop(v6, v100, v101, v102);
        objc_msgSend_cgRect(v103, v104, v105, v106);
        double v108 = v107;
        double v110 = v109;
        double v112 = v111;
        double v114 = v113;
        v118 = objc_msgSend_layout(v24, v115, v116, v117);
        objc_msgSend_setCrop_(v118, v119, v120, v121, v108, v110, v112, v114);

        v125 = objc_msgSend_timeLayout(v6, v122, v123, v124);
        v129 = objc_msgSend_layout(v24, v126, v127, v128);
        objc_msgSend_setTimeLayout_(v129, v130, (uint64_t)v125, v131);

        goto LABEL_20;
      }
    }
    else
    {
    }
    objc_msgSend_setCanRevert_(v24, v57, 1, v59);
    goto LABEL_13;
  }
  BOOL v20 = 0;
LABEL_21:

  return v20;
}

- (void)thumbnailInfoForPhotoAtIndex:(int64_t)a3 completion:(id)a4
{
  items = self->_items;
  id v6 = (void (**)(id, void *, void *))a4;
  objc_msgSend_objectAtIndexedSubscript_(items, v7, a3, v8);
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = objc_msgSend_image(v28, v9, v10, v11);
  uint64_t v16 = objc_msgSend_layout(v28, v13, v14, v15);
  BOOL v20 = objc_msgSend_timeLayout(v16, v17, v18, v19);
  id v24 = objc_msgSend_layout(v28, v21, v22, v23);
  objc_msgSend_crop(v24, v25, v26, v27);
  v6[2](v6, v12, v20);
}

- (id)_itemWithDefaultLayoutFromImage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [NTKParmesanImageEditorItem alloc];
  uint64_t v8 = objc_msgSend__defaultLayoutFromImage_(self, v6, (uint64_t)v4, v7);
  uint64_t v10 = objc_msgSend_initWithImage_layout_(v5, v9, (uint64_t)v4, (uint64_t)v8);

  return v10;
}

- (id)_defaultLayoutFromImage:(id)a3
{
  objc_msgSend__defaultCropForImage_(self, a2, (uint64_t)a3, v3);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = objc_opt_new();
  objc_msgSend_setCrop_(v12, v13, v14, v15, v5, v7, v9, v11);
  uint64_t v19 = objc_msgSend_default(NTKParmesanTimeLayout, v16, v17, v18);
  objc_msgSend_setTimeLayout_(v12, v20, (uint64_t)v19, v21);

  objc_msgSend_setUseDepthEffect_(v12, v22, 0, v23);

  return v12;
}

- (CGRect)_defaultCropForImage:(id)a3
{
  double v3 = *MEMORY[0x263F5DEA0] / *(double *)(MEMORY[0x263F5DEA0] + 8);
  id v4 = a3;
  objc_msgSend_size(v4, v5, v6, v7);
  double v9 = v8;
  objc_msgSend_size(v4, v10, v11, v12);
  double v14 = v13;

  if (v3 * v14 >= v9) {
    double v15 = v9;
  }
  else {
    double v15 = v3 * v14;
  }
  double v16 = fmax((v9 - v15) * 0.5, 0.0);
  double v17 = v9 / v3;
  if (v9 / v3 >= v14) {
    double v17 = v14;
  }
  double v18 = fmax((v14 - v17) * 0.5, 0.0);
  result.size.height = v17;
  result.size.width = v15;
  result.origin.y = v18;
  result.origin.x = v16;
  return result;
}

- (id)_cropPreviewModelFromItem:(id)a3
{
  id v3 = a3;
  id v4 = [NTKParmesanCrop alloc];
  double v8 = objc_msgSend_layout(v3, v5, v6, v7);
  objc_msgSend_crop(v8, v9, v10, v11);
  double v15 = objc_msgSend_initWithRect_(v4, v12, v13, v14);

  double v16 = [NTKParmesanCropPreviewModel alloc];
  BOOL v20 = objc_msgSend_image(v3, v17, v18, v19);
  id v24 = objc_msgSend_layout(v3, v21, v22, v23);
  id v28 = objc_msgSend_timeLayout(v24, v25, v26, v27);
  char canRevert = objc_msgSend_canRevert(v3, v29, v30, v31);

  char v36 = canRevert;
  CGFloat v34 = objc_msgSend_initWithPhoto_maskedPhoto_previewValidator_crop_timeLayout_useDepthEffect_revertable_(v16, v33, (uint64_t)v20, 0, 0, v15, v28, 0, v36);

  return v34;
}

- (void)generateGalleryPreviewResourceDirectoryWithCompletion:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v8 = objc_msgSend_logObject(NTKParmesanFaceBundle, v5, v6, v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = objc_msgSend_count(self->_items, v9, v10, v11);
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[NTKParmesanImageEditor generateGalleryPreviewResourceDirectoryWithCompletion:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v12;
    _os_log_impl(&dword_246B51000, v8, OS_LOG_TYPE_INFO, "%s, items %lu", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v40 = sub_246B5C71C;
  uint64_t v41 = sub_246B5C72C;
  id v42 = 0;
  uint64_t v16 = objc_msgSend_state(self, v13, v14, v15);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_246B5C734;
  aBlock[3] = &unk_2651FBAC0;
  double v37 = buf;
  uint64_t v38 = v16;
  aBlock[4] = self;
  id v17 = v4;
  id v36 = v17;
  uint64_t v18 = _Block_copy(aBlock);
  if (objc_msgSend_state(self, v19, v20, v21) >= 2 && objc_msgSend_state(self, v22, v23, v24) <= 2)
  {
    if (!self->_previewIsValid)
    {
      objc_msgSend_setState_(self, v25, 3, v27);
      uint64_t v31 = dispatch_get_global_queue(2, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_246B5C8E0;
      block[3] = &unk_2651FBAE8;
      CGFloat v34 = buf;
      block[4] = self;
      id v33 = v18;
      dispatch_async(v31, block);

      goto LABEL_7;
    }
    uint64_t v29 = objc_msgSend_galleryPreviewResourceDirectory(self, v25, v26, v27);
    uint64_t v30 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = v29;

    uint64_t v28 = 1;
  }
  else
  {
    uint64_t v28 = 0;
  }
  (*((void (**)(void *, uint64_t))v18 + 2))(v18, v28);
LABEL_7:

  _Block_object_dispose(buf, 8);
}

- (void)finalizeWithProgress:(id)a3 completion:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  double v5 = (NSMutableArray *)a4;
  double v9 = objc_msgSend_logObject(NTKParmesanFaceBundle, v6, v7, v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = objc_msgSend_count(self->_items, v10, v11, v12);
    *(_DWORD *)buf = 136315394;
    id v33 = "-[NTKParmesanImageEditor finalizeWithProgress:completion:]";
    __int16 v34 = 2048;
    uint64_t v35 = v13;
    _os_log_impl(&dword_246B51000, v9, OS_LOG_TYPE_INFO, "%s, items %lu", buf, 0x16u);
  }

  if (objc_msgSend_state(self, v14, v15, v16) >= 2 && objc_msgSend_state(self, v17, v18, v19) < 3)
  {
    objc_msgSend_setState_(self, v20, 4, v21);
    uint64_t v24 = self->_items;
    uint64_t v25 = dispatch_get_global_queue(2, 0);
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = sub_246B5CC70;
    v27[3] = &unk_2651FBB88;
    uint64_t v28 = v24;
    uint64_t v29 = v5;
    v27[4] = self;
    uint64_t v23 = v24;
    uint64_t v26 = v5;
    dispatch_async(v25, v27);
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_246B5CC5C;
    block[3] = &unk_2651FBB10;
    uint64_t v31 = v5;
    uint64_t v22 = v5;
    dispatch_async(MEMORY[0x263EF83A0], block);
    uint64_t v23 = v31;
  }
}

- (BOOL)_writeItems:(id)a3 toResourceDirectory:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_logObject(NTKParmesanFaceBundle, v8, v9, v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v33 = 134218242;
    uint64_t v34 = objc_msgSend_count(v6, v12, v13, v14);
    __int16 v35 = 2114;
    id v36 = v7;
    _os_log_impl(&dword_246B51000, v11, OS_LOG_TYPE_INFO, "Writing %lu image items to %{public}@", (uint8_t *)&v33, 0x16u);
  }

  uint64_t v16 = objc_msgSend__encodeAndCopyImageItems_toResourceDirectory_(self, v15, (uint64_t)v6, (uint64_t)v7);
  uint64_t v20 = v16;
  if (!v16 || (uint64_t v21 = objc_msgSend_count(v16, v17, v18, v19), v21 != objc_msgSend_count(v6, v22, v23, v24)))
  {
    uint64_t v30 = objc_msgSend_logObject(NTKParmesanFaceBundle, v17, v18, v19);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_246C29EC0(v30);
    }
    goto LABEL_10;
  }
  char v25 = NTKPhotosWriteImageListWithVersion();
  uint64_t v29 = objc_msgSend_logObject(NTKParmesanFaceBundle, v26, v27, v28);
  uint64_t v30 = v29;
  if ((v25 & 1) == 0)
  {
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_246C29F04(v30);
    }
LABEL_10:
    BOOL v31 = 0;
    goto LABEL_11;
  }
  BOOL v31 = 1;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    LOWORD(v33) = 0;
    _os_log_impl(&dword_246B51000, v30, OS_LOG_TYPE_INFO, "Successfully wrote items", (uint8_t *)&v33, 2u);
  }
LABEL_11:

  return v31;
}

- (id)_encodeAndCopyImageItems:(id)a3 toResourceDirectory:(id)a4
{
  uint64_t v122 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  id obj = v5;
  uint64_t v105 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v116, (uint64_t)v121, 16);
  if (v105)
  {
    uint64_t v104 = *(void *)v117;
    double v9 = *MEMORY[0x263F001B0];
    double v10 = *(double *)(MEMORY[0x263F001B0] + 8);
    uint64_t v111 = (uint64_t)v6;
    v103 = v7;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v117 != v104) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v116 + 1) + 8 * v11);
        uint64_t v13 = objc_opt_class();
        id v17 = objc_msgSend_image(v12, v14, v15, v16);
        double v110 = v12;
        uint64_t v21 = objc_msgSend_layout(v12, v18, v19, v20);
        objc_msgSend_crop(v21, v22, v23, v24);
        uint64_t v27 = objc_msgSend__cropAndScaleUIImage_cropRect_outputSize_(v13, v25, (uint64_t)v17, v26);

        uint64_t v28 = NSString;
        CGFloat v32 = objc_msgSend_UUID(MEMORY[0x263F08C38], v29, v30, v31);
        id v36 = objc_msgSend_UUIDString(v32, v33, v34, v35);
        id v39 = objc_msgSend_stringWithFormat_(v28, v37, @"TransientImage-%@", v38, v36);

        uint64_t v41 = objc_msgSend__saveImage_withIdentifier_toDirectory_(self, v40, (uint64_t)v27, (uint64_t)v39, v6);
        if (!v41)
        {

          uint64_t v99 = obj;
          id v100 = 0;
          goto LABEL_18;
        }
        uint64_t v45 = (void *)v41;
        double v107 = v39;
        uint64_t v109 = v11;
        objc_msgSend_size(v27, v42, v43, v44);
        double v47 = v46;
        double v108 = v27;
        objc_msgSend_size(v27, v48, v49, v50);
        double v52 = v51;
        v53 = [NTKParmesanCrop alloc];
        v57 = objc_msgSend_initWithRect_(v53, v54, v55, v56, 0.0, 0.0, v47, v52);
        uint64_t v58 = objc_opt_new();
        long long v112 = 0u;
        long long v113 = 0u;
        long long v114 = 0u;
        long long v115 = 0u;
        uint64_t v62 = objc_msgSend_allLayouts(NTKParmesanTimeLayout, v59, v60, v61);
        uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v63, (uint64_t)&v112, (uint64_t)v120, 16);
        if (v64)
        {
          uint64_t v65 = v64;
          uint64_t v66 = *(void *)v113;
          do
          {
            for (uint64_t i = 0; i != v65; ++i)
            {
              if (*(void *)v113 != v66) {
                objc_enumerationMutation(v62);
              }
              uint64_t v68 = *(void *)(*((void *)&v112 + 1) + 8 * i);
              v69 = [NTKParmesanAssetLayout alloc];
              v71 = objc_msgSend_initWithOriginalCrop_baseImageName_mask_timeLayout_colorAnalysis_imageAOTBrightness_userEdited_(v69, v70, (uint64_t)v57, (uint64_t)v45, 0, v68, 0, 0, 0.0);
              objc_msgSend_setObject_forKey_(v58, v72, (uint64_t)v71, v68);
            }
            uint64_t v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v73, (uint64_t)&v112, (uint64_t)v120, 16);
          }
          while (v65);
        }

        uint64_t v76 = objc_msgSend_URLWithString_(NSURL, v74, v111, v75);
        uint64_t v77 = [NTKParmesanAsset alloc];
        CGFloat v81 = objc_msgSend_date(MEMORY[0x263EFF910], v78, v79, v80);
        CGFloat v85 = objc_msgSend_layout(v110, v82, v83, v84);
        v89 = objc_msgSend_timeLayout(v85, v86, v87, v88);
        uint64_t v91 = objc_msgSend_initWithLocalIdentifier_modificationDate_presentationSize_videoInfo_resourceDirectory_preferredTimeLayout_layouts_accessibilityDescription_(v77, v90, (uint64_t)v107, (uint64_t)v81, 0, v76, v89, v58, v9, v10, 0);

        CGFloat v95 = objc_msgSend_asDictionary(v91, v92, v93, v94);
        id v7 = v103;
        objc_msgSend_addObject_(v103, v96, (uint64_t)v95, v97);

        id v6 = (id)v111;
        uint64_t v11 = v109 + 1;
      }
      while (v109 + 1 != v105);
      uint64_t v105 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v98, (uint64_t)&v116, (uint64_t)v121, 16);
      if (v105) {
        continue;
      }
      break;
    }
  }
  uint64_t v99 = obj;

  id v100 = v7;
LABEL_18:

  return v100;
}

- (id)_saveImage:(id)a3 withIdentifier:(id)a4 toDirectory:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  double v9 = NSString;
  double v10 = (UIImage *)a3;
  uint64_t v13 = objc_msgSend_stringWithFormat_(v9, v11, @"base_%@.heic", v12, v7);
  uint64_t v14 = UIImageHEICRepresentation(v10);

  if (v14)
  {
    uint64_t v18 = objc_msgSend_stringByAppendingPathComponent_(v8, v15, (uint64_t)v13, v17);
    uint64_t v22 = objc_msgSend_logObject(NTKParmesanFaceBundle, v19, v20, v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v35 = v18;
      _os_log_impl(&dword_246B51000, v22, OS_LOG_TYPE_INFO, "Saving image to %{public}@", buf, 0xCu);
    }

    id v33 = 0;
    objc_msgSend_writeToFile_options_error_(v14, v23, (uint64_t)v18, 0, &v33);
    uint64_t v27 = v33;
    if (v27)
    {
      objc_msgSend_logObject(NTKParmesanFaceBundle, v24, v25, v26);
      uint64_t v28 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR)) {
        sub_246C29FC0(v27, v28, v29, v30);
      }
    }
    id v31 = v13;
  }
  else
  {
    uint64_t v27 = objc_msgSend_logObject(NTKParmesanFaceBundle, v15, v16, v17);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_246C29F48((uint64_t)v7, v27);
    }
    id v31 = 0;
  }

  return v31;
}

- (void).cxx_destruct
{
}

@end