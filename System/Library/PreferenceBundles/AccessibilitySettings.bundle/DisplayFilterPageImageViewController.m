@interface DisplayFilterPageImageViewController
- (BOOL)stretchHorizontal;
- (DisplayFilterPageImageViewController)initWithImageName:(id)a3 stretchHorizontal:(BOOL)a4;
- (NSLayoutConstraint)imageAspectConstraint;
- (UIImage)displayImage;
- (UIImageView)imageView;
- (void)loadView;
- (void)setDisplayImage:(id)a3;
- (void)setImageAspectConstraint:(id)a3;
- (void)setImageView:(id)a3;
- (void)setStretchHorizontal:(BOOL)a3;
@end

@implementation DisplayFilterPageImageViewController

- (DisplayFilterPageImageViewController)initWithImageName:(id)a3 stretchHorizontal:(BOOL)a4
{
  BOOL v4 = a4;
  v10.receiver = self;
  v10.super_class = (Class)DisplayFilterPageImageViewController;
  id v5 = a3;
  v6 = [(DisplayFilterPageImageViewController *)&v10 init];
  -[DisplayFilterPageImageViewController setStretchHorizontal:](v6, "setStretchHorizontal:", v4, v10.receiver, v10.super_class);
  v7 = AXSettingsBundle();
  v8 = +[UIImage imageNamed:v5 inBundle:v7];

  [(DisplayFilterPageImageViewController *)v6 setDisplayImage:v8];
  return v6;
}

- (void)loadView
{
  id v16 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 200.0, 200.0);
  [(DisplayFilterPageImageViewController *)self setView:v16];
  id v3 = objc_alloc((Class)UIImageView);
  [v16 bounds];
  id v4 = objc_msgSend(v3, "initWithFrame:");
  [(DisplayFilterPageImageViewController *)self setImageView:v4];
  id v5 = [(DisplayFilterPageImageViewController *)self imageView];
  [v5 setAccessibilityIgnoresInvertColors:1];

  [v16 addSubview:v4];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v16 setIsAccessibilityElement:1];
  v6 = settingsLocString(@"DISPLAY_FILTER_PREVIEW_AX_LABEL", @"Accessibility");
  [v16 setAccessibilityLabel:v6];

  v7 = +[NSLayoutConstraint constraintWithItem:v4 attribute:3 relatedBy:0 toItem:v16 attribute:3 multiplier:1.0 constant:0.0];
  [v16 addConstraint:v7];
  if ([(DisplayFilterPageImageViewController *)self stretchHorizontal])
  {
    v8 = +[NSLayoutConstraint constraintWithItem:v4 attribute:9 relatedBy:0 toItem:v16 attribute:9 multiplier:1.0 constant:0.0];

    [v16 addConstraint:v8];
    double v9 = 1.0;
    id v10 = v4;
    uint64_t v11 = 4;
    id v12 = v16;
    uint64_t v13 = 4;
  }
  else
  {
    v8 = +[NSLayoutConstraint constraintWithItem:v4 attribute:5 relatedBy:0 toItem:v16 attribute:5 multiplier:1.0 constant:0.0];

    [v16 addConstraint:v8];
    double v9 = 1.0;
    id v10 = v4;
    uint64_t v11 = 6;
    id v12 = v16;
    uint64_t v13 = 6;
  }
  v14 = +[NSLayoutConstraint constraintWithItem:v10 attribute:v11 relatedBy:0 toItem:v12 attribute:v13 multiplier:v9 constant:0.0];

  [v16 addConstraint:v14];
  v15 = +[NSLayoutConstraint constraintWithItem:v4 attribute:8 relatedBy:0 toItem:v4 attribute:7 multiplier:1.0 constant:0.0];

  [v4 addConstraint:v15];
  [(DisplayFilterPageImageViewController *)self setImageAspectConstraint:v15];
  [v16 setClipsToBounds:1];
}

- (UIImage)displayImage
{
  id v3 = [(DisplayFilterPageImageViewController *)self view];
  id v4 = [(DisplayFilterPageImageViewController *)self imageView];
  id v5 = [v4 image];

  return (UIImage *)v5;
}

- (void)setDisplayImage:(id)a3
{
  id v4 = a3;
  id v5 = [(DisplayFilterPageImageViewController *)self view];
  id v13 = [(DisplayFilterPageImageViewController *)self imageView];
  [v13 setImage:v4];
  [v4 size];
  double v7 = v6;
  [v4 size];
  double v9 = v8;

  id v10 = [(DisplayFilterPageImageViewController *)self imageAspectConstraint];
  [v13 removeConstraint:v10];

  uint64_t v11 = +[NSLayoutConstraint constraintWithItem:v13 attribute:8 relatedBy:0 toItem:v13 attribute:7 multiplier:v7 / v9 constant:0.0];
  [(DisplayFilterPageImageViewController *)self setImageAspectConstraint:v11];

  id v12 = [(DisplayFilterPageImageViewController *)self imageAspectConstraint];
  [v13 addConstraint:v12];
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (NSLayoutConstraint)imageAspectConstraint
{
  return self->_imageAspectConstraint;
}

- (void)setImageAspectConstraint:(id)a3
{
}

- (BOOL)stretchHorizontal
{
  return self->_stretchHorizontal;
}

- (void)setStretchHorizontal:(BOOL)a3
{
  self->_stretchHorizontal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageAspectConstraint, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end