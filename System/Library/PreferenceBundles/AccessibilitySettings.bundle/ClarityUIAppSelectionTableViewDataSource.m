@interface ClarityUIAppSelectionTableViewDataSource
- (BOOL)_isClarityUIApplicationIdentifier:(id)a3;
- (BOOL)_isHiddenByUserWithIdentifier:(id)a3;
- (BOOL)_isSelectedApplicationIdentifier:(id)a3;
- (BOOL)_requiresPreflightForApplicationWithIdentifier:(id)a3;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (BSInvalidatable)appAvailabilityObserver;
- (ClarityUIAppSelectionTableViewDataSource)init;
- (ClarityUIAppSelectionTableViewDataSourceDelegate)dataSourceDelegate;
- (NSMutableArray)selectedApplicationIdentifiers;
- (NSMutableArray)unselectedClarityUIApplicationIdentifiers;
- (NSMutableArray)unselectedStandardApplicationIdentifiers;
- (NSSet)allApplicationIdentifiers;
- (UITableView)tableView;
- (double)_calculateHeightForString:(id)a3 withFontStyle:(id)a4;
- (double)_calculateWidthForString:(id)a3 withFontStyle:(id)a4;
- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_applicationIdentifierForIndexPath:(id)a3;
- (id)_applicationIdentifiersForSection:(int64_t)a3;
- (id)_applicationRecordForIdentifier:(id)a3;
- (id)_comparatorForApplicationIdentifiers;
- (id)_displayNameForApplicationIdentifier:(id)a3;
- (id)_indexPathForApplicationIdentifier:(id)a3;
- (id)_sortedApplicationIdentifiers:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)_indexForInsertingApplicationIdentifier:(id)a3 intoArray:(id)a4;
- (void)_deselectIdentifierAtIndexPath:(id)a3;
- (void)_didUpdateSelectedApplicationIdentifiers;
- (void)_moveIndexPath:(id)a3 toIndexPath:(id)a4;
- (void)_reloadApplications;
- (void)_selectIdentifierAtIndexPath:(id)a3;
- (void)commitChangeForApplicationIdentifier:(id)a3;
- (void)commitChangesToSelectedApplications;
- (void)dealloc;
- (void)setAllApplicationIdentifiers:(id)a3;
- (void)setAppAvailabilityObserver:(id)a3;
- (void)setDataSourceDelegate:(id)a3;
- (void)setSelectedApplicationIdentifiers:(id)a3;
- (void)setUnselectedClarityUIApplicationIdentifiers:(id)a3;
- (void)setUnselectedStandardApplicationIdentifiers:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
@end

@implementation ClarityUIAppSelectionTableViewDataSource

- (ClarityUIAppSelectionTableViewDataSource)init
{
  v20.receiver = self;
  v20.super_class = (Class)ClarityUIAppSelectionTableViewDataSource;
  v2 = [(ClarityUIAppSelectionTableViewDataSource *)&v20 init];
  if (v2)
  {
    id v3 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [v3 setDelegate:v2];
    [v3 setDataSource:v2];
    [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"ClarityUIAppSelectionCell"];
    [v3 setEditing:1];
    objc_storeStrong((id *)&v2->_tableView, v3);
    v4 = ClarityUIAllInstalledAppIdentifiers();
    if ([v4 containsObject:AX_MobilePhoneBundleName]
      && (uint64_t v5 = AX_FaceTimeBundleName, [v4 containsObject:AX_FaceTimeBundleName]))
    {
      v6 = (NSSet *)[v4 mutableCopy];
      [(NSSet *)v6 removeObject:v5];
      v7 = (NSSet *)[(NSSet *)v6 copy];
      allApplicationIdentifiers = v2->_allApplicationIdentifiers;
      v2->_allApplicationIdentifiers = v7;
    }
    else
    {
      v9 = v4;
      v6 = v2->_allApplicationIdentifiers;
      v2->_allApplicationIdentifiers = v9;
    }

    [(ClarityUIAppSelectionTableViewDataSource *)v2 _reloadApplications];
    v10 = +[UIColor systemBackgroundColor];
    [v3 setBackgroundColor:v10];

    objc_initWeak(&location, v2);
    v11 = +[CLFAppAvailabilityChecker sharedInstance];
    v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    v16 = __48__ClarityUIAppSelectionTableViewDataSource_init__block_invoke;
    v17 = &unk_208798;
    objc_copyWeak(&v18, &location);
    v12 = [v11 observeUpdatesWithHandler:&v14];
    -[ClarityUIAppSelectionTableViewDataSource setAppAvailabilityObserver:](v2, "setAppAvailabilityObserver:", v12, v14, v15, v16, v17);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __48__ClarityUIAppSelectionTableViewDataSource_init__block_invoke(uint64_t a1)
{
  v2 = CLFLogSettings();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Reloading app lists because app availability changed.", v7, 2u);
  }

  id v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _reloadApplications];

  id v5 = objc_loadWeakRetained(v3);
  v6 = [v5 tableView];
  [v6 reloadData];
}

