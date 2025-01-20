@interface CIEdgeWork
+ (id)customAttributes;
- (CIImage)inputImage;
- (NSNumber)inputRadius;
- (id)_CIEdgeWork;
- (id)_CIEdgeWorkContrast;
- (id)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputRadius:(id)a3;
@end

@implementation CIEdgeWork

- (id)_CIEdgeWork
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_edgeWork];
}

- (id)_CIEdgeWorkContrast
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_edgeWorkContrast];
}

- (id)outputImage
{
  v29[3] = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputRadius floatValue];
  double v4 = fmaxf(v3, 0.0);
  inputImage = self->inputImage;
  float v6 = (v4 * 0.158 + 4.842) * v4 * 0.7;
  v28[0] = @"inputRVector";
  v29[0] = +[CIVector vectorWithX:0.299 Y:0.587 Z:0.114];
  v28[1] = @"inputGVector";
  v29[1] = +[CIVector vectorWithX:0.299 Y:0.587 Z:0.114];
  v28[2] = @"inputBVector";
  v29[2] = +[CIVector vectorWithX:0.299 Y:0.587 Z:0.114];
  v7 = -[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", @"CIColorMatrix", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:3]);
  v8 = [(CIImage *)v7 imageByApplyingGaussianBlurWithSigma:v4];
  id v9 = [(CIEdgeWork *)self _CIEdgeWork];
  [(CIImage *)v8 extent];
  v27[0] = v7;
  v27[1] = v8;
  v14 = objc_msgSend(v9, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v27, 2), v10, v11, v12, v13);
  [(CIImage *)v7 extent];
  v15 = objc_msgSend((id)objc_msgSend(v14, "imageByCroppingToRect:"), "imageByApplyingGaussianBlurWithSigma:", v4);
  id v16 = [(CIEdgeWork *)self _CIEdgeWorkContrast];
  [v15 extent];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  v26[0] = v15;
  *(float *)&double v17 = v6;
  v26[1] = [NSNumber numberWithFloat:v17];
  return (id)objc_msgSend(v16, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v26, 2), v18, v20, v22, v24);
}

+ (id)customAttributes
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"CIAttributeFilterCategories";
  v5[0] = @"CICategoryStylize";
  v5[1] = @"CICategoryVideo";
  v5[2] = @"CICategoryStillImage";
  v5[3] = @"CICategoryBuiltIn";
  v7[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:4];
  v7[1] = @"9";
  v6[1] = @"CIAttributeFilterAvailable_iOS";
  v6[2] = @"CIAttributeFilterAvailable_Mac";
  v7[2] = @"10.4";
  v6[3] = @"inputRadius";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4A8A30;
  v4[1] = &unk_1EE4A8A30;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4A8A40;
  v4[3] = &unk_1EE4A8A50;
  v3[4] = @"CIAttributeType";
  v4[4] = @"CIAttributeTypeDistance";
  v7[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:5];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputRadius
{
  return self->inputRadius;
}

- (void)setInputRadius:(id)a3
{
}

@end