@interface RAWLocalToneMap
+ (id)customAttributes;
- (BOOL)makeToneCurveImage;
- (id)outputImage;
@end

@implementation RAWLocalToneMap

+ (id)customAttributes
{
  v46[7] = *MEMORY[0x1E4F143B8];
  v45[0] = *MEMORY[0x1E4F1E0B8];
  uint64_t v3 = *MEMORY[0x1E4F1E1B0];
  v44[0] = *MEMORY[0x1E4F1E190];
  v44[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4F1E180];
  v44[2] = *MEMORY[0x1E4F1E1B8];
  v44[3] = v4;
  v44[4] = *MEMORY[0x1E4F1E170];
  v27 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], a2, (uint64_t)v44, 5, v2);
  v46[0] = v27;
  v45[1] = @"inputAmount";
  uint64_t v6 = *MEMORY[0x1E4F1E0E8];
  v38[0] = *MEMORY[0x1E4F1E0D8];
  uint64_t v5 = v38[0];
  v38[1] = v6;
  v43[0] = &unk_1F39AFBD8;
  v43[1] = &unk_1F39AFBD8;
  uint64_t v8 = *MEMORY[0x1E4F1E0D0];
  uint64_t v39 = *MEMORY[0x1E4F1E0E0];
  uint64_t v7 = v39;
  uint64_t v40 = v8;
  v43[2] = &unk_1F39AFBE8;
  v43[3] = &unk_1F39AFBF8;
  uint64_t v10 = *MEMORY[0x1E4F1E0F0];
  uint64_t v41 = *MEMORY[0x1E4F1E098];
  uint64_t v9 = v41;
  uint64_t v42 = v10;
  uint64_t v11 = *MEMORY[0x1E4F1E158];
  v43[4] = &unk_1F39AFC08;
  v43[5] = v11;
  v26 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v12, (uint64_t)v43, (uint64_t)v38, 6);
  v46[1] = v26;
  v45[2] = @"inputShadowAmount";
  v36[0] = v5;
  v36[1] = v6;
  v37[0] = &unk_1F39AFBD8;
  v37[1] = &unk_1F39AFBD8;
  v36[2] = v7;
  v36[3] = v8;
  v37[2] = &unk_1F39AFBE8;
  v37[3] = &unk_1F39AFBF8;
  v36[4] = v9;
  v36[5] = v10;
  v37[4] = &unk_1F39AFC08;
  v37[5] = v11;
  v25 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v13, (uint64_t)v37, (uint64_t)v36, 6);
  v46[2] = v25;
  v45[3] = @"inputHighlightAmount";
  v34[0] = v5;
  v34[1] = v6;
  v35[0] = &unk_1F39AFBD8;
  v35[1] = &unk_1F39AFBD8;
  v34[2] = v7;
  v34[3] = v8;
  v35[2] = &unk_1F39AFBE8;
  v35[3] = &unk_1F39AFBF8;
  v34[4] = v9;
  v34[5] = v10;
  v35[4] = &unk_1F39AFC08;
  v35[5] = v11;
  v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v14, (uint64_t)v35, (uint64_t)v34, 6);
  v46[3] = v24;
  v45[4] = @"inputShadowCutoff";
  v32[0] = v5;
  v32[1] = v6;
  v33[0] = &unk_1F39AFBD8;
  v33[1] = &unk_1F39AFBD8;
  v32[2] = v7;
  v32[3] = v8;
  v33[2] = &unk_1F39AFC08;
  v33[3] = &unk_1F39AFC08;
  v32[4] = v9;
  v32[5] = v10;
  v33[4] = &unk_1F39AFC18;
  v33[5] = v11;
  v23 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v15, (uint64_t)v33, (uint64_t)v32, 6);
  v46[4] = v23;
  v45[5] = @"inputHighlightCutoff";
  v30[0] = v5;
  v30[1] = v6;
  v31[0] = &unk_1F39AFBD8;
  v31[1] = &unk_1F39AFBD8;
  v30[2] = v7;
  v30[3] = v8;
  v31[2] = &unk_1F39AFC08;
  v31[3] = &unk_1F39AFC08;
  v30[4] = v9;
  v30[5] = v10;
  v31[4] = &unk_1F39AFC28;
  v31[5] = v11;
  v17 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v16, (uint64_t)v31, (uint64_t)v30, 6);
  v45[6] = @"inputBlurRadius";
  v46[5] = v17;
  v28[0] = v5;
  v28[1] = v6;
  v29[0] = &unk_1F39AFC38;
  v29[1] = &unk_1F39AFBF8;
  v28[2] = v7;
  v28[3] = v8;
  v29[2] = &unk_1F39AFC48;
  v29[3] = &unk_1F39AFC48;
  v28[4] = v9;
  v28[5] = v10;
  v29[4] = &unk_1F39AFC58;
  v29[5] = v11;
  v19 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v18, (uint64_t)v29, (uint64_t)v28, 6);
  v46[6] = v19;
  v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v20, (uint64_t)v46, (uint64_t)v45, 7);

  return v21;
}

