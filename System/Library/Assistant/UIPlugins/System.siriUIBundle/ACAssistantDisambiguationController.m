@interface ACAssistantDisambiguationController
- (BOOL)_canShowWhileLocked;
- (BOOL)removedAfterDialogProgresses;
- (BOOL)shouldHidePriorViews;
- (BOOL)wantsConfirmationInsets;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (Class)cellClass;
- (Class)footerViewClass;
- (double)desiredHeightForFooterView;
- (double)desiredHeightForWidth:(double)a3;
- (id)_picker;
- (id)_pickerController;
- (id)alternativeAceCommandsToPerformIfNotExposingViews;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)snippet;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_configureContent;
- (void)_showPicker:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)configureReusableFooterView:(id)a3;
- (void)loadView;
- (void)pickerViewController:(id)a3 didDismissPicker:(id)a4;
- (void)pickerViewController:(id)a3 didRequestKeyboardWithVisibility:(BOOL)a4;
- (void)pickerViewController:(id)a3 didSelectObject:(id)a4 fromPicker:(id)a5;
- (void)pickerViewController:(id)a3 shouldPresentPicker:(id)a4 completion:(id)a5;
- (void)pickerViewController:(id)a3 willDismissPicker:(id)a4;
- (void)pickerViewController:(id)a3 willPresentPicker:(id)a4;
- (void)setAceObject:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setManageBackgroundColor:(BOOL)a3;
- (void)siriDidDeactivate;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ACAssistantDisambiguationController

- (void)setDelegate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ACAssistantDisambiguationController;
  [(ACAssistantDisambiguationController *)&v4 setDelegate:a3];
  [(ACAssistantDisambiguationController *)self _configureContent];
}

- (void)setAceObject:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ACAssistantDisambiguationController;
  [(ACAssistantDisambiguationController *)&v4 setAceObject:a3];
  [(ACAssistantDisambiguationController *)self _configureContent];
}

- (void)_configureContent
{
  if ([(NSMutableArray *)self->_disambiguationItems count]
    || [(NSMutableArray *)self->_disambiguationItemsList count])
  {
    v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v48 = "-[ACAssistantDisambiguationController _configureContent]";
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%s Disambiguation content has already been configured, ignoring call to configureContent", buf, 0xCu);
    }
  }
  else
  {
    objc_super v4 = [(ACAssistantDisambiguationController *)self aceObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      self->_isGroup = 0;
      objc_storeStrong((id *)&self->_disambiguationList, v4);
      v5 = [(ACAssistantDisambiguationController *)self delegate];
      v6 = [(SAUIDisambiguationList *)self->_disambiguationList items];
      v7 = [v5 siriViewController:self filteredDisambiguationListItems:v6];
      filteredItems = self->_filteredItems;
      self->_filteredItems = v7;

      v9 = +[NSMutableArray array];
      disambiguationItems = self->_disambiguationItems;
      self->_disambiguationItems = v9;

      v11 = [(ACAssistantDisambiguationController *)self delegate];
      v12 = [v11 siriViewController:self listItemToPickInAutodisambiguationForListItems:self->_filteredItems];
      preferredListItem = self->_preferredListItem;
      self->_preferredListItem = v12;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        self->_isGroup = 1;
        v41 = v4;
        objc_storeStrong((id *)&self->_disambiguationGroup, v4);
        v14 = +[NSMutableArray array];
        disambiguationItemsList = self->_disambiguationItemsList;
        self->_disambiguationItemsList = v14;

        v16 = +[NSMutableArray array];
        filteredItemsList = self->_filteredItemsList;
        self->_filteredItemsList = v16;

        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id obj = [(SAUIDisambiguationGroup *)self->_disambiguationGroup disambiguationLists];
        id v18 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
        if (v18)
        {
          id v19 = v18;
          uint64_t v20 = *(void *)v44;
          do
          {
            for (i = 0; i != v19; i = (char *)i + 1)
            {
              if (*(void *)v44 != v20) {
                objc_enumerationMutation(obj);
              }
              v22 = *(void **)(*((void *)&v43 + 1) + 8 * i);
              v23 = [(ACAssistantDisambiguationController *)self delegate];
              v24 = [v22 items];
              v25 = [v23 siriViewController:self filteredDisambiguationListItems:v24];

              v26 = [v22 groupTitle];
              id v27 = [v26 length];

              if (!v27)
              {
                v28 = [(ACAssistantDisambiguationController *)self delegate];
                v29 = [v28 siriViewController:self listItemToPickInAutodisambiguationForListItems:v25];
                v30 = self->_preferredListItem;
                self->_preferredListItem = v29;
              }
              [(NSMutableArray *)self->_filteredItemsList addObject:v25];
              v31 = self->_disambiguationItemsList;
              v32 = +[NSMutableArray array];
              [(NSMutableArray *)v31 addObject:v32];
            }
            id v19 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
          }
          while (v19);
        }

        objc_super v4 = v41;
      }
    }
    if (!self->_preferredListItem)
    {
      disambiguationList = self->_disambiguationList;
      if (!disambiguationList) {
        disambiguationList = self->_disambiguationGroup;
      }
      v37 = [(SAUIDisambiguationList *)disambiguationList af_assistedSelectionItem];
      v38 = self->_preferredListItem;
      self->_preferredListItem = v37;

      if (self->_preferredListItem)
      {
        v39 = AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
        {
          v40 = self->_preferredListItem;
          *(_DWORD *)buf = 136315394;
          v48 = "-[ACAssistantDisambiguationController _configureContent]";
          __int16 v49 = 2112;
          v50 = v40;
          _os_log_impl(&dword_0, v39, OS_LOG_TYPE_DEFAULT, "%s Using assisted disambiguation with list item %@", buf, 0x16u);
        }
      }
    }
    v33 = +[AFUIDisambiguationAnalyticsManager sharedManager];
    v34 = v33;
    disambiguationGroup = self->_disambiguationList;
    if (!disambiguationGroup) {
      disambiguationGroup = self->_disambiguationGroup;
    }
    [v33 setDisambiguationAssistance:disambiguationGroup];
  }
}

