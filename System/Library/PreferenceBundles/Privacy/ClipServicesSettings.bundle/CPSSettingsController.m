@interface CPSSettingsController
- (BOOL)_hasAppClipInAppProxies:(id)a3;
- (BOOL)_isDimSumApp:(id)a3;
- (id)_allDimSumApps;
- (id)_specifiersForDimSumAppsIfExists;
- (id)specifiers;
- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_didClearAllAppClips;
- (void)_reloadSpecifiersForUpdatedAppsIfNeeded:(id)a3;
- (void)_willClearAllAppClips;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)clearAllClips;
- (void)confirmClearAllClips:(id)a3;
- (void)didMoveToParentViewController:(id)a3;
- (void)didTapLearnMoreLink;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
@end

@implementation CPSSettingsController

- (id)specifiers
{
  uint64_t v2 = OBJC_IVAR___PSListController__specifiers;
  v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    v6 = [(CPSSettingsController *)self loadSpecifiersFromPlistName:@"ClipServicesSettings" target:self];
    v7 = [(CPSSettingsController *)self _specifiersForDimSumAppsIfExists];
    if ([v7 count])
    {
      v8 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, [v7 count]);
      [v6 insertObjects:v7 atIndexes:v8];
    }
    v9 = [v6 specifierForID:@"CLEAR_CLIP_HISTORY"];
    v10 = &__kCFBooleanFalse;
    if (+[CPSClipURL isSupported](CPSClipURL, "isSupported") && [v7 count]) {
      v10 = &__kCFBooleanTrue;
    }
    [v9 setProperty:v10 forKey:PSEnabledKey];
    v11 = [v6 specifierForID:@"SPACE_CELL_AFTER_GLOBAL_SWITCH"];
    v12 = _CPSLocalizedString();
    v13 = _CPSLocalizedString();
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v12);

    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    [v11 setProperty:v16 forKey:PSFooterCellClassGroupKey];

    [v11 setProperty:v14 forKey:PSFooterHyperlinkViewTitleKey];
    v23.location = (NSUInteger)[v14 rangeOfString:v12];
    v17 = NSStringFromRange(v23);
    [v11 setProperty:v17 forKey:PSFooterHyperlinkViewLinkRangeKey];

    v18 = +[NSValue valueWithNonretainedObject:self];
    [v11 setProperty:v18 forKey:PSFooterHyperlinkViewTargetKey];

    [v11 setProperty:@"didTapLearnMoreLink" forKey:PSFooterHyperlinkViewActionKey];
    v19 = *(void **)&self->PSListController_opaque[v2];
    *(void *)&self->PSListController_opaque[v2] = v6;
    id v20 = v6;

    id v4 = *(id *)&self->PSListController_opaque[v2];
  }

  return v4;
}

- (void)didMoveToParentViewController:(id)a3
{
  v5 = +[LSApplicationWorkspace defaultWorkspace];
  id v6 = v5;
  if (a3) {
    [v5 addObserver:self];
  }
  else {
    [v5 removeObserver:self];
  }
}

- (id)_specifiersForDimSumAppsIfExists
{
  v3 = +[NSMutableArray array];
  id v4 = [(CPSSettingsController *)self _allDimSumApps];
  v5 = +[PSSystemPolicyManager specifiersForThirdPartyApps:v4];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "setDetailControllerClass:", objc_opt_class(), (void)v13);
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  if ([v6 count])
  {
    v11 = +[PSSpecifier emptyGroupSpecifier];
    [v3 addObject:v11];

    [v3 addObjectsFromArray:v6];
  }

  return v3;
}

- (id)_allDimSumApps
{
  v3 = +[NSMutableArray array];
  id v4 = +[LSApplicationWorkspace defaultWorkspace];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_AB54;
  v9[3] = &unk_149E0;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  [v4 enumerateBundlesOfType:1 block:v9];

  id v6 = v10;
  id v7 = v5;

  return v7;
}

- (BOOL)_isDimSumApp:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  id v4 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v3 allowPlaceholder:0 error:&v7];

  id v5 = [v4 appClipMetadata];
  LOBYTE(v3) = v5 != 0;

  return (char)v3;
}

