@interface ICDocCamExtractedDocumentViewController
+ (CGRect)targetRectForOrientation:(int64_t)a3 window:(id)a4;
- (BOOL)_canShowWhileLocked;
- (BOOL)accessibilityPerformEscape;
- (BOOL)accessibilityScrollLeftPage;
- (BOOL)accessibilityScrollRightPage;
- (BOOL)adjustPageViewControllerForMarkup;
- (BOOL)barsShouldBeHidden;
- (BOOL)cameraDisabled;
- (BOOL)cameraRestricted;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4;
- (BOOL)currentImageHasMarkup;
- (BOOL)filterViewControllerApplyToAll:(signed __int16)a3;
- (BOOL)filterViewControllerCanApplyToAll:(signed __int16)a3;
- (BOOL)filterViewControllerDidSelectFilter:(signed __int16)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)imageIsPortrait:(id)a3;
- (BOOL)isAnimatingPageViewController;
- (BOOL)isPageViewControllerScrolled;
- (BOOL)isScrollingBetweenPages;
- (BOOL)isShowingBarsForZoomablePageContentViewController:(id)a3;
- (BOOL)layoutHasHappened;
- (BOOL)prefersStatusBarHidden;
- (BOOL)rotationUnderWay;
- (BOOL)shouldDisableActions;
- (BOOL)shouldDisableSharrow;
- (BOOL)statusBarWasHiddenWhenDoneTapped;
- (BOOL)statusBarWasHiddenWhenRetakeTapped;
- (BOOL)thumbnailContainerViewIsVisible;
- (BOOL)thumbnailContainerViewIsVisible:(id)a3;
- (BOOL)thumbnailContainerViewSupportsReordering:(id)a3;
- (CGRect)imageRectWithZoomAndPanForIndexPath:(id)a3;
- (CGRect)menuControllerTargetRect;
- (CGRect)targetViewRect;
- (CGRect)zoomTargetForIndexPath:(id)a3;
- (CGSize)collectionView:(id)a3 imageSizeAtIndex:(int64_t)a4;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (CGSize)frameSizeForImageSize:(CGSize)a3;
- (CGSize)imageSizeForDocumentAtIndex:(int64_t)a3;
- (CGSize)previousViewSize;
- (CIContext)sharedCoreImageContext;
- (DCScanDataDelegate)scanCollectionDataDelegate;
- (DCScanDataDelegate)selectedScanDataDelegate;
- (ICDocCamDocumentInfoCollection)documentInfoCollection;
- (ICDocCamExtractedDocumentControllerDelegate)delegate;
- (ICDocCamExtractedDocumentViewController)initWithDelegate:(id)a3 documentInfoCollection:(id)a4 imageCache:(id)a5 currentIndex:(int64_t)a6 mode:(int)a7;
- (ICDocCamExtractedThumbnailContainerView)thumbnailContainerView;
- (ICDocCamFilterViewController)filterViewController;
- (ICDocCamImageCache)imageCache;
- (ICDocCamReorderingThumbnailCollectionViewLayout)thumbnailCollectionViewLayout;
- (NSIndexPath)movingIndexPath;
- (NSLayoutConstraint)pageViewBottomConstraint;
- (NSLayoutConstraint)pageViewLeadingConstraint;
- (NSLayoutConstraint)pageViewTopConstraint;
- (NSLayoutConstraint)pageViewTrailingConstraint;
- (NSLayoutConstraint)titleViewWrapperHeightConstraint;
- (NSLayoutConstraint)titleViewWrapperWidthConstraint;
- (NSMutableArray)documentsToUpdateWhenScrollingStops;
- (UIAccessibilityHUDItem)hudItemForAccessibilityLargerText;
- (UIAlertController)editTitleAlert;
- (UIBarButtonItem)actionButtonItem;
- (UIBarButtonItem)addButtonItem;
- (UIBarButtonItem)doneButtonItem;
- (UIBarButtonItem)filterButtonItem;
- (UIBarButtonItem)filterButtonItemForNavBar;
- (UIBarButtonItem)recropButtonItem;
- (UIBarButtonItem)recropButtonItemForNavBar;
- (UIBarButtonItem)retakeButtonItem;
- (UIBarButtonItem)rotateButtonItem;
- (UIBarButtonItem)rotateButtonItemForNavBar;
- (UIBarButtonItem)thumbnailContainerViewItem;
- (UIBarButtonItem)trashButtonItem;
- (UIBarButtonItem)trashButtonItemForNavBar;
- (UIButton)collectionTitleButton;
- (UICollectionView)thumbnailCollectionView;
- (UICollectionViewController)thumbnailCollectionViewController;
- (UIColor)darkenedCollectionViewTitleTintColor;
- (UIColor)defaultCollectionViewTitleTintColor;
- (UIImageView)currentImageView;
- (UILabel)pageIndexLabel;
- (UILongPressGestureRecognizer)axHUDLongPressGestureRecognizer;
- (UILongPressGestureRecognizer)imageLongPressGestureRecognizer;
- (UILongPressGestureRecognizer)thumbnailLongPressGestureRecognizer;
- (UIPageViewController)pageViewController;
- (UIScrollView)pageViewControllerScrollView;
- (UIStackView)titleView;
- (UIToolbar)bottomToolbar;
- (UIView)pageViewControllerContainerView;
- (UIView)titleViewWrapper;
- (UIView)topToolbar;
- (double)movingXPosition;
- (double)movingYPosition;
- (double)normalizedPageViewControllerScrollPosition;
- (double)thumbnailToolbarHeight;
- (id)_accessibilitySpeakThisElementsAndStrings;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)croppedAndFilteredmageForDocumentAtIndex:(int64_t)a3;
- (id)croppedButNotFilteredImageForDocInfo:(id)a3;
- (id)croppedButNotFilteredImageForDocumentAtIndex:(int64_t)a3;
- (id)currentBackgroundColor;
- (id)currentDocument;
- (id)currentPageContentViewController;
- (id)imageForDocInfo:(id)a3 newFilter:(signed __int16)a4;
- (id)indexPathForCurrentDocument;
- (id)makeUIImageFromCIImage:(id)a3;
- (id)orientationString:(int64_t)a3;
- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4;
- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4;
- (id)truncatedString:(id)a3 clipLength:(unint64_t)a4;
- (id)undoManager;
- (id)viewControllerAtIndex:(unint64_t)a3;
- (int)mode;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)lastAXProposedIndexForReordering;
- (int64_t)orientationRotated90DegreesFromOrientation:(int64_t)a3;
- (int64_t)preferredStatusBarStyle;
- (int64_t)preferredStatusBarUpdateAnimation;
- (int64_t)presentationPageIndex;
- (unint64_t)documentCount;
- (unint64_t)thumbnailContainerViewNumberOfItems:(id)a3;
- (void)_pageViewControllerDidFinishTransitions:(id)a3;
- (void)addImageAction:(id)a3;
- (void)alertAndDiscardMarkup;
- (void)changePage:(int64_t)a3;
- (void)collectionNameTapped:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)copy:(id)a3;
- (void)dealloc;
- (void)defaultsChanged;
- (void)deleteButtonAction:(id)a3;
- (void)deleteCurrentPage;
- (void)deselectFilterButtons;
- (void)didDismissMarkupViewController;
- (void)didUpdateDocumentImage:(id)a3;
- (void)didUpdateDocumentInfoArrayNewCurrentDocument:(id)a3;
- (void)didUpdateDocumentTitle:(id)a3;
- (void)doneAction:(id)a3;
- (void)filterButtonAction:(id)a3;
- (void)handleAccessibilityLongPressOnCollectionTitle:(id)a3;
- (void)hideBarsForZoomablePageContentViewController:(id)a3;
- (void)hideFilterViewIfNecessary;
- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6;
- (void)pageViewController:(id)a3 willTransitionToViewControllers:(id)a4;
- (void)pencilDownInZoomablePageContentViewController:(id)a3;
- (void)prepareForDismissal;
- (void)recreateThumbnailContainerWithWidth:(double)a3 leadingTrailingMargin:(double)a4;
- (void)recropButtonPressed:(id)a3;
- (void)resetImageCentering;
- (void)respondToImageLongPressGesture:(id)a3;
- (void)respondToThumbnailLongPressGesture:(id)a3;
- (void)retakeAction:(id)a3;
- (void)rotateAction:(id)a3;
- (void)rotateCurrentImage;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)selectFilterButtons;
- (void)setActionButtonItem:(id)a3;
- (void)setAddButtonItem:(id)a3;
- (void)setAdjustPageViewControllerForMarkup:(BOOL)a3;
- (void)setAxHUDLongPressGestureRecognizer:(id)a3;
- (void)setBarsShouldBeHidden:(BOOL)a3;
- (void)setBottomToolbar:(id)a3;
- (void)setCameraRestricted:(BOOL)a3;
- (void)setCollectionTitleButton:(id)a3;
- (void)setCurrentThumbnailItem:(unint64_t)a3 animated:(BOOL)a4;
- (void)setDarkenedCollectionViewTitleTintColor:(id)a3;
- (void)setDefaultCollectionViewTitleTintColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDocumentInfoCollection:(id)a3;
- (void)setDocumentsToUpdateWhenScrollingStops:(id)a3;
- (void)setDoneButtonItem:(id)a3;
- (void)setEditTitleAlert:(id)a3;
- (void)setFilterButtonItem:(id)a3;
- (void)setFilterButtonItemForNavBar:(id)a3;
- (void)setFilterViewController:(id)a3;
- (void)setHudItemForAccessibilityLargerText:(id)a3;
- (void)setImage:(id)a3 forCell:(id)a4 useResizedImage:(BOOL)a5;
- (void)setImageCache:(id)a3;
- (void)setImageLongPressGestureRecognizer:(id)a3;
- (void)setIsAnimatingPageViewController:(BOOL)a3;
- (void)setIsScrollingBetweenPages:(BOOL)a3;
- (void)setLastAXProposedIndexForReordering:(int64_t)a3;
- (void)setLayoutHasHappened:(BOOL)a3;
- (void)setMenuControllerTargetRect:(CGRect)a3;
- (void)setMode:(int)a3;
- (void)setMovingIndexPath:(id)a3;
- (void)setMovingXPosition:(double)a3;
- (void)setMovingYPosition:(double)a3;
- (void)setPageIndexLabel:(id)a3;
- (void)setPageViewBottomConstraint:(id)a3;
- (void)setPageViewController:(id)a3;
- (void)setPageViewControllerContainerView:(id)a3;
- (void)setPageViewControllerScrollView:(id)a3;
- (void)setPageViewLeadingConstraint:(id)a3;
- (void)setPageViewTopConstraint:(id)a3;
- (void)setPageViewTrailingConstraint:(id)a3;
- (void)setPresentationPageIndex:(int64_t)a3;
- (void)setPreviousViewSize:(CGSize)a3;
- (void)setRecropButtonItem:(id)a3;
- (void)setRecropButtonItemForNavBar:(id)a3;
- (void)setRetakeButtonItem:(id)a3;
- (void)setRotateButtonItem:(id)a3;
- (void)setRotateButtonItemForNavBar:(id)a3;
- (void)setRotationUnderWay:(BOOL)a3;
- (void)setSharedCoreImageContext:(id)a3;
- (void)setStatusBarWasHiddenWhenDoneTapped:(BOOL)a3;
- (void)setStatusBarWasHiddenWhenRetakeTapped:(BOOL)a3;
- (void)setThumbnailCollectionView:(id)a3;
- (void)setThumbnailCollectionViewController:(id)a3;
- (void)setThumbnailContainerView:(id)a3;
- (void)setThumbnailContainerViewItem:(id)a3;
- (void)setThumbnailLongPressGestureRecognizer:(id)a3;
- (void)setTitleView:(id)a3;
- (void)setTitleViewWrapper:(id)a3;
- (void)setTitleViewWrapperHeightConstraint:(id)a3;
- (void)setTitleViewWrapperWidthConstraint:(id)a3;
- (void)setTopToolbar:(id)a3;
- (void)setTrashButtonItem:(id)a3;
- (void)setTrashButtonItemForNavBar:(id)a3;
- (void)setupAccessibilityInfo;
- (void)setupThumbnailViewController;
- (void)share:(id)a3;
- (void)shareAction:(id)a3;
- (void)showBarsForZoomablePageContentViewController:(id)a3;
- (void)showFilterViewIfNecessary;
- (void)showPrimaryControllerForNotes:(id)a3 animated:(BOOL)a4;
- (void)showViewControllerAtIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)speakAccessibilityAnnouncementForMovingItemFromIndexPath:(id)a3 toIndexPath:(id)a4;
- (void)speakAccessibilityAnnouncementForReorderIfNecessaryForProposedIndexPath:(id)a3;
- (void)startMarkupViewController;
- (void)switchBarVisibilityForZoomablePageContentViewController:(id)a3;
- (void)thumbnailContainerView:(id)a3 moveItemFromIndex:(int64_t)a4 toIndex:(int64_t)a5;
- (void)thumbnailContainerViewDecrementCurrentIndex:(id)a3;
- (void)thumbnailContainerViewIncrementCurrentIndex:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateDocumentImage:(id)a3;
- (void)updateFilterButtonItemAccessibilityInfo;
- (void)updateFilterViewLayoutIfNeeded;
- (void)updateForAccessibilityDarkerSystemColors;
- (void)updateImage:(id)a3 document:(id)a4 withFilterType:(signed __int16)a5;
- (void)updateImageViewAccessibilityForPageContentViewController:(id)a3;
- (void)updateLayout;
- (void)updatePageIndicatorForPageIndex:(int64_t)a3;
- (void)updatePageViewControllerConstraints:(BOOL)a3 animationBlock:(id)a4 completionBlock:(id)a5;
- (void)updateTitleView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation ICDocCamExtractedDocumentViewController

- (CGSize)imageSizeForDocumentAtIndex:(int64_t)a3
{
  v5 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
  v6 = [v5 docInfos];
  unint64_t v7 = [v6 count];

  double v8 = 0.0;
  double v9 = 0.0;
  if (v7 > a3)
  {
    v10 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
    v11 = [v10 docInfos];
    v12 = [v11 objectAtIndexedSubscript:a3];

    v13 = [v12 croppedAndFilteredImageUUID];

    if (v13)
    {
      v14 = [(ICDocCamExtractedDocumentViewController *)self imageCache];
      v15 = [v12 croppedAndFilteredImageUUID];
      [v14 getImageSize:v15];
      double v8 = v16;
      double v9 = v17;
    }
    else
    {
      v18 = [(ICDocCamExtractedDocumentViewController *)self delegate];
      char v19 = objc_opt_respondsToSelector();

      if ((v19 & 1) == 0)
      {
LABEL_7:

        goto LABEL_8;
      }
      v14 = [(ICDocCamExtractedDocumentViewController *)self delegate];
      v15 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
      v20 = [v15 docInfos];
      v21 = [v20 objectAtIndexedSubscript:a3];
      [v14 extractedDocumentControllerImageSizeForDocument:v21];
      double v8 = v22;
      double v9 = v23;
    }
    goto LABEL_7;
  }
LABEL_8:
  double v24 = v8;
  double v25 = v9;
  result.height = v25;
  result.width = v24;
  return result;
}

- (id)croppedAndFilteredmageForDocumentAtIndex:(int64_t)a3
{
  v5 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
  v6 = [v5 docInfos];
  unint64_t v7 = [v6 count];

  if (v7 <= a3)
  {
    v14 = 0;
    goto LABEL_10;
  }
  double v8 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
  double v9 = [v8 docInfos];
  v10 = [v9 objectAtIndexedSubscript:a3];

  v11 = [v10 croppedAndFilteredImageUUID];

  if (v11)
  {
    v12 = [(ICDocCamExtractedDocumentViewController *)self imageCache];
    v13 = [v10 croppedAndFilteredImageUUID];
    v14 = [v12 getImage:v13];
  }
  else
  {
    v15 = [(ICDocCamExtractedDocumentViewController *)self delegate];
    char v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) == 0)
    {
      v14 = 0;
      goto LABEL_9;
    }
    v12 = [(ICDocCamExtractedDocumentViewController *)self delegate];
    v14 = [v12 extractedDocumentControllerImageForDocument:v10];
  }

LABEL_9:
LABEL_10:

  return v14;
}

- (id)croppedButNotFilteredImageForDocumentAtIndex:(int64_t)a3
{
  v5 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
  v6 = [v5 docInfos];
  if ([v6 count] <= (unint64_t)a3)
  {
    v10 = 0;
  }
  else
  {
    unint64_t v7 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
    double v8 = [v7 docInfos];
    double v9 = [v8 objectAtIndexedSubscript:a3];
    v10 = [(ICDocCamExtractedDocumentViewController *)self croppedButNotFilteredImageForDocInfo:v9];
  }

  return v10;
}

- (id)croppedButNotFilteredImageForDocInfo:(id)a3
{
  id v4 = a3;
  v5 = [v4 croppedButNotFilteredImageUUID];

  if (!v5) {
    goto LABEL_3;
  }
  v6 = [(ICDocCamExtractedDocumentViewController *)self imageCache];
  unint64_t v7 = [v4 croppedButNotFilteredImageUUID];
  double v8 = [v6 getImage:v7];

  if (!v8)
  {
LABEL_3:
    double v9 = [(ICDocCamExtractedDocumentViewController *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) == 0
      || ([(ICDocCamExtractedDocumentViewController *)self delegate],
          v11 = objc_claimAutoreleasedReturnValue(),
          [v11 extractedDocumentControllerUncroppedImageForDocument:v4],
          double v8 = objc_claimAutoreleasedReturnValue(),
          v11,
          !v8))
    {
      double v8 = [v4 fullImageUUID];

      if (v8)
      {
        v12 = [(ICDocCamExtractedDocumentViewController *)self imageCache];
        v13 = [v4 fullImageUUID];
        double v8 = [v12 getImage:v13];
      }
    }
    uint64_t v14 = [v4 imageQuad];
    v15 = (void *)v14;
    if (v8 && v14)
    {
      uint64_t v16 = +[ICDocCamImageFilters perspectiveCorrectedImageFromImage:v8 normalizedImageQuad:v14];

      double v8 = (void *)v16;
    }
    if (v8)
    {
      double v17 = [(ICDocCamExtractedDocumentViewController *)self delegate];
      char v18 = objc_opt_respondsToSelector();

      if ((v18 & 1) == 0)
      {
        char v19 = [(ICDocCamExtractedDocumentViewController *)self imageCache];
        v20 = [v4 metaData];
        v21 = [v19 setImage:v8 metaData:v20];
        [v4 setCroppedButNotFilteredImageUUID:v21];
      }
    }
  }

  return v8;
}

- (CIContext)sharedCoreImageContext
{
  v2 = self;
  objc_sync_enter(v2);
  sharedCoreImageContext = v2->_sharedCoreImageContext;
  if (!sharedCoreImageContext)
  {
    uint64_t v4 = +[ICDocCamImageFilters sharedCoreImageContext];
    v5 = v2->_sharedCoreImageContext;
    v2->_sharedCoreImageContext = (CIContext *)v4;

    sharedCoreImageContext = v2->_sharedCoreImageContext;
  }
  v6 = sharedCoreImageContext;
  objc_sync_exit(v2);

  return v6;
}

+ (CGRect)targetRectForOrientation:(int64_t)a3 window:(id)a4
{
  id v5 = a4;
  +[ICDocCamPageContentViewController leadingTrailingOffset:a3];
  double v7 = v6;
  double v8 = [MEMORY[0x263F1C920] mainScreen];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;

  double v13 = 37.0;
  if ((DCDebugInterfaceEnabled() & 1) != 0
    || ([MEMORY[0x263F1C5C0] currentDevice],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        uint64_t v15 = [v14 userInterfaceIdiom],
        v14,
        v15 == 1))
  {
    *(double *)&uint64_t v16 = 44.0;
  }
  else
  {
    if ((unint64_t)(a3 - 1) < 2
      || (unint64_t)(a3 - 3) <= 1 && !objc_msgSend(v5, "dc_requiresCompactLandscapeIcons"))
    {
      double v17 = 44.0;
      double v13 = 113.0;
      goto LABEL_5;
    }
    *(double *)&uint64_t v16 = 32.0;
  }
  double v17 = *(double *)&v16;
LABEL_5:

  double v18 = v7;
  double v19 = v17;
  double v20 = v10 + v7 * -2.0;
  double v21 = v12 - (v17 + v13);
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (ICDocCamExtractedDocumentViewController)initWithDelegate:(id)a3 documentInfoCollection:(id)a4 imageCache:(id)a5 currentIndex:(int64_t)a6 mode:(int)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v18.receiver = self;
  v18.super_class = (Class)ICDocCamExtractedDocumentViewController;
  uint64_t v16 = [(ICDocCamExtractedDocumentViewController *)&v18 initWithNibName:@"ICDocCamExtractedDocumentViewController" bundle:v15];

  if (v16)
  {
    objc_storeWeak((id *)&v16->_delegate, v12);
    objc_storeStrong((id *)&v16->_documentInfoCollection, a4);
    v16->_presentationPageIndex = a6;
    objc_storeStrong((id *)&v16->_imageCache, a5);
    v16->_mode = a7;
  }
  [(ICDocCamExtractedDocumentViewController *)v16 updatePageIndicatorForPageIndex:[(ICDocCamExtractedDocumentViewController *)v16 presentationPageIndex]];

  return v16;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICDocCamExtractedDocumentViewController;
  [(ICDocCamExtractedDocumentViewController *)&v4 dealloc];
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (id)undoManager
{
  v3 = [(ICDocCamExtractedDocumentViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(ICDocCamExtractedDocumentViewController *)self delegate];
    double v6 = [v5 extractedDocumentControllerUndoManager];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ICDocCamExtractedDocumentViewController;
    double v6 = [(ICDocCamExtractedDocumentViewController *)&v8 undoManager];
  }

  return v6;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)defaultsChanged
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__ICDocCamExtractedDocumentViewController_defaultsChanged__block_invoke;
  block[3] = &unk_2642A9250;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __58__ICDocCamExtractedDocumentViewController_defaultsChanged__block_invoke(uint64_t a1)
{
  if ([MEMORY[0x263F1C6C0] isSourceTypeAvailable:1]
    && (v2 = (id *)(a1 + 32), ([*(id *)(a1 + 32) cameraDisabled] & 1) == 0))
  {
    uint64_t result = [*v2 cameraRestricted];
    if ((result & 1) == 0) {
      return result;
    }
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = DCDebugInterfaceEnabled() ^ 1;
    id v5 = *(void **)(a1 + 32);
    char v4 = (id *)(a1 + 32);
    uint64_t result = [v5 cameraRestricted];
    if (result == v3) {
      return result;
    }
    v2 = v4;
  }
  [*v2 setCameraRestricted:v3];
  id v7 = *v2;

  return [v7 updateLayout];
}

- (BOOL)cameraDisabled
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"com.apple.notes.cameraDisabled"];

  return v3;
}

