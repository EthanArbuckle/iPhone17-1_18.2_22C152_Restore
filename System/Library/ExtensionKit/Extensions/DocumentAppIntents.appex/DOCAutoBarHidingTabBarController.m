@interface DOCAutoBarHidingTabBarController
+ (BOOL)disableWorkaroundFor123787016;
- (BOOL)forceBarHidden;
- (BOOL)neverAllowShowingSystemTabs;
- (BOOL)safeAreaUpdatesDisabledDuringTransitions;
- (BOOL)usingSharedSplitBrowserStrategy;
- (NSNumber)soleValidIndex;
- (UIAction)floatingTabBarSidebarToggleAction;
- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4;
- (UIViewController)tabViewControllerBeingSelected;
- (id)_selectedOrInflightSelectedViewController;
- (id)_underlyingSelectedViewController;
- (unint64_t)selectedOrInflightSelectedTab;
- (void)_performWhileNotingInflightSelectedViewController:(id)a3 block:(id)a4;
- (void)_setSelectedViewController:(id)a3;
- (void)_showBarWithTransition:(int)a3 isExplicit:(BOOL)a4 duration:(double)a5;
- (void)_updateBarVisibility;
- (void)_updateBarVisibilityAnimated:(BOOL)a3;
- (void)hideBar;
- (void)loadViewControllers:(id)a3 initialIndex:(unint64_t)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setFloatingTabBarSidebarToggleAction:(id)a3;
- (void)setForceBarHidden:(BOOL)a3;
- (void)setNeverAllowShowingSystemTabs:(BOOL)a3;
- (void)setSafeAreaUpdatesDisabledDuringTransitions:(BOOL)a3;
- (void)setSoleValidIndex:(id)a3;
- (void)setTabViewControllerBeingSelected:(id)a3;
- (void)setUsingSharedSplitBrowserStrategy:(BOOL)a3;
- (void)showBarIfAllowed;
- (void)viewDidLoad;
@end

@implementation DOCAutoBarHidingTabBarController

- (void)setNeverAllowShowingSystemTabs:(BOOL)a3
{
  if (self->_neverAllowShowingSystemTabs != a3)
  {
    self->_neverAllowShowingSystemTabs = a3;
    [(DOCAutoBarHidingTabBarController *)self _updateBarVisibility];
  }
}

- (void)setSoleValidIndex:(id)a3
{
  v5 = (NSNumber *)a3;
  soleValidIndex = self->_soleValidIndex;
  if (soleValidIndex != v5)
  {
    BOOL v7 = soleValidIndex != 0;
    BOOL v8 = v5 == 0;
    v10 = v5;
    objc_storeStrong((id *)&self->_soleValidIndex, a3);
    v5 = v10;
    if (((v8 ^ v7) & 1) == 0)
    {
      if (v10)
      {
        id v9 = [(NSNumber *)self->_soleValidIndex unsignedIntegerValue];
        if (v9 != [(DOCAutoBarHidingTabBarController *)self selectedIndex]) {
          [(DOCAutoBarHidingTabBarController *)self setSelectedIndex:v9];
        }
      }
      [(DOCAutoBarHidingTabBarController *)self _updateBarVisibility];
      v5 = v10;
    }
  }
}

- (id)_selectedOrInflightSelectedViewController
{
  tabViewControllerBeingSelected = self->_tabViewControllerBeingSelected;
  if (tabViewControllerBeingSelected)
  {
    v3 = tabViewControllerBeingSelected;
  }
  else
  {
    v3 = [(DOCAutoBarHidingTabBarController *)self _underlyingSelectedViewController];
  }

  return v3;
}

- (unint64_t)selectedOrInflightSelectedTab
{
  v2 = [(DOCAutoBarHidingTabBarController *)self _selectedOrInflightSelectedViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v2 actualViewController];

    v2 = (void *)v3;
  }
  v4 = [v2 tabBarItem];
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = [v4 tab];
  }
  else
  {
    DOCLogAssertionFailure();
    id v5 = 0;
  }

  return (unint64_t)v5;
}

- (void)hideBar
{
  self->_forceBarHidden = 1;
  [(DOCAutoBarHidingTabBarController *)self _updateBarVisibilityAnimated:1];
}

- (void)showBarIfAllowed
{
  uint64_t v3 = +[UIKeyboard isOnScreen] ^ 1;
  self->_forceBarHidden = 0;

  [(DOCAutoBarHidingTabBarController *)self _updateBarVisibilityAnimated:v3];
}

- (void)_updateBarVisibility
{
  BOOL v3 = [(DOCAutoBarHidingTabBarController *)self _appearState] == 2;

  [(DOCAutoBarHidingTabBarController *)self _updateBarVisibilityAnimated:v3];
}

