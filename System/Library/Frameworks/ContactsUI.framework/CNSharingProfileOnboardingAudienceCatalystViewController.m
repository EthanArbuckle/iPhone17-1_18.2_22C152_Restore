@interface CNSharingProfileOnboardingAudienceCatalystViewController
+ (id)descriptorForRequiredKeys;
+ (id)headerText;
- (BOOL)textFieldShouldReturn:(id)a3;
- (CNMutableContact)contact;
- (CNSharingProfileAudienceDataSource)sharingAudienceDataSource;
- (CNSharingProfileOnboardingAudienceCatalystViewController)initWithContact:(id)a3 selectedSharingAudience:(unint64_t)a4;
- (CNSharingProfileOnboardingAudienceControllerDelegate)delegate;
- (OBBoldTrayButton)backButton;
- (OBBoldTrayButton)confirmButton;
- (OBLinkTrayButton)setupLaterButton;
- (UIButton)audiencePickerButton;
- (UIImageView)avatarImageView;
- (UILabel)audienceDescriptionLabel;
- (UILabel)audienceLabel;
- (UILabel)nameLabel;
- (UITextField)familyNameField;
- (UITextField)givenNameField;
- (UIView)customContentView;
- (id)confirmButtonTitle;
- (int64_t)nameOrder;
- (void)createAudienceDescriptionLabel;
- (void)createAudienceLabel;
- (void)createAudiencePickerButton;
- (void)createAvatarView;
- (void)createContentView;
- (void)createNameLabel;
- (void)createNameTextFields;
- (void)dealloc;
- (void)didSelectSharingAudience:(unint64_t)a3;
- (void)familyNameDidChange:(id)a3;
- (void)givenNameDidChange:(id)a3;
- (void)handleBackTapped:(id)a3;
- (void)handleConfirmButtonTapped:(id)a3;
- (void)handleSetupLaterTapped:(id)a3;
- (void)layoutContentView;
- (void)setAudienceDescriptionLabel:(id)a3;
- (void)setAudienceLabel:(id)a3;
- (void)setAudiencePickerButton:(id)a3;
- (void)setAvatarImageView:(id)a3;
- (void)setBackButton:(id)a3;
- (void)setConfirmButton:(id)a3;
- (void)setContact:(id)a3;
- (void)setCustomContentView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFamilyNameField:(id)a3;
- (void)setGivenNameField:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setNameOrder:(int64_t)a3;
- (void)setSetupLaterButton:(id)a3;
- (void)setSharingAudienceDataSource:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)updateConfirmButtonEnabledState;
- (void)updateMenuForAudiencePicker;
- (void)viewDidLoad;
@end

