@interface CAMReviewViewControllerContainerView
- (CAMReviewViewControllerContainerView)initWithCoder:(id)a3;
- (CAMReviewViewControllerContainerView)initWithFrame:(CGRect)a3;
- (UIView)reviewView;
- (void)layoutSubviews;
- (void)setReviewView:(id)a3;
@end

@implementation CAMReviewViewControllerContainerView

- (CAMReviewViewControllerContainerView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMReviewViewControllerContainerView;
  v3 = -[CAMReviewViewControllerContainerView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CAMReviewViewControllerContainerView *)v3 _commonCAMReviewViewControllerContainerViewInitialization];
    v5 = v4;
  }

  return v4;
}

- (CAMReviewViewControllerContainerView)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMReviewViewControllerContainerView;
  v3 = [(CAMReviewViewControllerContainerView *)&v7 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    [(CAMReviewViewControllerContainerView *)v3 _commonCAMReviewViewControllerContainerViewInitialization];
    v5 = v4;
  }

  return v4;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)CAMReviewViewControllerContainerView;
  [(CAMReviewViewControllerContainerView *)&v14 layoutSubviews];
  [(CAMReviewViewControllerContainerView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(CAMReviewViewControllerContainerView *)self reviewView];
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  double MidX = CGRectGetMidX(v15);
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  double MidY = CGRectGetMidY(v16);
  objc_msgSend(v11, "setBounds:", v4, v6, v8, v10);
  objc_msgSend(v11, "setCenter:", MidX, MidY);
}

- (void)setReviewView:(id)a3
{
  double v5 = (UIView *)a3;
  reviewView = self->_reviewView;
  if (reviewView != v5)
  {
    double v7 = v5;
    [(UIView *)reviewView removeFromSuperview];
    objc_storeStrong((id *)&self->_reviewView, a3);
    reviewView = (UIView *)[(CAMReviewViewControllerContainerView *)self addSubview:self->_reviewView];
    double v5 = v7;
  }
  MEMORY[0x270F9A758](reviewView, v5);
}

- (UIView)reviewView
{
  return self->_reviewView;
}

- (void).cxx_destruct
{
}

@end