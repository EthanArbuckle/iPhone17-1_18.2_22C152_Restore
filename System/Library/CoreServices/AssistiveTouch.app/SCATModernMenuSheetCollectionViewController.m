@interface SCATModernMenuSheetCollectionViewController
- (BOOL)_canShowWhileLocked;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (Class)collectionViewCellClass;
- (NSMutableArray)sortedMenuItems;
- (NSString)description;
- (SCATModernMenuFooterView)footerView;
- (SCATModernMenuSheet)menuSheet;
- (SCATModernMenuSheetCollectionViewController)initWithCollectionViewLayout:(id)a3;
- (UIImage)defaultBackgroundImage;
- (UIImage)dimmedBackgroundImage;
- (UIImage)pressedBackgroundImage;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 menuItemForItemAtIndex:(unint64_t)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (unint64_t)visibleItemOffset;
- (void)adjustVisibleItemOffsetForPageBoundary;
- (void)reloadCollectionView;
- (void)setCollectionViewCellClass:(Class)a3;
- (void)setDefaultBackgroundImage:(id)a3;
- (void)setDimmedBackgroundImage:(id)a3;
- (void)setFooterView:(id)a3;
- (void)setMenuSheet:(id)a3;
- (void)setPressedBackgroundImage:(id)a3;
- (void)setSortedMenuItems:(id)a3;
- (void)setVisibleItemOffset:(unint64_t)a3;
- (void)showMoreItemsButtonWasActivated;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SCATModernMenuSheetCollectionViewController

- (SCATModernMenuSheetCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCATModernMenuSheetCollectionViewController;
  v3 = [(SCATModernMenuSheetCollectionViewController *)&v5 initWithCollectionViewLayout:a3];
  if (v3) {
    v3->_collectionViewCellClass = (Class)objc_opt_class();
  }
  return v3;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  objc_super v5 = [(SCATModernMenuSheetCollectionViewController *)self menuSheet];
  v6 = +[NSString stringWithFormat:@"%@<%p>. sheet:%@", v4, self, v5];

  return (NSString *)v6;
}

- (void)showMoreItemsButtonWasActivated
{
  v3 = [(SCATModernMenuSheetCollectionViewController *)self collectionView];
  id v14 = [v3 collectionViewLayout];

  v4 = (char *)[v14 maxVisibleItems];
  objc_super v5 = [(SCATModernMenuSheetCollectionViewController *)self menuSheet];
  v6 = [v5 menuItems];
  v7 = (char *)[v6 count];

  unint64_t v8 = [(SCATModernMenuSheetCollectionViewController *)self visibleItemOffset];
  v9 = [(SCATModernMenuSheetCollectionViewController *)self menuSheet];
  v10 = (char *)[v9 numberOfItemsInFirstPage];

  if (v10) {
    BOOL v11 = v8 == 0;
  }
  else {
    BOOL v11 = 0;
  }
  v12 = &v4[v8];
  if (v11) {
    v12 = v10;
  }
  if (v12 >= v7) {
    v13 = 0;
  }
  else {
    v13 = v12;
  }
  [(SCATModernMenuSheetCollectionViewController *)self setVisibleItemOffset:v13];
  [(SCATModernMenuSheetCollectionViewController *)self reloadCollectionView];
}

- (void)adjustVisibleItemOffsetForPageBoundary
{
  v3 = [(SCATModernMenuSheetCollectionViewController *)self collectionView];
  id v17 = [v3 collectionViewLayout];

  v4 = (char *)[v17 maxVisibleItems];
  objc_super v5 = [(SCATModernMenuSheetCollectionViewController *)self menuSheet];
  v6 = [v5 menuItems];
  v7 = (char *)[v6 count];

  unint64_t v8 = [(SCATModernMenuSheetCollectionViewController *)self visibleItemOffset];
  v9 = [(SCATModernMenuSheetCollectionViewController *)self menuSheet];
  v10 = (char *)[v9 numberOfItemsInFirstPage];

  BOOL v11 = 0;
  while (v11 < v7)
  {
    id v12 = v11;
    if (v10) {
      BOOL v13 = v11 == 0;
    }
    else {
      BOOL v13 = 0;
    }
    BOOL v11 = &v4[(void)v11];
    if (v13) {
      BOOL v11 = v10;
    }
    unsigned int v14 = v8 - v12;
    if ((int)v8 - (int)v12 < 0) {
      unsigned int v14 = v12 - v8;
    }
    unsigned int v15 = v8 - v11;
    if ((int)v8 - (int)v11 < 0) {
      unsigned int v15 = v11 - v8;
    }
    if (v14 < v15 || v11 >= v7) {
      goto LABEL_20;
    }
  }
  id v12 = (id)v8;
LABEL_20:
  [(SCATModernMenuSheetCollectionViewController *)self setVisibleItemOffset:v12];
}

