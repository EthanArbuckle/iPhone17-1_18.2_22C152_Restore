@interface AVDepthData
+ (AVDepthData)depthDataFromDictionaryRepresentation:(NSDictionary *)imageSourceAuxDataInfoDictionary error:(NSError *)outError;
+ (id)_allSupportedDepthDataPixelFormatTypes;
+ (void)initialize;
- (AVCameraCalibrationData)cameraCalibrationData;
- (AVDepthData)depthDataByApplyingExifOrientation:(CGImagePropertyOrientation)exifOrientation;
- (AVDepthData)depthDataByConvertingToDepthDataType:(OSType)depthDataType;
- (AVDepthData)depthDataByReplacingDepthDataMapWithPixelBuffer:(CVPixelBufferRef)pixelBuffer error:(NSError *)outError;
- (AVDepthData)initWithPixelBuffer:(__CVBuffer *)a3 auxiliaryMetadata:(CGImageMetadata *)a4;
- (AVDepthData)initWithPixelBuffer:(__CVBuffer *)a3 depthMetadataDictionary:(id)a4;
- (AVDepthDataAccuracy)depthDataAccuracy;
- (AVDepthDataQuality)depthDataQuality;
- (BOOL)isDepthDataFiltered;
- (BOOL)portraitScoreIsHigh;
- (CGImageMetadata)copyAuxiliaryMetadata;
- (CVPixelBufferRef)depthDataMap;
- (NSArray)availableDepthDataTypes;
- (NSDictionary)dictionaryRepresentationForAuxiliaryDataType:(NSString *)outAuxDataType;
- (OSType)depthDataType;
- (__CFString)auxiliaryImageType;
- (__CVBuffer)_copyPixelBufferRepresentationWithPixelFormatType:(unsigned int)a3;
- (float)depthBlurEffectSimulatedAperture;
- (float)portraitLightingEffectStrength;
- (float)portraitScore;
- (id)debugDescription;
- (id)depthBlurEffectRenderingParameters;
- (id)description;
- (signed)depthDataVersionMajor;
- (signed)depthDataVersionMinor;
- (void)dealloc;
@end

@implementation AVDepthData

- (AVDepthData)initWithPixelBuffer:(__CVBuffer *)a3 depthMetadataDictionary:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)AVDepthData;
  v6 = [(AVDepthData *)&v18 init];
  if (v6)
  {
    internal = objc_alloc_init(AVDepthDataInternal);
    v6->_internal = internal;
    if (internal)
    {
      if (a3)
      {
        v8 = (__CVBuffer *)CFRetain(a3);
        internal = v6->_internal;
      }
      else
      {
        v8 = 0;
      }
      internal->pixelBuffer = v8;
      if (a4)
      {
        v6->_internal->version = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F526A8]), "intValue");
        v6->_internal->quality = (int)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F526A0]), "intValue");
        v6->_internal->filtered = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F52668]), "BOOLValue");
        v6->_internal->accuracy = (int)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F52658]), "intValue");
        v6->_internal->calibrationData = [[AVCameraCalibrationData alloc] initWithDepthMetadataDictionary:a4];
        objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F52590]), "floatValue");
        v6->_internal->depthBlurEffectSimulatedAperture = v9;
        uint64_t v10 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F52588]];
        if (v10) {
          v6->_internal->depthBlurEffectRenderingParameters = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v10 options:0];
        }
        v11 = (void *)[a4 objectForKeyedSubscript:*MEMORY[0x1E4F526B8]];
        uint64_t v12 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F526B0]];
        LODWORD(v13) = 2143289344;
        if (v11)
        {
          v14 = (void *)v12;
          if (v12)
          {
            v6->_internal->portraitScoreIsHigh = objc_msgSend(v11, "BOOLValue", v13);
            [v14 floatValue];
          }
        }
        v6->_internal->portraitScore = *(float *)&v13;
        v15 = (void *)[a4 objectForKeyedSubscript:*MEMORY[0x1E4F52808]];
        if (v15)
        {
          [v15 floatValue];
          v6->_internal->portraitLightingEffectStrength = v16;
        }
        else
        {
          v6->_internal->portraitLightingEffectStrength = NAN;
        }
      }
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  internal = self->_internal;
  if (internal)
  {
    pixelBuffer = internal->pixelBuffer;
    if (pixelBuffer)
    {
      CFRelease(pixelBuffer);
      internal = self->_internal;
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)AVDepthData;
  [(AVDepthData *)&v5 dealloc];
}

