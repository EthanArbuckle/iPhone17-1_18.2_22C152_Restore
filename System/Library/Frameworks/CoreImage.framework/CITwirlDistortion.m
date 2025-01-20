@interface CITwirlDistortion
+ (id)customAttributes;
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

@implementation CITwirlDistortion

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_twirl];
}

+ (id)customAttributes
{
  v11[6] = *MEMORY[0x1E4F143B8];
  v10[0] = @"CIAttributeFilterCategories";
  v9[0] = @"CICategoryDistortionEffect";
  v9[1] = @"CICategoryVideo";
  v9[2] = @"CICategoryStillImage";
  v9[3] = @"CICategoryBuiltIn";
  v11[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:4];
  v11[1] = @"5";
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
  v6[0] = &unk_1EE4AA0B0;
  v6[1] = &unk_1EE4AA0B0;
  v5[2] = @"CIAttributeSliderMax";
  v5[3] = @"CIAttributeDefault";
  v6[2] = &unk_1EE4AA0C0;
  v6[3] = &unk_1EE4AA0D0;
  v5[4] = @"CIAttributeIdentity";
  v5[5] = @"CIAttributeType";
  v6[4] = &unk_1EE4AA0D0;
  v6[5] = @"CIAttributeTypeDistance";
  v11[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:6];
  v10[5] = @"inputAngle";
  v3[0] = @"CIAttributeSliderMin";
  v3[1] = @"CIAttributeSliderMax";
  v4[0] = &unk_1EE4AA0E0;
  v4[1] = &unk_1EE4AA0F0;
  v3[2] = @"CIAttributeDefault";
  v3[3] = @"CIAttributeIdentity";
  v4[2] = &unk_1EE4AA100;
  v4[3] = &unk_1EE4AA0B0;
  v3[4] = @"CIAttributeType";
  v4[4] = @"CIAttributeTypeAngle";
  v11[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:5];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:6];
}

- (id)outputImage
{
  v52[1] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  [(NSNumber *)self->inputRadius floatValue];
  if (fabsf(v3) >= 0.001 && ([(NSNumber *)self->inputAngle floatValue], fabsf(v4) >= 0.001))
  {
    [(NSNumber *)self->inputRadius floatValue];
    float v8 = v7;
    [(CIVector *)self->inputCenter X];
    double v10 = v9;
    [(CIVector *)self->inputCenter Y];
    double v12 = v11;
    double v13 = v8;
    [(NSNumber *)self->inputAngle floatValue];
    v15 = +[CIVector vectorWithX:v10 Y:v12 Z:1.0 / v8 W:v14];
    [(CIVector *)v15 X];
    float64_t v43 = v16;
    [(CIVector *)v15 Y];
    v17.f64[0] = v43;
    v17.f64[1] = v18;
    int32x2_t v44 = (int32x2_t)vcvt_f32_f64(v17);
    [(CIVector *)v15 Z];
    float64_t v42 = v19;
    [(CIVector *)v15 W];
    v20.f64[0] = v42;
    v20.f64[1] = v21;
    float32x4_t v45 = vcvt_hight_f32_f64(v44, v20);
    [(CIVector *)self->inputCenter X];
    double v23 = v22 - v8;
    [(CIVector *)self->inputCenter Y];
    double v25 = v24 - v13;
    double v26 = v13 + v13;
    [(CIImage *)self->inputImage extent];
    v56.origin.double x = v27;
    v56.origin.double y = v28;
    v56.size.double width = v29;
    v56.size.double height = v30;
    v54.origin.double x = v23;
    v54.origin.double y = v25;
    v54.size.double width = v13 + v13;
    v54.size.double height = v13 + v13;
    BOOL v31 = CGRectIntersectsRect(v54, v56);
    [(CIImage *)self->inputImage extent];
    double x = v32;
    double y = v33;
    double width = v34;
    double height = v35;
    if (v31)
    {
      v57.origin.double x = v23;
      v57.origin.double y = v25;
      v57.size.double width = v26;
      v57.size.double height = v26;
      CGRect v55 = CGRectUnion(*(CGRect *)&v32, v57);
      double x = v55.origin.x;
      double y = v55.origin.y;
      double width = v55.size.width;
      double height = v55.size.height;
    }
    id v40 = [(CITwirlDistortion *)self _kernel];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __32__CITwirlDistortion_outputImage__block_invoke;
    v46[3] = &__block_descriptor_80_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    float32x4_t v47 = v45;
    double v48 = v23;
    double v49 = v25;
    double v50 = v26;
    double v51 = v26;
    inputImage = self->inputImage;
    v52[0] = v15;
    return (id)objc_msgSend(v40, "applyWithExtent:roiCallback:inputImage:arguments:", v46, inputImage, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v52, 1), x, y, width, height);
  }
  else
  {
    v5 = self->inputImage;
    return v5;
  }
}

