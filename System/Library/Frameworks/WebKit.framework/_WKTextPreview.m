@interface _WKTextPreview
- (CGImage)previewImage;
- (CGRect)presentationFrame;
- (_WKTextPreview)initWithSnapshotImage:(CGImage *)a3 presentationFrame:(CGRect)a4;
- (id).cxx_construct;
@end

@implementation _WKTextPreview

- (_WKTextPreview)initWithSnapshotImage:(CGImage *)a3 presentationFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v9 = [(_WKTextPreview *)self init];
  if (v9)
  {
    if (a3) {
      CFRetain(a3);
    }
    m_ptr = v9->_previewImage.m_ptr;
    v9->_previewImage.m_ptr = a3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    v9->_presentationFrame.origin.CGFloat x = x;
    v9->_presentationFrame.origin.CGFloat y = y;
    v9->_presentationFrame.size.CGFloat width = width;
    v9->_presentationFrame.size.CGFloat height = height;
  }
  return v9;
}

- (CGImage)previewImage
{
  return (CGImage *)self->_previewImage.m_ptr;
}

- (CGRect)presentationFrame
{
  objc_copyStruct(v6, &self->_presentationFrame, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (void).cxx_destruct
{
  m_ptr = self->_previewImage.m_ptr;
  self->_previewImage.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end