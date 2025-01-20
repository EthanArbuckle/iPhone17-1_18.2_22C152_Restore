@interface BCSVisualCodeDetector
- (AppC3DSession)appCodeSession;
- (BCSVisualCodeDetector)init;
- (BOOL)_processCameraFrame:(__CVBuffer *)a3 timestamp:(double)a4 cameraMatrix:(double)a5[9];
- (BOOL)_submitToAppC3D:(__CVBuffer *)a3 timestamp:(double)a4 metadata:(id)a5;
- (CGAffineTransform)_tranformWithImageOrientation:(SEL)a3;
- (CGRect)_regionOfInterest;
- (id)_estimateQRCodeAvailabilityInFrame:(__CVBuffer *)a3;
- (id)_extractAppClipCode:(AppC3DTrackingResult *)a3 orientation:(unsigned int)a4 error:(id *)a5 timestamp:(double)a6;
- (unsigned)imageOrientation;
- (void)detectCodeFromBuffer:(opaqueCMSampleBuffer *)a3 completion:(id)a4;
- (void)didReceiveAppC3DUpdate:(AppC3DTrackingResult *)a3 orientation:(unsigned int)a4 error:(__CFError *)a5 timestamp:(double)a6;
- (void)endSession;
- (void)resetCache;
- (void)setAppCodeSession:(AppC3DSession *)a3;
- (void)setImageOrientation:(unsigned int)a3;
- (void)startSession;
@end

@implementation BCSVisualCodeDetector

- (BCSVisualCodeDetector)init
{
  v6.receiver = self;
  v6.super_class = (Class)BCSVisualCodeDetector;
  v2 = [(BCSVisualCodeDetector *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_isAppC3DTracking = 0;
    [(BCSVisualCodeDetector *)v2 startSession];
    v4 = v3;
  }

  return v3;
}

- (void)detectCodeFromBuffer:(opaqueCMSampleBuffer *)a3 completion:(id)a4
{
  objc_super v6 = (void (**)(id, void *))a4;
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (ImageBuffer)
  {
    os_signpost_id_t v8 = (os_signpost_id_t)ImageBuffer;
    v9 = (id)BCS_LOG_CHANNEL_PREFIXBarcodeScanner();
    v10 = v9;
    if (v8 != -1 && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_248ACF000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "Detection", "start code detection", buf, 2u);
    }

    *(void *)buf = 0;
    v37 = buf;
    uint64_t v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__0;
    v40 = __Block_byref_object_dispose__0;
    id v41 = 0;
    v11 = dispatch_group_create();
    memset(&v35, 0, sizeof(v35));
    CMSampleBufferGetPresentationTimeStamp(&v35, a3);
    CMTime time = v35;
    double Seconds = CMTimeGetSeconds(&time);
    v13 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x263F01028], 0);
    v14 = (id)BCS_LOG_CHANNEL_PREFIXBarcodeScanner();
    v15 = v14;
    if ((unint64_t)v13 + 1 >= 2 && os_signpost_enabled(v14))
    {
      LOWORD(time.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_248ACF000, v15, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v13, "Detection.ACCode", "start ACCode code detection", (uint8_t *)&time, 2u);
    }

    BOOL isAppC3DTracking = self->_isAppC3DTracking;
    self->_BOOL isAppC3DTracking = 0;
    if ([(BCSVisualCodeDetector *)self _submitToAppC3D:v8 timestamp:v13 metadata:Seconds])
    {
      dispatch_group_enter(v11);
      os_unfair_lock_lock(&appcodeExtractCompletionHandlerLock);
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __57__BCSVisualCodeDetector_detectCodeFromBuffer_completion___block_invoke;
      aBlock[3] = &unk_26524C6D8;
      v33 = buf;
      id v31 = v13;
      v32 = v11;
      v17 = _Block_copy(aBlock);
      id appcodeExtractCompletionHandler = self->_appcodeExtractCompletionHandler;
      self->_id appcodeExtractCompletionHandler = v17;

      os_unfair_lock_unlock(&appcodeExtractCompletionHandlerLock);
    }
    v19 = (id)BCS_LOG_CHANNEL_PREFIXBarcodeScanner();
    v20 = v19;
    if (v8 != -1 && os_signpost_enabled(v19))
    {
      LOWORD(time.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_248ACF000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v8, "Detection.QR", "start QR code detection", (uint8_t *)&time, 2u);
    }

    v21 = [(BCSVisualCodeDetector *)self _estimateQRCodeAvailabilityInFrame:v8];
    v22 = (id)BCS_LOG_CHANNEL_PREFIXBarcodeScanner();
    v23 = v22;
    if (v8 != -1 && os_signpost_enabled(v22))
    {
      LOWORD(time.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_248ACF000, v23, OS_SIGNPOST_INTERVAL_END, v8, "Detection.QR", "end QR code detection", (uint8_t *)&time, 2u);
    }

    v24 = (id)BCS_LOG_CHANNEL_PREFIXBarcodeScanner();
    v25 = v24;
    if (v8 != -1 && os_signpost_enabled(v24))
    {
      LOWORD(time.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_248ACF000, v25, OS_SIGNPOST_INTERVAL_END, v8, "Detection", "end code detection", (uint8_t *)&time, 2u);
    }

    dispatch_time_t v26 = dispatch_time(0, 1000000000);
    dispatch_group_wait(v11, v26);
    if ([*((id *)v37 + 5) count])
    {
      uint64_t v27 = [v21 arrayByAddingObjectsFromArray:*((void *)v37 + 5)];

      v21 = (void *)v27;
    }
    else if (v21)
    {
      uint64_t v28 = [v21 count];
      if (!isAppC3DTracking && v28 && self->_isAppC3DTracking)
      {

        v29 = BCS_LOG_CHANNEL_PREFIXBarcodeScanner();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          LOWORD(time.value) = 0;
          _os_log_impl(&dword_248ACF000, v29, OS_LOG_TYPE_INFO, "Tracking an app clip code, skip QR codes in frame.", (uint8_t *)&time, 2u);
        }
        v21 = 0;
      }
    }
    v6[2](v6, v21);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v6[2](v6, 0);
  }
}

