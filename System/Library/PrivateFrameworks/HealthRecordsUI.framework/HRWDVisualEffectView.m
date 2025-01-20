@interface HRWDVisualEffectView
+ (id)tintViewWithBlurEffectStyle:(int64_t)a3 color:(id)a4;
+ (id)ultraLightTintView;
- (HRWDVisualEffectView)initWithEffect:(id)a3;
- (UIView)tintView;
- (void)layoutSubviews;
- (void)setTintView:(id)a3;
@end

@implementation HRWDVisualEffectView

+ (id)ultraLightTintView
{
  v2 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.82];
  v3 = +[HRWDVisualEffectView tintViewWithBlurEffectStyle:1 color:v2];

  return v3;
}

+ (id)tintViewWithBlurEffectStyle:(int64_t)a3 color:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc((Class)a1);
  v8 = [MEMORY[0x1E4FB14C8] effectWithStyle:a3];
  v9 = (void *)[v7 initWithEffect:v8];

  v10 = [v9 tintView];
  [v10 setBackgroundColor:v6];

  return v9;
}

- (HRWDVisualEffectView)initWithEffect:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HRWDVisualEffectView;
  v3 = [(HRWDVisualEffectView *)&v8 initWithEffect:a3];
  if (v3)
  {
    v4 = objc_opt_new();
    [(HRWDVisualEffectView *)v3 setTintView:v4];

    v5 = [(HRWDVisualEffectView *)v3 contentView];
    id v6 = [(HRWDVisualEffectView *)v3 tintView];
    [v5 addSubview:v6];
  }
  return v3;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)HRWDVisualEffectView;
  [(HRWDVisualEffectView *)&v12 layoutSubviews];
  if (self->_tintView)
  {
    [(HRWDVisualEffectView *)self bounds];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    v11 = [(HRWDVisualEffectView *)self tintView];
    objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
  }
}

- (UIView)tintView
{
  return self->_tintView;
}

- (void)setTintView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end