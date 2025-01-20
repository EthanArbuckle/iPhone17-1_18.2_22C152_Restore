@interface CIPinchDistortion
+ (id)customAttributes;
- (CGRect)computeDOD:(float)a3 scale:(float)a4;
- (CIImage)inputImage;
- (CIVector)inputCenter;
- (NSNumber)inputRadius;
- (NSNumber)inputScale;
- (id)_pinchDistortionScaleGE1;
- (id)_pinchDistortionScaleLT1;
- (id)outputImage;
- (void)setInputCenter:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputRadius:(id)a3;
- (void)setInputScale:(id)a3;
@end

@implementation CIPinchDistortion

+ (id)customAttributes
{
  v11[6] = *MEMORY[0x1E4F143B8];
  v10[0] = @"CIAttributeFilterCategories";
  v9[0] = @"CICategoryDistortionEffect";
  v9[1] = @"CICategoryVideo";
  v9[2] = @"CICategoryStillImage";
  v9[3] = @"CICategoryBuiltIn";
  v11[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:4];
  v11[1] = @"6";
  v10[1] = @"CIAttributeFilterAvailable_iOS";
  v10[2] = @"CIAttributeFilterAvailable_Mac";
  v11[2] = @"10.4";
  v10[3] = @"inputCenter";
  v7[0] = @"CIAttributeType";
  v7[1] = @"CIAttributeDefault";
  v8[0] = @"CIAttributeTypePosition";
  v8[1] = +[CIVector vectorWithX:150.0 Y:150.0];
  v11[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  v10[4] = @"inputRadius";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeSliderMin";
  v6[0] = &unk_1EE4A9720;
  v6[1] = &unk_1EE4A9720;
  v5[2] = @"CIAttributeSliderMax";
  v5[3] = @"CIAttributeDefault";
  v6[2] = &unk_1EE4A9730;
  v6[3] = &unk_1EE4A9740;
  v5[4] = @"CIAttributeIdentity";
  v5[5] = @"CIAttributeType";
  v6[4] = &unk_1EE4A9720;
  v6[5] = @"CIAttributeTypeDistance";
  v11[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:6];
  v10[5] = @"inputScale";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4A9720;
  v4[1] = &unk_1EE4A9720;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4A9750;
  v4[3] = &unk_1EE4A9760;
  v3[4] = @"CIAttributeIdentity";
  v3[5] = @"CIAttributeType";
  v4[4] = &unk_1EE4A9720;
  v4[5] = @"CIAttributeTypeScalar";
  v11[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:6];
}

- (id)_pinchDistortionScaleLT1
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_pinchDistortionScaleLT1];
}

- (id)_pinchDistortionScaleGE1
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_pinchDistortionScaleGE1];
}