- (void)viewDidLoad
{
  uint64_t v144 = *MEMORY[0x263EF8340];
  v134.receiver = self;
  v134.super_class = (Class)ICDocCamExtractedDocumentViewController;
  [(ICDocCamExtractedDocumentViewController *)&v134 viewDidLoad];
  v135[0] = 0;
  if (!UIAccessibilityLibraryCore_frameworkLibrary)
  {
    v135[1] = MEMORY[0x263EF8330];
    v135[2] = 3221225472;
    v135[3] = __UIAccessibilityLibraryCore_block_invoke;
    v135[4] = &__block_descriptor_40_e5_v8__0l;
    v135[5] = v135;
    long long v142 = xmmword_2642A95C8;
    uint64_t v143 = 0;
    UIAccessibilityLibraryCore_frameworkLibrary = _sl_dlopen();
    char v4 = (void *)v135[0];
    char v3 = (void *)UIAccessibilityLibraryCore_frameworkLibrary;
    if (UIAccessibilityLibraryCore_frameworkLibrary)
    {
      if (!v135[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v133 = v135[0];
      char v4 = (void *)abort_report_np();
    }
    free(v4);
    goto LABEL_5;
  }
  char v3 = (void *)UIAccessibilityLibraryCore_frameworkLibrary;
LABEL_5:
  dlsym(v3, "_UIAccessibilityStart");
  [(ICDocCamExtractedDocumentViewController *)self setModalPresentationCapturesStatusBarAppearance:1];
  id v5 = [(ICDocCamExtractedDocumentViewController *)self navigationController];
  double v6 = [v5 navigationBar];
  [v6 setBarStyle:0];

  id v7 = objc_msgSend(MEMORY[0x263F1C550], "dc_barColor");
  objc_super v8 = [(ICDocCamExtractedDocumentViewController *)self navigationController];
  double v9 = [v8 navigationBar];
  [v9 setBarTintColor:v7];

  double v10 = objc_msgSend(MEMORY[0x263F1C550], "dc_barColor");
  double v11 = [(ICDocCamExtractedDocumentViewController *)self topToolbar];
  [v11 setBackgroundColor:v10];

  id v12 = objc_msgSend(MEMORY[0x263F1C550], "dc_barColor");
  id v13 = [(ICDocCamExtractedDocumentViewController *)self bottomToolbar];
  [v13 setBarTintColor:v12];

  [(ICDocCamExtractedDocumentViewController *)self setNeedsStatusBarAppearanceUpdate];
  id v14 = objc_alloc_init(MEMORY[0x263F1C7E8]);
  uint64_t v15 = [MEMORY[0x263F1C550] systemBackgroundColor];
  [v14 setBackgroundColor:v15];

  uint64_t v16 = [(ICDocCamExtractedDocumentViewController *)self navigationItem];
  [v16 setScrollEdgeAppearance:v14];

  double v17 = [MEMORY[0x263F1C550] DCExtractedDocumentViewControllerBackgroundColor];
  objc_super v18 = [(ICDocCamExtractedDocumentViewController *)self view];
  [v18 setBackgroundColor:v17];

  double v19 = [(ICDocCamExtractedDocumentViewController *)self bottomToolbar];
  double v20 = [v19 bottomAnchor];
  double v21 = [(ICDocCamExtractedDocumentViewController *)self view];
  double v22 = [v21 safeAreaLayoutGuide];
  double v23 = [v22 bottomAnchor];
  double v24 = [v20 constraintEqualToAnchor:v23];
  [v24 setActive:1];

  double v25 = objc_msgSend(MEMORY[0x263F1C6B0], "dc_largeSystemImageNamed:", @"plus.circle");
  v26 = [(ICDocCamExtractedDocumentViewController *)self addButtonItem];
  [v26 setImage:v25];

  v27 = [MEMORY[0x263F1C6B0] systemImageNamed:@"plus.circle"];
  v28 = [(ICDocCamExtractedDocumentViewController *)self addButtonItem];
  [v28 setLandscapeImagePhone:v27];

  v29 = objc_msgSend(MEMORY[0x263F1C6B0], "dc_largeSystemImageNamed:", @"crop");
  v30 = [(ICDocCamExtractedDocumentViewController *)self recropButtonItem];
  [v30 setImage:v29];

  v31 = [MEMORY[0x263F1C6B0] systemImageNamed:@"crop"];
  v32 = [(ICDocCamExtractedDocumentViewController *)self recropButtonItem];
  [v32 setLandscapeImagePhone:v31];

  v33 = objc_msgSend(MEMORY[0x263F1C6B0], "dc_largeSystemImageNamed:", @"crop");
  v34 = [(ICDocCamExtractedDocumentViewController *)self recropButtonItemForNavBar];
  [v34 setImage:v33];

  v35 = [MEMORY[0x263F1C6B0] systemImageNamed:@"crop"];
  v36 = [(ICDocCamExtractedDocumentViewController *)self recropButtonItemForNavBar];
  [v36 setLandscapeImagePhone:v35];

  v37 = objc_msgSend(MEMORY[0x263F1C6B0], "dc_largeSystemImageNamed:", @"rotate.left");
  v38 = [(ICDocCamExtractedDocumentViewController *)self rotateButtonItem];
  [v38 setImage:v37];

  v39 = [MEMORY[0x263F1C6B0] systemImageNamed:@"rotate.left"];
  v40 = [(ICDocCamExtractedDocumentViewController *)self rotateButtonItem];
  [v40 setLandscapeImagePhone:v39];

  v41 = objc_msgSend(MEMORY[0x263F1C6B0], "dc_largeSystemImageNamed:", @"rotate.left");
  v42 = [(ICDocCamExtractedDocumentViewController *)self rotateButtonItemForNavBar];
  [v42 setImage:v41];

  v43 = [MEMORY[0x263F1C6B0] systemImageNamed:@"rotate.left"];
  v44 = [(ICDocCamExtractedDocumentViewController *)self rotateButtonItemForNavBar];
  [v44 setLandscapeImagePhone:v43];

  v45 = objc_msgSend(MEMORY[0x263F1C6B0], "dc_largeSystemImageNamed:", @"trash");
  v46 = [(ICDocCamExtractedDocumentViewController *)self trashButtonItem];
  [v46 setImage:v45];

  v47 = [MEMORY[0x263F1C6B0] systemImageNamed:@"trash"];
  v48 = [(ICDocCamExtractedDocumentViewController *)self trashButtonItem];
  [v48 setLandscapeImagePhone:v47];

  v49 = objc_msgSend(MEMORY[0x263F1C6B0], "dc_largeSystemImageNamed:", @"trash");
  v50 = [(ICDocCamExtractedDocumentViewController *)self trashButtonItemForNavBar];
  [v50 setImage:v49];

  v51 = [MEMORY[0x263F1C6B0] systemImageNamed:@"trash"];
  v52 = [(ICDocCamExtractedDocumentViewController *)self trashButtonItemForNavBar];
  [v52 setLandscapeImagePhone:v51];

  v53 = objc_msgSend(MEMORY[0x263F1C6B0], "dc_largeSystemImageNamed:", @"square.and.arrow.up");
  v54 = [(ICDocCamExtractedDocumentViewController *)self actionButtonItem];
  [v54 setImage:v53];

  v55 = [MEMORY[0x263F1C6B0] systemImageNamed:@"square.and.arrow.up"];
  v56 = [(ICDocCamExtractedDocumentViewController *)self actionButtonItem];
  [v56 setLandscapeImagePhone:v55];

  v57 = objc_msgSend(MEMORY[0x263F1C6B0], "dc_largeSystemImageNamed:", @"camera.filters");
  v58 = [(ICDocCamExtractedDocumentViewController *)self filterButtonItem];
  [v58 setImage:v57];

  v59 = [MEMORY[0x263F1C6B0] systemImageNamed:@"camera.filters"];
  v60 = [(ICDocCamExtractedDocumentViewController *)self filterButtonItem];
  [v60 setLandscapeImagePhone:v59];

  v61 = objc_msgSend(MEMORY[0x263F1C6B0], "dc_largeSystemImageNamed:", @"camera.filters");
  v62 = [(ICDocCamExtractedDocumentViewController *)self filterButtonItemForNavBar];
  [v62 setImage:v61];

  v63 = [MEMORY[0x263F1C6B0] systemImageNamed:@"camera.filters"];
  v64 = [(ICDocCamExtractedDocumentViewController *)self filterButtonItemForNavBar];
  [v64 setLandscapeImagePhone:v63];

  v65 = [(ICDocCamExtractedDocumentViewController *)self filterButtonItem];
  objc_msgSend(v65, "_setAdditionalSelectionInsets:", 5.0, 3.0, 5.0, 3.0);

  v66 = [(ICDocCamExtractedDocumentViewController *)self filterButtonItemForNavBar];
  objc_msgSend(v66, "_setAdditionalSelectionInsets:", 5.0, 3.0, 5.0, 3.0);

  v67 = [MEMORY[0x263F08A00] defaultCenter];
  [v67 addObserver:self selector:sel_defaultsChanged name:*MEMORY[0x263F08660] object:0];

  BOOL v68 = (DCDebugInterfaceEnabled() & 1) == 0
     && (![MEMORY[0x263F1C6C0] isSourceTypeAvailable:1]
      || [(ICDocCamExtractedDocumentViewController *)self cameraDisabled]);
  -[ICDocCamExtractedDocumentViewController setCameraRestricted:](self, "setCameraRestricted:", v68, v133);
  id v69 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(ICDocCamExtractedDocumentViewController *)self setDocumentsToUpdateWhenScrollingStops:v69];

  -[ICDocCamExtractedDocumentViewController setPreviousViewSize:](self, "setPreviousViewSize:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  [(ICDocCamExtractedDocumentViewController *)self setEdgesForExtendedLayout:15];
  [(ICDocCamExtractedDocumentViewController *)self setExtendedLayoutIncludesOpaqueBars:1];
  id v70 = objc_alloc(MEMORY[0x263F1C830]);
  uint64_t v140 = *MEMORY[0x263F1D4F0];
  v141 = &unk_26C7ED570;
  v71 = [NSDictionary dictionaryWithObjects:&v141 forKeys:&v140 count:1];
  v72 = (void *)[v70 initWithTransitionStyle:1 navigationOrientation:0 options:v71];
  [(ICDocCamExtractedDocumentViewController *)self setPageViewController:v72];

  v73 = [(ICDocCamExtractedDocumentViewController *)self pageViewController];
  [v73 setDataSource:self];

  v74 = [(ICDocCamExtractedDocumentViewController *)self pageViewController];
  [v74 setDelegate:self];

  v75 = [(ICDocCamExtractedDocumentViewController *)self pageViewController];
  [(ICDocCamExtractedDocumentViewController *)self addChildViewController:v75];

  v76 = [(ICDocCamExtractedDocumentViewController *)self pageViewControllerContainerView];
  v77 = [(ICDocCamExtractedDocumentViewController *)self pageViewController];
  v78 = [v77 view];
  [v76 addSubview:v78];

  v79 = [(ICDocCamExtractedDocumentViewController *)self pageViewController];
  [v79 didMoveToParentViewController:self];

  v80 = [(ICDocCamExtractedDocumentViewController *)self currentBackgroundColor];
  v81 = [(ICDocCamExtractedDocumentViewController *)self pageViewControllerContainerView];
  [v81 setBackgroundColor:v80];

  v82 = (void *)MEMORY[0x263F08938];
  v138 = @"childView";
  v83 = [(ICDocCamExtractedDocumentViewController *)self pageViewController];
  v84 = [v83 view];
  v139 = v84;
  v85 = [NSDictionary dictionaryWithObjects:&v139 forKeys:&v138 count:1];
  v86 = [v82 constraintsWithVisualFormat:@"H:|[childView]|" options:0 metrics:0 views:v85];

  v87 = (void *)MEMORY[0x263F08938];
  v136 = @"childView";
  v88 = [(ICDocCamExtractedDocumentViewController *)self pageViewController];
  v89 = [v88 view];
  v137 = v89;
  v90 = [NSDictionary dictionaryWithObjects:&v137 forKeys:&v136 count:1];
  v91 = [v87 constraintsWithVisualFormat:@"V:|[childView]|" options:0 metrics:0 views:v90];

  [MEMORY[0x263F08938] activateConstraints:v86];
  [MEMORY[0x263F08938] activateConstraints:v91];
  v92 = [(ICDocCamExtractedDocumentViewController *)self pageViewController];
  v93 = [v92 view];
  [v93 setTranslatesAutoresizingMaskIntoConstraints:0];

  [(ICDocCamExtractedDocumentViewController *)self showViewControllerAtIndex:[(ICDocCamExtractedDocumentViewController *)self presentationPageIndex] animated:0];
  v94 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];
  [v94 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"ICDocCamThumbnailCellKind"];

  v95 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];
  [v95 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"ICDocCamExtractedDocumentThumbnailCell"];

  double v96 = *MEMORY[0x263F1D5C8];
  v97 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];
  [v97 setDecelerationRate:v96];

  v98 = [(ICDocCamExtractedDocumentViewController *)self collectionTitleButton];
  [v98 setTranslatesAutoresizingMaskIntoConstraints:1];

  v99 = [(ICDocCamExtractedDocumentViewController *)self collectionTitleButton];
  LODWORD(v100) = 1132068864;
  [v99 setContentCompressionResistancePriority:0 forAxis:v100];

  v101 = [(ICDocCamExtractedDocumentViewController *)self pageIndexLabel];
  [v101 setTranslatesAutoresizingMaskIntoConstraints:1];

  v102 = [(ICDocCamExtractedDocumentViewController *)self pageIndexLabel];
  [v102 setTextAlignment:1];

  v103 = [[ICDocCamReorderingThumbnailCollectionViewLayout alloc] initWithDelegate:self];
  v104 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];
  [v104 setCollectionViewLayout:v103];

  [(ICDocCamExtractedDocumentViewController *)self setCurrentThumbnailItem:[(ICDocCamExtractedDocumentViewController *)self presentationPageIndex] animated:0];
  v105 = [(ICDocCamExtractedDocumentViewController *)self thumbnailLongPressGestureRecognizer];

  if (!v105)
  {
    v106 = (void *)[objc_alloc(MEMORY[0x263F1C7A0]) initWithTarget:self action:sel_respondToThumbnailLongPressGesture_];
    v107 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];
    [v107 addGestureRecognizer:v106];

    [(ICDocCamExtractedDocumentViewController *)self setThumbnailLongPressGestureRecognizer:v106];
  }
  v108 = [(ICDocCamExtractedDocumentViewController *)self imageLongPressGestureRecognizer];

  if (!v108)
  {
    v109 = (void *)[objc_alloc(MEMORY[0x263F1C7A0]) initWithTarget:self action:sel_respondToImageLongPressGesture_];
    v110 = [(ICDocCamExtractedDocumentViewController *)self view];
    [v110 addGestureRecognizer:v109];

    [(ICDocCamExtractedDocumentViewController *)self setImageLongPressGestureRecognizer:v109];
    v111 = [(ICDocCamExtractedDocumentViewController *)self imageLongPressGestureRecognizer];
    [v111 setDelegate:self];
  }
  v112 = [(ICDocCamExtractedDocumentViewController *)self axHUDLongPressGestureRecognizer];

  if (!v112)
  {
    v113 = (void *)[objc_alloc(MEMORY[0x263F1C7A0]) initWithTarget:self action:sel_handleAccessibilityLongPressOnCollectionTitle_];
    [(ICDocCamExtractedDocumentViewController *)self setAxHUDLongPressGestureRecognizer:v113];

    v114 = [(ICDocCamExtractedDocumentViewController *)self axHUDLongPressGestureRecognizer];
    [v114 setDelegate:self];

    BOOL v115 = DCAccessibilityAccessibilityLargerTextSizesEnabled();
    v116 = [(ICDocCamExtractedDocumentViewController *)self axHUDLongPressGestureRecognizer];
    [v116 setEnabled:v115];

    v117 = [(ICDocCamExtractedDocumentViewController *)self collectionTitleButton];
    v118 = [(ICDocCamExtractedDocumentViewController *)self axHUDLongPressGestureRecognizer];
    [v117 addGestureRecognizer:v118];
  }
  v119 = [(ICDocCamExtractedDocumentViewController *)self axHUDLongPressGestureRecognizer];
  v120 = [(ICDocCamExtractedDocumentViewController *)self imageLongPressGestureRecognizer];
  [v119 requireGestureRecognizerToFail:v120];

  v121 = [(ICDocCamExtractedDocumentViewController *)self imageLongPressGestureRecognizer];
  v122 = [(ICDocCamExtractedDocumentViewController *)self thumbnailLongPressGestureRecognizer];
  [v121 requireGestureRecognizerToFail:v122];

  v123 = [(ICDocCamExtractedDocumentViewController *)self pageViewController];
  v124 = [v123 view];
  v125 = [v124 subviews];
  v126 = objc_msgSend(v125, "dc_objectPassingTest:", &__block_literal_global);
  [(ICDocCamExtractedDocumentViewController *)self setPageViewControllerScrollView:v126];

  v127 = [(ICDocCamExtractedDocumentViewController *)self pageViewControllerScrollView];
  [v127 setContentInsetAdjustmentBehavior:2];

  v128 = [(ICDocCamExtractedDocumentViewController *)self pageViewControllerScrollView];
  [v128 setDelegate:self];

  [(ICDocCamExtractedDocumentViewController *)self setupAccessibilityInfo];
  v129 = [MEMORY[0x263F08A00] defaultCenter];
  [v129 addObserver:self selector:sel_updateForAccessibilityDarkerSystemColors name:*MEMORY[0x263F1CDF0] object:0];

  v130 = [MEMORY[0x263F08A00] defaultCenter];
  [v130 addObserver:self selector:sel_contentSizeCategoryDidChange_ name:*MEMORY[0x263F1D158] object:0];

  v131 = [(ICDocCamExtractedDocumentViewController *)self collectionTitleButton];
  id v132 = objc_alloc_init(MEMORY[0x263F1C878]);
  [v131 addInteraction:v132];
}

uint64_t __54__ICDocCamExtractedDocumentViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v75[2] = *MEMORY[0x263EF8340];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__ICDocCamExtractedDocumentViewController_viewWillAppear___block_invoke;
  block[3] = &unk_2642A9250;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
  id v5 = [(ICDocCamExtractedDocumentViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(ICDocCamExtractedDocumentViewController *)self collectionTitleButton];
    objc_super v8 = [(ICDocCamExtractedDocumentViewController *)self delegate];
    double v9 = [v8 extractedDocumentControllerTitle];
    [v7 setTitle:v9 forState:0];
  }
  double v10 = [(ICDocCamExtractedDocumentViewController *)self navigationController];
  [v10 setNavigationBarHidden:0 animated:1];

  double v11 = [(ICDocCamExtractedDocumentViewController *)self navigationController];
  [v11 setToolbarHidden:1];

  id v12 = [(ICDocCamExtractedDocumentViewController *)self navigationController];
  id v13 = [v12 navigationBar];
  [v13 setOpaque:1];

  id v14 = [(ICDocCamExtractedDocumentViewController *)self navigationController];
  uint64_t v15 = [v14 navigationBar];
  [v15 setTranslucent:0];

  uint64_t v16 = [(ICDocCamExtractedDocumentViewController *)self bottomToolbar];
  [v16 setOpaque:1];

  double v17 = [(ICDocCamExtractedDocumentViewController *)self bottomToolbar];
  [v17 setTranslucent:0];

  objc_super v18 = [(ICDocCamExtractedDocumentViewController *)self topToolbar];
  [v18 setOpaque:1];

  double v19 = [(ICDocCamExtractedDocumentViewController *)self titleViewWrapper];

  if (!v19)
  {
    id v20 = objc_alloc_init(MEMORY[0x263F1CB60]);
    [(ICDocCamExtractedDocumentViewController *)self setTitleViewWrapper:v20];

    double v21 = [MEMORY[0x263F1C550] clearColor];
    double v22 = [(ICDocCamExtractedDocumentViewController *)self titleViewWrapper];
    [v22 setBackgroundColor:v21];

    double v23 = [(ICDocCamExtractedDocumentViewController *)self titleViewWrapper];
    [v23 setTranslatesAutoresizingMaskIntoConstraints:0];

    double v24 = [(ICDocCamExtractedDocumentViewController *)self titleViewWrapper];
    [v24 setUserInteractionEnabled:1];

    double v25 = [(ICDocCamExtractedDocumentViewController *)self titleViewWrapper];
    LODWORD(v26) = 1132068864;
    [v25 setContentCompressionResistancePriority:0 forAxis:v26];

    v27 = (void *)MEMORY[0x263F08938];
    v28 = [(ICDocCamExtractedDocumentViewController *)self titleViewWrapper];
    v29 = [v27 constraintWithItem:v28 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:100.0];
    [(ICDocCamExtractedDocumentViewController *)self setTitleViewWrapperWidthConstraint:v29];

    v30 = [(ICDocCamExtractedDocumentViewController *)self titleViewWrapperWidthConstraint];
    LODWORD(v31) = 1140457472;
    [v30 setPriority:v31];

    v32 = (void *)MEMORY[0x263F08938];
    v33 = [(ICDocCamExtractedDocumentViewController *)self titleViewWrapper];
    v34 = [v32 constraintWithItem:v33 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:44.0];
    [(ICDocCamExtractedDocumentViewController *)self setTitleViewWrapperHeightConstraint:v34];

    v35 = (void *)MEMORY[0x263F08938];
    v36 = [(ICDocCamExtractedDocumentViewController *)self titleViewWrapperWidthConstraint];
    v75[0] = v36;
    v37 = [(ICDocCamExtractedDocumentViewController *)self titleViewWrapperHeightConstraint];
    v75[1] = v37;
    v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v75 count:2];
    [v35 activateConstraints:v38];

    id v39 = objc_alloc_init(MEMORY[0x263F1C9B8]);
    [(ICDocCamExtractedDocumentViewController *)self setTitleView:v39];

    v40 = [(ICDocCamExtractedDocumentViewController *)self titleView];
    LODWORD(v41) = 1132068864;
    [v40 setContentCompressionResistancePriority:0 forAxis:v41];

    v42 = [(ICDocCamExtractedDocumentViewController *)self titleView];
    [v42 setTranslatesAutoresizingMaskIntoConstraints:0];

    v43 = [(ICDocCamExtractedDocumentViewController *)self titleViewWrapper];
    v44 = [(ICDocCamExtractedDocumentViewController *)self titleView];
    [v43 addSubview:v44];

    v45 = [(ICDocCamExtractedDocumentViewController *)self titleView];
    v46 = [v45 leadingAnchor];
    v47 = [(ICDocCamExtractedDocumentViewController *)self titleViewWrapper];
    v48 = [v47 leadingAnchor];
    v49 = [v46 constraintEqualToAnchor:v48 constant:0.0];

    v50 = [(ICDocCamExtractedDocumentViewController *)self titleView];
    v51 = [v50 trailingAnchor];
    v52 = [(ICDocCamExtractedDocumentViewController *)self titleViewWrapper];
    v53 = [v52 trailingAnchor];
    v54 = [v51 constraintEqualToAnchor:v53 constant:0.0];

    v55 = [(ICDocCamExtractedDocumentViewController *)self titleView];
    v56 = [v55 bottomAnchor];
    v57 = [(ICDocCamExtractedDocumentViewController *)self titleViewWrapper];
    v58 = [v57 bottomAnchor];
    v59 = [v56 constraintEqualToAnchor:v58 constant:0.0];

    v60 = [(ICDocCamExtractedDocumentViewController *)self titleView];
    v61 = [v60 topAnchor];
    v62 = [(ICDocCamExtractedDocumentViewController *)self titleViewWrapper];
    v63 = [v62 topAnchor];
    v64 = [v61 constraintEqualToAnchor:v63 constant:0.0];

    v65 = (void *)MEMORY[0x263F08938];
    v74[0] = v49;
    v74[1] = v54;
    v74[2] = v59;
    v74[3] = v64;
    v66 = [MEMORY[0x263EFF8C0] arrayWithObjects:v74 count:4];
    [v65 activateConstraints:v66];

    v67 = [(ICDocCamExtractedDocumentViewController *)self titleViewWrapper];
    BOOL v68 = [(ICDocCamExtractedDocumentViewController *)self navigationItem];
    [v68 setTitleView:v67];
  }
  id v69 = [(ICDocCamExtractedDocumentViewController *)self currentPageContentViewController];
  [(ICDocCamExtractedDocumentViewController *)self showBarsForZoomablePageContentViewController:v69];

  id v70 = [(ICDocCamExtractedDocumentViewController *)self navigationController];
  v71 = [v70 navigationBar];
  [v71 setNeedsLayout];

  v72.receiver = self;
  v72.super_class = (Class)ICDocCamExtractedDocumentViewController;
  [(ICDocCamExtractedDocumentViewController *)&v72 viewWillAppear:v3];
}

void __58__ICDocCamExtractedDocumentViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationItem];
  BOOL v3 = [v2 navigationBar];
  id v7 = [v3 tintColor];

  [*(id *)(a1 + 32) setDefaultCollectionViewTitleTintColor:v7];
  char v4 = objc_msgSend(MEMORY[0x263F1C550], "dc_darkerAccessibilityColorForColor:", v7);
  [*(id *)(a1 + 32) setDarkenedCollectionViewTitleTintColor:v4];

  [*(id *)(a1 + 32) updateForAccessibilityDarkerSystemColors];
  id v5 = [*(id *)(a1 + 32) collectionTitleButton];
  [v5 setNeedsDisplay];

  char v6 = [*(id *)(a1 + 32) collectionTitleButton];
  [v6 recursivelyForceDisplayIfNeeded];
}

- (void)viewWillLayoutSubviews
{
  BOOL v3 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (!v4)
  {
    id v5 = [(ICDocCamExtractedDocumentViewController *)self bottomToolbar];
    [v5 invalidateIntrinsicContentSize];

    char v6 = [(ICDocCamExtractedDocumentViewController *)self bottomToolbar];
    [v6 sizeToFit];
  }
  v7.receiver = self;
  v7.super_class = (Class)ICDocCamExtractedDocumentViewController;
  [(ICDocCamExtractedDocumentViewController *)&v7 viewWillLayoutSubviews];
}

- (void)viewDidLayoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)ICDocCamExtractedDocumentViewController;
  [(ICDocCamExtractedDocumentViewController *)&v18 viewDidLayoutSubviews];
  BOOL v3 = [(ICDocCamExtractedDocumentViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  [(ICDocCamExtractedDocumentViewController *)self previousViewSize];
  if (v5 != v9 || v7 != v8)
  {
    -[ICDocCamExtractedDocumentViewController setPreviousViewSize:](self, "setPreviousViewSize:", v5, v7);
    [(ICDocCamExtractedDocumentViewController *)self updateLayout];
    [(ICDocCamExtractedDocumentViewController *)self updatePageIndicatorForPageIndex:[(ICDocCamExtractedDocumentViewController *)self presentationPageIndex]];
    double v11 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionViewLayout];
    [v11 invalidateLayout];

    id v12 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];
    [v12 layoutIfNeeded];
  }
  unint64_t v13 = [(ICDocCamExtractedDocumentViewController *)self presentationPageIndex];
  id v14 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
  uint64_t v15 = [v14 docInfos];
  unint64_t v16 = [v15 count];

  if (v13 < v16)
  {
    double v17 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex"), 0);
    -[ICDocCamExtractedDocumentViewController setCurrentThumbnailItem:animated:](self, "setCurrentThumbnailItem:animated:", [v17 item], -[ICDocCamExtractedDocumentViewController layoutHasHappened](self, "layoutHasHappened"));
  }
  if (![(ICDocCamExtractedDocumentViewController *)self isAnimatingPageViewController]) {
    [(ICDocCamExtractedDocumentViewController *)self updatePageViewControllerConstraints:0 animationBlock:0 completionBlock:0];
  }
  [(ICDocCamExtractedDocumentViewController *)self setLayoutHasHappened:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICDocCamExtractedDocumentViewController;
  [(ICDocCamExtractedDocumentViewController *)&v4 viewDidAppear:a3];
  [(ICDocCamExtractedDocumentViewController *)self becomeFirstResponder];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(ICDocCamExtractedDocumentViewController *)self setBarsShouldBeHidden:1];
  double v5 = +[DCImageAnalyzerManager sharedInstance];
  [v5 cleanup];

  v6.receiver = self;
  v6.super_class = (Class)ICDocCamExtractedDocumentViewController;
  [(ICDocCamExtractedDocumentViewController *)&v6 viewDidDisappear:v3];
}

- (BOOL)prefersStatusBarHidden
{
  if ([(ICDocCamExtractedDocumentViewController *)self barsShouldBeHidden]) {
    return 1;
  }
  objc_super v4 = [(ICDocCamExtractedDocumentViewController *)self view];
  double v5 = [v4 window];
  objc_super v6 = [v5 windowScene];
  uint64_t v7 = [v6 interfaceOrientation];

  double v8 = [MEMORY[0x263F1C5C0] currentDevice];
  if ([v8 userInterfaceIdiom]) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = (unint64_t)(v7 - 3) >= 2;
  }
  BOOL v3 = !v9;

  return v3;
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  return 1;
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  BOOL v4 = DCAccessibilityAccessibilityLargerTextSizesEnabled();
  id v5 = [(ICDocCamExtractedDocumentViewController *)self axHUDLongPressGestureRecognizer];
  [v5 setEnabled:v4];
}

- (void)prepareForDismissal
{
  uint64_t v2 = [(ICDocCamExtractedDocumentViewController *)self presentedViewController];
  if (v2)
  {
    BOOL v3 = (void *)v2;
    if (objc_opt_respondsToSelector()) {
      [v3 prepareForDismissal];
    }
  }

  MEMORY[0x270F9A790]();
}

- (void)traitCollectionDidChange:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)ICDocCamExtractedDocumentViewController;
  [(ICDocCamExtractedDocumentViewController *)&v11 traitCollectionDidChange:a3];
  BOOL v4 = objc_msgSend(MEMORY[0x263F1C550], "dc_barColor");
  id v5 = [(ICDocCamExtractedDocumentViewController *)self navigationController];
  objc_super v6 = [v5 navigationBar];
  [v6 setBarTintColor:v4];

  uint64_t v7 = objc_msgSend(MEMORY[0x263F1C550], "dc_barColor");
  double v8 = [(ICDocCamExtractedDocumentViewController *)self topToolbar];
  [v8 setBackgroundColor:v7];

  BOOL v9 = objc_msgSend(MEMORY[0x263F1C550], "dc_barColor");
  double v10 = [(ICDocCamExtractedDocumentViewController *)self bottomToolbar];
  [v10 setBarTintColor:v9];
}

