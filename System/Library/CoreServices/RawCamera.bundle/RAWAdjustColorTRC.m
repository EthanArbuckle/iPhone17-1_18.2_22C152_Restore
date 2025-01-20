@interface RAWAdjustColorTRC
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)customAttributes;
- (id)customAttributes;
- (id)outputImage;
- (void)setInputBoostAmount:(id)a3;
@end

@implementation RAWAdjustColorTRC

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_isEqualToString_(v4, v5, @"inputBoostAmount", v6, v7))
  {
    unsigned __int8 v8 = 0;
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___RAWAdjustColorTRC;
    unsigned __int8 v8 = objc_msgSendSuper2(&v10, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v8;
}

- (void)setInputBoostAmount:(id)a3
{
}

+ (id)customAttributes
{
  uint64_t v154 = *MEMORY[0x1E4F143B8];
  v140[0] = @"inputColorSpace";
  uint64_t v137 = *MEMORY[0x1E4F1E098];
  uint64_t v2 = v137;
  CFTypeRef v3 = sub_1DDBEE9BC();
  uint64_t v138 = *MEMORY[0x1E4F1E0A0];
  uint64_t v4 = v138;
  v139[0] = v3;
  v139[1] = @"inputColorSpace";
  v96 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v5, (uint64_t)v139, (uint64_t)&v137, 2);
  v141[0] = v96;
  v140[1] = @"inputTRCs0";
  v135[0] = *MEMORY[0x1E4F1E090];
  uint64_t v6 = v135[0];
  uint64_t v7 = (objc_class *)objc_opt_class();
  v95 = NSStringFromClass(v7);
  v136[0] = v95;
  v136[1] = &unk_1F39AFDB8;
  uint64_t v8 = *MEMORY[0x1E4F1E0F0];
  v135[1] = v2;
  v135[2] = v8;
  uint64_t v9 = *MEMORY[0x1E4F1E158];
  v135[3] = v4;
  v136[2] = v9;
  v136[3] = @"inputTRCs0";
  v89 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v10, (uint64_t)v136, (uint64_t)v135, 4);
  v141[1] = v89;
  v140[2] = @"inputTRCs1";
  v133[0] = v6;
  v11 = (objc_class *)objc_opt_class();
  v134[0] = NSStringFromClass(v11);
  v134[1] = &unk_1F39AFDB8;
  v133[1] = v2;
  v133[2] = v8;
  v133[3] = v4;
  v134[2] = v9;
  v134[3] = @"inputTRCs1";
  v94 = (void *)v134[0];
  v88 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v12, (uint64_t)v134, (uint64_t)v133, 4);
  v141[2] = v88;
  v140[3] = @"inputTRCs2";
  v131[0] = v6;
  v13 = (objc_class *)objc_opt_class();
  v132[0] = NSStringFromClass(v13);
  v132[1] = &unk_1F39AFDB8;
  v131[1] = v2;
  v131[2] = v8;
  v131[3] = v4;
  v132[2] = v9;
  v132[3] = @"inputTRCs2";
  v93 = (void *)v132[0];
  v87 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v14, (uint64_t)v132, (uint64_t)v131, 4);
  v141[3] = v87;
  v140[4] = @"inputTRCs3";
  v129[0] = v6;
  v15 = (objc_class *)objc_opt_class();
  v130[0] = NSStringFromClass(v15);
  v130[1] = &unk_1F39AFDB8;
  v129[1] = v2;
  v129[2] = v8;
  v129[3] = v4;
  v130[2] = v9;
  v130[3] = @"inputTRCs3";
  v85 = (void *)v130[0];
  v86 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v16, (uint64_t)v130, (uint64_t)v129, 4);
  v141[4] = v86;
  v140[5] = @"inputTRCs4";
  v127[0] = v6;
  v17 = (objc_class *)objc_opt_class();
  v128[0] = NSStringFromClass(v17);
  v128[1] = &unk_1F39AFDB8;
  v127[1] = v2;
  v127[2] = v4;
  v127[3] = v8;
  v128[2] = @"inputTRCs4";
  v128[3] = v9;
  v92 = (void *)v128[0];
  v84 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v18, (uint64_t)v128, (uint64_t)v127, 4);
  v141[5] = v84;
  v140[6] = @"inputTRCy1";
  v125[0] = v6;
  v19 = (objc_class *)objc_opt_class();
  v126[0] = NSStringFromClass(v19);
  v126[1] = &unk_1F39AFDC8;
  v125[1] = v2;
  v125[2] = v8;
  v125[3] = v4;
  v126[2] = v9;
  v126[3] = @"inputTRCy1";
  v91 = (void *)v126[0];
  v83 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v20, (uint64_t)v126, (uint64_t)v125, 4);
  v141[6] = v83;
  v140[7] = @"inputTRCy2";
  v123[0] = v6;
  v21 = (objc_class *)objc_opt_class();
  v124[0] = NSStringFromClass(v21);
  v124[1] = &unk_1F39AFDD8;
  v123[1] = v2;
  v123[2] = v8;
  v123[3] = v4;
  v124[2] = v9;
  v124[3] = @"inputTRCy2";
  v81 = (void *)v124[0];
  v82 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v22, (uint64_t)v124, (uint64_t)v123, 4);
  v141[7] = v82;
  v140[8] = @"inputTRCy3";
  v121[0] = v6;
  v23 = (objc_class *)objc_opt_class();
  v122[0] = NSStringFromClass(v23);
  v122[1] = &unk_1F39AFDE8;
  v121[1] = v2;
  v121[2] = v8;
  v121[3] = v4;
  v122[2] = v9;
  v122[3] = @"inputTRCy3";
  v90 = (void *)v122[0];
  v80 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v24, (uint64_t)v122, (uint64_t)v121, 4);
  v141[8] = v80;
  v140[9] = @"inputTRCy4";
  v119[0] = v6;
  v25 = (objc_class *)objc_opt_class();
  v78 = NSStringFromClass(v25);
  v120[0] = v78;
  v120[1] = &unk_1F39AFDB8;
  v119[1] = v2;
  v119[2] = v8;
  v119[3] = v4;
  v120[2] = v9;
  v120[3] = @"inputTRCy4";
  v79 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v26, (uint64_t)v120, (uint64_t)v119, 4);
  v141[9] = v79;
  v140[10] = @"inputBoostAmount";
  v117[0] = v6;
  v27 = (objc_class *)objc_opt_class();
  uint64_t v28 = NSStringFromClass(v27);
  uint64_t v29 = *MEMORY[0x1E4F1E0D8];
  v76 = (void *)v28;
  v118[0] = v28;
  v118[1] = &unk_1F39AFDF8;
  uint64_t v30 = *MEMORY[0x1E4F1E0D0];
  v117[1] = v29;
  v117[2] = v30;
  v118[2] = &unk_1F39AFDB8;
  v118[3] = &unk_1F39AFDB8;
  v117[3] = v2;
  v117[4] = v8;
  v117[5] = v4;
  v118[4] = v9;
  v118[5] = @"inputBoostAmount";
  uint64_t v142 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v31, (uint64_t)v118, (uint64_t)v117, 6);
  v140[11] = @"inputBoostShadowAmount";
  v115[0] = v6;
  v77 = (void *)v142;
  v32 = (objc_class *)objc_opt_class();
  v74 = NSStringFromClass(v32);
  v116[0] = v74;
  v116[1] = &unk_1F39AFDF8;
  v115[1] = v29;
  v115[2] = v30;
  v116[2] = &unk_1F39AFE08;
  v116[3] = &unk_1F39AFDB8;
  v115[3] = v2;
  v115[4] = v8;
  v115[5] = v4;
  v116[4] = v9;
  v116[5] = @"inputBoostShadowAmount";
  v75 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v33, (uint64_t)v116, (uint64_t)v115, 6);
  v143 = v75;
  v140[12] = @"inputBoostPreserveHueAmount";
  v113[0] = v6;
  v34 = (objc_class *)objc_opt_class();
  v72 = NSStringFromClass(v34);
  v114[0] = v72;
  v114[1] = &unk_1F39AFDF8;
  v113[1] = v29;
  v113[2] = v30;
  v114[2] = &unk_1F39AFDB8;
  v114[3] = &unk_1F39AFDF8;
  v113[3] = v2;
  v113[4] = v8;
  v113[5] = v4;
  v114[4] = v9;
  v114[5] = @"inputBoostPreserveHueAmount";
  v73 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v35, (uint64_t)v114, (uint64_t)v113, 6);
  v144 = v73;
  v140[13] = @"inputBoostHDRAmount";
  v111[0] = v6;
  v36 = (objc_class *)objc_opt_class();
  v70 = NSStringFromClass(v36);
  v112[0] = v70;
  v112[1] = &unk_1F39AFDB8;
  v111[1] = v29;
  v111[2] = v30;
  v112[2] = &unk_1F39AFE18;
  v112[3] = &unk_1F39AFDB8;
  v111[3] = v2;
  v111[4] = v8;
  v111[5] = v4;
  v112[4] = v9;
  v112[5] = @"inputBoostHDRAmount";
  v71 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v37, (uint64_t)v112, (uint64_t)v111, 6);
  v145 = v71;
  v140[14] = @"inputVersion";
  v109[0] = v6;
  v38 = (objc_class *)objc_opt_class();
  v68 = NSStringFromClass(v38);
  v110[0] = v68;
  v110[1] = &unk_1F39AFE08;
  v109[1] = v29;
  v109[2] = v30;
  v110[2] = &unk_1F39AFE18;
  v110[3] = &unk_1F39AFE18;
  v109[3] = v2;
  v109[4] = v8;
  v109[5] = v4;
  v110[4] = v9;
  v110[5] = @"inputVersion";
  v69 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v39, (uint64_t)v110, (uint64_t)v109, 6);
  v146 = v69;
  v140[15] = @"inputBoostPreserveRYHueAmount";
  v107[0] = v6;
  v40 = (objc_class *)objc_opt_class();
  v66 = NSStringFromClass(v40);
  v108[0] = v66;
  v108[1] = &unk_1F39AFDF8;
  v107[1] = v29;
  v107[2] = v30;
  v108[2] = &unk_1F39AFDB8;
  v108[3] = &unk_1F39AFE28;
  v107[3] = v2;
  v107[4] = v8;
  v107[5] = v4;
  v108[4] = v9;
  v108[5] = @"inputBoostPreserveRYHueAmount";
  v67 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v41, (uint64_t)v108, (uint64_t)v107, 6);
  v147 = v67;
  v140[16] = @"inputBoostPreserveYGHueAmount";
  v105[0] = v6;
  v42 = (objc_class *)objc_opt_class();
  v64 = NSStringFromClass(v42);
  v106[0] = v64;
  v106[1] = &unk_1F39AFDF8;
  v105[1] = v29;
  v105[2] = v30;
  v106[2] = &unk_1F39AFDB8;
  v106[3] = &unk_1F39AFDF8;
  v105[3] = v2;
  v105[4] = v8;
  v105[5] = v4;
  v106[4] = v9;
  v106[5] = @"inputBoostPreserveYGHueAmount";
  v65 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v43, (uint64_t)v106, (uint64_t)v105, 6);
  v148 = v65;
  v140[17] = @"inputBoostPreserveGCHueAmount";
  v103[0] = v6;
  v44 = (objc_class *)objc_opt_class();
  v62 = NSStringFromClass(v44);
  v104[0] = v62;
  v104[1] = &unk_1F39AFDF8;
  v103[1] = v29;
  v103[2] = v30;
  v104[2] = &unk_1F39AFDB8;
  v104[3] = &unk_1F39AFDF8;
  v103[3] = v2;
  v103[4] = v8;
  v103[5] = v4;
  v104[4] = v9;
  v104[5] = @"inputBoostPreserveGCHueAmount";
  v63 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v45, (uint64_t)v104, (uint64_t)v103, 6);
  v149 = v63;
  v140[18] = @"inputBoostPreserveCBHueAmount";
  v101[0] = v6;
  v46 = (objc_class *)objc_opt_class();
  v60 = NSStringFromClass(v46);
  v102[0] = v60;
  v102[1] = &unk_1F39AFDF8;
  v101[1] = v29;
  v101[2] = v30;
  v102[2] = &unk_1F39AFDB8;
  v102[3] = &unk_1F39AFDF8;
  v101[3] = v2;
  v101[4] = v8;
  v101[5] = v4;
  v102[4] = v9;
  v102[5] = @"inputBoostPreserveCBHueAmount";
  uint64_t v150 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v47, (uint64_t)v102, (uint64_t)v101, 6);
  v140[19] = @"inputBoostPreserveBMHueAmount";
  v99[0] = v6;
  v61 = (void *)v150;
  v48 = (objc_class *)objc_opt_class();
  v59 = NSStringFromClass(v48);
  v100[0] = v59;
  v100[1] = &unk_1F39AFDF8;
  v99[1] = v29;
  v99[2] = v30;
  v100[2] = &unk_1F39AFDB8;
  v100[3] = &unk_1F39AFDF8;
  v99[3] = v2;
  v99[4] = v8;
  v99[5] = v4;
  v100[4] = v9;
  v100[5] = @"inputBoostPreserveBMHueAmount";
  v50 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v49, (uint64_t)v100, (uint64_t)v99, 6);
  v151 = v50;
  v140[20] = @"inputBoostPreserveMRHueAmount";
  v97[0] = v6;
  v51 = (objc_class *)objc_opt_class();
  v52 = NSStringFromClass(v51);
  v98[0] = v52;
  v98[1] = &unk_1F39AFDF8;
  v97[1] = v29;
  v97[2] = v30;
  v98[2] = &unk_1F39AFDB8;
  v98[3] = &unk_1F39AFDF8;
  v97[3] = v2;
  v97[4] = v8;
  v97[5] = v4;
  v98[4] = v9;
  v98[5] = @"inputBoostPreserveMRHueAmount";
  v54 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v53, (uint64_t)v98, (uint64_t)v97, 6);
  v140[21] = @"kCIRAWFilterDoesClip";
  uint64_t v55 = *MEMORY[0x1E4F1CFC8];
  v152 = v54;
  uint64_t v153 = v55;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v56, (uint64_t)v141, (uint64_t)v140, 22);
  id v58 = (id)objc_claimAutoreleasedReturnValue();

  return v58;
}