- (void)_updateBarVisibilityAnimated:(BOOL)a3
{
  BOOL v4 = a3 && +[UIView areAnimationsEnabled];
  if (self->_soleValidIndex || self->_neverAllowShowingSystemTabs)
  {
    if ([(DOCAutoBarHidingTabBarController *)self _uip_isTabBarHidden]) {
      return;
    }
    LOBYTE(forceBarHidden) = 1;
  }
  else
  {
    int forceBarHidden = self->_forceBarHidden;
    if (forceBarHidden == [(DOCAutoBarHidingTabBarController *)self _uip_isTabBarHidden])return; {
  }
    }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001C970;
  v6[3] = &unk_1005E4D98;
  v6[4] = self;
  char v7 = forceBarHidden;
  BOOL v8 = v4;
  +[UIView doc_performAllowingAnimations:v4 block:v6];
}

- (void)_showBarWithTransition:(int)a3 isExplicit:(BOOL)a4 duration:(double)a5
{
  BOOL v6 = a4;
  uint64_t v7 = *(void *)&a3;
  if (![(DOCAutoBarHidingTabBarController *)self neverAllowShowingSystemTabs])
  {
    v9.receiver = self;
    v9.super_class = (Class)DOCAutoBarHidingTabBarController;
    [(DOCAutoBarHidingTabBarController *)&v9 _showBarWithTransition:v7 isExplicit:v6 duration:a5];
  }
}

- (id)_underlyingSelectedViewController
{
  return [(DOCAutoBarHidingTabBarController *)self selectedViewController];
}

- (void)_setSelectedViewController:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "doc_isAppearing"))
  {
    id v5 = [(DOCAutoBarHidingTabBarController *)self _underlyingSelectedViewController];

    if (v5 != v4)
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10001CC4C;
      v19[3] = &unk_1005E45A8;
      id v20 = v4;
      +[UIViewController doc_performWithDeferredTransitionsAndAnimationsDisabled:v19];
    }
  }
  soleValidIndex = self->_soleValidIndex;
  if (soleValidIndex)
  {
    id v7 = [(NSNumber *)soleValidIndex unsignedIntegerValue];
    BOOL v8 = [(DOCAutoBarHidingTabBarController *)self viewControllers];
    id v9 = [v8 indexOfObject:v4];

    if (v9 != v7) {
      DOCLogAssertionFailure();
    }
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001CC90;
  v17[3] = &unk_1005E4558;
  v17[4] = self;
  id v10 = v4;
  id v18 = v10;
  v11 = objc_retainBlock(v17);
  BOOL usingSharedSplitBrowserStrategy = self->_usingSharedSplitBrowserStrategy;
  unsigned int v13 = [(DOCAutoBarHidingTabBarController *)self enclosedInUIPDocumentLanding];
  BOOL v14 = !usingSharedSplitBrowserStrategy && v13 == 0;
  if (v14 || ([(id)objc_opt_class() disableWorkaroundFor123787016] & 1) != 0)
  {
    ((void (*)(void *))v11[2])(v11);
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10001CD60;
    v15[3] = &unk_1005E4870;
    v16 = v11;
    +[UIView performWithoutAnimation:v15];
  }
}

- (void)_performWhileNotingInflightSelectedViewController:(id)a3 block:(id)a4
{
  id v11 = a3;
  p_tabViewControllerBeingSelected = &self->_tabViewControllerBeingSelected;
  if (*p_tabViewControllerBeingSelected)
  {
    BOOL v8 = (void (*)(void))*((void *)a4 + 2);
    id v9 = (UIViewController *)a4;
    v8();
  }
  else
  {
    objc_storeStrong((id *)p_tabViewControllerBeingSelected, a3);
    id v10 = (void (**)(void))a4;
    v10[2]();

    id v9 = *p_tabViewControllerBeingSelected;
    *p_tabViewControllerBeingSelected = 0;
  }
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)DOCAutoBarHidingTabBarController;
  [(DOCAutoBarHidingTabBarController *)&v5 viewDidLoad];
  BOOL v3 = [(DOCAutoBarHidingTabBarController *)self tabBar];
  id v4 = [v3 layer];
  [v4 setHitTestsAsOpaque:1];
}

