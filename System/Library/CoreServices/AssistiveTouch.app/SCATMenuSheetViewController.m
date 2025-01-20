@interface SCATMenuSheetViewController
- (SCATMenuSheetViewController)initWithSheet:(id)a3;
- (SCATModernMenuSheet)sheet;
- (SCATModernMenuSheetCollectionViewController)collectionViewController;
- (SCATModernMenuViewController)menuViewController;
- (SCATStaticElementProvider)elementProvider;
- (UICollectionViewLayout)collectionViewLayout;
- (id)_scannerGroupsForMenuItems:(id)a3;
- (id)_visibleCellForMenuItem:(id)a3;
- (unint64_t)currentPage;
- (unint64_t)numberOfItemsInFirstPage;
- (unint64_t)numberOfItemsPerRow;
- (unint64_t)numberOfPagesRequired;
- (void)_setupMenuSheet;
- (void)flashCellForMenuItem:(id)a3;
- (void)reload;
- (void)setCollectionViewController:(id)a3;
- (void)setCollectionViewLayout:(id)a3;
- (void)setSheet:(id)a3;
- (void)updateCellForMenuItem:(id)a3;
@end

@implementation SCATMenuSheetViewController

- (SCATMenuSheetViewController)initWithSheet:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCATMenuSheetViewController;
  v5 = [(SCATMenuSheetViewController *)&v9 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    [(SCATMenuSheetViewController *)v5 setSheet:v4];
    v7 = [(SCATMenuSheetViewController *)v6 sheet];
    [v7 setElementProviderDelegate:v6];

    [(SCATMenuSheetViewController *)v6 _setupMenuSheet];
  }

  return v6;
}

- (void)_setupMenuSheet
{
  v5 = objc_alloc_init(SCATMenuCollectionViewFlowLayout);
  -[SCATMenuCollectionViewFlowLayout setSectionInset:](v5, "setSectionInset:", 0.0, 0.0, 0.0, 0.0);
  [(SCATMenuSheetViewController *)self setCollectionViewLayout:v5];
  v3 = [[SCATModernMenuSheetCollectionViewController alloc] initWithCollectionViewLayout:v5];
  [(SCATMenuSheetViewController *)self setCollectionViewController:v3];
  id v4 = [(SCATMenuSheetViewController *)self sheet];
  [(SCATModernMenuSheetCollectionViewController *)v3 setMenuSheet:v4];
}

