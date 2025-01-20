@interface CNSharingProfileOnboardingAudienceViewController
+ (id)descriptorForRequiredKeys;
+ (id)headerText;
- (BOOL)textFieldShouldReturn:(id)a3;
- (CNMutableContact)contact;
- (CNSharingProfileAudienceDataSource)sharingAudienceDataSource;
- (CNSharingProfileOnboardingAudienceControllerDelegate)delegate;
- (CNSharingProfileOnboardingAudienceViewController)initWithContact:(id)a3 selectedSharingAudience:(unint64_t)a4;
- (NSLayoutConstraint)tableViewHeightConstraint;
- (OBBoldTrayButton)confirmButton;
- (UITextField)familyNameField;
- (UITextField)givenNameField;
- (double)keyboardHeight;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)cellForNameInTableView:(id)a3;
- (id)confirmButtonTitle;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (id)traitCollectionChangeToken;
- (int64_t)nameOrder;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)dealloc;
- (void)familyNameDidChange:(id)a3;
- (void)givenNameDidChange:(id)a3;
- (void)handleConfirmButtonTapped:(id)a3;
- (void)setConfirmButton:(id)a3;
- (void)setContact:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFamilyNameField:(id)a3;
- (void)setGivenNameField:(id)a3;
- (void)setKeyboardHeight:(double)a3;
- (void)setNameOrder:(int64_t)a3;
- (void)setSharingAudienceDataSource:(id)a3;
- (void)setTableViewHeightConstraint:(id)a3;
- (void)setTraitCollectionChangeToken:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)textFieldDidEndEditing:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConfirmButtonEnabledState;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation CNSharingProfileOnboardingAudienceViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingAudienceDataSource, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong(&self->_traitCollectionChangeToken, 0);
  objc_storeStrong((id *)&self->_familyNameField, 0);
  objc_storeStrong((id *)&self->_givenNameField, 0);
  objc_storeStrong((id *)&self->_confirmButton, 0);
  objc_storeStrong((id *)&self->_tableViewHeightConstraint, 0);

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

- (void)setKeyboardHeight:(double)a3
{
  self->_keyboardHeight = a3;
}

- (double)keyboardHeight
{
  return self->_keyboardHeight;
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

- (void)setTraitCollectionChangeToken:(id)a3
{
}

- (id)traitCollectionChangeToken
{
  return self->_traitCollectionChangeToken;
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

- (void)setConfirmButton:(id)a3
{
}

- (OBBoldTrayButton)confirmButton
{
  return self->_confirmButton;
}

- (void)setTableViewHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)tableViewHeightConstraint
{
  return self->_tableViewHeightConstraint;
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
      v7 = &OBJC_IVAR___CNSharingProfileOnboardingAudienceViewController__givenNameField;
    }
    else {
      v7 = &OBJC_IVAR___CNSharingProfileOnboardingAudienceViewController__familyNameField;
    }
    [*(id *)((char *)&self->super.super.super.super.super.super.isa + *v7) becomeFirstResponder];
  }
  else
  {
    [(UITextField *)v4 resignFirstResponder];
  }

  return 0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  unint64_t v7 = [(CNSharingProfileAudienceDataSource *)self->_sharingAudienceDataSource selectedIndex];
  -[CNSharingProfileAudienceDataSource didSelectItemAtIndex:](self->_sharingAudienceDataSource, "didSelectItemAtIndex:", [v6 row]);
  v8 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", v7, objc_msgSend(v6, "section"));
  LOBYTE(v7) = [v8 isEqual:v6];
  [v10 deselectRowAtIndexPath:v6 animated:0];
  if ((v7 & 1) == 0)
  {
    v9 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", objc_msgSend(v6, "section"));
    [v10 reloadSections:v9 withRowAnimation:0];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v6 section])
  {
    v8 = [v7 dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:v6];

    -[CNSharingProfileAudienceDataSource itemForIndex:](self->_sharingAudienceDataSource, "itemForIndex:", [v6 row]);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    v9 = [v7 label];
    id v10 = [v8 textLabel];
    [v10 setText:v9];

    [v8 setSelectionStyle:0];
    v11 = [v7 accessoryView];

    if (v11)
    {
      v12 = [v7 accessoryView];
      [v8 setAccessoryView:v12];
    }
    else
    {
      [v8 setAccessoryView:0];
    }
    if ([v7 isSelected]) {
      uint64_t v13 = 3;
    }
    else {
      uint64_t v13 = 0;
    }
    [v8 setAccessoryType:v13];
  }
  else
  {
    v8 = [(CNSharingProfileOnboardingAudienceViewController *)self cellForNameInTableView:v7];
  }

  return v8;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [(CNSharingProfileAudienceDataSource *)self->_sharingAudienceDataSource selectedIndex];
  if (v6 == [v5 row]) {
    id v7 = 0;
  }
  else {
    id v7 = v5;
  }

  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([v5 section] || objc_msgSend(v5, "row"))
  {
    double v6 = *MEMORY[0x1E4FB2F28];
  }
  else
  {
    v8 = [(UITextField *)self->_givenNameField font];
    [v8 lineHeight];
    double v6 = v9 * 2.0 + 20.0;

    +[CNSharingProfileOnboardingNameCell desiredMinimumCellHeight];
    if (v6 < v10) {
      double v6 = v10;
    }
  }

  return v6;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if (a4 < 1)
  {
    double v6 = 0;
  }
  else
  {
    double v6 = [(CNSharingProfileAudienceDataSource *)self->_sharingAudienceDataSource sectionFooterLabel];
  }
  return v6;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4 < 1)
  {
    double v6 = 0;
  }
  else
  {
    double v6 = [(CNSharingProfileAudienceDataSource *)self->_sharingAudienceDataSource sectionHeaderLabel];
  }
  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4) {
    return [(CNSharingProfileAudienceDataSource *)self->_sharingAudienceDataSource numberOfItems];
  }
  else {
    return 1;
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (id)cellForNameInTableView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[CNSharingProfileOnboardingNameCell cellIdentifier];
  double v6 = [v4 dequeueReusableCellWithIdentifier:v5];

  [v6 setGivenNameField:self->_givenNameField familyNameField:self->_familyNameField];
  id v7 = [(CNMutableContact *)self->_contact givenName];
  [v6 setGivenName:v7];

  v8 = [(CNMutableContact *)self->_contact familyName];
  [v6 setFamilyName:v8];

  [v6 setNameOrder:self->_nameOrder];
  id v9 = objc_alloc(MEMORY[0x1E4FB1818]);
  double v10 = [(CNMutableContact *)self->_contact thumbnailImageData];
  v11 = (void *)[v9 initWithData:v10];

  [v6 setAvatarImage:v11];

  return v6;
}

