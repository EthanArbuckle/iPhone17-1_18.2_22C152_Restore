@interface CAMTimelapseStabilizationMovieWriter
+ (CGSize)_desiredOutputSizeForSourcePixelBuffer:(__CVBuffer *)a3;
- (AVAssetWriter)_writer;
- (AVAssetWriterInput)_videoInput;
- (AVAssetWriterInputPixelBufferAdaptor)_pixelBufferAdaptor;
- (AVOfflineVideoStabilizer)_stabilizer;
- (BOOL)_appendPixelBufferToMovie:(__CVBuffer *)a3;
- (BOOL)_preferHEVC;
- (BOOL)isSuspended;
- (CAMTimelapseStabilizationMovieWriter)init;
- (CGAffineTransform)_movieTransform;
- (CLLocation)_movieCreationLocation;
- (NSArray)_frameFilePaths;
- (NSArray)_visMetadataFilePaths;
- (NSDate)_movieCreationDate;
- (NSMutableSet)_badFrameSet;
- (NSMutableSet)_badMetadataSet;
- (NSString)_movieOutputPath;
- (OS_dispatch_queue)_decodeQueue;
- (OS_dispatch_queue)_movieWritingQueue;
- (OS_dispatch_queue)_pixelTransferQueue;
- (OS_dispatch_queue)_readingQueue;
- (OS_dispatch_queue)_syncQueue;
- (OS_dispatch_semaphore)_semFileReader;
- (OS_dispatch_semaphore)_semFrameGetter;
- (OpaqueVTPixelTransferSession)_pixelTransferSession;
- (__CFArray)_frameList;
- (__CVBuffer)_cropPixelBufferIfNeeded:(__CVBuffer *)a3;
- (__CVBuffer)_decodeFirstFrameAgain;
- (__CVBuffer)_stashedSourceFrame;
- (__CVBuffer)copySourcePixelBufferForFrameNumber:(int64_t)a3 outputSampleTime:(id *)a4 stabilizer:(id)a5;
- (id)_completion;
- (id)copySourceStabilizationMetadataForFrameNumber:(int64_t)a3 outputSampleTime:(id *)a4 stabilizer:(id)a5;
- (int)_copyNextSampleBufferFromStabilizer:(opaqueCMSampleBuffer *)a3;
- (int)_copySourcePixelBufferForNextFrame:(__CVBuffer *)a3 skipBadFrames:(BOOL)a4;
- (int)_startWritingWithOutputPath:(id)a3 width:(int64_t)a4 height:(int64_t)a5 videoFormatDescription:(opaqueCMFormatDescription *)a6 transform:(CGAffineTransform *)a7 framesPerSecond:(int64_t)a8 frameCount:(int64_t)a9 preferHEVC:(BOOL)a10 visMetadataCount:(int64_t)a11 videoMetadata:(id)a12;
- (int64_t)_badMetadataErrorThreshold;
- (int64_t)_firstFrameIndex;
- (int64_t)_frameCountWrittenToMovie;
- (int64_t)_movieFramesPerSecond;
- (int64_t)_nextMetadataFrameIndex;
- (int64_t)_nextSourceFrameIndex;
- (unint64_t)_frameLoadMode;
- (void)_cleanup;
- (void)_decodeFirstFrameAgain;
- (void)_finishMovieWithCompletionHandler:(id)a3;
- (void)_finishMovieWithFailure;
- (void)_finishMovieWithRestartUnstabilized;
- (void)_powerAssertion;
- (void)_requestNextFrameReadDecode;
- (void)_reset;
- (void)_restartUnstabilized;
- (void)_setMetadataOnVideoTrackAssetWriterInput:(id)a3;
- (void)_startAsyncDecoding;
- (void)_writeMovieAsynchronously;
- (void)dealloc;
- (void)setSuspended:(BOOL)a3;
- (void)writeMovieFromImageFiles:(id)a3 visMetadataFiles:(id)a4 startDate:(id)a5 location:(id)a6 outputPath:(id)a7 transform:(CGAffineTransform *)a8 framesPerSecond:(int64_t)a9 preferHEVC:(BOOL)a10 completionHandler:(id)a11;
@end

@implementation CAMTimelapseStabilizationMovieWriter

- (CAMTimelapseStabilizationMovieWriter)init
{
  v15.receiver = self;
  v15.super_class = (Class)CAMTimelapseStabilizationMovieWriter;
  v2 = [(CAMTimelapseStabilizationMovieWriter *)&v15 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.camera.timelapse.movie.write", 0);
    movieWritingQueue = v2->__movieWritingQueue;
    v2->__movieWritingQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.camera.timelapse.movie.sync", 0);
    syncQueue = v2->__syncQueue;
    v2->__syncQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.camera.timelapse.movie.reading", 0);
    readingQueue = v2->__readingQueue;
    v2->__readingQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.camera.timelapse.movie.decode", 0);
    decodeQueue = v2->__decodeQueue;
    v2->__decodeQueue = (OS_dispatch_queue *)v9;

    Boolean keyExistsAndHasValidFormat = 0;
    CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"CAMTimelapseFrameLoadMode", @"com.apple.camera", &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat) {
      uint64_t v12 = AppIntegerValue;
    }
    else {
      uint64_t v12 = 1;
    }
    v2->__frameLoadMode = v12;
  }
  return v2;
}

- (void)dealloc
{
  [(CAMTimelapseStabilizationMovieWriter *)self _cleanup];
  v3.receiver = self;
  v3.super_class = (Class)CAMTimelapseStabilizationMovieWriter;
  [(CAMTimelapseStabilizationMovieWriter *)&v3 dealloc];
}

- (void)_cleanup
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  IOSurface = CVPixelBufferGetIOSurface(*a1);
  v4[0] = 67109120;
  v4[1] = IOSurfaceGetID(IOSurface);
  _os_log_debug_impl(&dword_2099F8000, a2, OS_LOG_TYPE_DEBUG, "Releasing IOSurface: 0x%x", (uint8_t *)v4, 8u);
}

void __48__CAMTimelapseStabilizationMovieWriter__cleanup__block_invoke_13(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  CFArrayRef v3 = *(const __CFArray **)(v2 + 88);
  if (v3)
  {
    if (CFArrayGetCount(v3) >= 1)
    {
      CFIndex v4 = 0;
      do
      {
        ValueAtIndex = (CVPixelBufferRef *)CFArrayGetValueAtIndex(*(CFArrayRef *)(*(void *)(a1 + 32) + 88), v4);
        v6 = ValueAtIndex + 1;
        if (ValueAtIndex[1])
        {
          dispatch_queue_t v7 = os_log_create("com.apple.camera", "Nebula");
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
            __48__CAMTimelapseStabilizationMovieWriter__cleanup__block_invoke_13_cold_2(v9, v6, &v10, v7);
          }

          CVPixelBufferRelease(*v6);
        }
        free(ValueAtIndex);
        ++v4;
      }
      while (CFArrayGetCount(*(CFArrayRef *)(*(void *)(a1 + 32) + 88)) > v4);
    }
    CFRelease(*(CFTypeRef *)(*(void *)(a1 + 32) + 88));
    *(void *)(*(void *)(a1 + 32) + 88) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (*(void *)(v2 + 248))
  {
    v8 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __48__CAMTimelapseStabilizationMovieWriter__cleanup__block_invoke_13_cold_1();
    }

    CFRelease(*(CFTypeRef *)(*(void *)(a1 + 32) + 248));
    *(void *)(*(void *)(a1 + 32) + 248) = 0;
  }
}

- (void)_reset
{
  [(CAMTimelapseStabilizationMovieWriter *)self _cleanup];
  frameFilePaths = self->__frameFilePaths;
  self->__frameFilePaths = 0;

  visMetadataFilePaths = self->__visMetadataFilePaths;
  self->__visMetadataFilePaths = 0;

  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0);
  movieCreationDate = self->__movieCreationDate;
  self->__frameList = Mutable;
  self->__movieCreationDate = 0;

  movieCreationLocation = self->__movieCreationLocation;
  self->__movieCreationLocation = 0;

  movieOutputPath = self->__movieOutputPath;
  self->__movieOutputPath = 0;

  uint64_t v9 = MEMORY[0x263F000D0];
  long long v10 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&self->__movieTransform.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&self->__movieTransform.c = v10;
  *(_OWORD *)&self->__movieTransform.tx = *(_OWORD *)(v9 + 32);
  self->__movieFramesPerSecond = 0;
  writer = self->__writer;
  self->__writer = 0;

  stabilizer = self->__stabilizer;
  self->__stabilizer = 0;

  videoInput = self->__videoInput;
  self->__videoInput = 0;

  pixelBufferAdaptor = self->__pixelBufferAdaptor;
  self->__pixelBufferAdaptor = 0;

  self->__frameCountWrittenToMovie = 0;
  self->__nextSourceFrameIndex = 0;
  self->__nextMetadataFrameIndex = 0;
  self->__firstFrameIndex = -1;
  self->__badMetadataErrorThreshold = 0x7FFFFFFFFFFFFFFFLL;
  id completion = self->__completion;
  self->__id completion = 0;
}

- (void)_restartUnstabilized
{
  frameFilePaths = self->__frameFilePaths;
  movieCreationDate = self->__movieCreationDate;
  movieCreationLocation = self->__movieCreationLocation;
  long long v6 = *(_OWORD *)&self->__movieTransform.c;
  long long v20 = *(_OWORD *)&self->__movieTransform.a;
  long long v21 = v6;
  long long v22 = *(_OWORD *)&self->__movieTransform.tx;
  int64_t movieFramesPerSecond = self->__movieFramesPerSecond;
  BOOL preferHEVC = self->__preferHEVC;
  id completion = self->__completion;
  long long v10 = self->__movieOutputPath;
  uint64_t v11 = movieCreationLocation;
  uint64_t v12 = movieCreationDate;
  v13 = frameFilePaths;
  v14 = _Block_copy(completion);
  objc_super v15 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2099F8000, v15, OS_LOG_TYPE_DEFAULT, "Restarting timelapse movie render without stabilization...", buf, 2u);
  }

  *(_OWORD *)buf = v20;
  long long v18 = v21;
  long long v19 = v22;
  LOBYTE(v16) = preferHEVC;
  [(CAMTimelapseStabilizationMovieWriter *)self writeMovieFromImageFiles:v13 visMetadataFiles:0 startDate:v12 location:v11 outputPath:v10 transform:buf framesPerSecond:movieFramesPerSecond preferHEVC:v16 completionHandler:v14];
}

