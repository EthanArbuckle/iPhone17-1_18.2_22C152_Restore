@interface AXScribbleElement
- (AXScribbleElement)initWithText:(id)a3 geometry:(CGRect)a4;
- (CGRect)geometry;
- (NSString)renderedText;
- (void)setGeometry:(CGRect)a3;
- (void)setRenderedText:(id)a3;
@end

@implementation AXScribbleElement

- (AXScribbleElement)initWithText:(id)a3 geometry:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AXScribbleElement;
  v11 = [(AXScribbleElement *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_renderedText, a3);
    v12->_geometry.origin.CGFloat x = x;
    v12->_geometry.origin.CGFloat y = y;
    v12->_geometry.size.CGFloat width = width;
    v12->_geometry.size.CGFloat height = height;
  }

  return v12;
}

- (NSString)renderedText
{
  return self->_renderedText;
}

- (void)setRenderedText:(id)a3
{
}

- (CGRect)geometry
{
  double x = self->_geometry.origin.x;
  double y = self->_geometry.origin.y;
  double width = self->_geometry.size.width;
  double height = self->_geometry.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setGeometry:(CGRect)a3
{
  self->_geometrdouble y = a3;
}

- (void).cxx_destruct
{
}

@end