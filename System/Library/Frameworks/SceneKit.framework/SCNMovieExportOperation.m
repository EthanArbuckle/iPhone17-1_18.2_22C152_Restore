@interface SCNMovieExportOperation
- (CGImage)_copySnapshot:(CGSize)a3;
- (SCNMovieExportOperation)initWithRenderer:(id)a3 size:(CGSize)a4 attributes:(id)a5 outputURL:(id)a6;
- (void)_finishedExport;
- (void)appendImage:(CGImage *)a3 withPresentationTime:(id *)a4 usingAdaptor:(id)a5;
- (void)dealloc;
- (void)main;
- (void)renderAndAppendWithPresentationTime:(id *)a3 usingAdaptor:(id)a4 metalTextureCache:(__CVMetalTextureCache *)a5 cvQueue:(id)a6 completionBlock:(id)a7;
@end

@implementation SCNMovieExportOperation

- (SCNMovieExportOperation)initWithRenderer:(id)a3 size:(CGSize)a4 attributes:(id)a5 outputURL:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  v33.receiver = self;
  v33.super_class = (Class)SCNMovieExportOperation;
  v11 = [(SCNMovieExportOperation *)&v33 init];
  if (v11)
  {
    id v12 = (id)[a5 mutableCopy];
    if (!v12) {
      id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    [v12 removeObjectForKey:@"kExportPointOfViewAttribute"];
    objc_msgSend((id)objc_msgSend(v12, "valueForKey:", @"rate"), "floatValue");
    v11->_rate = v13;
    [v12 removeObjectForKey:@"rate"];
    if (v11->_rate == 0.0) {
      v11->_rate = 0.033333;
    }
    int v14 = objc_msgSend((id)objc_msgSend(v12, "valueForKey:", @"SCNExportMovieFrameRate"), "intValue");
    [v12 removeObjectForKey:@"SCNExportMovieFrameRate"];
    if (v14) {
      v11->_rate = 1.0 / (float)v14;
    }
    v11->_mirrored = objc_msgSend((id)objc_msgSend(v12, "valueForKey:", @"SCNExportMovieMirrored"), "BOOLValue");
    [v12 removeObjectForKey:@"SCNExportMovieMirrored"];
    objc_msgSend((id)objc_msgSend(v12, "valueForKey:", @"SCNExportMovieSupersamplingFactor"), "floatValue");
    v11->_supersampling = v15;
    [v12 removeObjectForKey:@"SCNExportMovieSupersamplingFactor"];
    if (v11->_supersampling == 0.0) {
      v11->_supersampling = 1.0;
    }
    [v12 removeObjectForKey:@"QTAddImageCodecType"];
    [v12 removeObjectForKey:@"QTMovieRateAttribute"];
    uint64_t v16 = *MEMORY[0x263EFA338];
    if (![v12 objectForKey:*MEMORY[0x263EFA338]]) {
      [v12 setValue:*MEMORY[0x263EFA330] forKey:v16];
    }
    uint64_t v17 = [NSNumber numberWithInt:(int)width];
    [v12 setValue:v17 forKey:*MEMORY[0x263EFA458]];
    uint64_t v18 = [NSNumber numberWithInt:(int)height];
    [v12 setValue:v18 forKey:*MEMORY[0x263EFA3E8]];
    id v19 = objc_alloc(MEMORY[0x263EFA520]);
    v11->_assetWriterInput = (AVAssetWriterInput *)[v19 initWithMediaType:*MEMORY[0x263EF9D48] outputSettings:v12];
    v20 = (void *)[MEMORY[0x263EFF9A0] dictionary];
    [(AVAssetWriterInput *)v11->_assetWriterInput setExpectsMediaDataInRealTime:0];
    uint64_t v21 = [NSNumber numberWithInt:1111970369];
    [v20 setObject:v21 forKey:*MEMORY[0x263F04180]];
    uint64_t v22 = [NSNumber numberWithInt:(int)width];
    [v20 setObject:v22 forKey:*MEMORY[0x263F04240]];
    uint64_t v23 = [NSNumber numberWithInt:(int)height];
    [v20 setObject:v23 forKey:*MEMORY[0x263F04118]];
    uint64_t v24 = [a3 device];
    v25 = (void *)MEMORY[0x263F040A0];
    if (v24) {
      v25 = (void *)MEMORY[0x263F04158];
    }
    [v20 setObject:MEMORY[0x263EFFA88] forKey:*v25];
    v11->_avAdaptor = (AVAssetWriterInputPixelBufferAdaptor *)[objc_alloc(MEMORY[0x263EFA530]) initWithAssetWriterInput:v11->_assetWriterInput sourcePixelBufferAttributes:v20];
    uint64_t v32 = 0;
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "removeItemAtURL:error:", a6, 0);
    id v26 = objc_alloc(MEMORY[0x263EFA518]);
    v27 = (AVAssetWriter *)[v26 initWithURL:a6 fileType:*MEMORY[0x263EF9898] error:&v32];
    v11->_assetWriter = v27;
    if ([(AVAssetWriter *)v27 status] == AVAssetWriterStatusFailed)
    {
      v28 = scn_default_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        -[SCNMovieExportOperation initWithRenderer:size:attributes:outputURL:]((uint64_t)a6, &v32, v28);
      }

      return 0;
    }
    else
    {
      [(AVAssetWriter *)v11->_assetWriter addInput:v11->_assetWriterInput];
      [(AVAssetWriter *)v11->_assetWriter startWriting];
      assetWriter = v11->_assetWriter;
      v31[0] = 0;
      v31[1] = 0x100000001;
      v31[2] = 0;
      [(AVAssetWriter *)assetWriter startSessionAtSourceTime:v31];
      [(_SCNExportOperation *)v11 setRenderer:a3];
      -[_SCNExportOperation setSize:](v11, "setSize:", width, height);
      [(_SCNExportOperation *)v11 setAttributes:v12];
      objc_msgSend((id)objc_msgSend(a3, "scene"), "startTime");
      -[_SCNExportOperation setStartTime:](v11, "setStartTime:");
      objc_msgSend((id)objc_msgSend(a3, "scene"), "endTime");
      -[_SCNExportOperation setEndTime:](v11, "setEndTime:");
      [(_SCNExportOperation *)v11 setOutputURL:a6];
      -[_SCNExportOperation setPointOfView:](v11, "setPointOfView:", [a5 objectForKey:@"kExportPointOfViewAttribute"]);
    }
  }
  return v11;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNMovieExportOperation;
  [(_SCNExportOperation *)&v3 dealloc];
}

