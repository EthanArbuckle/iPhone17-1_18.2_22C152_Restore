@interface AAUIOBInvitationSentViewModel
- (AAUIOBInvitationSentViewModel)initWithModel:(id)a3;
- (AAUIOBInvitationSentViewModel)initWithType:(int64_t)a3 recipientHandle:(id)a4;
- (UIImage)image;
- (UIView)contentView;
- (UIView)secondaryView;
- (int64_t)contentViewLayout;
- (void)_setupAAUIOBWelcomeControllerProtocolProperties;
- (void)setContentView:(id)a3;
- (void)setContentViewLayout:(int64_t)a3;
- (void)setImage:(id)a3;
- (void)setSecondaryView:(id)a3;
@end

@implementation AAUIOBInvitationSentViewModel

- (AAUIOBInvitationSentViewModel)initWithType:(int64_t)a3 recipientHandle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AAUIOBInvitationSentViewModel;
  v4 = [(AAOBInvitationSentModel *)&v7 initWithType:a3 recipientHandle:a4];
  v5 = v4;
  if (v4) {
    [(AAUIOBInvitationSentViewModel *)v4 _setupAAUIOBWelcomeControllerProtocolProperties];
  }
  return v5;
}

- (AAUIOBInvitationSentViewModel)initWithModel:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AAUIOBInvitationSentViewModel;
  v5 = [(AAUIOBInvitationSentViewModel *)&v12 init];
  if (v5)
  {
    v6 = [v4 detailText];
    [(AAOBInvitationSentModel *)v5 setDetailText:v6];

    objc_super v7 = [v4 title];
    [(AAOBInvitationSentModel *)v5 setTitle:v7];

    v8 = [v4 primaryButton];
    [(AAOBInvitationSentModel *)v5 setPrimaryButton:v8];

    v9 = [v4 secondaryButton];
    [(AAOBInvitationSentModel *)v5 setSecondaryButton:v9];

    v10 = [v4 recipientHandle];
    [(AAOBInvitationSentModel *)v5 setRecipientHandle:v10];

    [(AAUIOBInvitationSentViewModel *)v5 _setupAAUIOBWelcomeControllerProtocolProperties];
  }

  return v5;
}

- (void)_setupAAUIOBWelcomeControllerProtocolProperties
{
  v3 = (void *)MEMORY[0x263F258F8];
  id v4 = [(AAOBInvitationSentModel *)self recipientHandle];
  id v9 = [v3 contactInfoForHandle:v4];

  v5 = NSString;
  v6 = [(AAOBInvitationSentModel *)self detailText];
  objc_super v7 = [v9 displayName];
  v8 = objc_msgSend(v5, "stringWithFormat:", v6, v7);
  [(AAOBInvitationSentModel *)self setDetailText:v8];

  self->_contentViewLayout = 2;
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