@interface CIRenderDestination
+ (int)_crashed_because_nonaddressable_memory_was_passed_to_initWithBitmapData:(void *)a3 width:(unint64_t)a4 height:(unint64_t)a5 bytesPerRow:(unint64_t)a6 format:(int)a7;
- (BOOL)blendsInDestinationColorSpace;
- (BOOL)isClamped;
- (BOOL)isCompressed;
- (BOOL)isDithered;
- (BOOL)isFlipped;
- (CGColorSpaceRef)colorSpace;
- (CIBlendKernel)blendKernel;
- (CIRenderDestination)init;
- (CIRenderDestination)initWithBitmapData:(void *)data width:(NSUInteger)width height:(NSUInteger)height bytesPerRow:(NSUInteger)bytesPerRow format:(CIFormat)format;
- (CIRenderDestination)initWithGLTexture:(unsigned int)texture target:(unsigned int)target width:(NSUInteger)width height:(NSUInteger)height;
- (CIRenderDestination)initWithIOSurface:(IOSurface *)surface;
- (CIRenderDestination)initWithMTLTexture:(id)texture commandBuffer:(id)commandBuffer;
- (CIRenderDestination)initWithPixelBuffer:(CVPixelBufferRef)pixelBuffer;
- (CIRenderDestination)initWithWidth:(NSUInteger)width height:(NSUInteger)height pixelFormat:(MTLPixelFormat)pixelFormat commandBuffer:(id)commandBuffer mtlTextureProvider:(void *)block;
- (CIRenderDestination)initWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 colorSpace:(CGColorSpace *)a6 pixelBufferProvider:(id)a7;
- (CIRenderDestination)initWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 colorSpace:(CGColorSpace *)a6 surfaceProvider:(id)a7;
- (CIRenderDestinationAlphaMode)alphaMode;
- (CIRenderDestinationInternal)_internalRepresentation;
- (NSUInteger)height;
- (NSUInteger)width;
- (id)_initWithInternalRenderDestination:(void *)a3 width:(unint64_t)a4 height:(unint64_t)a5 format:(int)a6 colorspace:(CGColorSpace *)a7;
- (id)debugDescription;
- (id)description;
- (id)imageRepresentation;
- (id)label;
- (id)surface;
- (int)ditherDepth;
- (int)format;
- (void)_internalRenderDestination;
- (void)_render:(void *)a3 withContext:(void *)a4;
- (void)_set_YCC_matrix:(int)a3 fullRange:(BOOL)a4 depth:(int)a5 isFloat:(float)a6;
- (void)dealloc;
- (void)imageRepresentation;
- (void)init;
- (void)setAlphaMode:(CIRenderDestinationAlphaMode)alphaMode;
- (void)setBlendKernel:(CIBlendKernel *)blendKernel;
- (void)setBlendsInDestinationColorSpace:(BOOL)blendsInDestinationColorSpace;
- (void)setClamped:(BOOL)clamped;
- (void)setColorSpace:(CGColorSpaceRef)colorSpace;
- (void)setCompressed:(BOOL)a3;
- (void)setDithered:(BOOL)dithered;
- (void)setFlipped:(BOOL)flipped;
- (void)setLabel:(id)a3;
@end

@implementation CIRenderDestination

- (NSUInteger)height
{
  priv = self->_priv;
  if (priv) {
    return priv[2];
  }
  else {
    return 0;
  }
}

- (CIBlendKernel)blendKernel
{
  priv = self->_priv;
  if (priv) {
    return (CIBlendKernel *)*((void *)priv + 18);
  }
  else {
    return 0;
  }
}

- (NSUInteger)width
{
  priv = self->_priv;
  if (priv) {
    return priv[1];
  }
  else {
    return 0;
  }
}

- (int)format
{
  priv = (char *)self->_priv;
  if (priv) {
    v3 = (int *)(priv + 24);
  }
  else {
    v3 = &kCIFormatNil;
  }
  return *v3;
}

- (CIRenderDestinationInternal)_internalRepresentation
{
  return (CIRenderDestinationInternal *)self->_priv;
}

- (BOOL)isFlipped
{
  priv = self->_priv;
  return priv && priv[128] != 0;
}

- (BOOL)isDithered
{
  priv = self->_priv;
  return priv && priv[129] != 0;
}

- (BOOL)isClamped
{
  priv = self->_priv;
  return priv && priv[136] != 0;
}

- (CGColorSpaceRef)colorSpace
{
  priv = (uint64_t *)self->_priv;
  if (priv && (uint64_t v3 = *priv) != 0) {
    return *(CGColorSpaceRef *)(v3 + 24);
  }
  else {
    return 0;
  }
}

- (CIRenderDestinationAlphaMode)alphaMode
{
  priv = self->_priv;
  if (priv) {
    return *((void *)priv + 15);
  }
  else {
    return 0;
  }
}

- (void)_render:(void *)a3 withContext:(void *)a4
{
  v6 = [(CIRenderDestination *)self _internalRenderDestination];
  if (!v6) {
    operator new();
  }
  if (!a3) {
    operator new();
  }
  if (!a4) {
    operator new();
  }
  v7 = *(uint64_t (**)(void))(*(void *)v6 + 64);

  return (void *)v7();
}

