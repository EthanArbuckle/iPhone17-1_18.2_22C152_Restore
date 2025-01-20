@interface PuppetCollectionViewController
+ (double)plusButtonMaxSizeDimension;
- (AVTAvatarRecord)selectedRecord;
- (AVTAvatarRecordDataSource)avatarDataSource;
- (AVTAvatarRecordImageProvider)imageProvider;
- (AVTRenderingScope)thumbScope;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)isShowingPlusButton;
- (BOOL)observingDataSource;
- (BOOL)plusButtonCellEnabled;
- (BOOL)showsPlusButton;
- (BOOL)suspendAutoScrolling;
- (BOOL)userInteractionEnabled;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (PuppetCollectionViewController)initWithCoder:(id)a3;
- (PuppetCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PuppetCollectionViewControllerDelegate)delegate;
- (UICollectionView)puppetCollectionView;
- (UIEdgeInsets)normalizedEdgeInsetsFromDelegate;
- (UIView)borderView;
- (UIView)plusButtonCell;
- (UIView)plusButtonView;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (double)normalizedHorizontalCellSpaingFromDelegate;
- (double)normalizedVerticalCellSpaingFromDelegate;
- (double)puppetCellSize;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)thumbnailForRecordAtIndex:(int64_t)a3;
- (int64_t)numberOfCells;
- (int64_t)numberOfPrecedingCells;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)puppetsPerRow;
- (int64_t)recordIndexForIndexPath:(id)a3;
- (int64_t)selectedRecordIndex;
- (int64_t)selectedRowIndex;
- (void)_configure;
- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)reloadData;
- (void)reloadSelection;
- (void)scrollToSelection;
- (void)setAvatarDataSource:(id)a3;
- (void)setBorderView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setImageProvider:(id)a3;
- (void)setObservingDataSource:(BOOL)a3;
- (void)setPlusButtonCellEnabled:(BOOL)a3;
- (void)setPuppetsPerRow:(int64_t)a3;
- (void)setSelectedRecord:(id)a3;
- (void)setSelectedRecordAtIndex:(int64_t)a3;
- (void)setSelectedRecordIndex:(int64_t)a3;
- (void)setSelectedRowIndex:(int64_t)a3;
- (void)setShowsPlusButton:(BOOL)a3;
- (void)setSuspendAutoScrolling:(BOOL)a3;
- (void)setThumbScope:(id)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)updateHighlightedForVisibleCells;
- (void)updateSelectedForVisibleCells;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PuppetCollectionViewController

+ (double)plusButtonMaxSizeDimension
{
  if (qword_10003EB68 != -1) {
    dispatch_once(&qword_10003EB68, &stru_100034740);
  }
  return *(double *)&qword_10003EB60;
}

- (PuppetCollectionViewController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PuppetCollectionViewController;
  v3 = [(PuppetCollectionViewController *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(PuppetCollectionViewController *)v3 _configure];
  }
  return v4;
}

- (PuppetCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PuppetCollectionViewController;
  v4 = [(PuppetCollectionViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(PuppetCollectionViewController *)v4 _configure];
  }
  return v5;
}

