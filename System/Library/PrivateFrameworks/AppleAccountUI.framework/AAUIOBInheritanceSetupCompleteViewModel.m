@interface AAUIOBInheritanceSetupCompleteViewModel
- (AAUIOBInheritanceSetupCompleteViewModel)initWithBeneficiaryName:(id)a3 accessKeyShareType:(unint64_t)a4;
- (AAUIOBInheritanceSetupCompleteViewModel)initWithBeneficiaryName:(id)a3 accessKeyShareType:(unint64_t)a4 inviteType:(unint64_t)a5;
- (UIImage)image;
- (UIView)contentView;
- (UIView)secondaryView;
- (int64_t)contentViewLayout;
- (void)_setInheritanceInvitationImageIfNecessary;
- (void)setContentView:(id)a3;
- (void)setContentViewLayout:(int64_t)a3;
- (void)setImage:(id)a3;
- (void)setSecondaryView:(id)a3;
@end

@implementation AAUIOBInheritanceSetupCompleteViewModel

- (AAUIOBInheritanceSetupCompleteViewModel)initWithBeneficiaryName:(id)a3 accessKeyShareType:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AAUIOBInheritanceSetupCompleteViewModel;
  v4 = [(AAOBInheritanceSetupCompleteModel *)&v7 initWithBeneficiaryName:a3 accessKeyShareType:a4];
  v5 = v4;
  if (v4)
  {
    [(AAUIOBInheritanceSetupCompleteViewModel *)v4 _setInheritanceInvitationImageIfNecessary];
    v5->_contentViewLayout = 2;
  }
  return v5;
}

- (AAUIOBInheritanceSetupCompleteViewModel)initWithBeneficiaryName:(id)a3 accessKeyShareType:(unint64_t)a4 inviteType:(unint64_t)a5
{
  v8.receiver = self;
  v8.super_class = (Class)AAUIOBInheritanceSetupCompleteViewModel;
  v5 = [(AAOBInheritanceSetupCompleteModel *)&v8 initWithBeneficiaryName:a3 accessKeyShareType:a4 inviteType:a5];
  v6 = v5;
  if (v5)
  {
    [(AAUIOBInheritanceSetupCompleteViewModel *)v5 _setInheritanceInvitationImageIfNecessary];
    v6->_contentViewLayout = 2;
  }
  return v6;
}

- (void)_setInheritanceInvitationImageIfNecessary
{
  v3 = [(AAOBInheritanceSetupCompleteModel *)self imageName];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    v5 = (void *)MEMORY[0x263F827E8];
    id v8 = [(AAOBInheritanceSetupCompleteModel *)self imageName];
    v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    objc_super v7 = [v5 imageNamed:v8 inBundle:v6];
    [(AAUIOBInheritanceSetupCompleteViewModel *)self setImage:v7];
  }
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