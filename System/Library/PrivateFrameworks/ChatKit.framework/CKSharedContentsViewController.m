@interface CKSharedContentsViewController
- (BOOL)collectionView:(id)a3 canPerformAction:(SEL)a4 forItemAtIndexPath:(id)a5 withSender:(id)a6;
- (BOOL)collectionView:(id)a3 shouldShowMenuForItemAtIndexPath:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)isDisplayingAttachmentContent;
- (BOOL)isJ99LandscapeModeFullScreen;
- (BOOL)isSelectingAttachments;
- (BOOL)previewController:(id)a3 shouldOpenURL:(id)a4 forPreviewItem:(id)a5;
- (CGRect)previewController:(id)a3 frameForPreviewItem:(id)a4 inSourceView:(id *)a5;
- (CGSize)contentSizeThatFits:(CGSize)a3;
- (CKQLPreviewController)qlPreviewController;
- (CKSharedAssetsControllerDelegate)delegate;
- (CKSharedContentsViewController)initWithAttachmentItems:(id)a3;
- (NSArray)attachmentItems;
- (NSArray)parentRightBarButtonItemsToRestore;
- (UIBarButtonItem)deleteButton;
- (UIBarButtonItem)saveButton;
- (UICollectionView)collectionView;
- (UICollectionViewFlowLayout)collectionviewLayout;
- (UIView)topmostMarkerView;
- (double)cellAspectRatio;
- (double)paddingLeftRightForCell;
- (double)paddingTopBottomForCell;
- (id)_collectionView:(id)a3 dragItemsForItemAtIndexPath:(id)a4;
- (id)avatarView:(id)a3 orderedPropertiesForProperties:(id)a4 category:(id)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)committedViewControllerForPreviewViewController:(id)a3;
- (id)contextualCKChatItemsForPreviewController:(id)a3;
- (id)invisibleInkEffectControllerForPreviewController:(id)a3;
- (id)presentingViewControllerForAvatarView:(id)a3;
- (id)previewController:(id)a3 transitionViewForPreviewItem:(id)a4 uncroppedSourceFrame:(CGRect *)a5 realSize:(CGSize *)a6;
- (id)previewingContext:(id)a3 viewControllerForLocation:(CGPoint)a4;
- (id)selectedAttachmentIndexes;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfItemsInRow;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (unint64_t)assetType;
- (void)cancelSelectingContents:(id)a3;
- (void)dealloc;
- (void)deleteContents:(id)a3;
- (void)deleteSelectedContents:(id)a3;
- (void)didDismissPreviewViewController:(id)a3 committing:(BOOL)a4;
- (void)didMoveToParentViewController:(id)a3;
- (void)loadView;
- (void)performAction:(SEL)a3 forSharedContentsCollectionViewCell:(id)a4;
- (void)previewControllerDidDismiss:(id)a3;
- (void)previewingContext:(id)a3 commitViewController:(id)a4;
- (void)setAttachmentItems:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setCollectionviewLayout:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeleteButton:(id)a3;
- (void)setParentRightBarButtonItemsToRestore:(id)a3;
- (void)setQlPreviewController:(id)a3;
- (void)setSaveButton:(id)a3;
- (void)setSelectingAttachments:(BOOL)a3;
- (void)setTopmostMarkerView:(id)a3;
- (void)setupToolbar;
- (void)sharedContentsCollectionViewCellDidTap:(id)a3;
- (void)teardownToolbar;
- (void)updateToolbar;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willPresentPreviewViewController:(id)a3 forLocation:(CGPoint)a4 inSourceView:(id)a5;
@end

@implementation CKSharedContentsViewController

- (CKSharedContentsViewController)initWithAttachmentItems:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKSharedContentsViewController;
  v5 = [(CKSharedContentsViewController *)&v8 init];
  v6 = v5;
  if (v5) {
    [(CKSharedContentsViewController *)v5 setAttachmentItems:v4];
  }

  return v6;
}

- (void)didMoveToParentViewController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKSharedContentsViewController;
  [(CKSharedContentsViewController *)&v6 didMoveToParentViewController:a3];
  id v4 = [(CKSharedContentsViewController *)self collectionviewLayout];
  [v4 prepareLayout];

  v5 = [(CKSharedContentsViewController *)self delegate];
  [v5 sharedAssetsControllerContentSizeDidChange:self];
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_delegate, 0);
  v3 = [MEMORY[0x1E4F42948] currentDevice];
  int v4 = [v3 _supportsForceTouch];

  if (v4) {
    [(CKSharedContentsViewController *)self unregisterPreviewSourceView:self->_collectionView];
  }
  [(QLPreviewController *)self->_qlPreviewController setDelegate:0];
  [(UICollectionView *)self->_collectionView setDelegate:0];
  [(UICollectionView *)self->_collectionView setDataSource:0];
  v5.receiver = self;
  v5.super_class = (Class)CKSharedContentsViewController;
  [(CKSharedContentsViewController *)&v5 dealloc];
}

