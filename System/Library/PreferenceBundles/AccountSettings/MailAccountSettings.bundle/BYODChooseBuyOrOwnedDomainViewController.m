@interface BYODChooseBuyOrOwnedDomainViewController
+ (id)log;
- (BYODChooseBuyOrOwnedDomainViewController)initWithACAccount:(id)a3 maxDomainsAllowed:(int64_t)a4 domainPurchaseProviderName:(id)a5;
- (NSString)domainPurchaseProviderName;
- (id)colourForCard;
- (int64_t)maxDomainsAllowed;
- (void)_addDataCardsView:(id)a3;
- (void)_buyDomainWasTapped:(id)a3;
- (void)_cancelWasTapped:(id)a3;
- (void)_useOwnWasTapped:(id)a3;
- (void)learnMoreWasTapped:(id)a3;
- (void)setDomainPurchaseProviderName:(id)a3;
- (void)setMaxDomainsAllowed:(int64_t)a3;
- (void)viewDidLoad;
@end

@implementation BYODChooseBuyOrOwnedDomainViewController

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2A8A0;
  block[3] = &unk_B8D50;
  block[4] = a1;
  if (qword_D7398 != -1) {
    dispatch_once(&qword_D7398, block);
  }
  v2 = (void *)qword_D7390;

  return v2;
}

- (BYODChooseBuyOrOwnedDomainViewController)initWithACAccount:(id)a3 maxDomainsAllowed:(int64_t)a4 domainPurchaseProviderName:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)BYODChooseBuyOrOwnedDomainViewController;
  v10 = [(BYODBaseViewController *)&v13 initWithACAccount:a3];
  v11 = v10;
  if (v10)
  {
    v10->_maxDomainsAllowed = a4;
    objc_storeStrong((id *)&v10->_domainPurchaseProviderName, a5);
  }

  return v11;
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)BYODChooseBuyOrOwnedDomainViewController;
  [(BYODBaseViewController *)&v13 viewDidLoad];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"BYOD_BUY_OR_OWNED_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];

  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"BYOD_BUY_OR_OWNED_BODY%1$ld" value:&stru_B9F70 table:@"AccountPreferences"];
  v7 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, self->_maxDomainsAllowed);

  v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = +[UIImage imageNamed:@"CustomDomainIcon.png" inBundle:v8];

  [(BYODBaseViewController *)self createViewControllerWithTitle:v4 detail:v7 icon:v9];
  [(BYODChooseBuyOrOwnedDomainViewController *)self setModalPresentationStyle:2];
  v10 = [(BYODChooseBuyOrOwnedDomainViewController *)self navigationItem];
  [v10 setHidesBackButton:1];

  v11 = [(BYODChooseBuyOrOwnedDomainViewController *)self navigationItem];
  id v12 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_cancelWasTapped:"];
  [v11 setRightBarButtonItem:v12];
}

