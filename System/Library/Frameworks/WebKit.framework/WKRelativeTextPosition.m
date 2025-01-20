@interface WKRelativeTextPosition
- (BOOL)isRelativeToStart;
- (OptionSet<WebKit::TextPositionAnchor>)anchors;
- (WKRelativeTextPosition)initWithAnchors:(OptionSet<WebKit:(int64_t)a4 :TextPositionAnchor>)a3 offset:;
- (id).cxx_construct;
- (id)description;
- (int64_t)offset;
@end

@implementation WKRelativeTextPosition

- (WKRelativeTextPosition)initWithAnchors:(OptionSet<WebKit:(int64_t)a4 :TextPositionAnchor>)a3 offset:
{
  v7.receiver = self;
  v7.super_class = (Class)WKRelativeTextPosition;
  result = [(WKRelativeTextPosition *)&v7 init];
  if (result)
  {
    result->_anchors = a3;
    result->_offset = a4;
  }
  return result;
}

- (BOOL)isRelativeToStart
{
  return self->_anchors.m_storage & 1;
}

- (id)description
{
  if (self->_anchors.m_storage) {
    v2 = "start";
  }
  else {
    v2 = "end";
  }
  return (id)[NSString stringWithFormat:@"WKRelativeTextPosition(%s, %d)", v2, self->_offset];
}

- (OptionSet<WebKit::TextPositionAnchor>)anchors
{
  return self->_anchors;
}

- (int64_t)offset
{
  return self->_offset;
}

- (id).cxx_construct
{
  *((unsigned char *)self + 8) = 0;
  return self;
}

@end