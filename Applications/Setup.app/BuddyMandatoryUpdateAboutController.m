@interface BuddyMandatoryUpdateAboutController
- (BuddyMandatoryUpdateAboutController)initWithScanOptions:(id)a3;
- (SUScanOptions)scanOptions;
- (UIStackView)topLevelStackView;
- (id)_boldFontForFont:(id)a3;
- (id)_makeDetailLabelWithViewModel:(id)a3;
- (id)_makeRowViewWithViewModel:(id)a3;
- (id)_makeRowViews;
- (id)_makeSpacer;
- (id)_makeTitleLabelWithViewModel:(id)a3;
- (id)_sortViewsForInterfaceDirection:(id)a3;
- (int64_t)_detailTextAlignment;
- (void)_doneTapped:(id)a3;
- (void)loadView;
- (void)viewDidLoad;
@end

@implementation BuddyMandatoryUpdateAboutController

- (BuddyMandatoryUpdateAboutController)initWithScanOptions:(id)a3
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v11;
  id v11 = 0;
  v9.receiver = v3;
  v9.super_class = (Class)BuddyMandatoryUpdateAboutController;
  v4 = [(BuddyMandatoryUpdateAboutController *)&v9 initWithNibName:0 bundle:0];
  id v11 = v4;
  objc_storeStrong(&v11, v4);
  if (v4)
  {
    id v5 = [location[0] copy];
    v6 = (void *)*((void *)v11 + 2);
    *((void *)v11 + 2) = v5;
  }
  v7 = (BuddyMandatoryUpdateAboutController *)v11;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v11, 0);
  return v7;
}

- (void)loadView
{
  v24 = self;
  SEL v23 = a2;
  v22.receiver = self;
  v22.super_class = (Class)BuddyMandatoryUpdateAboutController;
  [(BuddyMandatoryUpdateAboutController *)&v22 loadView];
  v2 = +[UIColor systemBackgroundColor];
  id v3 = [(BuddyMandatoryUpdateAboutController *)v24 view];
  [v3 setBackgroundColor:v2];

  id v4 = [(BuddyMandatoryUpdateAboutController *)v24 view];
  id v5 = [(BuddyMandatoryUpdateAboutController *)v24 topLevelStackView];
  [v4 addSubview:v5];

  id v6 = [(BuddyMandatoryUpdateAboutController *)v24 view];
  id v21 = [v6 safeAreaLayoutGuide];

  id location = [(BuddyMandatoryUpdateAboutController *)v24 topLevelStackView];
  id v19 = [v21 topAnchor];
  id v18 = [location topAnchor];
  id v17 = [v19 constraintEqualToAnchor:-57.0];
  v25[0] = v17;
  id v7 = [v21 bottomAnchor];
  id v8 = [location bottomAnchor];
  id v9 = [v7 constraintGreaterThanOrEqualToAnchor:v8 constant:57.0];
  v25[1] = v9;
  id v10 = [v21 leadingAnchor];
  id v11 = [location leadingAnchor];
  id v12 = [v10 constraintEqualToAnchor:v11 constant:-sub_10008F6D8()];
  v25[2] = v12;
  id v13 = [v21 trailingAnchor];
  id v14 = [location trailingAnchor];
  id v15 = [v13 constraintEqualToAnchor:v14 constant:sub_10008F6D8()];
  v25[3] = v15;
  v16 = +[NSArray arrayWithObjects:v25 count:4];
  +[NSLayoutConstraint activateConstraints:v16];

  objc_storeStrong(&location, 0);
  objc_storeStrong(&v21, 0);
}

- (void)viewDidLoad
{
  id v9 = self;
  SEL v8 = a2;
  v7.receiver = self;
  v7.super_class = (Class)BuddyMandatoryUpdateAboutController;
  [(BuddyMandatoryUpdateAboutController *)&v7 viewDidLoad];
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [(NSBundle *)v2 localizedStringForKey:@"MANDATORY_UPDATE_TITLE" value:&stru_1002B4E18 table:@"MandatorySoftwareUpdate"];
  [(BuddyMandatoryUpdateAboutController *)v9 setTitle:v3];

  id v4 = objc_alloc((Class)UIBarButtonItem);
  id v5 = [v4 initWithBarButtonSystemItem:0 target:v9 action:"_doneTapped:"];
  id v6 = [(BuddyMandatoryUpdateAboutController *)v9 navigationItem];
  [v6 setRightBarButtonItem:v5];
}

- (void)_doneTapped:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BuddyMandatoryUpdateAboutController *)v4 dismissViewControllerAnimated:1 completion:0];
  objc_storeStrong(location, 0);
}

