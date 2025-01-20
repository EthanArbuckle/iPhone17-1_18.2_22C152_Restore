@interface MUPlacePictureItemSectionController
- (BOOL)isActive;
- (BOOL)isImpressionable;
- (MUPlacePictureItemSectionController)initWithMapItem:(id)a3 annotatedList:(id)a4 presentingViewController:(id)a5;
- (MUPlacePictureItemSectionControllerDelegate)pictureItemDelegate;
- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel;
- (UIView)sectionView;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)placePhotoGalleryImageViewForPhotoAtIndex:(unint64_t)a3;
- (int)analyticsModuleType;
- (void)_captureUserAction:(int)a3;
- (void)_performPunchout;
- (void)_presentPhotoGalleryForPhotoIndex:(unint64_t)a3;
- (void)_setupSubviews;
- (void)performInstrumentationForScrollLeft;
- (void)performInstrumentationForScrollRight;
- (void)photoGalleryTransitionAnimatorDidFinishAnimation;
- (void)placePhotoGallery:(id)a3 willCloseAtIndex:(unint64_t)a4;
- (void)placeTileCollectionView:(id)a3 didTapOnViewModel:(id)a4;
- (void)setActive:(BOOL)a3;
- (void)setPictureItemDelegate:(id)a3;
@end

@implementation MUPlacePictureItemSectionController

- (MUPlacePictureItemSectionController)initWithMapItem:(id)a3 annotatedList:(id)a4 presentingViewController:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MUPlacePictureItemSectionController;
  v11 = [(MUPlaceSectionController *)&v16 initWithMapItem:a3];
  if (v11)
  {
    v12 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)v15 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUPlacePictureItemSectionControllerInit", "", v15, 2u);
    }

    objc_storeStrong((id *)&v11->_annotatedList, a4);
    objc_storeWeak((id *)&v11->_presentingViewController, v10);
    [(MUPlacePictureItemSectionController *)v11 _setupSubviews];
    v13 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)v15 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v13, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUPlacePictureItemSectionControllerInit", "", v15, 2u);
    }
  }
  return v11;
}

- (void)_setupSubviews
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v21 = +[MUPlaceTilesViewConfiguration annotatedListConfiguration];
  v3 = [[MUPlaceTilesView alloc] initWithConfiguration:v21];
  tilesView = self->_tilesView;
  self->_tilesView = v3;

  v22 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v5 = [(GEOAnnotatedItemList *)self->_annotatedList pictureItemContainer];
  v6 = [v5 pictureItems];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        int v13 = [v12 pictureItemPhotoType];
        if ((v13 - 2) >= 2)
        {
          if (v13 == 1) {
            [v22 addObject:v12];
          }
        }
        else
        {
          v14 = [(GEOAnnotatedItemList *)self->_annotatedList attribution];
          v15 = [v14 providerName];
          objc_super v16 = +[MUPunchoutViewModel viewModelForVendorName:v15];

          objc_storeStrong((id *)&self->_attributionViewModel, v16);
          id v9 = v16;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }

  [(MUPlaceTilesView *)self->_tilesView setViewModels:v22];
  [(MUPlaceTilesView *)self->_tilesView setDelegate:self];
  [(MUPlaceTilesView *)self->_tilesView setAnalyticsDelegate:self];
  if (v9) {
    [(MUPlaceTilesView *)self->_tilesView setAccessoryViewModel:v9];
  }
  v17 = [MUPlaceSectionView alloc];
  v18 = [(MUPlacePictureItemSectionController *)self sectionHeaderViewModel];
  v19 = [(MUPlaceSectionView *)v17 initWithStyle:0 sectionHeaderViewModel:v18];
  sectionView = self->_sectionView;
  self->_sectionView = v19;

  [(MUPlaceSectionView *)self->_sectionView configureWithSectionController:self];
  [(MUPlaceSectionView *)self->_sectionView attachViewToContentView:self->_tilesView];
}

- (UIView)sectionView
{
  return (UIView *)self->_sectionView;
}

- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel
{
  sectionHeaderViewModel = self->_sectionHeaderViewModel;
  if (!sectionHeaderViewModel)
  {
    annotatedList = self->_annotatedList;
    v5 = self;
    v6 = annotatedList;
    uint64_t v7 = mkAttributionForAnnotatedList();
    uint64_t v8 = [(GEOAnnotatedItemList *)v6 title];
    id v9 = +[MUPlaceSectionHeaderViewModel viewModelForTitle:v8 attribution:v7 target:v5 action:sel__performPunchout];

    [(MUPlaceSectionHeaderViewModel *)v9 setTarget:v5 selector:sel__performPunchout];
    uint64_t v10 = self->_sectionHeaderViewModel;
    self->_sectionHeaderViewModel = v9;

    sectionHeaderViewModel = self->_sectionHeaderViewModel;
  }
  return sectionHeaderViewModel;
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    [(MUPlaceTilesView *)self->_tilesView displayPlaceTiles];
  }
}

