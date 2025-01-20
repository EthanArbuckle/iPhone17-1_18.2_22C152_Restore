@interface FAConfirmIdentityViewController
- (BOOL)shouldShowInviteeInstructions;
- (FAConfirmIdentityViewController)initWithAppleAccount:(id)a3 grandSlamSigner:(id)a4;
- (FAConfirmIdentityViewControllerDelegate)delegate;
- (double)_heightForText:(id)a3 width:(double)a4;
- (id)instructions;
- (id)pageTitle;
- (id)titleForContinuebutton;
- (void)_showImagePickerForAvailableSources;
- (void)_updateFonts;
- (void)_updateViewsInPhotoArea:(id)a3;
- (void)_useDifferentIDButtonWasTapped:(id)a3;
- (void)continueButtonWasTapped:(id)a3;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation FAConfirmIdentityViewController

- (FAConfirmIdentityViewController)initWithAppleAccount:(id)a3 grandSlamSigner:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FAConfirmIdentityViewController;
  v9 = [(FAConfirmIdentityViewController *)&v14 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appleAccount, a3);
    uint64_t v11 = [objc_alloc(MEMORY[0x263F25D08]) initWithGrandSlamSigner:v8];
    profilePictureStore = v10->_profilePictureStore;
    v10->_profilePictureStore = (AAUIProfilePictureStore *)v11;

    [(AAUIProfilePictureStore *)v10->_profilePictureStore setPictureDiameter:100.0];
    [(AAUIProfilePictureStore *)v10->_profilePictureStore setMonogramType:0];
  }

  return v10;
}