- (void)handleConfirmButtonTapped:(id)a3
{
  id v4 = [(CNSharingProfileOnboardingAudienceViewController *)self delegate];
  objc_msgSend(v4, "audienceController:didFinishWithContact:sharingAudience:", self, self->_contact, -[CNSharingProfileAudienceDataSource selectedSharingAudience](self->_sharingAudienceDataSource, "selectedSharingAudience"));
}

- (id)confirmButtonTitle
{
  v2 = CNContactsUIBundle();
  v3 = [v2 localizedStringForKey:@"SHARING_DONE" value:&stru_1ED8AC728 table:@"Localized"];

  return v3;
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  id v4 = [(OBTableWelcomeController *)self tableView];
  [v4 reloadData];

  id v5 = [(CNSharingProfileOnboardingAudienceViewController *)self view];
  [v5 setNeedsLayout];
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CNSharingProfileOnboardingAudienceViewController;
  [(CNSharingProfileOnboardingAudienceViewController *)&v6 traitCollectionDidChange:a3];
  id v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  [(CNSharingProfileOnboardingAudienceViewController *)self setShouldAdjustButtonTrayForKeyboard:(v5 & 0xFFFFFFFFFFFFFFFBLL) != 1];
}

- (void)updateConfirmButtonEnabledState
{
  uint64_t v3 = *MEMORY[0x1E4F5A298];
  id v4 = [(CNMutableContact *)self->_contact givenName];
  if ((*(unsigned int (**)(uint64_t, void *))(v3 + 16))(v3, v4))
  {
    uint64_t v5 = [(CNMutableContact *)self->_contact familyName];
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

  [(CNSharingProfileOnboardingAudienceViewController *)self updateConfirmButtonEnabledState];
}

- (void)givenNameDidChange:(id)a3
{
  id v4 = [a3 text];
  [(CNMutableContact *)self->_contact setGivenName:v4];

  [(CNSharingProfileOnboardingAudienceViewController *)self updateConfirmButtonEnabledState];
}

- (void)viewDidLayoutSubviews
{
  uint64_t v3 = [(OBTableWelcomeController *)self tableView];
  id v4 = [v3 window];

  if (v4)
  {
    uint64_t v5 = [(CNSharingProfileOnboardingAudienceViewController *)self view];
    [v5 layoutIfNeeded];

    uint64_t v6 = [(OBTableWelcomeController *)self tableView];
    [v6 contentSize];
    double v8 = v7;
    id v9 = [(CNSharingProfileOnboardingAudienceViewController *)self tableViewHeightConstraint];
    [v9 setConstant:v8];
  }
  v10.receiver = self;
  v10.super_class = (Class)CNSharingProfileOnboardingAudienceViewController;
  [(OBTableWelcomeController *)&v10 viewDidLayoutSubviews];
}

- (void)viewDidLoad
{
  v62.receiver = self;
  v62.super_class = (Class)CNSharingProfileOnboardingAudienceViewController;
  [(OBTableWelcomeController *)&v62 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x1E4FB1D00]);
  id v4 = [(CNSharingProfileOnboardingAudienceViewController *)self view];
  [v4 bounds];
  uint64_t v5 = objc_msgSend(v3, "initWithFrame:style:", 1);
  [(OBTableWelcomeController *)self setTableView:v5];

  uint64_t v6 = [(OBTableWelcomeController *)self tableView];
  [v6 setShowsVerticalScrollIndicator:0];

  double v7 = [(OBTableWelcomeController *)self tableView];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v8 = [(OBTableWelcomeController *)self tableView];
  [v8 setScrollEnabled:0];

  id v9 = [MEMORY[0x1E4FB1618] clearColor];
  objc_super v10 = [(OBTableWelcomeController *)self tableView];
  [v10 setBackgroundColor:v9];

  v11 = [(OBTableWelcomeController *)self tableView];
  [v11 setKeyboardDismissMode:2];

  v12 = [(OBTableWelcomeController *)self tableView];
  [v12 registerClass:objc_opt_class() forCellReuseIdentifier:@"Cell"];

  uint64_t v13 = [(OBTableWelcomeController *)self tableView];
  uint64_t v14 = objc_opt_class();
  v15 = +[CNSharingProfileOnboardingNameCell cellIdentifier];
  [v13 registerClass:v14 forCellReuseIdentifier:v15];

  v16 = [(OBTableWelcomeController *)self tableView];
  [v16 setDelegate:self];

  v17 = [(OBTableWelcomeController *)self tableView];
  [v17 setDataSource:self];

  v18 = [MEMORY[0x1E4F83A78] boldButton];
  confirmButton = self->_confirmButton;
  self->_confirmButton = v18;

  v20 = self->_confirmButton;
  v21 = [(CNSharingProfileOnboardingAudienceViewController *)self confirmButtonTitle];
  [(OBBoldTrayButton *)v20 setTitle:v21 forState:0];

  [(OBBoldTrayButton *)self->_confirmButton addTarget:self action:sel_handleConfirmButtonTapped_ forControlEvents:64];
  [(CNSharingProfileOnboardingAudienceViewController *)self updateConfirmButtonEnabledState];
  v22 = [(CNSharingProfileOnboardingAudienceViewController *)self buttonTray];
  [v22 addButton:self->_confirmButton];

  [(CNSharingProfileOnboardingAudienceViewController *)self setShouldAdjustScrollViewInsetForKeyboard:1];
  v23 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v24 = [v23 userInterfaceIdiom];

  [(CNSharingProfileOnboardingAudienceViewController *)self setShouldAdjustButtonTrayForKeyboard:(v24 & 0xFFFFFFFFFFFFFFFBLL) != 1];
  v25 = [(OBTableWelcomeController *)self tableView];
  v26 = [v25 heightAnchor];
  v27 = [v26 constraintEqualToConstant:400.0];
  [(CNSharingProfileOnboardingAudienceViewController *)self setTableViewHeightConstraint:v27];

  v28 = [(OBTableWelcomeController *)self tableView];
  v29 = [(CNSharingProfileOnboardingAudienceViewController *)self tableViewHeightConstraint];
  [v28 addConstraint:v29];

  id v30 = objc_alloc(MEMORY[0x1E4FB1D70]);
  double v31 = *MEMORY[0x1E4F1DB28];
  double v32 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v33 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v34 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v35 = (UITextField *)objc_msgSend(v30, "initWithFrame:", *MEMORY[0x1E4F1DB28], v32, v33, v34);
  givenNameField = self->_givenNameField;
  self->_givenNameField = v35;

  v37 = [(CNMutableContact *)self->_contact givenName];
  [(UITextField *)self->_givenNameField setText:v37];

  uint64_t v38 = *MEMORY[0x1E4FB28C8];
  v39 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [(UITextField *)self->_givenNameField setFont:v39];

  [(UITextField *)self->_givenNameField setAdjustsFontForContentSizeCategory:1];
  [(UITextField *)self->_givenNameField setAutocorrectionType:1];
  v40 = CNContactsUIBundle();
  v41 = [v40 localizedStringForKey:@"SHARING_GIVEN_NAME_PLACEHOLDER" value:&stru_1ED8AC728 table:@"Localized"];
  [(UITextField *)self->_givenNameField setPlaceholder:v41];

  [(UITextField *)self->_givenNameField addTarget:self action:sel_givenNameDidChange_ forControlEvents:0x20000];
  [(UITextField *)self->_givenNameField setDelegate:self];
  v42 = (UITextField *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1D70]), "initWithFrame:", v31, v32, v33, v34);
  familyNameField = self->_familyNameField;
  self->_familyNameField = v42;

  v44 = [(CNMutableContact *)self->_contact familyName];
  [(UITextField *)self->_familyNameField setText:v44];

  v45 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v38];
  [(UITextField *)self->_familyNameField setFont:v45];

  [(UITextField *)self->_familyNameField setAdjustsFontForContentSizeCategory:1];
  [(UITextField *)self->_familyNameField setAutocorrectionType:1];
  v46 = CNContactsUIBundle();
  v47 = [v46 localizedStringForKey:@"SHARING_FAMILY_NAME_PLACEHOLDER" value:&stru_1ED8AC728 table:@"Localized"];
  [(UITextField *)self->_familyNameField setPlaceholder:v47];

  [(UITextField *)self->_familyNameField addTarget:self action:sel_familyNameDidChange_ forControlEvents:0x20000];
  [(UITextField *)self->_familyNameField setDelegate:self];
  id v48 = objc_alloc_init(MEMORY[0x1E4F28F30]);
  uint64_t v49 = [(CNMutableContact *)self->_contact givenName];
  if (!v49
    || (v50 = (void *)v49,
        [(CNMutableContact *)self->_contact familyName],
        v51 = objc_claimAutoreleasedReturnValue(),
        v51,
        v50,
        !v51))
  {
    id v52 = objc_alloc_init(MEMORY[0x1E4F28F30]);

    v53 = [(CNMutableContact *)self->_contact givenName];
    [v52 setGivenName:v53];

    v54 = [(CNMutableContact *)self->_contact familyName];
    [v52 setFamilyName:v54];

    id v48 = v52;
  }
  self->_int64_t nameOrder = [MEMORY[0x1E4F28F38] _nameOrderWithOverridesForComponents:v48 options:0];
  objc_initWeak(&location, self);
  v55 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v56 = *MEMORY[0x1E4FB27A8];
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __63__CNSharingProfileOnboardingAudienceViewController_viewDidLoad__block_invoke;
  v59[3] = &unk_1E5499378;
  objc_copyWeak(&v60, &location);
  v57 = [v55 addObserverForName:v56 object:0 queue:0 usingBlock:v59];
  id traitCollectionChangeToken = self->_traitCollectionChangeToken;
  self->_id traitCollectionChangeToken = v57;

  objc_destroyWeak(&v60);
  objc_destroyWeak(&location);
}

