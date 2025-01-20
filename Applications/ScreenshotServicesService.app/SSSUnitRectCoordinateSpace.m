@interface SSSUnitRectCoordinateSpace
- (CGPoint)convertPoint:(CGPoint)a3 fromCoordinateSpace:(id)a4;
- (CGPoint)convertPoint:(CGPoint)a3 toCoordinateSpace:(id)a4;
- (CGRect)_rectInViewSpaceForUnitRect:(CGRect)a3;
- (CGRect)_unitRectOfRectInViewSpace:(CGRect)a3;
- (CGRect)bounds;
- (CGRect)convertRect:(CGRect)a3 fromCoordinateSpace:(id)a4;
- (CGRect)convertRect:(CGRect)a3 toCoordinateSpace:(id)a4;
- (SSSUnitRectCoordinateSpace)initWithView:(id)a3;
- (UIView)view;
@end

@implementation SSSUnitRectCoordinateSpace

- (SSSUnitRectCoordinateSpace)initWithView:(id)a3
{
  v4 = (UIView *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SSSUnitRectCoordinateSpace;
  v5 = [(SSSUnitRectCoordinateSpace *)&v8 init];
  view = v5->_view;
  v5->_view = v4;

  return v5;
}

- (CGRect)_unitRectOfRectInViewSpace:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self->_view bounds];
  double v9 = (x - v7) / v8;
  double v12 = (y - v10) / v11;
  double v13 = width / v8;
  double v14 = height / v11;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v9;
  return result;
}

- (CGRect)_rectInViewSpaceForUnitRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self->_view bounds];
  double v9 = v7 + x * v8;
  double v12 = v10 + y * v11;
  double v13 = width * v8;
  double v14 = height * v11;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v9;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 toCoordinateSpace:(id)a4
{
  [a4 convertRect:self fromCoordinateSpace:a3.x, a3.y, 1.0, 1.0];
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromCoordinateSpace:(id)a4
{
  -[SSSUnitRectCoordinateSpace convertRect:fromCoordinateSpace:](self, "convertRect:fromCoordinateSpace:", a4, a3.x, a3.y, 1.0, 1.0);
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 toCoordinateSpace:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  -[SSSUnitRectCoordinateSpace _rectInViewSpaceForUnitRect:](self, "_rectInViewSpaceForUnitRect:", x, y, width, height);
  [v9 convertRect:self->_view fromCoordinateSpace:];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromCoordinateSpace:(id)a4
{
  -[UIView convertRect:fromCoordinateSpace:](self->_view, "convertRect:fromCoordinateSpace:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  -[SSSUnitRectCoordinateSpace _unitRectOfRectInViewSpace:](self, "_unitRectOfRectInViewSpace:");
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (CGRect)bounds
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 1.0;
  double v5 = 1.0;
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (UIView)view
{
  return self->_view;
}

- (void).cxx_destruct
{
}

@end