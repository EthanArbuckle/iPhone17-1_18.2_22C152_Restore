@interface RAWDemosaicFilter
- (CGRect)regionOf:(int)a3 destRect:(CGRect)a4 userInfo:(id)a5;
- (id)blacks;
- (id)crop;
- (id)exposureFactor;
- (id)noiseModel;
- (id)outputImage;
- (id)phaseFor:(int)a3;
- (id)phaseForBayer;
- (id)phaseForQuadra;
- (id)phaseForXtrans;
- (id)range;
- (int)forceVersion;
- (int)sensorType;
- (int)versionfor:(int)a3;
@end

@implementation RAWDemosaicFilter

- (int)forceVersion
{
  v2 = getenv((const char *)qword_1EAB8AF98);
  if (!v2) {
    return -1;
  }
  v6 = objc_msgSend_stringWithUTF8String_(NSString, v3, (uint64_t)v2, v4, v5);
  int v11 = objc_msgSend_intValue(v6, v7, v8, v9, v10);

  return v11;
}

- (CGRect)regionOf:(int)a3 destRect:(CGRect)a4 userInfo:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a5;
  v13 = objc_msgSend_objectAtIndexedSubscript_(v9, v10, 2, v11, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16, v17);
  float v19 = v18;

  v23 = objc_msgSend_objectAtIndexedSubscript_(v9, v20, 3, v21, v22);
  objc_msgSend_floatValue(v23, v24, v25, v26, v27);
  float v29 = v28;

  v62.origin.double x = x + v19;
  v62.origin.double y = y + v29;
  v62.size.CGFloat width = width;
  v62.size.CGFloat height = height;
  CGRect v63 = CGRectInset(v62, -1.0, -1.0);
  CGFloat v30 = v63.origin.x;
  CGFloat v31 = v63.origin.y;
  CGFloat v32 = v63.size.width;
  CGFloat v33 = v63.size.height;
  v37 = objc_msgSend_objectAtIndexedSubscript_(v9, v34, 0, v35, v36);
  objc_msgSend_floatValue(v37, v38, v39, v40, v41);
  float v43 = v42;

  v47 = objc_msgSend_objectAtIndexedSubscript_(v9, v44, 1, v45, v46);
  objc_msgSend_floatValue(v47, v48, v49, v50, v51);
  float v53 = v52;

  v67.size.CGFloat width = v43;
  v67.size.CGFloat height = v53;
  v67.origin.double x = 0.0;
  v67.origin.double y = 0.0;
  v64.origin.double x = v30;
  v64.origin.double y = v31;
  v64.size.CGFloat width = v32;
  v64.size.CGFloat height = v33;
  CGRect v65 = CGRectIntersection(v64, v67);
  CGFloat v54 = v65.origin.x;
  CGFloat v55 = v65.origin.y;
  CGFloat v56 = v65.size.width;
  CGFloat v57 = v65.size.height;

  double v58 = v54;
  double v59 = v55;
  double v60 = v56;
  double v61 = v57;
  result.size.CGFloat height = v61;
  result.size.CGFloat width = v60;
  result.origin.double y = v59;
  result.origin.double x = v58;
  return result;
}

- (id)crop
{
  objc_msgSend_extent(self->inputImage, a2, v2, v3, v4);
  double v14 = v13;
  inputCropRect = self->inputCropRect;
  if (inputCropRect)
  {
    objc_msgSend_X(inputCropRect, v6, v7, v8, v9);
    double v17 = v16;
    objc_msgSend_Y(self->inputCropRect, v18, v19, v20, v21);
    double v23 = v22;
    objc_msgSend_W(self->inputCropRect, v24, v25, v26, v27);
    double v29 = v14 - (v23 + v28);
    objc_msgSend_Z(self->inputCropRect, v30, v31, v32, v33);
    double v35 = v34;
    objc_msgSend_W(self->inputCropRect, v36, v37, v38, v39);
    double v14 = v40;
  }
  else
  {
    double v17 = v10;
    double v29 = v11;
    double v35 = v12;
  }
  uint64_t v41 = (void *)MEMORY[0x1E4F1E080];

  return (id)objc_msgSend_vectorWithX_Y_Z_W_(v41, v6, v7, v8, v9, v17, v29, v35, v14);
}

