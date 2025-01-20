@interface CIDepthEffectApplyBlurMap
+ (id)customAttributes;
- (CIImage)inputBlurMap;
- (CIImage)inputGainMap;
- (CIImage)inputImage;
- (CIImage)inputMatteImage;
- (NSNumber)inputAperture;
- (NSNumber)inputBestHairQuality;
- (NSNumber)inputDraftMode;
- (NSNumber)inputLumaNoiseScale;
- (NSNumber)inputScale;
- (NSString)inputCaptureFolderMiscPath;
- (NSString)inputShape;
- (id)alterBlurmap;
- (id)inputAuxDataMetadata;
- (id)outputImage;
- (id)unifiedRenderingOutputImage:(CGImageMetadata *)a3;
- (void)setInputAperture:(id)a3;
- (void)setInputAuxDataMetadata:(id)a3;
- (void)setInputBestHairQuality:(id)a3;
- (void)setInputBlurMap:(id)a3;
- (void)setInputCaptureFolderMiscPath:(id)a3;
- (void)setInputDraftMode:(id)a3;
- (void)setInputGainMap:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputLumaNoiseScale:(id)a3;
- (void)setInputMatteImage:(id)a3;
- (void)setInputScale:(id)a3;
- (void)setInputShape:(id)a3;
@end

@implementation CIDepthEffectApplyBlurMap

+ (id)customAttributes
{
  v19[10] = *MEMORY[0x1E4F143B8];
  v18[0] = @"CIAttributeFilterCategories";
  v17[0] = @"CICategoryColorAdjustment";
  v17[1] = @"CICategoryVideo";
  v17[2] = @"CICategoryStillImage";
  v17[3] = @"CICategoryBuiltIn";
  v17[4] = @"CICategoryApplePrivate";
  v19[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:5];
  v19[1] = @"11";
  v18[1] = @"CIAttributeFilterAvailable_iOS";
  v18[2] = @"CIAttributeFilterAvailable_Mac";
  v19[2] = @"10.13";
  v18[3] = @"inputAperture";
  v15[0] = @"CIAttributeSliderMin";
  v15[1] = @"CIAttributeSliderMax";
  v16[0] = &unk_1EE4AA280;
  v16[1] = &unk_1EE4AA290;
  v15[2] = @"CIAttributeMin";
  v15[3] = @"CIAttributeMax";
  v16[2] = &unk_1EE4AA270;
  v16[3] = &unk_1EE4AA290;
  v15[4] = @"CIAttributeDefault";
  v15[5] = @"CIAttributeType";
  v16[4] = &unk_1EE4AA270;
  v16[5] = @"CIAttributeTypeScalar";
  v19[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:6];
  v18[4] = @"inputLumaNoiseScale";
  v13[0] = @"CIAttributeSliderMin";
  v13[1] = @"CIAttributeSliderMax";
  v14[0] = &unk_1EE4AA270;
  v14[1] = &unk_1EE4AA2C0;
  v13[2] = @"CIAttributeMin";
  v13[3] = @"CIAttributeMax";
  v14[2] = &unk_1EE4AA270;
  v14[3] = &unk_1EE4AA2C0;
  v13[4] = @"CIAttributeDefault";
  v13[5] = @"CIAttributeType";
  v14[4] = &unk_1EE4AA270;
  v14[5] = @"CIAttributeTypeScalar";
  v19[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:6];
  v18[5] = @"inputScale";
  v11[0] = @"CIAttributeType";
  v11[1] = @"CIAttributeSliderMin";
  v12[0] = @"CIAttributeTypeScalar";
  v12[1] = &unk_1EE4AA2A0;
  v11[2] = @"CIAttributeSliderMax";
  v11[3] = @"CIAttributeDefault";
  v12[2] = &unk_1EE4AA280;
  v12[3] = &unk_1EE4AA280;
  v19[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];
  v18[6] = @"inputAuxDataMetadata";
  v9 = @"CIAttributeClass";
  v10 = @"CGImageMetadataRef";
  v19[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v18[7] = @"inputShape";
  v7 = @"CIAttributeClass";
  v8 = @"NSString";
  v19[7] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  v18[8] = @"inputDraftMode";
  v5[0] = @"CIAttributeType";
  v5[1] = @"CIAttributeSliderMin";
  v6[0] = @"CIAttributeTypeInteger";
  v6[1] = &unk_1EE4AAFD0;
  v5[2] = @"CIAttributeSliderMax";
  v5[3] = @"CIAttributeDefault";
  v6[2] = &unk_1EE4AAFE8;
  v6[3] = &unk_1EE4AAFD0;
  v19[8] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:4];
  v18[9] = @"inputBestHairQuality";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = MEMORY[0x1E4F1CC28];
  v4[1] = MEMORY[0x1E4F1CC28];
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeMax";
  v4[2] = MEMORY[0x1E4F1CC38];
  v4[3] = MEMORY[0x1E4F1CC38];
  v3[4] = @"CIAttributeDefault";
  v3[5] = @"CIAttributeType";
  v4[4] = MEMORY[0x1E4F1CC38];
  v4[5] = @"CIAttributeTypeBoolean";
  v19[9] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:10];
}

