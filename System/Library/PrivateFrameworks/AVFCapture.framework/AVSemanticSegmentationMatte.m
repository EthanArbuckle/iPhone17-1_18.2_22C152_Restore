@interface AVSemanticSegmentationMatte
+ (AVSemanticSegmentationMatte)semanticSegmentationMatteFromImageSourceAuxiliaryDataType:(CFStringRef)imageSourceAuxiliaryDataType dictionaryRepresentation:(NSDictionary *)imageSourceAuxiliaryDataInfoDictionary error:(NSError *)outError;
+ (id)_allSupportedSemanticSegmentationMattePixelFormatTypes;
+ (id)_allSupportedSemanticSegmentationMatteTypes;
+ (void)initialize;
- (AVSemanticSegmentationMatte)initWithType:(id)a3 pixelBuffer:(__CVBuffer *)a4 auxiliaryMetadata:(CGImageMetadata *)a5;
- (AVSemanticSegmentationMatte)initWithType:(id)a3 pixelBuffer:(__CVBuffer *)a4 semanticSegmentationMatteMetadataDictionary:(id)a5;
- (AVSemanticSegmentationMatte)semanticSegmentationMatteByApplyingExifOrientation:(CGImagePropertyOrientation)exifOrientation;
- (AVSemanticSegmentationMatte)semanticSegmentationMatteByReplacingSemanticSegmentationMatteWithPixelBuffer:(CVPixelBufferRef)pixelBuffer error:(NSError *)outError;
- (AVSemanticSegmentationMatteType)matteType;
- (CGImageMetadata)copyAuxiliaryMetadata;
- (CVPixelBufferRef)mattingImage;
- (NSDictionary)dictionaryRepresentationForAuxiliaryDataType:(NSString *)outAuxDataType;
- (OSType)pixelFormatType;
- (__CFString)auxiliaryImageType;
- (id)debugDescription;
- (id)description;
- (signed)versionMajor;
- (signed)versionMinor;
- (void)dealloc;
@end

@implementation AVSemanticSegmentationMatte

+ (void)initialize
{
}

- (id)debugDescription
{
  [(AVSemanticSegmentationMatte *)self pixelFormatType];
  uint64_t v3 = AVStringForOSType();
  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer)
  {
    size_t Width = CVPixelBufferGetWidth(pixelBuffer);
    v6 = self->_pixelBuffer;
    if (v6)
    {
      size_t Height = CVPixelBufferGetHeight(v6);
      goto LABEL_6;
    }
  }
  else
  {
    size_t Width = 0;
  }
  size_t Height = 0;
LABEL_6:
  uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @" v.%d.%d", (self->_version >> 16), (unsigned __int16)self->_version);
  matteType = (__CFString *)self->_matteType;
  v10 = @"Skin";
  v11 = @"Teeth";
  if (matteType == @"AVSemanticSegmentationMatteTypeGlasses") {
    v12 = @"Glasses";
  }
  else {
    v12 = 0;
  }
  if (matteType != @"AVSemanticSegmentationMatteTypeTeeth") {
    v11 = v12;
  }
  if (matteType != @"AVSemanticSegmentationMatteTypeSkin") {
    v10 = v11;
  }
  if (matteType == @"AVSemanticSegmentationMatteTypeHair") {
    v13 = @"Hair";
  }
  else {
    v13 = v10;
  }
  return (id)[NSString stringWithFormat:@"%@ %@ %zux%zu%@", v13, v3, Width, Height, v8];
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p %@>", NSStringFromClass(v4), self, -[AVSemanticSegmentationMatte debugDescription](self, "debugDescription")];
}

- (void)dealloc
{
  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer) {
    CFRelease(pixelBuffer);
  }

  v4.receiver = self;
  v4.super_class = (Class)AVSemanticSegmentationMatte;
  [(AVSemanticSegmentationMatte *)&v4 dealloc];
}

