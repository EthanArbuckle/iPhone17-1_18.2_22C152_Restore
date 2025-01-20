@interface CIDepthEffectMakeBlurMap
+ (id)customAttributes;
- (AVCameraCalibrationData)inputCalibrationData;
- (BOOL)needToRunFaceMask;
- (CGSize)originalShiftMapSize;
- (CIImage)inputGainMap;
- (CIImage)inputGlassesImage;
- (CIImage)inputHairImage;
- (CIImage)inputImage;
- (CIImage)inputMatteImage;
- (CIImage)inputShiftmapImage;
- (CIVector)inputChinPosition;
- (CIVector)inputFaceMidPoint;
- (CIVector)inputFocusRect;
- (CIVector)inputLeftEyePosition;
- (CIVector)inputRightEyePosition;
- (NSNumber)inputAperture;
- (NSNumber)inputDraftMode;
- (NSNumber)inputScale;
- (NSString)inputCaptureFolderMiscPath;
- (float)intrinsicMatrixFocalLength;
- (id)blurMapV2:(id)a3;
- (id)blurMapV3:(id)a3 shiftmap:(id)a4 alphaImage:(id)a5;
- (id)blurMapV4:(id)a3 shiftmap:(id)a4 alphaImage:(id)a5 hairImage:(id)a6;
- (id)calibrationData;
- (id)faceMaskApply:(id)a3 blurMap:(id)a4;
- (id)faceMaskDelta:(id)a3 extent:(CGRect)a4 parameters:(id)a5 distanceToAdd:(float *)a6;
- (id)faceMaskParams:(id)a3 useNormalizedCoords:(BOOL)a4;
- (id)inputAuxDataMetadata;
- (id)lensModelApply:(id)a3 shiftMap:(id)a4;
- (id)lensModelParams:(id)a3;
- (id)outputImage;
- (id)refineShiftMapV3WithMainImage:(id)a3 shiftmap:(id)a4 lensModel:(id)a5;
- (id)smoothShiftMapV2:(id)a3;
- (id)unifiedRenderingOutputImage:(CGImageMetadata *)a3;
- (id)upsampledShiftMap:(id)a3;
- (void)setInputAperture:(id)a3;
- (void)setInputAuxDataMetadata:(id)a3;
- (void)setInputCalibrationData:(id)a3;
- (void)setInputCaptureFolderMiscPath:(id)a3;
- (void)setInputChinPosition:(id)a3;
- (void)setInputDraftMode:(id)a3;
- (void)setInputFaceMidPoint:(id)a3;
- (void)setInputFocusRect:(id)a3;
- (void)setInputGainMap:(id)a3;
- (void)setInputGlassesImage:(id)a3;
- (void)setInputHairImage:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputLeftEyePosition:(id)a3;
- (void)setInputMatteImage:(id)a3;
- (void)setInputRightEyePosition:(id)a3;
- (void)setInputScale:(id)a3;
- (void)setInputShiftmapImage:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation CIDepthEffectMakeBlurMap

+ (id)customAttributes
{
  v25[13] = *MEMORY[0x1E4F143B8];
  v24[0] = @"CIAttributeFilterCategories";
  v23[0] = @"CICategoryColorAdjustment";
  v23[1] = @"CICategoryVideo";
  v23[2] = @"CICategoryStillImage";
  v23[3] = @"CICategoryBuiltIn";
  v23[4] = @"CICategoryApplePrivate";
  v25[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:5];
  v25[1] = @"11";
  v24[1] = @"CIAttributeFilterAvailable_iOS";
  v24[2] = @"CIAttributeFilterAvailable_Mac";
  v25[2] = @"10.13";
  v24[3] = @"inputAperture";
  v21[0] = @"CIAttributeSliderMin";
  v21[1] = @"CIAttributeSliderMax";
  v22[0] = &unk_1EE4AA280;
  v22[1] = &unk_1EE4AA290;
  v21[2] = @"CIAttributeMin";
  v21[3] = @"CIAttributeMax";
  v22[2] = &unk_1EE4AA270;
  v22[3] = &unk_1EE4AA290;
  v21[4] = @"CIAttributeDefault";
  v21[5] = @"CIAttributeType";
  v22[4] = &unk_1EE4AA270;
  v22[5] = @"CIAttributeTypeScalar";
  v25[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:6];
  v24[4] = @"inputLeftEyePosition";
  v19[0] = @"CIAttributeSliderMin";
  v19[1] = @"CIAttributeSliderMax";
  v20[0] = &unk_1EE4AA270;
  v20[1] = &unk_1EE4AA280;
  v19[2] = @"CIAttributeMin";
  v19[3] = @"CIAttributeMax";
  v20[2] = &unk_1EE4AA270;
  v20[3] = &unk_1EE4AA280;
  v19[4] = @"CIAttributeDefault";
  v19[5] = @"CIAttributeType";
  v20[4] = +[CIVector vectorWithX:-1.0 Y:-1.0];
  v20[5] = @"CIAttributeTypePosition";
  v25[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:6];
  v24[5] = @"inputRightEyePosition";
  v17[0] = @"CIAttributeSliderMin";
  v17[1] = @"CIAttributeSliderMax";
  v18[0] = &unk_1EE4AA270;
  v18[1] = &unk_1EE4AA280;
  v17[2] = @"CIAttributeMin";
  v17[3] = @"CIAttributeMax";
  v18[2] = &unk_1EE4AA270;
  v18[3] = &unk_1EE4AA280;
  v17[4] = @"CIAttributeDefault";
  v17[5] = @"CIAttributeType";
  v18[4] = +[CIVector vectorWithX:-1.0 Y:-1.0];
  v18[5] = @"CIAttributeTypePosition";
  v25[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:6];
  v24[6] = @"inputChinPosition";
  v15[0] = @"CIAttributeSliderMin";
  v15[1] = @"CIAttributeSliderMax";
  v16[0] = &unk_1EE4AA270;
  v16[1] = &unk_1EE4AA280;
  v15[2] = @"CIAttributeMin";
  v15[3] = @"CIAttributeMax";
  v16[2] = &unk_1EE4AA270;
  v16[3] = &unk_1EE4AA280;
  v15[4] = @"CIAttributeDefault";
  v15[5] = @"CIAttributeType";
  v16[4] = +[CIVector vectorWithX:-1.0 Y:-1.0];
  v16[5] = @"CIAttributeTypePosition";
  v25[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:6];
  v24[7] = @"inputFaceMidPoint";
  v13[0] = @"CIAttributeSliderMin";
  v13[1] = @"CIAttributeSliderMax";
  v14[0] = &unk_1EE4AA270;
  v14[1] = &unk_1EE4AA280;
  v13[2] = @"CIAttributeMin";
  v13[3] = @"CIAttributeMax";
  v14[2] = &unk_1EE4AA270;
  v14[3] = &unk_1EE4AA280;
  v13[4] = @"CIAttributeDefault";
  v13[5] = @"CIAttributeType";
  v14[4] = +[CIVector vectorWithX:-1.0 Y:-1.0];
  v14[5] = @"CIAttributeTypePosition";
  v25[7] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:6];
  v24[8] = @"inputFocusRect";
  v12[0] = @"CIAttributeTypeRectangle";
  v11[0] = @"CIAttributeType";
  v11[1] = @"CIAttributeDefault";
  v12[1] = +[CIVector vectorWithX:0.45 Y:0.45 Z:0.1 W:0.1];
  v11[2] = @"CIAttributeIdentity";
  v12[2] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", *MEMORY[0x1E4F1DB10], *(double *)(MEMORY[0x1E4F1DB10] + 8), *(double *)(MEMORY[0x1E4F1DB10] + 16), *(double *)(MEMORY[0x1E4F1DB10] + 24));
  v25[8] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  v24[9] = @"inputScale";
  v9[0] = @"CIAttributeType";
  v9[1] = @"CIAttributeSliderMin";
  v10[0] = @"CIAttributeTypeScalar";
  v10[1] = &unk_1EE4AA2A0;
  v9[2] = @"CIAttributeSliderMax";
  v9[3] = @"CIAttributeDefault";
  v10[2] = &unk_1EE4AA280;
  v10[3] = &unk_1EE4AA280;
  v25[9] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];
  v24[10] = @"inputCalibrationData";
  v7 = @"CIAttributeClass";
  v8 = @"AVCameraCalibrationData";
  v25[10] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  v24[11] = @"inputAuxDataMetadata";
  v5 = @"CIAttributeClass";
  v6 = @"CGImageMetadataRef";
  v25[11] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  v24[12] = @"inputDraftMode";
  v3[0] = @"CIAttributeType";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = @"CIAttributeTypeInteger";
  v4[1] = &unk_1EE4AAFD0;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4AAFE8;
  v4[3] = &unk_1EE4AAFD0;
  v25[12] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:4];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:13];
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  if (([a4 isEqualToString:@"inputOriginalSize"] & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)CIDepthEffectMakeBlurMap;
    [(CIFilter *)&v7 setValue:a3 forUndefinedKey:a4];
  }
}

- (id)calibrationData
{
  if (self->inputCalibrationData) {
    return self->inputCalibrationData;
  }
  v3 = [(CIImage *)self->inputShiftmapImage depthData];

  return AVFDepthCameraCalibrationData(v3, v4);
}