void __57__BCSVisualCodeDetector_detectCodeFromBuffer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  v5 = (id)BCS_LOG_CHANNEL_PREFIXBarcodeScanner();
  objc_super v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 32);
  if (v7 + 1 >= 2 && os_signpost_enabled(v5))
  {
    *(_WORD *)os_signpost_id_t v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_248ACF000, v6, OS_SIGNPOST_INTERVAL_END, v7, "Detection.ACCode", "end ACCode code detection", v8, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)resetCache
{
  self->_BOOL isAppC3DTracking = 0;
}

- (id)_estimateQRCodeAvailabilityInFrame:(__CVBuffer *)a3
{
  v29[1] = *MEMORY[0x263EF8340];
  id v5 = objc_alloc(MEMORY[0x263F1EF40]);
  objc_super v6 = (void *)[v5 initWithCVPixelBuffer:a3 orientation:self->_imageOrientation options:MEMORY[0x263EFFA78]];
  id v7 = objc_alloc_init(MEMORY[0x263F1EE68]);
  [(BCSVisualCodeDetector *)self _regionOfInterest];
  objc_msgSend(v7, "setRegionOfInterest:");
  [v7 setRevision:1];
  v29[0] = *MEMORY[0x263F1F0B8];
  os_signpost_id_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:1];
  [v7 setSymbologies:v8];

  [v7 setStopAtFirstPyramidWith2DCode:1];
  id v28 = v7;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v28 count:1];
  id v26 = 0;
  [v6 performRequests:v9 error:&v26];
  id v10 = v26;

  v11 = [v7 results];
  v12 = [MEMORY[0x263EFF980] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        v19 = [BCSVisualCodeQR alloc];
        v20 = -[BCSVisualCodeQR initWithBarcodeObservation:](v19, "initWithBarcodeObservation:", v18, (void)v22);
        [v12 addObject:v20];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v15);
  }

  return v12;
}

- (CGRect)_regionOfInterest
{
  double v2 = 0.15;
  double v3 = 0.2;
  double v4 = 0.7;
  double v5 = 0.6;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)didReceiveAppC3DUpdate:(AppC3DTrackingResult *)a3 orientation:(unsigned int)a4 error:(__CFError *)a5 timestamp:(double)a6
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a5)
  {
    os_signpost_id_t v8 = BCS_LOG_CHANNEL_PREFIXBarcodeScanner();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = a5;
      _os_log_impl(&dword_248ACF000, v8, OS_LOG_TYPE_INFO, "Error in update callback: %@", buf, 0xCu);
    }

    v9 = 0;
    id v10 = 0;
  }
  else
  {
    id v13 = 0;
    v9 = [(BCSVisualCodeDetector *)self _extractAppClipCode:a3 orientation:*(void *)&a4 error:&v13 timestamp:a6];
    id v10 = v13;
  }
  os_unfair_lock_lock(&appcodeExtractCompletionHandlerLock);
  id appcodeExtractCompletionHandler = (void (**)(id, void *))self->_appcodeExtractCompletionHandler;
  if (appcodeExtractCompletionHandler)
  {
    appcodeExtractCompletionHandler[2](appcodeExtractCompletionHandler, v9);
    id v12 = self->_appcodeExtractCompletionHandler;
  }
  else
  {
    id v12 = 0;
  }
  self->_id appcodeExtractCompletionHandler = 0;

  os_unfair_lock_unlock(&appcodeExtractCompletionHandlerLock);
}

