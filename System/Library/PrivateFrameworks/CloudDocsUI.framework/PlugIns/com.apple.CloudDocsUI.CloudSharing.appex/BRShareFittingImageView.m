@interface BRShareFittingImageView
- (BRShareFittingImageView)initWithFrame:(CGRect)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3;
- (NSLayoutConstraint)aspectRatioConstraint;
- (void)setAspectRatioConstraint:(id)a3;
- (void)setImage:(id)a3;
@end

@implementation BRShareFittingImageView

- (void)setImage:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)BRShareFittingImageView;
  [(BRShareFittingImageView *)&v16 setImage:v4];
  if (([(BRShareFittingImageView *)self translatesAutoresizingMaskIntoConstraints] & 1) == 0)
  {
    v5 = [(BRShareFittingImageView *)self aspectRatioConstraint];

    if (v5)
    {
      v6 = [(BRShareFittingImageView *)self aspectRatioConstraint];
      [(BRShareFittingImageView *)self removeConstraint:v6];
    }
    if (v4)
    {
      [v4 size];
      if (v7 <= 0.0 || ([v4 size], v8 <= 0.0))
      {
        v15 = cdui_default_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
          sub_10002EA14((uint64_t)v4, v15);
        }
      }
      else
      {
        v9 = [(BRShareFittingImageView *)self widthAnchor];
        v10 = [(BRShareFittingImageView *)self heightAnchor];
        [v4 size];
        double v12 = v11;
        [v4 size];
        v14 = [v9 constraintEqualToAnchor:v10 multiplier:v12 / v13];
        [(BRShareFittingImageView *)self setAspectRatioConstraint:v14];

        v15 = [(BRShareFittingImageView *)self aspectRatioConstraint];
        [v15 setActive:1];
      }
    }
  }
}

- (BRShareFittingImageView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BRShareFittingImageView;
  v3 = -[BRShareFittingImageView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    [(BRShareFittingImageView *)v3 setClipsToBounds:1];
    v5 = v4;
  }

  return v4;
}

- (CGSize)intrinsicContentSize
{
  CGFloat y = CGRectZero.origin.y;
  [(BRShareFittingImageView *)self frame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  v19.receiver = self;
  v19.super_class = (Class)BRShareFittingImageView;
  [(BRShareFittingImageView *)&v19 intrinsicContentSize];
  double v9 = v8;
  double v11 = v10;
  double v12 = [(BRShareFittingImageView *)self traitCollection];
  [v12 displayScale];
  double v14 = sub_100029E48(CGRectZero.origin.x, y, v5, v7, v9, v11, v13);
  double v16 = v15;

  double v17 = v14;
  double v18 = v16;
  result.height = v18;
  result.width = v17;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  CGFloat v4 = fmin(a3.width, a3.height);
  CGFloat y = CGRectZero.origin.y;
  v17.receiver = self;
  v17.super_class = (Class)BRShareFittingImageView;
  [(BRShareFittingImageView *)&v17 intrinsicContentSize];
  double v7 = v6;
  double v9 = v8;
  double v10 = [(BRShareFittingImageView *)self traitCollection];
  [v10 displayScale];
  double v12 = sub_100029E48(CGRectZero.origin.x, y, v4, v4, v7, v9, v11);
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (NSLayoutConstraint)aspectRatioConstraint
{
  return self->_aspectRatioConstraint;
}

- (void)setAspectRatioConstraint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end