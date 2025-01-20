@interface CIDepthBlurEffect
+ (CGImageMetadata)augmentMetadataWithRenderingPropertiesForImage:(id)a3;
+ (CGImageMetadata)metadataFromDictionary:(id)a3 metadata:(CGImageMetadata *)a4;
+ (CGImageMetadata)replaceRenderingParameters:(CGImageMetadata *)a3 tuningParameters:(id)a4;
+ (id)customAttributes;
+ (id)tuningParametersFromMetadata:(CGImageMetadata *)a3;
+ (int)getDraftMode:(id)a3;
- (AVCameraCalibrationData)inputCalibrationData;
- (CIImage)inputDisparityImage;
- (CIImage)inputGainMap;
- (CIImage)inputGlassesImage;
- (CIImage)inputHairImage;
- (CIImage)inputImage;
- (CIImage)inputMatteImage;
- (CIVector)inputChinPositions;
- (CIVector)inputFocusRect;
- (CIVector)inputLeftEyePositions;
- (CIVector)inputNosePositions;
- (CIVector)inputRightEyePositions;
- (NSNumber)inputAperture;
- (NSNumber)inputLumaNoiseScale;
- (NSNumber)inputScaleFactor;
- (NSString)inputShape;
- (id)_getFocusRect:(id)a3 focusRect:(id)a4;
- (id)inputAuxDataMetadata;
- (id)outputImage;
- (void)prewarm:(id)a3;
- (void)setInputAperture:(id)a3;
- (void)setInputAuxDataMetadata:(id)a3;
- (void)setInputCalibrationData:(id)a3;
- (void)setInputChinPositions:(id)a3;
- (void)setInputDisparityImage:(id)a3;
- (void)setInputFocusRect:(id)a3;
- (void)setInputGainMap:(id)a3;
- (void)setInputGlassesImage:(id)a3;
- (void)setInputHairImage:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputLeftEyePositions:(id)a3;
- (void)setInputLumaNoiseScale:(id)a3;
- (void)setInputMatteImage:(id)a3;
- (void)setInputNosePositions:(id)a3;
- (void)setInputRightEyePositions:(id)a3;
- (void)setInputScaleFactor:(id)a3;
- (void)setInputShape:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation CIDepthBlurEffect

- (void)prewarm:(id)a3
{
  ((void (*)(CIDepthBlurEffect *, SEL, id))MEMORY[0x1F4188790])(self, a2, a3);
  uint64_t v4 = v3;
  v38[3] = *MEMORY[0x1E4F143B8];
  if ((CI_SKIP_PREWARMING_SDOF_RENDERING() & 1) == 0)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___ZL23prewarmSDOFFilterGraphsP9CIContext_block_invoke;
    block[3] = &unk_1E57710E0;
    block[4] = MEMORY[0x1E4F1CBF0];
    block[5] = v4;
    if (prewarmSDOFFilterGraphs(CIContext *)::onceToken != -1) {
      dispatch_once(&prewarmSDOFFilterGraphs(CIContext *)::onceToken, block);
    }
    v37[0] = @"working_format";
    v38[0] = [NSNumber numberWithInt:2054];
    v38[1] = MEMORY[0x1E4F1CC28];
    v37[1] = @"kCIContextCacheIntermediates";
    v37[2] = @"kCIContextUseMetalRenderer";
    v38[2] = MEMORY[0x1E4F1CC38];
    v16 = +[CIContext contextWithOptions:](CIContext, "contextWithOptions:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:3]);
    v15 = +[CIContext defaultWorkingColorSpace];
    uint64_t v14 = [MEMORY[0x1E4F1CA58] dataWithLength:0x10000];
    v5 = +[CIImage imageWithBitmapData:bytesPerRow:size:format:colorSpace:](CIImage, "imageWithBitmapData:bytesPerRow:size:format:colorSpace:", v14, 512, 2054, v15, 128.0, 128.0);
    bzero(v36, 0x10000uLL);
    v6 = [[CIRenderDestination alloc] initWithBitmapData:v36 width:128 height:128 bytesPerRow:512 format:2054];
    bzero(v35, 0x8000uLL);
    v17 = [[CIRenderDestination alloc] initWithBitmapData:v35 width:128 height:128 bytesPerRow:256 format:2053];
    v33[0] = @"inputWidth";
    v33[1] = @"inputHeight";
    v34[0] = &unk_1EE4AB090;
    v34[1] = &unk_1EE4AB090;
    v7 = -[CIImage imageByApplyingFilter:withInputParameters:](v5, "imageByApplyingFilter:withInputParameters:", @"CIMorphologyRectangleMinimum", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2]);
    v31[0] = @"inputWidth";
    v31[1] = @"inputHeight";
    v32[0] = &unk_1EE4AB090;
    v32[1] = &unk_1EE4AB090;
    v8 = -[CIImage imageByApplyingFilter:withInputParameters:](v7, "imageByApplyingFilter:withInputParameters:", @"CIMorphologyRectangleMaximum", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2]);
    v29[0] = @"inputWidth";
    v29[1] = @"inputHeight";
    v30[0] = &unk_1EE4AB060;
    v30[1] = &unk_1EE4AB060;
    v9 = -[CIImage imageByApplyingFilter:withInputParameters:](v8, "imageByApplyingFilter:withInputParameters:", @"CIMorphologyRectangleMinimum", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2]);
    v27[0] = @"inputWidth";
    v27[1] = @"inputHeight";
    v28[0] = &unk_1EE4AB060;
    v28[1] = &unk_1EE4AB060;
    -[CIContext startTaskToRender:toDestination:error:](v16, "startTaskToRender:toDestination:error:", -[CIImage imageByApplyingFilter:withInputParameters:](v9, "imageByApplyingFilter:withInputParameters:", @"CIMorphologyRectangleMaximum", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2]), v6, 0);

    v10 = +[CIImage imageWithBitmapData:bytesPerRow:size:format:colorSpace:](CIImage, "imageWithBitmapData:bytesPerRow:size:format:colorSpace:", v14, 256, 2053, v15, 128.0, 128.0);
    v25[0] = @"inputWidth";
    v25[1] = @"inputHeight";
    v26[0] = &unk_1EE4AB090;
    v26[1] = &unk_1EE4AB090;
    v11 = -[CIImage imageByApplyingFilter:withInputParameters:](v10, "imageByApplyingFilter:withInputParameters:", @"CIMorphologyRectangleMinimum", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2]);
    v23[0] = @"inputWidth";
    v23[1] = @"inputHeight";
    v24[0] = &unk_1EE4AB090;
    v24[1] = &unk_1EE4AB090;
    v12 = -[CIImage imageByApplyingFilter:withInputParameters:](v11, "imageByApplyingFilter:withInputParameters:", @"CIMorphologyRectangleMaximum", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2]);
    v21[0] = @"inputWidth";
    v21[1] = @"inputHeight";
    v22[0] = &unk_1EE4AB060;
    v22[1] = &unk_1EE4AB060;
    v13 = -[CIImage imageByApplyingFilter:withInputParameters:](v12, "imageByApplyingFilter:withInputParameters:", @"CIMorphologyRectangleMinimum", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2]);
    v19[0] = @"inputWidth";
    v19[1] = @"inputHeight";
    v20[0] = &unk_1EE4AB060;
    v20[1] = &unk_1EE4AB060;
    -[CIContext startTaskToRender:toDestination:error:](v16, "startTaskToRender:toDestination:error:", -[CIImage imageByApplyingFilter:withInputParameters:](v13, "imageByApplyingFilter:withInputParameters:", @"CIMorphologyRectangleMaximum", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2]), v17, 0);
  }
}