- (id)snippet
{
  return 0;
}

- (void)loadView
{
  v73.receiver = self;
  v73.super_class = (Class)ACAssistantDisambiguationController;
  [(ACAssistantDisambiguationController *)&v73 loadView];
  -[ACAssistantDisambiguationController setDefaultViewInsets:](self, "setDefaultViewInsets:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  v3 = [(ACAssistantDisambiguationController *)self collectionView];
  objc_super v4 = [(ACAssistantDisambiguationController *)self cellClass];
  v5 = [(objc_class *)[(ACAssistantDisambiguationController *)self cellClass] reuseIdentifier];
  [v3 registerClass:v4 forCellWithReuseIdentifier:v5];

  uint64_t v6 = objc_opt_class();
  v7 = [(id)objc_opt_class() reuseIdentifier];
  v61 = v3;
  [v3 registerClass:v6 forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:v7];

  v60 = +[AFUIDisambiguationAnalyticsManager sharedManager];
  if (self->_isGroup)
  {
    if (![(NSMutableArray *)self->_filteredItemsList count]) {
      goto LABEL_24;
    }
    uint64_t v8 = 0;
    while (1)
    {
      v9 = [(NSMutableArray *)self->_filteredItemsList objectAtIndex:v8];
      v10 = [(SAUIDisambiguationGroup *)self->_disambiguationGroup disambiguationLists];
      v11 = [v10 objectAtIndex:v8];

      uint64_t v63 = v8;
      v12 = [(NSMutableArray *)self->_disambiguationItemsList objectAtIndex:v8];
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      id obj = v9;
      id v13 = [obj countByEnumeratingWithState:&v69 objects:v76 count:16];
      if (!v13) {
        goto LABEL_23;
      }
      id v14 = v13;
      uint64_t v15 = *(void *)v70;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v70 != v15) {
            objc_enumerationMutation(obj);
          }
          v17 = *(void **)(*((void *)&v69 + 1) + 8 * i);
          objc_msgSend(v17, "sruif_setSelectionTextWithDisambiguationList:", v11);
          id v18 = [(ACAssistantDisambiguationController *)self delegate];
          id v19 = [v11 disambiguationKey];
          uint64_t v20 = [v18 siriViewController:self disambiguationItemForListItem:v17 disambiguationKey:v19];

          if (!v20)
          {
            uint64_t v20 = +[SiriUIDisambiguationItem disambiguationItem];
            v21 = [v17 object];
            v22 = +[NSString stringWithFormat:@"Missing %@ Disambig", objc_opt_class()];
            [v20 setTitle:v22];
          }
          v23 = [v20 title];
          id v24 = [v23 length];

          if (!v24)
          {
            v25 = [v17 title];
            id v26 = [v25 length];

            if (v26)
            {
              uint64_t v27 = [v17 title];
            }
            else
            {
              v28 = [v17 selectionText];
              id v29 = [v28 length];

              if (!v29) {
                goto LABEL_17;
              }
              uint64_t v27 = [v17 selectionText];
            }
            v30 = (void *)v27;
            [v20 setTitle:v27];
          }
LABEL_17:
          v31 = [v20 title];

          if (!v31)
          {
            v32 = +[NSAssertionHandler currentHandler];
            v33 = [v17 object];
            [v32 handleFailureInMethod:a2, self, @"ACAssistantDisambiguationController.m", 160, @"Disambiguation item is required to have a title set %@", v33 object file lineNumber description];
          }
          if ([v20 showsFavoriteStar]) {
            self->_hasFavoritesStarColumn = 1;
          }
          [v12 addObject:v20];
        }
        id v14 = [obj countByEnumeratingWithState:&v69 objects:v76 count:16];
      }
      while (v14);
LABEL_23:

      uint64_t v8 = v63 + 1;
      if (v63 + 1 >= (unint64_t)[(NSMutableArray *)self->_filteredItemsList count])
      {
LABEL_24:
        filteredItemsList = self->_filteredItemsList;
        v35 = v60;
        [v60 setListItems:filteredItemsList];
        goto LABEL_46;
      }
    }
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  v36 = self->_filteredItems;
  id v37 = [(NSArray *)v36 countByEnumeratingWithState:&v65 objects:v75 count:16];
  if (!v37) {
    goto LABEL_44;
  }
  id v38 = v37;
  uint64_t v39 = *(void *)v66;
  do
  {
    for (j = 0; j != v38; j = (char *)j + 1)
    {
      if (*(void *)v66 != v39) {
        objc_enumerationMutation(v36);
      }
      v41 = *(void **)(*((void *)&v65 + 1) + 8 * (void)j);
      objc_msgSend(v41, "sruif_setSelectionTextWithDisambiguationList:", self->_disambiguationList);
      v42 = [(ACAssistantDisambiguationController *)self delegate];
      long long v43 = [(SAUIDisambiguationList *)self->_disambiguationList disambiguationKey];
      long long v44 = [v42 siriViewController:self disambiguationItemForListItem:v41 disambiguationKey:v43];

      if (!v44)
      {
        long long v44 = +[SiriUIDisambiguationItem disambiguationItem];
        long long v45 = [v41 object];
        long long v46 = +[NSString stringWithFormat:@"Missing %@ Disambig", objc_opt_class()];
        [v44 setTitle:v46];
      }
      v47 = [v44 title];
      id v48 = [v47 length];

      if (!v48)
      {
        __int16 v49 = [v41 title];
        id v50 = [v49 length];

        if (v50)
        {
          uint64_t v51 = [v41 title];
        }
        else
        {
          v52 = [v41 selectionText];
          id v53 = [v52 length];

          if (!v53) {
            goto LABEL_38;
          }
          uint64_t v51 = [v41 selectionText];
        }
        v54 = (void *)v51;
        [v44 setTitle:v51];
      }
LABEL_38:
      v55 = [v44 title];

      if (!v55)
      {
        v56 = +[NSAssertionHandler currentHandler];
        v57 = [v41 object];
        [v56 handleFailureInMethod:a2, self, @"ACAssistantDisambiguationController.m", 191, @"Disambiguation item is required to have a title set %@", v57 object file lineNumber description];
      }
      if ([v44 showsFavoriteStar]) {
        self->_hasFavoritesStarColumn = 1;
      }
      [(NSMutableArray *)self->_disambiguationItems addObject:v44];
    }
    id v38 = [(NSArray *)v36 countByEnumeratingWithState:&v65 objects:v75 count:16];
  }
  while (v38);
