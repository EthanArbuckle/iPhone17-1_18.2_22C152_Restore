@interface CIPageCurlWithShadowTransition
+ (id)customAttributes;
- (CIImage)inputBacksideImage;
- (CIImage)inputImage;
- (CIImage)inputTargetImage;
- (id)_CIPageCurlNoShadowTransition;
- (id)_CIPageCurlWithShadowTransition;
- (id)outputImage;
- (void)setInputBacksideImage:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputTargetImage:(id)a3;
@end

@implementation CIPageCurlWithShadowTransition

- (id)_CIPageCurlWithShadowTransition
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_pageCurlWithShadowTransition];
}

- (id)_CIPageCurlNoShadowTransition
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_pageCurlNoShadowTransition];
}

- (id)outputImage
{
  uint64_t v168 = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputAngle doubleValue];
  double v152 = v3;
  [(NSNumber *)self->inputTime doubleValue];
  double v148 = v4;
  [(NSNumber *)self->inputRadius doubleValue];
  double v146 = v5;
  [(NSNumber *)self->inputRadius doubleValue];
  double v7 = fmax(v6, 0.0);
  [(NSNumber *)self->inputShadowSize doubleValue];
  double v9 = v8;
  [(NSNumber *)self->inputShadowAmount doubleValue];
  double v11 = v10;
  [(CIImage *)self->inputImage extent];
  double v15 = v14;
  double v16 = v12;
  double v18 = v17;
  double v19 = v7 * 0.0625;
  if (v7 >= 16.0) {
    double v19 = 1.0;
  }
  double v149 = v7;
  double v150 = v19;
  inputBacksideImage = self->inputBacksideImage;
  double v132 = v12;
  double v134 = v15;
  double v126 = v13;
  if (!inputBacksideImage
    || (double v21 = v13, inputBacksideImage == +[CIImage emptyImage]))
  {
    v120 = +[CIVector vectorWithX:0.764706 Y:0.764706 Z:0.764706 W:0.8];
    v119 = +[CIVector vectorWithX:0.701961 Y:0.701961 Z:0.701961 W:1.0];
    inputImage = self->inputImage;
  }
  else
  {
    v120 = +[CIVector vectorWithX:0.0 Y:0.0 Z:0.0 W:0.0];
    v119 = +[CIVector vectorWithX:0.701961 Y:0.701961 Z:0.701961 W:1.0];
    inputImage = -[CIImage imageByCroppingToRect:](self->inputBacksideImage, "imageByCroppingToRect:", v15, v16, v21, v18);
  }
  double v23 = fmax(v9, 0.01);
  double v24 = fmax(v11, 0.0);
  [(CIVector *)self->inputExtent X];
  double v26 = v25;
  [(CIVector *)self->inputExtent Y];
  CGFloat v28 = v27;
  [(CIVector *)self->inputExtent Z];
  double v30 = v29;
  [(CIVector *)self->inputExtent W];
  double v32 = v31;
  v170.origin.CGFloat x = v26;
  v170.origin.CGFloat y = v28;
  v170.size.CGFloat width = v30;
  v170.size.CGFloat height = v32;
  double v124 = v18;
  if (CGRectIsEmpty(v170))
  {
    [(CIImage *)self->inputImage extent];
    double v26 = v33;
    double v144 = v34;
    double v30 = v35;
    double v32 = v36;
  }
  else
  {
    double v144 = v28;
  }
  double v140 = fmin(v23, 1.0);
  double v138 = fmin(v24, 1.0);
  double v142 = fmax(v148, 0.0);
  double v37 = fmax(v146, 0.01);
  [(CIVector *)self->inputShadowExtent X];
  CGFloat v39 = v38;
  [(CIVector *)self->inputShadowExtent Y];
  CGFloat v41 = v40;
  [(CIVector *)self->inputShadowExtent Z];
  CGFloat v43 = v42;
  [(CIVector *)self->inputShadowExtent W];
  v171.size.CGFloat height = v44;
  v171.origin.CGFloat x = v39;
  CGFloat v122 = v43;
  CGFloat v123 = v41;
  v171.origin.CGFloat y = v41;
  v171.size.CGFloat width = v43;
  CGFloat height = v171.size.height;
  if (CGRectIsEmpty(v171))
  {
    [(CIImage *)self->inputImage extent];
    CGFloat v118 = v45;
    CGFloat v122 = v47;
    CGFloat v123 = v46;
    CGFloat height = v48;
  }
  else
  {
    CGFloat v118 = v39;
  }
  double v128 = v140 * 0.3045;
  double v130 = v150 * v138;
  __double2 v49 = __sincos_stret(v152);
  __double2 v50 = __sincos_stret(v152 + v152);
  double v51 = -v49.__sinval;
  double v52 = -(v49.__sinval * v144);
  double v53 = v52 - v26 * v49.__cosval;
  double v54 = v52 - (v30 + v26) * v49.__cosval;
  double v55 = fmin(v53, v54);
  double v56 = fmax(v53, v54);
  double v57 = -(v49.__sinval * (v32 + v144));
  double v58 = v57 - v26 * v49.__cosval;
  double v59 = v57 - (v30 + v26) * v49.__cosval;
  double v60 = fmax(fmax(v56, v58), v59);
  double v61 = -(v60 - v142 * (v149 + v60 - fmin(fmin(v55, v58), v59)));
  CGFloat v62 = v49.__sinval * (v26 + v30 * 0.5) - v49.__cosval * (v144 + v32 * 0.5);
  double v151 = v61 / v37;
  CGFloat v63 = -(v49.__sinval * v37);
  double v64 = v49.__sinval * v62 + v49.__cosval * v61;
  double v131 = v62;
  CGFloat v65 = v49.__sinval * v61 - v49.__cosval * v62;
  double v66 = v64 + -(v49.__cosval * v37) * 0.5 * 3.14159265;
  double v145 = v63;
  CGFloat v67 = v65 + v63 * 0.5 * 3.14159265;
  double v147 = v66 + v50.__sinval * v67 + v50.__cosval * v66;
  CGFloat v114 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat v117 = *MEMORY[0x1E4F1DB20];
  CGFloat v104 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  CGFloat v109 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  v164.a = -v49.__cosval / v37;
  v164.b = -v49.__sinval;
  v164.double c = -v49.__sinval / v37;
  double v136 = -(v49.__cosval * v37);
  double c = v164.c;
  v164.d = v49.__cosval;
  v164.tCGFloat x = v151;
  v164.tCGFloat y = v62;
  v163.a = v136;
  v163.b = v63;
  double v141 = -v50.__cosval;
  double v143 = v67 + v50.__sinval * v66 - v50.__cosval * v67;
  v163.double c = -v49.__sinval;
  v163.d = v49.__cosval;
  double v129 = -v50.__sinval;
  v163.tCGFloat x = v64;
  v163.tCGFloat y = v65;
  double v153 = v65;
  v169.CGFloat y = v132;
  v169.CGFloat x = v134;
  pageCurlMapInverse(v169, &v164, &v163);
  v188.origin.CGFloat x = v68;
  v188.origin.CGFloat y = v69;
  v188.size.CGFloat width = 0.0;
  v188.size.CGFloat height = 0.0;
  v172.origin.CGFloat y = v114;
  v172.origin.CGFloat x = v117;
  v172.size.CGFloat height = v104;
  v172.size.CGFloat width = v109;
  CGRect v173 = CGRectUnion(v172, v188);
  CGFloat y = v173.origin.y;
  CGFloat x = v173.origin.x;
  CGFloat v100 = v173.size.height;
  CGFloat width = v173.size.width;
  double v139 = -v49.__cosval / v37;
  v162.a = v139;
  v162.b = -v49.__sinval;
  v173.origin.CGFloat y = v132 + v124;
  v162.double c = -v49.__sinval / v37;
  v162.d = v49.__cosval;
  v162.tCGFloat x = v151;
  v162.tCGFloat y = v131;
  v161.a = v136;
  v161.b = v145;
  v161.double c = -v49.__sinval;
  v161.d = v49.__cosval;
  v161.tCGFloat x = v64;
  v161.tCGFloat y = v65;
  v173.origin.CGFloat x = v134;
  pageCurlMapInverse(v173.origin, &v162, &v161);
  v189.origin.CGFloat x = v70;
  v189.origin.CGFloat y = v71;
  v189.size.CGFloat width = 0.0;
  v189.size.CGFloat height = 0.0;
  v174.origin.CGFloat y = y;
  v174.origin.CGFloat x = x;
  v174.size.CGFloat height = v100;
  v174.size.CGFloat width = width;
  CGRect v175 = CGRectUnion(v174, v189);
  CGFloat v106 = v175.origin.y;
  CGFloat v111 = v175.origin.x;
  CGFloat v101 = v175.size.width;
  CGFloat r1 = v175.size.height;
  v160.a = v139;
  v160.b = -v49.__sinval;
  v175.origin.CGFloat x = v134 + v126;
  v160.double c = -v49.__sinval / v37;
  v160.d = v49.__cosval;
  v160.tCGFloat x = v151;
  v175.origin.CGFloat y = v132;
  v160.tCGFloat y = v131;
  v159.a = v136;
  v159.b = v145;
  v159.double c = -v49.__sinval;
  v159.d = v49.__cosval;
  v159.tCGFloat x = v64;
  v159.tCGFloat y = v65;
  pageCurlMapInverse(v175.origin, &v160, &v159);
  v190.origin.CGFloat x = v72;
  v190.origin.CGFloat y = v73;
  v190.size.CGFloat width = 0.0;
  v190.size.CGFloat height = 0.0;
  v176.origin.CGFloat y = v106;
  v176.origin.CGFloat x = v111;
  v176.size.CGFloat width = v101;
  v176.size.CGFloat height = r1;
  CGRect v177 = CGRectUnion(v176, v190);
  CGFloat v107 = v177.origin.y;
  CGFloat v112 = v177.origin.x;
  CGFloat v102 = v177.size.width;
  CGFloat r1a = v177.size.height;
  v158.a = v139;
  v158.b = -v49.__sinval;
  v158.double c = -v49.__sinval / v37;
  v158.d = v49.__cosval;
  v158.tCGFloat x = v151;
  v158.tCGFloat y = v131;
  v157.a = v136;
  v157.b = v145;
  v157.double c = -v49.__sinval;
  v157.d = v49.__cosval;
  v157.tCGFloat x = v64;
  v157.tCGFloat y = v65;
  v177.origin.CGFloat x = v134 + v126;
  v177.origin.CGFloat y = v132 + v124;
  pageCurlMapInverse(v177.origin, &v158, &v157);
  v191.origin.CGFloat x = v74;
  v191.origin.CGFloat y = v75;
  v191.size.CGFloat width = 0.0;
  v191.size.CGFloat height = 0.0;
  v178.origin.CGFloat y = v107;
  v178.origin.CGFloat x = v112;
  v178.size.CGFloat width = v102;
  v178.size.CGFloat height = r1a;
  CGRect v179 = CGRectUnion(v178, v191);
  CGFloat v76 = v179.origin.x;
  CGFloat v77 = v179.origin.y;
  CGFloat v78 = v179.size.width;
  CGFloat v79 = v179.size.height;
  v156.a = v139;
  v156.b = -v49.__sinval;
  v156.double c = c;
  v156.d = v49.__cosval;
  v156.tCGFloat x = v151;
  v156.tCGFloat y = v131;
  v179.origin.CGFloat y = v132;
  v179.origin.CGFloat x = v134;
  v179.size.CGFloat height = v124;
  v179.size.CGFloat width = v126;
  int v80 = CriticalPointsDOD(v179, &v156, &v167);
  if (v80 >= 1)
  {
    uint64_t v81 = v80;
    p_CGFloat y = &v167.y;
    do
    {
      v192.origin.CGFloat x = *(p_y - 1);
      v192.origin.CGFloat y = *p_y;
      v192.size.CGFloat width = 0.0;
      v192.size.CGFloat height = 0.0;
      v180.origin.CGFloat x = v76;
      v180.origin.CGFloat y = v77;
      v180.size.CGFloat width = v78;
      v180.size.CGFloat height = v79;
      CGRect v181 = CGRectUnion(v180, v192);
      CGFloat v76 = v181.origin.x;
      CGFloat v77 = v181.origin.y;
      CGFloat v78 = v181.size.width;
      CGFloat v79 = v181.size.height;
      p_y += 2;
      --v81;
    }
    while (v81);
  }
  v182.origin.CGFloat x = v76;
  v182.origin.CGFloat y = v77;
  v182.size.CGFloat width = v78;
  v182.size.CGFloat height = v79;
  CGRect v183 = CGRectInset(v182, -(v149 * v128) - v149 * v128, -(v149 * v128) - v149 * v128);
  double v133 = v183.origin.y;
  double v135 = v183.origin.x;
  double v125 = v183.size.height;
  double v127 = v183.size.width;
  [(CIImage *)self->inputImage extent];
  uint64_t v84 = v83;
  uint64_t v113 = v85;
  uint64_t v116 = v83;
  uint64_t v86 = v85;
  uint64_t v88 = v87;
  uint64_t v103 = v89;
  uint64_t v108 = v87;
  uint64_t v90 = v89;
  id v91 = [(CIPageCurlWithShadowTransition *)self _CIPageCurlWithShadowTransition];
  v155[0] = MEMORY[0x1E4F143A8];
  v155[1] = 3221225472;
  v155[2] = __45__CIPageCurlWithShadowTransition_outputImage__block_invoke;
  v155[3] = &__block_descriptor_208_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  *(double *)&v155[4] = v139;
  *(double *)&v155[5] = -v49.__sinval;
  *(double *)&v155[6] = c;
  v155[7] = *(void *)&v49.__cosval;
  *(double *)&v155[8] = v151;
  *(double *)&v155[9] = v131;
  *(double *)&v155[10] = v136;
  *(double *)&v155[11] = v145;
  *(double *)&v155[12] = -v49.__sinval;
  v155[13] = *(void *)&v49.__cosval;
  *(double *)&v155[14] = v64;
  *(double *)&v155[15] = v153;
  *(double *)&v155[16] = -v50.__cosval;
  *(double *)&v155[17] = -v50.__sinval;
  *(double *)&v155[18] = -v50.__sinval;
  v155[19] = *(void *)&v50.__cosval;
  *(double *)&v155[20] = v147;
  *(double *)&v155[21] = v143;
  v155[22] = v84;
  v155[23] = v86;
  v155[24] = v88;
  v155[25] = v90;
  v166[0] = self->inputImage;
  v166[1] = inputImage;
  v166[2] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v139, c);
  v166[3] = +[CIVector vectorWithX:v151 Y:v131];
  v166[4] = +[CIVector vectorWithX:v136 Y:v51 Z:v145 W:v49.__cosval];
  v166[5] = +[CIVector vectorWithX:v64 Y:v153];
  v166[6] = +[CIVector vectorWithX:v141 Y:v129 Z:v129 W:v50.__cosval];
  v166[7] = +[CIVector vectorWithX:v147 Y:v143];
  v166[8] = [NSNumber numberWithDouble:v149];
  v184.origin.CGFloat x = v118;
  v184.origin.CGFloat y = v123;
  v184.size.CGFloat width = v122;
  v184.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v184);
  v185.origin.CGFloat x = v118;
  v185.origin.CGFloat y = v123;
  v185.size.CGFloat width = v122;
  v185.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v185);
  v186.origin.CGFloat x = v118;
  v186.origin.CGFloat y = v123;
  v186.size.CGFloat width = v122;
  v186.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v186);
  v187.origin.CGFloat x = v118;
  v187.origin.CGFloat y = v123;
  v187.size.CGFloat width = v122;
  v187.size.CGFloat height = height;
  v166[9] = +[CIVector vectorWithX:MinX Y:MinY Z:MaxX W:CGRectGetMaxY(v187)];
  v166[10] = [NSNumber numberWithDouble:v128];
  v166[11] = [NSNumber numberWithDouble:v130];
  v166[12] = v120;
  v166[13] = v119;
  v95 = objc_msgSend(v91, "applyWithExtent:roiCallback:arguments:", v155, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v166, 14), v135, v133, v127, v125);
  id v96 = [(CIPageCurlWithShadowTransition *)self _CIPageCurlNoShadowTransition];
  v154[0] = MEMORY[0x1E4F143A8];
  v154[1] = 3221225472;
  v154[2] = __45__CIPageCurlWithShadowTransition_outputImage__block_invoke_2;
  v154[3] = &__block_descriptor_208_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  *(double *)&v154[4] = v139;
  *(double *)&v154[5] = -v49.__sinval;
  *(double *)&v154[6] = c;
  v154[7] = *(void *)&v49.__cosval;
  *(double *)&v154[8] = v151;
  *(double *)&v154[9] = v131;
  *(double *)&v154[10] = v136;
  *(double *)&v154[11] = v145;
  *(double *)&v154[12] = -v49.__sinval;
  v154[13] = *(void *)&v49.__cosval;
  *(double *)&v154[14] = v64;
  *(double *)&v154[15] = v153;
  *(double *)&v154[16] = -v50.__cosval;
  *(double *)&v154[17] = -v50.__sinval;
  *(double *)&v154[18] = -v50.__sinval;
  v154[19] = *(void *)&v50.__cosval;
  *(double *)&v154[20] = v147;
  *(double *)&v154[21] = v143;
  v154[22] = v116;
  v154[23] = v113;
  v154[24] = v108;
  v154[25] = v103;
  v165[0] = self->inputImage;
  v165[1] = inputImage;
  v165[2] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:");
  v165[3] = +[CIVector vectorWithX:v151 Y:v131];
  v165[4] = +[CIVector vectorWithX:v136 Y:v51 Z:v145 W:v49.__cosval];
  v165[5] = +[CIVector vectorWithX:v64 Y:v153];
  v165[6] = +[CIVector vectorWithX:v141 Y:v129 Z:v129 W:v50.__cosval];
  v165[7] = +[CIVector vectorWithX:v147 Y:v143];
  v165[8] = [NSNumber numberWithDouble:v149];
  v165[9] = v120;
  v165[10] = v119;
  id result = (id)objc_msgSend(v96, "applyWithExtent:roiCallback:arguments:", v154, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v165, 11), v135, v133, v127, v125);
  if (v130 > 0.001) {
    id result = v95;
  }
  if (result)
  {
    if (self->inputTargetImage) {
      return (id)[+[CIFilter filterWithName:@"CISourceOverCompositing", @"inputImage", 0.001, v130, result, @"inputBackgroundImage", self->inputTargetImage, 0 keysAndValues] valueForKey:@"outputImage"];
    }
  }
  return result;
}