+ (void)initialize
{
}

- (id)debugDescription
{
  [(AVDepthData *)self depthDataType];
  uint64_t v3 = AVStringForOSType();
  internal = self->_internal;
  pixelBuffer = internal->pixelBuffer;
  if (pixelBuffer)
  {
    size_t Width = CVPixelBufferGetWidth(pixelBuffer);
    internal = self->_internal;
    v7 = internal->pixelBuffer;
    if (v7)
    {
      size_t Height = CVPixelBufferGetHeight(v7);
      internal = self->_internal;
      goto LABEL_6;
    }
  }
  else
  {
    size_t Width = 0;
  }
  size_t Height = 0;
LABEL_6:
  BOOL filtered = internal->filtered;
  int64_t quality = internal->quality;
  int64_t accuracy = internal->accuracy;
  calibrationData = internal->calibrationData;
  if (calibrationData) {
    double v13 = (__CFString *)[NSString stringWithFormat:@" calibration:{%@}", -[AVCameraCalibrationData debugDescription](calibrationData, "debugDescription")];
  }
  else {
    double v13 = &stru_1EF4D21D0;
  }
  v14 = @"abs";
  if (accuracy != 1) {
    v14 = @"rel";
  }
  v15 = @"low";
  if (quality) {
    v15 = @"high";
  }
  if (filtered) {
    float v16 = &stru_1EF4D21D0;
  }
  else {
    float v16 = @" (unfiltered)";
  }
  return (id)[NSString stringWithFormat:@"%@ %zux%zu (%@/%@)%@%@%@", v3, Width, Height, v15, v14, v16, v13, &stru_1EF4D21D0];
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p %@>", NSStringFromClass(v4), self, -[AVDepthData debugDescription](self, "debugDescription")];
}

+ (AVDepthData)depthDataFromDictionaryRepresentation:(NSDictionary *)imageSourceAuxDataInfoDictionary error:(NSError *)outError
{
  CVPixelBufferRef pixelBufferOut = 0;
  id v7 = [(NSDictionary *)imageSourceAuxDataInfoDictionary objectForKeyedSubscript:*MEMORY[0x1E4F2F370]];
  id v8 = [(NSDictionary *)imageSourceAuxDataInfoDictionary objectForKeyedSubscript:*MEMORY[0x1E4F2F378]];
  id v9 = [(NSDictionary *)imageSourceAuxDataInfoDictionary objectForKeyedSubscript:*MEMORY[0x1E4F2F380]];
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  int v11 = v10;
  if (v11 == 1 && v9 == 0) {
    goto LABEL_41;
  }
  id v13 = v9;
  if (v11) {
    goto LABEL_32;
  }
  uint64_t v14 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E4F2FCE0]), "intValue");
  int v15 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E4F2FDD8]), "intValue");
  int v16 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E4F2FB48]), "intValue");
  int v17 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E4F2F538]), "intValue");
  BOOL v18 = !v14 || v15 == 0;
  BOOL v19 = v18 || v16 == 0;
  if (v19 || v17 == 0)
  {
LABEL_41:
    fig_log_get_emitter();
    FigDebugAssert3();
    v38 = 0;
    CVReturn v27 = -11865;
    goto LABEL_34;
  }
  LODWORD(v21) = v17;
  v22 = (void *)[a1 _allSupportedDepthDataPixelFormatTypes];
  if ((objc_msgSend(v22, "containsObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v14)) & 1) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v38 = 0;
    CVReturn v27 = -11864;
    goto LABEL_34;
  }
  unint64_t v23 = v16;
  uint64_t v24 = (int)v21;
  uint64_t v25 = [NSNumber numberWithUnsignedLong:(int)v21];
  CFDictionaryRef v26 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", MEMORY[0x1E4F1CC08], *MEMORY[0x1E4F24D20], v25, *MEMORY[0x1E4F24C98], 0);
  CVReturn v27 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v15, v16, v14, v26, &pixelBufferOut);
  CVPixelBufferRef v28 = pixelBufferOut;
  if (v27)
  {
    v38 = 0;
    if (!pixelBufferOut) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
  size_t v30 = BytesPerRow;
  if (BytesPerRow >= (int)v21) {
    int64_t v21 = (int)v21;
  }
  else {
    int64_t v21 = BytesPerRow;
  }
  v31 = (char *)[v7 bytes];
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBufferOut);
  uint64_t v33 = [v7 length];
  if (v21 <= v33)
  {
    v34 = &v31[v33];
    unint64_t v35 = 1;
    do
    {
      memcpy(BaseAddress, v31, v21);
      if (v35 >= v23) {
        break;
      }
      v36 = &v31[v21 + v24];
      v31 += v24;
      BaseAddress += v30;
      ++v35;
    }
    while (v36 <= v34);
  }
  CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
LABEL_32:
  v37 = [AVDepthData alloc];
  v38 = [(AVDepthData *)v37 initWithPixelBuffer:pixelBufferOut auxiliaryMetadata:v13];
  CVReturn v27 = 0;
  CVPixelBufferRef v28 = pixelBufferOut;
  if (pixelBufferOut) {
LABEL_33:
  }
    CFRelease(v28);
LABEL_34:
  if (outError && v27)
  {
    if (ErrorIsAVFoundationError()) {
      v39 = (NSError *)AVLocalizedError();
    }
    else {
      v39 = (NSError *)AVLocalizedErrorWithUnderlyingOSStatus();
    }
    *outError = v39;
  }
  return v38;
}

