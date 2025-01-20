@interface GAXFeatureViewController_Pad
- (BOOL)optionsViewController:(id)a3 stateForForFeatureAtIndex:(unint64_t)a4;
- (BOOL)timeRestrictiosEnabledForAppWithOptionsViewController:(id)a3;
- (id)optionsViewController:(id)a3 textForFeatureAtIndex:(unint64_t)a4;
- (int64_t)timeRestrictionDurationForAppWithOptionsViewController:(id)a3;
- (unint64_t)numberOfFeaturesInOptionsViewController:(id)a3;
- (void)dismissOptionsAnimated:(BOOL)a3;
- (void)optionsViewController:(id)a3 featureAtIndex:(unint64_t)a4 didChangeState:(BOOL)a5;
- (void)optionsViewController:(id)a3 timeRestrictionValueDidChange:(int64_t)a4 timeRestrictionsEnabled:(BOOL)a5;
- (void)presentOptionsAnimated:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation GAXFeatureViewController_Pad

- (void)dismissOptionsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(GAXOptionsViewController *)self->_optionsViewController presentingViewController];
  [v4 dismissViewControllerAnimated:v3 completion:0];
}

- (void)presentOptionsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[GAXOptionsViewController optionsViewController];
  optionsViewController = self->_optionsViewController;
  self->_optionsViewController = v5;

  [(GAXOptionsViewController *)self->_optionsViewController setDataSource:self];
  [(GAXOptionsViewController *)self->_optionsViewController setDelegate:self];
  v7 = [(GAXFeatureViewController *)self styleProvider];
  [(GAXOptionsViewController *)self->_optionsViewController setStyleProvider:v7];

  v8 = self->_optionsViewController;
  v9 = [(GAXFeatureViewController *)self userInterfaceServer];
  id v10 = [v9 appTimeRestrictionsEnabled];
  v11 = [(GAXFeatureViewController *)self userInterfaceServer];
  -[GAXOptionsViewController setTimeRestrictionsEnabled:currentDurationInMinutes:animated:](v8, "setTimeRestrictionsEnabled:currentDurationInMinutes:animated:", v10, [v11 appTimeRestrictionDurationInMinutes], 0);

  [(GAXOptionsViewController *)self->_optionsViewController initialPreferredContentSize];
  -[GAXOptionsViewController setPreferredContentSize:](self->_optionsViewController, "setPreferredContentSize:");
  id v23 = [(GAXFeatureViewController *)self _viewForPresentingOverlayUserInterface];
  v12 = [(GAXFeatureViewController *)self optionsButton];
  v13 = [(GAXFeatureViewController *)self optionsButton];
  [v13 bounds];
  objc_msgSend(v12, "convertRect:toView:", v23);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  [(GAXOptionsViewController *)self->_optionsViewController setModalPresentationStyle:7];
  v22 = [(GAXOptionsViewController *)self->_optionsViewController popoverPresentationController];
  [v22 setSourceView:v23];
  objc_msgSend(v22, "setSourceRect:", v15, v17, v19, v21);
  [v22 setPermittedArrowDirections:2];
  [(GAXFeatureViewController_Pad *)self presentViewController:self->_optionsViewController animated:v3 completion:0];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)GAXFeatureViewController_Pad;
  -[GAXFeatureViewController_Pad viewWillTransitionToSize:withTransitionCoordinator:](&v5, "viewWillTransitionToSize:withTransitionCoordinator:", a4, a3.width, a3.height);
  [(GAXFeatureViewController_Pad *)self dismissOptionsAnimated:1];
}

- (unint64_t)numberOfFeaturesInOptionsViewController:(id)a3
{
  return [(GAXFeatureViewController *)self _numFeatures];
}

