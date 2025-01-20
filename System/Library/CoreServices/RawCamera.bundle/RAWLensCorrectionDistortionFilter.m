@interface RAWLensCorrectionDistortionFilter
+ (id)customAttributes;
- (BOOL)makeMapImages;
- (id)customAttributes;
- (id)outputImage;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation RAWLensCorrectionDistortionFilter

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_hasPrefix_(v7, v8, @"inputDistortionMap", v9, v10))
  {
    mapImg = self->mapImg;
    self->mapImg = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)RAWLensCorrectionDistortionFilter;
  [(RAWLensCorrectionDistortionFilter *)&v12 setValue:v6 forKey:v7];
}

+ (id)customAttributes
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v11 = @"inputDistortionAmount";
  uint64_t v2 = *MEMORY[0x1E4F1E0E8];
  v9[0] = *MEMORY[0x1E4F1E0D8];
  v9[1] = v2;
  v10[0] = &unk_1F39AFC68;
  v10[1] = &unk_1F39AFC68;
  uint64_t v3 = *MEMORY[0x1E4F1E0D0];
  v9[2] = *MEMORY[0x1E4F1E0E0];
  v9[3] = v3;
  v10[2] = &unk_1F39AFC78;
  v10[3] = &unk_1F39AFC78;
  uint64_t v4 = *MEMORY[0x1E4F1E0C8];
  v9[4] = *MEMORY[0x1E4F1E098];
  v9[5] = v4;
  v10[4] = &unk_1F39AFC78;
  v10[5] = &unk_1F39AFC78;
  v9[6] = *MEMORY[0x1E4F1E0F0];
  v10[6] = *MEMORY[0x1E4F1E158];
  v5 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], a2, (uint64_t)v10, (uint64_t)v9, 7);
  v12[0] = v5;
  id v7 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v6, (uint64_t)v12, (uint64_t)&v11, 1);

  return v7;
}

- (id)customAttributes
{
  uint64_t v2 = objc_opt_class();

  return (id)MEMORY[0x1F4181798](v2, sel_customAttributes, v3, v4, v5);
}

- (BOOL)makeMapImages
{
  if (!self->inputDistortionMap || self->mapImg) {
    return 1;
  }
  unsigned int v7 = objc_msgSend_unsignedIntValue(self->inputDistortionMapWidth, a2, v2, v3, v4);
  unsigned int v12 = objc_msgSend_unsignedIntValue(self->inputDistortionMapHeight, v8, v9, v10, v11);
  if (v7 >= 4 && v12 > 3)
  {
    unsigned int v14 = v12;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v19 = v7;
      if (objc_msgSend_length(self->inputDistortionMap, v15, v16, v17, v18) == 8 * v14 * v7)
      {
        v23 = objc_msgSend_dataWithLength_(MEMORY[0x1E4F1CA58], v20, 16 * v14 * v7, v21, v22);
        uint64_t v28 = objc_msgSend_bytes(self->inputDistortionMap, v24, v25, v26, v27);
        id v29 = v23;
        uint64_t v34 = objc_msgSend_mutableBytes(v29, v30, v31, v32, v33);
        unsigned int v36 = 0;
        uint64_t v37 = 0;
        do
        {
          uint64_t v38 = 0;
          do
          {
            *(void *)&long long v39 = *(void *)(v28 + 8 * v36 + 8 * v38);
            *((void *)&v39 + 1) = v39;
            *(_OWORD *)(v34 + 16 * v36 + 16 * v38++) = v39;
          }
          while (v19 != v38);
          ++v37;
          v36 += v19;
        }
        while (v37 != v14);
        objc_msgSend_imageWithBitmapData_bytesPerRow_size_format_colorSpace_(MEMORY[0x1E4F1E050], v35, (uint64_t)v29, 16 * v19, *MEMORY[0x1E4F1E2F8], 0, (double)v19, (double)v14);
        v40 = (CIImage *)objc_claimAutoreleasedReturnValue();
        mapImg = self->mapImg;
        self->mapImg = v40;

        return 1;
      }
      NSLog(&cfstr_Lenscorrection_5.isa);
    }
    else
    {
      NSLog(&cfstr_Lenscorrection_4.isa);
    }
  }
  else
  {
    NSLog(&cfstr_Lenscorrection_3.isa);
  }
  return 0;
}

