@interface CAMTimelapseMovieWriter
- (AVAssetWriter)_writer;
- (AVAssetWriterInput)_videoInput;
- (AVAssetWriterInputPixelBufferAdaptor)_pixelBufferAdaptor;
- (BOOL)_appendPixelBuffer:(__CVBuffer *)a3;
- (BOOL)_startWritingWithOutputPath:(id)a3 width:(int64_t)a4 height:(int64_t)a5 videoFormatDescription:(opaqueCMFormatDescription *)a6 transform:(CGAffineTransform *)a7 framesPerSecond:(int64_t)a8 frameCount:(int64_t)a9 preferHEVC:(BOOL)a10 videoMetadata:(id)a11;
- (BOOL)isSuspended;
- (CAMTimelapseMovieWriter)init;
- (CGSize)_desiredOutputSizeForFrameSize:(CGSize)a3;
- (NSArray)_frameFilePaths;
- (NSMutableDictionary)_availableImageData;
- (NSMutableDictionary)_availablePixelBuffers;
- (NSMutableSet)_inFlightReadFrameIndexes;
- (NSOperationQueue)_imageDecodeQueue;
- (NSOperationQueue)_imageReadQueue;
- (OS_dispatch_queue)_movieWritingQueue;
- (OS_dispatch_queue)_synchronizationQueue;
- (id)_completion;
- (int64_t)_currentOutputFrameIndex;
- (int64_t)_framesPerSecond;
- (int64_t)_nextReadFileIndex;
- (int64_t)_nextWriteFileIndex;
- (int64_t)_residentImageDataCount;
- (int64_t)_residentPixelBufferCount;
- (void)_enqueueNextDecode;
- (void)_enqueueNextRead;
- (void)_enqueueNextWrite;
- (void)_finishMovieWithCompletionHandler:(id)a3;
- (void)_reset;
- (void)_setMetadataOnVideoTrackAssetWriterInput:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setSuspended:(BOOL)a3;
- (void)writeMovieFromImageFiles:(id)a3 visMetadataFiles:(id)a4 startDate:(id)a5 location:(id)a6 outputPath:(id)a7 transform:(CGAffineTransform *)a8 framesPerSecond:(int64_t)a9 preferHEVC:(BOOL)a10 completionHandler:(id)a11;
@end

@implementation CAMTimelapseMovieWriter

- (CAMTimelapseMovieWriter)init
{
  v12.receiver = self;
  v12.super_class = (Class)CAMTimelapseMovieWriter;
  v2 = [(CAMTimelapseMovieWriter *)&v12 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.camera.timelapse.movie.sync", 0);
    synchronizationQueue = v2->__synchronizationQueue;
    v2->__synchronizationQueue = (OS_dispatch_queue *)v3;

    v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    imageReadQueue = v2->__imageReadQueue;
    v2->__imageReadQueue = v5;

    [(NSOperationQueue *)v2->__imageReadQueue setName:@"com.apple.camera.timelapse.movie.image.read"];
    [(NSOperationQueue *)v2->__imageReadQueue setMaxConcurrentOperationCount:1];
    v7 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    imageDecodeQueue = v2->__imageDecodeQueue;
    v2->__imageDecodeQueue = v7;

    [(NSOperationQueue *)v2->__imageDecodeQueue setName:@"com.apple.camera.timelapse.movie.image.decode"];
    [(NSOperationQueue *)v2->__imageDecodeQueue setMaxConcurrentOperationCount:1];
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.camera.timelapse.movie.write", 0);
    movieWritingQueue = v2->__movieWritingQueue;
    v2->__movieWritingQueue = (OS_dispatch_queue *)v9;
  }
  return v2;
}