- (void)placeTileCollectionView:(id)a3 didTapOnViewModel:(id)a4
{
  tilesView = self->_tilesView;
  id v6 = a4;
  uint64_t v7 = [(MUPlaceTilesView *)tilesView viewModels];
  uint64_t v8 = [v7 indexOfObject:v6];

  id v9 = [(GEOAnnotatedItemList *)self->_annotatedList pictureItemContainer];
  uint64_t v10 = [v9 pictureItems];
  id v12 = [v10 objectAtIndex:v8];

  int v11 = [v12 pictureItemPhotoType];
  if ((v11 - 2) >= 2)
  {
    if (v11 == 1) {
      [(MUPlacePictureItemSectionController *)self _presentPhotoGalleryForPhotoIndex:v8];
    }
  }
  else
  {
    [(MUPlacePictureItemSectionController *)self _performPunchout];
  }
}

- (void)_performPunchout
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [(MUPlacePictureItemSectionController *)self _captureUserAction:6054];
  v3 = self->_annotatedList;
  v4 = mkAttributionForAnnotatedList();
  v5 = MUGetPlaceCardLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 providerName];
    int v9 = 138412290;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1931EA000, v5, OS_LOG_TYPE_INFO, "Attempting to punch our with attribution with provider %@", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v7 = (void *)MEMORY[0x1E4F30E40];
  uint64_t v8 = [v4 attributionURLs];
  [v7 launchAttributionURLs:v8 withAttribution:v4 completionHandler:&__block_literal_global_51];
}

- (void)_presentPhotoGalleryForPhotoIndex:(unint64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = [(GEOAnnotatedItemList *)self->_annotatedList pictureItemContainer];
  uint64_t v7 = [v6 pictureItems];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __73__MUPlacePictureItemSectionController__presentPhotoGalleryForPhotoIndex___block_invoke;
  v24[3] = &unk_1E5751A60;
  id v8 = v5;
  id v25 = v8;
  [v7 enumerateObjectsUsingBlock:v24];

  if ([v8 count])
  {
    int v9 = [(GEOAnnotatedItemList *)self->_annotatedList pictureItemContainer];
    char v10 = [v9 allowFullScreenPhoto];

    if (v10)
    {
      [(MUPlacePictureItemSectionController *)self _captureUserAction:6052];
      uint64_t v11 = [MUPlacePhotoGalleryViewController alloc];
      id v12 = (void *)[v8 copy];
      int v13 = [(MUPlaceTilesView *)self->_tilesView accessoryView];
      v14 = [(MUPlaceSectionController *)self mapItem];
      v15 = [(MUPlacePhotoGalleryViewController *)v11 initWithPhotos:v12 additionalView:v13 scrollToIndex:a3 mapItem:v14 delegate:self];
      photoGalleryViewController = self->_photoGalleryViewController;
      self->_photoGalleryViewController = v15;

      v17 = [objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:self->_photoGalleryViewController];
      v18 = [v17 navigationController];
      [v18 setNavigationBarHidden:1 animated:0];

      [v17 setModalPresentationStyle:5];
      [v17 setTransitioningDelegate:self];
      v19 = [MEMORY[0x1E4F31038] sharedInstance];
      LODWORD(v13) = [v19 userInterfaceIdiom];

      if (v13 == 2)
      {
        [(MUPlacePhotoGalleryViewController *)self->_photoGalleryViewController setPanAndSwipeToDismissGestureEnabled:0];
        [v17 setModalPresentationStyle:8];
        WeakRetained = [(MUPlacePictureItemSectionController *)self pictureItemDelegate];
        [WeakRetained pictureItemSectionController:self requestsSceneActivationWithPhotoGallery:self->_photoGalleryViewController];
      }
      else
      {
        v21 = [(MUPlaceTilesView *)self->_tilesView imageViewForIndex:a3];
        imageViewForTransition = self->_imageViewForTransition;
        self->_imageViewForTransition = v21;

        [v17 setModalPresentationStyle:5];
        [v17 setTransitioningDelegate:self];
        WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
        [WeakRetained presentViewController:v17 animated:1 completion:0];
      }
    }
    else
    {
      v17 = MUGetPlaceCardLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long v23 = 0;
        _os_log_impl(&dword_1931EA000, v17, OS_LOG_TYPE_INFO, "Picture item container does not allow full screen photo. Bail early", v23, 2u);
      }
    }
  }
}

void __73__MUPlacePictureItemSectionController__presentPhotoGalleryForPhotoIndex___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = [v8 photo];
  if (v3)
  {
    v4 = (void *)v3;
    int v5 = [v8 pictureItemPhotoType];

    if (v5 == 1)
    {
      id v6 = *(void **)(a1 + 32);
      uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F30F18]) initWithPictureItem:v8];
      [v6 addObject:v7];
    }
  }
}

