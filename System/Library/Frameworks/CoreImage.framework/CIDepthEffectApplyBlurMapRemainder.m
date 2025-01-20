@interface CIDepthEffectApplyBlurMapRemainder
+ (id)customAttributes;
- (CIImage)inputBackground;
- (id)outputImage;
- (id)unifiedRenderingOutputImage:(CGImageMetadata *)a3;
- (void)setInputBackground:(id)a3;
@end

@implementation CIDepthEffectApplyBlurMapRemainder

+ (id)customAttributes
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___CIDepthEffectApplyBlurMapRemainder;
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
  id v9 = [(CIDepthEffectApplyBlurMap *)self alterBlurmap];
  [(NSNumber *)self->super.inputAperture floatValue];
  int v11 = v10;
  [(NSNumber *)self->super.inputScale floatValue];
  int v13 = v12;
  [(NSNumber *)self->super.inputLumaNoiseScale floatValue];
  int v15 = v14;
  inputMatteImage = self->super.inputMatteImage;
  inputBackground = self->inputBackground;
  inputGainMap = self->super.inputGainMap;
  inputCaptureFolderMiscPath = self->super.inputCaptureFolderMiscPath;
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
  v25 = objc_msgSend(objc_alloc((Class)envCCApplyBlurMapArgsClass()), "initWithDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithDictionary:", v20));
  if (v25 && (uint64_t v26 = [objc_alloc((Class)envCCApplyBlurMapClass()) initWithMetalQueue:0]) != 0)
  {
    v27 = (void *)v26;
    if (objc_opt_respondsToSelector()) {
      v28 = (void *)[v27 imageUsingArgs:v25 backgroundBlur:inputBackground];
    }
    else {
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
  id result = self->super.inputImage;
  if (!result) {
    return result;
  }
  if (!self->super.inputBlurMap || !self->inputBackground) {
    return 0;
  }
  [result extent];
  if (CGRectIsInfinite(v18) || ([(CIImage *)self->super.inputBlurMap extent], CGRectIsInfinite(v19)))
  {
    v4 = ci_logger_api();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_193671000, v4, OS_LOG_TYPE_INFO, "input image(s) to CIDepthBlurEffect apply is of inifite extent; returning input image",
        v16,
        2u);
    }
    return self->super.inputImage;
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
  id v9 = (void *)[inputAuxDataMetadata objectForKeyedSubscript:@"Version"];
  int v10 = NSNumber;
  uint64_t v11 = v9 ? [v9 unsignedIntegerValue] : 1;
  int v12 = (void *)[v10 numberWithUnsignedInteger:v11];
  int v13 = [v12 intValue];
  if (v13 < +[CIFilter minSDOFRenderingVersionSupported]) {
    return 0;
  }
  int v14 = [v12 intValue];
  if (v14 > +[CIFilter maxSDOFRenderingVersionSupported]) {
    return 0;
  }
  id v15 = self->super.inputAuxDataMetadata;

  return [(CIDepthEffectApplyBlurMapRemainder *)self unifiedRenderingOutputImage:v15];
}

- (CIImage)inputBackground
{
  return (CIImage *)objc_getProperty(self, a2, 176, 1);
}

- (void)setInputBackground:(id)a3
{
}

@end