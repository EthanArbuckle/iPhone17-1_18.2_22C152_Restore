@interface TDImageColorHistogram
- (BOOL)isMonochrome;
- (TDImageColorHistogram)initWithCGImage:(CGImage *)a3;
- (double)intersection:(id)a3;
@end

@implementation TDImageColorHistogram

- (TDImageColorHistogram)initWithCGImage:(CGImage *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)TDImageColorHistogram;
  v4 = [(TDImageColorHistogram *)&v12 init];
  v5 = v4;
  if (v4)
  {
    p_imageBuffer = &v4->_imageBuffer;
    size_t Height = CGImageGetHeight(a3);
    size_t Width = CGImageGetWidth(a3);
    p_imageBuffer->data = 0;
    v5->_imageBuffer.height = Height;
    v5->_imageBuffer.width = Width;
    v5->_imageBuffer.rowBytes = 0;
    uint64_t v9 = CUIGetRGBAImageBuffer();
    if (v9)
    {
      NSLog(&cfstr_FailedToInitia.isa, v9);
    }
    else
    {
      uint64_t v10 = CUIComputeImageColorHistogramARGB();
      if (!v10)
      {
        v5->_isMonochrome = CUIColorHistogramARGBIsMonochrome();
        CUIDeallocateRGBAImageBuffer();
        return v5;
      }
      NSLog(&cfstr_FailedToComput.isa, v10);
      CUIDeallocateRGBAImageBuffer();
    }
    return 0;
  }
  return v5;
}

- (BOOL)isMonochrome
{
  return self->_isMonochrome;
}

- (double)intersection:(id)a3
{
  MEMORY[0x270F23A28](&self->_histogram, (char *)a3 + 8);
  return result;
}

@end