void __45__CIPageCurlWithShadowTransition_outputImage__block_invoke(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
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

void __45__CIPageCurlWithShadowTransition_outputImage__block_invoke_2(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
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
  v15[8] = *MEMORY[0x1E4F143B8];
  v14[0] = @"CIAttributeFilterCategories";
  v13[0] = @"CICategoryTransition";
  v13[1] = @"CICategoryVideo";
  v13[2] = @"CICategoryStillImage";
  _OWORD v13[3] = @"CICategoryBuiltIn";
  v15[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:4];
  v15[1] = @"9";
  v14[1] = @"CIAttributeFilterAvailable_iOS";
  v14[2] = @"CIAttributeFilterAvailable_Mac";
  v15[2] = @"10.9";
  float64x2_t v14[3] = @"inputRadius";
  v11[0] = @"CIAttributeMin";
  v11[1] = @"CIAttributeSliderMin";
  v12[0] = &unk_1EE4A9580;
  v12[1] = &unk_1EE4A9580;
  v11[2] = @"CIAttributeSliderMax";
  v11[3] = @"CIAttributeDefault";
  v12[2] = &unk_1EE4A9590;
  _OWORD v12[3] = &unk_1EE4A95A0;
  v11[4] = @"CIAttributeType";
  v12[4] = @"CIAttributeTypeDistance";
  v15[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:5];
  v14[4] = @"inputShadowSize";
  v9[0] = @"CIAttributeMin";
  v9[1] = @"CIAttributeSliderMin";
  v10[0] = &unk_1EE4A95B0;
  v10[1] = &unk_1EE4A95B0;
  v9[2] = @"CIAttributeSliderMax";
  v9[3] = @"CIAttributeMax";
  v10[2] = &unk_1EE4A95C0;
  v10[3] = &unk_1EE4A95C0;
  v9[4] = @"CIAttributeDefault";
  v9[5] = @"CIAttributeType";
  v10[4] = &unk_1EE4A95D0;
  v10[5] = @"CIAttributeTypeDistance";
  v15[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:6];
  v14[5] = @"inputShadowAmount";
  v7[0] = @"CIAttributeMin";
  v7[1] = @"CIAttributeSliderMin";
  v8[0] = &unk_1EE4A95B0;
  v8[1] = &unk_1EE4A95B0;
  v7[2] = @"CIAttributeSliderMax";
  v7[3] = @"CIAttributeMax";
  v8[2] = &unk_1EE4A95C0;
  v8[3] = &unk_1EE4A95C0;
  v7[4] = @"CIAttributeDefault";
  v7[5] = @"CIAttributeType";
  v8[4] = &unk_1EE4A95E0;
  v8[5] = @"CIAttributeTypeDistance";
  v15[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:6];
  v14[6] = @"inputShadowExtent";
  v5[1] = @"CIAttributeDefault";
  v6[0] = @"CIAttributeTypeRectangle";
  v5[0] = @"CIAttributeType";
  v6[1] = +[CIVector vectorWithX:0.0 Y:0.0 Z:0.0 W:0.0];
  v15[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  v14[7] = @"inputExtent";
  v4[1] = +[CIVector vectorWithX:0.0, 0.0, 0.0, 0.0, @"CIAttributeType", @"CIAttributeDefault", @"CIAttributeTypeRectangle" Y Z W];
  v15[7] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:2];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:8];
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

@end