- (CGSize)originalShiftMapSize
{
  id v3 = [(CIDepthEffectMakeBlurMap *)self calibrationData];
  if (!v3) {
    goto LABEL_10;
  }
  double v4 = AVCameraCalibrationDataIntrinsicMatrixReferenceDimensions(v3);
  if (v4 == 4224.0 && v5 == 3024.0)
  {
    double v4 = 4032.0;
    double v5 = 3024.0;
    goto LABEL_18;
  }
  if (v4 == *MEMORY[0x1E4F1DB30] && v5 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
LABEL_10:
    objc_super v7 = [(CIImage *)self->inputShiftmapImage depthData];
    if (!v7
      || (v9 = AVFDepthCameraCalibrationData(v7, v8)) == 0
      || ((double v4 = AVCameraCalibrationDataIntrinsicMatrixReferenceDimensions(v9), v4 == *MEMORY[0x1E4F1DB30])
        ? (BOOL v10 = v5 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
        : (BOOL v10 = 0),
          v10))
    {
      double v5 = 3024.0;
      double v4 = 4032.0;
    }
  }
LABEL_18:
  result.height = v5;
  result.width = v4;
  return result;
}

- (float)intrinsicMatrixFocalLength
{
  id v2 = [(CIDepthEffectMakeBlurMap *)self calibrationData];
  if (v2) {
    double v3 = AVCameraCalibrationDataIntrinsicMatrix(v2);
  }
  else {
    LODWORD(v3) = 1171144704;
  }
  return *(float *)&v3;
}

- (id)upsampledShiftMap:(id)a3
{
  v20[4] = *MEMORY[0x1E4F143B8];
  [(CIDepthEffectMakeBlurMap *)self originalShiftMapSize];
  double v5 = v4;
  double v7 = v6;
  [a3 extent];
  double v8 = v5 * 0.5;
  double v9 = v7 * 0.5;
  float v11 = v8 / v10;
  float v13 = v9 / v12;
  if (v11 > 1.0 || v13 > 1.0)
  {
    v15 = (void *)[a3 imageByClampingToExtent];
    v19[0] = @"inputScale";
    *(float *)&double v16 = v13;
    v20[0] = [NSNumber numberWithFloat:v16];
    v19[1] = @"inputAspectRatio";
    *(float *)&double v17 = v11 / v13;
    v20[1] = [NSNumber numberWithFloat:v17];
    v20[2] = &unk_1EE4AA270;
    v19[2] = @"inputB";
    v19[3] = @"inputC";
    v20[3] = &unk_1EE4AA2B0;
    a3 = (id)objc_msgSend(v15, "imageByApplyingFilter:withInputParameters:", @"CIBicubicScaleTransform", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v20, v19, 4));
  }
  [a3 extent];
  if (CGRectIsInfinite(v21)) {
    return (id)objc_msgSend(a3, "imageByCroppingToRect:", 0.0, 0.0, v8, v9);
  }
  return a3;
}

- (id)lensModelParams:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v18 = @"inputExtent";
  [a3 extent];
  v19[0] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
  uint64_t v5 = objc_msgSend(a3, "imageByApplyingFilter:withInputParameters:", @"CIAreaMinMaxRed", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1));
  [(CIDepthEffectMakeBlurMap *)self originalShiftMapSize];
  double v6 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:");
  inputFocusRect = self->inputFocusRect;
  [(CIDepthEffectMakeBlurMap *)self intrinsicMatrixFocalLength];
  int v9 = v8;
  v16[0] = @"inputMinMaxImage";
  v16[1] = @"inputOriginalSize";
  v17[0] = v5;
  v17[1] = v6;
  v17[2] = inputFocusRect;
  v16[2] = @"inputFocusRect";
  v16[3] = @"inputSimulatedAperture";
  *(float *)&double v10 = self->simulatedAperture;
  v17[3] = [NSNumber numberWithFloat:v10];
  v16[4] = @"inputIntrinsicMatrixFocalLength";
  LODWORD(v11) = v9;
  uint64_t v12 = [NSNumber numberWithFloat:v11];
  tuningParameters = self->tuningParameters;
  v16[5] = @"inputTuningParameters";
  if (tuningParameters) {
    v14 = tuningParameters;
  }
  else {
    v14 = (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
  v17[4] = v12;
  v17[5] = v14;
  return (id)objc_msgSend(a3, "imageByApplyingFilter:withInputParameters:", @"CILensModelCalculator", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v17, v16, 6));
}

- (id)lensModelApply:(id)a3 shiftMap:(id)a4
{
  v7[1] = *MEMORY[0x1E4F143B8];
  double v6 = @"inputLensModelParams";
  v7[0] = [a3 imageByClampingToExtent];
  return (id)objc_msgSend(a4, "imageByApplyingFilter:withInputParameters:", @"CILensModelApply", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1));
}

- (BOOL)needToRunFaceMask
{
  v11[4] = *MEMORY[0x1E4F143B8];
  v11[0] = [(CIDepthEffectMakeBlurMap *)self inputLeftEyePosition];
  v11[1] = [(CIDepthEffectMakeBlurMap *)self inputRightEyePosition];
  v11[2] = [(CIDepthEffectMakeBlurMap *)self inputFaceMidPoint];
  unint64_t v3 = 0;
  void v11[3] = [(CIDepthEffectMakeBlurMap *)self inputChinPosition];
  BOOL v4 = 1;
  while (1)
  {
    uint64_t v5 = (void *)v11[v3];
    uint64_t v6 = [v5 count];
    if (v6) {
      break;
    }
LABEL_6:
    BOOL v4 = v3++ < 3;
    if (v3 == 4) {
      return 0;
    }
  }
  uint64_t v7 = v6;
  uint64_t v8 = 0;
  while (1)
  {
    [v5 valueAtIndex:v8];
    if (fabs(v9 + 1.0) > 0.01) {
      return v4;
    }
    if (v7 == ++v8) {
      goto LABEL_6;
    }
  }
}