- (void)updateLayout
{
  v139[1] = *MEMORY[0x263EF8340];
  uint64_t v112 = 0;
  uint64_t v113 = 0;
  [(UIViewController *)self dc_getEffectiveInterfaceOrientation:&v113 andEffectiveInterfaceIdiom:&v112];
  id v5 = [(ICDocCamExtractedDocumentViewController *)self filterButtonItem];
  v110 = [(ICDocCamExtractedDocumentViewController *)self rotateButtonItem];
  v111 = [(ICDocCamExtractedDocumentViewController *)self filterButtonItemForNavBar];
  objc_super v6 = [(ICDocCamExtractedDocumentViewController *)self rotateButtonItemForNavBar];
  uint64_t v7 = [(ICDocCamExtractedDocumentViewController *)self recropButtonItemForNavBar];
  if ([(ICDocCamExtractedDocumentViewController *)self mode])
  {
    int v8 = [(ICDocCamExtractedDocumentViewController *)self mode];
    BOOL v9 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:5 target:0 action:0];
    double v10 = [(ICDocCamExtractedDocumentViewController *)self view];
    [v10 bounds];
    double v12 = v11;

    unint64_t v13 = v113 - 1;
    if (v8 == 1)
    {
      v109 = v5;
      if (v112)
      {
        if (v13 < 2)
        {
          id v14 = [(ICDocCamExtractedDocumentViewController *)self doneButtonItem];
          v126 = v14;
          uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v126 count:1];
          unint64_t v16 = [(ICDocCamExtractedDocumentViewController *)self navigationItem];
          [v16 setLeftBarButtonItems:v15];

          if ([(ICDocCamExtractedDocumentViewController *)self shouldDisableSharrow])
          {
            double v17 = (void *)MEMORY[0x263EFFA68];
          }
          else
          {
            v75 = [(ICDocCamExtractedDocumentViewController *)self actionButtonItem];
            v125 = v75;
            double v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v125 count:1];
          }
          v124[0] = v6;
          v124[1] = v111;
          v124[2] = v7;
          v76 = [MEMORY[0x263EFF8C0] arrayWithObjects:v124 count:3];
          v77 = [v17 arrayByAddingObjectsFromArray:v76];
          v78 = [(ICDocCamExtractedDocumentViewController *)self navigationItem];
          [v78 setRightBarButtonItems:v77];

          v79 = [(ICDocCamExtractedDocumentViewController *)self topToolbar];
          [v79 setHidden:1];

          v80 = [(ICDocCamExtractedDocumentViewController *)self bottomToolbar];
          [v80 setHidden:0];

          v81 = [(ICDocCamExtractedDocumentViewController *)self bottomToolbar];
          [v81 _setHidesShadow:0];

          [(ICDocCamExtractedDocumentViewController *)self recreateThumbnailContainerWithWidth:v12 leadingTrailingMargin:60.0];
          if ([(ICDocCamExtractedDocumentViewController *)self cameraRestricted])
          {
            v122[0] = v9;
            BOOL v3 = [(ICDocCamExtractedDocumentViewController *)self thumbnailContainerViewItem];
            v122[1] = v3;
            v122[2] = v9;
            v73 = [(ICDocCamExtractedDocumentViewController *)self trashButtonItem];
            v122[3] = v73;
            v74 = [MEMORY[0x263EFF8C0] arrayWithObjects:v122 count:4];
            v82 = [(ICDocCamExtractedDocumentViewController *)self bottomToolbar];
            [v82 setItems:v74];
          }
          else
          {
            BOOL v3 = [(ICDocCamExtractedDocumentViewController *)self addButtonItem];
            v123[0] = v3;
            v123[1] = v9;
            v73 = [(ICDocCamExtractedDocumentViewController *)self thumbnailContainerViewItem];
            v123[2] = v73;
            v123[3] = v9;
            v74 = [(ICDocCamExtractedDocumentViewController *)self trashButtonItem];
            v123[4] = v74;
            v82 = [MEMORY[0x263EFF8C0] arrayWithObjects:v123 count:5];
            v83 = [(ICDocCamExtractedDocumentViewController *)self bottomToolbar];
            [v83 setItems:v82];
          }
LABEL_40:

LABEL_41:
          [(ICDocCamExtractedDocumentViewController *)self updateTitleView];

          id v5 = v109;
          goto LABEL_42;
        }
        *(double *)&uint64_t v58 = 60.0;
      }
      else
      {
        if (v13 < 2)
        {
          v53 = [(ICDocCamExtractedDocumentViewController *)self doneButtonItem];
          objc_super v134 = v53;
          v54 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v134 count:1];
          v55 = [(ICDocCamExtractedDocumentViewController *)self navigationItem];
          [v55 setLeftBarButtonItems:v54];

          BOOL v56 = [(ICDocCamExtractedDocumentViewController *)self shouldDisableSharrow];
          if (v56)
          {
            v57 = (void *)MEMORY[0x263EFFA68];
          }
          else
          {
            v55 = [(ICDocCamExtractedDocumentViewController *)self actionButtonItem];
            uint64_t v133 = v55;
            v57 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v133 count:1];
          }
          v92 = [(ICDocCamExtractedDocumentViewController *)self navigationItem];
          [v92 setRightBarButtonItems:v57];

          if (!v56)
          {
          }
          if ([(ICDocCamExtractedDocumentViewController *)self cameraRestricted])
          {
            v93 = [(ICDocCamExtractedDocumentViewController *)self recropButtonItem];
            v131[0] = v93;
            v131[1] = v9;
            v131[2] = v5;
            v131[3] = v9;
            v131[4] = v110;
            v131[5] = v9;
            v94 = [(ICDocCamExtractedDocumentViewController *)self trashButtonItem];
            v131[6] = v94;
            v95 = [MEMORY[0x263EFF8C0] arrayWithObjects:v131 count:7];
            double v96 = [(ICDocCamExtractedDocumentViewController *)self bottomToolbar];
            [v96 setItems:v95];
          }
          else
          {
            v93 = [(ICDocCamExtractedDocumentViewController *)self addButtonItem];
            v132[0] = v93;
            v132[1] = v9;
            v94 = [(ICDocCamExtractedDocumentViewController *)self recropButtonItem];
            v132[2] = v94;
            v132[3] = v9;
            v132[4] = v5;
            v132[5] = v9;
            v132[6] = v110;
            v132[7] = v9;
            v95 = [(ICDocCamExtractedDocumentViewController *)self trashButtonItem];
            v132[8] = v95;
            double v96 = [MEMORY[0x263EFF8C0] arrayWithObjects:v132 count:9];
            v97 = [(ICDocCamExtractedDocumentViewController *)self bottomToolbar];
            [v97 setItems:v96];
          }
          [(ICDocCamExtractedDocumentViewController *)self recreateThumbnailContainerWithWidth:v12 leadingTrailingMargin:0.0];
          v98 = [(ICDocCamExtractedDocumentViewController *)self topToolbar];
          [v98 setHidden:0];

          v99 = [(ICDocCamExtractedDocumentViewController *)self topToolbar];
          double v100 = [(ICDocCamExtractedDocumentViewController *)self thumbnailContainerView];
          [v99 addSubview:v100];

          v101 = (void *)MEMORY[0x263F08938];
          v129 = @"childView";
          v102 = [(ICDocCamExtractedDocumentViewController *)self thumbnailContainerView];
          v130 = v102;
          v103 = [NSDictionary dictionaryWithObjects:&v130 forKeys:&v129 count:1];
          double v17 = [v101 constraintsWithVisualFormat:@"H:|[childView]|" options:0 metrics:0 views:v103];

          v104 = (void *)MEMORY[0x263F08938];
          v127 = @"childView";
          v105 = [(ICDocCamExtractedDocumentViewController *)self thumbnailContainerView];
          v128 = v105;
          v106 = [NSDictionary dictionaryWithObjects:&v128 forKeys:&v127 count:1];
          BOOL v3 = [v104 constraintsWithVisualFormat:@"V:|[childView]|" options:0 metrics:0 views:v106];

          v107 = [(ICDocCamExtractedDocumentViewController *)self topToolbar];
          [v107 setTranslatesAutoresizingMaskIntoConstraints:0];

          [MEMORY[0x263F08938] activateConstraints:v17];
          [MEMORY[0x263F08938] activateConstraints:v3];
          v108 = [(ICDocCamExtractedDocumentViewController *)self bottomToolbar];
          [v108 setHidden:0];

          v73 = [(ICDocCamExtractedDocumentViewController *)self bottomToolbar];
          [v73 _setHidesShadow:1];
          goto LABEL_41;
        }
        *(double *)&uint64_t v58 = 56.0;
      }
      double v59 = *(double *)&v58;
      v60 = [(ICDocCamExtractedDocumentViewController *)self topToolbar];
      [v60 setHidden:1];

      v61 = [(ICDocCamExtractedDocumentViewController *)self bottomToolbar];
      [v61 setHidden:0];

      v62 = [(ICDocCamExtractedDocumentViewController *)self bottomToolbar];
      [v62 _setHidesShadow:0];

      [(ICDocCamExtractedDocumentViewController *)self recreateThumbnailContainerWithWidth:v12 leadingTrailingMargin:v59];
      if ([(ICDocCamExtractedDocumentViewController *)self cameraRestricted])
      {
        v120[0] = v9;
        v63 = [(ICDocCamExtractedDocumentViewController *)self thumbnailContainerViewItem];
        v120[1] = v63;
        v120[2] = v9;
        v64 = [(ICDocCamExtractedDocumentViewController *)self trashButtonItem];
        v120[3] = v64;
        v65 = [MEMORY[0x263EFF8C0] arrayWithObjects:v120 count:4];
        v66 = [(ICDocCamExtractedDocumentViewController *)self bottomToolbar];
        [v66 setItems:v65];
      }
      else
      {
        v63 = [(ICDocCamExtractedDocumentViewController *)self addButtonItem];
        v121[0] = v63;
        v121[1] = v9;
        v64 = [(ICDocCamExtractedDocumentViewController *)self thumbnailContainerViewItem];
        v121[2] = v64;
        v121[3] = v9;
        v65 = [(ICDocCamExtractedDocumentViewController *)self trashButtonItem];
        v121[4] = v65;
        v66 = [MEMORY[0x263EFF8C0] arrayWithObjects:v121 count:5];
        v67 = [(ICDocCamExtractedDocumentViewController *)self bottomToolbar];
        [v67 setItems:v66];
      }
      BOOL v68 = [(ICDocCamExtractedDocumentViewController *)self bottomToolbar];
      [v68 setHidden:0];

      id v69 = [(ICDocCamExtractedDocumentViewController *)self doneButtonItem];
      v119 = v69;
      id v70 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v119 count:1];
      v71 = [(ICDocCamExtractedDocumentViewController *)self navigationItem];
      [v71 setLeftBarButtonItems:v70];

      if ([(ICDocCamExtractedDocumentViewController *)self shouldDisableSharrow])
      {
        double v17 = (void *)MEMORY[0x263EFFA68];
      }
      else
      {
        objc_super v72 = [(ICDocCamExtractedDocumentViewController *)self actionButtonItem];
        v118 = v72;
        double v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v118 count:1];
      }
      v117[0] = v6;
      v117[1] = v111;
      v117[2] = v7;
      BOOL v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v117 count:3];
      v73 = [v17 arrayByAddingObjectsFromArray:v3];
      v74 = [(ICDocCamExtractedDocumentViewController *)self navigationItem];
      [v74 setRightBarButtonItems:v73];
      goto LABEL_40;
    }
    double v41 = 56.0;
    if (v13 < 2) {
      double v41 = 0.0;
    }
    double v42 = 60.0;
    if (!v112) {
      double v42 = v41;
    }
    [(ICDocCamExtractedDocumentViewController *)self recreateThumbnailContainerWithWidth:v12 leadingTrailingMargin:v42];
    v43 = [(ICDocCamExtractedDocumentViewController *)self doneButtonItem];
    v116 = v43;
    BOOL v3 = (void *)0x263EFF000;
    v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v116 count:1];
    v45 = [(ICDocCamExtractedDocumentViewController *)self navigationItem];
    [v45 setLeftBarButtonItems:v44];

    BOOL v46 = [(ICDocCamExtractedDocumentViewController *)self shouldDisableSharrow];
    if (v46)
    {
      v47 = (void *)MEMORY[0x263EFFA68];
    }
    else
    {
      uint64_t v2 = [(ICDocCamExtractedDocumentViewController *)self actionButtonItem];
      BOOL v115 = v2;
      v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v115 count:1];
    }
    v48 = [(ICDocCamExtractedDocumentViewController *)self navigationItem];
    [v48 setRightBarButtonItems:v47];

    if (!v46)
    {
    }
    v114[0] = v9;
    v49 = [(ICDocCamExtractedDocumentViewController *)self thumbnailContainerViewItem];
    v114[1] = v49;
    v114[2] = v9;
    v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:v114 count:3];
    v51 = [(ICDocCamExtractedDocumentViewController *)self bottomToolbar];
    [v51 setItems:v50];

    v52 = [(ICDocCamExtractedDocumentViewController *)self topToolbar];
    [v52 setHidden:1];
  }
  else
  {
    if (!v112)
    {
      objc_super v18 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:5 target:0 action:0];
      double v19 = [(ICDocCamExtractedDocumentViewController *)self doneButtonItem];
      v139[0] = v19;
      id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v139 count:1];
      double v21 = [(ICDocCamExtractedDocumentViewController *)self navigationItem];
      [v21 setLeftBarButtonItems:v20];

      double v22 = [(ICDocCamExtractedDocumentViewController *)self retakeButtonItem];
      v138 = v22;
      double v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v138 count:1];
      double v24 = [(ICDocCamExtractedDocumentViewController *)self navigationItem];
      [v24 setRightBarButtonItems:v23];

      double v25 = [(ICDocCamExtractedDocumentViewController *)self recropButtonItem];
      v137[0] = v25;
      v137[1] = v18;
      v137[2] = v5;
      v137[3] = v18;
      v137[4] = v110;
      v137[5] = v18;
      double v26 = [(ICDocCamExtractedDocumentViewController *)self trashButtonItem];
      v137[6] = v26;
      v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v137 count:7];
      BOOL v3 = [(ICDocCamExtractedDocumentViewController *)self bottomToolbar];
      [v3 setItems:v27];

      v28 = [(ICDocCamExtractedDocumentViewController *)self topToolbar];
      [v28 setHidden:1];

      v29 = [(ICDocCamExtractedDocumentViewController *)self bottomToolbar];
      [v29 setHidden:0];

      v30 = [(ICDocCamExtractedDocumentViewController *)self filterViewController];
      double v31 = [(ICDocCamExtractedDocumentViewController *)self bottomToolbar];
      [v31 _setHidesShadow:v30 != 0];
    }
    if ((DCDebugInterfaceEnabled() & 1) != 0 || v112 == 1)
    {
      v32 = [(ICDocCamExtractedDocumentViewController *)self topToolbar];
      [v32 setHidden:1];

      v33 = [(ICDocCamExtractedDocumentViewController *)self bottomToolbar];
      [v33 setHidden:1];

      v34 = [(ICDocCamExtractedDocumentViewController *)self doneButtonItem];
      v136 = v34;
      v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v136 count:1];
      v36 = [(ICDocCamExtractedDocumentViewController *)self navigationItem];
      [v36 setLeftBarButtonItems:v35];

      v37 = [(ICDocCamExtractedDocumentViewController *)self retakeButtonItem];
      v135[0] = v37;
      v38 = [(ICDocCamExtractedDocumentViewController *)self trashButtonItemForNavBar];
      v135[1] = v38;
      v135[2] = v6;
      v135[3] = v111;
      v135[4] = v7;
      id v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v135 count:5];
      v40 = [(ICDocCamExtractedDocumentViewController *)self navigationItem];
      [v40 setRightBarButtonItems:v39];
    }
    [(ICDocCamExtractedDocumentViewController *)self updateTitleView];
  }
LABEL_42:
  v84 = [(ICDocCamExtractedDocumentViewController *)self view];
  [v84 safeAreaInsets];
  double v86 = v85;
  v87 = [(ICDocCamExtractedDocumentViewController *)self bottomToolbar];
  char v88 = [v87 isHidden];
  if (v88)
  {
    double Height = 0.0;
  }
  else
  {
    BOOL v3 = [(ICDocCamExtractedDocumentViewController *)self bottomToolbar];
    [v3 bounds];
    double Height = CGRectGetHeight(v140);
  }
  double v90 = v86 + Height;
  v91 = [(ICDocCamExtractedDocumentViewController *)self filterViewController];
  [v91 setBottomContentInset:v90];

  if ((v88 & 1) == 0) {
}
  }

- (void)updateFilterViewLayoutIfNeeded
{
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  [(UIViewController *)self dc_getEffectiveInterfaceOrientation:&v9 andEffectiveInterfaceIdiom:&v8];
  if (!v8)
  {
    BOOL v3 = [(ICDocCamExtractedDocumentViewController *)self filterViewController];

    if (v3)
    {
      BOOL v4 = [(ICDocCamExtractedDocumentViewController *)self filterViewController];
      id v5 = [v4 view];
      [v5 setNeedsLayout];

      objc_super v6 = [(ICDocCamExtractedDocumentViewController *)self filterViewController];
      uint64_t v7 = [v6 view];
      [v7 layoutIfNeeded];
    }
  }
}

- (void)updateTitleView
{
  uint64_t v109 = *MEMORY[0x263EF8340];
  BOOL v3 = [(ICDocCamExtractedDocumentViewController *)self titleViewWrapper];

  if (!v3) {
    return;
  }
  [(ICDocCamExtractedDocumentViewController *)self updateForAccessibilityDarkerSystemColors];
  BOOL v4 = [(ICDocCamExtractedDocumentViewController *)self titleView];
  [v4 removeFromSuperview];

  id v5 = [(ICDocCamExtractedDocumentViewController *)self titleView];
  objc_super v6 = [v5 arrangedSubviews];

  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v103 objects:v108 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v104;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v104 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v103 + 1) + 8 * i);
        unint64_t v13 = [(ICDocCamExtractedDocumentViewController *)self titleView];
        [v13 removeArrangedSubview:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v103 objects:v108 count:16];
    }
    while (v9);
  }

  unint64_t v14 = [(ICDocCamExtractedDocumentViewController *)self documentCount];
  int v15 = [(ICDocCamExtractedDocumentViewController *)self mode];
  if (!v15)
  {
    if (v14 < 2)
    {
      int v29 = 1;
      double v38 = 0.0;
      double v39 = 0.0;
      goto LABEL_25;
    }
    if ((DCDebugInterfaceEnabled() & 1) != 0
      || ([MEMORY[0x263F1C5C0] currentDevice],
          v40 = objc_claimAutoreleasedReturnValue(),
          uint64_t v41 = [v40 userInterfaceIdiom],
          v40,
          v41 == 1))
    {
      double v42 = (void *)MEMORY[0x263F1C658];
      double v43 = *MEMORY[0x263F1D330];
      double v44 = 19.0;
    }
    else
    {
      v98 = [(ICDocCamExtractedDocumentViewController *)self view];
      v99 = [v98 window];
      double v100 = [v99 windowScene];
      uint64_t v101 = [v100 interfaceOrientation];

      double v42 = (void *)MEMORY[0x263F1C658];
      if ((unint64_t)(v101 - 1) > 1)
      {
        double v43 = *MEMORY[0x263F1D330];
        double v44 = 14.0;
      }
      else
      {
        double v43 = *MEMORY[0x263F1D338];
        double v44 = 16.0;
      }
    }
    v45 = [v42 systemFontOfSize:v44 weight:v43];
    BOOL v46 = [(ICDocCamExtractedDocumentViewController *)self pageIndexLabel];
    [v46 setFont:v45];

    int v29 = 1;
    double v38 = 0.0;
LABEL_23:
    v47 = [(ICDocCamExtractedDocumentViewController *)self pageIndexLabel];
    [v47 sizeToFit];

    v48 = [(ICDocCamExtractedDocumentViewController *)self pageIndexLabel];
    [v48 size];
    double v39 = v49;

    goto LABEL_25;
  }
  unint64_t v16 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v17 = [v16 userInterfaceIdiom];

  if (v17) {
    goto LABEL_14;
  }
  objc_super v18 = [(ICDocCamExtractedDocumentViewController *)self view];
  double v19 = [v18 window];
  id v20 = [v19 windowScene];
  uint64_t v21 = [v20 interfaceOrientation];

  if ((unint64_t)(v21 - 3) > 1)
  {
LABEL_14:
    double v25 = (void *)MEMORY[0x263F1C658];
    double v30 = *MEMORY[0x263F1D330];
    double v31 = 16.0;
  }
  else
  {
    double v22 = [(ICDocCamExtractedDocumentViewController *)self view];
    double v23 = [v22 window];
    int v24 = objc_msgSend(v23, "dc_requiresCompactLandscapeIcons");

    double v25 = (void *)MEMORY[0x263F1C658];
    double v26 = *MEMORY[0x263F1D330];
    if (v24)
    {
      v27 = [MEMORY[0x263F1C658] systemFontOfSize:14.0 weight:*MEMORY[0x263F1D330]];
      v28 = [MEMORY[0x263F1C658] systemFontOfSize:14.0 weight:v26];
      int v29 = 0;
      goto LABEL_16;
    }
    double v31 = 16.0;
    double v30 = *MEMORY[0x263F1D330];
  }
  v27 = [v25 systemFontOfSize:v31 weight:v30];
  v28 = [MEMORY[0x263F1C658] systemFontOfSize:12.0 weight:*MEMORY[0x263F1D338]];
  int v29 = 1;
LABEL_16:
  v32 = [(ICDocCamExtractedDocumentViewController *)self pageIndexLabel];
  [v32 setFont:v28];

  v33 = [(ICDocCamExtractedDocumentViewController *)self collectionTitleButton];
  v34 = [v33 titleLabel];
  [v34 setFont:v27];

  v35 = [(ICDocCamExtractedDocumentViewController *)self collectionTitleButton];
  [v35 sizeToFit];

  v36 = [(ICDocCamExtractedDocumentViewController *)self collectionTitleButton];
  [v36 size];
  double v38 = v37;

  double v39 = 0.0;
  if (v14 > 1) {
    goto LABEL_23;
  }
LABEL_25:
  v50 = [(ICDocCamExtractedDocumentViewController *)self titleView];
  [v50 setDistribution:0];

  v51 = [(ICDocCamExtractedDocumentViewController *)self titleView];
  v52 = v51;
  if (v29)
  {
    [v51 setAxis:1];

    v53 = [(ICDocCamExtractedDocumentViewController *)self titleView];
    [v53 setDistribution:1];

    v54 = [(ICDocCamExtractedDocumentViewController *)self titleView];
    [v54 setSpacing:-16.0];

    if (v15)
    {
      v55 = [(ICDocCamExtractedDocumentViewController *)self titleView];
      BOOL v56 = [(ICDocCamExtractedDocumentViewController *)self collectionTitleButton];
      [v55 addArrangedSubview:v56];
    }
    if (v14 >= 2)
    {
      v57 = [(ICDocCamExtractedDocumentViewController *)self titleView];
      uint64_t v58 = [(ICDocCamExtractedDocumentViewController *)self pageIndexLabel];
      [v57 addArrangedSubview:v58];

      double v59 = [(ICDocCamExtractedDocumentViewController *)self titleView];
      [v59 setSpacing:-6.0];
    }
    goto LABEL_41;
  }
  [v51 setAxis:0];

  v60 = [(ICDocCamExtractedDocumentViewController *)self titleView];
  [v60 setSpacing:4.0];

  if (objc_msgSend(MEMORY[0x263F1C358], "dc_isRTL"))
  {
    if (v14 >= 2)
    {
      v61 = [(ICDocCamExtractedDocumentViewController *)self titleView];
      v62 = [(ICDocCamExtractedDocumentViewController *)self pageIndexLabel];
      [v61 addArrangedSubview:v62];
    }
    if (!v15) {
      goto LABEL_40;
    }
    v63 = [(ICDocCamExtractedDocumentViewController *)self titleView];
    uint64_t v64 = [(ICDocCamExtractedDocumentViewController *)self collectionTitleButton];
  }
  else
  {
    if (v15)
    {
      v65 = [(ICDocCamExtractedDocumentViewController *)self titleView];
      v66 = [(ICDocCamExtractedDocumentViewController *)self collectionTitleButton];
      [v65 addArrangedSubview:v66];
    }
    if (v14 < 2) {
      goto LABEL_40;
    }
    v63 = [(ICDocCamExtractedDocumentViewController *)self titleView];
    uint64_t v64 = [(ICDocCamExtractedDocumentViewController *)self pageIndexLabel];
  }
  v67 = (void *)v64;
  [v63 addArrangedSubview:v64];

LABEL_40:
  double v38 = v38 + v39;
LABEL_41:
  BOOL v68 = [(ICDocCamExtractedDocumentViewController *)self titleViewWrapperWidthConstraint];
  [v68 constant];
  double v70 = v69;

  double v71 = v38 + 8.0;
  if (v70 >= v38 + 8.0) {
    double v72 = v70;
  }
  else {
    double v72 = v38 + 8.0;
  }
  v73 = [(ICDocCamExtractedDocumentViewController *)self titleViewWrapperWidthConstraint];
  [v73 setConstant:v72];

  v74 = [(ICDocCamExtractedDocumentViewController *)self titleViewWrapper];
  v75 = [(ICDocCamExtractedDocumentViewController *)self titleView];
  [v74 addSubview:v75];

  v76 = [(ICDocCamExtractedDocumentViewController *)self titleView];
  v77 = [v76 leadingAnchor];
  v78 = [(ICDocCamExtractedDocumentViewController *)self titleViewWrapper];
  v79 = [v78 leadingAnchor];
  v80 = [v77 constraintEqualToAnchor:v79 constant:0.0];

  v81 = [(ICDocCamExtractedDocumentViewController *)self titleView];
  v82 = [v81 trailingAnchor];
  v83 = [(ICDocCamExtractedDocumentViewController *)self titleViewWrapper];
  v84 = [v83 trailingAnchor];
  double v85 = [v82 constraintEqualToAnchor:v84 constant:0.0];

  double v86 = [(ICDocCamExtractedDocumentViewController *)self titleView];
  v87 = [v86 bottomAnchor];
  char v88 = [(ICDocCamExtractedDocumentViewController *)self titleViewWrapper];
  v89 = [v88 bottomAnchor];
  double v90 = [v87 constraintEqualToAnchor:v89 constant:0.0];

  v91 = [(ICDocCamExtractedDocumentViewController *)self titleView];
  v92 = [v91 topAnchor];
  v93 = [(ICDocCamExtractedDocumentViewController *)self titleViewWrapper];
  v94 = [v93 topAnchor];
  v95 = [v92 constraintEqualToAnchor:v94 constant:0.0];

  double v96 = (void *)MEMORY[0x263F08938];
  v107[0] = v80;
  v107[1] = v85;
  v107[2] = v90;
  v107[3] = v95;
  v97 = [MEMORY[0x263EFF8C0] arrayWithObjects:v107 count:4];
  [v96 activateConstraints:v97];

  if (v71 != v72)
  {
    v102[0] = MEMORY[0x263EF8330];
    v102[1] = 3221225472;
    v102[2] = __58__ICDocCamExtractedDocumentViewController_updateTitleView__block_invoke;
    v102[3] = &unk_2642A9298;
    v102[4] = self;
    *(double *)&v102[5] = v71;
    dc_dispatchMainAfterDelay(v102, 0.1);
  }
}

uint64_t __58__ICDocCamExtractedDocumentViewController_updateTitleView__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __58__ICDocCamExtractedDocumentViewController_updateTitleView__block_invoke_2;
  v2[3] = &unk_2642A9298;
  v2[4] = *(void *)(a1 + 32);
  v2[5] = *(void *)(a1 + 40);
  return [MEMORY[0x263F1CB60] animateWithDuration:v2 animations:0.2];
}

void __58__ICDocCamExtractedDocumentViewController_updateTitleView__block_invoke_2(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) titleViewWrapperWidthConstraint];
  [v2 setConstant:v1];
}

- (double)thumbnailToolbarHeight
{
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  [(UIViewController *)self dc_getEffectiveInterfaceOrientation:&v10 andEffectiveInterfaceIdiom:&v9];
  if ((unint64_t)(v10 - 3) <= 1 && v9 == 0)
  {
    objc_super v6 = [(ICDocCamExtractedDocumentViewController *)self view];
    id v7 = [v6 window];
    int v8 = objc_msgSend(v7, "dc_requiresCompactLandscapeIcons");

    double result = 44.0;
    if (v8) {
      return 32.0;
    }
  }
  else
  {
    if (v9) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = (unint64_t)(v10 - 1) >= 2;
    }
    double result = 44.0;
    if (!v4) {
      return 39.0;
    }
  }
  return result;
}

- (void)recreateThumbnailContainerWithWidth:(double)a3 leadingTrailingMargin:(double)a4
{
  v49[4] = *MEMORY[0x263EF8340];
  id v7 = [(ICDocCamExtractedDocumentViewController *)self thumbnailContainerView];
  [v7 removeFromSuperview];

  [(ICDocCamExtractedDocumentViewController *)self setThumbnailContainerViewItem:0];
  [(ICDocCamExtractedDocumentViewController *)self setThumbnailContainerView:0];
  [(ICDocCamExtractedDocumentViewController *)self setThumbnailCollectionViewController:0];
  int v8 = objc_alloc_init(ICDocCamExtractedThumbnailContainerView);
  [(ICDocCamExtractedDocumentViewController *)self setThumbnailContainerView:v8];

  uint64_t v9 = [MEMORY[0x263F1C550] clearColor];
  uint64_t v10 = [(ICDocCamExtractedDocumentViewController *)self thumbnailContainerView];
  [v10 setBackgroundColor:v9];

  double v11 = [(ICDocCamExtractedDocumentViewController *)self thumbnailContainerView];
  [v11 setDelegate:self];

  id v12 = objc_alloc(MEMORY[0x263F1C468]);
  unint64_t v13 = [(ICDocCamExtractedDocumentViewController *)self thumbnailContainerView];
  unint64_t v14 = (void *)[v12 initWithCustomView:v13];
  [(ICDocCamExtractedDocumentViewController *)self setThumbnailContainerViewItem:v14];

  if (objc_msgSend(MEMORY[0x263F1C358], "dc_isRTL"))
  {
    CGAffineTransformMakeScale(&v48, -1.0, 1.0);
    int v15 = [(ICDocCamExtractedDocumentViewController *)self thumbnailContainerView];
    CGAffineTransform v47 = v48;
    [v15 setTransform:&v47];
  }
  unint64_t v16 = [(ICDocCamExtractedDocumentViewController *)self thumbnailContainerViewItem];
  [v16 setWidth:a3 + a4 * -2.0];

  [(ICDocCamExtractedDocumentViewController *)self thumbnailToolbarHeight];
  double v18 = v17;
  double v19 = [(ICDocCamExtractedDocumentViewController *)self thumbnailContainerViewItem];
  [v19 width];
  double v21 = v20;
  double v22 = [(ICDocCamExtractedDocumentViewController *)self thumbnailContainerView];
  objc_msgSend(v22, "setFrame:", 0.0, 0.0, v21, v18);

  double v23 = [(ICDocCamExtractedDocumentViewController *)self thumbnailContainerView];
  int v24 = [v23 heightAnchor];
  double v25 = [v24 constraintEqualToConstant:v18];
  [v25 setActive:1];

  double v26 = [(ICDocCamExtractedDocumentViewController *)self view];
  [v26 layoutIfNeeded];

  [(ICDocCamExtractedDocumentViewController *)self setupThumbnailViewController];
  v27 = [MEMORY[0x263F157D0] layer];
  v28 = [(ICDocCamExtractedDocumentViewController *)self thumbnailContainerView];
  [v28 bounds];
  objc_msgSend(v27, "setFrame:");

  int v29 = (void *)MEMORY[0x263EFF8C0];
  id v30 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
  uint64_t v31 = [v30 CGColor];
  id v32 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
  uint64_t v33 = [v32 CGColor];
  id v34 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
  uint64_t v35 = [v34 CGColor];
  id v36 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
  double v37 = objc_msgSend(v29, "arrayWithObjects:", v31, v33, v35, objc_msgSend(v36, "CGColor"), 0);
  [v27 setColors:v37];

  v49[0] = &unk_26C7ED6A0;
  double v38 = NSNumber;
  [v27 frame];
  v40 = [v38 numberWithDouble:12.0 / v39];
  v49[1] = v40;
  uint64_t v41 = NSNumber;
  [v27 frame];
  double v43 = [v41 numberWithDouble:1.0 - 12.0 / v42];
  v49[2] = v43;
  v49[3] = &unk_26C7ED6B8;
  double v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:4];
  [v27 setLocations:v44];

  objc_msgSend(v27, "setStartPoint:", 0.0, 0.5);
  objc_msgSend(v27, "setEndPoint:", 1.0, 0.5);
  v45 = [(ICDocCamExtractedDocumentViewController *)self thumbnailContainerView];
  BOOL v46 = [v45 layer];
  [v46 setMask:v27];
}

