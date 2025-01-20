@interface RAWLensCorrectionLateralCAFilter
+ (id)customAttributes;
- (BOOL)makeMapImages;
- (id)customAttributes;
- (id)outputImage;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation RAWLensCorrectionLateralCAFilter

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_hasPrefix_(v7, v8, @"inputLateralCAMap", v9, v10))
  {
    mapImg = self->mapImg;
    self->mapImg = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)RAWLensCorrectionLateralCAFilter;
  [(RAWLensCorrectionLateralCAFilter *)&v12 setValue:v6 forKey:v7];
}

+ (id)customAttributes
{
  v13[1] = *MEMORY[0x1E4F143B8];
  objc_super v12 = @"inputLateralCAAmount";
  uint64_t v2 = *MEMORY[0x1E4F1E0E8];
  v10[0] = *MEMORY[0x1E4F1E0D8];
  v10[1] = v2;
  v11[0] = &unk_1F39AFC68;
  v11[1] = &unk_1F39AFC68;
  uint64_t v3 = *MEMORY[0x1E4F1E0D0];
  v10[2] = *MEMORY[0x1E4F1E0E0];
  v10[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F1E0F0];
  v10[4] = *MEMORY[0x1E4F1E098];
  v10[5] = v4;
  v11[2] = &unk_1F39AFC78;
  v11[3] = &unk_1F39AFC78;
  uint64_t v5 = *MEMORY[0x1E4F1E158];
  v11[4] = &unk_1F39AFC78;
  v11[5] = v5;
  id v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], a2, (uint64_t)v11, (uint64_t)v10, 6);
  v13[0] = v6;
  v8 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v7, (uint64_t)v13, (uint64_t)&v12, 1);

  return v8;
}

- (id)customAttributes
{
  uint64_t v2 = objc_opt_class();

  return (id)MEMORY[0x1F4181798](v2, sel_customAttributes, v3, v4, v5);
}

- (BOOL)makeMapImages
{
  if (!self->inputLateralCAMap || self->mapImg) {
    return 1;
  }
  unsigned int v7 = objc_msgSend_unsignedIntValue(self->inputLateralCAMapWidth, a2, v2, v3, v4);
  unsigned int v12 = objc_msgSend_unsignedIntValue(self->inputLateralCAMapHeight, v8, v9, v10, v11);
  if (v7 >= 4 && v12 > 3)
  {
    unsigned int v14 = v12;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (objc_msgSend_length(self->inputLateralCAMap, v15, v16, v17, v18) == 4 * 4 * v7 * v14)
      {
        objc_msgSend_imageWithBitmapData_bytesPerRow_size_format_colorSpace_(MEMORY[0x1E4F1E050], v19, (uint64_t)self->inputLateralCAMap, 16 * v7, *MEMORY[0x1E4F1E2F8], 0, (double)v7, (double)v14);
        v20 = (CIImage *)objc_claimAutoreleasedReturnValue();
        mapImg = self->mapImg;
        self->mapImg = v20;

        return 1;
      }
      NSLog(&cfstr_Lenscorrection_2.isa);
    }
    else
    {
      NSLog(&cfstr_Lenscorrection_1.isa);
    }
  }
  else
  {
    NSLog(&cfstr_Lenscorrection_0.isa);
  }
  return 0;
}

- (id)outputImage
{
  v91[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = sub_1DDA83E7C();
  uint64_t v4 = v3;
  if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DDA14000, v4, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWLensCorrectionLateralCAFilter", (const char *)&unk_1DDC3ACB6, buf, 2u);
  }

  v89[0] = MEMORY[0x1E4F143A8];
  v89[1] = 3221225472;
  v89[2] = sub_1DDA389A0;
  v89[3] = &unk_1E6D04A58;
  v89[4] = self;
  uint64_t v9 = (void (**)(void))MEMORY[0x1E01C46E0](v89);
  if (self->inputImage && (objc_msgSend_makeMapImages(self, v5, v6, v7, v8) & 1) != 0)
  {
    objc_msgSend_floatValue(self->inputLateralCAAmount, v10, v11, v12, v13);
    if (self->mapImg && (float v18 = fminf(fmaxf(v17, 0.0), 1.0), v18 >= 0.001))
    {
      v19 = objc_msgSend_kernelWithName_(LCKernels, v14, @"lensCorrect_lca", v15, v16, v18);
      objc_msgSend_extent(self->inputImage, v20, v21, v22, v23);
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;
      double v31 = v30;
      v36 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v32, v33, v34, v35, v24 + v28 * 0.5, v26 + v30 * 0.5, v28 * 0.5, v30 * 0.5);
      objc_msgSend_doubleValue(self->inputLateralCAMapWidth, v37, v38, v39, v40);
      double v42 = v41;
      objc_msgSend_doubleValue(self->inputLateralCAMapHeight, v43, v44, v45, v46);
      double v48 = v47;
      v53 = objc_msgSend_imageByClampingToExtent(self->mapImg, v49, v50, v51, v52);
      v85[0] = v29 / (v42 + -1.0);
      v85[1] = 0.0;
      v85[2] = 0.0;
      double v86 = v31 / (v48 + -1.0);
      double v87 = v85[0] * -0.5;
      double v88 = v86 * -0.5;
      v57 = objc_msgSend_imageByApplyingTransform_(v53, v54, (uint64_t)v85, v55, v56);

      v78[0] = MEMORY[0x1E4F143A8];
      v78[1] = 3221225472;
      v78[2] = sub_1DDA38C8C;
      v78[3] = &unk_1E6D04BF0;
      v78[4] = self;
      id v79 = &unk_1F395CB50;
      double v80 = v25;
      double v81 = v27;
      double v82 = v29;
      double v83 = v31;
      float v84 = v18;
      v58 = (void *)MEMORY[0x1E01C46E0](v78);
      inputImage = self->inputImage;
      objc_msgSend_extent(inputImage, v60, v61, v62, v63);
      double v65 = v64;
      double v67 = v66;
      double v69 = v68;
      double v71 = v70;
      v91[0] = v57;
      v91[1] = v36;
      v74 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v72, (uint64_t)v91, 2, v73);
      objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v75, (uint64_t)v19, (uint64_t)inputImage, (uint64_t)v58, v74, self->inputColorSpace, v65, v67, v69, v71);
      v76 = (CIImage *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v76 = self->inputImage;
    }
  }
  else
  {
    v76 = 0;
  }
  v9[2](v9);

  return v76;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mapImg, 0);
  objc_storeStrong(&self->inputColorSpace, 0);
  objc_storeStrong((id *)&self->inputLateralCAMapHeight, 0);
  objc_storeStrong((id *)&self->inputLateralCAMapWidth, 0);
  objc_storeStrong((id *)&self->inputLateralCAMap, 0);
  objc_storeStrong((id *)&self->inputLateralCAAmount, 0);

  objc_storeStrong((id *)&self->inputImage, 0);
}

@end