- (void)reloadCollectionView
{
  id v2 = [(SCATModernMenuSheetCollectionViewController *)self collectionView];
  [v2 reloadData];
}

- (void)viewDidLoad
{
  v18.receiver = self;
  v18.super_class = (Class)SCATModernMenuSheetCollectionViewController;
  [(SCATModernMenuSheetCollectionViewController *)&v18 viewDidLoad];
  v3 = +[UIColor clearColor];
  v4 = [(SCATModernMenuSheetCollectionViewController *)self collectionView];
  [v4 setBackgroundColor:v3];

  objc_super v5 = [(SCATModernMenuSheetCollectionViewController *)self collectionView];
  [v5 setClipsToBounds:0];

  v6 = [(SCATModernMenuSheetCollectionViewController *)self collectionView];
  objc_msgSend(v6, "registerClass:forCellWithReuseIdentifier:", -[SCATModernMenuSheetCollectionViewController collectionViewCellClass](self, "collectionViewCellClass"), @"SCATMenuItemCellID");

  v7 = +[UIImage imageNamed:@"SCATIcon_border_selected"];
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  BOOL v11 = objc_msgSend(v7, "resizableImageWithCapInsets:resizingMode:", 1, UIEdgeInsetsZero.top, left, bottom, right);
  [(SCATModernMenuSheetCollectionViewController *)self setPressedBackgroundImage:v11];

  id v12 = +[UIImage imageNamed:@"SCATIcon_border"];
  BOOL v13 = objc_msgSend(v12, "resizableImageWithCapInsets:resizingMode:", 1, UIEdgeInsetsZero.top, left, bottom, right);
  [(SCATModernMenuSheetCollectionViewController *)self setDefaultBackgroundImage:v13];

  unsigned int v14 = [(SCATModernMenuSheetCollectionViewController *)self defaultBackgroundImage];
  unsigned int v15 = +[SCATStyleProvider sharedStyleProvider];
  v16 = [v15 menuKnockoutColor];
  id v17 = [v14 imageWithTintColor:v16 renderingMode:1];
  [(SCATModernMenuSheetCollectionViewController *)self setDimmedBackgroundImage:v17];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SCATModernMenuSheetCollectionViewController;
  -[SCATModernMenuSheetCollectionViewController viewWillAppear:](&v20, "viewWillAppear:");
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  objc_super v5 = [(SCATModernMenuSheetCollectionViewController *)self collectionView];
  v6 = [v5 visibleCells];

  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = v11;
          BOOL v13 = [v12 menuItem];
          [v13 resetActivation];

          unsigned int v14 = [v12 menuItem];
          [v14 updateItem];

          [v12 update];
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v8);
  }

  unsigned int v15 = [(SCATModernMenuSheetCollectionViewController *)self menuSheet];
  [v15 sheetWillAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SCATModernMenuSheetCollectionViewController;
  -[SCATModernMenuSheetCollectionViewController viewWillDisappear:](&v6, "viewWillDisappear:");
  objc_super v5 = [(SCATModernMenuSheetCollectionViewController *)self menuSheet];
  [v5 sheetWillDisappear:v3];
}

