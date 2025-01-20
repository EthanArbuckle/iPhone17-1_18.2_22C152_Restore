@interface MTKTextureUploader
- (MTKTextureUploader)initWithDevice:(id)a3 commandQueue:(id)a4 notifyQueue:(id)a5;
- (id)newTextureWithData:(id)a3 options:(id)a4 error:(id *)a5;
- (void)copyBytes:(const void *)a3 toTexture:(id)a4 bitsPerPixel:(unint64_t)a5 pixelComponents:(unint64_t)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8 region:(id *)a9 slice:(unint64_t)a10 level:(unint64_t)a11 flipVertically:(BOOL)a12;
- (void)copyTexture:(id)a3 toTexture:(id)a4;
- (void)dealloc;
- (void)finishWithCompletionHandler:(id)a3;
- (void)generateMipmapsForTexture:(id)a3;
@end

@implementation MTKTextureUploader

- (void)dealloc
{
  self->_device = 0;
  blit = self->_blit;
  if (blit)
  {
    [(MTLBlitCommandEncoder *)blit endEncoding];

    self->_blit = 0;
  }

  self->_commandBuffer = 0;
  self->_lock = 0;
  dispatch_release((dispatch_object_t)self->_notifyQueue);
  self->_notifyQueue = 0;
  v4.receiver = self;
  v4.super_class = (Class)MTKTextureUploader;
  [(MTKTextureUploader *)&v4 dealloc];
}

- (MTKTextureUploader)initWithDevice:(id)a3 commandQueue:(id)a4 notifyQueue:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)MTKTextureUploader;
  v8 = [(MTKTextureUploader *)&v12 init];
  if (v8)
  {
    v8->_device = (MTLDevice *)a3;
    v8->_lock = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    v8->_notifyQueue = (OS_dispatch_queue *)a5;
    dispatch_retain((dispatch_object_t)a5);
    v9 = (void *)MEMORY[0x2166C14B0]();
    if (a4)
    {
      v10 = (MTLCommandBuffer *)(id)[a4 commandBuffer];
      v8->_commandBuffer = v10;
      v8->_blit = (MTLBlitCommandEncoder *)(id)[(MTLCommandBuffer *)v10 blitCommandEncoder];
    }
  }
  return v8;
}

- (void)finishWithCompletionHandler:(id)a3
{
  if (self->_commandBuffer)
  {
    [(MTLBlitCommandEncoder *)self->_blit endEncoding];
    commandBuffer = self->_commandBuffer;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __50__MTKTextureUploader_finishWithCompletionHandler___block_invoke;
    v7[3] = &unk_264254FE0;
    v7[4] = a3;
    [(MTLCommandBuffer *)commandBuffer addCompletedHandler:v7];
    [(MTLCommandBuffer *)self->_commandBuffer commit];

    self->_blit = 0;
  }
  else
  {
    notifyQueue = self->_notifyQueue;
    dispatch_async(notifyQueue, a3);
  }
}

