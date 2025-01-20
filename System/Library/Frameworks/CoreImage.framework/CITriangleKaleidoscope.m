@interface CITriangleKaleidoscope
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIVector)inputPoint;
- (NSNumber)inputDecay;
- (NSNumber)inputRotation;
- (NSNumber)inputSize;
- (id)_colorKernel;
- (id)_geomKernel;
- (id)outputImage;
- (void)setInputDecay:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputPoint:(id)a3;
- (void)setInputRotation:(id)a3;
- (void)setInputSize:(id)a3;
@end

@implementation CITriangleKaleidoscope

+ (id)customAttributes
{
  v13[7] = *MEMORY[0x1E4F143B8];
  v12[0] = @"CIAttributeFilterCategories";
  v11[0] = @"CICategoryTileEffect";
  v11[1] = @"CICategoryVideo";
  v11[2] = @"CICategoryStillImage";
  v11[3] = @"CICategoryBuiltIn";
  v13[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];
  v13[1] = @"6";
  v12[1] = @"CIAttributeFilterAvailable_iOS";
  v12[2] = @"CIAttributeFilterAvailable_Mac";
  v13[2] = @"10.10";
  v12[3] = @"inputPoint";
  v9[0] = @"CIAttributeDefault";
  v9[1] = @"CIAttributeType";
  v10[0] = +[CIVector vectorWithX:150.0 Y:150.0];
  v10[1] = @"CIAttributeTypePosition";
  v13[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  v12[4] = @"inputRotation";
  v7[0] = @"CIAttributeSliderMin";
  v7[1] = @"CIAttributeSliderMax";
  v8[0] = &unk_1EE4AA000;
  v8[1] = &unk_1EE4AA010;
  v7[2] = @"CIAttributeDefault";
  v7[3] = @"CIAttributeType";
  v8[2] = &unk_1EE4AA020;
  v8[3] = @"CIAttributeTypeAngle";
  v13[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:4];
  v12[5] = @"inputSize";
  v5[0] = @"CIAttributeSliderMin";
  v5[1] = @"CIAttributeSliderMax";
  v6[0] = &unk_1EE4AA000;
  v6[1] = &unk_1EE4AA030;
  v5[2] = @"CIAttributeDefault";
  v5[3] = @"CIAttributeType";
  v6[2] = &unk_1EE4AA040;
  v6[3] = @"CIAttributeTypeScalar";
  v13[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:4];
  v12[6] = @"inputDecay";
  v3[0] = @"CIAttributeSliderMin";
  v3[1] = @"CIAttributeSliderMax";
  v4[0] = &unk_1EE4AA000;
  v4[1] = &unk_1EE4AA050;
  v3[2] = @"CIAttributeDefault";
  v3[3] = @"CIAttributeType";
  v4[2] = &unk_1EE4AA060;
  v4[3] = @"CIAttributeTypeScalar";
  v13[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:4];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:7];
}

- (id)_colorKernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_triangleKaleidoscopeColor];
}

- (id)_geomKernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_triangleKaleidoscopeGeom];
}