+ (AVSemanticSegmentationMatte)semanticSegmentationMatteFromImageSourceAuxiliaryDataType:(CFStringRef)imageSourceAuxiliaryDataType dictionaryRepresentation:(NSDictionary *)imageSourceAuxiliaryDataInfoDictionary error:(NSError *)outError
{
  v44[4] = *MEMORY[0x1E4F143B8];
  CVPixelBufferRef pixelBufferOut = 0;
  id v9 = [(NSDictionary *)imageSourceAuxiliaryDataInfoDictionary objectForKeyedSubscript:*MEMORY[0x1E4F2F370]];
  id v10 = [(NSDictionary *)imageSourceAuxiliaryDataInfoDictionary objectForKeyedSubscript:*MEMORY[0x1E4F2F378]];
  id v11 = [(NSDictionary *)imageSourceAuxiliaryDataInfoDictionary objectForKeyedSubscript:*MEMORY[0x1E4F2F380]];
  id v12 = v11;
  if (v9) {
    BOOL v13 = v10 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  int v14 = !v13;
  if (v13 && !v11)
  {
    fig_log_get_emitter();
LABEL_48:
    FigDebugAssert3();
    v38 = 0;
    int v39 = -11865;
    goto LABEL_35;
  }
  uint64_t v15 = *MEMORY[0x1E4F2F3E0];
  v44[0] = *MEMORY[0x1E4F2F3E8];
  v44[1] = v15;
  uint64_t v16 = *MEMORY[0x1E4F2F3D8];
  v44[2] = *MEMORY[0x1E4F2F3F8];
  v44[3] = v16;
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v44, 4), "containsObject:", imageSourceAuxiliaryDataType) & 1) == 0)goto LABEL_47; {
  if (!v14)
  }
  {
LABEL_26:
    if (FigCFEqual())
    {
      v36 = @"AVSemanticSegmentationMatteTypeSkin";
LABEL_34:
      v37 = [AVSemanticSegmentationMatte alloc];
      v38 = [(AVSemanticSegmentationMatte *)v37 initWithType:v36 pixelBuffer:pixelBufferOut auxiliaryMetadata:v12];
      int v39 = 0;
      goto LABEL_35;
    }
    if (FigCFEqual())
    {
      v36 = @"AVSemanticSegmentationMatteTypeHair";
      goto LABEL_34;
    }
    if (FigCFEqual())
    {
      v36 = @"AVSemanticSegmentationMatteTypeTeeth";
      goto LABEL_34;
    }
    if (FigCFEqual())
    {
      v36 = @"AVSemanticSegmentationMatteTypeGlasses";
      goto LABEL_34;
    }
    fig_log_get_emitter();
    goto LABEL_48;
  }
  uint64_t v17 = objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E4F2FCE0]), "intValue");
  int v18 = objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E4F2FDD8]), "intValue");
  int v19 = objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E4F2FB48]), "intValue");
  int v20 = objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E4F2F538]), "intValue");
  if (!v17 || !v18 || !v19 || (int v21 = v20) == 0)
  {
LABEL_47:
    fig_log_get_emitter();
    goto LABEL_48;
  }
  id v42 = v12;
  v22 = (void *)[a1 _allSupportedSemanticSegmentationMattePixelFormatTypes];
  if (objc_msgSend(v22, "containsObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v17)))
  {
    unint64_t v23 = v19;
    uint64_t v24 = [NSNumber numberWithUnsignedLong:v21];
    CFDictionaryRef v25 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", MEMORY[0x1E4F1CC08], *MEMORY[0x1E4F24D20], v24, *MEMORY[0x1E4F24C98], 0);
    CVReturn v26 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v18, v19, v17, v25, &pixelBufferOut);
    if (!v26)
    {
      CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E4F24BC8], (CFTypeRef)*MEMORY[0x1E4F24BE8], kCVAttachmentMode_ShouldPropagate);
      CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
      size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
      size_t v28 = BytesPerRow;
      if (BytesPerRow >= v21) {
        int64_t v29 = v21;
      }
      else {
        int64_t v29 = BytesPerRow;
      }
      v30 = (char *)[v9 bytes];
      BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBufferOut);
      uint64_t v32 = [v9 length];
      if (v29 <= v32)
      {
        v33 = &v30[v32];
        unint64_t v34 = 1;
        do
        {
          memcpy(BaseAddress, v30, v29);
          if (v34 >= v23) {
            break;
          }
          v35 = &v30[v29 + v21];
          v30 += v21;
          BaseAddress += v28;
          ++v34;
        }
        while (v35 <= v33);
      }
      CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
      id v12 = v42;
      goto LABEL_26;
    }
    int v39 = v26;
    v38 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v38 = 0;
    int v39 = -11864;
  }
LABEL_35:
  if (pixelBufferOut) {
    CFRelease(pixelBufferOut);
  }
  if (outError && v39)
  {
    if (ErrorIsAVFoundationError()) {
      v40 = (NSError *)AVLocalizedError();
    }
    else {
      v40 = (NSError *)AVLocalizedErrorWithUnderlyingOSStatus();
    }
    *outError = v40;
  }
  return v38;
}

