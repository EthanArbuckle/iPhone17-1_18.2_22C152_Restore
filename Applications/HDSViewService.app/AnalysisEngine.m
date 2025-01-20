@interface AnalysisEngine
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)recognitionExpirationSeconds;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)recognizerInterval;
- (AnalysisEngine)initWithRecognizer:(id)a3;
- (BOOL)hasRecognizedDeviceInRecentPast:(id *)a3;
- (BOOL)isDetectingMotion;
- (BOOL)useRecognizer;
- (BOOL)usingM7Motion;
- (OS_dispatch_queue)dispatchQueue;
- (double)crop_fraction;
- (float)motionAccelerationThreshold;
- (float)motionRotationThreshold;
- (float)recognizerConfidence;
- (id)initForType:(unint64_t)a3;
- (id)recognizingCompletionHandlerBlock;
- (void)clearHistory;
- (void)dealloc;
- (void)ingestVideoFrame:(opaqueCMSampleBuffer *)a3;
- (void)preheat;
- (void)processVideoFrame:(__CVBuffer *)a3;
- (void)reset;
- (void)setCrop_fraction:(double)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setMotionAccelerationThreshold:(float)a3;
- (void)setMotionRotationThreshold:(float)a3;
- (void)setRecognizingCompletionHandlerBlock:(id)a3;
- (void)setUseRecognizer:(BOOL)a3;
- (void)setUsingM7Motion:(BOOL)a3;
@end

@implementation AnalysisEngine

- (id)initForType:(unint64_t)a3
{
  if (a3 == 1) {
    +[Recognizer recognizer_B520];
  }
  else {
  v4 = +[Recognizer recognizer_B238];
  }
  v5 = [(AnalysisEngine *)self initWithRecognizer:v4];

  return v5;
}

- (AnalysisEngine)initWithRecognizer:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AnalysisEngine;
  v6 = [(AnalysisEngine *)&v18 init];
  v7 = v6;
  if (v6)
  {
    v6->_crop_fraction = 0.7;
    v6->_useRecognizer = 1;
    objc_storeStrong((id *)&v6->_dispatchQueue, &_dispatch_main_q);
    objc_storeStrong((id *)&v7->_recognizer, a3);
    CMTimeMakeWithSeconds(&v17, 0.0, 3000000);
    v7->_recognizerInterval = ($95D729B680665BEAEFA1D6FCA8238556)v17;
    CMTimeMakeWithSeconds(&v17, 1.0, 3000000);
    v7->_recognitionExpirationSeconds = ($95D729B680665BEAEFA1D6FCA8238556)v17;
    dispatch_queue_t v8 = dispatch_queue_create("Sauron processing queue", 0);
    processingQueue = v7->_processingQueue;
    v7->_processingQueue = (OS_dispatch_queue *)v8;

    v10 = v7->_processingQueue;
    v11 = dispatch_get_global_queue(2, 0);
    dispatch_set_target_queue(v10, v11);

    v12 = objc_alloc_init(MotionDetector);
    motion = v7->_motion;
    v7->_motion = v12;

    LODWORD(v14) = 1045220557;
    [(MotionDetector *)v7->_motion setRotationThreshold:v14];
    LODWORD(v15) = 1024416809;
    [(MotionDetector *)v7->_motion setAccelerationThreshold:v15];
    [(MotionDetector *)v7->_motion stop];
    v7->_isDetectingMotion = 0;
    [(AnalysisEngine *)v7 reset];
  }

  return v7;
}

- (void)clearHistory
{
  [(Recognizer *)self->_recognizer reset];
  LODWORD(v3) = dword_1000AF638[!self->_usingM7Motion];
  [(MotionDetector *)self->_motion setAccelerationThreshold:v3];
  motion = self->_motion;
  LODWORD(v5) = 1045220557;

  [(MotionDetector *)motion setRotationThreshold:v5];
}

- (void)reset
{
  processingQueue = self->_processingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005660;
  block[3] = &unk_1000D9AD0;
  block[4] = self;
  dispatch_async(processingQueue, block);
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)AnalysisEngine;
  [(AnalysisEngine *)&v2 dealloc];
}

- (void)setMotionRotationThreshold:(float)a3
{
}

- (float)motionRotationThreshold
{
  [(MotionDetector *)self->_motion rotationThreshold];
  return result;
}

- (void)setMotionAccelerationThreshold:(float)a3
{
}

- (float)motionAccelerationThreshold
{
  [(MotionDetector *)self->_motion accelerationThreshold];
  return result;
}