- (void)loadView
{
  id v20 = objc_alloc_init(MEMORY[0x1E4F42890]);
  [(CKSharedContentsViewController *)self setCollectionviewLayout:v20];
  id v3 = objc_alloc(MEMORY[0x1E4F42858]);
  int v4 = [MEMORY[0x1E4F42D90] mainScreen];
  [v4 bounds];
  objc_super v5 = objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v20);

  [v5 setAutoresizingMask:18];
  [v5 setDelegate:self];
  [v5 setDataSource:self];
  [v5 setDragSourceDelegate:self];
  objc_super v6 = [MEMORY[0x1E4F428B8] clearColor];
  [v5 setBackgroundColor:v6];

  uint64_t v7 = objc_opt_class();
  objc_super v8 = +[CKSharedContentsCollectionViewCell reuseIdentifier];
  [v5 registerClass:v7 forCellWithReuseIdentifier:v8];

  uint64_t v9 = objc_opt_class();
  v10 = +[CKSharedContactsCollectionViewCell reuseIdentifier];
  [v5 registerClass:v9 forCellWithReuseIdentifier:v10];

  uint64_t v11 = objc_opt_class();
  v12 = +[CKSharedOtherTypesCollectionViewCell reuseIdentifier];
  [v5 registerClass:v11 forCellWithReuseIdentifier:v12];

  uint64_t v13 = objc_opt_class();
  v14 = +[CKSharedAudioCollectionViewCell reuseIdentifier];
  [v5 registerClass:v13 forCellWithReuseIdentifier:v14];

  uint64_t v15 = objc_opt_class();
  v16 = +[CKSharedLocationCollectionViewCell reuseIdentifier];
  [v5 registerClass:v15 forCellWithReuseIdentifier:v16];

  uint64_t v17 = objc_opt_class();
  v18 = +[CKSharedQuickLookThumbnailCollectionViewCell reuseIdentifier];
  [v5 registerClass:v17 forCellWithReuseIdentifier:v18];

  [v5 setScrollEnabled:0];
  [v5 setAllowsMultipleSelection:1];
  v19 = [MEMORY[0x1E4F42948] currentDevice];
  LODWORD(v18) = [v19 _supportsForceTouch];

  if (v18) {
    [(CKSharedContentsViewController *)self registerPreviewSourceView:v5 previewingDelegate:self];
  }
  [(CKSharedContentsViewController *)self setCollectionView:v5];
  [(CKSharedContentsViewController *)self setView:v5];
}