- (void)setupThumbnailViewController
{
  v28[1] = *MEMORY[0x263EF8340];
  BOOL v3 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionViewController];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F1C4F8]);
    [(ICDocCamExtractedDocumentViewController *)self setThumbnailCollectionViewController:v4];

    id v5 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];
    objc_super v6 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionViewController];
    [v6 setCollectionView:v5];

    id v7 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionViewController];
    [(ICDocCamExtractedDocumentViewController *)self addChildViewController:v7];

    int v8 = [(ICDocCamExtractedDocumentViewController *)self thumbnailContainerView];
    uint64_t v9 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];
    [v8 addSubview:v9];

    uint64_t v10 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionViewController];
    [v10 didMoveToParentViewController:self];

    double v11 = (void *)MEMORY[0x263F08938];
    v27 = @"childView";
    id v12 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionViewController];
    unint64_t v13 = [v12 collectionView];
    v28[0] = v13;
    unint64_t v14 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];
    int v15 = [v11 constraintsWithVisualFormat:@"H:|[childView]|" options:0 metrics:0 views:v14];

    unint64_t v16 = (void *)MEMORY[0x263F08938];
    double v25 = @"childView";
    double v17 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionViewController];
    double v18 = [v17 collectionView];
    double v26 = v18;
    double v19 = [NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    double v20 = [v16 constraintsWithVisualFormat:@"V:|[childView]|" options:0 metrics:0 views:v19];

    double v21 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionViewController];
    double v22 = [v21 collectionView];
    [v22 setTranslatesAutoresizingMaskIntoConstraints:0];

    double v23 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionViewController];
    int v24 = [v23 collectionView];
    [v24 setContentInsetAdjustmentBehavior:2];

    [MEMORY[0x263F08938] activateConstraints:v15];
    [MEMORY[0x263F08938] activateConstraints:v20];
  }
  [(ICDocCamExtractedDocumentViewController *)self setCurrentThumbnailItem:[(ICDocCamExtractedDocumentViewController *)self presentationPageIndex] animated:0];
}

- (CGSize)frameSizeForImageSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionViewLayout];
  objc_msgSend(v5, "itemSizeForImageSize:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)setImage:(id)a3 forCell:(id)a4 useResizedImage:(BOOL)a5
{
  BOOL v5 = a5;
  id v26 = a4;
  id v8 = a3;
  double v9 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];
  [v9 frame];

  double v10 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];
  [v10 contentInset];

  if (v8 && v5)
  {
    [v8 size];
    double v12 = v11;
    double v14 = v13;
    -[ICDocCamExtractedDocumentViewController frameSizeForImageSize:](self, "frameSizeForImageSize:");
    double v16 = v15;
    double v18 = v17;
    double v19 = [MEMORY[0x263F1C920] mainScreen];
    [v19 scale];
    double v21 = v20;

    double v22 = fmax(v21, 1.0);
    +[ICDocCamUtilities aspectFillSize:targetSize:](ICDocCamUtilities, "aspectFillSize:targetSize:", v12, v14, v16 * v22, v18 * v22);
    double v23 = +[ICDocCamUtilities resizedImage:newSize:interpolationQuality:](ICDocCamUtilities, "resizedImage:newSize:interpolationQuality:", v8, 3);

    int v24 = [v26 imageView];
    id v8 = v24;
    id v25 = v23;
  }
  else
  {
    int v24 = [v26 imageView];
    double v23 = v24;
    id v25 = v8;
  }
  [v24 setImage:v25];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v11.receiver = self;
  v11.super_class = (Class)ICDocCamExtractedDocumentViewController;
  id v7 = a4;
  -[ICDocCamExtractedDocumentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  id v8 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionViewLayout];
  [v8 setIsUndergoingOrientationChange:1];

  v9[4] = self;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __94__ICDocCamExtractedDocumentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v10[3] = &unk_2642A92C0;
  v10[4] = self;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __94__ICDocCamExtractedDocumentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v9[3] = &unk_2642A92C0;
  [v7 animateAlongsideTransition:v10 completion:v9];
}

uint64_t __94__ICDocCamExtractedDocumentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) filterViewController];

  BOOL v3 = *(void **)(a1 + 32);
  if (v2)
  {
    return [v3 selectFilterButtons];
  }
  else
  {
    return [v3 deselectFilterButtons];
  }
}

void __94__ICDocCamExtractedDocumentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "showViewControllerAtIndex:animated:", objc_msgSend(*(id *)(a1 + 32), "presentationPageIndex"), 0);
  [*(id *)(a1 + 32) updateLayout];
  id v2 = [*(id *)(a1 + 32) thumbnailCollectionView];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __94__ICDocCamExtractedDocumentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
  v4[3] = &unk_2642A9250;
  uint64_t v5 = *(void *)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __94__ICDocCamExtractedDocumentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_4;
  v3[3] = &unk_2642A92E8;
  v3[4] = v5;
  [v2 performBatchUpdates:v4 completion:v3];
}

void __94__ICDocCamExtractedDocumentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) thumbnailCollectionViewLayout];
  [v1 invalidateLayout];
}

void __94__ICDocCamExtractedDocumentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCurrentThumbnailItem:animated:", objc_msgSend(*(id *)(a1 + 32), "presentationPageIndex"), 1);
  id v2 = [*(id *)(a1 + 32) thumbnailCollectionViewLayout];
  [v2 setIsUndergoingOrientationChange:0];
}

- (int64_t)orientationRotated90DegreesFromOrientation:(int64_t)a3
{
  if ((unint64_t)a3 >= 4) {
    -[ICDocCamExtractedDocumentViewController orientationRotated90DegreesFromOrientation:]();
  }
  return qword_21791A8A0[a3];
}

- (void)updatePageViewControllerConstraints:(BOOL)a3 animationBlock:(id)a4 completionBlock:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  double v10 = [(ICDocCamExtractedDocumentViewController *)self filterViewController];

  if (v10)
  {
    objc_super v11 = [(ICDocCamExtractedDocumentViewController *)self navigationController];
    double v12 = [v11 navigationBar];
    [v12 frame];
    double MaxY = CGRectGetMaxY(v39);

    uint64_t v37 = 0;
    uint64_t v38 = 0;
    [(UIViewController *)self dc_getEffectiveInterfaceOrientation:&v38 andEffectiveInterfaceIdiom:&v37];
    if ((DCDebugInterfaceEnabled() & 1) != 0 || v37 == 1 || (unint64_t)(v38 - 3) <= 1)
    {
      double v14 = [(ICDocCamExtractedDocumentViewController *)self filterViewController];
      [v14 contentSize];
      double Height = 0.0;
      double v17 = v16 + 0.0;

      double v18 = [(ICDocCamExtractedDocumentViewController *)self bottomToolbar];
      char v19 = [v18 isHidden];

      if (v19) {
        goto LABEL_10;
      }
      double v20 = [(ICDocCamExtractedDocumentViewController *)self bottomToolbar];
      [v20 frame];
      double Height = CGRectGetHeight(v40);
    }
    else
    {
      double v20 = [(ICDocCamExtractedDocumentViewController *)self view];
      [v20 safeAreaInsets];
      double v22 = v21;
      double v23 = [(ICDocCamExtractedDocumentViewController *)self filterViewController];
      [v23 contentSize];
      double v25 = v22 + v24;
      id v26 = [(ICDocCamExtractedDocumentViewController *)self bottomToolbar];
      [v26 frame];
      double Height = v25 + CGRectGetHeight(v41);

      double v17 = 0.0;
    }
  }
  else
  {
    double MaxY = 0.0;
    double Height = 0.0;
    double v17 = 0.0;
  }
LABEL_10:
  if ([(ICDocCamExtractedDocumentViewController *)self adjustPageViewControllerForMarkup])
  {
    [(UIViewController *)self dc_safeAreaDistanceFromTop];
    double MaxY = v27;
    double Height = 35.0;
  }
  v28 = [(ICDocCamExtractedDocumentViewController *)self pageViewBottomConstraint];
  [v28 setConstant:-Height];

  int v29 = [(ICDocCamExtractedDocumentViewController *)self pageViewTopConstraint];
  [v29 setConstant:MaxY];

  id v30 = [(ICDocCamExtractedDocumentViewController *)self pageViewLeadingConstraint];
  [v30 setConstant:0.0];

  uint64_t v31 = [(ICDocCamExtractedDocumentViewController *)self pageViewTrailingConstraint];
  [v31 setConstant:-v17];

  if (v6)
  {
    [(ICDocCamExtractedDocumentViewController *)self setIsAnimatingPageViewController:1];
    id v32 = (void *)MEMORY[0x263F1CB60];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __110__ICDocCamExtractedDocumentViewController_updatePageViewControllerConstraints_animationBlock_completionBlock___block_invoke;
    v35[3] = &unk_2642A9310;
    v35[4] = self;
    id v36 = v8;
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __110__ICDocCamExtractedDocumentViewController_updatePageViewControllerConstraints_animationBlock_completionBlock___block_invoke_2;
    v33[3] = &unk_2642A9338;
    v33[4] = self;
    id v34 = v9;
    [v32 animateWithDuration:0 delay:v35 usingSpringWithDamping:v33 initialSpringVelocity:0.5 options:0.0 animations:1.0 completion:0.0];
  }
}

uint64_t __110__ICDocCamExtractedDocumentViewController_updatePageViewControllerConstraints_animationBlock_completionBlock___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) currentPageContentViewController];
  [v2 resetZoom];

  BOOL v3 = [*(id *)(a1 + 32) view];
  [v3 layoutIfNeeded];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

uint64_t __110__ICDocCamExtractedDocumentViewController_updatePageViewControllerConstraints_animationBlock_completionBlock___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsAnimatingPageViewController:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    BOOL v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)showFilterViewIfNecessary
{
  id v4 = [(ICDocCamExtractedDocumentViewController *)self filterViewController];

  if (!v4)
  {
    uint64_t v5 = objc_alloc_init(ICDocCamFilterViewController);
    [(ICDocCamExtractedDocumentViewController *)self setFilterViewController:v5];

    BOOL v6 = [(ICDocCamExtractedDocumentViewController *)self view];
    [v6 safeAreaInsets];
    double v8 = v7;
    id v9 = [(ICDocCamExtractedDocumentViewController *)self bottomToolbar];
    char v10 = [v9 isHidden];
    if (v10)
    {
      double Height = 0.0;
    }
    else
    {
      id v2 = [(ICDocCamExtractedDocumentViewController *)self bottomToolbar];
      [v2 bounds];
      double Height = CGRectGetHeight(v40);
    }
    double v12 = v8 + Height;
    double v13 = [(ICDocCamExtractedDocumentViewController *)self filterViewController];
    [v13 setBottomContentInset:v12];

    if ((v10 & 1) == 0) {
    double v14 = [(ICDocCamExtractedDocumentViewController *)self filterViewController];
    }
    [v14 setFilterViewDelegate:self];

    double v15 = [(ICDocCamExtractedDocumentViewController *)self filterViewController];
    [(ICDocCamExtractedDocumentViewController *)self addChildViewController:v15];

    double v16 = [(ICDocCamExtractedDocumentViewController *)self view];
    [v16 bounds];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v25 = [(ICDocCamExtractedDocumentViewController *)self filterViewController];
    id v26 = [v25 view];
    objc_msgSend(v26, "setFrame:", v18, v20, v22, v24);

    double v27 = [(ICDocCamExtractedDocumentViewController *)self view];
    v28 = [(ICDocCamExtractedDocumentViewController *)self filterViewController];
    int v29 = [v28 view];
    id v30 = [(ICDocCamExtractedDocumentViewController *)self topToolbar];
    [v27 insertSubview:v29 above:v30];

    uint64_t v31 = [(ICDocCamExtractedDocumentViewController *)self filterViewController];
    [v31 didMoveToParentViewController:self];

    id v32 = [(ICDocCamExtractedDocumentViewController *)self filterViewController];
    [v32 prepareToAnimateIn:1];

    uint64_t v33 = [(ICDocCamExtractedDocumentViewController *)self filterViewController];
    id v34 = [v33 view];
    uint64_t v35 = [v34 layer];
    [v35 setOpacity:0.0];

    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __68__ICDocCamExtractedDocumentViewController_showFilterViewIfNecessary__block_invoke;
    v39[3] = &unk_2642A9250;
    v39[4] = self;
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __68__ICDocCamExtractedDocumentViewController_showFilterViewIfNecessary__block_invoke_2;
    v38[3] = &unk_2642A92E8;
    v38[4] = self;
    [MEMORY[0x263F1CB60] animateWithDuration:v39 animations:v38 completion:0.15];
    v36[4] = self;
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __68__ICDocCamExtractedDocumentViewController_showFilterViewIfNecessary__block_invoke_3;
    v37[3] = &unk_2642A9250;
    v37[4] = self;
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __68__ICDocCamExtractedDocumentViewController_showFilterViewIfNecessary__block_invoke_4;
    v36[3] = &unk_2642A9250;
    [(ICDocCamExtractedDocumentViewController *)self updatePageViewControllerConstraints:1 animationBlock:v37 completionBlock:v36];
  }
}

void __68__ICDocCamExtractedDocumentViewController_showFilterViewIfNecessary__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) filterViewController];
  id v1 = [v4 view];
  id v2 = [v1 layer];
  LODWORD(v3) = 1.0;
  [v2 setOpacity:v3];
}

void __68__ICDocCamExtractedDocumentViewController_showFilterViewIfNecessary__block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) filterViewController];
  id v1 = [v4 view];
  id v2 = [v1 layer];
  LODWORD(v3) = 1.0;
  [v2 setOpacity:v3];
}

void __68__ICDocCamExtractedDocumentViewController_showFilterViewIfNecessary__block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) currentPageContentViewController];
  [v1 resetZoom];
}

void __68__ICDocCamExtractedDocumentViewController_showFilterViewIfNecessary__block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) updateLayout];
  UIAccessibilityNotifications v2 = *MEMORY[0x263F1CE18];
  id v4 = [*(id *)(a1 + 32) filterViewController];
  double v3 = [v4 view];
  UIAccessibilityPostNotification(v2, v3);
}

- (void)hideFilterViewIfNecessary
{
  [(ICDocCamExtractedDocumentViewController *)self deselectFilterButtons];
  double v3 = [(ICDocCamExtractedDocumentViewController *)self filterViewController];

  if (v3)
  {
    id v4 = [(ICDocCamExtractedDocumentViewController *)self filterViewController];
    [(ICDocCamExtractedDocumentViewController *)self setFilterViewController:0];
    [v4 prepareToAnimateIn:0];
    uint64_t v5 = [(ICDocCamExtractedDocumentViewController *)self filterViewController];
    BOOL v6 = [v5 view];
    double v7 = [v6 layer];
    LODWORD(v8) = 1.0;
    [v7 setOpacity:v8];

    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __68__ICDocCamExtractedDocumentViewController_hideFilterViewIfNecessary__block_invoke;
    v15[3] = &unk_2642A9250;
    v15[4] = self;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __68__ICDocCamExtractedDocumentViewController_hideFilterViewIfNecessary__block_invoke_2;
    v14[3] = &unk_2642A92E8;
    v14[4] = self;
    [MEMORY[0x263F1CB60] animateWithDuration:v15 animations:v14 completion:0.15];
    double v12 = self;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __68__ICDocCamExtractedDocumentViewController_hideFilterViewIfNecessary__block_invoke_3;
    v13[3] = &unk_2642A9250;
    v13[4] = self;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __68__ICDocCamExtractedDocumentViewController_hideFilterViewIfNecessary__block_invoke_4;
    v10[3] = &unk_2642A9360;
    id v11 = v4;
    id v9 = v4;
    [(ICDocCamExtractedDocumentViewController *)self updatePageViewControllerConstraints:1 animationBlock:v13 completionBlock:v10];
  }
}

void __68__ICDocCamExtractedDocumentViewController_hideFilterViewIfNecessary__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) filterViewController];
  id v1 = [v3 view];
  UIAccessibilityNotifications v2 = [v1 layer];
  [v2 setOpacity:0.0];
}

void __68__ICDocCamExtractedDocumentViewController_hideFilterViewIfNecessary__block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) filterViewController];
  id v1 = [v3 view];
  UIAccessibilityNotifications v2 = [v1 layer];
  [v2 setOpacity:0.0];
}

void __68__ICDocCamExtractedDocumentViewController_hideFilterViewIfNecessary__block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) currentPageContentViewController];
  [v1 resetZoom];
}

void __68__ICDocCamExtractedDocumentViewController_hideFilterViewIfNecessary__block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) willMoveToParentViewController:0];
  [*(id *)(a1 + 32) removeFromParentViewController];
  UIAccessibilityNotifications v2 = [*(id *)(a1 + 32) view];
  [v2 removeFromSuperview];

  [*(id *)(a1 + 32) setFilterViewDelegate:0];
  [*(id *)(a1 + 40) updateLayout];
  UIAccessibilityNotifications v3 = *MEMORY[0x263F1CE18];

  UIAccessibilityPostNotification(v3, 0);
}

- (void)updateImage:(id)a3 document:(id)a4 withFilterType:(signed __int16)a5
{
  uint64_t v5 = a5;
  v26[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  char v10 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
  id v11 = [v10 docInfos];
  uint64_t v12 = [v11 indexOfObject:v9];

  if ([v9 currentFilter] != v5 && v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [v9 setCurrentFilter:v5];
    double v13 = [v9 croppedAndFilteredImageUUID];

    double v14 = [(ICDocCamExtractedDocumentViewController *)self imageCache];
    double v15 = v14;
    if (v13)
    {
      double v16 = [v9 metaData];
      double v17 = [v9 croppedAndFilteredImageUUID];
      [v15 replaceImage:v8 metaData:v16 uuid:v17];
    }
    else
    {
      double v16 = [v14 setImage:v8 metaData:0 addToMemoryCache:0 completion:0];
      [v9 setCroppedAndFilteredImageUUID:v16];
    }

    if (v12 == [(ICDocCamExtractedDocumentViewController *)self presentationPageIndex])
    {
      double v18 = [(ICDocCamExtractedDocumentViewController *)self currentImageView];
      [v18 setImage:v8];
    }
    double v19 = [(ICDocCamExtractedDocumentViewController *)self delegate];
    char v20 = objc_opt_respondsToSelector();

    if (v20)
    {
      uint64_t v21 = [v9 currentFilter];
      double v22 = [(ICDocCamExtractedDocumentViewController *)self delegate];
      [v22 extractedDocumentControllerDidApplyFilter:v21 forDocument:v9];
    }
    double v23 = [MEMORY[0x263F088C8] indexPathForItem:v12 inSection:0];
    double v24 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];
    v26[0] = v23;
    double v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
    [v24 reloadItemsAtIndexPaths:v25];
  }
}

- (void)didUpdateDocumentTitle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICDocCamExtractedDocumentViewController *)self collectionTitleButton];
  [v5 setTitle:v4 forState:0];

  [(ICDocCamExtractedDocumentViewController *)self updateTitleView];
}

- (void)didUpdateDocumentInfoArrayNewCurrentDocument:(id)a3
{
  id v14 = a3;
  id v4 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionViewLayout];
  int v5 = [v4 movingItem];

  if (v5)
  {
    BOOL v6 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];
    [v6 cancelInteractiveMovement];
  }
  double v7 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionViewLayout];
  [v7 invalidateLayout];

  id v8 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];
  [v8 reloadData];

  if (v14
    && ([(ICDocCamExtractedDocumentViewController *)self documentInfoCollection],
        id v9 = objc_claimAutoreleasedReturnValue(),
        [v9 docInfos],
        char v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = [v10 indexOfObject:v14],
        v10,
        v9,
        v11 != 0x7FFFFFFFFFFFFFFFLL))
  {
    [(ICDocCamExtractedDocumentViewController *)self showViewControllerAtIndex:v11 animated:0];
    [(ICDocCamExtractedDocumentViewController *)self setCurrentThumbnailItem:v11 animated:1];
    uint64_t v12 = [v14 currentFilter];
    double v13 = [(ICDocCamExtractedDocumentViewController *)self filterViewController];
    [v13 setCurrentFilterType:v12];
  }
  else
  {
    [(ICDocCamExtractedDocumentViewController *)self hideFilterViewIfNecessary];
  }
}

- (void)didUpdateDocumentImage:(id)a3
{
  id v5 = a3;
  if ([(ICDocCamExtractedDocumentViewController *)self isScrollingBetweenPages])
  {
    id v4 = [(ICDocCamExtractedDocumentViewController *)self documentsToUpdateWhenScrollingStops];
    [v4 addObject:v5];
  }
  else
  {
    [(ICDocCamExtractedDocumentViewController *)self updateDocumentImage:v5];
  }
}

- (void)updateDocumentImage:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
  BOOL v6 = [v5 docInfos];
  unint64_t v7 = [v6 indexOfObject:v4];

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];
    id v9 = [MEMORY[0x263F088C8] indexPathForItem:v7 inSection:0];
    v21[0] = v9;
    char v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
    [v8 reloadItemsAtIndexPaths:v10];

    if ([(ICDocCamExtractedDocumentViewController *)self presentationPageIndex] == v7)
    {
      uint64_t v11 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
      uint64_t v12 = [v11 docInfos];
      if (v7 >= [v12 count])
      {
LABEL_6:

        goto LABEL_7;
      }
      double v13 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
      id v14 = [v13 docInfos];
      double v15 = [v14 objectAtIndexedSubscript:v7];

      if (v15)
      {
        double v16 = [(ICDocCamExtractedDocumentViewController *)self croppedAndFilteredmageForDocumentAtIndex:v7];
        double v17 = [(ICDocCamExtractedDocumentViewController *)self currentPageContentViewController];
        [v17 setImage:v16];

        uint64_t v18 = [v15 currentFilter];
        uint64_t v12 = [(ICDocCamExtractedDocumentViewController *)self filterViewController];
        [v12 setCurrentFilterType:v18];
        uint64_t v11 = v15;
        goto LABEL_6;
      }
    }
LABEL_7:
    double v19 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionViewLayout];
    [v19 invalidateLayout];

    [(ICDocCamExtractedDocumentViewController *)self setCurrentThumbnailItem:[(ICDocCamExtractedDocumentViewController *)self presentationPageIndex] animated:1];
    char v20 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
    [v20 bumpModificationDate];
  }
}

- (id)currentDocument
{
  unint64_t v3 = [(ICDocCamExtractedDocumentViewController *)self presentationPageIndex];
  id v4 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
  id v5 = [v4 docInfos];
  if (v3 >= [v5 count])
  {
    id v8 = 0;
  }
  else
  {
    BOOL v6 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
    unint64_t v7 = [v6 docInfos];
    id v8 = [v7 objectAtIndexedSubscript:v3];
  }

  return v8;
}

- (void)addImageAction:(id)a3
{
  if (![(ICDocCamExtractedDocumentViewController *)self shouldDisableActions])
  {
    [(ICDocCamExtractedDocumentViewController *)self hideFilterViewIfNecessary];
    id v7 = [(ICDocCamExtractedDocumentViewController *)self presentedViewController];
    if (v7) {
      [(ICDocCamExtractedDocumentViewController *)self dismissViewControllerAnimated:0 completion:0];
    }
    id v4 = [(ICDocCamExtractedDocumentViewController *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      BOOL v6 = [(ICDocCamExtractedDocumentViewController *)self delegate];
      [v6 extractedDocumentControllerDidTapAddImage];
    }
  }
}

- (void)recropButtonPressed:(id)a3
{
  if (![(ICDocCamExtractedDocumentViewController *)self shouldDisableActions])
  {
    id v4 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
    char v5 = [v4 docInfos];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      id v7 = [(ICDocCamExtractedDocumentViewController *)self delegate];
      char v8 = objc_opt_respondsToSelector();

      if (v8)
      {
        if ([(ICDocCamExtractedDocumentViewController *)self currentImageHasMarkup])
        {
          [(ICDocCamExtractedDocumentViewController *)self alertAndDiscardMarkup];
        }
        else
        {
          id v10 = [(ICDocCamExtractedDocumentViewController *)self delegate];
          id v9 = [(ICDocCamExtractedDocumentViewController *)self currentDocument];
          objc_msgSend(v10, "extractedDocumentController:didTapRecrop:index:", self, v9, -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex"));
        }
      }
    }
  }
}

- (void)retakeAction:(id)a3
{
  id v4 = [(ICDocCamExtractedDocumentViewController *)self view];
  char v5 = [v4 window];
  uint64_t v6 = [v5 windowScene];
  id v7 = [v6 statusBarManager];
  -[ICDocCamExtractedDocumentViewController setStatusBarWasHiddenWhenRetakeTapped:](self, "setStatusBarWasHiddenWhenRetakeTapped:", [v7 isStatusBarHidden]);

  id v8 = [(ICDocCamExtractedDocumentViewController *)self delegate];
  objc_msgSend(v8, "extractedDocumentControllerDidTapRetake:", -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex"));
}

- (void)doneAction:(id)a3
{
  id v4 = [(ICDocCamExtractedDocumentViewController *)self view];
  uint64_t v5 = [v4 window];
  uint64_t v6 = [(id)v5 windowScene];
  id v7 = [v6 statusBarManager];
  -[ICDocCamExtractedDocumentViewController setStatusBarWasHiddenWhenDoneTapped:](self, "setStatusBarWasHiddenWhenDoneTapped:", [v7 isStatusBarHidden]);

  id v8 = [(ICDocCamExtractedDocumentViewController *)self delegate];
  LOBYTE(v5) = objc_opt_respondsToSelector();

  id v11 = [(ICDocCamExtractedDocumentViewController *)self delegate];
  int64_t v9 = [(ICDocCamExtractedDocumentViewController *)self presentationPageIndex];
  if (v5)
  {
    id v10 = [(ICDocCamExtractedDocumentViewController *)self scanCollectionDataDelegate];
    [v11 extractedDocumentControllerDidTapDone:v9 scanDataDelegate:v10];
  }
  else
  {
    [v11 extractedDocumentControllerDidTapDone:v9];
  }
}

- (void)shareAction:(id)a3
{
  id v13 = a3;
  if (![(ICDocCamExtractedDocumentViewController *)self shouldDisableActions])
  {
    id v4 = [(ICDocCamExtractedDocumentViewController *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      uint64_t v6 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
      id v7 = [v6 docInfos];
      uint64_t v8 = [v7 count];

      if (v8)
      {
        int64_t v9 = [(ICDocCamExtractedDocumentViewController *)self delegate];
        id v10 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
        id v11 = [v10 docInfos];
        uint64_t v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex"));
        [v9 extractedDocumentController:self shareDocument:v12 sender:v13];
      }
    }
  }
}

- (DCScanDataDelegate)scanCollectionDataDelegate
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
  char v5 = [v4 docInfos];
  uint64_t v6 = [v5 firstObject];
  id v7 = DCDynamicCast(v3, (uint64_t)v6);

  uint64_t v8 = [v7 scanDataDelegate];
  int64_t v9 = [v8 parentAttachment];

  return (DCScanDataDelegate *)v9;
}

- (DCScanDataDelegate)selectedScanDataDelegate
{
  UIAccessibilityNotifications v2 = [(ICDocCamExtractedDocumentViewController *)self currentDocument];
  uint64_t v3 = [v2 scanDataDelegate];

  return (DCScanDataDelegate *)v3;
}

- (id)orientationString:(int64_t)a3
{
  if ((unint64_t)a3 >= 4) {
    -[ICDocCamExtractedDocumentViewController orientationString:]();
  }
  return off_2642A9600[a3];
}

- (id)currentPageContentViewController
{
  UIAccessibilityNotifications v2 = [(ICDocCamExtractedDocumentViewController *)self pageViewController];
  uint64_t v3 = [v2 viewControllers];

  id v4 = [v3 firstObject];

  return v4;
}

- (UIImageView)currentImageView
{
  UIAccessibilityNotifications v2 = [(ICDocCamExtractedDocumentViewController *)self currentPageContentViewController];
  uint64_t v3 = [v2 imageView];

  return (UIImageView *)v3;
}

- (void)alertAndDiscardMarkup
{
  uint64_t v3 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
  id v4 = [v3 docInfos];
  char v5 = objc_msgSend(v4, "objectAtIndexedSubscript:", -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex"));

  uint64_t v6 = +[DCLocalization localizedStringForKey:@"Discard Annotations?" value:@"Discard Annotations?" table:@"Localizable"];
  id v7 = +[DCLocalization localizedStringForKey:@"If you rotate or crop this scan, its Markup annotations will be discarded." value:@"If you rotate or crop this scan, its Markup annotations will be discarded." table:@"Localizable"];
  uint64_t v8 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v6 message:v7 preferredStyle:1];
  int64_t v9 = [MEMORY[0x263F1C6B0] systemImageNamed:@"exclamationmark.triangle"];
  [v8 setImage:v9];

  id v10 = (void *)MEMORY[0x263F1C3F0];
  id v11 = +[DCLocalization localizedStringForKey:@"OK" value:@"OK" table:@"Localizable"];
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  double v19 = __64__ICDocCamExtractedDocumentViewController_alertAndDiscardMarkup__block_invoke;
  char v20 = &unk_2642A9388;
  uint64_t v21 = self;
  id v22 = v5;
  id v12 = v5;
  id v13 = [v10 actionWithTitle:v11 style:2 handler:&v17];
  objc_msgSend(v8, "addAction:", v13, v17, v18, v19, v20, v21);

  id v14 = (void *)MEMORY[0x263F1C3F0];
  double v15 = +[DCLocalization localizedStringForKey:@"Cancel" value:@"Cancel" table:@"Localizable"];
  double v16 = [v14 actionWithTitle:v15 style:1 handler:0];
  [v8 addAction:v16];

  [(ICDocCamExtractedDocumentViewController *)self presentViewController:v8 animated:1 completion:0];
}

void __64__ICDocCamExtractedDocumentViewController_alertAndDiscardMarkup__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 extractedDocumentControllerDiscardMarkupModelDataForDocument:*(void *)(a1 + 40)];
}

