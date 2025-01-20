@interface _NTKUserOverrideSession
- (BOOL)canRevert;
- (NTKParmesanLayoutUserOverride)currentOverride;
- (UIImage)photoImage;
- (UIImage)photoImageMasked;
- (_NTKParmesanPreviewValidatorImplementation)previewValidator;
- (_NTKUserOverrideSession)initWithEditedAsset:(id)a3;
- (id)previewModelForDevice:(id)a3 subsampleFactor:(double)a4;
- (void)setCanRevert:(BOOL)a3;
- (void)setCurrentOverride:(id)a3;
- (void)setPhotoImage:(id)a3;
- (void)setPhotoImageMasked:(id)a3;
- (void)setPreviewValidator:(id)a3;
@end

@implementation _NTKUserOverrideSession

- (_NTKUserOverrideSession)initWithEditedAsset:(id)a3
{
  uint64_t v163 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v161.receiver = self;
  v161.super_class = (Class)_NTKUserOverrideSession;
  v8 = [(_NTKUserOverrideSession *)&v161 init];
  if (!v8) {
    goto LABEL_33;
  }
  v9 = objc_msgSend_phAsset(v4, v5, v6, v7);
  objc_msgSend_ntk_getFullSizePHAssetData(v9, v10, v11, v12);
  CFDataRef v13 = (const __CFData *)objc_claimAutoreleasedReturnValue();

  if (!v13) {
    goto LABEL_37;
  }
  uint64_t v14 = sub_246B6F390(v13);
  if (!objc_msgSend_addOriginalAssetAndMaskData(v4, v15, v16, v17)) {
    goto LABEL_37;
  }
  uint64_t v18 = NTKCGImagePropertyOrientationToUIImageOrientation();
  v19 = (void *)MEMORY[0x263F57980];
  uint64_t v23 = objc_msgSend_subsampleFactor(v4, v20, v21, v22);
  uint64_t v25 = objc_msgSend__subsampledImageWithData_orientation_subsampleFactor_(v19, v24, (uint64_t)v13, v18, v23);
  photoImage = v8->_photoImage;
  v8->_photoImage = (UIImage *)v25;

  v30 = objc_msgSend_fullSizeMaskData(v4, v27, v28, v29);

  if (v30
    && (objc_msgSend_fullSizeMaskData(v4, v31, v32, v33),
        CFDataRef v34 = (const __CFData *)objc_claimAutoreleasedReturnValue(),
        v35 = sub_246B6F464(v34),
        v34,
        v35))
  {
    id v36 = objc_alloc(MEMORY[0x263F5DEB0]);
    unsigned int v37 = 1;
    v39 = objc_msgSend_initWithMaskImage_orientation_(v36, v38, (uint64_t)v35, 1);
    v40 = [_NTKParmesanPreviewValidatorImplementation alloc];
    uint64_t v43 = objc_msgSend_initWithPFLCValidator_(v40, v41, (uint64_t)v39, v42);
    previewValidator = v8->_previewValidator;
    v8->_previewValidator = (_NTKParmesanPreviewValidatorImplementation *)v43;

    v48 = (CGImage *)objc_msgSend_CGImage(v8->_photoImage, v45, v46, v47);
    v49 = sub_246B6F174(v48, v14, v35);
    uint64_t v51 = objc_msgSend_imageWithCGImage_scale_orientation_(MEMORY[0x263F827E8], v50, (uint64_t)v49, 0, 1.0);
    photoImageMasked = v8->_photoImageMasked;
    v8->_photoImageMasked = (UIImage *)v51;

    CGImageRelease(v49);
    CGImageRelease(v35);
  }
  else
  {
    unsigned int v37 = 0;
  }
  v53 = objc_msgSend_userOverrides(v4, v31, v32, v33);
  uint64_t v57 = objc_msgSend_count(v53, v54, v55, v56);

  if (v57)
  {
    LOBYTE(v61) = 1;
  }
  else
  {
    long long v159 = 0u;
    long long v160 = 0u;
    long long v157 = 0u;
    long long v158 = 0u;
    v62 = objc_msgSend_asset(v4, v58, v59, v60, 0);
    v66 = objc_msgSend_layouts(v62, v63, v64, v65);
    v70 = objc_msgSend_allValues(v66, v67, v68, v69);

    uint64_t v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(v70, v71, (uint64_t)&v157, (uint64_t)v162, 16);
    if (v61)
    {
      uint64_t v75 = *(void *)v158;
      while (2)
      {
        for (uint64_t i = 0; i != v61; ++i)
        {
          if (*(void *)v158 != v75) {
            objc_enumerationMutation(v70);
          }
          if (objc_msgSend_userEdited(*(void **)(*((void *)&v157 + 1) + 8 * i), v72, v73, v74))
          {
            LOBYTE(v61) = 1;
            goto LABEL_20;
          }
        }
        uint64_t v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(v70, v72, (uint64_t)&v157, (uint64_t)v162, 16);
        if (v61) {
          continue;
        }
        break;
      }
    }
LABEL_20:
  }
  v8->_canRevert = v61;
  v77 = objc_msgSend_userOverrides(v4, v58, v59, v60);
  uint64_t v81 = objc_msgSend_count(v77, v78, v79, v80);

  if (!v81)
  {
    v108 = objc_msgSend_asset(v4, v82, v83, v84);
    v101 = objc_msgSend_preferredLayout(v108, v109, v110, v111);

    if (v101
      || (objc_msgSend_originalAsset(v4, v112, v113, v114),
          v115 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend_preferredLayout(v115, v116, v117, v118),
          v101 = objc_claimAutoreleasedReturnValue(),
          v115,
          v101))
    {
      v122 = objc_alloc_init(NTKParmesanLayoutUserOverride);
      p_currentOverride = (void **)&v8->_currentOverride;
      currentOverride = v8->_currentOverride;
      v8->_currentOverride = v122;

      v128 = objc_msgSend_originalCrop(v101, v125, v126, v127);
      objc_msgSend_cgRect(v128, v129, v130, v131);
      objc_msgSend_setCrop_(v8->_currentOverride, v132, v133, v134);

      v138 = objc_msgSend_timeLayout(v101, v135, v136, v137);
      objc_msgSend_setTimeLayout_(v8->_currentOverride, v139, (uint64_t)v138, v140);

      v146 = objc_msgSend_mask(v101, v141, v142, v143);
      if (v146) {
        objc_msgSend_setUseDepthEffect_(*p_currentOverride, v144, v37, v145);
      }
      else {
        objc_msgSend_setUseDepthEffect_(*p_currentOverride, v144, 0, v145);
      }

      v150 = objc_msgSend_logObject(NTKParmesanFaceBundle, v147, v148, v149);
      if (os_log_type_enabled(v150, OS_LOG_TYPE_DEBUG)) {
        sub_246C2A5F0(v4, (const char *)&v8->_currentOverride, v150, v151);
      }

      goto LABEL_32;
    }
    objc_msgSend_logObject(NTKParmesanFaceBundle, v119, v120, v121);
    v153 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v153, OS_LOG_TYPE_ERROR)) {
      sub_246C2A560(v4, v153, v154, v155);
    }

