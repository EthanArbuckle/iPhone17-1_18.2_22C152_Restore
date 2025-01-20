@interface CAMThumbnailGenerator
- (CAMThumbnailGenerator)init;
- (CGImage)newBGRAImageInOrientation:(int64_t)a3 usingPixelBuffer:(__CVBuffer *)a4;
- (CGImage)newBGRAImageInOrientation:(int64_t)a3 usingSurface:(void *)a4;
- (CGImage)newBGRAImageOfFormat:(int64_t)a3 inOrientation:(int64_t)a4 usingPixelBuffer:(__CVBuffer *)a5;
- (CGImage)newBGRAImageOfFormat:(int64_t)a3 inOrientation:(int64_t)a4 usingSurface:(void *)a5;
- (NSMapTable)_generationQueueRotationSessionsMapTable;
- (OS_dispatch_queue)_generationQueue;
- (OpaqueVTPixelTransferSession)_generationQueuePixelTransferSession;
- (__CVBuffer)_newRotatedPixelBuffer:(__CVBuffer *)a3 withOrientation:(int64_t)a4;
- (__CVBuffer)_newThumbnailOfFormat:(int64_t)a3 inOrientation:(int64_t)a4 withPixelFormat:(unsigned int)a5 usingPixelBuffer:(__CVBuffer *)a6;
- (__CVBuffer)_newThumbnailOfSize:(CGSize)a3 inOrientation:(int64_t)a4 withPixelFormat:(unsigned int)a5 usingPixelBuffer:(__CVBuffer *)a6;
- (id)_neededColorspacePropertiesFromMetadata:(id)a3;
- (id)newJPEGDataInOrientation:(int64_t)a3 usingPixelBuffer:(__CVBuffer *)a4;
- (id)newJPEGDataInOrientation:(int64_t)a3 usingSurface:(void *)a4 withMetadata:(id)a5;
- (id)newJPEGDataOfFormat:(int64_t)a3 inOrientation:(int64_t)a4 usingSurface:(void *)a5 withMetadata:(id)a6;
- (void)dealloc;
@end

@implementation CAMThumbnailGenerator

- (CAMThumbnailGenerator)init
{
  v9.receiver = self;
  v9.super_class = (Class)CAMThumbnailGenerator;
  v2 = [(CAMThumbnailGenerator *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.camera.thumbnail-generator", v3);
    generationQueue = v2->__generationQueue;
    v2->__generationQueue = (OS_dispatch_queue *)v4;

    v8 = v2;
    pl_dispatch_async();
    v6 = v8;
  }
  return v2;
}

void __29__CAMThumbnailGenerator_init__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (VTPixelTransferSessionRef *)(*(void *)(a1 + 32) + 16)))
  {
    v2 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __29__CAMThumbnailGenerator_init__block_invoke_cold_1();
    }
  }
  id v3 = objc_alloc_init(MEMORY[0x263F08968]);
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v3;

  for (uint64_t i = 0; i != 8; ++i)
  {
    uint64_t v7 = qword_209C7B808[i];
    PLDegreesForImageOrientation();
    unsigned int v8 = VTImageRotationSessionCreate();
    if (v8)
    {
      unsigned int v9 = v8;
      v10 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v12 = v7;
        __int16 v13 = 2048;
        uint64_t v14 = v9;
        _os_log_error_impl(&dword_2099F8000, v10, OS_LOG_TYPE_ERROR, "Failed to create image rotation session (%ld) for thumbnail generation (%ld)", buf, 0x16u);
      }
    }
  }
}

- (CGImage)newBGRAImageOfFormat:(int64_t)a3 inOrientation:(int64_t)a4 usingSurface:(void *)a5
{
  if (a5)
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2020000000;
    uint64_t v23 = 0;
    unsigned int v9 = [(CAMThumbnailGenerator *)self _generationQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __73__CAMThumbnailGenerator_newBGRAImageOfFormat_inOrientation_usingSurface___block_invoke;
    block[3] = &unk_263FA55A0;
    block[6] = a5;
    block[7] = a3;
    block[8] = a4;
    block[4] = self;
    block[5] = &v20;
    dispatch_sync(v9, block);

    v10 = (CGImage *)v21[3];
    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CAMThumbnailGenerator newBGRAImageOfFormat:inOrientation:usingSurface:](a3, v11, v12, v13, v14, v15, v16, v17);
    }

    return 0;
  }
  return v10;
}

