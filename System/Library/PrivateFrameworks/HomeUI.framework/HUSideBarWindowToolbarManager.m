@interface HUSideBarWindowToolbarManager
+ (id)sharedToolbarManager;
- (BOOL)shouldIncludeRoomsInHomeMenu;
- (BOOL)shouldUseDarkWindowAppearance;
- (HOAppNavigator)appNavigator;
- (HUDashboardContext)dashboardContext;
- (HUSideBarWindowToolbarManager)initWithAppNavigator:(id)a3;
- (HUSideBarWindowToolbarManagerDelegate)delegate;
- (NSArray)dashboardStatusItems;
- (NSString)tabIdentifier;
- (SEL)actionForToolbarItemIdentifier:(id)a3;
- (id)accessibilityLabelForToolbarItemIdentifier:(id)a3;
- (id)currentHome;
- (id)editActionDelegateForNavigationBarButton:(id)a3;
- (id)imageForToolbarItemIdentifier:(id)a3;
- (id)initForTest;
- (id)itemIdentifiersForToolbar;
- (id)navigationBarButtonForToolbarItemIdentifier:(id)a3;
- (id)roomForNavigationBarButton:(id)a3;
- (id)statusItemsForNavigationBarButton:(id)a3 inHome:(id)a4;
- (id)windowTitle;
- (unint64_t)discoverTabPosition;
- (unint64_t)discoverTabStyle;
- (unint64_t)toolbarItemStyleForToolbarItemIdentifier:(id)a3;
- (unint64_t)viewStyle;
- (void)_discoverTabBackButton;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)home:(id)a3 didUpdateNameForRoom:(id)a4;
- (void)homeDidUpdateName:(id)a3;
- (void)homeManager:(id)a3 didAddHome:(id)a4;
- (void)homeManager:(id)a3 didRemoveHome:(id)a4;
- (void)homeManager:(id)a3 didUpdateStateForIncomingInvitations:(id)a4;
- (void)homeManagerDidUpdateCurrentHome:(id)a3;
- (void)setAppNavigator:(id)a3;
- (void)setDashboardContext:(id)a3;
- (void)setDashboardStatusItems:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDiscoverTabPosition:(unint64_t)a3;
- (void)setDiscoverTabStyle:(unint64_t)a3;
- (void)setTabIdentifier:(id)a3;
- (void)setViewStyle:(unint64_t)a3;
@end

@implementation HUSideBarWindowToolbarManager

+ (id)sharedToolbarManager
{
  return (id)sharedToolbarManager;
}

- (id)initForTest
{
  v3.receiver = self;
  v3.super_class = (Class)HUSideBarWindowToolbarManager;
  return [(HUSideBarWindowToolbarManager *)&v3 init];
}

- (HUSideBarWindowToolbarManager)initWithAppNavigator:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HUSideBarWindowToolbarManager;
  v6 = [(HUSideBarWindowToolbarManager *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_appNavigator, a3);
    v8 = [MEMORY[0x1E4F695B8] sharedInstance];
    uint64_t v9 = [v8 selectedHomeAppTabIdentifier];
    tabIdentifier = v7->_tabIdentifier;
    v7->_tabIdentifier = (NSString *)v9;

    v11 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    [v11 addHomeManagerObserver:v7];

    v12 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    [v12 addHomeObserver:v7];

    objc_storeStrong((id *)&sharedToolbarManager, v7);
  }

  return v7;
}

- (id)currentHome
{
  objc_super v3 = [(HUSideBarWindowToolbarManager *)self tabIdentifier];
  if ([v3 isEqualToString:*MEMORY[0x1E4F684F8]])
  {

LABEL_4:
    id v5 = [(HUSideBarWindowToolbarManager *)self dashboardContext];
    goto LABEL_6;
  }
  char v4 = [MEMORY[0x1E4F69758] isInternalTest];

  if (v4) {
    goto LABEL_4;
  }
  id v5 = [MEMORY[0x1E4F691A0] sharedDispatcher];
LABEL_6:
  v6 = v5;
  v7 = [v5 home];

  return v7;
}

