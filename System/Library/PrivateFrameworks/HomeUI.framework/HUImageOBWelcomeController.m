@interface HUImageOBWelcomeController
- (HUImageOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentImage:(id)a6;
- (HUImageOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentView:(id)a6;
- (UIImage)contentImage;
- (UIImageView)contentImageView;
- (double)_contentAspectRatio;
- (void)_updateContentMode;
- (void)_viewDidUpdateContent;
- (void)setContentImage:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation HUImageOBWelcomeController

- (HUImageOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentImage:(id)a6
{
  v10 = (objc_class *)MEMORY[0x1E4F42AA0];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = (void *)[[v10 alloc] initWithImage:v11];

  v18.receiver = self;
  v18.super_class = (Class)HUImageOBWelcomeController;
  v16 = [(HUCenterFillOBWelcomeController *)&v18 initWithTitle:v14 detailText:v13 icon:v12 contentView:v15];

  if (v16)
  {
    objc_storeStrong((id *)&v16->_contentImageView, v15);
    [(UIImageView *)v16->_contentImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  }

  return v16;
}

- (HUImageOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentView:(id)a6
{
  v8 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5, a6);
  v9 = NSStringFromSelector(sel_initWithTitle_detailText_icon_contentImage_);
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUImageOBWelcomeController.m", 38, @"%s is unavailable; use %@ instead",
    "-[HUImageOBWelcomeController initWithTitle:detailText:icon:contentView:]",
    v9);

  return 0;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HUImageOBWelcomeController;
  [(HUCenterFillOBWelcomeController *)&v3 viewDidLoad];
  [(HUImageOBWelcomeController *)self _updateContentMode];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HUImageOBWelcomeController;
  [(OBWelcomeFullCenterContentController *)&v3 viewDidLayoutSubviews];
  [(HUImageOBWelcomeController *)self _updateContentMode];
}

- (UIImage)contentImage
{
  v2 = [(HUImageOBWelcomeController *)self contentImageView];
  objc_super v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)setContentImage:(id)a3
{
  id v9 = a3;
  v4 = [(HUImageOBWelcomeController *)self contentImageView];
  id v5 = [v4 image];

  v6 = v9;
  if (v5 != v9)
  {
    v7 = [(HUImageOBWelcomeController *)self contentImageView];
    [v7 setImage:v9];

    int v8 = [(HUImageOBWelcomeController *)self isViewLoaded];
    v6 = v9;
    if (v8)
    {
      [(HUImageOBWelcomeController *)self _viewDidUpdateContent];
      v6 = v9;
    }
  }
}

- (double)_contentAspectRatio
{
  objc_super v3 = [(HUImageOBWelcomeController *)self contentImage];

  if (v3)
  {
    v4 = [(HUImageOBWelcomeController *)self contentImage];
    [v4 size];
    double v6 = v5;
    v7 = [(HUImageOBWelcomeController *)self contentImage];
    [v7 size];
    double v9 = v6 / v8;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)HUImageOBWelcomeController;
    [(HUCenterFillOBWelcomeController *)&v12 _contentAspectRatio];
    return v10;
  }
  return v9;
}

- (void)_viewDidUpdateContent
{
  v3.receiver = self;
  v3.super_class = (Class)HUImageOBWelcomeController;
  [(HUCenterFillOBWelcomeController *)&v3 _viewDidUpdateContent];
  [(HUImageOBWelcomeController *)self _updateContentMode];
}

- (void)_updateContentMode
{
  objc_super v3 = [(HUImageOBWelcomeController *)self contentImage];
  [v3 size];
  double v5 = v4;
  [(UIImageView *)self->_contentImageView bounds];
  if (v5 > v6)
  {

    uint64_t v12 = 1;
  }
  else
  {
    v7 = [(HUImageOBWelcomeController *)self contentImage];
    [v7 size];
    double v9 = v8;
    [(UIImageView *)self->_contentImageView bounds];
    double v11 = v10;

    if (v9 <= v11) {
      uint64_t v12 = 4;
    }
    else {
      uint64_t v12 = 1;
    }
  }
  contentImageView = self->_contentImageView;

  [(UIImageView *)contentImageView setContentMode:v12];
}

- (UIImageView)contentImageView
{
  return self->_contentImageView;
}

- (void).cxx_destruct
{
}

@end