- (OS_dispatch_queue)_generationQueue
{
  return self->__generationQueue;
}

- (OpaqueVTPixelTransferSession)_generationQueuePixelTransferSession
{
  return self->__generationQueuePixelTransferSession;
}

- (NSMapTable)_generationQueueRotationSessionsMapTable
{
  return self->__generationQueueRotationSessionsMapTable;
}

- (id)newJPEGDataOfFormat:(int64_t)a3 inOrientation:(int64_t)a4 usingSurface:(void *)a5 withMetadata:(id)a6
{
  id v10 = a6;
  if (a5)
  {
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__23;
    v31 = __Block_byref_object_dispose__23;
    id v32 = 0;
    v11 = [(CAMThumbnailGenerator *)self _generationQueue];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __85__CAMThumbnailGenerator_newJPEGDataOfFormat_inOrientation_usingSurface_withMetadata___block_invoke;
    v21[3] = &unk_263FA5550;
    v24 = a5;
    int64_t v25 = a3;
    v21[4] = self;
    int64_t v26 = a4;
    id v22 = v10;
    uint64_t v23 = &v27;
    dispatch_sync(v11, v21);

    id v12 = (id)v28[5];
    _Block_object_dispose(&v27, 8);
  }
  else
  {
    uint64_t v13 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CAMThumbnailGenerator newJPEGDataOfFormat:inOrientation:usingSurface:withMetadata:](a3, v13, v14, v15, v16, v17, v18, v19);
    }

    id v12 = 0;
  }

  return v12;
}

- (id)_neededColorspacePropertiesFromMetadata:(id)a3
{
  v25[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F0F248];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:v3];
  uint64_t v6 = *MEMORY[0x263F0F220];
  uint64_t v7 = [v5 objectForKeyedSubscript:*MEMORY[0x263F0F220]];
  uint64_t v8 = *MEMORY[0x263F0EFD8];
  unsigned int v9 = [v4 objectForKeyedSubscript:*MEMORY[0x263F0EFD8]];

  if (v7)
  {
    if (v9)
    {
      uint64_t v23 = v7;
      v24[0] = v3;
      uint64_t v22 = v6;
      id v10 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      v24[1] = v8;
      v25[0] = v10;
      v25[1] = v9;
      v11 = NSDictionary;
      id v12 = (NSObject **)v25;
      uint64_t v13 = v24;
      uint64_t v14 = 2;
    }
    else
    {
      if ([v7 isEqual:&unk_26BDDEDD8])
      {
        uint64_t v15 = 0;
        goto LABEL_12;
      }
      uint64_t v19 = v7;
      uint64_t v20 = v3;
      uint64_t v18 = v6;
      id v10 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      v21 = v10;
      v11 = NSDictionary;
      id v12 = &v21;
      uint64_t v13 = &v20;
      uint64_t v14 = 1;
    }
    uint64_t v15 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:v14];
  }
  else
  {
    id v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = 0;
      _os_log_impl(&dword_2099F8000, v10, OS_LOG_TYPE_DEFAULT, "Unable to find colorspace information during thumbnail generation! Generated thumbnails may not match original image", (uint8_t *)&v17, 2u);
    }
    uint64_t v15 = 0;
  }

LABEL_12:
  return v15;
}

- (void)dealloc
{
  generationQueue = self->__generationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__CAMThumbnailGenerator_dealloc__block_invoke;
  block[3] = &unk_263FA0208;
  block[4] = self;
  dispatch_sync(generationQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)CAMThumbnailGenerator;
  [(CAMThumbnailGenerator *)&v4 dealloc];
}