- (void)_reset
{
  frameFilePaths = self->__frameFilePaths;
  self->__frameFilePaths = 0;

  *(_OWORD *)&self->__nextReadFileIndex = 0u;
  availableImageData = self->__availableImageData;
  *(_OWORD *)&self->__residentPixelBufferCount = 0u;

  availablePixelBuffers = self->__availablePixelBuffers;
  self->__availablePixelBuffers = 0;

  inFlightReadFrameIndexes = self->__inFlightReadFrameIndexes;
  self->__inFlightReadFrameIndexes = 0;

  writer = self->__writer;
  self->__writer = 0;

  [(AVAssetWriterInput *)self->__videoInput removeObserver:self forKeyPath:@"readyForMoreMediaData"];
  videoInput = self->__videoInput;
  self->__videoInput = 0;

  pixelBufferAdaptor = self->__pixelBufferAdaptor;
  self->__pixelBufferAdaptor = 0;

  id completion = self->__completion;
  *(_OWORD *)&self->__framesPerSecond = 0u;
  *(_OWORD *)&self->__currentOutputFrameIndex = 0u;
}

- (void)setSuspended:(BOOL)a3
{
  if (self->_suspended != a3)
  {
    self->_suspended = a3;
    movieWritingQueue = self->__movieWritingQueue;
    if (movieWritingQueue)
    {
      if (a3) {
        dispatch_suspend(movieWritingQueue);
      }
      else {
        dispatch_resume(movieWritingQueue);
      }
    }
  }
}

- (void)writeMovieFromImageFiles:(id)a3 visMetadataFiles:(id)a4 startDate:(id)a5 location:(id)a6 outputPath:(id)a7 transform:(CGAffineTransform *)a8 framesPerSecond:(int64_t)a9 preferHEVC:(BOOL)a10 completionHandler:(id)a11
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  v20 = a11;
  [(CAMTimelapseMovieWriter *)self _reset];
  if ([v16 count])
  {
    v56 = v16;
    id v57 = v19;
    v21 = [v16 objectAtIndex:0];
    id v22 = +[CAMTimelapseJPEGReader newDataFromFilePath:v21];
    v23 = +[CAMTimelapseJPEGReader createPixelBufferFromData:v22 applyTransform:1 maxPixelSize:0 useBGRA:0];
    int64_t Width = CVPixelBufferGetWidth(v23);
    int64_t Height = CVPixelBufferGetHeight(v23);
    if (!v18)
    {
      id v18 = +[CAMNebulaUtilities locationFromJPEGAtPath:v21];
    }
    BOOL v25 = a10;
    id v58 = v17;
    v55 = +[CAMPersistenceController clientVideoMetadataForLocation:v18 withCreationDate:v17];
    CMVideoFormatDescriptionRef formatDescriptionOut = 0;
    OSStatus v26 = CMVideoFormatDescriptionCreateForImageBuffer(0, v23, &formatDescriptionOut);
    if (v26)
    {
      int v27 = v26;
      v28 = v21;
      v29 = v20;
      id v30 = v18;
      v31 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[CAMTimelapseMovieWriter writeMovieFromImageFiles:visMetadataFiles:startDate:location:outputPath:transform:framesPerSecond:preferHEVC:completionHandler:](v27, v31);
      }

      id v18 = v30;
      v20 = v29;
      v21 = v28;
      BOOL v25 = a10;
    }
    CVPixelBufferRelease(v23);

    id v16 = v56;
    uint64_t v32 = [v56 count];
    -[CAMTimelapseMovieWriter _desiredOutputSizeForFrameSize:](self, "_desiredOutputSizeForFrameSize:", (double)Width, (double)Height);
    uint64_t v33 = MEMORY[0x263F000D0];
    long long v34 = *MEMORY[0x263F000D0];
    long long v35 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&a8->a = *MEMORY[0x263F000D0];
    *(_OWORD *)&a8->c = v35;
    long long v36 = *(_OWORD *)(v33 + 32);
    *(_OWORD *)&a8->tx = v36;
    long long v59 = v34;
    long long v60 = v35;
    long long v61 = v36;
    LOBYTE(v53) = v25;
    id v19 = v57;
    BOOL v39 = [(CAMTimelapseMovieWriter *)self _startWritingWithOutputPath:v57 width:(uint64_t)v37 height:(uint64_t)v38 videoFormatDescription:formatDescriptionOut transform:&v59 framesPerSecond:a9 frameCount:v32 preferHEVC:v53 videoMetadata:v55];
    if (formatDescriptionOut) {
      CFRelease(formatDescriptionOut);
    }
    id v17 = v58;
    if (v39)
    {
      v40 = (NSArray *)[v56 copy];
      frameFilePaths = self->__frameFilePaths;
      self->__frameFilePaths = v40;

      v42 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      availableImageData = self->__availableImageData;
      self->__availableImageData = v42;

      v44 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      availablePixelBuffers = self->__availablePixelBuffers;
      self->__availablePixelBuffers = v44;

      v46 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
      inFlightReadFrameIndexes = self->__inFlightReadFrameIndexes;
      self->__inFlightReadFrameIndexes = v46;

      self->__framesPerSecond = a9;
      v48 = (void *)[v20 copy];
      id completion = self->__completion;
      self->__id completion = v48;

      [(CAMTimelapseMovieWriter *)self _enqueueNextRead];
    }
    else
    {
      v51 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
        -[CAMTimelapseMovieWriter writeMovieFromImageFiles:visMetadataFiles:startDate:location:outputPath:transform:framesPerSecond:preferHEVC:completionHandler:](v51);
      }

      if (v20)
      {
        v52 = (void (*)(void *, void, long long *, void))v20[2];
        long long v59 = *MEMORY[0x263F010E0];
        *(void *)&long long v60 = *(void *)(MEMORY[0x263F010E0] + 16);
        v52(v20, 0, &v59, 0);
      }
    }
  }
  else if (v20)
  {
    v50 = (void (*)(void *, void, long long *, void))v20[2];
    long long v59 = *MEMORY[0x263F010E0];
    *(void *)&long long v60 = *(void *)(MEMORY[0x263F010E0] + 16);
    v50(v20, 0, &v59, 0);
  }
}

