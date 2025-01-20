@interface ARODTResult
- (__n128)setVisionTransform:(__n128)a3;
- (__n128)visionTransform;
- (double)estimatedScaleFactor;
- (unint64_t)detectedObjectID;
- (void)imageContext;
- (void)setDetectedObjectID:(unint64_t)a3;
- (void)setEstimatedScaleFactor:(double)a3;
- (void)setImageContext:(void *)a3;
@end

@implementation ARODTResult

- (unint64_t)detectedObjectID
{
  return self->_detectedObjectID;
}

- (void)setDetectedObjectID:(unint64_t)a3
{
  self->_detectedObjectID = a3;
}

- (__n128)visionTransform
{
  return a1[2];
}

- (__n128)setVisionTransform:(__n128)a3
{
  result[2] = a2;
  result[3] = a3;
  result[4] = a4;
  result[5] = a5;
  return result;
}

- (void)imageContext
{
  return self->_imageContext;
}

- (void)setImageContext:(void *)a3
{
  self->_imageContext = a3;
}

- (double)estimatedScaleFactor
{
  return self->_estimatedScaleFactor;
}

- (void)setEstimatedScaleFactor:(double)a3
{
  self->_estimatedScaleFactor = a3;
}

@end