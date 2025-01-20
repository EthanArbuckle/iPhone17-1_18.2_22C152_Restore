@interface RAWLensCorrectionDNG
+ (id)customAttributes;
- (CGPoint)mapPoint:(CGPoint)a3 info:(id)a4;
- (id)customAttributes;
- (id)outputImage;
@end

@implementation RAWLensCorrectionDNG

+ (id)customAttributes
{
  v34[3] = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], a2, v2, v3, v4, 1.0, 0.0, 0.0, 0.0);
  v10 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v6, v7, v8, v9, 0.0, 0.0, 0.0, 0.0);
  v15 = objc_msgSend_vectorWithX_Y_(MEMORY[0x1E4F1E080], v11, v12, v13, v14, 0.5, 0.5);
  v33[0] = @"inputKr";
  uint64_t v17 = *MEMORY[0x1E4F1E0C8];
  v31[0] = *MEMORY[0x1E4F1E098];
  uint64_t v16 = v31[0];
  v31[1] = v17;
  v32[0] = v5;
  v32[1] = v5;
  v19 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v18, (uint64_t)v32, (uint64_t)v31, 2);
  v34[0] = v19;
  v33[1] = @"inputKt";
  v29[0] = v16;
  v29[1] = v17;
  v30[0] = v10;
  v30[1] = v10;
  v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v20, (uint64_t)v30, (uint64_t)v29, 2);
  v34[1] = v21;
  v33[2] = @"inputCenter";
  v27[0] = v16;
  v27[1] = v17;
  v28[0] = v15;
  v28[1] = v15;
  v23 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v22, (uint64_t)v28, (uint64_t)v27, 2);
  v34[2] = v23;
  v25 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v24, (uint64_t)v34, (uint64_t)v33, 3);

  return v25;
}

- (id)customAttributes
{
  uint64_t v2 = objc_opt_class();

  return (id)MEMORY[0x1F4181798](v2, sel_customAttributes, v3, v4, v5);
}

- (CGPoint)mapPoint:(CGPoint)a3 info:(id)a4
{
  id v4 = a4;
  uint64_t v8 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"Kr", v6, v7);
  uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v4, v9, @"Kt", v10, v11);
  uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v4, v13, @"c", v14, v15);
  objc_msgSend_X(v8, v17, v18, v19, v20);
  double v92 = v21;
  objc_msgSend_Y(v8, v22, v23, v24, v25);
  double v27 = v26;
  objc_msgSend_Z(v8, v28, v29, v30, v31);
  double v33 = v32;
  objc_msgSend_W(v8, v34, v35, v36, v37);
  double v39 = v38;
  objc_msgSend_X(v12, v40, v41, v42, v43);
  double v45 = v44;
  objc_msgSend_Y(v12, v46, v47, v48, v49);
  double v51 = v50;
  objc_msgSend_X(v16, v52, v53, v54, v55);
  double v57 = v56;
  objc_msgSend_Y(v16, v58, v59, v60, v61);
  double v63 = v62;
  v67 = objc_msgSend_objectForKeyedSubscript_(v4, v64, @"m", v65, v66);
  objc_msgSend_floatValue(v67, v68, v69, v70, v71);
  float v73 = v72;
  *(float *)&double v63 = v63;
  *(float *)&double v57 = v57;
  float v74 = v51;
  float v91 = v74;
  *(float *)&double v45 = v45;
  *(float *)&double v51 = v92;

  float x = a3.x;
  float y = a3.y;
  float v77 = (float)(x - *(float *)&v57) / v73;
  float v78 = (float)(y - *(float *)&v63) / v73;
  float v79 = (float)(v78 * v78) + (float)(v77 * v77);
  *(float *)&double v27 = v27;
  *(float *)&double v33 = v33;
  *(float *)&double v39 = v39;
  float v80 = (float)((float)((float)(v79 * *(float *)&v27) + *(float *)&v51) + (float)(*(float *)&v33 * (float)(v79 * v79)))
      + (float)(*(float *)&v39 * (float)(v79 * (float)(v79 * v79)));
  float v81 = v77 * v80;
  float v82 = v78 * v80;
  double v83 = v77;
  double v84 = v78;
  double v85 = (v83 + v83) * v84;
  double v86 = v79;
  *(float *)&double v83 = (v86 + (v83 + v83) * v83) * v91 + *(float *)&v45 * v85;
  *(float *)&double v84 = (v86 + (v84 + v84) * v84) * *(float *)&v45 + v91 * v85;
  double v87 = (float)((float)(v73 * (float)(v81 + *(float *)&v83)) + *(float *)&v57);
  double v88 = (float)((float)(v73 * (float)(v82 + *(float *)&v84)) + *(float *)&v63);

  double v89 = v87;
  double v90 = v88;
  result.float y = v90;
  result.float x = v89;
  return result;
}

