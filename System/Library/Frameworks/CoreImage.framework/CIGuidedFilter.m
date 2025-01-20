@interface CIGuidedFilter
+ (id)customAttributes;
- (CIImage)inputGuideImage;
- (CIImage)inputImage;
- (NSNumber)inputEpsilon;
- (NSNumber)inputRadius;
- (id)_boxFilter:(id)a3 fullFloat:(BOOL)a4;
- (id)_combineRGB_and_A;
- (id)_computeABKernel;
- (id)_downsampledColorImage:(id)a3;
- (id)_finalResult;
- (id)_fullFloatBoxFilter;
- (id)_multiplyImagesKernel;
- (id)_swizzleImageXXX1:(id)a3;
- (id)_swizzleImageYYZ1:(id)a3;
- (id)_swizzleImageYZZ1:(id)a3;
- (id)_upsampleImage:(id)a3 targetImageSize:(CGSize)a4;
- (id)computeAB:(id)a3;
- (id)multiplyImages:(id)a3 imageB:(id)a4;
- (id)outputImage;
- (id)subtract:(id)a3 minus:(id)a4;
- (void)setInputEpsilon:(id)a3;
- (void)setInputGuideImage:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputRadius:(id)a3;
@end

@implementation CIGuidedFilter

+ (id)customAttributes
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v8[0] = @"CIAttributeFilterCategories";
  v7[0] = @"CICategoryGeometryAdjustment";
  v7[1] = @"CICategoryVideo";
  v7[2] = @"CICategoryStillImage";
  v7[3] = @"CICategoryBuiltIn";
  v9[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:4];
  v9[1] = @"12";
  v8[1] = @"CIAttributeFilterAvailable_iOS";
  v8[2] = @"CIAttributeFilterAvailable_Mac";
  v9[2] = @"10.14";
  v8[3] = @"inputRadius";
  v5[0] = @"CIAttributeType";
  v5[1] = @"CIAttributeSliderMin";
  v6[0] = @"CIAttributeTypeScalar";
  v6[1] = &unk_1EE4A8D90;
  v5[2] = @"CIAttributeSliderMax";
  v5[3] = @"CIAttributeDefault";
  v6[2] = &unk_1EE4A8DA0;
  v6[3] = &unk_1EE4A8D90;
  v9[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:4];
  v8[4] = @"inputEpsilon";
  v3[0] = @"CIAttributeType";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = @"CIAttributeTypeScalar";
  v4[1] = &unk_1EE4A8DB0;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4A8DC0;
  v4[3] = &unk_1EE4A8DD0;
  v9[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:4];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:5];
}

- (id)_downsampledColorImage:(id)a3
{
  id v3 = a3;
  [a3 extent];
  double v6 = v5;
  double v8 = v7;
  [(CIImage *)self->inputImage extent];
  memset(&v14, 0, sizeof(v14));
  CGAffineTransformMakeScale(&v14, v9 / v6, v10 / v8);
  CGAffineTransform v13 = v14;
  if (!CGAffineTransformIsIdentity(&v13))
  {
    CGAffineTransform v12 = v14;
    return (id)[v3 imageByApplyingTransform:&v12 highQualityDownsample:1];
  }
  return v3;
}

- (id)_upsampleImage:(id)a3 targetImageSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  memset(&v13, 0, sizeof(v13));
  [a3 extent];
  CGFloat v8 = width / v7;
  [v6 extent];
  CGAffineTransformMakeScale(&v13, v8, height / v9);
  CGAffineTransform v12 = v13;
  if (!CGAffineTransformIsIdentity(&v12))
  {
    CGAffineTransform v11 = v13;
    return (id)[v6 imageByApplyingTransform:&v11 highQualityDownsample:0];
  }
  return v6;
}

- (id)_fullFloatBoxFilter
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_boxFilter3];
}

- (id)_boxFilter:(id)a3 fullFloat:(BOOL)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  [a3 extent];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  if (a4)
  {
    v22 = @"wrap_mode";
    v23 = @"clamp";
    v15 = +[CISampler samplerWithImage:options:](CISampler, "samplerWithImage:options:", a3, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1]);
    id v16 = [(CIGuidedFilter *)self _fullFloatBoxFilter];
    v21 = v15;
    return (id)objc_msgSend(v16, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_36, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v21, 1), v8, v10, v12, v14);
  }
  else
  {
    v18 = (void *)[a3 imageByClampingToExtent];
    v19 = NSNumber;
    [(NSNumber *)self->inputRadius floatValue];
    v24 = @"inputRadius";
    v25[0] = [v19 numberWithDouble:v20 * 2.0 + 1.0];
    return (id)objc_msgSend((id)objc_msgSend(v18, "imageByApplyingFilter:withInputParameters:", @"CIBoxBlur", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1)), "imageByCroppingToRect:", v8, v10, v12, v14);
  }
}