+ (id)customAttributes
{
  v27[14] = *MEMORY[0x1E4F143B8];
  v26[0] = @"CIAttributeFilterCategories";
  v25[0] = @"CICategoryBlur";
  v25[1] = @"CICategoryVideo";
  void v25[2] = @"CICategoryStillImage";
  v25[3] = @"CICategoryBuiltIn";
  v27[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
  v27[1] = @"11";
  v26[1] = @"CIAttributeFilterAvailable_iOS";
  void v26[2] = @"CIAttributeFilterAvailable_Mac";
  void v27[2] = @"10.13";
  v26[3] = @"inputAperture";
  v23[0] = @"CIAttributeSliderMin";
  v23[1] = @"CIAttributeSliderMax";
  v24[0] = &unk_1EE4AA280;
  v24[1] = &unk_1EE4AA290;
  void v23[2] = @"CIAttributeMin";
  v23[3] = @"CIAttributeMax";
  void v24[2] = &unk_1EE4AA270;
  v24[3] = &unk_1EE4AA290;
  v23[4] = @"CIAttributeDefault";
  v23[5] = @"CIAttributeType";
  v24[4] = &unk_1EE4AA270;
  v24[5] = @"CIAttributeTypeScalar";
  v27[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:6];
  v26[4] = @"inputLumaNoiseScale";
  v21[0] = @"CIAttributeSliderMin";
  v21[1] = @"CIAttributeSliderMax";
  v22[0] = &unk_1EE4AA270;
  v22[1] = &unk_1EE4AA2C0;
  void v21[2] = @"CIAttributeMin";
  v21[3] = @"CIAttributeMax";
  void v22[2] = &unk_1EE4AA270;
  v22[3] = &unk_1EE4AA2C0;
  v21[4] = @"CIAttributeDefault";
  v21[5] = @"CIAttributeType";
  v22[4] = &unk_1EE4AA270;
  v22[5] = @"CIAttributeTypeScalar";
  v27[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:6];
  v26[5] = @"inputFocusRect";
  v19[0] = @"CIAttributeType";
  v19[1] = @"CIAttributeIdentity";
  v20[0] = @"CIAttributeTypeRectangle";
  v20[1] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", *MEMORY[0x1E4F1DB10], *(double *)(MEMORY[0x1E4F1DB10] + 8), *(double *)(MEMORY[0x1E4F1DB10] + 16), *(double *)(MEMORY[0x1E4F1DB10] + 24));
  v27[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  v26[6] = @"inputLeftEyePositions";
  v17[1] = @"CIAttributeDefault";
  v18[0] = @"CIAttributeTypePosition";
  v17[0] = @"CIAttributeType";
  v18[1] = +[CIVector vectorWithX:-1.0 Y:-1.0];
  v27[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  v26[7] = @"inputRightEyePositions";
  v15[1] = @"CIAttributeDefault";
  v16[0] = @"CIAttributeTypePosition";
  v15[0] = @"CIAttributeType";
  v16[1] = +[CIVector vectorWithX:-1.0 Y:-1.0];
  v27[7] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  v26[8] = @"inputChinPositions";
  v13[1] = @"CIAttributeDefault";
  v14[0] = @"CIAttributeTypePosition";
  v13[0] = @"CIAttributeType";
  v14[1] = +[CIVector vectorWithX:-1.0 Y:-1.0];
  v27[8] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v26[9] = @"inputNosePositions";
  v11[1] = @"CIAttributeDefault";
  v12[0] = @"CIAttributeTypePosition";
  v11[0] = @"CIAttributeType";
  v12[1] = +[CIVector vectorWithX:-1.0 Y:-1.0];
  v27[9] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v26[10] = @"inputScaleFactor";
  v9[0] = @"CIAttributeType";
  v9[1] = @"CIAttributeSliderMin";
  v10[0] = @"CIAttributeTypeScalar";
  v10[1] = &unk_1EE4AA270;
  v9[2] = @"CIAttributeSliderMax";
  v9[3] = @"CIAttributeDefault";
  v10[2] = &unk_1EE4AA280;
  v10[3] = &unk_1EE4AA280;
  v27[10] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];
  v26[11] = @"inputCalibrationData";
  v7 = @"CIAttributeClass";
  v8 = @"AVCameraCalibrationData";
  v27[11] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  v26[12] = @"inputAuxDataMetadata";
  v5 = @"CIAttributeClass";
  v6 = @"CGImageMetadataRef";
  v27[12] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  v26[13] = @"inputShape";
  uint64_t v3 = @"CIAttributeClass";
  uint64_t v4 = @"NSString";
  v27[13] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v4 forKeys:&v3 count:1];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:14];
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  if ([a4 isEqualToString:@"inputShiftmapImage"])
  {
    v7 = @"inputDisparityImage";
LABEL_13:
    [(CIDepthBlurEffect *)self setValue:a3 forKey:v7];
    return;
  }
  if ([a4 isEqualToString:@"inputLeftEyePosition"])
  {
    v7 = @"inputLeftEyePositions";
    goto LABEL_13;
  }
  if ([a4 isEqualToString:@"inputRightEyePosition"])
  {
    v7 = @"inputRightEyePositions";
    goto LABEL_13;
  }
  if ([a4 isEqualToString:@"inputChinPosition"])
  {
    v7 = @"inputChinPositions";
    goto LABEL_13;
  }
  if ([a4 isEqualToString:@"inputFaceMidPoint"])
  {
    v7 = @"inputNosePositions";
    goto LABEL_13;
  }
  if ([a4 isEqualToString:@"inputScale"])
  {
    v7 = @"inputScaleFactor";
    goto LABEL_13;
  }
  if (([a4 isEqualToString:@"inputShiftMin"] & 1) == 0
    && ([a4 isEqualToString:@"inputShiftMax"] & 1) == 0
    && ([a4 isEqualToString:@"inputUseMipmaps"] & 1) == 0
    && ([a4 isEqualToString:@"inputUseNativeImage"] & 1) == 0
    && ([a4 isEqualToString:@"inputUseNormalizedDisparity"] & 1) == 0
    && ([a4 isEqualToString:@"inputOriginalSize"] & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)CIDepthBlurEffect;
    [(CIFilter *)&v8 setValue:a3 forUndefinedKey:a4];
  }
}