- (id)faceMaskParams:(id)a3 useNormalizedCoords:(BOOL)a4
{
  v36[20] = *MEMORY[0x1E4F143B8];
  SDOFSimpleLensModelValue(@"defaultSimulatedAperture", self->tuningParameters);
  float simulatedAperture = self->simulatedAperture;
  double v8 = 1.0;
  BOOL v10 = v9 <= 0.0;
  double v11 = v9 / simulatedAperture;
  if (v10) {
    double v11 = 1.0;
  }
  if (simulatedAperture > 0.0) {
    double v12 = v11;
  }
  else {
    double v12 = 1.0;
  }
  double v13 = 1.0;
  if (!a4)
  {
    objc_msgSend(a3, "extent", v11);
    double v8 = v14;
    [a3 extent];
    double v13 = v15;
  }
  id v16 = [(NSDictionary *)self->tuningParameters objectForKeyedSubscript:@"Version", v11];
  double v17 = NSNumber;
  if (v16) {
    uint64_t v18 = [v16 unsignedIntegerValue];
  }
  else {
    uint64_t v18 = 1;
  }
  v19 = (void *)[v17 numberWithUnsignedInteger:v18];
  v35[0] = @"inputFacesLeftEyeX";
  v36[0] = transformNormalizedMetalToCI(self->inputLeftEyePosition, 0, v8);
  v35[1] = @"inputFacesLeftEyeY";
  v36[1] = transformNormalizedMetalToCI(self->inputLeftEyePosition, 1u, v13);
  v35[2] = @"inputFacesCenterX";
  v36[2] = transformNormalizedMetalToCI(self->inputFaceMidPoint, 0, v8);
  v35[3] = @"inputFacesCenterY";
  v36[3] = transformNormalizedMetalToCI(self->inputFaceMidPoint, 1u, v13);
  v35[4] = @"inputFacesRightEyeX";
  v36[4] = transformNormalizedMetalToCI(self->inputRightEyePosition, 0, v8);
  v35[5] = @"inputFacesRightEyeY";
  v36[5] = transformNormalizedMetalToCI(self->inputRightEyePosition, 1u, v13);
  v35[6] = @"inputFacesChinX";
  v36[6] = transformNormalizedMetalToCI(self->inputChinPosition, 0, v8);
  v35[7] = @"inputFacesChinY";
  v36[7] = transformNormalizedMetalToCI(self->inputChinPosition, 1u, v13);
  v35[8] = @"inputMaxBlur";
  v20 = NSNumber;
  SDOFRenderingValue(&cfstr_Maxblur.isa, self->tuningParameters);
  v36[8] = objc_msgSend(v20, "numberWithFloat:");
  v35[9] = @"inputFacesMaxBlurOnEyes";
  CGRect v21 = NSNumber;
  SDOFFaceMaskValue(@"maxBlurOnEyes", self->tuningParameters);
  v36[9] = objc_msgSend(v21, "numberWithFloat:");
  v35[10] = @"inputFacesMaxBlurDistFromFocus";
  v22 = NSNumber;
  SDOFFaceMaskValue(@"maxBlurDistFromFocus", self->tuningParameters);
  v36[10] = objc_msgSend(v22, "numberWithFloat:");
  v35[11] = @"inputFacesEyeToEyebrowRatio";
  v23 = NSNumber;
  SDOFFaceMaskValue(@"eyeToEyebrowRatio", self->tuningParameters);
  v36[11] = objc_msgSend(v23, "numberWithFloat:");
  v35[12] = @"inputFacesLinearBlurGrowthM";
  v24 = NSNumber;
  SDOFFaceMaskValue(@"linearBlurGrowthM", self->tuningParameters);
  v36[12] = objc_msgSend(v24, "numberWithFloat:");
  v35[13] = @"inputFacesLinearBlurGrowthC";
  v25 = NSNumber;
  SDOFFaceMaskValue(@"linearBlurGrowthC", self->tuningParameters);
  v36[13] = objc_msgSend(v25, "numberWithFloat:");
  v35[14] = @"inputFacesDistToBlurScaling";
  v26 = NSNumber;
  SDOFFaceMaskValue(@"distToBlurScaling", self->tuningParameters);
  v36[14] = objc_msgSend(v26, "numberWithFloat:");
  v35[15] = @"inputFacesCapMultip";
  v27 = NSNumber;
  SDOFFaceMaskValue(@"capMultip", self->tuningParameters);
  v36[15] = objc_msgSend(v27, "numberWithFloat:");
  v35[16] = @"inputFacesGainMultip";
  v28 = NSNumber;
  SDOFFaceMaskValue(@"gainMultip", self->tuningParameters);
  v36[16] = objc_msgSend(v28, "numberWithFloat:");
  v35[17] = @"inputApertureScaling";
  uint64_t v29 = [NSNumber numberWithDouble:v12];
  v30 = &unk_1EE4AB000;
  if (v19) {
    v30 = v19;
  }
  v36[17] = v29;
  v36[18] = v30;
  tuningParameters = self->tuningParameters;
  v35[18] = @"__inputVersion";
  v35[19] = @"inputTuningParameters";
  if (tuningParameters) {
    v32 = tuningParameters;
  }
  else {
    v32 = (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
  v36[19] = v32;
  uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:20];
  if ([v19 integerValue] < 3) {
    return (id)[a3 imageByApplyingFilter:@"CIFaceMaskCalculator" withInputParameters:v33];
  }
  else {
    return (id)[a3 metalImageByApplyingFilter:@"CIFaceMaskCalculator" withInputParameters:v33];
  }
}

- (id)faceMaskApply:(id)a3 blurMap:(id)a4
{
  void v15[6] = *MEMORY[0x1E4F143B8];
  [a4 extent];
  double v8 = v7;
  [a4 extent];
  double v10 = v9;
  v15[0] = a3;
  v14[0] = @"inputParameterImage";
  v14[1] = @"inputFacesCenterX";
  v15[1] = transformNormalizedMetalToCI(self->inputFaceMidPoint, 0, v8);
  v14[2] = @"inputFacesCenterY";
  v15[2] = transformNormalizedMetalToCI(self->inputFaceMidPoint, 1u, v10);
  v14[3] = @"inputFacesChinX";
  v15[3] = transformNormalizedMetalToCI(self->inputChinPosition, 0, v8);
  v14[4] = @"inputFacesChinY";
  double v11 = transformNormalizedMetalToCI(self->inputChinPosition, 1u, v10);
  v14[5] = @"inputTuningParameters";
  tuningParameters = self->tuningParameters;
  if (!tuningParameters) {
    tuningParameters = (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
  v15[4] = v11;
  v15[5] = tuningParameters;
  return (id)objc_msgSend(a4, "imageByApplyingFilter:withInputParameters:", @"CIFaceMaskApply", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v15, v14, 6));
}

- (id)faceMaskDelta:(id)a3 extent:(CGRect)a4 parameters:(id)a5 distanceToAdd:(float *)a6
{
  v15[21] = *MEMORY[0x1E4F143B8];
  v15[0] = a3;
  v14[0] = @"inputParameterImage";
  v14[1] = @"inputImageSize";
  v15[1] = +[CIVector vectorWithX:a4.size.width Y:a4.size.height];
  v14[2] = @"inputFacesCenterX";
  v15[2] = transformNormalizedMetalToCI(self->inputFaceMidPoint, 0, 1.0);
  v14[3] = @"inputFacesCenterY";
  v15[3] = transformNormalizedMetalToCI(self->inputFaceMidPoint, 1u, 1.0);
  v14[4] = @"inputFacesChinX";
  v15[4] = transformNormalizedMetalToCI(self->inputChinPosition, 0, 1.0);
  v14[5] = @"inputFacesChinY";
  v15[5] = transformNormalizedMetalToCI(self->inputChinPosition, 1u, 1.0);
  void v14[6] = @"inputFacesLeftEyeX";
  void v15[6] = transformNormalizedMetalToCI(self->inputLeftEyePosition, 0, 1.0);
  v14[7] = @"inputFacesLeftEyeY";
  void v15[7] = transformNormalizedMetalToCI(self->inputLeftEyePosition, 1u, 1.0);
  v14[8] = @"inputFacesRightEyeX";
  v15[8] = transformNormalizedMetalToCI(self->inputRightEyePosition, 0, 1.0);
  v14[9] = @"inputFacesRightEyeY";
  v15[9] = transformNormalizedMetalToCI(self->inputRightEyePosition, 1u, 1.0);
  v14[10] = @"inputDistanceAdd";
  v15[10] = objc_msgSend(a5, "objectForKeyedSubscript:");
  v14[11] = @"inputAdditiveMaxBlur";
  v15[11] = [a5 objectForKeyedSubscript:@"inputFaceMaskAdditiveMaxBlur"];
  v14[12] = @"inputSubtractiveMaxBlur";
  v15[12] = [a5 objectForKeyedSubscript:@"inputFaceMaskSubtractiveMaxBlur"];
  v14[13] = @"inputApertureScaling";
  v15[13] = objc_msgSend(a5, "objectForKeyedSubscript:");
  v14[14] = @"inputMaxBlur";
  v15[14] = objc_msgSend(a5, "objectForKeyedSubscript:");
  v14[15] = @"inputSubjectDistanceMinimumFocusDistance";
  v15[15] = objc_msgSend(a5, "objectForKeyedSubscript:");
  v14[16] = @"inputSubjectDistanceMaximumFocusDistance";
  v15[16] = objc_msgSend(a5, "objectForKeyedSubscript:");
  v14[17] = @"inputSubjectDistanceScalingFactor";
  v15[17] = objc_msgSend(a5, "objectForKeyedSubscript:");
  v14[18] = @"inputSubjectDistanceOffset";
  uint64_t v9 = objc_msgSend(a5, "objectForKeyedSubscript:");
  tuningParameters = self->tuningParameters;
  if (!tuningParameters) {
    tuningParameters = (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
  v15[18] = v9;
  v15[19] = tuningParameters;
  v14[19] = @"inputTuningParameters";
  v14[20] = @"inputFocusRect";
  v15[20] = self->inputFocusRect;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:21];
  [+[CIFilter filterWithName:@"CIFaceMaskDelta" withInputParameters:v11] distanceToAdd];
  *(_DWORD *)a6 = v12;
  return (id)objc_msgSend(+[CIFilter metalFilterWithName:withInputParameters:](CIFilter, "metalFilterWithName:withInputParameters:", @"CIFaceMaskDelta", v11), "outputImage");
}

- (id)smoothShiftMapV2:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(CIDepthEffectMakeBlurMap *)self upsampledShiftMap:a3];
  SDOFDisparitySmoothingParameterValue(&cfstr_Niterations.isa, self->tuningParameters);
  uint64_t v6 = @"inputNumIterations";
  v7[0] = objc_msgSend(NSNumber, "numberWithFloat:");
  return (id)objc_msgSend(v4, "imageByApplyingFilter:withInputParameters:", @"CIDisparitySmoothing", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1));
}

- (id)blurMapV2:(id)a3
{
  id v4 = [(CIDepthEffectMakeBlurMap *)self smoothShiftMapV2:a3];
  id v5 = [(CIDepthEffectMakeBlurMap *)self lensModelApply:[(CIDepthEffectMakeBlurMap *)self lensModelParams:v4] shiftMap:v4];
  if (![(CIDepthEffectMakeBlurMap *)self needToRunFaceMask]) {
    return v5;
  }
  id v6 = [(CIDepthEffectMakeBlurMap *)self faceMaskParams:v5 useNormalizedCoords:0];

  return [(CIDepthEffectMakeBlurMap *)self faceMaskApply:v6 blurMap:v5];
}

