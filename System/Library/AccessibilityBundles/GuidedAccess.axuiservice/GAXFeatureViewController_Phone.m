@interface GAXFeatureViewController_Phone
- (GAXOptionsView)optionsView;
- (id)_allFeatureViews;
- (id)_appFeatureViews;
- (id)_hardwareFeatureViews;
- (id)_timeRestrictionFeatureViews;
- (void)dismissOptionsAnimated:(BOOL)a3;
- (void)featureView:(id)a3 didChangeState:(BOOL)a4;
- (void)featureView:(id)a3 didChangeTimeRestrictionDuration:(int64_t)a4 timeRestrictionsEnabled:(BOOL)a5;
- (void)presentOptionsAnimated:(BOOL)a3;
- (void)releaseOutlets;
- (void)setOptionsView:(id)a3;
@end

@implementation GAXFeatureViewController_Phone

- (id)_allFeatureViews
{
  v3 = [(GAXFeatureViewController *)self styleProvider];
  v4 = objc_opt_new();
  v5 = [(GAXFeatureViewController_Phone *)self _hardwareFeatureViews];
  [v4 addObjectsFromArray:v5];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_29840;
  v12[3] = &unk_5DBA8;
  id v13 = v3;
  v14 = self;
  id v6 = v4;
  id v15 = v6;
  id v7 = v3;
  [(GAXFeatureViewController *)self _enumerateSystemFeatureViewsParametersUsingBlock:v12];
  if ([(GAXFeatureViewController *)self _isUsingAppRestrictions])
  {
    v8 = [(GAXFeatureViewController_Phone *)self _appFeatureViews];
    [v6 addObjectsFromArray:v8];
  }
  v9 = [(GAXFeatureViewController_Phone *)self _timeRestrictionFeatureViews];
  [v6 addObjectsFromArray:v9];

  id v10 = [v6 copy];

  return v10;
}

- (void)dismissOptionsAnimated:(BOOL)a3
{
  id v3 = [(GAXFeatureViewController_Phone *)self optionsView];
  [v3 dismissOptionsAnimated:1];
}

- (void)presentOptionsAnimated:(BOOL)a3
{
  id v8 = [(GAXFeatureViewController *)self styleProvider];
  v4 = [(GAXFeatureViewController *)self userInterfaceServer];
  v5 = [(GAXFeatureViewController_Phone *)self optionsView];
  if (!v5)
  {
    id v6 = [(GAXFeatureViewController_Phone *)self _allFeatureViews];
    v5 = [[GAXOptionsView alloc] initWithFeatureViews:v6 styleProvider:v8 userInterfaceServer:v4];
    [(GAXOptionsView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(GAXFeatureViewController_Phone *)self setOptionsView:v5];
  }
  id v7 = [(GAXFeatureViewController *)self _viewForPresentingOverlayUserInterface];
  [(GAXOptionsView *)v5 presentOptionsInView:v7 animated:1];
}

- (void)releaseOutlets
{
  v3.receiver = self;
  v3.super_class = (Class)GAXFeatureViewController_Phone;
  [(GAXViewController *)&v3 releaseOutlets];
  [(GAXFeatureViewController *)self setInstructionsLabel:0];
  [(GAXFeatureViewController *)self setInstructionsLabelWidthConstraint:0];
}

- (id)_appFeatureViews
{
  [(GAXFeatureViewController *)self styleProvider];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_29B3C;
  v7[3] = &unk_5DBD0;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = self;
  id v10 = (id)objc_opt_new();
  id v3 = v10;
  id v4 = v8;
  [(GAXFeatureViewController *)self _enumerateAppFeatureViewsParametersUsingBlock:v7];
  id v5 = [v3 copy];

  return v5;
}

- (id)_hardwareFeatureViews
{
  [(GAXFeatureViewController *)self styleProvider];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_29CAC;
  v7[3] = &unk_5DBA8;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = self;
  id v10 = (id)objc_opt_new();
  id v3 = v10;
  id v4 = v8;
  [(GAXFeatureViewController *)self _enumerateHardwareFeatureViewsParametersUsingBlock:v7];
  id v5 = [v3 copy];

  return v5;
}

- (id)_timeRestrictionFeatureViews
{
  id v3 = [(GAXFeatureViewController *)self userInterfaceServer];
  id v4 = [v3 appTimeRestrictionsEnabled];
  id v5 = [(GAXFeatureViewController *)self userInterfaceServer];
  id v6 = [v5 appTimeRestrictionDurationInMinutes];
  id v7 = [(GAXFeatureViewController *)self styleProvider];
  id v8 = +[GAXFeatureView timeRestrictionsFeatureViewWithInitialState:v4 initialDuration:v6 styleProvider:v7];

  [v8 setDelegate:self];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  v11 = v8;
  v9 = +[NSArray arrayWithObjects:&v11 count:1];

  return v9;
}

- (void)featureView:(id)a3 didChangeState:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  switch((unint64_t)[v6 type])
  {
    case 0uLL:
      id v7 = [v6 identifier];
      id v8 = [(GAXFeatureViewController *)self userInterfaceServer];
      [v8 setAppRestrictionState:v4 ^ 1 withIdentifier:v7];
      goto LABEL_10;
    case 1uLL:
      id v7 = [v6 identifier];
      goto LABEL_9;
    case 3uLL:
      id v7 = [v6 identifier];
      if ([v7 isEqualToString:@"GAXProfileAllowsTouch"])
      {
        v9 = [(GAXFeatureViewController *)self delegate];
        if (objc_opt_respondsToSelector()) {
          [v9 featureViewController:self touchSystemFeatureDidChange:v4];
        }
        id v10 = [(GAXFeatureViewController *)self styleProvider];
        [v10 defaultAnimationDuration];
        v12[1] = 3221225472;
        v12[0] = _NSConcreteStackBlock;
        v12[2] = sub_2A074;
        v12[3] = &unk_5DB80;
        void v12[4] = self;
        BOOL v13 = v4;
        +[UIView animateWithDuration:v12 animations:v11 * 0.5];
      }
LABEL_9:
      id v8 = [(GAXFeatureViewController *)self userInterfaceServer];
      [v8 setFeatureEnabled:v4 withIdentifier:v7];
LABEL_10:

      break;
    default:
      _AXLogWithFacility();
      break;
  }
}

- (void)featureView:(id)a3 didChangeTimeRestrictionDuration:(int64_t)a4 timeRestrictionsEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v9 = [(GAXFeatureViewController *)self userInterfaceServer];
  [v9 updateTimeRestrictionWithDuration:a4 enabled:v5];

  id v10 = [(GAXFeatureViewController_Phone *)self optionsView];
  [v10 setNeedsUpdateConstraints];

  double v11 = [(GAXFeatureViewController_Phone *)self optionsView];
  [v11 updateConstraintsIfNeeded];

  v12 = [(GAXFeatureViewController *)self styleProvider];
  [v12 defaultAnimationDuration];
  double v14 = v13;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_2A250;
  v20[3] = &unk_5CD28;
  v20[4] = self;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_2A294;
  v16[3] = &unk_5DBF8;
  BOOL v19 = v5;
  id v17 = v8;
  v18 = self;
  id v15 = v8;
  +[UIView animateWithDuration:v20 animations:v16 completion:v14];
}

- (GAXOptionsView)optionsView
{
  return self->_optionsView;
}

- (void)setOptionsView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end