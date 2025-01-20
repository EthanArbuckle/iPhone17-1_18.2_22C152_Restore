@interface MetalContext
+ (unint64_t)bytesPerPixelForTextureFormat:(unint64_t)a3;
- (BOOL)writeMetalTextureToData:(void *)a3 texture:(id)a4 mipmapLevel:(int)a5;
- (BOOL)writeMetalTextureToFile:(const char *)a3 texture:(id)a4;
- (BOOL)writeMetalTextureToFile:(const char *)a3 texture:(id)a4 mipmapLevel:(int)a5;
- (MTLCommandQueue)commandQueue;
- (MTLDevice)device;
- (MTLLibrary)library;
- (MetalContext)init;
- (MetalContext)initWithDevice:(id)a3 library:(id)a4 commandQueue:(id)a5;
- (id)bindIOSurfaceToMTL2DTexture:(__IOSurface *)a3 pixelFormat:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6 plane:(unint64_t)a7;
- (id)bindPixelBufferToMTL2DTexture:(__CVBuffer *)a3 pixelFormat:(unint64_t)a4 plane:(unint64_t)a5;
- (id)bindPixelBufferToMTL2DTexture:(__CVBuffer *)a3 pixelFormat:(unint64_t)a4 textureSize:(CGSize)a5 plane:(unint64_t)a6;
- (id)newBufferWithPixelFormat:(unint64_t)a3 width:(int)a4 data:(const void *)a5;
- (id)newTextureWithPixelFormat:(unint64_t)a3 width:(int)a4 height:(int)a5;
- (id)readBufferFromFile:(const char *)a3 width:(int)a4 pixelFormat:(unint64_t)a5;
- (id)readTextureFromFile:(const char *)a3 width:(int)a4 height:(int)a5 pixelFormat:(unint64_t)a6;
- (int)writeMetalBufferToFile:(const char *)a3 buffer:(id)a4;
- (unint64_t)textureBytesPerRow:(int)a3 format:(unint64_t)a4;
- (void)copyMTLBufferToMTLTexture:(id)a3 bytesPerRow:(unint64_t)a4 texture:(id)a5;
@end

@implementation MetalContext

- (MetalContext)init
{
  v28.receiver = self;
  v28.super_class = (Class)MetalContext;
  v2 = [(MetalContext *)&v28 init];
  if (!v2) {
    goto LABEL_9;
  }
  v3 = (MTLDevice *)MTLCreateSystemDefaultDevice();
  device = v2->_device;
  v2->_device = v3;

  v5 = v2->_device;
  if (v5)
  {
    v6 = (void *)MEMORY[0x263F086E0];
    uint64_t v7 = objc_opt_class();
    v10 = objc_msgSend_bundleForClass_(v6, v8, v7, v9);
    id v27 = 0;
    uint64_t v12 = objc_msgSend_newDefaultLibraryWithBundle_error_(v5, v11, (uint64_t)v10, (uint64_t)&v27);
    id v13 = v27;
    library = v2->_library;
    v2->_library = (MTLLibrary *)v12;

    if (v2->_library
      && (uint64_t v18 = objc_msgSend_newCommandQueue(v2->_device, v15, v16, v17),
          commandQueue = v2->_commandQueue,
          v2->_commandQueue = (MTLCommandQueue *)v18,
          commandQueue,
          (v22 = v2->_commandQueue) != 0))
    {
      objc_msgSend_setBackgroundGPUPriority_(v22, v20, 2, v21);
      int v23 = 0;
    }
    else
    {
      fig_log_get_emitter();
      int v23 = FigSignalErrorAt3();
    }

    if (v23) {
      goto LABEL_7;
    }
LABEL_9:
    v24 = v2;
    goto LABEL_10;
  }
  fig_log_get_emitter();
  if (!FigSignalErrorAt3()) {
    goto LABEL_9;
  }
LABEL_7:
  v24 = 0;
LABEL_10:
  v25 = v24;

  return v25;
}

- (MetalContext)initWithDevice:(id)a3 library:(id)a4 commandQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MetalContext;
  uint64_t v12 = [(MetalContext *)&v17 init];
  id v13 = v12;
  if (!v12
    || (objc_storeStrong((id *)&v12->_device, a3), v13->_device)
    && (objc_storeStrong((id *)&v13->_library, a4), v13->_library)
    && (objc_storeStrong((id *)&v13->_commandQueue, a5), v13->_commandQueue)
    || (fig_log_get_emitter(), !FigSignalErrorAt3()))
  {
    v14 = v13;
  }
  else
  {
    v14 = 0;
  }
  v15 = v14;

  return v15;
}