- (void)viewWillLayoutSubviews
{
  v30.receiver = self;
  v30.super_class = (Class)CKSharedContentsViewController;
  [(CKSharedContentsViewController *)&v30 viewWillLayoutSubviews];
  id v3 = [(CKSharedContentsViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v12 = [(CKSharedContentsViewController *)self collectionviewLayout];
  unint64_t v13 = [(CKSharedContentsViewController *)self numberOfItemsInRow];
  [(CKSharedContentsViewController *)self paddingLeftRightForCell];
  double v15 = v14;
  v31.origin.x = v5;
  v31.origin.y = v7;
  v31.size.width = v9;
  v31.size.height = v11;
  double Width = CGRectGetWidth(v31);
  if (CKMainScreenScale_once_3 != -1) {
    dispatch_once(&CKMainScreenScale_once_3, &__block_literal_global_5);
  }
  double v17 = *(double *)&CKMainScreenScale_sMainScreenScale_3;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_3 == 0.0) {
    double v17 = 1.0;
  }
  double v18 = fmin(round((Width - (double)(2 * v13) * v15) / (float)v13 * v17) / v17, 160.0);
  [(CKSharedContentsViewController *)self cellAspectRatio];
  objc_msgSend(v12, "setItemSize:", v18, v19 * v18);
  [(CKSharedContentsViewController *)self paddingLeftRightForCell];
  objc_msgSend(v12, "setMinimumInteritemSpacing:");
  [(CKSharedContentsViewController *)self paddingTopBottomForCell];
  [v12 setMinimumLineSpacing:v20 + v20];
  [(CKSharedContentsViewController *)self paddingTopBottomForCell];
  double v22 = v21;
  [(CKSharedContentsViewController *)self paddingLeftRightForCell];
  double v24 = v23;
  [(CKSharedContentsViewController *)self paddingTopBottomForCell];
  double v26 = v25;
  [(CKSharedContentsViewController *)self paddingLeftRightForCell];
  objc_msgSend(v12, "setSectionInset:", v22, v24, v26, v27);
  v28 = [(CKSharedContentsViewController *)self view];
  v29 = [MEMORY[0x1E4F428B8] _ckSystemGroupedBackgroundColor];
  [v28 setBackgroundColor:v29];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKSharedContentsViewController;
  [(CKSharedContentsViewController *)&v4 viewDidDisappear:a3];
  [(CKSharedContentsViewController *)self setSelectingAttachments:0];
}

- (BOOL)isJ99LandscapeModeFullScreen
{
  v2 = [MEMORY[0x1E4F42D90] mainScreen];
  [v2 bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;

  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  double Width = CGRectGetWidth(v18);
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.width = v8;
  v19.size.height = v10;
  double v12 = CGRectGetWidth(v19);
  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  BOOL v13 = v12 > CGRectGetHeight(v20);
  double v14 = [MEMORY[0x1E4F42D90] mainScreen];
  [v14 _applicationFrame];
  double v15 = CGRectGetWidth(v21);

  BOOL v16 = Width >= 1366.0 && v13;
  return v15 == 1366.0 && v16;
}

- (void)setAttachmentItems:(id)a3
{
  double v5 = (NSArray *)a3;
  if (self->_attachmentItems != v5)
  {
    double v9 = v5;
    objc_storeStrong((id *)&self->_attachmentItems, a3);
    CGFloat v6 = [(CKSharedContentsViewController *)self collectionviewLayout];
    [v6 invalidateLayout];

    double v7 = [(CKSharedContentsViewController *)self collectionView];
    [v7 reloadData];

    CGFloat v8 = [(CKSharedContentsViewController *)self delegate];
    [v8 sharedAssetsControllerContentSizeDidChange:self];

    double v5 = v9;
  }
}

- (void)setSelectingAttachments:(BOOL)a3
{
  if (self->_selectingAttachments != a3)
  {
    self->_selectingAttachments = a3;
    if (a3) {
      [(CKSharedContentsViewController *)self setupToolbar];
    }
    else {
      [(CKSharedContentsViewController *)self teardownToolbar];
    }
    [(CKSharedContentsViewController *)self updateToolbar];
    id v4 = [(CKSharedContentsViewController *)self collectionView];
    [v4 reloadData];
  }
}

- (void)setupToolbar
{
  v16[2] = *MEMORY[0x1E4F143B8];
  double v3 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:16 target:self action:sel_deleteSelectedContents_];
  [(CKSharedContentsViewController *)self setDeleteButton:v3];
  id v4 = [(CKSharedContentsViewController *)self navigationController];
  double v5 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:5 target:0 action:0];
  [v4 setToolbarHidden:0 animated:1];
  CGFloat v6 = [v4 toolbar];
  v16[0] = v5;
  v16[1] = v3;
  double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  [v6 setItems:v7];

  id v8 = objc_alloc(MEMORY[0x1E4F427C0]);
  double v9 = CKFrameworkBundle();
  CGFloat v10 = [v9 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
  CGFloat v11 = (void *)[v8 initWithTitle:v10 style:0 target:self action:sel_cancelSelectingContents_];

  double v12 = [(CKSharedContentsViewController *)self parentViewController];
  BOOL v13 = [v12 navigationItem];

  double v14 = [v13 rightBarButtonItems];
  [(CKSharedContentsViewController *)self setParentRightBarButtonItemsToRestore:v14];

  [v13 setRightBarButtonItem:v11 animated:1];
  double v15 = [v13 backBarButtonItem];

  if (v15) {
    [v13 setHidesBackButton:1];
  }
}

- (void)teardownToolbar
{
  id v8 = [(CKSharedContentsViewController *)self navigationController];
  [v8 setToolbarHidden:1 animated:1];
  double v3 = [(CKSharedContentsViewController *)self parentViewController];
  id v4 = [v3 navigationItem];

  double v5 = [(CKSharedContentsViewController *)self parentRightBarButtonItemsToRestore];
  [v4 setRightBarButtonItems:v5 animated:1];

  CGFloat v6 = [v4 backBarButtonItem];

  if (v6) {
    [v4 setHidesBackButton:0];
  }
  double v7 = [v8 toolbar];
  [v7 setItems:0];

  [(CKSharedContentsViewController *)self setSaveButton:0];
  [(CKSharedContentsViewController *)self setDeleteButton:0];
}

- (void)updateToolbar
{
  double v3 = [(CKSharedContentsViewController *)self selectedAttachmentIndexes];
  unint64_t v4 = [v3 count];

  id v16 = [(CKSharedContentsViewController *)self saveButton];
  double v5 = [(CKSharedContentsViewController *)self deleteButton];
  [v16 setEnabled:v4 != 0];
  [v5 setEnabled:v4 != 0];
  CGFloat v6 = [NSNumber numberWithUnsignedInteger:v4];
  double v7 = CKLocalizedStringForNumber(v6);

  if (v4 >= 2)
  {
    id v8 = NSString;
    double v9 = CKFrameworkBundle();
    CGFloat v10 = [v9 localizedStringForKey:@"SAVE_ATTACHMENTS" value:&stru_1EDE4CA38 table:@"ChatKit"];
    CGFloat v11 = objc_msgSend(v8, "stringWithFormat:", v10, v7);

    double v12 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v13 = [v12 userInterfaceLayoutDirection];

    if (v13 == 1) {
      double v14 = @"\u200F";
    }
    else {
      double v14 = @"\u200E";
    }
    double v15 = [(__CFString *)v14 stringByAppendingString:v11];

    [v16 setTitle:v15];
  }
}

- (double)paddingLeftRightForCell
{
  return 5.0;
}

- (double)paddingTopBottomForCell
{
  return 10.0;
}

- (int64_t)numberOfItemsInRow
{
  if ([(CKSharedContentsViewController *)self isJ99LandscapeModeFullScreen]) {
    return 5;
  }
  else {
    return 3;
  }
}

- (double)cellAspectRatio
{
  return 1.39130435;
}

- (unint64_t)assetType
{
  return 1;
}

- (CGSize)contentSizeThatFits:(CGSize)a3
{
  double width = a3.width;
  uint64_t v5 = [(CKSharedContentsViewController *)self numberOfItemsInRow];
  [(CKSharedContentsViewController *)self paddingLeftRightForCell];
  double v7 = v6;
  if (CKMainScreenScale_once_3 != -1) {
    dispatch_once(&CKMainScreenScale_once_3, &__block_literal_global_5);
  }
  double v8 = *(double *)&CKMainScreenScale_sMainScreenScale_3;
  [(CKSharedContentsViewController *)self cellAspectRatio];
  double v10 = v9;
  CGFloat v11 = [(CKSharedContentsViewController *)self attachmentItems];
  unint64_t v12 = [v11 count];

  [(CKSharedContentsViewController *)self paddingTopBottomForCell];
  double v14 = v13;
  [(CKSharedContentsViewController *)self paddingTopBottomForCell];
  double v16 = v15;
  if (CKMainScreenScale_once_3 != -1) {
    dispatch_once(&CKMainScreenScale_once_3, &__block_literal_global_5);
  }
  double v17 = ceilf((float)v12 / (float)v5);
  if (v8 == 0.0) {
    double v18 = 1.0;
  }
  else {
    double v18 = v8;
  }
  double v19 = v16
      + v16
      + v17 * (v10 * fmin(round((width - (double)(2 * v5) * v7) / (float)v5 * v18) / v18, 160.0))
      + (v17 + -1.0) * (v14 + v14);
  double v20 = *(double *)&CKMainScreenScale_sMainScreenScale_3;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_3 == 0.0) {
    double v20 = 1.0;
  }
  double v21 = round(v19 * v20) / v20;
  double v22 = width;
  result.height = v21;
  result.double width = v22;
  return result;
}