- (CGImage)_copySnapshot:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [(_SCNExportOperation *)self renderer];
  double systemTime = self->super._systemTime;
  if (systemTime == 0.0) {
    CFTimeInterval v8 = CACurrentMediaTime();
  }
  else {
    CFTimeInterval v8 = systemTime + self->_rate;
  }
  self->super._double systemTime = v8;
  v9 = -[UIImage CGImage](-[SCNRenderer snapshotAtTime:withSize:antialiasingMode:](v6, "snapshotAtTime:withSize:antialiasingMode:", [(_SCNExportOperation *)self antialiasingMode], v8, width, height), "CGImage");

  return CGImageRetain(v9);
}

- (void)_finishedExport
{
  if (![(_SCNExportOperation *)self error]) {
    [(_SCNExportOperation *)self setSucceded:1];
  }
  id v3 = [(_SCNExportOperation *)self delegate];
  [(_SCNExportOperation *)self didEndSelector];
  if (objc_opt_respondsToSelector())
  {
    v4 = [(_SCNExportOperation *)self didEndSelector];
    v5 = [(_SCNExportOperation *)self userInfo];
    objc_msgSend(v3, v4, self, v5);
  }
}

- (void)appendImage:(CGImage *)a3 withPresentationTime:(id *)a4 usingAdaptor:(id)a5
{
  CVPixelBufferRef pixelBufferOut = 0;
  uint64_t v10 = [a5 pixelBufferPool];
  if (v10)
  {
    v11 = (__CVPixelBufferPool *)v10;
    unint64_t Width = CGImageGetWidth(a3);
    unint64_t Height = CGImageGetHeight(a3);
    if (CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x263EFFB08], v11, &pixelBufferOut)) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SCNExport.m", 391, @"SceneKit: Couldn't create pixel buffer");
    }
    ColorSpace = CGImageGetColorSpace(a3);
    CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
    BaseAddress = CVPixelBufferGetBaseAddress(pixelBufferOut);
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
    uint64_t v17 = CGBitmapContextCreate(BaseAddress, Width, Height, 8uLL, BytesPerRow, ColorSpace, 0x2006u);
    v23.origin.x = 0.0;
    v23.origin.y = 0.0;
    v23.size.double width = (double)Width;
    v23.size.double height = (double)Height;
    CGContextClearRect(v17, v23);
    v24.origin.x = 0.0;
    v24.origin.y = 0.0;
    v24.size.double width = (double)Width;
    v24.size.double height = (double)Height;
    CGContextDrawImage(v17, v24, a3);
    CGContextFlush(v17);
    CFRelease(v17);
    CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
    long long v20 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    if (([a5 appendPixelBuffer:pixelBufferOut withPresentationTime:&v20] & 1) == 0)
    {
      uint64_t v18 = scn_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[SCNMovieExportOperation appendImage:withPresentationTime:usingAdaptor:]();
      }
    }
    CFRelease(pixelBufferOut);
  }
  else
  {
    id v19 = scn_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[SCNMovieExportOperation appendImage:withPresentationTime:usingAdaptor:]();
    }
  }
}