- (void)_enqueueNextRead
{
  imageReadQueue = self->__imageReadQueue;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __43__CAMTimelapseMovieWriter__enqueueNextRead__block_invoke;
  v3[3] = &unk_263FA0208;
  v3[4] = self;
  [(NSOperationQueue *)imageReadQueue addOperationWithBlock:v3];
}

void __43__CAMTimelapseMovieWriter__enqueueNextRead__block_invoke(uint64_t a1)
{
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__26;
  v21 = __Block_byref_object_dispose__26;
  id v22 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v2 = *(void *)(a1 + 32);
  dispatch_queue_t v3 = *(NSObject **)(v2 + 72);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__CAMTimelapseMovieWriter__enqueueNextRead__block_invoke_14;
  block[3] = &unk_263FA2C30;
  block[4] = v2;
  block[5] = &v17;
  block[6] = v16;
  dispatch_sync(v3, block);
  if (v18[5])
  {
    id v4 = +[CAMTimelapseJPEGReader newDataFromFilePath:](CAMTimelapseJPEGReader, "newDataFromFilePath:");
    v5 = *(NSObject **)(*(void *)(a1 + 32) + 72);
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    v10 = __43__CAMTimelapseMovieWriter__enqueueNextRead__block_invoke_3;
    v11 = &unk_263FA4F18;
    id v6 = v4;
    uint64_t v7 = *(void *)(a1 + 32);
    id v12 = v6;
    uint64_t v13 = v7;
    v14 = v16;
    dispatch_sync(v5, &v8);
    objc_msgSend(*(id *)(a1 + 32), "_enqueueNextDecode", v8, v9, v10, v11);
    [*(id *)(a1 + 32) _enqueueNextRead];
  }
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v17, 8);
}

void __43__CAMTimelapseMovieWriter__enqueueNextRead__block_invoke_14(void *a1)
{
  uint64_t v1 = a1[4];
  if (*(uint64_t *)(v1 + 32) > 1) {
    return;
  }
  unint64_t v3 = *(void *)(v1 + 24);
  if (v3 >= [*(id *)(v1 + 16) count]) {
    return;
  }
  id v15 = [*(id *)(a1[4] + 64) allObjects];
  id v4 = [v15 sortedArrayUsingComparator:&__block_literal_global_50];
  v5 = [v4 lastObject];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 integerValue];
    uint64_t v8 = a1[4];
    uint64_t v9 = *(void *)(v8 + 24);
    if (v9 >= v7 + 2) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v8 = a1[4];
    uint64_t v9 = *(void *)(v8 + 24);
  }
  uint64_t v10 = [*(id *)(v8 + 16) objectAtIndex:v9];
  uint64_t v11 = *(void *)(a1[5] + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  *(void *)(*(void *)(a1[6] + 8) + 24) = *(void *)(a1[4] + 24);
  uint64_t v13 = *(void **)(a1[4] + 64);
  v14 = [NSNumber numberWithInteger:*(void *)(*(void *)(a1[6] + 8) + 24)];
  [v13 addObject:v14];

  ++*(void *)(a1[4] + 24);
  ++*(void *)(a1[4] + 32);
LABEL_9:
}

