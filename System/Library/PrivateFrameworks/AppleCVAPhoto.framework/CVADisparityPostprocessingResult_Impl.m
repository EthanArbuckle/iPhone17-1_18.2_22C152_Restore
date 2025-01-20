@interface CVADisparityPostprocessingResult_Impl
- (CVADisparityPostprocessingResult_Impl)initWithPostprocessedDisparityBuffer:(__CVBuffer *)a3 canonicalDisparityPixelBuffer:(__CVBuffer *)a4 focusCanonicalDisparity:(float)a5 backgroundDisparitySum:(float)a6 backgroundDisparitySumVariance:(float)a7 backgroundDisparityRatio:(float)a8 invalidDisparityRatio:(float)a9 invalidDisparityRatioVariance:(float)a10 deltaCanonicalDisparity:(float)a11 backgroundSeparationLikelihood:(float)a12 closeCanonicalDisparityAverage:(float)a13 faceCanonicalDisparityAverage:(id)a14 faceInvalidDisparityRatio:(id)a15 foregroundRatio:(float)a16 erodedForegroundRatio:(float)a17 personSegmentationRatio:(float)a18;
- (NSArray)faceCanonicalDisparityAverage;
- (NSArray)faceInvalidDisparityRatio;
- (__CVBuffer)canonicalDisparityPixelBuffer;
- (__CVBuffer)postprocessedDisparityPixelBuffer;
- (float)backgroundDisparityRatio;
- (float)backgroundDisparitySum;
- (float)backgroundDisparitySumVariance;
- (float)backgroundSeparationLikelihood;
- (float)closeCanonicalDisparityAverage;
- (float)deltaCanonicalDisparity;
- (float)erodedForegroundRatio;
- (float)focusDisparity;
- (float)foregroundRatio;
- (float)invalidDisparityRatio;
- (float)invalidDisparityRatioVariance;
- (float)personSegmentationRatio;
- (void)dealloc;
@end

@implementation CVADisparityPostprocessingResult_Impl

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceInvalidDisparityRatio, 0);

  objc_storeStrong((id *)&self->_faceCanonicalDisparityAverage, 0);
}

- (__CVBuffer)canonicalDisparityPixelBuffer
{
  return self->_canonicalDisparityPixelBuffer;
}

- (float)personSegmentationRatio
{
  return self->_personSegmentationRatio;
}

- (float)erodedForegroundRatio
{
  return self->_erodedForegroundRatio;
}

- (float)foregroundRatio
{
  return self->_foregroundRatio;
}

- (NSArray)faceInvalidDisparityRatio
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (NSArray)faceCanonicalDisparityAverage
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (float)closeCanonicalDisparityAverage
{
  return self->_closeCanonicalDisparityAverage;
}

- (float)backgroundSeparationLikelihood
{
  return self->_backgroundSeparationLikelihood;
}

- (float)invalidDisparityRatioVariance
{
  return self->_invalidDisparityRatioVariance;
}

- (float)invalidDisparityRatio
{
  return self->_invalidDisparityRatio;
}

- (float)backgroundDisparityRatio
{
  return self->_backgroundDisparityRatio;
}

- (float)backgroundDisparitySumVariance
{
  return self->_backgroundDisparitySumVariance;
}

- (float)backgroundDisparitySum
{
  return self->_backgroundDisparitySum;
}

- (float)deltaCanonicalDisparity
{
  return self->_deltaCanonicalDisparity;
}

- (float)focusDisparity
{
  return self->_focusDisparity;
}

- (__CVBuffer)postprocessedDisparityPixelBuffer
{
  return self->_postprocessedDisparityPixelBuffer;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_postprocessedDisparityPixelBuffer);
  CVPixelBufferRelease(self->_canonicalDisparityPixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)CVADisparityPostprocessingResult_Impl;
  [(CVADisparityPostprocessingResult_Impl *)&v3 dealloc];
}

- (CVADisparityPostprocessingResult_Impl)initWithPostprocessedDisparityBuffer:(__CVBuffer *)a3 canonicalDisparityPixelBuffer:(__CVBuffer *)a4 focusCanonicalDisparity:(float)a5 backgroundDisparitySum:(float)a6 backgroundDisparitySumVariance:(float)a7 backgroundDisparityRatio:(float)a8 invalidDisparityRatio:(float)a9 invalidDisparityRatioVariance:(float)a10 deltaCanonicalDisparity:(float)a11 backgroundSeparationLikelihood:(float)a12 closeCanonicalDisparityAverage:(float)a13 faceCanonicalDisparityAverage:(id)a14 faceInvalidDisparityRatio:(id)a15 foregroundRatio:(float)a16 erodedForegroundRatio:(float)a17 personSegmentationRatio:(float)a18
{
  v27 = (NSArray *)a14;
  v28 = (NSArray *)a15;
  v37.receiver = self;
  v37.super_class = (Class)CVADisparityPostprocessingResult_Impl;
  v29 = [(CVADisparityPostprocessingResult_Impl *)&v37 init];
  v29->_postprocessedDisparityPixelBuffer = a3;
  CVPixelBufferRetain(a3);
  v29->_canonicalDisparityPixelBuffer = a4;
  CVPixelBufferRetain(a4);
  v29->_backgroundDisparitySum = a6;
  v29->_backgroundDisparitySumVariance = a7;
  v29->_backgroundDisparityRatio = a8;
  v29->_invalidDisparityRatio = a9;
  v29->_invalidDisparityRatioVariance = a10;
  v29->_backgroundSeparationLikelihood = a12;
  v29->_focusDisparity = a5;
  v29->_deltaCanonicalDisparity = a11;
  v29->_closeCanonicalDisparityAverage = a13;
  faceCanonicalDisparityAverage = v29->_faceCanonicalDisparityAverage;
  v29->_faceCanonicalDisparityAverage = v27;
  v31 = v27;

  faceInvalidDisparityRatio = v29->_faceInvalidDisparityRatio;
  v29->_faceInvalidDisparityRatio = v28;

  v29->_foregroundRatio = a16;
  v29->_erodedForegroundRatio = a17;
  v29->_personSegmentationRatio = a18;
  return v29;
}

@end