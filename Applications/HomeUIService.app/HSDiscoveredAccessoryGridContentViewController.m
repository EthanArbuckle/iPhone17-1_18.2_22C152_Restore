@interface HSDiscoveredAccessoryGridContentViewController
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)hasDetailsActionForPresentationCoordinator:(id)a3 item:(id)a4;
- (BOOL)presentationCoordinator:(id)a3 shouldBeginInteractivePresentationWithTouchLocation:(CGPoint)a4 view:(id)a5;
- (HFAccessoryBrowsingManager)accessoryBrowsingManager;
- (HSDiscoveredAccessoryGridContentViewController)initWithAccessoryBrowsingManager:(id)a3 discoveredAccessoryFilter:(id)a4;
- (HSDiscoveredAccessoryGridContentViewController)initWithItemManager:(id)a3;
- (HSDiscoveredAccessoryGridContentViewControllerDelegate)delegate;
- (UIColor)cellContentViewBackgroundColor;
- (id)_defaultLayoutOptionsForViewSize:(CGSize)a3;
- (id)detailsViewControllerForPresentationCoordinator:(id)a3 item:(id)a4;
- (id)layoutOptionsForSection:(int64_t)a3;
- (void)_identifyAccessory:(id)a3;
- (void)_updateScrollingAttributes;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)configureCell:(id)a3 forItem:(id)a4;
- (void)itemManagerDidUpdate:(id)a3;
- (void)setCellContentViewBackgroundColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setScrollDirection:(int64_t)a3;
- (void)viewDidLoad;
@end

@implementation HSDiscoveredAccessoryGridContentViewController

- (HSDiscoveredAccessoryGridContentViewController)initWithItemManager:(id)a3
{
  v5 = +[NSAssertionHandler currentHandler];
  v6 = NSStringFromSelector("initWithAccessoryBrowsingManager:discoveredAccessoryFilter:");
  [v5 handleFailureInMethod:a2 object:self file:@"HSDiscoveredAccessoryGridContentViewController.m" lineNumber:27 description:@"%s is unavailable; use %@ instead"];
    "-[HSDiscoveredAccessoryGridContentViewController initWithItemManager:]",
    v6);

  return 0;
}

- (HSDiscoveredAccessoryGridContentViewController)initWithAccessoryBrowsingManager:(id)a3 discoveredAccessoryFilter:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[HSDiscoveredAccessoryGridContentItemManager alloc] initWithAccessoryBrowsingManager:v7 delegate:self discoveredAccessoryFilter:v6];

  v11.receiver = self;
  v11.super_class = (Class)HSDiscoveredAccessoryGridContentViewController;
  v9 = [(HSDiscoveredAccessoryGridContentViewController *)&v11 initWithItemManager:v8];

  return v9;
}

- (id)_defaultLayoutOptionsForViewSize:(CGSize)a3
{
  v35.receiver = self;
  v35.super_class = (Class)HSDiscoveredAccessoryGridContentViewController;
  v4 = -[HSDiscoveredAccessoryGridContentViewController _defaultLayoutOptionsForViewSize:](&v35, "_defaultLayoutOptionsForViewSize:", a3.width, a3.height);
  objc_opt_class();
  v5 = [(HSDiscoveredAccessoryGridContentViewController *)self collectionView];
  id v6 = [v5 visibleCells];
  id v7 = [v6 firstObject];
  if (objc_opt_isKindOfClass()) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    v10 = [v9 iconView];
    [v10 frame];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    double v16 = v15;
    double v18 = v17;

    v19 = [v9 serviceTextView];
    [v19 frame];
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;

    v37.origin.x = v12;
    v37.origin.y = v14;
    v37.size.double width = v16;
    v37.size.double height = v18;
    v39.origin.x = v21;
    v39.origin.y = v23;
    v39.size.double width = v25;
    v39.size.double height = v27;
    CGRect v38 = CGRectIntersection(v37, v39);
    double width = v38.size.width;
    double height = v38.size.height;
    if (!objc_msgSend(v4, "cellSizeSubclass", v38.origin.x, v38.origin.y) && width * height / (v16 * v18) > 0.1)
    {
      HUDefaultSizeForIconSize();
      double v31 = v30;
      v32 = [v4 serviceCellOptions];
      [v32 setIconSize:v31];

      v33 = [v4 serviceCellOptions];
      [v33 setIconContentMode:1];
    }
  }
  else
  {
    [v4 cellSizeSubclass];
  }

  return v4;
}

