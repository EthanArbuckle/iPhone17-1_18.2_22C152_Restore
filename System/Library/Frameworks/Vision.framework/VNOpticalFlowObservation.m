@interface VNOpticalFlowObservation
+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3;
- (VNImageSignature)targetImageSignature;
- (VNLKTOpticalFlow)opticalFlow;
- (void)setOpticalFlow:(id)a3;
- (void)setTargetImageSignature:(id)a3;
@end

@implementation VNOpticalFlowObservation

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return @"VNGenerateOpticalFlowRequest";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_opticalFlow, 0);

  objc_storeStrong((id *)&self->_targetImageSignature, 0);
}

- (void)setOpticalFlow:(id)a3
{
}

- (VNLKTOpticalFlow)opticalFlow
{
  return self->_opticalFlow;
}

- (void)setTargetImageSignature:(id)a3
{
}

- (VNImageSignature)targetImageSignature
{
  return self->_targetImageSignature;
}

@end