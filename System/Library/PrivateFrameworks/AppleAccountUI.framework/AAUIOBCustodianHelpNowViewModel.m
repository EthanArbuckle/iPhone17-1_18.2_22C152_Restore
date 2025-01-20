@interface AAUIOBCustodianHelpNowViewModel
- (AAUIOBCustodianHelpNowViewModel)initWithModel:(id)a3;
- (AAUIOBCustodianHelpNowViewModel)initWithRecoveryCode:(id)a3 ownerName:(id)a4;
- (NSString)detailText;
- (NSString)imageName;
- (NSString)title;
- (UIImage)image;
- (UIView)contentView;
- (UIView)secondaryView;
- (int64_t)contentViewLayout;
- (void)_setupAAUIOBWelcomeControllerProtocolProperties;
- (void)setContentView:(id)a3;
- (void)setContentViewLayout:(int64_t)a3;
- (void)setDetailText:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageName:(id)a3;
- (void)setSecondaryView:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation AAUIOBCustodianHelpNowViewModel

- (AAUIOBCustodianHelpNowViewModel)initWithRecoveryCode:(id)a3 ownerName:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AAUIOBCustodianHelpNowViewModel;
  v4 = [(AAOBCustodianHelpNowModel *)&v7 initWithRecoveryCode:a3 ownerName:a4];
  v5 = v4;
  if (v4) {
    [(AAUIOBCustodianHelpNowViewModel *)v4 _setupAAUIOBWelcomeControllerProtocolProperties];
  }
  return v5;
}

- (AAUIOBCustodianHelpNowViewModel)initWithModel:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AAUIOBCustodianHelpNowViewModel;
  v5 = [(AAUIOBCustodianHelpNowViewModel *)&v15 init];
  if (v5)
  {
    v6 = [v4 detailText];
    [(AAUIOBCustodianHelpNowViewModel *)v5 setDetailText:v6];

    objc_super v7 = [v4 title];
    [(AAUIOBCustodianHelpNowViewModel *)v5 setTitle:v7];

    v8 = [v4 primaryButton];
    [(AAOBCustodianHelpNowModel *)v5 setPrimaryButton:v8];

    v9 = [v4 secondaryButton];
    [(AAOBCustodianHelpNowModel *)v5 setSecondaryButton:v9];

    v10 = [v4 imageName];
    [(AAUIOBCustodianHelpNowViewModel *)v5 setImageName:v10];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v4;
      v12 = [v11 recoveryCode];
      [(AAOBCustodianHelpNowModel *)v5 setRecoveryCode:v12];

      v13 = [v11 ownerName];

      [(AAOBCustodianHelpNowModel *)v5 setOwnerName:v13];
    }
    [(AAUIOBCustodianHelpNowViewModel *)v5 _setupAAUIOBWelcomeControllerProtocolProperties];
  }

  return v5;
}

- (void)_setupAAUIOBWelcomeControllerProtocolProperties
{
  v3 = [(AAUIOBCustodianHelpNowViewModel *)self imageName];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    v5 = (void *)MEMORY[0x263F827E8];
    v6 = [(AAUIOBCustodianHelpNowViewModel *)self imageName];
    objc_super v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v8 = [v5 imageNamed:v6 inBundle:v7];
    [(AAUIOBCustodianHelpNowViewModel *)self setImage:v8];
  }
  v9 = NSString;
  v10 = [(AAUIOBCustodianHelpNowViewModel *)self detailText];
  id v11 = [(AAOBCustodianHelpNowModel *)self ownerName];
  v12 = [(AAOBCustodianHelpNowModel *)self ownerName];
  objc_msgSend(v9, "stringWithFormat:", v10, v11, v12);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  detailText = self->_detailText;
  self->_detailText = v13;

  objc_super v15 = [AAUICustodianHelpCodeView alloc];
  v16 = -[AAUICustodianHelpCodeView initWithFrame:](v15, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(UIView *)v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  v17 = [(AAOBCustodianHelpNowModel *)self recoveryCode];
  [(UIView *)v16 setText:v17];

  contentView = self->_contentView;
  self->_contentView = v16;

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

- (NSString)detailText
{
  return self->_detailText;
}

- (void)setDetailText:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_secondaryView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end