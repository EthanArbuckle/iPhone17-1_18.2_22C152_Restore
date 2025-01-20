@interface CIConvolution9Vertical
+ (id)customAttributes;
- (BOOL)_isIdentity;
- (CIImage)inputImage;
- (CIVector)inputWeights;
- (NSNumber)inputBias;
- (id)outputImage;
- (void)setInputBias:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputWeights:(id)a3;
@end

@implementation CIConvolution9Vertical

+ (id)customAttributes
{
  v14[5] = *MEMORY[0x1E4F143B8];
  v2 = +[CIVector vectorWithValues:count:](CIVector, "vectorWithValues:count:", &+[CIConvolution9Vertical customAttributes]::default_values, 9);
  int v3 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "containsString:", @"RGB");
  v13[0] = @"CIAttributeFilterCategories";
  v12[0] = @"CICategoryStylize";
  v12[1] = @"CICategoryVideo";
  v12[2] = @"CICategoryStillImage";
  v12[3] = @"CICategoryHighDynamicRange";
  v12[4] = @"CICategoryBuiltIn";
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:5];
  v5 = @"7";
  if (v3) {
    v5 = @"15";
  }
  v14[0] = v4;
  v14[1] = v5;
  v13[1] = @"CIAttributeFilterAvailable_iOS";
  v13[2] = @"CIAttributeFilterAvailable_Mac";
  if (v3) {
    v6 = @"12.0";
  }
  else {
    v6 = @"10.9";
  }
  v14[2] = v6;
  v13[3] = @"inputWeights";
  v10[0] = @"CIAttributeIdentity";
  v10[1] = @"CIAttributeDefault";
  v11[0] = v2;
  v11[1] = v2;
  v14[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v13[4] = @"inputBias";
  v8[0] = @"CIAttributeType";
  v8[1] = @"CIAttributeIdentity";
  v9[0] = @"CIAttributeTypeScalar";
  v9[1] = &unk_1EE4A82B0;
  v8[2] = @"CIAttributeDefault";
  v9[2] = &unk_1EE4A82B0;
  v14[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:5];
}

- (BOOL)_isIdentity
{
  [(NSNumber *)self->inputBias floatValue];
  if (v3 != 0.0) {
    return 0;
  }
  v5 = [(CIVector *)self->inputWeights _values];
  for (uint64_t i = 0; i != 9; ++i)
  {
    if (i == 4)
    {
      if (v5[4] != 1.0) {
        return 0;
      }
    }
    else if (v5[i] != 0.0)
    {
      return 0;
    }
  }
  return 1;
}

- (id)outputImage
{
  if (!self->inputImage) {
    return 0;
  }
  inputWeights = self->inputWeights;
  if (!inputWeights || [(CIVector *)inputWeights count] != 9) {
    return 0;
  }
  if ([(CIConvolution9Vertical *)self _isIdentity])
  {
    uint64_t v4 = self->inputImage;
    return v4;
  }
  [(NSNumber *)self->inputBias doubleValue];
  double v8 = v7;
  int v9 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "containsString:", @"RGB");
  char v10 = v9;
  v6 = apply1DConvolution(self->inputImage, self->inputWeights, v8, 0, v9);
  int v11 = CI_ENABLE_MPS();
  if ((v10 & 1) != 0 || !v11) {
    return v6;
  }
  id v12 = +[CIConvolutionProcessor applyConToImage:self->inputImage width:1 height:9 bias:self->inputWeights weights:v8];

  return +[CIImage imageForRenderingWithMPS:v12 orNonMPS:v6];
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIVector)inputWeights
{
  return self->inputWeights;
}

- (void)setInputWeights:(id)a3
{
}

- (NSNumber)inputBias
{
  return self->inputBias;
}

- (void)setInputBias:(id)a3
{
}

@end