- (id)customAttributes
{
  uint64_t v2 = objc_opt_class();

  return (id)MEMORY[0x1F4181798](v2, sel_customAttributes, v3, v4, v5);
}

- (id)outputImage
{
  v410[3] = *MEMORY[0x1E4F143B8];
  inputImage = self->inputImage;
  if (inputImage)
  {
    if (!self->inputBoostAmount)
    {
      v70 = inputImage;
      goto LABEL_70;
    }
    uint64_t v3 = sub_1DDA83E7C();
    uint64_t v4 = v3;
    if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DDA14000, v4, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWAdjustColorTRC", (const char *)&unk_1DDC3ACB6, buf, 2u);
    }

    v400[0] = MEMORY[0x1E4F143A8];
    v400[1] = 3221225472;
    v400[2] = sub_1DDB76C20;
    v400[3] = &unk_1E6D04A58;
    v400[4] = self;
    v376 = (void (**)(void))MEMORY[0x1E01C46E0](v400);
    objc_msgSend_floatValue(self->inputBoostPreserveHueAmount, v5, v6, v7, v8);
    float v10 = v9;
    objc_msgSend_doubleValue(self->inputBoostAmount, v11, v12, v13, v14);
    double v16 = v15;
    objc_msgSend_doubleValue(self->inputBoostShadowAmount, v17, v18, v19, v20);
    double v22 = v21;
    objc_msgSend_doubleValue(self->inputBoostHDRAmount, v23, v24, v25, v26);
    double v28 = v27;
    objc_msgSend_doubleValue(self->inputTRCs0, v29, v30, v31, v32);
    double v38 = fmin(fmax(v16, 0.0), 1.0);
    double v39 = fmin(fmax(v22, 0.0), 1.0);
    double v40 = 1.0;
    if (v38 > 0.0)
    {
      double v40 = v39 * v37;
      if (v38 < 1.0) {
        double v40 = 1.0 - v38 + v40 * v38;
      }
    }
    objc_msgSend_doubleValue(self->inputTRCs1, v33, v34, v35, v36);
    double v46 = 1.0;
    if (v38 > 0.0)
    {
      double v46 = v45;
      if (v38 < 1.0) {
        double v46 = 1.0 - v38 + v45 * v38;
      }
    }
    objc_msgSend_doubleValue(self->inputTRCs2, v41, v42, v43, v44);
    double v382 = 1.0;
    if (v38 > 0.0)
    {
      double v382 = v51;
      if (v38 < 1.0) {
        double v382 = 1.0 - v38 + v51 * v38;
      }
    }
    objc_msgSend_doubleValue(self->inputTRCs3, v47, v48, v49, v50);
    double v57 = 1.0;
    if (v38 > 0.0)
    {
      double v57 = v56;
      if (v38 < 1.0) {
        double v57 = 1.0 - v38 + v56 * v38;
      }
    }
    objc_msgSend_doubleValue(self->inputTRCs4, v52, v53, v54, v55);
    double v372 = v39;
    double v63 = 1.0;
    if (v38 > 0.0)
    {
      double v63 = v62;
      if (v38 < 1.0) {
        double v63 = 1.0 - v38 + v62 * v38;
      }
    }
    objc_msgSend_doubleValue(self->inputTRCy1, v58, v59, v60, v61);
    double v384 = v40;
    if (v38 <= 0.0)
    {
      double v69 = 0.1;
    }
    else
    {
      double v69 = v68;
      if (v38 < 1.0) {
        double v69 = (1.0 - v38) * 0.1 + v68 * v38;
      }
    }
    objc_msgSend_doubleValue(self->inputTRCy2, v64, v65, v66, v67);
    if (v38 <= 0.0)
    {
      double v76 = 0.2;
    }
    else
    {
      double v76 = v75;
      if (v38 < 1.0) {
        double v76 = (1.0 - v38) * 0.2 + v75 * v38;
      }
    }
    double v371 = v28;
    objc_msgSend_doubleValue(self->inputTRCy3, v71, v72, v73, v74);
    double v82 = 0.5;
    if (v38 > 0.0)
    {
      double v82 = v81;
      if (v38 < 1.0) {
        double v82 = (1.0 - v38) * 0.5 + v81 * v38;
      }
    }
    double v377 = v63;
    objc_msgSend_doubleValue(self->inputTRCy4, v77, v78, v79, v80);
    double v88 = 1.0;
    if (v38 > 0.0)
    {
      double v88 = v87;
      if (v38 < 1.0) {
        double v88 = 1.0 - v38 + v87 * v38;
      }
    }
    int v89 = objc_msgSend_intValue(self->inputVersion, v83, v84, v85, v86);
    v380 = self->inputImage;
    inputReferencePoints = self->inputReferencePoints;
    int v378 = v89;
    if (inputReferencePoints)
    {
      if ((unint64_t)objc_msgSend_count(inputReferencePoints, v90, v91, v92, v93) >= 2)
      {
        inputOutputPoints = self->inputOutputPoints;
        if (inputOutputPoints)
        {
          uint64_t v96 = objc_msgSend_count(inputOutputPoints, v90, v91, v92, v93);
          if (v96 == objc_msgSend_count(self->inputReferencePoints, v97, v98, v99, v100))
          {
            v101 = self->inputReferencePoints;
            v386 = self->inputOutputPoints;
            unint64_t v106 = objc_msgSend_count(v101, v102, v103, v104, v105);
            objc_msgSend_valueAtIndex_(v101, v107, v106 - 1, v108, v109);
            double v111 = v110;
            objc_msgSend_valueAtIndex_(v386, v112, v106 - 1, v113, v114);
            double v116 = v115;
            objc_msgSend_valueAtIndex_(v101, v117, v106 - 2, v118, v119);
            double v121 = v120;
            objc_msgSend_valueAtIndex_(v386, v122, v106 - 2, v123, v124);
            double v126 = v125;
            v396[0] = MEMORY[0x1E4F143A8];
            v396[1] = 3221225472;
            v396[2] = sub_1DDB76CA8;
            v396[3] = &unk_1E6D05AC0;
            unint64_t v399 = v106;
            v383 = v101;
            v397 = v383;
            v385 = v386;
            v398 = v385;
            v391 = (void *)MEMORY[0x1E01C46E0](v396);
            objc_msgSend_dataWithLength_(MEMORY[0x1E4F1CA58], v127, 16 * v106, v128, v129);
            id v393 = objc_claimAutoreleasedReturnValue();
            uint64_t v137 = objc_msgSend_mutableBytes(v393, v130, v131, v132, v133);
            if (v106 <= 4)
            {
              if (v106)
              {
                for (uint64_t i = 0; i != v106; ++i)
                {
                  objc_msgSend_valueAtIndex_(v383, v134, i, v135, v136);
                  v137[i] = v284;
                  objc_msgSend_valueAtIndex_(v385, v285, i, v286, v287);
                  v137[v106 + i] = v288;
                }
              }
            }
            else
            {
              uint64_t v138 = v383;
              v143 = (const void *)objc_msgSend__values(v138, v139, v140, v141, v142);
              memcpy(v137, v143, 8 * v106);
              v144 = v385;
              v149 = (const void *)objc_msgSend__values(v144, v145, v146, v147, v148);
              memcpy(&v137[v106], v149, 8 * v106);
            }
            uint64_t v289 = *MEMORY[0x1E4F1E3D8];
            v409[0] = *MEMORY[0x1E4F1E3D0];
            v409[1] = v289;
            v410[0] = v393;
            v410[1] = @"RAWAdjustColorTRC";
            v409[2] = *MEMORY[0x1E4F1E388];
            v410[2] = MEMORY[0x1E4F1CC38];
            v389 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v134, (uint64_t)v410, (uint64_t)v409, 3);
            id v290 = objc_alloc(MEMORY[0x1E4F1E050]);
            v292 = objc_msgSend_initWithImageProvider_width_height_format_colorSpace_options_(v290, v291, (uint64_t)v391, 256, 1, *MEMORY[0x1E4F1E318], 0, v389);
            v390 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v293, v294, v295, v296, 256.0, v38, v372, 0.0);
            v301 = objc_msgSend_vectorWithX_Y_Z_(MEMORY[0x1E4F1E080], v297, v298, v299, v300, v111, v116, (v116 - v126) / (v111 - v121));
            v302 = v380;
            objc_msgSend_extent(v292, v303, v304, v305, v306);
            uint64_t v311 = v310;
            uint64_t v313 = v312;
            uint64_t v315 = v314;
            uint64_t v317 = v316;
            id inputColorSpace = self->inputColorSpace;
            if (inputColorSpace)
            {
              v302 = objc_msgSend_imageByColorMatchingWorkingSpaceToColorSpace_(v380, v307, (uint64_t)self->inputColorSpace, v308, v309);
            }
            v381 = v302;
            v319 = objc_msgSend_kernelWithName_(BoostKernels, v307, @"boost_lut", v308, v309);
            objc_msgSend_extent(v302, v320, v321, v322, v323);
            double v325 = v324;
            double v327 = v326;
            double v329 = v328;
            double v331 = v330;
            v395[0] = MEMORY[0x1E4F143A8];
            v395[1] = 3221225472;
            v395[2] = sub_1DDB76E70;
            v395[3] = &unk_1E6D05A98;
            v395[4] = v311;
            v395[5] = v313;
            v395[6] = v315;
            v395[7] = v317;
            v408[0] = v302;
            v408[1] = v292;
            v408[2] = v390;
            v408[3] = v301;
            v334 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v332, (uint64_t)v408, 4, v333);
            v337 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v319, v335, (uint64_t)v395, (uint64_t)v334, v336, v325, v327, v329, v331);

            double v341 = fmin(fmax(v371, 1.0), 3.0);
            if (v341 > 1.0)
            {
              v342 = objc_msgSend_kernelWithName_(BoostKernels, v338, @"boost_hdr", v339, v340);
              objc_msgSend_extent(v337, v343, v344, v345, v346);
              double v348 = v347;
              double v350 = v349;
              double v352 = v351;
              double v354 = v353;
              v407[0] = v337;
              v359 = objc_msgSend_numberWithDouble_(NSNumber, v355, v356, v357, v358, v341);
              v407[1] = v359;
              v362 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v360, (uint64_t)v407, 2, v361);
              uint64_t v366 = objc_msgSend_applyWithExtent_arguments_(v342, v363, (uint64_t)v362, v364, v365, v348, v350, v352, v354);

              v337 = (void *)v366;
            }
            if (inputColorSpace)
            {
              v367 = v337;
              v337 = objc_msgSend_imageByColorMatchingColorSpaceToWorkingSpace_(v337, v338, (uint64_t)inputColorSpace, v339, v340);
            }
            v70 = v337;

            v225 = v397;
            goto LABEL_58;
          }
        }
      }
    }
    double v373 = fmin(fmax(v10, 0.0), 1.0);
    if (v89 < 7)
    {
      if (v89 < 5)
      {
        uint64_t v235 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v90, v91, v92, v93, 0.100000001, 0.200000003, 0.5, 1.0);
        double v236 = v46 * 0.1;
        objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v237, v238, v239, v240, v69 * 1000.0 * (v236 / v69 + v384 * 0.1 / v69 + -2.0), v69 * 100.0 * (1.0 - (v384 * 0.1 / v69 + v236 / v69 + v384 * 0.1 / v69 + -2.0)), v69 * 10.0 * (v384 * 0.1 / v69), 0.0);
        v385 = (CIVector *)objc_claimAutoreleasedReturnValue();
        double v241 = v236 / (v76 - v69);
        double v242 = v382 * 0.1 / (v76 - v69) + v241 + -2.0;
        uint64_t v247 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v243, v244, v245, v246, (v76 - v69) * v242 * 1000.0, (v76 - v69) * ((1.0 - (v241 + v242)) * 100.0 + v242 * -300.0), (v76 - v69) * ((1.0 - (v241 + v242)) * -20.0 + v242 * 30.0 + v241 * 10.0), v69 + (v76 - v69) * (1.0 - (v241 + v242) - v242 - v241));
        double v248 = v382 * 0.3 / (v82 - v76);
        double v249 = v57 * 0.3 / (v82 - v76) + v248 + -2.0;
        uint64_t v254 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v250, v251, v252, v253, (v82 - v76) * v249 * 1000.0 / 27.0, (v82 - v76) * ((1.0 - (v248 + v249)) * 100.0 / 9.0 + v249 * -200.0 / 9.0), (v82 - v76) * (v248 * 10.0 / 3.0 + v249 * 40.0 / 9.0 - (1.0 - (v248 + v249)) * 40.0 / 9.0), v76 + (v82 - v76) * ((1.0 - (v248 + v249)) * 4.0 / 9.0 - v249 * 8.0 / 27.0 - (v248 + v248) / 3.0));
        double v255 = v57 * 0.5 / (1.0 - v82);
        double v256 = v377 * 0.5 / (1.0 - v82) + v255 + -2.0;
        v211 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v257, v258, v259, v260, (1.0 - v82) * v256 * 8.0, (1.0 - v82) * ((1.0 - (v255 + v256)) * 4.0 + v256 * -12.0), (1.0 - v82) * (v255 * 2.0 - ((1.0 - (v255 + v256)) * 4.0 - v256 * 6.0)), v82 + (1.0 - v82) * (1.0 - (v255 + v256) - v256 - v255));
        uint64_t v265 = objc_msgSend_numberWithDouble_(NSNumber, v261, v262, v263, v264, v377);
        objc_msgSend_numberWithDouble_(NSNumber, v266, v267, v268, v269, v373);
        v370 = (void *)v265;
        v383 = (CIVector *)v235;
        v379 = BOOL v270 = v378 < 3;
        if (v270)
        {
          v206 = (void *)v254;
          v226 = v370;
          if (v373 >= 1.0)
          {
            uint64_t v375 = objc_msgSend_kernelWithName_(BoostKernels, v271, @"boost_v2_dng", v272, v273, 1.0, v373);
            v403[0] = v235;
            v403[1] = v385;
            v403[2] = v247;
            v403[3] = v254;
            v403[4] = v211;
            v403[5] = v370;
            v225 = (void *)v247;
            objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v281, (uint64_t)v403, 6, v282);
          }
          else
          {
            uint64_t v375 = objc_msgSend_kernelWithName_(BoostKernels, v271, @"boost_v2", v272, v273, 1.0, v373);
            v402[0] = v235;
            v402[1] = v385;
            v402[2] = v247;
            v402[3] = v254;
            v402[4] = v211;
            v402[5] = v370;
            v402[6] = v379;
            v225 = (void *)v247;
            objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v278, (uint64_t)v402, 7, v279);
          v223 = };
          v224 = (void *)v375;
          uint64_t v277 = objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_(self, v280, v375, (uint64_t)v380, (uint64_t)v223, self->inputColorSpace, 1);
        }
        else
        {
          v206 = (void *)v254;
          v226 = v370;
          uint64_t v374 = objc_msgSend_kernelWithName_(BoostKernels, v271, @"boost_v3", v272, v273);
          v404[0] = v235;
          v404[1] = v385;
          v404[2] = v247;
          v404[3] = v254;
          v404[4] = v211;
          v404[5] = v370;
          v404[6] = v379;
          v225 = (void *)v247;
          v223 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v274, (uint64_t)v404, 7, v275);
          v224 = (void *)v374;
          uint64_t v277 = objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_(self, v276, v374, (uint64_t)v380, (uint64_t)v223, self->inputColorSpace, 1);
        }
        v234 = (void *)v277;
        v231 = v380;
        goto LABEL_57;
      }
      v387 = 0;
      uint64_t v388 = 0;
    }
    else
    {
      uint64_t v150 = (void *)MEMORY[0x1E4F1E080];
      objc_msgSend_floatValue(self->inputBoostPreserveRYHueAmount, v90, v91, v92, v93);
      float v152 = v151;
      objc_msgSend_floatValue(self->inputBoostPreserveYGHueAmount, v153, v154, v155, v156);
      float v158 = v157;
      objc_msgSend_floatValue(self->inputBoostPreserveGCHueAmount, v159, v160, v161, v162);
      uint64_t v168 = objc_msgSend_vectorWithX_Y_Z_(v150, v164, v165, v166, v167, fminf(fmaxf(v152, 0.0), 1.0), fminf(fmaxf(v158, 0.0), 1.0), fminf(fmaxf(v163, 0.0), 1.0));
      v169 = (void *)MEMORY[0x1E4F1E080];
      objc_msgSend_floatValue(self->inputBoostPreserveCBHueAmount, v170, v171, v172, v173);
      float v175 = v174;
      objc_msgSend_floatValue(self->inputBoostPreserveBMHueAmount, v176, v177, v178, v179);
      float v181 = v180;
      objc_msgSend_floatValue(self->inputBoostPreserveMRHueAmount, v182, v183, v184, v185);
      objc_msgSend_vectorWithX_Y_Z_(v169, v187, v188, v189, v190, fminf(fmaxf(v175, 0.0), 1.0), fminf(fmaxf(v181, 0.0), 1.0), fminf(fmaxf(v186, 0.0), 1.0));
      uint64_t v388 = v387 = (void *)v168;
    }
    uint64_t v191 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v90, v91, v92, v93, 0.100000001, 0.200000003, 0.5, 1.0);
    uint64_t v196 = sub_1DDAF5060(0.0, 0.0, v384, 0.1, v69, v46, v191, v192, v193, v194, v195);
    uint64_t v201 = sub_1DDAF5060(0.1, v69, v46, 0.2, v76, v382, v196, v197, v198, v199, v200);
    v206 = sub_1DDAF5060(0.2, v76, v382, 0.5, v82, v57, v201, v202, v203, v204, v205);
    v211 = sub_1DDAF5060(0.5, v82, v57, 1.0, v88, v377, (uint64_t)v206, v207, v208, v209, v210);
    uint64_t v392 = sub_1DDAF5060(0.5, v82, v57, 1.0, v82 + v57 * 0.5, v57, (uint64_t)v211, v212, v213, v214, v215);
    objc_msgSend_numberWithDouble_(NSNumber, v216, v217, v218, v219, v373);
    v383 = (CIVector *)v191;
    v379 = v385 = (CIVector *)v196;
    if (v89 < 7)
    {
      uint64_t v369 = objc_msgSend_kernelWithName_(BoostKernels, v220, @"boost_v5", v221, v222);
      v405[0] = v191;
      v405[1] = v196;
      v405[2] = v201;
      v405[3] = v206;
      v405[4] = v211;
      v405[5] = v392;
      v405[6] = v379;
      v225 = (void *)v201;
      v226 = (void *)v392;
      v230 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v232, (uint64_t)v405, 7, v233);
      v231 = (void *)v369;
      v224 = v387;
      v223 = (void *)v388;
    }
    else
    {
      uint64_t v369 = objc_msgSend_kernelWithName_(BoostKernels, v220, @"boost_v7", v221, v222);
      v406[0] = v191;
      v406[1] = v196;
      v406[2] = v201;
      v406[3] = v206;
      v406[4] = v211;
      v406[5] = v392;
      v406[6] = v379;
      v224 = v387;
      v223 = (void *)v388;
      v406[7] = v387;
      v406[8] = v388;
      v225 = (void *)v201;
      v226 = (void *)v392;
      v230 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v227, (uint64_t)v406, 9, v228);
      v231 = (void *)v369;
    }
    v234 = objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_(self, v229, v369, (uint64_t)v380, (uint64_t)v230, self->inputColorSpace, 1);