- (id)optionsViewController:(id)a3 textForFeatureAtIndex:(unint64_t)a4
{
  v6 = [(GAXFeatureViewController *)self hardwareFeatureViewsParameters];
  id v7 = [v6 count];

  v8 = [(GAXFeatureViewController *)self hardwareFeatureViewsParameters];
  v9 = v8;
  if ((unint64_t)v7 > a4)
  {
    id v10 = [v8 objectAtIndexedSubscript:a4];
    v11 = [v10 objectForKeyedSubscript:@"GAXFeatureViewLocalizedTextKey"];
    v12 = GAXLocString(v11);

LABEL_7:
    goto LABEL_8;
  }
  unint64_t v13 = a4 - (void)[v8 count];

  double v14 = [(GAXFeatureViewController *)self systemFeatureViewsParameters];
  id v15 = [v14 count];

  double v16 = [(GAXFeatureViewController *)self systemFeatureViewsParameters];
  double v17 = v16;
  if (v13 < (unint64_t)v15)
  {
    double v18 = [v16 objectAtIndexedSubscript:v13];
    double v19 = [v18 objectForKeyedSubscript:@"GAXFeatureViewLocalizedTextKey"];
    v12 = GAXLocString(v19);

    goto LABEL_8;
  }
  unint64_t v20 = v13 - (void)[v16 count];

  double v21 = [(GAXFeatureViewController *)self userInterfaceServer];
  v22 = [v21 appRestrictionIdentifiers];
  id v23 = [v22 count];

  v24 = [(GAXFeatureViewController *)self userInterfaceServer];
  v25 = [v24 appRestrictionIdentifiers];
  v26 = v25;
  if (v20 < (unint64_t)v23)
  {
    v9 = [v25 objectAtIndexedSubscript:v20];

    id v10 = [(GAXFeatureViewController *)self userInterfaceServer];
    v12 = [v10 textForAppRestrictionWithIdentifier:v9];
    goto LABEL_7;
  }
  [v25 count];

  v12 = GAXLocString(@"TIME_RESTRICTION_FEATURE");
LABEL_8:

  return v12;
}

- (BOOL)optionsViewController:(id)a3 stateForForFeatureAtIndex:(unint64_t)a4
{
  v6 = [(GAXFeatureViewController *)self hardwareFeatureViewsParameters];
  id v7 = [v6 count];

  if ((unint64_t)v7 > a4)
  {
    v8 = [(GAXFeatureViewController *)self userInterfaceServer];
    v9 = [(GAXFeatureViewController *)self hardwareFeatureViewsParameters];
LABEL_5:
    unint64_t v13 = v9;
    double v14 = [v9 objectAtIndexedSubscript:a4];
    id v15 = [v14 objectForKeyedSubscript:@"GAXFeatureViewIdentifierKey"];
    unsigned __int8 v16 = [v8 isFeatureEnabledForIdentifier:v15];

    goto LABEL_6;
  }
  id v10 = [(GAXFeatureViewController *)self hardwareFeatureViewsParameters];
  a4 -= (unint64_t)[v10 count];

  v11 = [(GAXFeatureViewController *)self systemFeatureViewsParameters];
  id v12 = [v11 count];

  if (a4 < (unint64_t)v12)
  {
    v8 = [(GAXFeatureViewController *)self userInterfaceServer];
    v9 = [(GAXFeatureViewController *)self systemFeatureViewsParameters];
    goto LABEL_5;
  }
  double v18 = [(GAXFeatureViewController *)self systemFeatureViewsParameters];
  unint64_t v19 = a4 - (void)[v18 count];

  unint64_t v20 = [(GAXFeatureViewController *)self userInterfaceServer];
  double v21 = [v20 appRestrictionIdentifiers];
  id v22 = [v21 count];

  id v23 = [(GAXFeatureViewController *)self userInterfaceServer];
  v8 = v23;
  if (v19 >= (unint64_t)v22)
  {
    v26 = [v23 appRestrictionIdentifiers];
    [v26 count];

    v8 = [(GAXFeatureViewController *)self userInterfaceServer];
    unsigned __int8 v16 = [v8 appTimeRestrictionsEnabled];
    goto LABEL_7;
  }
  unint64_t v13 = [(GAXFeatureViewController *)self userInterfaceServer];
  v24 = [v13 appRestrictionIdentifiers];
  v25 = [v24 objectAtIndexedSubscript:v19];
  unsigned __int8 v16 = [v8 appRestrictionStateForIdentifier:v25] == 0;

LABEL_6:
LABEL_7:

  return v16;
}

- (int64_t)timeRestrictionDurationForAppWithOptionsViewController:(id)a3
{
  BOOL v3 = [(GAXFeatureViewController *)self userInterfaceServer];
  id v4 = [v3 appTimeRestrictionDurationInMinutes];

  return (int64_t)v4;
}

- (BOOL)timeRestrictiosEnabledForAppWithOptionsViewController:(id)a3
{
  BOOL v3 = [(GAXFeatureViewController *)self userInterfaceServer];
  unsigned __int8 v4 = [v3 appTimeRestrictionsEnabled];

  return v4;
}