- (CGAffineTransform)_tranformWithImageOrientation:(SEL)a3
{
  switch(a4)
  {
    case 6u:
      long long v5 = xmmword_248AEDAD0;
      __asm { FMOV            V0.2D, #1.0 }
      CGFloat v6 = 0.0;
      goto LABEL_7;
    case 3u:
      _Q0 = xmmword_248AEDB70;
      long long v5 = xmmword_248AEDB80;
      CGFloat v6 = -1.0;
      goto LABEL_7;
    case 1u:
      _Q0 = xmmword_248AEDB80;
      long long v5 = xmmword_248AEDC70;
      CGFloat v6 = 1.0;
LABEL_7:
      retstr->a = v6;
      *(void *)&retstr->b = v5;
      *(_OWORD *)&retstr->c = v5;
      *(_OWORD *)&retstr->tx = _Q0;
      return self;
  }
  uint64_t v11 = MEMORY[0x263F000D0];
  long long v12 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->c = v12;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v11 + 32);
  return self;
}

- (id)_extractAppClipCode:(AppC3DTrackingResult *)a3 orientation:(unsigned int)a4 error:(id *)a5 timestamp:(double)a6
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v47 = *a5;
  uint64_t NumberOfTrackingData = AppC3DTrackingResultGetNumberOfTrackingData();
  if (v47)
  {
    id v10 = 0;
  }
  else
  {
    uint64_t v11 = NumberOfTrackingData;
    if (NumberOfTrackingData)
    {
      long long v12 = BCS_LOG_CHANNEL_PREFIXBarcodeScanner();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf[0].x) = 134218240;
        *(void *)((char *)&buf[0].x + 4) = v11;
        WORD2(buf[0].y) = 2048;
        *(double *)((char *)&buf[0].y + 6) = a6;
        _os_log_impl(&dword_248ACF000, v12, OS_LOG_TYPE_INFO, "App clip code tracking %ld codes at %f", (uint8_t *)buf, 0x16u);
      }
    }
    id v13 = [MEMORY[0x263EFF980] array];
    if (v11)
    {
      uint64_t v14 = 0;
      unsigned int v42 = v7;
      uint64_t v41 = v11;
      while (1)
      {
        self->_BOOL isAppC3DTracking = 1;
        uint64_t Data = AppC3DTrackingResultCreateData();
        uint64_t v16 = (void *)Data;
        if (v47 || Data == 0) {
          break;
        }
        AppC3DTrackingResultGetMetadata();
        if (v47) {
          break;
        }
        unsigned int DataVersion = AppC3DTrackingResultGetDataVersion();
        if (v47) {
          break;
        }
        unsigned int v19 = DataVersion;
        Corners = (void *)AppC3DTrackingResultCreateCorners();
        if (![Corners count] || v47 || objc_msgSend(Corners, "count") != 4)
        {

          break;
        }
        unsigned int v40 = v19;
        v21 = v13;
        float64x2_t v45 = 0u;
        float64x2_t v46 = 0u;
        float64x2_t v44 = 0u;
        long long v22 = self;
        [(BCSVisualCodeDetector *)self _tranformWithImageOrientation:v7];
        for (uint64_t i = 0; i != 4; ++i)
        {
          point.CGFloat x = 0.0;
          point.CGFloat y = 0.0;
          CFDictionaryRef v24 = [Corners objectAtIndexedSubscript:i];
          BOOL v25 = CGPointMakeWithDictionaryRepresentation(v24, &point);

          if (!v25)
          {

            id v10 = 0;
            id v13 = v21;
            goto LABEL_30;
          }
          buf[i] = (CGPoint)vaddq_f64(v46, vmlaq_n_f64(vmulq_n_f64(v45, point.y), v44, point.x));
        }
        self = v22;
        [(BCSVisualCodeDetector *)v22 _regionOfInterest];
        CGFloat x = v53.origin.x;
        CGFloat y = v53.origin.y;
        CGFloat width = v53.size.width;
        CGFloat height = v53.size.height;
        double v30 = buf[0].x;
        double v31 = buf[0].y;
        id v13 = v21;
        if (CGRectContainsPoint(v53, buf[0]))
        {
          double v32 = buf[1].x;
          double v33 = buf[1].y;
          v54.origin.CGFloat x = x;
          v54.origin.CGFloat y = y;
          v54.size.CGFloat width = width;
          v54.size.CGFloat height = height;
          if (CGRectContainsPoint(v54, buf[1]))
          {
            v55.origin.CGFloat x = x;
            v55.origin.CGFloat y = y;
            v55.size.CGFloat width = width;
            v55.size.CGFloat height = height;
            double v38 = v49.y;
            double v39 = v49.x;
            if (CGRectContainsPoint(v55, v49))
            {
              v56.origin.CGFloat x = x;
              v56.origin.CGFloat y = y;
              v56.size.CGFloat width = width;
              double v34 = v50.x;
              v56.size.CGFloat height = height;
              double v35 = v50.y;
              if (CGRectContainsPoint(v56, v50))
              {
                v36 = [[BCSVisualCodeAppClip alloc] initWithRawPayload:v16 version:v40];
                -[BCSVisualCode setTopLeft:](v36, "setTopLeft:", v30, v31);
                -[BCSVisualCode setTopRight:](v36, "setTopRight:", v32, v33);
                -[BCSVisualCode setBottomRight:](v36, "setBottomRight:", v39, v38);
                -[BCSVisualCode setBottomLeft:](v36, "setBottomLeft:", v34, v35);
                [v21 addObject:v36];
              }
            }
          }
        }

        ++v14;
        uint64_t v7 = v42;
        if (v14 == v41) {
          goto LABEL_26;
        }
      }

      id v10 = 0;
    }
    else
    {
LABEL_26:
      id v10 = v13;
    }