- (id)outputImage
{
  v60[3] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  [(NSNumber *)self->inputDecay floatValue];
  int v55 = v3;
  [(CIVector *)self->inputPoint X];
  float64_t v53 = v4;
  [(CIVector *)self->inputPoint Y];
  v5.f64[0] = v53;
  v5.f64[1] = v6;
  float32x2_t v54 = vcvt_f32_f64(v5);
  [(NSNumber *)self->inputSize floatValue];
  float v8 = fmax(v7, 0.01);
  float v52 = v8;
  float v9 = v8 * -1.5;
  double v10 = v8 * 1.73205081;
  float v11 = v10 / -6.0;
  [(NSNumber *)self->inputRotation floatValue];
  float v13 = v12;
  float v51 = v12;
  [(CIVector *)self->inputPoint X];
  float v15 = v14;
  [(CIVector *)self->inputPoint Y];
  float v17 = v16;
  __float2 v18 = __sincosf_stret(v13);
  float v49 = (float)((float)(v18.__cosval * v11) + (float)(v18.__sinval * v9)) + v17;
  float v50 = (float)((float)(v18.__cosval * v9) - (float)(v18.__sinval * v11)) + v15;
  __double2 v19 = __sincos_stret(v13 + -0.523598776);
  float v20 = v10 * v19.__cosval;
  float v21 = v10 * v19.__sinval;
  __double2 v22 = __sincos_stret(v13 + 0.523598776);
  float v23 = v10 * v22.__cosval;
  *(float *)&double v10 = v10 * v22.__sinval;
  float v24 = 1.0 / (float)((float)(v20 * *(float *)&v10) - (float)(v21 * v23));
  float v25 = v24 * *(float *)&v10;
  float v26 = -(float)(v21 * v24);
  float v27 = -(float)(v23 * v24);
  float v28 = v24 * v20;
  v29 = +[CIVector vectorWithX:v50 Y:v49];
  v30 = +[CIVector vectorWithX:v25 Y:v27 Z:v26 W:v28];
  v31 = +[CIVector vectorWithX:v20 Y:v23 Z:v21 W:*(float *)&v10];
  id v32 = [(CITriangleKaleidoscope *)self _geomKernel];
  id v33 = [(CITriangleKaleidoscope *)self _colorKernel];
  double v34 = *MEMORY[0x1E4F1DB10];
  double v35 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
  double v36 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
  double v37 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __37__CITriangleKaleidoscope_outputImage__block_invoke;
  v56[3] = &__block_descriptor_48_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v56[4] = v54;
  inputImage = self->inputImage;
  float v57 = v52;
  float v58 = v51;
  v60[0] = v29;
  v60[1] = v30;
  v60[2] = v31;
  v39 = objc_msgSend(v32, "applyWithExtent:roiCallback:inputImage:arguments:", v56, inputImage, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v60, 3), v34, v35, v36, v37);
  [v39 extent];
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  double v47 = v46;
  v59[0] = v39;
  v59[1] = v29;
  v59[2] = v30;
  LODWORD(v40) = v55;
  v59[3] = [NSNumber numberWithFloat:v40];
  return (id)objc_msgSend(v33, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v59, 4), v41, v43, v45, v47);
}

