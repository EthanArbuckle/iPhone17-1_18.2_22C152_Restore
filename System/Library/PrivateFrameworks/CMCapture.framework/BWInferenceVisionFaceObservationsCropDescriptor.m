@interface BWInferenceVisionFaceObservationsCropDescriptor
- ($2825F4736939C4A6D3AD43837233062D)maxCropForDimensions:(id)a3;
- (BOOL)applicableToSampleBuffer:(opaqueCMSampleBuffer *)a3 forMediaKey:(id)a4;
- (BWInferenceVisionFaceObservationsCropDescriptor)initWithFaceIndex:(unint64_t)a3;
- (CGRect)rectForSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (char)identifier;
@end

@implementation BWInferenceVisionFaceObservationsCropDescriptor

- (BWInferenceVisionFaceObservationsCropDescriptor)initWithFaceIndex:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BWInferenceVisionFaceObservationsCropDescriptor;
  result = [(BWInferenceVisionFaceObservationsCropDescriptor *)&v5 init];
  if (result) {
    result->_faceIndex = a3;
  }
  return result;
}

- (char)identifier
{
  return LOBYTE(self->_faceIndex) + 3;
}

- (CGRect)rectForSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  objc_msgSend((id)objc_msgSend((id)BWInferenceGetAttachedInference(a3, 802, 0x1EFA6A0A0), "objectAtIndexedSubscript:", self->_faceIndex), "boundingBox");
  double v7 = 1.0 - (v6 + v5);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v7;
  result.origin.x = v3;
  return result;
}

- (BOOL)applicableToSampleBuffer:(opaqueCMSampleBuffer *)a3 forMediaKey:(id)a4
{
  return objc_msgSend((id)BWInferenceGetAttachedInference(a3, 802, 0x1EFA6A0A0), "count") > self->_faceIndex;
}

- ($2825F4736939C4A6D3AD43837233062D)maxCropForDimensions:(id)a3
{
  return a3;
}

@end