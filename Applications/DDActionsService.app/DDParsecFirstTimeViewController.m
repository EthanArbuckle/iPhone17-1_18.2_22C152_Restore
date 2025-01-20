@interface DDParsecFirstTimeViewController
- (BOOL)fullScreen;
- (DDParsecFirstTimeViewController)initWithNibName:(id)a3 bundle:(id)a4 bag:(id)a5 sceneAwareVariant:(BOOL)a6;
- (SearchUIFirstTimeExperienceDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)setFullScreen:(BOOL)a3;
- (void)updateForCurrentTraitCollection;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation DDParsecFirstTimeViewController

- (DDParsecFirstTimeViewController)initWithNibName:(id)a3 bundle:(id)a4 bag:(id)a5 sceneAwareVariant:(BOOL)a6
{
  id v48 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v46 = 0;
  objc_storeStrong(&v46, a4);
  id v45 = 0;
  objc_storeStrong(&v45, a5);
  BOOL v44 = a6;
  id v6 = v48;
  id v48 = 0;
  v43.receiver = v6;
  v43.super_class = (Class)DDParsecFirstTimeViewController;
  v28 = [(DDParsecFirstTimeViewController *)&v43 initWithNibName:location[0] bundle:v46];
  id v48 = v28;
  objc_storeStrong(&v48, v28);
  if (v28)
  {
    id v23 = (id)objc_opt_new();
    [v48 setView:];

    id v24 = [v48 view];
    [v24 setAlwaysBounceVertical:1];

    id v41 = +[NSCharacterSet whitespaceCharacterSet];
    char v38 = 0;
    char v36 = 0;
    if (v44)
    {
      id v39 = [v45 sceneAwareLookupFirstUseDescriptionText];
      char v38 = 1;
      id v22 = v39;
    }
    else
    {
      id v37 = [v45 firstUseDescriptionText];
      char v36 = 1;
      id v22 = v37;
    }
    id v21 = [v22 stringByTrimmingCharactersInSet:v41];
    id v40 = +[NSString stringWithFormat:@"%@ ", v21];

    if (v36) {
    if (v38)
    }

    id v20 = [v45 firstUseLearnMoreText];
    char v33 = 0;
    if (v20)
    {
      id v7 = v20;
    }
    else
    {
      id v34 = (id)DDLocalizedString();
      char v33 = 1;
      id v7 = v34;
    }
    id v35 = v7;
    if (v33) {

    }
    id v18 = [v35 stringByTrimmingCharactersInSet:v41];
    v8 = +[NSString stringWithFormat:@"%@ ", v18];
    id v9 = v35;
    id v35 = v8;

    id v19 = objc_alloc((Class)SearchUIFirstTimeExperienceViewController);
    char v31 = 0;
    char v29 = 0;
    if (v44)
    {
      id v32 = [v45 sceneAwareLookupEnabledDomains];
      char v31 = 1;
      id v17 = v32;
    }
    else
    {
      id v30 = [v45 enabledDomains];
      char v29 = 1;
      id v17 = v30;
    }
    id v16 = (id)DDLocalizedString();
    id v10 = [v19 initWithDomains:v17 explanationText:v40 learnMoreText:v35 continueButtonTitle:];
    v11 = (void *)*((void *)v48 + 1);
    *((void *)v48 + 1) = v10;

    if (v29) {
    if (v31)
    }

    [v48 addChildViewController:*((void *)v48 + 1)];
    id v14 = [v48 view];
    id v13 = [*((id *)v48 + 1) view];
    [v14 addSubview:];

    id v15 = [*((id *)v48 + 1) view];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

    v49 = (DDParsecFirstTimeViewController *)v48;
    int v42 = 1;
    objc_storeStrong(&v35, 0);
    objc_storeStrong(&v40, 0);
    objc_storeStrong(&v41, 0);
  }
  else
  {
    v49 = (DDParsecFirstTimeViewController *)v48;
    int v42 = 1;
  }
  objc_storeStrong(&v45, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v48, 0);
  return v49;
}

