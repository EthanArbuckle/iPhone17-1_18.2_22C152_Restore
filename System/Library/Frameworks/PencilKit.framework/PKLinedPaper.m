@interface PKLinedPaper
- (BOOL)isEqual:(id)a3;
- (CGPoint)lineSpacing;
- (PKLinedPaper)initWithLineSpacing:(CGPoint)a3 horizontalInset:(double)a4;
- (double)horizontalInset;
- (unint64_t)hash;
@end

@implementation PKLinedPaper

- (PKLinedPaper)initWithLineSpacing:(CGPoint)a3 horizontalInset:(double)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v8.receiver = self;
  v8.super_class = (Class)PKLinedPaper;
  result = [(PKLinedPaper *)&v8 init];
  result->_lineSpacing.CGFloat x = x;
  result->_lineSpacing.CGFloat y = y;
  result->_horizontalInset = a4;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ((-[PKLinedPaper lineSpacing](self, "lineSpacing"), v6 = v5, double v8 = v7, [v4 lineSpacing], v6 == v10)
      ? (BOOL v11 = v8 == v9)
      : (BOOL v11 = 0),
        v11))
  {
    double horizontalInset = self->_horizontalInset;
    [v4 horizontalInset];
    BOOL v12 = horizontalInset == v14;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  [(PKLinedPaper *)self lineSpacing];
  int v4 = (int)v3;
  [(PKLinedPaper *)self lineSpacing];
  return v4 ^ ((int)v5 << 16);
}

- (CGPoint)lineSpacing
{
  double x = self->_lineSpacing.x;
  double y = self->_lineSpacing.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)horizontalInset
{
  return self->_horizontalInset;
}

@end