- (BOOL)writeMetalTextureToData:(void *)a3 texture:(id)a4 mipmapLevel:(int)a5
{
  id v7 = a4;
  id v11 = v7;
  BOOL v12 = 0;
  if (v7 && (a5 & 0x80000000) == 0)
  {
    if (objc_msgSend_mipmapLevelCount(v7, v8, v9, v10) <= (unint64_t)a5)
    {
      BOOL v12 = 0;
    }
    else
    {
      objc_msgSend_pixelFormat(v11, v13, v14, v15);
      MTLPixelFormatGetInfoForDevice();
      memset(v24, 0, sizeof(v24));
      unint64_t v25 = (unint64_t)objc_msgSend_width(v11, v16, v17, v18) >> a5;
      BOOL v12 = 1;
      unint64_t v26 = (unint64_t)objc_msgSend_height(v11, v19, v20, v21) >> a5;
      uint64_t v27 = 1;
      objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v11, v22, (uint64_t)a3, v25 * v28, v24, a5);
    }
  }

  return v12;
}

- (BOOL)writeMetalTextureToFile:(const char *)a3 texture:(id)a4
{
  return MEMORY[0x270F9A6D0](self, sel_writeMetalTextureToFile_texture_mipmapLevel_, a3, a4);
}

- (BOOL)writeMetalTextureToFile:(const char *)a3 texture:(id)a4 mipmapLevel:(int)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v11 = v7;
  BOOL v12 = 0;
  if (!a3 || !v7 || a5 < 0) {
    goto LABEL_9;
  }
  if (objc_msgSend_mipmapLevelCount(v7, v8, v9, v10) <= (unint64_t)a5)
  {
    BOOL v12 = 0;
    goto LABEL_9;
  }
  objc_msgSend_pixelFormat(v11, v13, v14, v15);
  MTLPixelFormatGetInfoForDevice();
  size_t v16 = v33;
  unint64_t v20 = (unint64_t)objc_msgSend_width(v11, v17, v18, v19) >> a5;
  unint64_t v24 = (unint64_t)objc_msgSend_height(v11, v21, v22, v23) >> a5;
  BOOL v12 = malloc_type_malloc(v20 * v33 * v24, 0xBB7FAFF9uLL);
  memset(v32, 0, 24);
  v32[3] = v20;
  v32[4] = v24;
  v32[5] = 1;
  objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v11, v25, (uint64_t)v12, v20 * v33, v32, a5);
  unint64_t v26 = fopen(a3, "wb");
  if (!v26)
  {
    v30 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_9:
    free(v12);
    BOOL v28 = 0;
    goto LABEL_11;
  }
  uint64_t v27 = v26;
  BOOL v28 = fwrite(v12, v16, v24 * v20, v26) == v24 * v20;
  if (!v28)
  {
    v29 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  free(v12);
  fclose(v27);
LABEL_11:

  return v28;
}

- (int)writeMetalBufferToFile:(const char *)a3 buffer:(id)a4
{
  id v5 = a4;
  v6 = fopen(a3, "wb");
  if (v6)
  {
    id v7 = v6;
    id v8 = v5;
    BOOL v12 = (const void *)objc_msgSend_contents(v8, v9, v10, v11);
    size_t v16 = objc_msgSend_length(v8, v13, v14, v15);
    if (fwrite(v12, 1uLL, v16, v7) == v16)
    {
      int v17 = 0;
    }
    else
    {
      uint64_t v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      int v17 = -1;
    }
    fclose(v7);
  }
  else
  {
    uint64_t v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v17 = -1;
  }

  return v17;
}

- (id)newTextureWithPixelFormat:(unint64_t)a3 width:(int)a4 height:(int)a5
{
  if (a5 == 1)
  {
    id v8 = objc_msgSend_textureBufferDescriptorWithPixelFormat_width_resourceOptions_usage_(MEMORY[0x263F12A50], a2, a3, a4, 0, 19);
  }
  else
  {
    id v8 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], a2, a3, a4, a5, 0);
    objc_msgSend_setUsage_(v8, v9, 19, v10);
  }
  uint64_t v11 = objc_msgSend_newTextureWithDescriptor_(self->_device, v6, (uint64_t)v8, v7);

  return v11;
}

- (id)newBufferWithPixelFormat:(unint64_t)a3 width:(int)a4 data:(const void *)a5
{
  uint64_t v8 = objc_msgSend_bytesPerPixelForTextureFormat_(MetalContext, a2, a3, *(uint64_t *)&a4) * a4;
  device = self->_device;
  if (a5)
  {
    return (id)objc_msgSend_newBufferWithBytes_length_options_(device, v7, (uint64_t)a5, v8, 0);
  }
  else
  {
    return (id)objc_msgSend_newBufferWithLength_options_(device, v7, v8, 0);
  }
}