- (void)setSuspended:(BOOL)a3
{
  if (self->_suspended != a3)
  {
    BOOL v3 = a3;
    self->_suspended = a3;
    if (self->__movieWritingQueue)
    {
      uint64_t v5 = os_log_create("com.apple.camera", "Nebula");
      BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
      if (v3)
      {
        if (v6) {
          -[CAMTimelapseStabilizationMovieWriter setSuspended:]();
        }

        dispatch_suspend((dispatch_object_t)self->__movieWritingQueue);
      }
      else
      {
        if (v6) {
          -[CAMTimelapseStabilizationMovieWriter setSuspended:]();
        }

        dispatch_resume((dispatch_object_t)self->__movieWritingQueue);
      }
    }
  }
}

- (void)writeMovieFromImageFiles:(id)a3 visMetadataFiles:(id)a4 startDate:(id)a5 location:(id)a6 outputPath:(id)a7 transform:(CGAffineTransform *)a8 framesPerSecond:(int64_t)a9 preferHEVC:(BOOL)a10 completionHandler:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v82 = a5;
  id v81 = a6;
  id v19 = a7;
  long long v20 = a11;
  long long v21 = v17;
  uint64_t v22 = [v17 count];
  v87 = 0;
  CMVideoFormatDescriptionRef formatDescriptionOut = 0;
  [(CAMTimelapseStabilizationMovieWriter *)self _reset];
  if (v22 < 1)
  {
    v51 = 0;
    int v73 = -1;
LABEL_29:
    v74 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
      -[CAMTimelapseStabilizationMovieWriter writeMovieFromImageFiles:visMetadataFiles:startDate:location:outputPath:transform:framesPerSecond:preferHEVC:completionHandler:](v73, v74);
    }

    [(CAMTimelapseStabilizationMovieWriter *)self _reset];
    if (v20)
    {
      v75 = (void (*)(void *, void, long long *, void))v20[2];
      long long v83 = *MEMORY[0x263F010E0];
      *(void *)&long long v84 = *(void *)(MEMORY[0x263F010E0] + 16);
      v75(v20, 0, &v83, 0);
    }
    goto LABEL_33;
  }
  v23 = (NSDate *)[v82 copy];
  movieCreationDate = self->__movieCreationDate;
  self->__movieCreationDate = v23;

  objc_storeStrong((id *)&self->__movieCreationLocation, a6);
  v25 = (NSString *)[v19 copy];
  movieOutputPath = self->__movieOutputPath;
  self->__movieOutputPath = v25;

  long long v27 = *(_OWORD *)&a8->a;
  long long v28 = *(_OWORD *)&a8->tx;
  *(_OWORD *)&self->__movieTransform.c = *(_OWORD *)&a8->c;
  *(_OWORD *)&self->__movieTransform.tx = v28;
  *(_OWORD *)&self->__movieTransform.a = v27;
  self->__int64_t movieFramesPerSecond = a9;
  self->__BOOL preferHEVC = a10;
  v29 = (NSArray *)[v21 copy];
  frameFilePaths = self->__frameFilePaths;
  self->__frameFilePaths = v29;

  v31 = (NSArray *)[v18 copy];
  visMetadataFilePaths = self->__visMetadataFilePaths;
  self->__visMetadataFilePaths = v31;

  v33 = self->__visMetadataFilePaths;
  if (v33 && [(NSArray *)v33 count])
  {
    int64_t v34 = vcvtms_s32_f32((float)v22 * 0.05);
    if (v34 <= 1) {
      int64_t v34 = 1;
    }
    if (v22 < (unint64_t)v34) {
      int64_t v34 = v22;
    }
    self->__badMetadataErrorThreshold = v34;
    v35 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
      -[CAMTimelapseStabilizationMovieWriter writeMovieFromImageFiles:visMetadataFiles:startDate:location:outputPath:transform:framesPerSecond:preferHEVC:completionHandler:].cold.4();
    }
  }
  v80 = v20;
  v36 = (OS_dispatch_semaphore *)dispatch_semaphore_create([(CAMTimelapseStabilizationMovieWriter *)self _frameLoadMode] != 0);
  semFileReader = self->__semFileReader;
  self->__semFileReader = v36;

  v38 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  semFrameGetter = self->__semFrameGetter;
  self->__semFrameGetter = v38;

  v40 = [MEMORY[0x263EFF9C0] set];
  badFrameSet = self->__badFrameSet;
  self->__badFrameSet = v40;

  v42 = [MEMORY[0x263EFF9C0] set];
  badMetadataSet = self->__badMetadataSet;
  self->__badMetadataSet = v42;

  [(CAMTimelapseStabilizationMovieWriter *)self _startAsyncDecoding];
  int v44 = [(CAMTimelapseStabilizationMovieWriter *)self _copySourcePixelBufferForNextFrame:&v87 skipBadFrames:1];
  if (v44)
  {
    int v73 = v44;
    v51 = 0;
  }
  else
  {
    v45 = v87;
    int64_t v46 = self->__nextSourceFrameIndex - 1;
    self->__nextSourceFrameIndex = v46;
    self->__nextMetadataFrameIndex = v46;
    self->__firstFrameIndex = v46;
    self->__stashedSourceFrame = v45;
    movieCreationLocation = self->__movieCreationLocation;
    if (!movieCreationLocation)
    {
      v48 = [(NSArray *)self->__frameFilePaths objectAtIndex:v46];
      v49 = +[CAMNebulaUtilities locationFromJPEGAtPath:v48];
      v50 = self->__movieCreationLocation;
      self->__movieCreationLocation = v49;

      movieCreationLocation = self->__movieCreationLocation;
    }
    v51 = +[CAMPersistenceController clientVideoMetadataForLocation:movieCreationLocation withCreationDate:self->__movieCreationDate];
    OSStatus v52 = CMVideoFormatDescriptionCreateForImageBuffer(0, self->__stashedSourceFrame, &formatDescriptionOut);
    if (v52)
    {
      int v73 = v52;
    }
    else
    {
      v78 = v21;
      id v79 = v19;
      [(id)objc_opt_class() _desiredOutputSizeForSourcePixelBuffer:self->__stashedSourceFrame];
      double v54 = v53;
      double v56 = v55;
      v57 = self->__movieOutputPath;
      uint64_t v58 = (uint64_t)v53;
      uint64_t v59 = (uint64_t)v55;
      CMVideoFormatDescriptionRef v60 = formatDescriptionOut;
      uint64_t v61 = [v18 count];
      long long v62 = *(_OWORD *)&self->__movieTransform.c;
      long long v83 = *(_OWORD *)&self->__movieTransform.a;
      long long v84 = v62;
      long long v85 = *(_OWORD *)&self->__movieTransform.tx;
      LOBYTE(v77) = a10;
      int v63 = [(CAMTimelapseStabilizationMovieWriter *)self _startWritingWithOutputPath:v57 width:v58 height:v59 videoFormatDescription:v60 transform:&v83 framesPerSecond:a9 frameCount:v22 preferHEVC:v77 visMetadataCount:v61 videoMetadata:v51];
      if (v63)
      {
        int v73 = v63;
        long long v21 = v78;
        id v19 = v79;
        long long v20 = v80;
      }
      else
      {
        long long v21 = v78;
        id v19 = v79;
        long long v20 = v80;
        if (self->__stabilizer) {
          goto LABEL_24;
        }
        double Width = (double)CVPixelBufferGetWidth(self->__stashedSourceFrame);
        double Height = (double)CVPixelBufferGetHeight(self->__stashedSourceFrame);
        if (v54 == Width && v56 == Height) {
          goto LABEL_24;
        }
        v66 = os_log_create("com.apple.camera", "Nebula");
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG)) {
          -[CAMTimelapseStabilizationMovieWriter writeMovieFromImageFiles:visMetadataFiles:startDate:location:outputPath:transform:framesPerSecond:preferHEVC:completionHandler:](Width, Height, v54, v56);
        }

        v67 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.camera.timelapse.movie.framecrop", 0);
        pixelTransferQueue = self->__pixelTransferQueue;
        self->__pixelTransferQueue = v67;

        if (!self->__pixelTransferQueue)
        {
          v76 = os_log_create("com.apple.camera", "Nebula");
          if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR)) {
            -[CAMTimelapseStabilizationMovieWriter writeMovieFromImageFiles:visMetadataFiles:startDate:location:outputPath:transform:framesPerSecond:preferHEVC:completionHandler:]();
          }

          goto LABEL_25;
        }
        p_pixelTransferSession = &self->__pixelTransferSession;
        OSStatus v70 = VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], &self->__pixelTransferSession);
        if (!v70)
        {
          VTSessionSetProperty(*p_pixelTransferSession, (CFStringRef)*MEMORY[0x263F1E9F0], (CFTypeRef)*MEMORY[0x263EFFB40]);
          OSStatus v70 = VTSessionSetProperty(*p_pixelTransferSession, (CFStringRef)*MEMORY[0x263F1EA08], (CFTypeRef)*MEMORY[0x263F1EC68]);
          if (!v70)
          {
LABEL_24:
            v71 = (void *)[v80 copy];
            id completion = self->__completion;
            self->__id completion = v71;

            [(CAMTimelapseStabilizationMovieWriter *)self _writeMovieAsynchronously];
LABEL_25:
            int v73 = 0;
            goto LABEL_26;
          }
        }
        int v73 = v70;
      }
    }
  }
LABEL_26:
  if (formatDescriptionOut) {
    CFRelease(formatDescriptionOut);
  }
  if (v73) {
    goto LABEL_29;
  }
LABEL_33:
}

