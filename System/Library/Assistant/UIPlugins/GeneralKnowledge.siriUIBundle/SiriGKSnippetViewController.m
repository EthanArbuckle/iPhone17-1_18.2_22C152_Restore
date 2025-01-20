@interface SiriGKSnippetViewController
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)isManagingBackgroundColor;
- (BOOL)isMemoryIntensive;
- (BOOL)wantsToManageBackgroundColor;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (Class)transparentHeaderViewClass;
- (SiriGKSnippetViewController)initWithSnippet:(id)a3;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (double)desiredHeightForTransparentHeaderView;
- (double)desiredHeightForWidth:(double)a3;
- (id)_podForSection:(int64_t)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6;
- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)dragItemForIndexPath:(id)a3;
- (id)navigationTitle;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_disambiguationHeaderTapped;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)configureReusableTransparentHeaderView:(id)a3;
- (void)loadView;
- (void)setManageBackgroundColor:(BOOL)a3;
@end

@implementation SiriGKSnippetViewController

- (SiriGKSnippetViewController)initWithSnippet:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(GKCollectionViewFlowLayout);
  v15.receiver = self;
  v15.super_class = (Class)SiriGKSnippetViewController;
  v6 = [(SiriGKSnippetViewController *)&v15 initWithCollectionViewLayout:v5];

  if (v6)
  {
    [(SiriGKSnippetViewController *)v6 setSnippet:v4];
    v7 = [(SiriGKSnippetViewController *)v6 collectionViewLayout];
    [v7 setPodList:v6->_podArray];
    [v7 setDelegate:v6];
    v8 = [v4 title];

    if (v8)
    {
      v9 = [v4 title];
      [(SiriGKSnippetViewController *)v6 setTitle:v9];
    }
    v10 = [v4 subtitle];

    if (v10)
    {
      v11 = [v4 subtitle];
      [(SiriGKSnippetViewController *)v6 setSubtitle:v11];
    }
    -[SiriGKSnippetViewController setDefaultViewInsets:](v6, "setDefaultViewInsets:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    uint64_t v12 = +[NSMutableArray array];
    podArray = v6->_podArray;
    v6->_podArray = (NSMutableArray *)v12;
  }
  return v6;
}

- (void)_disambiguationHeaderTapped
{
  id v6 = +[NSIndexPath indexPathForRow:0 inSection:[(NSMutableArray *)self->_podArray indexOfObject:self->_bottomAlternateResultsPod]];
  v3 = [(SiriGKSnippetViewController *)self collectionView];
  id v4 = [v3 layoutAttributesForItemAtIndexPath:v6];

  v5 = [(SiriGKSnippetViewController *)self delegate];
  [v4 frame];
  [v5 siriViewController:self setContentOffset:CGRectGetMinY(v8)];
}

- (void)setManageBackgroundColor:(BOOL)a3
{
  self->_manageBackgroundColor = a3;
  id v3 = [(SiriGKSnippetViewController *)self collectionViewLayout];
  [v3 invalidateLayout];
}

- (BOOL)wantsToManageBackgroundColor
{
  return self->_manageBackgroundColor;
}

- (BOOL)isMemoryIntensive
{
  return self->_containMKMapView;
}

- (BOOL)isManagingBackgroundColor
{
  return self->_manageBackgroundColor;
}

- (void)loadView
{
  v49.receiver = self;
  v49.super_class = (Class)SiriGKSnippetViewController;
  [(SiriGKSnippetViewController *)&v49 loadView];
  id v3 = [(SiriGKSnippetViewController *)self snippet];
  id v4 = [v3 appPunchOut];
  v5 = [v4 bundleId];
  unsigned __int8 v6 = [v5 isEqualToString:@"com.apple.AppStore"];

  if (v6)
  {
    v7 = 0;
  }
  else
  {
    CGRect v8 = [v3 appPunchOut];
    v7 = [v8 punchOutUri];
  }
  v9 = [(SiriGKSnippetViewController *)self delegate];
  v10 = [v9 persistentDataStoreForSiriViewController:self];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = [v3 pods];
  id v11 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v46;
    v43 = v10;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v46 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v45 + 1) + 8 * (void)v14);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v16 = [[SiriGKWebLinkPod alloc] initWithPod:v15 safariBackURL:v7];
          goto LABEL_16;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v17 = SiriGKImagePod;
