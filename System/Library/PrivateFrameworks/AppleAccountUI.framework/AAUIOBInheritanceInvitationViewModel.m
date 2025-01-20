@interface AAUIOBInheritanceInvitationViewModel
- (AAUIOBInheritanceInvitationViewModel)initWithAcceptedViewForBenefactorInfo:(id)a3;
- (AAUIOBInheritanceInvitationViewModel)initWithBenefactorInfo:(id)a3;
- (AAUIOBInheritanceInvitationViewModel)initWithModel:(id)a3;
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

@implementation AAUIOBInheritanceInvitationViewModel

- (AAUIOBInheritanceInvitationViewModel)initWithBenefactorInfo:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AAUIOBInheritanceInvitationViewModel;
  v3 = [(AAOBInheritanceInvitationModel *)&v6 initWithBenefactorInfo:a3];
  v4 = v3;
  if (v3)
  {
    [(AAUIOBInheritanceInvitationViewModel *)v3 _setInheritanceInvitationImageIfNecessary];
    v4->_contentViewLayout = 2;
  }
  return v4;
}

- (AAUIOBInheritanceInvitationViewModel)initWithAcceptedViewForBenefactorInfo:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AAUIOBInheritanceInvitationViewModel;
  v3 = [(AAOBInheritanceInvitationModel *)&v6 initWithAcceptedViewForBenefactorInfo:a3];
  v4 = v3;
  if (v3)
  {
    [(AAUIOBInheritanceInvitationViewModel *)v3 _setInheritanceInvitationImageIfNecessary];
    v4->_contentViewLayout = 2;
  }
  return v4;
}

- (AAUIOBInheritanceInvitationViewModel)initWithModel:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AAUIOBInheritanceInvitationViewModel;
  v3 = [(AAOBInheritanceInvitationModel *)&v6 initWithModel:a3];
  v4 = v3;
  if (v3)
  {
    [(AAUIOBInheritanceInvitationViewModel *)v3 _setInheritanceInvitationImageIfNecessary];
    v4->_contentViewLayout = 2;
  }
  return v4;
}

- (void)_setInheritanceInvitationImageIfNecessary
{
  v3 = [(AAOBInheritanceInvitationModel *)self imageName];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    v5 = (void *)MEMORY[0x263F827E8];
    id v8 = [(AAOBInheritanceInvitationModel *)self imageName];
    objc_super v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v7 = [v5 imageNamed:v8 inBundle:v6];
    [(AAUIOBInheritanceInvitationViewModel *)self setImage:v7];
  }
}

- (int64_t)contentViewLayout
{
  return self->_contentViewLayout;
}

- (void)setContentViewLayout:(int64_t)a3
{
  self->_contentViewLayout = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end