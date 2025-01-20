@interface HUServiceGridViewController
- (BOOL)shouldShowLoadingState;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (CGSize)preferredContentSizeForCollectionViewContentSize:(CGSize)a3;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HUGridLayoutOptions)layoutOptions;
- (HUServiceGridViewController)initWithItemManager:(id)a3;
- (HUServiceGridViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4;
- (HUServiceGridViewControllerDelegate)delegate;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (double)headerViewHeightForSectionIndex:(unint64_t)a3;
- (id)_defaultLayoutOptionsForViewSize:(CGSize)a3;
- (id)_performTapActionForItem:(id)a3 tappedArea:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)scrollDirection;
- (unint64_t)contentMargins;
- (unint64_t)itemTypeForItem:(id)a3;
- (void)configureCell:(id)a3 forItem:(id)a4;
- (void)layoutOptionsDidChange;
- (void)setContentMargins:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setLayoutOptions:(id)a3;
- (void)setScrollDirection:(int64_t)a3;
- (void)setShouldShowLoadingState:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation HUServiceGridViewController

- (HUServiceGridViewController)initWithItemManager:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(HUGridFlowLayout);
  v8.receiver = self;
  v8.super_class = (Class)HUServiceGridViewController;
  v6 = [(HUControllableItemCollectionViewController *)&v8 initWithItemManager:v4 collectionViewLayout:v5];

  if (v6)
  {
    [(HUControllableItemCollectionViewController *)v6 setContentColorStyle:1];
    v6->_contentMargins = 11;
    v6->_scrollDirection = 0;
    v6->_shouldShowLoadingState = 1;
    if ([(HUServiceGridViewController *)v6 isViewLoaded]) {
      NSLog(&cfstr_Huservicegridv.isa);
    }
  }

  return v6;
}

- (HUServiceGridViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithItemManager_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUServiceGridViewController.m", 48, @"%s is unavailable; use %@ instead",
    "-[HUServiceGridViewController initWithItemManager:collectionViewLayout:]",
    v7);

  return 0;
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)HUServiceGridViewController;
  [(HUControllableItemCollectionViewController *)&v11 viewDidLoad];
  v3 = [(HUServiceGridViewController *)self collectionView];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = *MEMORY[0x1E4F43758];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v3 registerClass:v4 forSupplementaryViewOfKind:v5 withReuseIdentifier:v7];

  objc_super v8 = [(HUServiceGridViewController *)self collectionView];
  [v8 setAlwaysBounceVertical:1];

  v9 = [MEMORY[0x1E4F428B8] clearColor];
  v10 = [(HUServiceGridViewController *)self collectionView];
  [v10 setBackgroundColor:v9];
}

- (void)viewWillAppear:(BOOL)a3
{
  v19.receiver = self;
  v19.super_class = (Class)HUServiceGridViewController;
  [(HUControllableItemCollectionViewController *)&v19 viewWillAppear:a3];
  uint64_t v4 = [(HUServiceGridViewController *)self layoutOptions];
  [v4 viewSize];
  double v6 = v5;
  double v8 = v7;
  v9 = [(HUServiceGridViewController *)self view];
  [v9 frame];
  double v11 = v10;
  double v13 = v12;

  if (v6 != v11 || v8 != v13)
  {
    v15 = [(HUServiceGridViewController *)self view];
    [v15 frame];
    v18 = -[HUServiceGridViewController _defaultLayoutOptionsForViewSize:](self, "_defaultLayoutOptionsForViewSize:", v16, v17);
    [(HUServiceGridViewController *)self setLayoutOptions:v18];
  }
}

- (void)viewWillLayoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)HUServiceGridViewController;
  [(HUServiceGridViewController *)&v18 viewWillLayoutSubviews];
  v3 = [(HUServiceGridViewController *)self layoutOptions];
  [v3 viewSize];
  double v5 = v4;
  double v7 = v6;
  double v8 = [(HUServiceGridViewController *)self view];
  [v8 frame];
  double v10 = v9;
  double v12 = v11;

  if (v5 != v10 || v7 != v12)
  {
    v14 = [(HUServiceGridViewController *)self view];
    [v14 frame];
    double v17 = -[HUServiceGridViewController _defaultLayoutOptionsForViewSize:](self, "_defaultLayoutOptionsForViewSize:", v15, v16);
    [(HUServiceGridViewController *)self setLayoutOptions:v17];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)HUServiceGridViewController;
  id v7 = a4;
  -[HUServiceGridViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82__HUServiceGridViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E6385548;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

void __82__HUServiceGridViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v6 = [v2 view];
  [v6 frame];
  double v5 = objc_msgSend(v2, "_defaultLayoutOptionsForViewSize:", v3, v4);
  [*(id *)(a1 + 32) setLayoutOptions:v5];
}

