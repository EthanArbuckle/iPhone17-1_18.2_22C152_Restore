@interface SwipeOptionsController
- (BOOL)_shouldReverseLayoutDirection;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_baseSwipeValues;
- (id)_diagramSpecifierWithSwipeDirection:(unint64_t)a3;
- (id)_rightSwipeValues;
- (id)_titlesForSwipeValues:(id)a3;
- (id)leftSwipeAction:(id)a3;
- (id)rightSwipeAction:(id)a3;
- (id)specifiers;
- (id)swipeActionsAndTitles;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_configureSwipeDiagramInCell:(id)a3 atIndexPath:(id)a4;
- (void)setLeftSwipeAction:(id)a3 withSpecifier:(id)a4;
- (void)setRightSwipeAction:(id)a3 withSpecifier:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation SwipeOptionsController

- (void)viewDidAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SwipeOptionsController;
  [(SwipeOptionsController *)&v10 viewDidAppear:a3];
  v4 = [(SwipeOptionsController *)self table];
  [v4 contentOffset];
  double v6 = v5;
  double v8 = v7;

  [(SwipeOptionsController *)self reloadSpecifiers];
  v9 = [(SwipeOptionsController *)self table];
  objc_msgSend(v9, "setContentOffset:", v6, v8);
}

- (BOOL)_shouldReverseLayoutDirection
{
  unsigned int v2 = +[UIView _enableRTL];
  if (v2) {
    LOBYTE(v2) = [UIApp userInterfaceLayoutDirection] == (char *)&dword_0 + 1;
  }
  return v2;
}

- (id)_diagramSpecifierWithSwipeDirection:(unint64_t)a3
{
  v4 = +[PSSpecifier preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:-1 edit:0];
  double v5 = +[NSNumber numberWithUnsignedInteger:a3];
  [v4 setProperty:v5 forKey:@"kSwipeDirection"];

  return v4;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    unsigned int v5 = [(SwipeOptionsController *)self _shouldReverseLayoutDirection];
    double v6 = +[NSBundle bundleForClass:objc_opt_class()];
    double v7 = v6;
    if (v5) {
      [v6 localizedStringForKey:@"SWIPE_RIGHT" value:&stru_39200 table:@"Preferences"];
    }
    else {
    double v8 = [v6 localizedStringForKey:@"SWIPE_LEFT" value:&stru_39200 table:@"Preferences"];
    }
    v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:"setLeftSwipeAction:withSpecifier:" get:"leftSwipeAction:" detail:objc_opt_class() cell:2 edit:0];

    [v9 setProperty:&off_3B6D8 forKey:@"kSwipeDirection"];
    if (v5) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = 1;
    }
    v11 = +[NSNumber numberWithUnsignedInteger:v10];
    [v9 setProperty:v11 forKey:@"kLocalizedSwipeDirection"];

    v12 = [(SwipeOptionsController *)self _leftSwipeValues];
    v13 = [(SwipeOptionsController *)self _leftSwipeValues];
    v14 = [(SwipeOptionsController *)self _titlesForSwipeValues:v13];
    [v9 setValues:v12 titles:v14];

    v15 = +[NSBundle bundleForClass:objc_opt_class()];
    if (v5) {
      [v15 localizedStringForKey:@"SWIPE_LEFT" value:&stru_39200 table:@"Preferences"];
    }
    else {
    v16 = [v15 localizedStringForKey:@"SWIPE_RIGHT" value:&stru_39200 table:@"Preferences"];
    }
    v17 = +[PSSpecifier preferenceSpecifierNamed:v16 target:self set:"setRightSwipeAction:withSpecifier:" get:"rightSwipeAction:" detail:objc_opt_class() cell:2 edit:0];

    [v17 setProperty:&off_3B6F0 forKey:@"kSwipeDirection"];
    if (v5) {
      uint64_t v18 = 1;
    }
    else {
      uint64_t v18 = 2;
    }
    v19 = +[NSNumber numberWithUnsignedInteger:v18];
    [v17 setProperty:v19 forKey:@"kLocalizedSwipeDirection"];

    v20 = [(SwipeOptionsController *)self _rightSwipeValues];
    v21 = [(SwipeOptionsController *)self _rightSwipeValues];
    v22 = [(SwipeOptionsController *)self _titlesForSwipeValues:v21];
    [v17 setValues:v20 titles:v22];

    v23 = +[PSSpecifier groupSpecifierWithID:0];
    v31[0] = v23;
    v24 = [(SwipeOptionsController *)self _diagramSpecifierWithSwipeDirection:1];
    v31[1] = v24;
    v31[2] = v9;
    v25 = +[PSSpecifier groupSpecifierWithID:0];
    v31[3] = v25;
    v26 = [(SwipeOptionsController *)self _diagramSpecifierWithSwipeDirection:2];
    v31[4] = v26;
    v31[5] = v17;
    uint64_t v27 = +[NSArray arrayWithObjects:v31 count:6];
    v28 = (void **)&self->PSListController_opaque[v3];
    v29 = *v28;
    *v28 = (void *)v27;

    v4 = *v28;
  }

  return v4;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 row])
  {
    v11.receiver = self;
    v11.super_class = (Class)SwipeOptionsController;
    [(SwipeOptionsController *)&v11 tableView:v6 heightForRowAtIndexPath:v7];
    double v9 = v8;
  }
  else
  {
    double v9 = 124.0;
  }

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)SwipeOptionsController;
  id v7 = [(SwipeOptionsController *)&v9 tableView:a3 cellForRowAtIndexPath:v6];
  if (![v6 row]) {
    [(SwipeOptionsController *)self _configureSwipeDiagramInCell:v7 atIndexPath:v6];
  }

  return v7;
}

