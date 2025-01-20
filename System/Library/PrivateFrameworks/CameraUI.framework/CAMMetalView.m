@interface CAMMetalView
+ (Class)layerClass;
- (CAMMetalViewDelegate)metalViewDelegate;
- (void)layoutSubviews;
- (void)setMetalViewDelegate:(id)a3;
@end

@implementation CAMMetalView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)CAMMetalView;
  [(CAMMetalView *)&v17 layoutSubviews];
  v3 = [(CAMMetalView *)self metalLayer];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  v8 = [(CAMMetalView *)self traitCollection];
  [v8 displayScale];
  double v10 = v9;

  [v3 setContentsScale:v10];
  double v11 = round(v5 * v10);
  double v12 = round(v7 * v10);
  [v3 drawableSize];
  if (v11 != v14 || v12 != v13)
  {
    objc_msgSend(v3, "setDrawableSize:", v11, v12);
    v16 = [(CAMMetalView *)self metalViewDelegate];
    [v16 metalViewDidChangeDrawableSize:self];
  }
}

- (CAMMetalViewDelegate)metalViewDelegate
{
  return self->_metalViewDelegate;
}

- (void)setMetalViewDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end