- (BOOL)isDisplayingAttachmentContent
{
  v2 = [(CKSharedContentsViewController *)self attachmentItems];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)selectedAttachmentIndexes
{
  v2 = [(CKSharedContentsViewController *)self collectionView];
  BOOL v3 = [v2 indexPathsForSelectedItems];
  unint64_t v4 = objc_msgSend(v3, "__ck_indexSetForIndexPathItemsInSection:", 0);

  return v4;
}

- (id)presentingViewControllerForAvatarView:(id)a3
{
  unint64_t v4 = [(CKSharedContentsViewController *)self parentViewController];
  if (v4)
  {
    uint64_t v5 = [(CKSharedContentsViewController *)self parentViewController];
  }
  else
  {
    uint64_t v5 = self;
  }
  double v6 = v5;

  return v6;
}

- (id)avatarView:(id)a3 orderedPropertiesForProperties:(id)a4 category:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([a5 isEqualToString:*MEMORY[0x1E4F1BAF8]])
  {
    uint64_t v24 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v26;
      uint64_t v11 = *MEMORY[0x1E4F1ADC8];
      uint64_t v12 = *MEMORY[0x1E4F1AEE0];
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v7);
          }
          double v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          double v15 = [v14 key];
          int v16 = [v15 isEqualToString:v11];

          if (v16)
          {
            double v17 = [v14 value];
          }
          else
          {
            double v18 = [v14 key];
            int v19 = [v18 isEqualToString:v12];

            if (v19)
            {
              double v20 = [v14 value];
              double v17 = [v20 stringValue];
            }
            else
            {
              double v17 = 0;
            }
          }
          double v21 = IMStripFormattingFromAddress();
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v9);
    }

    double v22 = (void *)v24;
  }
  else
  {
    double v22 = 0;
  }

  return v22;
}

