@interface AAUIOBInheritanceShareDataViewModel
- (AAUIOBInheritanceShareDataViewModel)initWithBeneficiaryName:(id)a3;
- (UIImage)image;
- (UIView)contentView;
- (UIView)secondaryView;
- (int64_t)contentViewLayout;
- (void)setContentView:(id)a3;
- (void)setContentViewLayout:(int64_t)a3;
- (void)setImage:(id)a3;
- (void)setSecondaryView:(id)a3;
@end

@implementation AAUIOBInheritanceShareDataViewModel

- (AAUIOBInheritanceShareDataViewModel)initWithBeneficiaryName:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AAUIOBInheritanceShareDataViewModel;
  v3 = [(AAOBInheritanceShareDataModel *)&v9 initWithBeneficiaryName:a3];
  if (v3)
  {
    v4 = (void *)MEMORY[0x263F827E8];
    v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v6 = [v4 imageNamed:@"beneficiary_share_data" inBundle:v5];
    image = v3->_image;
    v3->_image = (UIImage *)v6;

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