void __32__CAMThumbnailGenerator_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(OpaqueVTPixelTransferSession **)(v2 + 16);
  if (v3)
  {
    VTPixelTransferSessionInvalidate(v3);
    CFRelease(*(CFTypeRef *)(*(void *)(a1 + 32) + 16));
    *(void *)(*(void *)(a1 + 32) + 16) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(v2 + 24);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        MEMORY[0x21050B630](objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "objectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * v8++), (void)v11));
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 24);
  *(void *)(v9 + 24) = 0;
}

- (__CVBuffer)_newThumbnailOfSize:(CGSize)a3 inOrientation:(int64_t)a4 withPixelFormat:(unsigned int)a5 usingPixelBuffer:(__CVBuffer *)a6
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v40 = *MEMORY[0x263EF8340];
  if (!a6)
  {
    uint64_t v22 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[CAMThumbnailGenerator _newThumbnailOfSize:inOrientation:withPixelFormat:usingPixelBuffer:](v22, width, height);
    }
    uint64_t v23 = 0;
    goto LABEL_36;
  }
  long long v11 = [(CAMThumbnailGenerator *)self _generationQueuePixelTransferSession];
  long long v12 = [(CAMThumbnailGenerator *)self _generationQueueRotationSessionsMapTable];
  long long v13 = [NSNumber numberWithInteger:a4];
  uint64_t v14 = [v12 objectForKey:v13];

  CVPixelBufferGetPixelFormatType(a6);
  size_t v15 = CVPixelBufferGetWidth(a6);
  double v16 = floor((width + 2.0 + -1.0) * 0.5);
  if ((double)v15 / (v16 + v16) > 4.0)
  {
    *(void *)destinationBuffer = 0;
    OSStatus IOSurfaceBackedCVPixelBuffer = FigCreateIOSurfaceBackedCVPixelBuffer();
    uint64_t v18 = 0;
    if (IOSurfaceBackedCVPixelBuffer) {
      BOOL v19 = 1;
    }
    else {
      BOOL v19 = *(void *)destinationBuffer == 0;
    }
    if (v19 || v11 == 0)
    {
      OSStatus v21 = IOSurfaceBackedCVPixelBuffer;
    }
    else
    {
      OSStatus v25 = VTPixelTransferSessionTransferImage(v11, a6, 0);
      OSStatus v21 = v25;
      uint64_t v18 = *(__CVBuffer **)destinationBuffer;
      if (!v25)
      {
        v24 = CVPixelBufferRetain(*(CVPixelBufferRef *)destinationBuffer);
        uint64_t v18 = *(__CVBuffer **)destinationBuffer;
        goto LABEL_18;
      }
    }
    v24 = 0;
LABEL_18:
    CVPixelBufferRelease(v18);
    goto LABEL_19;
  }
  v24 = CVPixelBufferRetain(a6);
  OSStatus v21 = 0;
LABEL_19:
  uint64_t v23 = 0;
  if (!v21 && v24)
  {
    *(void *)destinationBuffer = 0;
    PLDegreesForImageOrientation();
    OSStatus IOSurfaceBackedCVPixelBufferWithAttributes = FigCreateIOSurfaceBackedCVPixelBufferWithAttributes();
    uint64_t v27 = 0;
    if (IOSurfaceBackedCVPixelBufferWithAttributes) {
      BOOL v28 = 1;
    }
    else {
      BOOL v28 = *(void *)destinationBuffer == 0;
    }
    if (v28 || v14 == 0)
    {
      OSStatus v21 = IOSurfaceBackedCVPixelBufferWithAttributes;
    }
    else
    {
      OSStatus v30 = MEMORY[0x21050B640](v14, v24);
      OSStatus v21 = v30;
      uint64_t v27 = *(__CVBuffer **)destinationBuffer;
      if (!v30)
      {
        uint64_t v23 = CVPixelBufferRetain(*(CVPixelBufferRef *)destinationBuffer);
        uint64_t v27 = *(__CVBuffer **)destinationBuffer;
        goto LABEL_32;
      }
    }
    uint64_t v23 = 0;
LABEL_32:
    CVPixelBufferRelease(v27);
  }
  CVPixelBufferRelease(v24);
  if (v21)
  {
    uint64_t v22 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v41.double width = width;
      v41.double height = height;
      id v32 = NSStringFromCGSize(v41);
      *(_DWORD *)destinationBuffer = 136315906;
      *(void *)&destinationBuffer[4] = "-[CAMThumbnailGenerator _newThumbnailOfSize:inOrientation:withPixelFormat:usingPixelBuffer:]";
      __int16 v34 = 2114;
      v35 = v32;
      __int16 v36 = 2048;
      int64_t v37 = a4;
      __int16 v38 = 2048;
      uint64_t v39 = v21;
      _os_log_error_impl(&dword_2099F8000, v22, OS_LOG_TYPE_ERROR, "<%s> Failed to generate a thumbnail of size %{public}@ in orientation %ld using a pixel buffer (%ld)", destinationBuffer, 0x2Au);
    }