uint64_t __43__CAMTimelapseMovieWriter__enqueueNextRead__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

void __43__CAMTimelapseMovieWriter__enqueueNextRead__block_invoke_3(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    id v3 = [MEMORY[0x263EFF9D0] null];
  }
  id v9 = v3;
  id v4 = *(void **)(a1[5] + 48);
  v5 = [NSNumber numberWithInteger:*(void *)(*(void *)(a1[6] + 8) + 24)];
  [v4 setObject:v9 forKey:v5];

  uint64_t v6 = a1[6];
  uint64_t v7 = *(void **)(a1[5] + 64);
  uint64_t v8 = [NSNumber numberWithInteger:*(void *)(*(void *)(v6 + 8) + 24)];
  [v7 removeObject:v8];
}

- (void)_enqueueNextDecode
{
  imageDecodeQueue = self->__imageDecodeQueue;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __45__CAMTimelapseMovieWriter__enqueueNextDecode__block_invoke;
  v3[3] = &unk_263FA0208;
  v3[4] = self;
  [(NSOperationQueue *)imageDecodeQueue addOperationWithBlock:v3];
}

void __45__CAMTimelapseMovieWriter__enqueueNextDecode__block_invoke(uint64_t a1)
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__26;
  id v18 = __Block_byref_object_dispose__26;
  id v19 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 72);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__CAMTimelapseMovieWriter__enqueueNextDecode__block_invoke_2;
  block[3] = &unk_263FA2C30;
  block[4] = v2;
  block[5] = &v14;
  block[6] = v13;
  dispatch_sync(v3, block);
  id v4 = (void *)v15[5];
  if (v4)
  {
    v5 = [MEMORY[0x263EFF9D0] null];

    if (v4 == v5)
    {
      uint64_t v7 = 0;
    }
    else
    {
      id v6 = (id)v15[5];
      uint64_t v7 = +[CAMTimelapseJPEGReader createPixelBufferFromData:v6 applyTransform:1 maxPixelSize:0 useBGRA:0];
    }
    uint64_t v8 = (void *)v15[5];
    v15[5] = 0;

    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(NSObject **)(v9 + 72);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __45__CAMTimelapseMovieWriter__enqueueNextDecode__block_invoke_4;
    v11[3] = &unk_263FA51E8;
    v11[4] = v9;
    v11[5] = v13;
    v11[6] = v7;
    dispatch_sync(v10, v11);
    [*(id *)(a1 + 32) _enqueueNextWrite];
    [*(id *)(a1 + 32) _enqueueNextRead];
    [*(id *)(a1 + 32) _enqueueNextDecode];
  }
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v14, 8);
}

void __45__CAMTimelapseMovieWriter__enqueueNextDecode__block_invoke_2(void *a1)
{
  uint64_t v1 = a1[4];
  if (*(uint64_t *)(v1 + 40) <= 1)
  {
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x3032000000;
    uint64_t v11 = __Block_byref_object_copy__26;
    id v12 = __Block_byref_object_dispose__26;
    id v13 = 0;
    id v3 = *(void **)(v1 + 48);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __45__CAMTimelapseMovieWriter__enqueueNextDecode__block_invoke_3;
    v7[3] = &unk_263FA6060;
    v7[4] = &v8;
    [v3 enumerateKeysAndObjectsUsingBlock:v7];
    if (v9[5])
    {
      uint64_t v4 = objc_msgSend(*(id *)(a1[4] + 48), "objectForKey:");
      uint64_t v5 = *(void *)(a1[5] + 8);
      id v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;

      *(void *)(*(void *)(a1[6] + 8) + 24) = [(id)v9[5] integerValue];
      [*(id *)(a1[4] + 48) removeObjectForKey:v9[5]];
      ++*(void *)(a1[4] + 40);
    }
    _Block_object_dispose(&v8, 8);
  }
}

