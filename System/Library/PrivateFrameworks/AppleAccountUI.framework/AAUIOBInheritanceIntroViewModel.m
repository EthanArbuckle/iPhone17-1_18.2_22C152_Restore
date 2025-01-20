@interface AAUIOBInheritanceIntroViewModel
- (AAUIOBInheritanceIntroViewModel)init;
- (UIImage)image;
- (UIView)contentView;
- (UIView)secondaryView;
- (int64_t)contentViewLayout;
- (void)setContentView:(id)a3;
- (void)setContentViewLayout:(int64_t)a3;
- (void)setImage:(id)a3;
- (void)setSecondaryView:(id)a3;
@end

@implementation AAUIOBInheritanceIntroViewModel

- (AAUIOBInheritanceIntroViewModel)init
{
  v6.receiver = self;
  v6.super_class = (Class)AAUIOBInheritanceIntroViewModel;
  v2 = [(AAUIOBInheritanceIntroViewModel *)&v6 init];
  v3 = v2;
  if (v2)
  {
    image = v2->_image;
    v2->_image = 0;

    v3->_contentViewLayout = 2;
  }
  return v3;
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