- (__CVBuffer)_cropPixelBufferIfNeeded:(__CVBuffer *)a3
{
  v24[4] = *MEMORY[0x263EF8340];
  CVPixelBufferRef pixelBufferOut = 0;
  if (self->__pixelTransferSession)
  {
    uint64_t v18 = 0;
    id v19 = &v18;
    uint64_t v20 = 0x2020000000;
    int v21 = 0;
    uint64_t v5 = [(AVAssetWriterInputPixelBufferAdaptor *)self->__pixelBufferAdaptor pixelBufferPool];
    if (v5)
    {
      CVReturn v6 = CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x263EFFB08], v5, &pixelBufferOut);
      *((_DWORD *)v19 + 6) = v6;
      if (!v6)
      {
        size_t Width = CVPixelBufferGetWidth(pixelBufferOut);
        size_t Height = CVPixelBufferGetHeight(pixelBufferOut);
        v23[0] = *MEMORY[0x263F03ED0];
        uint64_t v9 = [NSNumber numberWithDouble:(double)Width];
        v24[0] = v9;
        v23[1] = *MEMORY[0x263F03EB0];
        long long v10 = [NSNumber numberWithDouble:(double)Height];
        uint64_t v11 = *MEMORY[0x263F03EB8];
        v24[1] = v10;
        v24[2] = &unk_26BDDE988;
        uint64_t v12 = *MEMORY[0x263F03EC8];
        v23[2] = v11;
        v23[3] = v12;
        v24[3] = &unk_26BDDE988;
        v13 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];

        CVBufferSetAttachment(a3, (CFStringRef)*MEMORY[0x263F03EC0], v13, kCVAttachmentMode_ShouldNotPropagate);
        pixelTransferQueue = self->__pixelTransferQueue;
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __65__CAMTimelapseStabilizationMovieWriter__cropPixelBufferIfNeeded___block_invoke;
        v17[3] = &unk_263FA5170;
        v17[4] = self;
        v17[5] = &v18;
        v17[6] = a3;
        v17[7] = pixelBufferOut;
        dispatch_sync(pixelTransferQueue, v17);
        if (!*((_DWORD *)v19 + 6))
        {
          CVPixelBufferRelease(a3);
          a3 = pixelBufferOut;
          CVPixelBufferRef pixelBufferOut = 0;
        }
      }
    }
    else
    {
      uint64_t v16 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[CAMTimelapseStabilizationMovieWriter _cropPixelBufferIfNeeded:]();
      }
    }
    _Block_object_dispose(&v18, 8);
  }
  CVPixelBufferRelease(pixelBufferOut);
  return a3;
}

uint64_t __65__CAMTimelapseStabilizationMovieWriter__cropPixelBufferIfNeeded___block_invoke(uint64_t a1)
{
  uint64_t result = VTPixelTransferSessionTransferImage(*(VTPixelTransferSessionRef *)(*(void *)(a1 + 32) + 224), *(CVPixelBufferRef *)(a1 + 48), *(CVPixelBufferRef *)(a1 + 56));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (__CVBuffer)_decodeFirstFrameAgain
{
  uint64_t v2 = [(NSArray *)self->__frameFilePaths objectAtIndex:self->__firstFrameIndex];
  id v3 = +[CAMTimelapseJPEGReader newDataFromFilePath:v2];
  if (!v3)
  {
    CVReturn v6 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CAMTimelapseStabilizationMovieWriter _decodeFirstFrameAgain]();
    }
    goto LABEL_8;
  }
  CFIndex v4 = +[CAMTimelapseJPEGReader createPixelBufferFromData:v3 applyTransform:0 maxPixelSize:0 useBGRA:0];
  if (!v4)
  {
    CVReturn v6 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CAMTimelapseStabilizationMovieWriter _decodeFirstFrameAgain]();
    }
LABEL_8:

    CFIndex v4 = 0;
  }

  return v4;
}

- (void)_startAsyncDecoding
{
}

void __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (v2 && [v2 count])
  {
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 16) count];
    CFIndex v4 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_cold_6();
    }

    uint64_t v5 = 0;
    do
    {
      CVReturn v6 = (void *)MEMORY[0x21050BCA0]();
      dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 80), 0xFFFFFFFFFFFFFFFFLL);
      dispatch_queue_t v7 = *(void **)(*(void *)(a1 + 32) + 16);
      if (!v7)
      {
        long long v10 = os_log_create("com.apple.camera", "Nebula");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_cold_3(buf, &buf[1]);
        }
        goto LABEL_22;
      }
      v8 = [v7 objectAtIndex:v5];
      uint64_t v9 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218242;
        uint64_t v20 = v5;
        __int16 v21 = 2114;
        uint64_t v22 = v8;
        _os_log_debug_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEBUG, "Reading frame %ld from disk: %{public}@", buf, 0x16u);
      }

      long long v10 = +[CAMTimelapseJPEGReader newDataFromFilePath:v8];
      uint64_t v11 = malloc_type_malloc(0x18uLL, 0x102004061A0B540uLL);
      if (!v11)
      {
        id v17 = os_log_create("com.apple.camera", "Nebula");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_cold_4(buf, &buf[1]);
        }

LABEL_22:
        goto LABEL_14;
      }
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)(a1 + 32);
      v14 = *(NSObject **)(v13 + 40);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_21;
      block[3] = &unk_263FA2BC8;
      block[5] = v12;
      block[6] = v5;
      block[4] = v13;
      dispatch_sync(v14, block);
      pl_dispatch_async();
      ++v5;
    }
    while (v5 < v3);
    objc_super v15 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_cold_5();
    }
  }
  else
  {
    objc_super v15 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_cold_2();
    }
  }

LABEL_14:
  uint64_t v16 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_cold_1();
  }
}

void __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_21(void *a1)
{
  uint64_t v2 = (void *)a1[5];
  void *v2 = a1[6];
  v2[1] = 0;
  uint64_t v3 = (unsigned char *)a1[5];
  v3[16] = 0;
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1[4] + 88), v3);
  if (!*(void *)(a1[4] + 248))
  {
    CFIndex v4 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_21_cold_1();
    }

    *(void *)(a1[4] + 248) = CPPowerAssertionCreate();
  }
}

void __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_25(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_25_cold_2(a1);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    CFIndex v4 = +[CAMTimelapseJPEGReader createPixelBufferFromData:v3 applyTransform:0 maxPixelSize:0 useBGRA:0];
    uint64_t v5 = (uint64_t)v4;
    if (*(void *)(a1 + 32))
    {
      char v6 = 0;
      if (v4) {
        goto LABEL_15;
      }
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  dispatch_queue_t v7 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 134217984;
    uint64_t v16 = v8;
    _os_log_impl(&dword_2099F8000, v7, OS_LOG_TYPE_DEFAULT, "Failed to read/decode frame %ld", buf, 0xCu);
  }

  if (*(void *)(*(void *)(a1 + 40) + 184) != -1)
  {
    uint64_t v9 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_25_cold_1();
    }

    uint64_t v5 = [*(id *)(a1 + 40) _decodeFirstFrameAgain];
  }
  char v6 = 1;
LABEL_15:
  uint64_t v10 = [*(id *)(a1 + 40) _cropPixelBufferIfNeeded:v5];
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = *(NSObject **)(v11 + 40);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_26;
  v13[3] = &unk_263FA3500;
  v13[5] = *(void *)(a1 + 56);
  v13[6] = v10;
  char v14 = v6;
  v13[4] = v11;
  dispatch_sync(v12, v13);
}

void *__59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_26(uint64_t a1)
{
  uint64_t v2 = (CVPixelBufferRef *)(a1 + 48);
  uint64_t v3 = (void **)(a1 + 40);
  *(void *)(*(void *)(a1 + 40) + 8) = *(void *)(a1 + 48);
  *(unsigned char *)(*(void *)(a1 + 40) + 16) = *(unsigned char *)(a1 + 56);
  uint64_t result = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(void *)(a1 + 32) + 88), 0);
  if (**v3 == *result)
  {
    uint64_t v5 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_26_cold_1((uint64_t)v3, v2);
    }

    return (void *)dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 72));
  }
  return result;
}

- (void)_writeMovieAsynchronously
{
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  v5[3] = 0;
  videoInput = self->__videoInput;
  movieWritingQueue = self->__movieWritingQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  _DWORD v4[2] = __65__CAMTimelapseStabilizationMovieWriter__writeMovieAsynchronously__block_invoke;
  v4[3] = &unk_263FA2300;
  v4[4] = self;
  v4[5] = v5;
  [(AVAssetWriterInput *)videoInput requestMediaDataWhenReadyOnQueue:movieWritingQueue usingBlock:v4];
  _Block_object_dispose(v5, 8);
}

void __65__CAMTimelapseStabilizationMovieWriter__writeMovieAsynchronously__block_invoke(uint64_t a1, __n128 a2)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v3 + 8))
  {
    a2.n128_u64[0] = 134218240;
    __n128 v23 = a2;
    while (1)
    {
      if (!objc_msgSend(*(id *)(v3 + 144), "isReadyForMoreMediaData", *(_OWORD *)&v23)) {
        return;
      }
      uint64_t v32 = 0;
      v33 = &v32;
      uint64_t v34 = 0x2020000000;
      char v35 = 0;
      CFTypeRef cf = 0;
      CFIndex v4 = *(void **)(a1 + 32);
      if (!v4[16]) {
        break;
      }
      CMSampleBufferRef sbuf = 0;
      uint64_t v5 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        __65__CAMTimelapseStabilizationMovieWriter__writeMovieAsynchronously__block_invoke_cold_5();
      }

      int v6 = [*(id *)(a1 + 32) _copyNextSampleBufferFromStabilizer:&sbuf];
      if (sbuf)
      {
        CFTypeRef cf = CMSampleBufferGetImageBuffer(sbuf);
        dispatch_queue_t v7 = os_log_create("com.apple.camera", "Nebula");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          CFTypeRef v18 = cf;
          IOSurface = CVPixelBufferGetIOSurface((CVPixelBufferRef)cf);
          IOSurfaceID ID = IOSurfaceGetID(IOSurface);
          *(_DWORD *)buf = v23.n128_u32[0];
          CFTypeRef v37 = v18;
          __int16 v38 = 1024;
          IOSurfaceID v39 = ID;
          _os_log_debug_impl(&dword_2099F8000, v7, OS_LOG_TYPE_DEBUG, "Got frame %p (Surface ID 0x%d) from stabilizer", buf, 0x12u);
        }

        CFRetain(cf);
        CFRelease(sbuf);
      }
      if (!v6) {
        goto LABEL_15;
      }