- (id)_getFocusRect:(id)a3 focusRect:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!a4 || (id v5 = a4, [a4 CGRectValue], CGRectEqualToRect(v27, *MEMORY[0x1E4F1DB10])))
  {
    v6 = (void *)[a3 properties];
    if (v6)
    {
      v7 = (void *)[v6 objectForKey:*MEMORY[0x1E4F2F6D8]];
      if (v7)
      {
        objc_super v8 = (void *)[v7 objectForKey:@"Regions"];
        if (v8)
        {
          v9 = (void *)[v8 objectForKey:*MEMORY[0x1E4F2F778]];
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v22;
            uint64_t v13 = *MEMORY[0x1E4F2F780];
            uint64_t v14 = *MEMORY[0x1E4F2F768];
            while (2)
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v22 != v12) {
                  objc_enumerationMutation(v9);
                }
                v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
                v17 = (void *)[v16 objectForKey:v13];
                if (v17
                  && [v17 isEqualToString:v14]
                  && CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)v16, &v20))
                {
                  v20.origin.x = v20.origin.x - v20.size.width * 0.5;
                  v20.origin.y = 1.0 - v20.origin.y - v20.size.height * 0.5;
                  return +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", *(void *)&v20.origin.x, *(void *)&v20.origin.y);
                }
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
              if (v11) {
                continue;
              }
              break;
            }
          }
        }
      }
    }
    return +[CIVector vectorWithX:0.45 Y:0.45 Z:0.1 W:0.1];
  }
  return v5;
}

