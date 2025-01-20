@interface CIPageCurlTransition
+ (id)customAttributes;
- (CIImage)inputBacksideImage;
- (CIImage)inputImage;
- (CIImage)inputShadingImage;
- (CIImage)inputTargetImage;
- (id)_CIPageCurlTransNoEmap;
- (id)_CIPageCurlTransition;
- (id)outputImage;
- (void)setInputBacksideImage:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputShadingImage:(id)a3;
- (void)setInputTargetImage:(id)a3;
@end

@implementation CIPageCurlTransition

- (id)_CIPageCurlTransition
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_pageCurlTransition];
}

- (id)_CIPageCurlTransNoEmap
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_pageCurlTransNoEmap];
}

- (id)outputImage
{
  uint64_t v141 = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputAngle doubleValue];
  double v4 = v3;
  [(NSNumber *)self->inputTime doubleValue];
  double v125 = fmax(v5, 0.0);
  [(NSNumber *)self->inputRadius doubleValue];
  double v7 = fmax(v6, 0.01);
  [(NSNumber *)self->inputRadius doubleValue];
  double v113 = fmax(v8, 0.0);
  [(CIImage *)self->inputImage extent];
  inputBacksideImage = self->inputBacksideImage;
  double v114 = v11;
  double v116 = v10;
  double r1_16 = v13;
  double r1_24 = v12;
  if (inputBacksideImage) {
    inputImage = -[CIImage imageByCroppingToRect:](inputBacksideImage, "imageByCroppingToRect:");
  }
  else {
    inputImage = self->inputImage;
  }
  [(CIImage *)self->inputShadingImage extent];
  v15 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
  [(CIVector *)self->inputExtent X];
  double v17 = v16;
  [(CIVector *)self->inputExtent Y];
  double v19 = v18;
  [(CIVector *)self->inputExtent Z];
  double v21 = v17 + v20;
  [(CIVector *)self->inputExtent W];
  double v121 = v19 + v22;
  [(CIVector *)self->inputExtent Z];
  double v123 = v17 + v23 * 0.5;
  [(CIVector *)self->inputExtent W];
  double v25 = v19 + v24 * 0.5;
  __double2 v26 = __sincos_stret(v4);
  __double2 v27 = __sincos_stret(v4 + v4);
  double v28 = -(v26.__sinval * v19);
  double v29 = v28 - v17 * v26.__cosval;
  double v30 = v28 - v21 * v26.__cosval;
  double v31 = fmin(v29, v30);
  double v32 = fmax(v29, v30);
  double v33 = -(v26.__sinval * v121);
  double v34 = v33 - v17 * v26.__cosval;
  double v35 = fmin(v31, v34);
  double v36 = v33 - v21 * v26.__cosval;
  double v37 = fmax(fmax(v32, v34), v36);
  double v38 = -(v37 - v125 * (v113 + v37 - fmin(v35, v36)));
  CGFloat v39 = v26.__sinval * v123 - v26.__cosval * v25;
  double v126 = v38 / v7;
  CGFloat v40 = -(v26.__cosval * v7);
  CGFloat v41 = -(v26.__sinval * v7);
  CGFloat v42 = v26.__sinval * v39 + v26.__cosval * v38;
  CGFloat v43 = v39;
  CGFloat v44 = v26.__sinval * v38 - v26.__cosval * v39;
  double v120 = -v26.__cosval / v7;
  double v122 = v40;
  double v45 = v42 + v40 * 0.5 * 3.14159265;
  double v46 = v44 + v41 * 0.5 * 3.14159265;
  double v124 = v44;
  double v102 = v27.__sinval * v46 + v27.__cosval * v45;
  double v103 = v46;
  CGFloat r1a = *MEMORY[0x1E4F1DB20];
  double r1_8 = -v26.__sinval / v7;
  CGFloat v47 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  CGFloat v91 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat v96 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  v137.a = v120;
  v137.b = -v26.__sinval;
  v137.c = r1_8;
  v137.d = v26.__cosval;
  v137.tCGFloat x = v126;
  v137.tCGFloat y = v43;
  CGFloat v48 = v43;
  double v112 = v43;
  v136.a = v40;
  v136.b = v41;
  CGFloat v49 = v41;
  double v118 = v41;
  double v119 = v42;
  v136.c = -v26.__sinval;
  v136.d = v26.__cosval;
  double v105 = v45;
  double v100 = v27.__sinval * v45 - v27.__cosval * v46;
  v136.tCGFloat x = v42;
  v136.tCGFloat y = v44;
  v142.CGFloat x = v116;
  v142.CGFloat y = v114;
  pageCurlMapInverse(v142, &v137, &v136);
  v154.origin.CGFloat x = v50;
  v154.origin.CGFloat y = v51;
  v154.size.CGFloat width = 0.0;
  v154.size.CGFloat height = 0.0;
  v143.origin.CGFloat x = r1a;
  v143.size.CGFloat width = v91;
  v143.origin.CGFloat y = v96;
  v143.size.CGFloat height = v47;
  CGRect v144 = CGRectUnion(v143, v154);
  CGFloat y = v144.origin.y;
  CGFloat x = v144.origin.x;
  CGFloat height = v144.size.height;
  CGFloat width = v144.size.width;
  v135.a = v120;
  v135.b = -v26.__sinval;
  v144.origin.CGFloat y = v114 + r1_16;
  v135.c = r1_8;
  v135.d = v26.__cosval;
  v135.tCGFloat x = v126;
  v135.tCGFloat y = v48;
  v134.a = v122;
  v134.b = v49;
  v134.c = -v26.__sinval;
  v134.d = v26.__cosval;
  v134.tCGFloat x = v42;
  v134.tCGFloat y = v124;
  v144.origin.CGFloat x = v116;
  pageCurlMapInverse(v144.origin, &v135, &v134);
  v155.origin.CGFloat x = v52;
  v155.origin.CGFloat y = v53;
  v155.size.CGFloat width = 0.0;
  v155.size.CGFloat height = 0.0;
  v145.origin.CGFloat y = y;
  v145.origin.CGFloat x = x;
  v145.size.CGFloat height = height;
  v145.size.CGFloat width = width;
  CGRect v146 = CGRectUnion(v145, v155);
  CGFloat v93 = v146.origin.y;
  CGFloat v98 = v146.origin.x;
  CGFloat v84 = v146.size.height;
  CGFloat v88 = v146.size.width;
  v133.a = v120;
  v133.b = -v26.__sinval;
  v146.origin.CGFloat x = v116 + r1_24;
  v133.c = r1_8;
  v133.d = v26.__cosval;
  v133.tCGFloat x = v126;
  v133.tCGFloat y = v112;
  v132.a = v122;
  v132.b = v118;
  v132.c = -v26.__sinval;
  v132.d = v26.__cosval;
  v132.tCGFloat x = v42;
  v132.tCGFloat y = v124;
  v146.origin.CGFloat y = v114;
  pageCurlMapInverse(v146.origin, &v133, &v132);
  v156.origin.CGFloat x = v54;
  v156.origin.CGFloat y = v55;
  v156.size.CGFloat width = 0.0;
  v156.size.CGFloat height = 0.0;
  v147.origin.CGFloat y = v93;
  v147.origin.CGFloat x = v98;
  v147.size.CGFloat height = v84;
  v147.size.CGFloat width = v88;
  CGRect v148 = CGRectUnion(v147, v156);
  CGFloat v94 = v148.origin.y;
  CGFloat v99 = v148.origin.x;
  CGFloat v85 = v148.size.height;
  CGFloat v89 = v148.size.width;
  v131.a = v120;
  v131.b = -v26.__sinval;
  v131.c = r1_8;
  v131.d = v26.__cosval;
  v131.tCGFloat x = v126;
  v131.tCGFloat y = v112;
  v130.a = v122;
  v130.b = v118;
  v130.c = -v26.__sinval;
  v130.d = v26.__cosval;
  v130.tCGFloat x = v42;
  v130.tCGFloat y = v124;
  v148.origin.CGFloat x = v116 + r1_24;
  v148.origin.CGFloat y = v114 + r1_16;
  pageCurlMapInverse(v148.origin, &v131, &v130);
  v157.origin.CGFloat x = v56;
  v157.origin.CGFloat y = v57;
  v157.size.CGFloat width = 0.0;
  v157.size.CGFloat height = 0.0;
  v149.origin.CGFloat y = v94;
  v149.origin.CGFloat x = v99;
  v149.size.CGFloat height = v85;
  v149.size.CGFloat width = v89;
  CGRect v150 = CGRectUnion(v149, v157);
  double v58 = v150.origin.x;
  double v59 = v150.origin.y;
  double v60 = v150.size.width;
  double v61 = v150.size.height;
  v129.a = v120;
  double r1 = -v26.__sinval;
  v129.b = -v26.__sinval;
  v129.c = r1_8;
  v129.d = v26.__cosval;
  v129.tCGFloat x = v126;
  v129.tCGFloat y = v112;
  v150.origin.CGFloat y = v114;
  v150.origin.CGFloat x = v116;
  v150.size.CGFloat height = r1_16;
  v150.size.CGFloat width = r1_24;
  int v62 = CriticalPointsDOD(v150, &v129, &v140);
  if (v62 >= 1)
  {
    uint64_t v63 = v62;
    p_CGFloat y = &v140.y;
    do
    {
      v158.origin.CGFloat x = *(p_y - 1);
      v158.origin.CGFloat y = *p_y;
      v158.size.CGFloat width = 0.0;
      v158.size.CGFloat height = 0.0;
      v151.origin.CGFloat x = v58;
      v151.origin.CGFloat y = v59;
      v151.size.CGFloat width = v60;
      v151.size.CGFloat height = v61;
      CGRect v152 = CGRectUnion(v151, v158);
      double v58 = v152.origin.x;
      double v59 = v152.origin.y;
      double v60 = v152.size.width;
      double v61 = v152.size.height;
      p_y += 2;
      --v63;
    }
    while (v63);
  }
  double r1_24a = -v27.__cosval;
  double v115 = v103 + v100;
  double v117 = v105 + v102;
  double v104 = -v27.__sinval;
  [(CIImage *)self->inputShadingImage extent];
  CGFloat v66 = v65;
  CGFloat v68 = v67;
  CGFloat v70 = v69;
  CGFloat v72 = v71;
  [(CIImage *)self->inputImage extent];
  uint64_t v86 = v73;
  uint64_t v90 = v74;
  uint64_t v95 = v75;
  uint64_t v101 = v76;
  v153.origin.CGFloat x = v66;
  v153.origin.CGFloat y = v68;
  v153.size.CGFloat width = v70;
  v153.size.CGFloat height = v72;
  if (CGRectIsEmpty(v153))
  {
    id v77 = [(CIPageCurlTransition *)self _CIPageCurlTransNoEmap];
    v128[0] = MEMORY[0x1E4F143A8];
    v128[1] = 3221225472;
    v128[2] = __35__CIPageCurlTransition_outputImage__block_invoke;
    v128[3] = &__block_descriptor_240_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    *(double *)&v128[4] = v120;
    *(double *)&v128[5] = -v26.__sinval;
    *(double *)&v128[6] = r1_8;
    v128[7] = *(void *)&v26.__cosval;
    *(double *)&v128[8] = v126;
    *(double *)&v128[9] = v112;
    *(double *)&v128[10] = v122;
    *(double *)&v128[11] = v118;
    *(double *)&v128[12] = -v26.__sinval;
    v128[13] = *(void *)&v26.__cosval;
    *(double *)&v128[14] = v119;
    *(double *)&v128[15] = v124;
    *(double *)&v128[16] = -v27.__cosval;
    *(double *)&v128[17] = -v27.__sinval;
    *(double *)&v128[18] = -v27.__sinval;
    v128[19] = *(void *)&v27.__cosval;
    *(double *)&v128[20] = v105 + v102;
    *(double *)&v128[21] = v115;
    v128[22] = v86;
    v128[23] = v90;
    v128[24] = v95;
    v128[25] = v101;
    *(CGFloat *)&v128[26] = v66;
    *(CGFloat *)&v128[27] = v68;
    *(CGFloat *)&v128[28] = v70;
    *(CGFloat *)&v128[29] = v72;
    v139[0] = self->inputImage;
    v139[1] = inputImage;
    v139[2] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:");
    v139[3] = +[CIVector vectorWithX:v126 Y:v112];
    v139[4] = +[CIVector vectorWithX:v122 Y:r1 Z:v118 W:v26.__cosval];
    v139[5] = +[CIVector vectorWithX:v119 Y:v124];
    v139[6] = +[CIVector vectorWithX:r1_24a Y:v104 Z:v104 W:v27.__cosval];
    v139[7] = +[CIVector vectorWithX:v117 Y:v115];
    v139[8] = [NSNumber numberWithDouble:v113];
    uint64_t v78 = [MEMORY[0x1E4F1C978] arrayWithObjects:v139 count:9];
    v79 = v128;
    v80 = v77;
  }
  else
  {
    id v81 = [(CIPageCurlTransition *)self _CIPageCurlTransition];
    v127[0] = MEMORY[0x1E4F143A8];
    v127[1] = 3221225472;
    v127[2] = __35__CIPageCurlTransition_outputImage__block_invoke_2;
    v127[3] = &__block_descriptor_240_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    *(double *)&v127[4] = v120;
    *(double *)&v127[5] = -v26.__sinval;
    *(double *)&v127[6] = r1_8;
    v127[7] = *(void *)&v26.__cosval;
    *(double *)&v127[8] = v126;
    *(double *)&v127[9] = v112;
    *(double *)&v127[10] = v122;
    *(double *)&v127[11] = v118;
    *(double *)&v127[12] = -v26.__sinval;
    v127[13] = *(void *)&v26.__cosval;
    *(double *)&v127[14] = v119;
    *(double *)&v127[15] = v124;
    *(double *)&v127[16] = -v27.__cosval;
    *(double *)&v127[17] = -v27.__sinval;
    *(double *)&v127[18] = -v27.__sinval;
    v127[19] = *(void *)&v27.__cosval;
    *(double *)&v127[20] = v105 + v102;
    *(double *)&v127[21] = v115;
    v127[22] = v86;
    v127[23] = v90;
    v127[24] = v95;
    v127[25] = v101;
    *(CGFloat *)&v127[26] = v66;
    *(CGFloat *)&v127[27] = v68;
    *(CGFloat *)&v127[28] = v70;
    *(CGFloat *)&v127[29] = v72;
    v138[0] = self->inputImage;
    v138[1] = inputImage;
    v138[2] = self->inputShadingImage;
    v138[3] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:");
    v138[4] = +[CIVector vectorWithX:v126 Y:v112];
    v138[5] = +[CIVector vectorWithX:v122 Y:r1 Z:v118 W:v26.__cosval];
    v138[6] = +[CIVector vectorWithX:v119 Y:v124];
    v138[7] = +[CIVector vectorWithX:r1_24a Y:v104 Z:v104 W:v27.__cosval];
    v138[8] = +[CIVector vectorWithX:v117 Y:v115];
    v138[9] = [NSNumber numberWithDouble:v113];
    v138[10] = v15;
    uint64_t v78 = [MEMORY[0x1E4F1C978] arrayWithObjects:v138 count:11];
    v79 = v127;
    v80 = v81;
  }
  id result = (id)objc_msgSend(v80, "applyWithExtent:roiCallback:arguments:", v79, v78, v58, v59, v60, v61);
  if (result)
  {
    if (self->inputTargetImage) {
      return (id)[+[CIFilter filterWithName:@"CISourceOverCompositing", @"inputImage", result, @"inputBackgroundImage", self->inputTargetImage, 0 keysAndValues] valueForKey:@"outputImage"];
    }
  }
  return result;
}