- (void)confirmClearAllClips:(id)a3
{
  id v4 = +[PSConfirmationSpecifier preferenceSpecifierNamed:&stru_14D30 target:self set:0 get:0 detail:0 cell:-1 edit:0];
  uint64_t v12 = PSConfirmationTitleKey;
  id v5 = _CPSLocalizedString();
  v16[0] = v5;
  uint64_t v13 = PSConfirmationPromptKey;
  id v6 = _CPSLocalizedString();
  uint64_t v7 = +[CPSUtilities localizedDeviceName];
  id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v7, v12, v13);
  v16[1] = v8;
  uint64_t v14 = PSConfirmationOKKey;
  uint64_t v9 = _CPSLocalizedString();
  v16[2] = v9;
  uint64_t v15 = PSConfirmationCancelKey;
  id v10 = _CPSLocalizedString();
  v16[3] = v10;
  v11 = +[NSDictionary dictionaryWithObjects:v16 forKeys:&v12 count:4];
  [v4 setupWithDictionary:v11];

  [v4 setProperty:&__kCFBooleanTrue forKey:PSConfirmationDestructiveKey];
  [v4 setConfirmationAction:"clearAllClips"];
  [(CPSSettingsController *)self showConfirmationViewForSpecifier:v4];
}

- (void)clearAllClips
{
  id v3 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = *(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * (void)v8) identifier];
        if ([(CPSSettingsController *)self _isDimSumApp:v9])
        {
          [v3 addObject:v9];
          id v10 = +[CPSAnalyticsLogger sharedLogger];
          [v10 didManuallyDeleteClip:v9 withEvent:2];
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  if ([v3 count])
  {
    [(CPSSettingsController *)self _willClearAllAppClips];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_B0A0;
    v11[3] = &unk_14A08;
    v11[4] = self;
    +[CPSClipRequest deleteClipsWithBundleIDs:v3 completion:v11];
  }
}

- (void)didTapLearnMoreLink
{
  id v3 = objc_alloc_init(CPSAboutViewController);
  [(CPSSettingsController *)self presentViewController:v3 animated:1 completion:0];
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v4 = [(CPSSettingsController *)self specifierAtIndexPath:a4];
  id v5 = [v4 identifier];
  if ([v5 isEqualToString:@"APP_CLIPS"])
  {

    int64_t v6 = 0;
  }
  else
  {
    unsigned int v7 = +[CPSClipURL isSupported];

    int64_t v6 = v7;
  }

  return v6;
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  return (id)_CPSLocalizedString();
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (a4 == 1)
  {
    id v10 = [(CPSSettingsController *)self specifierAtIndexPath:v9];
    [(CPSSettingsController *)self beginUpdates];
    [(CPSSettingsController *)self removeSpecifier:v10 animated:1];
    [(CPSSettingsController *)self endUpdates];
    v11 = [v10 identifier];
    long long v12 = +[CPSAnalyticsLogger sharedLogger];
    [v12 didManuallyDeleteClip:v11 withEvent:1];

    v18 = v11;
    long long v13 = +[NSArray arrayWithObjects:&v18 count:1];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_B378;
    v14[3] = &unk_14A30;
    id v15 = v8;
    id v16 = v9;
    v17 = self;
    +[CPSClipRequest deleteClipsWithBundleIDs:v13 completion:v14];
  }
}

- (BOOL)_hasAppClipInAppProxies:(id)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        unsigned int v7 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "correspondingApplicationRecord", (void)v10);
        id v8 = [v7 appClipMetadata];

        if (v8)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

- (void)_reloadSpecifiersForUpdatedAppsIfNeeded:(id)a3
{
  id v4 = a3;
  if (!self->_clearingAllAppClips
    && [(CPSSettingsController *)self _hasAppClipInAppProxies:v4])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_B608;
    v5[3] = &unk_14600;
    id v6 = v4;
    unsigned int v7 = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
  }
}

- (void)_willClearAllAppClips
{
  self->_clearingAllAppClips = 1;
  uint64_t v2 = [(CPSSettingsController *)self specifiers];
  id v7 = [v2 specifierForID:@"CLEAR_CLIP_HISTORY"];

  [v7 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
  id v3 = [v7 propertyForKey:PSTableCellKey];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 accessoryView];

    if (!v5)
    {
      id v6 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
      [v4 setAccessoryView:v6];
      [v6 startAnimating];
    }
  }
}

- (void)_didClearAllAppClips
{
  id v3 = [(CPSSettingsController *)self specifiers];
  id v5 = [v3 specifierForID:@"CLEAR_CLIP_HISTORY"];

  id v4 = [v5 propertyForKey:PSTableCellKey];
  [v4 setAccessoryView:0];
  self->_clearingAllAppClips = 0;
}

- (void)applicationsDidInstall:(id)a3
{
}

- (void)applicationsDidUninstall:(id)a3
{
}

@end