- (AVSemanticSegmentationMatteType)matteType
{
  v2 = self->_matteType;

  return v2;
}

- (AVSemanticSegmentationMatte)semanticSegmentationMatteByApplyingExifOrientation:(CGImagePropertyOrientation)exifOrientation
{
  v34[1] = *MEMORY[0x1E4F143B8];
  VTPixelRotationSessionRef pixelRotationSessionOut = 0;
  CVPixelBufferRef pixelBufferOut = 0;
  VTPixelTransferSessionRef pixelTransferSessionOut = 0;
  if (exifOrientation - 1 >= 8)
  {
    id v12 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v12);
    }
    NSLog(&cfstr_SuppressingExc.isa, v12);
    return 0;
  }
  else
  {
    pixelBuffer = self->_pixelBuffer;
    if (!pixelBuffer) {
      goto LABEL_38;
    }
    size_t Width = CVPixelBufferGetWidth(pixelBuffer);
    size_t Height = CVPixelBufferGetHeight(self->_pixelBuffer);
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(self->_pixelBuffer);
    unsigned __int32 v9 = exifOrientation - 2;
    int v10 = 1;
    int v11 = 270;
    switch(v9)
    {
      case 0u:
        goto LABEL_9;
      case 1u:
        int v10 = 0;
        goto LABEL_5;
      case 2u:
LABEL_5:
        int v11 = 180;
        goto LABEL_10;
      case 3u:
        goto LABEL_14;
      case 4u:
        int v10 = 0;
        goto LABEL_12;
      case 5u:
LABEL_12:
        int v11 = 90;
        goto LABEL_14;
      case 6u:
        int v10 = 0;
LABEL_14:
        size_t v14 = Height;
        break;
      default:
        int v10 = 0;
LABEL_9:
        int v11 = 0;
LABEL_10:
        size_t v14 = Width;
        size_t Width = Height;
        break;
    }
    uint64_t v33 = *MEMORY[0x1E4F24D20];
    v34[0] = MEMORY[0x1E4F1CC08];
    CFDictionaryRef v15 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
    CFAllocatorRef v16 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v14, Width, PixelFormatType, v15, &pixelBufferOut))
    {
LABEL_38:
      OSStatus v25 = 0;
    }
    else
    {
      uint64_t v17 = (const void *)*MEMORY[0x1E4F24BE8];
      CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E4F24BC8], (CFTypeRef)*MEMORY[0x1E4F24BE8], kCVAttachmentMode_ShouldPropagate);
      if (((v11 == 0) & ~v10) != 0)
      {
        OSStatus v18 = VTPixelTransferSessionCreate(v16, &pixelTransferSessionOut);
        if (!v18) {
          OSStatus v18 = VTPixelTransferSessionTransferImage(pixelTransferSessionOut, self->_pixelBuffer, pixelBufferOut);
        }
      }
      else
      {
        OSStatus v18 = VTPixelRotationSessionCreate(v16, &pixelRotationSessionOut);
        if (!v18)
        {
          VTPixelRotationSessionRef v19 = pixelRotationSessionOut;
          CFStringRef v20 = (const __CFString *)*MEMORY[0x1E4F450C0];
          int v21 = (const void *)AVCaptureVTRotationFromDegrees(v11);
          VTSessionSetProperty(v19, v20, v21);
          v22 = (const void *)*MEMORY[0x1E4F1CFD0];
          VTSessionSetProperty(pixelRotationSessionOut, (CFStringRef)*MEMORY[0x1E4F45088], (CFTypeRef)*MEMORY[0x1E4F1CFD0]);
          VTSessionSetProperty(pixelRotationSessionOut, (CFStringRef)*MEMORY[0x1E4F45070], v17);
          if (v10)
          {
            BOOL v23 = v11 == 90 || v11 == 270;
            uint64_t v24 = (CFStringRef *)MEMORY[0x1E4F450A0];
            if (!v23) {
              uint64_t v24 = (CFStringRef *)MEMORY[0x1E4F45098];
            }
            VTSessionSetProperty(pixelRotationSessionOut, *v24, v22);
          }
          OSStatus v18 = VTPixelRotationSessionRotateImage(pixelRotationSessionOut, self->_pixelBuffer, pixelBufferOut);
        }
      }
      OSStatus v25 = v18;
    }
    CVReturn v26 = [AVSemanticSegmentationMatte alloc];
    v27 = [(AVSemanticSegmentationMatte *)self matteType];
    if (v25) {
      CVPixelBufferRef v28 = 0;
    }
    else {
      CVPixelBufferRef v28 = pixelBufferOut;
    }
    int64_t v29 = [(AVSemanticSegmentationMatte *)v26 initWithType:v27 pixelBuffer:v28 semanticSegmentationMatteMetadataDictionary:0];
    v29->_version = self->_version;
    CVPixelBufferRelease(pixelBufferOut);
    if (pixelRotationSessionOut) {
      CFRelease(pixelRotationSessionOut);
    }
    if (pixelTransferSessionOut) {
      CFRelease(pixelTransferSessionOut);
    }
    return v29;
  }
}

