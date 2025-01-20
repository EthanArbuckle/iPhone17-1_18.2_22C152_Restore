@interface WKTextPosition
+ (id)textPositionWithRect:(CGRect)a3;
- (BOOL)isEqual:(id)a3;
- (CGRect)positionRect;
- (OptionSet<WebKit::TextPositionAnchor>)anchors;
- (id).cxx_construct;
- (id)description;
- (void)setAnchors:(OptionSet<WebKit::TextPositionAnchor>)a3;
- (void)setPositionRect:(CGRect)a3;
@end

@implementation WKTextPosition

+ (id)textPositionWithRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = objc_alloc_init(WKTextPosition);
  -[WKTextPosition setPositionRect:](v7, "setPositionRect:", x, y, width, height);
  v8 = (void *)CFMakeCollectable(v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  [(WKTextPosition *)self positionRect];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  [a3 positionRect];
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v21 = v6;
  uint64_t v22 = v8;
  uint64_t v23 = v10;
  uint64_t v24 = v12;

  return CGRectEqualToRect(*(CGRect *)&v21, *(CGRect *)&v14);
}

- (id)description
{
  v3 = NSString;
  [(WKTextPosition *)self positionRect];
  return (id)[v3 stringWithFormat:@"<WKTextPosition: %p, {%@}>", self, NSStringFromCGRect(v5)];
}

- (CGRect)positionRect
{
  double x = self->_positionRect.origin.x;
  double y = self->_positionRect.origin.y;
  double width = self->_positionRect.size.width;
  double height = self->_positionRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPositionRect:(CGRect)a3
{
  self->_positionRect = a3;
}

- (OptionSet<WebKit::TextPositionAnchor>)anchors
{
  return self->_anchors;
}

- (void)setAnchors:(OptionSet<WebKit::TextPositionAnchor>)a3
{
  self->_anchors = a3;
}

- (id).cxx_construct
{
  *((unsigned char *)self + 8) = 0;
  return self;
}

@end