- (void)setScrollDirection:(int64_t)a3
{
  if (self->_scrollDirection != a3)
  {
    self->_scrollDirection = a3;
    id v7 = [(HUServiceGridViewController *)self view];
    [v7 frame];
    id v6 = -[HUServiceGridViewController _defaultLayoutOptionsForViewSize:](self, "_defaultLayoutOptionsForViewSize:", v4, v5);
    [(HUServiceGridViewController *)self setLayoutOptions:v6];
  }
}

- (void)setContentMargins:(unint64_t)a3
{
  if (self->_contentMargins != a3)
  {
    self->_contentMargins = a3;
    id v7 = [(HUServiceGridViewController *)self view];
    [v7 frame];
    id v6 = -[HUServiceGridViewController _defaultLayoutOptionsForViewSize:](self, "_defaultLayoutOptionsForViewSize:", v4, v5);
    [(HUServiceGridViewController *)self setLayoutOptions:v6];
  }
}

- (CGSize)preferredContentSizeForCollectionViewContentSize:(CGSize)a3
{
  v18.receiver = self;
  v18.super_class = (Class)HUServiceGridViewController;
  -[HUItemCollectionViewController preferredContentSizeForCollectionViewContentSize:](&v18, sel_preferredContentSizeForCollectionViewContentSize_, a3.width, a3.height);
  double v5 = v4;
  double v7 = v6;
  if ([(HUServiceGridViewController *)self scrollDirection] == 1)
  {
    double v8 = [(HUServiceGridViewController *)self layoutOptions];
    [v8 pointWidthForNumberOfColumns:1];
    double v10 = v9;
    double v11 = [(HUServiceGridViewController *)self layoutOptions];
    [v11 sectionTopMargin];
    double v13 = v10 + v12;
    v14 = [(HUServiceGridViewController *)self layoutOptions];
    [v14 sectionBottomMargin];
    double v7 = v13 + v15;
  }
  double v16 = v5;
  double v17 = v7;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (unint64_t)itemTypeForItem:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_performTapActionForItem:(id)a3 tappedArea:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HUServiceGridViewController;
  double v8 = [(HUControllableItemCollectionViewController *)&v16 _performTapActionForItem:v6 tappedArea:v7];
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__HUServiceGridViewController__performTapActionForItem_tappedArea___block_invoke;
  v12[3] = &unk_1E638B0E0;
  objc_copyWeak(&v14, &location);
  id v9 = v6;
  id v13 = v9;
  double v10 = [v8 flatMap:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v10;
}

id __67__HUServiceGridViewController__performTapActionForItem_tappedArea___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    double v5 = [WeakRetained delegate];
    [v5 serviceGridViewController:WeakRetained didTapItem:*(void *)(a1 + 32)];
  }
  id v6 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];

  return v6;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  if (-[HUServiceGridViewController itemTypeForItem:](self, "itemTypeForItem:", a3, a4) > 1) {
    char v4 = 0;
  }
  else {
    char v4 = objc_opt_class();
  }

  return (Class)v4;
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HUServiceGridViewController;
  [(HUControllableItemCollectionViewController *)&v18 configureCell:v6 forItem:a4];
  id v7 = v6;
  if ([v7 conformsToProtocol:&unk_1F19D27E0]) {
    double v8 = v7;
  }
  else {
    double v8 = 0;
  }
  id v9 = v8;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v7;
    double v11 = [(HUServiceGridViewController *)self layoutOptions];
    uint64_t v12 = [v11 serviceCellOptions];
    [v10 setLayoutOptions:v12];

    objc_msgSend(v10, "setShouldShowLoadingState:", -[HUServiceGridViewController shouldShowLoadingState](self, "shouldShowLoadingState"));
    id v13 = [(HUItemCollectionViewController *)self itemManager];
    objc_opt_class();
    LOBYTE(v12) = objc_opt_isKindOfClass();

    if ((v12 & 1) == 0)
    {
LABEL_10:

      goto LABEL_11;
    }
    id v14 = [(HUItemCollectionViewController *)self itemManager];
    objc_msgSend(v10, "setShouldShowRoomName:", objc_msgSend(v14, "shouldGroupByRoom") ^ 1);
LABEL_9:

    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [(HUServiceGridViewController *)self layoutOptions];
    id v14 = [v10 sceneCellOptions];
    [v9 setLayoutOptions:v14];
    goto LABEL_9;
  }