@implementation CNSharingProfileOnboardingAudienceCatalystViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingAudienceDataSource, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_audienceDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_audiencePickerButton, 0);
  objc_storeStrong((id *)&self->_audienceLabel, 0);
  objc_storeStrong((id *)&self->_familyNameField, 0);
  objc_storeStrong((id *)&self->_givenNameField, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_avatarImageView, 0);
  objc_storeStrong((id *)&self->_confirmButton, 0);
  objc_storeStrong((id *)&self->_backButton, 0);
  objc_storeStrong((id *)&self->_setupLaterButton, 0);
  objc_storeStrong((id *)&self->_customContentView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setNameOrder:(int64_t)a3
{
  self->_nameOrder = a3;
}

- (int64_t)nameOrder
{
  return self->_nameOrder;
}

- (void)setSharingAudienceDataSource:(id)a3
{
}

- (CNSharingProfileAudienceDataSource)sharingAudienceDataSource
{
  return self->_sharingAudienceDataSource;
}

- (void)setContact:(id)a3
{
}

- (CNMutableContact)contact
{
  return self->_contact;
}

- (void)setAudienceDescriptionLabel:(id)a3
{
}

- (UILabel)audienceDescriptionLabel
{
  return self->_audienceDescriptionLabel;
}

- (void)setAudiencePickerButton:(id)a3
{
}

- (UIButton)audiencePickerButton
{
  return self->_audiencePickerButton;
}

- (void)setAudienceLabel:(id)a3
{
}

- (UILabel)audienceLabel
{
  return self->_audienceLabel;
}

- (void)setFamilyNameField:(id)a3
{
}

- (UITextField)familyNameField
{
  return self->_familyNameField;
}

- (void)setGivenNameField:(id)a3
{
}

- (UITextField)givenNameField
{
  return self->_givenNameField;
}

- (void)setNameLabel:(id)a3
{
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setAvatarImageView:(id)a3
{
}

- (UIImageView)avatarImageView
{
  return self->_avatarImageView;
}

- (void)setConfirmButton:(id)a3
{
}

- (OBBoldTrayButton)confirmButton
{
  return self->_confirmButton;
}

- (void)setBackButton:(id)a3
{
}

- (OBBoldTrayButton)backButton
{
  return self->_backButton;
}

- (void)setSetupLaterButton:(id)a3
{
}

- (OBLinkTrayButton)setupLaterButton
{
  return self->_setupLaterButton;
}

- (void)setCustomContentView:(id)a3
{
}

- (UIView)customContentView
{
  return self->_customContentView;
}

- (void)setDelegate:(id)a3
{
}

- (CNSharingProfileOnboardingAudienceControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNSharingProfileOnboardingAudienceControllerDelegate *)WeakRetained;
}

- (void)textFieldDidEndEditing:(id)a3
{
  v4 = [(UITextField *)self->_givenNameField text];
  [(CNMutableContact *)self->_contact setGivenName:v4];

  id v5 = [(UITextField *)self->_familyNameField text];
  [(CNMutableContact *)self->_contact setFamilyName:v5];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  v4 = (UITextField *)a3;
  id v5 = v4;
  int64_t nameOrder = self->_nameOrder;
  if ((nameOrder != 2 || self->_familyNameField == v4) && self->_givenNameField == v4)
  {
    if (nameOrder == 2) {
      v7 = &OBJC_IVAR___CNSharingProfileOnboardingAudienceCatalystViewController__givenNameField;
    }
    else {
      v7 = &OBJC_IVAR___CNSharingProfileOnboardingAudienceCatalystViewController__familyNameField;
    }
    [*(id *)((char *)&self->super.super.super.super.super.super.isa + *v7) becomeFirstResponder];
  }
  else
  {
    [(UITextField *)v4 resignFirstResponder];
  }

  return 0;
}

- (void)handleConfirmButtonTapped:(id)a3
{
  id v4 = [(CNSharingProfileOnboardingAudienceCatalystViewController *)self delegate];
  objc_msgSend(v4, "audienceController:didFinishWithContact:sharingAudience:", self, self->_contact, -[CNSharingProfileAudienceDataSource selectedSharingAudience](self->_sharingAudienceDataSource, "selectedSharingAudience"));
}

- (void)handleBackTapped:(id)a3
{
  id v4 = [(CNSharingProfileOnboardingAudienceCatalystViewController *)self delegate];
  objc_msgSend(v4, "audienceController:didFinishWithContact:sharingAudience:", self, 0, -[CNSharingProfileAudienceDataSource selectedSharingAudience](self->_sharingAudienceDataSource, "selectedSharingAudience"));
}

- (void)handleSetupLaterTapped:(id)a3
{
  id v4 = [(CNSharingProfileOnboardingAudienceCatalystViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CNSharingProfileOnboardingAudienceCatalystViewController *)self delegate];
    [v6 audienceControllerDidTapSetupLater:self];
  }
}

- (id)confirmButtonTitle
{
  v2 = CNContactsUIBundle();
  v3 = [v2 localizedStringForKey:@"SHARING_DONE" value:&stru_1ED8AC728 table:@"Localized"];

  return v3;
}

