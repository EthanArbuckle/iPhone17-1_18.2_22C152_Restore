@interface VCPTransforms
- (__CVBuffer)cropAndScale:(__CVBuffer *)a3 regionCrop:(CGRect)a4;
- (id).cxx_construct;
- (id)initImageTransform:(int)a3 transformedImageWidth:(int)a4 transformedImageHeight:(int)a5;
@end

@implementation VCPTransforms

- (id)initImageTransform:(int)a3 transformedImageWidth:(int)a4 transformedImageHeight:(int)a5
{
  *((_DWORD *)self + 2) = a3;
  *((_DWORD *)self + 3) = a4;
  *((_DWORD *)self + 4) = a5;
  return self;
}

- (__CVBuffer)cropAndScale:(__CVBuffer *)a3 regionCrop:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CFTypeRef cf = 0;
  int v10 = CVPixelBufferGetWidth(a3);
  int v11 = CVPixelBufferGetHeight(a3);
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  result = 0;
  if (v11 >= v10) {
    int v14 = v10;
  }
  else {
    int v14 = v11;
  }
  if (v14 >= self->_minSize)
  {
    if (PixelFormatType == 1111970369
      && self->_transformedImageWidth == v10
      && self->_transformedImageHeight == v11
      && (v18.origin.x = x, v18.origin.y = y, v18.size.width = width, v18.size.CGFloat height = height, CGRectIsEmpty(v18)))
    {
      return (__CVBuffer *)CFRetain(a3);
    }
    else
    {
      v19.origin.CGFloat x = x;
      v19.origin.CGFloat y = y;
      v19.size.CGFloat width = width;
      v19.size.CGFloat height = height;
      int v15 = Scaler::ScaleCropped(&self->_scaler, v19, a3, (__CVBuffer **)&cf, self->_transformedImageWidth, self->_transformedImageHeight, 1111970369);
      result = (__CVBuffer *)cf;
      if (v15 && cf)
      {
        CFRelease(cf);
        return 0;
      }
    }
  }
  return result;
}

- (void).cxx_destruct
{
  p_scaler = &self->_scaler;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->pool_.value_);
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((_DWORD *)self + 10) = 0;
  return self;
}

@end