LABEL_15:
          v16 = (SiriGKWebLinkPod *)[[v17 alloc] initWithPod:v15 safariBackURL:v7 usingPersistentStore:v10];
          goto LABEL_16;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v17 = SiriGKVideoPod;
          goto LABEL_15;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v19 = [[SiriGKAlternateResultsPod alloc] initWithPod:v15];
          [(NSMutableArray *)self->_podArray addObject:v19];
          bottomAlternateResultsPod = (SiriGKDisambiguationPod *)self->_bottomAlternateResultsPod;
          self->_bottomAlternateResultsPod = &v19->super;
          goto LABEL_17;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v20 = [v3 title];
          if ([v20 length])
          {
            v21 = [v3 subtitle];
            id v22 = [v21 length];

            if (v22)
            {
              uint64_t v23 = [v3 subtitle];
              goto LABEL_33;
            }
          }
          else
          {
          }
          v24 = objc_msgSend(v3, "title", v43);
          id v25 = [v24 length];

          if (v25)
          {
            uint64_t v23 = [v3 title];
LABEL_33:
            bottomAlternateResultsPod = (SiriGKDisambiguationPod *)v23;
          }
          else
          {
            bottomAlternateResultsPod = 0;
          }
          v27 = [SiriGKMapPod alloc];
          if (objc_msgSend(v3, "sirigk_isMapOnlySnippet")) {
            double v28 = 261.0;
          }
          else {
            double v28 = 175.0;
          }
          v29 = -[SiriGKMapPod initWithMapPod:snippetTitle:mapHeight:](v27, "initWithMapPod:snippetTitle:mapHeight:", v15, bottomAlternateResultsPod, v28, v43);
          [(NSMutableArray *)self->_podArray addObject:v29];
          self->_containMKMapView = 1;

          v10 = v43;
          goto LABEL_17;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v16 = [[SiriGKPropertyPod alloc] initWithPropertyPod:v15];
          goto LABEL_16;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v16 = [[SiriGKSummaryPod alloc] initWithPod:v15 usingPersistentStore:v10];
          goto LABEL_16;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v26 = [[SiriGKDisambiguationPod alloc] initWithDisambiguationPod:v15];
          bottomAlternateResultsPod = self->_disambiguationPod;
          self->_disambiguationPod = v26;
          goto LABEL_17;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v16 = [[SiriGKSourceLinkPod alloc] initWithSourceLinkPod:v15];
LABEL_16:
          bottomAlternateResultsPod = (SiriGKDisambiguationPod *)v16;
          -[NSMutableArray addObject:](self->_podArray, "addObject:", v16, v43);
LABEL_17:
        }
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v30 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
      id v12 = v30;
    }
    while (v30);
  }

  v31 = [v3 appPunchOut];

  if (v31)
  {
    v32 = [v3 appPunchOut];
    [(SiriGKSnippetViewController *)self setHeaderPunchOut:v32];

    [(SiriGKSnippetViewController *)self setShowHeaderChevron:0];
    v33 = [SiriGKAttributionPod alloc];
    v34 = [v3 appPunchOut];
    v35 = [(SiriGKAttributionPod *)v33 initWithPunchOut:v34 usingPersistentStore:v10];

    [(NSMutableArray *)self->_podArray addObject:v35];
  }
  v36 = [(SiriGKSnippetViewController *)self collectionView];
  uint64_t v37 = objc_opt_class();
  v38 = +[SiriUIContentCollectionViewCell reuseIdentifier];
  [v36 registerClass:v37 forCellWithReuseIdentifier:v38];

  uint64_t v39 = objc_opt_class();
  v40 = +[SiriGKReusableSupplementaryView reuseIdentifier];
  [v36 registerClass:v39 forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:v40];

  uint64_t v41 = objc_opt_class();
  v42 = +[SiriGKReusableSupplementaryView reuseIdentifier];
  [v36 registerClass:v41 forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:v42];
}

- (double)desiredHeightForWidth:(double)a3
{
  if (([(SiriGKSnippetViewController *)self isViewLoaded] & 1) == 0) {
    [(SiriGKSnippetViewController *)self loadView];
  }
  id v4 = [(SiriGKSnippetViewController *)self collectionViewLayout];
  [v4 collectionViewContentSize];
  double v6 = v5;

  return v6;
}

- (Class)transparentHeaderViewClass
{
  if (self->_disambiguationPod)
  {
    v2 = objc_opt_class();
  }
  else
  {
    v2 = 0;
  }

  return (Class)v2;
}