- (id)range
{
  uint64_t v5 = NSNumber;
  objc_msgSend_floatValue(self->inputRange, a2, v2, v3, v4);
  *(float *)&double v10 = 65535.0 / *(float *)&v10;

  return (id)objc_msgSend_numberWithFloat_(v5, v6, v7, v8, v9, v10);
}

- (id)blacks
{
  v6 = (void *)MEMORY[0x1E4F1E080];
  objc_msgSend_X(self->inputBlacks, a2, v2, v3, v4);
  double v8 = fmax(v7, 0.0) / 65535.0;
  objc_msgSend_Y(self->inputBlacks, v9, v10, v11, v12);
  double v14 = fmax(v13, 0.0) / 65535.0;
  objc_msgSend_Z(self->inputBlacks, v15, v16, v17, v18);
  double v20 = fmax(v19, 0.0) / 65535.0;
  objc_msgSend_W(self->inputBlacks, v21, v22, v23, v24);
  double v30 = fmax(v29, 0.0) / 65535.0;

  return (id)objc_msgSend_vectorWithX_Y_Z_W_(v6, v25, v26, v27, v28, v8, v14, v20, v30);
}

- (id)noiseModel
{
  inputRepresentativeNoise = self->inputRepresentativeNoise;
  if (!inputRepresentativeNoise) {
    inputRepresentativeNoise = (NSNumber *)&unk_1F39AFD98;
  }
  double v8 = inputRepresentativeNoise;
  inputNoiseModel = self->inputNoiseModel;
  if (inputNoiseModel)
  {
    uint64_t v10 = inputNoiseModel;
  }
  else
  {
    objc_msgSend_vectorWithX_Y_(MEMORY[0x1E4F1E080], v4, v5, v6, v7, 0.0, 0.0);
    uint64_t v10 = (CIVector *)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v15 = v10;
  if (!self->inputNoiseModel && self->inputRepresentativeNoise)
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F1E080];
    objc_msgSend_floatValue(v8, v11, v12, v13, v14);
    uint64_t v22 = objc_msgSend_vectorWithX_Y_(v16, v18, v19, v20, v21, 0.0, (float)((float)(v17 / 100.0) * 1.0954));

    uint64_t v15 = (void *)v22;
  }
  uint64_t v23 = (void *)MEMORY[0x1E4F1E080];
  objc_msgSend_floatValue(v8, v11, v12, v13, v14);
  float v25 = v24;
  objc_msgSend_X(v15, v26, v27, v28, v29);
  double v31 = v30;
  objc_msgSend_Y(v15, v32, v33, v34, v35);
  uint64_t v41 = objc_msgSend_vectorWithX_Y_Z_(v23, v36, v37, v38, v39, v25, v31, v40);

  return v41;
}

- (id)exposureFactor
{
  uint64_t v5 = NSNumber;
  objc_msgSend_floatValue(self->inputBaselineExposure, a2, v2, v3, v4);
  *(float *)&double v11 = exp2f(v6) + 1.0;

  return (id)objc_msgSend_numberWithFloat_(v5, v7, v8, v9, v10, v11);
}

- (int)versionfor:(int)a3
{
  int v6 = objc_msgSend_intValue(self->inputVersion, a2, *(uint64_t *)&a3, v3, v4);
  if (v6) {
    int v7 = v6;
  }
  else {
    int v7 = -1;
  }
  if (v7 <= 7) {
    int v8 = 7;
  }
  else {
    int v8 = 8;
  }
  if (!a3) {
    int v7 = v8;
  }
  if (a3 == 1) {
    int v7 = v8;
  }
  if (a3 == 2) {
    return v8;
  }
  else {
    return v7;
  }
}

