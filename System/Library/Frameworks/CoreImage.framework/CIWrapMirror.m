@interface CIWrapMirror
+ (id)customAttributes;
- (CIImage)inputImage;
- (id)outputImage;
- (void)setInputImage:(id)a3;
@end

@implementation CIWrapMirror

+ (id)customAttributes
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v4 = @"CIAttributeFilterCategories";
  v3 = @"CICategoryApplePrivate";
  v5[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:&v3 count:1];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
}

- (id)outputImage
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id result = self->inputImage;
  if (result)
  {
    [result extent];
    double x = v17.origin.x;
    double y = v17.origin.y;
    double width = v17.size.width;
    double height = v17.size.height;
    if (CGRectIsInfinite(v17))
    {
      return self->inputImage;
    }
    else
    {
      v8 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", x, y, width, height);
      v18.origin.double x = x;
      v18.origin.double y = y;
      v18.size.double width = width;
      v18.size.double height = height;
      CGRect v19 = CGRectInset(v18, -width, -height);
      double v9 = v19.origin.x;
      double v10 = v19.origin.y;
      double v11 = v19.size.width;
      double v12 = v19.size.height;
      v13 = +[CIKernel kernelWithInternalRepresentation:&CI::_wrapMirror];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __27__CIWrapMirror_outputImage__block_invoke;
      v15[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
      *(double *)&v15[4] = x;
      *(double *)&v15[5] = y;
      *(double *)&v15[6] = width;
      *(double *)&v15[7] = height;
      inputImage = self->inputImage;
      v16[0] = v8;
      return -[CIWarpKernel applyWithExtent:roiCallback:inputImage:arguments:](v13, "applyWithExtent:roiCallback:inputImage:arguments:", v15, inputImage, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v16, 1, MEMORY[0x1E4F143A8], 3221225472, __27__CIWrapMirror_outputImage__block_invoke, &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l, *(void *)&x, *(void *)&y, *(void *)&width, *(void *)&height), v9, v10,
               v11,
               v12);
    }
  }
  return result;
}

double __27__CIWrapMirror_outputImage__block_invoke(double *a1, double a2, double a3, double a4, double a5)
{
  CGFloat v6 = a1[4];
  CGFloat v5 = a1[5];
  CGFloat v7 = a1[6];
  CGFloat v8 = a1[7];
  CGRect v27 = CGRectStandardize(*(CGRect *)&a2);
  CGFloat x = v27.origin.x;
  CGFloat y = v27.origin.y;
  CGFloat width = v27.size.width;
  CGFloat height = v27.size.height;
  v27.origin.CGFloat x = v6;
  v27.origin.CGFloat y = v5;
  v27.size.CGFloat width = v7;
  v27.size.CGFloat height = v8;
  CGRect v28 = CGRectStandardize(v27);
  CGFloat v12 = v28.origin.x;
  CGFloat v13 = v28.origin.y;
  CGFloat v14 = v28.size.width;
  CGFloat v15 = v28.size.height;
  double MinX = CGRectGetMinX(v28);
  CGFloat v24 = v13;
  CGFloat v25 = v12;
  v29.origin.CGFloat x = v12;
  v29.origin.CGFloat y = v13;
  v29.size.CGFloat width = v14;
  v29.size.CGFloat height = v15;
  double MaxX = CGRectGetMaxX(v29);
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  double v18 = CGRectGetMinX(v30);
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  double v19 = CGRectGetMaxX(v31);
  if (v18 < MinX || v19 > MaxX)
  {
    double v21 = fmin(v18, -(v19 - MaxX * 2.0));
    if (v18 > MinX)
    {
      BOOL v22 = 1;
    }
    else
    {
      double v21 = MinX;
      BOOL v22 = v19 < MaxX;
    }
    if (v22) {
      double v18 = v21;
    }
    else {
      double v18 = MinX;
    }
  }
  v32.origin.CGFloat x = v25;
  v32.origin.CGFloat y = v24;
  v32.size.CGFloat width = v14;
  v32.size.CGFloat height = v15;
  CGRectGetMinY(v32);
  v33.origin.CGFloat x = v25;
  v33.origin.CGFloat y = v24;
  v33.size.CGFloat width = v14;
  v33.size.CGFloat height = v15;
  CGRectGetMaxY(v33);
  v34.origin.CGFloat x = x;
  v34.origin.CGFloat y = y;
  v34.size.CGFloat width = width;
  v34.size.CGFloat height = height;
  CGRectGetMinY(v34);
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  CGRectGetMaxY(v35);
  return v18;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

@end