double __39__CIGuidedFilter__boxFilter_fullFloat___block_invoke(double a1, double a2, double a3, double a4)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a1, -1.0, -1.0);
  return result;
}

- (id)_multiplyImagesKernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_multiplyImages];
}

- (id)multiplyImages:(id)a3 imageB:(id)a4
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v6 = [(CIGuidedFilter *)self _multiplyImagesKernel];
  [a3 extent];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [a4 extent];
  v23.origin.x = v15;
  v23.origin.y = v16;
  v23.size.double width = v17;
  v23.size.double height = v18;
  v21.origin.x = v8;
  v21.origin.y = v10;
  v21.size.double width = v12;
  v21.size.double height = v14;
  CGRect v22 = CGRectUnion(v21, v23);
  v20[0] = a3;
  v20[1] = a4;
  return (id)objc_msgSend(v6, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v20, 2), v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
}

- (id)subtract:(id)a3 minus:(id)a4
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v6 = +[CIKernel kernelWithInternalRepresentation:&CI::_subtractImages];
  [a3 extent];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [a4 extent];
  v23.origin.x = v15;
  v23.origin.y = v16;
  v23.size.double width = v17;
  v23.size.double height = v18;
  v21.origin.x = v8;
  v21.origin.y = v10;
  v21.size.double width = v12;
  v21.size.double height = v14;
  CGRect v22 = CGRectUnion(v21, v23);
  v20[0] = a3;
  v20[1] = a4;
  return -[CIColorKernel applyWithExtent:arguments:](v6, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2], v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
}

- (id)_computeABKernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_computeAB];
}

- (id)_finalResult
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_finalResult];
}

- (id)_combineRGB_and_A
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_combineRGB_and_A];
}

- (id)_swizzleImageXXX1:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v4 = +[CIKernel kernelWithInternalRepresentation:&CI::_swizzleXXX1];
  [a3 extent];
  v10[0] = a3;
  return -[CIColorKernel applyWithExtent:arguments:](v4, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1], v5, v6, v7, v8);
}

- (id)_swizzleImageYYZ1:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v4 = +[CIKernel kernelWithInternalRepresentation:&CI::_swizzleYYZ1];
  [a3 extent];
  v10[0] = a3;
  return -[CIColorKernel applyWithExtent:arguments:](v4, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1], v5, v6, v7, v8);
}

- (id)_swizzleImageYZZ1:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v4 = +[CIKernel kernelWithInternalRepresentation:&CI::_swizzleYZZ1];
  [a3 extent];
  v10[0] = a3;
  return -[CIColorKernel applyWithExtent:arguments:](v4, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1], v5, v6, v7, v8);
}

