@interface VNLKTOpticalFlow
- (BOOL)_validateInputImage:(__CVBuffer *)a3 error:(id *)a4;
- (BOOL)_validateOutputImage:(__CVBuffer *)a3 error:(id *)a4;
- (BOOL)estimateFlowFromReference:(__CVBuffer *)a3 target:(__CVBuffer *)a4 error:(id *)a5;
- (BOOL)estimateFlowStream:(__CVBuffer *)a3 error:(id *)a4;
- (BOOL)isValid;
- (BOOL)setOutputUV:(__CVBuffer *)a3 error:(id *)a4;
- (BOOL)useNonLocalRegularization;
- (VNLKTOpticalFlow)initWithWidth:(int)a3 height:(int)a4 numScales:(int)a5;
- (float)nlreg_sigma_c;
- (float)nlreg_sigma_l;
- (float)nlreg_sigma_w;
- (int)height;
- (int)levelCount;
- (int)nlreg_padding;
- (int)nlreg_radius;
- (int)numScales;
- (int)numWarpings;
- (int)width;
- (unsigned)outputPixelFormat;
- (void)setIsValid:(BOOL)a3;
- (void)setNlreg_padding:(int)a3;
- (void)setNlreg_radius:(int)a3;
- (void)setNlreg_sigma_c:(float)a3;
- (void)setNlreg_sigma_l:(float)a3;
- (void)setNlreg_sigma_w:(float)a3;
- (void)setNumWarpings:(int)a3;
- (void)setOutputPixelFormat:(unsigned int)a3;
- (void)setUseNonLocalRegularization:(BOOL)a3;
@end

@implementation VNLKTOpticalFlow

- (void)setNlreg_sigma_w:(float)a3
{
  self->_nlreg_sigma_w = a3;
}

- (float)nlreg_sigma_w
{
  return self->_nlreg_sigma_w;
}

- (void)setNlreg_sigma_c:(float)a3
{
  self->_nlreg_sigma_c = a3;
}

- (float)nlreg_sigma_c
{
  return self->_nlreg_sigma_c;
}

- (void)setNlreg_sigma_l:(float)a3
{
  self->_nlreg_sigma_l = a3;
}

- (float)nlreg_sigma_l
{
  return self->_nlreg_sigma_l;
}

- (void)setNlreg_padding:(int)a3
{
  self->_nlreg_padding = a3;
}

- (int)nlreg_padding
{
  return self->_nlreg_padding;
}

- (void)setNlreg_radius:(int)a3
{
  self->_nlreg_radius = a3;
}

- (int)nlreg_radius
{
  return self->_nlreg_radius;
}

- (void)setUseNonLocalRegularization:(BOOL)a3
{
  self->_useNonLocalRegularization = a3;
}

- (BOOL)useNonLocalRegularization
{
  return self->_useNonLocalRegularization;
}

- (void)setNumWarpings:(int)a3
{
  self->_numWarpings = a3;
}

- (int)numWarpings
{
  return self->_numWarpings;
}

- (void)setOutputPixelFormat:(unsigned int)a3
{
  self->_outputPixelFormat = a3;
}

- (unsigned)outputPixelFormat
{
  return self->_outputPixelFormat;
}

- (int)numScales
{
  return self->_numScales;
}

- (int)levelCount
{
  return self->_levelCount;
}

- (int)height
{
  return self->_height;
}

- (int)width
{
  return self->_width;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (BOOL)_validateOutputImage:(__CVBuffer *)a3 error:(id *)a4
{
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (PixelFormatType == 843264102 || PixelFormatType == 843264104)
  {
    size_t Width = CVPixelBufferGetWidth(a3);
    if (Width == [(VNLKTOpticalFlow *)self width])
    {
      size_t Height = CVPixelBufferGetHeight(a3);
      if (Height == [(VNLKTOpticalFlow *)self height]) {
        return 1;
      }
    }
    if (a4)
    {
      v11 = @"Output image has invalid width/height";
LABEL_10:
      id v12 = +[VNError errorWithCode:14 message:v11];
      BOOL result = 0;
      *a4 = v12;
      return result;
    }
  }
  else if (a4)
  {
    v11 = @"Output image has invalid pixel format";
    goto LABEL_10;
  }
  return 0;
}

- (BOOL)_validateInputImage:(__CVBuffer *)a3 error:(id *)a4
{
  if (CVPixelBufferGetPixelFormatType(a3) == 1111970369)
  {
    size_t Width = CVPixelBufferGetWidth(a3);
    if (Width == [(VNLKTOpticalFlow *)self width])
    {
      size_t Height = CVPixelBufferGetHeight(a3);
      if (Height == [(VNLKTOpticalFlow *)self height]) {
        return 1;
      }
    }
    if (a4)
    {
      v10 = @"Input image has invalid width/height";
      goto LABEL_9;
    }
  }
  else if (a4)
  {
    v10 = @"Input image has invalid pixel format";
LABEL_9:
    id v11 = +[VNError errorWithCode:14 message:v10];
    BOOL result = 0;
    *a4 = v11;
    return result;
  }
  return 0;
}

- (BOOL)estimateFlowStream:(__CVBuffer *)a3 error:(id *)a4
{
  if (a4)
  {
    *a4 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Not implemented in abstract class"];
  }
  return 0;
}

- (BOOL)estimateFlowFromReference:(__CVBuffer *)a3 target:(__CVBuffer *)a4 error:(id *)a5
{
  if (a5)
  {
    *a5 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Not implemented in abstract class", a4];
  }
  return 0;
}

- (BOOL)setOutputUV:(__CVBuffer *)a3 error:(id *)a4
{
  if (a4)
  {
    *a4 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Not implemented in abstract class"];
  }
  return 0;
}

- (VNLKTOpticalFlow)initWithWidth:(int)a3 height:(int)a4 numScales:(int)a5
{
  v9.receiver = self;
  v9.super_class = (Class)VNLKTOpticalFlow;
  BOOL result = [(VNLKTOpticalFlow *)&v9 init];
  if (result)
  {
    result->_isValid = 0;
    result->_width = a3;
    result->_height = a4;
    result->_levelCount = a5;
    result->_numScales = a5;
  }
  return result;
}

@end