- (void)updateConfirmButtonEnabledState
{
  uint64_t v3 = *MEMORY[0x1E4F5A298];
  id v4 = [(CNMutableContact *)self->_contact givenName];
  if ((*(unsigned int (**)(uint64_t, void *))(v3 + 16))(v3, v4))
  {
    char v5 = [(CNMutableContact *)self->_contact familyName];
    uint64_t v6 = (*(unsigned int (**)(uint64_t, void *))(v3 + 16))(v3, v5) ^ 1;
  }
  else
  {
    uint64_t v6 = 1;
  }

  confirmButton = self->_confirmButton;

  [(OBBoldTrayButton *)confirmButton setEnabled:v6];
}

- (void)familyNameDidChange:(id)a3
{
  id v4 = [a3 text];
  [(CNMutableContact *)self->_contact setFamilyName:v4];

  [(CNSharingProfileOnboardingAudienceCatalystViewController *)self updateConfirmButtonEnabledState];
}

- (void)givenNameDidChange:(id)a3
{
  id v4 = [a3 text];
  [(CNMutableContact *)self->_contact setGivenName:v4];

  [(CNSharingProfileOnboardingAudienceCatalystViewController *)self updateConfirmButtonEnabledState];
}

- (void)didSelectSharingAudience:(unint64_t)a3
{
  [(CNSharingProfileAudienceDataSource *)self->_sharingAudienceDataSource setSelectedSharingAudience:a3];
  [(CNSharingProfileOnboardingAudienceCatalystViewController *)self updateMenuForAudiencePicker];
  id v4 = [(CNSharingProfileAudienceDataSource *)self->_sharingAudienceDataSource sectionFooterLabel];
  [(UILabel *)self->_audienceDescriptionLabel setText:v4];
}