void __45__CAMTimelapseMovieWriter__enqueueNextDecode__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(void *)(v7 + 40))
  {
    if (objc_msgSend(v8, "compare:") != -1) {
      goto LABEL_5;
    }
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  objc_storeStrong((id *)(v7 + 40), a2);
LABEL_5:
}

void __45__CAMTimelapseMovieWriter__enqueueNextDecode__block_invoke_4(void *a1)
{
  uint64_t v2 = (void *)a1[6];
  id v3 = *(void **)(a1[4] + 56);
  if (!v2)
  {
    uint64_t v2 = [MEMORY[0x263EFF9D0] null];
  }
  uint64_t v4 = [NSNumber numberWithInteger:*(void *)(*(void *)(a1[5] + 8) + 24)];
  [v3 setObject:v2 forKey:v4];

  --*(void *)(a1[4] + 32);
}

- (void)_enqueueNextWrite
{
  movieWritingQueue = self->__movieWritingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__CAMTimelapseMovieWriter__enqueueNextWrite__block_invoke;
  block[3] = &unk_263FA0208;
  block[4] = self;
  dispatch_async(movieWritingQueue, block);
}

void __44__CAMTimelapseMovieWriter__enqueueNextWrite__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 112) isReadyForMoreMediaData])
  {
    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__26;
    v21 = __Block_byref_object_dispose__26;
    id v22 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(NSObject **)(v2 + 72);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __44__CAMTimelapseMovieWriter__enqueueNextWrite__block_invoke_2;
    block[3] = &unk_263FA2C30;
    block[4] = v2;
    void block[5] = &v17;
    block[6] = &v13;
    dispatch_sync(v3, block);
    uint64_t v4 = (void *)v18[5];
    if (v4)
    {
      uint64_t v5 = [MEMORY[0x263EFF9D0] null];

      if (v4 != v5)
      {
        id v6 = CVPixelBufferRetain((CVPixelBufferRef)v18[5]);
        [*(id *)(a1 + 32) _appendPixelBuffer:v6];
        CVPixelBufferRelease(v6);
      }
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = *(NSObject **)(v7 + 72);
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __44__CAMTimelapseMovieWriter__enqueueNextWrite__block_invoke_3;
      v11[3] = &unk_263FA0208;
      v11[4] = v7;
      dispatch_sync(v8, v11);
      if (!*((unsigned char *)v14 + 24)
        || (uint64_t v9 = *(void **)(a1 + 32),
            v10[0] = MEMORY[0x263EF8330],
            v10[1] = 3221225472,
            v10[2] = __44__CAMTimelapseMovieWriter__enqueueNextWrite__block_invoke_4,
            v10[3] = &unk_263FA51C0,
            v10[4] = v9,
            [v9 _finishMovieWithCompletionHandler:v10],
            !*((unsigned char *)v14 + 24)))
      {
        [*(id *)(a1 + 32) _enqueueNextDecode];
        [*(id *)(a1 + 32) _enqueueNextWrite];
      }
    }
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v17, 8);
  }
}

void __44__CAMTimelapseMovieWriter__enqueueNextWrite__block_invoke_2(void *a1)
{
  id v7 = [NSNumber numberWithInteger:*(void *)(a1[4] + 136)];
  uint64_t v2 = objc_msgSend(*(id *)(a1[4] + 56), "objectForKey:");
  uint64_t v3 = *(void *)(a1[5] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    [*(id *)(a1[4] + 56) removeObjectForKey:v7];
    ++*(void *)(a1[4] + 136);
    uint64_t v5 = a1[4];
    uint64_t v6 = *(void *)(v5 + 136);
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v6 == [*(id *)(v5 + 16) count];
  }
}

uint64_t __44__CAMTimelapseMovieWriter__enqueueNextWrite__block_invoke_3(uint64_t result)
{
  return result;
}