- (AVDepthData)depthDataByApplyingExifOrientation:(CGImagePropertyOrientation)exifOrientation
{
  v20[1] = *MEMORY[0x1E4F143B8];
  CVPixelBufferRef pixelBufferOut = 0;
  if (exifOrientation - 1 < 8)
  {
    objc_super v5 = -[AVCameraCalibrationData cameraCalibrationDataWithExifOrientation:](self->_internal->calibrationData, "cameraCalibrationDataWithExifOrientation:");
    pixelBuffer = self->_internal->pixelBuffer;
    if (!pixelBuffer) {
      goto LABEL_13;
    }
    size_t Width = CVPixelBufferGetWidth(pixelBuffer);
    size_t Height = CVPixelBufferGetHeight(self->_internal->pixelBuffer);
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(self->_internal->pixelBuffer);
    size_t v10 = exifOrientation - 5 >= 4 ? Width : Height;
    if (exifOrientation - 5 >= 4) {
      size_t Width = Height;
    }
    uint64_t v19 = *MEMORY[0x1E4F24D20];
    v20[0] = MEMORY[0x1E4F1CC08];
    CFDictionaryRef v11 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v10, Width, PixelFormatType, v11, &pixelBufferOut))
    {
LABEL_13:
      id v13 = [AVDepthData alloc];
    }
    else
    {
      int v12 = FigDepthRotateBuffer();
      id v13 = [AVDepthData alloc];
      if (v12)
      {
        CVPixelBufferRef v14 = 0;
LABEL_15:
        int v17 = [(AVDepthData *)v13 initWithPixelBuffer:v14 depthMetadataDictionary:0];
        v17->_internal->calibrationData = v5;
        v17->_internal->version = self->_internal->version;
        v17->_internal->int64_t quality = self->_internal->quality;
        v17->_internal->BOOL filtered = self->_internal->filtered;
        v17->_internal->int64_t accuracy = self->_internal->accuracy;
        v17->_internal->depthBlurEffectSimulatedAperture = self->_internal->depthBlurEffectSimulatedAperture;
        v17->_internal->depthBlurEffectRenderingParameters = (NSData *)[(NSData *)self->_internal->depthBlurEffectRenderingParameters copy];
        v17->_internal->portraitScoreIsHigh = self->_internal->portraitScoreIsHigh;
        v17->_internal->portraitScore = self->_internal->portraitScore;
        v17->_internal->portraitLightingEffectStrength = self->_internal->portraitLightingEffectStrength;
        CVPixelBufferRelease(pixelBufferOut);
        return v17;
      }
    }
    CVPixelBufferRef v14 = pixelBufferOut;
    goto LABEL_15;
  }
  int v15 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v15);
  }
  NSLog(&cfstr_SuppressingExc.isa, v15);
  return 0;
}