- (BOOL)currentImageHasMarkup
{
  uint64_t v3 = [(ICDocCamExtractedDocumentViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  unint64_t v5 = [(ICDocCamExtractedDocumentViewController *)self presentationPageIndex];
  uint64_t v6 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
  id v7 = [v6 docInfos];
  unint64_t v8 = [v7 count];

  if (v5 >= v8) {
    return 0;
  }
  int64_t v9 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
  id v10 = [v9 docInfos];
  id v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex"));

  id v12 = [(ICDocCamExtractedDocumentViewController *)self delegate];
  id v13 = [v12 extractedDocumentControllerMarkupModelDataForDocument:v11];
  BOOL v14 = [v13 length] != 0;

  return v14;
}

- (BOOL)imageIsPortrait:(id)a3
{
  id v3 = a3;
  [v3 size];
  double v5 = v4;
  [v3 size];
  double v7 = v6;

  return v5 <= v7;
}

- (void)rotateAction:(id)a3
{
  if (![(ICDocCamExtractedDocumentViewController *)self shouldDisableActions])
  {
    if ([(ICDocCamExtractedDocumentViewController *)self currentImageHasMarkup])
    {
      [(ICDocCamExtractedDocumentViewController *)self alertAndDiscardMarkup];
    }
    else
    {
      [(ICDocCamExtractedDocumentViewController *)self rotateCurrentImage];
    }
  }
}

- (void)rotateCurrentImage
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_217885000, log, OS_LOG_TYPE_ERROR, "Unable to find image when rotating.", v1, 2u);
}

void __61__ICDocCamExtractedDocumentViewController_rotateCurrentImage__block_invoke(uint64_t a1)
{
  v29[1] = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setClipsToBounds:1];
  id v2 = [*(id *)(a1 + 40) pageViewController];
  id v3 = [v2 view];
  [v3 setClipsToBounds:1];

  double v4 = [*(id *)(a1 + 48) layer];
  [v4 removeAllAnimations];

  double v5 = *(void **)(a1 + 48);
  long long v6 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v28[0] = *MEMORY[0x263F000D0];
  v28[1] = v6;
  void v28[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v5 setTransform:v28];
  double v7 = [*(id *)(a1 + 40) documentInfoCollection];
  unint64_t v8 = [v7 docInfos];
  int64_t v9 = [v8 objectAtIndexedSubscript:*(void *)(a1 + 64)];

  id v10 = (void *)MEMORY[0x21D44F7D0](objc_msgSend(v9, "setCurrentOrientation:", objc_msgSend(*(id *)(a1 + 40), "orientationRotated90DegreesFromOrientation:", objc_msgSend(v9, "currentOrientation"))));
  id v11 = objc_msgSend(MEMORY[0x263F1C6B0], "imageWithCGImage:scale:orientation:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "CGImage"), *(void *)(a1 + 72), 1.0);
  id v12 = [v9 croppedAndFilteredImageUUID];

  id v13 = [*(id *)(a1 + 40) imageCache];
  BOOL v14 = v13;
  if (v12)
  {
    double v15 = [v9 metaData];
    double v16 = [v9 croppedAndFilteredImageUUID];
    [v14 replaceImage:v11 metaData:v15 uuid:v16];
  }
  else
  {
    double v15 = [v13 setImage:v11 metaData:0 addToMemoryCache:1 completion:0];
    [v9 setCroppedAndFilteredImageUUID:v15];
  }

  uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = 0;

  double v19 = [*(id *)(a1 + 40) currentPageContentViewController];
  [v19 setImage:v11];

  char v20 = [*(id *)(a1 + 40) delegate];
  char v21 = objc_opt_respondsToSelector();

  if ((v21 & 1) == 0)
  {
    id v22 = [*(id *)(a1 + 40) thumbnailCollectionView];
    double v23 = [MEMORY[0x263F088C8] indexPathForItem:*(void *)(a1 + 64) inSection:0];
    v29[0] = v23;
    double v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:1];
    [v22 reloadItemsAtIndexPaths:v24];
  }
  [*(id *)(a1 + 40) setRotationUnderWay:0];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  void v26[2] = __61__ICDocCamExtractedDocumentViewController_rotateCurrentImage__block_invoke_2;
  v26[3] = &unk_2642A9360;
  v26[4] = *(void *)(a1 + 40);
  id v27 = v9;
  id v25 = v9;
  dispatch_async(MEMORY[0x263EF83A0], v26);
}

void __61__ICDocCamExtractedDocumentViewController_rotateCurrentImage__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    double v4 = [*(id *)(a1 + 32) delegate];
    [v4 extractedDocumentControllerDidRotateDocument:*(void *)(a1 + 40)];
  }
  id v5 = [*(id *)(a1 + 32) documentInfoCollection];
  [v5 bumpModificationDate];
}

- (void)filterButtonAction:(id)a3
{
  id v4 = a3;
  if (![(ICDocCamExtractedDocumentViewController *)self shouldDisableActions])
  {
    id v5 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
    long long v6 = [v5 docInfos];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      unint64_t v8 = [(ICDocCamExtractedDocumentViewController *)self filterViewController];

      if (v8)
      {
        [v4 setSelected:0];
        [(ICDocCamExtractedDocumentViewController *)self deselectFilterButtons];
        [(ICDocCamExtractedDocumentViewController *)self hideFilterViewIfNecessary];
      }
      else
      {
        [v4 setSelected:1];
        [(ICDocCamExtractedDocumentViewController *)self selectFilterButtons];
        unint64_t v9 = [(ICDocCamExtractedDocumentViewController *)self presentationPageIndex];
        id v10 = [(ICDocCamExtractedDocumentViewController *)self croppedAndFilteredmageForDocumentAtIndex:v9];
        id v11 = [(ICDocCamExtractedDocumentViewController *)self croppedButNotFilteredImageForDocumentAtIndex:v9];
        id v12 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
        id v13 = [v12 docInfos];
        if (v9 >= [v13 count])
        {
          double v16 = 0;
        }
        else
        {
          BOOL v14 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
          double v15 = [v14 docInfos];
          double v16 = [v15 objectAtIndexedSubscript:v9];
        }
        if (v16 && v10 && v11)
        {
          [(ICDocCamExtractedDocumentViewController *)self showFilterViewIfNecessary];
          uint64_t v17 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
          uint64_t v18 = [v17 docInfos];
          double v19 = [v18 objectAtIndexedSubscript:v9];
          uint64_t v20 = [v19 currentFilter];
          char v21 = [(ICDocCamExtractedDocumentViewController *)self filterViewController];
          [v21 setCurrentFilterType:v20];
        }
        else
        {
          id v22 = os_log_create("com.apple.documentcamera", "");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            -[ICDocCamExtractedDocumentViewController filterButtonAction:](v16, v22);
          }
        }
      }
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __62__ICDocCamExtractedDocumentViewController_filterButtonAction___block_invoke;
      v23[3] = &unk_2642A9250;
      v23[4] = self;
      dc_dispatchMainAfterDelay(v23, 0.25);
    }
  }
}

uint64_t __62__ICDocCamExtractedDocumentViewController_filterButtonAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateFilterButtonItemAccessibilityInfo];
}

- (void)deleteButtonAction:(id)a3
{
  id v4 = a3;
  if (![(ICDocCamExtractedDocumentViewController *)self shouldDisableActions])
  {
    if ([(ICDocCamExtractedDocumentViewController *)self mode])
    {
      uint64_t v5 = objc_opt_class();
      long long v6 = DCDynamicCast(v5, (uint64_t)v4);
      if (!v6)
      {
        uint64_t v7 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
        unint64_t v8 = [v7 docInfos];
        unint64_t v9 = [v8 count];

        if (v9 >= 2)
        {
          [(ICDocCamExtractedDocumentViewController *)self deleteCurrentPage];
LABEL_18:

          goto LABEL_19;
        }
      }
      id v10 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
      id v11 = [v10 docInfos];
      if ([v11 count] == 1)
      {
        id v12 = [(ICDocCamExtractedDocumentViewController *)self delegate];
        if (objc_opt_respondsToSelector())
        {
          int v13 = [(ICDocCamExtractedDocumentViewController *)self mode];

          if (v13 == 1)
          {
            BOOL v14 = +[DCLocalization localizedStringForKey:@"Deleting the last scan in this document will remove the document from your note." value:@"Deleting the last scan in this document will remove the document from your note." table:@"Localizable"];
LABEL_14:
            double v15 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v14 message:0 preferredStyle:0];
            double v16 = (void *)MEMORY[0x263F1C3F0];
            uint64_t v17 = +[DCLocalization localizedStringForKey:@"Delete Scan" value:@"Delete Scan" table:@"Localizable"];
            v25[0] = MEMORY[0x263EF8330];
            v25[1] = 3221225472;
            v25[2] = __62__ICDocCamExtractedDocumentViewController_deleteButtonAction___block_invoke;
            v25[3] = &unk_2642A93D8;
            v25[4] = self;
            uint64_t v18 = [v16 actionWithTitle:v17 style:2 handler:v25];
            [v15 addAction:v18];

            double v19 = (void *)MEMORY[0x263F1C3F0];
            uint64_t v20 = +[DCLocalization localizedStringForKey:@"Cancel" value:@"Cancel" table:@"Localizable"];
            char v21 = [v19 actionWithTitle:v20 style:1 handler:0];
            [v15 addAction:v21];

            [v15 setModalPresentationStyle:7];
            [(ICDocCamExtractedDocumentViewController *)self presentViewController:v15 animated:1 completion:0];
            id v22 = [v15 popoverPresentationController];
            double v23 = v22;
            if (v6)
            {
              [v22 setBarButtonItem:v6];
            }
            else
            {
              double v24 = [(ICDocCamExtractedDocumentViewController *)self currentImageView];
              [v23 setSourceView:v24];

              [(ICDocCamExtractedDocumentViewController *)self menuControllerTargetRect];
              objc_msgSend(v23, "setSourceRect:");
            }
            [v23 setPermittedArrowDirections:3];

            goto LABEL_18;
          }
LABEL_13:
          BOOL v14 = 0;
          goto LABEL_14;
        }
      }
      goto LABEL_13;
    }
    [(ICDocCamExtractedDocumentViewController *)self deleteCurrentPage];
  }
LABEL_19:
}

uint64_t __62__ICDocCamExtractedDocumentViewController_deleteButtonAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deleteCurrentPage];
}

- (id)makeUIImageFromCIImage:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  char v3 = (void *)MEMORY[0x263F00628];
  uint64_t v11 = *MEMORY[0x263F00808];
  v12[0] = MEMORY[0x263EFFA80];
  id v4 = NSDictionary;
  id v5 = a3;
  long long v6 = [v4 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  uint64_t v7 = [v3 contextWithOptions:v6];

  [v5 extent];
  unint64_t v8 = (CGImage *)objc_msgSend(v7, "createCGImage:fromRect:", v5);

  unint64_t v9 = [MEMORY[0x263F1C6B0] imageWithCGImage:v8];
  CGImageRelease(v8);

  return v9;
}

- (void)deleteCurrentPage
{
  v89[2] = *MEMORY[0x263EF8340];
  [(ICDocCamExtractedDocumentViewController *)self hideFilterViewIfNecessary];
  char v3 = [(ICDocCamExtractedDocumentViewController *)self currentPageContentViewController];
  [v3 resetZoom];

  id v4 = [(ICDocCamExtractedDocumentViewController *)self currentPageContentViewController];
  id v5 = [v4 imageView];

  long long v6 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v7 = [v6 _graphicsQuality];

  if (v7 != 100)
  {
    unint64_t v8 = [(ICDocCamExtractedDocumentViewController *)self croppedAndFilteredmageForDocumentAtIndex:[(ICDocCamExtractedDocumentViewController *)self presentationPageIndex]];
    id v9 = objc_alloc(MEMORY[0x263F00650]);
    id v10 = v8;
    v78 = objc_msgSend(v9, "initWithCGImage:", objc_msgSend(v10, "CGImage"));
    [v78 extent];
    CGRect v91 = CGRectIntegral(v90);
    double x = v91.origin.x;
    double y = v91.origin.y;
    double width = v91.size.width;
    double height = v91.size.height;
    v77 = objc_msgSend(v78, "imageByCroppingToRect:");
    double v15 = [v77 imageByClampingToExtent];
    [v15 extent];
    double v16 = objc_msgSend(v15, "imageBySettingAlphaOneInExtent:");

    uint64_t v17 = (void *)MEMORY[0x263F00640];
    v88[0] = *MEMORY[0x263F00968];
    v88[1] = @"inputRadius";
    v89[0] = v16;
    uint64_t v18 = [NSNumber numberWithDouble:40.0];
    v89[1] = v18;
    [NSDictionary dictionaryWithObjects:v89 forKeys:v88 count:2];
    v20 = double v19 = v5;
    [v17 filterWithName:@"CIGaussianBlur" withInputParameters:v20];
    id v22 = v21 = v7;
    double v23 = [v22 outputImage];
    double v24 = objc_msgSend(v23, "imageByCroppingToRect:", x, y, width, height);

    id v5 = v19;
    id v25 = [(ICDocCamExtractedDocumentViewController *)self makeUIImageFromCIImage:v24];
    [v10 size];
    double v27 = v26;
    [v10 size];
    v28 = objc_msgSend(v25, "dc_scaledImageWithSize:scale:", v27);
    int v29 = [(ICDocCamExtractedDocumentViewController *)self currentPageContentViewController];
    [v29 setImage:v28];

    uint64_t v7 = v21;
  }
  id v30 = [(ICDocCamExtractedDocumentViewController *)self trashButtonItem];
  [v30 setEnabled:0];

  uint64_t v31 = [(ICDocCamExtractedDocumentViewController *)self trashButtonItemForNavBar];
  [v31 setEnabled:0];

  id v32 = [(ICDocCamExtractedDocumentViewController *)self retakeButtonItem];
  [v32 setEnabled:0];

  [(ICDocCamExtractedDocumentViewController *)self _beginDisablingInterfaceAutorotation];
  unint64_t v33 = 0x263F15000uLL;
  [MEMORY[0x263F158F8] begin];
  v83[0] = MEMORY[0x263EF8330];
  v83[1] = 3221225472;
  v83[2] = __60__ICDocCamExtractedDocumentViewController_deleteCurrentPage__block_invoke;
  v83[3] = &unk_2642A9250;
  v83[4] = self;
  [MEMORY[0x263F158F8] setCompletionBlock:v83];
  memset(&v82, 0, sizeof(v82));
  id v34 = [v5 layer];
  uint64_t v35 = v34;
  if (v34) {
    [v34 transform];
  }
  else {
    memset(&v82, 0, sizeof(v82));
  }

  id v36 = [(ICDocCamExtractedDocumentViewController *)self currentPageContentViewController];
  [v36 zoomScale];
  double v38 = v37;

  CGRect v39 = [MEMORY[0x263F15760] animationWithKeyPath:@"transform.scale"];
  CGRect v40 = [NSNumber numberWithDouble:v38];
  [v39 setFromValue:v40];

  CGRect v41 = [NSNumber numberWithDouble:v38 * 0.5];
  [v39 setToValue:v41];

  [v39 setDuration:0.28];
  LODWORD(v42) = 1.0;
  [v39 setRepeatCount:v42];
  [v39 setRemovedOnCompletion:0];
  uint64_t v43 = *MEMORY[0x263F15AA8];
  [v39 setFillMode:*MEMORY[0x263F15AA8]];
  LODWORD(v44) = 1051361018;
  LODWORD(v45) = 1045220557;
  LODWORD(v46) = 1.0;
  CGAffineTransform v47 = [MEMORY[0x263F15808] functionWithControlPoints:v44 :0.0 :v45 :v46];
  [v39 setTimingFunction:v47];

  CGAffineTransform v48 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  [v48 setBeginTime:0.08];
  [v48 setFromValue:&unk_26C7ED6B8];
  [v48 setToValue:&unk_26C7ED6A0];
  [v48 setDuration:0.15];
  LODWORD(v49) = 1.0;
  [v48 setRepeatCount:v49];
  [v48 setRemovedOnCompletion:0];
  [v48 setFillMode:v43];
  uint64_t v50 = *MEMORY[0x263F15EB8];
  v51 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
  [v48 setTimingFunction:v51];

  if (v7 == 100)
  {
    uint64_t v52 = *MEMORY[0x263F15BC8];
    v53 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15BC8]];
    [v53 setEnabled:1];
    [v53 setValue:MEMORY[0x263EFFA88] forKey:@"inputNormalizeEdges"];
    [v53 setValue:&unk_26C7ED6A0 forKey:@"inputRadius"];
    v54 = [MEMORY[0x263F1C5C0] currentDevice];
    if ([v54 _graphicsQuality] == 100) {
      v55 = @"default";
    }
    else {
      v55 = @"low";
    }
    [v53 setValue:v55 forKey:@"inputQuality"];

    BOOL v56 = [v5 layer];
    v87 = v53;
    v57 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v87 count:1];
    [v56 setFilters:v57];

    uint64_t v58 = [v5 layer];
    [v58 setShouldRasterize:1];

    double v59 = [MEMORY[0x263F15760] animationWithKeyPath:@"filters.gaussianBlur.inputRadius"];
    v60 = [v5 layer];
    v61 = [v60 valueForKeyPath:@"filters.gaussianBlur.inputRadius"];
    [v59 setFromValue:v61];

    [v59 setToValue:&unk_26C7ED6D0];
    [v59 setDuration:0.15];
    LODWORD(v62) = 1.0;
    [v59 setRepeatCount:v62];
    [v59 setRemovedOnCompletion:0];
    [v59 setFillMode:v43];
    v63 = [MEMORY[0x263F15808] functionWithName:v50];
    [v59 setTimingFunction:v63];

    uint64_t v64 = [MEMORY[0x263F157C8] filterWithType:v52];
    [v64 setEnabled:1];
    [v64 setValue:MEMORY[0x263EFFA88] forKey:@"inputNormalizeEdges"];
    [v64 setValue:&unk_26C7ED6D0 forKey:@"inputRadius"];
    v65 = [MEMORY[0x263F1C5C0] currentDevice];
    if ([v65 _graphicsQuality] == 100) {
      v66 = @"default";
    }
    else {
      v66 = @"low";
    }
    [v64 setValue:v66 forKey:@"inputQuality"];

    v67 = [v5 layer];
    double v86 = v64;
    BOOL v68 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v86 count:1];
    [v67 setFilters:v68];

    uint64_t v7 = 100;
    unint64_t v33 = 0x263F15000;
  }
  else
  {
    double v59 = 0;
  }
  double v69 = [v5 layer];
  [v69 setOpacity:0.0];

  CATransform3D v80 = v82;
  CATransform3DScale(&v81, &v80, 0.5, 0.5, 0.5);
  double v70 = [v5 layer];
  CATransform3D v79 = v81;
  [v70 setTransform:&v79];

  double v71 = [MEMORY[0x263F15750] animation];
  [v71 setDuration:0.28];
  if (v7 == 100 && v59)
  {
    v85[0] = v39;
    v85[1] = v48;
    v85[2] = v59;
    double v72 = (void *)MEMORY[0x263EFF8C0];
    v73 = v85;
    uint64_t v74 = 3;
  }
  else
  {
    v84[0] = v39;
    v84[1] = v48;
    double v72 = (void *)MEMORY[0x263EFF8C0];
    v73 = v84;
    uint64_t v74 = 2;
  }
  v75 = [v72 arrayWithObjects:v73 count:v74];
  [v71 setAnimations:v75];

  v76 = [v5 layer];
  [v76 addAnimation:v71 forKey:@"animGroup"];

  [*(id *)(v33 + 2296) commit];
}

void __60__ICDocCamExtractedDocumentViewController_deleteCurrentPage__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) documentInfoCollection];
  char v3 = [v2 docInfos];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) documentInfoCollection];
    long long v6 = [v5 docInfos];
    uint64_t v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 32), "presentationPageIndex"));

    unint64_t v8 = [v7 croppedAndFilteredImageUUID];

    if (v8)
    {
      id v9 = [*(id *)(a1 + 32) imageCache];
      id v10 = [v7 croppedAndFilteredImageUUID];
      [v9 deleteImage:v10];
    }
    uint64_t v11 = [v7 croppedButNotFilteredImageUUID];

    if (v11)
    {
      id v12 = [*(id *)(a1 + 32) imageCache];
      int v13 = [v7 croppedButNotFilteredImageUUID];
      [v12 deleteImage:v13];
    }
    BOOL v14 = [v7 fullImageUUID];

    if (v14)
    {
      double v15 = [*(id *)(a1 + 32) imageCache];
      double v16 = [v7 fullImageUUID];
      [v15 deleteImage:v16];
    }
    uint64_t v17 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", objc_msgSend(*(id *)(a1 + 32), "presentationPageIndex"), 0);
    uint64_t v18 = [*(id *)(a1 + 32) thumbnailCollectionView];
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __60__ICDocCamExtractedDocumentViewController_deleteCurrentPage__block_invoke_2;
    v44[3] = &unk_2642A9360;
    v44[4] = *(void *)(a1 + 32);
    id v19 = v17;
    id v45 = v19;
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __60__ICDocCamExtractedDocumentViewController_deleteCurrentPage__block_invoke_3;
    v43[3] = &unk_2642A92E8;
    v43[4] = *(void *)(a1 + 32);
    [v18 performBatchUpdates:v44 completion:v43];

    uint64_t v20 = [*(id *)(a1 + 32) delegate];
    char v21 = objc_opt_respondsToSelector();

    if (v21)
    {
      id v22 = [*(id *)(a1 + 32) delegate];
      [v22 extractedDocumentControllerDidDeleteDocument:v7];
    }
    double v23 = [*(id *)(a1 + 32) documentInfoCollection];
    [v23 bumpModificationDate];
  }
  double v24 = [*(id *)(a1 + 32) documentInfoCollection];
  id v25 = [v24 docInfos];
  uint64_t v26 = [v25 count];

  double v27 = *(void **)(a1 + 32);
  if (v26)
  {
    unint64_t v28 = [v27 presentationPageIndex];
    int v29 = [*(id *)(a1 + 32) documentInfoCollection];
    id v30 = [v29 docInfos];
    unint64_t v31 = [v30 count] - 1;

    if (v28 >= v31) {
      unint64_t v28 = v31;
    }
    [*(id *)(a1 + 32) setPresentationPageIndex:v28];
    [*(id *)(a1 + 32) updatePageIndicatorForPageIndex:v28];
    [*(id *)(a1 + 32) showViewControllerAtIndex:v28 animated:1];
    [*(id *)(a1 + 32) setCurrentThumbnailItem:v28 animated:1];
    if ([*(id *)(a1 + 32) _isInterfaceAutorotationDisabled])
    {
      dispatch_time_t v32 = dispatch_time(0, 1000000000);
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __60__ICDocCamExtractedDocumentViewController_deleteCurrentPage__block_invoke_5;
      v41[3] = &unk_2642A9250;
      v41[4] = *(void *)(a1 + 32);
      unint64_t v33 = MEMORY[0x263EF83A0];
      id v34 = v41;
LABEL_18:
      dispatch_after(v32, v33, v34);
      return;
    }
    uint64_t v35 = [*(id *)(a1 + 32) trashButtonItem];
    [v35 setEnabled:1];

    id v36 = [*(id *)(a1 + 32) trashButtonItemForNavBar];
    [v36 setEnabled:1];

    double v37 = [*(id *)(a1 + 32) retakeButtonItem];
    [v37 setEnabled:1];
  }
  else
  {
    if ([v27 _isInterfaceAutorotationDisabled])
    {
      dispatch_time_t v32 = dispatch_time(0, 1000000000);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __60__ICDocCamExtractedDocumentViewController_deleteCurrentPage__block_invoke_4;
      block[3] = &unk_2642A9250;
      block[4] = *(void *)(a1 + 32);
      unint64_t v33 = MEMORY[0x263EF83A0];
      id v34 = block;
      goto LABEL_18;
    }
    double v38 = [*(id *)(a1 + 32) trashButtonItem];
    [v38 setEnabled:1];

    CGRect v39 = [*(id *)(a1 + 32) trashButtonItemForNavBar];
    [v39 setEnabled:1];

    CGRect v40 = [*(id *)(a1 + 32) retakeButtonItem];
    [v40 setEnabled:1];

    [*(id *)(a1 + 32) doneAction:0];
  }
}

void __60__ICDocCamExtractedDocumentViewController_deleteCurrentPage__block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) thumbnailCollectionView];
  v6[0] = *(void *)(a1 + 40);
  char v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  [v2 deleteItemsAtIndexPaths:v3];

  uint64_t v4 = [*(id *)(a1 + 32) documentInfoCollection];
  id v5 = [v4 docInfos];
  objc_msgSend(v5, "removeObjectAtIndex:", objc_msgSend(*(id *)(a1 + 32), "presentationPageIndex"));
}

void __60__ICDocCamExtractedDocumentViewController_deleteCurrentPage__block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) thumbnailCollectionViewLayout];
  [v2 invalidateLayout];

  char v3 = [*(id *)(a1 + 32) documentInfoCollection];
  uint64_t v4 = [v3 docInfos];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    unint64_t v6 = [*(id *)(a1 + 32) presentationPageIndex];
    uint64_t v7 = [*(id *)(a1 + 32) documentInfoCollection];
    unint64_t v8 = [v7 docInfos];
    unint64_t v9 = [v8 count] - 1;

    if (v6 >= v9) {
      unint64_t v10 = v9;
    }
    else {
      unint64_t v10 = v6;
    }
    uint64_t v11 = *(void **)(a1 + 32);
    [v11 setCurrentThumbnailItem:v10 animated:1];
  }
}

uint64_t __60__ICDocCamExtractedDocumentViewController_deleteCurrentPage__block_invoke_4(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _isInterfaceAutorotationDisabled]) {
    [*(id *)(a1 + 32) _endDisablingInterfaceAutorotation];
  }
  id v2 = [*(id *)(a1 + 32) trashButtonItem];
  [v2 setEnabled:1];

  char v3 = [*(id *)(a1 + 32) trashButtonItemForNavBar];
  [v3 setEnabled:1];

  uint64_t v4 = [*(id *)(a1 + 32) retakeButtonItem];
  [v4 setEnabled:1];

  uint64_t v5 = *(void **)(a1 + 32);

  return [v5 doneAction:0];
}

void __60__ICDocCamExtractedDocumentViewController_deleteCurrentPage__block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) _endDisablingInterfaceAutorotation];
  id v2 = [*(id *)(a1 + 32) trashButtonItem];
  [v2 setEnabled:1];

  char v3 = [*(id *)(a1 + 32) trashButtonItemForNavBar];
  [v3 setEnabled:1];

  id v4 = [*(id *)(a1 + 32) retakeButtonItem];
  [v4 setEnabled:1];
}

- (void)showViewControllerAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v16[1] = *MEMORY[0x263EF8340];
  -[ICDocCamExtractedDocumentViewController setPresentationPageIndex:](self, "setPresentationPageIndex:");
  uint64_t v7 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
  unint64_t v8 = [v7 docInfos];
  unint64_t v9 = [v8 count];

  if (v9 > a3)
  {
    objc_initWeak(&location, self);
    unint64_t v10 = [(ICDocCamExtractedDocumentViewController *)self viewControllerAtIndex:a3];
    uint64_t v11 = [(ICDocCamExtractedDocumentViewController *)self pageViewController];
    v16[0] = v10;
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __78__ICDocCamExtractedDocumentViewController_showViewControllerAtIndex_animated___block_invoke;
    v13[3] = &unk_2642A9400;
    objc_copyWeak(v14, &location);
    v14[1] = (id)a3;
    [v11 setViewControllers:v12 direction:0 animated:v4 completion:v13];

    [(ICDocCamExtractedDocumentViewController *)self updateImageViewAccessibilityForPageContentViewController:v10];
    objc_destroyWeak(v14);

    objc_destroyWeak(&location);
  }
}

