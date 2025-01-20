@interface Recognizer
+ (id)recognizer_B238;
+ (id)recognizer_B520;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastProcessedImageTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)recognitionTime;
- (BOOL)detectionOutputIsDouble;
- (BOOL)handleVNRequest:(id)a3 withHandler:(id)a4 error:(id *)a5;
- (BOOL)recognize:(__CVBuffer *)a3 error:(id *)a4;
- (CGRect)cropRect;
- (Recognizer)initWithClassifier:(id)a3;
- (double)confidence;
- (double)threshold;
- (id)getSceneprintForImage:(__CVBuffer *)a3 error:(id *)a4;
- (id)getVisionFrameworkVersion;
- (void)processImage:(__CVBuffer *)a3 withTimestamp:(id *)a4;
- (void)reset;
- (void)setCropRect:(CGRect)a3;
- (void)setDetectionOutputIsDouble:(BOOL)a3;
- (void)setThreshold:(double)a3;
@end

@implementation Recognizer

+ (id)recognizer_B238
{
  id v2 = objc_alloc((Class)a1);
  v3 = objc_alloc_init(HPdetector_SceneClassifier_B238);
  id v4 = [v2 initWithClassifier:v3];

  return v4;
}

+ (id)recognizer_B520
{
  id v2 = objc_alloc((Class)a1);
  v3 = objc_alloc_init(HPdetector_SceneClassifier_B520);
  id v4 = [v2 initWithClassifier:v3];

  [v4 setThreshold:0.9];
  [v4 setDetectionOutputIsDouble:0];

  return v4;
}

- (Recognizer)initWithClassifier:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)Recognizer;
  v6 = [(Recognizer *)&v10 init];
  v7 = v6;
  if (v6)
  {
    CGSize size = CGRectNull.size;
    v6->_cropRect.origin = CGRectNull.origin;
    v6->_cropRect.CGSize size = size;
    objc_storeStrong((id *)&v6->_classifier, a3);
    v7->_threshold = 0.5;
    v7->_detectionOutputIsDouble = 1;
    [(Recognizer *)v7 reset];
  }

  return v7;
}

- (void)reset
{
  self->_confidence = 0.0;
  self->_recognitionTime = ($95D729B680665BEAEFA1D6FCA8238556)kCMTimeZero;
}

- (void)processImage:(__CVBuffer *)a3 withTimestamp:(id *)a4
{
  CVPixelBufferRetain(a3);
  int64_t var3 = a4->var3;
  *(_OWORD *)&self->_lastProcessedImageTime.value = *(_OWORD *)&a4->var0;
  self->_lastProcessedImageTime.epoch = var3;
  uint64_t v11 = 0;
  unsigned int v8 = [(Recognizer *)self recognize:a3 error:&v11];
  if (v11) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v8 == 0;
  }
  if (!v9)
  {
    long long v10 = *(_OWORD *)&a4->var0;
    self->_recognitionTime.epoch = a4->var3;
    *(_OWORD *)&self->_recognitionTime.value = v10;
  }
  CVPixelBufferRelease(a3);
}

- (BOOL)recognize:(__CVBuffer *)a3 error:(id *)a4
{
  v6 = -[Recognizer getSceneprintForImage:error:](self, "getSceneprintForImage:error:", a3);
  v7 = v6;
  if (v6)
  {
    id v8 = [v6 descriptorData];
    id v9 = [v8 bytes];

    id v10 = objc_alloc((Class)MLMultiArray);
    uint64_t v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v7 elementCount]);
    v12 = +[NSArray arrayWithObject:v11];
    v13 = +[NSNumber numberWithInt:1];
    v14 = +[NSArray arrayWithObject:v13];
    id v15 = [v10 initWithDataPointer:v9 shape:v12 dataType:65568 strides:v14 deallocator:0 error:a4];

    if (a4 && *a4)
    {
      v16 = 0;
    }
    else
    {
      v16 = [(RecognizerClassifier *)self->_classifier predictionFromImageDescriptors:v15 error:a4];
      if (!a4 || !*a4)
      {
        unsigned int v18 = [(Recognizer *)self detectionOutputIsDouble];
        id v19 = [v16 HomePodDetected];
        v20 = (double *)[v19 dataPointer];

        if (v18) {
          double v21 = *v20;
        }
        else {
          double v21 = *(float *)v20;
        }
        self->_confidence = v21;
        [(Recognizer *)self threshold];
        BOOL v17 = v21 > v22;
        [(Recognizer *)self threshold];
        goto LABEL_13;
      }
    }
    BOOL v17 = 0;