- (id)outputImage
{
  valuePtr[2] = *MEMORY[0x1E4F143B8];
  id result = self->inputImage;
  if (!result || !self->inputDisparityImage) {
    return result;
  }
  [(NSNumber *)self->inputScaleFactor floatValue];
  float v4 = 0.0;
  float v6 = fminf(fmaxf(v5, 0.0), 1.0);
  if (v6 < 0.001) {
    return self->inputImage;
  }
  inputDisparityImage = (const CGImageMetadata *)metadataFromValue(self->inputAuxDataMetadata);
  inputLumaNoiseScale = self->inputLumaNoiseScale;
  if (inputLumaNoiseScale)
  {
    [(NSNumber *)inputLumaNoiseScale floatValue];
    float v4 = fminf(fmaxf(v9, 0.0), 1.0);
    inputLumaNoiseScale = self->inputLumaNoiseScale;
  }
  [(NSNumber *)inputLumaNoiseScale floatValue];
  if (v10 == 0.0)
  {
    uint64_t v11 = [(CIImage *)self->inputImage properties];
    if (v11)
    {
      LODWORD(valuePtr[0]) = 2143289344;
      CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)v11, (const void *)*MEMORY[0x1E4F2FC20]);
      float v4 = 0.0;
      if (Value)
      {
        CFNumberRef v13 = (const __CFNumber *)CFDictionaryGetValue(Value, @"29");
        if (v13)
        {
          CFNumberGetValue(v13, kCFNumberFloatType, valuePtr);
          float v4 = *(float *)valuePtr;
        }
      }
    }
  }
  if (inputDisparityImage)
  {
LABEL_12:
    uint64_t v14 = (NSDictionary *)tuningParametersFromMetaData(inputDisparityImage);
    char v15 = 0;
    if (v14) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  inputDisparityImage = (const CGImageMetadata *)self->inputDisparityImage;
  if (inputDisparityImage)
  {
    if ([(CIImage *)self->inputDisparityImage properties])
    {
      v16 = (void *)[(CGImageMetadata *)inputDisparityImage properties];
      inputDisparityImage = (const CGImageMetadata *)[v16 objectForKeyedSubscript:*MEMORY[0x1E4F2F380]];
      if (inputDisparityImage) {
        goto LABEL_12;
      }
    }
    else
    {
      inputDisparityImage = 0;
    }
  }
  char v15 = 1;
LABEL_20:
  uint64_t v14 = (NSDictionary *)tuningParametersFromImage(self->inputDisparityImage);
LABEL_21:
  if (v4 == 0.0)
  {
    SDOFRenderingValue(&cfstr_Lumanoisescale.isa, v14);
    float v4 = v17;
  }
  getSimulatedAperture(self->inputDisparityImage, inputDisparityImage, self->inputAperture, v14);
  int v19 = v18;
  id v20 = [(CIDepthBlurEffect *)self _getFocusRect:self->inputImage focusRect:self->inputFocusRect];
  inputImage = self->inputImage;
  v249[0] = @"inputImage";
  v249[1] = @"inputShiftmapImage";
  long long v22 = self->inputDisparityImage;
  v250[0] = inputImage;
  v250[1] = v22;
  v250[2] = v20;
  v249[2] = @"inputFocusRect";
  v249[3] = @"inputScale";
  *(float *)&double v23 = v6;
  v250[3] = [NSNumber numberWithFloat:v23];
  v249[4] = @"inputAperture";
  LODWORD(v24) = v19;
  v250[4] = [NSNumber numberWithFloat:v24];
  unint64_t v25 = 0x1E4F1C000uLL;
  uint64_t v26 = +[CIFilter filterWithName:withInputParameters:](CIFilter, "filterWithName:withInputParameters:", @"CIDepthEffectMakeBlurMap", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v250 forKeys:v249 count:5]);
  if (!self->inputAuxDataMetadata) {
    goto LABEL_58;
  }
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (TypeID != CFGetTypeID(self->inputAuxDataMetadata)) {
    goto LABEL_58;
  }
  inputAuxDataMetadata = self->inputAuxDataMetadata;
  if (!inputAuxDataMetadata) {
    goto LABEL_58;
  }
  if (v15)
  {
    inputDisparityImage = (const CGImageMetadata *)self->inputAuxDataMetadata;
LABEL_59:
    [(CIFilter *)v26 setValue:inputDisparityImage forKey:@"inputAuxDataMetadata"];
    char v214 = 0;
    goto LABEL_61;
  }
  int v29 = objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Version"), "intValue");
  int v30 = v29;
  if (v29 < 4)
  {
    switch(v29)
    {
      case 3:
        v35 = malloc_type_calloc(1uLL, 0x1D8uLL, 0x1000040156972F5uLL);
        *(void *)v35 = 0x3444E4552;
        v35[2] = 472;
        v35[3] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"DisparityRefinement"), "objectForKeyedSubscript:", @"radius"), "intValue");
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"DisparityRefinement"), "objectForKeyedSubscript:", @"disparitySigma"), "floatValue");
        v35[4] = v46;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"DisparityRefinement"), "objectForKeyedSubscript:", @"aaLumaSigma"), "floatValue");
        v35[5] = v47;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"DisparityRefinement"), "objectForKeyedSubscript:", @"aaChromaSigma"), "floatValue");
        v35[6] = v48;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"DisparityRefinement"), "objectForKeyedSubscript:", @"aaSpatialSigma"), "floatValue");
        v35[7] = v49;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"faces.linearBlurGrowthM"), "floatValue");
        v35[9] = v50;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"faces.linearBlurGrowthC"), "floatValue");
        v35[10] = v51;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"faces.distToBlurScaling"), "floatValue");
        v35[11] = v52;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"faces.eyeToEyebrowRatio"), "floatValue");
        v35[12] = v53;
        v35[13] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"HighlightRecovery"), "objectForKeyedSubscript:", @"iterations"), "intValue");
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"HighlightRecovery"), "objectForKeyedSubscript:", @"preFilterGain"), "floatValue");
        v35[14] = v54;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"HighlightRecovery"), "objectForKeyedSubscript:", @"weightGain"), "floatValue");
        v35[15] = v55;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"HighlightRecovery"), "objectForKeyedSubscript:", @"intensityGain"), "floatValue");
        v35[16] = v56;
        v35[17] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"nRings"), "intValue");
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"relativeWeightThreshold"), "floatValue");
        v35[18] = v57;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"highlightBoostGain"), "floatValue");
        v35[19] = v58;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"shapeObstructionCoeff"), "floatValue");
        v35[20] = v59;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"ringAmplitude"), "floatValue");
        v35[21] = v60;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"ringSharpness"), "floatValue");
        v35[22] = v61;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"preFilterBlurStrength"), "floatValue");
        v35[23] = v62;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"antiAliasBlurStrength"), "floatValue");
        v35[24] = v63;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"minimumSimulatedAperture"), "floatValue");
        v35[25] = v64;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"blendingQuarterResAlphaGain"), "floatValue");
        v35[26] = v65;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"blendingFullResAlphaGain"), "floatValue");
        v35[27] = v66;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"DisparityRefinement"), "objectForKeyedSubscript:", @"weightScaling"), "floatValue");
        v35[28] = v67;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"DisparityRefinement"), "objectForKeyedSubscript:", @"maxReconstructionWeight"), "floatValue");
        v35[29] = v68;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"DisparityRefinement"), "objectForKeyedSubscript:", @"innerSamplingRadius"), "floatValue");
        v35[30] = v69;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"DisparityRefinement"), "objectForKeyedSubscript:", @"outerSamplingRadius"), "floatValue");
        v35[31] = v70;
        v35[32] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"DisparityRefinement"), "objectForKeyedSubscript:", @"nSamples"), "intValue");
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"DisparityRefinement"), "objectForKeyedSubscript:", @"lumaSigma"), "floatValue");
        v35[33] = v71;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"DisparityRefinement"), "objectForKeyedSubscript:", @"chromaSigma"), "floatValue");
        v35[34] = v72;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"DisparityRefinement"), "objectForKeyedSubscript:", @"accumulatedWeightT0"), "floatValue");
        v35[35] = v73;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"DisparityRefinement"), "objectForKeyedSubscript:", @"accumulatedWeightT1"), "floatValue");
        v35[36] = v74;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"DisparityRefinement"), "objectForKeyedSubscript:", @"aaSegmentationSigma"), "floatValue");
        v35[69] = v75;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"DisparityRefinement"), "objectForKeyedSubscript:", @"segmentationSigma"), "floatValue");
        v35[68] = v76;
        v35[70] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"DisparityRefinement"), "objectForKeyedSubscript:", @"Version"), "intValue");
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"SLM"), "objectForKeyedSubscript:", @"shiftDeadZone"), "floatValue");
        v35[8] = v77;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"SLM"), "objectForKeyedSubscript:", @"zeroShiftPercentile"), "floatValue");
        v35[37] = v78;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"SLM"), "objectForKeyedSubscript:", @"maxFGBlur"), "floatValue");
        v35[38] = v79;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"SLM"), "objectForKeyedSubscript:", @"maximumSimulatedAperture"), "floatValue");
        v35[67] = v80;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"SLM"), "objectForKeyedSubscript:", @"defaultSimulatedAperture"), "floatValue");
        v35[71] = v81;
        v35[39] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapSmoothing"), "objectForKeyedSubscript:", @"nIterations"), "intValue");
        v35[40] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"preFilterRadius"), "intValue");
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"sharpRadius"), "floatValue");
        v35[41] = v82;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"softRadius"), "floatValue");
        v35[42] = v83;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"lumaNoiseModelCoeff"), "floatValue");
        v35[43] = v84;
        v35[44] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"antiAliasRadius"), "intValue");
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"alphaEpsilon"), "floatValue");
        v35[45] = v85;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"alphaGain"), "floatValue");
        v35[46] = v86;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"HighlightRecovery"), "objectForKeyedSubscript:", @"blurRadiusT0"), "floatValue");
        v35[47] = v87;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"HighlightRecovery"), "objectForKeyedSubscript:", @"blurRadiusT1"), "floatValue");
        v35[48] = v88;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"HighlightRecovery"), "objectForKeyedSubscript:", @"maxIntensityT0"), "floatValue");
        v35[49] = v89;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"HighlightRecovery"), "objectForKeyedSubscript:", @"maxIntensityT1"), "floatValue");
        v35[50] = v90;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"HighlightRecovery"), "objectForKeyedSubscript:", @"minIntensityT0"), "floatValue");
        v35[51] = v91;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"HighlightRecovery"), "objectForKeyedSubscript:", @"minIntensityT1"), "floatValue");
        v35[52] = v92;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"faces.maxBlurOnEyes"), "floatValue");
        v35[53] = v93;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"faces.maxBlurDistFromFocus"), "floatValue");
        v35[54] = v94;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"faces.capMultip"), "floatValue");
        v35[55] = v95;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"faces.gainMultip"), "floatValue");
        v35[56] = v96;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Fusion"), "objectForKeyedSubscript:", @"subtractiveLowerAlpha"), "floatValue");
        v35[57] = v97;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Fusion"), "objectForKeyedSubscript:", @"subtractiveUpperAlpha"), "floatValue");
        v35[58] = v98;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Fusion"), "objectForKeyedSubscript:", @"subtractiveMaxBlur"), "floatValue");
        v35[59] = v99;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Fusion"), "objectForKeyedSubscript:", @"additiveLowerAlpha"), "floatValue");
        v35[60] = v100;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Fusion"), "objectForKeyedSubscript:", @"additiveUpperAlpha"), "floatValue");
        v35[61] = v101;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Fusion"), "objectForKeyedSubscript:", @"additiveMaxBlur"), "floatValue");
        v35[62] = v102;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapSmoothing"), "objectForKeyedSubscript:", @"originalBlurValueT0"), "floatValue");
        v35[63] = v103;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapSmoothing"), "objectForKeyedSubscript:", @"originalBlurValueT1"), "floatValue");
        v35[64] = v104;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapSmoothing"), "objectForKeyedSubscript:", @"localMinimumBlurValueT0"), "floatValue");
        v35[65] = v105;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapSmoothing"), "objectForKeyedSubscript:", @"localMinimumBlurValueT1"), "floatValue");
        v35[66] = v106;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapRefinement"), "objectForKeyedSubscript:", @"subjectDistanceMinimumFocusDistance"), "floatValue");
        v35[73] = v107;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapRefinement"), "objectForKeyedSubscript:", @"subjectDistanceMaximumFocusDistance"), "floatValue");
        v35[74] = v108;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapRefinement"), "objectForKeyedSubscript:", @"subjectDistanceScalingFactor"), "floatValue");
        v35[75] = v109;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapRefinement"), "objectForKeyedSubscript:", @"subjectDistanceOffset"), "floatValue");
        v35[76] = v110;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapRefinement"), "objectForKeyedSubscript:", @"protectBodyStrength"), "floatValue");
        v35[77] = v111;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapRefinement"), "objectForKeyedSubscript:", @"maxBlur"), "floatValue");
        v35[78] = v112;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapRefinement"), "objectForKeyedSubscript:", @"smoothstepMin"), "floatValue");
        v35[79] = v113;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapRefinement"), "objectForKeyedSubscript:", @"smoothstepMax"), "floatValue");
        v35[80] = v114;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapRefinement"), "objectForKeyedSubscript:", @"distanceAdd"), "floatValue");
        v35[81] = v115;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapRefinement"), "objectForKeyedSubscript:", @"faceMaskAdditiveMaxBlur"), "floatValue");
        v35[82] = v116;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapRefinement"), "objectForKeyedSubscript:", @"faceMaskSubtractiveMaxBlur"), "floatValue");
        v35[83] = v117;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapRefinement"), "objectForKeyedSubscript:", @"personDistance"), "floatValue");
        v35[84] = v118;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapRefinement"), "objectForKeyedSubscript:", @"personThreshold"), "floatValue");
        v35[85] = v119;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapRefinement"), "objectForKeyedSubscript:", @"personMaxBlur"), "floatValue");
        v35[86] = v120;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapRefinement"), "objectForKeyedSubscript:", @"hairDistance"), "floatValue");
        v35[87] = v121;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapRefinement"), "objectForKeyedSubscript:", @"hairThreshold"), "floatValue");
        v35[88] = v122;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapRefinement"), "objectForKeyedSubscript:", @"hairMaxBlur"), "floatValue");
        v35[89] = v123;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapRefinement"), "objectForKeyedSubscript:", @"hairSubtractiveLowerAlpha"), "floatValue");
        v35[90] = v124;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapRefinement"), "objectForKeyedSubscript:", @"hairSubtractiveUpperAlpha"), "floatValue");
        v35[91] = v125;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapRefinement"), "objectForKeyedSubscript:", @"hairAdditiveLowerAlpha"), "floatValue");
        v35[92] = v126;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapRefinement"), "objectForKeyedSubscript:", @"hairAdditiveUpperAlpha"), "floatValue");
        v35[93] = v127;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapRefinement"), "objectForKeyedSubscript:", @"hairAdditiveMaxBlur"), "floatValue");
        v35[94] = v128;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapRefinement"), "objectForKeyedSubscript:", @"hairSubtractiveMaxBlur"), "floatValue");
        v35[95] = v129;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapRefinement"), "objectForKeyedSubscript:", @"relativeApertureScalingStrength"), "floatValue");
        v35[96] = v130;
        v35[97] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapRefinement"), "objectForKeyedSubscript:", @"eyeProtectionMaxFaces"), "intValue");
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapRefinement"), "objectForKeyedSubscript:", @"eyeProtectionFaceWeightsSmoothStepMin"), "floatValue");
        v35[98] = v131;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapRefinement"), "objectForKeyedSubscript:", @"eyeProtectionFaceWeightsSmoothStepMax"), "floatValue");
        v35[99] = v132;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapRefinement"), "objectForKeyedSubscript:", @"eyeProtectionOvalDimsDistanceScale"), "floatValue");
        v35[100] = v133;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapRefinement"), "objectForKeyedSubscript:", @"beyeProtectionOvalDimsDistanceOffset"), "floatValue");
        v35[101] = v134;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapRefinement"), "objectForKeyedSubscript:", @"eyeProtectionOvalDimsRadiusHorizontal"), "floatValue");
        v35[102] = v135;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapRefinement"), "objectForKeyedSubscript:", @"eyeProtectionOvalDimsRadiusVertical"), "floatValue");
        v35[103] = v136;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapRefinement"), "objectForKeyedSubscript:", @"eyeProtectionOvalFallOffSmoothStepMin"), "floatValue");
        v35[104] = v137;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapRefinement"), "objectForKeyedSubscript:", @"eyeProtectionOvalFallOffSmoothStepMax"), "floatValue");
        v35[105] = v138;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapRefinement"), "objectForKeyedSubscript:", @"eyeProtectionPersonMaskSmoothStepMin"), "floatValue");
        v35[106] = v139;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapRefinement"), "objectForKeyedSubscript:", @"eyeProtectionPersonMaskSmoothStepMax"), "floatValue");
        v35[107] = v140;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapRefinement"), "objectForKeyedSubscript:", @"eyeProtectionPreventStrength"), "floatValue");
        v35[108] = v141;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapRefinement"), "objectForKeyedSubscript:", @"eyeProtectionSubtractiveMaxBlur"), "floatValue");
        v35[109] = v142;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapRefinement"), "objectForKeyedSubscript:", @"eyeProtectionSubtractiveApertureScaling"), "floatValue");
        v35[110] = v143;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"SLM"), "objectForKeyedSubscript:", @"disparityScalingFactor"), "floatValue");
        v35[72] = v144;
        *(void *)(v35 + 111) = 0;
        *(void *)(v35 + 113) = 0;
        *(void *)(v35 + 115) = 0;
        v35[117] = 0;
        break;
      case 2:
        v35 = malloc_type_calloc(1uLL, 0x140uLL, 0x1000040B2834900uLL);
        *(void *)v35 = 0x2444E4552;
        v35[2] = 320;
        v35[3] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"DisparityRefinement"), "objectForKeyedSubscript:", @"radius"), "intValue");
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"DisparityRefinement"), "objectForKeyedSubscript:", @"disparitySigma"), "floatValue");
        v35[4] = v145;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"DisparityRefinement"), "objectForKeyedSubscript:", @"aaLumaSigma"), "floatValue");
        v35[5] = v146;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"DisparityRefinement"), "objectForKeyedSubscript:", @"aaChromaSigma"), "floatValue");
        v35[6] = v147;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"DisparityRefinement"), "objectForKeyedSubscript:", @"aaSpatialSigma"), "floatValue");
        v35[7] = v148;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"faces.linearBlurGrowthM"), "floatValue");
        v35[9] = v149;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"faces.linearBlurGrowthC"), "floatValue");
        v35[10] = v150;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"faces.distToBlurScaling"), "floatValue");
        v35[11] = v151;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"faces.eyeToEyebrowRatio"), "floatValue");
        v35[12] = v152;
        v35[13] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"HighlightRecovery"), "objectForKeyedSubscript:", @"iterations"), "intValue");
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"HighlightRecovery"), "objectForKeyedSubscript:", @"preFilterGain"), "floatValue");
        v35[14] = v153;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"HighlightRecovery"), "objectForKeyedSubscript:", @"weightGain"), "floatValue");
        v35[15] = v154;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"HighlightRecovery"), "objectForKeyedSubscript:", @"intensityGain"), "floatValue");
        v35[16] = v155;
        v35[17] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"nRings"), "intValue");
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"relativeWeightThreshold"), "floatValue");
        v35[18] = v156;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"highlightBoostGain"), "floatValue");
        v35[19] = v157;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"shapeObstructionCoeff"), "floatValue");
        v35[20] = v158;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"ringAmplitude"), "floatValue");
        v35[21] = v159;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"ringSharpness"), "floatValue");
        v35[22] = v160;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"preFilterBlurStrength"), "floatValue");
        v35[23] = v161;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"antiAliasBlurStrength"), "floatValue");
        v35[24] = v162;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"minimumSimulatedAperture"), "floatValue");
        v35[25] = v163;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"blendingQuarterResAlphaGain"), "floatValue");
        v35[26] = v164;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"blendingFullResAlphaGain"), "floatValue");
        v35[27] = v165;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"DisparityRefinement"), "objectForKeyedSubscript:", @"weightScaling"), "floatValue");
        v35[28] = v166;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"DisparityRefinement"), "objectForKeyedSubscript:", @"maxReconstructionWeight"), "floatValue");
        v35[29] = v167;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"DisparityRefinement"), "objectForKeyedSubscript:", @"innerSamplingRadius"), "floatValue");
        v35[30] = v168;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"DisparityRefinement"), "objectForKeyedSubscript:", @"outerSamplingRadius"), "floatValue");
        v35[31] = v169;
        v35[32] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"DisparityRefinement"), "objectForKeyedSubscript:", @"nSamples"), "intValue");
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"DisparityRefinement"), "objectForKeyedSubscript:", @"lumaSigma"), "floatValue");
        v35[33] = v170;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"DisparityRefinement"), "objectForKeyedSubscript:", @"chromaSigma"), "floatValue");
        v35[34] = v171;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"DisparityRefinement"), "objectForKeyedSubscript:", @"accumulatedWeightT0"), "floatValue");
        v35[35] = v172;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"DisparityRefinement"), "objectForKeyedSubscript:", @"accumulatedWeightT1"), "floatValue");
        v35[36] = v173;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"DisparityRefinement"), "objectForKeyedSubscript:", @"aaSegmentationSigma"), "floatValue");
        v35[69] = v174;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"DisparityRefinement"), "objectForKeyedSubscript:", @"segmentationSigma"), "floatValue");
        v35[68] = v175;
        v35[70] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"DisparityRefinement"), "objectForKeyedSubscript:", @"Version"), "intValue");
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"SLM"), "objectForKeyedSubscript:", @"shiftDeadZone"), "floatValue");
        v35[8] = v176;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"SLM"), "objectForKeyedSubscript:", @"zeroShiftPercentile"), "floatValue");
        v35[37] = v177;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"SLM"), "objectForKeyedSubscript:", @"maxFGBlur"), "floatValue");
        v35[38] = v178;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"SLM"), "objectForKeyedSubscript:", @"maximumSimulatedAperture"), "floatValue");
        v35[67] = v179;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"SLM"), "objectForKeyedSubscript:", @"defaultSimulatedAperture"), "floatValue");
        v35[71] = v180;
        v35[39] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapSmoothing"), "objectForKeyedSubscript:", @"nIterations"), "intValue");
        v35[40] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"preFilterRadius"), "intValue");
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"sharpRadius"), "floatValue");
        v35[41] = v181;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"softRadius"), "floatValue");
        v35[42] = v182;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"lumaNoiseModelCoeff"), "floatValue");
        v35[43] = v183;
        v35[44] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"antiAliasRadius"), "intValue");
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"alphaEpsilon"), "floatValue");
        v35[45] = v184;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"alphaGain"), "floatValue");
        v35[46] = v185;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"HighlightRecovery"), "objectForKeyedSubscript:", @"blurRadiusT0"), "floatValue");
        v35[47] = v186;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"HighlightRecovery"), "objectForKeyedSubscript:", @"blurRadiusT1"), "floatValue");
        v35[48] = v187;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"HighlightRecovery"), "objectForKeyedSubscript:", @"maxIntensityT0"), "floatValue");
        v35[49] = v188;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"HighlightRecovery"), "objectForKeyedSubscript:", @"maxIntensityT1"), "floatValue");
        v35[50] = v189;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"HighlightRecovery"), "objectForKeyedSubscript:", @"minIntensityT0"), "floatValue");
        v35[51] = v190;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"HighlightRecovery"), "objectForKeyedSubscript:", @"minIntensityT1"), "floatValue");
        v35[52] = v191;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"faces.maxBlurOnEyes"), "floatValue");
        v35[53] = v192;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"faces.maxBlurDistFromFocus"), "floatValue");
        v35[54] = v193;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"faces.capMultip"), "floatValue");
        v35[55] = v194;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"faces.gainMultip"), "floatValue");
        v35[56] = v195;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Fusion"), "objectForKeyedSubscript:", @"subtractiveLowerAlpha"), "floatValue");
        v35[57] = v196;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Fusion"), "objectForKeyedSubscript:", @"subtractiveUpperAlpha"), "floatValue");
        v35[58] = v197;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Fusion"), "objectForKeyedSubscript:", @"subtractiveMaxBlur"), "floatValue");
        v35[59] = v198;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Fusion"), "objectForKeyedSubscript:", @"additiveLowerAlpha"), "floatValue");
        v35[60] = v199;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Fusion"), "objectForKeyedSubscript:", @"additiveUpperAlpha"), "floatValue");
        v35[61] = v200;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Fusion"), "objectForKeyedSubscript:", @"additiveMaxBlur"), "floatValue");
        v35[62] = v201;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapSmoothing"), "objectForKeyedSubscript:", @"originalBlurValueT0"), "floatValue");
        v35[63] = v202;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapSmoothing"), "objectForKeyedSubscript:", @"originalBlurValueT1"), "floatValue");
        v35[64] = v203;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapSmoothing"), "objectForKeyedSubscript:", @"localMinimumBlurValueT0"), "floatValue");
        v35[65] = v204;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"BlurMapSmoothing"), "objectForKeyedSubscript:", @"localMinimumBlurValueT1"), "floatValue");
        v35[66] = v205;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"SLM"), "objectForKeyedSubscript:", @"disparityScalingFactor"), "floatValue");
        v35[72] = v206;
        *(void *)(v35 + 73) = 0;
        *(void *)(v35 + 75) = 0;
        *(void *)(v35 + 77) = 0;
        v35[79] = 0;
        break;
      case 1:
        v35 = malloc_type_calloc(1uLL, 0x30uLL, 0x1000040EED21634uLL);
        *(void *)v35 = 0x1444E4552;
        v35[2] = 48;
        v35[3] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"DisparitySmoothing"), "objectForKeyedSubscript:", @"nIterations"), "unsignedIntValue");
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"SLM"), "objectForKeyedSubscript:", @"shiftDeadZone"), "floatValue");
        v35[4] = v36;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"faces.linearBlurGrowthC"), "floatValue");
        v35[6] = v37;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"faces.linearBlurGrowthM"), "floatValue");
        v35[5] = v38;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"faces.distToBlurScaling"), "floatValue");
        v35[7] = v39;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"faces.eyeToEyebrowRatio"), "floatValue");
        v35[8] = v40;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"relativeWeightThreshold"), "floatValue");
        v35[9] = v41;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"highlightBoostGain"), "floatValue");
        v35[10] = v42;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", @"Rendering"), "objectForKeyedSubscript:", @"antiAliasBlurStrength"), "floatValue");
        v35[11] = v43;
        break;
      default:
        v31 = ci_logger_api();
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO)) {
          goto LABEL_32;
        }
        LODWORD(valuePtr[0]) = 67109120;
        HIDWORD(valuePtr[0]) = v30;
        goto LABEL_31;
    }
    if (*v35 == 1145980242)
    {
      if (v35[2])
      {
        v207 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v35), "base64EncodedDataWithOptions:", 0);
        v208 = malloc_type_malloc([v207 length] + 1, 0xE98FA221uLL);
        v208[[v207 length]] = 0;
        unint64_t v25 = 0x1E4F1C000;
        memcpy(v208, (const void *)[v207 bytes], objc_msgSend(v207, "length"));
        inputAuxDataMetadata = CGImageMetadataTagCreate(@"http://ns.apple.com/depthBlurEffect/1.0/", @"depthBlurEffect", @"RenderingParameters", kCGImageMetadataTypeString, (CFTypeRef)[NSString stringWithUTF8String:v208]);
        free(v208);
        free(v35);
        if (!inputAuxDataMetadata) {
          goto LABEL_58;
        }
        goto LABEL_32;
      }
      v213 = ci_logger_api();
      if (os_log_type_enabled(v213, OS_LOG_TYPE_INFO))
      {
        valuePtr[0] = 67109120;
        v210 = "Invalid rendering parameter header size (%d)";
        v211 = v213;
        uint32_t v212 = 8;
        goto LABEL_56;
      }
    }
    else
    {
      v209 = ci_logger_api();
      if (os_log_type_enabled(v209, OS_LOG_TYPE_INFO))
      {
        LOWORD(valuePtr[0]) = 0;
        v210 = "Invalid rendering parameter start marker.";
        v211 = v209;
        uint32_t v212 = 2;
LABEL_56:
        _os_log_impl(&dword_193671000, v211, OS_LOG_TYPE_INFO, v210, (uint8_t *)valuePtr, v212);
      }
    }
    free(v35);
    goto LABEL_58;
  }
  v31 = ci_logger_api();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    LODWORD(valuePtr[0]) = 67109120;
    HIDWORD(valuePtr[0]) = v30;