LABEL_36:
  }
  return v23;
}

- (__CVBuffer)_newThumbnailOfFormat:(int64_t)a3 inOrientation:(int64_t)a4 withPixelFormat:(unsigned int)a5 usingPixelBuffer:(__CVBuffer *)a6
{
  uint64_t v7 = *(void *)&a5;
  size_t Width = CVPixelBufferGetWidth(a6);
  objc_msgSend(MEMORY[0x263F5DB18], "scaledSizeForSize:format:capLength:", a3, 1, (double)Width, (double)CVPixelBufferGetHeight(a6));
  return -[CAMThumbnailGenerator _newThumbnailOfSize:inOrientation:withPixelFormat:usingPixelBuffer:](self, "_newThumbnailOfSize:inOrientation:withPixelFormat:usingPixelBuffer:", a4, v7, a6);
}

- (__CVBuffer)_newRotatedPixelBuffer:(__CVBuffer *)a3 withOrientation:(int64_t)a4
{
  if (a3)
  {
    texture = 0;
    int v7 = PLDegreesForImageOrientation();
    int IsMirrored = PLImageOrientationIsMirrored();
    if (!v7 && !IsMirrored) {
      return CVPixelBufferRetain(a3);
    }
    CVPixelBufferGetWidth(a3);
    CVPixelBufferGetHeight(a3);
    CVPixelBufferGetPixelFormatType(a3);
    int IOSurfaceBackedCVPixelBufferWithAttributes = FigCreateIOSurfaceBackedCVPixelBufferWithAttributes();
    long long v12 = [(CAMThumbnailGenerator *)self _generationQueueRotationSessionsMapTable];
    long long v13 = [NSNumber numberWithInteger:a4];
    [v12 objectForKey:v13];

    CVPixelBufferRelease(0);
    if (IOSurfaceBackedCVPixelBufferWithAttributes)
    {
      texture = 0;
      uint64_t v14 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[CAMThumbnailGenerator _newRotatedPixelBuffer:withOrientation:](IOSurfaceBackedCVPixelBufferWithAttributes, a4, v14);
      }
    }
    return texture;
  }
  else
  {
    uint64_t v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CAMThumbnailGenerator _newRotatedPixelBuffer:withOrientation:]();
    }

    return 0;
  }
}