- (id)outputImage
{
  v75[4] = *MEMORY[0x1E4F143B8];
  if (self->inputImage)
  {
    uint64_t v3 = sub_1DDA83E7C();
    id v4 = v3;
    if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DDA14000, v4, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWLensCorrectionDNG", (const char *)&unk_1DDC3ACB6, buf, 2u);
    }

    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = sub_1DDBF1AF0;
    v73[3] = &unk_1E6D04A58;
    v73[4] = self;
    uint64_t v5 = (void (**)(void))MEMORY[0x1E01C46E0](v73);
    objc_msgSend_extent(self->inputImage, v6, v7, v8, v9);
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    v67 = objc_msgSend_kernelWithName_(LCKernels, v18, @"dngLens", v19, v20);
    uint64_t v24 = objc_msgSend_kernelWithName_(LCKernels, v21, @"dngLensDraft", v22, v23);
    objc_msgSend_X(self->inputCenter, v25, v26, v27, v28);
    double v30 = v29;
    objc_msgSend_Y(self->inputCenter, v31, v32, v33, v34);
    float v36 = v11 + v15 * v30;
    float v37 = v13 + v17 * v35;
    double v38 = hypot(fmax(vabdd_f64(v11, v36), vabdd_f64(v11 + v15, v36)), fmax(vabdd_f64(v13, v37), vabdd_f64(v13 + v17, v37)));
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = sub_1DDBF1B78;
    v70[3] = &unk_1E6D07430;
    v70[4] = self;
    float v71 = v36;
    float v72 = v37;
    *(double *)&v70[5] = v38;
    double v39 = (void *)MEMORY[0x1E01C46E0](v70);
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = sub_1DDBF1D84;
    v68[3] = &unk_1E6D05438;
    id v40 = v39;
    id v69 = v40;
    uint64_t v41 = (void *)MEMORY[0x1E01C46E0](v68);
    if (objc_msgSend_BOOLValue(self->inputDraftMode, v42, v43, v44, v45)) {
      uint64_t v50 = (uint64_t)v24;
    }
    else {
      uint64_t v50 = (uint64_t)v67;
    }
    inputImage = self->inputImage;
    inputKt = self->inputKt;
    v75[0] = self->inputKr;
    v75[1] = inputKt;
    uint64_t v53 = objc_msgSend_vectorWithX_Y_(MEMORY[0x1E4F1E080], v46, v47, v48, v49, v36, v37, *(void *)&v17, *(void *)&v15);
    v75[2] = v53;
    v58 = objc_msgSend_numberWithDouble_(NSNumber, v54, v55, v56, v57, v38);
    v75[3] = v58;
    uint64_t v61 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v59, (uint64_t)v75, 4, v60);
    double v63 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v62, v50, (uint64_t)inputImage, (uint64_t)v41, v61, self->inputColorSpace, v11, v13, v66, v65);

    v5[2](v5);
  }
  else
  {
    double v63 = 0;
  }

  return v63;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputDraftMode, 0);
  objc_storeStrong(&self->inputColorSpace, 0);
  objc_storeStrong((id *)&self->inputCenter, 0);
  objc_storeStrong((id *)&self->inputKt, 0);
  objc_storeStrong((id *)&self->inputKr, 0);

  objc_storeStrong((id *)&self->inputImage, 0);
}

@end