- (void)renderAndAppendWithPresentationTime:(id *)a3 usingAdaptor:(id)a4 metalTextureCache:(__CVMetalTextureCache *)a5 cvQueue:(id)a6 completionBlock:(id)a7
{
  CVPixelBufferRef pixelBufferOut = 0;
  int v14 = (__CVPixelBufferPool *)[a4 pixelBufferPool];
  if (v14)
  {
    CFAllocatorRef v15 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    if (CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x263EFFB08], v14, &pixelBufferOut)) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SCNExport.m", 431, @"SceneKit: Couldn't create pixel buffer");
    }
    CVMetalTextureRef textureOut = 0;
    if (C3DLinearRenderingIsEnabled()) {
      MTLPixelFormat v16 = MTLPixelFormatBGRA8Unorm_sRGB;
    }
    else {
      MTLPixelFormat v16 = MTLPixelFormatBGRA8Unorm;
    }
    unint64_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(pixelBufferOut, 0);
    unint64_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(pixelBufferOut, 0);
    CVMetalTextureCacheCreateTextureFromImage(v15, a5, pixelBufferOut, 0, v16, WidthOfPlane, HeightOfPlane, 0, &textureOut);
    double systemTime = self->super._systemTime;
    id v32 = a7;
    if (systemTime == 0.0) {
      CFTimeInterval v20 = CACurrentMediaTime();
    }
    else {
      CFTimeInterval v20 = systemTime + self->_rate;
    }
    self->super._double systemTime = v20;
    uint64_t v22 = (void *)[MEMORY[0x263F129A0] renderPassDescriptor];
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v22, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setLoadAction:", 2);
    id v23 = [(SCNMaterialProperty *)[(SCNScene *)[(SCNRenderer *)[(_SCNExportOperation *)self renderer] scene] background] contents];
    objc_opt_class();
    double v24 = 1.0;
    double v25 = 1.0;
    double v26 = 1.0;
    double v27 = 1.0;
    if (objc_opt_isKindOfClass())
    {
      double v39 = 0.0;
      double v37 = 0.0;
      double v38 = 0.0;
      double v36 = 0.0;
      [v23 getRed:&v39 green:&v38 blue:&v37 alpha:&v36];
      double v24 = v39;
      double v26 = v37;
      double v25 = v38;
      double v27 = v36;
    }
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v22, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setClearColor:", v24, v25, v26, v27);
    v28 = (void *)[MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:v16 width:WidthOfPlane height:HeightOfPlane mipmapped:0];
    if (SCNMTLDeviceSupportsMemorylessStorage([(SCNRenderer *)[(_SCNExportOperation *)self renderer] device])) {
      uint64_t v29 = 3;
    }
    else {
      uint64_t v29 = 2;
    }
    [v28 setStorageMode:v29];
    [v28 setUsage:5];
    if ([(_SCNExportOperation *)self antialiasingMode])
    {
      objc_msgSend(v28, "setSampleCount:", 1 << -[_SCNExportOperation antialiasingMode](self, "antialiasingMode"));
      [v28 setTextureType:4];
      v30 = (void *)[(MTLDevice *)[(SCNRenderer *)[(_SCNExportOperation *)self renderer] device] newTextureWithDescriptor:v28];
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v22, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setTexture:", v30);
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v22, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setResolveTexture:", CVMetalTextureGetTexture(textureOut));
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v22, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setStoreAction:", 2);
    }
    else
    {
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v22, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setTexture:", CVMetalTextureGetTexture(textureOut));
    }
    v31 = (void *)[(MTLCommandQueue *)[(SCNRenderer *)[(_SCNExportOperation *)self renderer] commandQueue] commandBuffer];
    -[SCNRenderer renderAtTime:viewport:commandBuffer:passDescriptor:]([(_SCNExportOperation *)self renderer], "renderAtTime:viewport:commandBuffer:passDescriptor:", v31, v22, self->super._systemTime, 0.0, 0.0, (double)WidthOfPlane, (double)HeightOfPlane);
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __118__SCNMovieExportOperation_renderAndAppendWithPresentationTime_usingAdaptor_metalTextureCache_cvQueue_completionBlock___block_invoke;
    v33[3] = &unk_26400A198;
    v33[4] = a6;
    v33[5] = self;
    long long v34 = *(_OWORD *)&a3->var0;
    int64_t var3 = a3->var3;
    v33[8] = pixelBufferOut;
    v33[9] = textureOut;
    v33[10] = a5;
    v33[6] = a4;
    v33[7] = v32;
    [v31 addCompletedHandler:v33];
    [v31 commit];
  }
  else
  {
    uint64_t v21 = scn_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[SCNMovieExportOperation appendImage:withPresentationTime:usingAdaptor:]();
    }
  }
}