- (void)layoutContentView
{
  v103[28] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CNSharingProfileOnboardingAudienceCatalystViewController *)self customContentView];
  [v3 addSubview:self->_avatarImageView];
  [v3 addSubview:self->_nameLabel];
  [v3 addSubview:self->_givenNameField];
  [v3 addSubview:self->_familyNameField];
  [v3 addSubview:self->_audienceLabel];
  [v3 addSubview:self->_audiencePickerButton];
  id v4 = v3;
  [v3 addSubview:self->_audienceDescriptionLabel];
  int64_t nameOrder = self->_nameOrder;
  BOOL v6 = nameOrder == 2;
  if (nameOrder == 2) {
    uint64_t v7 = 1288;
  }
  else {
    uint64_t v7 = 1280;
  }
  v8 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v7);
  if (v6) {
    uint64_t v9 = 1280;
  }
  else {
    uint64_t v9 = 1288;
  }
  v10 = (objc_class *)MEMORY[0x1E4FB1940];
  id v102 = *(id *)((char *)&self->super.super.super.super.super.super.isa + v9);
  id v11 = v8;
  id v12 = objc_alloc_init(v10);
  objc_msgSend(v4, "addLayoutGuide:");
  v100 = [v4 widthAnchor];
  v101 = [v4 superview];
  v99 = [v101 widthAnchor];
  v98 = [v100 constraintEqualToAnchor:v99];
  v103[0] = v98;
  v97 = [(UIImageView *)self->_avatarImageView topAnchor];
  v96 = [v4 topAnchor];
  v95 = [v97 constraintEqualToAnchor:v96];
  v103[1] = v95;
  v94 = [(UIImageView *)self->_avatarImageView widthAnchor];
  v93 = [v94 constraintEqualToConstant:150.0];
  v103[2] = v93;
  v92 = [(UIImageView *)self->_avatarImageView heightAnchor];
  v91 = [(UIImageView *)self->_avatarImageView widthAnchor];
  v90 = [v92 constraintEqualToAnchor:v91];
  v103[3] = v90;
  v89 = [(UIImageView *)self->_avatarImageView centerXAnchor];
  v88 = [v4 centerXAnchor];
  v87 = [v89 constraintEqualToAnchor:v88];
  v103[4] = v87;
  v86 = [v12 leadingAnchor];
  v85 = [(UILabel *)self->_nameLabel trailingAnchor];
  v84 = [v86 constraintEqualToAnchor:v85 constant:10.0];
  v103[5] = v84;
  v83 = [v12 trailingAnchor];
  v82 = [v4 trailingAnchor];
  v81 = [v83 constraintEqualToAnchor:v82];
  v103[6] = v81;
  v80 = [(UILabel *)self->_nameLabel leadingAnchor];
  v79 = [v4 leadingAnchor];
  v78 = [v80 constraintEqualToAnchor:v79];
  v103[7] = v78;
  v77 = [(UILabel *)self->_nameLabel trailingAnchor];
  v76 = [v12 leadingAnchor];
  v75 = [v77 constraintEqualToAnchor:v76 constant:-10.0];
  v103[8] = v75;
  v73 = [v12 widthAnchor];
  v72 = [v4 widthAnchor];
  v71 = [v73 constraintEqualToAnchor:v72 multiplier:0.6];
  v103[9] = v71;
  v70 = [v11 leadingAnchor];
  v69 = [v12 leadingAnchor];
  v68 = [v70 constraintEqualToAnchor:v69];
  v103[10] = v68;
  v67 = [v11 trailingAnchor];
  v66 = [v102 leadingAnchor];
  v65 = [v67 constraintEqualToAnchor:v66 constant:-10.0];
  v103[11] = v65;
  v64 = [v11 centerYAnchor];
  v63 = [(UILabel *)self->_nameLabel centerYAnchor];
  v61 = [v64 constraintEqualToAnchor:v63];
  v103[12] = v61;
  v59 = [v11 topAnchor];
  v58 = [(UIImageView *)self->_avatarImageView bottomAnchor];
  v57 = [v59 constraintEqualToAnchor:v58 constant:36.0];
  v103[13] = v57;
  v56 = [v11 widthAnchor];
  v55 = [v12 widthAnchor];
  v54 = [v56 constraintEqualToAnchor:v55 multiplier:0.5 constant:-5.0];
  v103[14] = v54;
  v53 = [v102 widthAnchor];
  v74 = v12;
  v52 = [v12 widthAnchor];
  v50 = [v53 constraintEqualToAnchor:v52 multiplier:0.5 constant:-5.0];
  v103[15] = v50;
  v49 = [v102 trailingAnchor];
  v48 = [v12 trailingAnchor];
  v47 = [v49 constraintEqualToAnchor:v48];
  v103[16] = v47;
  v46 = [v102 centerYAnchor];
  v60 = v11;
  v45 = [v11 centerYAnchor];
  v44 = [v46 constraintEqualToAnchor:v45];
  v103[17] = v44;
  v43 = [(UILabel *)self->_audienceLabel leadingAnchor];
  v42 = [v4 leadingAnchor];
  v41 = [v43 constraintEqualToAnchor:v42];
  v103[18] = v41;
  v40 = [(UILabel *)self->_audienceLabel trailingAnchor];
  v39 = [(UIButton *)self->_audiencePickerButton leadingAnchor];
  v38 = [v40 constraintEqualToAnchor:v39 constant:-10.0];
  v103[19] = v38;
  v37 = [(UILabel *)self->_audienceLabel centerYAnchor];
  v36 = [(UIButton *)self->_audiencePickerButton centerYAnchor];
  v35 = [v37 constraintEqualToAnchor:v36];
  v103[20] = v35;
  v34 = [(UILabel *)self->_audienceLabel trailingAnchor];
  v33 = [(UILabel *)self->_nameLabel trailingAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v103[21] = v32;
  v31 = [(UILabel *)self->_audienceLabel topAnchor];
  v30 = [v11 bottomAnchor];
  v29 = [v31 constraintEqualToAnchor:v30 constant:10.0];
  v103[22] = v29;
  v28 = [(UIButton *)self->_audiencePickerButton trailingAnchor];
  v13 = v4;
  v51 = v4;
  v27 = [v4 trailingAnchor];
  v26 = [v28 constraintEqualToAnchor:v27];
  v103[23] = v26;
  v25 = [(UILabel *)self->_audienceDescriptionLabel leadingAnchor];
  v24 = [(UIButton *)self->_audiencePickerButton leadingAnchor];
  v14 = [v25 constraintEqualToAnchor:v24];
  v103[24] = v14;
  v15 = [(UILabel *)self->_audienceDescriptionLabel widthAnchor];
  v16 = [(UIButton *)self->_audiencePickerButton widthAnchor];
  v17 = [v15 constraintEqualToAnchor:v16];
  v103[25] = v17;
  v18 = [(UILabel *)self->_audienceDescriptionLabel topAnchor];
  v19 = [(UIButton *)self->_audiencePickerButton bottomAnchor];
  v20 = [v18 constraintEqualToAnchor:v19 constant:6.0];
  v103[26] = v20;
  v21 = [(UILabel *)self->_audienceDescriptionLabel bottomAnchor];
  v22 = [v13 bottomAnchor];
  v23 = [v21 constraintLessThanOrEqualToAnchor:v22 constant:-10.0];
  v103[27] = v23;
  v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:v103 count:28];

  [MEMORY[0x1E4F28DC8] activateConstraints:v62];
}