- (id)phaseFor:(int)a3
{
  if (a3 == 2)
  {
    uint64_t v5 = objc_msgSend_phaseForXtrans(self, a2, *(uint64_t *)&a3, v3, v4);
  }
  else if (a3 == 1)
  {
    uint64_t v5 = objc_msgSend_phaseForQuadra(self, a2, *(uint64_t *)&a3, v3, v4);
  }
  else
  {
    if (a3) {
      objc_msgSend_vectorWithX_Y_(MEMORY[0x1E4F1E080], a2, *(uint64_t *)&a3, v3, v4, 0.0, 0.0);
    }
    else {
    uint64_t v5 = objc_msgSend_phaseForBayer(self, a2, *(uint64_t *)&a3, v3, v4);
    }
  }

  return v5;
}

- (id)phaseForXtrans
{
  v118[18] = *MEMORY[0x1E4F143B8];
  int v6 = objc_msgSend_intValue(self->inputPattern, a2, v2, v3, v4);
  uint64_t v11 = v6 & 0x7F;
  if (v11 < 0x13)
  {
    objc_msgSend_extent(self->inputImage, v7, v8, v9, v10);
    uint64_t v18 = (uint64_t)llround(v17) % 6;
    double v19 = (double)~v18;
    v117 = objc_msgSend_vectorWithX_Y_(MEMORY[0x1E4F1E080], v20, v21, v22, v23, 1.0, v19);
    v118[0] = v117;
    v116 = objc_msgSend_vectorWithX_Y_(MEMORY[0x1E4F1E080], v24, v25, v26, v27, 2.0, v19);
    v118[1] = v116;
    v115 = objc_msgSend_vectorWithX_Y_(MEMORY[0x1E4F1E080], v28, v29, v30, v31, 3.0, v19);
    v118[2] = v115;
    v114 = objc_msgSend_vectorWithX_Y_(MEMORY[0x1E4F1E080], v32, v33, v34, v35, 4.0, v19);
    v118[3] = v114;
    v113 = objc_msgSend_vectorWithX_Y_(MEMORY[0x1E4F1E080], v36, v37, v38, v39, 5.0, v19);
    v118[4] = v113;
    v112 = objc_msgSend_vectorWithX_Y_(MEMORY[0x1E4F1E080], v40, v41, v42, v43, 0.0, v19);
    v118[5] = v112;
    v111 = objc_msgSend_vectorWithX_Y_(MEMORY[0x1E4F1E080], v44, v45, v46, v47, 1.0, (double)(-2 - v18));
    v118[6] = v111;
    v110 = objc_msgSend_vectorWithX_Y_(MEMORY[0x1E4F1E080], v48, v49, v50, v51, 2.0, (double)(-2 - v18));
    v118[7] = v110;
    v109 = objc_msgSend_vectorWithX_Y_(MEMORY[0x1E4F1E080], v52, v53, v54, v55, 3.0, (double)(-2 - v18));
    v118[8] = v109;
    v108 = objc_msgSend_vectorWithX_Y_(MEMORY[0x1E4F1E080], v56, v57, v58, v59, 4.0, (double)(-2 - v18));
    v118[9] = v108;
    CGRect v64 = objc_msgSend_vectorWithX_Y_(MEMORY[0x1E4F1E080], v60, v61, v62, v63, 5.0, (double)(-2 - v18));
    v118[10] = v64;
    v69 = objc_msgSend_vectorWithX_Y_(MEMORY[0x1E4F1E080], v65, v66, v67, v68, 0.0, (double)(-2 - v18));
    v118[11] = v69;
    double v70 = (double)(-3 - v18);
    v75 = objc_msgSend_vectorWithX_Y_(MEMORY[0x1E4F1E080], v71, v72, v73, v74, 1.0, v70);
    v118[12] = v75;
    v80 = objc_msgSend_vectorWithX_Y_(MEMORY[0x1E4F1E080], v76, v77, v78, v79, 2.0, v70);
    v118[13] = v80;
    v85 = objc_msgSend_vectorWithX_Y_(MEMORY[0x1E4F1E080], v81, v82, v83, v84, 3.0, v70);
    v118[14] = v85;
    v90 = objc_msgSend_vectorWithX_Y_(MEMORY[0x1E4F1E080], v86, v87, v88, v89, 4.0, v70);
    v118[15] = v90;
    v95 = objc_msgSend_vectorWithX_Y_(MEMORY[0x1E4F1E080], v91, v92, v93, v94, 5.0, v70);
    v118[16] = v95;
    v100 = objc_msgSend_vectorWithX_Y_(MEMORY[0x1E4F1E080], v96, v97, v98, v99, 0.0, v70);
    v118[17] = v100;
    v103 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v101, (uint64_t)v118, 18, v102);
    uint64_t v16 = objc_msgSend_objectAtIndexedSubscript_(v103, v104, v11, v105, v106);
  }
  else
  {
    printf("unexpected xtrans pattern %d 0x%x\n", v6, v6);
    uint64_t v16 = objc_msgSend_vectorWithX_Y_(MEMORY[0x1E4F1E080], v12, v13, v14, v15, 0.0, 0.0);
  }

  return v16;
}

