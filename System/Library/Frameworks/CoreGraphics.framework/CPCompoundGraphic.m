@interface CPCompoundGraphic
- (CPCompoundGraphic)initWithGraphicObjects:(id)a3 withRenderedBounds:(CGRect)a4;
- (void)accept:(id)a3;
@end

@implementation CPCompoundGraphic

- (void)accept:(id)a3
{
}

- (CPCompoundGraphic)initWithGraphicObjects:(id)a3 withRenderedBounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)CPCompoundGraphic;
  v9 = [(CPGraphicObject *)&v12 init];
  v10 = v9;
  if (v9)
  {
    if (a3) {
      [(CPChunk *)v9 setChildren:a3];
    }
    v10->super.renderedBounds.origin.CGFloat x = x;
    v10->super.renderedBounds.origin.CGFloat y = y;
    v10->super.renderedBounds.size.CGFloat width = width;
    v10->super.renderedBounds.size.CGFloat height = height;
  }
  return v10;
}

@end