- (AVDepthData)depthDataByConvertingToDepthDataType:(OSType)depthDataType
{
  uint64_t v3 = *(void *)&depthDataType;
  objc_super v5 = [(AVDepthData *)self availableDepthDataTypes];
  if (-[NSArray containsObject:](v5, "containsObject:", [NSNumber numberWithUnsignedInt:v3]))
  {
    v6 = [(AVDepthData *)self _copyPixelBufferRepresentationWithPixelFormatType:v3];
    id v7 = [[AVDepthData alloc] initWithPixelBuffer:v6 depthMetadataDictionary:0];
    CVPixelBufferRelease(v6);
    v7->_internal->calibrationData = [(AVDepthData *)self cameraCalibrationData];
    LODWORD(v6) = [(AVDepthData *)self depthDataVersionMajor];
    v7->_internal->version = [(AVDepthData *)self depthDataVersionMinor] | (v6 << 16);
    v7->_internal->int64_t quality = [(AVDepthData *)self depthDataQuality];
    v7->_internal->BOOL filtered = [(AVDepthData *)self isDepthDataFiltered];
    v7->_internal->int64_t accuracy = [(AVDepthData *)self depthDataAccuracy];
    [(AVDepthData *)self depthBlurEffectSimulatedAperture];
    v7->_internal->depthBlurEffectSimulatedAperture = v8;
    v7->_internal->depthBlurEffectRenderingParameters = (NSData *)[(AVDepthData *)self depthBlurEffectRenderingParameters];
    v7->_internal->portraitScoreIsHigh = [(AVDepthData *)self portraitScoreIsHigh];
    [(AVDepthData *)self portraitScore];
    v7->_internal->portraitScore = v9;
    [(AVDepthData *)self portraitLightingEffectStrength];
    v7->_internal->portraitLightingEffectStrength = v10;
    return v7;
  }
  else
  {
    int v12 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v12);
    }
    NSLog(&cfstr_SuppressingExc.isa, v12);
    return 0;
  }
}

- (AVDepthData)depthDataByReplacingDepthDataMapWithPixelBuffer:(CVPixelBufferRef)pixelBuffer error:(NSError *)outError
{
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
  float v8 = [(AVDepthData *)self availableDepthDataTypes];
  if (-[NSArray containsObject:](v8, "containsObject:", [NSNumber numberWithUnsignedInt:PixelFormatType]))
  {
    float v9 = [[AVDepthData alloc] initWithPixelBuffer:pixelBuffer depthMetadataDictionary:0];
    v9->_internal->int64_t quality = [(AVDepthData *)self depthDataQuality];
    v9->_internal->BOOL filtered = [(AVDepthData *)self isDepthDataFiltered];
    v9->_internal->int64_t accuracy = [(AVDepthData *)self depthDataAccuracy];
    v9->_internal->portraitScore = NAN;
    v9->_internal->portraitLightingEffectStrength = NAN;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    if (outError)
    {
      if (ErrorIsAVFoundationError()) {
        CFDictionaryRef v11 = (NSError *)AVLocalizedError();
      }
      else {
        CFDictionaryRef v11 = (NSError *)AVLocalizedErrorWithUnderlyingOSStatus();
      }
      float v9 = 0;
      *outError = v11;
    }
    else
    {
      float v9 = 0;
    }
  }

  return v9;
}

- (NSArray)availableDepthDataTypes
{
  return (NSArray *)+[AVDepthData _allSupportedDepthDataPixelFormatTypes];
}

