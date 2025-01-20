@interface CNMeCardSharingOnboardingAudienceViewController
+ (id)headerText;
- (CNMeCardSharingAudienceDataSource)sharingAudienceDataSource;
- (CNMeCardSharingOnboardingAudienceViewController)initWithSelectedSharingAudience:(unint64_t)a3;
- (CNMeCardSharingOnboardingAudienceViewControllerDelegate)delegate;
- (CNMeCardSharingOnboardingHeaderViewController)headerViewController;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)dealloc;
- (void)handleConfirmButtonTapped;
- (void)setDelegate:(id)a3;
- (void)setHeaderViewController:(id)a3;
- (void)setSharingAudienceDataSource:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation CNMeCardSharingOnboardingAudienceViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerViewController, 0);
  objc_storeStrong((id *)&self->_sharingAudienceDataSource, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setHeaderViewController:(id)a3
{
}

- (CNMeCardSharingOnboardingHeaderViewController)headerViewController
{
  return self->_headerViewController;
}

- (void)setSharingAudienceDataSource:(id)a3
{
}

- (CNMeCardSharingAudienceDataSource)sharingAudienceDataSource
{
  return self->_sharingAudienceDataSource;
}

- (void)setDelegate:(id)a3
{
}

- (CNMeCardSharingOnboardingAudienceViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNMeCardSharingOnboardingAudienceViewControllerDelegate *)WeakRetained;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  unint64_t v7 = [(CNMeCardSharingAudienceDataSource *)self->_sharingAudienceDataSource selectedIndex];
  -[CNMeCardSharingAudienceDataSource didSelectItemAtIndex:](self->_sharingAudienceDataSource, "didSelectItemAtIndex:", [v6 row]);
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
  unint64_t v7 = [a3 dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:v6];
  sharingAudienceDataSource = self->_sharingAudienceDataSource;
  uint64_t v9 = [v6 row];

  id v10 = [(CNMeCardSharingAudienceDataSource *)sharingAudienceDataSource itemForIndex:v9];
  v11 = [v10 label];
  v12 = [v7 textLabel];
  [v12 setText:v11];

  [v7 setSelectionStyle:0];
  v13 = [v10 accessoryView];

  if (v13)
  {
    v14 = [v10 accessoryView];
    [v7 setAccessoryView:v14];
  }
  else
  {
    [v7 setAccessoryView:0];
  }
  if ([v10 isSelected]) {
    uint64_t v15 = 3;
  }
  else {
    uint64_t v15 = 0;
  }
  [v7 setAccessoryType:v15];

  return v7;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [(CNMeCardSharingAudienceDataSource *)self->_sharingAudienceDataSource selectedIndex];
  if (v6 == [v5 row]) {
    id v7 = 0;
  }
  else {
    id v7 = v5;
  }

  return v7;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return [(CNMeCardSharingAudienceDataSource *)self->_sharingAudienceDataSource sectionFooterLabel];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return [(CNMeCardSharingAudienceDataSource *)self->_sharingAudienceDataSource sectionHeaderLabel];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(CNMeCardSharingAudienceDataSource *)self->_sharingAudienceDataSource numberOfItems];
}

- (void)handleConfirmButtonTapped
{
  id v3 = [(CNMeCardSharingOnboardingAudienceViewController *)self delegate];
  objc_msgSend(v3, "meCardSharingOnboardingAudienceViewControllerDidFinish:withSharingAudience:", self, -[CNMeCardSharingAudienceDataSource selectedSharingAudience](self->_sharingAudienceDataSource, "selectedSharingAudience"));
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)CNMeCardSharingOnboardingAudienceViewController;
  [(CNMeCardSharingOnboardingViewController *)&v7 viewDidLoad];
  id v3 = [(OBTableWelcomeController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"Cell"];

  v4 = [(OBTableWelcomeController *)self tableView];
  [v4 setDelegate:self];

  id v5 = [(OBTableWelcomeController *)self tableView];
  [v5 setDataSource:self];

  unint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 addObserver:self selector:sel_contentSizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CNMeCardSharingOnboardingAudienceViewController;
  [(CNMeCardSharingOnboardingAudienceViewController *)&v4 dealloc];
}

- (CNMeCardSharingOnboardingAudienceViewController)initWithSelectedSharingAudience:(unint64_t)a3
{
  id v5 = [(id)objc_opt_class() headerText];
  v11.receiver = self;
  v11.super_class = (Class)CNMeCardSharingOnboardingAudienceViewController;
  unint64_t v6 = [(OBTableWelcomeController *)&v11 initWithTitle:v5 detailText:0 icon:0 adoptTableViewScrollView:0];

  if (v6)
  {
    objc_super v7 = [[CNMeCardSharingAudienceDataSource alloc] initWithSelectedSharingAudience:a3];
    sharingAudienceDataSource = v6->_sharingAudienceDataSource;
    v6->_sharingAudienceDataSource = v7;

    uint64_t v9 = v6;
  }

  return v6;
}

+ (id)headerText
{
  v2 = CNContactsUIBundle();
  id v3 = [v2 localizedStringForKey:@"SHARING_ONBOARDING_CHOOSE_SHARING_AUDIENCE" value:&stru_1ED8AC728 table:@"Localized"];

  return v3;
}

@end