LABEL_31:
    _os_log_impl(&dword_193671000, v31, OS_LOG_TYPE_INFO, "Unknown depth blur effect rendering version %d", (uint8_t *)valuePtr, 8u);
  }
LABEL_32:
  MutableCopy = CGImageMetadataCreateMutableCopy(inputDisparityImage);
  if (MutableCopy)
  {
    v33 = MutableCopy;
    BOOL v34 = CGImageMetadataSetTagWithPath(MutableCopy, 0, @"depthBlurEffect:RenderingParameters", (CGImageMetadataTagRef)inputAuxDataMetadata);
    CFRelease(inputAuxDataMetadata);
    if (v34)
    {
      CFAutorelease(v33);
      inputDisparityImage = v33;
      goto LABEL_59;
    }
    v45 = ci_logger_api();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      LOWORD(valuePtr[0]) = 0;
      _os_log_impl(&dword_193671000, v45, OS_LOG_TYPE_INFO, "Unable to set new image metadata", (uint8_t *)valuePtr, 2u);
    }
    v44 = v33;
  }
  else
  {
    v44 = (CGImageMetadata *)inputAuxDataMetadata;
  }
  CFRelease(v44);
LABEL_58:
  if (inputDisparityImage) {
    goto LABEL_59;
  }
  char v214 = 1;
