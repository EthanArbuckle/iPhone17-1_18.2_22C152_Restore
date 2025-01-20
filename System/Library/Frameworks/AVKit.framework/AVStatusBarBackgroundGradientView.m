@interface AVStatusBarBackgroundGradientView
+ (Class)layerClass;
- (AVStatusBarBackgroundGradientViewSubview)gradientView;
- (double)alpha;
- (void)layoutSubviews;
- (void)setAlpha:(double)a3;
- (void)setGradientView:(id)a3;
@end

@implementation AVStatusBarBackgroundGradientView

- (void).cxx_destruct
{
}

- (void)setGradientView:(id)a3
{
}

- (AVStatusBarBackgroundGradientViewSubview)gradientView
{
  return self->_gradientView;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)AVStatusBarBackgroundGradientView;
  [(AVStatusBarBackgroundGradientView *)&v12 layoutSubviews];
  [(AVStatusBarBackgroundGradientView *)self setUserInteractionEnabled:0];
  [(AVStatusBarBackgroundGradientView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(AVStatusBarBackgroundGradientView *)self gradientView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (void)setAlpha:(double)a3
{
  if (a3 <= 0.0)
  {
    double v10 = [(AVStatusBarBackgroundGradientView *)self layer];
    [v10 setEnabled:0];

    [(AVStatusBarBackgroundGradientView *)self setHidden:1];
  }
  else
  {
    [(AVStatusBarBackgroundGradientView *)self setHidden:0];
    double v5 = [(AVStatusBarBackgroundGradientView *)self layer];
    [v5 setEnabled:1];

    double v6 = [(AVStatusBarBackgroundGradientView *)self gradientView];

    if (!v6)
    {
      double v7 = [AVStatusBarBackgroundGradientViewSubview alloc];
      [(AVStatusBarBackgroundGradientView *)self bounds];
      double v8 = -[AVStatusBarBackgroundGradientViewSubview initWithFrame:](v7, "initWithFrame:");
      [(AVStatusBarBackgroundGradientView *)self setGradientView:v8];

      double v9 = [(AVStatusBarBackgroundGradientView *)self gradientView];
      [(AVStatusBarBackgroundGradientView *)self addSubview:v9];
    }
    id v11 = [(AVStatusBarBackgroundGradientView *)self gradientView];
    [v11 setAlpha:a3];
  }
}

- (double)alpha
{
  v2 = [(AVStatusBarBackgroundGradientView *)self gradientView];
  [v2 alpha];
  double v4 = v3;

  return v4;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end