void __35__CIPageCurlTransition_outputImage__block_invoke(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  float64x2_t v6 = *(float64x2_t *)(a1 + 48);
  v14[0] = *(float64x2_t *)(a1 + 32);
  v14[1] = v6;
  long long v7 = *(_OWORD *)(a1 + 80);
  v14[2] = *(float64x2_t *)(a1 + 64);
  long long v8 = *(_OWORD *)(a1 + 96);
  long long v9 = *(_OWORD *)(a1 + 112);
  v13[0] = v7;
  v13[1] = v8;
  v13[2] = v9;
  long long v10 = *(_OWORD *)(a1 + 160);
  long long v11 = *(_OWORD *)(a1 + 128);
  v12[1] = *(_OWORD *)(a1 + 144);
  v12[2] = v10;
  v12[0] = v11;
  pageCurlROI(a2, v14, (double *)v13, (double *)v12, a3, a4, a5, a6, *(double *)(a1 + 176), *(double *)(a1 + 184), *(double *)(a1 + 192), *(double *)(a1 + 200));
}

void __35__CIPageCurlTransition_outputImage__block_invoke_2(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  float64x2_t v6 = *(float64x2_t *)(a1 + 48);
  v14[0] = *(float64x2_t *)(a1 + 32);
  v14[1] = v6;
  long long v7 = *(_OWORD *)(a1 + 80);
  v14[2] = *(float64x2_t *)(a1 + 64);
  long long v8 = *(_OWORD *)(a1 + 96);
  long long v9 = *(_OWORD *)(a1 + 112);
  v13[0] = v7;
  v13[1] = v8;
  v13[2] = v9;
  long long v10 = *(_OWORD *)(a1 + 160);
  long long v11 = *(_OWORD *)(a1 + 128);
  v12[1] = *(_OWORD *)(a1 + 144);
  v12[2] = v10;
  v12[0] = v11;
  pageCurlROI(a2, v14, (double *)v13, (double *)v12, a3, a4, a5, a6, *(double *)(a1 + 176), *(double *)(a1 + 184), *(double *)(a1 + 192), *(double *)(a1 + 200));
}