- (void)setTabIdentifier:(id)a3
{
  id v9 = a3;
  BOOL v5 = [(NSString *)self->_tabIdentifier isEqualToString:v9];
  v6 = v9;
  if (!v5)
  {
    if (([v9 isEqualToString:*MEMORY[0x1E4F684F8]] & 1) == 0)
    {
      dashboardContext = self->_dashboardContext;
      self->_dashboardContext = 0;
    }
    objc_storeStrong((id *)&self->_tabIdentifier, a3);
    v8 = [(HUSideBarWindowToolbarManager *)self delegate];
    [v8 resetToolbar];

    v6 = v9;
  }
}

- (void)setDashboardContext:(id)a3
{
  id v7 = a3;
  if (!-[HUDashboardContext isEqual:](self->_dashboardContext, "isEqual:"))
  {
    dashboardStatusItems = self->_dashboardStatusItems;
    self->_dashboardStatusItems = 0;

    objc_storeStrong((id *)&self->_dashboardContext, a3);
    v6 = [(HUSideBarWindowToolbarManager *)self delegate];
    [v6 resetToolbar];
  }
}

- (void)setDashboardStatusItems:(id)a3
{
  id v6 = a3;
  if ((-[NSArray isEqual:](self->_dashboardStatusItems, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_dashboardStatusItems, a3);
    BOOL v5 = [(HUSideBarWindowToolbarManager *)self delegate];
    [v5 resetToolbar];
  }
}

- (void)setDiscoverTabStyle:(unint64_t)a3
{
  if (self->_discoverTabStyle != a3)
  {
    self->_discoverTabStyle = a3;
    id v3 = [(HUSideBarWindowToolbarManager *)self delegate];
    [v3 resetToolbar];
  }
}

- (void)setDiscoverTabPosition:(unint64_t)a3
{
  if (self->_discoverTabPosition != a3)
  {
    self->_discoverTabPosition = a3;
    id v3 = [(HUSideBarWindowToolbarManager *)self delegate];
    [v3 resetToolbarTitleStyle];
  }
}

- (void)setViewStyle:(unint64_t)a3
{
  if (self->_viewStyle != a3)
  {
    self->_viewStyle = a3;
    id v3 = [(HUSideBarWindowToolbarManager *)self delegate];
    [v3 resetToolbar];
  }
}

- (id)itemIdentifiersForToolbar
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(HUSideBarWindowToolbarManager *)self viewStyle] == 1) {
    goto LABEL_23;
  }
  char v4 = [(HUSideBarWindowToolbarManager *)self dashboardContext];
  BOOL v5 = [v4 room];
  if (v5)
  {
  }
  else
  {
    id v6 = [(HUSideBarWindowToolbarManager *)self dashboardContext];
    id v7 = [v6 overrideDashboardTitle];

    if (!v7) {
      goto LABEL_6;
    }
  }
  [v3 addObject:@"DashboardTabBackButtonToolbarItemIdentifier"];
LABEL_6:
  v8 = [(HUSideBarWindowToolbarManager *)self tabIdentifier];
  if ([v8 isEqualToString:*MEMORY[0x1E4F684F0]])
  {
    unint64_t v9 = [(HUSideBarWindowToolbarManager *)self discoverTabStyle];

    if (v9 == 2) {
      [v3 addObject:@"DiscoverTabBackButtonToolbarItemIdentifier"];
    }
  }
  else
  {
  }
  v10 = [(HUSideBarWindowToolbarManager *)self tabIdentifier];
  uint64_t v11 = *MEMORY[0x1E4F684F8];
  if ([v10 isEqualToString:*MEMORY[0x1E4F684F8]])
  {

    goto LABEL_13;
  }
  v12 = [(HUSideBarWindowToolbarManager *)self tabIdentifier];
  int v13 = [v12 isEqualToString:*MEMORY[0x1E4F68500]];

  if (v13)
  {
LABEL_13:
    objc_super v14 = [(HUSideBarWindowToolbarManager *)self currentHome];
    if (objc_msgSend(v14, "hf_currentUserIsAdministrator"))
    {
      v15 = [(HUSideBarWindowToolbarManager *)self dashboardContext];
      v16 = [v15 home];
      char v17 = objc_msgSend(v16, "hf_shouldBlockCurrentUserFromHome");

      if ((v17 & 1) == 0) {
        [v3 addObject:@"AddMenuToolbarItemIdentifier"];
      }
    }
    else
    {
    }
  }
  v18 = [(HUSideBarWindowToolbarManager *)self tabIdentifier];
  int v19 = [v18 isEqualToString:v11];

  if (!v19) {
    goto LABEL_23;
  }
  v20 = [(HUSideBarWindowToolbarManager *)self dashboardContext];
  v21 = [v20 room];

  if (v21)
  {
    v22 = @"RoomMenuToolbarItemIdentifier";
  }
  else
  {
    v23 = [(HUSideBarWindowToolbarManager *)self dashboardContext];
    v24 = [v23 home];

    if (!v24) {
      goto LABEL_23;
    }
    v22 = @"HomeMenuToolbarItemIdentifier";
  }
  [v3 addObject:v22];