- (void)configureReusableTransparentHeaderView:(id)a3
{
  id v8 = a3;
  disambiguationPod = self->_disambiguationPod;
  if (disambiguationPod)
  {
    double v5 = [(SiriGKDisambiguationPod *)disambiguationPod title];
    double v6 = [(SiriGKDisambiguationPod *)self->_disambiguationPod subtitle];
    [v8 configureWithTitle:v5 subtitle:v6];

    v7 = [v8 headerButton];
    [v7 addTarget:self action:"_disambiguationHeaderTapped" forControlEvents:64];
  }
}

- (double)desiredHeightForTransparentHeaderView
{
  if (self->_disambiguationPod)
  {
    v2 = objc_opt_class();
    [v2 defaultHeight];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SiriGKSnippetViewController;
    [(SiriGKSnippetViewController *)&v4 desiredHeightForTransparentHeaderView];
  }
  return result;
}

- (id)navigationTitle
{
  id v3 = [(SiriGKSnippetViewController *)self snippet];
  unsigned int v4 = objc_msgSend(v3, "sirigk_isMapOnlySnippet");

  if (v4)
  {
    double v5 = SiriGKLocalizedString(@"MAP_POD_NAVIGATION_TITLE");
  }
  else
  {
    double v6 = [(SiriGKSnippetViewController *)self snippet];
    double v5 = [v6 title];
  }

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SiriGKSnippetViewController *)self collectionView];
  v9 = +[SiriUIContentCollectionViewCell reuseIdentifier];
  v10 = [v8 dequeueReusableCellWithReuseIdentifier:v9 forIndexPath:v7];

  id v11 = -[SiriGKSnippetViewController _podForSection:](self, "_podForSection:", [v7 section]);
  if (v11)
  {
    id v28 = v6;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v12 = [v10 contentView];
    uint64_t v13 = [v12 subviews];

    id v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v30;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v18 removeFromSuperview];
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v15);
    }

    v19 = [v7 section];
    id v6 = v28;
    if (v19 == (char *)[(SiriGKSnippetViewController *)self numberOfSectionsInCollectionView:v28]- 1)
    {
      BOOL v20 = 0;
    }
    else
    {
      v21 = -[SiriGKSnippetViewController _podForSection:](self, "_podForSection:", (char *)[v7 section] + 1);
      id v22 = [v21 headerView];

      BOOL v20 = v22 == 0;
    }
    uint64_t v23 = [v7 row];
    if (v23 != (char *)-[SiriGKSnippetViewController collectionView:numberOfItemsInSection:](self, "collectionView:numberOfItemsInSection:", v28, [v7 section])- 1|| v20)
    {
      id v24 = [v11 keylineType];
    }
    else
    {
      id v24 = 0;
    }
    [v10 setKeylineType:v24];
    [v10 setHasChevron:0];
    id v25 = objc_msgSend(v11, "viewAtIndex:", objc_msgSend(v7, "item"));
    [v10 setCustomView:v25];
    [v25 edgeInsets];
    objc_msgSend(v10, "setCustomViewEdgeInsets:");
    if (self->_manageBackgroundColor)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v26 = +[UIColor siriui_snippetBackgroundColor];
        [v10 setBackgroundColor:v26];
      }
    }
  }

  return v10;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = -[SiriGKSnippetViewController _podForSection:](self, "_podForSection:", [v8 section]);
  v10 = [(SiriGKSnippetViewController *)self collectionView];
  id v11 = +[SiriGKReusableSupplementaryView reuseIdentifier];
  id v12 = [v10 dequeueReusableSupplementaryViewOfKind:v7 withReuseIdentifier:v11 forIndexPath:v8];

  if ([v7 isEqualToString:UICollectionElementKindSectionHeader])
  {
    uint64_t v13 = [v9 headerView];
    if (!v13) {
      goto LABEL_12;
    }
LABEL_11:
    [v12 bounds];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    [v9 headerInsets];
    objc_msgSend(v13, "setFrame:", v16 + v26, v18 + v23, v20 - (v26 + v24), v22 - (v23 + v25));
    [v12 setSubview:v13];

    goto LABEL_12;
  }
  if ([v7 isEqualToString:UICollectionElementKindSectionFooter])
  {
    if ((-[SiriGKSnippetViewController _podForSection:](self, "_podForSection:", (char *)[v8 section] + 1), id v14 = objc_claimAutoreleasedReturnValue(), objc_opt_class(), (objc_opt_isKindOfClass())|| (objc_opt_class(), (objc_opt_isKindOfClass()))&& (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      uint64_t v13 = 0;
    }
    else
    {
      uint64_t v13 = [v9 footerView];
    }

    if (v13) {
      goto LABEL_11;
    }
  }
LABEL_12:

  return v12;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  unsigned int v4 = [(SiriGKSnippetViewController *)self _podForSection:a4];
  id v5 = [v4 viewCount];

  return (int64_t)v5;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return (int64_t)[(NSMutableArray *)self->_podArray count];
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  id v5 = -[SiriGKSnippetViewController _podForSection:](self, "_podForSection:", a5, a4);
  [v5 minimumInteritemSpacing];
  double v7 = v6;

  return v7;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  id v5 = -[SiriGKSnippetViewController _podForSection:](self, "_podForSection:", a5, a4);
  [v5 minimumLineSpacing];
  double v7 = v6;

  return v7;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v5 = -[SiriGKSnippetViewController _podForSection:](self, "_podForSection:", a5, a4);
  [v5 edgeInsets];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  double v6 = -[SiriGKSnippetViewController _podForSection:](self, "_podForSection:", a5, a4);
  double v7 = [v6 headerView];
  double v8 = [(SiriGKSnippetViewController *)self delegate];
  [v8 siriViewControllerExpectedWidth:self];
  objc_msgSend(v7, "sizeThatFits:");
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  double v6 = -[SiriGKSnippetViewController _podForSection:](self, "_podForSection:", a5, a4);
  double v7 = [v6 footerView];
  double v8 = [(SiriGKSnippetViewController *)self delegate];
  [v8 siriViewControllerExpectedWidth:self];
  objc_msgSend(v7, "sizeThatFits:");
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  double v7 = [(SiriGKSnippetViewController *)self delegate];
  [v7 siriViewControllerExpectedWidth:self];
  double width = v8;

  double v10 = -[SiriGKSnippetViewController _podForSection:](self, "_podForSection:", [v6 section]);
  id v11 = [v10 viewCount];
  if ((uint64_t)v11 <= (uint64_t)[v6 item])
  {
    double width = CGSizeZero.width;
    CGFloat height = CGSizeZero.height;
  }
  else
  {
    double v12 = objc_msgSend(v10, "viewAtIndex:", objc_msgSend(v6, "item"));
    objc_msgSend(v12, "sizeThatFits:", width, 1.79769313e308);
    double v14 = v13;
    CGFloat height = v15;
    if (![v12 isFullWidth]) {
      double width = v14;
    }
  }
  double v17 = width;
  double v18 = height;
  result.CGFloat height = v18;
  result.double width = v17;
  return result;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return [(SiriGKSnippetViewController *)self collectionView:a3 shouldSelectItemAtIndexPath:a4];
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = -[SiriGKSnippetViewController _podForSection:](self, "_podForSection:", [v5 section]);
  id v7 = [v5 item];

  double v8 = [v6 viewAtIndex:v7];
  LOBYTE(v7) = [v8 isSelectable];

  return (char)v7;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = -[SiriGKSnippetViewController _podForSection:](self, "_podForSection:", [v7 section]);
  double v9 = objc_msgSend(v8, "viewAtIndex:", objc_msgSend(v7, "item"));
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v10 = [v9 imageResource];

    if (v10)
    {
      id v11 = [v9 imageResource];
      if (v11)
      {
        double v26 = [v9 link];
        double v25 = [v9 displayName];
        id v12 = objc_alloc_init((Class)SAUIImageView);
        [v12 setImage:v11];
        double v13 = [v9 command];
        [v13 setPunchOutUri:v26];
        [v13 setSubtitle:v25];
        long long v30 = v13;
        double v14 = +[NSArray arrayWithObjects:&v30 count:1];
        [v12 setCommands:v14];

        double v15 = [(SiriGKSnippetViewController *)self delegate];
        id v29 = v12;
        double v16 = +[NSArray arrayWithObjects:&v29 count:1];
        [v15 siriSnippetViewController:self pushSirilandSnippets:v16];
      }
      goto LABEL_15;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v17 = [v9 mapViewSnippet];

    if (v17)
    {
      id v11 = [(SiriGKSnippetViewController *)self delegate];
      double v18 = [v9 mapViewSnippet];
      id v28 = v18;
      double v19 = +[NSArray arrayWithObjects:&v28 count:1];
      [v11 siriSnippetViewController:self pushSirilandSnippets:v19];
LABEL_14:

LABEL_15:
      goto LABEL_16;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v9 openInMaps];
    self->_containMKMapView = 1;
  }
  else
  {
    double v20 = [v9 command];

    if (v20)
    {
      double v21 = [v9 selectionResponseTitle];

      if (v21)
      {
        id v22 = objc_alloc_init((Class)SAUIListItem);
        double v23 = [v9 selectionResponseTitle];
        [v22 setSelectionText:v23];

        double v24 = [(SiriGKSnippetViewController *)self delegate];
        [v24 siriViewController:self addSelectionResponse:v22];
      }
      id v11 = [(SiriGKSnippetViewController *)self delegate];
      double v18 = [v9 command];
      v27 = v18;
      double v19 = +[NSArray arrayWithObjects:&v27 count:1];
      [v11 siriViewController:self performAceCommands:v19];
      goto LABEL_14;
    }
  }
LABEL_16:
  [v6 deselectItemAtIndexPath:v7 animated:1];
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  uint64_t v5 = -[SiriGKSnippetViewController dragItemForIndexPath:](self, "dragItemForIndexPath:", a5, a4);
  id v6 = (void *)v5;
  if (v5)
  {
    uint64_t v9 = v5;
    id v7 = +[NSArray arrayWithObjects:&v9 count:1];
  }
  else
  {
    id v7 = &__NSArray0__struct;
  }

  return v7;
}

- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  uint64_t v6 = -[SiriGKSnippetViewController dragItemForIndexPath:](self, "dragItemForIndexPath:", a5, a4, a6.x, a6.y);
  id v7 = (void *)v6;
  if (v6)
  {
    uint64_t v10 = v6;
    double v8 = +[NSArray arrayWithObjects:&v10 count:1];
  }
  else
  {
    double v8 = &__NSArray0__struct;
  }

  return v8;
}

