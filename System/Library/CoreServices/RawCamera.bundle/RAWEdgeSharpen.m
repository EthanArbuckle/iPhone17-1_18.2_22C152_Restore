@interface RAWEdgeSharpen
+ (id)customAttributes;
- (id)customAttributes;
- (id)outputImage;
@end

@implementation RAWEdgeSharpen

+ (id)customAttributes
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v37[0] = @"inputColorSpace";
  uint64_t v34 = *MEMORY[0x1E4F1E098];
  uint64_t v2 = v34;
  uint64_t v3 = sub_1DDBEE610(a1);
  uint64_t v35 = *MEMORY[0x1E4F1E0A0];
  uint64_t v4 = v35;
  v36[0] = v3;
  v36[1] = @"inputColorSpace";
  v27 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v5, (uint64_t)v36, (uint64_t)&v34, 2);
  v38 = v27;
  v37[1] = @"inputVersion";
  v32[0] = *MEMORY[0x1E4F1E090];
  uint64_t v6 = v32[0];
  v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  uint64_t v9 = *MEMORY[0x1E4F1E0D8];
  v24 = (void *)v8;
  v33[0] = v8;
  v33[1] = &unk_1F39AFF58;
  uint64_t v10 = *MEMORY[0x1E4F1E0D0];
  v32[1] = v9;
  v32[2] = v10;
  v33[2] = &unk_1F39AFF68;
  v33[3] = &unk_1F39AFF78;
  uint64_t v11 = *MEMORY[0x1E4F1E0F0];
  v32[3] = v2;
  v32[4] = v11;
  uint64_t v12 = *MEMORY[0x1E4F1E158];
  v32[5] = v4;
  v33[4] = v12;
  v33[5] = @"inputVersion";
  uint64_t v39 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v13, (uint64_t)v33, (uint64_t)v32, 6);
  v37[2] = @"inputPreSharpenAmount";
  v30[0] = v6;
  v26 = (void *)v39;
  v14 = (objc_class *)objc_opt_class();
  v25 = NSStringFromClass(v14);
  v31[0] = v25;
  v31[1] = &unk_1F39AFF88;
  v30[1] = v9;
  v30[2] = v10;
  v31[2] = &unk_1F39AFF98;
  v31[3] = &unk_1F39AFF88;
  v30[3] = v2;
  v30[4] = v11;
  v30[5] = v4;
  v31[4] = v12;
  v31[5] = @"inputPreSharpenAmount";
  v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v15, (uint64_t)v31, (uint64_t)v30, 6);
  v40 = v16;
  v37[3] = @"inputPreSharpenBlurAmount";
  v28[0] = v6;
  v17 = (objc_class *)objc_opt_class();
  v18 = NSStringFromClass(v17);
  v29[0] = v18;
  v29[1] = &unk_1F39AFFA8;
  v28[1] = v9;
  v28[2] = v10;
  v29[2] = &unk_1F39AFFB8;
  v29[3] = &unk_1F39AFF88;
  v28[3] = v2;
  v28[4] = v11;
  v28[5] = v4;
  v29[4] = v12;
  v29[5] = @"inputPreSharpenBlurAmount";
  v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v19, (uint64_t)v29, (uint64_t)v28, 6);
  v41 = v20;
  v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v21, (uint64_t)&v38, (uint64_t)v37, 4);

  return v22;
}

- (id)customAttributes
{
  uint64_t v2 = objc_opt_class();

  return (id)MEMORY[0x1F4181798](v2, sel_customAttributes, v3, v4, v5);
}

- (id)outputImage
{
  v48[1] = *MEMORY[0x1E4F143B8];
  if (self->inputImage)
  {
    uint64_t v3 = sub_1DDA83E7C();
    uint64_t v4 = v3;
    if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DDA14000, v4, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWEdgeSharpen", (const char *)&unk_1DDC3ACB6, buf, 2u);
    }

    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = sub_1DDBF455C;
    v46[3] = &unk_1E6D04A58;
    v46[4] = self;
    uint64_t v5 = (void (**)(void))MEMORY[0x1E01C46E0](v46);
    objc_msgSend_doubleValue(self->inputPreSharpenAmount, v6, v7, v8, v9);
    double v11 = v10;
    objc_msgSend_doubleValue(self->inputPreSharpenBlurAmount, v12, v13, v14, v15);
    double v20 = v19;
    if (fabs(v11) >= 0.001 || fabs(v19) >= 0.001)
    {
      v22 = objc_msgSend_kernelWithName_(RAWKernels, v16, @"simpleSharpenLNR", v17, v18);
      inputImage = self->inputImage;
      objc_msgSend_extent(inputImage, v24, v25, v26, v27);
      double v29 = v28;
      double v31 = v30;
      double v33 = v32;
      double v35 = v34;
      v40 = objc_msgSend_vectorWithX_Y_(MEMORY[0x1E4F1E080], v36, v37, v38, v39, v20, v11);
      v48[0] = v40;
      v43 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v41, (uint64_t)v48, 1, v42);
      objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v44, (uint64_t)v22, (uint64_t)inputImage, (uint64_t)&unk_1F398F2D8, v43, self->inputColorSpace, v29, v31, v33, v35);
      v21 = (CIImage *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = self->inputImage;
    }
    v5[2](v5);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputVersion, 0);
  objc_storeStrong((id *)&self->inputPreSharpenBlurAmount, 0);
  objc_storeStrong((id *)&self->inputPreSharpenAmount, 0);
  objc_storeStrong(&self->inputColorSpace, 0);

  objc_storeStrong((id *)&self->inputImage, 0);
}

@end