void __78__ICDocCamExtractedDocumentViewController_showViewControllerAtIndex_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updatePageIndicatorForPageIndex:*(void *)(a1 + 40)];
}

- (void)startMarkupViewController
{
  char v3 = [(ICDocCamExtractedDocumentViewController *)self currentDocument];
  objc_initWeak(&location, self);
  [(ICDocCamExtractedDocumentViewController *)self setAdjustPageViewControllerForMarkup:1];
  if (v3)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __68__ICDocCamExtractedDocumentViewController_startMarkupViewController__block_invoke;
    v8[3] = &unk_2642A9428;
    v8[4] = self;
    BOOL v4 = (void *)MEMORY[0x21D44FA30](v8);
    uint64_t v5 = [(ICDocCamExtractedDocumentViewController *)self delegate];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    void v6[2] = __68__ICDocCamExtractedDocumentViewController_startMarkupViewController__block_invoke_4;
    v6[3] = &unk_2642A9450;
    objc_copyWeak(&v7, &location);
    [v5 extractedDocumentController:self startMarkupOnDocument:v3 inkStyle:1 startPresentBlock:v4 dismissCompletionBlock:v6];

    objc_destroyWeak(&v7);
  }
  objc_destroyWeak(&location);
}

void __68__ICDocCamExtractedDocumentViewController_startMarkupViewController__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __68__ICDocCamExtractedDocumentViewController_startMarkupViewController__block_invoke_2;
  v8[3] = &unk_2642A9250;
  v8[4] = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __68__ICDocCamExtractedDocumentViewController_startMarkupViewController__block_invoke_3;
  v6[3] = &unk_2642A9310;
  void v6[4] = v4;
  id v7 = v3;
  id v5 = v3;
  [v4 updatePageViewControllerConstraints:1 animationBlock:v8 completionBlock:v6];
}

void __68__ICDocCamExtractedDocumentViewController_startMarkupViewController__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) currentPageContentViewController];
  [v1 resetZoom];
}

uint64_t __68__ICDocCamExtractedDocumentViewController_startMarkupViewController__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) updateLayout];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void __68__ICDocCamExtractedDocumentViewController_startMarkupViewController__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained didDismissMarkupViewController];
}

- (void)didDismissMarkupViewController
{
  [(ICDocCamExtractedDocumentViewController *)self setAdjustPageViewControllerForMarkup:0];

  [(ICDocCamExtractedDocumentViewController *)self updatePageViewControllerConstraints:1 animationBlock:0 completionBlock:0];
}

- (void)deselectFilterButtons
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(ICDocCamExtractedDocumentViewController *)self filterButtonItem];
  v14[0] = v3;
  BOOL v4 = [(ICDocCamExtractedDocumentViewController *)self filterButtonItemForNavBar];
  v14[1] = v4;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setSelected:0];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)selectFilterButtons
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(ICDocCamExtractedDocumentViewController *)self filterButtonItem];
  v14[0] = v3;
  BOOL v4 = [(ICDocCamExtractedDocumentViewController *)self filterButtonItemForNavBar];
  v14[1] = v4;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setSelected:1];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (id)truncatedString:(id)a3 clipLength:(unint64_t)a4
{
  id v5 = a3;
  if ([v5 length] <= a4)
  {
    id v8 = v5;
  }
  else
  {
    uint64_t v6 = NSString;
    uint64_t v7 = [v5 substringToIndex:a4];
    id v8 = [v6 stringWithFormat:@"%@…", v7];
  }

  return v8;
}

- (void)pencilDownInZoomablePageContentViewController:(id)a3
{
  if ([(ICDocCamExtractedDocumentViewController *)self isShowingBarsForZoomablePageContentViewController:a3])
  {
    BOOL v4 = [(ICDocCamExtractedDocumentViewController *)self currentDocument];
    if (v4)
    {
      id v7 = v4;
      id v5 = [(ICDocCamExtractedDocumentViewController *)self delegate];
      char v6 = objc_opt_respondsToSelector();

      BOOL v4 = v7;
      if (v6)
      {
        [(ICDocCamExtractedDocumentViewController *)self startMarkupViewController];
        BOOL v4 = v7;
      }
    }
  }
}

- (void)hideBarsForZoomablePageContentViewController:(id)a3
{
  id v4 = a3;
  if (![(ICDocCamExtractedDocumentViewController *)self barsShouldBeHidden])
  {
    id v5 = [(ICDocCamExtractedDocumentViewController *)self filterViewController];

    if (!v5)
    {
      [(ICDocCamExtractedDocumentViewController *)self setBarsShouldBeHidden:1];
      char v6 = [(ICDocCamExtractedDocumentViewController *)self currentBackgroundColor];
      id v7 = [(ICDocCamExtractedDocumentViewController *)self pageViewControllerContainerView];
      [v7 setBackgroundColor:v6];

      id v8 = (void *)MEMORY[0x263F1CB60];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __88__ICDocCamExtractedDocumentViewController_hideBarsForZoomablePageContentViewController___block_invoke;
      v10[3] = &unk_2642A9360;
      void v10[4] = self;
      id v11 = v4;
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __88__ICDocCamExtractedDocumentViewController_hideBarsForZoomablePageContentViewController___block_invoke_2;
      v9[3] = &unk_2642A92E8;
      v9[4] = self;
      [v8 animateWithDuration:v10 animations:v9 completion:0.2];
    }
  }
}

void __88__ICDocCamExtractedDocumentViewController_hideBarsForZoomablePageContentViewController___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsStatusBarAppearanceUpdate];
  id v2 = [*(id *)(a1 + 32) currentBackgroundColor];
  id v3 = [*(id *)(a1 + 40) view];
  [v3 setBackgroundColor:v2];

  id v4 = [*(id *)(a1 + 32) bottomToolbar];
  [v4 setAlpha:0.0];

  id v5 = [*(id *)(a1 + 32) topToolbar];
  [v5 setAlpha:0.0];

  char v6 = [*(id *)(a1 + 32) navigationController];
  id v7 = [v6 navigationBar];
  [v7 setAlpha:0.0];

  id v9 = [*(id *)(a1 + 32) pageViewController];
  id v8 = [v9 view];
  [v8 setAccessibilityViewIsModal:1];
}

void __88__ICDocCamExtractedDocumentViewController_hideBarsForZoomablePageContentViewController___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  [v2 setNavigationBarHidden:1 animated:0];

  LODWORD(v2) = *MEMORY[0x263F1CE18];
  id v4 = [*(id *)(a1 + 32) pageViewController];
  id v3 = [v4 view];
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v2, v3);
}

- (void)showBarsForZoomablePageContentViewController:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ICDocCamExtractedDocumentViewController *)self barsShouldBeHidden];
  if (v4 && v5)
  {
    [(ICDocCamExtractedDocumentViewController *)self setBarsShouldBeHidden:0];
    char v6 = [(ICDocCamExtractedDocumentViewController *)self currentBackgroundColor];
    id v7 = [(ICDocCamExtractedDocumentViewController *)self pageViewControllerContainerView];
    [v7 setBackgroundColor:v6];

    id v8 = [(ICDocCamExtractedDocumentViewController *)self navigationController];
    [v8 setNavigationBarHidden:0 animated:0];

    id v9 = [(ICDocCamExtractedDocumentViewController *)self navigationController];
    long long v10 = [v9 navigationBar];
    [v10 setAlpha:0.0];

    id v11 = [(ICDocCamExtractedDocumentViewController *)self pageViewController];
    long long v12 = [v11 view];
    [v12 setAccessibilityViewIsModal:0];

    long long v13 = (void *)MEMORY[0x263F1CB60];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    void v14[2] = __88__ICDocCamExtractedDocumentViewController_showBarsForZoomablePageContentViewController___block_invoke;
    v14[3] = &unk_2642A9360;
    v14[4] = self;
    id v15 = v4;
    [v13 animateWithDuration:v14 animations:0.2];
  }
}

void __88__ICDocCamExtractedDocumentViewController_showBarsForZoomablePageContentViewController___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsStatusBarAppearanceUpdate];
  id v2 = [*(id *)(a1 + 32) currentBackgroundColor];
  id v3 = [*(id *)(a1 + 40) view];
  [v3 setBackgroundColor:v2];

  id v4 = [*(id *)(a1 + 32) bottomToolbar];
  [v4 setAlpha:1.0];

  BOOL v5 = [*(id *)(a1 + 32) topToolbar];
  [v5 setAlpha:1.0];

  char v6 = [*(id *)(a1 + 32) navigationController];
  id v7 = [v6 navigationBar];
  [v7 setAlpha:1.0];

  LODWORD(v6) = *MEMORY[0x263F1CE18];
  id v9 = [*(id *)(a1 + 32) pageViewController];
  id v8 = [v9 view];
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v6, v8);
}

- (void)switchBarVisibilityForZoomablePageContentViewController:(id)a3
{
  id v5 = a3;
  id v4 = [(ICDocCamExtractedDocumentViewController *)self filterViewController];

  if (!v4)
  {
    if ([(ICDocCamExtractedDocumentViewController *)self barsShouldBeHidden]) {
      [(ICDocCamExtractedDocumentViewController *)self showBarsForZoomablePageContentViewController:v5];
    }
    else {
      [(ICDocCamExtractedDocumentViewController *)self hideBarsForZoomablePageContentViewController:v5];
    }
  }
}

- (BOOL)isShowingBarsForZoomablePageContentViewController:(id)a3
{
  return ![(ICDocCamExtractedDocumentViewController *)self barsShouldBeHidden];
}

- (id)currentBackgroundColor
{
  if (DCDebugInterfaceEnabled())
  {
    id v3 = 0;
  }
  else
  {
    if ([(ICDocCamExtractedDocumentViewController *)self barsShouldBeHidden]) {
      [MEMORY[0x263F1C550] blackColor];
    }
    else {
    id v3 = [MEMORY[0x263F1C550] DCExtractedDocumentViewControllerBackgroundColor];
    }
  }

  return v3;
}

- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "pageIndex", a3);
  char v6 = 0;
  if (v5 && v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    char v6 = [(ICDocCamExtractedDocumentViewController *)self viewControllerAtIndex:v5 - 1];
  }

  return v6;
}

- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "pageIndex", a3);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_3;
  }
  uint64_t v6 = v5 + 1;
  id v7 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
  id v8 = [v7 docInfos];
  uint64_t v9 = [v8 count];

  if (v6 == v9)
  {
LABEL_3:
    long long v10 = 0;
  }
  else
  {
    long long v10 = [(ICDocCamExtractedDocumentViewController *)self viewControllerAtIndex:v6];
  }

  return v10;
}

- (void)setIsScrollingBetweenPages:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isScrollingBetweenPages = a3;
  id v4 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionViewLayout];
  [v4 setIsScrollingBetweenPages:v3];
}

- (BOOL)isPageViewControllerScrolled
{
  if ([(ICDocCamExtractedDocumentViewController *)self isScrollingBetweenPages]) {
    return 1;
  }
  [(ICDocCamExtractedDocumentViewController *)self normalizedPageViewControllerScrollPosition];
  return v4 != 0.0;
}

- (BOOL)shouldDisableActions
{
  if ([(ICDocCamExtractedDocumentViewController *)self isPageViewControllerScrolled]) {
    return 1;
  }
  double v4 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionViewLayout];
  char v5 = [v4 movingItem];

  return v5;
}

- (BOOL)shouldDisableSharrow
{
  id v2 = [(ICDocCamExtractedDocumentViewController *)self navigationController];
  BOOL v3 = [v2 view];
  char v4 = objc_msgSend(v3, "dc_isInSecureWindow");

  return v4;
}

- (double)normalizedPageViewControllerScrollPosition
{
  BOOL v3 = [(ICDocCamExtractedDocumentViewController *)self pageViewController];
  char v4 = [v3 view];
  [v4 bounds];
  double v6 = v5 + 16.0;

  id v7 = [(ICDocCamExtractedDocumentViewController *)self pageViewControllerScrollView];
  [v7 contentOffset];
  double v9 = v8 - v6;

  long long v10 = [(ICDocCamExtractedDocumentViewController *)self pageViewController];
  id v11 = [v10 view];
  [v11 bounds];
  double v13 = v9 / (v12 + 16.0);

  return v13;
}

- (id)viewControllerAtIndex:(unint64_t)a3
{
  double v5 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
  double v6 = [v5 docInfos];
  if (![v6 count])
  {
    long long v10 = 0;
    goto LABEL_5;
  }
  id v7 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
  double v8 = [v7 docInfos];
  unint64_t v9 = [v8 count];

  if (v9 > a3)
  {
    long long v10 = objc_alloc_init(ICDocCamZoomablePageContentViewController);
    id v11 = [(ICDocCamExtractedDocumentViewController *)self croppedAndFilteredmageForDocumentAtIndex:a3];
    [(ICDocCamZoomablePageContentViewController *)v10 setImage:v11];

    [(ICDocCamZoomablePageContentViewController *)v10 setPageIndex:a3];
    [(ICDocCamZoomablePageContentViewController *)v10 setPageContentDelegate:self];
    double v5 = [(ICDocCamExtractedDocumentViewController *)self currentBackgroundColor];
    double v6 = [(ICDocCamZoomablePageContentViewController *)v10 view];
    [v6 setBackgroundColor:v5];
LABEL_5:

    goto LABEL_7;
  }
  long long v10 = 0;
LABEL_7:

  return v10;
}

- (void)pageViewController:(id)a3 willTransitionToViewControllers:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        id v11 = [(ICDocCamExtractedDocumentViewController *)self currentBackgroundColor];
        double v12 = [v10 view];
        [v12 setBackgroundColor:v11];

        double v13 = -[ICDocCamExtractedDocumentViewController croppedAndFilteredmageForDocumentAtIndex:](self, "croppedAndFilteredmageForDocumentAtIndex:", [v10 pageIndex]);
        [v10 setImage:v13];

        [v10 resetZoom];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  [(ICDocCamExtractedDocumentViewController *)self setIsScrollingBetweenPages:1];
}

- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6
{
  BOOL v6 = a6;
  id v18 = a5;
  if (v6)
  {
    uint64_t v8 = [(ICDocCamExtractedDocumentViewController *)self pageViewController];
    uint64_t v9 = [v8 viewControllers];
    long long v10 = [v9 lastObject];

    -[ICDocCamExtractedDocumentViewController setPresentationPageIndex:](self, "setPresentationPageIndex:", [v10 pageIndex]);
    [(ICDocCamExtractedDocumentViewController *)self updatePageIndicatorForPageIndex:[(ICDocCamExtractedDocumentViewController *)self presentationPageIndex]];
    id v11 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionViewLayout];
    [v11 setInterPageScrollPosition:0.0];

    double v12 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionViewLayout];
    objc_msgSend(v12, "setCurrentItem:animated:", -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex"), 0);

    [(ICDocCamExtractedDocumentViewController *)self updateImageViewAccessibilityForPageContentViewController:v10];
    LODWORD(v12) = *MEMORY[0x263F1CDC8];
    double v13 = [v10 imageView];
    long long v14 = [v13 accessibilityLabel];
    UIAccessibilityPostNotification((UIAccessibilityNotifications)v12, v14);

    if ([v18 count])
    {
      uint64_t v15 = objc_opt_class();
      long long v16 = [v18 firstObject];
      long long v17 = DCCheckedDynamicCast(v15, (uint64_t)v16);

      [v17 resetZoom];
    }
  }
  [(ICDocCamExtractedDocumentViewController *)self setIsScrollingBetweenPages:0];
}

- (void)setPresentationPageIndex:(int64_t)a3
{
  id v5 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
  BOOL v6 = [v5 docInfos];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    uint64_t v8 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
    uint64_t v9 = [v8 docInfos];
    unint64_t v10 = [v9 count] - 1;

    if (v10 >= a3) {
      int64_t v11 = a3;
    }
    else {
      int64_t v11 = v10;
    }
  }
  else
  {
    int64_t v11 = 0;
  }
  self->_presentationPageIndedouble x = v11;
}

- (void)setCurrentThumbnailItem:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
  uint64_t v8 = [v7 docInfos];
  unint64_t v9 = [v8 count];

  if (v9 > a3)
  {
    id v10 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionViewLayout];
    [v10 setCurrentItem:a3 animated:v4];
  }
}

- (void)updatePageIndicatorForPageIndex:(int64_t)a3
{
  id v5 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
  BOOL v6 = [v5 docInfos];
  unint64_t v7 = [v6 count];

  if (v7 < 2)
  {
    id v25 = &stru_26C7D5180;
    goto LABEL_10;
  }
  if ((unint64_t)([(UIViewController *)self dc_effectiveInterfaceOrientation]
                        - 3) > 1)
    goto LABEL_8;
  uint64_t v8 = [(ICDocCamExtractedDocumentViewController *)self view];
  unint64_t v9 = [v8 window];
  if ((objc_msgSend(v9, "dc_requiresCompactLandscapeIcons") & 1) == 0)
  {

    goto LABEL_8;
  }
  int v10 = [(ICDocCamExtractedDocumentViewController *)self mode];

  if (!v10)
  {
LABEL_8:
    int64_t v11 = NSString;
    double v12 = @"%d of %d";
    goto LABEL_9;
  }
  int64_t v11 = NSString;
  double v12 = @"(%d of %d)";
LABEL_9:
  double v13 = +[DCLocalization localizedStringForKey:v12 value:v12 table:@"Localizable"];
  long long v14 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
  uint64_t v15 = [v14 docInfos];
  objc_msgSend(v11, "localizedStringWithFormat:", v13, a3 + 1, objc_msgSend(v15, "count"));
  id v25 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  long long v16 = [(ICDocCamExtractedDocumentViewController *)self pageIndexLabel];
  [v16 setText:v25];

  [(ICDocCamExtractedDocumentViewController *)self updateTitleView];
  long long v17 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
  id v18 = [v17 docInfos];
  unint64_t v19 = [v18 count];

  if (v19 > a3)
  {
    uint64_t v20 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
    char v21 = [v20 docInfos];
    id v22 = [v21 objectAtIndexedSubscript:a3];
    uint64_t v23 = [v22 currentFilter];
    double v24 = [(ICDocCamExtractedDocumentViewController *)self filterViewController];
    [v24 setCurrentFilterType:v23];
  }
}

- (void)changePage:(int64_t)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v5 = [(ICDocCamExtractedDocumentViewController *)self pageViewController];
  BOOL v6 = [v5 viewControllers];
  unint64_t v7 = [v6 objectAtIndex:0];
  uint64_t v8 = [v7 pageIndex];

  if (a3) {
    uint64_t v9 = v8 - 1;
  }
  else {
    uint64_t v9 = v8 + 1;
  }
  int v10 = [(ICDocCamExtractedDocumentViewController *)self viewControllerAtIndex:v9];
  if (v10)
  {
    int64_t v11 = [(ICDocCamExtractedDocumentViewController *)self pageViewController];
    v13[0] = v10;
    double v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    [v11 setViewControllers:v12 direction:a3 animated:0 completion:0];
  }
}

- (id)imageForDocInfo:(id)a3 newFilter:(signed __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  uint64_t v31 = 0;
  dispatch_time_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  id v34 = __Block_byref_object_copy_;
  uint64_t v35 = __Block_byref_object_dispose_;
  id v36 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  unint64_t v28 = __Block_byref_object_copy_;
  int v29 = __Block_byref_object_dispose_;
  id v30 = 0;
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  unint64_t v19 = __69__ICDocCamExtractedDocumentViewController_imageForDocInfo_newFilter___block_invoke;
  uint64_t v20 = &unk_2642A9478;
  uint64_t v23 = &v31;
  char v21 = self;
  id v7 = v6;
  id v22 = v7;
  double v24 = &v25;
  dc_performBlockOnMainThread(&v17);
  uint64_t v8 = v32;
  id v9 = (id)v32[5];
  uint64_t v10 = v8[5];
  if (v10)
  {
    int64_t v11 = +[ICDocCamImageFilters filteredImage:orientation:imageFilterType:](ICDocCamImageFilters, "filteredImage:orientation:imageFilterType:", v10, objc_msgSend(v7, "currentOrientation", v17, v18, v19, v20, v21), v4);

    if (v26[5])
    {
      double v12 = +[ICDocCamImageFilters imageWithRGBColorspaceFromImage:v11];

      double v13 = objc_msgSend(v12, "dc_JPEGData");
      long long v14 = (void *)MEMORY[0x263F1C6B0];
      uint64_t v15 = +[DCMarkupUtilities imageDataWithMarkupModelData:v26[5] sourceImageData:v13];
      id v9 = [v14 imageWithData:v15];
    }
    else
    {
      id v9 = v11;
    }
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v9;
}

void __69__ICDocCamExtractedDocumentViewController_imageForDocInfo_newFilter___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) croppedButNotFilteredImageForDocInfo:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = [*(id *)(a1 + 32) delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v10 = [*(id *)(a1 + 32) delegate];
    uint64_t v7 = [v10 extractedDocumentControllerMarkupModelDataForDocument:*(void *)(a1 + 40)];
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

- (BOOL)filterViewControllerDidSelectFilter:(signed __int16)a3
{
  uint64_t v3 = a3;
  if ([(ICDocCamExtractedDocumentViewController *)self shouldDisableActions]) {
    return 0;
  }
  unint64_t v6 = [(ICDocCamExtractedDocumentViewController *)self presentationPageIndex];
  uint64_t v7 = [(ICDocCamExtractedDocumentViewController *)self croppedButNotFilteredImageForDocumentAtIndex:v6];
  uint64_t v8 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
  id v9 = [v8 docInfos];
  if (v6 >= [v9 count])
  {
    double v12 = 0;
  }
  else
  {
    id v10 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
    int64_t v11 = [v10 docInfos];
    double v12 = [v11 objectAtIndexedSubscript:v6];
  }
  BOOL v5 = 0;
  if (v7 && v12)
  {
    if ([v12 currentFilter] == v3)
    {
      BOOL v5 = 0;
    }
    else
    {
      double v13 = [(ICDocCamExtractedDocumentViewController *)self imageForDocInfo:v12 newFilter:v3];
      [(ICDocCamExtractedDocumentViewController *)self updateImage:v13 document:v12 withFilterType:v3];
      long long v14 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
      [v14 bumpModificationDate];

      BOOL v5 = 1;
    }
  }

  return v5;
}

- (BOOL)filterViewControllerCanApplyToAll:(signed __int16)a3
{
  if ([(ICDocCamExtractedDocumentViewController *)self shouldDisableActions]) {
    return 0;
  }
  BOOL v5 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
  unint64_t v6 = [v5 docInfos];
  unint64_t v7 = [v6 count];

  if (v7 < 2) {
    return 0;
  }
  id v9 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
  id v10 = [v9 docInfos];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = __77__ICDocCamExtractedDocumentViewController_filterViewControllerCanApplyToAll___block_invoke;
  v12[3] = &__block_descriptor_34_e37_B32__0__ICDocCamDocumentInfo_8Q16_B24l;
  signed __int16 v13 = a3;
  BOOL v8 = [v10 indexOfObjectPassingTest:v12] != 0x7FFFFFFFFFFFFFFFLL;

  return v8;
}

BOOL __77__ICDocCamExtractedDocumentViewController_filterViewControllerCanApplyToAll___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  BOOL result = *(unsigned __int16 *)(a1 + 32) != (unsigned __int16)[a2 currentFilter];
  *a4 = result;
  return result;
}

- (BOOL)filterViewControllerApplyToAll:(signed __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v29 = *MEMORY[0x263EF8340];
  if ([(ICDocCamExtractedDocumentViewController *)self shouldDisableActions])
  {
    return 0;
  }
  else
  {
    BOOL v5 = [(ICDocCamExtractedDocumentViewController *)self filterViewControllerDidSelectFilter:v3];
    if ([(ICDocCamExtractedDocumentViewController *)self mode])
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      unint64_t v6 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
      unint64_t v7 = [v6 docInfos];

      uint64_t v8 = [(DCLongRunningTaskController *)v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v23 != v10) {
              objc_enumerationMutation(v7);
            }
            double v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            if ([v12 currentFilter] != v3)
            {
              signed __int16 v13 = v7;
              long long v14 = [(ICDocCamExtractedDocumentViewController *)self delegate];
              char v15 = objc_opt_respondsToSelector();

              if (v15)
              {
                [v12 setCurrentFilter:v3];
                long long v16 = [(ICDocCamExtractedDocumentViewController *)self delegate];
                [v16 extractedDocumentControllerDidApplyFilter:v3 forDocument:v12];

                BOOL v5 = 1;
              }
              uint64_t v17 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
              [v17 bumpModificationDate];

              unint64_t v7 = v13;
            }
          }
          uint64_t v9 = [(DCLongRunningTaskController *)v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
        }
        while (v9);
      }
    }
    else
    {
      uint64_t v18 = [DCLongRunningTaskController alloc];
      unint64_t v19 = [(ICDocCamExtractedDocumentViewController *)self view];
      uint64_t v20 = [v19 window];
      unint64_t v7 = [(DCLongRunningTaskController *)v18 initWithWindow:v20 intervalBeforeOpeningProgressDialog:0.5];

      [(DCLongRunningTaskController *)v7 setProgressToStringTransformer:&__block_literal_global_567];
      [(DCLongRunningTaskController *)v7 setViewControllerToPresentFrom:self];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      void v26[2] = __74__ICDocCamExtractedDocumentViewController_filterViewControllerApplyToAll___block_invoke_2;
      v26[3] = &unk_2642A9508;
      v26[4] = self;
      __int16 v27 = v3;
      [(DCLongRunningTaskController *)v7 startTask:v26 completionBlock:0];
    }
  }
  return v5;
}

id __74__ICDocCamExtractedDocumentViewController_filterViewControllerApplyToAll___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v5 = NSString;
  unint64_t v6 = +[DCLocalization localizedStringForKey:@"Apply Filter to Scan %lu of %lu" value:@"Apply Filter to Scan %lu of %lu" table:@"Localizable"];
  unint64_t v7 = objc_msgSend(v5, "localizedStringWithFormat:", v6, a2, a3);

  return v7;
}

void __74__ICDocCamExtractedDocumentViewController_filterViewControllerApplyToAll___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v27 = a2;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v3 = [*(id *)(a1 + 32) documentInfoCollection];
  uint64_t v4 = [v3 docInfos];
  BOOL v5 = (void *)[v4 copy];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v36;
    uint64_t v9 = 1;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(v5);
        }
        if (*(unsigned __int16 *)(a1 + 40) != (unsigned __int16)[*(id *)(*((void *)&v35 + 1) + 8 * i) currentFilter])++v9; {
      }
        }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v9 = 1;
  }

  [v27 setTotalUnitCount:v9];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  int64_t v11 = [*(id *)(a1 + 32) documentInfoCollection];
  double v12 = [v11 docInfos];
  signed __int16 v13 = (void *)[v12 copy];

  uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v32;
    uint64_t v17 = 1;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v32 != v16) {
          objc_enumerationMutation(v13);
        }
        unint64_t v19 = *(void **)(*((void *)&v31 + 1) + 8 * j);
        uint64_t v20 = (void *)MEMORY[0x21D44F7D0]();
        unsigned __int16 v21 = [v19 currentFilter];
        int v22 = *(unsigned __int16 *)(a1 + 40);
        if (v22 != v21)
        {
          long long v23 = [*(id *)(a1 + 32) imageForDocInfo:v19 newFilter:(__int16)v22];
          long long v24 = v23;
          if (v23)
          {
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __74__ICDocCamExtractedDocumentViewController_filterViewControllerApplyToAll___block_invoke_3;
            block[3] = &unk_2642A94E0;
            __int16 v30 = *(_WORD *)(a1 + 40);
            uint64_t v25 = *(void *)(a1 + 32);
            block[4] = v19;
            void block[5] = v25;
            id v29 = v23;
            dispatch_async(MEMORY[0x263EF83A0], block);
          }
          [v27 setCompletedUnitCount:++v17];
          uint64_t v26 = [*(id *)(a1 + 32) documentInfoCollection];
          [v26 bumpModificationDate];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v15);
  }
}

void __74__ICDocCamExtractedDocumentViewController_filterViewControllerApplyToAll___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) croppedAndFilteredImageUUID];

  if (v2)
  {
    [*(id *)(a1 + 32) setCurrentFilter:*(__int16 *)(a1 + 56)];
    uint64_t v3 = [*(id *)(a1 + 40) imageCache];
    uint64_t v4 = *(void *)(a1 + 48);
    BOOL v5 = [*(id *)(a1 + 32) metaData];
    uint64_t v6 = [*(id *)(a1 + 32) croppedAndFilteredImageUUID];
    [v3 replaceImage:v4 metaData:v5 uuid:v6];

    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(a1 + 40);
    [v7 didUpdateDocumentImage:v8];
  }
}