LABEL_44:

  filteredItems = self->_filteredItems;
  v35 = v60;
  if (filteredItems)
  {
    v74 = filteredItems;
    v59 = +[NSArray arrayWithObjects:&v74 count:1];
    [v60 setListItems:v59];
  }
LABEL_46:
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ACAssistantDisambiguationController;
  [(ACAssistantDisambiguationController *)&v7 viewWillAppear:a3];
  if ([(ACAssistantDisambiguationController *)self isVirgin])
  {
    objc_super v4 = [(ACAssistantDisambiguationController *)self _picker];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(ACAssistantDisambiguationController *)self _picker];
      unsigned int v6 = [v5 showImmediately];

      if (!v6) {
        return;
      }
      objc_super v4 = [(ACAssistantDisambiguationController *)self _pickerController];
      [v4 showPicker:0];
    }
  }
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)setManageBackgroundColor:(BOOL)a3
{
  self->_manageBackgroundColor = a3;
  id v3 = [(ACAssistantDisambiguationController *)self collectionViewLayout];
  [v3 invalidateLayout];
}

- (BOOL)wantsConfirmationInsets
{
  return 0;
}

- (BOOL)removedAfterDialogProgresses
{
  return 1;
}

- (BOOL)shouldHidePriorViews
{
  return self->_preferredListItem != 0;
}