void __85__CAMThumbnailGenerator_newJPEGDataOfFormat_inOrientation_usingSurface_withMetadata___block_invoke(uint64_t a1)
{
  v26[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(__IOSurface **)(a1 + 56);
  CVPixelBufferRef pixelBufferOut = 0;
  CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x263EFFB08], v2, 0, &pixelBufferOut);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 72);
  uint64_t PixelFormat = IOSurfaceGetPixelFormat(v2);
  int v7 = (__CVBuffer *)[v3 _newThumbnailOfFormat:v4 inOrientation:v5 withPixelFormat:PixelFormat usingPixelBuffer:pixelBufferOut];
  CVPixelBufferGetIOSurface(v7);
  uint64_t v8 = *MEMORY[0x263F2F8D0];
  v26[0] = &unk_26BDDEDC0;
  uint64_t v9 = *MEMORY[0x263F2F8C8];
  v25[0] = v8;
  v25[1] = v9;
  uint64_t v23 = *MEMORY[0x263F2F980];
  v24 = &unk_26BDE05C0;
  id v10 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  v26[1] = v10;
  long long v11 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];

  int v12 = PFFigJPEGDataFromImage();
  id v13 = 0;
  uint64_t v14 = v13;
  if (v12)
  {
    size_t v15 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __85__CAMThumbnailGenerator_newJPEGDataOfFormat_inOrientation_usingSurface_withMetadata___block_invoke_cold_2();
    }
  }
  else
  {
    if (!v13) {
      goto LABEL_5;
    }
    size_t v15 = [*(id *)(a1 + 32) _neededColorspacePropertiesFromMetadata:*(void *)(a1 + 40)];
    if (v15)
    {
      uint64_t EXIFJPEGData = CGImageCreateEXIFJPEGData();
      uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = EXIFJPEGData;
    }
    else
    {
      uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
      id v20 = v14;
      uint64_t v18 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v20;
    }

    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      OSStatus v21 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        __85__CAMThumbnailGenerator_newJPEGDataOfFormat_inOrientation_usingSurface_withMetadata___block_invoke_cold_1();
      }

      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), 0);
    }
  }

LABEL_5:
  CVPixelBufferRelease(pixelBufferOut);
  CVPixelBufferRelease(v7);
}

- (id)newJPEGDataInOrientation:(int64_t)a3 usingSurface:(void *)a4 withMetadata:(id)a5
{
  id v8 = a5;
  if (a4)
  {
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x3032000000;
    OSStatus v21 = __Block_byref_object_copy__23;
    uint64_t v22 = __Block_byref_object_dispose__23;
    id v23 = 0;
    uint64_t v9 = [(CAMThumbnailGenerator *)self _generationQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__CAMThumbnailGenerator_newJPEGDataInOrientation_usingSurface_withMetadata___block_invoke;
    block[3] = &unk_263FA5578;
    double v16 = a4;
    int64_t v17 = a3;
    block[4] = self;
    id v14 = v8;
    size_t v15 = &v18;
    dispatch_sync(v9, block);

    id v10 = (id)v19[5];
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    long long v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CAMThumbnailGenerator newJPEGDataInOrientation:usingSurface:withMetadata:]();
    }

    id v10 = 0;
  }

  return v10;
}

void __76__CAMThumbnailGenerator_newJPEGDataInOrientation_usingSurface_withMetadata___block_invoke(uint64_t a1)
{
  v22[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(__IOSurface **)(a1 + 56);
  CVPixelBufferRef pixelBufferOut = 0;
  CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x263EFFB08], v2, 0, &pixelBufferOut);
  uint64_t v3 = (__CVBuffer *)[*(id *)(a1 + 32) _newRotatedPixelBuffer:pixelBufferOut withOrientation:*(void *)(a1 + 64)];
  CVPixelBufferGetIOSurface(v3);
  uint64_t v4 = *MEMORY[0x263F2F8D0];
  v22[0] = &unk_26BDDEDC0;
  uint64_t v5 = *MEMORY[0x263F2F8C8];
  v21[0] = v4;
  v21[1] = v5;
  uint64_t v19 = *MEMORY[0x263F2F980];
  uint64_t v20 = &unk_26BDE05C0;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  v22[1] = v6;
  int v7 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];

  int v8 = PFFigJPEGDataFromImage();
  id v9 = 0;
  id v10 = v9;
  if (v8)
  {
    long long v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __76__CAMThumbnailGenerator_newJPEGDataInOrientation_usingSurface_withMetadata___block_invoke_cold_2();
    }
  }
  else
  {
    if (!v9) {
      goto LABEL_5;
    }
    long long v11 = [*(id *)(a1 + 32) _neededColorspacePropertiesFromMetadata:*(void *)(a1 + 40)];
    if (v11)
    {
      uint64_t EXIFJPEGData = CGImageCreateEXIFJPEGData();
      uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
      id v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = EXIFJPEGData;
    }
    else
    {
      uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
      id v16 = v10;
      id v14 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v16;
    }

    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      int64_t v17 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        __85__CAMThumbnailGenerator_newJPEGDataOfFormat_inOrientation_usingSurface_withMetadata___block_invoke_cold_1();
      }

      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), 0);
    }
  }