- (CKQLPreviewController)qlPreviewController
{
  qlPreviewController = self->_qlPreviewController;
  if (!qlPreviewController)
  {
    unint64_t v4 = objc_alloc_init(CKQLPreviewController);
    [(QLPreviewController *)v4 setDelegate:self];
    uint64_t v5 = self->_qlPreviewController;
    self->_qlPreviewController = v4;

    qlPreviewController = self->_qlPreviewController;
  }

  return qlPreviewController;
}

- (id)invisibleInkEffectControllerForPreviewController:(id)a3
{
  return 0;
}

- (id)contextualCKChatItemsForPreviewController:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)previewControllerDidDismiss:(id)a3
{
}

- (BOOL)previewController:(id)a3 shouldOpenURL:(id)a4 forPreviewItem:(id)a5
{
  return 0;
}

- (CGRect)previewController:(id)a3 frameForPreviewItem:(id)a4 inSourceView:(id *)a5
{
  id v7 = a4;
  double v8 = *MEMORY[0x1E4F1DB28];
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v16 = 0;
    if (!a5) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  id v12 = v7;
  double v13 = [(CKSharedContentsViewController *)self collectionView];
  double v14 = [(CKSharedContentsViewController *)self attachmentItems];
  uint64_t v15 = [v14 indexOfObject:v12];

  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v16 = 0;
  }
  else
  {
    double v17 = [MEMORY[0x1E4F28D58] indexPathForRow:v15 inSection:0];
    double v18 = [v13 cellForItemAtIndexPath:v17];
    int v16 = [v18 contentView];
    [v16 frame];
    double v8 = v19;
    double v9 = v20;
    double v10 = v21;
    double v11 = v22;
  }
  if (a5) {
LABEL_8:
  }
    *a5 = v16;
LABEL_9:

  double v23 = v8;
  double v24 = v9;
  double v25 = v10;
  double v26 = v11;
  result.size.height = v26;
  result.size.double width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (id)previewController:(id)a3 transitionViewForPreviewItem:(id)a4 uncroppedSourceFrame:(CGRect *)a5 realSize:(CGSize *)a6
{
  id v9 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    double v11 = [(CKSharedContentsViewController *)self collectionView];
    id v12 = [(CKSharedContentsViewController *)self attachmentItems];
    uint64_t v13 = [v12 indexOfObject:v10];

    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      double v14 = 0;
    }
    else
    {
      uint64_t v15 = [MEMORY[0x1E4F28D58] indexPathForRow:v13 inSection:0];
      int v16 = [v11 cellForItemAtIndexPath:v15];
      double v17 = [v16 contentView];
      [v17 bounds];
      a5->origin.x = v18;
      a5->origin.y = v19;
      a5->size.double width = v20;
      a5->size.height = v21;

      *a6 = *(CGSize *)MEMORY[0x1E4F1DB30];
      double v14 = [v16 contentView];
    }
  }
  else
  {
    double v14 = 0;
  }

  return v14;
}

- (id)previewingContext:(id)a3 viewControllerForLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = [(CKSharedContentsViewController *)self collectionView];
  double v8 = objc_msgSend(v7, "indexPathForItemAtPoint:", x, y);

  if ([(CKSharedContentsViewController *)self isSelectingAttachments])
  {
    id v9 = 0;
  }
  else
  {
    id v10 = [(CKSharedContentsViewController *)self qlPreviewController];
    double v11 = [v10 dataSource];
    id v12 = [(CKSharedContentsViewController *)self attachmentItems];
    [v11 setPreviewItems:v12];

    uint64_t v13 = [(CKSharedContentsViewController *)self qlPreviewController];
    [v13 reloadData];

    double v14 = [(CKSharedContentsViewController *)self qlPreviewController];
    objc_msgSend(v14, "setCurrentPreviewItemIndex:", objc_msgSend(v8, "item"));

    uint64_t v15 = [(CKSharedContentsViewController *)self qlPreviewController];
    [v15 refreshCurrentPreviewItem];

    id v9 = [(CKSharedContentsViewController *)self qlPreviewController];
  }

  return v9;
}