- (void)showPrimaryControllerForNotes:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 displayMode] == 1)
  {
    uint64_t v7 = [MEMORY[0x263F1C408] sharedApplication];
    uint64_t v8 = [v7 applicationState];

    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __82__ICDocCamExtractedDocumentViewController_showPrimaryControllerForNotes_animated___block_invoke;
    v15[3] = &unk_2642A9360;
    v15[4] = self;
    id v16 = v6;
    uint64_t v9 = (void (**)(void))MEMORY[0x21D44FA30](v15);
    uint64_t v10 = v9;
    if (v8) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = !v4;
    }
    if (v11)
    {
      v9[2](v9);
    }
    else
    {
      double v12 = (void *)MEMORY[0x263F1CB60];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      void v13[2] = __82__ICDocCamExtractedDocumentViewController_showPrimaryControllerForNotes_animated___block_invoke_2;
      v13[3] = &unk_2642A9530;
      uint64_t v14 = v9;
      [v12 animateWithDuration:v13 animations:0.2];
    }
  }
}

void __82__ICDocCamExtractedDocumentViewController_showPrimaryControllerForNotes_animated___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) traitCollection];
  uint64_t v3 = [v2 horizontalSizeClass];

  if (v3 == 2)
  {
    BOOL v4 = [*(id *)(a1 + 32) view];
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;

    uint64_t v9 = *(void **)(a1 + 40);
    if (v6 >= v8) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = 3;
    }
    [v9 setPreferredDisplayMode:v10];
  }
}

uint64_t __82__ICDocCamExtractedDocumentViewController_showPrimaryControllerForNotes_animated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)collectionNameTapped:(id)a3
{
  BOOL v4 = [(ICDocCamExtractedDocumentViewController *)self collectionTitleButton];
  double v5 = [v4 titleForState:0];

  double v6 = [[ICDocCamRenamePrompt alloc] initWithExistingTitle:v5];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__ICDocCamExtractedDocumentViewController_collectionNameTapped___block_invoke;
  v7[3] = &unk_2642A9558;
  v7[4] = self;
  [(ICDocCamRenamePrompt *)v6 showFromViewController:self completion:v7];
}

void __64__ICDocCamExtractedDocumentViewController_collectionNameTapped___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  if (v13)
  {
    uint64_t v3 = [*(id *)(a1 + 32) collectionTitleButton];
    [v3 setTitle:v13 forState:0];

    BOOL v4 = [*(id *)(a1 + 32) delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      double v6 = [*(id *)(a1 + 32) delegate];
      [v6 extractedDocumentControllerDidChangeTitle:v13];
    }
    double v7 = [*(id *)(a1 + 32) documentInfoCollection];
    [v7 bumpModificationDate];
  }
  [*(id *)(a1 + 32) updateTitleView];
  double v8 = [*(id *)(a1 + 32) view];
  uint64_t v9 = [v8 window];

  uint64_t v10 = [v9 rootViewController];
  BOOL v11 = (objc_class *)objc_opt_class();
  double v12 = NSStringFromClass(v11);
  if ([v12 isEqualToString:@"ICSplitViewController"]) {
    [*(id *)(a1 + 32) showPrimaryControllerForNotes:v10 animated:0];
  }
  [*(id *)(a1 + 32) becomeFirstResponder];
}

- (ICDocCamReorderingThumbnailCollectionViewLayout)thumbnailCollectionViewLayout
{
  uint64_t v3 = objc_opt_class();
  BOOL v4 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];
  char v5 = [v4 collectionViewLayout];
  double v6 = DCCheckedDynamicCast(v3, (uint64_t)v5);

  return (ICDocCamReorderingThumbnailCollectionViewLayout *)v6;
}

- (CGSize)collectionView:(id)a3 imageSizeAtIndex:(int64_t)a4
{
  [(ICDocCamExtractedDocumentViewController *)self imageSizeForDocumentAtIndex:a4];
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (CGRect)targetViewRect
{
  uint64_t v2 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (void)respondToImageLongPressGesture:(id)a3
{
  id v4 = a3;
  double v5 = [(ICDocCamExtractedDocumentViewController *)self currentImageView];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  uint64_t v10 = [v4 state];
  if (v10 == 1)
  {
    double v11 = [(ICDocCamExtractedDocumentViewController *)self currentImageView];
    [v11 bounds];
    v23.double x = v7;
    v23.double y = v9;
    BOOL v12 = CGRectContainsPoint(v24, v23);

    if (v12)
    {
      id v21 = [MEMORY[0x263F1C7B0] sharedMenuController];
      double v13 = DCTSDRectWithCenterAndSize(v7, v9, 10.0);
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      uint64_t v20 = [(ICDocCamExtractedDocumentViewController *)self currentImageView];
      objc_msgSend(v21, "showMenuFromView:rect:", v20, v13, v15, v17, v19);

      -[ICDocCamExtractedDocumentViewController setMenuControllerTargetRect:](self, "setMenuControllerTargetRect:", v13, v15, v17, v19);
    }
  }
}

- (void)share:(id)a3
{
  id v14 = [(ICDocCamExtractedDocumentViewController *)self delegate];
  id v4 = [(ICDocCamExtractedDocumentViewController *)self currentDocument];
  [(ICDocCamExtractedDocumentViewController *)self menuControllerTargetRect];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = [(ICDocCamExtractedDocumentViewController *)self currentImageView];
  objc_msgSend(v14, "extractedDocumentControllerDidSelectShareFromMenuForDocument:sourceRect:sourceView:", v4, v13, v6, v8, v10, v12);
}

- (void)copy:(id)a3
{
  id v5 = [(ICDocCamExtractedDocumentViewController *)self delegate];
  id v4 = [(ICDocCamExtractedDocumentViewController *)self currentDocument];
  [v5 extractedDocumentControllerDidSelectCopyFromMenuForDocument:v4];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  double v7 = [(ICDocCamExtractedDocumentViewController *)self currentPageContentViewController];
  double v8 = [v7 analysisInteraction];

  if (([v8 hasActiveTextSelection] & 1) == 0
    && ![(ICDocCamExtractedDocumentViewController *)self shouldDisableActions])
  {
    if (sel_copy_ == a3
      || ![(ICDocCamExtractedDocumentViewController *)self shouldDisableSharrow]
      && sel_share_ == a3)
    {
      double v11 = [(ICDocCamExtractedDocumentViewController *)self delegate];
      char v9 = objc_opt_respondsToSelector();

      goto LABEL_4;
    }
    if (sel_delete_ == a3
      && [(ICDocCamExtractedDocumentViewController *)self canPerformAction:sel_copy_ withSender:v6])
    {
      char v9 = [(ICDocCamExtractedDocumentViewController *)self mode] != 2;
      goto LABEL_4;
    }
  }
  char v9 = 0;
LABEL_4:

  return v9 & 1;
}

- (void)respondToThumbnailLongPressGesture:(id)a3
{
  id v44 = a3;
  id v4 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];
  unint64_t v5 = [v4 numberOfItemsInSection:0];

  if (v5 >= 2 && [(ICDocCamExtractedDocumentViewController *)self mode] == 1)
  {
    id v6 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];
    [v44 locationInView:v6];
    double v8 = v7;
    double v10 = v9;

    double v11 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];
    double v12 = objc_msgSend(v11, "indexPathForItemAtPoint:", v8, v10);

    if (v12)
    {
      double v13 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];
      id v14 = [v13 cellForItemAtIndexPath:v12];
    }
    else
    {
      id v14 = 0;
    }
    double v15 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];
    double v16 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:0];
    double v17 = [v15 cellForItemAtIndexPath:v16];

    if (v17)
    {
      [v17 frame];
      double v18 = CGRectGetMinX(v46) + -24.0;
      if (v8 < v18) {
        double v8 = v18;
      }
    }
    double v19 = fmax(v8, 0.0);
    uint64_t v20 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];
    [v20 contentOffset];
    double v22 = v21;

    CGPoint v23 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];
    [v23 frame];
    double v25 = v22 + v24;

    uint64_t v26 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];
    unint64_t v27 = v5 - 1;
    unint64_t v28 = [MEMORY[0x263F088C8] indexPathForItem:v5 - 1 inSection:0];
    id v29 = [v26 cellForItemAtIndexPath:v28];

    if (v29)
    {
      [v29 frame];
      double v30 = CGRectGetMaxX(v47) + 24.0;
      if (v19 >= v30) {
        double v19 = v30;
      }
    }
    if (v19 < v25) {
      double v25 = v19;
    }
    uint64_t v31 = [v44 state];
    switch(v31)
    {
      case 3:
        long long v34 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];
        [v34 endInteractiveMovement];
        break;
      case 2:
        long long v35 = [(ICDocCamExtractedDocumentViewController *)self movingIndexPath];
        if ([v35 item]
          || ([(ICDocCamExtractedDocumentViewController *)self movingXPosition], v25 >= v36))
        {
          long long v38 = [(ICDocCamExtractedDocumentViewController *)self movingIndexPath];
          if ([v38 item] == v27)
          {
            [(ICDocCamExtractedDocumentViewController *)self movingXPosition];
            double v40 = v39;

            if (v25 > v40) {
              goto LABEL_30;
            }
          }
          else
          {
          }
          [(ICDocCamExtractedDocumentViewController *)self movingYPosition];
          double v42 = v41;
          uint64_t v43 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];
          objc_msgSend(v43, "updateInteractiveMovementTargetPosition:", v25, v42);

          [(ICDocCamExtractedDocumentViewController *)self speakAccessibilityAnnouncementForReorderIfNecessaryForProposedIndexPath:v12];
        }
        else
        {
        }
LABEL_30:

        goto LABEL_31;
      case 1:
        if (v12)
        {
          [v14 frame];
          [(ICDocCamExtractedDocumentViewController *)self setMovingYPosition:CGRectGetMidY(v48)];
          [(ICDocCamExtractedDocumentViewController *)self setMovingXPosition:v25];
          [(ICDocCamExtractedDocumentViewController *)self setMovingIndexPath:v12];
          long long v32 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionViewLayout];
          [v32 setMovingItem:1];

          long long v33 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];
          [v33 beginInteractiveMovementForItemAtIndexPath:v12];

          -[ICDocCamExtractedDocumentViewController setLastAXProposedIndexForReordering:](self, "setLastAXProposedIndexForReordering:", [v12 item]);
        }
        goto LABEL_30;
      default:
        long long v34 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];
        [v34 cancelInteractiveMovement];
        break;
    }

    long long v37 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionViewLayout];
    [v37 setMovingItem:0];

    [(ICDocCamExtractedDocumentViewController *)self setMovingIndexPath:0];
    [(ICDocCamExtractedDocumentViewController *)self setCurrentThumbnailItem:[(ICDocCamExtractedDocumentViewController *)self presentationPageIndex] animated:1];
    goto LABEL_30;
  }
LABEL_31:
}

- (void)handleAccessibilityLongPressOnCollectionTitle:(id)a3
{
  id v20 = a3;
  if (DCAccessibilityAccessibilityLargerTextSizesEnabled())
  {
    id v4 = [(ICDocCamExtractedDocumentViewController *)self collectionTitleButton];
    unint64_t v5 = [v4 currentTitle];
    id v6 = [(ICDocCamExtractedDocumentViewController *)self truncatedString:v5 clipLength:48];

    double v7 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
    double v8 = [v7 docInfos];
    unint64_t v9 = [v8 count];

    if (v9 > 1)
    {
      double v11 = NSString;
      double v12 = [(ICDocCamExtractedDocumentViewController *)self pageIndexLabel];
      double v13 = [v12 text];
      id v10 = [v11 stringWithFormat:@"%@\n%@", v6, v13];
    }
    else
    {
      id v10 = v6;
    }
    id v14 = [(ICDocCamExtractedDocumentViewController *)self hudItemForAccessibilityLargerText];

    if (!v14)
    {
      id v15 = objc_alloc(MEMORY[0x263F1C3B0]);
      double v16 = objc_msgSend(v15, "initWithTitle:image:imageInsets:", v10, 0, *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));
      [(ICDocCamExtractedDocumentViewController *)self setHudItemForAccessibilityLargerText:v16];
    }
    uint64_t v17 = [v20 state];
    if ((unint64_t)(v17 - 3) >= 2)
    {
      if (v17 == 1)
      {
        double v18 = [(ICDocCamExtractedDocumentViewController *)self hudItemForAccessibilityLargerText];
        [v18 setTitle:v10];

        double v19 = [(ICDocCamExtractedDocumentViewController *)self hudItemForAccessibilityLargerText];
        [(ICDocCamExtractedDocumentViewController *)self _showAccessibilityHUDItem:v19];
      }
    }
    else
    {
      [(ICDocCamExtractedDocumentViewController *)self _dismissAccessibilityHUD];
    }
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (v6
    && ![(ICDocCamExtractedDocumentViewController *)self isPageViewControllerScrolled])
  {
    -[ICDocCamExtractedDocumentViewController setCurrentThumbnailItem:animated:](self, "setCurrentThumbnailItem:animated:", [v6 item], 1);
    -[ICDocCamExtractedDocumentViewController showViewControllerAtIndex:animated:](self, "showViewControllerAtIndex:animated:", [v6 item], 0);
    [(ICDocCamExtractedDocumentViewController *)self updatePageIndicatorForPageIndex:[(ICDocCamExtractedDocumentViewController *)self presentationPageIndex]];
  }
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  -[ICDocCamExtractedDocumentViewController imageSizeForDocumentAtIndex:](self, "imageSizeForDocumentAtIndex:", objc_msgSend(a5, "item", a3, a4));

  -[ICDocCamExtractedDocumentViewController frameSizeForImageSize:](self, "frameSizeForImageSize:");
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v4 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
  unint64_t v5 = [v4 docInfos];
  int64_t v6 = [v5 count];

  return v6;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [v6 dequeueReusableCellWithReuseIdentifier:@"ICDocCamExtractedDocumentThumbnailCell" forIndexPath:v7];
  unint64_t v9 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
  uint64_t v10 = [v9 docInfos];
  if (v10)
  {
    double v11 = (void *)v10;
    double v12 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
    double v13 = [v12 docInfos];
    uint64_t v14 = [v13 count];

    if (v14)
    {
      unint64_t v15 = [v7 item];
      double v16 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
      uint64_t v17 = [v16 docInfos];
      unint64_t v18 = [v17 count] - 1;

      if (v15 <= v18)
      {
        uint64_t v21 = [v7 item];
      }
      else
      {
        double v19 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
        id v20 = [v19 docInfos];
        uint64_t v21 = [v20 count] - 1;
      }
      double v22 = [(ICDocCamExtractedDocumentViewController *)self delegate];
      char v23 = objc_opt_respondsToSelector();

      if (v23)
      {
        [v6 bounds];
        double v25 = v24;
        objc_initWeak(&location, self);
        uint64_t v26 = [(ICDocCamExtractedDocumentViewController *)self delegate];
        unint64_t v27 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
        unint64_t v28 = [v27 docInfos];
        id v29 = [v28 objectAtIndexedSubscript:v21];
        v40[0] = MEMORY[0x263EF8330];
        v40[1] = 3221225472;
        v40[2] = __81__ICDocCamExtractedDocumentViewController_collectionView_cellForItemAtIndexPath___block_invoke;
        v40[3] = &unk_2642A9580;
        objc_copyWeak(&v42, &location);
        id v41 = v8;
        objc_msgSend(v26, "extractedDocumentControllerLoadThumbnailForDocument:size:completionBlock:", v29, v40, v25, v25);

        objc_destroyWeak(&v42);
        objc_destroyWeak(&location);
      }
      else
      {
        double v30 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
        uint64_t v31 = [v30 docInfos];
        long long v32 = [v31 objectAtIndexedSubscript:v21];
        long long v33 = [v32 croppedAndFilteredImageUUID];

        long long v34 = [(ICDocCamExtractedDocumentViewController *)self imageCache];
        long long v35 = [v34 getImage:v33];

        [(ICDocCamExtractedDocumentViewController *)self setImage:v35 forCell:v8 useResizedImage:1];
      }
    }
  }
  else
  {
  }
  if (objc_msgSend(MEMORY[0x263F1C358], "dc_isRTL"))
  {
    CGAffineTransformMakeScale(&v39, -1.0, 1.0);
    double v36 = [v8 contentView];
    CGAffineTransform v38 = v39;
    [v36 setTransform:&v38];
  }

  return v8;
}

void __81__ICDocCamExtractedDocumentViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  double v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setImage:v4 forCell:*(void *)(a1 + 32) useResizedImage:1];
}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 item];
  uint64_t v12 = [v10 item];
  if (v12 == v11) {
    goto LABEL_14;
  }
  int64_t v13 = v12;
  uint64_t v14 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
  unint64_t v15 = [v14 docInfos];
  double v16 = [v15 objectAtIndexedSubscript:v11];

  uint64_t v17 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
  unint64_t v18 = [v17 docInfos];
  [v18 removeObjectAtIndex:v11];

  double v19 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
  id v20 = [v19 docInfos];
  [v20 insertObject:v16 atIndex:v13];

  int64_t v21 = [(ICDocCamExtractedDocumentViewController *)self presentationPageIndex];
  int64_t v22 = v13;
  if (v11 != v21)
  {
    if (v11 < [(ICDocCamExtractedDocumentViewController *)self presentationPageIndex]
      && v13 >= [(ICDocCamExtractedDocumentViewController *)self presentationPageIndex])
    {
      uint64_t v23 = -1;
    }
    else
    {
      if (v11 <= [(ICDocCamExtractedDocumentViewController *)self presentationPageIndex]
        || v13 > [(ICDocCamExtractedDocumentViewController *)self presentationPageIndex])
      {
        goto LABEL_11;
      }
      uint64_t v23 = 1;
    }
    int64_t v22 = [(ICDocCamExtractedDocumentViewController *)self presentationPageIndex] + v23;
  }
  [(ICDocCamExtractedDocumentViewController *)self setPresentationPageIndex:v22];
LABEL_11:
  [(ICDocCamExtractedDocumentViewController *)self showViewControllerAtIndex:[(ICDocCamExtractedDocumentViewController *)self presentationPageIndex] animated:0];
  [(ICDocCamExtractedDocumentViewController *)self setCurrentThumbnailItem:[(ICDocCamExtractedDocumentViewController *)self presentationPageIndex] animated:1];
  double v24 = [(ICDocCamExtractedDocumentViewController *)self delegate];
  char v25 = objc_opt_respondsToSelector();

  if (v25)
  {
    uint64_t v26 = [(ICDocCamExtractedDocumentViewController *)self delegate];
    unint64_t v27 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
    unint64_t v28 = [v27 docInfos];
    id v29 = [v28 objectAtIndexedSubscript:v11];
    [v26 extractedDocumentControllerDidMovePageFromIndex:v11 toIndex:v13 forDocument:v29];
  }
  double v30 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
  [v30 bumpModificationDate];

  objc_initWeak(&location, self);
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __90__ICDocCamExtractedDocumentViewController_collectionView_moveItemAtIndexPath_toIndexPath___block_invoke;
  v31[3] = &unk_2642A95A8;
  objc_copyWeak(&v34, &location);
  id v32 = v9;
  id v33 = v10;
  dc_dispatchMainAfterDelay(v31, 0.5);

  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);
LABEL_14:
}

void __90__ICDocCamExtractedDocumentViewController_collectionView_moveItemAtIndexPath_toIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained speakAccessibilityAnnouncementForMovingItemFromIndexPath:*(void *)(a1 + 32) toIndexPath:*(void *)(a1 + 40)];
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  id v5 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];

  if (v5 == v4)
  {
    id v6 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionViewLayout];
    [v6 setIsScrubbing:1];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v25 = a3;
  id v4 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];
  if (v4 == v25 && ![(ICDocCamExtractedDocumentViewController *)self isScrollingBetweenPages])
  {
    int v11 = [v25 isDragging];

    if (v11)
    {
      uint64_t v12 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];
      [v12 frame];
      double v14 = v13 * 0.5;
      [v25 contentOffset];
      double v16 = v15 + v14;
      uint64_t v17 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];
      [v17 frame];
      double v19 = v18 * 0.5;
      [v25 contentOffset];
      double v21 = v20 + v19;

      int64_t v22 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];
      id v9 = objc_msgSend(v22, "indexPathForItemAtPoint:", v16, v21);

      if (v9)
      {
        uint64_t v23 = [v9 item];
        if (v23 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v24 = v23;
          if (v23 != [(ICDocCamExtractedDocumentViewController *)self presentationPageIndex])
          {
            [(ICDocCamExtractedDocumentViewController *)self showViewControllerAtIndex:v24 animated:0];
            [(ICDocCamExtractedDocumentViewController *)self updatePageIndicatorForPageIndex:v24];
          }
        }
      }
      goto LABEL_9;
    }
  }
  else
  {
  }
  id v5 = [(ICDocCamExtractedDocumentViewController *)self pageViewControllerScrollView];

  id v6 = v25;
  if (v5 == v25)
  {
    BOOL v7 = [(ICDocCamExtractedDocumentViewController *)self isScrollingBetweenPages];
    id v6 = v25;
    if (v7)
    {
      uint64_t v8 = [v25 effectiveUserInterfaceLayoutDirection];
      id v9 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionViewLayout];
      [(ICDocCamExtractedDocumentViewController *)self normalizedPageViewControllerScrollPosition];
      if (v8 == 1) {
        double v10 = -v10;
      }
      [v9 setInterPageScrollPosition:v10];
LABEL_9:

      id v6 = v25;
    }
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v21 = a3;
  id v6 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];

  if (v6 == v21 && !a4)
  {
    BOOL v7 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];
    [v7 frame];
    double v9 = v8 * 0.5;
    [v21 contentOffset];
    double v11 = v10 + v9;
    uint64_t v12 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];
    [v12 frame];
    double v14 = v13 * 0.5;
    [v21 contentOffset];
    double v16 = v15 + v14;

    uint64_t v17 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];
    double v18 = objc_msgSend(v17, "indexPathForItemAtPoint:", v11, v16);

    if (v18)
    {
      uint64_t v19 = [v18 item];
      if (v19 != [(ICDocCamExtractedDocumentViewController *)self presentationPageIndex]
        && !UIAccessibilityIsVoiceOverRunning())
      {
        -[ICDocCamExtractedDocumentViewController showViewControllerAtIndex:animated:](self, "showViewControllerAtIndex:animated:", [v18 item], 1);
        [(ICDocCamExtractedDocumentViewController *)self updatePageIndicatorForPageIndex:[(ICDocCamExtractedDocumentViewController *)self presentationPageIndex]];
      }
    }
    [(ICDocCamExtractedDocumentViewController *)self setCurrentThumbnailItem:[(ICDocCamExtractedDocumentViewController *)self presentationPageIndex] animated:1];
    double v20 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionViewLayout];
    [v20 setIsScrubbing:0];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v20 = a3;
  id v4 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];

  id v5 = v20;
  if (v4 == v20)
  {
    id v6 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];
    [v6 frame];
    double v8 = v7 * 0.5;
    [v20 contentOffset];
    double v10 = v9 + v8;
    double v11 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];
    [v11 frame];
    double v13 = v12 * 0.5;
    [v20 contentOffset];
    double v15 = v14 + v13;

    double v16 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];
    uint64_t v17 = objc_msgSend(v16, "indexPathForItemAtPoint:", v10, v15);

    if (v17)
    {
      uint64_t v18 = [v17 item];
      if (v18 != [(ICDocCamExtractedDocumentViewController *)self presentationPageIndex]
        && !UIAccessibilityIsVoiceOverRunning())
      {
        -[ICDocCamExtractedDocumentViewController showViewControllerAtIndex:animated:](self, "showViewControllerAtIndex:animated:", [v17 item], 0);
        [(ICDocCamExtractedDocumentViewController *)self updatePageIndicatorForPageIndex:[(ICDocCamExtractedDocumentViewController *)self presentationPageIndex]];
      }
    }
    [(ICDocCamExtractedDocumentViewController *)self setCurrentThumbnailItem:[(ICDocCamExtractedDocumentViewController *)self presentationPageIndex] animated:1];
    uint64_t v19 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionViewLayout];
    [v19 setIsScrubbing:0];

    id v5 = v20;
  }
}