- (id)placePhotoGalleryImageViewForPhotoAtIndex:(unint64_t)a3
{
  return [(MUPlaceTilesView *)self->_tilesView imageViewForIndex:a3];
}

- (void)placePhotoGallery:(id)a3 willCloseAtIndex:(unint64_t)a4
{
  id v6 = [(GEOAnnotatedItemList *)self->_annotatedList pictureItemContainer];
  uint64_t v7 = [v6 pictureItems];
  unint64_t v8 = [v7 count];

  if (v8 <= a4)
  {
    char v10 = [(GEOAnnotatedItemList *)self->_annotatedList pictureItemContainer];
    uint64_t v11 = [v10 pictureItems];
    unint64_t v12 = [v11 count] + 1;

    if (v12 <= a4)
    {
      int v9 = 0;
    }
    else
    {
      int v9 = [(MUPlaceTilesView *)self->_tilesView accessoryView];
    }
  }
  else
  {
    int v9 = [(MUPlaceTilesView *)self->_tilesView imageViewForIndex:a4];
  }
  tilesView = self->_tilesView;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__MUPlacePictureItemSectionController_placePhotoGallery_willCloseAtIndex___block_invoke;
  v15[3] = &unk_1E57505A0;
  id v16 = v9;
  id v14 = v9;
  [(MUPlaceTilesView *)tilesView enumerateImageViewsWithBlock:v15];
  [(MUPlaceTilesView *)self->_tilesView scrollToViewAtIndex:a4];
}

uint64_t __74__MUPlacePictureItemSectionController_placePhotoGallery_willCloseAtIndex___block_invoke(uint64_t a1, void *a2)
{
  double v2 = 1.0;
  if (*(void **)(a1 + 32) == a2) {
    double v2 = 0.0;
  }
  return [a2 setAlpha:v2];
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v6 = objc_alloc(MEMORY[0x1E4FB1838]);
  uint64_t v7 = [(UIImageView *)self->_imageViewForTransition image];
  unint64_t v8 = (void *)[v6 initWithImage:v7];

  objc_msgSend(v8, "setContentMode:", -[UIImageView contentMode](self->_imageViewForTransition, "contentMode"));
  int v9 = [[MUPhotoGalleryTransitionAnimator alloc] initWithView:self->_imageViewForTransition transitionView:v8];
  [(MUPhotoGalleryTransitionAnimator *)v9 setDelegate:self];

  return v9;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_6;
  }
  id v5 = v4;
  id v6 = [v5 viewControllers];
  uint64_t v7 = [v6 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    int v9 = [v5 viewControllers];
    char v10 = [v9 firstObject];

    if (v10)
    {
      unint64_t v11 = [v10 indexOfVisibleView];
      unint64_t v12 = [(GEOAnnotatedItemList *)self->_annotatedList pictureItemContainer];
      int v13 = [v12 pictureItems];
      unint64_t v14 = [v13 count];

      if (v11 >= v14)
      {
        v19 = 0;
      }
      else
      {
        v15 = [(MUPlaceTilesView *)self->_tilesView imageViewForIndex:v11];
        id v16 = objc_alloc(MEMORY[0x1E4FB1838]);
        v17 = [v15 image];
        v18 = (void *)[v16 initWithImage:v17];

        objc_msgSend(v18, "setContentMode:", objc_msgSend(v15, "contentMode"));
        v19 = [[MUPhotoGalleryTransitionAnimator alloc] initWithView:v15 transitionView:v18];
      }
      [(MUPhotoGalleryTransitionAnimator *)v19 setDelegate:self];
      goto LABEL_10;
    }
LABEL_6:
    v19 = 0;
    goto LABEL_11;
  }
  v19 = 0;
  char v10 = v5;
LABEL_10:

LABEL_11:
  return v19;
}

- (void)photoGalleryTransitionAnimatorDidFinishAnimation
{
}

- (void)_captureUserAction:(int)a3
{
}

- (int)analyticsModuleType
{
  return 20;
}

- (BOOL)isImpressionable
{
  return 1;
}

- (void)performInstrumentationForScrollLeft
{
}

- (void)performInstrumentationForScrollRight
{
}

- (BOOL)isActive
{
  return self->_active;
}

- (MUPlacePictureItemSectionControllerDelegate)pictureItemDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pictureItemDelegate);
  return (MUPlacePictureItemSectionControllerDelegate *)WeakRetained;
}

- (void)setPictureItemDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pictureItemDelegate);
  objc_storeStrong((id *)&self->_sectionHeaderViewModel, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_photoGalleryViewController, 0);
  objc_storeStrong((id *)&self->_attributionViewModel, 0);
  objc_storeStrong((id *)&self->_imageViewForTransition, 0);
  objc_storeStrong((id *)&self->_tilesView, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_annotatedList, 0);
}

@end