- (void)_configure
{
  self->_suspendAutoScrolling = 0;
  self->_plusButtonCellEnabled = 1;
  self->_showsPlusButton = 1;
  selectedRecord = self->_selectedRecord;
  self->_selectedRecord = 0;

  self->_selectedRecordIndex = -1;
  self->_observingDataSource = 0;
  self->_puppetsPerRow = 4;
  self->_interactionEnabled = 1;
  v4 = +[AVTRenderingScope gridThumbnailScope];
  thumbScope = self->_thumbScope;
  self->_thumbScope = v4;

  objc_super v6 = (UIView *)[objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  borderView = self->_borderView;
  self->_borderView = v6;

  v8 = +[UIColor colorNamed:@"PuppetCollectionViewBorderColor"];
  [(UIView *)self->_borderView setBackgroundColor:v8];

  id v9 = +[UIColor colorNamed:@"PuppetCollectionViewBorderColor"];
  +[PuppetCollectionViewCell setSelectedBorderColor:v9];
}

- (void)setPlusButtonCellEnabled:(BOOL)a3
{
  if (self->_plusButtonCellEnabled != a3)
  {
    self->_plusButtonCellEnabled = a3;
    [(PuppetCollectionViewController *)self reloadData];
  }
}

- (void)setShowsPlusButton:(BOOL)a3
{
  if (self->_showsPlusButton != a3)
  {
    self->_showsPlusButton = a3;
    [(PuppetCollectionViewController *)self reloadData];
  }
}

- (BOOL)isShowingPlusButton
{
  BOOL v3 = [(PuppetCollectionViewController *)self showsPlusButton];
  if (v3)
  {
    v4 = [(PuppetCollectionViewController *)self avatarDataSource];
    v5 = [v4 recordStore];
    unsigned __int8 v6 = [v5 canCreateAvatar];

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)PuppetCollectionViewController;
  [(PuppetCollectionViewController *)&v11 viewDidLoad];
  id v3 = objc_alloc_init((Class)UICollectionViewFlowLayout);
  v4 = [objc_alloc((Class)UICollectionView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(UICollectionView *)v4 setDelegate:self];
  [(UICollectionView *)v4 setDataSource:self];
  [(UICollectionView *)v4 setAutoresizingMask:18];
  v5 = [(PuppetCollectionViewController *)self view];
  [v5 bounds];
  -[UICollectionView setFrame:](v4, "setFrame:");

  unsigned __int8 v6 = +[UIColor clearColor];
  [(UICollectionView *)v4 setBackgroundColor:v6];

  [(UICollectionView *)v4 setAlwaysBounceVertical:1];
  [(UICollectionView *)v4 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"PuppetCellID"];
  puppetCollectionView = self->_puppetCollectionView;
  self->_puppetCollectionView = v4;
  v8 = v4;

  id v9 = [(PuppetCollectionViewController *)self view];
  [v9 addSubview:v8];

  v10 = [(PuppetCollectionViewController *)self view];
  [v10 addSubview:self->_borderView];
}

- (void)viewDidLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)PuppetCollectionViewController;
  [(PuppetCollectionViewController *)&v14 viewDidLayoutSubviews];
  id v3 = [(PuppetCollectionViewController *)self view];
  [v3 bounds];
  double Height = CGRectGetHeight(v15);

  if (Height != 0.0)
  {
    v5 = [(PuppetCollectionViewController *)self view];
    unsigned __int8 v6 = [v5 _screen];
    [v6 scale];
    double v8 = v7;
    double v9 = 1.0 / v7;

    v10 = [(PuppetCollectionViewController *)self view];
    [v10 bounds];
    double Width = CGRectGetWidth(v16);
    if (v8 == 0.0) {
      double v12 = 1.0;
    }
    else {
      double v12 = v9;
    }
    -[UIView setFrame:](self->_borderView, "setFrame:", 0.0, 0.0, Width, v12);

    puppetCollectionView = self->_puppetCollectionView;
    [(PuppetCollectionViewController *)self normalizedEdgeInsetsFromDelegate];
    -[UICollectionView setContentInset:](puppetCollectionView, "setContentInset:");
    if (![(PuppetCollectionViewController *)self suspendAutoScrolling]) {
      [(PuppetCollectionViewController *)self scrollToSelection];
    }
  }
}

- (void)scrollToSelection
{
  id v5 = +[NSIndexPath indexPathForRow:[(PuppetCollectionViewController *)self selectedRowIndex] inSection:0];
  int64_t v3 = [(PuppetCollectionViewController *)self selectedRowIndex];
  if (v3 >= [(PuppetCollectionViewController *)self numberOfCells] - self->_puppetsPerRow) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 4;
  }
  [(UICollectionView *)self->_puppetCollectionView scrollToItemAtIndexPath:v5 atScrollPosition:v4 animated:0];
}

- (AVTAvatarRecordDataSource)avatarDataSource
{
  if (!self->_observingDataSource)
  {
    [(AVTAvatarRecordDataSource *)self->_avatarDataSource addObserver:self];
    self->_observingDataSource = 1;
  }
  avatarDataSource = self->_avatarDataSource;

  return avatarDataSource;
}

- (AVTAvatarRecordImageProvider)imageProvider
{
  imageProvider = self->_imageProvider;
  if (!imageProvider)
  {
    uint64_t v4 = (AVTAvatarRecordImageProvider *)objc_alloc_init((Class)AVTAvatarRecordImageProvider);
    id v5 = self->_imageProvider;
    self->_imageProvider = v4;

    imageProvider = self->_imageProvider;
  }

  return imageProvider;
}