LABEL_61:
  inputCalibrationData = self->inputCalibrationData;
  if (inputCalibrationData) {
    [(CIFilter *)v26 setValue:inputCalibrationData forKey:@"inputCalibrationData"];
  }
  inputLeftEyePositions = self->inputLeftEyePositions;
  if (inputLeftEyePositions) {
    [(CIFilter *)v26 setValue:inputLeftEyePositions forKey:@"inputLeftEyePosition"];
  }
  inputRightEyePositions = self->inputRightEyePositions;
  if (inputRightEyePositions) {
    [(CIFilter *)v26 setValue:inputRightEyePositions forKey:@"inputRightEyePosition"];
  }
  inputChinPositions = self->inputChinPositions;
  if (inputChinPositions) {
    [(CIFilter *)v26 setValue:inputChinPositions forKey:@"inputChinPosition"];
  }
  inputNosePositions = self->inputNosePositions;
  if (inputNosePositions) {
    [(CIFilter *)v26 setValue:inputNosePositions forKey:@"inputFaceMidPoint"];
  }
  inputMatteImage = self->inputMatteImage;
  if (inputMatteImage)
  {
    [(CIImage *)inputMatteImage extent];
    if (v221 > 1.0)
    {
      [(CIImage *)self->inputMatteImage extent];
      if (v222 > 1.0) {
        [(CIFilter *)v26 setValue:self->inputMatteImage forKey:@"inputMatteImage"];
      }
    }
  }
  inputHairImage = self->inputHairImage;
  if (inputHairImage)
  {
    [(CIImage *)inputHairImage extent];
    if (v224 > 1.0)
    {
      [(CIImage *)self->inputHairImage extent];
      if (v225 > 1.0) {
        [(CIFilter *)v26 setValue:self->inputHairImage forKey:@"inputHairImage"];
      }
    }
  }
  inputGlassesImage = self->inputGlassesImage;
  if (inputGlassesImage)
  {
    [(CIImage *)inputGlassesImage extent];
    if (v227 > 1.0)
    {
      [(CIImage *)self->inputGlassesImage extent];
      if (v228 > 1.0) {
        [(CIFilter *)v26 setValue:self->inputGlassesImage forKey:@"inputGlassesImage"];
      }
    }
  }
  inputGainMap = self->inputGainMap;
  if (inputGainMap)
  {
    [(CIImage *)inputGainMap extent];
    if (v230 > 1.0)
    {
      [(CIImage *)self->inputGainMap extent];
      if (v231 > 1.0) {
        [(CIFilter *)v26 setValue:self->inputGainMap forKey:@"inputGainMap"];
      }
    }
  }
  uint64_t v232 = [(CIFilter *)v26 outputImage];
  if (!v232) {
    return self->inputImage;
  }
  v248[0] = self->inputImage;
  v248[1] = v232;
  LODWORD(v233) = v19;
  v248[2] = objc_msgSend(NSNumber, "numberWithFloat:", v233, @"inputImage", @"inputBlurMap", @"inputAperture");
  v247[3] = @"inputLumaNoiseScale";
  *(float *)&double v234 = v4;
  v248[3] = [NSNumber numberWithFloat:v234];
  v247[4] = @"inputScale";
  *(float *)&double v235 = v6;
  uint64_t v236 = [NSNumber numberWithFloat:v235];
  inputShape = self->inputShape;
  v247[5] = @"inputShape";
  if (inputShape) {
    v238 = (__CFString *)inputShape;
  }
  else {
    v238 = &stru_1EE465CC0;
  }
  v248[4] = v236;
  v248[5] = v238;
  v239 = +[CIFilter filterWithName:withInputParameters:](CIFilter, "filterWithName:withInputParameters:", @"CIDepthEffectApplyBlurMap", [*(id *)(v25 + 2536) dictionaryWithObjects:v248 forKeys:v247 count:6]);
  v240 = v239;
  if ((v214 & 1) == 0) {
    [(CIFilter *)v239 setValue:inputDisparityImage forKey:@"inputAuxDataMetadata"];
  }
  v241 = self->inputMatteImage;
  if (v241)
  {
    [(CIImage *)v241 extent];
    if (v242 > 1.0)
    {
      [(CIImage *)self->inputMatteImage extent];
      if (v243 > 1.0) {
        [(CIFilter *)v240 setValue:self->inputMatteImage forKey:@"inputMatteImage"];
      }
    }
  }
  v244 = self->inputGainMap;
  if (v244)
  {
    [(CIImage *)v244 extent];
    if (v245 > 1.0)
    {
      [(CIImage *)self->inputGainMap extent];
      if (v246 > 1.0) {
        [(CIFilter *)v240 setValue:self->inputGainMap forKey:@"inputGainMap"];
      }
    }
  }
  return [(CIFilter *)v240 outputImage];
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputDisparityImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputDisparityImage:(id)a3
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