- (void)optionsViewController:(id)a3 featureAtIndex:(unint64_t)a4 didChangeState:(BOOL)a5
{
  BOOL v5 = a5;
  v8 = [(GAXFeatureViewController *)self hardwareFeatureViewsParameters];
  id v9 = [v8 count];

  if ((unint64_t)v9 > a4)
  {
    id v49 = [(GAXFeatureViewController *)self userInterfaceServer];
    id v10 = [(GAXFeatureViewController *)self hardwareFeatureViewsParameters];
    v11 = [v10 objectAtIndexedSubscript:a4];
    id v12 = [v11 objectForKeyedSubscript:@"GAXFeatureViewIdentifierKey"];
    [v49 setFeatureEnabled:v5 withIdentifier:v12];

LABEL_3:

    return;
  }
  unint64_t v13 = [(GAXFeatureViewController *)self hardwareFeatureViewsParameters];
  unint64_t v14 = a4 - (void)[v13 count];

  id v15 = [(GAXFeatureViewController *)self systemFeatureViewsParameters];
  id v16 = [v15 count];

  double v17 = [(GAXFeatureViewController *)self systemFeatureViewsParameters];
  double v18 = v17;
  if (v14 >= (unint64_t)v16)
  {
    unint64_t v24 = v14 - (void)[v17 count];

    v25 = [(GAXFeatureViewController *)self userInterfaceServer];
    v26 = [v25 appRestrictionIdentifiers];
    id v27 = [v26 count];

    v28 = [(GAXFeatureViewController *)self userInterfaceServer];
    id v49 = v28;
    if (v24 < (unint64_t)v27)
    {
      id v10 = [(GAXFeatureViewController *)self userInterfaceServer];
      v29 = [v10 appRestrictionIdentifiers];
      v30 = [v29 objectAtIndexedSubscript:v24];
      [v49 setAppRestrictionState:v5 ^ 1 withIdentifier:v30];

      goto LABEL_3;
    }
    v31 = [v28 appRestrictionIdentifiers];
    [v31 count];

    v32 = [(GAXFeatureViewController *)self userInterfaceServer];
    id v33 = [v32 appTimeRestrictionDurationInMinutes];

    if (v5 && (uint64_t)v33 < 1) {
      uint64_t v34 = 1;
    }
    else {
      uint64_t v34 = (uint64_t)v33;
    }
    [(GAXOptionsViewController *)self->_optionsViewController setTimeRestrictionsEnabled:v5 currentDurationInMinutes:v34 animated:1];
    v35 = [(GAXFeatureViewController *)self userInterfaceServer];
    [v35 updateTimeRestrictionWithDuration:v34 enabled:v5];

    v36 = [(GAXOptionsViewController *)self->_optionsViewController view];
    v37 = [(GAXOptionsViewController *)self->_optionsViewController view];
    [v37 bounds];
    double v39 = v38;
    LODWORD(v38) = 1148846080;
    objc_msgSend(v36, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v39, 1000.0, v38, 0.0);
    double v41 = v40;

    v42 = [(GAXFeatureViewController *)self _viewForPresentingOverlayUserInterface];
    [v42 bounds];
    double v44 = v43;

    if (v41 >= v44) {
      double v41 = v44;
    }
    v45 = [(GAXOptionsViewController *)self->_optionsViewController view];
    [v45 bounds];
    double v47 = v46;

    optionsViewController = self->_optionsViewController;
    -[GAXOptionsViewController setPreferredContentSize:](optionsViewController, "setPreferredContentSize:", v47, v41);
  }
  else
  {
    unint64_t v19 = [v17 objectAtIndexedSubscript:v14];
    unint64_t v20 = [v19 objectForKeyedSubscript:@"GAXFeatureViewIdentifierKey"];

    if ([v20 isEqualToString:@"GAXProfileAllowsTouch"])
    {
      double v21 = [(GAXFeatureViewController *)self delegate];
      if (objc_opt_respondsToSelector()) {
        [v21 featureViewController:self touchSystemFeatureDidChange:v5];
      }
      id v22 = [(GAXFeatureViewController *)self styleProvider];
      [v22 defaultAnimationDuration];
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = sub_29618;
      v50[3] = &unk_5DB80;
      v50[4] = self;
      BOOL v51 = v5;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v50);
    }
    id v23 = [(GAXFeatureViewController *)self userInterfaceServer];
    [v23 setFeatureEnabled:v5 withIdentifier:v20];
  }
}

- (void)optionsViewController:(id)a3 timeRestrictionValueDidChange:(int64_t)a4 timeRestrictionsEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = [(GAXFeatureViewController *)self userInterfaceServer];
  [v7 updateTimeRestrictionWithDuration:a4 enabled:v5];
}

- (void).cxx_destruct
{
}

@end