- (id)refineShiftMapV3WithMainImage:(id)a3 shiftmap:(id)a4 lensModel:(id)a5
{
  v51[9] = *MEMORY[0x1E4F143B8];
  SDOFDisparityRefinementParameterValue(&cfstr_Version.isa, self->tuningParameters);
  uint64_t v10 = *(float *)&v9;
  if (!v10) {
    goto LABEL_10;
  }
  if (v10 >= 5)
  {
    uint64_t v11 = ci_logger_api();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CIDepthEffectMakeBlurMap refineShiftMapV3WithMainImage:shiftmap:lensModel:](v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  if (self->inputMatteImage)
  {
    if (-[CIDepthEffectMakeBlurMap refineShiftMapV3WithMainImage:shiftmap:lensModel:]::onceToken != -1) {
      dispatch_once(&-[CIDepthEffectMakeBlurMap refineShiftMapV3WithMainImage:shiftmap:lensModel:]::onceToken, &__block_literal_global_555);
    }
    inputMatteImage = self->inputMatteImage;
    if (-[CIDepthEffectMakeBlurMap refineShiftMapV3WithMainImage:shiftmap:lensModel:]::useNativeFocalPlane)
    {
      v48[0] = @"inputMatteImage";
      v48[1] = @"inputLensModelCalculatorImage";
      v49[0] = inputMatteImage;
      v49[1] = a5;
      v48[2] = @"inputAlphaThreshold";
      LODWORD(v9) = 1063675494;
      v49[2] = [NSNumber numberWithFloat:v9];
      v48[3] = @"inputAmplitude";
      LODWORD(v19) = 1067030938;
      v49[3] = [NSNumber numberWithFloat:v19];
      v48[4] = @"inputExponent";
      LODWORD(v20) = 2.0;
      v49[4] = [NSNumber numberWithFloat:v20];
      v48[5] = @"inputGamma";
      LODWORD(v21) = 1053609165;
      v49[5] = [NSNumber numberWithFloat:v21];
      v48[6] = @"inputMinFactor";
      LODWORD(v22) = 1036831949;
      v49[6] = [NSNumber numberWithFloat:v22];
      v48[7] = @"inputMaxFactor";
      LODWORD(v23) = 1.0;
      v49[7] = [NSNumber numberWithFloat:v23];
      uint64_t v24 = objc_msgSend(a4, "imageByApplyingFilter:withInputParameters:", @"CIFocalPlaneNative", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v49, v48, 8));
    }
    else
    {
      v50[0] = @"inputMatteImage";
      v50[1] = @"inputFocusRect";
      inputFocusRect = self->inputFocusRect;
      v51[0] = inputMatteImage;
      v51[1] = inputFocusRect;
      v50[2] = @"inputZeroShiftPercentile";
      LODWORD(v9) = 0.75;
      v51[2] = [NSNumber numberWithFloat:v9];
      v50[3] = @"inputAlphaThreshold";
      LODWORD(v31) = 1063675494;
      v51[3] = [NSNumber numberWithFloat:v31];
      v50[4] = @"inputAmplitude";
      LODWORD(v32) = 1067030938;
      v51[4] = [NSNumber numberWithFloat:v32];
      v50[5] = @"inputExponent";
      LODWORD(v33) = 2.0;
      v51[5] = [NSNumber numberWithFloat:v33];
      v50[6] = @"inputGamma";
      LODWORD(v34) = 1053609165;
      v51[6] = [NSNumber numberWithFloat:v34];
      v50[7] = @"inputMinFactor";
      LODWORD(v35) = 1036831949;
      v51[7] = [NSNumber numberWithFloat:v35];
      v50[8] = @"inputMaxFactor";
      LODWORD(v36) = 1.0;
      v51[8] = [NSNumber numberWithFloat:v36];
      uint64_t v24 = objc_msgSend(a4, "metalImageByApplyingFilter:withInputParameters:", @"CIFocalPlane", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v51, v50, 9));
    }
    id v37 = (id)v24;
    if (!v24)
    {
      v38 = ci_logger_api();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        -[CIDepthEffectMakeBlurMap refineShiftMapV3WithMainImage:shiftmap:lensModel:]();
      }
      id v37 = a4;
    }
    uint64_t v39 = 0x32u >> (+[CIDepthBlurEffect getDraftMode:[(CIDepthEffectMakeBlurMap *)self inputDraftMode]] == 1);
    v46[0] = @"inputMainImage";
    v46[1] = @"inputPredicateImage";
    v40 = self->inputMatteImage;
    v47[0] = a3;
    v47[1] = v40;
    v46[2] = @"inputRadius";
    LODWORD(v41) = 2.0;
    v47[2] = [NSNumber numberWithFloat:v41];
    v46[3] = @"inputSubsampling";
    LODWORD(v42) = 8.0;
    v47[3] = [NSNumber numberWithFloat:v42];
    v46[4] = @"inputEPS";
    LODWORD(v43) = 953267991;
    v47[4] = [NSNumber numberWithFloat:v43];
    v46[5] = @"inputNumIterations";
    v47[5] = [NSNumber numberWithUnsignedInt:v39];
    return (id)objc_msgSend(v37, "metalImageByApplyingFilter:withInputParameters:", @"CIMattingSolver", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v47, v46, 6));
  }
  else
  {
LABEL_10:
    v44[0] = @"inputScale";
    v44[1] = @"inputMainImage";
    v45[0] = self->inputScale;
    v45[1] = a3;
    v44[2] = @"inputImage";
    v44[3] = @"inputTuningParameters";
    tuningParameters = self->tuningParameters;
    if (!tuningParameters) {
      tuningParameters = (NSDictionary *)MEMORY[0x1E4F1CC08];
    }
    v45[2] = a4;
    v45[3] = tuningParameters;
    id v26 = +[CIFilter metalFilterWithName:withInputParameters:](CIFilter, "metalFilterWithName:withInputParameters:", @"CIDisparityRefinementV3", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:4]);
    v27 = v26;
    v28 = self->inputMatteImage;
    if (v28) {
      [v26 setValue:v28 forKey:@"inputMatteImage"];
    }
    return (id)[v27 outputImage];
  }
}

uint64_t __77__CIDepthEffectMakeBlurMap_refineShiftMapV3WithMainImage_shiftmap_lensModel___block_invoke()
{
  v0 = getenv("CI_NATIVE_FOCAL_PLANE");
  if (v0) {
    uint64_t result = atoi(v0);
  }
  else {
    uint64_t result = -[CIDepthEffectMakeBlurMap refineShiftMapV3WithMainImage:shiftmap:lensModel:]::useNativeFocalPlane;
  }
  -[CIDepthEffectMakeBlurMap refineShiftMapV3WithMainImage:shiftmap:lensModel:]::useNativeFocalPlane = result != 0;
  return result;
}

- (id)blurMapV3:(id)a3 shiftmap:(id)a4 alphaImage:(id)a5
{
  v30[5] = *MEMORY[0x1E4F143B8];
  id v9 = [(CIDepthEffectMakeBlurMap *)self lensModelParams:a4];
  id v10 = [(CIDepthEffectMakeBlurMap *)self lensModelApply:v9 shiftMap:[(CIDepthEffectMakeBlurMap *)self refineShiftMapV3WithMainImage:a3 shiftmap:a4 lensModel:v9]];
  if ([(CIDepthEffectMakeBlurMap *)self needToRunFaceMask]) {
    id v10 = [(CIDepthEffectMakeBlurMap *)self faceMaskApply:[(CIDepthEffectMakeBlurMap *)self faceMaskParams:v10 useNormalizedCoords:0] blurMap:v10];
  }
  if (-[CIDepthEffectMakeBlurMap blurMapV3:shiftmap:alphaImage:]::onceToken == -1)
  {
    if (!a5) {
      return v10;
    }
  }
  else
  {
    dispatch_once(&-[CIDepthEffectMakeBlurMap blurMapV3:shiftmap:alphaImage:]::onceToken, &__block_literal_global_612);
    if (!a5) {
      return v10;
    }
  }
  if (!-[CIDepthEffectMakeBlurMap blurMapV3:shiftmap:alphaImage:]::disableSegmentationFusion)
  {
    SDOFFusionValue(&cfstr_Additivelowera.isa, self->tuningParameters);
    double v12 = v11;
    SDOFFusionValue(&cfstr_Additiveuppera.isa, self->tuningParameters);
    double v14 = v13;
    SDOFFusionValue(&cfstr_Additivemaxblu.isa, self->tuningParameters);
    uint64_t v16 = +[CIVector vectorWithX:v12 Y:v14 Z:v15];
    SDOFFusionValue(&cfstr_Subtractivelow.isa, self->tuningParameters);
    double v18 = v17;
    SDOFFusionValue(&cfstr_Subtractiveupp.isa, self->tuningParameters);
    double v20 = v19;
    SDOFFusionValue(&cfstr_Subtractivemax.isa, self->tuningParameters);
    double v22 = +[CIVector vectorWithX:v18 Y:v20 Z:v21];
    SDOFSimpleLensModelValue(@"defaultSimulatedAperture", self->tuningParameters);
    float v24 = v23;
    float simulatedAperture = self->simulatedAperture;
    double v26 = 1.0;
    if (simulatedAperture > 0.0 && v24 > 0.0) {
      double v26 = v24 / simulatedAperture;
    }
    v29[0] = @"inputMatteImage";
    v29[1] = @"inputTuningParameters";
    tuningParameters = self->tuningParameters;
    v30[0] = a5;
    v30[1] = tuningParameters;
    v29[2] = @"inputAddBlur";
    v29[3] = @"inputRemoveBlur";
    v30[2] = v16;
    v30[3] = v22;
    v29[4] = @"inputApertureScaling";
    v30[4] = [NSNumber numberWithDouble:v26];
    return (id)objc_msgSend(v10, "imageByApplyingFilter:withInputParameters:", @"CISegmentationFusion", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v30, v29, 5));
  }
  return v10;
}

uint64_t __58__CIDepthEffectMakeBlurMap_blurMapV3_shiftmap_alphaImage___block_invoke()
{
  v0 = getenv("CI_DISABLE_SEGMENTATION_FUSION");
  if (v0) {
    uint64_t result = atoi(v0);
  }
  else {
    uint64_t result = -[CIDepthEffectMakeBlurMap blurMapV3:shiftmap:alphaImage:]::disableSegmentationFusion;
  }
  -[CIDepthEffectMakeBlurMap blurMapV3:shiftmap:alphaImage:]::disableSegmentationFusion = result != 0;
  return result;
}