- (BOOL)makeToneCurveImage
{
  if (!self->tcImage)
  {
    objc_msgSend_dataWithLength_(MEMORY[0x1E4F1CA58], a2, 200, v2, v3);
    id v31 = objc_claimAutoreleasedReturnValue();
    uint64_t v13 = objc_msgSend_mutableBytes(v31, v5, v6, v7, v8);
    for (uint64_t i = 0; i != 50; ++i)
    {
      objc_msgSend_floatValue(self->inputAmount, v9, v10, v11, v12);
      *(_DWORD *)(v13 + 4 * i) = v15;
      objc_msgSend_floatValue(self->inputShadowCutoff, v16, v17, v18, v19);
      if ((float)(v24 * 50.0) > (float)(int)i)
      {
        objc_msgSend_floatValue(self->inputShadowAmount, v20, v21, v22, v23);
        *(float *)(v13 + 4 * i) = v25 * *(float *)(v13 + 4 * i);
      }
      objc_msgSend_floatValue(self->inputHighlightCutoff, v20, v21, v22, v23);
      if ((float)(v26 * 50.0) < (float)(int)i)
      {
        objc_msgSend_floatValue(self->inputHighlightAmount, v9, v10, v11, v12);
        *(float *)(v13 + 4 * i) = v27 * *(float *)(v13 + 4 * i);
      }
    }
    objc_msgSend_imageWithBitmapData_bytesPerRow_size_format_colorSpace_(MEMORY[0x1E4F1E050], v9, (uint64_t)v31, 200, *MEMORY[0x1E4F1E310], 0, 50.0, 1.0);
    v28 = (CIImage *)objc_claimAutoreleasedReturnValue();
    tcImage = self->tcImage;
    self->tcImage = v28;
  }
  return 1;
}

- (id)outputImage
{
  v82[1] = *MEMORY[0x1E4F143B8];
  if (qword_1EAB8B0D0 != -1) {
    dispatch_once(&qword_1EAB8B0D0, &unk_1F395BF68);
  }
  if (self->inputImage)
  {
    uint64_t v3 = sub_1DDA83E7C();
    uint64_t v4 = v3;
    if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DDA14000, v4, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWLocalToneMap", (const char *)&unk_1DDC3ACB6, buf, 2u);
    }

    v75[0] = MEMORY[0x1E4F143A8];
    v75[1] = 3221225472;
    v75[2] = sub_1DDA2BAD0;
    v75[3] = &unk_1E6D04A58;
    v75[4] = self;
    v73 = (void (**)(void))MEMORY[0x1E01C46E0](v75);
    uint64_t v5 = (void *)MEMORY[0x1E4F1E080];
    objc_msgSend_floatValue(self->inputHighlightAmount, v6, v7, v8, v9);
    float v11 = v10;
    objc_msgSend_floatValue(self->inputHighlightCutoff, v12, v13, v14, v15);
    float v17 = v16;
    objc_msgSend_floatValue(self->inputShadowAmount, v18, v19, v20, v21);
    float v23 = v22;
    objc_msgSend_floatValue(self->inputShadowCutoff, v24, v25, v26, v27);
    v74 = objc_msgSend_vectorWithX_Y_Z_W_(v5, v29, v30, v31, v32, v11, v17, v23, v28);
    v33 = (void *)MEMORY[0x1E4F1E080];
    objc_msgSend_floatValue(self->inputAmount, v34, v35, v36, v37);
    v43 = objc_msgSend_vectorWithX_Y_Z_W_(v33, v39, v40, v41, v42, v38, 0.0, 0.0, 0.0);
    inputImage = self->inputImage;
    v81 = @"inputRadius";
    v82[0] = self->inputBlurRadius;
    v46 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v45, (uint64_t)v82, (uint64_t)&v81, 1);
    v49 = objc_msgSend_imageByApplyingFilter_withInputParameters_(inputImage, v47, @"CIGaussianBlur", (uint64_t)v46, v48);

    uint64_t v50 = qword_1EAB8B0E0;
    v80[0] = v74;
    v80[1] = v43;
    v53 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v51, (uint64_t)v80, 2, v52);
    v55 = objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_(self, v54, v50, (uint64_t)v49, (uint64_t)v53, self->inputColorSpace, 1);

    inputBlurRadius = self->inputBlurRadius;
    v78 = @"inputRadius";
    v79 = inputBlurRadius;
    v58 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v57, (uint64_t)&v79, (uint64_t)&v78, 1);
    v61 = objc_msgSend_imageByApplyingFilter_withInputParameters_(v55, v59, @"CIGaussianBlur", (uint64_t)v58, v60);

    v64 = objc_msgSend_samplerWithImage_keysAndValues_(MEMORY[0x1E4F1E078], v62, (uint64_t)v61, *MEMORY[0x1E4F1E538], v63, self->inputColorSpace, 0);
    uint64_t v65 = qword_1EAB8B0D8;
    v66 = self->inputImage;
    v77[0] = v64;
    v77[1] = v74;
    v77[2] = v43;
    v69 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v67, (uint64_t)v77, 3, v68);
    v71 = objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_(self, v70, v65, (uint64_t)v66, (uint64_t)v69, self->inputColorSpace, 1);

    v73[2](v73);
  }
  else
  {
    v71 = 0;
  }

  return v71;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->tcImage, 0);
  objc_storeStrong(&self->inputColorSpace, 0);
  objc_storeStrong((id *)&self->inputBlurRadius, 0);
  objc_storeStrong((id *)&self->inputAmount, 0);
  objc_storeStrong((id *)&self->inputHighlightCutoff, 0);
  objc_storeStrong((id *)&self->inputShadowCutoff, 0);
  objc_storeStrong((id *)&self->inputHighlightAmount, 0);
  objc_storeStrong((id *)&self->inputShadowAmount, 0);

  objc_storeStrong((id *)&self->inputImage, 0);
}

@end