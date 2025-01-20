@interface CNMeCardSharingOnboardingViewController
+ (id)headerText;
- (CNContact)contact;
- (CNContactStore)contactStore;
- (NSLayoutConstraint)tableViewHeightConstraint;
- (OBBoldTrayButton)confirmButton;
- (id)confirmButtonTitle;
- (void)setConfirmButton:(id)a3;
- (void)setContact:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setTableViewHeightConstraint:(id)a3;
- (void)updateForContentSizeCategoryChange;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation CNMeCardSharingOnboardingViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);

  objc_storeStrong((id *)&self->_confirmButton, 0);
}

- (void)setTableViewHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)tableViewHeightConstraint
{
  return self->_tableViewHeightConstraint;
}

- (void)setContact:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContactStore:(id)a3
{
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setConfirmButton:(id)a3
{
}

- (OBBoldTrayButton)confirmButton
{
  return self->_confirmButton;
}

- (id)confirmButtonTitle
{
  v2 = CNContactsUIBundle();
  v3 = [v2 localizedStringForKey:@"SHARING_DONE" value:&stru_1ED8AC728 table:@"Localized"];

  return v3;
}

- (void)updateForContentSizeCategoryChange
{
  id v2 = [(CNMeCardSharingOnboardingViewController *)self view];
  [v2 setNeedsLayout];
}

- (void)viewDidLayoutSubviews
{
  v3 = [(OBTableWelcomeController *)self tableView];
  [v3 reloadData];

  v4 = [(CNMeCardSharingOnboardingViewController *)self view];
  [v4 layoutIfNeeded];

  v5 = [(OBTableWelcomeController *)self tableView];
  [v5 contentSize];
  double v7 = v6;
  v8 = [(CNMeCardSharingOnboardingViewController *)self tableViewHeightConstraint];
  [v8 setConstant:v7];

  v9.receiver = self;
  v9.super_class = (Class)CNMeCardSharingOnboardingViewController;
  [(OBTableWelcomeController *)&v9 viewDidLayoutSubviews];
}

- (void)viewDidLoad
{
  v21.receiver = self;
  v21.super_class = (Class)CNMeCardSharingOnboardingViewController;
  [(OBTableWelcomeController *)&v21 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x1E4FB1D00]);
  v4 = [(CNMeCardSharingOnboardingViewController *)self view];
  [v4 bounds];
  v5 = objc_msgSend(v3, "initWithFrame:style:", 1);
  [(OBTableWelcomeController *)self setTableView:v5];

  double v6 = [(OBTableWelcomeController *)self tableView];
  [v6 setShowsVerticalScrollIndicator:0];

  double v7 = [(OBTableWelcomeController *)self tableView];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  v8 = [(OBTableWelcomeController *)self tableView];
  [v8 setScrollEnabled:0];

  objc_super v9 = [MEMORY[0x1E4FB1618] clearColor];
  v10 = [(OBTableWelcomeController *)self tableView];
  [v10 setBackgroundColor:v9];

  v11 = [MEMORY[0x1E4F83A78] boldButton];
  confirmButton = self->_confirmButton;
  self->_confirmButton = v11;

  v13 = self->_confirmButton;
  v14 = [(CNMeCardSharingOnboardingViewController *)self confirmButtonTitle];
  [(OBBoldTrayButton *)v13 setTitle:v14 forState:0];

  [(OBBoldTrayButton *)self->_confirmButton addTarget:self action:sel_didTapDoneButton_ forControlEvents:64];
  v15 = [(CNMeCardSharingOnboardingViewController *)self buttonTray];
  [v15 addButton:self->_confirmButton];

  v16 = [(OBTableWelcomeController *)self tableView];
  v17 = [v16 heightAnchor];
  v18 = [v17 constraintEqualToConstant:400.0];
  [(CNMeCardSharingOnboardingViewController *)self setTableViewHeightConstraint:v18];

  v19 = [(OBTableWelcomeController *)self tableView];
  v20 = [(CNMeCardSharingOnboardingViewController *)self tableViewHeightConstraint];
  [v19 addConstraint:v20];
}

+ (id)headerText
{
  return &stru_1ED8AC728;
}

@end