- (id)alterBlurmap
{
  v11[1] = *MEMORY[0x1E4F143B8];
  inputBlurMap = self->inputBlurMap;
  inputBestHairQuality = self->inputBestHairQuality;
  BOOL v4 = inputBestHairQuality == (NSNumber *)MEMORY[0x1E4F1CC28] || inputBestHairQuality == (NSNumber *)&unk_1EE4AAFD0;
  if (v4
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ![(NSNumber *)inputBestHairQuality BOOLValue])
  {
    v5 = +[CIKernel kernelWithInternalRepresentation:&CI::_onlyRG_];
    [(CIImage *)inputBlurMap extent];
    v11[0] = inputBlurMap;
    return -[CIColorKernel applyWithExtent:arguments:](v5, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1], v6, v7, v8, v9);
  }
  return inputBlurMap;
}

- (id)unifiedRenderingOutputImage:(CGImageMetadata *)a3
{
  if (a3)
  {
    CFTypeID TypeID = CGImageMetadataGetTypeID();
    if (TypeID == CFGetTypeID(a3))
    {
      inputImage = self->inputImage;
      id RenderingParametersFromCGImageMetadata = getRenderingParametersFromCGImageMetadata(a3);
      if (RenderingParametersFromCGImageMetadata)
      {
        double v8 = RenderingParametersFromCGImageMetadata;
        id v9 = [(CIDepthEffectApplyBlurMap *)self alterBlurmap];
        [(NSNumber *)self->inputAperture floatValue];
        int v11 = v10;
        [(NSNumber *)self->inputScale floatValue];
        int v13 = v12;
        [(NSNumber *)self->inputLumaNoiseScale floatValue];
        int v15 = v14;
        inputMatteImage = self->inputMatteImage;
        inputGainMap = self->inputGainMap;
        inputCaptureFolderMiscPath = self->inputCaptureFolderMiscPath;
        v19 = +[CIImage emptyImage];
        v20 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
        [v20 setObject:MEMORY[0x1E4F1CC08] forKeyedSubscript:@"options"];
        [v20 setObject:v8 forKeyedSubscript:@"metadata"];
        LODWORD(v21) = v11;
        objc_msgSend(v20, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v21), @"simulatedAperture");
        LODWORD(v22) = 1022739087;
        objc_msgSend(v20, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v22), @"maxBlur");
        LODWORD(v23) = v13;
        objc_msgSend(v20, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v23), @"inputScale");
        LODWORD(v24) = v15;
        objc_msgSend(v20, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v24), @"lumaNoiseAmplitude");
        [v20 setObject:v9 forKeyedSubscript:@"inputBlurMap"];
        [v20 setObject:inputMatteImage forKeyedSubscript:@"inputAlpha"];
        [v20 setObject:inputImage forKeyedSubscript:@"inputImage"];
        [v20 setObject:0 forKeyedSubscript:@"inputImageLuma"];
        [v20 setObject:0 forKeyedSubscript:@"inputImageChroma"];
        [v20 setObject:inputGainMap forKeyedSubscript:@"inputGainMap"];
        if (inputCaptureFolderMiscPath) {
          [v20 setObject:inputCaptureFolderMiscPath forKeyedSubscript:@"captureFolderMiscPath"];
        }
        uint64_t v25 = objc_msgSend(objc_alloc((Class)envCCApplyBlurMapArgsClass()), "initWithDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithDictionary:", v20));
        if (v25)
        {
          v26 = (void *)v25;
          v27 = (void *)[objc_alloc((Class)envCCApplyBlurMapClass()) initWithMetalQueue:0];
          if (v27)
          {
            v28 = v27;
            v19 = (CIImage *)[v27 imageUsingArgs:v26];
          }
        }

        if (v19) {
          return v19;
        }
      }
    }
  }

  return +[CIImage emptyImage];
}