LABEL_19:
      ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      if (cf)
      {
        uint64_t v10 = os_log_create("com.apple.camera", "Nebula");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v16 = CVPixelBufferGetIOSurface((CVPixelBufferRef)cf);
          IOSurfaceID v17 = IOSurfaceGetID(v16);
          *(_DWORD *)buf = 67109120;
          LODWORD(v37) = v17;
          _os_log_debug_impl(&dword_2099F8000, v10, OS_LOG_TYPE_DEBUG, "Releasing IOSurface: 0x%x", buf, 8u);
        }

        CFRelease(cf);
      }
      switch(v6)
      {
        case -3:
          uint64_t v12 = os_log_create("com.apple.camera", "Nebula");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
            __65__CAMTimelapseStabilizationMovieWriter__writeMovieAsynchronously__block_invoke_cold_1(&v25, v26);
          }

          int v11 = 1;
          break;
        case -8:
          uint64_t v22 = os_log_create("com.apple.camera", "Nebula");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
            __65__CAMTimelapseStabilizationMovieWriter__writeMovieAsynchronously__block_invoke_cold_3();
          }

          [*(id *)(a1 + 32) _finishMovieWithFailure];
          goto LABEL_47;
        case -7:
          __int16 v21 = os_log_create("com.apple.camera", "Nebula");
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
            __65__CAMTimelapseStabilizationMovieWriter__writeMovieAsynchronously__block_invoke_cold_2();
          }

          [*(id *)(a1 + 32) _finishMovieWithRestartUnstabilized];
LABEL_47:
          _Block_object_dispose(&v32, 8);
          return;
        default:
          int v11 = 0;
          break;
      }
      uint64_t v13 = [*(id *)(a1 + 32) _frameLoadMode];
      if (v13 == 2)
      {
        [*(id *)(a1 + 32) _requestNextFrameReadDecode];
      }
      else if (v13 == 1)
      {
        char v14 = *(void **)(a1 + 32);
        if (!v14[16]) {
          [v14 _requestNextFrameReadDecode];
        }
      }
      _Block_object_dispose(&v32, 8);
      uint64_t v3 = *(void *)(a1 + 32);
      if (*(unsigned char *)(v3 + 8)) {
        char v15 = 1;
      }
      else {
        char v15 = v11;
      }
      if (v15)
      {
        if (v11)
        {
          v24[0] = MEMORY[0x263EF8330];
          v24[1] = 3221225472;
          v24[2] = __65__CAMTimelapseStabilizationMovieWriter__writeMovieAsynchronously__block_invoke_28;
          v24[3] = &unk_263FA51C0;
          v24[4] = v3;
          [(id)v3 _finishMovieWithCompletionHandler:v24];
        }
        return;
      }
    }
    int v6 = [v4 _copySourcePixelBufferForNextFrame:&cf skipBadFrames:1];
    if (v6) {
      goto LABEL_19;
    }
LABEL_15:
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__CAMTimelapseStabilizationMovieWriter__writeMovieAsynchronously__block_invoke_27;
    block[3] = &unk_263FA2C30;
    uint64_t v8 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    long long v28 = *(_OWORD *)(a1 + 32);
    v29 = &v32;
    dispatch_sync(v8, block);
    if (!*((unsigned char *)v33 + 24))
    {
      uint64_t v9 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __65__CAMTimelapseStabilizationMovieWriter__writeMovieAsynchronously__block_invoke_cold_4();
      }

      [*(id *)(a1 + 32) _appendPixelBufferToMovie:cf];
    }
    goto LABEL_19;
  }
}

void __65__CAMTimelapseStabilizationMovieWriter__writeMovieAsynchronously__block_invoke_27(void *a1)
{
  uint64_t v2 = *(void **)(a1[4] + 200);
  uint64_t v3 = [NSNumber numberWithInteger:*(void *)(*(void *)(a1[5] + 8) + 24)];
  LODWORD(v2) = [v2 containsObject:v3];

  if (v2)
  {
    CFIndex v4 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __65__CAMTimelapseStabilizationMovieWriter__writeMovieAsynchronously__block_invoke_27_cold_1();
    }

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

void __65__CAMTimelapseStabilizationMovieWriter__writeMovieAsynchronously__block_invoke_28(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    CMTimeValue v8 = *(void *)(v7 + 160);
    uint64_t v9 = [*(id *)(v7 + 136) outputURL];
    LODWORD(buf.value) = 134218242;
    *(CMTimeValue *)((char *)&buf.value + 4) = v8;
    LOWORD(buf.flags) = 2114;
    *(void *)((char *)&buf.flags + 2) = v9;
    _os_log_impl(&dword_2099F8000, v6, OS_LOG_TYPE_DEFAULT, "Movie write of %ld frame(s) is complete: %{public}@", (uint8_t *)&buf, 0x16u);
  }
  uint64_t v10 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 240));
  memset(&buf, 0, sizeof(buf));
  if (a2) {
    CMTimeMake(&buf, *(void *)(*(void *)(a1 + 32) + 160), *(_DWORD *)(*(void *)(a1 + 32) + 120));
  }
  else {
    CMTime buf = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
  }
  [*(id *)(a1 + 32) _reset];
  if (v10)
  {
    int v11 = (void (*)(void *, uint64_t, CMTime *, id))v10[2];
    CMTime v12 = buf;
    v11(v10, a2, &v12, v5);
  }
}

- (int)_copyNextSampleBufferFromStabilizer:(opaqueCMSampleBuffer *)a3
{
  unint64_t v5 = 0;
  int v6 = 0;
  uint64_t v32 = *MEMORY[0x263EF8340];
  *(void *)&long long v3 = 134217984;
  long long v22 = v3;
  while (1)
  {
    uint64_t v7 = (opaqueCMSampleBuffer *)v5;
    if (v5)
    {
LABEL_16:
      *a3 = v7;
      return v6;
    }
    stabilizer = self->__stabilizer;
    id v29 = 0;
    unint64_t v5 = [(AVOfflineVideoStabilizer *)stabilizer copyStabilizedSampleBuffer:&v29];
    id v9 = v29;
    if (!(v5 | (unint64_t)v9)) {
      break;
    }
    os_log_t v10 = (os_log_t)v9;
    if (!v5 && [v9 code] == -11822)
    {
      uint64_t v25 = 0;
      v26 = &v25;
      uint64_t v27 = 0x2020000000;
      char v28 = 0;
      int64_t v11 = self->__nextMetadataFrameIndex - 1;
      CMTime v12 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)CMTime buf = v22;
        int64_t v31 = v11;
        _os_log_debug_impl(&dword_2099F8000, v12, OS_LOG_TYPE_DEBUG, "Stabilizer rejected metadata for frame %ld", buf, 0xCu);
      }

      syncQueue = self->__syncQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __76__CAMTimelapseStabilizationMovieWriter__copyNextSampleBufferFromStabilizer___block_invoke;
      block[3] = &unk_263FA51E8;
      block[5] = &v25;
      block[6] = v11;
      void block[4] = self;
      dispatch_sync(syncQueue, block);
      int v14 = *((unsigned __int8 *)v26 + 24);
      if (*((unsigned char *)v26 + 24))
      {
        char v15 = os_log_create("com.apple.camera", "Nebula");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          int64_t badMetadataErrorThreshold = self->__badMetadataErrorThreshold;
          *(_DWORD *)CMTime buf = v22;
          int64_t v31 = badMetadataErrorThreshold;
          _os_log_error_impl(&dword_2099F8000, v15, OS_LOG_TYPE_ERROR, "Encountered %ld frames bad metadata; aborting...",
            buf,
            0xCu);
        }

        int v6 = -7;
      }
      _Block_object_dispose(&v25, 8);
      if (v14) {
        goto LABEL_16;
      }
      os_log_t v10 = 0;
    }
    if (v10)
    {
      uint64_t v20 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[CAMTimelapseStabilizationMovieWriter _copyNextSampleBufferFromStabilizer:]();
      }

      *a3 = (opaqueCMSampleBuffer *)v5;
      int v6 = -7;
LABEL_21:

      return v6;
    }
  }
  *a3 = 0;
  unint64_t nextSourceFrameIndex = self->__nextSourceFrameIndex;
  p_unint64_t nextSourceFrameIndex = &self->__nextSourceFrameIndex;
  if (nextSourceFrameIndex < objc_msgSend((id)*(p_nextSourceFrameIndex - 19), "count", v22))
  {
    os_log_t v10 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CAMTimelapseStabilizationMovieWriter _copyNextSampleBufferFromStabilizer:]((uint64_t)p_nextSourceFrameIndex, (id *)p_nextSourceFrameIndex - 19);
    }
    int v6 = -8;
    goto LABEL_21;
  }
  return -3;
}

unint64_t __76__CAMTimelapseStabilizationMovieWriter__copyNextSampleBufferFromStabilizer___block_invoke(void *a1)
{
  uint64_t v2 = *(void **)(a1[4] + 208);
  long long v3 = [NSNumber numberWithInteger:a1[6]];
  [v2 addObject:v3];

  unint64_t result = [*(id *)(a1[4] + 208) count];
  if (result > *(void *)(a1[4] + 216)) {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  }
  return result;
}

- (void)_requestNextFrameReadDecode
{
  syncQueue = self->__syncQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__CAMTimelapseStabilizationMovieWriter__requestNextFrameReadDecode__block_invoke;
  block[3] = &unk_263FA0208;
  void block[4] = self;
  dispatch_sync(syncQueue, block);
}

intptr_t __67__CAMTimelapseStabilizationMovieWriter__requestNextFrameReadDecode__block_invoke(intptr_t result)
{
  if (!*(void *)(*(void *)(result + 32) + 192))
  {
    intptr_t v1 = result;
    uint64_t v2 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __67__CAMTimelapseStabilizationMovieWriter__requestNextFrameReadDecode__block_invoke_cold_1();
    }

    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(v1 + 32) + 80));
  }
  return result;
}