- (id)readTextureFromFile:(const char *)a3 width:(int)a4 height:(int)a5 pixelFormat:(unint64_t)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v11 = a4;
  uint64_t v12 = objc_msgSend_bytesPerPixelForTextureFormat_(MetalContext, a2, a6, *(uint64_t *)&a4) * a4;
  id v13 = malloc_type_malloc(v12 * (int)v7, 0xDC56D800uLL);
  if (v13)
  {
    __ptr = v13;
    uint64_t v14 = fopen(a3, "rb");
    if (v14)
    {
      size_t v16 = v14;
      int v17 = objc_msgSend_newTextureWithPixelFormat_width_height_(self, v15, a6, v8, v7);
      fread(__ptr, v12 * (int)v7, 1uLL, v16);
      if (v7 == 1) {
        uint64_t v19 = &v25;
      }
      else {
        uint64_t v19 = &v24;
      }
      *(void *)uint64_t v19 = 0;
      *((void *)v19 + 1) = 0;
      *((void *)v19 + 2) = 0;
      *((void *)v19 + 3) = v11;
      *((void *)v19 + 4) = (int)v7;
      *((void *)v19 + 5) = 1;
      objc_msgSend_replaceRegion_mipmapLevel_withBytes_bytesPerRow_(v17, v18, (uint64_t)v19, 0, __ptr, v12);
      free(__ptr);
      fclose(v16);
      goto LABEL_10;
    }
    int v27 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v21 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    free(__ptr);
  }
  else
  {
    int v27 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    unint64_t v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  int v17 = 0;
LABEL_10:
  return v17;
}

- (id)readBufferFromFile:(const char *)a3 width:(int)a4 pixelFormat:(unint64_t)a5
{
  uint64_t v7 = objc_msgSend_bytesPerPixelForTextureFormat_(MetalContext, a2, a5, *(uint64_t *)&a4) * a4;
  uint64_t v8 = malloc_type_malloc(v7, 0x7CDC2239uLL);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = fopen(a3, "rb");
    if (v10)
    {
      uint64_t v11 = v10;
      fread(v9, v7, 1uLL, v10);
      id v13 = objc_msgSend_newBufferWithBytes_length_options_(self->_device, v12, (uint64_t)v9, v7, 0);
      free(v9);
      fclose(v11);
      goto LABEL_7;
    }
    uint64_t v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    free(v9);
  }
  else
  {
    uint64_t v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id v13 = 0;
LABEL_7:
  return v13;
}

- (id)bindPixelBufferToMTL2DTexture:(__CVBuffer *)a3 pixelFormat:(unint64_t)a4 plane:(unint64_t)a5
{
  IOSurface = CVPixelBufferGetIOSurface(a3);
  if (IOSurface)
  {
    uint64_t v9 = IOSurface;
    size_t WidthOfPlane = IOSurfaceGetWidthOfPlane(IOSurface, a5);
    size_t HeightOfPlane = IOSurfaceGetHeightOfPlane(v9, a5);
    id v13 = objc_msgSend_bindIOSurfaceToMTL2DTexture_pixelFormat_width_height_plane_(self, v12, (uint64_t)v9, a4, WidthOfPlane, HeightOfPlane, a5);
  }
  else
  {
    fig_log_get_emitter();
    FigSignalErrorAt3();
    id v13 = 0;
  }
  return v13;
}

- (id)bindPixelBufferToMTL2DTexture:(__CVBuffer *)a3 pixelFormat:(unint64_t)a4 textureSize:(CGSize)a5 plane:(unint64_t)a6
{
  double height = a5.height;
  double width = a5.width;
  IOSurface = CVPixelBufferGetIOSurface(a3);
  if (IOSurface
    && (uint64_t v12 = IOSurface,
        size_t WidthOfPlane = IOSurfaceGetWidthOfPlane(IOSurface, a6),
        size_t HeightOfPlane = IOSurfaceGetHeightOfPlane(v12, a6),
        width <= (double)WidthOfPlane)
    && height <= (double)HeightOfPlane)
  {
    size_t v16 = objc_msgSend_bindIOSurfaceToMTL2DTexture_pixelFormat_width_height_plane_(self, v15, (uint64_t)v12, a4, (unint64_t)width, (unint64_t)height, a6);
  }
  else
  {
    fig_log_get_emitter();
    FigSignalErrorAt3();
    size_t v16 = 0;
  }
  return v16;
}