LABEL_23:

  return v3;
}

- (SEL)actionForToolbarItemIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DiscoverTabBackButtonToolbarItemIdentifier"])
  {
    char v4 = sel__discoverTabBackButton;
  }
  else if ([v3 isEqualToString:@"DashboardTabBackButtonToolbarItemIdentifier"])
  {
    char v4 = sel__dashboardTabBackButton;
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (id)imageForToolbarItemIdentifier:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"DiscoverTabBackButtonToolbarItemIdentifier"] & 1) != 0
    || [v3 isEqualToString:@"DashboardTabBackButtonToolbarItemIdentifier"])
  {
    char v4 = [MEMORY[0x1E4F42A80] systemImageNamed:@"chevron.left"];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (id)navigationBarButtonForToolbarItemIdentifier:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"HomeMenuToolbarItemIdentifier"] & 1) == 0
    && ![v4 isEqualToString:@"RoomMenuToolbarItemIdentifier"])
  {
    if (![v4 isEqualToString:@"AddMenuToolbarItemIdentifier"])
    {
      int v13 = [(HUSideBarWindowToolbarManager *)self imageForToolbarItemIdentifier:v4];
      objc_super v14 = [(HUSideBarWindowToolbarManager *)self actionForToolbarItemIdentifier:v4];
      if (v14) {
        v15 = self;
      }
      else {
        v15 = 0;
      }
      v16 = (objc_class *)MEMORY[0x1E4F427C0];
      char v17 = v15;
      v12 = (void *)[[v16 alloc] initWithImage:v13 style:0 target:v17 action:v14];

      goto LABEL_17;
    }
    uint64_t v8 = +[HUNavigationBarButton addButtonWithOwner:self];
    goto LABEL_10;
  }
  BOOL v5 = [(HUSideBarWindowToolbarManager *)self dashboardContext];

  if (!v5)
  {
    unint64_t v9 = HFLogForCategory();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    __int16 v20 = 0;
    v10 = "stop home button creation due to no dashboard context found";
    uint64_t v11 = (uint8_t *)&v20;
LABEL_21:
    _os_log_error_impl(&dword_1BE345000, v9, OS_LOG_TYPE_ERROR, v10, v11, 2u);
    goto LABEL_12;
  }
  id v6 = [(HUSideBarWindowToolbarManager *)self dashboardContext];
  id v7 = [v6 home];

  if (v7)
  {
    uint64_t v8 = +[HUNavigationBarButton homeButtonWithOwner:self];
LABEL_10:
    v12 = (void *)v8;
    goto LABEL_17;
  }
  unint64_t v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    __int16 v19 = 0;
    v10 = "stop home button creation due to no home found on dashboard context";
    uint64_t v11 = (uint8_t *)&v19;
    goto LABEL_21;
  }
LABEL_12:

  v12 = 0;
LABEL_17:

  return v12;
}

- (BOOL)shouldUseDarkWindowAppearance
{
  v2 = [(HUSideBarWindowToolbarManager *)self tabIdentifier];
  char v3 = [v2 isEqualToString:*MEMORY[0x1E4F684F8]];

  return v3;
}