- (AVSemanticSegmentationMatte)semanticSegmentationMatteByReplacingSemanticSegmentationMatteWithPixelBuffer:(CVPixelBufferRef)pixelBuffer error:(NSError *)outError
{
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
  if ((objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_allSupportedSemanticSegmentationMattePixelFormatTypes"), "containsObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", PixelFormatType)) & 1) == 0)goto LABEL_9; {
  CFTypeRef v8 = CVBufferCopyAttachment(pixelBuffer, (CFStringRef)*MEMORY[0x1E4F24BC8], 0);
  }
  if (v8) {
    CFAutorelease(v8);
  }
  if (FigCFEqual())
  {
    unsigned __int32 v9 = [[AVSemanticSegmentationMatte alloc] initWithType:[(AVSemanticSegmentationMatte *)self matteType] pixelBuffer:pixelBuffer semanticSegmentationMatteMetadataDictionary:0];
  }
  else
  {
LABEL_9:
    fig_log_get_emitter();
    FigDebugAssert3();
    if (outError)
    {
      if (ErrorIsAVFoundationError()) {
        uint64_t v11 = AVLocalizedError();
      }
      else {
        uint64_t v11 = AVLocalizedErrorWithUnderlyingOSStatus();
      }
      id v12 = (NSError *)v11;
      unsigned __int32 v9 = 0;
      *outError = v12;
    }
    else
    {
      unsigned __int32 v9 = 0;
    }
  }

  return v9;
}

- (NSDictionary)dictionaryRepresentationForAuxiliaryDataType:(NSString *)outAuxDataType
{
  v20[4] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(AVSemanticSegmentationMatte *)self pixelFormatType];
  size_t Width = CVPixelBufferGetWidth([(AVSemanticSegmentationMatte *)self mattingImage]);
  size_t Height = CVPixelBufferGetHeight([(AVSemanticSegmentationMatte *)self mattingImage]);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow([(AVSemanticSegmentationMatte *)self mattingImage]);
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
  uint64_t v11 = (void *)v10;
  id v12 = [(AVSemanticSegmentationMatte *)self mattingImage];
  if (CVPixelBufferLockBaseAddress(v12, 1uLL)) {
    return 0;
  }
  BaseAddress = CVPixelBufferGetBaseAddress(v12);
  memcpy((void *)[v11 mutableBytes], BaseAddress, v9 * Height);
  CVPixelBufferUnlockBaseAddress(v12, 1uLL);
  size_t v14 = (NSDictionary *)[MEMORY[0x1E4F1CA60] dictionary];
  [(NSDictionary *)v14 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F2F370]];
  v19[0] = *MEMORY[0x1E4F2FCE0];
  v20[0] = [NSNumber numberWithUnsignedInt:v5];
  v19[1] = *MEMORY[0x1E4F2FDD8];
  v20[1] = [NSNumber numberWithUnsignedLong:Width];
  v19[2] = *MEMORY[0x1E4F2FB48];
  v20[2] = [NSNumber numberWithUnsignedLong:Height];
  v19[3] = *MEMORY[0x1E4F2F538];
  v20[3] = [NSNumber numberWithUnsignedLong:v9];
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:4];
  [(NSDictionary *)v14 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F2F378]];
  CFAllocatorRef v16 = [(AVSemanticSegmentationMatte *)self copyAuxiliaryMetadata];
  if (v16)
  {
    uint64_t v17 = v16;
    [(NSDictionary *)v14 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F2F380]];
    CFRelease(v17);
  }
  if (outAuxDataType) {
    *outAuxDataType = (NSString *)[(AVSemanticSegmentationMatte *)self auxiliaryImageType];
  }
  return v14;
}

- (OSType)pixelFormatType
{
  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer) {
    LODWORD(pixelBuffer) = CVPixelBufferGetPixelFormatType(pixelBuffer);
  }
  return pixelBuffer;
}

