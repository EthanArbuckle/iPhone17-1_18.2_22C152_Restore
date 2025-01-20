@interface BuddyActivationOptionsController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (BOOL)controllerNeedsToRun;
- (BuddyActivationOptionsController)init;
- (BuddyActivationState)activationState;
- (BuddyMiscState)miscState;
- (id)_titleFont;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)_activationMethodForSection:(unint64_t)a3;
- (void)setActivationState:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMiscState:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation BuddyActivationOptionsController

- (BuddyActivationOptionsController)init
{
  id location = self;
  v11[1] = (id)a2;
  v2 = +[NSBundle mainBundle];
  id v3 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"OTHER_CONNECTION_OPTIONS_DETAIL_WIFI"];
  id v4 = (id)SFLocalizableWAPIStringKeyForKey();
  v11[0] = [(NSBundle *)v2 localizedStringForKey:v4 value:&stru_1002B4E18 table:@"Localizable"];

  id v5 = location;
  v6 = +[NSBundle mainBundle];
  v7 = [(NSBundle *)v6 localizedStringForKey:@"OTHER_CONNECTION_OPTIONS_TITLE" value:&stru_1002B4E18 table:@"Localizable"];
  id location = 0;
  v10.receiver = v5;
  v10.super_class = (Class)BuddyActivationOptionsController;
  id location = [(BuddyActivationOptionsController *)&v10 initWithTitle:v7 detailText:v11[0] icon:0 adoptTableViewScrollView:1];
  objc_storeStrong(&location, location);

  v8 = (BuddyActivationOptionsController *)location;
  objc_storeStrong(v11, 0);
  objc_storeStrong(&location, 0);
  return v8;
}

- (void)viewDidLoad
{
  v11 = self;
  SEL v10 = a2;
  v9.receiver = self;
  v9.super_class = (Class)BuddyActivationOptionsController;
  [(BuddyActivationOptionsController *)&v9 viewDidLoad];
  id v2 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(BuddyActivationOptionsController *)v11 setTableView:v2];

  id v3 = v11;
  id v4 = [(BuddyActivationOptionsController *)v11 tableView];
  [v4 setDelegate:v3];

  id v5 = v11;
  id v6 = [(BuddyActivationOptionsController *)v11 tableView];
  [v6 setDataSource:v5];

  id v7 = [(BuddyActivationOptionsController *)v11 tableView];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v8 = [(BuddyActivationOptionsController *)v11 tableView];
  [v8 setSeparatorStyle:0];
}

- (id)_titleFont
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleBody];
  id v2 = [location[0] fontDescriptorWithSymbolicTraits:2];
  id v3 = +[UIFont fontWithDescriptor:v2 size:0.0];

  objc_storeStrong(location, 0);

  return v3;
}

- (unint64_t)_activationMethodForSection:(unint64_t)a3
{
  return a3;
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

- (BOOL)controllerNeedsToRun
{
  id v2 = [(BuddyActivationOptionsController *)self activationState];
  id v3 = [(BuddyActivationState *)v2 error];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v19 = 0;
  objc_storeStrong(&v19, a4);
  id v18 = [location[0] dequeueReusableCellWithIdentifier:@"cell"];
  if (!v18)
  {
    id v18 = [objc_alloc((Class)UITableViewCell) initWithStyle:3 reuseIdentifier:@"cell"];
  }
  [v18 setAccessoryType:1];
  id v5 = +[UIColor secondarySystemBackgroundColor];
  [v18 setBackgroundColor:v5];

  id v6 = [(BuddyActivationOptionsController *)v21 _titleFont];
  id v7 = [v18 textLabel];
  [v7 setFont:v6];

  id v8 = -[BuddyActivationOptionsController _activationMethodForSection:](v21, "_activationMethodForSection:", [v19 section]);
  if (v8)
  {
    if (v8 == (id)1)
    {
      objc_super v9 = +[NSBundle mainBundle];
      SEL v10 = [(NSBundle *)v9 localizedStringForKey:@"USE_MAC_OR_PC" value:&stru_1002B4E18 table:@"Localizable"];
      id v11 = [v18 textLabel];
      [v11 setText:v10];
    }
  }
  else
  {
    v12 = +[NSBundle mainBundle];
    id v13 = (id)SFLocalizableWAPIStringKeyForKey();
    v14 = [(NSBundle *)v12 localizedStringForKey:v13 value:&stru_1002B4E18 table:@"Localizable"];
    id v15 = [v18 textLabel];
    [v15 setText:v14];
  }
  id v16 = v18;
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  return v16;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 2;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v20 = 0;
  objc_storeStrong(&v20, a4);
  [location[0] deselectRowAtIndexPath:v20 animated:1];
  id v19 = -[BuddyActivationOptionsController _activationMethodForSection:](v22, "_activationMethodForSection:", [v20 section]);
  if (v19)
  {
    if (v19 == (id)1)
    {
      id v18 = +[BuddySkipWiFiAlertController alertController];
      v12 = _NSConcreteStackBlock;
      int v13 = -1073741824;
      int v14 = 0;
      id v15 = sub_100168C94;
      id v16 = &unk_1002B0D20;
      v17 = v22;
      [v18 setSkipWiFi:&v12];
      id v7 = _NSConcreteStackBlock;
      uint64_t v8 = 3221225472;
      objc_super v9 = sub_100168D40;
      SEL v10 = &unk_1002B0D20;
      id v11 = v22;
      [v18 setUseWiFi:&v7];
      -[BuddyActivationOptionsController presentViewController:animated:completion:](v22, "presentViewController:animated:completion:", v18, 1, 0, v7, v8, v9, v10);
      objc_storeStrong((id *)&v11, 0);
      objc_storeStrong((id *)&v17, 0);
      objc_storeStrong(&v18, 0);
    }
  }
  else
  {
    id v5 = [(BuddyActivationOptionsController *)v22 miscState];
    [(BuddyMiscState *)v5 setUserSelectedCellularActivation:0];

    id v6 = [(BuddyActivationOptionsController *)v22 delegate];
    [(BFFFlowItemDelegate *)v6 presentWiFiPaneForFlowItem:v22];
  }
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

- (BFFFlowItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BFFFlowItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
}

- (BuddyActivationState)activationState
{
  return self->_activationState;
}

- (void)setActivationState:(id)a3
{
}

- (void).cxx_destruct
{
}

@end