- (void)_pageViewControllerDidFinishTransitions:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionViewLayout];
  [v4 invalidateLayout];

  [(ICDocCamExtractedDocumentViewController *)self setIsScrollingBetweenPages:0];
  [(ICDocCamExtractedDocumentViewController *)self setCurrentThumbnailItem:[(ICDocCamExtractedDocumentViewController *)self presentationPageIndex] animated:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [(ICDocCamExtractedDocumentViewController *)self documentsToUpdateWhenScrollingStops];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [(ICDocCamExtractedDocumentViewController *)self updateDocumentImage:*(void *)(*((void *)&v11 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  double v10 = [(ICDocCamExtractedDocumentViewController *)self documentsToUpdateWhenScrollingStops];
  [v10 removeAllObjects];
}

- (void)setupAccessibilityInfo
{
  [(ICDocCamExtractedDocumentViewController *)self updateFilterButtonItemAccessibilityInfo];
  double v3 = +[DCLocalization localizedStringForKey:@"Rotate" value:@"Rotate" table:@"Localizable"];
  id v4 = [(ICDocCamExtractedDocumentViewController *)self rotateButtonItem];
  [v4 setTitle:v3];

  id v5 = [(ICDocCamExtractedDocumentViewController *)self rotateButtonItem];
  uint64_t v6 = [v5 title];
  uint64_t v7 = [(ICDocCamExtractedDocumentViewController *)self rotateButtonItem];
  [v7 setAccessibilityLabel:v6];

  uint64_t v8 = +[DCLocalization localizedStringForKey:@"Double-tap to rotate the scan counter-clockwise." value:@"Double-tap to rotate the scan counter-clockwise." table:@"Localizable"];
  uint64_t v9 = [(ICDocCamExtractedDocumentViewController *)self rotateButtonItem];
  [v9 setAccessibilityHint:v8];

  double v10 = [(ICDocCamExtractedDocumentViewController *)self rotateButtonItem];
  long long v11 = [v10 title];
  long long v12 = [(ICDocCamExtractedDocumentViewController *)self rotateButtonItemForNavBar];
  [v12 setTitle:v11];

  long long v13 = [(ICDocCamExtractedDocumentViewController *)self rotateButtonItem];
  long long v14 = [v13 accessibilityLabel];
  double v15 = [(ICDocCamExtractedDocumentViewController *)self rotateButtonItemForNavBar];
  [v15 setAccessibilityLabel:v14];

  uint64_t v16 = [(ICDocCamExtractedDocumentViewController *)self rotateButtonItem];
  uint64_t v17 = [v16 accessibilityHint];
  uint64_t v18 = [(ICDocCamExtractedDocumentViewController *)self rotateButtonItemForNavBar];
  [v18 setAccessibilityHint:v17];

  uint64_t v19 = +[DCLocalization localizedStringForKey:@"Double-tap to rename document" value:@"Double-tap to rename document" table:@"Localizable"];
  id v20 = [(ICDocCamExtractedDocumentViewController *)self collectionTitleButton];
  [v20 setAccessibilityHint:v19];

  id v21 = +[DCLocalization localizedStringForKey:@"Add scan" value:@"Add scan" table:@"Localizable"];
  int64_t v22 = [(ICDocCamExtractedDocumentViewController *)self addButtonItem];
  [v22 setTitle:v21];

  uint64_t v23 = [(ICDocCamExtractedDocumentViewController *)self addButtonItem];
  uint64_t v24 = [v23 title];
  id v25 = [(ICDocCamExtractedDocumentViewController *)self addButtonItem];
  [v25 setAccessibilityLabel:v24];

  uint64_t v26 = +[DCLocalization localizedStringForKey:@"Double-tap to add a new scan to this document." value:@"Double-tap to add a new scan to this document." table:@"Localizable"];
  unint64_t v27 = [(ICDocCamExtractedDocumentViewController *)self addButtonItem];
  [v27 setAccessibilityHint:v26];

  unint64_t v28 = +[DCLocalization localizedStringForKey:@"Share" value:@"Share" table:@"Localizable"];
  id v29 = [(ICDocCamExtractedDocumentViewController *)self actionButtonItem];
  [v29 setAccessibilityLabel:v28];

  double v30 = +[DCLocalization localizedStringForKey:@"Double-tap to share the current scan." value:@"Double-tap to share the current scan." table:@"Localizable"];
  uint64_t v31 = [(ICDocCamExtractedDocumentViewController *)self actionButtonItem];
  [v31 setAccessibilityHint:v30];

  id v32 = +[DCLocalization localizedStringForKey:@"Delete scan" value:@"Delete scan" table:@"Localizable"];
  id v33 = [(ICDocCamExtractedDocumentViewController *)self trashButtonItem];
  [v33 setAccessibilityLabel:v32];

  id v34 = +[DCLocalization localizedStringForKey:@"Double-tap to delete the current scan." value:@"Double-tap to delete the current scan." table:@"Localizable"];
  long long v35 = [(ICDocCamExtractedDocumentViewController *)self trashButtonItem];
  [v35 setAccessibilityHint:v34];

  double v36 = +[DCLocalization localizedStringForKey:@"Crop" value:@"Crop" table:@"Localizable"];
  long long v37 = [(ICDocCamExtractedDocumentViewController *)self recropButtonItem];
  [v37 setTitle:v36];

  CGAffineTransform v38 = [(ICDocCamExtractedDocumentViewController *)self recropButtonItem];
  CGAffineTransform v39 = [v38 title];
  double v40 = [(ICDocCamExtractedDocumentViewController *)self recropButtonItem];
  [v40 setAccessibilityLabel:v39];

  id v41 = +[DCLocalization localizedStringForKey:@"Double-tap to crop the current scan." value:@"Double-tap to crop the current scan." table:@"Localizable"];
  id v42 = [(ICDocCamExtractedDocumentViewController *)self recropButtonItem];
  [v42 setAccessibilityHint:v41];

  uint64_t v43 = [(ICDocCamExtractedDocumentViewController *)self recropButtonItem];
  id v44 = [v43 title];
  id v45 = [(ICDocCamExtractedDocumentViewController *)self recropButtonItemForNavBar];
  [v45 setTitle:v44];

  CGRect v46 = [(ICDocCamExtractedDocumentViewController *)self recropButtonItem];
  CGRect v47 = [v46 accessibilityLabel];
  CGRect v48 = [(ICDocCamExtractedDocumentViewController *)self recropButtonItemForNavBar];
  [v48 setAccessibilityLabel:v47];

  double v49 = [(ICDocCamExtractedDocumentViewController *)self recropButtonItem];
  uint64_t v50 = [v49 accessibilityHint];
  v51 = [(ICDocCamExtractedDocumentViewController *)self recropButtonItemForNavBar];
  [v51 setAccessibilityHint:v50];

  [(ICDocCamExtractedDocumentViewController *)self updateForAccessibilityDarkerSystemColors];
}

- (void)updateFilterButtonItemAccessibilityInfo
{
  id v13 = +[DCLocalization localizedStringForKey:@"Filters" value:@"Filters" table:@"Localizable"];
  double v3 = [(ICDocCamExtractedDocumentViewController *)self filterViewController];

  if (v3)
  {
    id v4 = +[DCLocalization localizedStringForKey:@"Hide filters" value:@"Hide filters" table:@"Localizable"];
    id v5 = @"Double-tap to hide filter options.";
  }
  else
  {
    id v4 = +[DCLocalization localizedStringForKey:@"Show filters" value:@"Show filters" table:@"Localizable"];
    id v5 = @"Double-tap to choose a filter to apply to this scan.";
  }
  uint64_t v6 = +[DCLocalization localizedStringForKey:v5 value:v5 table:@"Localizable"];
  uint64_t v7 = [(ICDocCamExtractedDocumentViewController *)self filterButtonItem];
  [v7 setTitle:v13];

  uint64_t v8 = [(ICDocCamExtractedDocumentViewController *)self filterButtonItemForNavBar];
  [v8 setTitle:v13];

  uint64_t v9 = [(ICDocCamExtractedDocumentViewController *)self filterButtonItem];
  [v9 setAccessibilityLabel:v4];

  double v10 = [(ICDocCamExtractedDocumentViewController *)self filterButtonItemForNavBar];
  [v10 setAccessibilityLabel:v4];

  long long v11 = [(ICDocCamExtractedDocumentViewController *)self filterButtonItem];
  [v11 setAccessibilityHint:v6];

  long long v12 = [(ICDocCamExtractedDocumentViewController *)self filterButtonItemForNavBar];
  [v12 setAccessibilityHint:v6];
}

- (void)updateImageViewAccessibilityForPageContentViewController:(id)a3
{
  id v37 = a3;
  id v4 = [v37 image];
  [v4 size];
  double v6 = v5;
  uint64_t v7 = [v37 image];
  [v7 size];
  double v9 = v8;

  if (v6 >= v9) {
    double v10 = @"portrait";
  }
  else {
    double v10 = @"landscape";
  }
  long long v11 = +[DCLocalization localizedStringForKey:v10 value:v10 table:@"Localizable"];
  long long v12 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
  id v13 = [v12 docInfos];
  long long v14 = objc_msgSend(v13, "objectAtIndexedSubscript:", -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex"));
  double v15 = +[ICDocCamImageFilters localizedImageFilterNameForType:](ICDocCamImageFilters, "localizedImageFilterNameForType:", [v14 currentFilter]);

  uint64_t v16 = NSString;
  uint64_t v17 = +[DCLocalization localizedStringForKey:@"%lu of %lu" value:@"%lu of %lu" table:@"Localizable"];
  int64_t v18 = [(ICDocCamExtractedDocumentViewController *)self presentationPageIndex] + 1;
  uint64_t v19 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
  id v20 = [v19 docInfos];
  id v21 = objc_msgSend(v16, "localizedStringWithFormat:", v17, v18, objc_msgSend(v20, "count"));

  int64_t v22 = +[DCLocalization localizedStringForKey:@"Scan" value:@"Scan" table:@"Localizable"];
  uint64_t v23 = [v37 imageView];
  [v23 setIsAccessibilityElement:1];

  double v30 = __DCAccessibilityStringForVariables(1, v22, v24, v25, v26, v27, v28, v29, (uint64_t)v11);
  uint64_t v31 = [v37 imageView];
  [v31 setAccessibilityLabel:v30];

  id v32 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
  id v33 = [v32 docInfos];
  uint64_t v34 = [v33 count];

  if (v34)
  {
    long long v35 = +[DCLocalization localizedStringForKey:@"Three-finger swipe to scroll between scans." value:@"Three-finger swipe to scroll between scans." table:@"Localizable"];
    double v36 = [v37 imageView];
    [v36 setAccessibilityHint:v35];
  }
}

- (BOOL)accessibilityPerformEscape
{
  return 1;
}

- (void)updateForAccessibilityDarkerSystemColors
{
  if (UIAccessibilityDarkerSystemColorsEnabled()) {
    [(ICDocCamExtractedDocumentViewController *)self darkenedCollectionViewTitleTintColor];
  }
  else {
  id v4 = [(ICDocCamExtractedDocumentViewController *)self defaultCollectionViewTitleTintColor];
  }
  double v3 = [(ICDocCamExtractedDocumentViewController *)self collectionTitleButton];
  [v3 setTitleColor:v4 forState:0];
}

- (void)speakAccessibilityAnnouncementForReorderIfNecessaryForProposedIndexPath:(id)a3
{
  uint64_t v4 = [a3 item];
  if (v4 != [(ICDocCamExtractedDocumentViewController *)self lastAXProposedIndexForReordering])
  {
    id v6 = +[DCLocalization localizedStringForKey:@"Position %lu" value:@"Position %lu" table:@"Localizable"];
    double v5 = objc_msgSend(NSString, "localizedStringWithFormat:", v6, v4 + 1);
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v5);
    [(ICDocCamExtractedDocumentViewController *)self setLastAXProposedIndexForReordering:v4];
  }
}

- (void)speakAccessibilityAnnouncementForMovingItemFromIndexPath:(id)a3 toIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 item];
  uint64_t v7 = [v5 item];

  id v9 = +[DCLocalization localizedStringForKey:@"Moved item from position %lu to position %lu" value:@"Moved item from position %lu to position %lu" table:@"Localizable"];
  double v8 = objc_msgSend(NSString, "localizedStringWithFormat:", v9, v6 + 1, v7 + 1);
  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v8);
}

- (id)_accessibilitySpeakThisElementsAndStrings
{
  double v3 = (void *)MEMORY[0x263EFF980];
  v12.receiver = self;
  v12.super_class = (Class)ICDocCamExtractedDocumentViewController;
  uint64_t v4 = [(ICDocCamExtractedDocumentViewController *)&v12 _accessibilitySpeakThisElementsAndStrings];
  id v5 = [v3 arrayWithArray:v4];

  uint64_t v6 = [(ICDocCamExtractedDocumentViewController *)self collectionTitleButton];
  uint64_t v7 = [v6 accessibilityLabel];
  [v5 insertObject:v7 atIndex:0];

  double v8 = [(ICDocCamExtractedDocumentViewController *)self pageIndexLabel];
  id v9 = [v8 accessibilityLabel];
  [v5 insertObject:v9 atIndex:1];

  double v10 = (void *)[v5 copy];

  return v10;
}

- (BOOL)accessibilityScrollRightPage
{
  int64_t v3 = [(ICDocCamExtractedDocumentViewController *)self presentationPageIndex];
  int64_t v4 = v3;
  if (v3) {
    [(ICDocCamExtractedDocumentViewController *)self showViewControllerAtIndex:v3 - 1 animated:0];
  }
  return v4 != 0;
}

- (BOOL)accessibilityScrollLeftPage
{
  unint64_t v3 = [(ICDocCamExtractedDocumentViewController *)self presentationPageIndex];
  int64_t v4 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
  id v5 = [v4 docInfos];
  unint64_t v6 = [v5 count] - 1;

  if (v3 < v6) {
    [(ICDocCamExtractedDocumentViewController *)self showViewControllerAtIndex:v3 + 1 animated:0];
  }
  return v3 < v6;
}

- (void)thumbnailContainerViewIncrementCurrentIndex:(id)a3
{
  unint64_t v4 = [(ICDocCamExtractedDocumentViewController *)self presentationPageIndex];
  id v9 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
  id v5 = [v9 docInfos];
  if (v4 < [v5 count] - 1)
  {
    unint64_t v6 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
    uint64_t v7 = [v6 docInfos];
    uint64_t v8 = [v7 count];

    if (!v8) {
      return;
    }
    id v9 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];
    id v5 = [MEMORY[0x263F088C8] indexPathForItem:v4 + 1 inSection:0];
    [(ICDocCamExtractedDocumentViewController *)self collectionView:v9 didSelectItemAtIndexPath:v5];
  }
}

- (void)thumbnailContainerViewDecrementCurrentIndex:(id)a3
{
  int64_t v4 = [(ICDocCamExtractedDocumentViewController *)self presentationPageIndex];
  if (v4)
  {
    int64_t v5 = v4;
    id v7 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];
    unint64_t v6 = [MEMORY[0x263F088C8] indexPathForItem:v5 - 1 inSection:0];
    [(ICDocCamExtractedDocumentViewController *)self collectionView:v7 didSelectItemAtIndexPath:v6];
  }
}

- (unint64_t)thumbnailContainerViewNumberOfItems:(id)a3
{
  unint64_t v3 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
  int64_t v4 = [v3 docInfos];
  unint64_t v5 = [v4 count];

  return v5;
}

- (void)thumbnailContainerView:(id)a3 moveItemFromIndex:(int64_t)a4 toIndex:(int64_t)a5
{
  if ([(ICDocCamExtractedDocumentViewController *)self thumbnailContainerViewSupportsReordering:a3])
  {
    id v11 = [MEMORY[0x263F088C8] indexPathForItem:a4 inSection:0];
    uint64_t v8 = [MEMORY[0x263F088C8] indexPathForItem:a5 inSection:0];
    id v9 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];
    [(ICDocCamExtractedDocumentViewController *)self collectionView:v9 moveItemAtIndexPath:v11 toIndexPath:v8];

    [(ICDocCamExtractedDocumentViewController *)self showViewControllerAtIndex:a5 animated:0];
    double v10 = [(ICDocCamExtractedDocumentViewController *)self thumbnailCollectionView];
    [v10 reloadData];
  }
}

- (BOOL)thumbnailContainerViewSupportsReordering:(id)a3
{
  return [(ICDocCamExtractedDocumentViewController *)self mode] == 1;
}

- (BOOL)thumbnailContainerViewIsVisible:(id)a3
{
  int64_t v4 = [(ICDocCamExtractedDocumentViewController *)self view];
  unint64_t v5 = [v4 window];
  unint64_t v6 = [v5 windowScene];
  unint64_t v7 = [v6 interfaceOrientation] - 3;

  uint64_t v8 = [(ICDocCamExtractedDocumentViewController *)self traitCollection];
  uint64_t v9 = [v8 horizontalSizeClass];

  double v10 = [(ICDocCamExtractedDocumentViewController *)self filterViewController];

  return v7 < 0xFFFFFFFFFFFFFFFELL || v9 != 1 || v10 == 0;
}

- (BOOL)thumbnailContainerViewIsVisible
{
  uint64_t v2 = self;
  unint64_t v3 = [(ICDocCamExtractedDocumentViewController *)self thumbnailContainerView];
  LOBYTE(v2) = [(ICDocCamExtractedDocumentViewController *)v2 thumbnailContainerViewIsVisible:v3];

  return (char)v2;
}

- (CGRect)zoomTargetForIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ICDocCamExtractedDocumentViewController *)self pageViewControllerContainerView];
  [v5 frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  uint64_t v14 = [v4 item];
  [(ICDocCamExtractedDocumentViewController *)self imageSizeForDocumentAtIndex:v14];
  +[ICDocCamUtilities aspectFillSize:targetSize:](ICDocCamUtilities, "aspectFillSize:targetSize:");
  +[ICDocCamUtilities aspectFitSize:targetSize:](ICDocCamUtilities, "aspectFitSize:targetSize:");
  double v16 = v15;
  double v18 = v17;
  double v19 = v7 + v11 * 0.5 - v15 * 0.5;
  double v20 = v9 + v13 * 0.5 - v17 * 0.5;
  result.size.double height = v18;
  result.size.double width = v16;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (CGRect)imageRectWithZoomAndPanForIndexPath:(id)a3
{
  id v4 = [(ICDocCamExtractedDocumentViewController *)self currentImageView];
  unint64_t v5 = [(ICDocCamExtractedDocumentViewController *)self currentImageView];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  uint64_t v14 = [(ICDocCamExtractedDocumentViewController *)self view];
  objc_msgSend(v4, "convertRect:toView:", v14, v7, v9, v11, v13);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  double v23 = v16;
  double v24 = v18;
  double v25 = v20;
  double v26 = v22;
  result.size.double height = v26;
  result.size.double width = v25;
  result.origin.double y = v24;
  result.origin.double x = v23;
  return result;
}

- (unint64_t)documentCount
{
  uint64_t v2 = [(ICDocCamExtractedDocumentViewController *)self documentInfoCollection];
  unint64_t v3 = [v2 docInfos];
  unint64_t v4 = [v3 count];

  return v4;
}

- (id)indexPathForCurrentDocument
{
  uint64_t v2 = (void *)MEMORY[0x263F088C8];
  int64_t v3 = [(ICDocCamExtractedDocumentViewController *)self presentationPageIndex];

  return (id)[v2 indexPathForItem:v3 inSection:0];
}

- (void)resetImageCentering
{
  id v2 = [(ICDocCamExtractedDocumentViewController *)self currentPageContentViewController];
  [v2 resetImageCentering];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIView)topToolbar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_topToolbar);

  return (UIView *)WeakRetained;
}

- (void)setTopToolbar:(id)a3
{
}

- (UIToolbar)bottomToolbar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bottomToolbar);

  return (UIToolbar *)WeakRetained;
}

- (void)setBottomToolbar:(id)a3
{
}

- (ICDocCamFilterViewController)filterViewController
{
  return self->_filterViewController;
}

- (void)setFilterViewController:(id)a3
{
}

- (UIPageViewController)pageViewController
{
  return self->_pageViewController;
}

- (void)setPageViewController:(id)a3
{
}

- (BOOL)statusBarWasHiddenWhenDoneTapped
{
  return self->_statusBarWasHiddenWhenDoneTapped;
}

- (void)setStatusBarWasHiddenWhenDoneTapped:(BOOL)a3
{
  self->_statusBarWasHiddenWhenDoneTapped = a3;
}

- (BOOL)statusBarWasHiddenWhenRetakeTapped
{
  return self->_statusBarWasHiddenWhenRetakeTapped;
}

- (void)setStatusBarWasHiddenWhenRetakeTapped:(BOOL)a3
{
  self->_statusBarWasHiddenWhenRetakeTapped = a3;
}

- (UIBarButtonItem)trashButtonItem
{
  return self->_trashButtonItem;
}

- (void)setTrashButtonItem:(id)a3
{
}

- (UIBarButtonItem)rotateButtonItem
{
  return self->_rotateButtonItem;
}

- (void)setRotateButtonItem:(id)a3
{
}

- (UIBarButtonItem)filterButtonItem
{
  return self->_filterButtonItem;
}

- (void)setFilterButtonItem:(id)a3
{
}

- (UIBarButtonItem)addButtonItem
{
  return self->_addButtonItem;
}

- (void)setAddButtonItem:(id)a3
{
}

- (UIBarButtonItem)actionButtonItem
{
  return self->_actionButtonItem;
}

- (void)setActionButtonItem:(id)a3
{
}

- (UIBarButtonItem)doneButtonItem
{
  return self->_doneButtonItem;
}

- (void)setDoneButtonItem:(id)a3
{
}

- (UIBarButtonItem)retakeButtonItem
{
  return self->_retakeButtonItem;
}

- (void)setRetakeButtonItem:(id)a3
{
}

- (UIBarButtonItem)filterButtonItemForNavBar
{
  return self->_filterButtonItemForNavBar;
}

- (void)setFilterButtonItemForNavBar:(id)a3
{
}

- (UIBarButtonItem)trashButtonItemForNavBar
{
  return self->_trashButtonItemForNavBar;
}

- (void)setTrashButtonItemForNavBar:(id)a3
{
}

- (UIBarButtonItem)rotateButtonItemForNavBar
{
  return self->_rotateButtonItemForNavBar;
}

- (void)setRotateButtonItemForNavBar:(id)a3
{
}

- (UIBarButtonItem)recropButtonItem
{
  return self->_recropButtonItem;
}

- (void)setRecropButtonItem:(id)a3
{
}

- (UIBarButtonItem)recropButtonItemForNavBar
{
  return self->_recropButtonItemForNavBar;
}

- (void)setRecropButtonItemForNavBar:(id)a3
{
}

- (BOOL)rotationUnderWay
{
  return self->_rotationUnderWay;
}

- (void)setRotationUnderWay:(BOOL)a3
{
  self->_rotationUnderWadouble y = a3;
}

- (UILabel)pageIndexLabel
{
  return self->_pageIndexLabel;
}

- (void)setPageIndexLabel:(id)a3
{
}

- (UIButton)collectionTitleButton
{
  return self->_collectionTitleButton;
}

- (void)setCollectionTitleButton:(id)a3
{
}

- (UIView)titleViewWrapper
{
  return self->_titleViewWrapper;
}

- (void)setTitleViewWrapper:(id)a3
{
}

- (UIStackView)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
}

- (NSLayoutConstraint)titleViewWrapperWidthConstraint
{
  return self->_titleViewWrapperWidthConstraint;
}

- (void)setTitleViewWrapperWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleViewWrapperHeightConstraint
{
  return self->_titleViewWrapperHeightConstraint;
}

- (void)setTitleViewWrapperHeightConstraint:(id)a3
{
}

- (UIView)pageViewControllerContainerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pageViewControllerContainerView);

  return (UIView *)WeakRetained;
}

- (void)setPageViewControllerContainerView:(id)a3
{
}

- (int64_t)presentationPageIndex
{
  return self->_presentationPageIndex;
}

- (UICollectionViewController)thumbnailCollectionViewController
{
  return self->_thumbnailCollectionViewController;
}

- (void)setThumbnailCollectionViewController:(id)a3
{
}

- (UICollectionView)thumbnailCollectionView
{
  return self->_thumbnailCollectionView;
}

- (void)setThumbnailCollectionView:(id)a3
{
}

- (ICDocCamExtractedThumbnailContainerView)thumbnailContainerView
{
  return self->_thumbnailContainerView;
}

- (void)setThumbnailContainerView:(id)a3
{
}

- (UIBarButtonItem)thumbnailContainerViewItem
{
  return self->_thumbnailContainerViewItem;
}

- (void)setThumbnailContainerViewItem:(id)a3
{
}

- (int)mode
{
  return self->_mode;
}

- (void)setMode:(int)a3
{
  self->_mode = a3;
}

- (ICDocCamDocumentInfoCollection)documentInfoCollection
{
  return self->_documentInfoCollection;
}

- (void)setDocumentInfoCollection:(id)a3
{
}

- (ICDocCamImageCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
}

- (UILongPressGestureRecognizer)imageLongPressGestureRecognizer
{
  return self->_imageLongPressGestureRecognizer;
}

- (void)setImageLongPressGestureRecognizer:(id)a3
{
}

- (UILongPressGestureRecognizer)thumbnailLongPressGestureRecognizer
{
  return self->_thumbnailLongPressGestureRecognizer;
}

- (void)setThumbnailLongPressGestureRecognizer:(id)a3
{
}

- (NSIndexPath)movingIndexPath
{
  return self->_movingIndexPath;
}

- (void)setMovingIndexPath:(id)a3
{
}

- (double)movingXPosition
{
  return self->_movingXPosition;
}

- (void)setMovingXPosition:(double)a3
{
  self->_movingXPosition = a3;
}

- (double)movingYPosition
{
  return self->_movingYPosition;
}

- (void)setMovingYPosition:(double)a3
{
  self->_movingYPosition = a3;
}

- (CGRect)menuControllerTargetRect
{
  double x = self->_menuControllerTargetRect.origin.x;
  double y = self->_menuControllerTargetRect.origin.y;
  double width = self->_menuControllerTargetRect.size.width;
  double height = self->_menuControllerTargetRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setMenuControllerTargetRect:(CGRect)a3
{
  self->_menuControllerTargetRect = a3;
}

- (ICDocCamExtractedDocumentControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICDocCamExtractedDocumentControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIAlertController)editTitleAlert
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editTitleAlert);

  return (UIAlertController *)WeakRetained;
}

- (void)setEditTitleAlert:(id)a3
{
}

- (void)setSharedCoreImageContext:(id)a3
{
}

- (CGSize)previousViewSize
{
  double width = self->_previousViewSize.width;
  double height = self->_previousViewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreviousViewSize:(CGSize)a3
{
  self->_previousViewSize = a3;
}

- (BOOL)isScrollingBetweenPages
{
  return self->_isScrollingBetweenPages;
}

- (UIScrollView)pageViewControllerScrollView
{
  return self->_pageViewControllerScrollView;
}

- (void)setPageViewControllerScrollView:(id)a3
{
}

- (NSMutableArray)documentsToUpdateWhenScrollingStops
{
  return self->_documentsToUpdateWhenScrollingStops;
}

- (void)setDocumentsToUpdateWhenScrollingStops:(id)a3
{
}

- (int64_t)lastAXProposedIndexForReordering
{
  return self->_lastAXProposedIndexForReordering;
}

- (void)setLastAXProposedIndexForReordering:(int64_t)a3
{
  self->_lastAXProposedIndexForReordering = a3;
}

- (BOOL)barsShouldBeHidden
{
  return self->_barsShouldBeHidden;
}

- (void)setBarsShouldBeHidden:(BOOL)a3
{
  self->_barsShouldBeHidden = a3;
}

- (BOOL)cameraRestricted
{
  return self->_cameraRestricted;
}

- (void)setCameraRestricted:(BOOL)a3
{
  self->_cameraRestricted = a3;
}

- (NSLayoutConstraint)pageViewLeadingConstraint
{
  return self->_pageViewLeadingConstraint;
}

- (void)setPageViewLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)pageViewTrailingConstraint
{
  return self->_pageViewTrailingConstraint;
}

- (void)setPageViewTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)pageViewTopConstraint
{
  return self->_pageViewTopConstraint;
}

- (void)setPageViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)pageViewBottomConstraint
{
  return self->_pageViewBottomConstraint;
}

- (void)setPageViewBottomConstraint:(id)a3
{
}

- (BOOL)adjustPageViewControllerForMarkup
{
  return self->_adjustPageViewControllerForMarkup;
}

- (void)setAdjustPageViewControllerForMarkup:(BOOL)a3
{
  self->_adjustPageViewControllerForMarkup = a3;
}

- (BOOL)isAnimatingPageViewController
{
  return self->_isAnimatingPageViewController;
}

- (void)setIsAnimatingPageViewController:(BOOL)a3
{
  self->_isAnimatingPageViewController = a3;
}

- (UIAccessibilityHUDItem)hudItemForAccessibilityLargerText
{
  return self->_hudItemForAccessibilityLargerText;
}

- (void)setHudItemForAccessibilityLargerText:(id)a3
{
}

- (UILongPressGestureRecognizer)axHUDLongPressGestureRecognizer
{
  return self->_axHUDLongPressGestureRecognizer;
}

- (void)setAxHUDLongPressGestureRecognizer:(id)a3
{
}

- (BOOL)layoutHasHappened
{
  return self->_layoutHasHappened;
}

- (void)setLayoutHasHappened:(BOOL)a3
{
  self->_layoutHasHappened = a3;
}

- (UIColor)defaultCollectionViewTitleTintColor
{
  return self->_defaultCollectionViewTitleTintColor;
}

- (void)setDefaultCollectionViewTitleTintColor:(id)a3
{
}

- (UIColor)darkenedCollectionViewTitleTintColor
{
  return self->_darkenedCollectionViewTitleTintColor;
}

- (void)setDarkenedCollectionViewTitleTintColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkenedCollectionViewTitleTintColor, 0);
  objc_storeStrong((id *)&self->_defaultCollectionViewTitleTintColor, 0);
  objc_storeStrong((id *)&self->_axHUDLongPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_hudItemForAccessibilityLargerText, 0);
  objc_storeStrong((id *)&self->_pageViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_pageViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_pageViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_pageViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_documentsToUpdateWhenScrollingStops, 0);
  objc_storeStrong((id *)&self->_pageViewControllerScrollView, 0);
  objc_storeStrong((id *)&self->_sharedCoreImageContext, 0);
  objc_destroyWeak((id *)&self->_editTitleAlert);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_movingIndexPath, 0);
  objc_storeStrong((id *)&self->_thumbnailLongPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_imageLongPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_documentInfoCollection, 0);
  objc_storeStrong((id *)&self->_thumbnailContainerViewItem, 0);
  objc_storeStrong((id *)&self->_thumbnailContainerView, 0);
  objc_storeStrong((id *)&self->_thumbnailCollectionView, 0);
  objc_storeStrong((id *)&self->_thumbnailCollectionViewController, 0);
  objc_destroyWeak((id *)&self->_pageViewControllerContainerView);
  objc_storeStrong((id *)&self->_titleViewWrapperHeightConstraint, 0);
  objc_storeStrong((id *)&self->_titleViewWrapperWidthConstraint, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_titleViewWrapper, 0);
  objc_storeStrong((id *)&self->_collectionTitleButton, 0);
  objc_storeStrong((id *)&self->_pageIndexLabel, 0);
  objc_storeStrong((id *)&self->_recropButtonItemForNavBar, 0);
  objc_storeStrong((id *)&self->_recropButtonItem, 0);
  objc_storeStrong((id *)&self->_rotateButtonItemForNavBar, 0);
  objc_storeStrong((id *)&self->_trashButtonItemForNavBar, 0);
  objc_storeStrong((id *)&self->_filterButtonItemForNavBar, 0);
  objc_storeStrong((id *)&self->_retakeButtonItem, 0);
  objc_storeStrong((id *)&self->_doneButtonItem, 0);
  objc_storeStrong((id *)&self->_actionButtonItem, 0);
  objc_storeStrong((id *)&self->_addButtonItem, 0);
  objc_storeStrong((id *)&self->_filterButtonItem, 0);
  objc_storeStrong((id *)&self->_rotateButtonItem, 0);
  objc_storeStrong((id *)&self->_trashButtonItem, 0);
  objc_storeStrong((id *)&self->_pageViewController, 0);
  objc_storeStrong((id *)&self->_filterViewController, 0);
  objc_destroyWeak((id *)&self->_bottomToolbar);

  objc_destroyWeak((id *)&self->_topToolbar);
}

- (void)orientationRotated90DegreesFromOrientation:.cold.1()
{
}

- (void)orientationString:.cold.1()
{
}

- (void)filterButtonAction:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int64_t v3 = [a1 scanDataDelegateIdentifier];
  int v4 = 138412290;
  unint64_t v5 = v3;
  _os_log_error_impl(&dword_217885000, a2, OS_LOG_TYPE_ERROR, "Unable to find images when trying to open filter view controller for scanDataDelegate %@", (uint8_t *)&v4, 0xCu);
}

@end