- (int64_t)numberOfPrecedingCells
{
  return [(PuppetCollectionViewController *)self isShowingPlusButton];
}

- (void)setSelectedRecord:(id)a3
{
  id v5 = a3;
  if ([(PuppetCollectionViewController *)self isShowingPlusButton])
  {
    objc_storeStrong((id *)&self->_selectedRecord, a3);
    if (!v5)
    {
      self->_selectedRecordIndex = -1;
      goto LABEL_9;
    }
    unsigned __int8 v6 = [(PuppetCollectionViewController *)self avatarDataSource];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100005B9C;
    v14[3] = &unk_100034768;
    id v15 = v5;
    self->_selectedRecordIndex = (int64_t)[v6 indexOfRecordPassingTest:v14];

    double v7 = v15;
  }
  else
  {
    if (!v5)
    {
      self->_selectedRecordIndex = 0;
      double v9 = [(PuppetCollectionViewController *)self avatarDataSource];
      v10 = [v9 recordAtIndex:0];
      selectedRecord = self->_selectedRecord;
      self->_selectedRecord = v10;

      goto LABEL_9;
    }
    objc_storeStrong((id *)&self->_selectedRecord, a3);
    double v8 = [(PuppetCollectionViewController *)self avatarDataSource];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100005C00;
    v12[3] = &unk_100034768;
    id v13 = v5;
    self->_selectedRecordIndex = (int64_t)[v8 indexOfRecordPassingTest:v12];

    double v7 = v13;
  }

LABEL_9:
}

- (void)setSelectedRecordAtIndex:(int64_t)a3
{
  if ([(PuppetCollectionViewController *)self isShowingPlusButton])
  {
    self->_selectedRecordIndex = a3;
    if (a3 == -1)
    {
      selectedRecord = self->_selectedRecord;
      self->_selectedRecord = 0;
      goto LABEL_10;
    }
    id v5 = [(PuppetCollectionViewController *)self avatarDataSource];
    v10 = v5;
  }
  else
  {
    if (a3 == -1)
    {
      self->_selectedRecordIndex = 0;
      id v5 = [(PuppetCollectionViewController *)self avatarDataSource];
      v10 = v5;
      int64_t v6 = 0;
      goto LABEL_9;
    }
    id v5 = [(PuppetCollectionViewController *)self avatarDataSource];
    v10 = v5;
    self->_selectedRecordIndex = a3;
  }
  int64_t v6 = a3;
LABEL_9:
  double v8 = [(AVTAvatarRecord *)v5 recordAtIndex:v6];
  double v9 = self->_selectedRecord;
  self->_selectedRecord = v8;

  selectedRecord = v10;
LABEL_10:
}

- (int64_t)selectedRowIndex
{
  int64_t selectedRecordIndex = self->_selectedRecordIndex;
  return [(PuppetCollectionViewController *)self numberOfPrecedingCells] + selectedRecordIndex;
}

- (void)setSelectedRowIndex:(int64_t)a3
{
  int64_t v4 = a3 - [(PuppetCollectionViewController *)self numberOfPrecedingCells];

  [(PuppetCollectionViewController *)self setSelectedRecordAtIndex:v4];
}

- (int64_t)numberOfCells
{
  int64_t v3 = [(PuppetCollectionViewController *)self avatarDataSource];
  int64_t v4 = (char *)[v3 numberOfRecords];
  id v5 = &v4[[(PuppetCollectionViewController *)self numberOfPrecedingCells]];

  return (int64_t)v5;
}

- (id)thumbnailForRecordAtIndex:(int64_t)a3
{
  id v5 = [(PuppetCollectionViewController *)self avatarDataSource];
  int64_t v6 = [v5 recordAtIndex:a3];

  if (v6)
  {
    double v7 = [(PuppetCollectionViewController *)self imageProvider];
    double v8 = [v7 imageForRecord:v6 scope:self->_thumbScope];
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (int64_t)recordIndexForIndexPath:(id)a3
{
  int64_t v4 = [a3 row];
  return v4 - (unsigned char *)[(PuppetCollectionViewController *)self numberOfPrecedingCells];
}

- (void)updateSelectedForVisibleCells
{
  id v3 = [(PuppetCollectionViewController *)self selectedRowIndex];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int64_t v4 = [(UICollectionView *)self->_puppetCollectionView visibleCells];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        v10 = [(UICollectionView *)self->_puppetCollectionView indexPathForCell:v9];
        [v9 displaySelection:[v10 row] == v3];
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)updateHighlightedForVisibleCells
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(UICollectionView *)self->_puppetCollectionView visibleCells];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) displayHighlight:0];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (UIView)plusButtonCell
{
  puppetCollectionView = self->_puppetCollectionView;
  id v3 = +[NSIndexPath indexPathForRow:0 inSection:0];
  id v4 = [(UICollectionView *)puppetCollectionView cellForItemAtIndexPath:v3];

  return (UIView *)v4;
}

