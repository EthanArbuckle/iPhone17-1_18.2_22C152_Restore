@interface VNTrackObjectRequest
+ (const)revisionAvailability;
+ (id)trackerTypeForRequestRevision:(unint64_t)a3 error:(id *)a4;
+ (unsigned)frameCVPixelBufferFormatForRequestRevision:(unint64_t)a3;
- (CGSize)trackingFrameSizeInPixels;
- (VNTrackObjectRequest)initWithDetectedObjectObservation:(VNDetectedObjectObservation *)observation;
- (VNTrackObjectRequest)initWithDetectedObjectObservation:(VNDetectedObjectObservation *)observation completionHandler:(VNRequestCompletionHandler)completionHandler;
- (id)_trackingLevelOptionFromTrackingLevelEnum;
- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4;
- (void)setTrackingFrameSizeInPixels:(CGSize)a3;
- (void)setTrackingLevel:(unint64_t)a3;
@end

@implementation VNTrackObjectRequest

+ (unsigned)frameCVPixelBufferFormatForRequestRevision:(unint64_t)a3
{
  if (a3 == 2) {
    return 1111970369;
  }
  uint64_t v7 = v3;
  uint64_t v8 = v4;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___VNTrackObjectRequest;
  return objc_msgSendSuper2(&v6, sel_frameCVPixelBufferFormatForRequestRevision_);
}

+ (id)trackerTypeForRequestRevision:(unint64_t)a3 error:(id *)a4
{
  if (a3 == 2)
  {
    uint64_t v4 = @"VNObjectTrackerRevision2Type";
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    uint64_t v4 = @"VNObjectTrackerRevision1Type";
LABEL_5:
    v5 = v4;
    goto LABEL_9;
  }
  if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequestClass:](VNError, "errorForUnsupportedRevision:ofRequestClass:");
    uint64_t v4 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v4 = 0;
  }
LABEL_9:

  return v4;
}

- (CGSize)trackingFrameSizeInPixels
{
  double width = self->_trackingFrameSizeInPixels.width;
  double height = self->_trackingFrameSizeInPixels.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)_trackingLevelOptionFromTrackingLevelEnum
{
  if ([(VNRequest *)self revision] == 2)
  {
    uint64_t v3 = @"VNTrackingOption_TrackingLevelRPN";
    uint64_t v4 = @"VNTrackingOption_TrackingLevelRPN";
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)VNTrackObjectRequest;
    uint64_t v3 = [(VNTrackingRequest *)&v6 _trackingLevelOptionFromTrackingLevelEnum];
  }

  return v3;
}

- (void)setTrackingFrameSizeInPixels:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  if ([(VNRequest *)self revision] != 1)
  {
    self->_trackingFrameSizeInPixels.CGFloat width = width;
    self->_trackingFrameSizeInPixels.CGFloat height = height;
  }
}

- (void)setTrackingLevel:(unint64_t)a3
{
  if ([(VNRequest *)self revision] != 2)
  {
    v5.receiver = self;
    v5.super_class = (Class)VNTrackObjectRequest;
    [(VNTrackingRequest *)&v5 setTrackingLevel:a3];
  }
}

- (VNTrackObjectRequest)initWithDetectedObjectObservation:(VNDetectedObjectObservation *)observation completionHandler:(VNRequestCompletionHandler)completionHandler
{
  v8.receiver = self;
  v8.super_class = (Class)VNTrackObjectRequest;
  uint64_t v4 = [(VNTrackingRequest *)&v8 initWithDetectedObjectObservation:observation completionHandler:completionHandler];
  objc_super v5 = (VNTrackObjectRequest *)v4;
  if (v4)
  {
    *(_OWORD *)(v4 + 136) = *MEMORY[0x1E4F1DB30];
    objc_super v6 = v4;
  }

  return v5;
}

- (VNTrackObjectRequest)initWithDetectedObjectObservation:(VNDetectedObjectObservation *)observation
{
  return [(VNTrackObjectRequest *)self initWithDetectedObjectObservation:observation completionHandler:0];
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)VNTrackObjectRequest;
  id v5 = [(VNTrackingRequest *)&v12 newDefaultDetectorOptionsForRequestRevision:a3 session:a4];
  if ([(VNRequest *)self revision] == 2)
  {
    [(VNTrackObjectRequest *)self trackingFrameSizeInPixels];
    double v7 = v6;
    v9 = [NSNumber numberWithUnsignedInteger:(unint64_t)v8];
    [v5 setObject:v9 forKeyedSubscript:@"VNTrackingOption_InputImageMaxWidth"];

    v10 = [NSNumber numberWithUnsignedInteger:(unint64_t)v7];
    [v5 setObject:v10 forKeyedSubscript:@"VNTrackingOption_InputImageMaxHeight"];
  }
  return v5;
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNTrackObjectRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end