- (void)dealloc
{
  id v3 = [(ClarityUIAppSelectionTableViewDataSource *)self appAvailabilityObserver];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)ClarityUIAppSelectionTableViewDataSource;
  [(ClarityUIAppSelectionTableViewDataSource *)&v4 dealloc];
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  unint64_t v4 = (unint64_t)objc_msgSend(a4, "section", a3);
  if (v4 > 2) {
    return 0;
  }
  else {
    return qword_1A1470[v4];
  }
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([v7 section] || (uint64_t)objc_msgSend(v8, "section") < 1)
  {
    id v9 = v8;
    if (![v7 section]) {
      goto LABEL_7;
    }
    id v9 = v7;
    v10 = v8;
  }
  else
  {
    v10 = [(ClarityUIAppSelectionTableViewDataSource *)self _applicationIdentifiersForSection:0];
    id v11 = [v10 count];
    id v9 = +[NSIndexPath indexPathForRow:((uint64_t)v11 - 1) & ~(((uint64_t)v11 - 1) >> 63) inSection:0];
  }
LABEL_7:

  return v9;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 0;
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  return settingsLocString(@"REMOVE", @"ClarityUISettings");
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t v4 = [(ClarityUIAppSelectionTableViewDataSource *)self _applicationIdentifiersForSection:a4];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"ClarityUIAppSelectionCell" forIndexPath:v6];
  id v8 = [(ClarityUIAppSelectionTableViewDataSource *)self _applicationIdentifierForIndexPath:v6];

  id v9 = [(ClarityUIAppSelectionTableViewDataSource *)self _displayNameForApplicationIdentifier:v8];
  v10 = [v7 textLabel];
  [v10 setText:v9];

  id v11 = +[UIScreen mainScreen];
  [v11 scale];
  v12 = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v8, 0);

  v13 = [v7 imageView];
  [v13 setImage:v12];

  v14 = +[UIColor secondarySystemBackgroundColor];
  [v7 setBackgroundColor:v14];

  [v7 setAccessibilityTraits:UIAccessibilityTraitButton];

  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_opt_new();
  id v8 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
  [v7 setFont:v8];

  [v7 setAdjustsFontForContentSizeCategory:1];
  [v7 setNumberOfLines:0];
  id v9 = objc_opt_new();
  v10 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCallout];
  [v9 setFont:v10];

  id v11 = +[UIColor systemGrayColor];
  [v9 setTextColor:v11];

  [v9 setAdjustsFontForContentSizeCategory:1];
  [v9 setNumberOfLines:0];
  id v12 = objc_alloc((Class)UIStackView);
  v23[0] = v7;
  v23[1] = v9;
  v13 = +[NSArray arrayWithObjects:v23 count:2];
  id v14 = [v12 initWithArrangedSubviews:v13];

  [v14 setAxis:1];
  [v14 setAlignment:1];
  [v14 setLayoutMarginsRelativeArrangement:1];
  objc_msgSend(v14, "setLayoutMargins:", 0.0, 0.0, 10.0, 0.0);
  id v15 = [v6 numberOfRowsInSection:a4];

  if (a4 == 2)
  {
    if (!v15) {
      goto LABEL_12;
    }
    v19 = settingsLocString(@"STANDARD_APPS", @"ClarityUISettings");
    [v7 setText:v19];

    objc_super v20 = @"STANDARD_APPS_DETAIL";
LABEL_10:
    v17 = settingsLocString(v20, @"ClarityUISettings");
    id v18 = v9;
    goto LABEL_11;
  }
  if (a4 == 1)
  {
    if (!v15) {
      goto LABEL_12;
    }
    v21 = settingsLocString(@"CLARITY_UI_APPS", @"ClarityUISettings");
    [v7 setText:v21];

    objc_super v20 = @"CLARITY_UI_APPS_DETAIL";
    goto LABEL_10;
  }
  id v16 = 0;
  if (a4) {
    goto LABEL_13;
  }
  if ([(NSMutableArray *)self->_selectedApplicationIdentifiers count])
  {
    [v14 removeArrangedSubview:v9];
    v17 = settingsLocString(@"SELECTED_APPS", @"ClarityUISettings");
    id v18 = v7;
LABEL_11:
    [v18 setText:v17];

    [v14 setNeedsLayout];
    id v16 = v14;
    goto LABEL_13;
  }
