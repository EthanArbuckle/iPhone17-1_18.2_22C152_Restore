@interface BYODChooseYouOrFamilyViewController
+ (id)log;
- (BYODChooseYouOrFamilyViewController)initWithACAccount:(id)a3 domainPurchase:(BOOL)a4 domainName:(id)a5;
- (id)_createOnlyForYouView;
- (id)_createYouAndFamilyView;
- (void)_addDataCardsView:(id)a3;
- (void)_createOnlyForYouWasTapped:(id)a3;
- (void)_forYouAndOthersWasTapped:(id)a3;
- (void)_showAlertWithTitle:(id)a3 message:(id)a4;
- (void)_showErrorAlert;
- (void)_updateDomainShareStatus:(BOOL)a3;
- (void)didTapCancelButton:(id)a3;
- (void)viewDidLoad;
@end

@implementation BYODChooseYouOrFamilyViewController

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2C8EC;
  block[3] = &unk_B8D50;
  block[4] = a1;
  if (qword_D73A8 != -1) {
    dispatch_once(&qword_D73A8, block);
  }
  v2 = (void *)qword_D73A0;

  return v2;
}

- (BYODChooseYouOrFamilyViewController)initWithACAccount:(id)a3 domainPurchase:(BOOL)a4 domainName:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)BYODChooseYouOrFamilyViewController;
  v10 = [(BYODBaseViewController *)&v13 initWithACAccount:a3];
  v11 = v10;
  if (v10)
  {
    v10->_domainPurchase = a4;
    objc_storeStrong((id *)&v10->_domainName, a5);
  }

  return v11;
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)BYODChooseYouOrFamilyViewController;
  [(BYODBaseViewController *)&v14 viewDidLoad];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"BYOD_SHARE_DOMAIN_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];

  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"BYOD_SHARE_DOMAIN_BODY" value:&stru_B9F70 table:@"AccountPreferences"];

  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = +[UIImage imageNamed:@"CustomDomainIcon.png" inBundle:v7];

  [(BYODBaseViewController *)self createViewControllerWithTitle:v4 detail:v6 icon:v8];
  if (!self->_domainPurchase)
  {
    id v9 = objc_alloc((Class)UIBarButtonItem);
    v10 = +[NSBundle bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"BYOD_SHARE_DOMAIN_CANCEL_BUTTON_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
    id v12 = [v9 initWithTitle:v11 style:2 target:self action:"didTapCancelButton:"];
    objc_super v13 = [(BYODChooseYouOrFamilyViewController *)self navigationItem];
    [v13 setRightBarButtonItem:v12];
  }
}

- (void)_addDataCardsView:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc((Class)UIStackView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 setAxis:1];
  [v5 setSpacing:10.0];
  v6 = [(BYODChooseYouOrFamilyViewController *)self _createOnlyForYouView];
  [v5 addArrangedSubview:v6];

  v7 = [(BYODChooseYouOrFamilyViewController *)self _createYouAndFamilyView];
  [v5 addArrangedSubview:v7];

  v8 = [v4 contentView];
  [v8 addSubview:v5];

  v24 = [v4 contentView];
  v23 = [v4 contentView];
  v26 = [v23 topAnchor];
  v22 = [v5 topAnchor];
  v21 = objc_msgSend(v26, "constraintEqualToAnchor:");
  v27[0] = v21;
  v20 = [v4 contentView];
  v25 = [v20 leadingAnchor];
  v19 = [v5 leadingAnchor];
  v18 = objc_msgSend(v25, "constraintEqualToAnchor:");
  v27[1] = v18;
  v17 = [v4 contentView];
  id v9 = [v17 trailingAnchor];
  v10 = [v5 trailingAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v27[2] = v11;
  id v12 = [v4 contentView];
  objc_super v13 = [v12 bottomAnchor];
  objc_super v14 = [v5 bottomAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  v27[3] = v15;
  v16 = +[NSArray arrayWithObjects:v27 count:4];
  [v24 addConstraints:v16];
}

- (id)_createOnlyForYouView
{
  v3 = +[UIImage systemImageNamed:@"person.fill"];
  id v4 = [BYODDataCardView alloc];
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"BYOD_SHARE_DOMAIN_ONLY_YOU" value:&stru_B9F70 table:@"AccountPreferences"];
  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"BYOD_SHARE_DOMAIN_ONLY_YOU_SUBTEXT" value:&stru_B9F70 table:@"AccountPreferences"];
  id v9 = [(BYODDataCardView *)v4 initWithTitle:v6 subtitle:v8 icon:v3];

  [(BYODStackView *)v9 addTarget:self action:"_createOnlyForYouWasTapped:" forControlEvents:1];

  return v9;
}