- (NSNumber)inputLumaNoiseScale
{
  return self->inputLumaNoiseScale;
}

- (void)setInputLumaNoiseScale:(id)a3
{
}

- (CIVector)inputLeftEyePositions
{
  return (CIVector *)objc_getProperty(self, a2, 136, 1);
}

- (void)setInputLeftEyePositions:(id)a3
{
}

- (CIVector)inputRightEyePositions
{
  return (CIVector *)objc_getProperty(self, a2, 144, 1);
}

- (void)setInputRightEyePositions:(id)a3
{
}

- (CIVector)inputChinPositions
{
  return (CIVector *)objc_getProperty(self, a2, 152, 1);
}

- (void)setInputChinPositions:(id)a3
{
}

- (CIVector)inputNosePositions
{
  return (CIVector *)objc_getProperty(self, a2, 160, 1);
}

- (void)setInputNosePositions:(id)a3
{
}

- (CIVector)inputFocusRect
{
  return self->inputFocusRect;
}

- (void)setInputFocusRect:(id)a3
{
}

- (NSNumber)inputScaleFactor
{
  return self->inputScaleFactor;
}

- (void)setInputScaleFactor:(id)a3
{
}

- (AVCameraCalibrationData)inputCalibrationData
{
  return self->inputCalibrationData;
}