- (void)loadView
{
  v72.receiver = self;
  v72.super_class = (Class)FAConfirmIdentityViewController;
  [(FAConfirmIdentityViewController *)&v72 loadView];
  id v3 = objc_alloc(MEMORY[0x263F82B88]);
  v4 = [MEMORY[0x263F82B60] mainScreen];
  [v4 bounds];
  v5 = (UIScrollView *)objc_msgSend(v3, "initWithFrame:");
  scrollView = self->_scrollView;
  self->_scrollView = v5;

  id v7 = self->_scrollView;
  id v8 = [MEMORY[0x263F825C8] whiteColor];
  [(UIScrollView *)v7 setBackgroundColor:v8];

  [(FAConfirmIdentityViewController *)self setView:self->_scrollView];
  id v9 = objc_alloc(MEMORY[0x263F82E00]);
  double v10 = *MEMORY[0x263F001A8];
  double v11 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v12 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v13 = *(double *)(MEMORY[0x263F001A8] + 24);
  objc_super v14 = (UIView *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x263F001A8], v11, v12, v13);
  contentView = self->_contentView;
  self->_contentView = v14;

  [(UIScrollView *)self->_scrollView addSubview:self->_contentView];
  v16 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v10, v11, v12, v13);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v16;

  v18 = self->_titleLabel;
  v19 = [(FAConfirmIdentityViewController *)self pageTitle];
  [(UILabel *)v18 setText:v19];

  [(UILabel *)self->_titleLabel setTextAlignment:1];
  [(UILabel *)self->_titleLabel setNumberOfLines:0];
  v20 = self->_titleLabel;
  v21 = objc_msgSend(MEMORY[0x263F81708], "aa_fontForPageTitle");
  [(UILabel *)v20 setFont:v21];

  [(UIView *)self->_contentView addSubview:self->_titleLabel];
  v22 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v10, v11, v12, v13);
  descriptionLabel = self->_descriptionLabel;
  self->_descriptionLabel = v22;

  v24 = self->_descriptionLabel;
  v25 = [(FAConfirmIdentityViewController *)self instructions];
  [(UILabel *)v24 setText:v25];

  [(UILabel *)self->_descriptionLabel setTextAlignment:1];
  [(UILabel *)self->_descriptionLabel setNumberOfLines:0];
  v26 = self->_descriptionLabel;
  v27 = objc_msgSend(MEMORY[0x263F81708], "aa_fontForLargerInformationLabel");
  [(UILabel *)v26 setFont:v27];

  [(UIView *)self->_contentView addSubview:self->_descriptionLabel];
  uint64_t v28 = [(AAUIProfilePictureStore *)self->_profilePictureStore profilePictureForAccountOwnerWithoutMonogramFallback];
  v71 = (void *)v28;
  if (v28)
  {
    v29 = (UIView *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v28];
    profilePhotoView = self->_profilePhotoView;
    self->_profilePhotoView = v29;

    v31 = self->_profilePhotoView;
    v32 = (UIView *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__photoWasTapped_];
    [(UIView *)v31 addGestureRecognizer:v32];
  }
  else
  {
    v33 = [[FAAddPhotoView alloc] initWithTarget:self action:sel__addPhotoButtonWasTapped_];
    v32 = self->_profilePhotoView;
    self->_profilePhotoView = &v33->super;
  }

  [(UIView *)self->_contentView addSubview:self->_profilePhotoView];
  v34 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v10, v11, v12, v13);
  nameLabel = self->_nameLabel;
  self->_nameLabel = v34;

  [(UILabel *)self->_nameLabel setTextAlignment:1];
  v36 = self->_nameLabel;
  v37 = [(ACAccount *)self->_appleAccount aaui_compositeName];
  [(UILabel *)v36 setText:v37];

  [(UILabel *)self->_nameLabel setNumberOfLines:0];
  v38 = self->_nameLabel;
  v39 = (void *)MEMORY[0x263F81708];
  v40 = [MEMORY[0x263F82770] metricsForTextStyle:*MEMORY[0x263F83570]];
  [v40 scaledValueForValue:27.0];
  v41 = objc_msgSend(v39, "_lightSystemFontOfSize:");
  [(UILabel *)v38 setFont:v41];

  [(UIView *)self->_contentView addSubview:self->_nameLabel];
  v42 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v10, v11, v12, v13);
  emailLabel = self->_emailLabel;
  self->_emailLabel = v42;

  [(UILabel *)self->_emailLabel setTextAlignment:1];
  v44 = self->_emailLabel;
  v45 = [(ACAccount *)self->_appleAccount username];
  [(UILabel *)v44 setText:v45];

  [(UILabel *)self->_emailLabel setNumberOfLines:0];
  v46 = self->_emailLabel;
  v47 = objc_msgSend(MEMORY[0x263F81708], "aa_fontForPrimaryInformationLabel");
  [(UILabel *)v46 setFont:v47];

  [(UIView *)self->_contentView addSubview:self->_emailLabel];
  v48 = [MEMORY[0x263F824E8] buttonWithType:1];
  continueButton = self->_continueButton;
  self->_continueButton = v48;

  v50 = self->_continueButton;
  v51 = [(FAConfirmIdentityViewController *)self titleForContinuebutton];
  [(UIButton *)v50 setTitle:v51 forState:0];

  v52 = self->_continueButton;
  v53 = [MEMORY[0x263F825C8] systemBlueColor];
  [(UIButton *)v52 setTintColor:v53];

  v54 = [(UIButton *)self->_continueButton titleLabel];
  v55 = objc_msgSend(MEMORY[0x263F81708], "aa_fontForLargeButton");
  [v54 setFont:v55];

  v56 = [(UIButton *)self->_continueButton titleLabel];
  [v56 setNumberOfLines:0];

  v57 = [(UIButton *)self->_continueButton titleLabel];
  [v57 setTextAlignment:1];

  [(UIButton *)self->_continueButton addTarget:self action:sel_continueButtonWasTapped_ forControlEvents:64];
  [(UIView *)self->_contentView addSubview:self->_continueButton];
  v58 = [MEMORY[0x263F824E8] buttonWithType:1];
  useDifferentIDButton = self->_useDifferentIDButton;
  self->_useDifferentIDButton = v58;

  v60 = NSString;
  v61 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v62 = [v61 localizedStringForKey:@"FAMILY_SETUP_USE_DIFFERENT_ID_BUTTON" value:&stru_26CA2C800 table:@"Localizable"];
  v63 = [(ACAccount *)self->_appleAccount aa_firstName];
  v64 = objc_msgSend(v60, "stringWithFormat:", v62, v63);

  [(UIButton *)self->_useDifferentIDButton setTitle:v64 forState:0];
  v65 = self->_useDifferentIDButton;
  v66 = [MEMORY[0x263F825C8] systemBlueColor];
  [(UIButton *)v65 setTintColor:v66];

  v67 = [(UIButton *)self->_useDifferentIDButton titleLabel];
  v68 = objc_msgSend(MEMORY[0x263F81708], "aa_fontForPrimaryInformationLabel");
  [v67 setFont:v68];

  v69 = [(UIButton *)self->_useDifferentIDButton titleLabel];
  [v69 setNumberOfLines:0];

  v70 = [(UIButton *)self->_useDifferentIDButton titleLabel];
  [v70 setTextAlignment:1];

  [(UIButton *)self->_useDifferentIDButton addTarget:self action:sel__useDifferentIDButtonWasTapped_ forControlEvents:64];
  [(UIView *)self->_contentView addSubview:self->_useDifferentIDButton];
}