- (void)willPresentPreviewViewController:(id)a3 forLocation:(CGPoint)a4 inSourceView:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v8 = a3;
  id v13 = [(CKSharedContentsViewController *)self collectionView];
  id v9 = objc_msgSend(v13, "indexPathForItemAtPoint:", x, y);
  id v10 = [v13 cellForItemAtIndexPath:v9];
  double v11 = [v8 presentationController];

  [v11 setSourceView:v10];
  [v10 bounds];
  objc_msgSend(v11, "setSourceRect:");
  id v12 = [(CKSharedContentsViewController *)self qlPreviewController];
  [v12 setCurrentOrbMode:1];
}

- (void)didDismissPreviewViewController:(id)a3 committing:(BOOL)a4
{
  if (!a4)
  {
    id v5 = [(CKSharedContentsViewController *)self qlPreviewController];
    [v5 setCurrentOrbMode:0];
  }
}

- (id)committedViewControllerForPreviewViewController:(id)a3
{
  id v3 = a3;

  return v3;
}

- (void)previewingContext:(id)a3 commitViewController:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F6E890];
  id v6 = a4;
  id v7 = [v5 sharedInstance];
  [v7 trackEvent:*MEMORY[0x1E4F6DA88]];

  id v8 = [(CKSharedContentsViewController *)self qlPreviewController];
  [v8 setCurrentOrbMode:2];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__CKSharedContentsViewController_previewingContext_commitViewController___block_invoke;
  v9[3] = &unk_1E5620C40;
  v9[4] = self;
  [(CKSharedContentsViewController *)self presentViewController:v6 animated:0 completion:v9];
}

void __73__CKSharedContentsViewController_previewingContext_commitViewController___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) qlPreviewController];
  [v1 setCurrentOrbMode:0];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = objc_msgSend(a4, "view", a3);
  id v6 = [v5 superview];

  BOOL v7 = [(CKSharedContentsViewController *)self isSelectingAttachments];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  BOOL v9 = !v7 & isKindOfClass;

  return v9;
}

- (void)sharedContentsCollectionViewCellDidTap:(id)a3
{
  id v11 = a3;
  if (![(CKSharedContentsViewController *)self isSelectingAttachments])
  {
    uint64_t v4 = [(CKSharedContentsViewController *)self collectionView];
    id v5 = [(CKSharedContentsViewController *)self qlPreviewController];
    id v6 = [v4 indexPathForCell:v11];
    uint64_t v7 = [v6 item];

    id v8 = objc_alloc_init(CKQLPreviewControllerDataSource);
    [v5 setDataSource:v8];
    BOOL v9 = [(CKSharedContentsViewController *)self attachmentItems];
    [(CKQLPreviewControllerDataSource *)v8 setPreviewItems:v9];

    [v5 reloadData];
    [v5 setCurrentPreviewItemIndex:v7];
    [v5 refreshCurrentPreviewItem];
    [v5 setModalPresentationStyle:0];
    id v10 = [MEMORY[0x1E4F6E890] sharedInstance];
    [v10 trackEvent:*MEMORY[0x1E4F6DA88]];

    [(CKSharedContentsViewController *)self presentViewController:v5 animated:1 completion:0];
  }
}

- (void)performAction:(SEL)a3 forSharedContentsCollectionViewCell:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(CKSharedContentsViewController *)self collectionView];
  id v8 = [v7 indexPathForCell:v6];
  uint64_t v9 = [v8 item];

  id v10 = [(CKSharedContentsViewController *)self attachmentItems];
  id v11 = [v10 objectAtIndex:v9];

  if (sel_delete_ == a3)
  {
    v13[0] = v11;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    [(CKSharedContentsViewController *)self deleteContents:v12];
    goto LABEL_5;
  }
  if (sel_more_ == a3)
  {
    id v12 = [v7 indexPathForCell:v6];
    [(CKSharedContentsViewController *)self setSelectingAttachments:1];
    [v7 selectItemAtIndexPath:v12 animated:1 scrollPosition:0];
    [(CKSharedContentsViewController *)self updateToolbar];
LABEL_5:
  }
}

