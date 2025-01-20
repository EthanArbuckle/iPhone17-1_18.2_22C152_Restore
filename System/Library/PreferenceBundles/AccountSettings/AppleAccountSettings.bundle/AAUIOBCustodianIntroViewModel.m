@interface AAUIOBCustodianIntroViewModel
- (NSString)secondaryButton;
- (UIImage)image;
- (UIView)contentView;
- (UIView)secondaryView;
- (id)initHidingNotNowButton:(BOOL)a3;
- (int64_t)contentViewLayout;
- (void)setContentView:(id)a3;
- (void)setContentViewLayout:(int64_t)a3;
- (void)setImage:(id)a3;
- (void)setSecondaryView:(id)a3;
@end

@implementation AAUIOBCustodianIntroViewModel

- (id)initHidingNotNowButton:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AAUIOBCustodianIntroViewModel;
  v4 = [(AAUIOBCustodianIntroViewModel *)&v9 init];
  if (v4)
  {
    v5 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v6 = +[UIImage imageNamed:@"AccountRecoveryContact" inBundle:v5];
    image = v4->_image;
    v4->_image = (UIImage *)v6;

    v4->_contentViewLayout = 2;
    v4->_hideNotNowButton = a3;
  }
  return v4;
}

- (NSString)secondaryButton
{
  if (self->_hideNotNowButton)
  {
    v2 = 0;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)AAUIOBCustodianIntroViewModel;
    v2 = [(AAUIOBCustodianIntroViewModel *)&v4 secondaryButton];
  }

  return (NSString *)v2;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (UIView)secondaryView
{
  return self->_secondaryView;
}

- (void)setSecondaryView:(id)a3
{
}

- (int64_t)contentViewLayout
{
  return self->_contentViewLayout;
}

- (void)setContentViewLayout:(int64_t)a3
{
  self->_contentViewLayout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

@end