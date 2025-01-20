@interface VOTUIMapsExplorationLocationView
- (UIImageView)imageView;
- (VOTUIMapsExplorationLocationView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setImageView:(id)a3;
@end

@implementation VOTUIMapsExplorationLocationView

- (VOTUIMapsExplorationLocationView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v18.receiver = self;
  v18.super_class = (Class)VOTUIMapsExplorationLocationView;
  v5 = -[VOTUIMapsExplorationLocationView initWithFrame:](&v18, "initWithFrame:", a3.origin.x, a3.origin.y);
  v6 = [(VOTUIMapsExplorationLocationView *)v5 layer];
  [v6 setBorderWidth:1.0];

  v7 = [(VOTUIMapsExplorationLocationView *)v5 layer];
  [v7 setMasksToBounds:0];

  double v8 = width * 0.5;
  v9 = [(VOTUIMapsExplorationLocationView *)v5 layer];
  objc_msgSend(v9, "setShadowOffset:", v8, height * 0.5);

  v10 = [(VOTUIMapsExplorationLocationView *)v5 layer];
  [v10 setShadowRadius:v8];

  v11 = [(VOTUIMapsExplorationLocationView *)v5 layer];
  LODWORD(v12) = 1.0;
  [v11 setShadowOpacity:v12];

  id v13 = +[UIColor lightGrayColor];
  id v14 = [v13 CGColor];
  v15 = [(VOTUIMapsExplorationLocationView *)v5 layer];
  [v15 setBorderColor:v14];

  v16 = +[UIColor whiteColor];
  [(VOTUIMapsExplorationLocationView *)v5 setBackgroundColor:v16];

  return v5;
}

- (void)layoutSubviews
{
  v25.receiver = self;
  v25.super_class = (Class)VOTUIMapsExplorationLocationView;
  [(VOTUIMapsExplorationLocationView *)&v25 layoutSubviews];
  [(VOTUIMapsExplorationLocationView *)self frame];
  double v4 = v3 * 0.5;
  v5 = [(VOTUIMapsExplorationLocationView *)self layer];
  [v5 setCornerRadius:v4];

  [(VOTUIMapsExplorationLocationView *)self frame];
  double v7 = v6 + -8.0;
  [(VOTUIMapsExplorationLocationView *)self frame];
  double v9 = v8 + -8.0;
  v10 = [(VOTUIMapsExplorationLocationView *)self imageView];
  objc_msgSend(v10, "setBounds:", 0.0, 0.0, v7, v9);

  [(VOTUIMapsExplorationLocationView *)self frame];
  double v12 = (v11 + -8.0) * 0.5;
  id v13 = [(VOTUIMapsExplorationLocationView *)self imageView];
  id v14 = [v13 layer];
  [v14 setCornerRadius:v12];

  [(VOTUIMapsExplorationLocationView *)self center];
  double v16 = v15;
  double v18 = v17;
  v19 = [(VOTUIMapsExplorationLocationView *)self superview];
  -[VOTUIMapsExplorationLocationView convertPoint:fromView:](self, "convertPoint:fromView:", v19, v16, v18);
  double v21 = v20;
  double v23 = v22;
  v24 = [(VOTUIMapsExplorationLocationView *)self imageView];
  objc_msgSend(v24, "setCenter:", v21, v23);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end