- (int)_copySourcePixelBufferForNextFrame:(__CVBuffer *)a3 skipBadFrames:(BOOL)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  int v28 = 0;
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x2020000000;
  stashedSourceFrame = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0;
  if (a3)
  {
    if (self->__stashedSourceFrame)
    {
      stashedSourceFrame = self->__stashedSourceFrame;
      self->__stashedSourceFrame = 0;
    }
    else
    {
      do
      {
        uint64_t v7 = v26;
        if (*((_DWORD *)v26 + 6)) {
          break;
        }
        frameFilePaths = self->__frameFilePaths;
        if (!frameFilePaths) {
          goto LABEL_20;
        }
        unint64_t nextSourceFrameIndex = self->__nextSourceFrameIndex;
        if (nextSourceFrameIndex >= [(NSArray *)frameFilePaths count]) {
          goto LABEL_19;
        }
        syncQueue = self->__syncQueue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __89__CAMTimelapseStabilizationMovieWriter__copySourcePixelBufferForNextFrame_skipBadFrames___block_invoke;
        block[3] = &unk_263FA5210;
        void block[4] = self;
        void block[5] = v20;
        BOOL v19 = a4;
        block[6] = &v25;
        void block[7] = &v21;
        dispatch_sync(syncQueue, block);
        int64_t v11 = self->__frameFilePaths;
        if (!v11 || (unint64_t v12 = self->__nextSourceFrameIndex, v12 >= [(NSArray *)v11 count]))
        {
LABEL_19:
          uint64_t v7 = v26;
LABEL_20:
          *((_DWORD *)v7 + 6) = -3;
          break;
        }
        if (!v22[3] && ![(CAMTimelapseStabilizationMovieWriter *)self _frameLoadMode]) {
          [(CAMTimelapseStabilizationMovieWriter *)self _requestNextFrameReadDecode];
        }
        if (!v22[3] && !*((_DWORD *)v26 + 6))
        {
          uint64_t v13 = os_log_create("com.apple.camera", "Nebula");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            int64_t v14 = self->__nextSourceFrameIndex;
            *(_DWORD *)CMTime buf = 134217984;
            int64_t v30 = v14;
            _os_log_debug_impl(&dword_2099F8000, v13, OS_LOG_TYPE_DEBUG, "Waiting for frame %ld to be decoded...", buf, 0xCu);
          }

          dispatch_semaphore_wait((dispatch_semaphore_t)self->__semFrameGetter, 0xFFFFFFFFFFFFFFFFLL);
        }
      }
      while (!v22[3]);
    }
    char v15 = (__CVBuffer *)v22[3];
    if (v15)
    {
      ++self->__nextSourceFrameIndex;
      *a3 = v15;
    }
  }
  else
  {
    int v28 = -1;
  }
  int v16 = *((_DWORD *)v26 + 6);
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  return v16;
}

void __89__CAMTimelapseStabilizationMovieWriter__copySourcePixelBufferForNextFrame_skipBadFrames___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  if (CFArrayGetCount(*(CFArrayRef *)(*(void *)(a1 + 32) + 88)) < 1) {
    return;
  }
  long long v3 = (uint64_t *)(a1 + 40);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(void *)(a1 + 32) + 88), 0);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(v4 + 8);
  uint64_t v6 = *(void *)(v5 + 24);
  if (!v6)
  {
LABEL_7:
    uint64_t v7 = *(void *)(*(void *)(v4 + 8) + 24);
    if (*(unsigned char *)(a1 + 64))
    {
      if (!v7) {
        goto LABEL_22;
      }
      if (*(unsigned char *)(v7 + 16))
      {
LABEL_16:
        int64_t v11 = os_log_create("com.apple.camera", "Nebula");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          __89__CAMTimelapseStabilizationMovieWriter__copySourcePixelBufferForNextFrame_skipBadFrames___block_invoke_cold_4();
        }

        CFArrayRemoveValueAtIndex(*((CFMutableArrayRef *)*v2 + 11), 0);
        CVPixelBufferRelease(*(CVPixelBufferRef *)(*(void *)(*(void *)(*v3 + 8) + 24) + 8));
        free(*(void **)(*(void *)(*v3 + 8) + 24));
        *(void *)(*(void *)(*v3 + 8) + 24) = 0;
        ++*((void *)*v2 + 21);
        if ([*v2 _frameLoadMode])
        {
          unint64_t v12 = os_log_create("com.apple.camera", "Nebula");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
            __89__CAMTimelapseStabilizationMovieWriter__copySourcePixelBufferForNextFrame_skipBadFrames___block_invoke_cold_3();
          }

          dispatch_semaphore_signal(*((dispatch_semaphore_t *)*v2 + 10));
        }
        goto LABEL_22;
      }
    }
    else if (!v7)
    {
      goto LABEL_22;
    }
    id v9 = (void *)*((void *)*v2 + 26);
    os_log_t v10 = [NSNumber numberWithInteger:*(void *)v7];
    LODWORD(v9) = [v9 containsObject:v10];

    if (v9) {
      goto LABEL_16;
    }
LABEL_22:
    if (*(void *)(*(void *)(*v3 + 8) + 24))
    {
      CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(*(void *)(a1 + 32) + 88), 0);
      uint64_t v13 = a1 + 56;
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(void *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                                          + 24)
                                                                              + 8);
      uint64_t v14 = *(void *)(a1 + 40);
      if (!*(unsigned char *)(a1 + 64) && *(unsigned char *)(*(void *)(*(void *)(v14 + 8) + 24) + 16))
      {
        char v15 = os_log_create("com.apple.camera", "Nebula");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          __89__CAMTimelapseStabilizationMovieWriter__copySourcePixelBufferForNextFrame_skipBadFrames___block_invoke_cold_2();
        }

        *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = -5;
        uint64_t v14 = *(void *)(a1 + 40);
      }
      free(*(void **)(*(void *)(v14 + 8) + 24));
      *(void *)(*(void *)(*v3 + 8) + 24) = 0;
      int v16 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        __89__CAMTimelapseStabilizationMovieWriter__copySourcePixelBufferForNextFrame_skipBadFrames___block_invoke_cold_1((uint64_t)v2, v13);
      }
    }
    return;
  }
  if (*(void *)v6 == *((void *)*v2 + 21))
  {
    if (!*(void *)(v6 + 8) && !*(unsigned char *)(v6 + 16))
    {
      *(void *)(v5 + 24) = 0;
      uint64_t v4 = *v3;
    }
    goto LABEL_7;
  }
  CMTimeValue v8 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    __89__CAMTimelapseStabilizationMovieWriter__copySourcePixelBufferForNextFrame_skipBadFrames___block_invoke_cold_5();
  }

  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = -3;
}

+ (CGSize)_desiredOutputSizeForSourcePixelBuffer:(__CVBuffer *)a3
{
  double Width = (double)CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  double v6 = (double)Height;
  if ((double)Height <= Width) {
    double v7 = (double)Height;
  }
  else {
    double v7 = Width;
  }
  if ((double)Height <= Width) {
    double v8 = Width;
  }
  else {
    double v8 = (double)Height;
  }
  BOOL v9 = fabs(v8 / v7 + -1.77777778) < 0.05;
  double v10 = *(double *)(MEMORY[0x263F001B0] + 8);
  double v11 = *MEMORY[0x263F001B0];
  if (v9)
  {
    double v11 = 1920.0;
    if (v8 >= 1920.0)
    {
      double v10 = 1080.0;
    }
    else
    {
      double v11 = 1280.0;
      if (v8 >= 1280.0)
      {
        double v10 = 720.0;
      }
      else
      {
        double v10 = *(double *)(MEMORY[0x263F001B0] + 8);
        double v11 = *MEMORY[0x263F001B0];
        if (v8 >= 960.0)
        {
          double v11 = 960.0;
          double v10 = 540.0;
        }
      }
    }
  }
  BOOL v12 = v11 == *MEMORY[0x263F001B0];
  BOOL v13 = v10 == *(double *)(MEMORY[0x263F001B0] + 8);
  if (v12 && v13) {
    double v14 = 480.0;
  }
  else {
    double v14 = v10;
  }
  if (v12 && v13) {
    double v11 = 640.0;
  }
  if (v6 <= Width) {
    double v15 = v14;
  }
  else {
    double v15 = v11;
  }
  if (v6 <= Width) {
    double v16 = v11;
  }
  else {
    double v16 = v14;
  }
  result.height = v15;
  result.width = v16;
  return result;
}