- (UIView)plusButtonView
{
  puppetCollectionView = self->_puppetCollectionView;
  id v3 = +[NSIndexPath indexPathForRow:0 inSection:0];
  id v4 = [(UICollectionView *)puppetCollectionView cellForItemAtIndexPath:v3];

  uint64_t v5 = [v4 imageButton];

  return (UIView *)v5;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  self->_interactionEnabled = a3;
  if (a3) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.3;
  }
  id v4 = [(PuppetCollectionViewController *)self view];
  [v4 setAlpha:v3];
}

- (double)puppetCellSize
{
  [(PuppetCollectionViewController *)self normalizedHorizontalCellSpaingFromDelegate];
  double v4 = v3;
  [(PuppetCollectionViewController *)self normalizedEdgeInsetsFromDelegate];
  double v6 = v5;
  double v8 = v7;
  [(UICollectionView *)self->_puppetCollectionView bounds];
  return fmax((CGRectGetWidth(v10) - v6 - v8 - v4 * (double)(self->_puppetsPerRow - 1)) / (double)self->_puppetsPerRow, 0.0);
}

- (void)setPuppetsPerRow:(int64_t)a3
{
  if (self->_puppetsPerRow != a3)
  {
    self->_puppetsPerRow = a3;
    id v4 = [(PuppetCollectionViewController *)self puppetCollectionView];
    double v3 = [v4 collectionViewLayout];
    [v3 invalidateLayout];
  }
}

- (UIEdgeInsets)normalizedEdgeInsetsFromDelegate
{
  +[PuppetCollectionViewCell cellContentPadding];
  unint64_t v4 = v3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained contentInsetForPuppetCollectionViewController:self];
  unint64_t v7 = v6;
  unint64_t v9 = v8;
  unint64_t v11 = v10;
  unint64_t v13 = v12;

  v14.n128_u64[0] = v7;
  v15.n128_u64[0] = v9;
  v16.n128_u64[0] = v11;
  v17.n128_u64[0] = v13;
  v18.n128_u64[0] = v4;
  v19.n128_u64[0] = v4;
  v20.n128_u64[0] = v4;
  v21.n128_u64[0] = v4;

  _UIEdgeInsetsSubtract(15, v14, v15, v16, v17, v18, v19, v20, v21);
  result.right = v25;
  result.bottom = v24;
  result.left = v23;
  result.top = v22;
  return result;
}

- (double)normalizedHorizontalCellSpaingFromDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained horizontalCellSpacingForPuppetCollectionViewController:self];
  double v5 = v4;

  +[PuppetCollectionViewCell cellContentPadding];
  return v5 + v6 * -2.0;
}

- (double)normalizedVerticalCellSpaingFromDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained verticalCellSpacingForPuppetCollectionViewController:self];
  double v5 = v4;

  +[PuppetCollectionViewCell cellContentPadding];
  return v5 + v6 * -2.0;
}

- (void)reloadData
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100006570;
  v2[3] = &unk_100034790;
  v2[4] = self;
  +[UIView performWithoutAnimation:v2];
}

- (void)reloadSelection
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10000662C;
  v2[3] = &unk_100034790;
  v2[4] = self;
  +[UIView performWithoutAnimation:v2];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PuppetCollectionViewController;
  -[PuppetCollectionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  unint64_t v8 = +[UIDevice currentDevice];
  id v9 = [v8 userInterfaceIdiom];

  if (!v9)
  {
    [(PuppetCollectionViewController *)self setSuspendAutoScrolling:1];
    if (v7) {
      goto LABEL_3;
    }
LABEL_5:
    [(PuppetCollectionViewController *)self reloadData];
    goto LABEL_6;
  }
  if (!v7) {
    goto LABEL_5;
  }
LABEL_3:
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000678C;
  v10[3] = &unk_1000347B8;
  BOOL v11 = v9 == 0;
  v10[4] = self;
  [v7 animateAlongsideTransition:0 completion:v10];
LABEL_6:
}