void __44__CAMTimelapseMovieWriter__enqueueNextWrite__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(v6 + 152);
  if (v7)
  {
    CMTime v10 = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
    if (a2)
    {
      CMTimeMake(&v10, *(void *)(v6 + 144), *(_DWORD *)(v6 + 128));
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 152);
    }
    id v8 = *(void (**)(uint64_t, uint64_t, CMTime *, id))(v7 + 16);
    CMTime v9 = v10;
    v8(v7, a2, &v9, v5);
    uint64_t v6 = *(void *)(a1 + 32);
  }
  [(id)v6 _reset];
}

- (CGSize)_desiredOutputSizeForFrameSize:(CGSize)a3
{
  double height = 1920.0;
  if (a3.height <= 1920.0) {
    double height = a3.height;
  }
  double v4 = round(height * 9.0 * 0.0625);
  double width = 1920.0;
  if (a3.width <= 1920.0) {
    double width = a3.width;
  }
  double v6 = round(width * 9.0 * 0.0625);
  BOOL v7 = a3.width <= a3.height;
  if (a3.width > a3.height) {
    double v8 = v6;
  }
  else {
    double v8 = height;
  }
  if (v7) {
    double v9 = v4;
  }
  else {
    double v9 = width;
  }
  result.double height = v8;
  result.double width = v9;
  return result;
}

- (BOOL)_startWritingWithOutputPath:(id)a3 width:(int64_t)a4 height:(int64_t)a5 videoFormatDescription:(opaqueCMFormatDescription *)a6 transform:(CGAffineTransform *)a7 framesPerSecond:(int64_t)a8 frameCount:(int64_t)a9 preferHEVC:(BOOL)a10 videoMetadata:(id)a11
{
  v48[1] = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a11;
  uint64_t v18 = [NSURL fileURLWithPath:v16];
  id v19 = objc_alloc(MEMORY[0x263EFA518]);
  uint64_t v20 = *MEMORY[0x263EF9898];
  id v46 = 0;
  v42 = (void *)v18;
  v21 = (AVAssetWriter *)[v19 initWithURL:v18 fileType:v20 error:&v46];
  id v22 = v46;
  p_writer = &self->__writer;
  writer = self->__writer;
  self->__writer = v21;

  if (!self->__writer || v22)
  {
    long long v34 = v22;
    long long v35 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      -[CAMTimelapseMovieWriter _startWritingWithOutputPath:width:height:videoFormatDescription:transform:framesPerSecond:frameCount:preferHEVC:videoMetadata:](v22);
    }
    long long v36 = v42;
    goto LABEL_8;
  }
  id v40 = v17;
  [(AVAssetWriter *)self->__writer setMetadata:v17];
  BOOL v25 = +[CAMTimelapseSettings sharedInstance];
  OSStatus v26 = [v25 outputSettingsForWidth:a4 height:a5 videoFormatDescription:a6 framesPerSecond:a8 frameCount:a9 useHEVC:a10];

  int v27 = [MEMORY[0x263EFA520] assetWriterInputWithMediaType:*MEMORY[0x263EF9D48] outputSettings:v26];
  long long v28 = *(_OWORD *)&a7->c;
  long long v43 = *(_OWORD *)&a7->a;
  long long v44 = v28;
  long long v45 = *(_OWORD *)&a7->tx;
  [v27 setTransform:&v43];
  [(CAMTimelapseMovieWriter *)self _setMetadataOnVideoTrackAssetWriterInput:v27];
  uint64_t v47 = *MEMORY[0x263F04180];
  v48[0] = &unk_26BDDEEB0;
  v29 = [NSDictionary dictionaryWithObjects:v48 forKeys:&v47 count:1];
  id v30 = [MEMORY[0x263EFA530] assetWriterInputPixelBufferAdaptorWithAssetWriterInput:v27 sourcePixelBufferAttributes:v29];
  BOOL v31 = [(AVAssetWriter *)self->__writer canAddInput:v27];
  if (v31)
  {
    [(AVAssetWriter *)self->__writer addInput:v27];
    objc_storeStrong((id *)&self->__videoInput, v27);
    [(AVAssetWriterInput *)self->__videoInput addObserver:self forKeyPath:@"readyForMoreMediaData" options:1 context:0];
    uint64_t v32 = v30;
    pixelBufferAdaptor = self->__pixelBufferAdaptor;
    self->__pixelBufferAdaptor = v32;
  }
  else
  {
    pixelBufferAdaptor = (AVAssetWriterInputPixelBufferAdaptor *)os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(&pixelBufferAdaptor->super, OS_LOG_TYPE_ERROR)) {
      -[CAMTimelapseMovieWriter _startWritingWithOutputPath:width:height:videoFormatDescription:transform:framesPerSecond:frameCount:preferHEVC:videoMetadata:](&pixelBufferAdaptor->super);
    }
  }
  id v17 = v40;

  long long v36 = v42;
  long long v34 = 0;
  if (!v31) {
    goto LABEL_14;
  }
  if (![(AVAssetWriter *)*p_writer startWriting])
  {
    long long v35 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      -[CAMTimelapseMovieWriter _startWritingWithOutputPath:width:height:videoFormatDescription:transform:framesPerSecond:frameCount:preferHEVC:videoMetadata:]((uint64_t)v16, (id *)&self->__writer, v35);
    }
