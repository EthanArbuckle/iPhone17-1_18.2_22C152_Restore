@interface RAWLensCorrectionVignetteFilter
+ (id)customAttributes;
- (BOOL)makeMapImages;
- (id)customAttributes;
- (id)outputImage;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation RAWLensCorrectionVignetteFilter

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_hasPrefix_(v7, v8, @"inputVignetteTable", v9, v10))
  {
    vigImg = self->vigImg;
    self->vigImg = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)RAWLensCorrectionVignetteFilter;
  [(RAWLensCorrectionVignetteFilter *)&v12 setValue:v6 forKey:v7];
}

+ (id)customAttributes
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v11 = @"inputVignetteAmount";
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
  if (!self->inputVignetteTable || self->vigImg) {
    return 1;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v7 = objc_msgSend_length(self->inputVignetteTable, v3, v4, v5, v6);
    objc_super v12 = (const float *)objc_msgSend_bytes(self->inputVignetteTable, v8, v9, v10, v11);
    objc_msgSend_dataWithLength_(MEMORY[0x1E4F1CA58], v13, (4 * v7) & 0xFFFFFFFFFFFFFFF0, v14, v15);
    id v16 = objc_claimAutoreleasedReturnValue();
    v21 = (float32x4_t *)objc_msgSend_mutableBytes(v16, v17, v18, v19, v20);
    unint64_t v26 = v7 >> 2;
    if (v7 >= 4)
    {
      if (v26 <= 1) {
        uint64_t v27 = 1;
      }
      else {
        uint64_t v27 = v7 >> 2;
      }
      do
      {
        float32x4_t v28 = vld1q_dup_f32(v12++);
        *v21++ = v28;
        --v27;
      }
      while (v27);
    }
    v29 = (void *)MEMORY[0x1E4F1E050];
    uint64_t v30 = objc_msgSend_length(v16, v22, v23, v24, v25);
    objc_msgSend_imageWithBitmapData_bytesPerRow_size_format_colorSpace_(v29, v31, (uint64_t)v16, v30, *MEMORY[0x1E4F1E2F8], 0, (double)v26, 1.0);
    v32 = (CIImage *)objc_claimAutoreleasedReturnValue();
    vigImg = self->vigImg;
    self->vigImg = v32;

    return 1;
  }
  NSLog(&cfstr_Lenscorrection.isa);
  return 0;
}

- (id)outputImage
{
  v69[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = sub_1DDA83E7C();
  uint64_t v4 = v3;
  if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DDA14000, v4, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWLensCorrectionVignetteFilter", (const char *)&unk_1DDC3ACB6, buf, 2u);
  }

  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = sub_1DDA38068;
  v67[3] = &unk_1E6D04A58;
  v67[4] = self;
  uint64_t v9 = (void (**)(void))MEMORY[0x1E01C46E0](v67);
  if (self->inputImage && (objc_msgSend_makeMapImages(self, v5, v6, v7, v8) & 1) != 0)
  {
    objc_msgSend_floatValue(self->inputVignetteAmount, v10, v11, v12, v13);
    if (self->vigImg && (double v18 = fminf(fmaxf(v17, 0.0), 1.0), v18 >= 0.001))
    {
      v21 = objc_msgSend_kernelWithName_(LCKernels, v14, @"lensCorrect_vig", v15, v16);
      objc_msgSend_extent(self->inputImage, v22, v23, v24, v25);
      double v27 = v26;
      double v29 = v28;
      double v31 = v30;
      double v33 = v32;
      objc_msgSend_extent(self->vigImg, v34, v35, v36, v37);
      float v39 = v38;
      float v40 = v31 * 0.5;
      float v41 = v33 * 0.5;
      float v42 = hypotf(v40, v41);
      v47 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v43, v44, v45, v46, v27 + v31 * 0.5, v29 + v33 * 0.5, (float)((float)(v39 + -1.0) / v42), v18);
      inputImage = self->inputImage;
      objc_msgSend_extent(inputImage, v49, v50, v51, v52);
      double v54 = v53;
      double v56 = v55;
      double v58 = v57;
      double v60 = v59;
      v65[0] = MEMORY[0x1E4F143A8];
      v65[1] = 3221225472;
      v65[2] = sub_1DDA380F0;
      v65[3] = &unk_1E6D04BA8;
      *(float *)&uint64_t v66 = v39;
      v69[0] = self->vigImg;
      v69[1] = v47;
      v63 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v61, (uint64_t)v69, 2, v62, MEMORY[0x1E4F143A8], 3221225472, sub_1DDA380F0, &unk_1E6D04BA8, v66);
      objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v64, (uint64_t)v21, (uint64_t)inputImage, (uint64_t)v65, v63, self->inputColorSpace, v54, v56, v58, v60);
      uint64_t v19 = (CIImage *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v19 = self->inputImage;
    }
  }
  else
  {
    uint64_t v19 = 0;
  }
  v9[2](v9);

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->vigImg, 0);
  objc_storeStrong(&self->inputColorSpace, 0);
  objc_storeStrong((id *)&self->inputVignetteAmount, 0);
  objc_storeStrong((id *)&self->inputVignetteTable, 0);

  objc_storeStrong((id *)&self->inputImage, 0);
}

@end