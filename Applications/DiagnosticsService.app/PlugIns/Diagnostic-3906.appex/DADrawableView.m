@interface DADrawableView
- (BOOL)isDrawing;
- (DADrawableView)initWithFrame:(CGRect)a3 rectangleFillColor:(id)a4 rectangleEdgeColor:(id)a5;
- (UIColor)rectangleEdgeColor;
- (UIColor)rectangleFillColor;
- (UIView)shapeView;
- (void)endDrawing;
- (void)setIsDrawing:(BOOL)a3;
- (void)setRectangleEdgeColor:(id)a3;
- (void)setRectangleFillColor:(id)a3;
- (void)setShapeView:(id)a3;
- (void)updateDrawing:(CGRect)a3;
@end

@implementation DADrawableView

- (DADrawableView)initWithFrame:(CGRect)a3 rectangleFillColor:(id)a4 rectangleEdgeColor:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  id v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)DADrawableView;
  v14 = -[DADrawableView initWithFrame:](&v18, "initWithFrame:", x, y, width, height);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_rectangleFillColor, a4);
    objc_storeStrong((id *)&v15->_rectangleEdgeColor, a5);
    v15->_isDrawing = 0;
    v16 = +[UIColor clearColor];
    [(DADrawableView *)v15 setBackgroundColor:v16];
  }
  return v15;
}

- (void)updateDrawing:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(DADrawableView *)self isDrawing])
  {
    id v19 = [(DADrawableView *)self shapeView];
    [v19 setFrame:x, y, width, height];
  }
  else
  {
    [(DADrawableView *)self setIsDrawing:1];
    v8 = [(DADrawableView *)self shapeView];

    if (!v8)
    {
      v9 = objc_opt_new();
      [(DADrawableView *)self setShapeView:v9];

      id v10 = [(DADrawableView *)self rectangleEdgeColor];
      id v11 = [v10 CGColor];
      id v12 = [(DADrawableView *)self shapeView];
      id v13 = [v12 layer];
      [v13 setBorderColor:v11];

      v14 = [(DADrawableView *)self shapeView];
      v15 = [v14 layer];
      [v15 setBorderWidth:4.0];

      v16 = [(DADrawableView *)self rectangleFillColor];
      v17 = [(DADrawableView *)self shapeView];
      [v17 setBackgroundColor:v16];
    }
    objc_super v18 = [(DADrawableView *)self shapeView];
    [v18 setFrame:x, y, width, height];

    id v19 = [(DADrawableView *)self shapeView];
    -[DADrawableView addSubview:](self, "addSubview:");
  }
}

- (void)endDrawing
{
  if ([(DADrawableView *)self isDrawing])
  {
    v3 = [(DADrawableView *)self shapeView];
    [v3 removeFromSuperview];

    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v7 = [(DADrawableView *)self shapeView];
    [v7 setFrame:CGRectZero.origin.x, y, width, height];

    [(DADrawableView *)self setIsDrawing:0];
  }
}

- (UIColor)rectangleEdgeColor
{
  return self->_rectangleEdgeColor;
}

- (void)setRectangleEdgeColor:(id)a3
{
}

- (UIColor)rectangleFillColor
{
  return self->_rectangleFillColor;
}

- (void)setRectangleFillColor:(id)a3
{
}

- (UIView)shapeView
{
  return self->_shapeView;
}

- (void)setShapeView:(id)a3
{
}

- (BOOL)isDrawing
{
  return self->_isDrawing;
}

- (void)setIsDrawing:(BOOL)a3
{
  self->_isDrawing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shapeView, 0);
  objc_storeStrong((id *)&self->_rectangleFillColor, 0);

  objc_storeStrong((id *)&self->_rectangleEdgeColor, 0);
}

@end