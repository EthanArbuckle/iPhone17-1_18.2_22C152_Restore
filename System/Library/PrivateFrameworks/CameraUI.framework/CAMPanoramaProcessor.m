@interface CAMPanoramaProcessor
- (BOOL)isCapturingPanorama;
- (CAMPanoramaCaptureRequest)request;
- (CAMPanoramaProcessor)initWithDelegate:(id)a3 encodingBehavior:(int64_t)a4;
- (CAMPanoramaProcessorDelegate)delegate;
- (CGSize)previewSize;
- (NSMutableDictionary)_initialMetadataByRequestUUID;
- (OpaqueFigSampleBufferProcessor)_processor;
- (ct_green_tea_logger_s)_greenTeaLogger;
- (int64_t)direction;
- (int64_t)photoEncodingBehavior;
- (void)_setCapturingPanorama:(BOOL)a3;
- (void)_setRequest:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)processPanoramaCaptureWithRequest:(id)a3 completionHandler:(id)a4;
- (void)processSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)setDirection:(int64_t)a3;
- (void)startPanoramaCaptureWithRequest:(id)a3;
- (void)stopPanoramaCapture;
@end

@implementation CAMPanoramaProcessor

- (CAMPanoramaProcessor)initWithDelegate:(id)a3 encodingBehavior:(int64_t)a4
{
  id v6 = a3;
  v46.receiver = self;
  v46.super_class = (Class)CAMPanoramaProcessor;
  v7 = [(CAMPanoramaProcessor *)&v46 init];
  v8 = v7;
  if (v7)
  {
    v7->_photoEncodingBehavior = a4;
    v7->_direction = 1;
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    initialMetadataByRequestUUID = v8->__initialMetadataByRequestUUID;
    v8->__initialMetadataByRequestUUID = v9;

    v11 = (void *)ACT_CopyDefaultConfigurationForPanorama();
    if (v11)
    {
      +[CAMPanoramaUtilities bufferSize];
      double v13 = v12;
      double v15 = v14;
      os_log_t v16 = (os_log_t)[v11 mutableCopy];
      if (v16)
      {
        v17 = [NSNumber numberWithDouble:v15 * 0.25];
        [v16 setObject:v17 forKey:*MEMORY[0x263F207F0]];

        v18 = [NSNumber numberWithDouble:v13 * 0.25];
        [v16 setObject:v18 forKey:*MEMORY[0x263F207F8]];
      }
      if (a4 == 1) {
        [v16 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F20818]];
      }
      v19 = [MEMORY[0x263F82B60] mainScreen];
      [v19 scale];

      +[CAMPanoramaUtilities defaultPreviewSize];
      uint64_t v20 = *MEMORY[0x263EFFB08];
      p_processor = &v8->__processor;
      int v22 = ACT_FigSampleBufferProcessorCreateForPanoramaWithOptionsAndPreviewSize();
      if (!v22)
      {
        v26 = *p_processor;
        if (*p_processor)
        {
          uint64_t v27 = *(void *)(CMBaseObjectGetVTable() + 16);
          if (v27) {
            uint64_t v28 = v27;
          }
          else {
            uint64_t v28 = 0;
          }
          v29 = *(void (**)(OpaqueFigSampleBufferProcessor *, void, CAMPanoramaProcessor *))(v28 + 8);
          if (v29) {
            v29(v26, __PanoramaProcessorOutputCallback, v8);
          }
          CFTypeRef cf = 0;
          uint64_t valuePtr = 0;
          uint64_t FigBaseObject = FigSampleBufferProcessorGetFigBaseObject();
          uint64_t v31 = *(void *)(CMBaseObjectGetVTable() + 8);
          if (v31) {
            uint64_t v32 = v31;
          }
          else {
            uint64_t v32 = 0;
          }
          v33 = *(void (**)(uint64_t, void, uint64_t, CFTypeRef *))(v32 + 48);
          if (v33)
          {
            v33(FigBaseObject, *MEMORY[0x263F20800], v20, &cf);
            CFNumberRef v34 = (const __CFNumber *)cf;
          }
          else
          {
            CFNumberRef v34 = 0;
          }
          CFNumberGetValue(v34, kCFNumberNSIntegerType, &valuePtr);
          if (cf) {
            CFRelease(cf);
          }
          CFTypeRef v42 = 0;
          uint64_t v43 = 0;
          uint64_t v35 = FigSampleBufferProcessorGetFigBaseObject();
          uint64_t v36 = *(void *)(CMBaseObjectGetVTable() + 8);
          if (v36) {
            uint64_t v37 = v36;
          }
          else {
            uint64_t v37 = 0;
          }
          v38 = *(void (**)(uint64_t, void, uint64_t, CFTypeRef *))(v37 + 48);
          if (v38)
          {
            v38(v35, *MEMORY[0x263F207D8], v20, &v42);
            CFNumberRef v39 = (const __CFNumber *)v42;
          }
          else
          {
            CFNumberRef v39 = 0;
          }
          CFNumberGetValue(v39, kCFNumberNSIntegerType, &v43);
          if (v42) {
            CFRelease(v42);
          }
          objc_storeWeak((id *)&v8->_delegate, v6);
          CGFloat v40 = (double)v43;
          v8->_previewSize.width = (double)valuePtr;
          v8->_previewSize.height = v40;
          request = v8->_request;
          v8->_request = 0;

          v8->_capturingPanorama = 0;
          v8->__greenTeaLogger = (ct_green_tea_logger_s *)ct_green_tea_logger_create();
          v24 = v8;
          goto LABEL_15;
        }
      }
      v23 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[CAMPanoramaProcessor initWithDelegate:encodingBehavior:](v22, v23);
      }
    }
    else
    {
      os_log_t v16 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[CAMPanoramaProcessor initWithDelegate:encodingBehavior:](v16);
      }
    }
    v24 = 0;
