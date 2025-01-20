@interface BSCGImageFromIOSurfaceBuilder
- (BOOL)isOpaque;
- (CGImage)buildCGImage;
- (id)setOpaque:(BOOL)a3;
- (void)dealloc;
@end

@implementation BSCGImageFromIOSurfaceBuilder

- (void)dealloc
{
  image = self->_image;
  if (image)
  {
    CFRelease(image);
    self->_image = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)BSCGImageFromIOSurfaceBuilder;
  [(BSCGImageFromIOSurfaceBuilder *)&v4 dealloc];
}

- (id)setOpaque:(BOOL)a3
{
  if (*((unsigned char *)self + 25) != a3)
  {
    *((unsigned char *)self + 25) = a3;
    *((unsigned char *)self + 24) = 1;
  }
  return self;
}

- (CGImage)buildCGImage
{
  v33[5] = *MEMORY[0x1E4F143B8];
  BOOL isDirty = self->_isDirty;
  image = self->_image;
  if (isDirty)
  {
    if (image)
    {
      CFRelease(image);
      self->_image = 0;
    }
  }
  else if (image)
  {
    goto LABEL_27;
  }
  self->_BOOL isDirty = 0;
  surface = self->_surface;
  if (surface)
  {
    v6 = surface;
    [(IOSurface *)v6 lockWithOptions:1 seed:0];
    OSType v7 = [(IOSurface *)v6 pixelFormat];
    if (v7 == 1999843442 || v7 == 1647534392)
    {
      v33[0] = *MEMORY[0x1E4F2F400];
      *(void *)&v31[0] = &unk_1ED784908;
      v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v33 count:1];
      v9 = (CGImage *)CGImageCreateFromIOSurface();
      [(IOSurface *)v6 unlockWithOptions:1 seed:0];
    }
    else
    {
      v10 = v6;
      v11 = [(IOSurface *)v10 baseAddress];
      size_t v12 = [(IOSurface *)v10 bytesPerRow];
      size_t v13 = [(IOSurface *)v10 width];
      size_t v14 = [(IOSurface *)v10 height];
      size_t v15 = [(IOSurface *)v10 allocationSize];
      CFRetain(v10);
      v16 = CGDataProviderCreateWithData(v10, v11, v15, (CGDataProviderReleaseDataCallback)unlockIOSurface);
      [(IOSurface *)v10 incrementUseCount];
      BOOL isOpaque = self->_isOpaque;
      v18 = v10;
      CFTypeRef v19 = IOSurfaceCopyValue(v18, (CFStringRef)*MEMORY[0x1E4F2F068]);
      v20 = v19;
      if (v19)
      {
        DeviceRGB = CGColorSpaceCreateWithPropertyList(v19);
        CFRelease(v20);
      }
      else
      {
        int v32 = 0;
        memset(v31, 0, sizeof(v31));
        DeviceRGB = 0;
        if (!IOSurfaceGetBulkAttachments())
        {
          uint64_t v27 = 0;
          v28 = &v27;
          uint64_t v29 = 0x2020000000;
          v22 = (uint64_t (*)(_OWORD *))_MergedGlobals_4;
          v30 = _MergedGlobals_4;
          if (!_MergedGlobals_4)
          {
            v33[0] = MEMORY[0x1E4F143A8];
            v33[1] = 3221225472;
            v33[2] = __getCVCreateColorSpaceFromIOSurfaceBulkAttachmentsSymbolLoc_block_invoke;
            v33[3] = &unk_1E54455A0;
            v33[4] = &v27;
            __getCVCreateColorSpaceFromIOSurfaceBulkAttachmentsSymbolLoc_block_invoke(v33);
            v22 = (uint64_t (*)(_OWORD *))v28[3];
          }
          _Block_object_dispose(&v27, 8);
          if (!v22)
          {
            v25 = [MEMORY[0x1E4F28B00] currentHandler];
            v26 = [NSString stringWithUTF8String:"CGColorSpaceRef softlinkCVCreateColorSpaceFromIOSurfaceBulkAttachments(const IOSurfaceColorAndSpatialKeys *)"];
            objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, @"IOSurface+BaseBoard.m", 26, @"%s", dlerror());

            __break(1u);
          }
          DeviceRGB = (CGColorSpace *)v22(v31);
        }
      }
      if (!DeviceRGB) {
        DeviceRGB = CGColorSpaceCreateDeviceRGB();
      }

      if (isOpaque) {
        CGBitmapInfo v23 = 8198;
      }
      else {
        CGBitmapInfo v23 = 8194;
      }
      v9 = CGImageCreate(v13, v14, 8uLL, 0x20uLL, v12, DeviceRGB, v23, v16, 0, 1, kCGRenderingIntentDefault);
      CGImageSetProperty();
      if (DeviceRGB) {
        CGColorSpaceRelease(DeviceRGB);
      }
      CGDataProviderRelease(v16);
    }
  }
  else
  {
    v9 = 0;
  }
  self->_image = v9;
  image = v9;
LABEL_27:
  return (CGImage *)CFRetain(image);
}

- (BOOL)isOpaque
{
  return self->_isOpaque;
}

- (void).cxx_destruct
{
}

@end