- (void)viewDidLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)SCATModernMenuSheetCollectionViewController;
  [(SCATModernMenuSheetCollectionViewController *)&v7 viewDidLayoutSubviews];
  BOOL v3 = [(SCATModernMenuSheetCollectionViewController *)self menuSheet];
  v4 = [v3 menu];
  [v4 reloadFromCurrentSheet];

  double y = CGPointZero.y;
  objc_super v6 = [(SCATModernMenuSheetCollectionViewController *)self collectionView];
  objc_msgSend(v6, "setContentOffset:", CGPointZero.x, y);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  objc_super v5 = [(SCATModernMenuSheetCollectionViewController *)self collectionView];
  objc_super v6 = [v5 collectionViewLayout];
  objc_super v7 = (char *)[v6 maxVisibleItems];

  id v8 = [(SCATModernMenuSheetCollectionViewController *)self menuSheet];
  uint64_t v9 = [v8 menuItems];
  v10 = (char *)[v9 count];

  unint64_t v11 = [(SCATModernMenuSheetCollectionViewController *)self visibleItemOffset];
  unint64_t v12 = v11;
  if (&v10[-v11] < v7) {
    objc_super v7 = &v10[-v11];
  }
  BOOL v13 = [(SCATModernMenuSheetCollectionViewController *)self menuSheet];
  id v14 = [v13 numberOfItemsInFirstPage];

  if (v14) {
    BOOL v15 = v12 == 0;
  }
  else {
    BOOL v15 = 0;
  }
  if (v15) {
    return (int64_t)v14;
  }
  else {
    return (int64_t)v7;
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 dequeueReusableCellWithReuseIdentifier:@"SCATMenuItemCellID" forIndexPath:v6];
  id v9 = [v6 item];

  v10 = [(SCATModernMenuSheetCollectionViewController *)self collectionView:v7 menuItemForItemAtIndex:v9];

  [v10 resetActivation];
  [v8 setMenuItem:v10];
  unint64_t v11 = [(SCATModernMenuSheetCollectionViewController *)self pressedBackgroundImage];
  [v8 setPressedBackgroundImage:v11];

  unint64_t v12 = [(SCATModernMenuSheetCollectionViewController *)self defaultBackgroundImage];
  [v8 setDefaultBackgroundImage:v12];

  BOOL v13 = [(SCATModernMenuSheetCollectionViewController *)self dimmedBackgroundImage];
  [v8 setDimmedBackgroundImage:v13];

  id v14 = [v10 title];
  BOOL v15 = [v8 titleLabel];
  [v15 setText:v14];

  long long v16 = [(SCATModernMenuSheetCollectionViewController *)self menuSheet];
  objc_msgSend(v8, "setShouldIncludeTextLabels:", objc_msgSend(v16, "shouldIncludeTextLabels"));

  objc_msgSend(v8, "setShouldUseActivityIndicator:", objc_msgSend(v10, "shouldUseActivityIndicator"));
  long long v17 = [v10 image];

  if (v17) {
    [v10 image];
  }
  else {
  long long v18 = sub_1000CC1D8(v10);
  }
  [v8 setIconImage:v18];

  [v10 updateItem];
  [v8 update];

  return v8;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = -[SCATModernMenuSheetCollectionViewController collectionView:menuItemForItemAtIndex:](self, "collectionView:menuItemForItemAtIndex:", v7, [a5 item]);

  id v9 = [v8 title];
  +[SCATMenuItemCell cellSizeForTitle:v9];
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (id)collectionView:(id)a3 menuItemForItemAtIndex:(unint64_t)a4
{
  objc_super v5 = (char *)[(SCATModernMenuSheetCollectionViewController *)self visibleItemOffset] + a4;
  id v6 = [(SCATModernMenuSheetCollectionViewController *)self menuSheet];
  id v7 = [(SCATModernMenuSheetCollectionViewController *)self collectionViewLayout];
  objc_msgSend(v6, "sortMenuItemsForNumberOfItemsPerRow:", objc_msgSend(v7, "maxItemsPerRow"));

  id v8 = [(SCATModernMenuSheetCollectionViewController *)self menuSheet];
  id v9 = [v8 menuItems];
  double v10 = [v9 objectAtIndex:v5];

  return v10;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (SCATModernMenuSheet)menuSheet
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_menuSheet);

  return (SCATModernMenuSheet *)WeakRetained;
}

- (void)setMenuSheet:(id)a3
{
}

- (unint64_t)visibleItemOffset
{
  return self->_visibleItemOffset;
}

- (void)setVisibleItemOffset:(unint64_t)a3
{
  self->_visibleItemOffset = a3;
}

- (Class)collectionViewCellClass
{
  return self->_collectionViewCellClass;
}

- (void)setCollectionViewCellClass:(Class)a3
{
  self->_collectionViewCellClass = a3;
}

- (SCATModernMenuFooterView)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
}

- (UIImage)defaultBackgroundImage
{
  return self->_defaultBackgroundImage;
}

- (void)setDefaultBackgroundImage:(id)a3
{
}

- (UIImage)pressedBackgroundImage
{
  return self->_pressedBackgroundImage;
}

- (void)setPressedBackgroundImage:(id)a3
{
}

- (UIImage)dimmedBackgroundImage
{
  return self->_dimmedBackgroundImage;
}

- (void)setDimmedBackgroundImage:(id)a3
{
}

- (NSMutableArray)sortedMenuItems
{
  return self->_sortedMenuItems;
}

- (void)setSortedMenuItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedMenuItems, 0);
  objc_storeStrong((id *)&self->_dimmedBackgroundImage, 0);
  objc_storeStrong((id *)&self->_pressedBackgroundImage, 0);
  objc_storeStrong((id *)&self->_defaultBackgroundImage, 0);
  objc_storeStrong((id *)&self->_footerView, 0);

  objc_destroyWeak((id *)&self->_menuSheet);
}

@end