LABEL_15:

    goto LABEL_16;
  }
  v24 = 0;
LABEL_16:

  return v24;
}

- (void)dealloc
{
  processor = self->__processor;
  if (processor) {
    CFRelease(processor);
  }
  ct_green_tea_logger_destroy();
  v4.receiver = self;
  v4.super_class = (Class)CAMPanoramaProcessor;
  [(CAMPanoramaProcessor *)&v4 dealloc];
}

- (void)setDirection:(int64_t)a3
{
  if (self->_direction != a3)
  {
    self->_direction = a3;
    [(CAMPanoramaProcessor *)self _processor];
    uint64_t v4 = [NSNumber numberWithInteger:a3];
    uint64_t FigBaseObject = FigSampleBufferProcessorGetFigBaseObject();
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v7 = v6 ? v6 : 0;
    v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
    if (v8)
    {
      uint64_t v9 = *MEMORY[0x263F20780];
      v8(FigBaseObject, v9, v4);
    }
  }
}

- (void)startPanoramaCaptureWithRequest:(id)a3
{
  id v4 = a3;
  if ([(CAMPanoramaProcessor *)self isCapturingPanorama])
  {
    v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2099F8000, v5, OS_LOG_TYPE_DEFAULT, "Ignored request to start capturing a new panorama, we are already capturing a panorama!", buf, 2u);
    }
  }
  else
  {
    uint64_t v6 = [v4 photoEncodingBehavior];
    if (v6 == [(CAMPanoramaProcessor *)self photoEncodingBehavior])
    {
      [(CAMPanoramaProcessor *)self _greenTeaLogger];
      uint64_t v7 = getCTGreenTeaOsLogHandle();
      v8 = v7;
      if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_2099F8000, v8, OS_LOG_TYPE_INFO, "Take a photo", v11, 2u);
      }

      [(CAMPanoramaProcessor *)self _setRequest:v4];
      v5 = +[CAMCaptureMetadataUtilities metadataFromPanoramaRequest:v4];
      uint64_t v9 = [(CAMPanoramaProcessor *)self _initialMetadataByRequestUUID];
      v10 = [v4 persistenceUUID];
      [v9 setObject:v5 forKeyedSubscript:v10];

      [(CAMPanoramaProcessor *)self _processor];
      if ([(CAMPanoramaProcessor *)self photoEncodingBehavior] == 1) {
        ACT_FigSampleBufferProcessorStartPanoramaCaptureWithMetadata();
      }
      else {
        ACT_FigSampleBufferProcessorStartPanoramaCapture();
      }
      [(CAMPanoramaProcessor *)self _setCapturingPanorama:1];
    }
    else
    {
      v5 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[CAMPanoramaProcessor startPanoramaCaptureWithRequest:]((uint64_t)self, v5);
      }
    }
  }
}