- (id)accessibilityLabelForToolbarItemIdentifier:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"HomeMenuToolbarItemIdentifier"] & 1) != 0
    || ([v3 isEqualToString:@"RoomMenuToolbarItemIdentifier"] & 1) != 0
    || ([v3 isEqualToString:@"AddMenuToolbarItemIdentifier"] & 1) != 0
    || ([v3 isEqualToString:@"DiscoverTabBackButtonToolbarItemIdentifier"] & 1) != 0
    || [v3 isEqualToString:@"DashboardTabBackButtonToolbarItemIdentifier"])
  {
    id v4 = HFLocalizedString();
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)windowTitle
{
  if ([(HUSideBarWindowToolbarManager *)self viewStyle] == 1) {
    goto LABEL_2;
  }
  id v4 = [(HUSideBarWindowToolbarManager *)self tabIdentifier];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F684F8]];

  if (!v5)
  {
    v10 = [(HUSideBarWindowToolbarManager *)self tabIdentifier];
    int v11 = [v10 isEqualToString:*MEMORY[0x1E4F68500]];

    if (v11)
    {
      v12 = [(HUSideBarWindowToolbarManager *)self currentHome];
      if (objc_msgSend(v12, "hf_userCanCreateTrigger"))
      {

LABEL_15:
        id v3 = HFLocalizedString();
        goto LABEL_20;
      }
      char v17 = HFForceAllowAutomationCreation();

      if (v17) {
        goto LABEL_15;
      }
    }
    else
    {
      int v13 = [(HUSideBarWindowToolbarManager *)self tabIdentifier];
      if ([v13 isEqualToString:*MEMORY[0x1E4F684F0]])
      {
        unint64_t v14 = [(HUSideBarWindowToolbarManager *)self discoverTabStyle];

        if (!v14) {
          goto LABEL_15;
        }
      }
      else
      {
      }
    }
LABEL_2:
    id v3 = 0;
    goto LABEL_20;
  }
  id v6 = [(HUSideBarWindowToolbarManager *)self dashboardContext];
  id v7 = [v6 overrideDashboardTitle];

  uint64_t v8 = [(HUSideBarWindowToolbarManager *)self dashboardContext];
  unint64_t v9 = v8;
  if (v7)
  {
    id v3 = [v8 overrideDashboardTitle];
  }
  else
  {
    v15 = [v8 room];

    v16 = [(HUSideBarWindowToolbarManager *)self dashboardContext];
    unint64_t v9 = v16;
    if (v15) {
      [v16 room];
    }
    else {
    v18 = [v16 home];
    }
    id v3 = objc_msgSend(v18, "hf_displayName");
  }
LABEL_20:

  return v3;
}

- (unint64_t)toolbarItemStyleForToolbarItemIdentifier:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"HomeMenuToolbarItemIdentifier"] & 1) != 0
    || ([v3 isEqualToString:@"RoomMenuToolbarItemIdentifier"] & 1) != 0)
  {
    unint64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"DiscoverTabBackButtonToolbarItemIdentifier"])
  {
    unint64_t v4 = 1;
  }
  else
  {
    unint64_t v4 = [v3 isEqualToString:@"DashboardTabBackButtonToolbarItemIdentifier"];
  }

  return v4;
}

- (void)_discoverTabBackButton
{
  [(HUSideBarWindowToolbarManager *)self setDiscoverTabStyle:1];
  id v5 = objc_alloc_init(MEMORY[0x1E4F39D18]);
  [v5 setDuration:0.5];
  [v5 setType:*MEMORY[0x1E4F3A5D0]];
  [v5 setSubtype:*MEMORY[0x1E4F3A5C0]];
  id v3 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v5 setTimingFunction:v3];

  [v5 setDelegate:self];
  unint64_t v4 = [(HUSideBarWindowToolbarManager *)self delegate];
  [v4 dismissViewControllerWithAnimation:v5];
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  if (a4) {
    [(HUSideBarWindowToolbarManager *)self setDiscoverTabStyle:0];
  }
}