- (void)_configureSwipeDiagramInCell:(id)a3 atIndexPath:(id)a4
{
  id v29 = a3;
  v4 = [v29 contentView];
  unsigned int v5 = [v4 subviews];
  [v5 makeObjectsPerformSelector:"removeFromSuperview"];

  id v6 = [v29 specifier];
  id v7 = [v6 propertyForKey:@"kSwipeDirection"];
  double v8 = (char *)[v7 integerValue];

  objc_super v9 = @"left";
  if (v8 == (unsigned char *)&dword_0 + 2) {
    objc_super v9 = @"right";
  }
  uint64_t v10 = v9;
  uint64_t v27 = +[NSString stringWithFormat:@"swipe-%@-gray-part.png", v10];
  objc_super v11 = +[NSBundle bundleForClass:objc_opt_class()];
  v12 = +[UIImage imageNamed:v27 inBundle:v11];
  v13 = [v12 imageWithRenderingMode:2];
  v28 = [v13 imageFlippedForRightToLeftLayoutDirection];

  id v14 = [objc_alloc((Class)UIImageView) initWithImage:v28];
  [v14 setAutoresizingMask:18];
  [v14 setContentMode:4];
  v15 = [v29 contentView];
  [v15 bounds];
  objc_msgSend(v14, "setFrame:");

  v16 = +[UIColor colorWithRed:0.78 green:0.78 blue:0.8 alpha:1.0];
  [v14 setTintColor:v16];

  v17 = [v29 contentView];
  [v17 addSubview:v14];

  uint64_t v18 = +[NSString stringWithFormat:@"swipe-%@-blue-part.png", v10];
  v19 = +[NSBundle bundleForClass:objc_opt_class()];
  v20 = +[UIImage imageNamed:v18 inBundle:v19];
  v21 = [v20 imageWithRenderingMode:2];
  v22 = [v21 imageFlippedForRightToLeftLayoutDirection];

  id v23 = [objc_alloc((Class)UIImageView) initWithImage:v22];
  [v23 setAutoresizingMask:18];
  [v23 setContentMode:4];
  v24 = [v29 contentView];
  [v24 bounds];
  objc_msgSend(v23, "setFrame:");

  v25 = +[UIColor mailInteractiveColor];
  [v23 setTintColor:v25];

  v26 = [v29 contentView];
  [v26 addSubview:v23];
}

- (id)leftSwipeAction:(id)a3
{
  sub_1F650(@"RightEdgeSwipeAction");
  uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3) {
    uint64_t v3 = @"SwipeActionFlag";
  }
  unsigned int v5 = v3;

  return v5;
}