LABEL_12:
  id v16 = 0;
LABEL_13:

  return v16;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v5 = a3;
  double v6 = 0.0;
  if (![v5 numberOfRowsInSection:a4]) {
    goto LABEL_6;
  }
  switch(a4)
  {
    case 2:
      settingsLocString(@"STANDARD_APPS", @"ClarityUISettings");
      id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      id v9 = @"STANDARD_APPS_DETAIL";
LABEL_9:
      settingsLocString(v9, @"ClarityUISettings");
      id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 1:
      settingsLocString(@"CLARITY_UI_APPS", @"ClarityUISettings");
      id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      id v9 = @"CLARITY_UI_APPS_DETAIL";
      goto LABEL_9;
    case 0:
      settingsLocString(@"SELECTED_APPS", @"ClarityUISettings");
      id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      id v8 = @"x";
LABEL_10:
      [v5 frame];
      double v11 = v10;
      [v5 separatorInset];
      double v13 = v11 + v12 * -2.0 + -10.0;
      NSAttributedStringKey v25 = NSFontAttributeName;
      id v14 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
      v26 = v14;
      id v15 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      -[__CFString boundingRectWithSize:options:attributes:context:](v7, "boundingRectWithSize:options:attributes:context:", 1, v15, 0, v13, 1000.0);
      double v17 = v16;

      NSAttributedStringKey v23 = NSFontAttributeName;
      id v18 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCallout];
      v24 = v18;
      v19 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      -[__CFString boundingRectWithSize:options:attributes:context:](v8, "boundingRectWithSize:options:attributes:context:", 1, v19, 0, v13, 1000.0);
      double v21 = v20;

      double v6 = ceil(v17) + ceil(v21) + 15.0;
      goto LABEL_11;
  }
LABEL_6:
  id v8 = &stru_20F6B8;
  id v7 = &stru_20F6B8;
LABEL_11:

  return v6;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return UITableViewAutomaticDimension;
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  return UITableViewAutomaticDimension;
}

- (double)_calculateWidthForString:(id)a3 withFontStyle:(id)a4
{
  id v5 = a3;
  double v6 = +[UIFont preferredFontForTextStyle:a4];
  id v7 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v6, NSFontAttributeName, 0);

  id v8 = [objc_alloc((Class)NSAttributedString) initWithString:v5 attributes:v7];
  [v8 size];
  double v10 = v9;

  return v10;
}