LABEL_11:
  if ([MEMORY[0x1E4F69758] isAMac])
  {
    double v15 = [(HUServiceGridViewController *)self traitCollection];
    uint64_t v16 = [v15 userInterfaceStyle];

    if (v16 == 1)
    {
      double v17 = [v9 layoutOptions];
      [v17 setOnStateBorderStyle:1];
    }
  }
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  id v7 = -[HUServiceGridViewController layoutOptionsForSection:](self, "layoutOptionsForSection:", [v6 section]);
  double v8 = [(HUItemCollectionViewController *)self itemManager];
  id v9 = [v8 displayedItemAtIndexPath:v6];

  unint64_t v10 = [(HUServiceGridViewController *)self itemTypeForItem:v9];
  if (v10 == 1)
  {
    if ([MEMORY[0x1E4F69758] useMacIdiom]) {
      [v7 pointWidthForNumberOfColumns:2];
    }
    else {
      [v7 pointWidthForFullWidthCell];
    }
    double v13 = v12;
    double v15 = [v7 sceneCellOptions];
    [v15 cellHeight];
    double v14 = v16;

    double v17 = [v7 sceneCellOptions];
    objc_super v18 = [v17 font];
    [v18 lineHeight];
    double v20 = v19;
    v21 = [v7 sceneCellOptions];
    v22 = [v21 descriptionFont];
    [v22 lineHeight];
    double v24 = v23 + v20 * 2.0;

    if (v14 < v24) {
      double v14 = v24;
    }
  }
  else if (v10)
  {
    double v13 = *MEMORY[0x1E4F1DB30];
    double v14 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    if ([MEMORY[0x1E4F69758] isAMac]) {
      [v7 fixedWidthForCell];
    }
    else {
      [v7 pointWidthForNumberOfColumns:1];
    }
    double v14 = v11;
    double v13 = v11;
  }

  double v25 = v13;
  double v26 = v14;
  result.double height = v26;
  result.double width = v25;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v7 = -[HUServiceGridViewController layoutOptionsForSection:](self, "layoutOptionsForSection:", a5, a4);
  double v8 = [(HUItemCollectionViewController *)self itemManager];
  id v9 = [v8 titleForSection:a5];

  if (v9)
  {
    unint64_t v10 = [(HUItemCollectionViewController *)self itemManager];
    uint64_t v11 = [v10 numberOfSections] - 1;

    double v12 = 0.0;
    double v13 = 0.0;
    if (v11 != a5)
    {
      double v14 = [(HUItemCollectionViewController *)self itemManager];
      double v15 = [v14 itemSectionForSectionIndex:a5 + 1];

      double v16 = [v15 items];
      uint64_t v17 = [v16 count];

      if (v17) {
        double v13 = 17.5;
      }
      else {
        double v13 = 0.0;
      }
    }
    [v7 sectionLeadingMargin];
    double v19 = v18;
  }
  else
  {
    [v7 sectionTopMargin];
    double v12 = v20;
    [v7 sectionLeadingMargin];
    double v19 = v21;
    [v7 sectionBottomMargin];
    double v13 = v22;
  }
  [v7 sectionTrailingMargin];
  double v24 = v23;

  double v25 = v12;
  double v26 = v19;
  double v27 = v13;
  double v28 = v24;
  result.right = v28;
  result.bottom = v27;
  result.left = v26;
  result.top = v25;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v7 = [(HUItemCollectionViewController *)self itemManager];
  double v8 = [v7 titleForSection:a5];
  if (v8)
  {
    double v9 = *MEMORY[0x1E4F43D18];
    [(HUServiceGridViewController *)self headerViewHeightForSectionIndex:a5];
    double v11 = v10;
  }
  else
  {
    double v9 = *MEMORY[0x1E4F1DB30];
    double v11 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  double v5 = -[HUServiceGridViewController layoutOptionsForSection:](self, "layoutOptionsForSection:", a5, a4);
  [v5 rowSpacing];
  double v7 = v6;

  return v7;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = *MEMORY[0x1E4F43758];
  id v11 = a3;
  if (([v8 isEqualToString:v10] & 1) == 0) {
    NSLog(&cfstr_AskedForAViewF.isa, v8);
  }
  double v12 = [(HUItemCollectionViewController *)self itemManager];
  double v13 = objc_msgSend(v12, "titleForSection:", objc_msgSend(v9, "section"));

  if (!v13) {
    NSLog(&cfstr_AskedForHeader.isa, v9);
  }
  objc_opt_class();
  double v14 = (objc_class *)objc_opt_class();
  double v15 = NSStringFromClass(v14);
  double v16 = [v11 dequeueReusableSupplementaryViewOfKind:v8 withReuseIdentifier:v15 forIndexPath:v9];

  if (objc_opt_isKindOfClass()) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = 0;
  }
  id v18 = v17;

  double v19 = -[HUServiceGridViewController layoutOptionsForSection:](self, "layoutOptionsForSection:", [v9 section]);
  double v20 = [MEMORY[0x1E4F42B58] groupedHeaderConfiguration];
  [v20 setText:v13];
  [v20 directionalLayoutMargins];
  double v22 = v21;
  double v24 = v23;
  [v19 sectionTitleMargin];
  double v26 = v25;
  [v19 sectionTitleMargin];
  objc_msgSend(v20, "setDirectionalLayoutMargins:", v22, v26, v24);
  if (([(HUServiceGridViewController *)self contentMargins] & 0xA) == 0) {
    [v20 setAxesPreservingSuperviewLayoutMargins:0];
  }
  [v18 setContentConfiguration:v20];
  double v27 = [MEMORY[0x1E4F427B0] clearConfiguration];
  [v18 setBackgroundConfiguration:v27];

  return v18;
}