- (id)dragItemForIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[SiriGKSnippetViewController _podForSection:](self, "_podForSection:", [v4 section]);
  id v6 = [v4 item];

  id v7 = [v5 viewAtIndex:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    uint64_t v9 = [v8 imageResource];
    uint64_t v10 = v9;
    if (v9)
    {
      id v11 = [v9 imageData];

      if (v11)
      {
        id v12 = [v10 imageData];
        id v13 = +[UIImage imageWithData:v12];
      }
      else
      {
        double v21 = [v10 resourceUrl];

        if (v21)
        {
          id v22 = objc_alloc((Class)AFUIRemoteImageRepresentation);
          id v12 = [v10 resourceUrl];
          id v13 = [v22 initWithImageURL:v12];
        }
        else
        {
          id v12 = [v8 imageView];
          id v13 = [v12 image];
        }
      }
      double v19 = v13;

      id v20 = objc_alloc((Class)NSItemProvider);
    }
    else
    {
      id v17 = [v8 punchoutURL];

      if (!v17)
      {
LABEL_16:

        goto LABEL_17;
      }
      id v18 = objc_alloc((Class)NSItemProvider);
      double v19 = [v8 punchoutURL];
      id v20 = v18;
    }
    id v23 = [v20 initWithObject:v19];

    id v17 = [objc_alloc((Class)UIDragItem) initWithItemProvider:v23];
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v7 punchoutURL], double v14 = objc_claimAutoreleasedReturnValue(), v14, !v14))
  {
    id v17 = 0;
    goto LABEL_18;
  }
  id v15 = objc_alloc((Class)NSItemProvider);
  double v16 = [v7 punchoutURL];
  id v8 = [v15 initWithObject:v16];

  id v17 = [objc_alloc((Class)UIDragItem) initWithItemProvider:v8];
LABEL_17:

LABEL_18:

  return v17;
}

- (id)_podForSection:(int64_t)a3
{
  if ((unint64_t)[(NSMutableArray *)self->_podArray count] <= a3)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [(NSMutableArray *)self->_podArray objectAtIndex:a3];
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomAlternateResultsPod, 0);
  objc_storeStrong((id *)&self->_disambiguationPod, 0);

  objc_storeStrong((id *)&self->_podArray, 0);
}

@end