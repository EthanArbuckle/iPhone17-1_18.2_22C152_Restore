@interface MFHardwareJPEGScaler
- (BOOL)_decodeImageToIOSurface;
- (BOOL)_isJPEGImage:(CGImageSource *)a3;
- (BOOL)scaleImageToFitLargestDimension:(id)a3 dataConsumer:(id)a4;
- (MFHardwareJPEGScaler)initWithImageData:(id)a3 imageSource:(CGImageSource *)a4;
- (void)dealloc;
@end

@implementation MFHardwareJPEGScaler

- (MFHardwareJPEGScaler)initWithImageData:(id)a3 imageSource:(CGImageSource *)a4
{
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MFHardwareJPEGScaler;
  v8 = [(MFHardwareJPEGScaler *)&v15 init];
  if (v8 && MGGetBoolAnswer() && [(MFHardwareJPEGScaler *)v8 _isJPEGImage:a4])
  {
    objc_storeStrong((id *)&v8->_imageData, a3);
    CFDictionaryRef v9 = CGImageSourceCopyPropertiesAtIndex(a4, 0, 0);
    v8->_imageProperties = v9;
    int v10 = objc_msgSend((id)CFDictionaryGetValue(v9, (const void *)*MEMORY[0x1E4F2FD00]), "intValue");
    int v11 = objc_msgSend((id)CFDictionaryGetValue(v8->_imageProperties, (const void *)*MEMORY[0x1E4F2FCE8]), "intValue");
    BOOL v13 = v10 < 8185 && v11 < 4093;
    v8->_canHardwareScaleImage = v13;
  }

  return v8;
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
  v5.super_class = (Class)MFHardwareJPEGScaler;
  [(MFHardwareJPEGScaler *)&v5 dealloc];
}

- (BOOL)_isJPEGImage:(CGImageSource *)a3
{
  v3 = [MEMORY[0x1E4F442D8] typeWithIdentifier:CGImageSourceGetType(a3)];
  char v4 = [v3 conformsToType:*MEMORY[0x1E4F44410]];

  return v4;
}

- (BOOL)_decodeImageToIOSurface
{
  id v3 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  char v4 = objc_msgSend(v3, "initWithObjectsAndKeys:", *MEMORY[0x1E4F1CFD0], *MEMORY[0x1E4F580E0], 0);
  int v5 = MEMORY[0x1B3E86520](self->_imageData, v4, &self->_ioSurfaceRef);
  if (v5) {
    self->_canHardwareScaleImage = 0;
  }
  BOOL v6 = v5 != 0;

  return v6;
}

- (BOOL)scaleImageToFitLargestDimension:(id)a3 dataConsumer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_canHardwareScaleImage || (int)[v6 intValue] > 4092) {
    goto LABEL_3;
  }
  ioSurfaceRef = self->_ioSurfaceRef;
  if (!ioSurfaceRef)
  {
    if ([(MFHardwareJPEGScaler *)self _decodeImageToIOSurface])
    {
LABEL_3:
      BOOL v8 = 0;
      goto LABEL_23;
    }
    ioSurfaceRef = self->_ioSurfaceRef;
  }
  VTPixelTransferSessionRef pixelTransferSessionOut = 0;
  CVPixelBufferRef pixelBufferOut = 0;
  CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x1E4F1CF80], ioSurfaceRef, 0, &pixelBufferOut);
  VTPixelTransferSessionCreate(0, &pixelTransferSessionOut);
  int Width = IOSurfaceGetWidth(self->_ioSurfaceRef);
  IOSurfaceGetHeight(self->_ioSurfaceRef);
  IOSurfaceRef buffer = 0;
  [v6 intValue];
  CVPixelBufferRef pixelBuffer = 0;
  if (Width < 4093)
  {
    FigCreateIOSurfaceBackedCVPixelBuffer();
    VTPixelTransferSessionTransferImage(pixelTransferSessionOut, pixelBufferOut, pixelBuffer);
    CVPixelBufferRelease(pixelBufferOut);
    CVPixelBufferRef pixelBufferOut = 0;
  }
  else
  {
    CVPixelBufferRef destinationBuffer = 0;
    FigCreateIOSurfaceBackedCVPixelBuffer();
    VTPixelTransferSessionTransferImage(pixelTransferSessionOut, pixelBufferOut, 0);
    CVPixelBufferRelease(pixelBufferOut);
    CVPixelBufferRef pixelBufferOut = 0;
    FigCreateIOSurfaceBackedCVPixelBuffer();
    VTPixelTransferSessionTransferImage(pixelTransferSessionOut, 0, pixelBuffer);
    CVPixelBufferRelease(0);
  }
  IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(pixelBuffer);
  CFRetain(IOSurface);
  CVPixelBufferRelease(pixelBuffer);
  id v12 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  LODWORD(v13) = *(_DWORD *)"fff?";
  v14 = [NSNumber numberWithFloat:v13];
  objc_super v15 = objc_msgSend(v12, "initWithObjectsAndKeys:", v14, *MEMORY[0x1E4F2F430], 0);

  LODWORD(destinationBuffer) = 0;
  int v16 = MEMORY[0x1B3E86500](IOSurface, v15, &buffer, &destinationBuffer);
  BOOL v8 = v16 == 0;
  if (v16)
  {
    if (!IOSurface) {
      goto LABEL_18;
    }
  }
  else
  {
    IOSurfaceLock(buffer, 1u, 0);
    id v17 = objc_alloc(MEMORY[0x1E4F734C0]);
    BaseAddress = IOSurfaceGetBaseAddress(buffer);
    v19 = (void *)[v17 initWithBytesNoCopy:BaseAddress length:(int)destinationBuffer freeWhenDone:0];
    if (self->_imageProperties)
    {
      EXIFJPEGData = (void *)CGImageCreateEXIFJPEGData();
      [v7 appendData:EXIFJPEGData];
    }
    else
    {
      [v7 appendData:v19];
    }
    IOSurfaceUnlock(buffer, 1u, 0);

    if (!IOSurface) {
      goto LABEL_18;
    }
  }
  CFRelease(IOSurface);
LABEL_18:
  if (buffer) {
    CFRelease(buffer);
  }
  if (pixelTransferSessionOut) {
    CFRelease(pixelTransferSessionOut);
  }

LABEL_23:
  return v8;
}

- (void).cxx_destruct
{
}

@end