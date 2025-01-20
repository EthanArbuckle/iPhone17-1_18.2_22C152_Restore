@interface CPSClipDetailSettingsController
- (id)bundle;
- (id)specifiers;
- (void)_confirmDeleteAppClip;
- (void)_popAndShowAllAppClips;
- (void)didTapReportAProblemLink;
@end

@implementation CPSClipDetailSettingsController

- (id)specifiers
{
  v2 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    uint64_t v48 = OBJC_IVAR___PSListController__specifiers;
    id v5 = objc_alloc_init((Class)NSMutableArray);
    uint64_t v6 = OBJC_IVAR___PSViewController__specifier;
    uint64_t v7 = objc_msgSend(*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier], "cps_bundleIdentifier");
    v8 = (PSSystemPolicyForApp *)[objc_alloc((Class)PSSystemPolicyForApp) initWithBundleIdentifier:v7];
    appPolicy = self->_appPolicy;
    self->_appPolicy = v8;

    v10 = [(PSSystemPolicyForApp *)self->_appPolicy specifiersForPolicyOptions:-142737409 force:0];
    [v5 addObjectsFromArray:v10];

    id v11 = objc_msgSend(*(id *)&self->PSListController_opaque[v6], "cps_storeItemIdentifier");
    unsigned int v12 = objc_msgSend(*(id *)&self->PSListController_opaque[v6], "cps_isTestFlight");
    if (v11) {
      BOOL v13 = 0;
    }
    else {
      BOOL v13 = v12 == 0;
    }
    if (!v13)
    {
      v14 = +[PSSpecifier groupSpecifierWithID:@"STORE_UPSELL"];
      v15 = _CPSLocalizedString();
      [v14 setName:v15];

      [v5 addObject:v14];
      v16 = +[CPSClipStoreTableViewCell specifierForBundleIdentifier:v7];
      [v5 addObject:v16];
    }
    v49 = (void *)v7;
    v17 = +[PSSpecifier groupSpecifierWithID:@"DELETE_GROUP_ID"];
    v18 = _CPSLocalizedString();
    v19 = +[CPSUtilities localizedDeviceName];
    v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v19);
    [v17 setProperty:v20 forKey:PSFooterTextGroupKey];

    v47 = v17;
    [v5 addObject:v17];
    v21 = _CPSLocalizedString();
    v22 = +[PSSpecifier deleteButtonSpecifierWithName:v21 target:self action:"_confirmDeleteAppClip"];

    if (+[CPSClipURL isSupported]) {
      v23 = &__kCFBooleanTrue;
    }
    else {
      v23 = &__kCFBooleanFalse;
    }
    [v22 setProperty:v23 forKey:PSEnabledKey];
    v45 = v5;
    v46 = v22;
    [v5 addObject:v22];
    v24 = +[PSSpecifier groupSpecifierWithID:@"REPORT_A_PROBLEM_GROUP_ID"];
    v25 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v25);
    [v24 setProperty:v26 forKey:PSHeaderCellClassGroupKey];

    uint64_t v27 = _CPSLocalizedString();
    v28 = _CPSLocalizedString();
    v29 = objc_msgSend(*(id *)&self->PSListController_opaque[v6], "cps_appClipApplicationRecord");
    v30 = [v29 iTunesMetadata];
    uint64_t v31 = [v30 itemName];
    v32 = (void *)v31;
    if (v31)
    {
      v33 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v28, v31, v27);
    }
    else
    {
      v34 = [*(id *)&self->PSListController_opaque[v6] name];
      v33 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v28, v34, v27);
    }
    [v24 setProperty:v33 forKey:PSFooterHyperlinkViewTitleKey];
    v35 = (void *)v27;
    v58.location = (NSUInteger)[v33 rangeOfString:v27];
    v36 = NSStringFromRange(v58);
    [v24 setProperty:v36 forKey:PSFooterHyperlinkViewLinkRangeKey];

    v37 = +[NSValue valueWithNonretainedObject:self];
    [v24 setProperty:v37 forKey:PSFooterHyperlinkViewTargetKey];

    [v24 setProperty:@"didTapReportAProblemLink" forKey:PSFooterHyperlinkViewActionKey];
    [v45 addObject:v24];
    uint64_t v51 = 0;
    v52 = &v51;
    uint64_t v53 = 0x3032000000;
    v54 = sub_92F0;
    v55 = sub_9300;
    id v56 = 0;
    v38 = +[NSNotificationCenter defaultCenter];
    v39 = +[NSOperationQueue mainQueue];
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_9308;
    v50[3] = &unk_149A0;
    v50[4] = self;
    v50[5] = &v51;
    uint64_t v40 = [v38 addObserverForName:UIApplicationDidEnterBackgroundNotification object:0 queue:v39 usingBlock:v50];
    v41 = (void *)v52[5];
    v52[5] = v40;

    v42 = *(void **)&self->PSListController_opaque[v48];
    *(void *)&self->PSListController_opaque[v48] = v45;
    id v43 = v45;

    id v3 = *(id *)&self->PSListController_opaque[v48];
    _Block_object_dispose(&v51, 8);
  }

  return v3;
}

- (void)_confirmDeleteAppClip
{
  id v3 = [(PSSystemPolicyForApp *)self->_appPolicy bundleIdentifier];
  v9 = v3;
  v4 = +[NSArray arrayWithObjects:&v9 count:1];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_94A0;
  v6[3] = &unk_14818;
  id v7 = v3;
  v8 = self;
  id v5 = v3;
  +[CPSClipRequest deleteClipsWithBundleIDs:v4 completion:v6];
}

- (void)_popAndShowAllAppClips
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__parentController]);
  [WeakRetained reloadSpecifiers];
  v2 = [WeakRetained navigationController];
  id v3 = [v2 popViewControllerAnimated:1];
}

- (id)bundle
{
  return 0;
}

- (void)didTapReportAProblemLink
{
  id v3 = [CPSReportProblemViewController alloc];
  uint64_t v4 = OBJC_IVAR___PSViewController__specifier;
  id v5 = objc_msgSend(*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier], "cps_bundleIdentifier");
  uint64_t v6 = -[CPSReportProblemViewController initWithClipBundleIdentifier:itemIdentifier:](v3, "initWithClipBundleIdentifier:itemIdentifier:", v5, objc_msgSend(*(id *)&self->PSListController_opaque[v4], "cps_storeItemIdentifier"));

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_9704;
  v9[3] = &unk_147F0;
  v9[4] = self;
  [(CPSReportProblemViewController *)v6 setFinishAction:v9];
  [(CPSClipDetailSettingsController *)self presentViewController:v6 animated:1 completion:0];
  id v7 = +[CPSAnalyticsLogger sharedLogger];
  v8 = objc_msgSend(*(id *)&self->PSListController_opaque[v4], "cps_bundleIdentifier");
  [v7 recordReportProblemStepCompletedWithBundleID:v8 problemLabel:0 event:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedWebClips, 0);

  objc_storeStrong((id *)&self->_appPolicy, 0);
}

@end