- (id)outputImage
{
  v92[3] = *MEMORY[0x1E4F143B8];
  if (self->inputImage)
  {
    uint64_t v3 = sub_1DDA83E7C();
    uint64_t v4 = v3;
    if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DDA14000, v4, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWLensCorrectionDistortionFilter", (const char *)&unk_1DDC3ACB6, buf, 2u);
    }

    v90[0] = MEMORY[0x1E4F143A8];
    v90[1] = 3221225472;
    v90[2] = sub_1DDA398CC;
    v90[3] = &unk_1E6D04A58;
    v90[4] = self;
    uint64_t v5 = (void (**)(void))MEMORY[0x1E01C46E0](v90);
    if (objc_msgSend_makeMapImages(self, v6, v7, v8, v9))
    {
      objc_msgSend_floatValue(self->inputDistortionAmount, v10, v11, v12, v13);
      if (self->mapImg && (float v18 = fminf(fmaxf(v17, 0.0), 1.0), v18 >= 0.001))
      {
        unsigned int v19 = objc_msgSend_kernelWithName_(LCKernels, v14, @"lensCorrect_dist", v15, v16, v18);
        objc_msgSend_extent(self->inputImage, v20, v21, v22, v23);
        double v25 = v24;
        double v27 = v26;
        double v29 = v28;
        double v31 = v30;
        unsigned int v36 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v32, v33, v34, v35, v24 + v28 * 0.5, v26 + v30 * 0.5, v28 * 0.5, v30 * 0.5);
        objc_msgSend_doubleValue(self->inputDistortionMapWidth, v37, v38, v39, v40);
        double v42 = v41;
        objc_msgSend_doubleValue(self->inputDistortionMapHeight, v43, v44, v45, v46);
        double v48 = v47;
        v53 = objc_msgSend_imageByClampingToExtent(self->mapImg, v49, v50, v51, v52);
        v86[0] = v29 / (v42 + -1.0);
        v86[1] = 0.0;
        v86[2] = 0.0;
        double v87 = v31 / (v48 + -1.0);
        double v88 = v86[0] * -0.5;
        double v89 = v87 * -0.5;
        v57 = objc_msgSend_imageByApplyingTransform_(v53, v54, (uint64_t)v86, v55, v56);

        v79[0] = MEMORY[0x1E4F143A8];
        v79[1] = 3221225472;
        v79[2] = sub_1DDA39AE4;
        v79[3] = &unk_1E6D04BF0;
        v79[4] = self;
        id v80 = &unk_1F395CB70;
        double v81 = v25;
        double v82 = v27;
        double v83 = v29;
        double v84 = v31;
        float v85 = v18;
        v58 = (void *)MEMORY[0x1E01C46E0](v79);
        inputImage = self->inputImage;
        objc_msgSend_extent(inputImage, v60, v61, v62, v63);
        double v65 = v64;
        double v67 = v66;
        double v69 = v68;
        double v71 = v70;
        inputDistortionAmount = self->inputDistortionAmount;
        v92[0] = v57;
        v92[1] = inputDistortionAmount;
        v92[2] = v36;
        v75 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v73, (uint64_t)v92, 3, v74);
        objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v76, (uint64_t)v19, (uint64_t)inputImage, (uint64_t)v58, v75, self->inputColorSpace, v65, v67, v69, v71);
        v77 = (CIImage *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v77 = self->inputImage;
      }
    }
    else
    {
      v77 = 0;
    }
    v5[2](v5);
  }
  else
  {
    v77 = 0;
  }

  return v77;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mapImg, 0);
  objc_storeStrong(&self->inputColorSpace, 0);
  objc_storeStrong((id *)&self->inputDistortionMapHeight, 0);
  objc_storeStrong((id *)&self->inputDistortionMapWidth, 0);
  objc_storeStrong((id *)&self->inputDistortionMap, 0);
  objc_storeStrong((id *)&self->inputDistortionAmount, 0);

  objc_storeStrong((id *)&self->inputImage, 0);
}

@end