- (void)ingestVideoFrame:(opaqueCMSampleBuffer *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_processingFrame)
  {
    self->_processingFrame = 1;
    CMSampleBufferGetPresentationTimeStamp(&v9, a3);
    self->_currentFrameTime = ($95D729B680665BEAEFA1D6FCA8238556)v9;
    ImageBuffer = CMSampleBufferGetImageBuffer(a3);
    CVPixelBufferRef v6 = CVPixelBufferRetain(ImageBuffer);
    processingQueue = self->_processingQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000578C;
    block[3] = &unk_1000D9AF8;
    block[4] = self;
    void block[5] = v6;
    dispatch_async(processingQueue, block);
  }
}

- (void)preheat
{
  processingQueue = self->_processingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005890;
  block[3] = &unk_1000D9AD0;
  block[4] = self;
  dispatch_async(processingQueue, block);
}

- (void)processVideoFrame:(__CVBuffer *)a3
{
  if (!a3) {
    goto LABEL_15;
  }
  if (!self->_useRecognizer) {
    goto LABEL_15;
  }
  CMTime lhs = (CMTime)self->_recognitionExpirationSeconds;
  if ([(AnalysisEngine *)self hasRecognizedDeviceInRecentPast:&lhs]) {
    goto LABEL_15;
  }
  p_currentFrameTime = &self->_currentFrameTime;
  recognizer = self->_recognizer;
  if (recognizer) {
    [(Recognizer *)recognizer lastProcessedImageTime];
  }
  else {
    memset(&rhs, 0, sizeof(rhs));
  }
  *(_OWORD *)&lhs.value = *(_OWORD *)&p_currentFrameTime->value;
  lhs.epoch = self->_currentFrameTime.epoch;
  CMTimeSubtract(&time1, &lhs, &rhs);
  CMTime lhs = (CMTime)self->_recognizerInterval;
  if (CMTimeCompare(&time1, &lhs) < 0) {
    goto LABEL_15;
  }
  v7 = self->_recognizer;
  *(_OWORD *)&lhs.value = *(_OWORD *)&p_currentFrameTime->value;
  lhs.epoch = self->_currentFrameTime.epoch;
  [(Recognizer *)v7 processImage:a3 withTimestamp:&lhs];
  dispatch_queue_t v8 = self->_recognizer;
  if (v8)
  {
    [(Recognizer *)v8 recognitionTime];
    CMTime v9 = self->_recognizer;
    if (v9)
    {
      [(Recognizer *)v9 lastProcessedImageTime];
      goto LABEL_13;
    }
  }
  else
  {
    memset(&v16, 0, sizeof(v16));
  }
  memset(&time2, 0, sizeof(time2));
LABEL_13:
  if ((CMTimeCompare(&v16, &time2) & 0x80000000) == 0)
  {
    v10 = [(AnalysisEngine *)self recognizingCompletionHandlerBlock];
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005AE4;
    block[3] = &unk_1000D9B20;
    block[4] = self;
    void block[5] = v10;
    dispatch_async(dispatchQueue, block);

    return;
  }
LABEL_15:
  v12 = self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100005B38;
  v13[3] = &unk_1000D9AD0;
  v13[4] = self;
  dispatch_async(v12, v13);
}

- (BOOL)hasRecognizedDeviceInRecentPast:(id *)a3
{
  if (!self->_useRecognizer) {
    return 0;
  }
  memset(&v9, 0, sizeof(v9));
  CMTime lhs = (CMTime)self->_currentFrameTime;
  CMTime rhs = *(CMTime *)a3;
  CMTimeSubtract(&v9, &lhs, &rhs);
  recognizer = self->_recognizer;
  if (recognizer) {
    [(Recognizer *)recognizer recognitionTime];
  }
  else {
    memset(&time1, 0, sizeof(time1));
  }
  CMTime lhs = v9;
  return CMTimeCompare(&time1, &lhs) >= 0;
}

- (float)recognizerConfidence
{
  [(Recognizer *)self->_recognizer confidence];
  return v2;
}

- (BOOL)usingM7Motion
{
  return self->_usingM7Motion;
}

- (void)setUsingM7Motion:(BOOL)a3
{
  self->_usingM7Motion = a3;
}

- (BOOL)useRecognizer
{
  return self->_useRecognizer;
}

- (void)setUseRecognizer:(BOOL)a3
{
  self->_useRecognizer = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)recognizerInterval
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[4];
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)recognitionExpirationSeconds
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[5];
  return self;
}

- (double)crop_fraction
{
  return self->_crop_fraction;
}

- (void)setCrop_fraction:(double)a3
{
  self->_crop_fraction = a3;
}

- (BOOL)isDetectingMotion
{
  return self->_isDetectingMotion;
}

- (id)recognizingCompletionHandlerBlock
{
  return self->_recognizingCompletionHandlerBlock;
}

- (void)setRecognizingCompletionHandlerBlock:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_recognizingCompletionHandlerBlock, 0);
  objc_storeStrong((id *)&self->_motion, 0);
  objc_storeStrong((id *)&self->_recognizer, 0);

  objc_storeStrong((id *)&self->_processingQueue, 0);
}

@end