@interface RAWVignetteRadial
+ (id)customAttributes;
- (id)outputImage;
@end

@implementation RAWVignetteRadial

+ (id)customAttributes
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  v54[0] = @"inputVignetteK0";
  v51[0] = *MEMORY[0x1E4F1E090];
  uint64_t v2 = v51[0];
  v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = *MEMORY[0x1E4F1E098];
  v39 = (void *)v4;
  v53[0] = v4;
  v53[1] = &unk_1F39AFF38;
  uint64_t v6 = *MEMORY[0x1E4F1E0F0];
  v51[1] = v5;
  v51[2] = v6;
  uint64_t v7 = *MEMORY[0x1E4F1E158];
  uint64_t v52 = *MEMORY[0x1E4F1E0A0];
  uint64_t v8 = v52;
  v53[2] = v7;
  v53[3] = @"inputVignetteK0";
  v40 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v9, (uint64_t)v53, (uint64_t)v51, 4);
  v55[0] = v40;
  v54[1] = @"inputVignetteK1";
  v49[0] = v2;
  v10 = (objc_class *)objc_opt_class();
  v38 = NSStringFromClass(v10);
  v50[0] = v38;
  v50[1] = &unk_1F39AFF38;
  v49[1] = v5;
  v49[2] = v6;
  v49[3] = v8;
  v50[2] = v7;
  v50[3] = @"inputVignetteK1";
  v37 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v11, (uint64_t)v50, (uint64_t)v49, 4);
  v55[1] = v37;
  v54[2] = @"inputVignetteK2";
  v47[0] = v2;
  v12 = (objc_class *)objc_opt_class();
  v35 = NSStringFromClass(v12);
  v48[0] = v35;
  v48[1] = &unk_1F39AFF38;
  v47[1] = v5;
  v47[2] = v6;
  v47[3] = v8;
  v48[2] = v7;
  v48[3] = @"inputVignetteK2";
  uint64_t v56 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v13, (uint64_t)v48, (uint64_t)v47, 4);
  v54[3] = @"inputVignetteK3";
  v45[0] = v2;
  v36 = (void *)v56;
  v14 = (objc_class *)objc_opt_class();
  v34 = NSStringFromClass(v14);
  v46[0] = v34;
  v46[1] = &unk_1F39AFF38;
  v45[1] = v5;
  v45[2] = v6;
  v45[3] = v8;
  v46[2] = v7;
  v46[3] = @"inputVignetteK3";
  v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v15, (uint64_t)v46, (uint64_t)v45, 4);
  v57 = v16;
  v54[4] = @"inputVignetteK4";
  v43[0] = v2;
  v17 = (objc_class *)objc_opt_class();
  v18 = NSStringFromClass(v17);
  v44[0] = v18;
  v44[1] = &unk_1F39AFF38;
  v43[1] = v5;
  v43[2] = v6;
  v43[3] = v8;
  v44[2] = v7;
  v44[3] = @"inputVignetteK4";
  v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v19, (uint64_t)v44, (uint64_t)v43, 4);
  v58 = v20;
  v54[5] = @"inputCenter";
  v41[0] = v2;
  v21 = (objc_class *)objc_opt_class();
  v22 = NSStringFromClass(v21);
  v42[0] = v22;
  v41[1] = v5;
  v27 = objc_msgSend_vectorWithX_Y_(MEMORY[0x1E4F1E080], v23, v24, v25, v26, 0.5, 0.5);
  v41[2] = v6;
  uint64_t v28 = *MEMORY[0x1E4F1E140];
  v42[1] = v27;
  v42[2] = v28;
  v30 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v29, (uint64_t)v42, (uint64_t)v41, 3);
  v59 = v30;
  v32 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v31, (uint64_t)v55, (uint64_t)v54, 6);

  return v32;
}

