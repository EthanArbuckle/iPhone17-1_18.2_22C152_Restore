@interface BYODChooseEmailAddressViewController
- (BYODChooseEmailAddressViewController)initWithACAccount:(id)a3 familyFlow:(BOOL)a4;
- (id)_createDoNotHaveAddress;
- (id)_createHaveExistingAddress;
- (id)colourForCard;
- (void)_addDataCardsView:(id)a3;
- (void)_doNotHaveExistingAddressWasTapped:(id)a3;
- (void)_haveExistingAddressWasTapped:(id)a3;
- (void)backWasTapped:(id)a3;
- (void)viewDidLoad;
@end

@implementation BYODChooseEmailAddressViewController

- (BYODChooseEmailAddressViewController)initWithACAccount:(id)a3 familyFlow:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)BYODChooseEmailAddressViewController;
  result = [(BYODBaseViewController *)&v6 initWithACAccount:a3];
  if (result) {
    _familyFlow = a4;
  }
  return result;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)BYODChooseEmailAddressViewController;
  [(BYODBaseViewController *)&v10 viewDidLoad];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"BYOD_EMAIL_ADDRESSES_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];

  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v6 = [v5 localizedStringForKey:@"BYOD_EMAIL_ADDRESSES_BODY" value:&stru_B9F70 table:@"AccountPreferences"];

  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = +[UIImage imageNamed:@"CustomDomainIcon.png" inBundle:v7];

  [(BYODBaseViewController *)self createViewControllerWithTitle:v4 detail:v6 icon:v8];
  v9 = [(BYODChooseEmailAddressViewController *)self navigationItem];
  [v9 setHidesBackButton:0];
}

- (void)_addDataCardsView:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc((Class)UIStackView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 setAxis:1];
  [v5 setSpacing:10.0];
  objc_super v6 = [(BYODChooseEmailAddressViewController *)self _createHaveExistingAddress];
  [v5 addArrangedSubview:v6];

  v7 = [(BYODChooseEmailAddressViewController *)self _createDoNotHaveAddress];
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
  v9 = [v17 trailingAnchor];
  objc_super v10 = [v5 trailingAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v27[2] = v11;
  v12 = [v4 contentView];
  v13 = [v12 bottomAnchor];
  v14 = [v5 bottomAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  v27[3] = v15;
  v16 = +[NSArray arrayWithObjects:v27 count:4];
  [v24 addConstraints:v16];
}

- (id)_createHaveExistingAddress
{
  v3 = +[UIImage systemImageNamed:@"envelope.fill"];
  id v4 = [BYODDataCardView alloc];
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v6 = [v5 localizedStringForKey:@"BYOD_HAVE_EXISTING_ADDRESS" value:&stru_B9F70 table:@"AccountPreferences"];
  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"BYOD_HAVE_EXISTING_ADDRESS_BODY" value:&stru_B9F70 table:@"AccountPreferences"];
  v9 = [(BYODDataCardView *)v4 initWithTitle:v6 subtitle:v8 icon:v3];

  [(BYODStackView *)v9 addTarget:self action:"_haveExistingAddressWasTapped:" forControlEvents:1];

  return v9;
}

- (id)_createDoNotHaveAddress
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = +[UIImage imageNamed:@"CustomDomainIconMinus.png" inBundle:v3];

  if (_familyFlow)
  {
    id v5 = [BYODDataCardView alloc];
    objc_super v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"BYOD_DO_NOT_HAVE_ANY_ADDRESS" value:&stru_B9F70 table:@"AccountPreferences"];
    v8 = +[NSBundle bundleForClass:objc_opt_class()];
    [v8 localizedStringForKey:@"BYOD_DO_NOT_HAVE_ANY_ADDRESS_BODY_FAMILY" value:&stru_B9F70 table:@"AccountPreferences"];
  }
  else
  {
    id v5 = [BYODDataCardView alloc];
    objc_super v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"BYOD_DO_NOT_HAVE_ANY_ADDRESS" value:&stru_B9F70 table:@"AccountPreferences"];
    v8 = +[NSBundle bundleForClass:objc_opt_class()];
    [v8 localizedStringForKey:@"BYOD_DO_NOT_HAVE_ANY_ADDRESS_BODY" value:&stru_B9F70 table:@"AccountPreferences"];
  v9 = };
  objc_super v10 = [(BYODDataCardView *)v5 initWithTitle:v7 subtitle:v9 icon:v4];

  [(BYODStackView *)v10 addTarget:self action:"_doNotHaveExistingAddressWasTapped:" forControlEvents:1];

  return v10;
}

- (void)backWasTapped:(id)a3
{
  id v4 = [(BYODChooseEmailAddressViewController *)self navigationController];
  id v3 = [v4 popViewControllerAnimated:1];
}

- (void)_haveExistingAddressWasTapped:(id)a3
{
  id v7 = a3;
  id v4 = [BYODExistingAddressViewController alloc];
  id v5 = [(BYODBaseViewController *)self userAccount];
  objc_super v6 = [(BYODExistingAddressViewController *)v4 initWithACAccount:v5 familyFlow:_familyFlow existingAddress:1];

  [(BYODExistingAddressViewController *)v6 setModalInPresentation:0];
  [(BYODChooseEmailAddressViewController *)self showViewController:v6 sender:v7];
}

- (void)_doNotHaveExistingAddressWasTapped:(id)a3
{
  id v4 = [BYODExistingAddressViewController alloc];
  id v5 = [(BYODBaseViewController *)self userAccount];
  id v7 = [(BYODExistingAddressViewController *)v4 initWithACAccount:v5 familyFlow:_familyFlow existingAddress:0];

  objc_super v6 = [(BYODChooseEmailAddressViewController *)self navigationController];
  [v6 pushViewController:v7 animated:1];
}

- (id)colourForCard
{
  return +[UIColor systemBackgroundColor];
}

@end