- (id)phaseForQuadra
{
  objc_msgSend_extent(self->inputImage, a2, v2, v3, v4);
  double v7 = v6;
  int v12 = objc_msgSend_intValue(self->inputPattern, v8, v9, v10, v11);
  int v13 = llround(v7) & 1;
  uint64_t v22 = objc_msgSend_vectorWithX_Y_(MEMORY[0x1E4F1E080], v14, v15, v16, v17, 0.0, 0.0);
  if (v12 > 1094795584)
  {
    if (v12 == 1094795585)
    {
      uint64_t v23 = objc_msgSend_vectorWithX_Y_(MEMORY[0x1E4F1E080], v18, v19, v20, v21, 2.0, (double)(2 * v13));
      goto LABEL_11;
    }
    if (v12 == 1364283729)
    {
      uint64_t v23 = objc_msgSend_vectorWithX_Y_(MEMORY[0x1E4F1E080], v18, v19, v20, v21, 0.0, (double)(2 * v13));
      goto LABEL_11;
    }
LABEL_8:
    printf("unsupported bayer pattern %d 0x%x\n", v12, v12);
    goto LABEL_12;
  }
  if (v12 == 336860180)
  {
    uint64_t v23 = objc_msgSend_vectorWithX_Y_(MEMORY[0x1E4F1E080], v18, v19, v20, v21, 2.0, (double)((2 * v13) ^ 2));
    goto LABEL_11;
  }
  if (v12 != 353703189) {
    goto LABEL_8;
  }
  uint64_t v23 = objc_msgSend_vectorWithX_Y_(MEMORY[0x1E4F1E080], v18, v19, v20, v21, 0.0, (double)((2 * v13) ^ 2));
LABEL_11:
  float v24 = (void *)v23;

  uint64_t v22 = v24;
LABEL_12:

  return v22;
}