- (void)setLeftSwipeAction:(id)a3 withSpecifier:(id)a4
{
}

- (id)rightSwipeAction:(id)a3
{
  sub_1F650(@"LeftEdgeSwipeAction");
  uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3) {
    uint64_t v3 = @"SwipeActionRead";
  }
  unsigned int v5 = v3;

  return v5;
}

- (void)setRightSwipeAction:(id)a3 withSpecifier:(id)a4
{
  id v5 = a3;
  sub_1F6EC(@"LeftEdgeSwipeAction", (uint64_t)v5);
  v4 = +[MFNanoBridgeSettingsManager sharedInstance];
  [v4 notifyMobileMailSwipeRightActionChanged];
}

- (id)_baseSwipeValues
{
  v5[0] = @"SwipeActionNone";
  v5[1] = @"SwipeActionRead";
  v5[2] = @"SwipeActionFlag";
  v5[3] = @"SwipeActionMove";
  unsigned int v2 = +[NSArray arrayWithObjects:v5 count:4];
  id v3 = [v2 mutableCopy];

  return v3;
}

- (id)_rightSwipeValues
{
  unsigned int v2 = [(SwipeOptionsController *)self _baseSwipeValues];
  [v2 addObject:@"SwipeActionAlternateDestructiveAction"];

  return v2;
}

- (id)_titlesForSwipeValues:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        objc_super v11 = [(SwipeOptionsController *)self swipeActionsAndTitles];
        v12 = [v11 objectForKey:v10];
        [v5 addObject:v12];
      }
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v5;
}

- (id)swipeActionsAndTitles
{
  swipeActionsAndTitles = self->_swipeActionsAndTitles;
  if (!swipeActionsAndTitles)
  {
    v21[0] = @"SwipeActionNone";
    v20 = +[NSBundle bundleForClass:objc_opt_class()];
    v19 = [v20 localizedStringForKey:@"SWIPE_ACTIONS_NONE" value:&stru_39200 table:@"Preferences"];
    v22[0] = v19;
    v21[1] = @"SwipeActionRead";
    long long v17 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v18 = [v17 localizedStringForKey:@"SWIPE_ACTIONS_READ" value:&stru_39200 table:@"Preferences"];
    v22[1] = v18;
    v21[2] = @"SwipeActionFlag";
    long long v15 = +[NSBundle bundleForClass:objc_opt_class()];
    long long v16 = [v15 localizedStringForKey:@"SWIPE_ACTIONS_FLAG" value:&stru_39200 table:@"Preferences"];
    v22[2] = v16;
    v21[3] = @"SwipeActionMove";
    id v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v5 = [v4 localizedStringForKey:@"SWIPE_ACTIONS_MOVE" value:&stru_39200 table:@"Preferences"];
    v22[3] = v5;
    v21[4] = @"SwipeActionArchive";
    id v6 = +[NSBundle bundleForClass:objc_opt_class()];
    id v7 = [v6 localizedStringForKey:@"SWIPE_ACTIONS_ARCHIVE" value:&stru_39200 table:@"Preferences"];
    v22[4] = v7;
    v21[5] = @"SwipeActionTrash";
    uint64_t v8 = +[NSBundle bundleForClass:objc_opt_class()];
    objc_super v9 = [v8 localizedStringForKey:@"SWIPE_ACTIONS_TRASH" value:&stru_39200 table:@"Preferences"];
    v22[5] = v9;
    v21[6] = @"SwipeActionAlternateDestructiveAction";
    uint64_t v10 = +[NSBundle bundleForClass:objc_opt_class()];
    objc_super v11 = [v10 localizedStringForKey:@"SWIPE_ACTIONS_ARCHIVE" value:&stru_39200 table:@"Preferences"];
    v22[6] = v11;
    v12 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:7];
    v13 = self->_swipeActionsAndTitles;
    self->_swipeActionsAndTitles = v12;

    swipeActionsAndTitles = self->_swipeActionsAndTitles;
  }

  return swipeActionsAndTitles;
}

- (void).cxx_destruct
{
}

@end