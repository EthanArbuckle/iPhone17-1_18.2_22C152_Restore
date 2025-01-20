@interface WKSecureCodingCGColorWrapper
+ (BOOL)supportsSecureCoding;
- (CGColor)wrappedColor;
- (WKSecureCodingCGColorWrapper)initWithCGColor:(CGColor *)a3;
- (WKSecureCodingCGColorWrapper)initWithCoder:(id)a3;
- (id).cxx_construct;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WKSecureCodingCGColorWrapper

- (CGColor)wrappedColor
{
  return (CGColor *)self->m_wrappedColor.m_ptr;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (self->m_wrappedColor.m_ptr)
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F428B8], "colorWithCGColor:");
    [a3 encodeObject:v4 forKey:@"WK.CocoaColor"];
  }
  else
  {
    __break(0xC471u);
  }
}

- (WKSecureCodingCGColorWrapper)initWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)WKSecureCodingCGColorWrapper;
  uint64_t v4 = [(WKSecureCodingCGColorWrapper *)&v11 init];
  if (v4)
  {
    v5 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"WK.CocoaColor"];
    v6 = v5;
    if (v5) {
      CFRetain(v5);
    }
    v7 = (void *)[v6 CGColor];
    v8 = v7;
    if (v7) {
      CFRetain(v7);
    }
    m_ptr = v4->m_wrappedColor.m_ptr;
    v4->m_wrappedColor.m_ptr = v8;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    if (v6) {
      CFRelease(v6);
    }
  }
  return v4;
}

- (WKSecureCodingCGColorWrapper)initWithCGColor:(CGColor *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WKSecureCodingCGColorWrapper;
  uint64_t v4 = [(WKSecureCodingCGColorWrapper *)&v7 init];
  if (v4)
  {
    if (a3) {
      CFRetain(a3);
    }
    m_ptr = v4->m_wrappedColor.m_ptr;
    v4->m_wrappedColor.m_ptr = a3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  return v4;
}

- (void).cxx_destruct
{
  m_ptr = self->m_wrappedColor.m_ptr;
  self->m_wrappedColor.m_ptr = 0;
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