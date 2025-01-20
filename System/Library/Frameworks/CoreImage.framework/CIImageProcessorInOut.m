@interface CIImageProcessorInOut
- (BOOL)usesSRGBTransferFunction;
- (CGRect)region;
- (CIImageProcessorInOut)initWithSurface:(__IOSurface *)a3 texture:(Texture)a4 digest:(unint64_t)a5 allowSRGB:(BOOL)a6 bounds:(CGRect)a7 context:(void *)a8;
- (MTLDevice)device;
- (__CVBuffer)pixelBuffer;
- (__IOSurface)surface;
- (id)debugDescription;
- (id)debugQuickLookObject;
- (id)description;
- (int)format;
- (unint64_t)bytesPerRow;
- (unint64_t)digest;
- (void)dealloc;
@end

@implementation CIImageProcessorInOut

- (CIImageProcessorInOut)initWithSurface:(__IOSurface *)a3 texture:(Texture)a4 digest:(unint64_t)a5 allowSRGB:(BOOL)a6 bounds:(CGRect)a7 context:(void *)a8
{
  if (a6)
  {
    uint64_t v9 = a6;
    CGFloat height = a7.size.height;
    CGFloat width = a7.size.width;
    CGFloat y = a7.origin.y;
    CGFloat x = a7.origin.x;
    int v14 = a5;
    var1 = a4.var0.var2.var1;
    unint64_t var0 = a4.var0.var0;
    v29.receiver = self;
    v29.super_class = (Class)CIImageProcessorInOut;
    v18 = [(CIImageProcessorInOut *)&v29 init];
    if (v18)
    {
      v30.origin.CGFloat x = x;
      v30.origin.CGFloat y = y;
      v30.size.CGFloat width = width;
      v30.size.CGFloat height = height;
      v18->_region = CGRectIntegral(v30);
      if (a3)
      {
        CFRetain(a3);
        v18->_surface = a3;
        v18->_usesSRGB = 0;
        if (v14 && IOSurfaceGetPixelFormat(a3) == 1111970369) {
          v18->_usesSRGB = 1;
        }
      }
      else
      {
        v18->_surface = 0;
        v18->_usesSRGB = 0;
      }
      v18->_context = (void *)CI::Object::ref(v9);
      if ((*(unsigned int (**)(uint64_t))(*(void *)v9 + 16))(v9) == 77 && !*(void *)(var0 + 8))
      {
        v27 = *(void **)var0;
        if (*(void *)var0) {
          v27 = (void *)CFRetain(v27);
        }
        v18->_mtlTexture = (MTLTexture *)v27;
      }
      v18->_surfaceLocked = 0;
      v18->_digest = (unint64_t)var1;
    }
  }
  else
  {
    v19 = ci_logger_api();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      [(CIImageProcessorInOut *)v19 initWithSurface:v21 texture:v22 digest:v23 allowSRGB:v24 bounds:v25 context:v26];
    }

    return 0;
  }
  return v18;
}

- (void)dealloc
{
  surface = self->_surface;
  if (surface) {
    CFRelease(surface);
  }
  self->_surface = 0;
  context = (CI::Object *)self->_context;
  if (context) {
    CI::Object::unref(context);
  }
  mtlTexture = self->_mtlTexture;
  if (mtlTexture) {
    CFRelease(mtlTexture);
  }
  self->_mtlTexture = 0;

  self->_metalContext = 0;
  v6.receiver = self;
  v6.super_class = (Class)CIImageProcessorInOut;
  [(CIImageProcessorInOut *)&v6 dealloc];
}

- (__IOSurface)surface
{
  return self->_surface;
}

- (BOOL)usesSRGBTransferFunction
{
  return self->_usesSRGB;
}

- (MTLDevice)device
{
  int v3 = (*(uint64_t (**)(void *, SEL))(*(void *)self->_context + 16))(self->_context, a2);
  context = (id *)self->_context;
  if (v3 == 77)
  {
    return (MTLDevice *)CI::MetalContext::device(context);
  }
  else
  {
    if ((*((unsigned int (**)(id *))*context + 2))(context) == 76)
    {
      objc_super v6 = (id *)(*(uint64_t (**)(void *))(*(void *)self->_context + 120))(self->_context);
      v7 = (MTLDevice *)CI::MetalContext::device(v6);
      if (v6) {
        CI::Object::unref((CI::Object *)v6);
      }
    }
    else
    {
      {
        singletonMTLDevice(CI::Context const*)::device = (uint64_t)CIMetalCopyDefaultDevice();
      }
      return (MTLDevice *)singletonMTLDevice(CI::Context const*)::device;
    }
    return v7;
  }
}

- (__CVBuffer)pixelBuffer
{
  if (CGRectIsEmpty(self->_region)) {
    return 0;
  }
  surface = self->_surface;
  if (!surface) {
    return 0;
  }
  CVPixelBufferRef pixelBufferOut = 0;
  CVPixelBufferCreateWithIOSurface(0, surface, 0, &pixelBufferOut);
  result = pixelBufferOut;
  if (pixelBufferOut)
  {
    CFAutorelease(pixelBufferOut);
    return pixelBufferOut;
  }
  return result;
}

- (unint64_t)bytesPerRow
{
  if (CGRectIsEmpty(self->_region)) {
    return 0;
  }
  surface = self->_surface;
  if (!surface) {
    return 0;
  }

  return IOSurfaceGetBytesPerRow(surface);
}

