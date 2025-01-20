@interface CIToneCurve
+ (id)customAttributes;
- (BOOL)_isIdentity;
- (CIImage)inputImage;
- (CIVector)inputPoint0;
- (CIVector)inputPoint1;
- (CIVector)inputPoint2;
- (CIVector)inputPoint3;
- (CIVector)inputPoint4;
- (NSNumber)inputExtrapolate;
- (id)outputImage;
- (void)setInputExtrapolate:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputPoint0:(id)a3;
- (void)setInputPoint1:(id)a3;
- (void)setInputPoint2:(id)a3;
- (void)setInputPoint3:(id)a3;
- (void)setInputPoint4:(id)a3;
@end

@implementation CIToneCurve

+ (id)customAttributes
{
  v17[9] = *MEMORY[0x1E4F143B8];
  v16[0] = @"CIAttributeFilterCategories";
  v15[0] = @"CICategoryColorAdjustment";
  v15[1] = @"CICategoryVideo";
  v15[2] = @"CICategoryStillImage";
  v15[3] = @"CICategoryInterlaced";
  v15[4] = @"CICategoryNonSquarePixels";
  v15[5] = @"CICategoryHighDynamicRange";
  v15[6] = @"CICategoryBuiltIn";
  v17[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:7];
  v17[1] = @"5";
  v16[1] = @"CIAttributeFilterAvailable_iOS";
  v16[2] = @"CIAttributeFilterAvailable_Mac";
  v17[2] = @"10.7";
  v16[3] = @"inputPoint0";
  v13[0] = @"CIAttributeDefault";
  v14[0] = +[CIVector vectorWithX:0.0 Y:0.0];
  v13[1] = @"CIAttributeIdentity";
  v13[2] = @"CIAttributeType";
  v14[1] = +[CIVector vectorWithX:0.0 Y:0.0];
  v14[2] = @"CIAttributeTypeOffset";
  v17[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v16[4] = @"inputPoint1";
  v11[0] = @"CIAttributeDefault";
  v12[0] = +[CIVector vectorWithX:0.25 Y:0.25];
  v11[1] = @"CIAttributeIdentity";
  v11[2] = @"CIAttributeType";
  v12[1] = +[CIVector vectorWithX:0.25 Y:0.25];
  v12[2] = @"CIAttributeTypeOffset";
  v17[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  v16[5] = @"inputPoint2";
  v9[0] = @"CIAttributeDefault";
  v10[0] = +[CIVector vectorWithX:0.5 Y:0.5];
  v9[1] = @"CIAttributeIdentity";
  v9[2] = @"CIAttributeType";
  v10[1] = +[CIVector vectorWithX:0.5 Y:0.5];
  v10[2] = @"CIAttributeTypeOffset";
  v17[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];
  v16[6] = @"inputPoint3";
  v7[0] = @"CIAttributeDefault";
  v8[0] = +[CIVector vectorWithX:0.75 Y:0.75];
  v7[1] = @"CIAttributeIdentity";
  v7[2] = @"CIAttributeType";
  v8[1] = +[CIVector vectorWithX:0.75 Y:0.75];
  v8[2] = @"CIAttributeTypeOffset";
  v17[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];
  v16[7] = @"inputPoint4";
  v5[0] = @"CIAttributeDefault";
  v6[0] = +[CIVector vectorWithX:1.0 Y:1.0];
  v5[1] = @"CIAttributeIdentity";
  v5[2] = @"CIAttributeType";
  v6[1] = +[CIVector vectorWithX:1.0 Y:1.0];
  v6[2] = @"CIAttributeTypeOffset";
  v17[7] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:3];
  v16[8] = @"inputExtrapolate";
  v3[0] = @"CIAttributeDefault";
  v3[1] = @"CIAttributeMin";
  v4[0] = MEMORY[0x1E4F1CC28];
  v4[1] = MEMORY[0x1E4F1CC28];
  v3[2] = @"CIAttributeMax";
  v3[3] = @"CIAttributeType";
  v4[2] = MEMORY[0x1E4F1CC38];
  v4[3] = @"CIAttributeTypeBoolean";
  v17[8] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:4];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:9];
}

