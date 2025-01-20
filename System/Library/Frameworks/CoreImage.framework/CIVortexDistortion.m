@interface CIVortexDistortion
+ (id)customAttributes;
- (BOOL)_isIdentity;
- (CIImage)inputImage;
- (CIVector)inputCenter;
- (NSNumber)inputAngle;
- (NSNumber)inputRadius;
- (id)_kernel;
- (id)outputImage;
- (void)setInputAngle:(id)a3;
- (void)setInputCenter:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputRadius:(id)a3;
@end

@implementation CIVortexDistortion

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
  v6[0] = &unk_1EE4AA210;
  v6[1] = &unk_1EE4AA210;
  v5[2] = @"CIAttributeSliderMax";
  v5[3] = @"CIAttributeDefault";
  v6[2] = &unk_1EE4AA220;
  v6[3] = &unk_1EE4AA230;
  v5[4] = @"CIAttributeIdentity";
  v5[5] = @"CIAttributeType";
  v6[4] = &unk_1EE4AA210;
  v6[5] = @"CIAttributeTypeDistance";
  v11[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:6];
  v10[5] = @"inputAngle";
  v3[0] = @"CIAttributeSliderMin";
  v3[1] = @"CIAttributeSliderMax";
  v4[0] = &unk_1EE4AA240;
  v4[1] = &unk_1EE4AA250;
  v3[2] = @"CIAttributeDefault";
  v3[3] = @"CIAttributeIdentity";
  v4[2] = &unk_1EE4AA260;
  v4[3] = &unk_1EE4AA210;
  v3[4] = @"CIAttributeType";
  v4[4] = @"CIAttributeTypeAngle";
  v11[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:5];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:6];
}

- (BOOL)_isIdentity
{
  [(NSNumber *)self->inputRadius doubleValue];
  *(float *)&double v3 = v3;
  if (fabsf(*(float *)&v3) < 0.001) {
    return 1;
  }
  [(NSNumber *)self->inputAngle doubleValue];
  *(float *)&double v5 = v5;
  return fabsf(*(float *)&v5) < 0.001;
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_vortexDistortion];
}

- (id)outputImage
{
  v35[2] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage || !self->inputCenter) {
    return 0;
  }
  if ([(CIVortexDistortion *)self _isIdentity])
  {
    double v3 = self->inputImage;
    return v3;
  }
  else
  {
    [(NSNumber *)self->inputRadius floatValue];
    float v6 = v5;
    [(NSNumber *)self->inputAngle floatValue];
    float v8 = v7;
    [(CIImage *)self->inputImage extent];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    [(CIVector *)self->inputCenter X];
    CGFloat v18 = v17 - v6;
    [(CIVector *)self->inputCenter Y];
    v39.origin.double y = v19 - v6;
    v39.size.double width = v6 + v6;
    v37.origin.double x = v10;
    v37.origin.double y = v12;
    v37.size.double width = v14;
    v37.size.double height = v16;
    v39.origin.double x = v18;
    v39.size.double height = v39.size.width;
    CGRect v38 = CGRectUnion(v37, v39);
    double x = v38.origin.x;
    double y = v38.origin.y;
    double width = v38.size.width;
    double height = v38.size.height;
    v24 = +[CIVector vectorWithX:1.0 / v6 Y:v8];
    [(CIVector *)self->inputCenter X];
    *(float *)&double v25 = v25;
    float v31 = *(float *)&v25;
    [(CIVector *)self->inputCenter Y];
    *(float *)&double v26 = v26;
    unint64_t v29 = __PAIR64__(LODWORD(v26), LODWORD(v31));
    float v30 = *(float *)&v26;
    id v27 = [(CIVortexDistortion *)self _kernel];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __33__CIVortexDistortion_outputImage__block_invoke;
    v32[3] = &__block_descriptor_48_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    v32[4] = v29;
    float v33 = v6;
    float v34 = v8;
    inputImage = self->inputImage;
    v35[0] = +[CIVector vectorWithX:v31 Y:v30];
    v35[1] = v24;
    return (id)objc_msgSend(v27, "applyWithExtent:roiCallback:inputImage:arguments:", v32, inputImage, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v35, 2), x, y, width, height);
  }
}