- (void)deleteContents:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 count];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = [(CKSharedContentsViewController *)self attachmentItems];
    id v8 = CKFrameworkBundle();
    v33 = [v8 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];

    if (v6 == 1)
    {
      uint64_t v9 = CKFrameworkBundle();
      id v10 = [v9 localizedStringForKey:@"DELETE_ATTACHMENT" value:&stru_1EDE4CA38 table:@"ChatKit"];
    }
    else
    {
      id v11 = [NSNumber numberWithUnsignedInteger:v6];
      uint64_t v9 = CKLocalizedStringForNumber(v11);

      id v12 = NSString;
      id v13 = CKFrameworkBundle();
      double v14 = [v13 localizedStringForKey:@"DELETE_ATTACHMENTS" value:&stru_1EDE4CA38 table:@"ChatKit"];
      uint64_t v15 = objc_msgSend(v12, "stringWithFormat:", v14, v9);

      int v16 = [MEMORY[0x1E4F42738] sharedApplication];
      uint64_t v17 = [v16 userInterfaceLayoutDirection];

      if (v17 == 1) {
        CGFloat v18 = @"\u200F";
      }
      else {
        CGFloat v18 = @"\u200E";
      }
      id v10 = [(__CFString *)v18 stringByAppendingString:v15];
    }
    CGFloat v19 = [(CKSharedContentsViewController *)self collectionView];
    CGFloat v20 = [MEMORY[0x1E4F42728] alertControllerWithTitle:0 message:0 preferredStyle:0];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __49__CKSharedContentsViewController_deleteContents___block_invoke;
    v34[3] = &unk_1E5621308;
    v34[4] = self;
    id v21 = v4;
    id v35 = v21;
    id v22 = v19;
    id v36 = v22;
    double v23 = +[CKAlertAction actionWithTitle:v10 style:2 handler:v34];
    [v20 addAction:v23];

    double v24 = +[CKAlertAction actionWithTitle:v33 style:1 handler:0];
    [v20 addAction:v24];

    double v25 = [(CKSharedContentsViewController *)self deleteButton];
    double v26 = [v20 popoverPresentationController];
    if ([v25 isEnabled])
    {
      [v26 setBarButtonItem:v25];
    }
    else
    {
      long long v27 = [v21 lastObject];
      uint64_t v28 = [v7 indexOfObject:v27];

      if (v28 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v29 = [MEMORY[0x1E4F28D58] indexPathForRow:v28 inSection:0];
        uint64_t v30 = [v22 cellForItemAtIndexPath:v29];
        [v30 contentView];
        CGRect v31 = v32 = v7;
        [v26 setSourceView:v31];
        [v31 bounds];
        objc_msgSend(v26, "setSourceRect:");

        uint64_t v7 = v32;
      }
    }
    [v20 setPreferredStyle:0];
    [(CKSharedContentsViewController *)self presentViewController:v20 animated:1 completion:0];
  }
}

uint64_t __49__CKSharedContentsViewController_deleteContents___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  [v2 sharedAssetsController:*(void *)(a1 + 32) didDeleteAttachmentItems:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) collectionviewLayout];
  [v3 invalidateLayout];

  [*(id *)(a1 + 48) reloadData];
  id v4 = [*(id *)(a1 + 32) delegate];
  [v4 sharedAssetsControllerContentSizeDidChange:*(void *)(a1 + 32)];

  uint64_t v5 = *(void **)(a1 + 32);

  return [v5 setSelectingAttachments:0];
}

- (void)cancelSelectingContents:(id)a3
{
}

- (void)deleteSelectedContents:(id)a3
{
  id v4 = [(CKSharedContentsViewController *)self attachmentItems];
  uint64_t v5 = [(CKSharedContentsViewController *)self selectedAttachmentIndexes];
  id v6 = [v4 objectsAtIndexes:v5];

  [(CKSharedContentsViewController *)self deleteContents:v6];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v4 = [(CKSharedContentsViewController *)self attachmentItems];
  int64_t v5 = [v4 count];

  return v5;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (id)_collectionView:(id)a3 dragItemsForItemAtIndexPath:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [(CKSharedContentsViewController *)self attachmentItems];
  uint64_t v7 = [v5 item];

  id v8 = [v6 objectAtIndex:v7];

  uint64_t v9 = [v8 dragItem];
  v12[0] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];

  return v10;
}

- (BOOL)collectionView:(id)a3 shouldShowMenuForItemAtIndexPath:(id)a4
{
  return ![(CKSharedContentsViewController *)self isSelectingAttachments];
}