- (double)_calculateHeightForString:(id)a3 withFontStyle:(id)a4
{
  id v5 = a3;
  double v6 = +[UIFont preferredFontForTextStyle:a4];
  id v7 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v6, NSFontAttributeName, 0);

  id v8 = [objc_alloc((Class)NSAttributedString) initWithString:v5 attributes:v7];
  [v8 size];
  double v10 = v9;

  return v10;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return objc_msgSend(a4, "section", a3) == 0;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v13 = [(ClarityUIAppSelectionTableViewDataSource *)self _applicationIdentifierForIndexPath:v8];
  id v9 = [v8 section];

  double v10 = [(ClarityUIAppSelectionTableViewDataSource *)self _applicationIdentifiersForSection:v9];
  double v11 = -[ClarityUIAppSelectionTableViewDataSource _applicationIdentifiersForSection:](self, "_applicationIdentifiersForSection:", [v7 section]);
  [v10 removeObject:v13];
  id v12 = [v7 row];

  [v11 insertObject:v13 atIndex:v12];
  [(ClarityUIAppSelectionTableViewDataSource *)self _didUpdateSelectedApplicationIdentifiers];
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v9 = a3;
  id v8 = a5;
  if (v8)
  {
    if (a4 == 1)
    {
      [(ClarityUIAppSelectionTableViewDataSource *)self _deselectIdentifierAtIndexPath:v8];
    }
    else if (a4 == 2)
    {
      [(ClarityUIAppSelectionTableViewDataSource *)self _selectIdentifierAtIndexPath:v8];
    }
  }
}

- (void)_reloadApplications
{
  id v3 = +[CLFSettings sharedInstance];
  unint64_t v4 = [v3 applicationBundleIdentifiers];

  id v5 = +[NSMutableArray array];
  selectedApplicationIdentifiers = self->_selectedApplicationIdentifiers;
  self->_selectedApplicationIdentifiers = v5;

  v52 = +[NSMutableArray array];
  v50 = +[NSMutableArray array];
  v70[0] = AX_CameraBundleName;
  v70[1] = AX_PhotosBundleName;
  v70[2] = AX_PreferencesBundleName;
  v70[3] = AX_ShortcutsBundleName;
  v70[4] = AX_AppStoreBundleName;
  v70[5] = AX_TipsBundleName;
  v51 = +[NSArray arrayWithObjects:v70 count:6];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v7 = [(ClarityUIAppSelectionTableViewDataSource *)self allApplicationIdentifiers];
  id v8 = [v7 countByEnumeratingWithState:&v61 objects:v69 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v62;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v62 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        if ([(ClarityUIAppSelectionTableViewDataSource *)self _isHiddenByUserWithIdentifier:v12])
        {
          id v13 = CLFLogSettings();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v68 = v12;
            _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Removing application from list of selectable apps because it was hidden: %@", buf, 0xCu);
          }
        }
        else
        {
          if ([(ClarityUIAppSelectionTableViewDataSource *)self _isClarityUIApplicationIdentifier:v12])
          {
            id v14 = v52;
          }
          else
          {
            if ([v51 containsObject:v12]) {
              continue;
            }
            id v14 = v50;
          }
          [v14 addObject:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v61 objects:v69 count:16];
    }
    while (v9);
  }

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v15 = v4;
  id v16 = [v15 countByEnumeratingWithState:&v57 objects:v66 count:16];
  if (!v16) {
    goto LABEL_45;
  }
  id v17 = v16;
  uint64_t v18 = *(void *)v58;
  v19 = (void *)AX_MobilePhoneBundleName;
  double v20 = (void *)AX_FaceTimeBundleName;
  do
  {
    for (j = 0; j != v17; j = (char *)j + 1)
    {
      if (*(void *)v58 != v18) {
        objc_enumerationMutation(v15);
      }
      v22 = *(void **)(*((void *)&v57 + 1) + 8 * (void)j);
      NSAttributedStringKey v23 = [(ClarityUIAppSelectionTableViewDataSource *)self allApplicationIdentifiers];
      unsigned int v24 = [v23 containsObject:v22];

      if (v24)
      {
        if ([(ClarityUIAppSelectionTableViewDataSource *)self _requiresPreflightForApplicationWithIdentifier:v22])
        {
          NSAttributedStringKey v25 = CLFLogSettings();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v68 = v22;
            v26 = v25;
            v27 = "Removing application from selected apps because it requires preflight: %@";
LABEL_39:
            _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, v27, buf, 0xCu);
            goto LABEL_40;
          }
          goto LABEL_40;
        }
        if ([(ClarityUIAppSelectionTableViewDataSource *)self _isHiddenByUserWithIdentifier:v22])
        {
          NSAttributedStringKey v25 = CLFLogSettings();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v68 = v22;
            v26 = v25;
            v27 = "Removing application from selected apps because it was hidden: %@";
            goto LABEL_39;
          }
LABEL_40:

          continue;
        }
        v31 = self->_selectedApplicationIdentifiers;
        v32 = v22;
        goto LABEL_42;
      }
      if ([v22 isEqualToString:v19])
      {
        v28 = [(ClarityUIAppSelectionTableViewDataSource *)self allApplicationIdentifiers];
        unsigned int v29 = [v28 containsObject:v20];

        if (v29)
        {
          v30 = CLFLogSettings();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, "Replacing MobilePhone with FaceTime due to installed apps changing.", buf, 2u);
          }

          v31 = self->_selectedApplicationIdentifiers;
          v32 = v20;
