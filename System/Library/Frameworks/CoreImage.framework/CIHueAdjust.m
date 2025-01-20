@interface CIHueAdjust
+ (id)customAttributes;
- (CIImage)inputImage;
- (NSNumber)inputAngle;
- (id)outputImage;
- (void)setInputAngle:(id)a3;
- (void)setInputImage:(id)a3;
@end

@implementation CIHueAdjust

+ (id)customAttributes
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"CIAttributeFilterCategories";
  v5[0] = @"CICategoryColorAdjustment";
  v5[1] = @"CICategoryVideo";
  v5[2] = @"CICategoryStillImage";
  v5[3] = @"CICategoryInterlaced";
  v5[4] = @"CICategoryNonSquarePixels";
  v5[5] = @"CICategoryHighDynamicRange";
  v5[6] = @"CICategoryBuiltIn";
  v7[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:7];
  v7[1] = @"5";
  v6[1] = @"CIAttributeFilterAvailable_iOS";
  v6[2] = @"CIAttributeFilterAvailable_Mac";
  v7[2] = @"10.4";
  v6[3] = @"inputAngle";
  v3[0] = @"CIAttributeSliderMin";
  v3[1] = @"CIAttributeSliderMax";
  v4[0] = &unk_1EE4A8070;
  v4[1] = &unk_1EE4A8080;
  v3[2] = @"CIAttributeDefault";
  v3[3] = @"CIAttributeIdentity";
  v4[2] = &unk_1EE4A8010;
  v4[3] = &unk_1EE4A8010;
  v3[4] = @"CIAttributeType";
  v4[4] = @"CIAttributeTypeAngle";
  v7[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:5];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
}

- (id)outputImage
{
  [(NSNumber *)self->inputAngle floatValue];
  if (fabsf(v3) >= 0.001)
  {
    __float2 v6 = __sincosf_stret(v3);
    *(float *)&double v7 = (float)((float)(v6.__cosval * 0.7875) + 0.2125) + (float)(v6.__sinval * -0.2125);
    float v8 = (float)(v6.__cosval * -0.7154) + 0.7154;
    *(float *)&double v9 = v8 + (float)(v6.__sinval * -0.7154);
    return _imageByApplyingColorMatrix(self->inputImage, *(float *)&v7, *(float *)&v9, (float)((float)(v6.__cosval * -0.0721) + 0.0721) + (float)(v6.__sinval * 0.9279), (float)((float)(v6.__cosval * -0.2125) + 0.2125) + (float)(v6.__sinval * 0.1404), (float)((float)(v6.__cosval * 0.2846) + 0.7154) + (float)(v6.__sinval * 0.1404), (float)((float)(v6.__cosval * -0.0721) + 0.0721) + (float)(v6.__sinval * -0.2846), v7, v9, (float)((float)(v6.__cosval * -0.2125) + 0.2125) + (float)(v6.__sinval * -0.7875), v8 + (float)(v6.__sinval * 0.7154), (float)((float)(v6.__cosval * 0.9279) + 0.0721) + (float)(v6.__sinval * 0.0721), 0.0, 0.0, 0.0);
  }
  else
  {
    v4 = self->inputImage;
    return v4;
  }
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
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