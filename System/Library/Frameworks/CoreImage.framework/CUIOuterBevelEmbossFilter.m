@interface CUIOuterBevelEmbossFilter
+ (id)customAttributes;
- (CIColor)inputHighlightColor;
- (CIColor)inputShadowColor;
- (CIImage)inputImage;
- (NSNumber)inputAngle;
- (NSNumber)inputSize;
- (NSNumber)inputSoften;
- (id)_kernel;
- (id)_kernelC;
- (id)outputImage;
- (void)setInputAngle:(id)a3;
- (void)setInputHighlightColor:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputShadowColor:(id)a3;
- (void)setInputSize:(id)a3;
- (void)setInputSoften:(id)a3;
@end

@implementation CUIOuterBevelEmbossFilter

+ (id)customAttributes
{
  v14[5] = *MEMORY[0x1E4F143B8];
  v13[0] = @"inputSize";
  v11[0] = @"CIAttributeMin";
  v11[1] = @"CIAttributeSliderMin";
  v12[0] = &unk_1EE4AA2F0;
  v12[1] = &unk_1EE4AA2F0;
  v11[2] = @"CIAttributeSliderMax";
  v11[3] = @"CIAttributeMax";
  v12[2] = &unk_1EE4AA300;
  v12[3] = &unk_1EE4AA330;
  v11[4] = @"CIAttributeDefault";
  v11[5] = @"CIAttributeType";
  v12[4] = &unk_1EE4AA350;
  v12[5] = @"CIAttributeTypeScalar";
  v14[0] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:6];
  v13[1] = @"inputSoften";
  v9[0] = @"CIAttributeMin";
  v9[1] = @"CIAttributeSliderMin";
  v10[0] = &unk_1EE4AA2F0;
  v10[1] = &unk_1EE4AA2F0;
  v9[2] = @"CIAttributeSliderMax";
  v9[3] = @"CIAttributeMax";
  v10[2] = &unk_1EE4AA300;
  v10[3] = &unk_1EE4AA330;
  v9[4] = @"CIAttributeDefault";
  v9[5] = @"CIAttributeType";
  v10[4] = &unk_1EE4AA2F0;
  v10[5] = @"CIAttributeTypeScalar";
  v14[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:6];
  v13[2] = @"inputAngle";
  v7[0] = @"CIAttributeSliderMin";
  v7[1] = @"CIAttributeSliderMax";
  v8[0] = &unk_1EE4AA2F0;
  v8[1] = &unk_1EE4AA360;
  v7[2] = @"CIAttributeDefault";
  v7[3] = @"CIAttributeType";
  v8[2] = &unk_1EE4AA370;
  v8[3] = @"CIAttributeTypeAngle";
  v14[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:4];
  v13[3] = @"inputHighlightColor";
  v5[0] = @"CIAttributeDefault";
  v5[1] = @"CIAttributeType";
  v6[0] = +[CIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
  v6[1] = @"CIAttributeTypeColor";
  v14[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  v13[4] = @"inputShadowColor";
  v3[1] = @"CIAttributeType";
  v4[0] = +[CIColor colorWithRed:0.0, 0.0, 0.0, 1.0, @"CIAttributeDefault" green blue alpha];
  v4[1] = @"CIAttributeTypeColor";
  v14[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:2];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:5];
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_outerBevelEmboss];
}

- (id)_kernelC
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_outerBevelEmbossC];
}

