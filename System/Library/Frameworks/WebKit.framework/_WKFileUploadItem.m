@interface _WKFileUploadItem
- (BOOL)isVideo;
- (RetainPtr<UIImage>)displayImage;
- (_WKFileUploadItem)initWithFileURL:(id)a3;
- (id).cxx_construct;
- (id)fileURL;
- (void)setFileURL:(id)a3;
@end

@implementation _WKFileUploadItem

- (_WKFileUploadItem)initWithFileURL:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_WKFileUploadItem;
  v4 = [(_WKFileUploadItem *)&v7 init];
  if (v4)
  {
    if (a3) {
      CFRetain(a3);
    }
    m_ptr = v4->_fileURL.m_ptr;
    v4->_fileURL.m_ptr = a3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  return v4;
}

- (BOOL)isVideo
{
  return 0;
}

- (id)fileURL
{
  return self->_fileURL.m_ptr;
}

- (void)setFileURL:(id)a3
{
  if (a3) {
    CFRetain(a3);
  }
  m_ptr = self->_fileURL.m_ptr;
  self->_fileURL.m_ptr = a3;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (RetainPtr<UIImage>)displayImage
{
  void *v2 = 0;
  return (RetainPtr<UIImage>)self;
}

- (void).cxx_destruct
{
  m_ptr = self->_fileURL.m_ptr;
  self->_fileURL.m_ptr = 0;
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