@interface DSShapeView
+ (id)circleWithFrame:(CGRect)a3 radius:(double)a4 color:(id)a5;
+ (id)rectangleWithFrame:(CGRect)a3 borderColor:(id)a4 fillColor:(id)a5;
+ (id)rectangleWithFrame:(CGRect)a3 borderColor:(id)a4 fillColor:(id)a5 borderWidth:(int)a6;
@end

@implementation DSShapeView

+ (id)circleWithFrame:(CGRect)a3 radius:(double)a4 color:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a5;
  v11 = -[DSShapeView initWithFrame:]([DSShapeView alloc], "initWithFrame:", x, y, width, height);
  [(DSShapeView *)v11 setBackgroundColor:v10];
  v12 = [(DSShapeView *)v11 layer];
  [v12 setCornerRadius:a4];

  id v13 = v10;
  id v14 = [v13 CGColor];

  v15 = [(DSShapeView *)v11 layer];
  [v15 setBorderColor:v14];

  v16 = [(DSShapeView *)v11 layer];
  [v16 setBorderWidth:4.0];

  [(DSShapeView *)v11 setClipsToBounds:1];
  [(DSShapeView *)v11 setAlpha:1.0];

  return v11;
}

+ (id)rectangleWithFrame:(CGRect)a3 borderColor:(id)a4 fillColor:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a5;
  id v11 = a4;
  v12 = -[DSShapeView initWithFrame:]([DSShapeView alloc], "initWithFrame:", x, y, width, height);
  [(DSShapeView *)v12 setBackgroundColor:v10];

  id v13 = v11;
  id v14 = [v13 CGColor];

  v15 = [(DSShapeView *)v12 layer];
  [v15 setBorderColor:v14];

  v16 = [(DSShapeView *)v12 layer];
  [v16 setBorderWidth:4.0];

  [(DSShapeView *)v12 setClipsToBounds:1];
  [(DSShapeView *)v12 setAlpha:1.0];

  return v12;
}

+ (id)rectangleWithFrame:(CGRect)a3 borderColor:(id)a4 fillColor:(id)a5 borderWidth:(int)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a5;
  id v13 = a4;
  id v14 = -[DSShapeView initWithFrame:]([DSShapeView alloc], "initWithFrame:", x, y, width, height);
  [(DSShapeView *)v14 setBackgroundColor:v12];

  id v15 = v13;
  id v16 = [v15 CGColor];

  v17 = [(DSShapeView *)v14 layer];
  [v17 setBorderColor:v16];

  double v18 = (double)a6;
  v19 = [(DSShapeView *)v14 layer];
  [v19 setBorderWidth:v18];

  [(DSShapeView *)v14 setClipsToBounds:1];
  [(DSShapeView *)v14 setAlpha:1.0];

  return v14;
}

@end