- (id)blurMapV4:(id)a3 shiftmap:(id)a4 alphaImage:(id)a5 hairImage:(id)a6
{
  v194[3] = *MEMORY[0x1E4F143B8];
  id v11 = [(CIDepthEffectMakeBlurMap *)self lensModelParams:a4];
  v193[0] = @"inputRVector";
  v194[0] = +[CIVector vectorWithX:0.349999994 Y:0.0 Z:0.0 W:0.0];
  v193[1] = @"inputGVector";
  v194[1] = +[CIVector vectorWithX:0.0 Y:0.349999994 Z:0.0 W:0.0];
  v193[2] = @"inputBVector";
  v194[2] = +[CIVector vectorWithX:0.0 Y:0.0 Z:0.349999994 W:0.0];
  id v12 = -[CIDepthEffectMakeBlurMap lensModelApply:shiftMap:](self, "lensModelApply:shiftMap:", v11, -[CIDepthEffectMakeBlurMap refineShiftMapV3WithMainImage:shiftmap:lensModel:](self, "refineShiftMapV3WithMainImage:shiftmap:lensModel:", objc_msgSend(a3, "imageByApplyingFilter:withInputParameters:", @"CIColorMatrix", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v194, v193, 3)), a4, v11));
  SDOFSimpleLensModelValue(@"defaultSimulatedAperture", self->tuningParameters);
  float simulatedAperture = self->simulatedAperture;
  double v187 = 1.0;
  if (simulatedAperture > 0.0 && v13 > 0.0) {
    double v187 = v13 / simulatedAperture;
  }
  if ([(CIDepthEffectMakeBlurMap *)self needToRunFaceMask])
  {
    id v183 = a6;
    id v179 = [(CIDepthEffectMakeBlurMap *)self faceMaskParams:v12 useNormalizedCoords:1];
    SDOFFusionValue(&cfstr_Additivelowera.isa, self->tuningParameters);
    double v16 = v15;
    SDOFFusionValue(&cfstr_Additiveuppera.isa, self->tuningParameters);
    double v18 = v17;
    SDOFFusionValue(&cfstr_Additivemaxblu.isa, self->tuningParameters);
    v186 = +[CIVector vectorWithX:v16 Y:v18 Z:v19];
    SDOFFusionValue(&cfstr_Subtractivelow.isa, self->tuningParameters);
    double v21 = v20;
    SDOFFusionValue(&cfstr_Subtractiveupp.isa, self->tuningParameters);
    double v23 = v22;
    SDOFFusionValue(&cfstr_Subtractivemax.isa, self->tuningParameters);
    v25 = +[CIVector vectorWithX:v21 Y:v23 Z:v24];
    SDOFBlurMapRefinementValue(&cfstr_Hairadditivelo.isa, self->tuningParameters);
    double v27 = v26;
    SDOFBlurMapRefinementValue(&cfstr_Hairadditiveup.isa, self->tuningParameters);
    double v29 = v28;
    SDOFBlurMapRefinementValue(&cfstr_Hairadditivema.isa, self->tuningParameters);
    double v31 = +[CIVector vectorWithX:v27 Y:v29 Z:v30];
    SDOFBlurMapRefinementValue(&cfstr_Hairsubtractiv.isa, self->tuningParameters);
    double v33 = v32;
    SDOFBlurMapRefinementValue(&cfstr_Hairsubtractiv_0.isa, self->tuningParameters);
    double v35 = v34;
    SDOFBlurMapRefinementValue(&cfstr_Hairsubtractiv_1.isa, self->tuningParameters);
    id v37 = +[CIVector vectorWithX:v33 Y:v35 Z:v36];
    SDOFBlurMapRefinementValue(&cfstr_Facemaskadditi.isa, self->tuningParameters);
    int v181 = v38;
    SDOFBlurMapRefinementValue(&cfstr_Facemasksubtra.isa, self->tuningParameters);
    int v182 = v39;
    SDOFBlurMapRefinementValue(&cfstr_Smoothstepmin.isa, self->tuningParameters);
    int v41 = v40;
    SDOFBlurMapRefinementValue(&cfstr_Smoothstepmax.isa, self->tuningParameters);
    int v43 = v42;
    SDOFBlurMapRefinementValue(&cfstr_Maxblur.isa, self->tuningParameters);
    LODWORD(v33) = v44;
    SDOFBlurMapRefinementValue(&cfstr_Persondistance.isa, self->tuningParameters);
    float v46 = v45;
    SDOFBlurMapRefinementValue(&cfstr_Personthreshol.isa, self->tuningParameters);
    int v48 = v47;
    SDOFBlurMapRefinementValue(&cfstr_Personmaxblur.isa, self->tuningParameters);
    int v185 = v49;
    SDOFBlurMapRefinementValue(&cfstr_Hairdistance.isa, self->tuningParameters);
    float v180 = v50;
    SDOFBlurMapRefinementValue(&cfstr_Hairthreshold.isa, self->tuningParameters);
    int v184 = v51;
    SDOFBlurMapRefinementValue(&cfstr_Hairmaxblur.isa, self->tuningParameters);
    int v153 = v52;
    SDOFBlurMapRefinementValue(&cfstr_Minimumfocusdi.isa, self->tuningParameters);
    int v157 = v53;
    SDOFBlurMapRefinementValue(&cfstr_Maximumfocusdi.isa, self->tuningParameters);
    int v158 = v54;
    SDOFBlurMapRefinementValue(&cfstr_Protectbodystr.isa, self->tuningParameters);
    LODWORD(v35) = v55;
    SDOFBlurMapRefinementValue(&cfstr_Distanceadd.isa, self->tuningParameters);
    int v152 = v56;
    SDOFBlurMapRefinementValue(&cfstr_Relativeapertu.isa, self->tuningParameters);
    int v58 = v57;
    SDOFBlurMapRefinementValue(&cfstr_Subjectdistanc.isa, self->tuningParameters);
    int v154 = v59;
    SDOFBlurMapRefinementValue(&cfstr_Subjectdistanc_0.isa, self->tuningParameters);
    int v156 = v60;
    SDOFBlurMapRefinementValue(&cfstr_Eyeprotectionm.isa, self->tuningParameters);
    unsigned int v167 = (int)v61;
    SDOFBlurMapRefinementValue(&cfstr_Eyeprotectionf_1.isa, self->tuningParameters);
    int v168 = v62;
    SDOFBlurMapRefinementValue(&cfstr_Eyeprotectionf_2.isa, self->tuningParameters);
    int v169 = v63;
    SDOFBlurMapRefinementValue(&cfstr_Eyeprotectiono.isa, self->tuningParameters);
    int v170 = v64;
    SDOFBlurMapRefinementValue(&cfstr_Eyeprotectiono_0.isa, self->tuningParameters);
    int v171 = v65;
    SDOFBlurMapRefinementValue(&cfstr_Eyeprotectiono_1.isa, self->tuningParameters);
    int v172 = v66;
    SDOFBlurMapRefinementValue(&cfstr_Eyeprotectiono_2.isa, self->tuningParameters);
    int v173 = v67;
    SDOFBlurMapRefinementValue(&cfstr_Eyeprotectiono_3.isa, self->tuningParameters);
    int v174 = v68;
    SDOFBlurMapRefinementValue(&cfstr_Eyeprotectiono_4.isa, self->tuningParameters);
    int v175 = v69;
    SDOFBlurMapRefinementValue(&cfstr_Eyeprotectionp.isa, self->tuningParameters);
    int v176 = v70;
    SDOFBlurMapRefinementValue(&cfstr_Eyeprotectionp_0.isa, self->tuningParameters);
    int v177 = v71;
    SDOFBlurMapRefinementValue(&cfstr_Eyeprotectionp_1.isa, self->tuningParameters);
    int v178 = v72;
    SDOFBlurMapRefinementValue(&cfstr_Eyeprotections.isa, self->tuningParameters);
    int v165 = v73;
    SDOFBlurMapRefinementValue(&cfstr_Eyeprotections_0.isa, self->tuningParameters);
    int v166 = v74;
    [(NSNumber *)self->inputScale floatValue];
    float v76 = v46 * v75;
    [(NSNumber *)self->inputScale floatValue];
    float v78 = v180 * v77;
    id v79 = a5;
    v80 = (void *)MEMORY[0x1E4F1CA60];
    v191[0] = @"inputApertureScaling";
    v192[0] = [NSNumber numberWithDouble:v187];
    v191[1] = @"inputFaceMaskAdditiveMaxBlur";
    LODWORD(v81) = v181;
    v192[1] = [NSNumber numberWithFloat:v81];
    v191[2] = @"inputFaceMaskSubtractiveMaxBlur";
    LODWORD(v82) = v182;
    v192[2] = [NSNumber numberWithFloat:v82];
    v191[3] = @"inputSmoothstepMin";
    int v163 = v41;
    LODWORD(v83) = v41;
    v192[3] = [NSNumber numberWithFloat:v83];
    v191[4] = @"inputSmoothstepMax";
    int v162 = v43;
    LODWORD(v84) = v43;
    v192[4] = [NSNumber numberWithFloat:v84];
    v191[5] = @"inputMaxBlur";
    int v161 = LODWORD(v33);
    LODWORD(v85) = LODWORD(v33);
    v192[5] = [NSNumber numberWithFloat:v85];
    v191[6] = @"inputRelativeApertureScalingStrength";
    int v160 = v58;
    LODWORD(v86) = v58;
    v192[6] = [NSNumber numberWithFloat:v86];
    v191[7] = @"inputPersonDistance";
    float v159 = v76;
    *(float *)&double v87 = v76;
    v192[7] = [NSNumber numberWithFloat:v87];
    v191[8] = @"inputPersonThreshold";
    int v164 = v48;
    LODWORD(v88) = v48;
    v192[8] = [NSNumber numberWithFloat:v88];
    v191[9] = @"inputPersonAdditive";
    v192[9] = v186;
    v191[10] = @"inputPersonSubtractive";
    v192[10] = v25;
    v191[11] = @"inputPersonMaxBlur";
    LODWORD(v89) = v185;
    v192[11] = [NSNumber numberWithFloat:v89];
    v191[12] = @"inputHairDistance";
    *(float *)&double v90 = v78;
    v192[12] = [NSNumber numberWithFloat:v90];
    v191[13] = @"inputHairThreshold";
    LODWORD(v91) = v184;
    v192[13] = [NSNumber numberWithFloat:v91];
    v191[14] = @"inputHairAdditive";
    v192[14] = v31;
    v191[15] = @"inputHairSubtractive";
    v192[15] = v37;
    v191[16] = @"inputHairMaxBlur";
    v192[16] = objc_msgSend(NSNumber, "numberWithFloat:");
    v191[17] = @"inputProtectBodyStrength";
    int v92 = LODWORD(v35);
    LODWORD(v93) = LODWORD(v35);
    v192[17] = [NSNumber numberWithFloat:v93];
    v191[18] = @"inputDistanceAdd";
    LODWORD(v94) = v152;
    v192[18] = [NSNumber numberWithFloat:v94];
    inputLeftEyePosition = self->inputLeftEyePosition;
    v191[19] = @"inputLeftEyePosition";
    v192[19] = inputLeftEyePosition;
    v191[20] = @"inputRightEyePosition";
    v192[20] = self->inputRightEyePosition;
    v191[21] = @"inputFaceMidPoint";
    v192[21] = self->inputFaceMidPoint;
    inputChinPosition = self->inputChinPosition;
    v191[22] = @"inputChinPosition";
    v192[22] = inputChinPosition;
    v191[23] = @"inputSubjectDistanceMinimumFocusDistance";
    LODWORD(v97) = v157;
    v192[23] = [NSNumber numberWithFloat:v97];
    v191[24] = @"inputSubjectDistanceMaximumFocusDistance";
    LODWORD(v98) = v158;
    v192[24] = [NSNumber numberWithFloat:v98];
    v191[25] = @"inputSubjectDistanceScalingFactor";
    LODWORD(v99) = v154;
    v192[25] = [NSNumber numberWithFloat:v99];
    v191[26] = @"inputSubjectDistanceOffset";
    LODWORD(v100) = v156;
    v192[26] = [NSNumber numberWithFloat:v100];
    uint64_t v101 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v192 forKeys:v191 count:27];
    v102 = v80;
    v103 = v79;
    uint64_t v104 = [v102 dictionaryWithDictionary:v101];
    int v188 = 0;
    [v12 extent];
    id v105 = -[CIDepthEffectMakeBlurMap faceMaskDelta:extent:parameters:distanceToAdd:](self, "faceMaskDelta:extent:parameters:distanceToAdd:", v179, v104, &v188);
    [v12 extent];
    double v107 = v106;
    [v12 extent];
    double v110 = v109;
    inputScale = self->inputScale;
    v155 = v103;
    if (v103)
    {
      [v12 extent];
      CGFloat v113 = v112;
      CGFloat v115 = v114;
      CGFloat v117 = v116;
      CGFloat v119 = v118;
      [v103 extent];
      v196.origin.x = v120;
      v196.origin.y = v121;
      v196.size.width = v122;
      v196.size.height = v123;
      v195.origin.x = v113;
      v195.origin.y = v115;
      v195.size.width = v117;
      v195.size.height = v119;
      if (CGRectEqualToRect(v195, v196)) {
        inputScale = (NSNumber *)&unk_1EE4AB018;
      }
    }
    v124 = (void *)MEMORY[0x1E4F1CA60];
    v189[0] = @"inputImage";
    v189[1] = @"inputScale";
    v190[0] = v12;
    v190[1] = inputScale;
    v189[2] = @"inputDistanceAdd";
    LODWORD(v108) = v188;
    v190[2] = [NSNumber numberWithFloat:v108];
    v190[3] = v105;
    v189[3] = @"inputFaceMaskDeltaImage";
    v189[4] = @"inputApertureScaling";
    v190[4] = [NSNumber numberWithDouble:v187];
    v189[5] = @"inputRelativeApertureScalingStrength";
    LODWORD(v125) = v160;
    v190[5] = [NSNumber numberWithFloat:v125];
    v189[6] = @"inputSmoothstepMin";
    LODWORD(v126) = v163;
    v190[6] = [NSNumber numberWithFloat:v126];
    v189[7] = @"inputSmoothstepMax";
    LODWORD(v127) = v162;
    v190[7] = [NSNumber numberWithFloat:v127];
    v189[8] = @"inputMaxBlur";
    LODWORD(v128) = v161;
    v190[8] = [NSNumber numberWithFloat:v128];
    v189[9] = @"inputPersonDistance";
    *(float *)&double v129 = v159;
    v190[9] = [NSNumber numberWithFloat:v129];
    v189[10] = @"inputPersonThreshold";
    LODWORD(v130) = v164;
    v190[10] = [NSNumber numberWithFloat:v130];
    v190[11] = v186;
    v189[11] = @"inputPersonAdditive";
    v189[12] = @"inputPersonSubtractive";
    v190[12] = v25;
    v189[13] = @"inputPersonMaxBlur";
    LODWORD(v131) = v185;
    v190[13] = [NSNumber numberWithFloat:v131];
    v189[14] = @"inputHairDistance";
    *(float *)&double v132 = v78;
    v190[14] = [NSNumber numberWithFloat:v132];
    v189[15] = @"inputHairThreshold";
    LODWORD(v133) = v184;
    v190[15] = [NSNumber numberWithFloat:v133];
    v190[16] = v31;
    v189[16] = @"inputHairAdditive";
    v189[17] = @"inputHairSubtractive";
    v190[17] = v37;
    v189[18] = @"inputHairMaxBlur";
    LODWORD(v134) = v153;
    v190[18] = [NSNumber numberWithFloat:v134];
    v189[19] = @"inputProtectBodyStrength";
    LODWORD(v135) = v92;
    v190[19] = [NSNumber numberWithFloat:v135];
    v189[20] = @"inputLeftEyeX";
    v190[20] = transformNormalizedMetalToCI(self->inputLeftEyePosition, 0, v107);
    v189[21] = @"inputLeftEyeY";
    v190[21] = transformNormalizedMetalToCI(self->inputLeftEyePosition, 1u, v110);
    v189[22] = @"inputRightEyeX";
    v190[22] = transformNormalizedMetalToCI(self->inputRightEyePosition, 0, v107);
    v189[23] = @"inputRightEyeY";
    v190[23] = transformNormalizedMetalToCI(self->inputRightEyePosition, 1u, v110);
    v189[24] = @"inputFaceMidPointX";
    v190[24] = transformNormalizedMetalToCI(self->inputFaceMidPoint, 0, v107);
    v189[25] = @"inputFaceMidPointY";
    v190[25] = transformNormalizedMetalToCI(self->inputFaceMidPoint, 1u, v110);
    v189[26] = @"inputEyeProtectionMaxFaces";
    v190[26] = [NSNumber numberWithInt:v167];
    v189[27] = @"inputEyeProtectionFaceWeightsSmoothStepMin";
    LODWORD(v136) = v168;
    v190[27] = [NSNumber numberWithFloat:v136];
    v189[28] = @"inputEyeProtectionFaceWeightsSmoothStepMax";
    LODWORD(v137) = v169;
    v190[28] = [NSNumber numberWithFloat:v137];
    v189[29] = @"inputEyeProtectionOvalDimsDistanceScale";
    LODWORD(v138) = v170;
    v190[29] = [NSNumber numberWithFloat:v138];
    v189[30] = @"inputEyeProtectionOvalDimsDistanceOffset";
    LODWORD(v139) = v171;
    v190[30] = [NSNumber numberWithFloat:v139];
    v189[31] = @"inputEyeProtectionOvalDimsRadiusHorizontal";
    LODWORD(v140) = v172;
    v190[31] = [NSNumber numberWithFloat:v140];
    v189[32] = @"inputEyeProtectionOvalDimsRadiusVertical";
    LODWORD(v141) = v173;
    v190[32] = [NSNumber numberWithFloat:v141];
    v189[33] = @"inputEyeProtectionOvalFallOffSmoothStepMin";
    LODWORD(v142) = v174;
    v190[33] = [NSNumber numberWithFloat:v142];
    v189[34] = @"inputEyeProtectionOvalFallOffSmoothStepMax";
    LODWORD(v143) = v175;
    v190[34] = [NSNumber numberWithFloat:v143];
    v189[35] = @"inputEyeProtectionPersonMaskSmoothStepMin";
    LODWORD(v144) = v176;
    v190[35] = [NSNumber numberWithFloat:v144];
    v189[36] = @"inputEyeProtectionPersonMaskSmoothStepMax";
    LODWORD(v145) = v177;
    v190[36] = [NSNumber numberWithFloat:v145];
    v189[37] = @"inputEyeProtectionPreventStrength";
    LODWORD(v146) = v178;
    v190[37] = [NSNumber numberWithFloat:v146];
    v189[38] = @"inputEyeProtectionSubtractiveMaxBlur";
    LODWORD(v147) = v165;
    v190[38] = [NSNumber numberWithFloat:v147];
    v189[39] = @"inputEyeProtectionSubtractiveApertureScaling";
    LODWORD(v148) = v166;
    v190[39] = [NSNumber numberWithFloat:v148];
    v149 = objc_msgSend(v124, "dictionaryWithDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v190, v189, 40));
    v150 = v149;
    if (v155) {
      [v149 setObject:v155 forKeyedSubscript:@"inputPersonAlpha"];
    }
    if (v183) {
      [v150 setObject:v183 forKeyedSubscript:@"inputHairAlpha"];
    }
    return (id)[v12 metalImageByApplyingFilter:@"CIModifyBlurmap" withInputParameters:v150];
  }
  return v12;
}