LABEL_8:

LABEL_14:
    [(CAMTimelapseMovieWriter *)self _reset];
    BOOL v38 = 0;
    goto LABEL_15;
  }
  double v37 = *p_writer;
  long long v43 = *MEMORY[0x263F010E0];
  *(void *)&long long v44 = *(void *)(MEMORY[0x263F010E0] + 16);
  [(AVAssetWriter *)v37 startSessionAtSourceTime:&v43];
  BOOL v38 = 1;
LABEL_15:

  return v38;
}

- (void)_setMetadataOnVideoTrackAssetWriterInput:(id)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263F5DB10] metadataItemForTimelapse];
  id v5 = (void *)v4;
  if (v4)
  {
    v7[0] = v4;
    double v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
    [v3 setMetadata:v6];
  }
}

- (BOOL)_appendPixelBuffer:(__CVBuffer *)a3
{
  id v3 = a3;
  if (a3)
  {
    memset(&v11, 0, sizeof(v11));
    CMTimeMake(&v11, self->__currentOutputFrameIndex, self->__framesPerSecond);
    pixelBufferAdaptor = self->__pixelBufferAdaptor;
    CMTime v10 = v11;
    LODWORD(v3) = [(AVAssetWriterInputPixelBufferAdaptor *)pixelBufferAdaptor appendPixelBuffer:v3 withPresentationTime:&v10];
    if (v3)
    {
      ++self->__currentOutputFrameIndex;
    }
    else
    {
      writer = self->__writer;
      p_writer = &self->__writer;
      if ([(AVAssetWriter *)writer status] == AVAssetWriterStatusFailed)
      {
        double v8 = os_log_create("com.apple.camera", "Nebula");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          -[CAMTimelapseMovieWriter _appendPixelBuffer:]((id *)p_writer);
        }
      }
    }
  }
  return (char)v3;
}

- (void)_finishMovieWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(AVAssetWriterInput *)self->__videoInput markAsFinished];
  id v5 = [(AVAssetWriter *)self->__writer metadata];
  writer = self->__writer;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__CAMTimelapseMovieWriter__finishMovieWithCompletionHandler___block_invoke;
  v9[3] = &unk_263FA5238;
  id v10 = v5;
  id v11 = v4;
  v9[4] = self;
  id v7 = v5;
  id v8 = v4;
  [(AVAssetWriter *)writer finishWritingWithCompletionHandler:v9];
}

uint64_t __61__CAMTimelapseMovieWriter__finishMovieWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 104) status];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a5;
  if ([a3 isEqualToString:@"readyForMoreMediaData"])
  {
    id v8 = [v10 objectForKey:*MEMORY[0x263F081B8]];
    int v9 = [v8 BOOLValue];

    if (v9) {
      [(CAMTimelapseMovieWriter *)self _enqueueNextWrite];
    }
  }
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (NSArray)_frameFilePaths
{
  return self->__frameFilePaths;
}

- (int64_t)_nextReadFileIndex
{
  return self->__nextReadFileIndex;
}

- (int64_t)_residentImageDataCount
{
  return self->__residentImageDataCount;
}

- (int64_t)_residentPixelBufferCount
{
  return self->__residentPixelBufferCount;
}

