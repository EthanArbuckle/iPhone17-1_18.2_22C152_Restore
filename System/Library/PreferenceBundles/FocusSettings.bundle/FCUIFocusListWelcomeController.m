@interface FCUIFocusListWelcomeController
+ (id)welcomeControllerWithPlaceholderModes:(id)a3 allReservedModes:(id)a4;
- (FCUIFocusListWelcomeController)initWithPlaceholderModes:(id)a3 allReservedModes:(id)a4;
- (id)_activityControlForCustomMode;
- (id)_activityControlForPlaceholderMode:(id)a3;
- (void)_configureActivityListView;
- (void)viewDidLoad;
@end

@implementation FCUIFocusListWelcomeController

+ (id)welcomeControllerWithPlaceholderModes:(id)a3 allReservedModes:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[FCUIFocusListWelcomeController alloc] initWithPlaceholderModes:v6 allReservedModes:v5];

  return v7;
}

- (FCUIFocusListWelcomeController)initWithPlaceholderModes:(id)a3 allReservedModes:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(FCUIFocusListWelcomeController *)self initWithTitle:&stru_1D300 detailText:&stru_1D300 icon:0 contentLayout:3];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)(&v9->super + 1), a3);
    objc_storeStrong((id *)((char *)&v10->_placeholderModes + 1), a4);
  }

  return v10;
}

- (void)viewDidLoad
{
  v25.receiver = self;
  v25.super_class = (Class)FCUIFocusListWelcomeController;
  [(FCUIBaseWelcomeController *)&v25 viewDidLoad];
  v3 = [(FCUIFocusListWelcomeController *)self headerView];
  LODWORD(v4) = 1036831949;
  [v3 setTitleHyphenationFactor:v4];
  id v5 = +[NSBundle fcui_focusSettingsLocalizationBundle];
  id v6 = [v5 localizedStringForKey:@"ONBOARDING_FOCUS_LIST_TITLE" value:&stru_1D300 table:0];

  [v3 setTitle:v6];
  id v7 = +[NSBundle fcui_focusSettingsLocalizationBundle];
  id v8 = [v7 localizedStringForKey:@"ONBOARDING_FOCUS_LIST_DETAIL_TEXT" value:&stru_1D300 table:0];

  [v3 setDetailText:v8];
  v9 = [(FCUIFocusListWelcomeController *)self contentView];
  v10 = (NSSet *)objc_alloc_init((Class)FCUIActivityListView);
  v11 = *(NSSet **)((char *)&self->_allReservedModes + 1);
  *(NSSet **)((char *)&self->_allReservedModes + 1) = v10;

  [*(id *)((char *)&self->_allReservedModes + 1) setScrollEnabled:0];
  [*(id *)((char *)&self->_allReservedModes + 1) setTranslatesAutoresizingMaskIntoConstraints:0];
  [v9 addSubview:*(NSSet **)((char *)&self->_allReservedModes + 1)];
  id v12 = objc_alloc_init((Class)NSMutableArray);
  v13 = [*(id *)((char *)&self->_allReservedModes + 1) leadingAnchor];
  v14 = [v9 leadingAnchor];
  v15 = [v13 constraintEqualToAnchor:v14 constant:30.0];
  [v12 addObject:v15];

  v16 = [v9 trailingAnchor];
  v17 = [*(id *)((char *)&self->_allReservedModes + 1) trailingAnchor];
  v18 = [v16 constraintEqualToAnchor:v17 constant:30.0];
  [v12 addObject:v18];

  v19 = [*(id *)((char *)&self->_allReservedModes + 1) topAnchor];
  v20 = [v9 topAnchor];
  v21 = [v19 constraintEqualToAnchor:v20 constant:40.0];
  [v12 addObject:v21];

  v22 = [v9 bottomAnchor];
  v23 = [*(id *)((char *)&self->_allReservedModes + 1) bottomAnchor];
  v24 = [v22 constraintEqualToAnchor:v23 constant:40.0];
  [v12 addObject:v24];

  +[NSLayoutConstraint activateConstraints:v12];
  [(FCUIFocusListWelcomeController *)self _configureActivityListView];
}

- (void)_configureActivityListView
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  double v4 = [(FCUIFocusListWelcomeController *)self _activityControlForCustomMode];
  [v3 addObject:v4];

  id v5 = [*(id *)(&self->super + 1) allObjects];
  id v6 = [v5 sortedArrayUsingComparator:&stru_1CD88];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = -[FCUIFocusListWelcomeController _activityControlForPlaceholderMode:](self, "_activityControlForPlaceholderMode:", *(void *)(*((void *)&v13 + 1) + 8 * (void)v11), (void)v13);
        [v3 addObject:v12];

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  [*(id *)((char *)&self->_allReservedModes + 1) setActivityViews:v3];
}

- (id)_activityControlForCustomMode
{
  id v3 = +[NSBundle fcui_focusSettingsLocalizationBundle];
  double v4 = [v3 localizedStringForKey:@"ONBOARDING_FOCUS_LIST_CUSTOM_MODE_NAME" value:&stru_1D300 table:0];

  id v5 = [objc_alloc((Class)DNDMode) initWithName:v4 modeIdentifier:&stru_1D300 symbolImageName:@"plus.circle.fill" tintColorName:@"systemDarkGrayColor" semanticType:-1];
  id v6 = [[FCUIFocus alloc] initWithMode:v5];
  id v7 = [objc_alloc((Class)FCUIActivityControl) initWithActivityDescription:v6];
  id v8 = *(id *)((char *)&self->_placeholderModes + 1);
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_9254;
  v12[3] = &unk_1CDB0;
  objc_copyWeak(&v14, &location);
  id v9 = v8;
  id v13 = v9;
  uint64_t v10 = +[UIAction actionWithHandler:v12];
  [v7 addAction:v10 forControlEvents:64];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v7;
}

- (id)_activityControlForPlaceholderMode:(id)a3
{
  id v4 = a3;
  id v5 = [[FCUIFocus alloc] initWithMode:v4];
  id v6 = [objc_alloc((Class)FCUIActivityControl) initWithActivityDescription:v5];
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_9438;
  v10[3] = &unk_1CDB0;
  objc_copyWeak(&v12, &location);
  id v7 = v4;
  id v11 = v7;
  id v8 = +[UIAction actionWithHandler:v10];
  [v6 addAction:v8 forControlEvents:64];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_allReservedModes + 1), 0);
  objc_storeStrong((id *)((char *)&self->_placeholderModes + 1), 0);

  objc_storeStrong((id *)(&self->super + 1), 0);
}

@end