- (void)viewWillLayoutSubviews
{
  v82.receiver = self;
  v82.super_class = (Class)FAConfirmIdentityViewController;
  [(FAConfirmIdentityViewController *)&v82 viewWillLayoutSubviews];
  id v3 = [(FAConfirmIdentityViewController *)self view];
  [v3 frame];
  double v5 = v4;
  double v81 = v6;

  [(UILabel *)self->_titleLabel frame];
  id v7 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v9 = 44.0;
  }
  else {
    double v9 = 14.0;
  }
  UIRoundToViewScale();
  double v11 = v10;
  double v12 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v13 = [v12 userInterfaceIdiom];

  double v14 = 28.0;
  if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v14 = 88.0;
  }
  double v15 = v5 - v14;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v5 - v14, 0.0);
  double v17 = v16;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v9, v11, v15, v16);
  [(UILabel *)self->_descriptionLabel frame];
  v18 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v19 = [v18 userInterfaceIdiom];

  if ((v19 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v20 = 51.0;
  }
  else {
    double v20 = 21.0;
  }
  UIRoundToViewScale();
  double v22 = v11 + v17 + v21;
  v23 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v24 = [v23 userInterfaceIdiom];

  if ((v24 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v25 = 88.0;
  }
  else {
    double v25 = 28.0;
  }
  double v26 = v5 - v25 + -14.0;
  v27 = [(UILabel *)self->_descriptionLabel text];
  [(FAConfirmIdentityViewController *)self _heightForText:v27 width:v26];
  double v29 = v28;

  -[UILabel setFrame:](self->_descriptionLabel, "setFrame:", v20, v22, v26, v29);
  [(UIView *)self->_profilePhotoView frame];
  UIRoundToViewScale();
  double v31 = v22 + v29 + v30;
  -[UIView setFrame:](self->_profilePhotoView, "setFrame:", (v5 + -100.0) * 0.5, v31, 100.0, 100.0);
  [(UILabel *)self->_nameLabel sizeToFit];
  [(UILabel *)self->_nameLabel frame];
  double v33 = v32;
  v34 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v35 = [v34 userInterfaceIdiom];

  if ((v35 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v36 = 44.0;
  }
  else {
    double v36 = 14.0;
  }
  double v37 = v31 + 100.0 + 10.0;
  v38 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v39 = [v38 userInterfaceIdiom];

  double v40 = 28.0;
  if ((v39 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v40 = 88.0;
  }
  -[UILabel setFrame:](self->_nameLabel, "setFrame:", v36, v31 + 100.0 + 10.0, v5 - v40, v33);
  [(UILabel *)self->_emailLabel sizeToFit];
  [(UILabel *)self->_emailLabel frame];
  double v42 = v41;
  v43 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v44 = [v43 userInterfaceIdiom];

  if ((v44 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v45 = 44.0;
  }
  else {
    double v45 = 14.0;
  }
  UIRoundToViewScale();
  double v47 = v37 + v33 - v46;
  v48 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v49 = [v48 userInterfaceIdiom];

  if ((v49 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v50 = 88.0;
  }
  else {
    double v50 = 28.0;
  }
  -[UILabel setFrame:](self->_emailLabel, "setFrame:", v45, v47, v5 - v50, v42);
  [(UIButton *)self->_continueButton sizeToFit];
  [(UIButton *)self->_continueButton frame];
  double v52 = v51;
  v53 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v54 = [v53 userInterfaceIdiom];

  if ((v54 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v55 = 44.0;
  }
  else {
    double v55 = 14.0;
  }
  UIRoundToViewScale();
  double v57 = v42 + v47 + v56;
  v58 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v59 = [v58 userInterfaceIdiom];

  if ((v59 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v60 = 88.0;
  }
  else {
    double v60 = 28.0;
  }
  -[UIButton setFrame:](self->_continueButton, "setFrame:", v55, v57, v5 - v60, v52);
  v61 = [(FAConfirmIdentityViewController *)self navigationController];
  v62 = [v61 navigationBar];
  [v62 size];
  double v64 = v63;

  [(UIButton *)self->_useDifferentIDButton frame];
  v65 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v66 = [v65 userInterfaceIdiom];

  unint64_t v67 = v66 & 0xFFFFFFFFFFFFFFFBLL;
  v68 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v69 = [v68 userInterfaceIdiom];

  unint64_t v70 = v69 & 0xFFFFFFFFFFFFFFFBLL;
  v71 = [(UIButton *)self->_useDifferentIDButton titleLabel];
  objc_super v72 = [v71 text];
  [(UIButton *)self->_useDifferentIDButton size];
  -[FAConfirmIdentityViewController _heightForText:width:](self, "_heightForText:width:", v72);
  double v74 = v73;

  UIRoundToViewScale();
  double v76 = v81 - v74 - v11 - v64 - v75;
  if (v76 >= v52 + v57) {
    double v77 = v76;
  }
  else {
    double v77 = v52 + v57 + 30.0;
  }
  double v78 = 28.0;
  if (v70 == 1) {
    double v78 = 88.0;
  }
  double v79 = v5 - v78;
  double v80 = 14.0;
  if (v67 == 1) {
    double v80 = 44.0;
  }
  -[UIButton setFrame:](self->_useDifferentIDButton, "setFrame:", v80, v77, v79, v74);
  [(UIView *)self->_contentView frame];
  -[UIView setFrame:](self->_contentView, "setFrame:");
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v5, v74 + v77 + 20.0);
}

- (id)pageTitle
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"FAMILY_CONFIRM_ACCOUNT_TITLE" value:&stru_26CA2C800 table:@"Localizable"];

  return v3;
}

- (id)instructions
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"FAMILY_CONFIRM_ACCOUNT_MESSAGE" value:&stru_26CA2C800 table:@"Localizable"];

  return v3;
}

- (id)titleForContinuebutton
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"FAMILY_CONFIRM_ACCOUNT_BUTTON" value:&stru_26CA2C800 table:@"Localizable"];

  return v3;
}