LABEL_13:

    goto LABEL_14;
  }
  BOOL v17 = 0;
LABEL_14:

  return v17;
}

- (id)getSceneprintForImage:(__CVBuffer *)a3 error:(id *)a4
{
  if (CGRectIsNull(self->_cropRect))
  {
    id v8 = [objc_alloc((Class)VNImageRequestHandler) initWithCVPixelBuffer:a3 options:&__NSDictionary0__struct];
  }
  else
  {
    id v9 = +[CIImage imageWithCVPixelBuffer:a3];
    id v10 = [v9 imageByCroppingToRect:self->_cropRect.origin.x, self->_cropRect.origin.y, self->_cropRect.size.width, self->_cropRect.size.height];

    id v8 = [objc_alloc((Class)VNImageRequestHandler) initWithCIImage:v10 options:&__NSDictionary0__struct];
  }
  id v11 = objc_alloc_init((Class)VNCreateSceneprintRequest);
  [v11 setRevision:2];
  [(Recognizer *)self handleVNRequest:v11 withHandler:v8 error:a4];
  v12 = [v11 results];
  v13 = [v12 firstObject];

  v14 = [v13 sceneprints];
  id v15 = [v14 count];

  if (v15)
  {
    v16 = [v13 sceneprints];
    BOOL v17 = [v16 objectAtIndexedSubscript:0];
LABEL_8:

    goto LABEL_9;
  }
  if (a4)
  {
    v16 = +[NSDictionary dictionaryWithObject:@"VNObservation returned nothing." forKey:NSLocalizedDescriptionKey];
    +[NSError errorWithDomain:@"com.apple.sauron.recognizer.ErrorDomain" code:1 userInfo:v16];
    BOOL v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  BOOL v17 = 0;
LABEL_9:

  if (v15) {
    id v18 = v17;
  }
  else {
    id v18 = 0;
  }

  return v18;
}

- (BOOL)handleVNRequest:(id)a3 withHandler:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = +[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", v7, 0);
  unsigned int v10 = [v8 performRequests:v9 error:a5];

  if (!v10) {
    goto LABEL_10;
  }
  if (!v7)
  {
    if (!a5) {
      goto LABEL_11;
    }
    NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
    CFStringRef v14 = @"VNRequest returned nil.";
    goto LABEL_9;
  }
  id v11 = [v7 results];
  id v12 = [v11 count];

  if (v12 != (id)1)
  {
    if (!a5) {
      goto LABEL_11;
    }
    NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
    CFStringRef v14 = @"VNRequest returned unexpected results count.";
LABEL_9:
    id v15 = +[NSDictionary dictionaryWithObject:v14 forKey:v13];
    *a5 = +[NSError errorWithDomain:@"com.apple.sauron.recognizer.ErrorDomain" code:1 userInfo:v15];

LABEL_10:
    LOBYTE(a5) = 0;
    goto LABEL_11;
  }
  LOBYTE(a5) = 1;
LABEL_11:

  return (char)a5;
}

- (id)getVisionFrameworkVersion
{
  if (qword_1000F0860 != -1) {
    dispatch_once(&qword_1000F0860, &stru_1000D9A60);
  }
  id v2 = (void *)off_1000ED230;

  return v2;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)recognitionTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 40);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastProcessedImageTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 64);
  return self;
}

- (double)confidence
{
  return self->_confidence;
}

- (CGRect)cropRect
{
  double x = self->_cropRect.origin.x;
  double y = self->_cropRect.origin.y;
  double width = self->_cropRect.size.width;
  double height = self->_cropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCropRect:(CGRect)a3
{
  self->_cropRect = a3;
}

- (double)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(double)a3
{
  self->_threshold = a3;
}

- (BOOL)detectionOutputIsDouble
{
  return self->_detectionOutputIsDouble;
}

- (void)setDetectionOutputIsDouble:(BOOL)a3
{
  self->_detectionOutputIsDouble = a3;
}

- (void).cxx_destruct
{
}

@end