- (void)stopPanoramaCapture
{
  if ([(CAMPanoramaProcessor *)self isCapturingPanorama])
  {
    [(CAMPanoramaProcessor *)self _setRequest:0];
    [(CAMPanoramaProcessor *)self _processor];
    ACT_FigSampleBufferProcessorStopPanoramaCapture();
    [(CAMPanoramaProcessor *)self _setCapturingPanorama:0];
  }
  else
  {
    v3 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_2099F8000, v3, OS_LOG_TYPE_DEFAULT, "Ignoring request to stop capturing a panorama, we are not capturing a panorama!", v4, 2u);
    }
  }
}

- (void)processPanoramaCaptureWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 persistenceUUID];
  [(CAMPanoramaProcessor *)self _processor];
  objc_super v46 = 0;
  uint64_t FigBaseObject = FigSampleBufferProcessorGetFigBaseObject();
  uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 8);
  v45 = (void (**)(void, void))v6;
  if (v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  double v12 = *(void (**)(uint64_t, __CFString *, void, void **))(v11 + 48);

  if (v12)
  {
    v12(FigBaseObject, @"HighResPanorama", *MEMORY[0x263EFFB08], &v46);
    double v13 = v46;
  }
  else
  {
    double v13 = 0;
  }
  double v14 = [(CAMPanoramaProcessor *)self _initialMetadataByRequestUUID];
  double v15 = [v14 objectForKeyedSubscript:v8];
  [v14 setObject:0 forKeyedSubscript:v8];
  os_log_t v16 = (void *)[v15 mutableCopy];
  uint64_t v17 = *MEMORY[0x263F0F248];
  uint64_t v18 = [v13 objectForKey:*MEMORY[0x263F0F248]];
  if (v18)
  {
    v19 = [v16 objectForKeyedSubscript:v17];
    uint64_t v20 = (void *)[v19 mutableCopy];

    [v20 addEntriesFromDictionary:v18];
    [v16 setObject:v20 forKey:v17];
  }
  CFTypeRef v42 = (void *)v18;
  uint64_t v21 = *MEMORY[0x263F0EFD8];
  uint64_t v22 = [v13 objectForKeyedSubscript:*MEMORY[0x263F0EFD8]];
  if (v22) {
    [v16 setObject:v22 forKey:v21];
  }
  v23 = [v13 objectForKey:@"iOS_Debug"];
  v24 = v23;
  if (v23 && [v23 length]) {
    [v16 setObject:v24 forKey:@"iOS_Debug"];
  }
  CGFloat v40 = v16;
  v25 = (__IOSurface *)[v13 objectForKey:@"JPEG"];
  v26 = [v13 objectForKey:*MEMORY[0x263F207A0]];
  uint64_t v27 = [v26 unsignedLongValue];

  size_t AllocSize = IOSurfaceGetAllocSize(v25);
  if (v27 - 1 >= AllocSize) {
    size_t v29 = AllocSize;
  }
  else {
    size_t v29 = v27;
  }
  v30 = (__CVBuffer *)[v13 objectForKey:*MEMORY[0x263F207E8]];
  v41 = (void *)v22;
  if (v30) {
    IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(v30);
  }
  else {
    IOSurfaceRef IOSurface = 0;
  }
  uint64_t v43 = v15;
  v44 = v14;
  uint64_t v32 = (void *)v8;
  if (v25)
  {
    v33 = 0;
  }
  else
  {
    v33 = [MEMORY[0x263F087E8] errorWithDomain:@"CAMPanoramaProcessorErrorDomain" code:-17500 userInfo:0];
  }
  CFNumberRef v34 = (void *)MEMORY[0x263EFFA08];
  uint64_t v35 = [NSNumber numberWithUnsignedInteger:0];
  uint64_t v36 = [v34 setWithObject:v35];

  uint64_t v37 = [[CAMCaptureCoordinationInfo alloc] initWithIdentifier:v32 allExpectedResultSpecifiers:v36 resultSpecifiers:0];
  LOBYTE(v39) = 0;
  v38 = [[CAMStillImageCaptureResult alloc] initWithFullsizeSurface:v25 size:v29 unfilteredPreviewSurface:IOSurface filteredPreviewSurface:0 metadata:v40 expectingPairedVideo:0 shouldPersistAdjustmentSidecar:v39 adjustmentFilters:0 persistenceUUID:v32 coordinationInfo:v37 error:v33];
  if (v45) {
    ((void (**)(void, CAMStillImageCaptureResult *))v45)[2](v45, v38);
  }
}