- (double)desiredHeightForWidth:(double)a3
{
  if (([(ACAssistantDisambiguationController *)self isViewLoaded] & 1) == 0) {
    [(ACAssistantDisambiguationController *)self loadView];
  }
  objc_super v4 = [(ACAssistantDisambiguationController *)self collectionView];
  v5 = [v4 collectionViewLayout];
  [v5 collectionViewContentSize];
  double v7 = v6;

  return v7;
}

- (id)alternativeAceCommandsToPerformIfNotExposingViews
{
  preferredListItem = self->_preferredListItem;
  if (!preferredListItem)
  {
    if (!self->_isGroup)
    {
      if (![(NSArray *)self->_filteredItems count]) {
        goto LABEL_12;
      }
      if (!self->_isGroup)
      {
        v12 = 0;
        goto LABEL_13;
      }
    }
    if ([(NSMutableArray *)self->_filteredItemsList count])
    {
      id v13 = [(NSMutableArray *)self->_filteredItemsList objectAtIndex:0];
      id v14 = [v13 count];

      v12 = 0;
      if (v14) {
        goto LABEL_13;
      }
    }
LABEL_12:
    uint64_t v15 = SAResultCallbackAnyRestrictionCodeValue;
    v16 = +[AFAnalytics sharedAnalytics];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_8724;
    v18[3] = &unk_185C8;
    v18[4] = v15;
    [v16 logEventWithType:1426 contextProvider:v18];

    v12 = [(SAUIDisambiguationList *)self->_disambiguationList _systemPlugin_failureCommandsForCode:v15];
    goto LABEL_13;
  }
  objc_super v4 = [(SAUIListItem *)preferredListItem aceId];
  id v5 = [v4 copy];

  double v6 = [(SAUIListItem *)self->_preferredListItem title];
  id v7 = [v6 copy];

  disambiguationList = self->_disambiguationList;
  if (!disambiguationList) {
    disambiguationList = self->_disambiguationGroup;
  }
  [(SAUIDisambiguationList *)disambiguationList af_saveItemSelection:self->_preferredListItem forType:2];
  v9 = +[AFAnalytics sharedAnalytics];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_869C;
  v19[3] = &unk_185A8;
  id v20 = v5;
  id v21 = v7;
  id v10 = v7;
  id v11 = v5;
  [v9 logEventWithType:1426 contextProvider:v19];

  v12 = [(SAUIListItem *)self->_preferredListItem commands];

LABEL_13:

  return v12;
}