- (NSDictionary)dictionaryRepresentationForAuxiliaryDataType:(NSString *)outAuxDataType
{
  v20[4] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(AVDepthData *)self depthDataType];
  size_t Width = CVPixelBufferGetWidth([(AVDepthData *)self depthDataMap]);
  size_t Height = CVPixelBufferGetHeight([(AVDepthData *)self depthDataMap]);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow([(AVDepthData *)self depthDataMap]);
  if (!v5
    || !Width
    || !Height
    || (size_t v9 = BytesPerRow) == 0
    || (uint64_t v10 = [MEMORY[0x1E4F1CA58] dataWithLength:BytesPerRow * Height]) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  CFDictionaryRef v11 = (void *)v10;
  int v12 = [(AVDepthData *)self depthDataMap];
  if (CVPixelBufferLockBaseAddress(v12, 1uLL)) {
    return 0;
  }
  BaseAddress = CVPixelBufferGetBaseAddress(v12);
  memcpy((void *)[v11 mutableBytes], BaseAddress, v9 * Height);
  CVPixelBufferUnlockBaseAddress(v12, 1uLL);
  CVPixelBufferRef v14 = (NSDictionary *)[MEMORY[0x1E4F1CA60] dictionary];
  [(NSDictionary *)v14 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F2F370]];
  v19[0] = *MEMORY[0x1E4F2FCE0];
  v20[0] = [NSNumber numberWithUnsignedInt:v5];
  v19[1] = *MEMORY[0x1E4F2FDD8];
  v20[1] = [NSNumber numberWithUnsignedLong:Width];
  v19[2] = *MEMORY[0x1E4F2FB48];
  void v20[2] = [NSNumber numberWithUnsignedLong:Height];
  v19[3] = *MEMORY[0x1E4F2F538];
  v20[3] = [NSNumber numberWithUnsignedLong:v9];
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:4];
  [(NSDictionary *)v14 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F2F378]];
  int v16 = [(AVDepthData *)self copyAuxiliaryMetadata];
  if (v16)
  {
    int v17 = v16;
    [(NSDictionary *)v14 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F2F380]];
    CFRelease(v17);
  }
  if (outAuxDataType) {
    *outAuxDataType = (NSString *)[(AVDepthData *)self auxiliaryImageType];
  }
  return v14;
}

- (OSType)depthDataType
{
  pixelBuffer = self->_internal->pixelBuffer;
  if (pixelBuffer) {
    LODWORD(pixelBuffer) = CVPixelBufferGetPixelFormatType(pixelBuffer);
  }
  return pixelBuffer;
}

- (CVPixelBufferRef)depthDataMap
{
  return self->_internal->pixelBuffer;
}

- (AVDepthDataQuality)depthDataQuality
{
  return self->_internal->quality;
}

- (BOOL)isDepthDataFiltered
{
  return self->_internal->filtered;
}

- (AVDepthDataAccuracy)depthDataAccuracy
{
  return self->_internal->accuracy;
}

- (AVCameraCalibrationData)cameraCalibrationData
{
  v2 = self->_internal->calibrationData;

  return v2;
}

- (signed)depthDataVersionMajor
{
  return HIWORD(self->_internal->version);
}

- (signed)depthDataVersionMinor
{
  return self->_internal->version;
}

- (float)depthBlurEffectSimulatedAperture
{
  return self->_internal->depthBlurEffectSimulatedAperture;
}

- (id)depthBlurEffectRenderingParameters
{
  v2 = self->_internal->depthBlurEffectRenderingParameters;

  return v2;
}

- (BOOL)portraitScoreIsHigh
{
  return self->_internal->portraitScoreIsHigh;
}

- (float)portraitScore
{
  return self->_internal->portraitScore;
}

- (float)portraitLightingEffectStrength
{
  return self->_internal->portraitLightingEffectStrength;
}

- (AVDepthData)initWithPixelBuffer:(__CVBuffer *)a3 auxiliaryMetadata:(CGImageMetadata *)a4
{
  uint64_t v5 = [(AVDepthData *)self initWithPixelBuffer:a3 depthMetadataDictionary:0];
  v6 = v5;
  if (a4 && v5)
  {
    uint64_t v7 = *MEMORY[0x1E4F525C0];
    v5->_internal->version = objc_msgSend(AVAuxiliaryMetadataStringTagWithPrefixedKey(a4, *MEMORY[0x1E4F525C0], *MEMORY[0x1E4F52640]), "intValue");
    v6->_internal->int64_t quality = objc_msgSend(AVAuxiliaryMetadataStringTagWithPrefixedKey(a4, v7, *MEMORY[0x1E4F52620]), "isEqualToString:", @"low") ^ 1;
    v6->_internal->BOOL filtered = objc_msgSend(AVAuxiliaryMetadataStringTagWithPrefixedKey(a4, v7, *MEMORY[0x1E4F525D8]), "BOOLValue");
    v6->_internal->int64_t accuracy = objc_msgSend(AVAuxiliaryMetadataStringTagWithPrefixedKey(a4, v7, *MEMORY[0x1E4F525C8]), "isEqualToString:", @"absolute");
    v6->_internal->calibrationData = [[AVCameraCalibrationData alloc] initWithAuxiliaryMetadata:a4];
    uint64_t v8 = *MEMORY[0x1E4F525A0];
    objc_msgSend(AVAuxiliaryMetadataStringTagWithPrefixedKey(a4, *MEMORY[0x1E4F525A0], *MEMORY[0x1E4F525B0]), "floatValue");
    v6->_internal->depthBlurEffectSimulatedAperture = v9;
    id v10 = AVAuxiliaryMetadataStringTagWithPrefixedKey(a4, v8, *MEMORY[0x1E4F525A8]);
    if (v10) {
      v6->_internal->depthBlurEffectRenderingParameters = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v10 options:0];
    }
    id v11 = AVAuxiliaryMetadataStringTagWithPrefixedKey(a4, v7, *MEMORY[0x1E4F52650]);
    id v12 = v11;
    if (v11) {
      v6->_internal->portraitScoreIsHigh = [v11 BOOLValue];
    }
    id v13 = AVAuxiliaryMetadataStringTagWithPrefixedKey(a4, v7, *MEMORY[0x1E4F52648]);
    LODWORD(v14) = 2143289344;
    if (v12 && v13) {
      objc_msgSend(v13, "floatValue", v14);
    }
    v6->_internal->portraitScore = *(float *)&v14;
    id v15 = AVAuxiliaryMetadataStringTagWithPrefixedKey(a4, *MEMORY[0x1E4F52630], *MEMORY[0x1E4F52638]);
    if (v15) {
      [v15 floatValue];
    }
    else {
      int v16 = 2143289344;
    }
    LODWORD(v6->_internal->portraitLightingEffectStrength) = v16;
  }
  return v6;
}