- (BOOL)shouldShowInviteeInstructions
{
  return 1;
}

- (double)_heightForText:(id)a3 width:(double)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v12 = *MEMORY[0x263F814F0];
  double v5 = (void *)MEMORY[0x263F81708];
  id v6 = a3;
  id v7 = objc_msgSend(v5, "aa_fontForLargerInformationLabel");
  v13[0] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  objc_msgSend(v6, "boundingRectWithSize:options:attributes:context:", 1, v8, 0, a4, 1.79769313e308);
  double v10 = v9;

  return ceil(v10);
}

- (void)_updateViewsInPhotoArea:(id)a3
{
  id v10 = a3;
  [(UIView *)self->_profilePhotoView removeFromSuperview];
  if (v10)
  {
    double v4 = (UIView *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v10];
    profilePhotoView = self->_profilePhotoView;
    self->_profilePhotoView = v4;

    id v6 = self->_profilePhotoView;
    id v7 = (UIView *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__photoWasTapped_];
    [(UIView *)v6 addGestureRecognizer:v7];
  }
  else
  {
    uint64_t v8 = [[FAAddPhotoView alloc] initWithTarget:self action:sel__addPhotoButtonWasTapped_];
    id v7 = self->_profilePhotoView;
    self->_profilePhotoView = &v8->super;
  }

  [(UIView *)self->_contentView addSubview:self->_profilePhotoView];
  double v9 = [(FAConfirmIdentityViewController *)self view];
  [v9 setNeedsLayout];
}