- (void)siriDidDeactivate
{
  id v2 = +[AFUIDisambiguationAnalyticsManager sharedManager];
  [v2 logDisambiguationDismissedEvent];
  [v2 setListItems:0];
  [v2 setDisambiguationAssistance:0];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = a3;
  if (self->_isGroup)
  {
    if ((unint64_t)[(NSMutableArray *)self->_filteredItemsList count] <= a4)
    {
      id v8 = 0;
    }
    else
    {
      id v7 = [(NSMutableArray *)self->_filteredItemsList objectAtIndex:a4];
      id v8 = [v7 count];
    }
  }
  else
  {
    id v8 = [(NSArray *)self->_filteredItems count];
  }

  return (int64_t)v8;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  if (self->_isGroup) {
    return (int64_t)[(NSMutableArray *)self->_filteredItemsList count];
  }
  else {
    return 1;
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(objc_class *)[(ACAssistantDisambiguationController *)self cellClass] reuseIdentifier];
  v9 = [v7 dequeueReusableCellWithReuseIdentifier:v8 forIndexPath:v6];

  [v9 setHasStarColumn:self->_hasFavoritesStarColumn];
  if (self->_isGroup)
  {
    id v10 = -[NSMutableArray objectAtIndex:](self->_filteredItemsList, "objectAtIndex:", [v6 section]);
    id v11 = -[NSMutableArray objectAtIndex:](self->_disambiguationItemsList, "objectAtIndex:", [v6 section]);
    v12 = [(ACAssistantDisambiguationController *)self _picker];

    if (!v12) {
      objc_msgSend(v9, "setLastRow:", objc_msgSend(v6, "row") == (char *)objc_msgSend(v10, "count") - 1);
    }
    id v13 = objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v6, "row"));
    [v9 setItem:v13];

    goto LABEL_9;
  }
  id v14 = [(ACAssistantDisambiguationController *)self _picker];

  if (!v14) {
    objc_msgSend(v9, "setLastRow:", objc_msgSend(v6, "row") == (char *)-[NSArray count](self->_filteredItems, "count") - 1);
  }
  if ([(NSMutableArray *)self->_disambiguationItems count])
  {
    id v10 = -[NSMutableArray objectAtIndex:](self->_disambiguationItems, "objectAtIndex:", [v6 row]);
    [v9 setItem:v10];
LABEL_9:

    goto LABEL_10;
  }
  v17 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
    sub_DACC((uint64_t *)&self->_disambiguationItems, v17);
  }
