@interface BWIntelligentDistortionCorrectionProcessorInput
- (BOOL)applyStereoRectificationHomography;
- (BOOL)applyZoom;
- (BOOL)geometricDistortionCorrectionUsePrecomputedPolynomialsAndOpticalCenterOffset;
- (BOOL)processGeometricDistortionCorrection;
- (BOOL)processIntelligentDistortionCorrection;
- (BOOL)receivedAllInputs;
- (BOOL)useBilinearInterpolation;
- (BWIntelligentDistortionCorrectionProcessorInput)initWithSettings:(id)a3 portType:(id)a4;
- (BWIntelligentDistortionCorrectionProcessorInputDelegate)delegate;
- (CGPoint)geometricDistortionCorrectionOpticalCenterOffset;
- (NSData)geometricDistortionCorrectionForwardPolynomial;
- (NSData)geometricDistortionCorrectionInversePolynomial;
- (__n128)setStereoRectificationInverseHomography:(__n128)a3;
- (__n128)stereoRectificationInverseHomography;
- (id)description;
- (opaqueCMSampleBuffer)image;
- (unint64_t)imageBufferType;
- (void)addImage:(opaqueCMSampleBuffer *)a3 imageBufferType:(unint64_t)a4;
- (void)dealloc;
- (void)setApplyStereoRectificationHomography:(BOOL)a3;
- (void)setApplyZoom:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setGeometricDistortionCorrectionForwardPolynomial:(id)a3;
- (void)setGeometricDistortionCorrectionInversePolynomial:(id)a3;
- (void)setGeometricDistortionCorrectionOpticalCenterOffset:(CGPoint)a3;
- (void)setGeometricDistortionCorrectionUsePrecomputedPolynomialsAndOpticalCenterOffset:(BOOL)a3;
- (void)setProcessGeometricDistortionCorrection:(BOOL)a3;
- (void)setProcessIntelligentDistortionCorrection:(BOOL)a3;
- (void)setReceivedAllInputs:(BOOL)a3;
- (void)setUseBilinearInterpolation:(BOOL)a3;
@end

@implementation BWIntelligentDistortionCorrectionProcessorInput

- (BWIntelligentDistortionCorrectionProcessorInput)initWithSettings:(id)a3 portType:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)BWIntelligentDistortionCorrectionProcessorInput;
  result = [(BWStillImageProcessorControllerInput *)&v5 initWithSettings:a3 portType:a4];
  if (result) {
    result->_applyZoom = 1;
  }
  return result;
}

- (void)dealloc
{
  image = self->_image;
  if (image) {
    CFRelease(image);
  }

  v4.receiver = self;
  v4.super_class = (Class)BWIntelligentDistortionCorrectionProcessorInput;
  [(BWStillImageProcessorControllerInput *)&v4 dealloc];
}

- (BOOL)receivedAllInputs
{
  return self->_imageSet;
}

- (void)addImage:(opaqueCMSampleBuffer *)a3 imageBufferType:(unint64_t)a4
{
  image = self->_image;
  if (image)
  {
    CFRelease(image);
    self->_image = 0;
  }
  self->_imageSet = 1;
  self->_imageBufferType = a4;
  if (a3) {
    self->_image = (opaqueCMSampleBuffer *)CFRetain(a3);
  }
  delegate = self->_delegate;
  [(BWIntelligentDistortionCorrectionProcessorInputDelegate *)delegate inputReceivedNewInputData:self];
}

- (opaqueCMSampleBuffer)image
{
  return self->_image;
}

- (unint64_t)imageBufferType
{
  return self->_imageBufferType;
}

- (id)description
{
  v7 = NSString;
  uint64_t v3 = objc_opt_class();
  int64_t v4 = [(BWStillImageCaptureSettings *)[(BWStillImageProcessorControllerInput *)self captureSettings] settingsID];
  uint64_t v5 = BWPhotoEncoderStringFromEncodingScheme([(BWStillImageCaptureStreamSettings *)[(BWStillImageProcessorControllerInput *)self captureStreamSettings] captureType]);
  return (id)[v7 stringWithFormat:@"<%@ %p>: captureID:%lld, captureType=%@, %@ : gdc:%d idc:%d zoom:%d image:%p imageSet:%d (type:%@) delegate:%p", v3, self, v4, v5, -[BWStillImageCaptureStreamSettings portType](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "portType"), self->_processGeometricDistortionCorrection, self->_processIntelligentDistortionCorrection, self->_applyZoom, self->_image, self->_imageSet, BWStillImageBufferTypeToShortString(self->_imageBufferType), self->_delegate];
}

- (BOOL)processIntelligentDistortionCorrection
{
  return self->_processIntelligentDistortionCorrection;
}

- (void)setProcessIntelligentDistortionCorrection:(BOOL)a3
{
  self->_processIntelligentDistortionCorrection = a3;
}

- (BOOL)processGeometricDistortionCorrection
{
  return self->_processGeometricDistortionCorrection;
}

- (void)setProcessGeometricDistortionCorrection:(BOOL)a3
{
  self->_processGeometricDistortionCorrection = a3;
}

- (BOOL)applyZoom
{
  return self->_applyZoom;
}

- (void)setApplyZoom:(BOOL)a3
{
  self->_applyZoom = a3;
}

- (BWIntelligentDistortionCorrectionProcessorInputDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (NSData)geometricDistortionCorrectionForwardPolynomial
{
  return self->_geometricDistortionCorrectionForwardPolynomial;
}

- (void)setGeometricDistortionCorrectionForwardPolynomial:(id)a3
{
}

- (NSData)geometricDistortionCorrectionInversePolynomial
{
  return self->_geometricDistortionCorrectionInversePolynomial;
}

- (void)setGeometricDistortionCorrectionInversePolynomial:(id)a3
{
}

- (BOOL)applyStereoRectificationHomography
{
  return self->_applyStereoRectificationHomography;
}

- (void)setApplyStereoRectificationHomography:(BOOL)a3
{
  self->_applyStereoRectificationHomography = a3;
}

- (__n128)stereoRectificationInverseHomography
{
  return a1[8];
}

- (__n128)setStereoRectificationInverseHomography:(__n128)a3
{
  result[8] = a2;
  result[9] = a3;
  result[10] = a4;
  return result;
}

- (BOOL)useBilinearInterpolation
{
  return self->_useBilinearInterpolation;
}

- (void)setUseBilinearInterpolation:(BOOL)a3
{
  self->_useBilinearInterpolation = a3;
}

- (CGPoint)geometricDistortionCorrectionOpticalCenterOffset
{
  double x = self->_geometricDistortionCorrectionOpticalCenterOffset.x;
  double y = self->_geometricDistortionCorrectionOpticalCenterOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setGeometricDistortionCorrectionOpticalCenterOffset:(CGPoint)a3
{
  self->_geometricDistortionCorrectionOpticalCenterOffset = a3;
}

- (BOOL)geometricDistortionCorrectionUsePrecomputedPolynomialsAndOpticalCenterOffset
{
  return self->_geometricDistortionCorrectionUsePrecomputedPolynomialsAndOpticalCenterOffset;
}

- (void)setGeometricDistortionCorrectionUsePrecomputedPolynomialsAndOpticalCenterOffset:(BOOL)a3
{
  self->_geometricDistortionCorrectionUsePrecomputedPolynomialsAndOpticalCenterOffset = a3;
}

- (void)setReceivedAllInputs:(BOOL)a3
{
  self->_receivedAllInputs = a3;
}

@end