- (id)phaseForBayer
{
  objc_msgSend_extent(self->inputImage, a2, v2, v3, v4);
  double v7 = v6;
  int v12 = objc_msgSend_intValue(self->inputPattern, v8, v9, v10, v11);
  char v13 = llround(v7);
  uint64_t v22 = objc_msgSend_vectorWithX_Y_(MEMORY[0x1E4F1E080], v14, v15, v16, v17, 0.0, 0.0);
  if (v12 > 1229539656)
  {
    if (v12 == 1229539657)
    {
      uint64_t v23 = objc_msgSend_vectorWithX_Y_(MEMORY[0x1E4F1E080], v18, v19, v20, v21, 0.0, (double)(v13 & 1));
      goto LABEL_15;
    }
    if (v12 == 1633771873)
    {
      double v24 = 1.0;
      if (v13) {
        double v24 = 0.0;
      }
      uint64_t v23 = objc_msgSend_vectorWithX_Y_(MEMORY[0x1E4F1E080], v18, v19, v20, v21, 1.0, v24);
      goto LABEL_15;
    }
LABEL_10:
    printf("unsupported bayer pattern %d 0x%x\n", v12, v12);
    goto LABEL_16;
  }
  if (v12 == -1802201964)
  {
    double v25 = 1.0;
    if (v13) {
      double v25 = 0.0;
    }
    uint64_t v23 = objc_msgSend_vectorWithX_Y_(MEMORY[0x1E4F1E080], v18, v19, v20, v21, 0.0, v25);
    goto LABEL_15;
  }
  if (v12 != 370546198) {
    goto LABEL_10;
  }
  uint64_t v23 = objc_msgSend_vectorWithX_Y_(MEMORY[0x1E4F1E080], v18, v19, v20, v21, 1.0, (double)(v13 & 1));
LABEL_15:
  uint64_t v26 = (void *)v23;

  uint64_t v22 = v26;
LABEL_16:

  return v22;
}

- (int)sensorType
{
  int v5 = objc_msgSend_intValue(self->inputPattern, a2, v2, v3, v4);
  int v6 = 0;
  if (v5 <= 1094795584)
  {
    if (v5 <= 353703188)
    {
      if (v5 != -1802201964)
      {
        int v7 = 336860180;
        goto LABEL_14;
      }
      return v6;
    }
    if (v5 != 353703189)
    {
      int v8 = 370546198;
LABEL_10:
      if (v5 != v8) {
        return 2 * (v5 >> 8 == 8487297);
      }
      return v6;
    }
    return 1;
  }
  if (v5 <= 1364283728)
  {
    if (v5 != 1094795585)
    {
      int v8 = 1229539657;
      goto LABEL_10;
    }
    return 1;
  }
  if (v5 != 1633771873)
  {
    int v7 = 1364283729;
LABEL_14:
    if (v5 == v7) {
      return 1;
    }
    return 2 * (v5 >> 8 == 8487297);
  }
  return v6;
}

