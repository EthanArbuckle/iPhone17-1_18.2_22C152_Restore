@interface RAWHueMagnet
+ (id)customAttributes;
- (id)customAttributes;
- (id)outputImage;
@end

@implementation RAWHueMagnet

+ (id)customAttributes
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  v61[0] = @"inputColorSpace";
  uint64_t v58 = *MEMORY[0x1E4F1E098];
  uint64_t v2 = v58;
  CFTypeRef v3 = sub_1DDBEE9BC();
  uint64_t v59 = *MEMORY[0x1E4F1E0A0];
  uint64_t v4 = v59;
  v60[0] = v3;
  v60[1] = @"inputColorSpace";
  v43 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v5, (uint64_t)v60, (uint64_t)&v58, 2);
  v62 = v43;
  v61[1] = @"inputVersion";
  v56[0] = *MEMORY[0x1E4F1E090];
  uint64_t v6 = v56[0];
  v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  uint64_t v9 = *MEMORY[0x1E4F1E0D8];
  v37 = (void *)v8;
  v57[0] = v8;
  v57[1] = &unk_1F39AFE38;
  uint64_t v10 = *MEMORY[0x1E4F1E0D0];
  v56[1] = v9;
  v56[2] = v10;
  v57[2] = &unk_1F39AFE48;
  v57[3] = &unk_1F39AFE58;
  uint64_t v11 = *MEMORY[0x1E4F1E0F0];
  v56[3] = v2;
  v56[4] = v11;
  uint64_t v12 = *MEMORY[0x1E4F1E158];
  v56[5] = v4;
  v57[4] = v12;
  v57[5] = @"inputVersion";
  uint64_t v63 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v13, (uint64_t)v57, (uint64_t)v56, 6);
  v61[2] = @"inputHueMagMR";
  v54[0] = v6;
  v38 = (void *)v63;
  v14 = (objc_class *)objc_opt_class();
  v42 = NSStringFromClass(v14);
  v55[0] = v42;
  v55[1] = &unk_1F39AFE68;
  v54[1] = v9;
  v54[2] = v10;
  v55[2] = &unk_1F39AFE78;
  v55[3] = &unk_1F39AFE88;
  v54[3] = v2;
  v54[4] = v11;
  v54[5] = v4;
  v55[4] = v12;
  v55[5] = @"inputHueMagMR";
  v41 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v15, (uint64_t)v55, (uint64_t)v54, 6);
  v64 = v41;
  v61[3] = @"inputHueMagRY";
  v52[0] = v6;
  v16 = (objc_class *)objc_opt_class();
  v40 = NSStringFromClass(v16);
  v53[0] = v40;
  v53[1] = &unk_1F39AFE68;
  v52[1] = v9;
  v52[2] = v10;
  v53[2] = &unk_1F39AFE78;
  v53[3] = &unk_1F39AFE88;
  v52[3] = v2;
  v52[4] = v11;
  v52[5] = v4;
  v53[4] = v12;
  v53[5] = @"inputHueMagRY";
  v39 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v17, (uint64_t)v53, (uint64_t)v52, 6);
  v65 = v39;
  v61[4] = @"inputHueMagYG";
  v50[0] = v6;
  v18 = (objc_class *)objc_opt_class();
  v35 = NSStringFromClass(v18);
  v51[0] = v35;
  v51[1] = &unk_1F39AFE68;
  v50[1] = v9;
  v50[2] = v10;
  v51[2] = &unk_1F39AFE78;
  v51[3] = &unk_1F39AFE88;
  v50[3] = v2;
  v50[4] = v11;
  v50[5] = v4;
  v51[4] = v12;
  v51[5] = @"inputHueMagYG";
  v36 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v19, (uint64_t)v51, (uint64_t)v50, 6);
  v66 = v36;
  v61[5] = @"inputHueMagGC";
  v48[0] = v6;
  v20 = (objc_class *)objc_opt_class();
  v33 = NSStringFromClass(v20);
  v49[0] = v33;
  v49[1] = &unk_1F39AFE68;
  v48[1] = v9;
  v48[2] = v10;
  v49[2] = &unk_1F39AFE78;
  v49[3] = &unk_1F39AFE88;
  v48[3] = v2;
  v48[4] = v11;
  v48[5] = v4;
  v49[4] = v12;
  v49[5] = @"inputHueMagGC";
  v34 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v21, (uint64_t)v49, (uint64_t)v48, 6);
  v67 = v34;
  v61[6] = @"inputHueMagCB";
  v46[0] = v6;
  v22 = (objc_class *)objc_opt_class();
  v23 = NSStringFromClass(v22);
  v47[0] = v23;
  v47[1] = &unk_1F39AFE68;
  v46[1] = v9;
  v46[2] = v10;
  v47[2] = &unk_1F39AFE78;
  v47[3] = &unk_1F39AFE88;
  v46[3] = v2;
  v46[4] = v11;
  v46[5] = v4;
  v47[4] = v12;
  v47[5] = @"inputHueMagCB";
  v25 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v24, (uint64_t)v47, (uint64_t)v46, 6);
  v68 = v25;
  v61[7] = @"inputHueMagBM";
  v44[0] = v6;
  v26 = (objc_class *)objc_opt_class();
  v27 = NSStringFromClass(v26);
  v45[0] = v27;
  v45[1] = &unk_1F39AFE68;
  v44[1] = v9;
  v44[2] = v10;
  v45[2] = &unk_1F39AFE78;
  v45[3] = &unk_1F39AFE88;
  v44[3] = v2;
  v44[4] = v11;
  v44[5] = v4;
  v45[4] = v12;
  v45[5] = @"inputHueMagBM";
  v29 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v28, (uint64_t)v45, (uint64_t)v44, 6);
  v69 = v29;
  v31 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v30, (uint64_t)&v62, (uint64_t)v61, 8);

  return v31;
}

