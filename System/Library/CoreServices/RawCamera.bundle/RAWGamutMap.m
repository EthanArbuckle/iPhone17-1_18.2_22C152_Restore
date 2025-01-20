@interface RAWGamutMap
+ (id)customAttributes;
- (id)customAttributes;
- (id)outputImage;
@end

@implementation RAWGamutMap

+ (id)customAttributes
{
  v28[4] = *MEMORY[0x1E4F143B8];
  v28[0] = MEMORY[0x1E4F1CC08];
  v27[0] = @"inputColorSpace";
  v27[1] = @"inputShouldWarn";
  uint64_t v3 = *MEMORY[0x1E4F1E0F0];
  v25[0] = *MEMORY[0x1E4F1E098];
  uint64_t v2 = v25[0];
  v25[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4F1E100];
  v26[0] = MEMORY[0x1E4F1CC28];
  v26[1] = v4;
  v5 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], a2, (uint64_t)v26, (uint64_t)v25, 2);
  v28[1] = v5;
  v27[2] = @"inputVersion";
  v23[0] = *MEMORY[0x1E4F1E090];
  uint64_t v6 = v23[0];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  uint64_t v9 = *MEMORY[0x1E4F1E0D8];
  v24[0] = v8;
  v24[1] = &unk_1F39AEE28;
  uint64_t v10 = *MEMORY[0x1E4F1E0D0];
  v23[1] = v9;
  v23[2] = v10;
  v24[2] = &unk_1F39AEE40;
  v24[3] = &unk_1F39AEE28;
  v23[3] = v2;
  v23[4] = v3;
  uint64_t v11 = *MEMORY[0x1E4F1E158];
  v23[5] = *MEMORY[0x1E4F1E0A0];
  v24[4] = v11;
  v24[5] = @"inputVersion";
  v13 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v12, (uint64_t)v24, (uint64_t)v23, 6);
  v28[2] = v13;
  v27[3] = @"inputGamutMapMax";
  v21[0] = v6;
  v14 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v14);
  v22[0] = v15;
  v22[1] = &unk_1F39AEE58;
  v21[1] = v2;
  v21[2] = v3;
  v22[2] = v11;
  v17 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v16, (uint64_t)v22, (uint64_t)v21, 3);
  v28[3] = v17;
  v19 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v18, (uint64_t)v28, (uint64_t)v27, 4);

  return v19;
}

- (id)customAttributes
{
  uint64_t v2 = objc_opt_class();

  return (id)MEMORY[0x1F4181798](v2, sel_customAttributes, v3, v4, v5);
}

- (id)outputImage
{
  v33[6] = *MEMORY[0x1E4F143B8];
  if (self->inputImage)
  {
    uint64_t v3 = sub_1DDA83E7C();
    uint64_t v4 = v3;
    if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DDA14000, v4, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWGamutMap", (const char *)&unk_1DDC3ACB6, buf, 2u);
    }

    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = sub_1DDB14004;
    v30[3] = &unk_1E6D04A58;
    v30[4] = self;
    uint64_t v5 = (void (**)(void))MEMORY[0x1E01C46E0](v30);
    uint64_t v6 = self->inputImage;
    if (objc_msgSend_BOOLValue(self->inputShouldWarn, v7, v8, v9, v10))
    {
      v15 = objc_msgSend_kernelWithName_(GMKernels, v11, @"gamutWarning", v13, v14);
      v17 = objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_(self, v16, (uint64_t)v15, (uint64_t)v6, 0, self->inputColorSpace, 1);
    }
    else
    {
      if ((int)objc_msgSend_intValue(self->inputVersion, v11, v12, v13, v14) < 7)
      {
        v15 = objc_msgSend_kernelWithName_(GMKernels, v18, @"gmKernel_v6", v19, v20);
        v32[0] = &unk_1F39AFD58;
        v32[1] = &unk_1F39AFD68;
        v32[2] = &unk_1F39AFD28;
        v32[3] = &unk_1F39AFD78;
        inputGamutMapMax = self->inputGamutMapMax;
        v32[4] = &unk_1F39AFD88;
        v32[5] = inputGamutMapMax;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v27, (uint64_t)v32, 6, v28);
      }
      else
      {
        v15 = objc_msgSend_kernelWithName_(GMKernels, v18, @"gmKernel_v7", v19, v20);
        v33[0] = &unk_1F39AFD08;
        v33[1] = &unk_1F39AFD18;
        v33[2] = &unk_1F39AFD28;
        v33[3] = &unk_1F39AFD38;
        v21 = self->inputGamutMapMax;
        v33[4] = &unk_1F39AFD48;
        v33[5] = v21;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v22, (uint64_t)v33, 6, v23);
      uint64_t v24 = };
      v17 = objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_(self, v25, (uint64_t)v15, (uint64_t)v6, v24, self->inputColorSpace, 1);

      uint64_t v6 = (CIImage *)v24;
    }

    v5[2](v5);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputGamutMapMax, 0);
  objc_storeStrong((id *)&self->inputVersion, 0);
  objc_storeStrong((id *)&self->inputShouldWarn, 0);
  objc_storeStrong(&self->inputColorSpace, 0);

  objc_storeStrong((id *)&self->inputImage, 0);
}

@end