- (void)viewWillAppear:(BOOL)a3
{
  id v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)DDParsecFirstTimeViewController;
  [(DDParsecFirstTimeViewController *)&v3 viewWillAppear:a3];
  [(DDParsecFirstTimeViewController *)v6 updateForCurrentTraitCollection];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  CGSize v13 = a3;
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  id v4 = location[0];
  SEL v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  v8 = sub_100009410;
  id v9 = &unk_100020808;
  id v10 = v12;
  [v4 animateAlongsideTransition:];
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)updateForCurrentTraitCollection
{
  v50 = self;
  SEL v49 = a2;
  char v48 = 0;
  id v29 = [(SearchUIFirstTimeExperienceViewController *)self->_firstExperienceViewController delegate];
  unsigned __int8 v30 = [v29 presentsWithMargins];

  char v48 = v30 & 1;
  id v33 = [(DDParsecFirstTimeViewController *)v50 traitCollection];
  [v33 displayScale];
  double v31 = v2;
  id v32 = [(SearchUIFirstTimeExperienceViewController *)v50->_firstExperienceViewController delegate];
  [v32 setDDViewScale:v31];

  id v47 = [(SearchUIFirstTimeExperienceViewController *)v50->_firstExperienceViewController view];
  id v46 = [(DDParsecFirstTimeViewController *)v50 view];
  double v3 = 0.0;
  double v45 = 0.0;
  if ((v30 & 1) == 0) {
    double v3 = 8.0;
  }
  double v45 = v3;
  id v34 = [v47 layer];
  [v34 cornerRadius];
  BOOL v35 = v4 == v45;

  if (!v35)
  {
    id v28 = [v47 layer];
    [v28 setCornerRadius:v45];
  }
  char v42 = 0;
  if (v48)
  {
    SEL v5 = (UIColor *)0;
  }
  else
  {
    objc_super v43 = +[UIColor systemGroupedBackgroundColor];
    char v42 = 1;
    SEL v5 = v43;
  }
  id v44 = v5;
  if (v42) {

  }
  char v39 = 0;
  if (v48)
  {
    id v40 = +[UIColor systemGroupedBackgroundColor];
    char v39 = 1;
    int v6 = v40;
  }
  else
  {
    int v6 = (UIColor *)0;
  }
  id location = v6;
  if (v39) {

  }
  id v7 = [v47 backgroundColor];
  BOOL v27 = v7 == v44;

  if (!v27) {
    [v47 setBackgroundColor:v44];
  }
  id v8 = [v46 backgroundColor];
  BOOL v26 = v8 == location;

  if (!v26) {
    [v46 setBackgroundColor:location];
  }
  double v9 = 0.0;
  if ((v48 & 1) == 0) {
    double v9 = 8.0;
  }
  double v38 = v9;
  if (v50->_leadingConstraint)
  {
    [(NSLayoutConstraint *)v50->_leadingConstraint constant];
    if (v14 != v38) {
      [(NSLayoutConstraint *)v50->_leadingConstraint setConstant:v38];
    }
    [(NSLayoutConstraint *)v50->_trailingConstraint constant];
    if (v15 != v38) {
      [(NSLayoutConstraint *)v50->_trailingConstraint setConstant:v38];
    }
  }
  else
  {
    id v22 = [v47 leadingAnchor];
    id v21 = [v46 safeAreaLayoutGuide];
    id v20 = [v21 leadingAnchor];
    id v10 = [v22 constraintEqualToAnchor:v38];
    leadingConstraint = v50->_leadingConstraint;
    v50->_leadingConstraint = v10;

    [(NSLayoutConstraint *)v50->_leadingConstraint setActive:1];
    id v25 = [v46 safeAreaLayoutGuide];
    id v24 = [v25 trailingAnchor];
    id v23 = [v47 trailingAnchor];
    v12 = [v24 constraintEqualToAnchor:v38];
    trailingConstraint = v50->_trailingConstraint;
    v50->_trailingConstraint = v12;

    [(NSLayoutConstraint *)v50->_trailingConstraint setActive:1];
  }
  id v18 = [(DDParsecFirstTimeViewController *)v50 view];
  [v18 layoutIfNeeded];

  [v47 frame];
  double v36 = v16;
  double v37 = v17;
  id v19 = [(DDParsecFirstTimeViewController *)v50 view];
  [v19 setContentSize:v36, v37];

  objc_storeStrong(&location, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&v47, 0);
}

- (void)setDelegate:(id)a3
{
  double v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(SearchUIFirstTimeExperienceViewController *)v4->_firstExperienceViewController setDelegate:location[0]];
  objc_storeStrong(location, 0);
}

- (SearchUIFirstTimeExperienceDelegate)delegate
{
  return (SearchUIFirstTimeExperienceDelegate *)[(SearchUIFirstTimeExperienceViewController *)self->_firstExperienceViewController delegate];
}

- (BOOL)fullScreen
{
  return self->_fullScreen;
}

- (void)setFullScreen:(BOOL)a3
{
  self->_fullScreen = a3;
}

- (void).cxx_destruct
{
}

@end