- (id)unifiedRenderingOutputImage:(CGImageMetadata *)a3
{
  v117[4] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    CFTypeID TypeID = CGImageMetadataGetTypeID();
    if (TypeID == CFGetTypeID(a3))
    {
      inputImage = self->inputImage;
      id RenderingParametersFromCGImageMetadata = getRenderingParametersFromCGImageMetadata(a3);
      if (RenderingParametersFromCGImageMetadata)
      {
        double v89 = inputImage;
        [(CIVector *)self->inputFocusRect CGRectValue];
        double v8 = v7;
        double v10 = v9;
        double v12 = v11;
        double v14 = v13;
        p_inputFaceMidPoint = &self->inputFaceMidPoint;
        size_t v16 = [(CIVector *)self->inputFaceMidPoint count];
        p_inputChinPosition = &self->inputChinPosition;
        size_t v18 = [(CIVector *)self->inputChinPosition count];
        p_inputLeftEyePosition = &self->inputLeftEyePosition;
        unint64_t v20 = [(CIVector *)self->inputLeftEyePosition count];
        p_inputRightEyePosition = &self->inputRightEyePosition;
        if (v20 >= [(CIVector *)self->inputRightEyePosition count]) {
          uint64_t v22 = 144;
        }
        else {
          uint64_t v22 = 136;
        }
        double v90 = self;
        unint64_t v23 = [*(id *)((char *)&self->super.super.isa + v22) count];
        float v24 = &self->inputChinPosition;
        if (v18 >= v23)
        {
          unint64_t v25 = [(CIVector *)*p_inputLeftEyePosition count];
          if (v25 >= [(CIVector *)*p_inputRightEyePosition count]) {
            float v24 = &self->inputRightEyePosition;
          }
          else {
            float v24 = &self->inputLeftEyePosition;
          }
        }
        unint64_t v26 = [(CIVector *)*v24 count];
        double v27 = &self->inputFaceMidPoint;
        if (v16 >= v26)
        {
          unint64_t v28 = [(CIVector *)*p_inputChinPosition count];
          unint64_t v29 = [(CIVector *)*p_inputLeftEyePosition count];
          float v30 = (id *)(v29 >= [(CIVector *)*p_inputRightEyePosition count]
                     ? &self->inputRightEyePosition
                     : &self->inputLeftEyePosition);
          unint64_t v31 = [*v30 count];
          double v27 = &self->inputChinPosition;
          if (v28 >= v31)
          {
            unint64_t v32 = [(CIVector *)*p_inputLeftEyePosition count];
            if (v32 >= [(CIVector *)*p_inputRightEyePosition count]) {
              double v27 = &self->inputRightEyePosition;
            }
            else {
              double v27 = &self->inputLeftEyePosition;
            }
          }
        }
        unint64_t v33 = [(CIVector *)*v27 count] >> 1;
        if (v33 >= 4) {
          unint64_t v33 = 4;
        }
        if (v33)
        {
          uint64_t v34 = 0;
          unint64_t v88 = v33;
          uint64_t v92 = 2 * v33;
          double v35 = (float64x2_t *)&v114;
          float v36 = (float64x2_t *)&v112;
          id v37 = (float64x2_t *)&v110;
          int v38 = (float64x2_t *)&v108;
          do
          {
            -[CIVector valueAtIndex:](*p_inputFaceMidPoint, "valueAtIndex:", v34, v88);
            float64_t v93 = v39;
            [(CIVector *)*p_inputFaceMidPoint valueAtIndex:v34 + 1];
            v40.f64[0] = v93;
            v40.f64[1] = v41;
            *v35++ = vcvtq_f64_f32(vcvt_f32_f64(v40));
            [(CIVector *)*p_inputLeftEyePosition valueAtIndex:v34];
            float64_t v94 = v42;
            [(CIVector *)*p_inputLeftEyePosition valueAtIndex:v34 + 1];
            v43.f64[0] = v94;
            v43.f64[1] = v44;
            *v36++ = vcvtq_f64_f32(vcvt_f32_f64(v43));
            [(CIVector *)*p_inputRightEyePosition valueAtIndex:v34];
            float64_t v95 = v45;
            [(CIVector *)*p_inputRightEyePosition valueAtIndex:v34 + 1];
            v46.f64[0] = v95;
            v46.f64[1] = v47;
            *v37++ = vcvtq_f64_f32(vcvt_f32_f64(v46));
            [(CIVector *)*p_inputChinPosition valueAtIndex:v34];
            float64_t v96 = v48;
            [(CIVector *)*p_inputChinPosition valueAtIndex:v34 + 1];
            v49.f64[0] = v96;
            v49.f64[1] = v50;
            *v38++ = vcvtq_f64_f32(vcvt_f32_f64(v49));
            v34 += 2;
          }
          while (v92 != v34);
          int v51 = v90;
          [(CIDepthEffectMakeBlurMap *)v90 intrinsicMatrixFocalLength];
          int v53 = v52;
          unint64_t v54 = v88;
          if (v88)
          {
            int v55 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:v88];
            int v56 = (double *)&v115;
            int v57 = (double *)&v109;
            int v58 = (double *)&v113;
            int v59 = (double *)&v111;
            do
            {
              v116[0] = @"centerPos";
              v117[0] = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", *(v56 - 1), *v56);
              v116[1] = @"leftEyeCenterPos";
              v117[1] = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", *(v58 - 1), *v58);
              v116[2] = @"rightEyeCenterPos";
              v117[2] = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", *(v59 - 1), *v59);
              v116[3] = @"chinCenterPos";
              v117[3] = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", *(v57 - 1), *v57);
              uint64_t v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v117 forKeys:v116 count:4];
              if (CCPBundleEnvar(void)::onceToken != -1) {
                dispatch_once(&CCPBundleEnvar(void)::onceToken, &__block_literal_global_1246);
              }
              float v61 = (objc_class *)[(id)CCPBundleEnvar(void)::b classNamed:@"CCFacePoints"];
              if (!v61)
              {
                uint64_t v102 = 0;
                v103 = &v102;
                uint64_t v104 = 0x3052000000;
                id v105 = __Block_byref_object_copy__20;
                double v106 = __Block_byref_object_dispose__20;
                float v61 = (objc_class *)getCCFacePointsClass(void)::softClass;
                uint64_t v107 = getCCFacePointsClass(void)::softClass;
                if (!getCCFacePointsClass(void)::softClass)
                {
                  uint64_t v97 = MEMORY[0x1E4F143A8];
                  uint64_t v98 = 3221225472;
                  double v99 = ___ZL20getCCFacePointsClassv_block_invoke;
                  double v100 = &unk_1E57710B8;
                  uint64_t v101 = &v102;
                  ___ZL20getCCFacePointsClassv_block_invoke((uint64_t)&v97);
                  float v61 = (objc_class *)v103[5];
                }
                _Block_object_dispose(&v102, 8);
              }
              int v62 = (void *)[[v61 alloc] initWithDictionary:v60];
              if (!v62) {
                break;
              }
              [v55 addObject:v62];

              v56 += 2;
              v57 += 2;
              v58 += 2;
              v59 += 2;
              --v54;
            }
            while (v54);
            uint64_t v64 = [MEMORY[0x1E4F1C978] arrayWithArray:v55];
            goto LABEL_41;
          }
        }
        else
        {
          int v51 = self;
          [(CIDepthEffectMakeBlurMap *)self intrinsicMatrixFocalLength];
          int v53 = v65;
        }
        uint64_t v64 = MEMORY[0x1E4F1CBF0];
LABEL_41:
        [(NSNumber *)v51->inputAperture floatValue];
        int v67 = v66;
        [(NSNumber *)v51->inputScale floatValue];
        int v69 = v68;
        inputShiftmapImage = v51->inputShiftmapImage;
        inputMatteImage = v51->inputMatteImage;
        inputHairImage = v51->inputHairImage;
        inputGlassesImage = v51->inputGlassesImage;
        inputGainMap = v51->inputGainMap;
        inputCaptureFolderMiscPath = v51->inputCaptureFolderMiscPath;
        float v76 = +[CIImage emptyImage];
        float v77 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
        [v77 setObject:MEMORY[0x1E4F1CC08] forKeyedSubscript:@"options"];
        [v77 setObject:RenderingParametersFromCGImageMetadata forKeyedSubscript:@"metadata"];
        LODWORD(v78) = v67;
        objc_msgSend(v77, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v78), @"simulatedAperture");
        LODWORD(v79) = v53;
        objc_msgSend(v77, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v79), @"focalLengthInPixels");
        LODWORD(v80) = 1022739087;
        objc_msgSend(v77, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v80), @"maxBlur");
        LODWORD(v81) = v69;
        objc_msgSend(v77, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v81), @"inputScale");
        objc_msgSend(v77, "setObject:forKeyedSubscript:", +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v8, v10, v12, v14), @"focusWindow");
        [v77 setObject:v64 forKeyedSubscript:@"facePoints"];
        [v77 setObject:v89 forKeyedSubscript:@"inputImage"];
        [v77 setObject:0 forKeyedSubscript:@"inputImageLuma"];
        [v77 setObject:0 forKeyedSubscript:@"inputImageChroma"];
        [v77 setObject:inputShiftmapImage forKeyedSubscript:@"inputShiftMap"];
        [v77 setObject:inputMatteImage forKeyedSubscript:@"inputSegmentation"];
        [v77 setObject:inputHairImage forKeyedSubscript:@"inputHair"];
        [v77 setObject:inputGlassesImage forKeyedSubscript:@"inputGlasses"];
        [v77 setObject:inputGainMap forKeyedSubscript:@"inputGainMap"];
        if (inputCaptureFolderMiscPath) {
          [v77 setObject:inputCaptureFolderMiscPath forKeyedSubscript:@"captureFolderMiscPath"];
        }
        if (CCPBundleEnvar(void)::onceToken != -1) {
          dispatch_once(&CCPBundleEnvar(void)::onceToken, &__block_literal_global_1246);
        }
        double v82 = (objc_class *)[(id)CCPBundleEnvar(void)::b classNamed:@"CCMakeBlurMapArgs"];
        if (!v82)
        {
          uint64_t v102 = 0;
          v103 = &v102;
          uint64_t v104 = 0x3052000000;
          id v105 = __Block_byref_object_copy__20;
          double v106 = __Block_byref_object_dispose__20;
          double v82 = (objc_class *)getCCMakeBlurMapArgsClass(void)::softClass;
          uint64_t v107 = getCCMakeBlurMapArgsClass(void)::softClass;
          if (!getCCMakeBlurMapArgsClass(void)::softClass)
          {
            uint64_t v97 = MEMORY[0x1E4F143A8];
            uint64_t v98 = 3221225472;
            double v99 = ___ZL25getCCMakeBlurMapArgsClassv_block_invoke;
            double v100 = &unk_1E57710B8;
            uint64_t v101 = &v102;
            ___ZL25getCCMakeBlurMapArgsClassv_block_invoke((uint64_t)&v97);
            double v82 = (objc_class *)v103[5];
          }
          _Block_object_dispose(&v102, 8);
        }
        id v83 = [v82 alloc];
        double v84 = objc_msgSend(v83, "initWithDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithDictionary:", v77));
        if (v84)
        {
          if (CCPBundleEnvar(void)::onceToken != -1) {
            dispatch_once(&CCPBundleEnvar(void)::onceToken, &__block_literal_global_1246);
          }
          double v85 = (objc_class *)[(id)CCPBundleEnvar(void)::b classNamed:@"CCMakeBlurMap"];
          if (!v85)
          {
            uint64_t v102 = 0;
            v103 = &v102;
            uint64_t v104 = 0x3052000000;
            id v105 = __Block_byref_object_copy__20;
            double v106 = __Block_byref_object_dispose__20;
            double v85 = (objc_class *)getCCMakeBlurMapClass(void)::softClass;
            uint64_t v107 = getCCMakeBlurMapClass(void)::softClass;
            if (!getCCMakeBlurMapClass(void)::softClass)
            {
              uint64_t v97 = MEMORY[0x1E4F143A8];
              uint64_t v98 = 3221225472;
              double v99 = ___ZL21getCCMakeBlurMapClassv_block_invoke;
              double v100 = &unk_1E57710B8;
              uint64_t v101 = &v102;
              ___ZL21getCCMakeBlurMapClassv_block_invoke((uint64_t)&v97);
              double v85 = (objc_class *)v103[5];
            }
            _Block_object_dispose(&v102, 8);
          }
          double v86 = (void *)[[v85 alloc] initWithMetalQueue:0];
          double v87 = v86;
          if (v86)
          {
            float v76 = (CIImage *)[v86 imageUsingArgs:v84];
          }
        }

        if (!v76) {
          return +[CIImage emptyImage];
        }
        return v76;
      }
    }
  }

  return +[CIImage emptyImage];
}