- (UICollectionView)puppetCollectionView
{
  return self->_puppetCollectionView;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v6 dequeueReusableCellWithReuseIdentifier:@"PuppetCellID" forIndexPath:v7];
  if ([v7 row] || !-[PuppetCollectionViewController isShowingPlusButton](self, "isShowingPlusButton"))
  {
    int64_t v13 = [(PuppetCollectionViewController *)self recordIndexForIndexPath:v7];
    __n128 v14 = [(PuppetCollectionViewController *)self avatarDataSource];
    __n128 v15 = [v14 recordAtIndex:v13];

    if (v15)
    {
      __n128 v16 = [v8 asyncPuppetThumbnailHandler];
      __n128 v17 = [(PuppetCollectionViewController *)self imageProvider];
      [v17 imageForRecord:v15 scope:self->_thumbScope handler:v16];
    }
  }
  else
  {
    [(id)objc_opt_class() plusButtonMaxSizeDimension];
    double v10 = v9;
    objc_initWeak(&location, self);
    BOOL v11 = [(PuppetCollectionViewController *)self plusButtonCellEnabled];
    uint64_t v12 = kAVTCircularButtonPlusImageName;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100006A00;
    v19[3] = &unk_1000347E0;
    objc_copyWeak(&v20, &location);
    [v8 setButtonImageNamed:v12 alpha:v11 maxSize:v19 enabled:1.0 touchedHandler:v10];
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006B30;
  v9[3] = &unk_100034808;
  id v10 = a4;
  BOOL v11 = self;
  id v12 = a5;
  id v7 = v12;
  id v8 = v10;
  +[UIView performWithoutAnimation:v9];
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  id v4 = [a3 cellForItemAtIndexPath:a4];
  [v4 displayHighlight:1];
}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  id v4 = [a3 cellForItemAtIndexPath:a4];
  [v4 displayHighlight:0];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  [self setSelectedRowIndex:[a4 row]];
  [(PuppetCollectionViewController *)self updateSelectedForVisibleCells];
  id v6 = [(PuppetCollectionViewController *)self delegate];
  double v5 = [(PuppetCollectionViewController *)self selectedRecord];
  [v6 puppetCollectionViewController:self didSelectPuppetRecord:v5];
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  BOOL v9 = self->_interactionEnabled
    && ([v7 row] || !-[PuppetCollectionViewController isShowingPlusButton](self, "isShowingPlusButton"));

  return v9;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  [(PuppetCollectionViewController *)self puppetCellSize];
  double v6 = v5;
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  [(PuppetCollectionViewController *)self normalizedVerticalCellSpaingFromDelegate];
  return result;
}

- (PuppetCollectionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PuppetCollectionViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setAvatarDataSource:(id)a3
{
}

- (AVTAvatarRecord)selectedRecord
{
  return self->_selectedRecord;
}

- (BOOL)plusButtonCellEnabled
{
  return self->_plusButtonCellEnabled;
}

- (int64_t)puppetsPerRow
{
  return self->_puppetsPerRow;
}

- (BOOL)userInteractionEnabled
{
  return self->_userInteractionEnabled;
}

- (int64_t)selectedRecordIndex
{
  return self->_selectedRecordIndex;
}

- (void)setSelectedRecordIndex:(int64_t)a3
{
  self->_int64_t selectedRecordIndex = a3;
}

- (void)setImageProvider:(id)a3
{
}

- (AVTRenderingScope)thumbScope
{
  return self->_thumbScope;
}

- (void)setThumbScope:(id)a3
{
}

- (BOOL)observingDataSource
{
  return self->_observingDataSource;
}

- (void)setObservingDataSource:(BOOL)a3
{
  self->_observingDataSource = a3;
}

- (UIView)borderView
{
  return self->_borderView;
}

- (void)setBorderView:(id)a3
{
}

- (BOOL)showsPlusButton
{
  return self->_showsPlusButton;
}

- (BOOL)suspendAutoScrolling
{
  return self->_suspendAutoScrolling;
}

- (void)setSuspendAutoScrolling:(BOOL)a3
{
  self->_suspendAutoScrolling = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_thumbScope, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_selectedRecord, 0);
  objc_storeStrong((id *)&self->_avatarDataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_puppetCollectionView, 0);
}

@end