- (CGRect)computeDOD:(float)a3 scale:(float)a4
{
  CGFloat v131 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat v133 = *MEMORY[0x1E4F1DB20];
  CGFloat v129 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat v127 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  [(CIImage *)self->inputImage extent];
  double v7 = v6;
  double v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [(CIVector *)self->inputCenter X];
  double v15 = v14;
  [(CIVector *)self->inputCenter Y];
  double v17 = v16;
  v138.origin.x = v7;
  v138.origin.y = v9;
  double v136 = v11;
  v138.size.width = v11;
  double v18 = v13;
  v138.size.height = v13;
  if (CGRectIsInfinite(v138))
  {
    double v24 = v136;
    CGFloat v25 = v7;
    double v26 = v9;
    double v27 = v13;
  }
  else
  {
    v28.f32[0] = v15;
    float v29 = v17;
    float v121 = v28.f32[0];
    float v122 = v29;
    v28.f32[1] = v29;
    float32x2_t v137 = v28;
    double v126 = v7;
    v30.f32[0] = v7;
    *(float *)&double v19 = v9;
    __int32 v123 = LODWORD(v19);
    __int32 v124 = v30.i32[0];
    v30.i32[1] = LODWORD(v19);
    *(float *)&double v19 = a3;
    double v31 = map_point_inv(v30, v28, v19, a4, v20, v21, v22, v23);
    double v32 = unionPointWithRect(v31, v133, v131, v129, v127);
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    CGFloat v38 = v37;
    CGFloat v125 = v18;
    *(float *)&double v33 = v9 + v18;
    unsigned int v128 = LODWORD(v33);
    *(float *)&double v35 = a3;
    double v43 = map_point_inv((float32x2_t)__PAIR64__(LODWORD(v33), v124), v137, v35, a4, v39, v40, v41, v42);
    double v44 = unionPointWithRect(v43, v32, v34, v36, v38);
    CGFloat v46 = v45;
    CGFloat v48 = v47;
    CGFloat v50 = v49;
    CGFloat v51 = v136;
    v52.f32[0] = v126 + v136;
    __int32 v130 = v52.i32[0];
    v52.i32[1] = v123;
    *(float *)&double v47 = a3;
    double v57 = map_point_inv(v52, v137, v47, a4, v53, v54, v55, v56);
    double v58 = unionPointWithRect(v57, v44, v46, v48, v50);
    CGFloat v60 = v59;
    CGFloat v62 = v61;
    CGFloat v64 = v63;
    float v120 = a3;
    *(float *)&double v61 = a3;
    double v69 = map_point_inv((float32x2_t)__PAIR64__(v128, v130), v137, v61, a4, v65, v66, v67, v68);
    double v70 = unionPointWithRect(v69, v58, v60, v62, v64);
    CGFloat v132 = v72;
    CGFloat v134 = v71;
    CGFloat v74 = v73;
    CGFloat v75 = v125;
    v139.origin.x = v126;
    v139.origin.y = v9;
    v139.size.width = v136;
    v139.size.height = v125;
    CGFloat v76 = v9;
    if (CGRectGetMinX(v139) < v121)
    {
      v140.origin.x = v126;
      v140.origin.y = v9;
      v140.size.width = v136;
      v140.size.height = v125;
      if (CGRectGetMaxX(v140) > v121)
      {
        double v81 = map_point_inv((float32x2_t)__PAIR64__(v123, v137.u32[0]), v137, COERCE_DOUBLE(__PAIR64__(v137.u32[1], LODWORD(a3))), a4, v77, v78, v79, v80);
        double v82 = unionPointWithRect(v81, v70, v134, v74, v132);
        double v84 = v83;
        CGFloat v86 = v85;
        CGFloat v88 = v87;
        CGFloat v75 = v125;
        double v93 = map_point_inv((float32x2_t)__PAIR64__(v128, v137.u32[0]), v137, COERCE_DOUBLE(__PAIR64__(v137.u32[1], LODWORD(a3))), a4, v89, v90, v91, v92);
        CGFloat v94 = v84;
        CGFloat v76 = v9;
        CGFloat v51 = v136;
        double v70 = unionPointWithRect(v93, v82, v94, v86, v88);
        CGFloat v132 = v96;
        CGFloat v134 = v95;
        CGFloat v74 = v97;
      }
    }
    v141.origin.x = v126;
    v141.origin.y = v76;
    v141.size.width = v51;
    v141.size.height = v75;
    if (CGRectGetMinY(v141) >= v122)
    {
      CGFloat v103 = v132;
      CGFloat v102 = v134;
    }
    else
    {
      v142.origin.x = v126;
      v142.origin.y = v76;
      v142.size.width = v51;
      v142.size.height = v75;
      CGFloat v103 = v132;
      CGFloat v102 = v134;
      if (CGRectGetMaxY(v142) > v122)
      {
        double v104 = map_point_inv((float32x2_t)__PAIR64__(v137.u32[1], v130), v137, COERCE_DOUBLE(__PAIR64__(v137.u32[1], LODWORD(a3))), a4, v98, v99, v100, v101);
        double v105 = unionPointWithRect(v104, v70, v134, v74, v132);
        CGFloat v107 = v106;
        CGFloat v109 = v108;
        CGFloat v111 = v110;
        double v116 = map_point_inv((float32x2_t)__PAIR64__(v137.u32[1], v124), v137, COERCE_DOUBLE(__PAIR64__(v137.u32[1], LODWORD(v120))), a4, v112, v113, v114, v115);
        double v70 = unionPointWithRect(v116, v105, v107, v109, v111);
        CGFloat v102 = v117;
        CGFloat v74 = v118;
        CGFloat v103 = v119;
      }
    }
    v143.origin.x = v70;
    v143.origin.y = v102;
    v143.size.width = v74;
    v143.size.height = v103;
    *(CGRect *)&CGFloat v25 = CGRectIntegral(v143);
  }
  result.size.height = v27;
  result.size.width = v24;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (id)outputImage
{
  v41[2] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  [(CIVector *)self->inputCenter X];
  double v4 = v3;
  [(CIVector *)self->inputCenter Y];
  double v6 = v5;
  [(NSNumber *)self->inputRadius floatValue];
  float v8 = v7;
  [(NSNumber *)self->inputScale floatValue];
  if (fabsf(v9) < 0.001)
  {
    double v10 = self->inputImage;
    return v10;
  }
  double v12 = v9;
  if (v9 > 2.0)
  {
    NSLog(&cfstr_InvalidScaleGI.isa, v9);
    return 0;
  }
  float v13 = v4;
  float v14 = v6;
  double v15 = fmin(v12, 1.9);
  float v16 = v15;
  if (fabsf(v8) >= 1.0)
  {
    *(float *)&double v15 = v8;
    *(float *)&double v12 = v16;
    [(CIPinchDistortion *)self computeDOD:v15 scale:v12];
    CGRect v44 = CGRectIntegral(v43);
    double x = v44.origin.x;
    double height = v44.size.height;
    double y = v44.origin.y;
    double width = v44.size.width;
    double v21 = v16;
    if (v16 >= 1.0)
    {
      id v22 = [(CIPinchDistortion *)self _pinchDistortionScaleGE1];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __32__CIPinchDistortion_outputImage__block_invoke_2;
      v29[3] = &__block_descriptor_48_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
      float v30 = v13;
      float v31 = v6;
      float v32 = v16;
      float v33 = v8;
      inputImage = self->inputImage;
      v40[0] = +[CIVector vectorWithX:v13 Y:v14];
      v40[1] = +[CIVector vectorWithX:v8 Y:1.0 / v8 Z:v16 W:v21 * -0.5];
      uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
      CGFloat v25 = v29;
    }
    else
    {
      id v22 = [(CIPinchDistortion *)self _pinchDistortionScaleLT1];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __32__CIPinchDistortion_outputImage__block_invoke;
      v34[3] = &__block_descriptor_48_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
      float v35 = v13;
      float v36 = v6;
      float v37 = v16;
      float v38 = v8;
      inputImage = self->inputImage;
      v41[0] = +[CIVector vectorWithX:v13 Y:v14];
      v41[1] = +[CIVector vectorWithX:v8 Y:1.0 / v8 Z:v16 W:v21 * -0.5];
      uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
      CGFloat v25 = v34;
    }
    return (id)objc_msgSend(v22, "applyWithExtent:roiCallback:inputImage:arguments:", v25, inputImage, v24, x, y, width, height);
  }
  else if (v16 >= 0.999)
  {
    double v26 = -[CIImage imageByCroppingToRect:](self->inputImage, "imageByCroppingToRect:", floorf(v13), floorf(v14), 1.0, 1.0);
    return [(CIImage *)v26 imageByClampingToExtent];
  }
  else
  {
    v39[1] = 0.0;
    v39[2] = 0.0;
    float v17 = 1.0 / (float)(1.0 - v16);
    double v18 = self->inputImage;
    v39[0] = v17;
    v39[3] = v17;
    v39[4] = (float)((float)(1.0 - v17) * v13);
    v39[5] = (float)((float)(1.0 - v17) * v14);
    return [(CIImage *)v18 imageByApplyingTransform:v39];
  }
}

double __32__CIPinchDistortion_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, float32x2_t a6)
{
  a6.i32[0] = *(_DWORD *)(a1 + 32);
  return regionOf(*(CGRect *)&a2, a6, *(float32_t *)(a1 + 36), *(float *)(a1 + 40), *(float *)(a1 + 44));
}

double __32__CIPinchDistortion_outputImage__block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5, float32x2_t a6)
{
  a6.i32[0] = *(_DWORD *)(a1 + 32);
  return regionOf(*(CGRect *)&a2, a6, *(float32_t *)(a1 + 36), *(float *)(a1 + 40), *(float *)(a1 + 44));
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIVector)inputCenter
{
  return self->inputCenter;
}

- (void)setInputCenter:(id)a3
{
}

- (NSNumber)inputRadius
{
  return self->inputRadius;
}

- (void)setInputRadius:(id)a3
{
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
}

@end