LABEL_30:
  }

  return v10;
}

- (BOOL)_processCameraFrame:(__CVBuffer *)a3 timestamp:(double)a4 cameraMatrix:(double)a5[9]
{
  v9[1] = *MEMORY[0x263EF8340];
  os_signpost_id_t v8 = @"orientation";
  long long v5 = [NSNumber numberWithUnsignedInt:self->_imageOrientation];
  v9[0] = v5;
  CGFloat v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  AppC3DProcessCameraFrameData();
  return 1;
}

- (BOOL)_submitToAppC3D:(__CVBuffer *)a3 timestamp:(double)a4 metadata:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (a5)
  {
    int8x16_t v13 = 0u;
    long long v14 = 0u;
    int8x16_t v12 = 0u;
    [a5 getBytes:&v12 length:48];
    *(double *)buf = *(float *)v12.i32;
    double v16 = *(float *)v13.i32;
    float64x2_t v17 = vcvtq_f64_f32((float32x2_t)__PAIR64__(v12.u32[1], v14));
    float64x2_t v18 = vcvtq_f64_f32((float32x2_t)vzip2_s32(*(int32x2_t *)v13.i8, *(int32x2_t *)&v14));
    float64x2_t v19 = vcvtq_f64_f32((float32x2_t)vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8(v12, v12, 8uLL), (int32x2_t)*(_OWORD *)&vextq_s8(v13, v13, 8uLL)));
    double v20 = *((float *)&v14 + 2);
  }
  else
  {
    os_signpost_id_t v8 = BCS_LOG_CHANNEL_PREFIXBarcodeScannerLifeCycle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_248ACF000, v8, OS_LOG_TYPE_INFO, "Intrinsics metadata is nil, generate the matrix based on image dimension.", buf, 2u);
    }
    double Width = (double)CVPixelBufferGetWidth(a3);
    size_t Height = CVPixelBufferGetHeight(a3);
    *(double *)buf = Width;
    double v16 = 0.0;
    v17.f64[0] = (Width + -1.0) * 0.5;
    v17.f64[1] = 0.0;
    v18.f64[0] = Width;
    v18.f64[1] = ((double)Height + -1.0) * 0.5;
    float64x2_t v19 = 0uLL;
    double v20 = 1.0;
  }
  return [(BCSVisualCodeDetector *)self _processCameraFrame:a3 timestamp:buf cameraMatrix:a4];
}

- (void)startSession
{
  if (!self->_appCodeSession)
  {
    AppC3DConfigCreate();
    AppC3DConfigSetTrackingMode();
    AppC3DConfigSetTrackingConfig();
    AppC3DCreate();
    AppC3DConfigRelease();
    AppC3DSetUpdateCallback();
  }
}

- (void)endSession
{
  if (self->_appCodeSession)
  {
    AppC3DRelease();
    self->_appCodeSession = 0;
  }
}

- (unsigned)imageOrientation
{
  return self->_imageOrientation;
}

- (void)setImageOrientation:(unsigned int)a3
{
  self->_imageOrientation = a3;
}

- (AppC3DSession)appCodeSession
{
  return self->_appCodeSession;
}

- (void)setAppCodeSession:(AppC3DSession *)a3
{
  self->_appCodeSession = a3;
}

- (void).cxx_destruct
{
}

@end