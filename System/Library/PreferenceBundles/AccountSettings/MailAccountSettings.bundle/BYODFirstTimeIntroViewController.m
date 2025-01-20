@interface BYODFirstTimeIntroViewController
+ (id)log;
- (BYODFirstTimeIntroViewController)initWithACAccount:(id)a3 completion:(id)a4;
- (id)callback;
- (id)colourForCard;
- (void)_addDataCardsView:(id)a3;
- (void)_continueWasTapped:(id)a3;
- (void)_notNowWasTapped:(id)a3;
- (void)setCallback:(id)a3;
- (void)viewDidLoad;
@end

@implementation BYODFirstTimeIntroViewController

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4E500;
  block[3] = &unk_B8D50;
  block[4] = a1;
  if (qword_D7468 != -1) {
    dispatch_once(&qword_D7468, block);
  }
  v2 = (void *)qword_D7460;

  return v2;
}

- (BYODFirstTimeIntroViewController)initWithACAccount:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BYODFirstTimeIntroViewController;
  v7 = [(BYODBaseViewController *)&v11 initWithACAccount:a3];
  if (v7)
  {
    id v8 = objc_retainBlock(v6);
    id callback = v7->_callback;
    v7->_id callback = v8;
  }
  return v7;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)BYODFirstTimeIntroViewController;
  [(BYODBaseViewController *)&v8 viewDidLoad];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"BYOD_FT_INTRO_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];

  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = +[UIImage imageNamed:@"CustomDomainIcon.png" inBundle:v5];

  [(BYODBaseViewController *)self createViewControllerWithTitle:v4 detail:&stru_B9F70 icon:v6];
  [(BYODFirstTimeIntroViewController *)self setModalPresentationStyle:2];
  v7 = [(BYODFirstTimeIntroViewController *)self navigationItem];
  [v7 setHidesBackButton:0];
}

- (void)_addDataCardsView:(id)a3
{
  id v58 = a3;
  id v59 = objc_msgSend(objc_alloc((Class)UIStackView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [v59 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v59 setAxis:1];
  [v59 setSpacing:0.0];
  v57 = +[UIImage systemImageNamed:@"envelope.circle.fill"];
  v3 = [BYODDataCardView alloc];
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"BYOD_FT_INTRO_CUSTOM_ADDRESS" value:&stru_B9F70 table:@"AccountPreferences"];
  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"BYOD_FT_INTRO_CUSTOM_ADDRESS_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
  objc_super v8 = [(BYODDataCardView *)v3 initWithTitle:v5 subtitle:v7 icon:v57];

  v56 = v8;
  [(BYODDataCardView *)v8 setHideChevron:1];
  v9 = +[UIColor clearColor];
  [(BYODDataCardView *)v8 setBackgroundColor:v9];

  [v59 addArrangedSubview:v8];
  v55 = +[UIImage systemImageNamed:@"dollarsign.circle.fill"];
  v10 = [BYODDataCardView alloc];
  objc_super v11 = +[NSBundle bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"BYOD_FT_INTRO_BUY" value:&stru_B9F70 table:@"AccountPreferences"];
  v13 = +[NSBundle bundleForClass:objc_opt_class()];
  v14 = [v13 localizedStringForKey:@"BYOD_FT_INTRO_BUY_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
  v15 = [(BYODDataCardView *)v10 initWithTitle:v12 subtitle:v14 icon:v55];

  v54 = v15;
  [(BYODDataCardView *)v15 setHideChevron:1];
  v16 = +[UIColor clearColor];
  [(BYODDataCardView *)v15 setBackgroundColor:v16];

  [v59 addArrangedSubview:v15];
  v53 = +[UIImage systemImageNamed:@"person.3.fill"];
  v17 = [BYODDataCardView alloc];
  v18 = +[NSBundle bundleForClass:objc_opt_class()];
  v19 = [v18 localizedStringForKey:@"BYOD_FT_INTRO_SHARE" value:&stru_B9F70 table:@"AccountPreferences"];
  v20 = +[NSBundle bundleForClass:objc_opt_class()];
  v21 = [v20 localizedStringForKey:@"BYOD_FT_INTRO_SHARE_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
  v22 = [(BYODDataCardView *)v17 initWithTitle:v19 subtitle:v21 icon:v53];

  v52 = v22;
  [(BYODDataCardView *)v22 setHideChevron:1];
  v23 = +[UIColor clearColor];
  [(BYODDataCardView *)v22 setBackgroundColor:v23];

  [v59 addArrangedSubview:v22];
  v24 = [v58 contentView];
  [v24 addSubview:v59];

  v49 = [v58 contentView];
  v47 = [v58 contentView];
  v51 = [v47 topAnchor];
  v46 = [v59 topAnchor];
  v45 = objc_msgSend(v51, "constraintEqualToAnchor:");
  v60[0] = v45;
  v44 = [v58 contentView];
  v50 = [v44 leadingAnchor];
  v43 = [v59 leadingAnchor];
  v25 = objc_msgSend(v50, "constraintEqualToAnchor:");
  v60[1] = v25;
  v26 = [v58 contentView];
  v27 = [v26 trailingAnchor];
  v28 = [v59 trailingAnchor];
  v29 = [v27 constraintEqualToAnchor:v28];
  v60[2] = v29;
  v30 = [v58 contentView];
  v31 = [v30 bottomAnchor];
  v32 = [v59 bottomAnchor];
  v33 = [v31 constraintEqualToAnchor:v32];
  v60[3] = v33;
  v34 = +[NSArray arrayWithObjects:v60 count:4];
  [v49 addConstraints:v34];

  v35 = +[OBBoldTrayButton boldButton];
  v36 = +[NSBundle bundleForClass:objc_opt_class()];
  v37 = [v36 localizedStringForKey:@"BYOD_FT_INTRO_CONTINUE" value:&stru_B9F70 table:@"AccountPreferences"];
  [v35 setTitle:v37 forState:0];

  [v35 addTarget:self action:"_continueWasTapped:" forEvents:64];
  v38 = [v58 buttonTray];
  [v38 addButton:v35];

  v39 = +[OBLinkTrayButton linkButton];
  v40 = +[NSBundle bundleForClass:objc_opt_class()];
  v41 = [v40 localizedStringForKey:@"BYOD_FT_INTRO_NOT_NOW" value:&stru_B9F70 table:@"AccountPreferences"];
  [v39 setTitle:v41 forState:0];

  [v39 addTarget:self action:"_notNowWasTapped:" forEvents:64];
  v42 = [v58 buttonTray];
  [v42 addButton:v39];
}

- (void)_continueWasTapped:(id)a3
{
  id v4 = a3;
  [v4 showsBusyIndicator];
  v5 = [BYODUpdateWelcomeFlagRequest alloc];
  id v6 = [(BYODBaseViewController *)self userAccount];
  v7 = [(BYODBaseViewController *)self userAccount];
  objc_super v8 = [v7 accountStore];
  v9 = [(BYODUpdateWelcomeFlagRequest *)v5 initWithAccount:v6 accountStore:v8];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_4F340;
  v11[3] = &unk_B9478;
  id v10 = v4;
  id v12 = v10;
  v13 = self;
  [(BYODUpdateWelcomeFlagRequest *)v9 performRequestWithCallback:v11];
}

- (void)_notNowWasTapped:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_4F658;
  v3[3] = &unk_B8E88;
  v3[4] = self;
  [(BYODFirstTimeIntroViewController *)self dismissViewControllerAnimated:1 completion:v3];
}

- (id)colourForCard
{
  return +[UIColor systemBackgroundColor];
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (void).cxx_destruct
{
}

@end