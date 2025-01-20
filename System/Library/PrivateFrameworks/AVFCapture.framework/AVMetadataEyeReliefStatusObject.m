@interface AVMetadataEyeReliefStatusObject
+ (id)eyeReliefStatusObjectWithEyeReliefStatus:(unint64_t)a3 input:(id)a4 time:(id *)a5 optionalInfoDict:(id)a6;
- (AVMetadataEyeReliefStatusObject)initWithEyeReliefStatus:(unint64_t)a3 time:(id *)a4 sourceCaptureInput:(id)a5 optionalInfoDict:(id)a6;
- (BOOL)hasDistance;
- (double)distance;
- (id)description;
- (id)initDerivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6;
- (unint64_t)eyeReliefStatus;
@end

@implementation AVMetadataEyeReliefStatusObject

+ (id)eyeReliefStatusObjectWithEyeReliefStatus:(unint64_t)a3 input:(id)a4 time:(id *)a5 optionalInfoDict:(id)a6
{
  id v10 = objc_alloc((Class)objc_opt_class());
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a5;
  return (id)[v10 initWithEyeReliefStatus:a3 time:&v12 sourceCaptureInput:a4 optionalInfoDict:a6];
}

- (AVMetadataEyeReliefStatusObject)initWithEyeReliefStatus:(unint64_t)a3 time:(id *)a4 sourceCaptureInput:(id)a5 optionalInfoDict:(id)a6
{
  long long v8 = *MEMORY[0x1E4F1F9F8];
  uint64_t v19 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  double v9 = *MEMORY[0x1E4F1DB28];
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  long long v18 = v8;
  v21.receiver = self;
  v21.super_class = (Class)AVMetadataEyeReliefStatusObject;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v20 = *a4;
  v13 = [(AVMetadataObject *)&v21 initWithType:@"EyeReliefStatus", &v20, &v18, 0, 0, a5, v9, v10, v11, v12 time duration bounds optionalInfoDict originalMetadataObject sourceCaptureInput];
  v14 = v13;
  if (v13)
  {
    v13->_eyeReliefStatus = a3;
    v15 = (void *)[a6 objectForKeyedSubscript:*MEMORY[0x1E4F524E8]];
    if (v15)
    {
      [v15 floatValue];
      v14->_distance = v16;
      v14->_hasDistance = 1;
    }
  }
  return v14;
}

- (id)initDerivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6
{
  uint64_t v8 = objc_msgSend(a3, "eyeReliefStatus", a6);
  if (a3) {
    [a3 time];
  }
  else {
    memset(v13, 0, sizeof(v13));
  }
  double v9 = -[AVMetadataEyeReliefStatusObject initWithEyeReliefStatus:time:sourceCaptureInput:optionalInfoDict:](self, "initWithEyeReliefStatus:time:sourceCaptureInput:optionalInfoDict:", v8, v13, [a3 input], 0);
  if (v9)
  {
    int v10 = [a3 hasDistance];
    v9->_hasDistance = v10;
    if (v10)
    {
      [a3 distance];
      v9->_distance = v11;
    }
  }
  return v9;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self->_hasDistance) {
    double distance = self->_distance;
  }
  else {
    double distance = -1.0;
  }
  return (id)[v3 stringWithFormat:@"%@: %p eyeReliefStatus: %d, distance: %f", v4, self, self->_eyeReliefStatus, *(void *)&distance];
}

- (unint64_t)eyeReliefStatus
{
  return self->_eyeReliefStatus;
}

- (BOOL)hasDistance
{
  return self->_hasDistance;
}

- (double)distance
{
  if ([(AVMetadataEyeReliefStatusObject *)self hasDistance]) {
    return self->_distance;
  }
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v4);
  }
  NSLog(&cfstr_SuppressingExc.isa, v4);
  return 0.0;
}

@end