- (HFAccessoryBrowsingManager)accessoryBrowsingManager
{
  v2 = [(HSDiscoveredAccessoryGridContentViewController *)self itemManager];
  v3 = [v2 accessoryBrowsingManager];

  return (HFAccessoryBrowsingManager *)v3;
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)HSDiscoveredAccessoryGridContentViewController;
  [(HSDiscoveredAccessoryGridContentViewController *)&v16 viewDidLoad];
  v3 = +[UIColor clearColor];
  v4 = [(HSDiscoveredAccessoryGridContentViewController *)self collectionView];
  [v4 setBackgroundColor:v3];

  v5 = +[UIColor clearColor];
  id v6 = [(HSDiscoveredAccessoryGridContentViewController *)self view];
  [v6 setBackgroundColor:v5];

  id v7 = [(HSDiscoveredAccessoryGridContentViewController *)self collectionView];
  [v7 setShowsVerticalScrollIndicator:0];

  v8 = [(HSDiscoveredAccessoryGridContentViewController *)self collectionView];
  [v8 setAlwaysBounceVertical:0];

  id v9 = [objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:self action:"_identifyAccessory:"];
  [v9 setDelaysTouchesBegan:1];
  v10 = [(HSDiscoveredAccessoryGridContentViewController *)self collectionView];
  [v10 addGestureRecognizer:v9];

  [(HSDiscoveredAccessoryGridContentViewController *)self _updateScrollingAttributes];
  double v11 = [(HSDiscoveredAccessoryGridContentViewController *)self itemManager];
  CGFloat v12 = [v11 home];
  if (v12)
  {
  }
  else
  {
    double v13 = [(HSDiscoveredAccessoryGridContentViewController *)self itemManager];
    CGFloat v14 = [v13 itemProviders];
    id v15 = [v14 count];

    if (v15) {
      goto LABEL_5;
    }
    double v11 = [(HSDiscoveredAccessoryGridContentViewController *)self itemManager];
    [v11 resetItemProvidersAndModules];
  }

LABEL_5:
}

- (void)setScrollDirection:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HSDiscoveredAccessoryGridContentViewController;
  [(HSDiscoveredAccessoryGridContentViewController *)&v4 setScrollDirection:a3];
  [(HSDiscoveredAccessoryGridContentViewController *)self _updateScrollingAttributes];
}

- (BOOL)hasDetailsActionForPresentationCoordinator:(id)a3 item:(id)a4
{
  return 0;
}

