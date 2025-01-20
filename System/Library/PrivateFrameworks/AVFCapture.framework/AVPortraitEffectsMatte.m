@interface AVPortraitEffectsMatte
+ (AVPortraitEffectsMatte)portraitEffectsMatteFromDictionaryRepresentation:(NSDictionary *)imageSourceAuxDataInfoDictionary error:(NSError *)outError;
+ (id)_allSupportedPortraitEffectsMattePixelFormatTypes;
+ (void)initialize;
- (AVPortraitEffectsMatte)initWithPixelBuffer:(__CVBuffer *)a3 auxiliaryMetadata:(CGImageMetadata *)a4;
- (AVPortraitEffectsMatte)initWithPixelBuffer:(__CVBuffer *)a3 portraitEffectsMatteMetadataDictionary:(id)a4;
- (AVPortraitEffectsMatte)portraitEffectsMatteByApplyingExifOrientation:(CGImagePropertyOrientation)exifOrientation;
- (AVPortraitEffectsMatte)portraitEffectsMatteByReplacingPortraitEffectsMatteWithPixelBuffer:(CVPixelBufferRef)pixelBuffer error:(NSError *)outError;
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

@implementation AVPortraitEffectsMatte

+ (void)initialize
{
}

- (id)debugDescription
{
  [(AVPortraitEffectsMatte *)self pixelFormatType];
  uint64_t v3 = AVStringForOSType();
  internal = self->_internal;
  pixelBuffer = internal->pixelBuffer;
  if (!pixelBuffer)
  {
    size_t Width = 0;
    goto LABEL_5;
  }
  size_t Width = CVPixelBufferGetWidth(pixelBuffer);
  internal = self->_internal;
  v7 = internal->pixelBuffer;
  if (!v7)
  {
LABEL_5:
    size_t Height = 0;
    goto LABEL_6;
  }
  size_t Height = CVPixelBufferGetHeight(v7);
  internal = self->_internal;
LABEL_6:
  uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @" v.%d.%d", (internal->version >> 16), (unsigned __int16)internal->version);
  return (id)[NSString stringWithFormat:@"%@ %zux%zu%@", v3, Width, Height, v9];
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p %@>", NSStringFromClass(v4), self, -[AVPortraitEffectsMatte debugDescription](self, "debugDescription")];
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
  v5.super_class = (Class)AVPortraitEffectsMatte;
  [(AVPortraitEffectsMatte *)&v5 dealloc];
}

+ (AVPortraitEffectsMatte)portraitEffectsMatteFromDictionaryRepresentation:(NSDictionary *)imageSourceAuxDataInfoDictionary error:(NSError *)outError
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
  v22 = (void *)[a1 _allSupportedPortraitEffectsMattePixelFormatTypes];
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
  CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E4F24BC8], (CFTypeRef)*MEMORY[0x1E4F24BE8], kCVAttachmentMode_ShouldPropagate);
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
  v37 = [AVPortraitEffectsMatte alloc];
  v38 = [(AVPortraitEffectsMatte *)v37 initWithPixelBuffer:pixelBufferOut auxiliaryMetadata:v13];
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