- (id)outputImage
{
  v276[3] = *MEMORY[0x1E4F143B8];
  if (self->inputImage)
  {
    uint64_t v3 = sub_1DDA83E7C();
    uint64_t v4 = v3;
    if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DDA14000, v4, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWDemosaicFilter", (const char *)&unk_1DDC3ACB6, buf, 2u);
    }

    v265[0] = MEMORY[0x1E4F143A8];
    v265[1] = 3221225472;
    v265[2] = sub_1DDB70810;
    v265[3] = &unk_1E6D04A58;
    v265[4] = self;
    v242 = (void (**)(void))MEMORY[0x1E01C46E0](v265);
    uint64_t v9 = objc_msgSend_sensorType(self, v5, v6, v7, v8);
    int v13 = objc_msgSend_versionfor_(self, v10, v9, v11, v12);
    v261 = objc_msgSend_phaseFor_(self, v14, v9, v15, v16);
    int v21 = objc_msgSend_forceVersion(self, v17, v18, v19, v20);
    if (v21 >= 0) {
      int v25 = v21;
    }
    else {
      int v25 = v13;
    }
    int v241 = v25;
    v247 = objc_msgSend_kernelWithName_(DMKernels, v22, @"deXtrans_v7", v23, v24);
    v246 = objc_msgSend_kernelWithName_(DMKernels, v26, @"deXtrans_v8", v27, v28);
    v244 = objc_msgSend_kernelWithName_(DMKernels, v29, @"deXtrans_v7_8bit", v30, v31);
    v255 = objc_msgSend_kernelWithName_(DMKernels, v32, @"deXtrans_draft", v33, v34);
    v245 = objc_msgSend_kernelWithName_(DMKernels, v35, @"deBayer_v7", v36, v37);
    v243 = objc_msgSend_kernelWithName_(DMKernels, v38, @"deBayer_v7_8bit", v39, v40);
    v254 = objc_msgSend_kernelWithName_(DMKernels, v41, @"deBayer_draft", v42, v43);
    v250 = objc_msgSend_kernelWithName_(DMKernels, v44, @"despeckle_v7", v45, v46);
    v249 = objc_msgSend_kernelWithName_(DMKernels, v47, @"despeckle_v8", v48, v49);
    v248 = objc_msgSend_kernelWithName_(DMKernels, v50, @"deBayer_v8", v51, v52);
    v257 = objc_msgSend_kernelWithName_(DMKernels, v53, @"deQuadra_draft", v54, v55);
    v260 = objc_msgSend_range(self, v56, v57, v58, v59);
    v252 = objc_msgSend_exposureFactor(self, v60, v61, v62, v63);
    uint64_t v68 = objc_msgSend_crop(self, v64, v65, v66, v67);
    v259 = objc_msgSend_blacks(self, v69, v70, v71, v72);
    v251 = objc_msgSend_noiseModel(self, v73, v74, v75, v76);
    objc_msgSend_extent(self->inputImage, v77, v78, v79, v80);
    double v82 = v81;
    double v84 = v83;
    objc_msgSend_X(v68, v85, v86, v87, v88);
    uint64_t v90 = v89;
    objc_msgSend_Y(v68, v91, v92, v93, v94);
    uint64_t v96 = v95;
    objc_msgSend_Z(v68, v97, v98, v99, v100);
    double v102 = v101;
    objc_msgSend_W(v68, v103, v104, v105, v106);
    double v108 = v107;
    v113 = objc_msgSend_vectorWithX_Y_(MEMORY[0x1E4F1E080], v109, v110, v111, v112, v82, v84);
    objc_msgSend_floatValue(self->inputDespeckle, v114, v115, v116, v117);
    float v119 = v118;
    v264[0] = MEMORY[0x1E4F143A8];
    v264[1] = 3221225472;
    v264[2] = sub_1DDB70898;
    v264[3] = &unk_1E6D05A98;
    *(double *)&v264[4] = v82;
    *(double *)&v264[5] = v84;
    v264[6] = v90;
    v264[7] = v96;
    v258 = (void *)MEMORY[0x1E01C46E0](v264);
    v263[0] = MEMORY[0x1E4F143A8];
    v263[1] = 3221225472;
    v263[2] = sub_1DDB70928;
    v263[3] = &unk_1E6D05A98;
    *(double *)&v263[4] = v82;
    *(double *)&v263[5] = v84;
    v263[6] = v90;
    v263[7] = v96;
    v256 = (void *)MEMORY[0x1E01C46E0](v263);
    v262[0] = MEMORY[0x1E4F143A8];
    v262[1] = 3221225472;
    v262[2] = sub_1DDB70958;
    v262[3] = &unk_1E6D05A98;
    *(double *)&v262[4] = v82;
    *(double *)&v262[5] = v84;
    v262[6] = v90;
    v262[7] = v96;
    v253 = (void *)MEMORY[0x1E01C46E0](v262);
    v124 = objc_msgSend__imageBySamplingNearest(self->inputImage, v120, v121, v122, v123);
    uint64_t v125 = sub_1DDBEE610(v124);
    v129 = objc_msgSend_imageByColorMatchingWorkingSpaceToColorSpace_(v124, v126, v125, v127, v128);

    if (v9 == 2)
    {
      if (objc_msgSend_BOOLValue(self->inputDraftMode, v130, v131, v132, v133))
      {
        id v166 = v255;
        v270[0] = v129;
        v270[1] = v259;
        v270[2] = v260;
        v270[3] = v261;
        v270[4] = v113;
        v270[5] = v68;
        uint64_t v179 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v177, (uint64_t)v270, 6, v178);
        v167 = (void *)MEMORY[0x1E01C46E0](v256);
        v180 = (void *)v179;
        objc_msgSend_applyWithExtent_roiCallback_arguments_(v166, v181, (uint64_t)v167, v179, v182, 0.0, 0.0, v102, v108);
LABEL_41:
        id v183 = (id)objc_claimAutoreleasedReturnValue();

        uint64_t v234 = sub_1DDBEE610(v233);
        v184 = objc_msgSend_imageByColorMatchingColorSpaceToWorkingSpace_(v183, v235, v234, v236, v237);

        goto LABEL_42;
      }
      inputScaleFactor = self->inputScaleFactor;
      if (inputScaleFactor && (objc_msgSend_doubleValue(inputScaleFactor, v173, v174, v175, v176), v186 < 0.6))
      {
        id v166 = v244;
        v167 = (void *)MEMORY[0x1E01C46E0](v253);
        v269[0] = v129;
        v269[1] = v259;
        v269[2] = v260;
        v269[3] = v261;
        v269[4] = v113;
        v269[5] = v68;
        uint64_t v170 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v187, (uint64_t)v269, 6, v188);
      }
      else
      {
        if (v241 == 8)
        {
          id v166 = v246;
          v167 = (void *)MEMORY[0x1E01C46E0](v253);
          v267[0] = v129;
          v267[1] = v259;
          v267[2] = v260;
          v267[3] = v261;
          v267[4] = v113;
          v267[5] = v68;
          v267[6] = v251;
          v267[7] = v252;
          v267[8] = self->inputFactors;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v189, (uint64_t)v267, 9, v190);
        }
        else
        {
          id v166 = v247;
          v167 = (void *)MEMORY[0x1E01C46E0](v253);
          v268[0] = v129;
          v268[1] = v259;
          v268[2] = v260;
          v268[3] = v261;
          v268[4] = v113;
          v268[5] = v68;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v238, (uint64_t)v268, 6, v239);
        uint64_t v170 = };
      }
    }
    else
    {
      if (v9 == 1)
      {
        uint64_t v165 = objc_msgSend__imageBySamplingNearest(v129, v130, v131, v132, v133);

        id v166 = v257;
        v167 = (void *)MEMORY[0x1E01C46E0](v258);
        v271[0] = v165;
        v271[1] = v259;
        v271[2] = v260;
        v271[3] = v261;
        v271[4] = v113;
        v271[5] = v68;
        uint64_t v170 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v168, (uint64_t)v271, 6, v169);
      }
      else
      {
        if (v9)
        {
          id v183 = v129;
          v184 = v183;
LABEL_42:

          v242[2](v242);
          goto LABEL_45;
        }
        char v134 = objc_msgSend_BOOLValue(self->inputDraftMode, v130, v131, v132, v133);
        LODWORD(v139) = 1.0;
        float v140 = fminf(v119, 1.0);
        if ((v134 & 1) == 0 && (double v139 = v140, v140 > 0.01) || v241 == 8)
        {
          v141 = NSNumber;
          objc_msgSend_floatValue(self->inputDespeckle, v135, v136, v137, v138, v139);
          *(float *)&double v143 = (float)(v142 * 1.25) + (float)(v142 * 1.25);
          v148 = objc_msgSend_numberWithFloat_(v141, v144, v145, v146, v147, v143);
          objc_msgSend_floatValue(self->inputDespeckle, v149, v150, v151, v152);
          if (v157 <= 0.5)
          {
            v164 = &unk_1F39AFD98;
          }
          else
          {
            objc_msgSend_floatValue(self->inputDespeckle, v153, v154, v155, v156);
            uint64_t v163 = objc_msgSend_numberWithDouble_(NSNumber, v159, v160, v161, v162, fmax(v158 * -4.99394315 * v158 + v158 * 20.886197 * v158 * v158 + v158 * -11.5599299 + 5.66767614, 1.25));

            v164 = &unk_1F39AFDA8;
            v148 = (void *)v163;
          }
          objc_msgSend_extent(v129, v153, v154, v155, v156);
          if (v241 == 8)
          {
            double v199 = v195;
            double v200 = v196;
            double v201 = v197;
            double v202 = v198;
            v275[0] = v129;
            v275[1] = v113;
            v275[2] = v261;
            v275[3] = v148;
            v275[4] = v164;
            v203 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v191, (uint64_t)v275, 5, v194);
            objc_msgSend_applyWithExtent_roiCallback_arguments_(v249, v204, (uint64_t)&unk_1F3984180, (uint64_t)v203, v205, v199, v200, v201, v202);
            v129 = v206 = v129;
          }
          else
          {
            double v207 = v195;
            double v208 = v196;
            double v209 = v197;
            double v210 = v198;
            v276[0] = v129;
            v276[1] = v113;
            *(float *)&double v195 = v140;
            v203 = objc_msgSend_numberWithFloat_(NSNumber, v191, v192, v193, v194, v195);
            v276[2] = v203;
            v206 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v211, (uint64_t)v276, 3, v212);
            uint64_t v215 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v250, v213, (uint64_t)&unk_1F3984160, (uint64_t)v206, v214, v207, v208, v209, v210);

            v129 = (void *)v215;
          }
        }
        uint64_t v165 = objc_msgSend__imageBySamplingNearest(v129, v135, v136, v137, v138);

        if (objc_msgSend_BOOLValue(self->inputDraftMode, v216, v217, v218, v219))
        {
          id v166 = v254;
          v167 = (void *)MEMORY[0x1E01C46E0](v258);
          v274[0] = v165;
          v274[1] = v259;
          v274[2] = v260;
          v274[3] = v261;
          v274[4] = v113;
          v274[5] = v68;
          uint64_t v170 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v224, (uint64_t)v274, 6, v225);
        }
        else if (v241 == 8)
        {
          id v166 = v248;
          v167 = (void *)MEMORY[0x1E01C46E0](v256);
          v272[0] = v165;
          v272[1] = v259;
          v272[2] = v260;
          v272[3] = v261;
          v272[4] = v113;
          v272[5] = v68;
          v272[6] = v251;
          v272[7] = v252;
          v272[8] = self->inputFactors;
          uint64_t v170 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v226, (uint64_t)v272, 9, v227);
        }
        else
        {
          v228 = self->inputScaleFactor;
          if (!v228 || (objc_msgSend_doubleValue(v228, v220, v221, v222, v223), v229 = v243, v230 >= 0.6)) {
            v229 = v245;
          }
          id v166 = v229;
          v167 = (void *)MEMORY[0x1E01C46E0](v256);
          v273[0] = v165;
          v273[1] = v259;
          v273[2] = v260;
          v273[3] = v261;
          v273[4] = v113;
          v273[5] = v68;
          v273[6] = self->inputRepresentativeNoise;
          uint64_t v170 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v231, (uint64_t)v273, 7, v232);
        }
      }
      v129 = (void *)v165;
    }
    v180 = (void *)v170;
    objc_msgSend_applyWithExtent_roiCallback_arguments_(v166, v171, (uint64_t)v167, v170, v172, 0.0, 0.0, v102, v108);
    goto LABEL_41;
  }
  v184 = 0;
LABEL_45:

  return v184;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputVersion, 0);
  objc_storeStrong((id *)&self->inputBaselineExposure, 0);
  objc_storeStrong((id *)&self->inputNoiseModel, 0);
  objc_storeStrong((id *)&self->inputScaleFactor, 0);
  objc_storeStrong((id *)&self->inputDraftMode, 0);
  objc_storeStrong((id *)&self->inputRepresentativeNoise, 0);
  objc_storeStrong((id *)&self->inputCropRect, 0);
  objc_storeStrong((id *)&self->inputDespeckle, 0);
  objc_storeStrong((id *)&self->inputPattern, 0);
  objc_storeStrong((id *)&self->inputFactors, 0);
  objc_storeStrong((id *)&self->inputRange, 0);
  objc_storeStrong((id *)&self->inputBlacks, 0);

  objc_storeStrong((id *)&self->inputImage, 0);
}

@end