- (id)newTextureWithData:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = objc_alloc_init(MEMORY[0x263F12A50]);
  objc_msgSend(v8, "setTextureType:", objc_msgSend(a3, "textureType"));
  objc_msgSend(v8, "setPixelFormat:", objc_msgSend(a3, "pixelFormat"));
  objc_msgSend(v8, "setWidth:", objc_msgSend(a3, "width"));
  objc_msgSend(v8, "setHeight:", objc_msgSend(a3, "height"));
  objc_msgSend(v8, "setDepth:", objc_msgSend(a3, "depth"));
  objc_msgSend(v8, "setMipmapLevelCount:", objc_msgSend(a3, "numMipmapLevels"));
  [v8 setSampleCount:1];
  objc_msgSend(v8, "setArrayLength:", objc_msgSend(a3, "numArrayElements"));
  if ([a3 numMipmapLevels] == 1
    && ((objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"MTKTextureLoaderOptionAllocateMipmaps"), "BOOLValue") & 1) != 0|| objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"MTKTextureLoaderOptionGenerateMipmaps"), "BOOLValue")))
  {
    unint64_t v9 = [a3 width];
    unint64_t v10 = [a3 height];
    if (v9 <= v10) {
      unint64_t v11 = v10;
    }
    else {
      unint64_t v11 = v9;
    }
    [v8 setMipmapLevelCount:(unint64_t)(floor(log2((double)v11)) + 1.0)];
  }
  objc_super v12 = (void *)[a4 objectForKeyedSubscript:@"MTKTextureLoaderOptionLoadAsArray"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v12 BOOLValue]) {
    objc_msgSend(v8, "setTextureType:", arrayTextureTypeFromTextureType(objc_msgSend(v8, "textureType")));
  }
  uint64_t v13 = [v8 storageMode];
  if ([a4 objectForKey:@"MTKTextureLoaderOptionTextureStorageMode"]) {
    uint64_t v13 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"MTKTextureLoaderOptionTextureStorageMode"), "unsignedIntegerValue");
  }
  if (v13 == 2) {
    uint64_t v14 = [(MTLDevice *)self->_device newTextureWithDescriptor:v8];
  }
  else {
    uint64_t v14 = 0;
  }
  [v8 setStorageMode:v13];
  if ([a4 objectForKey:@"MTKTextureLoaderOptionTextureUsage"]) {
    objc_msgSend(v8, "setUsage:", objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"MTKTextureLoaderOptionTextureUsage"), "unsignedIntegerValue"));
  }
  if ([a4 objectForKey:@"MTKTextureLoaderOptionTextureCPUCacheMode"]) {
    objc_msgSend(v8, "setCpuCacheMode:", objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"MTKTextureLoaderOptionTextureCPUCacheMode"), "unsignedIntegerValue"));
  }
  v15 = (void *)[(MTLDevice *)self->_device newTextureWithDescriptor:v8];

  v16 = (__CFString *)[a3 imageOrigin];
  v17 = (__CFString *)[a4 objectForKey:@"MTKTextureLoaderOptionOrigin"];
  if (v17)
  {
    v18 = v17;
    if (v17 == @"MTKTextureLoaderOriginFlippedVertically")
    {
      if (v16 == @"MTKTextureLoaderOriginTopLeft") {
        v18 = @"MTKTextureLoaderOriginBottomLeft";
      }
      else {
        v18 = @"MTKTextureLoaderOriginTopLeft";
      }
    }
  }
  else
  {
    v18 = v16;
  }
  if (v13 == 2) {
    v19 = (void *)v14;
  }
  else {
    v19 = v15;
  }
  if (!v19 || !v15)
  {
    if (a5) {
      *a5 = (id)_newMTKTextureErrorWithCodeAndErrorString(0, @"Failed to allocate texture memory.");
    }
    if (v19 != v15) {

    }
    return 0;
  }
  v40 = a5;
  v41 = v15;
  if ([a3 numArrayElements])
  {
    uint64_t v20 = 0;
    while (![a3 numFaces])
    {
LABEL_48:
      if (++v20 >= (unint64_t)[a3 numArrayElements]) {
        goto LABEL_49;
      }
    }
    uint64_t v21 = 0;
    v42 = v16;
    v43 = v18;
    v44 = v19;
    while (1)
    {
      unint64_t v46 = [a3 width];
      unint64_t v45 = [a3 height];
      if ([a3 numMipmapLevels]) {
        break;
      }
LABEL_47:
      if (++v21 >= (unint64_t)[a3 numFaces]) {
        goto LABEL_48;
      }
    }
    uint64_t v22 = 0;
    while (![a3 depth])
    {
LABEL_41:
      if (v46 <= 1) {
        uint64_t v35 = 1;
      }
      else {
        uint64_t v35 = v46 >> 1;
      }
      uint64_t v36 = v45 >> 1;
      if (v45 <= 1) {
        uint64_t v36 = 1;
      }
      unint64_t v45 = v36;
      unint64_t v46 = v35;
      if (++v22 >= (unint64_t)[a3 numMipmapLevels]) {
        goto LABEL_47;
      }
    }
    uint64_t v23 = 0;
    while (1)
    {
      uint64_t v54 = 0;
      uint64_t v55 = 0;
      uint64_t v24 = [a3 getDataForArrayElement:v20 face:v21 level:v22 depthPlane:v23 bytesPerRow:&v55 bytesPerImage:&v54];
      if (!v24) {
        break;
      }
      v25 = (void *)v24;
      uint64_t v53 = 0;
      BOOL v48 = v16 != v18;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v50 = 0u;
      [a3 pixelFormat];
      MTLPixelFormatGetInfoForDevice();
      uint64_t v26 = [v25 bytes];
      uint64_t v27 = 8 * *((void *)&v51 + 1);
      uint64_t v28 = v52;
      uint64_t v29 = v54;
      uint64_t v30 = v55;
      uint64_t v31 = [a3 numFaces];
      v49[0] = 0;
      v49[1] = 0;
      v49[2] = v23;
      v49[3] = v46;
      v49[4] = v45;
      v49[5] = 1;
      LOBYTE(v39) = v48;
      uint64_t v32 = v26;
      v19 = v44;
      uint64_t v33 = v27;
      uint64_t v34 = v30;
      v16 = v42;
      v18 = v43;
      [(MTKTextureUploader *)self copyBytes:v32 toTexture:v44 bitsPerPixel:v33 pixelComponents:v28 bytesPerRow:v34 bytesPerImage:v29 region:v49 slice:v21 + v31 * v20 level:v22 flipVertically:v39];
      if (++v23 >= (unint64_t)[a3 depth]) {
        goto LABEL_41;
      }
    }
    if (v40) {
      id *v40 = (id)_newMTKTextureErrorWithCodeAndErrorString(0, @"Texture malformed.");
    }
    if (v44 != v41) {

    }
    return 0;
  }