+ (id)customAttributes
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v8[0] = @"CIAttributeFilterCategories";
  v7[0] = @"CICategoryTransition";
  v7[1] = @"CICategoryVideo";
  v7[2] = @"CICategoryStillImage";
  v7[3] = @"CICategoryBuiltIn";
  v9[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:4];
  v9[1] = @"9";
  v8[1] = @"CIAttributeFilterAvailable_iOS";
  v8[2] = @"CIAttributeFilterAvailable_Mac";
  v9[2] = @"10.4";
  v8[3] = @"inputRadius";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeSliderMin";
  v6[0] = &unk_1EE4A9580;
  v6[1] = &unk_1EE4A9580;
  v5[2] = @"CIAttributeSliderMax";
  v5[3] = @"CIAttributeDefault";
  v6[2] = &unk_1EE4A9590;
  v6[3] = &unk_1EE4A95A0;
  v5[4] = @"CIAttributeType";
  v6[4] = @"CIAttributeTypeDistance";
  v9[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:5];
  v8[4] = @"inputExtent";
  v3[1] = @"CIAttributeDefault";
  v4[0] = @"CIAttributeTypeRectangle";
  v3[0] = @"CIAttributeType";
  v4[1] = +[CIVector vectorWithX:0.0 Y:0.0 Z:300.0 W:300.0];
  v9[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:2];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:5];
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputTargetImage
{
  return self->inputTargetImage;
}

- (void)setInputTargetImage:(id)a3
{
}

- (CIImage)inputBacksideImage
{
  return self->inputBacksideImage;
}

- (void)setInputBacksideImage:(id)a3
{
}

- (CIImage)inputShadingImage
{
  return self->inputShadingImage;
}

- (void)setInputShadingImage:(id)a3
{
}

@end