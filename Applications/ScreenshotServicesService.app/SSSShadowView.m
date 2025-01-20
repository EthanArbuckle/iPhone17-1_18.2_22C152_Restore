@interface SSSShadowView
+ (CGSize)shadowOffset;
+ (double)shadowOpacity;
+ (double)shadowRadius;
+ (id)shadowColor;
- (BOOL)_arrayOfRectValues:(id)a3 isEqualToArrayOfRectValues:(id)a4;
- (NSArray)rectsForShadow;
- (SSSShadowView)initWithFrame:(CGRect)a3;
- (void)_enumerateAllShadowRectsWithBlock:(id)a3;
- (void)layoutSubviews;
- (void)setRectsForShadow:(id)a3;
@end

@implementation SSSShadowView

+ (double)shadowRadius
{
  return 51.0;
}

+ (id)shadowColor
{
  v2 = +[UIColor blackColor];
  v3 = [v2 colorWithAlphaComponent:0.48];

  return v3;
}

+ (CGSize)shadowOffset
{
  double v2 = 0.0;
  double v3 = 0.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)shadowOpacity
{
  return 1.0;
}

- (SSSShadowView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SSSShadowView;
  double v3 = -[SSSShadowView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(SSSShadowView *)v3 setClipsToBounds:0];
  v4 = objc_alloc_init(_SSSShadowViewInnerViewWithShadow);
  innerView = v3->_innerView;
  v3->_innerView = v4;

  [(SSSShadowView *)v3 addSubview:v3->_innerView];
  return v3;
}

- (void)layoutSubviews
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10002FD4C;
  v2[3] = &unk_100099A20;
  v2[4] = self;
  +[UIView performWithoutAnimation:v2];
}

- (BOOL)_arrayOfRectValues:(id)a3 isEqualToArrayOfRectValues:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 count];
  if (v7 == [v6 count])
  {
    if ([v5 count])
    {
      unint64_t v8 = 0;
      do
      {
        v9 = [v5 objectAtIndex:v8];
        v10 = [v6 objectAtIndex:v8];
        [v9 CGRectValue];
        [v10 CGRectValue];
        char v11 = SSRectEqualToRect();

        if ((v11 & 1) == 0) {
          break;
        }
        ++v8;
      }
      while (v8 < (unint64_t)[v5 count]);
    }
    else
    {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (void)setRectsForShadow:(id)a3
{
  id v5 = a3;
  if (![(SSSShadowView *)self _arrayOfRectValues:self->_rectsForShadow isEqualToArrayOfRectValues:v5])
  {
    objc_storeStrong((id *)&self->_rectsForShadow, a3);
    +[UIBezierPath bezierPath];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000300CC;
    v11[3] = &unk_10009A490;
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = v12;
    [(SSSShadowView *)self _enumerateAllShadowRectsWithBlock:v11];
    id v7 = [(SSSShadowView *)self traitCollection];
    double v8 = sub_10000E1FC();

    memset(&v10, 0, sizeof(v10));
    CGAffineTransformMakeScale(&v10, v8, v8);
    CGAffineTransform v9 = v10;
    [v6 applyTransform:&v9];
    [(_SSSShadowViewInnerViewWithShadow *)self->_innerView setShadowPath:v6];
    [(SSSShadowView *)self setNeedsLayout];
  }
}

- (void)_enumerateAllShadowRectsWithBlock:(id)a3
{
  char v11 = (void (**)(id, void))a3;
  v4 = [(SSSShadowView *)self rectsForShadow];
  id v5 = [v4 count];

  if (v5)
  {
    unint64_t v6 = 0;
    do
    {
      id v7 = [(SSSShadowView *)self rectsForShadow];
      double v8 = [v7 objectAtIndex:v6];

      [v8 CGRectValue];
      v11[2](v11, v6);

      ++v6;
      CGAffineTransform v9 = [(SSSShadowView *)self rectsForShadow];
      id v10 = [v9 count];
    }
    while (v6 < (unint64_t)v10);
  }
}

- (NSArray)rectsForShadow
{
  return self->_rectsForShadow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rectsForShadow, 0);

  objc_storeStrong((id *)&self->_innerView, 0);
}

@end