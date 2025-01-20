@interface IMEmbeddedHardwareJPEGTranscoder
- (BOOL)_decodeImageToIOSurface;
- (BOOL)_isJPEGImage:(CGImageSource *)a3;
- (BOOL)scaleImageToFitLargestDimension:(id)a3 outputData:(id *)a4;
- (IMEmbeddedHardwareJPEGTranscoder)initWithImageData:(id)a3 imageSource:(CGImageSource *)a4;
- (double)targetJPEGCompressionValue;
- (void)dealloc;
- (void)setTargetJPEGCompressionValue:(double)a3;
@end

@implementation IMEmbeddedHardwareJPEGTranscoder

- (IMEmbeddedHardwareJPEGTranscoder)initWithImageData:(id)a3 imageSource:(CGImageSource *)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v34.receiver = self;
  v34.super_class = (Class)IMEmbeddedHardwareJPEGTranscoder;
  v6 = [(IMEmbeddedHardwareJPEGTranscoder *)&v34 init];
  if (v6
    && MGGetBoolAnswer()
    && objc_msgSend__isJPEGImage_(v6, v7, (uint64_t)a4, v8, v9, v10, v11))
  {
    v6->_imageData = (NSData *)a3;
    CFDictionaryRef v12 = CGImageSourceCopyPropertiesAtIndex(a4, 0, 0);
    v6->_imageProperties = v12;
    Value = (void *)CFDictionaryGetValue(v12, (const void *)*MEMORY[0x263F0F4F8]);
    int v20 = objc_msgSend_intValue(Value, v14, v15, v16, v17, v18, v19);
    v21 = (void *)CFDictionaryGetValue(v6->_imageProperties, (const void *)*MEMORY[0x263F0F4F0]);
    int v28 = objc_msgSend_intValue(v21, v22, v23, v24, v25, v26, v27);
    if (IMOSLoggingEnabled())
    {
      v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        imageProperties = v6->_imageProperties;
        *(_DWORD *)buf = 138412290;
        v36 = imageProperties;
        _os_log_impl(&dword_22B280000, v29, OS_LOG_TYPE_INFO, "Input image properties: %@", buf, 0xCu);
      }
    }
    BOOL v32 = v20 <= 0x4000 && v28 <= 0x4000;
    v6->_canHardwareScaleImage = v32;
  }
  return v6;
}

- (void)dealloc
{
  imageProperties = self->_imageProperties;
  if (imageProperties) {
    CFRelease(imageProperties);
  }
  ioSurfaceRef = self->_ioSurfaceRef;
  if (ioSurfaceRef) {
    CFRelease(ioSurfaceRef);
  }
  v5.receiver = self;
  v5.super_class = (Class)IMEmbeddedHardwareJPEGTranscoder;
  [(IMEmbeddedHardwareJPEGTranscoder *)&v5 dealloc];
}

- (BOOL)_isJPEGImage:(CGImageSource *)a3
{
  CFStringRef Type = CGImageSourceGetType(a3);
  if (Type) {
    LOBYTE(Type) = UTTypeConformsTo(Type, (CFStringRef)*MEMORY[0x263F01A80]) != 0;
  }
  return (char)Type;
}

- (BOOL)_decodeImageToIOSurface
{
  id v3 = objc_alloc(NSDictionary);
  uint64_t v9 = objc_msgSend_initWithObjectsAndKeys_(v3, v4, *MEMORY[0x263EFFB40], v5, v6, v7, v8, *MEMORY[0x263F2F958], 0);
  int v10 = CMPhotoJPEGCreateIOSurfaceFromJPEG();

  if (v10) {
    self->_canHardwareScaleImage = 0;
  }

  self->_imageData = 0;
  return v10 != 0;
}