- (AVPortraitEffectsMatte)portraitEffectsMatteByApplyingExifOrientation:(CGImagePropertyOrientation)exifOrientation
{
  v33[1] = *MEMORY[0x1E4F143B8];
  VTPixelRotationSessionRef pixelRotationSessionOut = 0;
  CVPixelBufferRef pixelBufferOut = 0;
  VTPixelTransferSessionRef pixelTransferSessionOut = 0;
  if (exifOrientation - 1 >= 8)
  {
    v12 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v12);
    }
    NSLog(&cfstr_SuppressingExc.isa, v12);
    return 0;
  }
  else
  {
    pixelBuffer = self->_internal->pixelBuffer;
    if (!pixelBuffer) {
      goto LABEL_38;
    }
    size_t Width = CVPixelBufferGetWidth(pixelBuffer);
    size_t Height = CVPixelBufferGetHeight(self->_internal->pixelBuffer);
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(self->_internal->pixelBuffer);
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
    uint64_t v32 = *MEMORY[0x1E4F24D20];
    v33[0] = MEMORY[0x1E4F1CC08];
    CFDictionaryRef v15 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
    CFAllocatorRef v16 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v14, Width, PixelFormatType, v15, &pixelBufferOut))
    {
LABEL_38:
      OSStatus v25 = 0;
    }
    else
    {
      int v17 = (const void *)*MEMORY[0x1E4F24BE8];
      CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E4F24BC8], (CFTypeRef)*MEMORY[0x1E4F24BE8], kCVAttachmentMode_ShouldPropagate);
      if (((v11 == 0) & ~v10) != 0)
      {
        OSStatus v18 = VTPixelTransferSessionCreate(v16, &pixelTransferSessionOut);
        if (!v18) {
          OSStatus v18 = VTPixelTransferSessionTransferImage(pixelTransferSessionOut, self->_internal->pixelBuffer, pixelBufferOut);
        }
      }
      else
      {
        OSStatus v18 = VTPixelRotationSessionCreate(v16, &pixelRotationSessionOut);
        if (!v18)
        {
          VTPixelRotationSessionRef v19 = pixelRotationSessionOut;
          CFStringRef v20 = (const __CFString *)*MEMORY[0x1E4F450C0];
          int64_t v21 = (const void *)AVCaptureVTRotationFromDegrees(v11);
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
          OSStatus v18 = VTPixelRotationSessionRotateImage(pixelRotationSessionOut, self->_internal->pixelBuffer, pixelBufferOut);
        }
      }
      OSStatus v25 = v18;
    }
    CFDictionaryRef v26 = [AVPortraitEffectsMatte alloc];
    if (v25) {
      CVPixelBufferRef v27 = 0;
    }
    else {
      CVPixelBufferRef v27 = pixelBufferOut;
    }
    CVPixelBufferRef v28 = [(AVPortraitEffectsMatte *)v26 initWithPixelBuffer:v27 portraitEffectsMatteMetadataDictionary:0];
    v28->_internal->version = self->_internal->version;
    CVPixelBufferRelease(pixelBufferOut);
    if (pixelRotationSessionOut) {
      CFRelease(pixelRotationSessionOut);
    }
    if (pixelTransferSessionOut) {
      CFRelease(pixelTransferSessionOut);
    }
    return v28;
  }
}

- (AVPortraitEffectsMatte)portraitEffectsMatteByReplacingPortraitEffectsMatteWithPixelBuffer:(CVPixelBufferRef)pixelBuffer error:(NSError *)outError
{
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
  if ((objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_allSupportedPortraitEffectsMattePixelFormatTypes"), "containsObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", PixelFormatType)) & 1) == 0)goto LABEL_9; {
  CFTypeRef v7 = CVBufferCopyAttachment(pixelBuffer, (CFStringRef)*MEMORY[0x1E4F24BC8], 0);
  }
  if (v7) {
    CFAutorelease(v7);
  }
  if (FigCFEqual())
  {
    id v8 = [[AVPortraitEffectsMatte alloc] initWithPixelBuffer:pixelBuffer portraitEffectsMatteMetadataDictionary:0];
  }
  else
  {
LABEL_9:
    fig_log_get_emitter();
    FigDebugAssert3();
    if (outError)
    {
      if (ErrorIsAVFoundationError()) {
        uint64_t v10 = AVLocalizedError();
      }
      else {
        uint64_t v10 = AVLocalizedErrorWithUnderlyingOSStatus();
      }
      int v11 = (NSError *)v10;
      id v8 = 0;
      *outError = v11;
    }
    else
    {
      id v8 = 0;
    }
  }

  return v8;
}

- (NSDictionary)dictionaryRepresentationForAuxiliaryDataType:(NSString *)outAuxDataType
{
  v20[4] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(AVPortraitEffectsMatte *)self pixelFormatType];
  size_t Width = CVPixelBufferGetWidth([(AVPortraitEffectsMatte *)self mattingImage]);
  size_t Height = CVPixelBufferGetHeight([(AVPortraitEffectsMatte *)self mattingImage]);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow([(AVPortraitEffectsMatte *)self mattingImage]);
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
  int v11 = (void *)v10;
  v12 = [(AVPortraitEffectsMatte *)self mattingImage];
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
  CFAllocatorRef v16 = [(AVPortraitEffectsMatte *)self copyAuxiliaryMetadata];
  if (v16)
  {
    int v17 = v16;
    [(NSDictionary *)v14 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F2F380]];
    CFRelease(v17);
  }
  if (outAuxDataType) {
    *outAuxDataType = (NSString *)[(AVPortraitEffectsMatte *)self auxiliaryImageType];
  }
  return v14;
}