- (void)_addDataCardsView:(id)a3
{
  id v51 = a3;
  id v4 = objc_msgSend(objc_alloc((Class)UIStackView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v4 setAxis:1];
  [v4 setSpacing:10.0];
  v49 = +[UIImage systemImageNamed:@"dollarsign.circle.fill"];
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"BYOD_BUY_OR_OWNED_BUY_BODY" value:&stru_B9F70 table:@"AccountPreferences"];
  v48 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, self->_domainPurchaseProviderName);

  v7 = [BYODDataCardView alloc];
  v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"BYOD_BUY_OR_OWNED_BUY_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
  v10 = [(BYODDataCardView *)v7 initWithTitle:v9 subtitle:v48 icon:v49];

  v41 = v10;
  [(BYODDataCardView *)v10 setHideChevron:0];
  [(BYODStackView *)v10 addTarget:self action:"_buyDomainWasTapped:" forControlEvents:1];
  [v4 addArrangedSubview:v10];
  v47 = +[UIImage systemImageNamed:@"square.and.arrow.down.on.square.fill"];
  v11 = [BYODDataCardView alloc];
  id v12 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v13 = [v12 localizedStringForKey:@"BYOD_BUY_OR_OWNED_USE_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
  v14 = +[NSBundle bundleForClass:objc_opt_class()];
  v15 = [v14 localizedStringForKey:@"BYOD_BUY_OR_OWNED_USE_BODY" value:&stru_B9F70 table:@"AccountPreferences"];
  v16 = [(BYODDataCardView *)v11 initWithTitle:v13 subtitle:v15 icon:v47];

  v40 = v16;
  [(BYODDataCardView *)v16 setHideChevron:0];
  [(BYODStackView *)v16 addTarget:self action:"_useOwnWasTapped:" forControlEvents:1];
  [v4 addArrangedSubview:v16];
  v50 = +[OBTextSectionAccessoryButton accessoryButton];
  v17 = +[NSBundle bundleForClass:objc_opt_class()];
  v18 = [v17 localizedStringForKey:@"LEARN_MORE_ELLIPSIS" value:&stru_B9F70 table:@"AccountPreferences"];
  [v50 setTitle:v18 forState:0];

  v19 = [v50 titleLabel];
  [v19 setTextAlignment:1];

  [v50 addTarget:self action:"learnMoreWasTapped:" forControlEvents:1];
  [v4 addArrangedSubview:v50];
  v20 = [v51 contentView];
  [v20 addSubview:v4];

  v42 = [v51 contentView];
  v39 = [v51 contentView];
  v46 = [v39 topAnchor];
  v38 = [v4 topAnchor];
  v37 = objc_msgSend(v46, "constraintEqualToAnchor:");
  v52[0] = v37;
  v36 = [v51 contentView];
  v45 = [v36 leadingAnchor];
  v35 = [v4 leadingAnchor];
  v34 = objc_msgSend(v45, "constraintEqualToAnchor:");
  v52[1] = v34;
  v33 = [v51 contentView];
  v44 = [v33 trailingAnchor];
  v32 = [v4 trailingAnchor];
  v31 = objc_msgSend(v44, "constraintEqualToAnchor:");
  v52[2] = v31;
  v30 = [v51 contentView];
  v43 = [v30 bottomAnchor];
  v21 = [v4 bottomAnchor];
  v22 = [v43 constraintEqualToAnchor:v21];
  v52[3] = v22;
  v23 = [v50 leadingAnchor];
  v24 = [v4 leadingAnchor];
  v25 = [v23 constraintEqualToAnchor:v24];
  v52[4] = v25;
  v26 = [v50 trailingAnchor];
  v27 = [v4 trailingAnchor];
  v28 = [v26 constraintEqualToAnchor:v27];
  v52[5] = v28;
  v29 = +[NSArray arrayWithObjects:v52 count:6];
  [v42 addConstraints:v29];
}

- (void)learnMoreWasTapped:(id)a3
{
  id v6 = +[UIApplication sharedApplication];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"BYOD_BUY_OR_OWNED_LEARN_MORE" value:&stru_B9F70 table:@"AccountPreferences"];
  v5 = +[NSURL URLWithString:v4];
  [v6 openURL:v5 options:&__NSDictionary0__struct completionHandler:0];
}

- (void)_buyDomainWasTapped:(id)a3
{
  id v4 = [[BYODSpinner alloc] initWithViewController:self];
  spinner = self->_spinner;
  self->_spinner = v4;

  [(BYODSpinner *)self->_spinner startSpinner];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v6 = [BYODDomainPurchaseEligibilityRequest alloc];
  v7 = [(BYODBaseViewController *)self userAccount];
  v8 = [(BYODBaseViewController *)self userAccount];
  id v9 = [v8 accountStore];
  v10 = [(BYODDomainPurchaseEligibilityRequest *)v6 initWithAccount:v7 accountStore:v9];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_2B7C4;
  v11[3] = &unk_B9150;
  objc_copyWeak(&v12, &location);
  [(BYODDomainPurchaseEligibilityRequest *)v10 performRequestWithCallback:v11];
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
}

- (void)_useOwnWasTapped:(id)a3
{
  id v4 = [BYODChooseYouOrFamilyViewController alloc];
  v5 = [(BYODBaseViewController *)self userAccount];
  v7 = [(BYODBaseViewController *)v4 initWithACAccount:v5];

  id v6 = [(BYODChooseBuyOrOwnedDomainViewController *)self navigationController];
  [v6 pushViewController:v7 animated:1];
}

- (void)_cancelWasTapped:(id)a3
{
}

- (id)colourForCard
{
  return +[UIColor systemBackgroundColor];
}

- (int64_t)maxDomainsAllowed
{
  return self->_maxDomainsAllowed;
}

- (void)setMaxDomainsAllowed:(int64_t)a3
{
  self->_maxDomainsAllowed = a3;
}

- (NSString)domainPurchaseProviderName
{
  return self->_domainPurchaseProviderName;
}

- (void)setDomainPurchaseProviderName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainPurchaseProviderName, 0);

  objc_storeStrong((id *)&self->_spinner, 0);
}

@end