- (void)setInputCalibrationData:(id)a3
{
}

- (id)inputAuxDataMetadata
{
  return self->inputAuxDataMetadata;
}

- (void)setInputAuxDataMetadata:(id)a3
{
}

- (NSString)inputShape
{
  return self->inputShape;
}

- (void)setInputShape:(id)a3
{
}

+ (CGImageMetadata)replaceRenderingParameters:(CGImageMetadata *)a3 tuningParameters:(id)a4
{
  return 0;
}

+ (id)tuningParametersFromMetadata:(CGImageMetadata *)a3
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (CGImageMetadata)metadataFromDictionary:(id)a3 metadata:(CGImageMetadata *)a4
{
  float v4 = a4;
  if (a4) {
    MutableCopy = CGImageMetadataCreateMutableCopy(a4);
  }
  else {
    MutableCopy = CGImageMetadataCreateMutable();
  }
  v7 = MutableCopy;
  if (!MutableCopy) {
    return 0;
  }
  if (!CGImageMetadataRegisterNamespaceForPrefix(MutableCopy, @"depthBlurEffect", @"UnpackedRenderingParameters", 0)|| (objc_super v8 = CGImageMetadataTagCreate(@"http://ns.apple.com/depthBlurEffect/1.0/", @"depthBlurEffect", @"UnpackedRenderingParameters", kCGImageMetadataTypeStructure, a3)) == 0)
  {
    CFRelease(v7);
    return 0;
  }
  float v9 = v8;
  BOOL v10 = CGImageMetadataSetTagWithPath(v7, 0, @"depthBlurEffect:UnpackedRenderingParameters", v8);
  CFRelease(v9);
  if (!v10)
  {
    CFRelease(v7);
    return v4;
  }

  return (CGImageMetadata *)CFAutorelease(v7);
}

+ (CGImageMetadata)augmentMetadataWithRenderingPropertiesForImage:(id)a3
{
  if (!a3 || ![a3 properties]) {
    return 0;
  }
  float v5 = (void *)[a3 properties];
  float v6 = (const void *)[v5 objectForKeyedSubscript:*MEMORY[0x1E4F2F380]];
  id v7 = +[CIDepthBlurEffect tuningParametersFromMetadata:v6];
  if (v7)
  {
    id v8 = v7;
    if (objc_msgSend((id)objc_msgSend(v7, "allKeys"), "count")) {
      float v6 = (const void *)[a1 metadataFromDictionary:v8 metadata:v6];
    }
  }
  CFTypeRef v9 = CFRetain(v6);

  return (CGImageMetadata *)CFAutorelease(v9);
}

+ (int)getDraftMode:(id)a3
{
  return 0;
}

@end