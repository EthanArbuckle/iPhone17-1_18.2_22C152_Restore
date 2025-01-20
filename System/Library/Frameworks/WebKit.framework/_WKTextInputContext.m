@interface _WKTextInputContext
- (BOOL)isEqual:(id)a3;
- (CGRect)boundingRect;
- (_WKTextInputContext)init;
- (const)_textInputContext;
- (id).cxx_construct;
- (id)_initWithTextInputContext:(const void *)a3;
- (unint64_t)hash;
@end

@implementation _WKTextInputContext

- (_WKTextInputContext)init
{
  return 0;
}

- (id)_initWithTextInputContext:(const void *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_WKTextInputContext;
  id result = [(_WKTextInputContext *)&v8 init];
  if (result)
  {
    *((_OWORD *)result + 1) = *(_OWORD *)a3;
    long long v5 = *((_OWORD *)a3 + 1);
    long long v6 = *((_OWORD *)a3 + 2);
    long long v7 = *((_OWORD *)a3 + 3);
    *((void *)result + 10) = *((void *)a3 + 8);
    *((_OWORD *)result + 3) = v6;
    *((_OWORD *)result + 4) = v7;
    *((_OWORD *)result + 2) = v5;
  }
  return result;
}

- (CGRect)boundingRect
{
  WebCore::FloatRect::operator CGRect();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (const)_textInputContext
{
  return &self->_textInputContext;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if (self->_textInputContext.boundingRect.m_location.m_x != *((float *)a3 + 4)
    || self->_textInputContext.boundingRect.m_location.m_y != *((float *)a3 + 5))
  {
    return 0;
  }
  if (self->_textInputContext.boundingRect.m_size.m_width != *((float *)a3 + 6)
    || self->_textInputContext.boundingRect.m_size.m_height != *((float *)a3 + 7))
  {
    return 0;
  }

  return WebCore::ElementContext::isSameElement((WebCore::ElementContext *)&self->_textInputContext, (const ElementContext *)((char *)a3 + 16));
}

- (unint64_t)hash
{
  return (unint64_t)self[1]._textInputContext.boundingRect.m_location;
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end