- (void)_internalRenderDestination
{
  priv = (void **)self->_priv;
  if (priv) {
    return *priv;
  }
  else {
    return 0;
  }
}

- (void)setFlipped:(BOOL)flipped
{
  priv = self->_priv;
  if (priv) {
    priv[128] = flipped;
  }
}

- (void)setColorSpace:(CGColorSpaceRef)colorSpace
{
  priv = self->_priv;
  if (priv)
  {
    v4 = *(CGColorSpaceRef **)priv;
    if (*(void *)priv)
    {
      if (v4[3] != colorSpace)
      {
        if (colorSpace)
        {
          int v6 = *((_DWORD *)priv + 6);
          CFTypeID TypeID = CGColorSpaceGetTypeID();
          if (TypeID != CFGetTypeID(colorSpace) || !CGColorSpaceSupportsOutput(colorSpace)) {
            goto LABEL_9;
          }
          int is_luminance = CI::format_is_luminance(v6);
          CGColorSpaceModel Model = CGColorSpaceGetModel(colorSpace);
          if (is_luminance)
          {
            if (Model) {
              goto LABEL_9;
            }
          }
          else if (Model != kCGColorSpaceModelRGB)
          {
LABEL_9:
            v10 = ci_logger_api();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
              -[CIRenderDestination setColorSpace:](v10, v11, v12, v13, v14, v15, v16, v17);
            }
            return;
          }
        }
        CI::RenderDestination::setColorspace((CI::RenderDestination *)v4, colorSpace);
      }
    }
  }
}

- (void)setAlphaMode:(CIRenderDestinationAlphaMode)alphaMode
{
  if (alphaMode < (CIRenderDestinationAlphaUnpremultiplied|CIRenderDestinationAlphaPremultiplied))
  {
    priv = self->_priv;
    if (priv) {
      priv[15] = alphaMode;
    }
  }
  else
  {
    uint64_t v3 = ci_logger_api();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[CIRenderDestination setAlphaMode:](v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

- (CIRenderDestination)initWithBitmapData:(void *)data width:(NSUInteger)width height:(NSUInteger)height bytesPerRow:(NSUInteger)bytesPerRow format:(CIFormat)format
{
  if (data)
  {
    if (width - 1 >= 0xF4240 || height - 1 >= 0xF4240)
    {
      v27 = ci_logger_api();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[CIRenderDestination initWithBitmapData:width:height:bytesPerRow:format:].cold.6(v27, v28, v29, v30, v31, v32, v33, v34);
      }
    }
    else if (bytesPerRow < 0x3D0901)
    {
      uint64_t v37 = CI::format_modernize(*(uint64_t *)&format, (CI *)"-[CIRenderDestination initWithBitmapData:width:height:bytesPerRow:format:]", (const char *)data);
      if (CI::format_is_supported_render_to_bitmap(v37))
      {
        unint64_t v38 = CI::format_destination_rowbytes_requirement(v37);
        if ((int)CI::format_bytes_per_pixel(v37) * width <= bytesPerRow)
        {
          if (!(bytesPerRow % v38))
          {
            +[CIRenderDestination _crashed_because_nonaddressable_memory_was_passed_to_initWithBitmapData:data width:width height:height bytesPerRow:bytesPerRow format:v37];
            default_colorspace_for_format(v37, 0);
            operator new();
          }
          v48 = ci_logger_api();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
            -[CIRenderDestination initWithBitmapData:width:height:bytesPerRow:format:].cold.4(v38, v48);
          }
        }
        else
        {
          v39 = ci_logger_api();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
            -[CIRenderDestination initWithBitmapData:width:height:bytesPerRow:format:](v39, v40, v41, v42, v43, v44, v45, v46);
          }
        }
      }
      else
      {
        v47 = ci_logger_api();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          -[CIRenderDestination initWithBitmapData:width:height:bytesPerRow:format:].cold.5(v37);
        }
      }
    }
    else
    {
      uint64_t v11 = ci_logger_api();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[CIRenderDestination initWithBitmapData:width:height:bytesPerRow:format:](v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }
  }
  else
  {
    v19 = ci_logger_api();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[CIRenderDestination initWithBitmapData:width:height:bytesPerRow:format:](v19, v20, v21, v22, v23, v24, v25, v26);
    }
  }

  return 0;
}