double __33__CIVortexDistortion_outputImage__block_invoke(float32x2_t *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  float32x2_t v6 = a1[4];
  float v8 = a1[5].f32[0];
  float v7 = a1[5].f32[1];
  double v9 = (float)(v6.f32[0] - v8);
  float32x2_t v45 = v6;
  double v10 = (float)(v6.f32[1] - v8);
  CGFloat v12 = a4;
  v53.origin.CGFloat x = v9;
  v53.origin.CGFloat y = v10;
  v53.size.CGFloat width = (float)(v8 + v8);
  v53.size.CGFloat height = v53.size.width;
  CGRect v47 = CGRectIntersection(*(CGRect *)&a2, v53);
  if (CGRectIsEmpty(v47)) {
    return a2;
  }
  v48.origin.CGFloat x = a2;
  v48.origin.CGFloat y = a3;
  v48.size.CGFloat width = a4;
  v48.size.CGFloat height = a5;
  v54.origin.CGFloat x = v9;
  v54.origin.CGFloat y = v10;
  v54.size.CGFloat width = (float)(v8 + v8);
  v54.size.CGFloat height = v54.size.width;
  BOOL v15 = CGRectContainsRect(v48, v54);
  CGFloat v16 = a5;
  CGFloat v17 = a4;
  CGFloat v18 = a3;
  double v14 = a2;
  if (!v15)
  {
    if (v8 >= 300.0)
    {
      CGFloat v20 = a2;
      CGRect v49 = CGRectIntegral(*(CGRect *)(&v18 - 1));
      CGFloat x = v49.origin.x;
      CGFloat y = v49.origin.y;
      CGFloat width = v49.size.width;
      CGFloat height = v49.size.height;
      *(_OWORD *)&v49.origin.CGFloat y = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
      v46.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
      v46.size = *(CGSize *)&v49.origin.y;
      float v25 = 1.0 / v8;
      v49.origin.CGFloat y = y;
      double MinX = CGRectGetMinX(v49);
      v50.origin.CGFloat x = x;
      v50.origin.CGFloat y = y;
      v50.size.CGFloat width = width;
      v50.size.CGFloat height = height;
      double MaxX = CGRectGetMaxX(v50);
      v51.origin.CGFloat x = x;
      v51.origin.CGFloat y = y;
      v51.size.CGFloat width = width;
      v51.size.CGFloat height = height;
      double MinY = CGRectGetMinY(v51);
      v52.origin.CGFloat x = x;
      v52.origin.CGFloat y = y;
      v52.size.CGFloat width = width;
      v52.size.CGFloat height = height;
      double MaxY = CGRectGetMaxY(v52);
      if (MinX <= MaxX)
      {
        float v29 = MinY;
        float r2 = v29;
        float v30 = MaxY;
        float v38 = v30;
        double v31 = MinX;
        do
        {
          *(float *)&double v32 = v31;
          unsigned int r2_16a = LODWORD(v32);
          *((float *)&v32 + 1) = r2;
          vortexTracePoint(&v46, v32, v45, v25, v7);
          vortexTracePoint(&v46, COERCE_DOUBLE(__PAIR64__(LODWORD(v38), r2_16a)), v45, v25, v7);
          double v31 = v31 + 1.0;
        }
        while (v31 <= MaxX);
      }
      if (MinY <= MaxY)
      {
        float v33 = MinX;
        float r2a = v33;
        float v34 = MaxX;
        float v39 = v34;
        do
        {
          *(float *)&unsigned int v35 = MinY;
          unsigned int r2_16b = v35;
          vortexTracePoint(&v46, COERCE_DOUBLE(__PAIR64__(v35, LODWORD(r2a))), v45, v25, v7);
          vortexTracePoint(&v46, COERCE_DOUBLE(__PAIR64__(r2_16b, LODWORD(v39))), v45, v25, v7);
          double MinY = MinY + 1.0;
        }
        while (MinY <= MaxY);
      }
      return v46.origin.x;
    }
    else
    {
      CGFloat v19 = a2;
      v55.origin.CGFloat x = v9;
      v55.origin.CGFloat y = v10;
      v55.size.CGFloat width = (float)(v8 + v8);
      v55.size.CGFloat height = v55.size.width;
      *(void *)&double v14 = (unint64_t)CGRectUnion(*(CGRect *)(&v18 - 1), v55);
    }
  }
  return v14;
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

- (NSNumber)inputAngle
{
  return self->inputAngle;
}

- (void)setInputAngle:(id)a3
{
}

@end