- (id)customAttributes
{
  uint64_t v2 = objc_opt_class();

  return (id)MEMORY[0x1F4181798](v2, sel_customAttributes, v3, v4, v5);
}

- (id)outputImage
{
  v132[1] = *MEMORY[0x1E4F143B8];
  if (self->inputImage)
  {
    uint64_t v3 = sub_1DDA83E7C();
    uint64_t v4 = v3;
    if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DDA14000, v4, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWHueMagnet", (const char *)&unk_1DDC3ACB6, buf, 2u);
    }

    v125[0] = MEMORY[0x1E4F143A8];
    v125[1] = 3221225472;
    v125[2] = sub_1DDB78498;
    v125[3] = &unk_1E6D04A58;
    v125[4] = self;
    uint64_t v5 = (void (**)(void, __n128))MEMORY[0x1E01C46E0](v125);
    objc_msgSend_doubleValue(self->inputHueMagMR, v6, v7, v8, v9);
    double v11 = v10;
    objc_msgSend_doubleValue(self->inputHueMagRY, v12, v13, v14, v15);
    double v17 = v16;
    objc_msgSend_doubleValue(self->inputHueMagYG, v18, v19, v20, v21);
    double v23 = v22;
    objc_msgSend_doubleValue(self->inputHueMagGC, v24, v25, v26, v27);
    double v29 = v28;
    objc_msgSend_doubleValue(self->inputHueMagCB, v30, v31, v32, v33);
    double v35 = v34;
    objc_msgSend_doubleValue(self->inputHueMagBM, v36, v37, v38, v39);
    double v40 = fmin(fmax(v11, -0.2), 0.2);
    double v41 = fmin(fmax(v17, -0.2), 0.2);
    double v42 = fmin(fmax(v23, -0.2), 0.2);
    double v44 = fabs(v40);
    double v45 = fabs(v41);
    double v46 = fabs(v42);
    double v121 = fmin(fmax(v35, -0.2), 0.2);
    double v122 = fmin(fmax(v29, -0.2), 0.2);
    double v47 = fabs(v122);
    double v120 = fmin(fmax(v43, -0.2), 0.2);
    double v123 = fabs(v120);
    double v124 = fabs(v121);
    v51 = self->inputImage;
    if (v44 >= 0.001
      || v45 >= 0.001
      || v46 >= 0.001
      || v47 >= 0.001
      || (v52.n128_f64[0] = v124, v124 >= 0.001)
      || (v52.n128_f64[0] = v123, v123 >= 0.001))
    {
      if (v44 >= 0.001)
      {
        v53 = objc_msgSend_kernelWithName_(HMKernels, v48, @"RAWHueMagnetMR", v49, v50, v52.n128_f64[0]);
        uint64_t v58 = objc_msgSend_numberWithDouble_(NSNumber, v54, v55, v56, v57, v40);
        v132[0] = v58;
        v61 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v59, (uint64_t)v132, 1, v60);
        uint64_t v63 = objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_(self, v62, (uint64_t)v53, (uint64_t)v51, (uint64_t)v61, self->inputColorSpace, 1);

        v51 = (CIImage *)v63;
      }
      if (v45 >= 0.001)
      {
        v64 = objc_msgSend_kernelWithName_(HMKernels, v48, @"RAWHueMagnetRY", v49, v50);
        v69 = objc_msgSend_numberWithDouble_(NSNumber, v65, v66, v67, v68, v41);
        v131 = v69;
        v72 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v70, (uint64_t)&v131, 1, v71);
        uint64_t v74 = objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_(self, v73, (uint64_t)v64, (uint64_t)v51, (uint64_t)v72, self->inputColorSpace, 1);

        v51 = (CIImage *)v74;
      }
      if (v46 >= 0.001)
      {
        v75 = objc_msgSend_kernelWithName_(HMKernels, v48, @"RAWHueMagnetYG", v49, v50);
        v80 = objc_msgSend_numberWithDouble_(NSNumber, v76, v77, v78, v79, v42);
        v130 = v80;
        v83 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v81, (uint64_t)&v130, 1, v82);
        uint64_t v85 = objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_(self, v84, (uint64_t)v75, (uint64_t)v51, (uint64_t)v83, self->inputColorSpace, 1);

        v51 = (CIImage *)v85;
      }
      if (v47 >= 0.001)
      {
        v86 = objc_msgSend_kernelWithName_(HMKernels, v48, @"RAWHueMagnetGC", v49, v50);
        v91 = objc_msgSend_numberWithDouble_(NSNumber, v87, v88, v89, v90, v122);
        v129 = v91;
        v94 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v92, (uint64_t)&v129, 1, v93);
        uint64_t v96 = objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_(self, v95, (uint64_t)v86, (uint64_t)v51, (uint64_t)v94, self->inputColorSpace, 1);

        v51 = (CIImage *)v96;
      }
      if (v124 >= 0.001)
      {
        v97 = objc_msgSend_kernelWithName_(HMKernels, v48, @"RAWHueMagnetCB", v49, v50, v124);
        v102 = objc_msgSend_numberWithDouble_(NSNumber, v98, v99, v100, v101, v121);
        v128 = v102;
        v105 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v103, (uint64_t)&v128, 1, v104);
        uint64_t v107 = objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_(self, v106, (uint64_t)v97, (uint64_t)v51, (uint64_t)v105, self->inputColorSpace, 1);

        v51 = (CIImage *)v107;
      }
      v52.n128_f64[0] = v123;
      if (v123 >= 0.001)
      {
        v108 = objc_msgSend_kernelWithName_(HMKernels, v48, @"RAWHueMagnetBM", v49, v50, v123);
        v113 = objc_msgSend_numberWithDouble_(NSNumber, v109, v110, v111, v112, v120);
        v127 = v113;
        v116 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v114, (uint64_t)&v127, 1, v115);
        uint64_t v118 = objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_(self, v117, (uint64_t)v108, (uint64_t)v51, (uint64_t)v116, self->inputColorSpace, 1);

        v51 = (CIImage *)v118;
      }
    }
    v5[2](v5, v52);
  }
  else
  {
    v51 = 0;
  }

  return v51;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputVersion, 0);
  objc_storeStrong((id *)&self->inputHueMagBM, 0);
  objc_storeStrong((id *)&self->inputHueMagCB, 0);
  objc_storeStrong((id *)&self->inputHueMagGC, 0);
  objc_storeStrong((id *)&self->inputHueMagYG, 0);
  objc_storeStrong((id *)&self->inputHueMagRY, 0);
  objc_storeStrong((id *)&self->inputHueMagMR, 0);
  objc_storeStrong(&self->inputColorSpace, 0);

  objc_storeStrong((id *)&self->inputImage, 0);
}

@end