- (id)_initWithInternalRenderDestination:(void *)a3 width:(unint64_t)a4 height:(unint64_t)a5 format:(int)a6 colorspace:(CGColorSpace *)a7
{
  if (a3)
  {
    uint64_t v8 = *(void *)&a6;
    v20.receiver = self;
    v20.super_class = (Class)CIRenderDestination;
    uint64_t v12 = [(CIRenderDestination *)&v20 init];
    if (v12)
    {
      uint64_t v13 = malloc_type_calloc(1uLL, 0x98uLL, 0x10A0040E62546F1uLL);
      uint64_t v14 = (CI::RenderDestination *)CI::Object::ref((uint64_t)a3);
      *uint64_t v13 = v14;
      v13[1] = a4;
      v13[2] = a5;
      *((_DWORD *)v13 + 6) = v8;
      CI::RenderDestination::setColorspace(v14, a7);
      int v16 = CI::format_modernize(v8, (CI *)"-[CIRenderDestination _initWithInternalRenderDestination:width:height:format:colorspace:]", v15);
      int v17 = v16;
      if (v16 <= 2568)
      {
        if (!v16)
        {
          v13[15] = 1;
          *((unsigned char *)v13 + 136) = 1;
          goto LABEL_14;
        }
        if (v16 == 2567) {
          goto LABEL_7;
        }
      }
      else
      {
        if (v16 == 2569 || v16 == 3081)
        {
LABEL_12:
          v13[15] = 1;
          goto LABEL_13;
        }
        if (v16 == 3079)
        {
LABEL_7:
          v13[15] = 0;
LABEL_13:
          *((unsigned char *)v13 + 136) = 0;
LABEL_14:
          *((_WORD *)v13 + 64) = 0;
          *((_DWORD *)v13 + 33) = CI::format_bits_per_component(v17);
          *((unsigned char *)v13 + 137) = 0;
          v13[18] = 0;
          v12->_priv = v13;
          return v12;
        }
      }
      if (!CI::format_only_alpha(v16))
      {
        if (CI::format_has_unpremul_alpha(v17))
        {
          v13[15] = 2;
          char v19 = 1;
        }
        else
        {
          v13[15] = CI::format_has_alpha(v17);
          char v19 = CI::format_is_float(v17) ^ 1;
        }
        *((unsigned char *)v13 + 136) = v19;
        goto LABEL_14;
      }
      goto LABEL_12;
    }
  }
  else
  {

    return 0;
  }
  return v12;
}

+ (int)_crashed_because_nonaddressable_memory_was_passed_to_initWithBitmapData:(void *)a3 width:(unint64_t)a4 height:(unint64_t)a5 bytesPerRow:(unint64_t)a6 format:(int)a7
{
  int v11 = CI::format_bits_per_pixel(a7);
  unint64_t v12 = (v11 * a4) >> 3;
  if (v11 == 12) {
    unint64_t v12 = a6;
  }
  if (!v11) {
    unint64_t v12 = a6;
  }
  return *((char *)a3 + (a5 - 1) * a6 + v12 - 1) + *(unsigned __int8 *)a3;
}

- (void)dealloc
{
  priv = self->_priv;
  if (priv)
  {
    if (*(void *)priv) {
      CI::Object::unref(*(CI::Object **)priv);
    }
    id v4 = *((id *)priv + 18);
    *((void *)priv + 18) = 0;
    free(self->_priv);
    self->_priv = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)CIRenderDestination;
  [(CIRenderDestination *)&v5 dealloc];
}

- (void)setCompressed:(BOOL)a3
{
  priv = self->_priv;
  if (priv) {
    priv[138] = a3;
  }
}

- (CIRenderDestination)initWithPixelBuffer:(CVPixelBufferRef)pixelBuffer
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (pixelBuffer)
  {
    size_t Width = CVPixelBufferGetWidth(pixelBuffer);
    size_t Height = CVPixelBufferGetHeight(pixelBuffer);
    if (Width - 1 >= 0xF4240 || Height - 1 >= 0xF4240)
    {
      uint64_t v18 = ci_logger_api();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[CIRenderDestination initWithPixelBuffer:].cold.4(v18, v19, v20, v21, v22, v23, v24, v25);
      }
    }
    else
    {
      int v8 = CI::format_from_CVPixelBuffer(pixelBuffer, v7);
      if (checkFormat(v8))
      {
        int is_ycc_biplanar = CI::format_is_ycc_biplanar(v8);
        if ((is_ycc_biplanar ^ (CVPixelBufferGetPlaneCount(pixelBuffer) < 2)))
        {
          CVImageBufferCopyColorSpace(pixelBuffer);
          CVPixelBufferGetIOSurface(pixelBuffer);
          operator new();
        }
        uint64_t v34 = ci_logger_api();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          -[CIRenderDestination initWithPixelBuffer:](v34, v35, v36, v37, v38, v39, v40, v41);
        }
      }
      else
      {
        uint64_t v26 = ci_logger_api();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          -[CIRenderDestination initWithPixelBuffer:](v26, v27, v28, v29, v30, v31, v32, v33);
        }
      }
    }
  }
  else
  {
    uint64_t v10 = ci_logger_api();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CIRenderDestination initWithPixelBuffer:](v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }

  return 0;
}

- (void)_set_YCC_matrix:(int)a3 fullRange:(BOOL)a4 depth:(int)a5 isFloat:(float)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (a6 == 0.0) {
      int v8 = a5;
    }
    else {
      int v8 = 0;
    }
    if (get_rgb_to_ycc_matrix(a3, a4, v8, v23, (uint64_t)&v21, (uint64_t)&v19, (uint64_t)&v17))
    {
      long long v9 = v21;
      uint64_t v10 = v22;
      long long v11 = v19;
      uint64_t v12 = v20;
      long long v13 = v17;
      uint64_t v14 = v18;
      long long v15 = *(_OWORD *)v23;
    }
    else
    {
      long long v9 = 0uLL;
      uint64_t v10 = 0;
      uint64_t v12 = 0;
      uint64_t v14 = 0;
      long long v11 = 0uLL;
      long long v13 = 0uLL;
      long long v15 = 0uLL;
    }
    priv = (char *)self->_priv;
    *((_DWORD *)priv + 7) = a3;
    *((_OWORD *)priv + 2) = v9;
    *((void *)priv + 6) = v10;
    *(_OWORD *)(priv + 56) = v11;
    *((void *)priv + 9) = v12;
    *((_OWORD *)priv + 5) = v13;
    *((void *)priv + 12) = v14;
    *(_OWORD *)(priv + 104) = v15;
  }
}

