@interface _WKUserContentFilter
- (Object)_apiObject;
- (id).cxx_construct;
- (id)_initWithWKContentRuleList:(id)a3;
@end

@implementation _WKUserContentFilter

- (Object)_apiObject
{
  return (Object *)[self->_contentRuleList.m_ptr _apiObject];
}

- (void).cxx_destruct
{
  m_ptr = self->_contentRuleList.m_ptr;
  self->_contentRuleList.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (id)_initWithWKContentRuleList:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_WKUserContentFilter;
  v4 = [(_WKUserContentFilter *)&v7 init];
  if (v4)
  {
    if (a3) {
      CFRetain(a3);
    }
    m_ptr = v4->_contentRuleList.m_ptr;
    v4->_contentRuleList.m_ptr = a3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  return v4;
}

@end