- (id)outputImage
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if ([(NSNumber *)self->inputSize unsignedIntValue] > 0x31) {
    unsigned int v3 = 50;
  }
  else {
    unsigned int v3 = [(NSNumber *)self->inputSize unsignedIntValue];
  }
  [(NSNumber *)self->inputSoften doubleValue];
  inputImage = self->inputImage;
  if (!inputImage) {
    return 0;
  }
  double v6 = fmax(v4, 0.0);
  double v7 = fmin(v6, 50.0);
  float v8 = fmax((double)v3 * 0.21, 0.5);
  [(CIImage *)self->inputImage extent];
  if (v8 != 0.5 || v7 > 4.0)
  {
    v10 = _CUIMappedBlurImageWithSize(inputImage, fmin(v6, 2.0), 0);
    v11 = _CUIMappedBlurImageWithSize(v10, v3, 0);
    [(CIImage *)v11 extent];
    if (v8 == 0.5)
    {
      CGRect v49 = CGRectInset(*(CGRect *)&v12, -1.0, -1.0);
      double x = v49.origin.x;
      double y = v49.origin.y;
      double width = v49.size.width;
      double height = v49.size.height;
      long long v43 = xmmword_193957550;
      long long v44 = unk_193957560;
      long long v45 = xmmword_193957570;
      long long v46 = unk_193957580;
      uint64_t v47 = 0x3FC0000000000000;
      uint64_t v20 = [(CIImage *)v11 filteredImage:@"CIConvolution3X3", @"inputWeights", +[CIVector vectorWithValues:&v43 count:9], @"inputBias", &unk_1EE4AA380, 0 keysAndValues];
    }
    else
    {
      CGRect v52 = CGRectInset(*(CGRect *)&v12, (float)-v8, (float)-v8);
      double x = v52.origin.x;
      double y = v52.origin.y;
      double width = v52.size.width;
      double height = v52.size.height;
      v31 = +[CIVector vectorWithX:v8 Y:(float)-v8];
      id v32 = [(CUIOuterBevelEmbossFilter *)self _kernel];
      [(CIImage *)v11 extent];
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __40__CUIOuterBevelEmbossFilter_outputImage__block_invoke;
      v37[3] = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
      float v38 = v8;
      v40[0] = v11;
      v40[1] = v31;
      uint64_t v20 = objc_msgSend(v32, "applyWithExtent:roiCallback:arguments:", v37, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v40, 2), v33, v34, v35, v36);
    }
  }
  else
  {
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v47 = 0;
    long long v45 = 0x3FF0000000000000uLL;
    v41[3] = 0u;
    memset(v41, 0, 32);
    uint64_t v42 = 0;
    v41[2] = 0x3FF0000000000000uLL;
    if (v7 > 0.0)
    {
      int v22 = 1;
      do
      {
        convolve((double *)&v43, dbl_1939575B0);
        convolve((double *)v41, dbl_1939575B0);
        double v23 = (double)v22++;
      }
      while (v7 > v23);
    }
    convolve((double *)&v43, dbl_1939575B0);
    convolve((double *)v41, dbl_1939575B0);
    convolve((double *)&v43, dbl_1939575B0);
    [(CIImage *)inputImage extent];
    CGRect v51 = CGRectInset(v50, -4.0, -4.0);
    double x = v51.origin.x;
    double y = v51.origin.y;
    double width = v51.size.width;
    double height = v51.size.height;
    uint64_t v20 = objc_msgSend(-[CIImage filteredImage:keysAndValues:](inputImage, "filteredImage:keysAndValues:", @"CIConvolution9Horizontal", @"inputWeights", +[CIVector vectorWithValues:count:](CIVector, "vectorWithValues:count:", &v43, 9), @"inputBias", &unk_1EE4AA2F0, 0), "filteredImage:keysAndValues:", @"CIConvolution9Vertical", @"inputWeights", +[CIVector vectorWithValues:count:](CIVector, "vectorWithValues:count:", v41, 9), @"inputBias", &unk_1EE4AA380, 0);
  }
  v24 = (void *)v20;
  id v25 = [(CUIOuterBevelEmbossFilter *)self _kernelC];
  [v24 extent];
  inputHighlightColor = self->inputHighlightColor;
  v39[0] = v24;
  v39[1] = inputHighlightColor;
  v39[2] = self->inputShadowColor;
  return (id)objc_msgSend((id)objc_msgSend(v25, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v39, 3), v27, v28, v29, v30), "imageByCroppingToRect:", x, y, width, height);
}

double __40__CUIOuterBevelEmbossFilter_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  CGFloat v5 = (float)-ceilf(fabsf(*(float *)(a1 + 32)) + 0.5);
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a2, v5, v5);
  return result;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputSize
{
  return self->inputSize;
}

- (void)setInputSize:(id)a3
{
}

- (NSNumber)inputSoften
{
  return self->inputSoften;
}

- (void)setInputSoften:(id)a3
{
}

- (NSNumber)inputAngle
{
  return self->inputAngle;
}

- (void)setInputAngle:(id)a3
{
}

- (CIColor)inputHighlightColor
{
  return self->inputHighlightColor;
}

- (void)setInputHighlightColor:(id)a3
{
}

- (CIColor)inputShadowColor
{
  return self->inputShadowColor;
}

- (void)setInputShadowColor:(id)a3
{
}

@end