- (CIRenderDestination)init
{
  uint64_t v3 = ci_logger_api();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    [(CIRenderDestination *)v3 init];
  }

  return 0;
}

- (CIRenderDestination)initWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 colorSpace:(CGColorSpace *)a6 pixelBufferProvider:(id)a7
{
  if (!a7)
  {
    long long v21 = ci_logger_api();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[CIRenderDestination initWithWidth:height:pixelFormat:colorSpace:pixelBufferProvider:](v21, v22, v23, v24, v25, v26, v27, v28);
    }
    goto LABEL_18;
  }
  if (a3 - 1 >= 0xF4240 || a4 - 1 >= 0xF4240)
  {
    uint64_t v29 = ci_logger_api();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[CIRenderDestination initWithWidth:height:pixelFormat:colorSpace:pixelBufferProvider:].cold.5(v29, v30, v31, v32, v33, v34, v35, v36);
    }
    goto LABEL_18;
  }
  int v9 = CI::format_from_PixelFormatType(*(CI **)&a5);
  if (!checkFormat(v9))
  {
    uint64_t v37 = ci_logger_api();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      -[CIRenderDestination initWithWidth:height:pixelFormat:colorSpace:pixelBufferProvider:].cold.4(v37, v38, v39, v40, v41, v42, v43, v44);
    }
    goto LABEL_18;
  }
  if (!a6) {
    goto LABEL_21;
  }
  CFTypeID TypeID = CGColorSpaceGetTypeID();
  if (TypeID != CFGetTypeID(a6) || !CGColorSpaceSupportsOutput(a6))
  {
LABEL_10:
    long long v13 = ci_logger_api();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CIRenderDestination initWithWidth:height:pixelFormat:colorSpace:pixelBufferProvider:](v13, v14, v15, v16, v17, v18, v19, v20);
    }
LABEL_18:

    return 0;
  }
  int is_luminance = CI::format_is_luminance(v9);
  CGColorSpaceModel Model = CGColorSpaceGetModel(a6);
  if (!is_luminance)
  {
    if (Model == kCGColorSpaceModelRGB) {
      goto LABEL_21;
    }
    goto LABEL_10;
  }
  if (Model) {
    goto LABEL_10;
  }
LABEL_21:
  uint64_t v46 = ci_logger_api();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
    -[CIRenderDestination initWithWidth:height:pixelFormat:colorSpace:pixelBufferProvider:](v46, v47, v48, v49, v50, v51, v52, v53);
  }
  return self;
}

- (CIRenderDestination)initWithIOSurface:(IOSurface *)surface
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (surface)
  {
    size_t Width = IOSurfaceGetWidth((IOSurfaceRef)surface);
    size_t Height = IOSurfaceGetHeight((IOSurfaceRef)surface);
    if (Width - 1 >= 0xF4240 || Height - 1 >= 0xF4240)
    {
      uint64_t v18 = ci_logger_api();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[CIRenderDestination initWithIOSurface:].cold.4(v18, v19, v20, v21, v22, v23, v24, v25);
      }
    }
    else
    {
      int v8 = CI::format_from_IOSurface((CI *)surface, v7);
      if (checkFormat(v8))
      {
        int is_ycc_biplanar = CI::format_is_ycc_biplanar(v8);
        if ((is_ycc_biplanar ^ (IOSurfaceGetPlaneCount((IOSurfaceRef)surface) < 2)))
        {
          CopySurfaceColorSpace((__IOSurface *)surface);
          operator new();
        }
        uint64_t v34 = ci_logger_api();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          -[CIRenderDestination initWithIOSurface:](v34, v35, v36, v37, v38, v39, v40, v41);
        }
      }
      else
      {
        uint64_t v26 = ci_logger_api();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          -[CIRenderDestination initWithIOSurface:](v26, v27, v28, v29, v30, v31, v32, v33);
        }
      }
    }
  }
  else
  {
    uint64_t v10 = ci_logger_api();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CIRenderDestination initWithIOSurface:](v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }

  return 0;
}