void __63__CNSharingProfileOnboardingAudienceViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained contentSizeCategoryDidChange:v3];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CNSharingProfileOnboardingAudienceViewController;
  [(CNSharingProfileOnboardingAudienceViewController *)&v4 dealloc];
}

- (CNSharingProfileOnboardingAudienceViewController)initWithContact:(id)a3 selectedSharingAudience:(unint64_t)a4
{
  id v6 = a3;
  double v7 = [(id)objc_opt_class() headerText];
  v15.receiver = self;
  v15.super_class = (Class)CNSharingProfileOnboardingAudienceViewController;
  double v8 = [(OBTableWelcomeController *)&v15 initWithTitle:v7 detailText:0 icon:0 adoptTableViewScrollView:0];

  if (v8)
  {
    id v9 = [[CNSharingProfileAudienceDataSource alloc] initWithSelectedSharingAudience:a4];
    sharingAudienceDataSource = v8->_sharingAudienceDataSource;
    v8->_sharingAudienceDataSource = v9;

    uint64_t v11 = [v6 mutableCopy];
    contact = v8->_contact;
    v8->_contact = (CNMutableContact *)v11;

    uint64_t v13 = v8;
  }

  return v8;
}

+ (id)headerText
{
  v2 = CNContactsUIBundle();
  id v3 = [v2 localizedStringForKey:@"SHARING_SET_UP_NAME_AND_PHOTO_SHARING" value:&stru_1ED8AC728 table:@"Localized"];

  return v3;
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_1_35193 != -1) {
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_1_35193, &__block_literal_global_35194);
  }
  v2 = (void *)descriptorForRequiredKeys_cn_once_object_1_35195;

  return v2;
}

void __77__CNSharingProfileOnboardingAudienceViewController_descriptorForRequiredKeys__block_invoke()
{
  v6[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F1ADE0];
  v6[0] = *MEMORY[0x1E4F1ADF0];
  v6[1] = v0;
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  v2 = (void *)MEMORY[0x1E4F1B8F8];
  id v3 = [NSString stringWithUTF8String:"+[CNSharingProfileOnboardingAudienceViewController descriptorForRequiredKeys]_block_invoke"];
  uint64_t v4 = [v2 descriptorWithKeyDescriptors:v1 description:v3];

  uint64_t v5 = (void *)descriptorForRequiredKeys_cn_once_object_1_35195;
  descriptorForRequiredKeys_cn_once_object_1_35195 = v4;
}

@end