- (CVPixelBufferRef)mattingImage
{
  return self->_pixelBuffer;
}

- (signed)versionMajor
{
  return HIWORD(self->_version);
}

- (signed)versionMinor
{
  return self->_version;
}

- (AVSemanticSegmentationMatte)initWithType:(id)a3 pixelBuffer:(__CVBuffer *)a4 semanticSegmentationMatteMetadataDictionary:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)AVSemanticSegmentationMatte;
  CFTypeRef v8 = [(AVSemanticSegmentationMatte *)&v13 init];
  if (v8)
  {
    size_t v9 = (void *)[(id)objc_opt_class() _allSupportedSemanticSegmentationMatteTypes];
    if ([v9 containsObject:a3])
    {
      v8->_matteType = (NSString *)a3;
      if (a4) {
        uint64_t v10 = (__CVBuffer *)CFRetain(a4);
      }
      else {
        uint64_t v10 = 0;
      }
      v8->_pixelBuffer = v10;
      if (a5) {
        v8->_version = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F52848]), "intValue");
      }
    }
    else
    {
      uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector(), 0, v9);

      if (AVCaptureShouldThrowForAPIViolations()) {
        objc_exception_throw(v11);
      }
      NSLog(&cfstr_SuppressingExc.isa, v11);
      return 0;
    }
  }
  return v8;
}

- (AVSemanticSegmentationMatte)initWithType:(id)a3 pixelBuffer:(__CVBuffer *)a4 auxiliaryMetadata:(CGImageMetadata *)a5
{
  v6 = [(AVSemanticSegmentationMatte *)self initWithType:a3 pixelBuffer:a4 semanticSegmentationMatteMetadataDictionary:0];
  v7 = v6;
  if (a5 && v6) {
    v6->_version = objc_msgSend(AVAuxiliaryMetadataStringTagWithPrefixedKey(a5, *MEMORY[0x1E4F52838], *MEMORY[0x1E4F52840]), "intValue");
  }
  return v7;
}

- (CGImageMetadata)copyAuxiliaryMetadata
{
  Mutable = CGImageMetadataCreateMutable();
  objc_super v4 = Mutable;
  if (Mutable)
  {
    CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F52830];
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F52838];
    if (!CGImageMetadataRegisterNamespaceForPrefix(Mutable, (CFStringRef)*MEMORY[0x1E4F52830], (CFStringRef)*MEMORY[0x1E4F52838], 0))goto LABEL_7; {
    if (!self->_version)
    }
    {
LABEL_8:
      CFRelease(v4);
      return 0;
    }
    if (!AVAuxiliaryMetadataAddValue(v4, v5, v6, (CFStringRef)*MEMORY[0x1E4F52840], (const void *)objc_msgSend(NSNumber, "numberWithInt:")))
    {
LABEL_7:
      fig_log_get_emitter();
      FigDebugAssert3();
      goto LABEL_8;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v4;
}

- (__CFString)auxiliaryImageType
{
  matteType = (__CFString *)self->_matteType;
  if (matteType == @"AVSemanticSegmentationMatteTypeSkin")
  {
    objc_super v4 = (__CFString **)MEMORY[0x1E4F2F3E8];
    return *v4;
  }
  if (matteType == @"AVSemanticSegmentationMatteTypeHair")
  {
    objc_super v4 = (__CFString **)MEMORY[0x1E4F2F3E0];
    return *v4;
  }
  if (matteType == @"AVSemanticSegmentationMatteTypeTeeth")
  {
    objc_super v4 = (__CFString **)MEMORY[0x1E4F2F3F8];
    return *v4;
  }
  if (matteType == @"AVSemanticSegmentationMatteTypeGlasses") {
    return (__CFString *)*MEMORY[0x1E4F2F3D8];
  }
  else {
    return 0;
  }
}

+ (id)_allSupportedSemanticSegmentationMatteTypes
{
  v3[4] = *MEMORY[0x1E4F143B8];
  v3[0] = @"AVSemanticSegmentationMatteTypeHair";
  v3[1] = @"AVSemanticSegmentationMatteTypeSkin";
  v3[2] = @"AVSemanticSegmentationMatteTypeTeeth";
  v3[3] = @"AVSemanticSegmentationMatteTypeGlasses";
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:4];
}

+ (id)_allSupportedSemanticSegmentationMattePixelFormatTypes
{
  return &unk_1EF4FA938;
}

@end