- (double)headerViewHeightForSectionIndex:(unint64_t)a3
{
  double v5 = [MEMORY[0x1E4F42B58] groupedHeaderConfiguration];
  double v6 = [(HUItemCollectionViewController *)self itemManager];
  double v7 = [v6 titleForSection:a3];

  [v5 setText:v7];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F42B60]) initWithConfiguration:v5];
  objc_msgSend(v8, "systemLayoutSizeFittingSize:", 1.79769313e308, 1.79769313e308);
  double v10 = v9;

  return v10;
}

- (id)_defaultLayoutOptionsForViewSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  int v6 = [MEMORY[0x1E4F69758] useMacIdiom];
  double v7 = &unk_1F19B45B0;
  if (!v6) {
    double v7 = 0;
  }
  id v8 = (void *)MEMORY[0x1E4F69758];
  id v9 = v7;
  double v10 = +[HUGridLayoutOptions defaultOptionsForViewSize:columnStyle:overrideSizeSubclass:](HUGridLayoutOptions, "defaultOptionsForViewSize:columnStyle:overrideSizeSubclass:", [v8 isAMac], v9, width, height);

  objc_msgSend(v10, "setContentColorStyle:", -[HUControllableItemCollectionViewController contentColorStyle](self, "contentColorStyle"));
  if (([(HUServiceGridViewController *)self contentMargins] & 1) == 0) {
    [v10 setSectionTopMargin:0.0];
  }
  if (([(HUServiceGridViewController *)self contentMargins] & 2) == 0) {
    [v10 setSectionLeadingMargin:0.0];
  }
  if (([(HUServiceGridViewController *)self contentMargins] & 4) == 0) {
    [v10 setSectionBottomMargin:0.0];
  }
  if (([(HUServiceGridViewController *)self contentMargins] & 8) == 0) {
    [v10 setSectionTrailingMargin:0.0];
  }
  [v10 sectionTitleMargin];
  double v12 = v11;
  double v14 = v13;
  [v10 sectionLeadingMargin];
  double v16 = v15;
  [v10 sectionTrailingMargin];
  objc_msgSend(v10, "setSectionTitleMargin:", v12, v16, v14, v17);
  [v10 setSectionBottomToNextSectionTitleBaselineDistance:38.0];
  objc_msgSend(v10, "setScrollDirection:", -[HUServiceGridViewController scrollDirection](self, "scrollDirection"));

  return v10;
}

- (HUGridLayoutOptions)layoutOptions
{
  v2 = [(HUServiceGridViewController *)self collectionView];
  id v3 = [v2 collectionViewLayout];
  char v4 = [v3 layoutOptions];

  return (HUGridLayoutOptions *)v4;
}

- (void)setLayoutOptions:(id)a3
{
  id v4 = a3;
  double v5 = [(HUServiceGridViewController *)self layoutOptions];
  char v6 = [v5 isEqual:v4];

  double v7 = [(HUServiceGridViewController *)self collectionView];
  id v8 = [v7 collectionViewLayout];
  [v8 setLayoutOptions:v4];

  if ((v6 & 1) == 0)
  {
    [(HUServiceGridViewController *)self layoutOptionsDidChange];
  }
}

- (void)layoutOptionsDidChange
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = [(HUServiceGridViewController *)self collectionView];
  id v4 = [v3 visibleCells];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          double v10 = [(HUServiceGridViewController *)self layoutOptions];
          uint64_t v11 = [v10 serviceCellOptions];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_11;
          }
          double v10 = [(HUServiceGridViewController *)self layoutOptions];
          uint64_t v11 = [v10 sceneCellOptions];
        }
        double v12 = (void *)v11;
        [v9 setLayoutOptions:v11];

LABEL_11:
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (unint64_t)contentMargins
{
  return self->_contentMargins;
}

- (int64_t)scrollDirection
{
  return self->_scrollDirection;
}

- (BOOL)shouldShowLoadingState
{
  return self->_shouldShowLoadingState;
}

- (void)setShouldShowLoadingState:(BOOL)a3
{
  self->_shouldShowLoadingState = a3;
}

- (HUServiceGridViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUServiceGridViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end