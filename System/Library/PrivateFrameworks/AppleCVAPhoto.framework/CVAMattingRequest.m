@interface CVAMattingRequest
- (CGRect)primaryCaptureRect;
- (CVADisparityPostprocessingRequest)disparityPostprocessingRequest;
- (CVAMattingRequest)initWithDisparityPostprocessingRequest:(id)a3 segmentationPixelBuffer:(__CVBuffer *)a4 skinSegmentationPixelBuffer:(__CVBuffer *)a5 destinationAlphaMattePixelBuffer:(__CVBuffer *)a6 error:(id *)a7;
- (CVAMattingRequest)initWithDisparityPostprocessingRequest:(id)a3 segmentationPixelBuffer:(__CVBuffer *)a4 skinSegmentationPixelBuffer:(__CVBuffer *)a5 primaryCaptureRect:(CGRect)a6 destinationAlphaMattePixelBuffer:(__CVBuffer *)a7 error:(id *)a8;
- (__CVBuffer)destinationAlphaMattePixelBuffer;
- (__CVBuffer)segmentationPixelBuffer;
- (__CVBuffer)skinSegmentationPixelBuffer;
- (void)dealloc;
@end

@implementation CVAMattingRequest

- (void).cxx_destruct
{
}

- (__CVBuffer)destinationAlphaMattePixelBuffer
{
  return self->_destinationAlphaMattePixelBuffer;
}

- (CGRect)primaryCaptureRect
{
  objc_copyStruct(v6, &self->_primaryCaptureRect, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (__CVBuffer)skinSegmentationPixelBuffer
{
  return self->_skinSegmentationPixelBuffer;
}

- (__CVBuffer)segmentationPixelBuffer
{
  return self->_segmentationPixelBuffer;
}

- (CVADisparityPostprocessingRequest)disparityPostprocessingRequest
{
  return (CVADisparityPostprocessingRequest *)objc_getProperty(self, a2, 8, 1);
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_destinationAlphaMattePixelBuffer);
  CVPixelBufferRelease(self->_segmentationPixelBuffer);
  CVPixelBufferRelease(self->_skinSegmentationPixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)CVAMattingRequest;
  [(CVAMattingRequest *)&v3 dealloc];
}

- (CVAMattingRequest)initWithDisparityPostprocessingRequest:(id)a3 segmentationPixelBuffer:(__CVBuffer *)a4 skinSegmentationPixelBuffer:(__CVBuffer *)a5 primaryCaptureRect:(CGRect)a6 destinationAlphaMattePixelBuffer:(__CVBuffer *)a7 error:(id *)a8
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  id v18 = a3;
  v19 = v18;
  if (a8) {
    *a8 = 0;
  }
  if (v18)
  {
    v26.receiver = self;
    v26.super_class = (Class)CVAMattingRequest;
    v20 = [(CVAMattingRequest *)&v26 init];
    v21 = v20;
    if (v20)
    {
      objc_storeStrong((id *)&v20->_disparityPostprocessingRequest, a3);
      v21->_skinSegmentationPixelBuffer = a5;
      v21->_destinationAlphaMattePixelBuffer = a7;
      v21->_segmentationPixelBuffer = a4;
      v21->_primaryCaptureRect.origin.CGFloat x = x;
      v21->_primaryCaptureRect.origin.CGFloat y = y;
      v21->_primaryCaptureRect.size.CGFloat width = width;
      v21->_primaryCaptureRect.size.CGFloat height = height;
      CVPixelBufferRetain(a4);
      CVPixelBufferRetain(v21->_skinSegmentationPixelBuffer);
      CVPixelBufferRetain(v21->_destinationAlphaMattePixelBuffer);
    }
  }
  else
  {
    v22 = NSString;
    v23 = [NSString stringWithFormat:@"segmentation-only matting is not implemented!"];
    v24 = [v22 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAMattingRequest initWithDisparityPostprocessingRequest:segmentationPixelBuffer:skinSegmentationPixelBuffer:primaryCaptureRect:destinationAlphaMattePixelBuffer:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipelineRequest.mm", 214, v23];
    sub_1BA8161F4(1, a8, 0, 4294944394, v24);

    v21 = 0;
  }

  return v21;
}

- (CVAMattingRequest)initWithDisparityPostprocessingRequest:(id)a3 segmentationPixelBuffer:(__CVBuffer *)a4 skinSegmentationPixelBuffer:(__CVBuffer *)a5 destinationAlphaMattePixelBuffer:(__CVBuffer *)a6 error:(id *)a7
{
  id v12 = a3;
  size_t Width = CVPixelBufferGetWidth((CVPixelBufferRef)[v12 sourceColorPixelBuffer]);
  v14 = -[CVAMattingRequest initWithDisparityPostprocessingRequest:segmentationPixelBuffer:skinSegmentationPixelBuffer:primaryCaptureRect:destinationAlphaMattePixelBuffer:error:](self, "initWithDisparityPostprocessingRequest:segmentationPixelBuffer:skinSegmentationPixelBuffer:primaryCaptureRect:destinationAlphaMattePixelBuffer:error:", v12, a4, a5, a6, a7, 0.0, 0.0, (double)Width, (double)CVPixelBufferGetHeight((CVPixelBufferRef)[v12 sourceColorPixelBuffer]));

  return v14;
}

@end