- (void)loadViewControllers:(id)a3 initialIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(DOCAutoBarHidingTabBarController *)self selectedIndex];
  long long v37 = 0u;
  long long v38 = 0u;
  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v8 = 0;
  }
  else {
    unint64_t v8 = (unint64_t)v7;
  }
  long long v39 = 0uLL;
  long long v40 = 0uLL;
  id v9 = [(DOCAutoBarHidingTabBarController *)self viewControllers];
  id v10 = [v9 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v38;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v38 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v37 + 1) + 8 * i) removeObserver:self forKeyPath:@"preferredContentSize"];
      }
      id v11 = [v9 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v11);
  }

  id v14 = [v6 count];
  if (a4 == 0x7FFFFFFFFFFFFFFFLL || !v14 || (unint64_t)[v6 count] <= v8)
  {
    v27 = self;
    id v28 = v6;
LABEL_25:
    [(DOCAutoBarHidingTabBarController *)v27 setViewControllers:v28 animated:0];
    goto LABEL_26;
  }
  id v15 = [v6 count];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v16 = v6;
  id v17 = [v16 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v34;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v34 != v19) {
          objc_enumerationMutation(v16);
        }
        [*(id *)(*((void *)&v33 + 1) + 8 * (void)j) addObserver:self forKeyPath:@"preferredContentSize" options:1 context:0];
      }
      id v18 = [v16 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v18);
  }

  v21 = [v16 objectAtIndexedSubscript:a4];
  [v21 preferredContentSize];
  -[DOCAutoBarHidingTabBarController setPreferredContentSize:](self, "setPreferredContentSize:");

  if (v8 == a4 || (unint64_t)v15 <= a4)
  {
    v27 = self;
    id v28 = v16;
    goto LABEL_25;
  }
  v22 = objc_opt_new();
  v23 = [v16 objectAtIndexedSubscript:v8];
  [v22 setActualViewController:v23];

  id v24 = [v16 mutableCopy];
  [v24 replaceObjectAtIndex:v8 withObject:v22];
  v25 = [v16 objectAtIndexedSubscript:a4];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10001D1D4;
  v29[3] = &unk_1005E4DC0;
  v29[4] = self;
  id v30 = v24;
  unint64_t v32 = a4;
  id v31 = v16;
  id v26 = v24;
  [(DOCAutoBarHidingTabBarController *)self _performWhileNotingInflightSelectedViewController:v25 block:v29];

LABEL_26:
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v11 = a4;
  id v8 = a3;
  id v9 = [(DOCAutoBarHidingTabBarController *)self _underlyingSelectedViewController];
  unsigned int v10 = [v8 isEqualToString:@"preferredContentSize"];

  if (v10 && v9 == v11)
  {
    [v11 preferredContentSize];
    -[DOCAutoBarHidingTabBarController setPreferredContentSize:](self, "setPreferredContentSize:");
  }
}

- (void)setFloatingTabBarSidebarToggleAction:(id)a3
{
}

- (UIAction)floatingTabBarSidebarToggleAction
{
  return (UIAction *)[(DOCAutoBarHidingTabBarController *)self _overrideTidebarButtonAction];
}

+ (BOOL)disableWorkaroundFor123787016
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"DisableWorkaroundFor123787016"];

  return v3;
}

- (NSNumber)soleValidIndex
{
  return self->_soleValidIndex;
}

- (BOOL)neverAllowShowingSystemTabs
{
  return self->_neverAllowShowingSystemTabs;
}

- (BOOL)safeAreaUpdatesDisabledDuringTransitions
{
  return self->_safeAreaUpdatesDisabledDuringTransitions;
}

- (void)setSafeAreaUpdatesDisabledDuringTransitions:(BOOL)a3
{
  self->_safeAreaUpdatesDisabledDuringTransitions = a3;
}

- (BOOL)usingSharedSplitBrowserStrategy
{
  return self->_usingSharedSplitBrowserStrategy;
}

- (void)setUsingSharedSplitBrowserStrategy:(BOOL)a3
{
  self->_BOOL usingSharedSplitBrowserStrategy = a3;
}

- (BOOL)forceBarHidden
{
  return self->_forceBarHidden;
}

- (void)setForceBarHidden:(BOOL)a3
{
  self->_int forceBarHidden = a3;
}

- (UIViewController)tabViewControllerBeingSelected
{
  return self->_tabViewControllerBeingSelected;
}

- (void)setTabViewControllerBeingSelected:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabViewControllerBeingSelected, 0);

  objc_storeStrong((id *)&self->_soleValidIndex, 0);
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  v23.receiver = self;
  v23.super_class = (Class)DOCAutoBarHidingTabBarController;
  id v6 = a3;
  id v7 = self;
  [(DOCAutoBarHidingTabBarController *)&v23 _edgeInsetsForChildViewController:v6 insetsAreAbsolute:a4];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  id v16 = [(DOCAutoBarHidingTabBarController *)v7 traitCollection];
  sub_1001B4470();
  sub_1004F5120();
  double v18 = v17;

  double v19 = v13 + v18;
  double v20 = v9;
  double v21 = v11;
  double v22 = v15;
  result.right = v22;
  result.bottom = v19;
  result.left = v21;
  result.top = v20;
  return result;
}

@end