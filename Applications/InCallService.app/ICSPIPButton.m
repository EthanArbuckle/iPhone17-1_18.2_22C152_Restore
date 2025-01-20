@interface ICSPIPButton
+ (id)buttonWithType:(int64_t)a3 alignment:(int64_t)a4;
- (CGRect)imageRectForContentRect:(CGRect)a3;
- (int64_t)alignment;
- (void)setAlignment:(int64_t)a3;
@end

@implementation ICSPIPButton

+ (id)buttonWithType:(int64_t)a3 alignment:(int64_t)a4
{
  v5 = +[ICSPIPButton buttonWithType:a3];
  [v5 setAlignment:a4];

  return v5;
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double y = a3.origin.y;
  v25.receiver = self;
  v25.super_class = (Class)ICSPIPButton;
  -[ICSPIPButton imageRectForContentRect:](&v25, "imageRectForContentRect:", a3.origin.x, a3.origin.y, a3.size.width);
  double v7 = v6;
  double v9 = v8;
  CGFloat width = v10;
  double v13 = v12;
  int64_t v14 = [(ICSPIPButton *)self alignment];
  double v15 = y + 5.0;
  double v16 = height - (v13 + 5.0);
  if (v14 != 1) {
    double v16 = v9;
  }
  if (v14 == 2) {
    double v17 = y + 5.0;
  }
  else {
    double v17 = v16;
  }
  if (v14 == 2) {
    double x = 5.0;
  }
  else {
    double x = v7;
  }
  v19 = +[UIScreen mainScreen];
  [v19 scale];
  if (v20 == 1.0)
  {
    v26.origin.double x = x;
    v26.origin.double y = v17;
    v26.size.CGFloat width = width;
    v26.size.double height = v13;
    CGRect v27 = CGRectIntegral(v26);
    double x = v27.origin.x;
    double v17 = v27.origin.y;
    CGFloat width = v27.size.width;
    double v13 = v27.size.height;
  }

  double v21 = x;
  double v22 = v17;
  double v23 = width;
  double v24 = v13;
  result.size.double height = v24;
  result.size.CGFloat width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(int64_t)a3
{
  self->_alignment = a3;
}

@end