- (SCATStaticElementProvider)elementProvider
{
  v2 = [(SCATMenuSheetViewController *)self collectionViewController];
  v3 = [v2 collectionView];

  [v3 setClipsToBounds:0];
  id v4 = [v3 collectionViewLayout];
  [v4 collectionViewContentSize];
  double v6 = v5;
  double v8 = v7;

  if (v6 > 0.0 && v8 > 0.0)
  {
    objc_super v9 = [v3 superview];
    objc_msgSend(v9, "setBounds:", 0.0, 0.0, v6, v8);
  }
  [v3 layoutIfNeeded];
  v10 = [v3 indexPathsForVisibleItems];
  v11 = [v10 sortedArrayUsingComparator:&stru_1001ACE58];

  v28 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v11 count]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v12 = v11;
  id v13 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v30;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = [v3 cellForItemAtIndexPath:*(void *)(*((void *)&v29 + 1) + 8 * i)];
        if (v17)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v18 = v17;
            v19 = [v18 menuItem];
            unsigned __int8 v20 = [v19 isDisabled];

            if ((v20 & 1) == 0)
            {
              [v18 setParentGroup:0];
              [v28 addObject:v18];
            }
          }
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v14);
  }

  if ([v28 count])
  {
    v21 = +[AXSettings sharedInstance];
    unsigned int v22 = [v21 assistiveTouchGroupElementsEnabled];

    v23 = [SCATStaticElementProvider alloc];
    if (v22) {
      [(SCATMenuSheetViewController *)self _scannerGroupsForMenuItems:v28];
    }
    else {
    v25 = [v28 axMapObjectsUsingBlock:&stru_1001ACE98];
    }
    v24 = [(SCATStaticElementProvider *)v23 initWithElements:v25];
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (unint64_t)numberOfItemsPerRow
{
  v2 = [(SCATMenuSheetViewController *)self collectionViewLayout];
  id v3 = [v2 maxItemsPerRow];

  return (unint64_t)v3;
}

- (id)_scannerGroupsForMenuItems:(id)a3
{
  id v3 = a3;
  id v4 = [v3 count];
  if ((unint64_t)v4 > 1)
  {
    id v6 = v4;
    double v7 = [v3 objectAtIndex:0];
    [v7 frame];
    double v9 = v8;
    uint64_t v10 = 1;
    while (1)
    {
      v11 = [v3 objectAtIndex:v10];
      [v11 frame];
      double v13 = v12;

      if (v13 != v9) {
        break;
      }
      if (v6 == (id)++v10)
      {
        double v5 = [v3 axMapObjectsUsingBlock:&stru_1001ACED8];
        goto LABEL_30;
      }
    }
    v39 = v7;
    double v5 = +[NSMutableArray array];
    id v14 = +[NSMutableArray array];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v15 = v3;
    id v16 = [v15 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v41 = *(void *)v43;
      do
      {
        id v18 = 0;
        id v40 = v17;
        do
        {
          if (*(void *)v43 != v41) {
            objc_enumerationMutation(v15);
          }
          v19 = *(void **)(*((void *)&v42 + 1) + 8 * (void)v18);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v38 = v15;
            _AXAssert();
          }
          if (objc_msgSend(v14, "count", v38))
          {
            [v19 frame];
            if (v20 == v9)
            {
              v21 = [v19 menuItem];
              unsigned int v22 = [v21 scatElement];
              [v14 addObject:v22];
            }
            else
            {
              if ([v14 count] == (id)1)
              {
                v26 = [v14 objectAtIndex:0];
                [v5 addObject:v26];
              }
              else
              {
                v26 = +[AXElementGroup groupWithElements:v14 label:0];
                [v5 addObject:v26];
                v27 = sub_100040EC8(@"MENU_GROUP_ROW");
                [v5 count];
                v38 = AXFormatInteger();
                v28 = +[NSString stringWithFormat:v27];
                [v26 setAccessibilityLabel:v28];
              }
              long long v29 = [v19 menuItem];
              long long v30 = [v29 scatElement];
              uint64_t v31 = +[NSMutableArray arrayWithObject:v30];

              [v19 frame];
              double v9 = v32;
              id v14 = (void *)v31;
              id v17 = v40;
            }
          }
          else
          {
            v23 = [v19 menuItem];
            v24 = [v23 scatElement];
            [v14 addObject:v24];

            [v19 frame];
            double v9 = v25;
          }
          id v18 = (char *)v18 + 1;
        }
        while (v17 != v18);
        id v17 = [v15 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v17);
    }

    if ([v14 count])
    {
      if ([v14 count] == (id)1)
      {
        v33 = [v14 objectAtIndex:0];
        [v5 addObject:v33];
      }
      else
      {
        v33 = +[AXElementGroup groupWithElements:v14 label:0];
        [v5 addObject:v33];
        v34 = sub_100040EC8(@"MENU_GROUP_ROW");
        [v5 count];
        v35 = AXFormatInteger();
        v36 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v34, v35);
        [v33 setAccessibilityLabel:v36];
      }
    }

    double v7 = v39;
LABEL_30:
  }
  else
  {
    double v5 = [v3 axMapObjectsUsingBlock:&stru_1001ACEB8];
  }

  return v5;
}

