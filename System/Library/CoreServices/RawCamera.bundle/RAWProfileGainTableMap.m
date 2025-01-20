@interface RAWProfileGainTableMap
- (id)gainImage;
- (id)outputImage;
@end

@implementation RAWProfileGainTableMap

- (id)gainImage
{
  v32[3] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_unsignedLongValue(self->inputMapPointsH, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_unsignedLongValue(self->inputMapPointsV, v7, v8, v9, v10);
  uint64_t v16 = objc_msgSend_unsignedLongValue(self->inputMapPointsN, v12, v13, v14, v15) * v6;
  inputGainData = self->inputGainData;
  uint64_t v18 = *MEMORY[0x1E4F1E3D8];
  v31[0] = *MEMORY[0x1E4F1E3D0];
  v31[1] = v18;
  v32[0] = inputGainData;
  v32[1] = @"RAWProfileGainTableMap";
  v31[2] = *MEMORY[0x1E4F1E388];
  v32[2] = MEMORY[0x1E4F1CC38];
  v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v19, (uint64_t)v32, (uint64_t)v31, 3);
  v21 = self->inputGainData;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = sub_1DDADD534;
  v28[3] = &unk_1E6D05340;
  v29 = v21;
  uint64_t v30 = 4 * v16;
  v22 = v21;
  v23 = (void *)MEMORY[0x1E01C46E0](v28);
  id v24 = objc_alloc(MEMORY[0x1E4F1E050]);
  v26 = objc_msgSend_initWithImageProvider_width_height_format_colorSpace_options_(v24, v25, (uint64_t)v23, v16, v11, *MEMORY[0x1E4F1E318], 0, v20);

  return v26;
}