- (id)roomForNavigationBarButton:(id)a3
{
  id v3 = [(HUSideBarWindowToolbarManager *)self dashboardContext];
  unint64_t v4 = [v3 room];

  return v4;
}

- (BOOL)shouldIncludeRoomsInHomeMenu
{
  return 0;
}

- (id)statusItemsForNavigationBarButton:(id)a3 inHome:(id)a4
{
  unint64_t v4 = [(HUSideBarWindowToolbarManager *)self dashboardStatusItems];
  id v5 = v4;
  if (!v4) {
    unint64_t v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v6 = v4;

  return v6;
}

- (id)editActionDelegateForNavigationBarButton:(id)a3
{
  if (_os_feature_enabled_impl() && _os_feature_enabled_impl())
  {
    objc_opt_class();
    unint64_t v4 = [(HUSideBarWindowToolbarManager *)self appNavigator];
    id v5 = [v4 rootViewController];
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;

    objc_opt_class();
    uint64_t v8 = [v7 selectedViewController];
  }
  else
  {
    objc_opt_class();
    unint64_t v9 = [(HUSideBarWindowToolbarManager *)self appNavigator];
    v10 = [v9 rootViewController];
    if (objc_opt_isKindOfClass()) {
      int v11 = v10;
    }
    else {
      int v11 = 0;
    }
    id v7 = v11;

    objc_opt_class();
    uint64_t v8 = [v7 viewControllerForColumn:2];
  }
  v12 = (void *)v8;

  if (objc_opt_isKindOfClass()) {
    int v13 = v12;
  }
  else {
    int v13 = 0;
  }
  id v14 = v13;

  return v14;
}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  id v4 = [(HUSideBarWindowToolbarManager *)self delegate];
  [v4 resetToolbarItemMenuForItemIdentifier:@"HomeMenuToolbarItemIdentifier"];
}

- (void)homeManager:(id)a3 didRemoveHome:(id)a4
{
  id v4 = [(HUSideBarWindowToolbarManager *)self delegate];
  [v4 resetToolbarItemMenuForItemIdentifier:@"HomeMenuToolbarItemIdentifier"];
}

- (void)homeManagerDidUpdateCurrentHome:(id)a3
{
  id v3 = [(HUSideBarWindowToolbarManager *)self delegate];
  [v3 resetToolbarItemMenuForItemIdentifier:@"HomeMenuToolbarItemIdentifier"];
}

- (void)homeDidUpdateName:(id)a3
{
  id v4 = [(HUSideBarWindowToolbarManager *)self delegate];
  [v4 resetToolbarItemMenuForItemIdentifier:@"HomeMenuToolbarItemIdentifier"];

  id v5 = [(HUSideBarWindowToolbarManager *)self delegate];
  [v5 resetToolbarTitle];
}

- (void)homeManager:(id)a3 didUpdateStateForIncomingInvitations:(id)a4
{
  id v4 = [(HUSideBarWindowToolbarManager *)self delegate];
  [v4 resetToolbarItemMenuForItemIdentifier:@"HomeMenuToolbarItemIdentifier"];
}

- (void)home:(id)a3 didUpdateNameForRoom:(id)a4
{
  id v4 = [(HUSideBarWindowToolbarManager *)self delegate];
  [v4 resetToolbarTitle];
}

- (NSString)tabIdentifier
{
  return self->_tabIdentifier;
}

- (HUDashboardContext)dashboardContext
{
  return self->_dashboardContext;
}

- (NSArray)dashboardStatusItems
{
  return self->_dashboardStatusItems;
}

- (unint64_t)discoverTabStyle
{
  return self->_discoverTabStyle;
}

- (unint64_t)discoverTabPosition
{
  return self->_discoverTabPosition;
}

- (unint64_t)viewStyle
{
  return self->_viewStyle;
}

- (HUSideBarWindowToolbarManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUSideBarWindowToolbarManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HOAppNavigator)appNavigator
{
  return self->_appNavigator;
}

- (void)setAppNavigator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appNavigator, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dashboardStatusItems, 0);
  objc_storeStrong((id *)&self->_dashboardContext, 0);

  objc_storeStrong((id *)&self->_tabIdentifier, 0);
}

@end