- (id)outputImage
{
  v24[3] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage || !self->inputShiftmapImage) {
    return 0;
  }
  unint64_t v3 = (const CGImageMetadata *)metadataFromValue(self->inputAuxDataMetadata);
  if (v3
    || (inputShiftmapImage = self->inputShiftmapImage) != 0
    && [(CIImage *)self->inputShiftmapImage properties]
    && (double v7 = [(CIImage *)inputShiftmapImage properties],
        (unint64_t v3 = [(NSDictionary *)v7 objectForKeyedSubscript:*MEMORY[0x1E4F2F380]]) != 0))
  {
    inputAuxDataMetadata = (NSDictionary *)tuningParametersFromMetaData(v3);
  }
  else
  {
    inputAuxDataMetadata = (NSDictionary *)tuningParametersFromImage(self->inputShiftmapImage);
    unint64_t v3 = 0;
  }
  if (!inputAuxDataMetadata) {
    inputAuxDataMetadata = (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
  self->tuningParameters = inputAuxDataMetadata;
  if (self->inputAuxDataMetadata)
  {
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(self->inputAuxDataMetadata))
    {
      inputAuxDataMetadata = (NSDictionary *)self->inputAuxDataMetadata;
      self->tuningParameters = inputAuxDataMetadata;
    }
    else
    {
      inputAuxDataMetadata = self->tuningParameters;
    }
  }
  id v9 = [(NSDictionary *)inputAuxDataMetadata objectForKeyedSubscript:@"Version"];
  double v10 = NSNumber;
  if (v9) {
    uint64_t v11 = [v9 unsignedIntegerValue];
  }
  else {
    uint64_t v11 = 1;
  }
  double v12 = (void *)[v10 numberWithUnsignedInteger:v11];
  int v13 = [v12 intValue];
  if (v13 < +[CIFilter minSDOFRenderingVersionSupported])
  {
    getSimulatedAperture(self->inputShiftmapImage, v3, self->inputAperture, self->tuningParameters);
    self->float simulatedAperture = v14;
    float v15 = [(CIImage *)self->inputImage imageByColorMatchingWorkingSpaceToColorSpace:linearP3ColorSpace()];
    if (!v12 || (size_t v16 = v15, v17 = [v12 integerValue], v17 == 1))
    {
      id v18 = [(CIDepthEffectMakeBlurMap *)self blurMapV2:self->inputShiftmapImage];
      goto LABEL_32;
    }
    if (v17 == 2)
    {
      id v18 = [(CIDepthEffectMakeBlurMap *)self blurMapV3:v16 shiftmap:self->inputShiftmapImage alphaImage:self->inputMatteImage];
      goto LABEL_32;
    }
    if (v17 == 3)
    {
      id v18 = [(CIDepthEffectMakeBlurMap *)self blurMapV4:v16 shiftmap:self->inputShiftmapImage alphaImage:self->inputMatteImage hairImage:self->inputHairImage];
LABEL_32:
      unint64_t v20 = v18;
      tuningParameters = self->tuningParameters;
      v23[0] = @"inputTuningParameters";
      v23[1] = @"inputScale";
      inputScale = self->inputScale;
      v24[0] = tuningParameters;
      v24[1] = inputScale;
      v23[2] = @"inputDraftMode";
      v24[2] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", +[CIDepthBlurEffect getDraftMode:](CIDepthBlurEffect, "getDraftMode:", -[CIDepthEffectMakeBlurMap inputDraftMode](self, "inputDraftMode")));
      return (id)objc_msgSend((id)objc_msgSend(v20, "imageByApplyingFilter:withInputParameters:", @"CIBlurmapSmoothing", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v24, v23, 3)), "_imageByRenderingToIntermediate");
    }
    return self->inputShiftmapImage;
  }
  int v19 = [v12 intValue];
  if (v19 > +[CIFilter maxSDOFRenderingVersionSupported]) {
    return self->inputShiftmapImage;
  }

  return [(CIDepthEffectMakeBlurMap *)self unifiedRenderingOutputImage:v3];
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputShiftmapImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputShiftmapImage:(id)a3
{
}