- (UIStackView)topLevelStackView
{
  if (!self->_topLevelStackView)
  {
    id v2 = objc_alloc((Class)UIStackView);
    id v3 = [(BuddyMandatoryUpdateAboutController *)self _makeRowViews];
    id v4 = (UIStackView *)[v2 initWithArrangedSubviews:v3];
    topLevelStackView = self->_topLevelStackView;
    self->_topLevelStackView = v4;

    [(UIStackView *)self->_topLevelStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)self->_topLevelStackView setAxis:1];
    [(UIStackView *)self->_topLevelStackView setSpacing:16.0];
  }
  id v6 = self->_topLevelStackView;

  return v6;
}

- (id)_makeRowViews
{
  id v15 = self;
  v14[1] = (id)a2;
  id v2 = [(BuddyMandatoryUpdateAboutController *)self scanOptions];
  v14[0] = +[BuddyMandatoryUpdateAboutRowViewModel viewModelsWithScanOptions:v2];

  id location = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v14[0] count]];
  memset(v11, 0, sizeof(v11));
  id v3 = v14[0];
  id v4 = [v3 countByEnumeratingWithState:v11 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v4; ++i)
      {
        if (*(void *)v11[2] != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v12 = *(void *)(v11[1] + 8 * i);
        id v7 = location;
        id v8 = [(BuddyMandatoryUpdateAboutController *)v15 _makeRowViewWithViewModel:v12];
        [v7 addObject:v8];
      }
      id v4 = [v3 countByEnumeratingWithState:v11 objects:v16 count:16];
    }
    while (v4);
  }

  id v9 = location;
  objc_storeStrong(&location, 0);
  objc_storeStrong(v14, 0);
  return v9;
}

- (id)_makeRowViewWithViewModel:(id)a3
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = [(BuddyMandatoryUpdateAboutController *)v13 _makeTitleLabelWithViewModel:location[0]];
  id v10 = [(BuddyMandatoryUpdateAboutController *)v13 _makeDetailLabelWithViewModel:location[0]];
  id v9 = [(BuddyMandatoryUpdateAboutController *)v13 _makeSpacer];
  id v3 = v13;
  v14[0] = v11;
  v14[1] = v9;
  id v14[2] = v10;
  id v4 = +[NSArray arrayWithObjects:v14 count:3];
  id v8 = [(BuddyMandatoryUpdateAboutController *)v3 _sortViewsForInterfaceDirection:v4];

  id v7 = [objc_alloc((Class)UIStackView) initWithArrangedSubviews:v8];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v7 setAlignment:2];
  id v5 = v7;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (id)_makeTitleLabelWithViewModel:(id)a3
{
  uint64_t v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = objc_alloc_init((Class)UILabel);
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v3 = [location[0] title];
  [v10 setText:v3];

  LODWORD(v4) = 1144750080;
  [v10 setContentCompressionResistancePriority:0 forAxis:v4];
  id v5 = v12;
  id v6 = [v10 font];
  id v7 = [(BuddyMandatoryUpdateAboutController *)v5 _boldFontForFont:v6];
  [v10 setFont:v7];

  id v8 = v10;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (id)_makeDetailLabelWithViewModel:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = objc_alloc_init((Class)UILabel);
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v3 = [location[0] detail];
  [v6 setText:v3];

  [v6 setNumberOfLines:3];
  [v6 setTextAlignment:[v8 _detailTextAlignment]];
  id v4 = v6;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)_makeSpacer
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = objc_alloc_init((Class)UIView);
  [location[0] setTranslatesAutoresizingMaskIntoConstraints:0];
  id v2 = [location[0] widthAnchor];
  id v3 = [v2 constraintGreaterThanOrEqualToConstant:32.0];
  [v3 setActive:1];

  id v4 = location[0];
  objc_storeStrong(location, 0);
  return v4;
}

- (id)_sortViewsForInterfaceDirection:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (sub_100147F28())
  {
    id v3 = [location[0] reverseObjectEnumerator];
    id v7 = [v3 allObjects];
  }
  else
  {
    id v7 = location[0];
  }
  objc_storeStrong(location, 0);
  id v4 = v7;

  return v4;
}

- (int64_t)_detailTextAlignment
{
  if (sub_100147F28()) {
    return 0;
  }
  else {
    return 2;
  }
}

- (id)_boldFontForFont:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [location[0] fontDescriptor];
  id v6 = [v3 fontDescriptorWithSymbolicTraits:2];

  [location[0] pointSize];
  id v4 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v6);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);

  return v4;
}

- (SUScanOptions)scanOptions
{
  return self->_scanOptions;
}

- (void).cxx_destruct
{
}

@end