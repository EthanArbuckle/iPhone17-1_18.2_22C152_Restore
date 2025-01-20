@interface WKTextPlaceholder
- (WKTextPlaceholder)initWithElementContext:(const void *)a3;
- (const)elementContext;
- (id).cxx_construct;
- (id)rects;
@end

@implementation WKTextPlaceholder

- (WKTextPlaceholder)initWithElementContext:(const void *)a3
{
  result = [(UITextPlaceholder *)self init];
  if (result)
  {
    result->_elementContext.boundingRect = *(FloatRect *)a3;
    ProcessQualified<WTF::UUID> v6 = (ProcessQualified<WTF::UUID>)*((_OWORD *)a3 + 2);
    long long v5 = *((_OWORD *)a3 + 3);
    long long v7 = *((_OWORD *)a3 + 1);
    result[1].super._attachment = (_UITextPlaceholderAttachment *)*((void *)a3 + 8);
    *(ProcessQualified<WTF::UUID> *)((char *)&result->_elementContext.documentIdentifier + 8) = v6;
    *(_OWORD *)&result[1].super.super.isa = v5;
    *(_OWORD *)&result->_elementContext.webPageIdentifier.m_value.m_identifier = v7;
  }
  return result;
}

- (const)elementContext
{
  return &self->_elementContext;
}

- (id)rects
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = [WKTextSelectionRect alloc];
  WebCore::FloatRect::operator CGRect();
  v3 = -[WKTextSelectionRect initWithCGRect:](v2, "initWithCGRect:");
  v6[0] = v3;
  v4 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  if (v3) {
    CFRelease(v3);
  }
  return v4;
}

- (id).cxx_construct
{
  *((void *)self + 13) = 0;
  *((void *)self + 14) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 16) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 8) = 0;
  return self;
}

@end