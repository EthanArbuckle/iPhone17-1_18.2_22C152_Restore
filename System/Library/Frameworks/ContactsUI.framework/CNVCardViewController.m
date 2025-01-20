@interface CNVCardViewController
- (CNContactNavigationController)contactNavigationController;
- (CNVCardViewController)initWithVCardData:(id)a3;
- (CNVCardViewControllerDelegate)delegate;
- (NSArray)contacts;
- (id)contactNavigationController:(id)a3 contactViewControllerForContact:(id)a4 preferredMode:(int64_t)a5;
- (void)contactNavigationControllerDidCancel:(id)a3;
- (void)contactNavigationControllerDidComplete:(id)a3;
- (void)setContacts:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation CNVCardViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contacts, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setContacts:(id)a3
{
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void)setDelegate:(id)a3
{
}

- (CNVCardViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNVCardViewControllerDelegate *)WeakRetained;
}

- (CNContactNavigationController)contactNavigationController
{
  [(CNVCardViewController *)self view];

  v3 = [(CNVCardViewController *)self contacts];
  if ((unint64_t)[v3 count] < 2)
  {
    v6 = 0;
    goto LABEL_5;
  }
  v4 = [(CNVCardViewController *)self childViewControllers];
  uint64_t v5 = [v4 count];

  if (v5 == 1)
  {
    v3 = [(CNVCardViewController *)self childViewControllers];
    v6 = [v3 firstObject];
LABEL_5:

    goto LABEL_7;
  }
  v6 = 0;
LABEL_7:

  return (CNContactNavigationController *)v6;
}

- (void)contactNavigationControllerDidCancel:(id)a3
{
  v4 = [(CNVCardViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CNVCardViewController *)self delegate];
    [v6 vCardViewControllerDidComplete:self];
  }
}

- (void)contactNavigationControllerDidComplete:(id)a3
{
  v4 = [(CNVCardViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CNVCardViewController *)self delegate];
    [v6 vCardViewControllerDidComplete:self];
  }
}

- (id)contactNavigationController:(id)a3 contactViewControllerForContact:(id)a4 preferredMode:(int64_t)a5
{
  return +[CNContactViewController viewControllerForUnknownContact:a4];
}

- (void)viewDidLoad
{
  v32[2] = *MEMORY[0x1E4F143B8];
  v30.receiver = self;
  v30.super_class = (Class)CNVCardViewController;
  [(CNVCardViewController *)&v30 viewDidLoad];
  v3 = [(CNVCardViewController *)self contacts];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    id v9 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    double v10 = *MEMORY[0x1E4F1DB28];
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v7 = (CNContactNavigationController *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], v11, v12, v13);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v10, v11, v12, v13);
    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v14 setTextAlignment:1];
    v15 = objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredFontForTextStyle:", *MEMORY[0x1E4FB2908]);
    [v14 setFont:v15];

    v16 = +[CNUIColorRepository contactStyleDefaultDisabledTextColor];
    [v14 setTextColor:v16];

    v17 = CNContactsUIBundle();
    v18 = [v17 localizedStringForKey:@"NO_VCARDS_FOUND" value:&stru_1ED8AC728 table:@"Localized"];
    [v14 setText:v18];

    [v14 sizeToFit];
    [(CNContactNavigationController *)v7 addSubview:v14];
    v19 = (void *)MEMORY[0x1E4F28DC8];
    v20 = [MEMORY[0x1E4F28DC8] constraintWithItem:v14 attribute:9 relatedBy:0 toItem:v7 attribute:9 multiplier:1.0 constant:0.0];
    v32[0] = v20;
    v21 = [MEMORY[0x1E4F28DC8] constraintWithItem:v14 attribute:10 relatedBy:0 toItem:v7 attribute:10 multiplier:1.0 constant:0.0];
    v32[1] = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
    [v19 activateConstraints:v22];

    v23 = +[CNUIColorRepository contactStyleDefaultBackgroundColor];
    [(CNContactNavigationController *)v7 setBackgroundColor:v23];

    if (!v7) {
      return;
    }
    v24 = [(CNVCardViewController *)self view];
    [v24 bounds];
    -[CNContactNavigationController setFrame:](v7, "setFrame:");

    [(CNContactNavigationController *)v7 setAutoresizingMask:18];
    v25 = [(CNVCardViewController *)self view];
    [v25 addSubview:v7];

    goto LABEL_9;
  }
  if (v4 == 1)
  {
    char v5 = [(CNVCardViewController *)self contacts];
    id v6 = [v5 firstObject];
    v7 = +[CNContactViewController viewControllerForUnknownContact:v6];

    v8 = (CNContactCustomDataSource *)objc_alloc_init(MEMORY[0x1E4F1B980]);
    [(CNContactNavigationController *)v7 setContactStore:v8];
  }
  else
  {
    v26 = [CNContactCustomDataSource alloc];
    v27 = [(CNVCardViewController *)self contacts];
    v28 = +[CNContactViewController descriptorForRequiredKeys];
    v31 = v28;
    v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
    v8 = [(CNContactCustomDataSource *)v26 initWithContacts:v27 keysToFetch:v29];

    [(CNContactCustomDataSource *)v8 setAutoUpdateContacts:0];
    v7 = [[CNContactNavigationController alloc] initWithDataSource:v8];
    [(CNContactNavigationController *)v7 setAllowsCanceling:1];
    [(CNContactNavigationController *)v7 setDelegate:self];
  }

  if (v7)
  {
    [(UIViewController *)self cnui_addChildViewController:v7];
LABEL_9:
  }
}

- (CNVCardViewController)initWithVCardData:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CNVCardViewController;
  id v3 = a3;
  uint64_t v4 = [(CNVCardViewController *)&v13 initWithNibName:0 bundle:0];
  id v12 = 0;
  char v5 = [MEMORY[0x1E4F1B998] contactsWithData:v3 error:&v12];

  id v6 = v12;
  [(CNVCardViewController *)v4 setContacts:v5];

  if (v6) {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNVCardViewController.m", 36, 3, @"Error parsing vCard data: %@", v7, v8, v9, v10, (uint64_t)v6);
  }

  return v4;
}

@end