- (int)_startWritingWithOutputPath:(id)a3 width:(int64_t)a4 height:(int64_t)a5 videoFormatDescription:(opaqueCMFormatDescription *)a6 transform:(CGAffineTransform *)a7 framesPerSecond:(int64_t)a8 frameCount:(int64_t)a9 preferHEVC:(BOOL)a10 visMetadataCount:(int64_t)a11 videoMetadata:(id)a12
{
  v56[3] = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v49 = a12;
  CFTypeRef v18 = [NSURL fileURLWithPath:v17];
  id v19 = objc_alloc(MEMORY[0x263EFA518]);
  uint64_t v20 = *MEMORY[0x263EF9898];
  id v54 = 0;
  uint64_t v21 = (AVAssetWriter *)[v19 initWithURL:v18 fileType:v20 error:&v54];
  id v22 = v54;
  p_writer = &self->__writer;
  writer = self->__writer;
  self->__writer = v21;

  if (!self->__writer || v22)
  {
    int64_t v46 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      -[CAMTimelapseStabilizationMovieWriter _startWritingWithOutputPath:width:height:videoFormatDescription:transform:framesPerSecond:frameCount:preferHEVC:visMetadataCount:videoMetadata:].cold.4(v22);
    }
    goto LABEL_20;
  }
  v47 = v18;
  id v25 = v17;
  [(AVAssetWriter *)self->__writer setMetadata:v49];
  v26 = +[CAMTimelapseSettings sharedInstance];
  uint64_t v27 = [v26 outputSettingsForWidth:a4 height:a5 videoFormatDescription:a6 framesPerSecond:a8 frameCount:a9 useHEVC:a10];

  int v28 = [MEMORY[0x263EFA520] assetWriterInputWithMediaType:*MEMORY[0x263EF9D48] outputSettings:v27];
  long long v29 = *(_OWORD *)&a7->c;
  *(_OWORD *)OSStatus v52 = *(_OWORD *)&a7->a;
  *(_OWORD *)&v52[16] = v29;
  long long v53 = *(_OWORD *)&a7->tx;
  [v28 setTransform:v52];
  [(CAMTimelapseStabilizationMovieWriter *)self _setMetadataOnVideoTrackAssetWriterInput:v28];
  uint64_t v30 = *MEMORY[0x263F04180];
  v56[0] = &unk_26BDDE9A0;
  uint64_t v31 = *MEMORY[0x263F04240];
  v55[0] = v30;
  v55[1] = v31;
  uint64_t v32 = [NSNumber numberWithInteger:a4];
  v56[1] = v32;
  v55[2] = *MEMORY[0x263F04118];
  v33 = [NSNumber numberWithInteger:a5];
  v56[2] = v33;
  uint64_t v34 = [NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:3];

  char v35 = [MEMORY[0x263EFA530] assetWriterInputPixelBufferAdaptorWithAssetWriterInput:v28 sourcePixelBufferAttributes:v34];
  BOOL v36 = [(AVAssetWriter *)self->__writer canAddInput:v28];
  if (v36)
  {
    [(AVAssetWriter *)self->__writer addInput:v28];
    objc_storeStrong((id *)&self->__videoInput, v28);
    CFTypeRef v37 = v35;
    pixelBufferAdaptor = self->__pixelBufferAdaptor;
    self->__pixelBufferAdaptor = v37;
  }
  else
  {
    pixelBufferAdaptor = (AVAssetWriterInputPixelBufferAdaptor *)os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(&pixelBufferAdaptor->super, OS_LOG_TYPE_ERROR)) {
      -[CAMTimelapseStabilizationMovieWriter _startWritingWithOutputPath:width:height:videoFormatDescription:transform:framesPerSecond:frameCount:preferHEVC:visMetadataCount:videoMetadata:]();
    }
  }
  id v17 = v25;

  if (!v36)
  {
    int v44 = -6;
    id v22 = 0;
    CFTypeRef v18 = v47;
    goto LABEL_11;
  }
  id v22 = 0;
  if (![(AVAssetWriter *)*p_writer startWriting])
  {
    int64_t v46 = os_log_create("com.apple.camera", "Nebula");
    CFTypeRef v18 = v47;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      -[CAMTimelapseStabilizationMovieWriter _startWritingWithOutputPath:width:height:videoFormatDescription:transform:framesPerSecond:frameCount:preferHEVC:visMetadataCount:videoMetadata:]((uint64_t)v17, (id *)&self->__writer);
    }
    goto LABEL_20;
  }
  IOSurfaceID v39 = *p_writer;
  *(_OWORD *)OSStatus v52 = *MEMORY[0x263F010E0];
  *(void *)&v52[16] = *(void *)(MEMORY[0x263F010E0] + 16);
  [(AVAssetWriter *)v39 startSessionAtSourceTime:v52];
  CFTypeRef v18 = v47;
  if (a11 >= 1)
  {
    memset(v52, 0, 24);
    CMTimeMake((CMTime *)v52, 1, a8);
    uint64_t v40 = [(AVAssetWriterInputPixelBufferAdaptor *)self->__pixelBufferAdaptor pixelBufferPool];
    id v41 = objc_alloc(MEMORY[0x263EFA7B0]);
    long long v50 = *(_OWORD *)v52;
    uint64_t v51 = *(void *)&v52[16];
    v42 = (AVOfflineVideoStabilizer *)[v41 initWithTargetFrameDuration:&v50 dataProvider:self destinationBufferPool:v40 stabilizationEnabled:1];
    stabilizer = self->__stabilizer;
    self->__stabilizer = v42;

    if (!self->__stabilizer)
    {
      int64_t v46 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        -[CAMTimelapseStabilizationMovieWriter _startWritingWithOutputPath:width:height:videoFormatDescription:transform:framesPerSecond:frameCount:preferHEVC:visMetadataCount:videoMetadata:]();
      }
LABEL_20:

      int v44 = -6;
      goto LABEL_11;
    }
  }
  int v44 = 0;
LABEL_11:

  return v44;
}

- (void)_setMetadataOnVideoTrackAssetWriterInput:(id)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263F5DB10] metadataItemForTimelapse];
  uint64_t v5 = (void *)v4;
  if (v4)
  {
    v7[0] = v4;
    double v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
    [v3 setMetadata:v6];
  }
}

- (BOOL)_appendPixelBufferToMovie:(__CVBuffer *)a3
{
  if (a3)
  {
    memset(&v10, 0, sizeof(v10));
    CMTimeMake(&v10, self->__frameCountWrittenToMovie, self->__movieFramesPerSecond);
    pixelBufferAdaptor = self->__pixelBufferAdaptor;
    CMTime v9 = v10;
    if ([(AVAssetWriterInputPixelBufferAdaptor *)pixelBufferAdaptor appendPixelBuffer:a3 withPresentationTime:&v9])
    {
      p_writer = &self->__writer;
      if ([(AVAssetWriter *)self->__writer status] != AVAssetWriterStatusFailed)
      {
        ++self->__frameCountWrittenToMovie;
        return 1;
      }
      double v8 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[CAMTimelapseStabilizationMovieWriter _appendPixelBufferToMovie:]((id *)p_writer);
      }
    }
    else
    {
      double v8 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[CAMTimelapseStabilizationMovieWriter _appendPixelBufferToMovie:]();
      }
    }
  }
  else
  {
    double v8 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CAMTimelapseStabilizationMovieWriter _appendPixelBufferToMovie:]();
    }
  }

  return 0;
}

- (void)_finishMovieWithRestartUnstabilized
{
}

uint64_t __75__CAMTimelapseStabilizationMovieWriter__finishMovieWithRestartUnstabilized__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _restartUnstabilized];
}

- (void)_finishMovieWithFailure
{
}

void __63__CAMTimelapseStabilizationMovieWriter__finishMovieWithFailure__block_invoke(uint64_t a1)
{
  uint64_t v2 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 240));
  [*(id *)(a1 + 32) _reset];
  if (v2)
  {
    id v3 = (void (*)(void *, void, long long *, void))v2[2];
    long long v4 = *MEMORY[0x263F010E0];
    uint64_t v5 = *(void *)(MEMORY[0x263F010E0] + 16);
    v3(v2, 0, &v4, 0);
  }
}

- (void)_finishMovieWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(AVAssetWriterInput *)self->__videoInput markAsFinished];
  uint64_t v5 = [(AVAssetWriter *)self->__writer metadata];
  writer = self->__writer;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __74__CAMTimelapseStabilizationMovieWriter__finishMovieWithCompletionHandler___block_invoke;
  v9[3] = &unk_263FA5238;
  id v10 = v5;
  id v11 = v4;
  uint8_t v9[4] = self;
  id v7 = v5;
  id v8 = v4;
  [(AVAssetWriter *)writer finishWritingWithCompletionHandler:v9];
}

uint64_t __74__CAMTimelapseStabilizationMovieWriter__finishMovieWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 136) status];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (__CVBuffer)copySourcePixelBufferForFrameNumber:(int64_t)a3 outputSampleTime:(id *)a4 stabilizer:(id)a5
{
  id v17 = 0;
  id v8 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CAMTimelapseStabilizationMovieWriter copySourcePixelBufferForFrameNumber:outputSampleTime:stabilizer:].cold.4();
  }

  unint64_t nextSourceFrameIndex = self->__nextSourceFrameIndex;
  if (nextSourceFrameIndex >= [(NSArray *)self->__frameFilePaths count])
  {
    BOOL v13 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[CAMTimelapseStabilizationMovieWriter copySourcePixelBufferForFrameNumber:outputSampleTime:stabilizer:](&self->__nextSourceFrameIndex, (id *)&self->__frameFilePaths, v13);
    }
  }
  else
  {
    int v10 = [(CAMTimelapseStabilizationMovieWriter *)self _copySourcePixelBufferForNextFrame:&v17 skipBadFrames:0];
    if (v17)
    {
      if (v10 == -5)
      {
        syncQueue = self->__syncQueue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __104__CAMTimelapseStabilizationMovieWriter_copySourcePixelBufferForFrameNumber_outputSampleTime_stabilizer___block_invoke;
        block[3] = &unk_263FA04E0;
        void block[4] = self;
        void block[5] = a3;
        dispatch_sync(syncQueue, block);
      }
      unint64_t v12 = [(CAMTimelapseStabilizationMovieWriter *)self _frameLoadMode];
      if (v12 == 1
        || v12 == 2
        && a3 + 1 < (int)[(AVOfflineVideoStabilizer *)self->__stabilizer preferredSourcePixelBufferPrimingFrameCount])
      {
        [(CAMTimelapseStabilizationMovieWriter *)self _requestNextFrameReadDecode];
      }
      if (a4)
      {
        CMTimeMake(&v15, a3, self->__movieFramesPerSecond);
        *(CMTime *)a4 = v15;
      }
      BOOL v13 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[CAMTimelapseStabilizationMovieWriter copySourcePixelBufferForFrameNumber:outputSampleTime:stabilizer:]();
      }
    }
    else
    {
      BOOL v13 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[CAMTimelapseStabilizationMovieWriter copySourcePixelBufferForFrameNumber:outputSampleTime:stabilizer:]();
      }
    }
  }

  return v17;
}

void __104__CAMTimelapseStabilizationMovieWriter_copySourcePixelBufferForFrameNumber_outputSampleTime_stabilizer___block_invoke(uint64_t a1)
{
  uint64_t v2 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __104__CAMTimelapseStabilizationMovieWriter_copySourcePixelBufferForFrameNumber_outputSampleTime_stabilizer___block_invoke_cold_1();
  }

  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void **)(*(void *)(a1 + 32) + 200);
  uint64_t v5 = [NSNumber numberWithInteger:v3];
  [v4 addObject:v5];
}

