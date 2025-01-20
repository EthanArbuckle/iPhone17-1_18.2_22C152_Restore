@interface CIFaceBalance
+ (id)customAttributes;
- (BOOL)_isIdentity;
- (CIImage)inputImage;
- (NSNumber)inputOrigI;
- (NSNumber)inputOrigQ;
- (NSNumber)inputStrength;
- (NSNumber)inputWarmth;
- (id)_initFromProperties:(id)a3;
- (id)_kernel;
- (id)_outputProperties;
- (id)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputOrigI:(id)a3;
- (void)setInputOrigQ:(id)a3;
- (void)setInputStrength:(id)a3;
- (void)setInputWarmth:(id)a3;
@end

@implementation CIFaceBalance

+ (id)customAttributes
{
  v13[5] = *MEMORY[0x1E4F143B8];
  v12[0] = @"CIAttributeFilterCategories";
  v11[0] = @"CICategoryColorAdjustment";
  v11[1] = @"CICategoryVideo";
  v11[2] = @"CICategoryStillImage";
  v11[3] = @"CICategoryHighDynamicRange";
  v11[4] = @"CICategoryInterlaced";
  v11[5] = @"CICategoryNonSquarePixels";
  v11[6] = @"CICategoryBuiltIn";
  v11[7] = @"CICategoryApplePrivate";
  v13[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:8];
  v12[1] = @"inputOrigI";
  v9[0] = @"CIAttributeSliderMin";
  v9[1] = @"CIAttributeSliderMax";
  v10[0] = &unk_1EE4A8B20;
  v10[1] = &unk_1EE4A8B30;
  v9[2] = @"CIAttributeMin";
  v9[3] = @"CIAttributeMax";
  v10[2] = &unk_1EE4A8B20;
  v10[3] = &unk_1EE4A8B30;
  v9[4] = @"CIAttributeDefault";
  v9[5] = @"CIAttributeType";
  v10[4] = [NSNumber numberWithDouble:0.103905];
  v10[5] = @"CIAttributeTypeScalar";
  v13[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:6];
  v12[2] = @"inputOrigQ";
  v7[0] = @"CIAttributeSliderMin";
  v7[1] = @"CIAttributeSliderMax";
  v8[0] = &unk_1EE4A8B20;
  v8[1] = &unk_1EE4A8B30;
  v7[2] = @"CIAttributeMin";
  v7[3] = @"CIAttributeMax";
  v8[2] = &unk_1EE4A8B20;
  v8[3] = &unk_1EE4A8B30;
  v7[4] = @"CIAttributeDefault";
  v7[5] = @"CIAttributeType";
  v8[4] = [NSNumber numberWithDouble:0.0176465];
  v8[5] = @"CIAttributeTypeScalar";
  v13[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:6];
  v12[3] = @"inputStrength";
  v5[0] = @"CIAttributeSliderMin";
  v5[1] = @"CIAttributeSliderMax";
  v6[0] = &unk_1EE4A8B40;
  v6[1] = &unk_1EE4A8B50;
  v5[2] = @"CIAttributeMin";
  v5[3] = @"CIAttributeMax";
  v6[2] = &unk_1EE4A8B40;
  v6[3] = &unk_1EE4A8B50;
  v5[4] = @"CIAttributeDefault";
  v5[5] = @"CIAttributeIdentity";
  v6[4] = &unk_1EE4A8B30;
  v6[5] = &unk_1EE4A8B40;
  v5[6] = @"CIAttributeType";
  v6[6] = @"CIAttributeTypeScalar";
  v13[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:7];
  v12[4] = @"inputWarmth";
  v3[0] = @"CIAttributeSliderMin";
  v3[1] = @"CIAttributeSliderMax";
  v4[0] = &unk_1EE4A8B40;
  v4[1] = &unk_1EE4A8B60;
  v3[2] = @"CIAttributeMin";
  v3[3] = @"CIAttributeMax";
  v4[2] = &unk_1EE4A8B40;
  v4[3] = &unk_1EE4A8B60;
  v3[4] = @"CIAttributeDefault";
  v3[5] = @"CIAttributeType";
  v4[4] = &unk_1EE4A8B30;
  v4[5] = @"CIAttributeTypeScalar";
  v13[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:5];
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_facebalance];
}

- (BOOL)_isIdentity
{
  [(NSNumber *)self->inputWarmth doubleValue];
  double v4 = v3;
  [(NSNumber *)self->inputStrength doubleValue];
  double v6 = v5;
  [(NSNumber *)self->inputOrigI doubleValue];
  double v8 = v7;
  [(NSNumber *)self->inputOrigQ doubleValue];
  BOOL v10 = fabs(v6 * ((1.0 - v4) * *(double *)&faceBalanceIndoorIQ + v4 * *(double *)&faceBalanceOutdoorIQ - v8)) < 0.001;
  return fabs(v6 * ((1.0 - v4) * unk_1E932C800 + v4 * unk_1E932C810 - v9)) < 0.001 && v10;
}