- (void)continueButtonWasTapped:(id)a3
{
  id v10 = a3;
  newProfilePicture = self->_newProfilePicture;
  if (newProfilePicture)
  {
    [(AAUIProfilePictureStore *)self->_profilePictureStore setProfilePictureForAccountOwner:newProfilePicture cropRect:self->_newProfilePictureCropRect];
    double v5 = self->_newProfilePicture;
    self->_newProfilePicture = 0;

    newProfilePictureCropRect = self->_newProfilePictureCropRect;
    self->_newProfilePictureCropRect = 0;
  }
  id v7 = [(FAConfirmIdentityViewController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    double v9 = [(FAConfirmIdentityViewController *)self delegate];
    [v9 confirmIdentityViewController:self didCompleteWithSuccess:1];
  }
}

- (void)_useDifferentIDButtonWasTapped:(id)a3
{
  double v5 = objc_alloc_init(FAExplainAppleIDViewController);
  [(FAExplainAppleIDViewController *)v5 setShouldShowInviteeInstructions:[(FAConfirmIdentityViewController *)self shouldShowInviteeInstructions]];
  double v4 = [(FAConfirmIdentityViewController *)self navigationController];
  [v4 pushViewController:v5 animated:1];
}

- (void)_showImagePickerForAvailableSources
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __70__FAConfirmIdentityViewController__showImagePickerForAvailableSources__block_invoke;
  v4[3] = &unk_264349190;
  v4[4] = self;
  id v3 = [MEMORY[0x263F25CE8] alertControllerWithSelectionHandler:v4];
  [(FAConfirmIdentityViewController *)self presentViewController:v3 animated:1 completion:0];
}

void __70__FAConfirmIdentityViewController__showImagePickerForAvailableSources__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v6 = a3;
  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 1064), a2);
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 1072), a3);
    id v7 = *(id **)(a1 + 32);
    char v8 = [v7[132] profilePictureForPicture:v9];
    [v7 _updateViewsInPhotoArea:v8];
  }
}

- (void)_updateFonts
{
  titleLabel = self->_titleLabel;
  double v4 = objc_msgSend(MEMORY[0x263F81708], "aa_fontForPageTitle");
  [(UILabel *)titleLabel setFont:v4];

  descriptionLabel = self->_descriptionLabel;
  id v6 = objc_msgSend(MEMORY[0x263F81708], "aa_fontForLargerInformationLabel");
  [(UILabel *)descriptionLabel setFont:v6];

  nameLabel = self->_nameLabel;
  char v8 = (void *)MEMORY[0x263F81708];
  id v9 = [MEMORY[0x263F82770] metricsForTextStyle:*MEMORY[0x263F83570]];
  [v9 scaledValueForValue:27.0];
  id v10 = objc_msgSend(v8, "_lightSystemFontOfSize:");
  [(UILabel *)nameLabel setFont:v10];

  emailLabel = self->_emailLabel;
  uint64_t v12 = objc_msgSend(MEMORY[0x263F81708], "aa_fontForPrimaryInformationLabel");
  [(UILabel *)emailLabel setFont:v12];

  uint64_t v13 = [(UIButton *)self->_continueButton titleLabel];
  double v14 = objc_msgSend(MEMORY[0x263F81708], "aa_fontForLargeButton");
  [v13 setFont:v14];

  double v15 = [(UIButton *)self->_useDifferentIDButton titleLabel];
  double v16 = objc_msgSend(MEMORY[0x263F81708], "aa_fontForPrimaryInformationLabel");
  [v15 setFont:v16];

  id v17 = [(FAConfirmIdentityViewController *)self view];
  [v17 setNeedsLayout];
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)FAConfirmIdentityViewController;
  id v4 = a3;
  [(FAConfirmIdentityViewController *)&v9 traitCollectionDidChange:v4];
  double v5 = objc_msgSend(v4, "preferredContentSizeCategory", v9.receiver, v9.super_class);

  id v6 = [(FAConfirmIdentityViewController *)self traitCollection];
  id v7 = [v6 preferredContentSizeCategory];
  char v8 = [v5 isEqualToString:v7];

  if ((v8 & 1) == 0) {
    [(FAConfirmIdentityViewController *)self _updateFonts];
  }
}

- (FAConfirmIdentityViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FAConfirmIdentityViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_imagePicker, 0);
  objc_storeStrong((id *)&self->_newProfilePictureCropRect, 0);
  objc_storeStrong((id *)&self->_newProfilePicture, 0);
  objc_storeStrong((id *)&self->_profilePictureStore, 0);
  objc_storeStrong((id *)&self->_useDifferentIDButton, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_emailLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_profilePhotoView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_appleAccount, 0);
}

@end