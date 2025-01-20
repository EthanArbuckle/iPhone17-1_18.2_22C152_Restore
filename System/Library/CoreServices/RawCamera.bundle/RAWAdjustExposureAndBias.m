@interface RAWAdjustExposureAndBias
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)customAttributes;
- (id)customAttributes;
- (id)outputImage;
- (id)outputMatrix;
- (void)setInputBias:(id)a3;
- (void)setInputExposure:(id)a3;
@end

@implementation RAWAdjustExposureAndBias

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  if ((objc_msgSend_isEqualToString_(v4, v5, @"inputExposure", v6, v7) & 1) != 0
    || (objc_msgSend_isEqualToString_(v4, v8, @"inputBias", v9, v10) & 1) != 0)
  {
    unsigned __int8 v11 = 0;
  }
  else
  {
    v13.receiver = a1;
    v13.super_class = (Class)&OBJC_METACLASS___RAWAdjustExposureAndBias;
    unsigned __int8 v11 = objc_msgSendSuper2(&v13, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v11;
}

- (void)setInputExposure:(id)a3
{
}

- (void)setInputBias:(id)a3
{
}

+ (id)customAttributes
{
  v35[5] = *MEMORY[0x1E4F143B8];
  v34[0] = @"inputColorSpace";
  uint64_t v32 = *MEMORY[0x1E4F1E098];
  uint64_t v2 = v32;
  CFTypeRef v33 = sub_1DDBEE9BC();
  v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v3, (uint64_t)&v33, (uint64_t)&v32, 1);
  v35[0] = v24;
  v34[1] = @"inputBaselineExposure";
  v29[0] = *MEMORY[0x1E4F1E090];
  uint64_t v4 = v29[0];
  v5 = (objc_class *)objc_opt_class();
  v22 = NSStringFromClass(v5);
  v30[0] = v22;
  v30[1] = &unk_1F39AFEF8;
  uint64_t v6 = *MEMORY[0x1E4F1E0D8];
  v29[1] = v2;
  v29[2] = v6;
  uint64_t v7 = *MEMORY[0x1E4F1E0D0];
  v30[2] = &unk_1F39AFEE8;
  v30[3] = &unk_1F39AFF08;
  uint64_t v8 = *MEMORY[0x1E4F1E0F0];
  v29[3] = v7;
  v29[4] = v8;
  uint64_t v31 = *MEMORY[0x1E4F1E158];
  uint64_t v9 = v31;
  v23 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v10, (uint64_t)v30, (uint64_t)v29, 5);
  v35[1] = v23;
  v34[2] = @"inputExposure";
  v27[0] = v4;
  unsigned __int8 v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  v28[0] = v12;
  v28[1] = &unk_1F39AFEF8;
  v27[1] = v2;
  v27[2] = v6;
  v28[2] = &unk_1F39AFEE8;
  v28[3] = &unk_1F39AFF08;
  v27[3] = v7;
  v27[4] = v8;
  v28[4] = v9;
  v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v13, (uint64_t)v28, (uint64_t)v27, 5);
  v35[2] = v14;
  v34[3] = @"inputBias";
  v25[0] = v4;
  v15 = (objc_class *)objc_opt_class();
  v16 = NSStringFromClass(v15);
  v26[0] = v16;
  v26[1] = &unk_1F39AFF18;
  v25[1] = v2;
  v25[2] = v6;
  v26[2] = &unk_1F39AFEF8;
  v26[3] = &unk_1F39AFF28;
  v25[3] = v7;
  v25[4] = v8;
  v26[4] = v9;
  v18 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v17, (uint64_t)v26, (uint64_t)v25, 5);
  v34[4] = @"kCIRAWFilterDoesClip";
  v35[3] = v18;
  v35[4] = MEMORY[0x1E4F1CC28];
  v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v19, (uint64_t)v35, (uint64_t)v34, 5);

  return v20;
}

- (id)customAttributes
{
  uint64_t v2 = objc_opt_class();

  return (id)MEMORY[0x1F4181798](v2, sel_customAttributes, v3, v4, v5);
}

- (id)outputMatrix
{
  v45[4] = *MEMORY[0x1E4F143B8];
  objc_msgSend_doubleValue(self->inputExposure, a2, v2, v3, v4);
  double v7 = v6;
  objc_msgSend_doubleValue(self->inputBaselineExposure, v8, v9, v10, v11);
  long double v13 = 1.0 / exp2(v7 + v12);
  objc_msgSend_doubleValue(self->inputBias, v14, v15, v16, v17);
  double v19 = v18 * 0.001;
  long double v20 = 1.0 / (v13 - v18 * 0.001);
  v44[0] = @"inputRVector";
  v25 = objc_msgSend_vectorWithX_Y_Z_(MEMORY[0x1E4F1E080], v21, v22, v23, v24, (double)v20, 0.0, 0.0);
  v45[0] = v25;
  v44[1] = @"inputGVector";
  v30 = objc_msgSend_vectorWithX_Y_Z_(MEMORY[0x1E4F1E080], v26, v27, v28, v29, 0.0, (double)v20, 0.0);
  v45[1] = v30;
  v44[2] = @"inputBVector";
  v35 = objc_msgSend_vectorWithX_Y_Z_(MEMORY[0x1E4F1E080], v31, v32, v33, v34, 0.0, 0.0, (double)v20);
  v45[2] = v35;
  v44[3] = @"inputBiasVector";
  v40 = objc_msgSend_vectorWithX_Y_Z_(MEMORY[0x1E4F1E080], v36, v37, v38, v39, (double)-(v19 * v20), (double)-(v19 * v20), (double)-(v19 * v20));
  v45[3] = v40;
  v42 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v41, (uint64_t)v45, (uint64_t)v44, 4);

  return v42;
}

- (id)outputImage
{
  if (self->inputImage)
  {
    uint64_t v3 = sub_1DDA83E7C();
    uint64_t v4 = v3;
    if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DDA14000, v4, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWAdjustExposureAndBias", (const char *)&unk_1DDC3ACB6, buf, 2u);
    }

    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = sub_1DDB99198;
    v31[3] = &unk_1E6D04A58;
    v31[4] = self;
    uint64_t v5 = (void (**)(void))MEMORY[0x1E01C46E0](v31);
    uint64_t v10 = objc_msgSend_outputMatrix(self, v6, v7, v8, v9);
    inputImage = self->inputImage;
    uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v10, v12, @"inputRVector", v13, v14);
    double v19 = objc_msgSend_objectForKeyedSubscript_(v10, v16, @"inputGVector", v17, v18);
    uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v10, v20, @"inputBVector", v21, v22);
    uint64_t v27 = objc_msgSend_objectForKeyedSubscript_(v10, v24, @"inputBiasVector", v25, v26);
    uint64_t v29 = objc_msgSend_applyMatrixToImage_vectorR_vectorG_vectorB_vectorBias_inSpace_outSpace_(self, v28, (uint64_t)inputImage, (uint64_t)v15, (uint64_t)v19, v23, v27, self->inputColorSpace);

    v5[2](v5);
  }
  else
  {
    uint64_t v29 = 0;
  }

  return v29;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputBias, 0);
  objc_storeStrong((id *)&self->inputExposure, 0);
  objc_storeStrong((id *)&self->inputBaselineExposure, 0);
  objc_storeStrong(&self->inputColorSpace, 0);

  objc_storeStrong((id *)&self->inputImage, 0);
}

@end