double __37__CITriangleKaleidoscope_outputImage__block_invoke(float32x2_t *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  float32x2_t v9 = a1[4];
  float v10 = a1[5].f32[1];
  float v89 = a1[5].f32[0];
  double v87 = v10;
  __double2 v11 = __sincos_stret(v10);
  v12.f32[0] = v11.__sinval * 0.288675129 + v11.__cosval * -0.5;
  double v88 = v11.__cosval * -0.288675129;
  float32_t v13 = v11.__cosval * -0.288675129 + v11.__sinval * -0.5;
  v12.f32[1] = v13;
  float32x2_t v14 = vadd_f32(v9, vmul_n_f32(vcvt_f32_f64(vmlaq_f64(vmulq_f64((float64x2_t)v11, (float64x2_t)xmmword_193957060), (float64x2_t)0, (float64x2_t)vextq_s8((int8x16_t)v11, (int8x16_t)v11, 8uLL))), v89));
  CGPoint v15 = (CGPoint)vcvtq_f64_f32(vadd_f32(v9, vmul_n_f32(v12, v89)));
  CGFloat y = v15.y;
  v90.origin.x = a2;
  v90.origin.CGFloat y = a3;
  v90.size.width = a4;
  v90.size.height = a5;
  CGPoint v17 = v15;
  if (CGRectContainsPoint(v90, v15))
  {
    v18.f32[0] = v11.__sinval * 0.288675129 + v11.__cosval * 0.5;
    float32_t v19 = v88 + v11.__sinval * 0.5;
    v18.f32[1] = v19;
    CGPoint v20 = (CGPoint)vcvtq_f64_f32(vadd_f32(v9, vmul_n_f32(v18, v89)));
    CGFloat v21 = v20.y;
    v91.origin.x = a2;
    v91.origin.CGFloat y = a3;
    v91.size.width = a4;
    v91.size.height = a5;
    if (CGRectContainsPoint(v91, v20))
    {
      CGPoint v22 = (CGPoint)vcvtq_f64_f32(v14);
      CGFloat v23 = v22.y;
      v92.origin.x = a2;
      v92.origin.CGFloat y = a3;
      v92.size.width = a4;
      v92.size.height = a5;
      if (CGRectContainsPoint(v92, v22))
      {
        float v24 = v89;
        float v25 = v10;
        float32x2_t v26 = v9;
        return triangleBounds(v24, v25, v26);
      }
    }
  }
  float v80 = v10;
  v27.f32[0] = a2;
  float32_t v28 = a3;
  __int32 v83 = v27.i32[0];
  float32_t v84 = v28;
  v27.f32[1] = v28;
  float32x2_t v82 = (float32x2_t)vdup_n_s32(0x405DB3D7u);
  float32x2_t v29 = vmul_f32(vsub_f32(v27, v9), v82);
  double v85 = a3;
  double v86 = a2;
  double v30 = v29.f32[0];
  double v31 = v29.f32[1];
  v29.f32[0] = v11.__cosval * v29.f32[1] + v11.__sinval * v29.f32[0];
  float v81 = v29.f32[0];
  float v32 = -v89;
  __double2 v33 = __sincos_stret(v87 + 2.0943951);
  float32x2_t v34 = v9;
  double v35 = a5;
  double v36 = a4;
  float v37 = v33.__cosval * v31 + v33.__sinval * v30;
  __double2 v38 = __sincos_stret(v87 + -2.0943951);
  double v39 = v38.__cosval * v31 + v38.__sinval * v30;
  double v40 = v86;
  float v41 = v39;
  BOOL v43 = v81 < (float)-v89 || v37 < v32 || v41 < v32;
  *(float *)&unsigned int v44 = v85 + v35;
  float32x2_t v45 = vmul_f32(vsub_f32((float32x2_t)__PAIR64__(v44, v83), v34), v82);
  double v46 = v45.f32[0];
  double v47 = v45.f32[1];
  float v48 = v11.__cosval * v47 + v11.__sinval * v46;
  float v49 = v33.__cosval * v47 + v33.__sinval * v46;
  float v50 = v38.__cosval * v47 + v38.__sinval * v46;
  BOOL v53 = v43 || v48 < v32 || v49 < v32 || v50 < v32;
  v54.f32[0] = v86 + v36;
  float32x2_t v55 = vmul_f32(vsub_f32((float32x2_t)__PAIR64__(LODWORD(v84), v54.u32[0]), v34), v82);
  double v56 = v55.f32[0];
  double v57 = v55.f32[1];
  float v58 = v11.__cosval * v57 + v11.__sinval * v56;
  float v59 = v33.__cosval * v57 + v33.__sinval * v56;
  float v60 = v38.__cosval * v57 + v38.__sinval * v56;
  BOOL v63 = v53 || v58 < v32 || v59 < v32 || v60 < v32;
  v54.f32[1] = v85 + v35;
  float32x2_t v64 = vmul_f32(vsub_f32(v54, v34), v82);
  double v65 = v64.f32[0];
  double v66 = v64.f32[1];
  if (v63)
  {
    BOOL v70 = 1;
  }
  else
  {
    float v67 = v11.__cosval * v66 + v11.__sinval * v65;
    BOOL v70 = v67 < v32;
  }
  if (v70)
  {
    BOOL v71 = 1;
  }
  else
  {
    float v68 = v33.__cosval * v66 + v33.__sinval * v65;
    BOOL v71 = v68 < v32;
  }
  if (v71)
  {
    BOOL v72 = 1;
  }
  else
  {
    float v69 = v38.__cosval * v66 + v38.__sinval * v65;
    BOOL v72 = v69 < v32;
  }
  if (v72)
  {
    v93.origin.x = v86;
    v93.origin.CGFloat y = v85;
    v93.size.width = v36;
    v93.size.height = v35;
    if (!CGRectContainsPoint(v93, v17))
    {
      v73.f32[0] = v11.__sinval * 0.288675129 + v11.__cosval * 0.5;
      float32_t v74 = v88 + v11.__sinval * 0.5;
      v73.f32[1] = v74;
      CGPoint v75 = (CGPoint)vcvtq_f64_f32(vadd_f32(v34, vmul_n_f32(v73, v89)));
      CGFloat v76 = v75.y;
      v94.origin.x = v86;
      v94.origin.CGFloat y = v85;
      v94.size.width = v36;
      v94.size.height = v35;
      if (!CGRectContainsPoint(v94, v75))
      {
        CGPoint v77 = (CGPoint)vcvtq_f64_f32(v14);
        CGFloat v78 = v77.y;
        v95.origin.x = v86;
        v95.origin.CGFloat y = v85;
        v95.size.width = v36;
        v95.size.height = v35;
        CGRectContainsPoint(v95, v77);
      }
    }
    float v24 = v89;
    float v25 = v80;
    float32x2_t v26 = v34;
    return triangleBounds(v24, v25, v26);
  }
  return v40;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIVector)inputPoint
{
  return self->inputPoint;
}

- (void)setInputPoint:(id)a3
{
}

- (NSNumber)inputSize
{
  return self->inputSize;
}

- (void)setInputSize:(id)a3
{
}

- (NSNumber)inputRotation
{
  return self->inputRotation;
}

- (void)setInputRotation:(id)a3
{
}

- (NSNumber)inputDecay
{
  return self->inputDecay;
}

- (void)setInputDecay:(id)a3
{
}

@end