- (CIRenderDestination)initWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 colorSpace:(CGColorSpace *)a6 surfaceProvider:(id)a7
{
  if (!a7)
  {
    uint64_t v21 = ci_logger_api();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[CIRenderDestination initWithWidth:height:pixelFormat:colorSpace:surfaceProvider:](v21, v22, v23, v24, v25, v26, v27, v28);
    }
    goto LABEL_18;
  }
  if (a3 - 1 >= 0xF4240 || a4 - 1 >= 0xF4240)
  {
    uint64_t v29 = ci_logger_api();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[CIRenderDestination initWithWidth:height:pixelFormat:colorSpace:surfaceProvider:].cold.5(v29, v30, v31, v32, v33, v34, v35, v36);
    }
    goto LABEL_18;
  }
  int v9 = CI::format_from_PixelFormatType(*(CI **)&a5);
  if (!checkFormat(v9))
  {
    uint64_t v37 = ci_logger_api();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      -[CIRenderDestination initWithWidth:height:pixelFormat:colorSpace:surfaceProvider:].cold.4(v37, v38, v39, v40, v41, v42, v43, v44);
    }
    goto LABEL_18;
  }
  if (!a6) {
    goto LABEL_21;
  }
  CFTypeID TypeID = CGColorSpaceGetTypeID();
  if (TypeID != CFGetTypeID(a6) || !CGColorSpaceSupportsOutput(a6))
  {
LABEL_10:
    uint64_t v13 = ci_logger_api();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CIRenderDestination initWithWidth:height:pixelFormat:colorSpace:surfaceProvider:](v13, v14, v15, v16, v17, v18, v19, v20);
    }
LABEL_18:

    return 0;
  }
  int is_luminance = CI::format_is_luminance(v9);
  CGColorSpaceModel Model = CGColorSpaceGetModel(a6);
  if (!is_luminance)
  {
    if (Model == kCGColorSpaceModelRGB) {
      goto LABEL_21;
    }
    goto LABEL_10;
  }
  if (Model) {
    goto LABEL_10;
  }
LABEL_21:
  uint64_t v46 = ci_logger_api();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
    -[CIRenderDestination initWithWidth:height:pixelFormat:colorSpace:surfaceProvider:](v46, v47, v48, v49, v50, v51, v52, v53);
  }
  return self;
}

- (CIRenderDestination)initWithMTLTexture:(id)texture commandBuffer:(id)commandBuffer
{
  if (texture)
  {
    uint64_t v6 = [texture width];
    uint64_t v7 = [texture height];
    if ((unint64_t)(v6 - 1) >= 0xF4240 || (unint64_t)(v7 - 1) >= 0xF4240)
    {
      uint64_t v24 = ci_logger_api();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[CIRenderDestination initWithMTLTexture:commandBuffer:].cold.6(v24, v25, v26, v27, v28, v29, v30, v31);
      }
    }
    else if ([texture depth] == 1)
    {
      if ([texture textureType] == 2)
      {
        if (([texture usage] & 2) != 0)
        {
          unsigned __int8 v59 = 0;
          int Format = CIMetalTextureGetFormat(texture);
          int v50 = CIFormatFromCIMetalTextureFormat(Format, &v59);
          if (v50)
          {
            default_colorspace_for_format(v50, v59);
            operator new();
          }
          uint64_t v51 = ci_logger_api();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
            -[CIRenderDestination initWithMTLTexture:commandBuffer:](v51, v52, v53, v54, v55, v56, v57, v58);
          }
        }
        else
        {
          int v8 = ci_logger_api();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
            -[CIRenderDestination initWithMTLTexture:commandBuffer:](v8, v9, v10, v11, v12, v13, v14, v15);
          }
        }
      }
      else
      {
        uint64_t v40 = ci_logger_api();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          -[CIRenderDestination initWithMTLTexture:commandBuffer:].cold.4(v40, v41, v42, v43, v44, v45, v46, v47);
        }
      }
    }
    else
    {
      uint64_t v32 = ci_logger_api();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[CIRenderDestination initWithMTLTexture:commandBuffer:].cold.5(v32, v33, v34, v35, v36, v37, v38, v39);
      }
    }
  }
  else
  {
    uint64_t v16 = ci_logger_api();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[CIRenderDestination initWithMTLTexture:commandBuffer:](v16, v17, v18, v19, v20, v21, v22, v23);
    }
  }

  return 0;
}

- (CIRenderDestination)initWithWidth:(NSUInteger)width height:(NSUInteger)height pixelFormat:(MTLPixelFormat)pixelFormat commandBuffer:(id)commandBuffer mtlTextureProvider:(void *)block
{
  if (block)
  {
    if (width - 1 >= 0xF4240 || height - 1 >= 0xF4240)
    {
      uint64_t v17 = ci_logger_api();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[CIRenderDestination initWithWidth:height:pixelFormat:commandBuffer:mtlTextureProvider:](v17, v18, v19, v20, v21, v22, v23, v24);
      }
    }
    else
    {
      unsigned __int8 v34 = 0;
      int v8 = CIFormatFromCIMetalTextureFormat(pixelFormat, &v34);
      if (v8)
      {
        default_colorspace_for_format(v8, v34);
        operator new();
      }
      uint64_t v25 = ci_logger_api();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[CIRenderDestination initWithWidth:height:pixelFormat:commandBuffer:mtlTextureProvider:](v25, v26, v27, v28, v29, v30, v31, v32);
      }
    }
  }
  else
  {
    uint64_t v9 = ci_logger_api();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CIRenderDestination initWithWidth:height:pixelFormat:commandBuffer:mtlTextureProvider:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }

  return 0;
}