- (CIImage)inputMatteImage
{
  return (CIImage *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputMatteImage:(id)a3
{
}

- (CIImage)inputHairImage
{
  return (CIImage *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputHairImage:(id)a3
{
}

- (CIImage)inputGlassesImage
{
  return (CIImage *)objc_getProperty(self, a2, 112, 1);
}

- (void)setInputGlassesImage:(id)a3
{
}

- (CIImage)inputGainMap
{
  return (CIImage *)objc_getProperty(self, a2, 120, 1);
}

- (void)setInputGainMap:(id)a3
{
}

- (NSNumber)inputAperture
{
  return self->inputAperture;
}

- (void)setInputAperture:(id)a3
{
}

- (CIVector)inputLeftEyePosition
{
  return (CIVector *)objc_getProperty(self, a2, 136, 1);
}

- (void)setInputLeftEyePosition:(id)a3
{
}

- (CIVector)inputRightEyePosition
{
  return (CIVector *)objc_getProperty(self, a2, 144, 1);
}

- (void)setInputRightEyePosition:(id)a3
{
}

- (CIVector)inputChinPosition
{
  return (CIVector *)objc_getProperty(self, a2, 152, 1);
}

- (void)setInputChinPosition:(id)a3
{
}

- (CIVector)inputFaceMidPoint
{
  return (CIVector *)objc_getProperty(self, a2, 160, 1);
}

- (void)setInputFaceMidPoint:(id)a3
{
}

- (CIVector)inputFocusRect
{
  return self->inputFocusRect;
}

- (void)setInputFocusRect:(id)a3
{
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
}

- (id)inputAuxDataMetadata
{
  return self->inputAuxDataMetadata;
}

- (void)setInputAuxDataMetadata:(id)a3
{
}

- (AVCameraCalibrationData)inputCalibrationData
{
  return self->inputCalibrationData;
}

- (void)setInputCalibrationData:(id)a3
{
}

- (NSNumber)inputDraftMode
{
  return self->inputDraftMode;
}

- (void)setInputDraftMode:(id)a3
{
}

- (NSString)inputCaptureFolderMiscPath
{
  return self->inputCaptureFolderMiscPath;
}

- (void)setInputCaptureFolderMiscPath:(id)a3
{
}

- (void)refineShiftMapV3WithMainImage:shiftmap:lensModel:.cold.1()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_2(&dword_193671000, v0, v1, "Unable to run CIFocalPlane", v2, v3, v4, v5, v6);
}

- (void)refineShiftMapV3WithMainImage:(uint64_t)a3 shiftmap:(uint64_t)a4 lensModel:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_2(&dword_193671000, a2, a3, "Unsupported disparity refinement configuration = %d", a5, a6, a7, a8, 0);
}

@end