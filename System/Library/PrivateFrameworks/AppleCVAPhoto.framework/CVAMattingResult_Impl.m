@interface CVAMattingResult_Impl
- (CVADisparityPostprocessingResult)disparityPostprocessingResult;
- (CVAMattingResult_Impl)initWithDisparityPostprocessingResult:(id)a3 alphaMattePixelBuffer:(__CVBuffer *)a4;
- (__CVBuffer)alphaMattePixelBuffer;
- (float)personSegmentationRatio;
- (void)dealloc;
@end

@implementation CVAMattingResult_Impl

- (void).cxx_destruct
{
}

- (float)personSegmentationRatio
{
  return self->_personSegmentationRatio;
}

- (__CVBuffer)alphaMattePixelBuffer
{
  return self->_alphaMattePixelBuffer;
}

- (CVADisparityPostprocessingResult)disparityPostprocessingResult
{
  return (CVADisparityPostprocessingResult *)objc_getProperty(self, a2, 16, 1);
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_alphaMattePixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)CVAMattingResult_Impl;
  [(CVAMattingResult_Impl *)&v3 dealloc];
}

- (CVAMattingResult_Impl)initWithDisparityPostprocessingResult:(id)a3 alphaMattePixelBuffer:(__CVBuffer *)a4
{
  id v7 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CVAMattingResult_Impl;
  v8 = [(CVAMattingResult_Impl *)&v10 init];
  objc_storeStrong((id *)&v8->_disparityPostprocessingResult, a3);
  v8->_alphaMattePixelBuffer = a4;
  CVPixelBufferRetain(a4);

  return v8;
}

@end