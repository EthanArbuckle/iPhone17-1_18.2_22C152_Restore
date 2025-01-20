@interface BalloonPlaceholderView
+ (id)placeholderImage;
- (BalloonPlaceholderView)init;
- (UIImage)backgroundImage;
- (void)layoutSubviews;
- (void)setBackgroundImage:(id)a3;
@end

@implementation BalloonPlaceholderView

+ (id)placeholderImage
{
  if (qword_2F128 != -1) {
    dispatch_once(&qword_2F128, &stru_24CD8);
  }
  v2 = (void *)qword_2F120;

  return v2;
}

- (BalloonPlaceholderView)init
{
  v9.receiver = self;
  v9.super_class = (Class)BalloonPlaceholderView;
  v2 = [(BalloonPlaceholderView *)&v9 init];
  if (v2)
  {
    v3 = +[UIColor blackColor];
    [(BalloonPlaceholderView *)v2 setBackgroundColor:v3];

    v4 = [(BalloonPlaceholderView *)v2 layer];
    [v4 setMasksToBounds:1];

    v5 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    placeholderImageView = v2->_placeholderImageView;
    v2->_placeholderImageView = v5;

    [(BalloonPlaceholderView *)v2 addSubview:v2->_placeholderImageView];
    v7 = v2;
  }

  return v2;
}

- (void)setBackgroundImage:(id)a3
{
  id v9 = a3;
  objc_storeStrong((id *)&self->_backgroundImage, a3);
  placeholderImageView = self->_placeholderImageView;
  if (self->_backgroundImage)
  {
    [(UIImageView *)self->_placeholderImageView setImage:v9];
    [(UIImageView *)self->_placeholderImageView setContentMode:2];
    [(UIImageView *)self->_placeholderImageView setTintColor:0];
  }
  else
  {
    v6 = +[BalloonPlaceholderView placeholderImage];
    [(UIImageView *)placeholderImageView setImage:v6];

    [(UIImageView *)self->_placeholderImageView setContentMode:4];
    v7 = self->_placeholderImageView;
    v8 = +[UIColor lightGrayColor];
    [(UIImageView *)v7 setTintColor:v8];
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)BalloonPlaceholderView;
  [(BalloonPlaceholderView *)&v4 layoutSubviews];
  placeholderImageView = self->_placeholderImageView;
  [(BalloonPlaceholderView *)self bounds];
  -[UIImageView setFrame:](placeholderImageView, "setFrame:");
}

- (UIImage)backgroundImage
{
  return self->_backgroundImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundImage, 0);

  objc_storeStrong((id *)&self->_placeholderImageView, 0);
}

@end