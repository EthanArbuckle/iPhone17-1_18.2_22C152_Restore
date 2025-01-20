@interface CIImageProcessorInput
- (CIImageProcessorInput)initWithSurface:(__IOSurface *)a3 texture:(Texture)a4 digest:(unint64_t)a5 allowSRGB:(BOOL)a6 bounds:(CGRect)a7 context:(void *)a8;
- (CIImageProcessorInput)initWithSurface:(__IOSurface *)a3 texture:(Texture)a4 digest:(unint64_t)a5 allowSRGB:(BOOL)a6 bounds:(CGRect)a7 roiTileIndex:(unint64_t)a8 roiTileCount:(unint64_t)a9 context:(void *)a10;
- (MTLTexture)metalTexture;
- (const)baseAddress;
- (unint64_t)roiTileCount;
- (unint64_t)roiTileIndex;
- (void)baseAddress;
- (void)dealloc;
- (void)metalTexture;
@end

@implementation CIImageProcessorInput

- (CIImageProcessorInput)initWithSurface:(__IOSurface *)a3 texture:(Texture)a4 digest:(unint64_t)a5 allowSRGB:(BOOL)a6 bounds:(CGRect)a7 context:(void *)a8
{
  long long v10 = *(_OWORD *)a4.var0.var0;
  v9.receiver = self;
  v9.super_class = (Class)CIImageProcessorInput;
  result = -[CIImageProcessorInOut initWithSurface:texture:digest:allowSRGB:bounds:context:](&v9, sel_initWithSurface_texture_digest_allowSRGB_bounds_context_, a3, &v10, a4.var0.var2.var1, a5, a6, a8, a7.origin.x, a7.origin.y, a7.size.width, a7.size.height);
  if (result)
  {
    result->_roiTileIndex = 0;
    result->_roiTileCount = 1;
  }
  return result;
}

- (CIImageProcessorInput)initWithSurface:(__IOSurface *)a3 texture:(Texture)a4 digest:(unint64_t)a5 allowSRGB:(BOOL)a6 bounds:(CGRect)a7 roiTileIndex:(unint64_t)a8 roiTileCount:(unint64_t)a9 context:(void *)a10
{
  unint64_t v11 = a6;
  long long v13 = *(_OWORD *)a4.var0.var0;
  result = -[CIImageProcessorInput initWithSurface:texture:digest:allowSRGB:bounds:context:](self, "initWithSurface:texture:digest:allowSRGB:bounds:context:", a3, &v13, a4.var0.var2.var1, a5, a9, a7.origin.x, a7.origin.y, a7.size.width, a7.size.height);
  if (result)
  {
    result->_roiTileIndex = v11;
    result->_roiTileCount = a8;
  }
  return result;
}

- (void)dealloc
{
  if (self->super._surfaceLocked)
  {
    surface = self->super._surface;
    if (surface)
    {
      IOSurfaceUnlock(surface, 1u, 0);
      self->super._surfaceLocked = 0;
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)CIImageProcessorInput;
  [(CIImageProcessorInOut *)&v4 dealloc];
}

- (const)baseAddress
{
  if (CGRectIsEmpty(self->super._region)) {
    return 0;
  }
  surface = self->super._surface;
  if (!surface) {
    return 0;
  }
  if (IOSurfaceGetPlaneCount(surface) >= 2)
  {
    objc_super v4 = ci_logger_api();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(CIImageProcessorInput *)v4 baseAddress];
    }
    return 0;
  }
  if (IOSurfaceGetCompressionTypeOfPlane())
  {
    v12 = ci_logger_api();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      [(CIImageProcessorInput *)v12 baseAddress];
    }
    return 0;
  }
  if (!self->super._surfaceLocked)
  {
    IOSurfaceLock(self->super._surface, 1u, 0);
    self->super._surfaceLocked = 1;
  }
  v21 = self->super._surface;

  return IOSurfaceGetBaseAddress(v21);
}

- (MTLTexture)metalTexture
{
  if (IOSurfaceGetPlaneCount(self->super._surface) < 2)
  {
    CIMetalFormatForFormat([(CIImageProcessorInOut *)self format], 0);
    [(CIImageProcessorInOut *)self device];
    MTLPixelFormatGetInfoForDevice();
    uint64_t v11 = ci_logger_api();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CIImageProcessorInput metalTexture]();
    }
  }
  else
  {
    v3 = ci_logger_api();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      [(CIImageProcessorInput *)v3 metalTexture];
    }
  }
  return 0;
}

- (unint64_t)roiTileIndex
{
  return self->_roiTileIndex;
}

- (unint64_t)roiTileCount
{
  return self->_roiTileCount;
}

- (void)baseAddress
{
}

- (void)metalTexture
{
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_2_0(&dword_193671000, v0, v1, "%{public}s The CIProcessorInput cannot be accessed via a Metal texture because the format %{public}s is not readable.", v2, v3, v4, v5, 2u);
}

@end