LABEL_49:
  v37 = v41;
  if (v19 != v41)
  {
    [(MTKTextureUploader *)self copyTexture:v19 toTexture:v41];
  }
  return v37;
}

- (void)copyBytes:(const void *)a3 toTexture:(id)a4 bitsPerPixel:(unint64_t)a5 pixelComponents:(unint64_t)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8 region:(id *)a9 slice:(unint64_t)a10 level:(unint64_t)a11 flipVertically:(BOOL)a12
{
  if (!a3 || !a4) {
    -[MTKTextureUploader copyBytes:toTexture:bitsPerPixel:pixelComponents:bytesPerRow:bytesPerImage:region:slice:level:flipVertically:]();
  }
  v15 = (void *)a3;
  unint64_t v16 = a10;
  unint64_t v17 = a11;
  if (a12)
  {
    unint64_t v21 = a6;
    v19 = malloc_type_malloc(a8, 0xC6B31720uLL);
    reflectImage(v15, v19, a9->var1.var0, a9->var1.var1, a7, a5, v21);
    v15 = v19;
    unint64_t v17 = a11;
    unint64_t v16 = a10;
  }
  uint64_t v23 = 0;
  memset(&v22[3], 0, 48);
  objc_msgSend(a4, "pixelFormat", v21);
  MTLPixelFormatGetInfoForDevice();
  long long v20 = *(_OWORD *)&a9->var0.var2;
  v22[0] = *(_OWORD *)&a9->var0.var0;
  v22[1] = v20;
  v22[2] = *(_OWORD *)&a9->var1.var1;
  [a4 replaceRegion:v22 mipmapLevel:v17 slice:v16 withBytes:v15 bytesPerRow:a7 bytesPerImage:a8];
  if (a12) {
    free(v15);
  }
}

- (void)generateMipmapsForTexture:(id)a3
{
  if (a3)
  {
    [(NSLock *)self->_lock lock];
    [(MTLBlitCommandEncoder *)self->_blit generateMipmapsForTexture:a3];
    lock = self->_lock;
    [(NSLock *)lock unlock];
  }
}

uint64_t __50__MTKTextureUploader_finishWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)copyTexture:(id)a3 toTexture:(id)a4
{
  if (!a3 || !a4) {
    -[MTKTextureUploader copyTexture:toTexture:]();
  }
  [(NSLock *)self->_lock lock];
  uint64_t v7 = [a3 textureType];
  uint64_t v8 = 6;
  if ((unint64_t)(v7 - 5) >= 2) {
    uint64_t v8 = 1;
  }
  uint64_t v18 = v8;
  if ([a3 arrayLength])
  {
    uint64_t v9 = 0;
    do
    {
      uint64_t v10 = 0;
      uint64_t v16 = v9;
      uint64_t v17 = v9 * v18;
      do
      {
        unint64_t v11 = [a3 width];
        unint64_t v12 = [a3 height];
        unint64_t v13 = [a3 depth];
        if ([a3 mipmapLevelCount])
        {
          unint64_t v14 = 0;
          do
          {
            blit = self->_blit;
            memset(v21, 0, sizeof(v21));
            memset(v19, 0, sizeof(v19));
            v20[0] = v11;
            v20[1] = v12;
            v20[2] = v13;
            [(MTLBlitCommandEncoder *)blit copyFromTexture:a3 sourceSlice:v10 + v17 sourceLevel:v14 sourceOrigin:v21 sourceSize:v20 toTexture:a4 destinationSlice:v10 + v17 destinationLevel:v14 destinationOrigin:v19];
            if (v11 <= 1) {
              unint64_t v11 = 1;
            }
            else {
              v11 >>= 1;
            }
            if (v12 <= 1) {
              unint64_t v12 = 1;
            }
            else {
              v12 >>= 1;
            }
            if (v13 <= 1) {
              unint64_t v13 = 1;
            }
            else {
              v13 >>= 1;
            }
            ++v14;
          }
          while (v14 < [a3 mipmapLevelCount]);
        }
        ++v10;
      }
      while (v10 != v18);
      uint64_t v9 = v16 + 1;
    }
    while (v16 + 1 < (unint64_t)[a3 arrayLength]);
  }
  [(NSLock *)self->_lock unlock];
}

- (void)copyBytes:toTexture:bitsPerPixel:pixelComponents:bytesPerRow:bytesPerImage:region:slice:level:flipVertically:.cold.1()
{
}

- (void)copyTexture:toTexture:.cold.1()
{
}

@end