- (id)bindIOSurfaceToMTL2DTexture:(__IOSurface *)a3 pixelFormat:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6 plane:(unint64_t)a7
{
  uint64_t v10 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], a2, a4, a5, a6, 0);
  id v13 = v10;
  if (v10)
  {
    objc_msgSend_setUsage_(v10, v11, 23, v12);
    uint64_t v15 = objc_msgSend_newTextureWithDescriptor_iosurface_plane_(self->_device, v14, (uint64_t)v13, (uint64_t)a3, a7);
    if (!v15)
    {
      fig_log_get_emitter();
      FigSignalErrorAt3();
    }
  }
  else
  {
    fig_log_get_emitter();
    FigSignalErrorAt3();
    uint64_t v15 = 0;
  }

  return v15;
}

- (void)copyMTLBufferToMTLTexture:(id)a3 bytesPerRow:(unint64_t)a4 texture:(id)a5
{
  commandQueue = self->_commandQueue;
  id v8 = a5;
  id v9 = a3;
  id v13 = objc_msgSend_commandBuffer(commandQueue, v10, v11, v12);
  int v17 = objc_msgSend_blitCommandEncoder(v13, v14, v15, v16);
  unint64_t v21 = objc_msgSend_height(v8, v18, v19, v20) * a4;
  v44[0] = objc_msgSend_width(v8, v22, v23, v24);
  v44[1] = objc_msgSend_height(v8, v25, v26, v27);
  v44[2] = objc_msgSend_depth(v8, v28, v29, v30);
  memset(v43, 0, sizeof(v43));
  objc_msgSend_copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_(v17, v31, (uint64_t)v9, 0, a4, v21, v44, v8, 0, 0, v43);

  objc_msgSend_endEncoding(v17, v32, v33, v34);
  objc_msgSend_addCompletedHandler_(v13, v35, (uint64_t)&unk_26E8E0C00, v36);
  objc_msgSend_commit(v13, v37, v38, v39);
  objc_msgSend_waitUntilCompleted(v13, v40, v41, v42);
}

- (unint64_t)textureBytesPerRow:(int)a3 format:(unint64_t)a4
{
  unint64_t v6 = objc_msgSend_minimumLinearTextureAlignmentForPixelFormat_(self->_device, a2, a4, a4);
  return (v6 + objc_msgSend_bytesPerPixelForTextureFormat_(MetalContext, v7, a4, v8) * a3 - 1) / v6 * v6;
}

+ (unint64_t)bytesPerPixelForTextureFormat:(unint64_t)a3
{
  unint64_t result = 1;
  switch(a3)
  {
    case 0xAuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
      return result;
    case 0xBuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x15uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
    case 0x1DuLL:
    case 0x1FuLL:
    case 0x23uLL:
    case 0x24uLL:
    case 0x25uLL:
    case 0x26uLL:
    case 0x27uLL:
    case 0x28uLL:
    case 0x29uLL:
    case 0x2AuLL:
    case 0x2CuLL:
    case 0x2DuLL:
    case 0x2EuLL:
    case 0x2FuLL:
    case 0x30uLL:
    case 0x31uLL:
    case 0x32uLL:
    case 0x33uLL:
    case 0x34uLL:
    case 0x38uLL:
    case 0x39uLL:
    case 0x3AuLL:
    case 0x3BuLL:
    case 0x3DuLL:
    case 0x42uLL:
    case 0x43uLL:
    case 0x44uLL:
    case 0x45uLL:
    case 0x4BuLL:
    case 0x4CuLL:
    case 0x4DuLL:
    case 0x4EuLL:
    case 0x4FuLL:
      goto LABEL_12;
    case 0x14uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1EuLL:
    case 0x20uLL:
    case 0x21uLL:
    case 0x22uLL:
    case 0x2BuLL:
      return 2;
    case 0x35uLL:
    case 0x36uLL:
    case 0x37uLL:
    case 0x3CuLL:
    case 0x3EuLL:
    case 0x3FuLL:
    case 0x40uLL:
    case 0x41uLL:
    case 0x46uLL:
    case 0x47uLL:
    case 0x48uLL:
    case 0x49uLL:
    case 0x4AuLL:
    case 0x50uLL:
    case 0x51uLL:
      return 4;
    default:
      char v4 = a3 - 90;
      if (a3 - 90 > 0x23) {
        goto LABEL_11;
      }
      if (((1 << v4) & 0x3D0E000) != 0) {
        return 8;
      }
      if (((1 << v4) & 0xF) != 0) {
        return 4;
      }
      if (((1 << v4) & 0xE00000000) != 0) {
        return 16;
      }
LABEL_11:
      if (a3 != 1)
      {
LABEL_12:
        NSLog(&cfstr_UnidentifiedMe.isa, a2);
        return 0;
      }
      return result;
  }
}

- (MTLDevice)device
{
  return self->_device;
}

- (MTLCommandQueue)commandQueue
{
  return self->_commandQueue;
}

- (MTLLibrary)library
{
  return self->_library;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end