- (OSType)pixelFormatType
{
  pixelBuffer = self->_internal->pixelBuffer;
  if (pixelBuffer) {
    LODWORD(pixelBuffer) = CVPixelBufferGetPixelFormatType(pixelBuffer);
  }
  return pixelBuffer;
}

- (CVPixelBufferRef)mattingImage
{
  return self->_internal->pixelBuffer;
}

- (signed)versionMajor
{
  return HIWORD(self->_internal->version);
}

- (signed)versionMinor
{
  return self->_internal->version;
}

- (AVPortraitEffectsMatte)initWithPixelBuffer:(__CVBuffer *)a3 portraitEffectsMatteMetadataDictionary:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)AVPortraitEffectsMatte;
  v6 = [(AVPortraitEffectsMatte *)&v10 init];
  if (v6)
  {
    internal = objc_alloc_init(AVPortraitEffectsMatteInternal);
    v6->_internal = internal;
    if (internal)
    {
      if (a3)
      {
        id v8 = (__CVBuffer *)CFRetain(a3);
        internal = v6->_internal;
      }
      else
      {
        id v8 = 0;
      }
      internal->pixelBuffer = v8;
      if (a4) {
        v6->_internal->version = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F52800]), "intValue");
      }
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (AVPortraitEffectsMatte)initWithPixelBuffer:(__CVBuffer *)a3 auxiliaryMetadata:(CGImageMetadata *)a4
{
  uint64_t v5 = [(AVPortraitEffectsMatte *)self initWithPixelBuffer:a3 portraitEffectsMatteMetadataDictionary:0];
  v6 = v5;
  if (a4 && v5) {
    v5->_internal->version = objc_msgSend(AVAuxiliaryMetadataStringTagWithPrefixedKey(a4, *MEMORY[0x1E4F527F0], *MEMORY[0x1E4F527F8]), "intValue");
  }
  return v6;
}

- (CGImageMetadata)copyAuxiliaryMetadata
{
  Mutable = CGImageMetadataCreateMutable();
  v4 = Mutable;
  if (Mutable)
  {
    CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F527E8];
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F527F0];
    if (!CGImageMetadataRegisterNamespaceForPrefix(Mutable, (CFStringRef)*MEMORY[0x1E4F527E8], (CFStringRef)*MEMORY[0x1E4F527F0], 0))goto LABEL_7; {
    if (!self->_internal->version)
    }
    {
LABEL_8:
      CFRelease(v4);
      return 0;
    }
    if (!AVAuxiliaryMetadataAddValue(v4, v5, v6, (CFStringRef)*MEMORY[0x1E4F527F8], (const void *)objc_msgSend(NSNumber, "numberWithInt:")))
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
  return (__CFString *)*MEMORY[0x1E4F2F3D0];
}

+ (id)_allSupportedPortraitEffectsMattePixelFormatTypes
{
  return &unk_1EF4FAB18;
}

@end