- (id)outputImage
{
  v121[3] = *MEMORY[0x1E4F143B8];
  if (self->inputImage)
  {
    char v10 = objc_msgSend_BOOLValue(self->inputVignetteExecute, a2, v2, v3, v4);
    inputImage = self->inputImage;
    if ((v10 & 1) == 0)
    {
      v16 = inputImage;
      goto LABEL_6;
    }
    objc_msgSend_extent(inputImage, v6, v7, v8, v9);
    CGFloat x = v123.origin.x;
    CGFloat y = v123.origin.y;
    double width = v123.size.width;
    double height = v123.size.height;
    if (CGRectIsInfinite(v123))
    {
      NSLog(&cfstr_Rawvignetterad_0.isa);
      v16 = self->inputImage;
LABEL_6:
      v17 = v16;
      goto LABEL_16;
    }
    v18 = sub_1DDA83E7C();
    v19 = v18;
    if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DDA14000, v19, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWVignetteRadial", (const char *)&unk_1DDC3ACB6, buf, 2u);
    }

    v119[0] = MEMORY[0x1E4F143A8];
    v119[1] = 3221225472;
    v119[2] = sub_1DDB99C20;
    v119[3] = &unk_1E6D04A58;
    v119[4] = self;
    v20 = (void (**)(void))MEMORY[0x1E01C46E0](v119);
    objc_msgSend_X(self->inputVignetteCenter, v21, v22, v23, v24);
    double v118 = v25;
    objc_msgSend_Y(self->inputVignetteCenter, v26, v27, v28, v29);
    double v31 = v30;
    v124.origin.CGFloat x = x;
    v124.origin.CGFloat y = y;
    v124.size.double width = width;
    v124.size.double height = height;
    double MinX = CGRectGetMinX(v124);
    v125.origin.CGFloat x = x;
    v125.origin.CGFloat y = y;
    v125.size.double width = width;
    v125.size.double height = height;
    double MaxX = CGRectGetMaxX(v125);
    v126.origin.CGFloat x = x;
    v126.origin.CGFloat y = y;
    v126.size.double width = width;
    v126.size.double height = height;
    double MinY = CGRectGetMinY(v126);
    v127.origin.CGFloat x = x;
    v127.origin.CGFloat y = y;
    v127.size.double width = width;
    v127.size.double height = height;
    double MaxY = CGRectGetMaxY(v127);
    long double v36 = hypot(fmax(vabdd_f64(MinX, width * v118), vabdd_f64(MaxX, width * v118)), fmax(vabdd_f64(MinY, height * v31), vabdd_f64(MaxY, height * v31)));
    v37 = (void *)MEMORY[0x1E4F1E080];
    objc_msgSend_X(self->inputVignetteCenter, v38, v39, v40, v41);
    double v43 = v42;
    objc_msgSend_Y(self->inputVignetteCenter, v44, v45, v46, v47);
    double v49 = v48;
    objc_msgSend_floatValue(self->inputVignetteK4, v50, v51, v52, v53);
    v59 = objc_msgSend_vectorWithX_Y_Z_W_(v37, v55, v56, v57, v58, width * v43, height * v49, v54, (double)(1.0 / (v36 * v36)));
    uint64_t v60 = (void *)MEMORY[0x1E4F1E080];
    objc_msgSend_floatValue(self->inputVignetteK0, v61, v62, v63, v64);
    float v66 = v65;
    objc_msgSend_floatValue(self->inputVignetteK1, v67, v68, v69, v70);
    float v72 = v71;
    objc_msgSend_floatValue(self->inputVignetteK2, v73, v74, v75, v76);
    LODWORD(v36) = v77;
    objc_msgSend_floatValue(self->inputVignetteK3, v78, v79, v80, v81);
    v87 = objc_msgSend_vectorWithX_Y_Z_W_(v60, v83, v84, v85, v86, v66, v72, *(float *)&v36, v82);
    v91 = objc_msgSend_kernelWithName_(GainMapKernels, v88, @"GainMapParametric", v89, v90);
    v92 = self->inputImage;
    id v97 = self->inputColorSpace;
    if (v97)
    {
      uint64_t v98 = objc_msgSend_imageByColorMatchingWorkingSpaceToColorSpace_(v92, v93, (uint64_t)v97, v95, v96);

      v92 = (CIImage *)v98;
    }
    objc_msgSend_extent(v92, v93, v94, v95, v96);
    double v100 = v99;
    double v102 = v101;
    double v104 = v103;
    double v106 = v105;
    v121[0] = v92;
    v121[1] = v59;
    v121[2] = v87;
    v109 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v107, (uint64_t)v121, 3, v108);
    v17 = objc_msgSend_applyWithExtent_arguments_(v91, v110, (uint64_t)v109, v111, v112, v100, v102, v104, v106);

    if (v97)
    {
      uint64_t v116 = objc_msgSend_imageByColorMatchingColorSpaceToWorkingSpace_(v17, v113, (uint64_t)v97, v114, v115);

      v17 = (void *)v116;
    }

    v20[2](v20);
  }
  else
  {
    v17 = 0;
  }
LABEL_16:

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputVignetteExecute, 0);
  objc_storeStrong(&self->inputColorSpace, 0);
  objc_storeStrong((id *)&self->inputVignetteCenter, 0);
  objc_storeStrong((id *)&self->inputVignetteK4, 0);
  objc_storeStrong((id *)&self->inputVignetteK3, 0);
  objc_storeStrong((id *)&self->inputVignetteK2, 0);
  objc_storeStrong((id *)&self->inputVignetteK1, 0);
  objc_storeStrong((id *)&self->inputVignetteK0, 0);

  objc_storeStrong((id *)&self->inputImage, 0);
}

@end