- (void)createContentView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  id v4 = [(CNSharingProfileOnboardingAudienceCatalystViewController *)self view];
  [v4 bounds];
  char v5 = (UIView *)objc_msgSend(v3, "initWithFrame:");

  [(OBWelcomeFullCenterContentController *)self setCenteredContentView:v5];
  customContentView = self->_customContentView;
  self->_customContentView = v5;
}

- (void)createAudienceDescriptionLabel
{
  id v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  audienceDescriptionLabel = self->_audienceDescriptionLabel;
  self->_audienceDescriptionLabel = v3;

  [(UILabel *)self->_audienceDescriptionLabel setNumberOfLines:0];
  LODWORD(v5) = 1132068864;
  [(UILabel *)self->_audienceDescriptionLabel setContentCompressionResistancePriority:0 forAxis:v5];
  BOOL v6 = +[CNUIFontRepository catalystAudienceDetailsLabelFont];
  [(UILabel *)self->_audienceDescriptionLabel setFont:v6];

  [(UILabel *)self->_audienceDescriptionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  id v7 = [(CNSharingProfileAudienceDataSource *)self->_sharingAudienceDataSource sectionFooterLabel];
  [(UILabel *)self->_audienceDescriptionLabel setText:v7];
}

- (void)updateMenuForAudiencePicker
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  if ([(CNSharingProfileAudienceDataSource *)self->_sharingAudienceDataSource numberOfItems])
  {
    unint64_t v4 = 0;
    do
    {
      double v5 = [(CNSharingProfileAudienceDataSource *)self->_sharingAudienceDataSource itemForIndex:v4];
      BOOL v6 = (void *)MEMORY[0x1E4FB13F0];
      id v7 = [v5 label];
      v8 = [v5 label];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __87__CNSharingProfileOnboardingAudienceCatalystViewController_updateMenuForAudiencePicker__block_invoke;
      v12[3] = &unk_1E549BFC8;
      v12[4] = self;
      id v9 = v5;
      id v13 = v9;
      v10 = [v6 actionWithTitle:v7 image:0 identifier:v8 handler:v12];

      if ([v9 isSelected]) {
        [v10 setState:1];
      }
      [v3 addObject:v10];

      ++v4;
    }
    while (v4 < [(CNSharingProfileAudienceDataSource *)self->_sharingAudienceDataSource numberOfItems]);
  }
  id v11 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1ED8AC728 children:v3];
  [(UIButton *)self->_audiencePickerButton setMenu:v11];
}

uint64_t __87__CNSharingProfileOnboardingAudienceCatalystViewController_updateMenuForAudiencePicker__block_invoke(uint64_t a1)
{
  v1 = *(id **)(a1 + 32);
  uint64_t v2 = [v1[166] sharingAudienceForItem:*(void *)(a1 + 40)];

  return [v1 didSelectSharingAudience:v2];
}

