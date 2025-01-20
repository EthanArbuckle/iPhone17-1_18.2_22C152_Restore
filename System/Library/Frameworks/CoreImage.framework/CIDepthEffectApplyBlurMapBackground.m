@interface CIDepthEffectApplyBlurMapBackground
+ (id)customAttributes;
- (id)outputImage;
- (id)unifiedRenderingOutputImage:(CGImageMetadata *)a3;
@end

@implementation CIDepthEffectApplyBlurMapBackground

+ (id)customAttributes
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___CIDepthEffectApplyBlurMapBackground;
  return objc_msgSendSuper2(&v3, sel_customAttributes);
}

- (id)unifiedRenderingOutputImage:(CGImageMetadata *)a3
{
  if (!a3) {
    return 0;
  }
  CFTypeID TypeID = CGImageMetadataGetTypeID();
  if (TypeID != CFGetTypeID(a3)) {
    return 0;
  }
  inputImage = self->super.inputImage;
  id RenderingParametersFromCGImageMetadata = getRenderingParametersFromCGImageMetadata(a3);
  if (!RenderingParametersFromCGImageMetadata) {
    return 0;
  }
  v8 = RenderingParametersFromCGImageMetadata;
  [(NSNumber *)self->super.inputAperture floatValue];
  int v10 = v9;
  [(NSNumber *)self->super.inputScale floatValue];
  int v12 = v11;
  [(NSNumber *)self->super.inputLumaNoiseScale floatValue];
  int v14 = v13;
  inputBlurMap = self->super.inputBlurMap;
  inputMatteImage = self->super.inputMatteImage;
  inputGainMap = self->super.inputGainMap;
  inputCaptureFolderMiscPath = self->super.inputCaptureFolderMiscPath;
  v19 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  [v19 setObject:MEMORY[0x1E4F1CC08] forKeyedSubscript:@"options"];
  [v19 setObject:v8 forKeyedSubscript:@"metadata"];
  LODWORD(v20) = v10;
  objc_msgSend(v19, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v20), @"simulatedAperture");
  LODWORD(v21) = 1022739087;
  objc_msgSend(v19, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v21), @"maxBlur");
  LODWORD(v22) = v12;
  objc_msgSend(v19, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v22), @"inputScale");
  LODWORD(v23) = v14;
  objc_msgSend(v19, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v23), @"lumaNoiseAmplitude");
  [v19 setObject:inputBlurMap forKeyedSubscript:@"inputBlurMap"];
  [v19 setObject:inputMatteImage forKeyedSubscript:@"inputAlpha"];
  [v19 setObject:inputImage forKeyedSubscript:@"inputImage"];
  [v19 setObject:0 forKeyedSubscript:@"inputImageLuma"];
  [v19 setObject:0 forKeyedSubscript:@"inputImageChroma"];
  [v19 setObject:inputGainMap forKeyedSubscript:@"inputGainMap"];
  if (inputCaptureFolderMiscPath) {
    [v19 setObject:inputCaptureFolderMiscPath forKeyedSubscript:@"captureFolderMiscPath"];
  }
  uint64_t v24 = objc_msgSend(objc_alloc((Class)envCCApplyBlurMapArgsClass()), "initWithDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithDictionary:", v19));
  if (v24)
  {
    v25 = (void *)v24;
    uint64_t v26 = [objc_alloc((Class)envCCApplyBlurMapClass()) initWithMetalQueue:0];
    if (v26)
    {
      v27 = (void *)v26;
      if (objc_opt_respondsToSelector()) {
        v28 = (void *)[v27 backgroundImageUsingArgs:v25];
      }
      else {
        v28 = 0;
      }
    }
    else
    {
      v28 = 0;
    }
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (id)outputImage
{
  inputImage = self->super.inputImage;
  if (!inputImage || !self->super.inputBlurMap) {
    return 0;
  }
  [(CIImage *)inputImage extent];
  if (CGRectIsInfinite(v19) || ([(CIImage *)self->super.inputBlurMap extent], CGRectIsInfinite(v20)))
  {
    v4 = ci_logger_api();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_193671000, v4, OS_LOG_TYPE_INFO, "input image(s) to CIDepthBlurEffect apply is of inifite extent; returning nil image",
        v17,
        2u);
    }
    return 0;
  }
  v5 = (const CGImageMetadata *)metadataFromValue(self->super.inputAuxDataMetadata);
  if (v5) {
    v6 = tuningParametersFromMetaData(v5);
  }
  else {
    v6 = tuningParametersFromImage(self->super.inputBlurMap);
  }
  id inputAuxDataMetadata = v6;
  if (self->super.inputAuxDataMetadata)
  {
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(self->super.inputAuxDataMetadata)) {
      id inputAuxDataMetadata = self->super.inputAuxDataMetadata;
    }
  }
  int v9 = (void *)[inputAuxDataMetadata objectForKeyedSubscript:@"Version"];
  int v10 = NSNumber;
  if (v9) {
    uint64_t v11 = [v9 unsignedIntegerValue];
  }
  else {
    uint64_t v11 = 1;
  }
  int v12 = (void *)[v10 numberWithUnsignedInteger:v11];
  int v13 = [v12 intValue];
  if (v13 < +[CIFilter minSDOFRenderingVersionSupported]) {
    return 0;
  }
  int v14 = [v12 intValue];
  if (v14 > +[CIFilter maxSDOFRenderingVersionSupported]) {
    return 0;
  }
  id v16 = self->super.inputAuxDataMetadata;

  return [(CIDepthEffectApplyBlurMapBackground *)self unifiedRenderingOutputImage:v16];
}

@end