LABEL_10:
  if (self->_manageBackgroundColor)
  {
    uint64_t v15 = +[UIColor siriui_snippetBackgroundColor];
    [v9 setBackgroundColor:v15];
  }

  return v9;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v9 = a3;
  id v10 = (NSString *)a4;
  id v11 = a5;
  if (UICollectionElementKindSectionHeader != v10)
  {
    id v20 = +[NSAssertionHandler currentHandler];
    id v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    [v20 handleFailureInMethod:a2, self, @"ACAssistantDisambiguationController.m", 344, @"%@ asked to provide a supplementary element for an unsupported kind %@ at %@", v22, v10, v11 object file lineNumber description];
  }
  v12 = [(id)objc_opt_class() reuseIdentifier];
  id v13 = [v9 dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:v12 forIndexPath:v11];

  if (self->_isGroup)
  {
    id v14 = [(SAUIDisambiguationGroup *)self->_disambiguationGroup disambiguationLists];
    uint64_t v15 = objc_msgSend(v14, "objectAtIndex:", objc_msgSend(v11, "section"));

    v16 = [v15 groupTitle];
    id v17 = [v16 length];

    if (v17)
    {
      id v18 = [v15 groupTitle];
      [v13 setText:v18];
    }
  }

  return v13;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  if (self->_isGroup)
  {
    id v7 = [(SAUIDisambiguationGroup *)self->_disambiguationGroup disambiguationLists];
    id v8 = [v7 objectAtIndex:a5];

    id v9 = [v8 groupTitle];
    id v10 = [v9 length];

    if (v10)
    {
      id v11 = [(ACAssistantDisambiguationController *)self delegate];
      [v11 siriViewControllerExpectedWidth:self];
      double v13 = v12;
      id v14 = [v8 groupTitle];
      +[SiriUIPlatterSectionHeaderCollectionViewCell sizeThatFits:text:](SiriUIPlatterSectionHeaderCollectionViewCell, "sizeThatFits:text:", v14, v13, 1.79769313e308);
      CGFloat width = v15;
      CGFloat height = v17;
    }
    else
    {
      CGFloat width = CGSizeZero.width;
      CGFloat height = CGSizeZero.height;
    }
  }
  else
  {
    CGFloat width = CGSizeZero.width;
    CGFloat height = CGSizeZero.height;
  }
  double v19 = width;
  double v20 = height;
  result.CGFloat height = v20;
  result.CGFloat width = v19;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectItemAtIndexPath:v6 animated:1];
  if (self->_isGroup)
  {
    -[NSMutableArray objectAtIndex:](self->_filteredItemsList, "objectAtIndex:", [v6 section]);
    id v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = self->_filteredItems;
  }
  id v8 = v7;
  id v9 = -[NSArray objectAtIndex:](v7, "objectAtIndex:", [v6 row]);
  id v10 = [v9 commands];
  id v11 = [v9 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v13 = objc_alloc_init((Class)SAUIDisambiguationItemSelected);
    id v14 = +[NSUUID UUID];
    double v15 = [v14 UUIDString];
    [v13 setAceId:v15];

    v16 = [v9 aceId];
    [v13 setSelectedAceId:v16];

    id v21 = v13;
    double v17 = +[NSArray arrayWithObjects:&v21 count:1];
    uint64_t v18 = [v10 arrayByAddingObjectsFromArray:v17];

    id v10 = (void *)v18;
  }
  double v19 = [(ACAssistantDisambiguationController *)self delegate];
  [v19 siriViewController:self addSelectionResponse:v9];

  double v20 = [(ACAssistantDisambiguationController *)self delegate];
  [v20 siriViewController:self performAceCommands:v10];
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  +[ACAssistantDisambiguationCell defaultHeight];
  double v10 = v9;
  if (self->_isGroup)
  {
    id v11 = -[NSMutableArray objectAtIndex:](self->_disambiguationItemsList, "objectAtIndex:", [v8 section]);
    double v12 = objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v8, "row"));
  }
  else
  {
    p_disambiguationItems = &self->_disambiguationItems;
    id v14 = [(NSMutableArray *)*p_disambiguationItems count];
    if (v14 <= [v8 row])
    {
      double v15 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
        sub_DB5C((uint64_t *)p_disambiguationItems, v15, v8);
      }
      double v12 = 0;
    }
    else
    {
      double v12 = -[NSMutableArray objectAtIndex:](*p_disambiguationItems, "objectAtIndex:", [v8 row]);
    }
  }
  v16 = [v12 imageView];

  if (v16)
  {
    +[ACAssistantDisambiguationCell defaultHeightWithImageView];
    goto LABEL_14;
  }
  uint64_t v18 = [v12 subtitle];
  if (v18)
  {

LABEL_13:
    +[ACAssistantDisambiguationCell defaultHeightWithSubtitle];
    goto LABEL_14;
  }
  double v19 = [v12 extraDisambiguationSubText];

  if (v19) {
    goto LABEL_13;
  }
  id v24 = [v12 headingText];

  if (!v24) {
    goto LABEL_15;
  }
  +[ACAssistantDisambiguationCell defaultHeightWithHeading];
LABEL_14:
  double v10 = v17;
LABEL_15:
  [v7 size];
  double v21 = v20;

  double v22 = v21;
  double v23 = v10;
  result.CGFloat height = v23;
  result.CGFloat width = v22;
  return result;
}

- (id)_picker
{
  if (self->_isGroup)
  {
    id v2 = [(SAUIDisambiguationGroup *)self->_disambiguationGroup disambiguationLists];
    id v3 = [v2 firstObject];
    objc_super v4 = [v3 domainObjectPicker];
  }
  else
  {
    objc_super v4 = [(SAUIDisambiguationList *)self->_disambiguationList domainObjectPicker];
  }

  return v4;
}

- (Class)footerViewClass
{
  id v2 = [(ACAssistantDisambiguationController *)self _picker];

  if (v2)
  {
    id v3 = objc_opt_class();
  }
  else
  {
    id v3 = 0;
  }

  return (Class)v3;
}