- (void)createAudiencePickerButton
{
  id v3 = [MEMORY[0x1E4FB14D0] buttonWithType:124];
  audiencePickerButton = self->_audiencePickerButton;
  self->_audiencePickerButton = v3;

  [(UIButton *)self->_audiencePickerButton setContentHorizontalAlignment:1];
  double v5 = self->_audiencePickerButton;

  [(UIButton *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (void)createAudienceLabel
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1930]);
  unint64_t v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  audienceLabel = self->_audienceLabel;
  self->_audienceLabel = v4;

  BOOL v6 = +[CNUIFontRepository catalystLabelsFont];
  [(UILabel *)self->_audienceLabel setFont:v6];

  [(UILabel *)self->_audienceLabel setNumberOfLines:2];
  LODWORD(v7) = 1144766464;
  [(UILabel *)self->_audienceLabel setContentCompressionResistancePriority:0 forAxis:v7];
  v8 = CNContactsUIBundle();
  id v9 = [v8 localizedStringForKey:@"SHARING_AUDIENCE_LABEL" value:&stru_1ED8AC728 table:@"Localized"];
  [(UILabel *)self->_audienceLabel setText:v9];

  [(UILabel *)self->_audienceLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  id v10 = [(CNSharingProfileOnboardingAudienceCatalystViewController *)self traitCollection];
  -[UILabel setTextAlignment:](self->_audienceLabel, "setTextAlignment:", 2 * ([v10 layoutDirection] == 0));
}

- (void)createNameTextFields
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1D70]);
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v8 = (UITextField *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], v5, v6, v7);
  givenNameField = self->_givenNameField;
  self->_givenNameField = v8;

  [(UITextField *)self->_givenNameField setTranslatesAutoresizingMaskIntoConstraints:0];
  id v10 = [(CNMutableContact *)self->_contact givenName];
  [(UITextField *)self->_givenNameField setText:v10];

  id v11 = +[CNUIFontRepository catalystNameTextFieldsFont];
  [(UITextField *)self->_givenNameField setFont:v11];

  [(UITextField *)self->_givenNameField setAdjustsFontForContentSizeCategory:1];
  [(UITextField *)self->_givenNameField setAutocorrectionType:1];
  id v12 = CNContactsUIBundle();
  id v13 = [v12 localizedStringForKey:@"SHARING_GIVEN_NAME_PLACEHOLDER" value:&stru_1ED8AC728 table:@"Localized"];
  [(UITextField *)self->_givenNameField setPlaceholder:v13];

  [(UITextField *)self->_givenNameField addTarget:self action:sel_givenNameDidChange_ forControlEvents:0x20000];
  [(UITextField *)self->_givenNameField setBorderStyle:3];
  [(UITextField *)self->_givenNameField setDelegate:self];
  v14 = (UITextField *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1D70]), "initWithFrame:", v4, v5, v6, v7);
  familyNameField = self->_familyNameField;
  self->_familyNameField = v14;

  [(UITextField *)self->_familyNameField setTranslatesAutoresizingMaskIntoConstraints:0];
  v16 = [(CNMutableContact *)self->_contact familyName];
  [(UITextField *)self->_familyNameField setText:v16];

  v17 = +[CNUIFontRepository catalystNameTextFieldsFont];
  [(UITextField *)self->_familyNameField setFont:v17];

  [(UITextField *)self->_familyNameField setAdjustsFontForContentSizeCategory:1];
  [(UITextField *)self->_familyNameField setAutocorrectionType:1];
  v18 = CNContactsUIBundle();
  v19 = [v18 localizedStringForKey:@"SHARING_FAMILY_NAME_PLACEHOLDER" value:&stru_1ED8AC728 table:@"Localized"];
  [(UITextField *)self->_familyNameField setPlaceholder:v19];

  [(UITextField *)self->_familyNameField addTarget:self action:sel_familyNameDidChange_ forControlEvents:0x20000];
  [(UITextField *)self->_familyNameField setBorderStyle:3];
  v20 = self->_familyNameField;

  [(UITextField *)v20 setDelegate:self];
}