- (id)outputImage
{
  v38[7] = *MEMORY[0x1E4F143B8];
  id result = self->inputImage;
  if (result)
  {
    if (!self->inputBlurMap) {
      return result;
    }
    [result extent];
    if (CGRectIsInfinite(v40) || ([(CIImage *)self->inputBlurMap extent], CGRectIsInfinite(v41)))
    {
      BOOL v4 = ci_logger_api();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v36 = 0;
        _os_log_impl(&dword_193671000, v4, OS_LOG_TYPE_INFO, "input image(s) to CIDepthBlurEffect apply is of inifite extent; returning input image",
          v36,
          2u);
      }
      return self->inputImage;
    }
    v5 = (const CGImageMetadata *)metadataFromValue(self->inputAuxDataMetadata);
    if (v5) {
      double v6 = tuningParametersFromMetaData(v5);
    }
    else {
      double v6 = tuningParametersFromImage(self->inputBlurMap);
    }
    id inputAuxDataMetadata = v6;
    if (self->inputAuxDataMetadata)
    {
      CFTypeID TypeID = CFDictionaryGetTypeID();
      if (TypeID == CFGetTypeID(self->inputAuxDataMetadata)) {
        id inputAuxDataMetadata = self->inputAuxDataMetadata;
      }
    }
    id v9 = (void *)[inputAuxDataMetadata objectForKeyedSubscript:@"Version"];
    int v10 = NSNumber;
    if (v9) {
      uint64_t v11 = [v9 unsignedIntegerValue];
    }
    else {
      uint64_t v11 = 1;
    }
    int v12 = (void *)[v10 numberWithUnsignedInteger:v11];
    int v13 = [v12 intValue];
    int v14 = +[CIFilter minSDOFRenderingVersionSupported];
    int v15 = [v12 intValue];
    if (v13 < v14)
    {
      if (v15)
      {
        v16 = [(CIImage *)self->inputImage imageByColorMatchingWorkingSpaceToColorSpace:linearP3ColorSpace()];
        inputBlurMap = self->inputBlurMap;
        v37[0] = @"inputBlurmapImage";
        v37[1] = @"inputLumaNoiseScale";
        inputLumaNoiseScale = self->inputLumaNoiseScale;
        v38[0] = inputBlurMap;
        v38[1] = inputLumaNoiseScale;
        inputScale = self->inputScale;
        v37[2] = @"inputScale";
        v37[3] = @"inputAperture";
        inputAperture = self->inputAperture;
        v38[2] = inputScale;
        v38[3] = inputAperture;
        v37[4] = @"inputImage";
        v37[5] = @"inputShape";
        inputShape = (__CFString *)self->inputShape;
        if (!inputShape) {
          inputShape = &stru_1EE465CC0;
        }
        v38[4] = v16;
        v38[5] = inputShape;
        v37[6] = @"inputDraftMode";
        v38[6] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", +[CIDepthBlurEffect getDraftMode:](CIDepthBlurEffect, "getDraftMode:", -[CIDepthEffectApplyBlurMap inputDraftMode](self, "inputDraftMode")));
        double v22 = +[CIFilter filterWithName:withInputParameters:](CIFilter, "filterWithName:withInputParameters:", @"CIPortraitBlur", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:7]);
        double v23 = (const CGImageMetadata *)self->inputAuxDataMetadata;
        double v24 = (double *)MEMORY[0x1E4F1DB30];
        double v26 = *MEMORY[0x1E4F1DB30];
        double v25 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
        if (v23)
        {
          CFTypeID v27 = CFGetTypeID(self->inputAuxDataMetadata);
          if (CGImageMetadataGetTypeID() == v27)
          {
            v28 = CGImageMetadataCopyTagWithPath(v23, 0, @"depthData:IntrinsicMatrixReferenceWidth");
            v29 = CGImageMetadataCopyTagWithPath(v23, 0, @"depthData:IntrinsicMatrixReferenceHeight");
            if (v28)
            {
              CFTypeRef v30 = CGImageMetadataTagCopyValue(v28);
              double v26 = (double)[(id)(id)CFMakeCollectable(v30) integerValue];
              CFRelease(v28);
            }
            if (v29)
            {
              CFTypeRef v31 = CGImageMetadataTagCopyValue(v29);
              double v25 = (double)[(id)(id)CFMakeCollectable(v31) integerValue];
              CFRelease(v29);
            }
          }
        }
        if (v26 != *v24 || v25 != v24[1])
        {
          id inputAuxDataMetadata = (id)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:inputAuxDataMetadata];
          objc_msgSend(inputAuxDataMetadata, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v26), @"SensorWidth");
          objc_msgSend(inputAuxDataMetadata, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v25), @"SensorHeight");
        }
        if (inputAuxDataMetadata) {
          [(CIFilter *)v22 setValue:inputAuxDataMetadata forKey:@"inputTuningParameters"];
        }
        inputMatteImage = self->inputMatteImage;
        if (inputMatteImage)
        {
          [(CIImage *)inputMatteImage extent];
          if (v33 > 1.0)
          {
            [(CIImage *)self->inputMatteImage extent];
            if (v34 > 1.0) {
              [(CIFilter *)v22 setValue:self->inputMatteImage forKey:@"inputMatteImage"];
            }
          }
        }
        return [(CIImage *)[(CIFilter *)v22 outputImage] imageByColorMatchingColorSpaceToWorkingSpace:linearP3ColorSpace()];
      }
      return self->inputImage;
    }
    if (v15 > +[CIFilter maxSDOFRenderingVersionSupported]) {
      return self->inputImage;
    }
    id v35 = self->inputAuxDataMetadata;
    return [(CIDepthEffectApplyBlurMap *)self unifiedRenderingOutputImage:v35];
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

- (CIImage)inputBlurMap
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputBlurMap:(id)a3
{
}

- (CIImage)inputMatteImage
{
  return (CIImage *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputMatteImage:(id)a3
{
}

- (CIImage)inputGainMap
{
  return (CIImage *)objc_getProperty(self, a2, 104, 1);
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

- (NSString)inputShape
{
  return self->inputShape;
}

- (void)setInputShape:(id)a3
{
}

- (NSNumber)inputDraftMode
{
  return self->inputDraftMode;
}

- (void)setInputDraftMode:(id)a3
{
}

- (NSNumber)inputBestHairQuality
{
  return self->inputBestHairQuality;
}

- (void)setInputBestHairQuality:(id)a3
{
}

- (NSString)inputCaptureFolderMiscPath
{
  return self->inputCaptureFolderMiscPath;
}

- (void)setInputCaptureFolderMiscPath:(id)a3
{
}

@end