LABEL_42:
          [(NSMutableArray *)v31 addObject:v32];
          continue;
        }
      }
      if ([v22 isEqualToString:v20])
      {
        v33 = [(ClarityUIAppSelectionTableViewDataSource *)self allApplicationIdentifiers];
        unsigned int v34 = [v33 containsObject:v19];

        if (v34)
        {
          v35 = CLFLogSettings();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v35, OS_LOG_TYPE_DEFAULT, "Replacing FaceTime with MobilePhone due to installed apps changing.", buf, 2u);
          }

          v31 = self->_selectedApplicationIdentifiers;
          v32 = v19;
          goto LABEL_42;
        }
      }
    }
    id v17 = [v15 countByEnumeratingWithState:&v57 objects:v66 count:16];
  }
  while (v17);
LABEL_45:

  v36 = self->_selectedApplicationIdentifiers;
  v37 = +[CLFSettings sharedInstance];
  [v37 setApplicationBundleIdentifiers:v36];

  v38 = [(ClarityUIAppSelectionTableViewDataSource *)self _sortedApplicationIdentifiers:v52];
  v39 = (NSMutableArray *)[v38 mutableCopy];
  unselectedClarityUIApplicationIdentifiers = self->_unselectedClarityUIApplicationIdentifiers;
  self->_unselectedClarityUIApplicationIdentifiers = v39;

  v41 = [(ClarityUIAppSelectionTableViewDataSource *)self _sortedApplicationIdentifiers:v50];
  v42 = (NSMutableArray *)[v41 mutableCopy];
  unselectedStandardApplicationIdentifiers = self->_unselectedStandardApplicationIdentifiers;
  self->_unselectedStandardApplicationIdentifiers = v42;

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v44 = [(ClarityUIAppSelectionTableViewDataSource *)self selectedApplicationIdentifiers];
  id v45 = [v44 countByEnumeratingWithState:&v53 objects:v65 count:16];
  if (v45)
  {
    id v46 = v45;
    uint64_t v47 = *(void *)v54;
    do
    {
      for (k = 0; k != v46; k = (char *)k + 1)
      {
        if (*(void *)v54 != v47) {
          objc_enumerationMutation(v44);
        }
        uint64_t v49 = *(void *)(*((void *)&v53 + 1) + 8 * (void)k);
        [(NSMutableArray *)self->_unselectedClarityUIApplicationIdentifiers removeObject:v49];
        [(NSMutableArray *)self->_unselectedStandardApplicationIdentifiers removeObject:v49];
      }
      id v46 = [v44 countByEnumeratingWithState:&v53 objects:v65 count:16];
    }
    while (v46);
  }
}

- (void)_selectIdentifierAtIndexPath:(id)a3
{
  id v9 = [(ClarityUIAppSelectionTableViewDataSource *)self _applicationIdentifierForIndexPath:a3];
  uint64_t v4 = [(ClarityUIAppSelectionTableViewDataSource *)self dataSourceDelegate];
  if (v4)
  {
    id v5 = (void *)v4;
    double v6 = [(ClarityUIAppSelectionTableViewDataSource *)self dataSourceDelegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(ClarityUIAppSelectionTableViewDataSource *)self dataSourceDelegate];
      [v8 dataSource:self didSelectBundleIdentifier:v9];
    }
  }
}