- (id)_createYouAndFamilyView
{
  v3 = +[UIImage systemImageNamed:@"person.3.fill"];
  id v4 = [BYODDataCardView alloc];
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"BYOD_SHARE_DOMAIN_YOU_AND_OTHERS" value:&stru_B9F70 table:@"AccountPreferences"];
  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"BYOD_SHARE_DOMAIN_YOU_AND_OTHERS_SUBTEXT" value:&stru_B9F70 table:@"AccountPreferences"];
  id v9 = [(BYODDataCardView *)v4 initWithTitle:v6 subtitle:v8 icon:v3];

  [(BYODStackView *)v9 addTarget:self action:"_forYouAndOthersWasTapped:" forControlEvents:1];

  return v9;
}

- (void)didTapCancelButton:(id)a3
{
}

- (void)_createOnlyForYouWasTapped:(id)a3
{
  id v11 = a3;
  if (self->_domainPurchase)
  {
    spinner = self->_spinner;
    if (!spinner)
    {
      id v5 = [[BYODSpinner alloc] initWithViewController:self];
      v6 = self->_spinner;
      self->_spinner = v5;

      spinner = self->_spinner;
    }
    [(BYODSpinner *)spinner startSpinner];
    [(BYODChooseYouOrFamilyViewController *)self _updateDomainShareStatus:0];
  }
  else
  {
    v7 = [BYODChooseEmailAddressViewController alloc];
    v8 = [(BYODBaseViewController *)self userAccount];
    id v9 = [(BYODChooseEmailAddressViewController *)v7 initWithACAccount:v8 familyFlow:0];

    v10 = [(BYODChooseYouOrFamilyViewController *)self navigationController];
    [v10 pushViewController:v9 animated:1];
  }
}

- (void)_forYouAndOthersWasTapped:(id)a3
{
  id v4 = a3;
  spinner = self->_spinner;
  if (!spinner)
  {
    v6 = [[BYODSpinner alloc] initWithViewController:self];
    v7 = self->_spinner;
    self->_spinner = v6;

    spinner = self->_spinner;
  }
  [(BYODSpinner *)spinner startSpinner];
  if (self->_domainPurchase)
  {
    [(BYODChooseYouOrFamilyViewController *)self _updateDomainShareStatus:1];
  }
  else
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_2D748;
    v16[3] = &unk_B8E88;
    v16[4] = self;
    v8 = +[EFScheduler mainThreadScheduler];
    [v8 performBlock:v16];

    id v9 = [BYODChooseEmailAddressViewController alloc];
    v10 = [(BYODBaseViewController *)self userAccount];
    id v11 = [(BYODChooseEmailAddressViewController *)v9 initWithACAccount:v10 familyFlow:1];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_2D75C;
    v14[3] = &unk_B9010;
    v14[4] = self;
    id v12 = v11;
    v15 = v12;
    objc_super v13 = +[EFScheduler mainThreadScheduler];
    [v13 performBlock:v14];
  }
}

- (void)_showAlertWithTitle:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 length];
  if (v8) {
    id v9 = v6;
  }
  else {
    id v9 = 0;
  }
  if (v8) {
    id v10 = v7;
  }
  else {
    id v10 = v6;
  }
  id v11 = +[UIAlertController alertControllerWithTitle:v9 message:v10 preferredStyle:1];
  id v12 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v13 = [v12 localizedStringForKey:@"OK" value:&stru_B9F70 table:@"AccountPreferences"];
  objc_super v14 = +[UIAlertAction actionWithTitle:v13 style:1 handler:0];

  [v11 addAction:v14];
  v18 = self;
  id v15 = v11;
  id v19 = v15;
  v16 = +[EFScheduler mainThreadScheduler];
  [v16 performBlock:&v17];
}

- (void)_updateDomainShareStatus:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [BYODUpdateDomainShareStatusRequest alloc];
  id v6 = [(BYODBaseViewController *)self userAccount];
  id v7 = [(BYODBaseViewController *)self userAccount];
  id v8 = [v7 accountStore];
  id v9 = [(BYODUpdateDomainShareStatusRequest *)v5 initWithAccount:v6 accountStore:v8 domain:self->_domainName domainShared:v3];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_2DB40;
  v10[3] = &unk_B9178;
  objc_copyWeak(&v11, &location);
  [(BYODUpdateDomainShareStatusRequest *)v9 performRequestWithCallback:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_showErrorAlert
{
  BOOL v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"BYOD_GENERIC_ERROR_MESSAGE" value:&stru_B9F70 table:@"AccountPreferences"];
  id v5 = +[UIAlertController alertControllerWithTitle:0 message:v4 preferredStyle:1];

  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"OK" value:&stru_B9F70 table:@"AccountPreferences"];
  id v8 = +[UIAlertAction actionWithTitle:v7 style:1 handler:0];

  [v5 addAction:v8];
  id v12 = self;
  id v9 = v5;
  id v13 = v9;
  id v10 = +[EFScheduler mainThreadScheduler];
  [v10 performBlock:&v11];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainName, 0);

  objc_storeStrong((id *)&self->_spinner, 0);
}

@end