- (CGImageMetadata)copyAuxiliaryMetadata
{
  uint64_t v3 = [(AVCameraCalibrationData *)self->_internal->calibrationData copyAuxiliaryMetadata];
  if (v3)
  {
    v4 = v3;
    CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F525B8];
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F525C0];
  }
  else
  {
    Mutable = CGImageMetadataCreateMutable();
    v4 = Mutable;
    if (!Mutable)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return v4;
    }
    CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F525B8];
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F525C0];
    if (!CGImageMetadataRegisterNamespaceForPrefix(Mutable, (CFStringRef)*MEMORY[0x1E4F525B8], (CFStringRef)*MEMORY[0x1E4F525C0], 0))goto LABEL_37; {
  }
    }
  if (self->_internal->quality) {
    uint64_t v8 = @"high";
  }
  else {
    uint64_t v8 = @"low";
  }
  if (!AVAuxiliaryMetadataAddValue(v4, v5, v6, (CFStringRef)*MEMORY[0x1E4F52620], v8)
    || !AVAuxiliaryMetadataAddValue(v4, v5, v6, (CFStringRef)*MEMORY[0x1E4F525D8], (const void *)[NSNumber numberWithBool:self->_internal->filtered]))
  {
    goto LABEL_37;
  }
  float v9 = self->_internal->accuracy == 1 ? @"absolute" : @"relative";
  if (!AVAuxiliaryMetadataAddValue(v4, v5, v6, (CFStringRef)*MEMORY[0x1E4F525C8], v9)) {
    goto LABEL_37;
  }
  internal = self->_internal;
  if (internal->version)
  {
    if (AVAuxiliaryMetadataAddValue(v4, v5, v6, (CFStringRef)*MEMORY[0x1E4F52640], (const void *)objc_msgSend(NSNumber, "numberWithInt:")))
    {
      internal = self->_internal;
      goto LABEL_17;
    }
LABEL_37:
    fig_log_get_emitter();
    FigDebugAssert3();
    CFRelease(v4);
    return 0;
  }