__n128 __118__SCNMovieExportOperation_renderAndAppendWithPresentationTime_usingAdaptor_metalTextureCache_cvQueue_completionBlock___block_invoke(uint64_t a1)
{
  v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __118__SCNMovieExportOperation_renderAndAppendWithPresentationTime_usingAdaptor_metalTextureCache_cvQueue_completionBlock___block_invoke_2;
  block[3] = &unk_26400A170;
  long long v2 = *(_OWORD *)(a1 + 40);
  long long v3 = *(_OWORD *)(a1 + 88);
  uint64_t v12 = *(void *)(a1 + 104);
  long long v4 = *(_OWORD *)(a1 + 72);
  long long v11 = v3;
  long long v10 = v4;
  long long v5 = *(_OWORD *)(a1 + 56);
  long long v8 = v2;
  long long v9 = v5;
  dispatch_async(v1, block);
  return result;
}

uint64_t __118__SCNMovieExportOperation_renderAndAppendWithPresentationTime_usingAdaptor_metalTextureCache_cvQueue_completionBlock___block_invoke_2(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 384) isReadyForMoreMediaData] & 1) == 0)
  {
    do
      usleep(0x3E8u);
    while (![*(id *)(*(void *)(a1 + 32) + 384) isReadyForMoreMediaData]);
  }
  long long v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 56);
  long long v6 = *(_OWORD *)(a1 + 80);
  uint64_t v7 = *(void *)(a1 + 96);
  if (([v2 appendPixelBuffer:v3 withPresentationTime:&v6] & 1) == 0)
  {
    long long v4 = scn_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[SCNMovieExportOperation appendImage:withPresentationTime:usingAdaptor:]();
    }
  }
  CFRelease(*(CFTypeRef *)(a1 + 56));
  CFRelease(*(CFTypeRef *)(a1 + 64));
  CVMetalTextureCacheFlush(*(CVMetalTextureCacheRef *)(a1 + 72), 0);
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)main
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: error while exporting movie: %@", buf, 0xCu);
}

