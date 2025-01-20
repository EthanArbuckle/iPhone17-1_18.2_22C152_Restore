@interface WKSecureCodingURLWrapper
+ (BOOL)supportsSecureCoding;
- (NSURL)wrappedURL;
- (WKSecureCodingURLWrapper)initWithCoder:(id)a3;
- (WKSecureCodingURLWrapper)initWithURL:(id)a3;
- (id).cxx_construct;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WKSecureCodingURLWrapper

- (NSURL)wrappedURL
{
  return (NSURL *)self->m_wrappedURL.m_ptr;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  m_ptr = self->m_wrappedURL.m_ptr;
  if (m_ptr)
  {
    v5 = (WTF *)[m_ptr absoluteURL];
    WTF::bytesAsVector((uint64_t *)&v10, v5, v6);
    [a3 encodeBytes:v10 length:v12];
    v8 = v10;
    if (&v13 != (uint64_t *)v10 && v10 != 0)
    {
      v10 = 0;
      int v11 = 0;
      WTF::fastFree(v8, v7);
    }
  }
  else
  {
    __break(0xC471u);
  }
}

- (WKSecureCodingURLWrapper)initWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)WKSecureCodingURLWrapper;
  v4 = [(WKSecureCodingURLWrapper *)&v12 initWithString:&stru_1EEA10550];
  if (v4)
  {
    CFIndex length = 0;
    v5 = (const UInt8 *)[a3 decodeBytesWithReturnedLength:&length];
    if (v5)
    {
      CFURLRef v6 = CFURLCreateAbsoluteURLWithBytes(0, v5, length, 0x8000100u, 0, 1u);
      m_ptr = v4->m_wrappedURL.m_ptr;
      v4->m_wrappedURL.m_ptr = v6;
      if (m_ptr) {
        CFRelease(m_ptr);
      }
    }
    if (!v4->m_wrappedURL.m_ptr)
    {
      uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:&stru_1EEA10550];
      v9 = v4->m_wrappedURL.m_ptr;
      v4->m_wrappedURL.m_ptr = (void *)v8;
      if (v9) {
        CFRelease(v9);
      }
    }
  }
  return v4;
}

- (WKSecureCodingURLWrapper)initWithURL:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WKSecureCodingURLWrapper;
  v4 = [(WKSecureCodingURLWrapper *)&v7 initWithString:&stru_1EEA10550];
  if (v4)
  {
    if (a3) {
      CFRetain(a3);
    }
    m_ptr = v4->m_wrappedURL.m_ptr;
    v4->m_wrappedURL.m_ptr = a3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  return v4;
}

- (void).cxx_destruct
{
  m_ptr = self->m_wrappedURL.m_ptr;
  self->m_wrappedURL.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  return self;
}

@end