LABEL_5:
  CVPixelBufferRelease(pixelBufferOut);
  CVPixelBufferRelease(v3);
}

void __73__CAMThumbnailGenerator_newBGRAImageOfFormat_inOrientation_usingSurface___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(__IOSurface **)(a1 + 48);
  CVPixelBufferRef pixelBufferOut = 0;
  CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x263EFFB08], v2, 0, &pixelBufferOut);
  uint64_t v3 = (__CVBuffer *)[*(id *)(a1 + 32) _newThumbnailOfFormat:*(void *)(a1 + 56) inOrientation:*(void *)(a1 + 64) withPixelFormat:1111970369 usingPixelBuffer:pixelBufferOut];
  if (CVPixelBufferGetIOSurface(v3))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = UICreateCGImageFromIOSurface();
  }
  else
  {
    uint64_t v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __73__CAMThumbnailGenerator_newBGRAImageOfFormat_inOrientation_usingSurface___block_invoke_cold_1();
    }
  }
  CVPixelBufferRelease(pixelBufferOut);
  CVPixelBufferRelease(v3);
}

- (CGImage)newBGRAImageInOrientation:(int64_t)a3 usingSurface:(void *)a4
{
  if (a4)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000;
    uint64_t v15 = 0;
    int v7 = [(CAMThumbnailGenerator *)self _generationQueue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __64__CAMThumbnailGenerator_newBGRAImageInOrientation_usingSurface___block_invoke;
    v11[3] = &unk_263FA55C8;
    v11[6] = a4;
    v11[7] = a3;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v7, v11);

    int v8 = (CGImage *)v13[3];
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CAMThumbnailGenerator newBGRAImageInOrientation:usingSurface:]();
    }

    return 0;
  }
  return v8;
}

void __64__CAMThumbnailGenerator_newBGRAImageInOrientation_usingSurface___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(__IOSurface **)(a1 + 48);
  CVPixelBufferRef pixelBufferOut = 0;
  CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x263EFFB08], v2, 0, &pixelBufferOut);
  double Width = (double)CVPixelBufferGetWidth(pixelBufferOut);
  size_t Height = CVPixelBufferGetHeight(pixelBufferOut);
  uint64_t v5 = (__CVBuffer *)objc_msgSend(*(id *)(a1 + 32), "_newThumbnailOfSize:inOrientation:withPixelFormat:usingPixelBuffer:", *(void *)(a1 + 56), 1111970369, pixelBufferOut, Width, (double)Height);
  if (CVPixelBufferGetIOSurface(v5))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = UICreateCGImageFromIOSurface();
  }
  else
  {
    uint64_t v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __73__CAMThumbnailGenerator_newBGRAImageOfFormat_inOrientation_usingSurface___block_invoke_cold_1();
    }
  }
  CVPixelBufferRelease(pixelBufferOut);
  CVPixelBufferRelease(v5);
}

- (id)newJPEGDataInOrientation:(int64_t)a3 usingPixelBuffer:(__CVBuffer *)a4
{
  if (a4)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = __Block_byref_object_copy__23;
    id v16 = __Block_byref_object_dispose__23;
    id v17 = 0;
    int v7 = [(CAMThumbnailGenerator *)self _generationQueue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __67__CAMThumbnailGenerator_newJPEGDataInOrientation_usingPixelBuffer___block_invoke;
    v11[3] = &unk_263FA55C8;
    v11[6] = a4;
    v11[7] = a3;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v7, v11);

    id v8 = (id)v13[5];
    _Block_object_dispose(&v12, 8);

    return v8;
  }
  else
  {
    id v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CAMThumbnailGenerator newJPEGDataInOrientation:usingSurface:withMetadata:]();
    }

    return 0;
  }
}