LABEL_17:
  *(float *)&double v10 = internal->portraitScore;
  if (!AVAuxiliaryMetadataAddValue(v4, v5, v6, (CFStringRef)*MEMORY[0x1E4F52650], (const void *)objc_msgSend(NSNumber, "numberWithBool:", internal->portraitScoreIsHigh, v10)))goto LABEL_37; {
  *(float *)&double v12 = self->_internal->portraitScore;
  }
  if (!AVAuxiliaryMetadataAddValue(v4, v5, v6, (CFStringRef)*MEMORY[0x1E4F52648], (const void *)[NSNumber numberWithFloat:v12]))goto LABEL_37; {
  if (self->_internal->depthBlurEffectRenderingParameters)
  }
  {
    CFStringRef v13 = (const __CFString *)*MEMORY[0x1E4F52598];
    CFStringRef v14 = (const __CFString *)*MEMORY[0x1E4F525A0];
    if (!CGImageMetadataRegisterNamespaceForPrefix(v4, (CFStringRef)*MEMORY[0x1E4F52598], (CFStringRef)*MEMORY[0x1E4F525A0], 0))goto LABEL_37; {
    *(float *)&double v15 = self->_internal->depthBlurEffectSimulatedAperture;
    }
    if (!AVAuxiliaryMetadataAddValue(v4, v13, v14, (CFStringRef)*MEMORY[0x1E4F525B0], (const void *)[NSNumber numberWithFloat:v15]))goto LABEL_37; {
    int v16 = [(NSData *)self->_internal->depthBlurEffectRenderingParameters base64EncodedStringWithOptions:0];
    }
    if (!AVAuxiliaryMetadataAddValue(v4, v13, v14, (CFStringRef)*MEMORY[0x1E4F525A8], v16)) {
      goto LABEL_37;
    }
  }
  CFStringRef v17 = (const __CFString *)*MEMORY[0x1E4F52628];
  CFStringRef v18 = (const __CFString *)*MEMORY[0x1E4F52630];
  if (!CGImageMetadataRegisterNamespaceForPrefix(v4, (CFStringRef)*MEMORY[0x1E4F52628], (CFStringRef)*MEMORY[0x1E4F52630], 0))goto LABEL_37; {
  *(float *)&double v19 = self->_internal->portraitLightingEffectStrength;
  }
  if (!AVAuxiliaryMetadataAddValue(v4, v17, v18, (CFStringRef)*MEMORY[0x1E4F52638], (const void *)[NSNumber numberWithFloat:v19]))goto LABEL_37; {
  return v4;
  }
}

- (__CFString)auxiliaryImageType
{
  if ((([(AVDepthData *)self depthDataType] - 1717855600) & 0xFDFFFFFF) != 0) {
    v2 = (__CFString **)MEMORY[0x1E4F2F3B8];
  }
  else {
    v2 = (__CFString **)MEMORY[0x1E4F2F3B0];
  }
  return *v2;
}

+ (id)_allSupportedDepthDataPixelFormatTypes
{
  return &unk_1EF4FA968;
}

- (__CVBuffer)_copyPixelBufferRepresentationWithPixelFormatType:(unsigned int)a3
{
  CVPixelBufferRef pixelBufferOut = 0;
  size_t Width = CVPixelBufferGetWidth(self->_internal->pixelBuffer);
  size_t Height = CVPixelBufferGetHeight(self->_internal->pixelBuffer);
  CFDictionaryRef v7 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", MEMORY[0x1E4F1CC08], *MEMORY[0x1E4F24D20], 0);
  OSType v8 = [(AVDepthData *)self depthDataType];
  if (!CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], Width, Height, a3, v7, &pixelBufferOut))
  {
    internal = self->_internal;
    pixelBuffer = internal->pixelBuffer;
    id v11 = pixelBufferOut;
    if (v8 == a3)
    {
      if (CVPixelBufferLockBaseAddress(internal->pixelBuffer, 1uLL))
      {
        fig_log_get_emitter();
        FigDebugAssert3();
      }
      else
      {
        if (!CVPixelBufferLockBaseAddress(v11, 0))
        {
          size_t v12 = CVPixelBufferGetHeight(pixelBuffer);
          size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
          size_t v14 = CVPixelBufferGetBytesPerRow(v11);
          size_t v15 = v14;
          if (BytesPerRow >= v14) {
            size_t v16 = v14;
          }
          else {
            size_t v16 = BytesPerRow;
          }
          BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
          CFStringRef v18 = (char *)CVPixelBufferGetBaseAddress(v11);
          if (v12)
          {
            double v19 = v18;
            do
            {
              memcpy(v19, BaseAddress, v16);
              BaseAddress += BytesPerRow;
              v19 += v15;
              --v12;
            }
            while (v12);
          }
          CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
          CVPixelBufferUnlockBaseAddress(v11, 0);
          return pixelBufferOut;
        }
        fig_log_get_emitter();
        FigDebugAssert3();
        CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
      }
    }
    else if (!FigDepthConvertBuffer())
    {
      return pixelBufferOut;
    }
  }
  CVPixelBufferRelease(pixelBufferOut);
  return 0;
}

@end