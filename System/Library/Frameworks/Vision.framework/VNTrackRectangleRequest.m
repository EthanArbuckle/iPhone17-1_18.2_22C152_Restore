@interface VNTrackRectangleRequest
+ (const)revisionAvailability;
+ (id)trackerTypeForRequestRevision:(unint64_t)a3 error:(id *)a4;
- (VNTrackRectangleRequest)initWithRectangleObservation:(VNRectangleObservation *)observation;
- (VNTrackRectangleRequest)initWithRectangleObservation:(VNRectangleObservation *)observation completionHandler:(VNRequestCompletionHandler)completionHandler;
@end

@implementation VNTrackRectangleRequest

- (VNTrackRectangleRequest)initWithRectangleObservation:(VNRectangleObservation *)observation completionHandler:(VNRequestCompletionHandler)completionHandler
{
  v5.receiver = self;
  v5.super_class = (Class)VNTrackRectangleRequest;
  return [(VNTrackingRequest *)&v5 initWithDetectedObjectObservation:observation completionHandler:completionHandler];
}

- (VNTrackRectangleRequest)initWithRectangleObservation:(VNRectangleObservation *)observation
{
  return [(VNTrackRectangleRequest *)self initWithRectangleObservation:observation completionHandler:0];
}

+ (id)trackerTypeForRequestRevision:(unint64_t)a3 error:(id *)a4
{
  if (a3 == 1)
  {
    v4 = @"VNRectangleTrackerType";
    objc_super v5 = @"VNRectangleTrackerType";
  }
  else if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequestClass:](VNError, "errorForUnsupportedRevision:ofRequestClass:");
    v4 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNTrackRectangleRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end