- (id)computeAB:(id)a3
{
  v43[5] = *MEMORY[0x1E4F143B8];
  id v5 = [(CIGuidedFilter *)self _boxFilter:a3 fullFloat:1];
  id v6 = [(CIGuidedFilter *)self _swizzleImageXXX1:a3];
  id v7 = [(CIGuidedFilter *)self _swizzleImageYYZ1:a3];
  id v8 = [(CIGuidedFilter *)self _swizzleImageYZZ1:a3];
  id v9 = [(CIGuidedFilter *)self multiplyImages:v6 imageB:a3];
  id v10 = [(CIGuidedFilter *)self multiplyImages:v7 imageB:v8];
  id v11 = [(CIGuidedFilter *)self _swizzleImageXXX1:v5];
  id v12 = [(CIGuidedFilter *)self _swizzleImageYYZ1:v5];
  id v13 = [(CIGuidedFilter *)self _swizzleImageYZZ1:v5];
  id v14 = [(CIGuidedFilter *)self multiplyImages:v11 imageB:v5];
  id v15 = [(CIGuidedFilter *)self multiplyImages:v12 imageB:v13];
  id v16 = [(CIGuidedFilter *)self _boxFilter:v9 fullFloat:1];
  id v17 = [(CIGuidedFilter *)self _boxFilter:v10 fullFloat:1];
  id v18 = [(CIGuidedFilter *)self subtract:v16 minus:v14];
  id v19 = [(CIGuidedFilter *)self subtract:v17 minus:v15];
  id v20 = -[CIGuidedFilter subtract:minus:](self, "subtract:minus:", -[CIGuidedFilter _boxFilter:fullFloat:](self, "_boxFilter:fullFloat:", [a3 imageByPremultiplyingAlpha], 1), objc_msgSend(v5, "imageByPremultiplyingAlpha"));
  id v21 = [(CIGuidedFilter *)self _computeABKernel];
  [v20 extent];
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  [v18 extent];
  CGFloat v31 = v30;
  CGFloat v33 = v32;
  CGFloat v35 = v34;
  CGFloat v37 = v36;
  [v19 extent];
  v47.origin.x = v38;
  v47.origin.y = v39;
  v47.size.double width = v40;
  v47.size.double height = v41;
  v44.origin.x = v31;
  v44.origin.y = v33;
  v44.size.double width = v35;
  v44.size.double height = v37;
  CGRect v48 = CGRectUnion(v44, v47);
  v45.origin.x = v23;
  v45.origin.y = v25;
  v45.size.double width = v27;
  v45.size.double height = v29;
  CGRect v46 = CGRectUnion(v45, v48);
  v43[0] = v18;
  v43[1] = v19;
  v43[2] = v20;
  v43[3] = v5;
  v43[4] = self->inputEpsilon;
  return -[CIGuidedFilter _boxFilter:fullFloat:](self, "_boxFilter:fullFloat:", objc_msgSend(v21, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v43, 5), v46.origin.x, v46.origin.y, v46.size.width, v46.size.height), 0);
}

- (id)outputImage
{
  v44[2] = *MEMORY[0x1E4F143B8];
  if (self->inputGuideImage
    && (id v3 = self->inputImage) != 0
    && ([(CIImage *)v3 extent], !CGRectIsInfinite(v46))
    && ([(CIImage *)self->inputGuideImage extent], !CGRectIsInfinite(v47)))
  {
    [(CIImage *)self->inputGuideImage extent];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    [(CIImage *)self->inputImage extent];
    v51.origin.x = v13;
    v51.origin.y = v14;
    v51.size.double width = v15;
    v51.size.double height = v16;
    v48.origin.x = v6;
    v48.origin.y = v8;
    v48.size.double width = v10;
    v48.size.double height = v12;
    if (CGRectEqualToRect(v48, v51))
    {
      return self->inputImage;
    }
    else
    {
      id v17 = [(CIGuidedFilter *)self _downsampledColorImage:self->inputGuideImage];
      id v18 = [(CIGuidedFilter *)self _combineRGB_and_A];
      [v17 extent];
      CGFloat v20 = v19;
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      [(CIImage *)self->inputImage extent];
      v52.origin.x = v27;
      v52.origin.y = v28;
      v52.size.double width = v29;
      v52.size.double height = v30;
      v49.origin.x = v20;
      v49.origin.y = v22;
      v49.size.double width = v24;
      v49.size.double height = v26;
      CGRect v50 = CGRectUnion(v49, v52);
      inputImage = self->inputImage;
      v44[0] = v17;
      v44[1] = inputImage;
      id v32 = -[CIGuidedFilter computeAB:](self, "computeAB:", objc_msgSend(v18, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v44, 2), v50.origin.x, v50.origin.y, v50.size.width, v50.size.height));
      [(CIImage *)self->inputImage extent];
      uint64_t v33 = objc_msgSend(v32, "imageByCroppingToRect:");
      [(CIImage *)self->inputGuideImage extent];
      id v36 = -[CIGuidedFilter _upsampleImage:targetImageSize:](self, "_upsampleImage:targetImageSize:", v33, v34, v35);
      id v37 = [(CIGuidedFilter *)self _finalResult];
      [v36 extent];
      inputGuideImage = self->inputGuideImage;
      v43[0] = v36;
      v43[1] = inputGuideImage;
      return (id)objc_msgSend(v37, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v43, 2), v39, v40, v41, v42);
    }
  }
  else
  {
    return +[CIImage emptyImage];
  }
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputGuideImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputGuideImage:(id)a3
{
}

- (NSNumber)inputRadius
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputRadius:(id)a3
{
}

- (NSNumber)inputEpsilon
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputEpsilon:(id)a3
{
}

@end