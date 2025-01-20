@interface AAUIOBCustodianInvitationModel
- (AAUIOBCustodianInvitationModel)initWithModel:(id)a3;
- (AAUIOBCustodianInvitationModel)initWithType:(int64_t)a3 initiatorsHandle:(id)a4;
- (NSString)description;
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

@implementation AAUIOBCustodianInvitationModel

- (AAUIOBCustodianInvitationModel)initWithType:(int64_t)a3 initiatorsHandle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AAUIOBCustodianInvitationModel;
  v4 = [(AAOBCustodianInvitationModel *)&v7 initWithType:a3 ownerHandle:a4];
  v5 = v4;
  if (v4) {
    [(AAUIOBCustodianInvitationModel *)v4 _setupAAUIOBWelcomeControllerProtocolProperties];
  }
  return v5;
}

- (AAUIOBCustodianInvitationModel)initWithModel:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AAUIOBCustodianInvitationModel;
  v5 = [(AAUIOBCustodianInvitationModel *)&v16 init];
  if (v5)
  {
    -[AAOBCustodianInvitationModel setType:](v5, "setType:", [v4 type]);
    v6 = [v4 detailText];
    [(AAOBCustodianInvitationModel *)v5 setDetailText:v6];

    objc_super v7 = [v4 title];
    [(AAOBCustodianInvitationModel *)v5 setTitle:v7];

    v8 = [v4 primaryButton];
    [(AAOBCustodianInvitationModel *)v5 setPrimaryButton:v8];

    v9 = [v4 secondaryButton];
    [(AAOBCustodianInvitationModel *)v5 setSecondaryButton:v9];

    v10 = [v4 ownerHandle];
    [(AAOBCustodianInvitationModel *)v5 setOwnerHandle:v10];

    v11 = [v4 custodianshipInfo];
    [(AAOBCustodianInvitationModel *)v5 setCustodianshipInfo:v11];

    v12 = [v4 helpLinkTitle];
    [(AAOBCustodianInvitationModel *)v5 setHelpLinkTitle:v12];

    v13 = [v4 helpLinkURL];
    [(AAOBCustodianInvitationModel *)v5 setHelpLinkURL:v13];

    v14 = [v4 imageName];
    [(AAOBCustodianInvitationModel *)v5 setImageName:v14];

    [(AAUIOBCustodianInvitationModel *)v5 _setupAAUIOBWelcomeControllerProtocolProperties];
  }

  return v5;
}

- (void)_setupAAUIOBWelcomeControllerProtocolProperties
{
  v3 = (void *)MEMORY[0x263F258F8];
  id v4 = [(AAOBCustodianInvitationModel *)self ownerHandle];
  id v14 = [v3 contactInfoForHandle:v4];

  v5 = [MEMORY[0x263F258F8] firstNameForLocalContactInfo:v14];
  v6 = [v14 displayName];
  objc_super v7 = [(AAOBCustodianInvitationModel *)self detailsTextWithFirstName:v5 fullName:v6];
  [(AAOBCustodianInvitationModel *)self setDetailText:v7];

  self->_contentViewLayout = 2;
  v8 = [(AAOBCustodianInvitationModel *)self imageName];
  uint64_t v9 = [v8 length];

  if (v9)
  {
    v10 = (void *)MEMORY[0x263F827E8];
    v11 = [(AAOBCustodianInvitationModel *)self imageName];
    v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v13 = [v10 imageNamed:v11 inBundle:v12];
    [(AAUIOBCustodianInvitationModel *)self setImage:v13];
  }
}

- (NSString)description
{
  v3 = NSString;
  id v4 = [(AAOBCustodianInvitationModel *)self imageName];
  v5 = [(AAOBCustodianInvitationModel *)self title];
  v6 = [(AAOBCustodianInvitationModel *)self detailText];
  objc_super v7 = [(AAOBCustodianInvitationModel *)self primaryButton];
  v8 = [(AAOBCustodianInvitationModel *)self secondaryButton];
  uint64_t v9 = [(AAOBCustodianInvitationModel *)self helpLinkURL];
  v10 = [(AAOBCustodianInvitationModel *)self helpLinkTitle];
  v11 = [(AAOBCustodianInvitationModel *)self ownerHandle];
  v12 = [(AAOBCustodianInvitationModel *)self recipientHandle];
  v13 = [v3 stringWithFormat:@"imageName: %@\title: %@\ndetailText: %@\nprimaryButton: %@\nsecondaryButton: %@\nhelpLinkTitle: %@\nhelpLinkURL: %@\nownerHandle: %@\nrecipientHandle: %@\n", v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return (NSString *)v13;
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