@interface PHCarPlayGenericTableViewCell
+ (NSString)reuseIdentifier;
- (BOOL)hidesChevronWhenUnhighlighted;
- (BOOL)showsChevron;
- (PHCarPlayGenericTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIImageView)chevronImageView;
- (void)setChevronImageView:(id)a3;
- (void)setHidesChevronWhenUnhighlighted:(BOOL)a3;
- (void)setShowsChevron:(BOOL)a3;
@end

@implementation PHCarPlayGenericTableViewCell

+ (NSString)reuseIdentifier
{
  v2 = NSStringFromClass((Class)a1);
  v3 = +[NSString stringWithFormat:@"%@ReuseIdentifier", v2];

  return (NSString *)v3;
}

- (PHCarPlayGenericTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PHCarPlayGenericTableViewCell;
  v4 = [(PHCarPlayGenericTableViewCell *)&v8 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = +[UIColor clearColor];
    v6 = [(PHCarPlayGenericTableViewCell *)v4 contentView];
    [v6 setBackgroundColor:v5];

    [(PHCarPlayGenericTableViewCell *)v4 setAutoresizesSubviews:1];
  }
  return v4;
}

- (void)setShowsChevron:(BOOL)a3
{
  if (self->_showsChevron != a3)
  {
    if (a3)
    {
      id v5 = objc_alloc((Class)UIImageView);
      v6 = +[UIImage phCarPlayImageNamed:@"carplay-forward-chevron"];
      v7 = (UIImageView *)[v5 initWithImage:v6];
      chevronImageView = self->_chevronImageView;
      self->_chevronImageView = v7;

      [(UIImageView *)self->_chevronImageView setTranslatesAutoresizingMaskIntoConstraints:0];
      v9 = [(PHCarPlayGenericTableViewCell *)self contentView];
      [v9 addSubview:self->_chevronImageView];

      v10 = [(PHCarPlayGenericTableViewCell *)self contentView];
      v11 = self->_chevronImageView;
      v12 = [(PHCarPlayGenericTableViewCell *)self contentView];
      v13 = +[NSLayoutConstraint constraintWithItem:v11 attribute:2 relatedBy:0 toItem:v12 attribute:2 multiplier:1.0 constant:-22.0];
      [v10 addConstraint:v13];

      v14 = [(PHCarPlayGenericTableViewCell *)self contentView];
      v15 = self->_chevronImageView;
      v16 = [(PHCarPlayGenericTableViewCell *)self contentView];
      v17 = +[NSLayoutConstraint constraintWithItem:v15 attribute:10 relatedBy:0 toItem:v16 attribute:10 multiplier:1.0 constant:0.0];
      [v14 addConstraint:v17];
    }
    else
    {
      [(UIImageView *)self->_chevronImageView removeFromSuperview];
    }
  }
  self->_showsChevron = a3;
}

- (void)setHidesChevronWhenUnhighlighted:(BOOL)a3
{
  if ([(PHCarPlayGenericTableViewCell *)self showsChevron])
  {
    id v5 = [(PHCarPlayGenericTableViewCell *)self chevronImageView];
    v6 = +[UIImage phCarPlayImageNamed:@"carplay-forward-chevron"];
    [v5 setHighlightedImage:v6];

    v7 = [(PHCarPlayGenericTableViewCell *)self chevronImageView];
    objc_super v8 = +[UIImage phCarPlayImageNamed:@"carplay-forward-chevron"];
    v9 = +[UIColor blackColor];
    v10 = [v8 _flatImageWithColor:v9];
    [v7 setImage:v10];

    self->_hidesChevronWhenUnhighlighted = a3;
  }
}

- (BOOL)showsChevron
{
  return self->_showsChevron;
}

- (BOOL)hidesChevronWhenUnhighlighted
{
  return self->_hidesChevronWhenUnhighlighted;
}

- (UIImageView)chevronImageView
{
  return (UIImageView *)objc_getProperty(self, a2, 16, 1);
}

- (void)setChevronImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end