void __67__CAMThumbnailGenerator_newJPEGDataInOrientation_usingPixelBuffer___block_invoke(uint64_t a1)
{
  v16[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = (__CVBuffer *)[*(id *)(a1 + 32) _newRotatedPixelBuffer:*(void *)(a1 + 48) withOrientation:*(void *)(a1 + 56)];
  uint64_t v3 = *MEMORY[0x263F2F8D0];
  v16[0] = &unk_26BDDEDC0;
  uint64_t v4 = *MEMORY[0x263F2F8C8];
  v15[0] = v3;
  v15[1] = v4;
  uint64_t v13 = *MEMORY[0x263F2F980];
  uint64_t v14 = &unk_26BDE05C0;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  v16[1] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

  int v7 = PFFigJPEGDataFromImage();
  id v8 = 0;
  id v9 = v8;
  if (v7)
  {
    id v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __76__CAMThumbnailGenerator_newJPEGDataInOrientation_usingSurface_withMetadata___block_invoke_cold_2();
    }
  }
  else if (v8)
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    id v12 = v8;
    id v10 = *(NSObject **)(v11 + 40);
    *(void *)(v11 + 40) = v12;
  }
  else
  {
    id v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __85__CAMThumbnailGenerator_newJPEGDataOfFormat_inOrientation_usingSurface_withMetadata___block_invoke_cold_1();
    }
  }

  CVPixelBufferRelease(v2);
}

- (CGImage)newBGRAImageInOrientation:(int64_t)a3 usingPixelBuffer:(__CVBuffer *)a4
{
  if (a4)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000;
    uint64_t v15 = 0;
    int v7 = [(CAMThumbnailGenerator *)self _generationQueue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __68__CAMThumbnailGenerator_newBGRAImageInOrientation_usingPixelBuffer___block_invoke;
    v11[3] = &unk_263FA55C8;
    v11[6] = a4;
    v11[7] = a3;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v7, v11);

    id v8 = (CGImage *)v13[3];
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CAMThumbnailGenerator newBGRAImageInOrientation:usingPixelBuffer:]();
    }

    return 0;
  }
  return v8;
}

void __68__CAMThumbnailGenerator_newBGRAImageInOrientation_usingPixelBuffer___block_invoke(uint64_t a1)
{
  double Width = (double)CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 48));
  uint64_t v3 = (__CVBuffer *)objc_msgSend(*(id *)(a1 + 32), "_newThumbnailOfSize:inOrientation:withPixelFormat:usingPixelBuffer:", *(void *)(a1 + 56), 1111970369, *(void *)(a1 + 48), Width, (double)CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 48)));
  if (CVPixelBufferGetIOSurface(v3))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = UICreateCGImageFromIOSurface();
  }
  else
  {
    uint64_t v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __73__CAMThumbnailGenerator_newBGRAImageOfFormat_inOrientation_usingSurface___block_invoke_cold_1();
    }
  }
  CVPixelBufferRelease(v3);
}

- (CGImage)newBGRAImageOfFormat:(int64_t)a3 inOrientation:(int64_t)a4 usingPixelBuffer:(__CVBuffer *)a5
{
  if (a5)
  {
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2020000000;
    uint64_t v17 = 0;
    id v9 = [(CAMThumbnailGenerator *)self _generationQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __77__CAMThumbnailGenerator_newBGRAImageOfFormat_inOrientation_usingPixelBuffer___block_invoke;
    block[3] = &unk_263FA55A0;
    block[6] = a3;
    block[7] = a4;
    block[8] = a5;
    block[4] = self;
    void block[5] = &v14;
    dispatch_sync(v9, block);

    id v10 = (CGImage *)v15[3];
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    uint64_t v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CAMThumbnailGenerator newBGRAImageInOrientation:usingPixelBuffer:]();
    }

    return 0;
  }
  return v10;
}

