@interface WKPreviewElementInfo
- (NSURL)linkURL;
- (id).cxx_construct;
- (id)_initWithLinkURL:(id)a3;
@end

@implementation WKPreviewElementInfo

- (id)_initWithLinkURL:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WKPreviewElementInfo;
  v4 = [(WKPreviewElementInfo *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [a3 copy];
    m_ptr = v4->_linkURL.m_ptr;
    v4->_linkURL.m_ptr = (void *)v5;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  return v4;
}

- (NSURL)linkURL
{
  return (NSURL *)self->_linkURL.m_ptr;
}

- (void).cxx_destruct
{
  m_ptr = self->_linkURL.m_ptr;
  self->_linkURL.m_ptr = 0;
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