- (CIRenderDestination)initWithGLTexture:(unsigned int)texture target:(unsigned int)target width:(NSUInteger)width height:(NSUInteger)height
{
  if (width - 1 >= 0xF4240 || height - 1 >= 0xF4240)
  {
    uint64_t v7 = ci_logger_api();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CIRenderDestination initWithGLTexture:target:width:height:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  else
  {
    if (target == 3553)
    {
      CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
      operator new();
    }
    uint64_t v15 = ci_logger_api();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CIRenderDestination initWithGLTexture:target:width:height:](v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }

  return 0;
}

- (void)setDithered:(BOOL)dithered
{
  priv = self->_priv;
  if (priv) {
    priv[129] = dithered;
  }
}

- (int)ditherDepth
{
  priv = self->_priv;
  if (priv) {
    return priv[33];
  }
  else {
    return 0;
  }
}

- (void)setClamped:(BOOL)clamped
{
  priv = self->_priv;
  if (priv) {
    priv[136] = clamped;
  }
}

- (BOOL)isCompressed
{
  priv = self->_priv;
  return priv && priv[138] != 0;
}

- (void)setBlendKernel:(CIBlendKernel *)blendKernel
{
  priv = (id *)self->_priv;
  if (priv && priv[18] != blendKernel)
  {
    if (!blendKernel) {
      goto LABEL_9;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ((*(unsigned int (**)(void))(*(void *)*priv + 16))() == 85
        && ([*((id *)*priv + 9) usage] & 1) == 0)
      {
        uint64_t v5 = ci_logger_api();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          -[CIRenderDestination setBlendKernel:](v5, v6, v7, v8, v9, v10, v11, v12);
        }
        return;
      }
LABEL_9:
      id v13 = priv[18];
      priv[18] = blendKernel;
      return;
    }
    uint64_t v14 = ci_logger_api();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CIRenderDestination setBlendKernel:](v14, v15, v16, v17, v18, v19, v20, v21);
    }
  }
}

- (BOOL)blendsInDestinationColorSpace
{
  priv = self->_priv;
  return priv && priv[137] != 0;
}

- (void)setBlendsInDestinationColorSpace:(BOOL)blendsInDestinationColorSpace
{
  priv = self->_priv;
  if (priv) {
    priv[137] = blendsInDestinationColorSpace;
  }
}

- (id)label
{
  priv = (uint64_t *)self->_priv;
  if (priv && (uint64_t v3 = *priv) != 0) {
    return *(id *)(v3 + 16);
  }
  else {
    return 0;
  }
}

- (void)setLabel:(id)a3
{
  priv = (CI::RenderDestination **)self->_priv;
  if (priv)
  {
    if (*priv) {
      CI::RenderDestination::setLabel(*priv, a3);
    }
  }
}

- (id)surface
{
  priv = (id **)self->_priv;
  if (priv && (uint64_t v3 = *priv) != 0 && (*((unsigned int (**)(id *, SEL))*v3 + 2))(v3, a2) == 83) {
    return v3[6];
  }
  else {
    return 0;
  }
}