- (NSMutableDictionary)_availableImageData
{
  return self->__availableImageData;
}

- (NSMutableDictionary)_availablePixelBuffers
{
  return self->__availablePixelBuffers;
}

- (NSMutableSet)_inFlightReadFrameIndexes
{
  return self->__inFlightReadFrameIndexes;
}

- (OS_dispatch_queue)_synchronizationQueue
{
  return self->__synchronizationQueue;
}

- (NSOperationQueue)_imageReadQueue
{
  return self->__imageReadQueue;
}

- (NSOperationQueue)_imageDecodeQueue
{
  return self->__imageDecodeQueue;
}

- (OS_dispatch_queue)_movieWritingQueue
{
  return self->__movieWritingQueue;
}

- (AVAssetWriter)_writer
{
  return self->__writer;
}

- (AVAssetWriterInput)_videoInput
{
  return self->__videoInput;
}

- (AVAssetWriterInputPixelBufferAdaptor)_pixelBufferAdaptor
{
  return self->__pixelBufferAdaptor;
}

- (int64_t)_framesPerSecond
{
  return self->__framesPerSecond;
}

- (int64_t)_nextWriteFileIndex
{
  return self->__nextWriteFileIndex;
}

- (int64_t)_currentOutputFrameIndex
{
  return self->__currentOutputFrameIndex;
}

- (id)_completion
{
  return self->__completion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__completion, 0);
  objc_storeStrong((id *)&self->__pixelBufferAdaptor, 0);
  objc_storeStrong((id *)&self->__videoInput, 0);
  objc_storeStrong((id *)&self->__writer, 0);
  objc_storeStrong((id *)&self->__movieWritingQueue, 0);
  objc_storeStrong((id *)&self->__imageDecodeQueue, 0);
  objc_storeStrong((id *)&self->__imageReadQueue, 0);
  objc_storeStrong((id *)&self->__synchronizationQueue, 0);
  objc_storeStrong((id *)&self->__inFlightReadFrameIndexes, 0);
  objc_storeStrong((id *)&self->__availablePixelBuffers, 0);
  objc_storeStrong((id *)&self->__availableImageData, 0);
  objc_storeStrong((id *)&self->__frameFilePaths, 0);
}

- (void)writeMovieFromImageFiles:(os_log_t)log visMetadataFiles:startDate:location:outputPath:transform:framesPerSecond:preferHEVC:completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2099F8000, log, OS_LOG_TYPE_ERROR, "Error: failed to start writing movie", v1, 2u);
}

- (void)writeMovieFromImageFiles:(int)a1 visMetadataFiles:(NSObject *)a2 startDate:location:outputPath:transform:framesPerSecond:preferHEVC:completionHandler:.cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "Error: failed to get videoFormatDescription for pixel buffer: %d", (uint8_t *)v2, 8u);
}

- (void)_startWritingWithOutputPath:(void *)a1 width:height:videoFormatDescription:transform:framesPerSecond:frameCount:preferHEVC:videoMetadata:.cold.1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_0(&dword_2099F8000, v2, v3, "Could not create writer with error %{public}@", v4, v5, v6, v7, 2u);
}

- (void)_startWritingWithOutputPath:(NSObject *)a3 width:height:videoFormatDescription:transform:framesPerSecond:frameCount:preferHEVC:videoMetadata:.cold.2(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [*a2 error];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  int v9 = v5;
  _os_log_error_impl(&dword_2099F8000, a3, OS_LOG_TYPE_ERROR, "Could not start asset writer for %{public}@: %{public}@", (uint8_t *)&v6, 0x16u);
}

- (void)_startWritingWithOutputPath:(os_log_t)log width:height:videoFormatDescription:transform:framesPerSecond:frameCount:preferHEVC:videoMetadata:.cold.3(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2099F8000, log, OS_LOG_TYPE_ERROR, "Could not add video input for writer", v1, 2u);
}

- (void)_appendPixelBuffer:(id *)a1 .cold.1(id *a1)
{
  uint64_t v1 = [*a1 error];
  OUTLINED_FUNCTION_0(&dword_2099F8000, v2, v3, "Error writing frame to movie %{public}@", v4, v5, v6, v7, 2u);
}

@end