- (id)outputImage
{
  v26[2] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  [(NSNumber *)self->inputWarmth doubleValue];
  double v4 = v3;
  [(NSNumber *)self->inputStrength doubleValue];
  double v6 = v5;
  [(NSNumber *)self->inputOrigI doubleValue];
  double v8 = v7;
  [(NSNumber *)self->inputOrigQ doubleValue];
  double v9 = (1.0 - v4) * unk_1E932C800 + v4 * unk_1E932C810;
  double v10 = v6 * ((1.0 - v4) * *(double *)&faceBalanceIndoorIQ + v4 * *(double *)&faceBalanceOutdoorIQ - v8);
  double v12 = v6 * (v9 - v11);
  inputImage = self->inputImage;
  if (fabs(v10) >= 0.001 || fabs(v12) >= 0.001)
  {
    uint64_t v16 = objc_msgSend(-[CIImage _imageByApplyingGamma:](inputImage, "_imageByApplyingGamma:", 0.25), "imageByUnpremultiplyingAlpha");
    id v17 = [(CIFaceBalance *)self _kernel];
    [(CIImage *)self->inputImage extent];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    v26[0] = v16;
    v26[1] = +[CIVector vectorWithX:v10 Y:v12];
    return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v17, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v26, 2), v19, v21, v23, v25), "imageByPremultiplyingAlpha"), "_imageByApplyingGamma:", 4.0);
  }
  else
  {
    v14 = inputImage;
    return v14;
  }
}

- (id)_outputProperties
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputOrigI doubleValue];
  double v4 = v3;
  [(NSNumber *)self->inputOrigQ doubleValue];
  double v6 = v5;
  [(NSNumber *)self->inputStrength doubleValue];
  double v8 = v7;
  [(NSNumber *)self->inputWarmth doubleValue];
  double v10 = v9;
  double v11 = 1.0 - v9;
  double v12 = v11 * unk_1E932C800 + v10 * unk_1E932C810;
  double v13 = v8 * (v11 * *(double *)&faceBalanceIndoorIQ + v10 * *(double *)&faceBalanceOutdoorIQ - v4);
  double v14 = v8 * (v12 - v6);
  if (fabs(v13) < 0.001 && fabs(v14) < 0.001) {
    return 0;
  }
  double v16 = (v13 + v14 * -0.2) * 222.43;
  double v17 = (v13 + v14 * 5.0) * 127.955;
  double v18 = metadataPropertyWithDouble(v4);
  if (v16 <= 10.0)
  {
    double v22 = v18;
    double v23 = metadataPropertyWithDouble(v6);
    double v24 = metadataPropertyWithDouble(v8);
    double v25 = metadataPropertyWithDouble(v10);
    v26 = metadataPropertyWithDouble(v16);
    v27 = metadataPropertyWithDouble(v17);
    v28 = metadataPropertyWithBool();
    v29 = metadataPropertyWithBool();
    double v19 = (void *)MEMORY[0x1E4F1C978];
    double v20 = &v22;
    uint64_t v21 = 8;
  }
  else
  {
    v30 = v18;
    v31 = metadataPropertyWithDouble(v6);
    v32 = metadataPropertyWithDouble(v8);
    v33 = metadataPropertyWithDouble(v10);
    v34 = metadataPropertyWithDouble(v16);
    v35 = metadataPropertyWithDouble(v17);
    v36 = metadataPropertyWithBool();
    v37 = metadataPropertyWithBool();
    v38 = metadataPropertyWithDouble(fmax(v16 + -10.0, 0.0) / 1.5);
    double v19 = (void *)MEMORY[0x1E4F1C978];
    double v20 = &v30;
    uint64_t v21 = 9;
  }
  return (id)objc_msgSend(v19, "arrayWithObjects:count:", v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36,
               v37,
               v38);
}

- (id)_initFromProperties:(id)a3
{
  double v8 = 0.0;
  double v9 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  if (metadataPropertyArrayGetDouble((uint64_t)a3, @"http://ns.apple.com/adjustment-settings/1.0/", @"FaceBalanceOrigI", &v9)&& metadataPropertyArrayGetDouble((uint64_t)a3, @"http://ns.apple.com/adjustment-settings/1.0/", @"FaceBalanceOrigQ", &v8)&& metadataPropertyArrayGetDouble((uint64_t)a3, @"http://ns.apple.com/adjustment-settings/1.0/", @"FaceBalanceStrength", &v7)&& metadataPropertyArrayGetDouble((uint64_t)a3, @"http://ns.apple.com/adjustment-settings/1.0/", @"FaceBalanceWarmth", &v6))
  {
    -[CIFaceBalance setInputOrigI:](self, "setInputOrigI:", [NSNumber numberWithDouble:v9]);
    -[CIFaceBalance setInputOrigQ:](self, "setInputOrigQ:", [NSNumber numberWithDouble:v8]);
    -[CIFaceBalance setInputStrength:](self, "setInputStrength:", [NSNumber numberWithDouble:v7]);
    -[CIFaceBalance setInputWarmth:](self, "setInputWarmth:", [NSNumber numberWithDouble:v6]);
  }
  else
  {

    return 0;
  }
  return self;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputOrigI
{
  return self->inputOrigI;
}

- (void)setInputOrigI:(id)a3
{
}

- (NSNumber)inputOrigQ
{
  return self->inputOrigQ;
}

- (void)setInputOrigQ:(id)a3
{
}

- (NSNumber)inputStrength
{
  return self->inputStrength;
}

- (void)setInputStrength:(id)a3
{
}

- (NSNumber)inputWarmth
{
  return self->inputWarmth;
}

- (void)setInputWarmth:(id)a3
{
}

@end