- (id)imageRepresentation
{
  v29[2] = *MEMORY[0x1E4F143B8];
  priv = (unsigned __int8 *)self->_priv;
  uint64_t v3 = *(void *)priv;
  unint64_t v4 = *((void *)priv + 1);
  unint64_t v5 = *((void *)priv + 2);
  uint64_t v6 = *(void *)(*(void *)priv + 24);
  if (!v6) {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v7 = (void *)MEMORY[0x1E4F1CA60];
  v29[0] = v6;
  v28[0] = @"CIImageColorSpace";
  v28[1] = @"CIImageFlipped";
  v29[1] = [NSNumber numberWithBool:priv[128]];
  uint64_t v8 = objc_msgSend(v7, "dictionaryWithDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v29, v28, 2));
  uint64_t v9 = v8;
  uint64_t v10 = *((void *)priv + 15);
  switch(v10)
  {
    case 2:
      uint64_t v12 = MEMORY[0x1E4F1CC28];
LABEL_9:
      [v8 setValue:v12 forKey:@"CIImagePremultiplied"];
      break;
    case 1:
      uint64_t v12 = MEMORY[0x1E4F1CC38];
      goto LABEL_9;
    case 0:
      int has_alpha = CI::format_has_alpha(*((_DWORD *)priv + 6));
      goto LABEL_11;
  }
  int has_alpha = 0;
LABEL_11:
  if (*((_DWORD *)priv + 7)) {
    objc_msgSend(v9, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithInt:"), @"kCIImageYCCMatrix");
  }
  uint64_t v14 = "";
  double v15 = (double)v4;
  switch((*(unsigned int (**)(uint64_t))(*(void *)v3 + 16))(v3))
  {
    case 'Q':
      uint64_t v16 = +[CIImage imageWithBitmapData:bytesPerRow:size:format:options:](CIImage, "imageWithBitmapData:bytesPerRow:size:format:options:", [MEMORY[0x1E4F1C9B8] dataWithBytes:*(void *)(*(void *)(v3 + 48) + 72) length:(unint64_t)((double)v5 * (double)*(unint64_t *)(*(void *)(v3 + 48) + 96))], *(void *)(v13 + 96), *(unsigned int *)(v13 + 104), v9, v15, (double)v5);
      goto LABEL_23;
    case 'R':
      uint64_t v16 = +[CIImage imageWithCVPixelBuffer:*(void *)(v3 + 48) options:v9];
      goto LABEL_23;
    case 'S':
      uint64_t v16 = +[CIImage imageWithIOSurface:*(void *)(v3 + 48) options:v9];
      goto LABEL_23;
    case 'T':
      uint64_t v16 = +[CIImage imageWithTexture:size:options:](CIImage, "imageWithTexture:size:options:", *(unsigned int *)(v3 + 64), v9, v15, (double)v5);
      goto LABEL_23;
    case 'U':
      uint64_t v17 = *(void **)(v3 + 72);
      uint64_t v18 = v17;
      goto LABEL_20;
    case 'X':
      uint64_t v18 = (void *)CI::RenderToMTLTextureProvider::texture((CI::RenderToMTLTextureProvider *)v3);
      uint64_t v17 = v18;
LABEL_20:
      if ([v18 usage])
      {
        uint64_t v16 = +[CIImage imageWithMTLTexture:v17 options:v9];
LABEL_23:
        uint64_t v19 = v16;
        if (v16)
        {
          if (has_alpha)
          {
            [(CIImage *)v16 extent];
            return -[CIImage imageBySettingAlphaOneInExtent:](v19, "imageBySettingAlphaOneInExtent:");
          }
          return v19;
        }
        uint64_t v14 = "";
      }
      else
      {
        uint64_t v14 = " because the MTLTexture usage does not inlude MTLTextureUsageShaderRead";
      }
LABEL_27:
      uint64_t v20 = ci_logger_api();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        [(CIRenderDestination *)(uint64_t)v14 imageRepresentation];
      }
      return 0;
    default:
      goto LABEL_27;
  }
}

- (id)description
{
  priv = self->_priv;
  if (priv)
  {
    unint64_t v4 = [(CIRenderDestination *)self _internalRenderDestination];
    unint64_t v5 = v4;
    if (v4 && v4[2]) {
      uint64_t v6 = (__CFString *)[NSString stringWithFormat:@" (%@)", v4[2]];
    }
    else {
      uint64_t v6 = &stru_1EE465CC0;
    }
    uint64_t v8 = NSString;
    uint64_t v9 = [(id)objc_opt_class() description];
    uint64_t v10 = (void *)[v8 stringWithFormat:@"<%@: %p%@ format: %s size: %ux%u", v9, self, v6, CI::name_for_format(priv[6]), *((void *)priv + 1), *((void *)priv + 2)];
    if (v5)
    {
      uint64_t v11 = (const void *)(*(uint64_t (**)(void *))(*v5 + 24))(v5);
      uint64_t v10 = (void *)[v10 stringByAppendingFormat:@" %@", v11];
      CFRelease(v11);
    }
    return (id)[v10 stringByAppendingString:@">"];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CIRenderDestination;
    return [(CIRenderDestination *)&v12 description];
  }
}

- (id)debugDescription
{
  priv = (uint64_t *)self->_priv;
  if (priv && (uint64_t v3 = *priv) != 0)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __39__CIRenderDestination_debugDescription__block_invoke;
    v5[3] = &unk_1E5772D70;
    v5[4] = self;
    v5[5] = v3;
    v5[6] = priv;
    return (id)(id)stream_to_string((uint64_t)v5);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CIRenderDestination;
    return [(CIRenderDestination *)&v6 debugDescription];
  }
}

uint64_t __39__CIRenderDestination_debugDescription__block_invoke(uint64_t a1, FILE *a2)
{
  fprintf(a2, "%s\n", (const char *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "description"), "UTF8String"));
  fwrite("    colorspace: ", 0x10uLL, 1uLL, a2);
  CI::fprintf_cs(a2, *(__sFILE **)(*(void *)(a1 + 40) + 24), (CGColorSpace *)1);
  fputc(10, a2);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(v4 + 120);
  if (!v5)
  {
    fwrite("    alphaMode: None\n", 0x14uLL, 1uLL, a2);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(v4 + 120);
  }
  if (v5 == 1)
  {
    fwrite("    alphaMode: Premultiplied\n", 0x1DuLL, 1uLL, a2);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(v4 + 120);
  }
  if (v5 == 2)
  {
    fwrite("    alphaMode: Unpremultiplied\n", 0x1FuLL, 1uLL, a2);
    uint64_t v4 = *(void *)(a1 + 48);
  }
  objc_super v6 = *(void **)(v4 + 144);
  if (v6)
  {
    fprintf(a2, "    blendKernel: %s\n", (const char *)objc_msgSend((id)objc_msgSend(v6, "description"), "UTF8String"));
    fprintf(a2, "    blendsInDestinationColorSpace: %d\n", *(unsigned __int8 *)(*(void *)(a1 + 48) + 137));
    uint64_t v4 = *(void *)(a1 + 48);
  }
  fprintf(a2, "    flipped: %d\n", *(unsigned __int8 *)(v4 + 128));
  fprintf(a2, "    dithered: %d\n", *(unsigned __int8 *)(*(void *)(a1 + 48) + 129));
  return fprintf(a2, "    clamped: %d", *(unsigned __int8 *)(*(void *)(a1 + 48) + 136));
}