- (void)processSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  id v4 = [(CAMPanoramaProcessor *)self _processor];
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = *(uint64_t (**)(OpaqueFigSampleBufferProcessor *, opaqueCMSampleBuffer *))(v6 + 16);
  if (v7)
  {
    int v8 = v7(v4, a3);
    if (!v8) {
      return;
    }
  }
  else
  {
    int v8 = -12782;
  }
  uint64_t v9 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[CAMPanoramaProcessor processSampleBuffer:](v8, v9);
  }
}

- (void)invalidate
{
  [(CAMPanoramaProcessor *)self _processor];
  uint64_t FigBaseObject = FigSampleBufferProcessorGetFigBaseObject();
  if (FigBaseObject)
  {
    uint64_t v3 = FigBaseObject;
    uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v5 = v4 ? v4 : 0;
    uint64_t v6 = *(void (**)(uint64_t))(v5 + 24);
    if (v6)
    {
      v6(v3);
    }
  }
}

- (CAMPanoramaProcessorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMPanoramaProcessorDelegate *)WeakRetained;
}

- (CAMPanoramaCaptureRequest)request
{
  return self->_request;
}

- (void)_setRequest:(id)a3
{
}

- (int64_t)photoEncodingBehavior
{
  return self->_photoEncodingBehavior;
}

- (CGSize)previewSize
{
  double width = self->_previewSize.width;
  double height = self->_previewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)direction
{
  return self->_direction;
}

- (BOOL)isCapturingPanorama
{
  return self->_capturingPanorama;
}

- (void)_setCapturingPanorama:(BOOL)a3
{
  self->_capturingPanorama = a3;
}

- (NSMutableDictionary)_initialMetadataByRequestUUID
{
  return self->__initialMetadataByRequestUUID;
}

- (OpaqueFigSampleBufferProcessor)_processor
{
  return self->__processor;
}

- (ct_green_tea_logger_s)_greenTeaLogger
{
  return self->__greenTeaLogger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__initialMetadataByRequestUUID, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithDelegate:(os_log_t)log encodingBehavior:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2099F8000, log, OS_LOG_TYPE_ERROR, "Unable to retrieve the default panorama configuration from ACT! Cannot continue panorama configuration!", v1, 2u);
}

- (void)initWithDelegate:(int)a1 encodingBehavior:(NSObject *)a2 .cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "Failed to create panorama processor (%d)", (uint8_t *)v2, 8u);
}

- (void)startPanoramaCaptureWithRequest:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "Request specifies a different encoding behavior than processor %{public}@ was configured for, capture cannot proceed", (uint8_t *)&v2, 0xCu);
}

- (void)processSampleBuffer:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "Failed to process panorama sample buffer! (%d)", (uint8_t *)v2, 8u);
}

@end