- (id)detailsViewControllerForPresentationCoordinator:(id)a3 item:(id)a4
{
  return 0;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(HSDiscoveredAccessoryGridContentViewController *)self itemManager];
  id v7 = [(id)v6 displayedItemAtIndexPath:v5];

  objc_opt_class();
  LOBYTE(v6) = objc_opt_isKindOfClass();

  return v6 & 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)HSDiscoveredAccessoryGridContentViewController;
  id v6 = a4;
  [(HSDiscoveredAccessoryGridContentViewController *)&v17 collectionView:a3 didSelectItemAtIndexPath:v6];
  id v7 = [(HSDiscoveredAccessoryGridContentViewController *)self itemManager];
  v8 = [v7 displayedItemAtIndexPath:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = objc_opt_class();
    id v10 = v8;
    if (v10)
    {
      if (objc_opt_isKindOfClass()) {
        double v11 = v10;
      }
      else {
        double v11 = 0;
      }
      id v12 = v11;
      if (!v12)
      {
        double v13 = +[NSAssertionHandler currentHandler];
        CGFloat v14 = +[NSString stringWithUTF8String:"id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"];
        [v13 handleFailureInFunction:v14, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v9, objc_opt_class(), v17.receiver, v17.super_class file lineNumber description];
      }
    }
    else
    {
      id v12 = 0;
    }

    id v15 = [(HSDiscoveredAccessoryGridContentViewController *)self delegate];
    objc_super v16 = [v12 discoveredAccessory];
    [v15 discoveredAccessoryGrid:self didSelectDiscoveredAccessory:v16];
  }
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HSDiscoveredAccessoryGridContentViewController;
  [(HSDiscoveredAccessoryGridContentViewController *)&v14 configureCell:v6 forItem:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v7 = v6;
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
    id v9 = v8;

    id v10 = [(HSDiscoveredAccessoryGridContentViewController *)self cellContentViewBackgroundColor];

    if (v10)
    {
      double v11 = +[UIColor labelColor];
      [v9 setDefaultNameTextColor:v11];

      id v12 = [(HSDiscoveredAccessoryGridContentViewController *)self cellContentViewBackgroundColor];
      double v13 = [v9 gridBackgroundView];
      [v13 setBackgroundTintColor:v12];
    }
  }
}

- (id)layoutOptionsForSection:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HSDiscoveredAccessoryGridContentViewController;
  v3 = [(HSDiscoveredAccessoryGridContentViewController *)&v6 layoutOptionsForSection:a3];
  objc_super v4 = [v3 serviceCellOptions];
  [v4 setShowDescription:0];

  return v3;
}

- (void)itemManagerDidUpdate:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HSDiscoveredAccessoryGridContentViewController;
  id v4 = a3;
  [(HSDiscoveredAccessoryGridContentViewController *)&v7 itemManagerDidUpdate:v4];
  id v5 = [(HSDiscoveredAccessoryGridContentViewController *)self delegate];
  objc_super v6 = [v4 allItems];

  [v5 discoveredAccessoryGrid:self didUpdateNumberOfDiscoveredAccessories:[v6 count]];
}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginInteractivePresentationWithTouchLocation:(CGPoint)a4 view:(id)a5
{
  return 0;
}

- (void)_identifyAccessory:(id)a3
{
  id v14 = a3;
  if ([v14 state] == (id)3)
  {
    id v4 = [(HSDiscoveredAccessoryGridContentViewController *)self collectionView];
    id v5 = [(HSDiscoveredAccessoryGridContentViewController *)self collectionView];
    [v14 locationInView:v5];
    objc_super v6 = objc_msgSend(v4, "indexPathForItemAtPoint:");

    if (v6)
    {
      objc_opt_class();
      objc_super v7 = [(HSDiscoveredAccessoryGridContentViewController *)self itemManager];
      v8 = [v7 displayedItemAtIndexPath:v6];
      if (objc_opt_isKindOfClass()) {
        id v9 = v8;
      }
      else {
        id v9 = 0;
      }
      id v10 = v9;

      double v11 = [v10 discoveredAccessory];

      if (v11)
      {
        id v12 = [v10 discoveredAccessory];
        id v13 = [v12 identify];
      }
    }
  }
}

- (void)_updateScrollingAttributes
{
  BOOL v3 = [(HSDiscoveredAccessoryGridContentViewController *)self scrollDirection] == (id)1;
  id v4 = [(HSDiscoveredAccessoryGridContentViewController *)self collectionView];
  [v4 setScrollEnabled:v3];
}

- (HSDiscoveredAccessoryGridContentViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HSDiscoveredAccessoryGridContentViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIColor)cellContentViewBackgroundColor
{
  return self->_cellContentViewBackgroundColor;
}

- (void)setCellContentViewBackgroundColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellContentViewBackgroundColor, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end