double __32__CITwirlDistortion_outputImage__block_invoke(CGPoint *a1, double a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double v8 = a2;
  CGPoint v31 = a1[2];
  CGFloat x = a1[3].x;
  CGFloat y = a1[3].y;
  CGFloat v11 = a1[4].x;
  CGFloat v12 = a1[4].y;
  v42.origin.CGFloat x = x;
  v42.origin.CGFloat y = y;
  v42.size.CGFloat width = v11;
  v42.size.CGFloat height = v12;
  CGRect v34 = CGRectIntersection(*(CGRect *)&a2, v42);
  if (!CGRectIsEmpty(v34))
  {
    v35.origin.CGFloat x = v8;
    v35.origin.CGFloat y = a3;
    v35.size.CGFloat width = a4;
    v35.size.CGFloat height = a5;
    v43.origin.CGFloat x = x;
    v43.origin.CGFloat y = y;
    v43.size.CGFloat width = v11;
    v43.size.CGFloat height = v12;
    if (!CGRectContainsRect(v35, v43))
    {
      float v13 = 1.0 / *(float *)&v31.y;
      if ((float)(1.0 / *(float *)&v31.y) >= 500.0)
      {
        float v14 = *((float *)&v31.y + 1);
        CGPoint v32 = (CGPoint)vcvtq_f64_f32(*(float32x2_t *)&v31.x);
        v37.origin.CGFloat x = v8;
        v37.origin.CGFloat y = a3;
        float v29 = v13;
        v37.size.CGFloat width = a4;
        v37.size.CGFloat height = a5;
        CGRect v38 = CGRectIntegral(v37);
        CGFloat v15 = v38.origin.x;
        CGFloat rect = v38.origin.y;
        CGFloat width = v38.size.width;
        CGFloat v28 = v38.size.width;
        CGFloat height = v38.size.height;
        v38.size = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
        v33.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
        v33.size = v38.size;
        float v18 = 1.0 / v29;
        v38.size.CGFloat width = width;
        double MinX = CGRectGetMinX(v38);
        v39.origin.CGFloat x = v15;
        CGFloat v20 = v15;
        CGFloat v27 = v15;
        v39.origin.CGFloat y = rect;
        v39.size.CGFloat width = width;
        v39.size.CGFloat height = height;
        CGFloat v21 = height;
        double MaxX = CGRectGetMaxX(v39);
        v40.origin.CGFloat x = v20;
        v40.origin.CGFloat y = rect;
        v40.size.CGFloat width = width;
        v40.size.CGFloat height = v21;
        double MinY = CGRectGetMinY(v40);
        v41.origin.CGFloat x = v27;
        v41.size.CGFloat width = v28;
        v41.origin.CGFloat y = rect;
        v41.size.CGFloat height = v21;
        double MaxY = CGRectGetMaxY(v41);
        if (MinX <= MaxX)
        {
          double v25 = MinX;
          do
          {
            twirlTracePoint(v25, MinY, v32, v18, v14, &v33);
            twirlTracePoint(v25, MaxY, v32, v18, v14, &v33);
            double v25 = v25 + 1.0;
          }
          while (v25 <= MaxX);
        }
        for (; MinY <= MaxY; double MinY = MinY + 1.0)
        {
          twirlTracePoint(MinX, MinY, v32, v18, v14, &v33);
          twirlTracePoint(MaxX, MinY, v32, v18, v14, &v33);
        }
        return v33.origin.x;
      }
      else
      {
        v36.origin.CGFloat x = v8;
        v36.origin.CGFloat y = a3;
        v36.size.CGFloat width = a4;
        v36.size.CGFloat height = a5;
        v44.origin.CGFloat x = x;
        v44.origin.CGFloat y = y;
        v44.size.CGFloat width = v11;
        v44.size.CGFloat height = v12;
        *(void *)&double v8 = (unint64_t)CGRectUnion(v36, v44);
      }
    }
  }
  return v8;
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