- (void)init
{
}

- (void)initWithPixelBuffer:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithPixelBuffer:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithPixelBuffer:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithPixelBuffer:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithWidth:(uint64_t)a3 height:(uint64_t)a4 pixelFormat:(uint64_t)a5 colorSpace:(uint64_t)a6 pixelBufferProvider:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithWidth:(uint64_t)a3 height:(uint64_t)a4 pixelFormat:(uint64_t)a5 colorSpace:(uint64_t)a6 pixelBufferProvider:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithWidth:(uint64_t)a3 height:(uint64_t)a4 pixelFormat:(uint64_t)a5 colorSpace:(uint64_t)a6 pixelBufferProvider:(uint64_t)a7 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithWidth:(uint64_t)a3 height:(uint64_t)a4 pixelFormat:(uint64_t)a5 colorSpace:(uint64_t)a6 pixelBufferProvider:(uint64_t)a7 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithWidth:(uint64_t)a3 height:(uint64_t)a4 pixelFormat:(uint64_t)a5 colorSpace:(uint64_t)a6 pixelBufferProvider:(uint64_t)a7 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithIOSurface:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithIOSurface:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithIOSurface:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithIOSurface:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithWidth:(uint64_t)a3 height:(uint64_t)a4 pixelFormat:(uint64_t)a5 colorSpace:(uint64_t)a6 surfaceProvider:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithWidth:(uint64_t)a3 height:(uint64_t)a4 pixelFormat:(uint64_t)a5 colorSpace:(uint64_t)a6 surfaceProvider:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithWidth:(uint64_t)a3 height:(uint64_t)a4 pixelFormat:(uint64_t)a5 colorSpace:(uint64_t)a6 surfaceProvider:(uint64_t)a7 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithWidth:(uint64_t)a3 height:(uint64_t)a4 pixelFormat:(uint64_t)a5 colorSpace:(uint64_t)a6 surfaceProvider:(uint64_t)a7 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithWidth:(uint64_t)a3 height:(uint64_t)a4 pixelFormat:(uint64_t)a5 colorSpace:(uint64_t)a6 surfaceProvider:(uint64_t)a7 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMTLTexture:(uint64_t)a3 commandBuffer:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMTLTexture:(uint64_t)a3 commandBuffer:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMTLTexture:(uint64_t)a3 commandBuffer:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMTLTexture:(uint64_t)a3 commandBuffer:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMTLTexture:(uint64_t)a3 commandBuffer:(uint64_t)a4 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMTLTexture:(uint64_t)a3 commandBuffer:(uint64_t)a4 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithWidth:(uint64_t)a3 height:(uint64_t)a4 pixelFormat:(uint64_t)a5 commandBuffer:(uint64_t)a6 mtlTextureProvider:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithWidth:(uint64_t)a3 height:(uint64_t)a4 pixelFormat:(uint64_t)a5 commandBuffer:(uint64_t)a6 mtlTextureProvider:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithWidth:(uint64_t)a3 height:(uint64_t)a4 pixelFormat:(uint64_t)a5 commandBuffer:(uint64_t)a6 mtlTextureProvider:(uint64_t)a7 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithGLTexture:(uint64_t)a3 target:(uint64_t)a4 width:(uint64_t)a5 height:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithGLTexture:(uint64_t)a3 target:(uint64_t)a4 width:(uint64_t)a5 height:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithBitmapData:(uint64_t)a3 width:(uint64_t)a4 height:(uint64_t)a5 bytesPerRow:(uint64_t)a6 format:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithBitmapData:(uint64_t)a3 width:(uint64_t)a4 height:(uint64_t)a5 bytesPerRow:(uint64_t)a6 format:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithBitmapData:(uint64_t)a3 width:(uint64_t)a4 height:(uint64_t)a5 bytesPerRow:(uint64_t)a6 format:(uint64_t)a7 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithBitmapData:(uint64_t)a1 width:(NSObject *)a2 height:bytesPerRow:format:.cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136446466;
  uint64_t v3 = "-[CIRenderDestination initWithBitmapData:width:height:bytesPerRow:format:]";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_193671000, a2, OS_LOG_TYPE_ERROR, "%{public}s rowBytes must be a multiple of %ld.", (uint8_t *)&v2, 0x16u);
}

- (void)initWithBitmapData:(int)a1 width:height:bytesPerRow:format:.cold.5(int a1)
{
  CI::name_for_format(a1);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_193671000, v1, v2, "%{public}s format %{public}s is unsupported.", v3, v4, v5, v6, 2u);
}

- (void)initWithBitmapData:(uint64_t)a3 width:(uint64_t)a4 height:(uint64_t)a5 bytesPerRow:(uint64_t)a6 format:(uint64_t)a7 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setAlphaMode:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setColorSpace:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setBlendKernel:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setBlendKernel:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)imageRepresentation
{
}

@end