- (unint64_t)currentPage
{
  unint64_t v3 = [(SCATMenuSheetViewController *)self numberOfItemsInFirstPage];
  id v4 = [(SCATMenuSheetViewController *)self collectionViewController];
  unint64_t v5 = (unint64_t)[v4 visibleItemOffset];

  if (v3)
  {
    double v7 = [(SCATMenuSheetViewController *)self collectionViewController];
    id v8 = [v7 visibleItemOffset];

    if ((unint64_t)v8 < v3) {
      return 0;
    }
    v5 -= v3;
    unint64_t v6 = 1;
  }
  else
  {
    unint64_t v6 = 0;
  }
  double v9 = [(SCATMenuSheetViewController *)self collectionViewController];
  uint64_t v10 = [v9 collectionView];
  v11 = [v10 collectionViewLayout];

  if (v11) {
    v6 += v5 / (unint64_t)[v11 maxVisibleItems];
  }
  else {
    _AXAssert();
  }

  return v6;
}

- (unint64_t)numberOfPagesRequired
{
  unint64_t v3 = [(SCATMenuSheetViewController *)self collectionViewController];
  id v4 = [v3 collectionView];
  unint64_t v5 = [v4 collectionViewLayout];

  unint64_t v6 = [(SCATMenuSheetViewController *)self numberOfItemsInFirstPage];
  double v7 = [(SCATMenuSheetViewController *)self sheet];
  id v8 = [v7 menuItems];
  double v9 = (char *)[v8 count];

  if (v6) {
    unint64_t v10 = v6;
  }
  else {
    unint64_t v10 = 0;
  }
  unint64_t v11 = (unint64_t)&v9[-v10];
  unint64_t v12 = (unint64_t)[v5 maxVisibleItems];
  if (v6) {
    unint64_t v13 = v11 / v12 + 1;
  }
  else {
    unint64_t v13 = v11 / v12;
  }
  if (v11 % (unint64_t)[v5 maxVisibleItems]) {
    ++v13;
  }

  return v13;
}

- (unint64_t)numberOfItemsInFirstPage
{
  v2 = [(SCATMenuSheetViewController *)self sheet];
  id v3 = [v2 numberOfItemsInFirstPage];

  return (unint64_t)v3;
}

- (void)updateCellForMenuItem:(id)a3
{
  id v3 = [(SCATMenuSheetViewController *)self _visibleCellForMenuItem:a3];
  [v3 update];
}

- (void)flashCellForMenuItem:(id)a3
{
  id v3 = [(SCATMenuSheetViewController *)self _visibleCellForMenuItem:a3];
  [v3 flash];
}

- (id)_visibleCellForMenuItem:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SCATMenuSheetViewController *)self collectionViewController];
  unint64_t v6 = [v5 collectionView];
  double v7 = [v6 visibleCells];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000764B4;
  v12[3] = &unk_1001ACF00;
  id v13 = v4;
  id v8 = v4;
  double v9 = [v7 axFilterObjectsUsingBlock:v12];
  unint64_t v10 = [v9 firstObject];

  return v10;
}

- (void)reload
{
  id v3 = [(SCATMenuSheetViewController *)self collectionViewController];
  [v3 adjustVisibleItemOffsetForPageBoundary];

  id v4 = [(SCATMenuSheetViewController *)self collectionViewController];
  [v4 reloadCollectionView];
}

- (SCATModernMenuSheet)sheet
{
  return self->_sheet;
}

- (void)setSheet:(id)a3
{
}

- (SCATModernMenuSheetCollectionViewController)collectionViewController
{
  return self->_collectionViewController;
}

- (void)setCollectionViewController:(id)a3
{
}

- (SCATModernMenuViewController)menuViewController
{
  return self->_menuViewController;
}

- (UICollectionViewLayout)collectionViewLayout
{
  return self->_collectionViewLayout;
}

- (void)setCollectionViewLayout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_menuViewController, 0);
  objc_storeStrong((id *)&self->_collectionViewController, 0);

  objc_storeStrong((id *)&self->_sheet, 0);
}

@end