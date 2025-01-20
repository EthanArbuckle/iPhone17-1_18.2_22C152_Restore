@interface BWStreamingPersonSegmentationConfiguration
- (BOOL)cropColorInputToPrimaryCaptureRect;
- (BOOL)propagateColorInput;
- (BOOL)useLowFrameRateOptimizedNetwork;
- (NSString)alternativeStreamingPersonSegmentationMaskKey;
- (NSString)alternativeStreamingSkinSegmentationMaskKey;
- (int)inputRotationAngle;
- (void)dealloc;
- (void)setAlternativeStreamingPersonSegmentationMaskKey:(id)a3;
- (void)setAlternativeStreamingSkinSegmentationMaskKey:(id)a3;
- (void)setCropColorInputToPrimaryCaptureRect:(BOOL)a3;
- (void)setInputRotationAngle:(int)a3;
- (void)setPropagateColorInput:(BOOL)a3;
- (void)setUseLowFrameRateOptimizedNetwork:(BOOL)a3;
@end

@implementation BWStreamingPersonSegmentationConfiguration

- (BOOL)cropColorInputToPrimaryCaptureRect
{
  return self->_cropColorInputToPrimaryCaptureRect;
}

- (void)setInputRotationAngle:(int)a3
{
  self->_inputRotationAngle = a3;
}

- (void)setCropColorInputToPrimaryCaptureRect:(BOOL)a3
{
  self->_cropColorInputToPrimaryCaptureRect = a3;
}

- (void)setUseLowFrameRateOptimizedNetwork:(BOOL)a3
{
  self->_useLowFrameRateOptimizedNetwork = a3;
}

- (void)setPropagateColorInput:(BOOL)a3
{
  self->_propagateColorInput = a3;
}

- (void)setAlternativeStreamingSkinSegmentationMaskKey:(id)a3
{
}

- (void)setAlternativeStreamingPersonSegmentationMaskKey:(id)a3
{
}

- (BOOL)useLowFrameRateOptimizedNetwork
{
  return self->_useLowFrameRateOptimizedNetwork;
}

- (BOOL)propagateColorInput
{
  return self->_propagateColorInput;
}

- (int)inputRotationAngle
{
  return self->_inputRotationAngle;
}

- (NSString)alternativeStreamingSkinSegmentationMaskKey
{
  return self->_alternativeStreamingSkinSegmentationMaskKey;
}

- (NSString)alternativeStreamingPersonSegmentationMaskKey
{
  return self->_alternativeStreamingPersonSegmentationMaskKey;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWStreamingPersonSegmentationConfiguration;
  [(BWInferenceConfiguration *)&v3 dealloc];
}

@end