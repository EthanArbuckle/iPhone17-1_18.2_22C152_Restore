@interface RAWRadialLensCorrection
+ (id)customAttributes;
- (BOOL)makeMapImages;
- (id)outputImage;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation RAWRadialLensCorrection

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_hasPrefix_(v7, v8, @"inputScales", v9, v10))
  {
    mapImg = self->mapImg;
    self->mapImg = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)RAWRadialLensCorrection;
  [(RAWRadialLensCorrection *)&v12 setValue:v6 forKey:v7];
}

+ (id)customAttributes
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v14[0] = xmmword_1DDBFB448;
  v14[1] = unk_1DDBFB458;
  v14[2] = xmmword_1DDBFB468;
  v14[3] = unk_1DDBFB478;
  v3 = objc_msgSend_vectorWithValues_count_(MEMORY[0x1E4F1E080], a2, (uint64_t)v14, 8, v2);
  objc_super v12 = @"inputScales";
  uint64_t v4 = *MEMORY[0x1E4F1E0C8];
  v10[0] = *MEMORY[0x1E4F1E098];
  v10[1] = v4;
  v11[0] = v3;
  v11[1] = v3;
  id v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v5, (uint64_t)v11, (uint64_t)v10, 2);
  v13 = v6;
  v8 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v7, (uint64_t)&v13, (uint64_t)&v12, 1);

  return v8;
}

- (BOOL)makeMapImages
{
  if (!self->inputScales || self->mapImg) {
    return 1;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v8 = objc_msgSend_count(self->inputScales, v4, v5, v6, v7);
    if (v8 > 2)
    {
      unint64_t v12 = v8;
      uint64_t v13 = (8 * v8 + 15) & 0xFFFFFFF0;
      objc_msgSend_dataWithLength_(MEMORY[0x1E4F1CA58], v9, v13, v10, v11);
      id v14 = objc_claimAutoreleasedReturnValue();
      uint64_t v22 = objc_msgSend_mutableBytes(v14, v15, v16, v17, v18);
      for (uint64_t i = 0; i != v12; ++i)
      {
        objc_msgSend_valueAtIndex_(self->inputScales, v19, i, v20, v21);
        *(float *)&_D0 = _D0;
        __asm { FCVT            H0, S0 }
        *(int16x4_t *)(v22 + 8 * i) = vdup_lane_s16(*(int16x4_t *)&_D0, 0);
      }
      objc_msgSend_imageWithBitmapData_bytesPerRow_size_format_colorSpace_(MEMORY[0x1E4F1E050], v19, (uint64_t)v14, v13, *MEMORY[0x1E4F1E300], 0, (double)v12, 1.0);
      v29 = (CIImage *)objc_claimAutoreleasedReturnValue();
      mapImg = self->mapImg;
      self->mapImg = v29;

      return 1;
    }
    NSLog(&cfstr_Radiallenscorr_0.isa);
  }
  else
  {
    NSLog(&cfstr_Radiallenscorr.isa);
  }
  return 0;
}

- (id)outputImage
{
  v108[3] = *MEMORY[0x1E4F143B8];
  inputImage = self->inputImage;
  if (!inputImage)
  {
    v89 = 0;
    goto LABEL_20;
  }
  if (!self->inputScales)
  {
LABEL_14:
    v89 = inputImage;
    goto LABEL_20;
  }
  if (!objc_msgSend_intValue(self->inputLDCExecuteFlags, a2, v2, v3, v4))
  {
    inputImage = self->inputImage;
    goto LABEL_14;
  }
  uint64_t v7 = sub_1DDA83E7C();
  unint64_t v8 = v7;
  if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DDA14000, v8, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWRadialLensCorrection", (const char *)&unk_1DDC3ACB6, buf, 2u);
  }

  v106[0] = MEMORY[0x1E4F143A8];
  v106[1] = 3221225472;
  v106[2] = sub_1DDAD1A50;
  v106[3] = &unk_1E6D04A58;
  v106[4] = self;
  uint64_t v9 = (void (**)(void))MEMORY[0x1E01C46E0](v106);
  if (objc_msgSend_makeMapImages(self, v10, v11, v12, v13))
  {
    objc_msgSend_extent(self->inputImage, v14, v15, v16, v17);
    double v19 = v18;
    double v21 = v20;
    long double v23 = v22;
    long double v25 = v24;
    v98 = objc_msgSend_kernelWithName_(LCKernels, v26, @"radialLens", v27, v28);
    v97 = objc_msgSend_kernelWithName_(LCKernels, v29, @"radialLensDraft", v30, v31);
    double v32 = hypot(v23, v25);
    uint64_t v37 = objc_msgSend_count(self->inputScales, v33, v34, v35, v36);
    uint64_t v42 = objc_msgSend_count(self->inputScales, v38, v39, v40, v41);
    v96 = self->inputScales;
    v47 = objc_msgSend_imageByClampingToExtent(self->inputImage, v43, v44, v45, v46);
    id v48 = self->inputColorSpace;
    uint64_t v53 = (uint64_t)v48;
    if (v48)
    {
      CFAutorelease(v48);
      uint64_t v57 = objc_msgSend_imageByColorMatchingWorkingSpaceToColorSpace_(v47, v54, v53, v55, v56);

      v47 = (void *)v57;
    }
    int v58 = objc_msgSend_BOOLValue(self->inputDraftMode, v49, v50, v51, v52);
    float v59 = 2.0 / v32;
    float v60 = (float)(unint64_t)(v42 - 1);
    float v61 = v19 + v23 * 0.5;
    float v62 = v21 + v25 * 0.5;
    v63 = v98;
    if (v58) {
      v63 = v97;
    }
    id v64 = v63;
    double v65 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
    double v95 = *MEMORY[0x1E4F1DB10];
    double v66 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
    double v67 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
    v99[0] = MEMORY[0x1E4F143A8];
    v99[1] = 3221225472;
    v99[2] = sub_1DDAD1AD8;
    v99[3] = &unk_1E6D052F0;
    float v102 = v61;
    float v103 = v62;
    float v104 = v59;
    float v105 = v60;
    v68 = v96;
    v100 = v68;
    uint64_t v101 = v37;
    mapImg = self->mapImg;
    v108[0] = v47;
    v108[1] = mapImg;
    v74 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v70, v71, v72, v73, v61, v62, v59, v60);
    v108[2] = v74;
    v77 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v75, (uint64_t)v108, 3, v76);
    v80 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v64, v78, (uint64_t)v99, (uint64_t)v77, v79, v95, v65, v66, v67);

    objc_msgSend_extent(self->inputImage, v81, v82, v83, v84);
    objc_msgSend_imageByCroppingToRect_(v80, v85, v86, v87, v88);
    v89 = (CIImage *)objc_claimAutoreleasedReturnValue();

    if (v53)
    {
      uint64_t v93 = objc_msgSend_imageByColorMatchingColorSpaceToWorkingSpace_(v89, v90, v53, v91, v92);

      v89 = (CIImage *)v93;
    }
  }
  else
  {
    v89 = 0;
  }
  v9[2](v9);

LABEL_20:

  return v89;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mapImg, 0);
  objc_storeStrong((id *)&self->inputVersion, 0);
  objc_storeStrong((id *)&self->inputLDCExecuteFlags, 0);
  objc_storeStrong((id *)&self->inputDraftMode, 0);
  objc_storeStrong(&self->inputColorSpace, 0);
  objc_storeStrong((id *)&self->inputScales, 0);

  objc_storeStrong((id *)&self->inputImage, 0);
}

@end