void __77__CAMThumbnailGenerator_newBGRAImageOfFormat_inOrientation_usingPixelBuffer___block_invoke(uint64_t a1)
{
  uint64_t v2 = (__CVBuffer *)[*(id *)(a1 + 32) _newThumbnailOfFormat:*(void *)(a1 + 48) inOrientation:*(void *)(a1 + 56) withPixelFormat:1111970369 usingPixelBuffer:*(void *)(a1 + 64)];
  if (CVPixelBufferGetIOSurface(v2))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = UICreateCGImageFromIOSurface();
  }
  else
  {
    uint64_t v3 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __73__CAMThumbnailGenerator_newBGRAImageOfFormat_inOrientation_usingSurface___block_invoke_cold_1();
    }
  }
  CVPixelBufferRelease(v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__generationQueueRotationSessionsMapTable, 0);
  objc_storeStrong((id *)&self->__generationQueue, 0);
}

void __29__CAMThumbnailGenerator_init__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_2099F8000, v0, v1, "Failed to create pixel transfer session for thumbnail generation (%ld)", v2, v3, v4, v5, v6);
}

- (void)_newThumbnailOfSize:(double)a3 inOrientation:withPixelFormat:usingPixelBuffer:.cold.1(NSObject *a1, double a2, double a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v4 = NSStringFromCGSize(*(CGSize *)&a2);
  int v5 = 138543362;
  uint8_t v6 = v4;
  _os_log_error_impl(&dword_2099F8000, a1, OS_LOG_TYPE_ERROR, "Attempting to generate a thumbnail of size %{public}@ with an invalid pixel buffer.", (uint8_t *)&v5, 0xCu);
}

- (void)_newRotatedPixelBuffer:withOrientation:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2099F8000, v0, v1, "Attempting to rotate an invalid pixel buffer.", v2, v3, v4, v5, v6);
}

- (void)_newRotatedPixelBuffer:(os_log_t)log withOrientation:.cold.2(int a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 136315650;
  uint64_t v4 = "-[CAMThumbnailGenerator _newRotatedPixelBuffer:withOrientation:]";
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  __int16 v7 = 2048;
  uint64_t v8 = a1;
  _os_log_error_impl(&dword_2099F8000, log, OS_LOG_TYPE_ERROR, "<%s> Failed to generate a thumbnail in orientation %ld using a pixel buffer (%ld)", (uint8_t *)&v3, 0x20u);
}

- (void)newJPEGDataOfFormat:(uint64_t)a3 inOrientation:(uint64_t)a4 usingSurface:(uint64_t)a5 withMetadata:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __85__CAMThumbnailGenerator_newJPEGDataOfFormat_inOrientation_usingSurface_withMetadata___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2099F8000, v0, v1, "Failed to generate thumbnail with EXIF data! Generated thumbnails may not match original image!", v2, v3, v4, v5, v6);
}

void __85__CAMThumbnailGenerator_newJPEGDataOfFormat_inOrientation_usingSurface_withMetadata___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_2099F8000, v0, v1, "Failed to encode YUV preview surface to JPEG during local persistence (%ld)", v2, v3, v4, v5, v6);
}

- (void)newJPEGDataInOrientation:usingSurface:withMetadata:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2099F8000, v0, v1, "Attempting to generate JPEG thumbnail data with an invalid surface.", v2, v3, v4, v5, v6);
}

void __76__CAMThumbnailGenerator_newJPEGDataInOrientation_usingSurface_withMetadata___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_2099F8000, v0, v1, "Failed to encode surface to JPEG during local persistence (%ld)", v2, v3, v4, v5, v6);
}

- (void)newBGRAImageOfFormat:(uint64_t)a3 inOrientation:(uint64_t)a4 usingSurface:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __73__CAMThumbnailGenerator_newBGRAImageOfFormat_inOrientation_usingSurface___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2099F8000, v0, v1, "Failed to encode YUV preview surface to BGRA.", v2, v3, v4, v5, v6);
}

- (void)newBGRAImageInOrientation:usingSurface:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2099F8000, v0, v1, "Attempting to generate BGRA thumbnail data with an invalid surface.", v2, v3, v4, v5, v6);
}

- (void)newBGRAImageInOrientation:usingPixelBuffer:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2099F8000, v0, v1, "Attempting to generate BGRA thumbnail data with an invalid pixelBuffer.", v2, v3, v4, v5, v6);
}

@end