- (void)createNameLabel
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1930]);
  double v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  nameLabel = self->_nameLabel;
  self->_nameLabel = v4;

  double v6 = +[CNUIFontRepository catalystLabelsFont];
  [(UILabel *)self->_nameLabel setFont:v6];

  LODWORD(v7) = 1144766464;
  [(UILabel *)self->_nameLabel setContentCompressionResistancePriority:0 forAxis:v7];
  [(UILabel *)self->_nameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v8 = [(CNSharingProfileOnboardingAudienceCatalystViewController *)self traitCollection];
  -[UILabel setTextAlignment:](self->_nameLabel, "setTextAlignment:", 2 * ([v8 layoutDirection] == 0));

  CNContactsUIBundle();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = [v10 localizedStringForKey:@"SHARING_NAME_LABEL" value:&stru_1ED8AC728 table:@"Localized"];
  [(UILabel *)self->_nameLabel setText:v9];
}

- (void)createAvatarView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1838]);
  double v4 = (UIImageView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  avatarImageView = self->_avatarImageView;
  self->_avatarImageView = v4;

  [(UIImageView *)self->_avatarImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v6 = objc_alloc(MEMORY[0x1E4FB1818]);
  double v7 = [(CNMutableContact *)self->_contact thumbnailImageData];
  id v9 = (id)[v6 initWithData:v7];

  [(UIImageView *)self->_avatarImageView setImage:v9];
  [(UIImageView *)self->_avatarImageView setClipsToBounds:1];
  v8 = [(UIImageView *)self->_avatarImageView layer];
  [v8 setCornerRadius:75.0];
}

- (void)viewDidLoad
{
  id v3 = [MEMORY[0x1E4F83AB0] linkButton];
  setupLaterButton = self->_setupLaterButton;
  self->_setupLaterButton = v3;

  double v5 = self->_setupLaterButton;
  id v6 = CNContactsUIBundle();
  double v7 = [v6 localizedStringForKey:@"SHARING_SET_UP_LATER" value:&stru_1ED8AC728 table:@"Localized"];
  [(OBLinkTrayButton *)v5 setTitle:v7 forState:0];

  [(OBLinkTrayButton *)self->_setupLaterButton addTarget:self action:sel_handleSetupLaterTapped_ forControlEvents:64];
  v8 = [(CNSharingProfileOnboardingAudienceCatalystViewController *)self buttonTray];
  [v8 addButton:self->_setupLaterButton];

  id v9 = objc_alloc_init(CNOnboardingBoldButtonProvider);
  id v10 = [(CNOnboardingBoldButtonProvider *)v9 boldAlternateButton];
  backButton = self->_backButton;
  self->_backButton = v10;

  id v12 = self->_backButton;
  id v13 = CNContactsUIBundle();
  v14 = [v13 localizedStringForKey:@"SHARING_BACK" value:&stru_1ED8AC728 table:@"Localized"];
  [(OBBoldTrayButton *)v12 setTitle:v14 forState:0];

  [(OBBoldTrayButton *)self->_backButton addTarget:self action:sel_handleBackTapped_ forControlEvents:64];
  v15 = [(CNSharingProfileOnboardingAudienceCatalystViewController *)self buttonTray];
  [v15 addButton:self->_backButton];

  v16 = [(CNOnboardingBoldButtonProvider *)v9 boldButton];
  confirmButton = self->_confirmButton;
  self->_confirmButton = v16;

  v18 = self->_confirmButton;
  v19 = [(CNSharingProfileOnboardingAudienceCatalystViewController *)self confirmButtonTitle];
  [(OBBoldTrayButton *)v18 setTitle:v19 forState:0];

  [(OBBoldTrayButton *)self->_confirmButton addTarget:self action:sel_handleConfirmButtonTapped_ forControlEvents:64];
  [(CNSharingProfileOnboardingAudienceCatalystViewController *)self updateConfirmButtonEnabledState];
  v20 = [(CNSharingProfileOnboardingAudienceCatalystViewController *)self buttonTray];
  [v20 addButton:self->_confirmButton];

  uint64_t v21 = [(CNMutableContact *)self->_contact givenName];
  if (v21
    && (v22 = (void *)v21,
        [(CNMutableContact *)self->_contact familyName],
        v23 = objc_claimAutoreleasedReturnValue(),
        v23,
        v22,
        v23))
  {
    id v24 = 0;
  }
  else
  {
    id v24 = objc_alloc_init(MEMORY[0x1E4F28F30]);
    v25 = [(CNMutableContact *)self->_contact givenName];
    [v24 setGivenName:v25];

    v26 = [(CNMutableContact *)self->_contact familyName];
    [v24 setFamilyName:v26];
  }
  self->_int64_t nameOrder = [MEMORY[0x1E4F28F38] _nameOrderWithOverridesForComponents:v24 options:0];
  [(CNSharingProfileOnboardingAudienceCatalystViewController *)self createAvatarView];
  [(CNSharingProfileOnboardingAudienceCatalystViewController *)self createNameLabel];
  [(CNSharingProfileOnboardingAudienceCatalystViewController *)self createNameTextFields];
  [(CNSharingProfileOnboardingAudienceCatalystViewController *)self createAudienceLabel];
  [(CNSharingProfileOnboardingAudienceCatalystViewController *)self createAudiencePickerButton];
  [(CNSharingProfileOnboardingAudienceCatalystViewController *)self updateMenuForAudiencePicker];
  [(CNSharingProfileOnboardingAudienceCatalystViewController *)self createAudienceDescriptionLabel];
  [(CNSharingProfileOnboardingAudienceCatalystViewController *)self createContentView];
  [(CNSharingProfileOnboardingAudienceCatalystViewController *)self layoutContentView];
  v27.receiver = self;
  v27.super_class = (Class)CNSharingProfileOnboardingAudienceCatalystViewController;
  [(OBWelcomeFullCenterContentController *)&v27 viewDidLoad];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CNSharingProfileOnboardingAudienceCatalystViewController;
  [(CNSharingProfileOnboardingAudienceCatalystViewController *)&v4 dealloc];
}

- (CNSharingProfileOnboardingAudienceCatalystViewController)initWithContact:(id)a3 selectedSharingAudience:(unint64_t)a4
{
  id v6 = a3;
  double v7 = [(id)objc_opt_class() headerText];
  v15.receiver = self;
  v15.super_class = (Class)CNSharingProfileOnboardingAudienceCatalystViewController;
  v8 = [(CNSharingProfileOnboardingAudienceCatalystViewController *)&v15 initWithTitle:v7 detailText:0 icon:0];

  if (v8)
  {
    id v9 = [[CNSharingProfileAudienceDataSource alloc] initWithSelectedSharingAudience:a4];
    sharingAudienceDataSource = v8->_sharingAudienceDataSource;
    v8->_sharingAudienceDataSource = v9;

    uint64_t v11 = [v6 mutableCopy];
    contact = v8->_contact;
    v8->_contact = (CNMutableContact *)v11;

    id v13 = v8;
  }

  return v8;
}

+ (id)headerText
{
  uint64_t v2 = CNContactsUIBundle();
  id v3 = [v2 localizedStringForKey:@"SHARING_SET_UP_NAME_AND_PHOTO_SHARING" value:&stru_1ED8AC728 table:@"Localized"];

  return v3;
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_1_41921 != -1) {
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_1_41921, &__block_literal_global_41922);
  }
  uint64_t v2 = (void *)descriptorForRequiredKeys_cn_once_object_1_41923;

  return v2;
}

void __85__CNSharingProfileOnboardingAudienceCatalystViewController_descriptorForRequiredKeys__block_invoke()
{
  v6[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F1ADE0];
  v6[0] = *MEMORY[0x1E4F1ADF0];
  v6[1] = v0;
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  uint64_t v2 = (void *)MEMORY[0x1E4F1B8F8];
  id v3 = [NSString stringWithUTF8String:"+[CNSharingProfileOnboardingAudienceCatalystViewController descriptorForRequiredKeys]_block_invoke"];
  uint64_t v4 = [v2 descriptorWithKeyDescriptors:v1 description:v3];

  double v5 = (void *)descriptorForRequiredKeys_cn_once_object_1_41923;
  descriptorForRequiredKeys_cn_once_object_1_41923 = v4;
}

@end