void __31__SCNMovieExportOperation_main__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isCancelled]) {
    [*(id *)(a1 + 40) setCanceled:1];
  }
  if (([*(id *)(a1 + 40) canceled] & 1) != 0
    || *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) + *(double *)(a1 + 88) * -0.5 > *(double *)(a1 + 96))
  {
    if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __31__SCNMovieExportOperation_main__block_invoke_3;
      v17[3] = &unk_264005FA0;
      long long v2 = *(NSObject **)(a1 + 48);
      uint64_t v3 = *(void *)(a1 + 56);
      v17[4] = *(void *)(a1 + 40);
      v17[5] = v3;
      dispatch_async(v2, v17);
    }
  }
  else
  {
    long long v4 = (void *)MEMORY[0x210535ED0]();
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "renderer"), "setSceneTime:", *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24));
    if (*(unsigned char *)(a1 + 120))
    {
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      uint64_t v5 = 1000 * *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      int v8 = (int)(float)(1000.0 / *(float *)(v6 + 408));
      uint64_t v9 = *(void *)(v6 + 392);
      uint64_t v10 = *(void *)(a1 + 104);
      uint64_t v21 = 0;
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __31__SCNMovieExportOperation_main__block_invoke_2;
      v22[3] = &unk_264004AF0;
      v22[4] = *(void *)(a1 + 72);
      uint64_t v18 = v5;
      int v19 = v8;
      int v20 = 1;
      [(id)v6 renderAndAppendWithPresentationTime:&v18 usingAdaptor:v9 metalTextureCache:v10 cvQueue:v7 completionBlock:v22];
    }
    else
    {
      long long v11 = *(void **)(a1 + 40);
      [v11 size];
      uint64_t v12 = objc_msgSend(v11, "_copySnapshot:");
      if (v12)
      {
        float v13 = (CGImage *)v12;
        if (([*(id *)(*(void *)(a1 + 40) + 384) isReadyForMoreMediaData] & 1) == 0)
        {
          do
            usleep(0x3E8u);
          while (![*(id *)(*(void *)(a1 + 40) + 384) isReadyForMoreMediaData]);
        }
        uint64_t v14 = *(void *)(a1 + 40);
        float v15 = 1000.0 / *(float *)(v14 + 408);
        uint64_t v16 = *(void *)(v14 + 392);
        uint64_t v18 = 1000 * *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
        int v19 = (int)v15;
        int v20 = 1;
        uint64_t v21 = 0;
        [(id)v14 appendImage:v13 withPresentationTime:&v18 usingAdaptor:v16];
        CGImageRelease(v13);
      }
    }
    *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(double *)(a1 + 88)
                                                                + *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                            + 24);
    ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    [*(id *)(a1 + 40) setProgress:(*(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) - *(double *)(a1 + 112))/ (*(double *)(a1 + 96) - *(double *)(a1 + 112))];
    objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);
  }
}

uint64_t __31__SCNMovieExportOperation_main__block_invoke_2(uint64_t result)
{
  return result;
}

intptr_t __31__SCNMovieExportOperation_main__block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 384) markAsFinished];
  long long v2 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v2);
}

intptr_t __31__SCNMovieExportOperation_main__block_invoke_4(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)initWithRenderer:(os_log_t)log size:attributes:outputURL:.cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a2;
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: AVAssetWriter can't create a movie at %@ (error:%@)", (uint8_t *)&v4, 0x16u);
}

- (void)appendImage:withPresentationTime:usingAdaptor:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: appendImage: failed to get a pixelBuffer from CVPixelBufferPoolRef", v2, v3, v4, v5, v6);
}

- (void)appendImage:withPresentationTime:usingAdaptor:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: append pixel buffer failed", v2, v3, v4, v5, v6);
}

@end