- (void)commitChangeForApplicationIdentifier:(id)a3
{
  id v4 = a3;
  id v10 = [(ClarityUIAppSelectionTableViewDataSource *)self _indexPathForApplicationIdentifier:v4];
  id v5 = -[ClarityUIAppSelectionTableViewDataSource _applicationIdentifiersForSection:](self, "_applicationIdentifiersForSection:", [v10 section]);
  [v5 removeObject:v4];

  double v6 = [(ClarityUIAppSelectionTableViewDataSource *)self selectedApplicationIdentifiers];
  id v7 = [v6 count];

  id v8 = [(ClarityUIAppSelectionTableViewDataSource *)self selectedApplicationIdentifiers];
  [v8 addObject:v4];

  id v9 = +[NSIndexPath indexPathForRow:v7 inSection:0];
  [(ClarityUIAppSelectionTableViewDataSource *)self _moveIndexPath:v10 toIndexPath:v9];

  [(ClarityUIAppSelectionTableViewDataSource *)self _didUpdateSelectedApplicationIdentifiers];
}

- (void)_deselectIdentifierAtIndexPath:(id)a3
{
  id v4 = a3;
  id v10 = [(ClarityUIAppSelectionTableViewDataSource *)self _applicationIdentifierForIndexPath:v4];
  if ([(ClarityUIAppSelectionTableViewDataSource *)self _isClarityUIApplicationIdentifier:v10])
  {
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = 2;
  }
  double v6 = [(ClarityUIAppSelectionTableViewDataSource *)self _applicationIdentifiersForSection:v5];
  unint64_t v7 = [(ClarityUIAppSelectionTableViewDataSource *)self _indexForInsertingApplicationIdentifier:v10 intoArray:v6];
  id v8 = [(ClarityUIAppSelectionTableViewDataSource *)self selectedApplicationIdentifiers];
  [v8 removeObject:v10];

  [v6 insertObject:v10 atIndex:v7];
  id v9 = +[NSIndexPath indexPathForRow:v7 inSection:v5];
  [(ClarityUIAppSelectionTableViewDataSource *)self _moveIndexPath:v4 toIndexPath:v9];

  [(ClarityUIAppSelectionTableViewDataSource *)self _didUpdateSelectedApplicationIdentifiers];
}

- (void)_moveIndexPath:(id)a3 toIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  NSInteger v8 = -[UITableView numberOfRowsInSection:](self->_tableView, "numberOfRowsInSection:", [v7 section]);
  NSInteger v9 = -[UITableView numberOfRowsInSection:](self->_tableView, "numberOfRowsInSection:", [v6 section]);
  id v10 = [(ClarityUIAppSelectionTableViewDataSource *)self tableView];
  [v10 beginUpdates];

  double v11 = [(ClarityUIAppSelectionTableViewDataSource *)self tableView];
  id v23 = v6;
  id v12 = +[NSArray arrayWithObjects:&v23 count:1];
  if (v9 == 1) {
    uint64_t v13 = 100;
  }
  else {
    uint64_t v13 = 0;
  }
  [v11 deleteRowsAtIndexPaths:v12 withRowAnimation:v13];

  id v14 = [(ClarityUIAppSelectionTableViewDataSource *)self tableView];
  id v22 = v7;
  id v15 = +[NSArray arrayWithObjects:&v22 count:1];
  if (v8) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = 100;
  }
  [v14 insertRowsAtIndexPaths:v15 withRowAnimation:v16];

  if (!v8)
  {
    id v17 = [(ClarityUIAppSelectionTableViewDataSource *)self tableView];
    uint64_t v18 = +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", [v7 section]);
    [v17 reloadSections:v18 withRowAnimation:100];
  }
  if (v9 == 1)
  {
    v19 = [(ClarityUIAppSelectionTableViewDataSource *)self tableView];
    double v20 = +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", [v6 section]);
    [v19 reloadSections:v20 withRowAnimation:100];
  }
  double v21 = [(ClarityUIAppSelectionTableViewDataSource *)self tableView];
  [v21 endUpdates];
}