- (id)copySourceStabilizationMetadataForFrameNumber:(int64_t)a3 outputSampleTime:(id *)a4 stabilizer:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  unint64_t nextMetadataFrameIndex = self->__nextMetadataFrameIndex;
  if (nextMetadataFrameIndex >= [(NSArray *)self->__visMetadataFilePaths count])
  {
    double v16 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int64_t v26 = self->__nextMetadataFrameIndex;
      NSUInteger v27 = [(NSArray *)self->__visMetadataFilePaths count];
      LODWORD(v32.value) = 134218496;
      *(CMTimeValue *)((char *)&v32.value + 4) = a3;
      LOWORD(v32.flags) = 2048;
      *(void *)((char *)&v32.flags + 2) = v26;
      HIWORD(v32.epoch) = 2048;
      NSUInteger v33 = v27;
      _os_log_debug_impl(&dword_2099F8000, v16, OS_LOG_TYPE_DEBUG, "Stabilizer asking for metadata frame %ld (our %ld), I only have %ld, returning nil (EOD)", (uint8_t *)&v32, 0x20u);
    }
    BOOL v13 = 0;
    int v10 = 0;
    uint64_t v21 = 0;
    CMTime v9 = 0;
    goto LABEL_16;
  }
  CMTime v9 = [(NSArray *)self->__visMetadataFilePaths objectAtIndex:self->__nextMetadataFrameIndex];
  id v31 = 0;
  int v10 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v9 options:0 error:&v31];
  id v11 = v31;
  if (v10) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (!v12)
  {
    uint64_t v21 = v11;
    id v22 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      int64_t v28 = self->__nextMetadataFrameIndex;
      long long v29 = [v9 lastPathComponent];
      LODWORD(v32.value) = 134218498;
      *(CMTimeValue *)((char *)&v32.value + 4) = v28;
      LOWORD(v32.flags) = 2114;
      *(void *)((char *)&v32.flags + 2) = v29;
      HIWORD(v32.epoch) = 2114;
      NSUInteger v33 = (NSUInteger)v21;
      _os_log_error_impl(&dword_2099F8000, v22, OS_LOG_TYPE_ERROR, "Failed to pull frame %ld metadata %{public}@ into memory: %{public}@", (uint8_t *)&v32, 0x20u);
    }
    goto LABEL_32;
  }
  id v30 = 0;
  BOOL v13 = [MEMORY[0x263F08AC0] propertyListWithData:v10 options:0 format:0 error:&v30];
  id v14 = v30;
  if (v13) {
    BOOL v15 = v14 == 0;
  }
  else {
    BOOL v15 = 0;
  }
  if (v15)
  {
    if (a4)
    {
      CMTimeMake(&v32, a3, self->__movieFramesPerSecond);
      uint64_t v21 = 0;
      *(CMTime *)a4 = v32;
    }
    else
    {
      uint64_t v21 = 0;
    }
  }
  else
  {
    uint64_t v21 = v14;
    v24 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[CAMTimelapseStabilizationMovieWriter copySourceStabilizationMetadataForFrameNumber:outputSampleTime:stabilizer:](v9);
    }

    if (!v13)
    {
LABEL_32:
      BOOL v13 = [NSDictionary dictionary];
      if (!v13) {
        goto LABEL_17;
      }
    }
  }
  double v16 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    if (v9)
    {
      id v19 = [v9 lastPathComponent];
    }
    else
    {
      id v19 = @"<invalid>";
    }
    int64_t v20 = self->__nextMetadataFrameIndex;
    LODWORD(v32.value) = 138543874;
    *(CMTimeValue *)((char *)&v32.value + 4) = (CMTimeValue)v19;
    LOWORD(v32.flags) = 2048;
    *(void *)((char *)&v32.flags + 2) = a3;
    HIWORD(v32.epoch) = 2048;
    NSUInteger v33 = v20;
    _os_log_debug_impl(&dword_2099F8000, v16, OS_LOG_TYPE_DEBUG, "Returning %{public}@ for metadata frame %ld (our %ld)", (uint8_t *)&v32, 0x20u);
    if (v9) {
  }
    }
LABEL_16:

LABEL_17:
  ++self->__nextMetadataFrameIndex;
  id v17 = v13;

  return v17;
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (NSArray)_frameFilePaths
{
  return self->__frameFilePaths;
}

- (NSArray)_visMetadataFilePaths
{
  return self->__visMetadataFilePaths;
}

- (OS_dispatch_queue)_movieWritingQueue
{
  return self->__movieWritingQueue;
}

- (OS_dispatch_queue)_syncQueue
{
  return self->__syncQueue;
}

- (OS_dispatch_queue)_readingQueue
{
  return self->__readingQueue;
}

- (OS_dispatch_queue)_decodeQueue
{
  return self->__decodeQueue;
}

- (OS_dispatch_queue)_pixelTransferQueue
{
  return self->__pixelTransferQueue;
}

- (OS_dispatch_semaphore)_semFrameGetter
{
  return self->__semFrameGetter;
}

- (OS_dispatch_semaphore)_semFileReader
{
  return self->__semFileReader;
}

- (__CFArray)_frameList
{
  return self->__frameList;
}

- (NSDate)_movieCreationDate
{
  return self->__movieCreationDate;
}

- (CLLocation)_movieCreationLocation
{
  return self->__movieCreationLocation;
}

- (NSString)_movieOutputPath
{
  return self->__movieOutputPath;
}

- (CGAffineTransform)_movieTransform
{
  long long v3 = *(_OWORD *)&self[5].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[5].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[6].a;
  return self;
}

- (int64_t)_movieFramesPerSecond
{
  return self->__movieFramesPerSecond;
}

- (BOOL)_preferHEVC
{
  return self->__preferHEVC;
}

- (AVOfflineVideoStabilizer)_stabilizer
{
  return self->__stabilizer;
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

- (int64_t)_frameCountWrittenToMovie
{
  return self->__frameCountWrittenToMovie;
}

- (int64_t)_nextSourceFrameIndex
{
  return self->__nextSourceFrameIndex;
}

- (int64_t)_nextMetadataFrameIndex
{
  return self->__nextMetadataFrameIndex;
}

- (int64_t)_firstFrameIndex
{
  return self->__firstFrameIndex;
}

- (__CVBuffer)_stashedSourceFrame
{
  return self->__stashedSourceFrame;
}

- (NSMutableSet)_badFrameSet
{
  return self->__badFrameSet;
}

- (NSMutableSet)_badMetadataSet
{
  return self->__badMetadataSet;
}

- (int64_t)_badMetadataErrorThreshold
{
  return self->__badMetadataErrorThreshold;
}

- (OpaqueVTPixelTransferSession)_pixelTransferSession
{
  return self->__pixelTransferSession;
}

- (unint64_t)_frameLoadMode
{
  return self->__frameLoadMode;
}

- (id)_completion
{
  return self->__completion;
}

- (void)_powerAssertion
{
  return self->__powerAssertion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__completion, 0);
  objc_storeStrong((id *)&self->__badMetadataSet, 0);
  objc_storeStrong((id *)&self->__badFrameSet, 0);
  objc_storeStrong((id *)&self->__pixelBufferAdaptor, 0);
  objc_storeStrong((id *)&self->__videoInput, 0);
  objc_storeStrong((id *)&self->__writer, 0);
  objc_storeStrong((id *)&self->__stabilizer, 0);
  objc_storeStrong((id *)&self->__movieOutputPath, 0);
  objc_storeStrong((id *)&self->__movieCreationLocation, 0);
  objc_storeStrong((id *)&self->__movieCreationDate, 0);
  objc_storeStrong((id *)&self->__semFileReader, 0);
  objc_storeStrong((id *)&self->__semFrameGetter, 0);
  objc_storeStrong((id *)&self->__pixelTransferQueue, 0);
  objc_storeStrong((id *)&self->__decodeQueue, 0);
  objc_storeStrong((id *)&self->__readingQueue, 0);
  objc_storeStrong((id *)&self->__syncQueue, 0);
  objc_storeStrong((id *)&self->__movieWritingQueue, 0);
  objc_storeStrong((id *)&self->__visMetadataFilePaths, 0);
  objc_storeStrong((id *)&self->__frameFilePaths, 0);
}

void __48__CAMTimelapseStabilizationMovieWriter__cleanup__block_invoke_13_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4(&dword_2099F8000, v0, v1, "Releasing power assertion...", v2, v3, v4, v5, v6);
}

void __48__CAMTimelapseStabilizationMovieWriter__cleanup__block_invoke_13_cold_2(uint8_t *a1, CVPixelBufferRef *a2, IOSurfaceID *a3, NSObject *a4)
{
  IOSurface = CVPixelBufferGetIOSurface(*a2);
  IOSurfaceID ID = IOSurfaceGetID(IOSurface);
  *(_DWORD *)a1 = 67109120;
  *a3 = ID;
  _os_log_debug_impl(&dword_2099F8000, a4, OS_LOG_TYPE_DEBUG, "Releasing IOSurface: 0x%x", a1, 8u);
}

- (void)setSuspended:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4(&dword_2099F8000, v0, v1, "Suspending movie writer...", v2, v3, v4, v5, v6);
}

- (void)setSuspended:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4(&dword_2099F8000, v0, v1, "Resuming movie writer...", v2, v3, v4, v5, v6);
}

- (void)writeMovieFromImageFiles:(int)a1 visMetadataFiles:(NSObject *)a2 startDate:location:outputPath:transform:framesPerSecond:preferHEVC:completionHandler:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "Movie write failed with error: %d", (uint8_t *)v2, 8u);
}

- (void)writeMovieFromImageFiles:visMetadataFiles:startDate:location:outputPath:transform:framesPerSecond:preferHEVC:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2099F8000, v0, v1, "Failed to create pixel transfer queue for frame cropping", v2, v3, v4, v5, v6);
}

- (void)writeMovieFromImageFiles:(CGFloat)a3 visMetadataFiles:(CGFloat)a4 startDate:location:outputPath:transform:framesPerSecond:preferHEVC:completionHandler:.cold.3(double a1, double a2, CGFloat a3, CGFloat a4)
{
  uint8_t v6 = NSStringFromCGSize(*(CGSize *)&a1);
  v15.width = a3;
  v15.height = a4;
  id v7 = NSStringFromCGSize(v15);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_17(&dword_2099F8000, v8, v9, "Source size %{public}@ is mismatched to movie size %{public}@: we will crop.", v10, v11, v12, v13, v14);
}

- (void)writeMovieFromImageFiles:visMetadataFiles:startDate:location:outputPath:transform:framesPerSecond:preferHEVC:completionHandler:.cold.4()
{
  OUTLINED_FUNCTION_14(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_1(&dword_2099F8000, v0, v1, "Will tolerate up to %ld frame(s) with bad metadata before unstabilized fallback.", v2, v3, v4, v5, v6);
}

- (void)_cropPixelBufferIfNeeded:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2099F8000, v0, v1, "Movie writer has no pixel buffer pool that we can use for cropping", v2, v3, v4, v5, v6);
}

- (void)_decodeFirstFrameAgain
{
  OUTLINED_FUNCTION_14(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_0(&dword_2099F8000, v0, v1, "Failed to re-decode first frame %ld", v2, v3, v4, v5, v6);
}

void __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4(&dword_2099F8000, v0, v1, "File reader finishing...", v2, v3, v4, v5, v6);
}