- (id)outputImage
{
  v173[8] = *MEMORY[0x1E4F143B8];
  if (qword_1EAB8B1C8 != -1) {
    dispatch_once(&qword_1EAB8B1C8, &unk_1F396ACD8);
  }
  if (!qword_1EAB8B1D0)
  {
    v64 = sub_1DDBBAA08();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
      sub_1DDBF4BF8(v64);
    }

    inputImage = self->inputImage;
    goto LABEL_21;
  }
  objc_msgSend_extent(self->inputImage, a2, v2, v3, v4);
  double x = v175.origin.x;
  double y = v175.origin.y;
  double width = v175.size.width;
  double height = v175.size.height;
  if (CGRectIsEmpty(v175)) {
    goto LABEL_20;
  }
  v176.origin.double x = x;
  v176.origin.double y = y;
  v176.size.double width = width;
  v176.size.double height = height;
  if (CGRectIsInfinite(v176)) {
    goto LABEL_20;
  }
  objc_msgSend_floatValue(self->inputStrength, v10, v11, v12, v13);
  if (fminf(fmaxf(v14, 0.0), 1.0) <= 0.0) {
    goto LABEL_20;
  }
  v177.origin.double x = x;
  v177.origin.double y = y;
  v177.size.double width = width;
  v177.size.double height = height;
  if (CGRectIsEmpty(v177)
    || (v178.origin.double x = x, v178.origin.y = y, v178.size.width = width, v178.size.height = height, CGRectIsInfinite(v178)))
  {
LABEL_20:
    inputImage = self->inputImage;
LABEL_21:
    v67 = inputImage;
    goto LABEL_22;
  }
  uint64_t v19 = objc_msgSend_unsignedLongValue(self->inputMapPointsH, v15, v16, v17, v18);
  uint64_t v24 = objc_msgSend_unsignedLongValue(self->inputMapPointsV, v20, v21, v22, v23);
  uint64_t v29 = objc_msgSend_unsignedLongValue(self->inputMapPointsN, v25, v26, v27, v28);
  objc_msgSend_doubleValue(self->inputMapSpacingH, v30, v31, v32, v33);
  double v35 = v34;
  objc_msgSend_doubleValue(self->inputMapSpacingV, v36, v37, v38, v39);
  double v41 = v40;
  objc_msgSend_doubleValue(self->inputMapOriginH, v42, v43, v44, v45);
  double v47 = v46;
  objc_msgSend_doubleValue(self->inputMapOriginV, v48, v49, v50, v51);
  uint64_t v57 = v24 * v19 * v29;
  if (!v57
    || (double v58 = v56, !objc_msgSend_length(self->inputGainData, v52, v53, v54, v55))
    || objc_msgSend_length(self->inputGainData, v59, v60, v61, v62) != 4 * v57)
  {
    v66 = sub_1DDBBAA08();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
      sub_1DDBF4C3C(v66);
    }

    goto LABEL_20;
  }
  double v158 = v47;
  double v63 = (double)(unint64_t)v19;
  if (v35 <= 1.0)
  {
    double v156 = v35;
  }
  else
  {
    double v156 = 1.0 / v63;
    double v158 = 0.5 / v63;
  }
  double v69 = (double)(unint64_t)v24;
  if (v41 > 1.0)
  {
    double v41 = 1.0 / v69;
    double v58 = 0.5 / v69;
  }
  memset(&v172, 0, sizeof(v172));
  v171.a = v156 * v63;
  v171.b = 0.0;
  v171.c = 0.0;
  double v152 = 1.0 - (v58 + v41 * (double)(unint64_t)(v24 - 1));
  v171.d = v41 * v69;
  v171.tdouble x = v158 - v156 * 0.5;
  v171.tdouble y = v152 - v41 * 0.5;
  CGAffineTransformInvert(&v172, &v171);
  memset(&v171, 0, sizeof(v171));
  CGAffineTransformMakeScale(&v171, 1.0 / width, 1.0 / height);
  memset(&v170, 0, sizeof(v170));
  CGAffineTransformMakeScale(&v170, (double)(unint64_t)v19, (double)(unint64_t)v24);
  memset(&v169, 0, sizeof(v169));
  CGAffineTransform t1 = v171;
  CGAffineTransform t2 = v172;
  CGAffineTransformConcat(&v168, &t1, &t2);
  CGAffineTransform t1 = v170;
  CGAffineTransformConcat(&v169, &v168, &t1);
  v70 = sub_1DDA83E7C();
  v71 = v70;
  if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v70))
  {
    LOWORD(t1.a) = 0;
    _os_signpost_emit_with_name_impl(&dword_1DDA14000, v71, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWProfileGainTableMap", (const char *)&unk_1DDC3ACB6, (uint8_t *)&t1, 2u);
  }

  v165[0] = MEMORY[0x1E4F143A8];
  v165[1] = 3221225472;
  v165[2] = sub_1DDADDD7C;
  v165[3] = &unk_1E6D04A58;
  v165[4] = self;
  v155 = (void (**)(void))MEMORY[0x1E01C46E0](v165);
  v154 = objc_msgSend_gainImage(self, v72, v73, v74, v75);
  v159 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v76, v77, v78, v79, width * v158, height * v152, width * v156, height * v41);
  v80 = (void *)MEMORY[0x1E4F1E080];
  objc_msgSend_valueAtIndex_(self->inputWeights, v81, 0, v82, v83);
  double v85 = v84;
  objc_msgSend_valueAtIndex_(self->inputWeights, v86, 1, v87, v88);
  double v90 = v89;
  objc_msgSend_valueAtIndex_(self->inputWeights, v91, 2, v92, v93);
  v157 = objc_msgSend_vectorWithX_Y_Z_(v80, v94, v95, v96, v97, v85, v90, v98);
  v99 = (void *)MEMORY[0x1E4F1E080];
  objc_msgSend_valueAtIndex_(self->inputWeights, v100, 3, v101, v102);
  double v104 = v103;
  objc_msgSend_valueAtIndex_(self->inputWeights, v105, 4, v106, v107);
  v153 = objc_msgSend_vectorWithX_Y_(v99, v108, v109, v110, v111, v104, v112);
  v117 = objc_msgSend_vectorWithX_Y_Z_(MEMORY[0x1E4F1E080], v113, v114, v115, v116, (double)(unint64_t)v19, (double)(unint64_t)v24, (double)(unint64_t)v29);
  v118 = self->inputImage;
  v123 = v118;
  id inputColorSpace = self->inputColorSpace;
  if (inputColorSpace)
  {
    uint64_t v125 = objc_msgSend_imageByColorMatchingWorkingSpaceToColorSpace_(v118, v119, (uint64_t)self->inputColorSpace, v121, v122);

    v123 = (void *)v125;
  }
  v126 = (void *)qword_1EAB8B1D0;
  v160[0] = MEMORY[0x1E4F143A8];
  v160[1] = 3221225472;
  v160[2] = sub_1DDADDE04;
  v160[3] = &unk_1E6D05360;
  CGAffineTransform v161 = v169;
  uint64_t v162 = v19;
  uint64_t v163 = v24;
  uint64_t v164 = v29;
  v173[0] = v123;
  v173[1] = v154;
  v173[2] = v159;
  v173[3] = v117;
  v173[4] = v157;
  v173[5] = v153;
  v127 = NSNumber;
  objc_msgSend_floatValue(self->inputGamma, v119, v120, v121, v122);
  v132 = objc_msgSend_numberWithFloat_(v127, v128, v129, v130, v131);
  v173[6] = v132;
  v133 = NSNumber;
  objc_msgSend_floatValue(self->inputStrength, v134, v135, v136, v137);
  v142 = objc_msgSend_numberWithFloat_(v133, v138, v139, v140, v141);
  v173[7] = v142;
  v145 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v143, (uint64_t)v173, 8, v144);
  objc_msgSend_applyWithExtent_roiCallback_arguments_(v126, v146, (uint64_t)v160, (uint64_t)v145, v147, x, y, width, height);
  v67 = (CIImage *)objc_claimAutoreleasedReturnValue();

  if (inputColorSpace)
  {
    uint64_t v151 = objc_msgSend_imageByColorMatchingColorSpaceToWorkingSpace_(v67, v148, (uint64_t)inputColorSpace, v149, v150);

    v67 = (CIImage *)v151;
  }

  v155[2]();
LABEL_22:

  return v67;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->inputColorSpace, 0);
  objc_storeStrong((id *)&self->inputStrength, 0);
  objc_storeStrong((id *)&self->inputGamma, 0);
  objc_storeStrong((id *)&self->inputGainData, 0);
  objc_storeStrong((id *)&self->inputWeights, 0);
  objc_storeStrong((id *)&self->inputMapPointsN, 0);
  objc_storeStrong((id *)&self->inputMapOriginH, 0);
  objc_storeStrong((id *)&self->inputMapOriginV, 0);
  objc_storeStrong((id *)&self->inputMapSpacingH, 0);
  objc_storeStrong((id *)&self->inputMapSpacingV, 0);
  objc_storeStrong((id *)&self->inputMapPointsH, 0);
  objc_storeStrong((id *)&self->inputMapPointsV, 0);

  objc_storeStrong((id *)&self->inputImage, 0);
}

@end