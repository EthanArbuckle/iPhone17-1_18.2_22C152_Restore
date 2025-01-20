@interface GAXInterestAreaFingerPathView
- (GAXInterestAreaFingerPathView)initWithCoder:(id)a3;
- (GAXInterestAreaFingerPathView)initWithFrame:(CGRect)a3;
- (GAXInterestAreaFingerPathViewDataSource)dataSource;
- (GAXStyleProvider)styleProvider;
- (void)_commonInit;
- (void)_enumerateInterestAreaPathsUsingBlock:(id)a3;
- (void)drawRect:(CGRect)a3;
- (void)setDataSource:(id)a3;
- (void)setStyleProvider:(id)a3;
@end

@implementation GAXInterestAreaFingerPathView

- (void)_commonInit
{
  v3 = +[UIColor clearColor];
  [(GAXInterestAreaFingerPathView *)self setBackgroundColor:v3];

  [(GAXInterestAreaFingerPathView *)self setUserInteractionEnabled:0];
}

- (GAXInterestAreaFingerPathView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GAXInterestAreaFingerPathView;
  v3 = -[GAXInterestAreaFingerPathView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(GAXInterestAreaFingerPathView *)v3 _commonInit];
  }
  return v4;
}

- (GAXInterestAreaFingerPathView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GAXInterestAreaFingerPathView;
  v3 = [(GAXInterestAreaFingerPathView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(GAXInterestAreaFingerPathView *)v3 _commonInit];
  }
  return v4;
}

- (void)setDataSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    [(GAXInterestAreaFingerPathView *)self setNeedsDisplay];
    v5 = obj;
  }
}

- (void)setStyleProvider:(id)a3
{
  v5 = (GAXStyleProvider *)a3;
  p_styleProvider = &self->_styleProvider;
  if (self->_styleProvider != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_styleProvider, a3);
    p_styleProvider = (GAXStyleProvider **)[(GAXInterestAreaFingerPathView *)self setNeedsDisplay];
    v5 = v7;
  }

  _objc_release_x1(p_styleProvider, v5);
}

- (void)_enumerateInterestAreaPathsUsingBlock:(id)a3
{
  v4 = (void (**)(id, void *, uint64_t, unsigned char *))a3;
  v5 = [(GAXInterestAreaFingerPathView *)self dataSource];
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    char v10 = 0;
    id v6 = [v5 numberOfInterestAreaPathsForInterestAreaFingerPathView:self];
    if (v6)
    {
      unint64_t v7 = (unint64_t)v6;
      unint64_t v8 = 1;
      do
      {
        v9 = [v5 interestAreaFingerPathView:self interestAreaPathAtIndex:v8 - 1];
        v4[2](v4, v9, v8 - 1, &v10);

        if (v8 >= v7) {
          break;
        }
        ++v8;
      }
      while (!v10);
    }
  }
}

- (void)drawRect:(CGRect)a3
{
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  v5 = [(GAXInterestAreaFingerPathView *)self styleProvider];
  [v5 interestAreaViewFingerPathLineWidth];
  CGContextSetLineWidth(CurrentContext, v6);
  CGContextSetLineCap(CurrentContext, kCGLineCapRound);
  CGContextSetLineJoin(CurrentContext, kCGLineJoinRound);
  id v7 = [v5 interestAreaViewFingerPathStrokeColor];
  CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v7 CGColor]);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_17090;
  v8[3] = &unk_5D3E0;
  v8[4] = CurrentContext;
  [(GAXInterestAreaFingerPathView *)self _enumerateInterestAreaPathsUsingBlock:v8];
  CGContextRestoreGState(CurrentContext);
}

- (GAXInterestAreaFingerPathViewDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (GAXInterestAreaFingerPathViewDataSource *)WeakRetained;
}

- (GAXStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleProvider, 0);

  objc_destroyWeak((id *)&self->_dataSource);
}

@end