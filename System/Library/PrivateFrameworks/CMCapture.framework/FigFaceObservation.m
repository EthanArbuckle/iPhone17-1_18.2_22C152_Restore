@interface FigFaceObservation
- (BOOL)isEqual:(id)a3;
- (FigFaceObservation)initWithFaceObservation:(id)a3 faceID:(unint64_t)a4 time:(unint64_t)a5;
- (VNFaceObservation)faceObservation;
- (VNTrackObjectRequest)faceTrackingRequest;
- (unint64_t)faceID;
- (unint64_t)lastUpdatedTime;
- (void)dealloc;
- (void)setLastUpdatedTime:(unint64_t)a3;
@end

@implementation FigFaceObservation

- (FigFaceObservation)initWithFaceObservation:(id)a3 faceID:(unint64_t)a4 time:(unint64_t)a5
{
  if (!a3) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"faceObservation must not be nil" userInfo:0]);
  }
  v10.receiver = self;
  v10.super_class = (Class)FigFaceObservation;
  v8 = [(FigFaceObservation *)&v10 init];
  if (v8)
  {
    v8->_faceObservation = (VNFaceObservation *)a3;
    v8->_faceID = a4;
    v8->_faceTrackingRequest = (VNTrackObjectRequest *)[objc_alloc((Class)getVNTrackObjectRequestClass()) initWithDetectedObjectObservation:v8->_faceObservation];
    v8->_lastUpdatedTime = a5;
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigFaceObservation;
  [(FigFaceObservation *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  unint64_t v5 = [(FigFaceObservation *)self faceID];
  return v5 == [a3 faceID];
}

- (VNFaceObservation)faceObservation
{
  return self->_faceObservation;
}

- (VNTrackObjectRequest)faceTrackingRequest
{
  return self->_faceTrackingRequest;
}

- (unint64_t)faceID
{
  return self->_faceID;
}

- (unint64_t)lastUpdatedTime
{
  return self->_lastUpdatedTime;
}

- (void)setLastUpdatedTime:(unint64_t)a3
{
  self->_lastUpdatedTime = a3;
}

@end