LABEL_37:
    v152 = 0;
    goto LABEL_38;
  }
  v85 = objc_msgSend_userOverrides(v4, v82, v83, v84);
  v86 = NSNumber;
  uint64_t EditedUserOverride = objc_msgSend_lastEditedUserOverride(v4, v87, v88, v89);
  v93 = objc_msgSend_numberWithInteger_(v86, v91, EditedUserOverride, v92);
  uint64_t v96 = objc_msgSend_objectForKeyedSubscript_(v85, v94, (uint64_t)v93, v95);
  v97 = v8->_currentOverride;
  v8->_currentOverride = (NTKParmesanLayoutUserOverride *)v96;

  v101 = objc_msgSend_logObject(NTKParmesanFaceBundle, v98, v99, v100);
  if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG)) {
    sub_246C2A6C0((uint64_t)&v8->_currentOverride, v101, v102, v103, v104, v105, v106, v107);
  }
LABEL_32:

LABEL_33:
  v152 = v8;
LABEL_38:

  return v152;
}

- (id)previewModelForDevice:(id)a3 subsampleFactor:(double)a4
{
  uint64_t v7 = objc_msgSend_currentOverride(self, a2, (uint64_t)a3, v4);
  objc_msgSend_crop(v7, v8, v9, v10);
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGAffineTransformMakeScale(&v64, 1.0 / a4, 1.0 / a4);
  v66.origin.double x = v12;
  v66.origin.double y = v14;
  v66.size.double width = v16;
  v66.size.double height = v18;
  CGRect v67 = CGRectApplyAffineTransform(v66, &v64);
  double x = v67.origin.x;
  double y = v67.origin.y;
  double width = v67.size.width;
  double height = v67.size.height;

  uint64_t v23 = [NTKParmesanCropPreviewModel alloc];
  v27 = objc_msgSend_photoImage(self, v24, v25, v26);
  v31 = objc_msgSend_photoImageMasked(self, v28, v29, v30);
  v35 = objc_msgSend_previewValidator(self, v32, v33, v34);
  id v36 = [NTKParmesanCrop alloc];
  v40 = objc_msgSend_initWithRect_(v36, v37, v38, v39, x, y, width, height);
  v44 = objc_msgSend_currentOverride(self, v41, v42, v43);
  v48 = objc_msgSend_timeLayout(v44, v45, v46, v47);
  v52 = objc_msgSend_currentOverride(self, v49, v50, v51);
  uint64_t v56 = objc_msgSend_useDepthEffect(v52, v53, v54, v55);
  char canRevert = objc_msgSend_canRevert(self, v57, v58, v59);
  uint64_t v61 = objc_msgSend_initWithPhoto_maskedPhoto_previewValidator_crop_timeLayout_useDepthEffect_revertable_(v23, v60, (uint64_t)v27, (uint64_t)v31, v35, v40, v48, v56, canRevert);

  return v61;
}

- (UIImage)photoImage
{
  return self->_photoImage;
}

- (void)setPhotoImage:(id)a3
{
}

- (UIImage)photoImageMasked
{
  return self->_photoImageMasked;
}

- (void)setPhotoImageMasked:(id)a3
{
}

- (_NTKParmesanPreviewValidatorImplementation)previewValidator
{
  return self->_previewValidator;
}

- (void)setPreviewValidator:(id)a3
{
}

- (BOOL)canRevert
{
  return self->_canRevert;
}

- (void)setCanRevert:(BOOL)a3
{
  self->_char canRevert = a3;
}

- (NTKParmesanLayoutUserOverride)currentOverride
{
  return self->_currentOverride;
}

- (void)setCurrentOverride:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentOverride, 0);
  objc_storeStrong((id *)&self->_previewValidator, 0);
  objc_storeStrong((id *)&self->_photoImageMasked, 0);

  objc_storeStrong((id *)&self->_photoImage, 0);
}

@end