- (BOOL)_isIdentity
{
  [(CIVector *)self->inputPoint0 X];
  double v4 = v3;
  [(CIVector *)self->inputPoint0 Y];
  if (vabdd_f64(v4, v5) >= 0.001) {
    return 0;
  }
  [(CIVector *)self->inputPoint1 X];
  double v7 = v6;
  [(CIVector *)self->inputPoint1 Y];
  if (vabdd_f64(v7, v8) >= 0.001) {
    return 0;
  }
  [(CIVector *)self->inputPoint2 X];
  double v10 = v9;
  [(CIVector *)self->inputPoint2 Y];
  if (vabdd_f64(v10, v11) >= 0.001) {
    return 0;
  }
  [(CIVector *)self->inputPoint3 X];
  double v13 = v12;
  [(CIVector *)self->inputPoint3 Y];
  if (vabdd_f64(v13, v14) >= 0.001) {
    return 0;
  }
  [(CIVector *)self->inputPoint4 X];
  double v16 = v15;
  [(CIVector *)self->inputPoint4 Y];
  return vabdd_f64(v16, v17) < 0.001;
}

- (id)outputImage
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  BOOL v3 = [(CIToneCurve *)self _isIdentity];
  inputImage = self->inputImage;
  if (v3)
  {
    double v5 = inputImage;
    return v5;
  }
  else
  {
    uint64_t v7 = [[(CIImage *)inputImage imageByApplyingFilter:@"CILinearToSRGBToneCurve"] imageByUnpremultiplyingAlpha];
    double v8 = +[CIKernel kernelWithInternalRepresentation:&CI::_toneCurve];
    [(CIVector *)self->inputPoint0 X];
    double v10 = v9;
    double v95 = v9;
    double v11 = (double *)v96;
    [(CIVector *)self->inputPoint0 Y];
    v96[0] = v12;
    [(CIVector *)self->inputPoint1 X];
    v96[1] = v13;
    [(CIVector *)self->inputPoint1 Y];
    v96[2] = v14;
    [(CIVector *)self->inputPoint2 X];
    v97[0] = v15;
    [(CIVector *)self->inputPoint2 Y];
    v97[1] = v16;
    [(CIVector *)self->inputPoint3 X];
    double v18 = v17;
    *(double *)&v97[2] = v17;
    [(CIVector *)self->inputPoint3 Y];
    v97[3] = v19;
    [(CIVector *)self->inputPoint4 X];
    double v21 = v20;
    *(double *)&v97[4] = v20;
    [(CIVector *)self->inputPoint4 Y];
    uint64_t v22 = 0;
    v97[5] = v23;
    uint64_t v94 = 0;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    uint64_t v114 = 0;
    long long v112 = 0u;
    long long v113 = 0u;
    uint64_t v111 = 0;
    memset(v110, 0, sizeof(v110));
    uint64_t v109 = 0;
    memset(v108, 0, sizeof(v108));
    uint64_t v107 = 0;
    memset(v106, 0, sizeof(v106));
    int v105 = 0;
    memset(v104, 0, sizeof(v104));
    int v103 = 0;
    memset(v102, 0, sizeof(v102));
    uint64_t v101 = 0;
    memset(v100, 0, sizeof(v100));
    uint64_t v99 = 0;
    memset(v98, 0, sizeof(v98));
    do
    {
      double v24 = *v11;
      v11 += 2;
      float v25 = v24;
      *(float *)((char *)&v112 + v22) = v25;
      v22 += 4;
    }
    while (v22 != 20);
    uint64_t v26 = 0;
    uint64_t v27 = 2;
    do
    {
      double v28 = *(double *)&v96[v27 - 1];
      float v29 = v28 - v10;
      *(float *)((char *)v104 + v26) = v29;
      v26 += 4;
      v27 += 2;
      double v10 = v28;
    }
    while (v26 != 16);
    uint64_t v30 = 0;
    float v31 = *((float *)&v112 + 1);
    float v32 = *(float *)v104;
    float v33 = *(float *)v104;
    do
    {
      float v34 = *(float *)((char *)v104 + v30 + 4);
      float v35 = *(float *)((char *)&v112 + v30 + 8);
      *(float *)((char *)v102 + v30 + 4) = (float)((float)(-3.0 / v33) * (float)(v31 - *(float *)((char *)&v112 + v30)))
                                         + (float)((float)(3.0 / v34) * (float)(v35 - v31));
      v30 += 4;
      float v33 = v34;
      float v31 = v35;
    }
    while (v30 != 12);
    v36 = (double *)v97;
    float v37 = 0.0;
    uint64_t v38 = 4;
    float v39 = 0.0;
    do
    {
      float v40 = -((float)(v39 * v32) - (*v36 - *(v36 - 4)) * 2.0);
      float v41 = *(float *)((char *)v102 + v38) - (float)(v32 * v37);
      float v42 = *(float *)((char *)v104 + v38);
      float v39 = v42 / v40;
      *(float *)((char *)v100 + v38) = v42 / v40;
      float v37 = v41 / v40;
      *(float *)((char *)v98 + v38) = v41 / v40;
      v38 += 4;
      v36 += 2;
      float v32 = v42;
    }
    while (v38 != 16);
    float v43 = 0.0;
    LODWORD(v44) = v113;
    for (uint64_t i = 12; i != -4; i -= 4)
    {
      float v46 = *(float *)((char *)v98 + i) - (float)(*(float *)((char *)v100 + i) * v43);
      *(float *)((char *)v108 + i) = v46;
      float v47 = *(float *)((char *)&v112 + i);
      float v48 = *(float *)((char *)v104 + i);
      double v49 = (float)((float)(*(float *)&v44 - v47) / v48);
      double v50 = v48;
      *(float *)&double v49 = v49 + (v43 + v46 * 2.0) * v50 * -0.333333333;
      *(_DWORD *)((char *)v110 + i) = LODWORD(v49);
      double v44 = v50 * 3.0;
      float v51 = (float)(v43 - v46) / (v50 * 3.0);
      *(float *)((char *)v106 + i) = v51;
      *(float *)&double v44 = v47;
      float v43 = v46;
    }
    uint64_t v52 = 0;
    v53 = (double *)&v83;
    v54 = &v95;
    do
    {
      uint64_t v55 = *(void *)v54;
      v54 += 2;
      double v56 = *(float *)((char *)&v112 + v52);
      *((void *)v53 - 2) = v55;
      *(v53 - 1) = v56;
      double v57 = *(float *)((char *)v108 + v52);
      float v58 = *(float *)((char *)v106 + v52);
      double *v53 = *(float *)((char *)v110 + v52);
      v53[1] = v57;
      v53[2] = v58;
      v52 += 4;
      v53 += 5;
    }
    while (v52 != 16);
    float v59 = v21 - v18;
    *(double *)&long long v92 = v21;
    long long v60 = v90;
    double v61 = v59;
    long long v62 = v91;
    double v63 = *((double *)&v91 + 1) * v61 * v61;
    double v64 = *(double *)&v90 + *((double *)&v90 + 1) * v61 + *(double *)&v91 * v61 * v61 + v63 * v61;
    double v65 = *((double *)&v90 + 1) + *(double *)&v91 * v61 * 2.0 + v63 * 3.0;
    v66 = +[CIVector vectorWithX:*((double *)&v82 + 1) Y:v83 Z:*(double *)&v84 W:v44];
    v67 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v85, v86);
    v68 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", *((double *)&v87 + 1), v88, *(double *)&v89);
    v69 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v60, v62);
    v70 = +[CIVector vectorWithX:v64 Y:v65 Z:0.0 W:0.0];
    if ([(NSNumber *)self->inputExtrapolate BOOLValue]) {
      float v71 = 1.0;
    }
    else {
      float v71 = 0.0;
    }
    [(CIImage *)self->inputImage extent];
    double v73 = v72;
    double v75 = v74;
    double v77 = v76;
    double v79 = v78;
    v81[1] = objc_msgSend(NSNumber, "numberWithDouble:", *(double *)&v82, v7);
    v81[2] = v66;
    v81[3] = [NSNumber numberWithDouble:*((double *)&v84 + 1)];
    v81[4] = v67;
    v81[5] = [NSNumber numberWithDouble:*(double *)&v87];
    v81[6] = v68;
    v81[7] = [NSNumber numberWithDouble:*((double *)&v89 + 1)];
    v81[8] = v69;
    v81[9] = [NSNumber numberWithDouble:*(double *)&v92];
    v81[10] = v70;
    *(float *)&double v80 = v71;
    v81[11] = [NSNumber numberWithFloat:v80];
    return -[CIImage imageByApplyingFilter:](-[CIImage imageByPremultiplyingAlpha](-[CIColorKernel applyWithExtent:arguments:](v8, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:12], v73, v75, v77, v79), "imageByPremultiplyingAlpha"), "imageByApplyingFilter:", @"CISRGBToneCurveToLinear");
  }
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIVector)inputPoint0
{
  return self->inputPoint0;
}

- (void)setInputPoint0:(id)a3
{
}

- (CIVector)inputPoint1
{
  return self->inputPoint1;
}

- (void)setInputPoint1:(id)a3
{
}

- (CIVector)inputPoint2
{
  return self->inputPoint2;
}

- (void)setInputPoint2:(id)a3
{
}

- (CIVector)inputPoint3
{
  return self->inputPoint3;
}

- (void)setInputPoint3:(id)a3
{
}

- (CIVector)inputPoint4
{
  return self->inputPoint4;
}

- (void)setInputPoint4:(id)a3
{
}

- (NSNumber)inputExtrapolate
{
  return self->inputExtrapolate;
}

- (void)setInputExtrapolate:(id)a3
{
}

@end