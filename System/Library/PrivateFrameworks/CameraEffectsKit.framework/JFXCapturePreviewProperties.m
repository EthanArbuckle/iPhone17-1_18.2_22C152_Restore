@interface JFXCapturePreviewProperties
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)renderTime;
- (BOOL)renderRequiresCrop;
- (CGSize)frameSize;
- (CGSize)renderOutputSize;
- (JFXCapturePreviewFrameStats)frameStats;
- (JFXCapturePreviewProperties)initWithCameraFrameSet:(id)a3 renderCameraMode:(int64_t)a4 renderTime:(id *)a5 renderOutputSize:(CGSize)a6 frameSize:(CGSize)a7;
- (JFXCapturePreviewProperties)initWithCameraFrameSet:(id)a3 renderCameraMode:(int64_t)a4 renderTime:(id *)a5 renderOutputSize:(CGSize)a6 frameSize:(CGSize)a7 signPostToken:(id)a8 displayTimestamp:(double)a9 frameStats:(id)a10 startFrameTimer:(id)a11;
- (JFXPerfTimer)startFrameTimer;
- (NSDictionary)selfieBGBuffers;
- (OS_dispatch_semaphore)selfieBGBufferLoadSem;
- (PVFrameSet)cameraFrameSet;
- (PVTaskToken)signPostToken;
- (double)displayTimestamp;
- (int64_t)renderCameraMode;
- (void)setSelfieBGBufferLoadSem:(id)a3;
- (void)setSelfieBGBuffers:(id)a3;
@end

@implementation JFXCapturePreviewProperties

- (JFXCapturePreviewProperties)initWithCameraFrameSet:(id)a3 renderCameraMode:(int64_t)a4 renderTime:(id *)a5 renderOutputSize:(CGSize)a6 frameSize:(CGSize)a7
{
  double height = a7.height;
  double width = a7.width;
  double v9 = a6.height;
  double v10 = a6.width;
  id v14 = a3;
  CFTimeInterval v15 = CACurrentMediaTime();
  $3CC8671D27C23BF42ADDB32F2B5E48AE v18 = *a5;
  v16 = -[JFXCapturePreviewProperties initWithCameraFrameSet:renderCameraMode:renderTime:renderOutputSize:frameSize:signPostToken:displayTimestamp:frameStats:startFrameTimer:](self, "initWithCameraFrameSet:renderCameraMode:renderTime:renderOutputSize:frameSize:signPostToken:displayTimestamp:frameStats:startFrameTimer:", v14, a4, &v18, 0, 0, 0, v10, v9, width, height, v15);

  return v16;
}

- (JFXCapturePreviewProperties)initWithCameraFrameSet:(id)a3 renderCameraMode:(int64_t)a4 renderTime:(id *)a5 renderOutputSize:(CGSize)a6 frameSize:(CGSize)a7 signPostToken:(id)a8 displayTimestamp:(double)a9 frameStats:(id)a10 startFrameTimer:(id)a11
{
  CGFloat height = a7.height;
  CGFloat width = a7.width;
  CGFloat v17 = a6.height;
  CGFloat v18 = a6.width;
  id v22 = a3;
  id v23 = a8;
  id v24 = a10;
  id v25 = a11;
  v39.receiver = self;
  v39.super_class = (Class)JFXCapturePreviewProperties;
  v26 = [(JFXCapturePreviewProperties *)&v39 init];
  v27 = (void *)*((void *)v26 + 1);
  *((void *)v26 + 1) = v22;
  id v28 = v22;

  *((void *)v26 + 2) = a4;
  long long v29 = *(_OWORD *)&a5->var0;
  *((void *)v26 + 15) = a5->var3;
  *(_OWORD *)(v26 + 104) = v29;
  *((CGFloat *)v26 + 9) = v18;
  *((CGFloat *)v26 + 10) = v17;
  *((CGFloat *)v26 + 11) = width;
  *((CGFloat *)v26 + 12) = height;
  *((double *)v26 + 3) = a9;
  v30 = (void *)*((void *)v26 + 4);
  *((void *)v26 + 4) = v23;
  id v31 = v23;

  v32 = (void *)*((void *)v26 + 5);
  *((void *)v26 + 5) = v24;
  id v33 = v24;

  v34 = (void *)*((void *)v26 + 6);
  *((void *)v26 + 6) = v25;
  id v35 = v25;

  *((double *)v26 + 3) = a9;
  v36 = (void *)*((void *)v26 + 8);
  *((void *)v26 + 8) = 0;

  v37 = (void *)*((void *)v26 + 7);
  *((void *)v26 + 7) = 0;

  return (JFXCapturePreviewProperties *)v26;
}

- (BOOL)renderRequiresCrop
{
  BOOL v3 = JFXIsCTMCroppedCameraMode([(JFXCapturePreviewProperties *)self renderCameraMode]);
  [(JFXCapturePreviewProperties *)self frameSize];
  double v5 = v4;
  [(JFXCapturePreviewProperties *)self frameSize];
  double v7 = v6;
  [(JFXCapturePreviewProperties *)self renderOutputSize];
  double v9 = v8;
  [(JFXCapturePreviewProperties *)self renderOutputSize];
  if (v3) {
    return 1;
  }
  else {
    return (v5 > v7) ^ (v9 > v10);
  }
}

- (PVFrameSet)cameraFrameSet
{
  return self->_cameraFrameSet;
}

- (int64_t)renderCameraMode
{
  return self->_renderCameraMode;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)renderTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 104);
  return self;
}

- (CGSize)renderOutputSize
{
  double width = self->_renderOutputSize.width;
  double height = self->_renderOutputSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)frameSize
{
  double width = self->_frameSize.width;
  double height = self->_frameSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)displayTimestamp
{
  return self->_displayTimestamp;
}

- (PVTaskToken)signPostToken
{
  return self->_signPostToken;
}

- (JFXCapturePreviewFrameStats)frameStats
{
  return self->_frameStats;
}

- (JFXPerfTimer)startFrameTimer
{
  return self->_startFrameTimer;
}

- (NSDictionary)selfieBGBuffers
{
  return self->_selfieBGBuffers;
}

- (void)setSelfieBGBuffers:(id)a3
{
}

- (OS_dispatch_semaphore)selfieBGBufferLoadSem
{
  return self->_selfieBGBufferLoadSem;
}

- (void)setSelfieBGBufferLoadSem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selfieBGBufferLoadSem, 0);
  objc_storeStrong((id *)&self->_selfieBGBuffers, 0);
  objc_storeStrong((id *)&self->_startFrameTimer, 0);
  objc_storeStrong((id *)&self->_frameStats, 0);
  objc_storeStrong((id *)&self->_signPostToken, 0);
  objc_storeStrong((id *)&self->_cameraFrameSet, 0);
}

@end