- (BOOL)collectionView:(id)a3 canPerformAction:(SEL)a4 forItemAtIndexPath:(id)a5 withSender:(id)a6
{
  return sel_saveAttachment_ == a4 || sel_more_ == a4 || sel_delete_ == a4 || sel_copy_ == a4;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CKSharedContentsViewController *)self attachmentItems];
  uint64_t v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v7, "item"));

  CFStringRef v10 = (const __CFString *)[v9 UTIType];
  id v11 = +[CKLocationAttachmentItem UTITypes];
  int v12 = UTTypeConformsTo(v10, (CFStringRef)[v11 firstObject]);

  int v13 = UTTypeConformsTo(v10, (CFStringRef)*MEMORY[0x1E4F22580]);
  int v14 = UTTypeConformsTo(v10, (CFStringRef)*MEMORY[0x1E4F22538]);
  uint64_t v15 = +[CKQuickLookThumbnailAttachmentItem UTITypes];
  int v16 = UTTypeConformsTo(v10, (CFStringRef)[v15 firstObject]);

  if (v12)
  {
    uint64_t v17 = CKSharedLocationCollectionViewCell;
LABEL_3:
    CGFloat v18 = [(__objc2_class *)v17 reuseIdentifier];
    CGFloat v19 = [v6 dequeueReusableCellWithReuseIdentifier:v18 forIndexPath:v7];

LABEL_4:
    [v19 configureWithAttachmentItem:v9];
    goto LABEL_13;
  }
  if (!v13)
  {
    if (v14)
    {
      uint64_t v28 = CKSharedAudioCollectionViewCell;
    }
    else
    {
      if (!v16)
      {
        uint64_t v17 = CKSharedOtherTypesCollectionViewCell;
        goto LABEL_3;
      }
      uint64_t v28 = CKSharedQuickLookThumbnailCollectionViewCell;
    }
    v32 = [(__objc2_class *)v28 reuseIdentifier];
    CGFloat v19 = [v6 dequeueReusableCellWithReuseIdentifier:v32 forIndexPath:v7];

    [v19 setDelegate:self];
    goto LABEL_4;
  }
  CGFloat v20 = +[CKSharedContactsCollectionViewCell reuseIdentifier];
  CGFloat v19 = [v6 dequeueReusableCellWithReuseIdentifier:v20 forIndexPath:v7];

  id v21 = [v9 fileURL];
  id v36 = 0;
  id v22 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v21 options:8 error:&v36];
  id v23 = v36;
  id v24 = v23;
  if (v23 || !v22)
  {
    v33 = v21;
    id v34 = v23;
    _IMWarn();
  }
  else
  {
    id v35 = 0;
    double v25 = [MEMORY[0x1E4F1B998] contactsWithData:v22 error:&v35];
    id v24 = v35;
    double v26 = [v25 firstObject];
    [v19 configureWithContact:v26];

    long long v27 = [v19 avatarView];
    [v27 setDelegate:self];
  }
LABEL_13:
  v29 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v7, "row", v33, v34));
  [v19 setAccessibilityIdentifier:v29];

  [v19 setDelegate:self];
  uint64_t v30 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v7, "row"));
  [v19 setAccessibilityIdentifier:v30];

  objc_msgSend(v19, "setEditing:", -[CKSharedContentsViewController isSelectingAttachments](self, "isSelectingAttachments"));

  return v19;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (CKSharedAssetsControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKSharedAssetsControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UICollectionViewFlowLayout)collectionviewLayout
{
  return self->_collectionviewLayout;
}

- (void)setCollectionviewLayout:(id)a3
{
}

- (void)setQlPreviewController:(id)a3
{
}

- (UIView)topmostMarkerView
{
  return self->_topmostMarkerView;
}

- (void)setTopmostMarkerView:(id)a3
{
}

- (NSArray)attachmentItems
{
  return self->_attachmentItems;
}

- (BOOL)isSelectingAttachments
{
  return self->_selectingAttachments;
}

- (UIBarButtonItem)saveButton
{
  return self->_saveButton;
}

- (void)setSaveButton:(id)a3
{
}

- (UIBarButtonItem)deleteButton
{
  return self->_deleteButton;
}

- (void)setDeleteButton:(id)a3
{
}

- (NSArray)parentRightBarButtonItemsToRestore
{
  return self->_parentRightBarButtonItemsToRestore;
}

- (void)setParentRightBarButtonItemsToRestore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentRightBarButtonItemsToRestore, 0);
  objc_storeStrong((id *)&self->_deleteButton, 0);
  objc_storeStrong((id *)&self->_saveButton, 0);
  objc_storeStrong((id *)&self->_attachmentItems, 0);
  objc_storeStrong((id *)&self->_topmostMarkerView, 0);
  objc_storeStrong((id *)&self->_qlPreviewController, 0);
  objc_storeStrong((id *)&self->_collectionviewLayout, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end