void __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2099F8000, v0, v1, "Bailing out because there are no frame file paths.", v2, v3, v4, v5, v6);
}

void __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_cold_3(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_4_0(a1, a2);
  _os_log_error_impl(&dword_2099F8000, v2, OS_LOG_TYPE_ERROR, "Bailing out because we've been reset.", v3, 2u);
}

void __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_cold_4(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_4_0(a1, a2);
  _os_log_error_impl(&dword_2099F8000, v2, OS_LOG_TYPE_ERROR, "Failed to allocate a frameList node; bailing out.",
    v3,
    2u);
}

void __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_cold_5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_1(&dword_2099F8000, v0, v1, "Read all %ld frames!", v2, v3, v4, v5, v6);
}

void __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_cold_6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_1(&dword_2099F8000, v0, v1, "Starting file reader for %ld frames...", v2, v3, v4, v5, v6);
}

void __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_21_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4(&dword_2099F8000, v0, v1, "Creating power assertion to keep hardware awake for movie write...", v2, v3, v4, v5, v6);
}

void __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_25_cold_1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_1(&dword_2099F8000, v0, v1, "Using first-frame as placeholder for frame %ld", v2, v3, v4, v5, v6);
}

void __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_25_cold_2(uint64_t a1)
{
  [*(id *)(a1 + 32) length];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_17(&dword_2099F8000, v1, v2, "Decoding frame %ld from JPEG: %ld bytes", v3, v4, v5, v6, v7);
}

void __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_26_cold_1(uint64_t a1, CVPixelBufferRef *a2)
{
  IOSurface = CVPixelBufferGetIOSurface(*a2);
  IOSurfaceGetID(IOSurface);
  OUTLINED_FUNCTION_9(&dword_2099F8000, v3, v4, "Frame %ld available: %p (surface ID 0x%x). Signalling frame getter...", v5, v6, v7, v8, 0);
}

void __65__CAMTimelapseStabilizationMovieWriter__writeMovieAsynchronously__block_invoke_cold_1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_4_0(a1, a2);
  OUTLINED_FUNCTION_16(&dword_2099F8000, v2, v3, "No more frames... completing movie.", v4);
}

void __65__CAMTimelapseStabilizationMovieWriter__writeMovieAsynchronously__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4(&dword_2099F8000, v0, v1, "Stabilizer failure! Restarting movie write unstabilized...", v2, v3, v4, v5, v6);
}

void __65__CAMTimelapseStabilizationMovieWriter__writeMovieAsynchronously__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4(&dword_2099F8000, v0, v1, "Stabilizer finished early! Completing with error...", v2, v3, v4, v5, v6);
}

void __65__CAMTimelapseStabilizationMovieWriter__writeMovieAsynchronously__block_invoke_cold_4()
{
  OUTLINED_FUNCTION_15();
  _DWORD *v0 = 134217984;
  *uint64_t v1 = v2;
  _os_log_debug_impl(&dword_2099F8000, v4, OS_LOG_TYPE_DEBUG, "Sending frame %ld to movie writer...", v3, 0xCu);
}

void __65__CAMTimelapseStabilizationMovieWriter__writeMovieAsynchronously__block_invoke_cold_5()
{
  OUTLINED_FUNCTION_15();
  _DWORD *v0 = 134217984;
  *uint64_t v1 = v2;
  _os_log_debug_impl(&dword_2099F8000, v4, OS_LOG_TYPE_DEBUG, "Requesting movie frame %ld from stabilizer...", v3, 0xCu);
}

void __65__CAMTimelapseStabilizationMovieWriter__writeMovieAsynchronously__block_invoke_27_cold_1()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_1(&dword_2099F8000, v0, v1, "Skipping bad stabilized frame %ld", v2, v3, v4, v5, v6);
}

- (void)_copyNextSampleBufferFromStabilizer:(uint64_t)a1 .cold.1(uint64_t a1, id *a2)
{
  [*a2 count];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_1(&dword_2099F8000, v2, v3, "Stabilizer has finished the sequence early at frame %ld of %ld: declaring failure.", v4, v5, v6, v7, v8);
}

- (void)_copyNextSampleBufferFromStabilizer:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2099F8000, v0, v1, "Stabilizer copyStabilizedSampleBuffer failed — %{public}@", v2, v3, v4, v5, v6);
}

void __67__CAMTimelapseStabilizationMovieWriter__requestNextFrameReadDecode__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4(&dword_2099F8000, v0, v1, "Signaling frame reader for another frame...", v2, v3, v4, v5, v6);
}

void __89__CAMTimelapseStabilizationMovieWriter__copySourcePixelBufferForNextFrame_skipBadFrames___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  IOSurface = CVPixelBufferGetIOSurface(*(CVPixelBufferRef *)(*(void *)(*(void *)a2 + 8) + 24));
  IOSurfaceGetID(IOSurface);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9(&dword_2099F8000, v3, v4, "Dequeued frame %ld: %p (surface ID 0x%x)", v5, v6, v7, v8, v9);
}

void __89__CAMTimelapseStabilizationMovieWriter__copySourcePixelBufferForNextFrame_skipBadFrames___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_14(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_1(&dword_2099F8000, v0, v1, "Dequeued bad frame at index %ld", v2, v3, v4, v5, v6);
}

void __89__CAMTimelapseStabilizationMovieWriter__copySourcePixelBufferForNextFrame_skipBadFrames___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4(&dword_2099F8000, v0, v1, "Signalling file reader for another frame...", v2, v3, v4, v5, v6);
}

void __89__CAMTimelapseStabilizationMovieWriter__copySourcePixelBufferForNextFrame_skipBadFrames___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_13();
  IOSurface = CVPixelBufferGetIOSurface(*(CVPixelBufferRef *)(v0 + 8));
  IOSurfaceGetID(IOSurface);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9(&dword_2099F8000, v2, v3, "Discarding frame %ld: %p (surface ID 0x%x)", v4, v5, v6, v7, v8);
}

void __89__CAMTimelapseStabilizationMovieWriter__copySourcePixelBufferForNextFrame_skipBadFrames___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_0(&dword_2099F8000, v0, v1, "Unepected frame at head of decoded queue: %ld", v2, v3, v4, v5, v6);
}

- (void)_startWritingWithOutputPath:width:height:videoFormatDescription:transform:framesPerSecond:frameCount:preferHEVC:visMetadataCount:videoMetadata:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2099F8000, v0, v1, "Could not create an offline stabilizer for %{public}@", v2, v3, v4, v5, v6);
}

- (void)_startWritingWithOutputPath:(uint64_t)a1 width:(id *)a2 height:videoFormatDescription:transform:framesPerSecond:frameCount:preferHEVC:visMetadataCount:videoMetadata:.cold.2(uint64_t a1, id *a2)
{
  uint64_t v2 = [*a2 error];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_2099F8000, v3, v4, "Could not start asset writer for %{public}@: %{public}@", v5, v6, v7, v8, v9);
}

- (void)_startWritingWithOutputPath:width:height:videoFormatDescription:transform:framesPerSecond:frameCount:preferHEVC:visMetadataCount:videoMetadata:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2099F8000, v0, v1, "Could not add video input for writer", v2, v3, v4, v5, v6);
}

- (void)_startWritingWithOutputPath:(void *)a1 width:height:videoFormatDescription:transform:framesPerSecond:frameCount:preferHEVC:visMetadataCount:videoMetadata:.cold.4(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2099F8000, v2, v3, "Could not create writer with error: %{public}@", v4, v5, v6, v7, v8);
}

- (void)_appendPixelBufferToMovie:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2099F8000, v0, v1, "No pixel buffer supplied.", v2, v3, v4, v5, v6);
}

- (void)_appendPixelBufferToMovie:(id *)a1 .cold.2(id *a1)
{
  uint64_t v1 = [*a1 error];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2099F8000, v2, v3, "Failed to write frame to movie %{public}@", v4, v5, v6, v7, v8);
}

- (void)_appendPixelBufferToMovie:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2099F8000, v0, v1, "Failed to append output frame to pixel buffer adaptor", v2, v3, v4, v5, v6);
}

- (void)copySourcePixelBufferForFrameNumber:outputSampleTime:stabilizer:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2099F8000, v0, v1, "Failed to read frame; returning nil (EOD) to stabilizer.",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)copySourcePixelBufferForFrameNumber:outputSampleTime:stabilizer:.cold.2()
{
  OUTLINED_FUNCTION_14(*MEMORY[0x263EF8340]);
  int v3 = 134218240;
  uint64_t v4 = v0;
  __int16 v5 = 2048;
  uint64_t v6 = v1;
  _os_log_debug_impl(&dword_2099F8000, v2, OS_LOG_TYPE_DEBUG, "Returning frame %ld to stabilizer: %p", (uint8_t *)&v3, 0x16u);
}

- (void)copySourcePixelBufferForFrameNumber:(uint64_t *)a1 outputSampleTime:(id *)a2 stabilizer:(NSObject *)a3 .cold.3(uint64_t *a1, id *a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = *a1;
  int v5 = [*a2 count];
  v6[0] = 67109376;
  v6[1] = v4;
  __int16 v7 = 1024;
  int v8 = v5;
  _os_log_debug_impl(&dword_2099F8000, a3, OS_LOG_TYPE_DEBUG, "Request for frame %d past our maximum %d, returning nil (EOD)", (uint8_t *)v6, 0xEu);
}

- (void)copySourcePixelBufferForFrameNumber:outputSampleTime:stabilizer:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_1(&dword_2099F8000, v0, v1, "Stabilizer requested frame %ld", v2, v3, v4, v5, v6);
}

void __104__CAMTimelapseStabilizationMovieWriter_copySourcePixelBufferForFrameNumber_outputSampleTime_stabilizer___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_1(&dword_2099F8000, v0, v1, "Tracking bad frame, stabilizer index %ld", v2, v3, v4, v5, v6);
}

- (void)copySourceStabilizationMetadataForFrameNumber:(void *)a1 outputSampleTime:stabilizer:.cold.1(void *a1)
{
  uint64_t v1 = [a1 lastPathComponent];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_2099F8000, v2, v3, "Failed to decode metadata file %{public}@ into dictionary: %{public}@", v4, v5, v6, v7, v8);
}

@end