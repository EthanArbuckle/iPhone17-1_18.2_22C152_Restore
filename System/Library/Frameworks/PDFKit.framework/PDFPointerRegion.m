@interface PDFPointerRegion
- (CGRect)rect;
- (PDFPointerRegion)initWithRect:(CGRect)a3 identifier:(id)a4;
- (id)identifier;
- (void)setIdentifier:(id)a3;
- (void)setRect:(CGRect)a3;
@end

@implementation PDFPointerRegion

- (PDFPointerRegion)initWithRect:(CGRect)a3 identifier:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PDFPointerRegion;
  v11 = [(PDFPointerRegion *)&v16 init];
  if (v11)
  {
    v12 = objc_alloc_init(PDFPointerRegionPrivate);
    v13 = v11->_private;
    v11->_private = v12;

    v14 = v11->_private;
    v14->rect.origin.CGFloat x = x;
    v14->rect.origin.CGFloat y = y;
    v14->rect.size.CGFloat width = width;
    v14->rect.size.CGFloat height = height;
    objc_storeStrong((id *)&v11->_private->identifier, a4);
  }

  return v11;
}

- (CGRect)rect
{
  v2 = self->_private;
  double x = v2->rect.origin.x;
  double y = v2->rect.origin.y;
  double width = v2->rect.size.width;
  double height = v2->rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->_private->rect = a3;
}

- (id)identifier
{
  return self->_private->identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end