LABEL_57:
    v70 = v234;

LABEL_58:
    v376[2](v376);

    goto LABEL_70;
  }
  v70 = 0;
LABEL_70:

  return v70;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputOutputPoints, 0);
  objc_storeStrong((id *)&self->inputReferencePoints, 0);
  objc_storeStrong((id *)&self->inputVersion, 0);
  objc_storeStrong((id *)&self->inputBoostPreserveMRHueAmount, 0);
  objc_storeStrong((id *)&self->inputBoostPreserveBMHueAmount, 0);
  objc_storeStrong((id *)&self->inputBoostPreserveCBHueAmount, 0);
  objc_storeStrong((id *)&self->inputBoostPreserveGCHueAmount, 0);
  objc_storeStrong((id *)&self->inputBoostPreserveYGHueAmount, 0);
  objc_storeStrong((id *)&self->inputBoostPreserveRYHueAmount, 0);
  objc_storeStrong((id *)&self->inputBoostPreserveHueAmount, 0);
  objc_storeStrong((id *)&self->inputBoostHDRAmount, 0);
  objc_storeStrong((id *)&self->inputBoostShadowAmount, 0);
  objc_storeStrong((id *)&self->inputBoostAmount, 0);
  objc_storeStrong((id *)&self->inputTRCs4, 0);
  objc_storeStrong((id *)&self->inputTRCy4, 0);
  objc_storeStrong((id *)&self->inputTRCs3, 0);
  objc_storeStrong((id *)&self->inputTRCy3, 0);
  objc_storeStrong((id *)&self->inputTRCs2, 0);
  objc_storeStrong((id *)&self->inputTRCy2, 0);
  objc_storeStrong((id *)&self->inputTRCs1, 0);
  objc_storeStrong((id *)&self->inputTRCy1, 0);
  objc_storeStrong((id *)&self->inputTRCs0, 0);
  objc_storeStrong(&self->inputColorSpace, 0);

  objc_storeStrong((id *)&self->inputImage, 0);
}

@end