- (id)_pickerController
{
  pickerController = self->_pickerController;
  if (!pickerController)
  {
    objc_super v4 = [(ACAssistantDisambiguationController *)self _picker];
    id v5 = +[SiriUIObjectPickerViewController pickerControllerWithPicker:v4];
    id v6 = self->_pickerController;
    self->_pickerController = v5;

    [(SiriUIObjectPickerViewController *)self->_pickerController setPickerDelegate:self];
    pickerController = self->_pickerController;
  }

  return pickerController;
}

- (void)configureReusableFooterView:(id)a3
{
  id v4 = a3;
  id v5 = [v4 subviews];
  [v5 makeObjectsPerformSelector:"removeFromSuperview"];

  id v7 = objc_alloc_init((Class)SiriUIObjectPickerButtonView);
  id v6 = [v7 button];
  [v6 addTarget:self action:"_showPicker:" forControlEvents:64];

  [v7 setAutoresizingMask:18];
  [v4 bounds];
  objc_msgSend(v7, "setFrame:");
  [v4 addSubview:v7];
}

- (void)_showPicker:(id)a3
{
  id v3 = [(ACAssistantDisambiguationController *)self _pickerController];
  [v3 showPicker:0];
}

- (double)desiredHeightForFooterView
{
  id v2 = [(ACAssistantDisambiguationController *)self _picker];
  if (v2)
  {
    +[SiriUIObjectPickerButtonView defaultHeight];
    double v4 = v3;
  }
  else
  {
    double v4 = 0.0;
  }

  return v4;
}

- (void)pickerViewController:(id)a3 shouldPresentPicker:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(ACAssistantDisambiguationController *)self delegate];
  [v9 siriSnippetViewController:self shouldPresentPicker:v8 completion:v7];
}

- (void)pickerViewController:(id)a3 willPresentPicker:(id)a4
{
  id v5 = a4;
  id v6 = [(ACAssistantDisambiguationController *)self delegate];
  [v6 cancelRequestForSiriSnippetViewController:self];

  id v7 = [(ACAssistantDisambiguationController *)self delegate];
  [v7 siriSnippetViewController:self setStatusViewHidden:1];

  id v8 = [(ACAssistantDisambiguationController *)self _privateDelegate];
  [v8 siriSnippetViewController:self willPresentViewController:v5];
}

- (void)pickerViewController:(id)a3 didSelectObject:(id)a4 fromPicker:(id)a5
{
  id v6 = a4;
  id v7 = [(ACAssistantDisambiguationController *)self delegate];
  id v10 = v6;
  id v8 = +[NSArray arrayWithObjects:&v10 count:1];

  [v7 siriViewController:self performAceCommands:v8];
  id v9 = [(ACAssistantDisambiguationController *)self delegate];
  [v9 siriSnippetViewController:self setStatusViewHidden:0];
}

- (void)pickerViewController:(id)a3 willDismissPicker:(id)a4
{
  id v5 = a4;
  id v6 = [(ACAssistantDisambiguationController *)self _privateDelegate];
  [v6 siriSnippetViewController:self willDismissViewController:v5];
}

- (void)pickerViewController:(id)a3 didDismissPicker:(id)a4
{
  id v5 = [(ACAssistantDisambiguationController *)self delegate];
  [v5 siriSnippetViewController:self setStatusViewHidden:0];
}

- (void)pickerViewController:(id)a3 didRequestKeyboardWithVisibility:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(ACAssistantDisambiguationController *)self _privateDelegate];
  [v6 siriSnippetViewController:self didRequestKeyboardWithVisibility:v4];
}

- (BOOL)_canShowWhileLocked
{
  return _SiriUISafeForLockScreen(self, a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredListItem, 0);
  objc_storeStrong((id *)&self->_pickerController, 0);
  objc_storeStrong((id *)&self->_disambiguationItemsList, 0);
  objc_storeStrong((id *)&self->_disambiguationItems, 0);
  objc_storeStrong((id *)&self->_filteredItemsList, 0);
  objc_storeStrong((id *)&self->_filteredItems, 0);
  objc_storeStrong((id *)&self->_disambiguationGroup, 0);

  objc_storeStrong((id *)&self->_disambiguationList, 0);
}

@end