- (void)commitChangesToSelectedApplications
{
  id v3 = [(ClarityUIAppSelectionTableViewDataSource *)self selectedApplicationIdentifiers];
  v2 = +[CLFSettings sharedInstance];
  [v2 setApplicationBundleIdentifiers:v3];
}

- (void)_didUpdateSelectedApplicationIdentifiers
{
  uint64_t v3 = [(ClarityUIAppSelectionTableViewDataSource *)self dataSourceDelegate];
  if (v3)
  {
    id v4 = (void *)v3;
    uint64_t v5 = [(ClarityUIAppSelectionTableViewDataSource *)self dataSourceDelegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(ClarityUIAppSelectionTableViewDataSource *)self dataSourceDelegate];
      [v7 didUpdateApplicationIdentifiersForDataSource:self];
    }
  }
}

- (id)_applicationIdentifiersForSection:(int64_t)a3
{
  if (a3 == 2)
  {
    uint64_t v3 = [(ClarityUIAppSelectionTableViewDataSource *)self unselectedStandardApplicationIdentifiers];
  }
  else if (a3 == 1)
  {
    uint64_t v3 = [(ClarityUIAppSelectionTableViewDataSource *)self unselectedClarityUIApplicationIdentifiers];
  }
  else if (a3)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [(ClarityUIAppSelectionTableViewDataSource *)self selectedApplicationIdentifiers];
  }

  return v3;
}

- (BOOL)_isSelectedApplicationIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ClarityUIAppSelectionTableViewDataSource *)self selectedApplicationIdentifiers];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (id)_applicationRecordForIdentifier:(id)a3
{
  id v3 = a3;
  id v8 = 0;
  id v4 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v3 allowPlaceholder:0 error:&v8];
  id v5 = v8;
  if (v5)
  {
    unsigned __int8 v6 = CLFLogSettings();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(ClarityUIAppSelectionTableViewDataSource *)(uint64_t)v3 _applicationRecordForIdentifier:v6];
    }
  }

  return v4;
}

- (BOOL)_isClarityUIApplicationIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(ClarityUIAppSelectionTableViewDataSource *)self _applicationRecordForIdentifier:v4];
  unsigned __int8 v6 = v5;
  if (v5)
  {
    id v7 = [v5 URL];
    id v8 = +[NSBundle bundleWithURL:v7];

    NSInteger v9 = [v8 objectForInfoDictionaryKey:CLFSupportsClarityUIKey];
    if (!v9)
    {
      NSInteger v9 = [v8 objectForInfoDictionaryKey:CLFSupportsFullScreenInAssistiveAccessKey];
    }
    unsigned __int8 v10 = [v9 BOOLValue];
  }
  else
  {
    double v11 = CLFLogSettings();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ClarityUIAppSelectionTableViewDataSource _isClarityUIApplicationIdentifier:]((uint64_t)v4, v11);
    }

    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (id)_comparatorForApplicationIdentifiers
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __80__ClarityUIAppSelectionTableViewDataSource__comparatorForApplicationIdentifiers__block_invoke;
  v4[3] = &unk_209D00;
  v4[4] = self;
  v2 = objc_retainBlock(v4);

  return v2;
}

id __80__ClarityUIAppSelectionTableViewDataSource__comparatorForApplicationIdentifiers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [v5 _displayNameForApplicationIdentifier:a2];
  id v8 = [*(id *)(a1 + 32) _displayNameForApplicationIdentifier:v6];

  id v9 = [v7 localizedCaseInsensitiveCompare:v8];
  return v9;
}

- (unint64_t)_indexForInsertingApplicationIdentifier:(id)a3 intoArray:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 count];
  id v9 = [(ClarityUIAppSelectionTableViewDataSource *)self _comparatorForApplicationIdentifiers];
  id v10 = objc_msgSend(v6, "indexOfObject:inSortedRange:options:usingComparator:", v7, 0, v8, 1024, v9);

  return (unint64_t)v10;
}