- (BOOL)scaleImageToFitLargestDimension:(id)a3 outputData:(id *)a4
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  if (!a4) {
    return 0;
  }
  *a4 = 0;
  if (!self->_canHardwareScaleImage
    || (int)objc_msgSend_intValue(a3, a2, (uint64_t)a3, (uint64_t)a4, v4, v5, v6) > 0x4000)
  {
    return 0;
  }
  ioSurfaceRef = self->_ioSurfaceRef;
  if (!ioSurfaceRef)
  {
    if (objc_msgSend__decodeImageToIOSurface(self, 0, v10, v11, v12, v13, v14)) {
      return 0;
    }
    ioSurfaceRef = self->_ioSurfaceRef;
  }
  VTPixelTransferSessionRef pixelTransferSessionOut = 0;
  CVPixelBufferRef pixelBufferOut = 0;
  CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x263EFFB08], ioSurfaceRef, 0, &pixelBufferOut);
  VTPixelTransferSessionCreate(0, &pixelTransferSessionOut);
  uint64_t v18 = self->_ioSurfaceRef;
  if (qword_2683E9530 != -1) {
    dispatch_once(&qword_2683E9530, &unk_26DE875B8);
  }
  off_2683E9528(v18);
  uint64_t v19 = self->_ioSurfaceRef;
  if (qword_2683E9540 != -1) {
    dispatch_once(&qword_2683E9540, &unk_26DE87678);
  }
  off_2683E9538(v19);
  objc_msgSend_intValue(a3, v20, v21, v22, v23, v24, v25);
  FigCreateIOSurfaceBackedCVPixelBuffer();
  VTPixelTransferSessionTransferImage(pixelTransferSessionOut, pixelBufferOut, 0);
  CVPixelBufferRelease(pixelBufferOut);
  CVPixelBufferRef pixelBufferOut = 0;
  IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(0);
  CFRetain(IOSurface);
  CVPixelBufferRelease(0);
  objc_msgSend_targetJPEGCompressionValue(self, v27, v28, v29, v30, v31, v32);
  double v34 = v33;
  if (v33 <= 0.0)
  {
    double v34 = 0.899999976;
  }
  else
  {
    uint64_t v35 = 926232686;
    if (v33 == 0.75)
    {
LABEL_25:
      id v51 = objc_alloc(NSDictionary);
      uint64_t v57 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v52, v35, v53, v54, v55, v56);
      uint64_t v50 = objc_msgSend_initWithObjectsAndKeys_(v51, v58, v57, v59, v60, v61, v62, *MEMORY[0x263F2F960], 0);
      goto LABEL_26;
    }
    if (v33 == 0.800000012)
    {
      uint64_t v35 = 942682222;
      goto LABEL_25;
    }
    if (v33 == 0.824999988)
    {
      uint64_t v35 = 942814579;
      goto LABEL_25;
    }
    if (v33 == 0.850000024)
    {
      uint64_t v35 = 943009907;
      goto LABEL_25;
    }
    if (v33 == 0.899999976)
    {
      uint64_t v35 = 959459438;
      goto LABEL_25;
    }
  }
  id v36 = objc_alloc(NSDictionary);
  *(float *)&double v37 = v34;
  uint64_t v44 = objc_msgSend_numberWithFloat_(NSNumber, v38, v39, v40, v41, v42, v43, v37);
  uint64_t v50 = objc_msgSend_initWithObjectsAndKeys_(v36, v45, v44, v46, v47, v48, v49, *MEMORY[0x263F0EFE8], 0);
LABEL_26:
  v63 = (void *)v50;
  int v64 = CMPhotoJPEGCreateJPEGFromIOSurface();

  BOOL v15 = v64 == 0;
  if (!v64)
  {
    if (qword_2683E9560 != -1) {
      dispatch_once(&qword_2683E9560, &unk_26DE87638);
    }
    off_2683E9558(0, 1, 0);
    id v65 = objc_alloc(MEMORY[0x263EFF8F8]);
    if (qword_2683E9550 != -1) {
      dispatch_once(&qword_2683E9550, &unk_26DE87698);
    }
    uint64_t v66 = off_2683E9548(0);
    v70 = objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(v65, v67, v66, 0, 0, v68, v69);
    imageProperties = self->_imageProperties;
    int v72 = IMOSLoggingEnabled();
    if (imageProperties)
    {
      if (v72)
      {
        v73 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v79 = imageProperties;
          _os_log_impl(&dword_22B280000, v73, OS_LOG_TYPE_INFO, "Out image properties: %@", buf, 0xCu);
        }
      }
      id EXIFJPEGData = (id)CGImageCreateEXIFJPEGData();
    }
    else
    {
      if (v72)
      {
        v75 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v79 = 0;
          _os_log_impl(&dword_22B280000, v75, OS_LOG_TYPE_INFO, "Empty image properties: %@", buf, 0xCu);
        }
      }
      id EXIFJPEGData = v70;
    }
    *a4 = EXIFJPEGData;

    if (qword_2683E9570 != -1) {
      dispatch_once(&qword_2683E9570, &unk_26DE87658);
    }
    off_2683E9568(0, 1, 0);
  }
  if (IOSurface) {
    CFRelease(IOSurface);
  }
  if (pixelTransferSessionOut) {
    CFRelease(pixelTransferSessionOut);
  }
  return v15;
}

- (double)targetJPEGCompressionValue
{
  return self->_targetJPEGCompressionValue;
}

- (void)setTargetJPEGCompressionValue:(double)a3
{
  self->_targetJPEGCompressionValue = a3;
}

@end