- (int)format
{
  if (CGRectIsEmpty(self->_region)) {
    return 0;
  }
  surface = self->_surface;
  if (!surface) {
    return 0;
  }

  return CI::format_from_IOSurface_ignore_values(surface, v3);
}

- (unint64_t)digest
{
  if (CGRectIsEmpty(self->_region) || !self->_surface) {
    return 0;
  }
  else {
    return self->_digest;
  }
}

- (id)description
{
  [(CIImageProcessorInOut *)self region];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  v11 = CI::name_for_format([(CIImageProcessorInOut *)self format]);
  if (v11) {
    v12 = v11;
  }
  else {
    v12 = "";
  }
  uint64_t v13 = [(id)objc_opt_class() description];
  v19.origin.CGFloat x = v4;
  v19.origin.CGFloat y = v6;
  v19.size.CGFloat width = v8;
  v19.size.CGFloat height = v10;
  if (CGRectIsInfinite(v19)) {
    return (id)[NSString stringWithFormat:@"<%@: %p %s region [infinite]>", v13, self, v12, v15, v16, v17, v18];
  }
  v20.origin.CGFloat x = v4;
  v20.origin.CGFloat y = v6;
  v20.size.CGFloat width = v8;
  v20.size.CGFloat height = v10;
  if (CGRectIsEmpty(v20)) {
    return (id)[NSString stringWithFormat:@"<%@: %p %s region [empty]>", v13, self, v12, v15, v16, v17, v18];
  }
  else {
    return (id)[NSString stringWithFormat:@"<%@: %p %s region [%g %g %g %g]>", v13, self, v12, *(void *)&v4, *(void *)&v6, *(void *)&v8, *(void *)&v10];
  }
}

- (id)debugDescription
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__CIImageProcessorInOut_debugDescription__block_invoke;
  v3[3] = &unk_1E5771158;
  v3[4] = self;
  return (id)(id)stream_to_string((uint64_t)v3);
}

uint64_t __41__CIImageProcessorInOut_debugDescription__block_invoke(uint64_t a1, FILE *a2)
{
  CGFloat v4 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
  fprintf(a2, "<%s: %p", v4, *(const void **)(a1 + 32));
  double v5 = CI::name_for_format([*(id *)(a1 + 32) format]);
  fprintf(a2, " %s", v5);
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v6 + 48))
  {
    fwrite("(sRGB)", 6uLL, 1uLL, a2);
    uint64_t v6 = *(void *)(a1 + 32);
  }
  double v7 = *(double *)(v6 + 8);
  double v8 = *(double *)(v6 + 16);
  double v9 = *(double *)(v6 + 24);
  double v10 = *(double *)(v6 + 32);
  v20.origin.CGFloat x = v7;
  v20.origin.CGFloat y = v8;
  v20.size.CGFloat width = v9;
  v20.size.CGFloat height = v10;
  if (CGRectIsInfinite(v20)) {
    fwrite(" region [infinite]>", 0x13uLL, 1uLL, a2);
  }
  v21.origin.CGFloat x = v7;
  v21.origin.CGFloat y = v8;
  v21.size.CGFloat width = v9;
  v21.size.CGFloat height = v10;
  if (CGRectIsEmpty(v21)) {
    fwrite(" region [empty]>", 0x10uLL, 1uLL, a2);
  }
  else {
    fprintf(a2, " region [%g %g %g %g]>", v7, v8, v9, v10);
  }
  v11 = *(__IOSurface **)(*(void *)(a1 + 32) + 40);
  IOSurfaceID ID = IOSurfaceGetID(v11);
  fprintf(a2, "\n    IOSurface: %p(%d)", v11, ID);
  uint64_t v13 = (const char *)(*(uint64_t (**)(void))(**(void **)(*(void *)(a1 + 32) + 56) + 304))();
  int v14 = (*(uint64_t (**)(void))(**(void **)(*(void *)(a1 + 32) + 56) + 272))();
  fprintf(a2, "\n    CIContext: (%s context %d", v13, v14);
  uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 56);
  int v17 = *(unsigned __int8 *)(v15 + 236);
  uint64_t v16 = (const char *)(v15 + 236);
  if (v17) {
    return fprintf(a2, ":%s)", v16);
  }

  return fputc(41, a2);
}

- (id)debugQuickLookObject
{
  v2 = +[CIImage imageWithIOSurface:self->_surface options:0];
  if (!v2) {
    return 0;
  }
  double v3 = v2;
  SEL v4 = NSSelectorFromString(&cfstr_Initwithciimag.isa);
  double v5 = NSClassFromString(&cfstr_Uiimage.isa);
  if (!v5)
  {
    double v5 = NSClassFromString(&cfstr_Nsbitmapimager.isa);
    if (!v5) {
      return 0;
    }
  }
  if (!v4) {
    return 0;
  }
  id v6 = [v5 alloc];

  return (id)[v6 performSelector:v4 withObject:v3];
}

- (CGRect)region
{
  double x = self->_region.origin.x;
  double y = self->_region.origin.y;
  double width = self->_region.size.width;
  double height = self->_region.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)initWithSurface:(uint64_t)a3 texture:(uint64_t)a4 digest:(uint64_t)a5 allowSRGB:(uint64_t)a6 bounds:(uint64_t)a7 context:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end