- (id)_sortedApplicationIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(ClarityUIAppSelectionTableViewDataSource *)self _comparatorForApplicationIdentifiers];
  id v6 = [v4 sortedArrayUsingComparator:v5];

  return v6;
}

- (id)_applicationIdentifierForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = -[ClarityUIAppSelectionTableViewDataSource _applicationIdentifiersForSection:](self, "_applicationIdentifiersForSection:", [v4 section]);
  id v6 = [v4 row];

  id v7 = [v5 objectAtIndexedSubscript:v6];

  return v7;
}

- (id)_indexPathForApplicationIdentifier:(id)a3
{
  id v4 = a3;
  if ([(ClarityUIAppSelectionTableViewDataSource *)self _isSelectedApplicationIdentifier:v4])
  {
    id v5 = [(ClarityUIAppSelectionTableViewDataSource *)self selectedApplicationIdentifiers];
    uint64_t v6 = (uint64_t)[v5 indexOfObject:v4];
    uint64_t v7 = 0;
  }
  else
  {
    id v5 = 0;
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if ([(ClarityUIAppSelectionTableViewDataSource *)self _isClarityUIApplicationIdentifier:v4]&& v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = [(ClarityUIAppSelectionTableViewDataSource *)self unselectedClarityUIApplicationIdentifiers];

    uint64_t v6 = (uint64_t)[v8 indexOfObject:v4];
    uint64_t v7 = 1;
    id v5 = v8;
  }
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = [(ClarityUIAppSelectionTableViewDataSource *)self unselectedStandardApplicationIdentifiers];

    uint64_t v6 = (uint64_t)[v9 indexOfObject:v4];
    uint64_t v7 = 2;
    id v5 = v9;
  }
  id v10 = +[NSIndexPath indexPathForRow:v6 inSection:v7];

  return v10;
}

- (id)_displayNameForApplicationIdentifier:(id)a3
{
  return ClarityUIDisplayNameForApp(a3);
}

- (BOOL)_requiresPreflightForApplicationWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[CLFAppAvailabilityChecker sharedInstance];
  unsigned __int8 v5 = [v4 requiresPreflightForBundleIdentifier:v3];

  return v5;
}

- (BOOL)_isHiddenByUserWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[CLFAppAvailabilityChecker sharedInstance];
  unsigned __int8 v5 = [v4 isHiddenByUserForBundleIdentifier:v3];

  return v5;
}

- (ClarityUIAppSelectionTableViewDataSourceDelegate)dataSourceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSourceDelegate);

  return (ClarityUIAppSelectionTableViewDataSourceDelegate *)WeakRetained;
}

- (void)setDataSourceDelegate:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (NSSet)allApplicationIdentifiers
{
  return self->_allApplicationIdentifiers;
}

- (void)setAllApplicationIdentifiers:(id)a3
{
}

- (NSMutableArray)unselectedClarityUIApplicationIdentifiers
{
  return self->_unselectedClarityUIApplicationIdentifiers;
}

- (void)setUnselectedClarityUIApplicationIdentifiers:(id)a3
{
}

- (NSMutableArray)unselectedStandardApplicationIdentifiers
{
  return self->_unselectedStandardApplicationIdentifiers;
}

- (void)setUnselectedStandardApplicationIdentifiers:(id)a3
{
}

- (NSMutableArray)selectedApplicationIdentifiers
{
  return self->_selectedApplicationIdentifiers;
}

- (void)setSelectedApplicationIdentifiers:(id)a3
{
}

- (BSInvalidatable)appAvailabilityObserver
{
  return self->_appAvailabilityObserver;
}

- (void)setAppAvailabilityObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appAvailabilityObserver, 0);
  objc_storeStrong((id *)&self->_selectedApplicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_unselectedStandardApplicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_unselectedClarityUIApplicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_allApplicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_tableView, 0);

  objc_destroyWeak((id *)&self->_dataSourceDelegate);
}

- (void)_applicationRecordForIdentifier:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Lookup for %@ encountered error: %@", (uint8_t *)&v3, 0x16u);
}

- (void)_isClarityUIApplicationIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Got nil record for bundle identifier: %@", (uint8_t *)&v2, 0xCu);
}

@end