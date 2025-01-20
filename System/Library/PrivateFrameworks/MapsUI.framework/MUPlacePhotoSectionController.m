@interface MUPlacePhotoSectionController
- (BOOL)dismissPhotoGalleryIfNecessary:(id)a3;
- (BOOL)hasContent;
- (BOOL)isActive;
- (BOOL)isFirstParty;
- (BOOL)isImpressionable;
- (BOOL)photoSliderView:(id)a3 shouldShowFullWidthForModel:(id)a4;
- (MKLookAroundView)lookAroundView;
- (MUPlacePhotoSectionController)initWithMapItem:(id)a3 configuration:(id)a4;
- (MUPlacePhotoSectionControllerDelegate)photoSectionControllerDelegate;
- (MUPlacePhotoSectionControllerLookAroundDelegate)lookAroundDelegate;
- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel;
- (MUUserInformationProvider)userInfoProvider;
- (MUUserSubmittedPhoto)userSubmittedPhoto;
- (UIView)sectionView;
- (UIViewController)presentingViewController;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)attributionViewModelsForPhotoSliderView:(id)a3;
- (id)draggableContent;
- (id)infoCardChildPossibleActions;
- (id)photoSliderView:(id)a3 photoOverlayForModel:(id)a4;
- (id)photoSliderViewHeaderViewForPhotoSlider:(id)a3;
- (id)photoSliderViewRequestsViewModels:(id)a3;
- (id)placePhotoGalleryImageViewForPhotoAtIndex:(unint64_t)a3;
- (int)analyticsModuleType;
- (int64_t)contentVisibility;
- (int64_t)numberOfUserSubmittedPhotos;
- (unint64_t)numberOfAttributionsForPhotoSliderView:(id)a3;
- (void)_addPhotoButtonTappedWithEntryPoint:(int64_t)a3 presentationOptions:(id)a4;
- (void)_capturePhotoGallerySwipeUserAction:(int)a3 atIndex:(unint64_t)a4;
- (void)_captureSliderInstrumentationWithAction:(int)a3;
- (void)_captureSliderInstrumentationWithAction:(int)a3 eventValue:(id)a4 actionRichProviderId:(id)a5;
- (void)_populateRevealedAnalyticsModule:(id)a3;
- (void)_routeAlbumTapWithViewModel:(id)a3;
- (void)_routeFlatListTapWithViewModel:(id)a3;
- (void)_setContentVisibility:(int64_t)a3;
- (void)_setupSectionView;
- (void)_update;
- (void)lookAroundContainerView:(id)a3 didAddLookAroundView:(id)a4;
- (void)performInstrumentationForScrollLeft;
- (void)performInstrumentationForScrollRight;
- (void)photoGalleryTransitionAnimatorDidFinishAnimation;
- (void)photoSliderView:(id)a3 didTapAttribution:(id)a4;
- (void)photoSliderView:(id)a3 didTapViewModel:(id)a4;
- (void)photoSliderViewDidTapHeaderView:(id)a3;
- (void)placePhotoGallery:(id)a3 attributionViewTappedAtIndex:(unint64_t)a4;
- (void)placePhotoGallery:(id)a3 didSelectReportImageAtIndex:(unint64_t)a4;
- (void)placePhotoGallery:(id)a3 openButtonTappedAtIndex:(unint64_t)a4;
- (void)placePhotoGallery:(id)a3 selectedAddPhotoWithEntryPoint:(int64_t)a4 usingPresentationOptions:(id)a5;
- (void)placePhotoGallery:(id)a3 willCloseAtIndex:(unint64_t)a4;
- (void)placePhotoGalleryAdditionalViewTapped:(id)a3;
- (void)placePhotoGalleryDidCloseAtIndex:(unint64_t)a3;
- (void)placePhotoGalleryDidScrollLeftToIndex:(unint64_t)a3;
- (void)placePhotoGalleryDidScrollRightToIndex:(unint64_t)a3;
- (void)setActive:(BOOL)a3;
- (void)setContentVisibility:(int64_t)a3;
- (void)setLookAroundDelegate:(id)a3;
- (void)setNumberOfUserSubmittedPhotos:(int64_t)a3;
- (void)setPhotoSectionControllerDelegate:(id)a3;
- (void)setUserInfoProvider:(id)a3;
- (void)setUserSubmittedPhoto:(id)a3;
- (void)updateForAttributionChange;
- (void)updateWithUserSubmittedPhotos:(BOOL)a3;
@end

@implementation MUPlacePhotoSectionController

- (MUPlacePhotoSectionController)initWithMapItem:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MUPlacePhotoSectionController;
  v8 = [(MUPlaceSectionController *)&v15 initWithMapItem:v6];
  if (v8)
  {
    v9 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUPlacePhotoSectionControllerInit", "", v14, 2u);
    }

    v10 = [[MUPhotoSliderTileProvider alloc] initWithMapItem:v6];
    photoTileProvider = v8->_photoTileProvider;
    v8->_photoTileProvider = v10;

    objc_storeStrong((id *)&v8->_configuration, a4);
    [(MUPlacePhotoSectionController *)v8 _setupSectionView];
    v12 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUPlacePhotoSectionControllerInit", "", v14, 2u);
    }
  }
  return v8;
}

- (void)_setupSectionView
{
  v3 = -[MUPlacePhotoSliderView initWithDataSource:photoTileSize:]([MUPlacePhotoSliderView alloc], "initWithDataSource:photoTileSize:", self, 175.0, 220.0);
  photoSliderView = self->_photoSliderView;
  self->_photoSliderView = v3;

  [(MUPlacePhotoSliderView *)self->_photoSliderView setDelegate:self];
  [(MUPlacePhotoSliderView *)self->_photoSliderView setAnalyticsDelegate:self];
  if ([(MUPhotoSliderTileProvider *)self->_photoTileProvider showMorePhotoPunchoutAtEndOfSlider])
  {
    v5 = +[MUPunchoutViewModel viewModelForFullScreenGallery];
    attributionViewModel = self->_attributionViewModel;
    self->_attributionViewModel = v5;
  }
  if ([(MUPlacePhotoSectionControllerConfiguration *)self->_configuration supportsARPCallToAction]&& [(MUPhotoSliderTileProvider *)self->_photoTileProvider showARPCallToActionAttributionAtEndOfSlider])
  {
    id v7 = +[MUPunchoutViewModel viewModelForAddPhotos];
    addPhotoViewModel = self->_addPhotoViewModel;
    self->_addPhotoViewModel = v7;

    objc_initWeak(&location, self);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __50__MUPlacePhotoSectionController__setupSectionView__block_invoke;
    v15[3] = &unk_1E574F3A8;
    objc_copyWeak(&v16, &location);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50__MUPlacePhotoSectionController__setupSectionView__block_invoke_2;
    v13[3] = &unk_1E574F3A8;
    objc_copyWeak(&v14, &location);
    v9 = +[MUPhotoOptionsMenuButton menuForPhotoOptionsMenuButtonWithCameraCompletion:v15 libraryCompletion:v13];
    [(MUPunchoutViewModel *)self->_addPhotoViewModel setMenu:v9];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  v10 = [[MUPlaceSectionView alloc] initWithStyle:0 alwaysHideSeparators:0];
  [(MUPlaceSectionView *)v10 attachViewToContentView:self->_photoSliderView];
  sectionView = self->_sectionView;
  self->_sectionView = v10;
  v12 = v10;

  [(MUPlaceSectionView *)self->_sectionView configureWithSectionController:self];
}

void __50__MUPlacePhotoSectionController__setupSectionView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = objc_alloc_init(MUPresentationOptions);
    [WeakRetained _addPhotoButtonTappedWithEntryPoint:1 presentationOptions:v1];
  }
}

void __50__MUPlacePhotoSectionController__setupSectionView__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = objc_alloc_init(MUPresentationOptions);
    [WeakRetained _addPhotoButtonTappedWithEntryPoint:2 presentationOptions:v1];
  }
}

- (UIView)sectionView
{
  return (UIView *)self->_sectionView;
}

- (BOOL)hasContent
{
  if ([(MUPlacePhotoSectionControllerConfiguration *)self->_configuration showLookAround])
  {
    v3 = [(MUPlaceSectionController *)self mapItem];
    char v4 = [v3 _hasLookAroundStorefront];

    if (v4) {
      return 1;
    }
  }
  v5 = [(MUPlacePhotoSectionController *)self userSubmittedPhoto];

  if (v5) {
    return 1;
  }
  id v7 = [(MUPhotoSliderTileProvider *)self->_photoTileProvider photos];
  BOOL v6 = [v7 count] != 0;

  return v6;
}

- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel
{
  return 0;
}

- (UIViewController)presentingViewController
{
  return [(MUPlacePhotoSectionControllerConfiguration *)self->_configuration presentingViewController];
}

- (void)photoSliderView:(id)a3 didTapViewModel:(id)a4
{
  id v8 = a4;
  id v5 = [(MUPlacePhotoSectionController *)self userSubmittedPhoto];

  if (v5 == v8 || (uint64_t v6 = [(MUPhotoSliderTileProvider *)self->_photoTileProvider displayType], v6 == 1))
  {
    uint64_t v6 = [(MUPlacePhotoSectionController *)self _routeAlbumTapWithViewModel:v8];
  }
  else
  {
    id v7 = v8;
    if (v6) {
      goto LABEL_7;
    }
    uint64_t v6 = [(MUPlacePhotoSectionController *)self _routeFlatListTapWithViewModel:v8];
  }
  id v7 = v8;
LABEL_7:
  MEMORY[0x1F41817F8](v6, v7);
}

- (void)_routeFlatListTapWithViewModel:(id)a3
{
  id v38 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [(MUPlacePhotoSectionController *)self userSubmittedPhoto];
    if (v4)
    {
      id v5 = (void *)v4;
      uint64_t v6 = [(MUPlaceSectionController *)self mapItem];
      int v7 = objc_msgSend(v6, "_mapkit_supportsFullScreenExperience");

      if (v7)
      {
        [(MUPlacePhotoSectionController *)self _routeAlbumTapWithViewModel:v38];
        goto LABEL_15;
      }
    }
    id v8 = v38;
    v9 = [(MUPhotoSliderTileProvider *)self->_photoTileProvider photos];
    uint64_t v10 = [v9 indexOfObject:v8];

    if ([(MUPhotoSliderTileProvider *)self->_photoTileProvider shouldRouteToPhotoThumbnailGallery])
    {
      v11 = [(MUPlacePhotoSectionController *)self photoSectionControllerDelegate];
      char v12 = objc_opt_respondsToSelector();

      if (v12)
      {
        v13 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v10);
        [(MUPlaceSectionController *)self captureInfoCardAction:6006 eventValue:v13 feedbackType:0 actionRichProviderId:0];

        [(MUPlacePhotoSectionController *)self _captureSliderInstrumentationWithAction:6087];
        id v14 = [(MUPlacePhotoSectionController *)self photoSectionControllerDelegate];
        [v14 placePhotoSectionControllerRequestsToOpenThumbnailGallery:self withStartingIndex:v10];
LABEL_13:
      }
LABEL_14:

      goto LABEL_15;
    }
    if ([(MUPhotoSliderTileProvider *)self->_photoTileProvider showFullScreen]
      && ![v8 needsObfuscationWhenRenderedInFullScreen])
    {
      v23 = [MUPlacePhotoGalleryViewController alloc];
      v24 = [(MUPhotoSliderTileProvider *)self->_photoTileProvider photos];
      v25 = [(MUPlaceSectionController *)self mapItem];
      v26 = [(MUPlacePhotoGalleryViewController *)v23 initWithPhotos:v24 additionalView:0 scrollToIndex:v10 mapItem:v25 delegate:self];
      photoGalleryViewController = self->_photoGalleryViewController;
      self->_photoGalleryViewController = v26;

      v28 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v10);
      v29 = [v8 attribution];
      v30 = [v29 providerID];
      [(MUPlacePhotoSectionController *)self _captureSliderInstrumentationWithAction:6006 eventValue:v28 actionRichProviderId:v30];

      [(MUPlacePhotoSectionController *)self _captureSliderInstrumentationWithAction:6087];
      if (MapKitIdiomIsMacCatalyst())
      {
        v31 = [(MUPlacePhotoSectionController *)self photoSectionControllerDelegate];
        char v32 = objc_opt_respondsToSelector();

        if (v32)
        {
          id v14 = [(MUPlacePhotoSectionController *)self photoSectionControllerDelegate];
          [v14 placePhotoSectionController:self requestsSceneActivationForPhotoGalleryViewController:self->_photoGalleryViewController];
          goto LABEL_13;
        }
      }
      id v14 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:self->_photoGalleryViewController];
      uint64_t v33 = [v14 navigationController];
      [(id)v33 setNavigationBarHidden:1 animated:0];

      [v14 setModalPresentationStyle:5];
      [v14 setTransitioningDelegate:self];
      v34 = [(MUPlacePhotoSliderView *)self->_photoSliderView imageViewForIndex:v10];
      imageViewForTransition = self->_imageViewForTransition;
      self->_imageViewForTransition = v34;

      v36 = [(MUPlacePhotoSectionController *)self presentingViewController];
      [v36 presentViewController:v14 animated:1 completion:0];

      v37 = [(MUPlacePhotoSectionController *)self photoSectionControllerDelegate];
      LOBYTE(v33) = objc_opt_respondsToSelector();

      if ((v33 & 1) == 0) {
        goto LABEL_13;
      }
      v21 = [(MUPlacePhotoSectionController *)self photoSectionControllerDelegate];
      [v21 placePhotoSectionControllerDidOpenFullscreenPhotos:self];
    }
    else
    {
      objc_super v15 = [(MUPlacePhotoSectionController *)self photoSectionControllerDelegate];
      char v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) == 0) {
        goto LABEL_14;
      }
      v17 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v10);
      [(MUPlacePhotoSectionController *)self _captureSliderInstrumentationWithAction:6006 eventValue:v17 actionRichProviderId:0];

      v18 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v10);
      v19 = [v8 attribution];
      v20 = [v19 providerID];
      [(MUPlacePhotoSectionController *)self _captureSliderInstrumentationWithAction:6018 eventValue:v18 actionRichProviderId:v20];

      id v14 = [(MUPlacePhotoSectionController *)self photoSectionControllerDelegate];
      v21 = [v8 photoID];
      v22 = [(MUPlacePhotoSectionController *)self presentingViewController];
      [v14 placePhotoSectionController:self didSelectViewPhoto:v8 withID:v21 presentingViewController:v22];
    }
    goto LABEL_13;
  }
LABEL_15:
}

- (void)_routeAlbumTapWithViewModel:(id)a3
{
  id v24 = a3;
  uint64_t v4 = [(MUPlacePhotoSectionController *)self photoSectionControllerDelegate];
  char v5 = objc_opt_respondsToSelector();

  uint64_t v6 = v24;
  if (v5)
  {
    if (v24)
    {
      id v7 = [(MUPlacePhotoSectionController *)self userSubmittedPhoto];
      BOOL v8 = v7 == v24;

      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
    else
    {
      BOOL v8 = 0;
      char isKindOfClass = 0;
    }
    int64_t v10 = [(MUPhotoSliderTileProvider *)self->_photoTileProvider displayType];
    if (v8)
    {
      [(MUPlacePhotoSectionController *)self _captureSliderInstrumentationWithAction:329];
      v11 = [(MUPlacePhotoSectionController *)self photoSectionControllerDelegate];
      char v12 = v11;
      v13 = self;
      uint64_t v14 = 0;
    }
    else
    {
      int64_t v15 = v10;
      uint64_t v6 = v24;
      if ((isKindOfClass & 1) == 0) {
        goto LABEL_13;
      }
      char v16 = [(MUPhotoSliderTileProvider *)self->_photoTileProvider photos];
      uint64_t v17 = [v16 indexOfObject:v24];

      if (v15 == 1)
      {
        v18 = [(MUPhotoSliderTileProvider *)self->_photoTileProvider albumIdForPhoto:v24];
        [(MUPlacePhotoSectionController *)self _captureSliderInstrumentationWithAction:284 eventValue:v18 actionRichProviderId:0];

        v19 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v17);
        [(MUPlacePhotoSectionController *)self _captureSliderInstrumentationWithAction:6006 eventValue:v19 actionRichProviderId:0];

        v20 = [(MUPlacePhotoSectionController *)self photoSliderViewRequestsViewModels:self->_photoSliderView];
        uint64_t v21 = [v20 indexOfObject:v24];
      }
      else
      {
        v22 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v17);
        [(MUPlacePhotoSectionController *)self _captureSliderInstrumentationWithAction:6006 eventValue:v22 actionRichProviderId:0];

        v23 = [(MUPlacePhotoSectionController *)self userSubmittedPhoto];
        uint64_t v21 = v23 != 0;
      }
      v11 = [(MUPlacePhotoSectionController *)self photoSectionControllerDelegate];
      char v12 = v11;
      v13 = self;
      uint64_t v14 = v21;
    }
    [v11 placePhotoSectionController:v13 didSelectPhotoCategoryAtIndex:v14];

    uint64_t v6 = v24;
  }
LABEL_13:
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    uint64_t v4 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUPlacePhotoSectionControllerActivate", "", buf, 2u);
    }

    [(MUPlacePhotoSectionController *)self _update];
    char v5 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUPlacePhotoSectionControllerActivate", "", v6, 2u);
    }
  }
}

- (void)_update
{
  if (self->_active) {
    [(MUPlacePhotoSliderView *)self->_photoSliderView displayPhotos];
  }
}

- (id)photoSliderViewRequestsViewModels:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  char v5 = [(MUPlacePhotoSectionController *)self userSubmittedPhoto];
  objc_msgSend(v4, "_mapsui_addObjectIfNotNil:", v5);

  uint64_t v6 = [(MUPhotoSliderTileProvider *)self->_photoTileProvider photos];
  objc_msgSend(v4, "_mapsui_addObjectsFromArrayIfNotNil:", v6);

  id v7 = (void *)[v4 copy];
  return v7;
}

- (BOOL)photoSliderView:(id)a3 shouldShowFullWidthForModel:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [(MUPhotoSliderTileProvider *)self->_photoTileProvider photos];
    uint64_t v8 = [v7 count];

    v9 = [(MUPhotoSliderTileProvider *)self->_photoTileProvider photos];
    int64_t v10 = v9;
    if (v8 == 1)
    {
      v11 = [v9 firstObject];

      char v12 = [(MUPlacePhotoSectionController *)self userSubmittedPhoto];
      v13 = [v12 photoID];
      uint64_t v14 = [v11 photoID];
      char v15 = [v13 isEqualToString:v14];

      if (v15) {
        return 1;
      }
    }
    else
    {
      uint64_t v17 = [v9 count];

      if (!v17) {
        return 1;
      }
    }
  }
  uint64_t v18 = [(MUPlacePhotoSectionController *)self userSubmittedPhoto];
  if (v18)
  {
    v19 = (void *)v18;
    v20 = [(MUPhotoSliderTileProvider *)self->_photoTileProvider photos];
    uint64_t v21 = [v20 count];

    if (v21) {
      return 0;
    }
  }
  if (self->_lookAroundContainerView) {
    return 0;
  }
  v22 = [(MUPhotoSliderTileProvider *)self->_photoTileProvider photos];
  BOOL v16 = [v22 count] == 1;

  return v16;
}

- (void)updateWithUserSubmittedPhotos:(BOOL)a3
{
  [(MUPlacePhotoSliderView *)self->_photoSliderView updatePhotoSliderViews:a3];
  id v4 = [(MUPlaceSectionController *)self delegate];
  [v4 placeSectionControllerDidUpdateContent:self];

  [(MUPlacePhotoSectionController *)self _captureSliderInstrumentationWithAction:335];
}

- (id)photoSliderView:(id)a3 photoOverlayForModel:(id)a4
{
  id v5 = a4;
  id v6 = [(MUPlacePhotoSectionController *)self userSubmittedPhoto];

  photoTileProvider = self->_photoTileProvider;
  if (v6 == v5) {
    [(MUPhotoSliderTileProvider *)photoTileProvider yourPhotosTileOverlay];
  }
  else {
  uint64_t v8 = [(MUPhotoSliderTileProvider *)photoTileProvider overlayForPhoto:v5];
  }

  return v8;
}

- (id)attributionViewModelsForPhotoSliderView:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = v4;
  if (self->_addPhotoViewModel) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_attributionViewModel) {
    objc_msgSend(v5, "addObject:");
  }
  id v6 = (void *)[v5 copy];

  return v6;
}

- (unint64_t)numberOfAttributionsForPhotoSliderView:(id)a3
{
  attributionViewModel = self->_attributionViewModel;
  BOOL v4 = attributionViewModel == 0;
  unint64_t v5 = attributionViewModel != 0;
  unint64_t v6 = 1;
  if (!v4) {
    unint64_t v6 = 2;
  }
  if (self->_addPhotoViewModel) {
    return v6;
  }
  else {
    return v5;
  }
}

- (void)photoSliderView:(id)a3 didTapAttribution:(id)a4
{
  uint64_t v14 = (MUPunchoutViewModel *)a4;
  unint64_t v5 = [(MUPlacePhotoSliderView *)self->_photoSliderView attributionViewForAttribution:v14];
  unint64_t v6 = objc_alloc_init(MUPresentationOptions);
  [(MUPresentationOptions *)v6 setProgressObserver:v5];
  [(MUPresentationOptions *)v6 setSourceView:v5];
  [v5 frame];
  -[MUPresentationOptions setSourceRect:](v6, "setSourceRect:");
  if (self->_attributionViewModel == v14)
  {
    if ([(MUPhotoSliderTileProvider *)self->_photoTileProvider displayType] == 1)
    {
      [(MUPlacePhotoSectionController *)self _captureSliderInstrumentationWithAction:6018];
      id v7 = [(MUPhotoSliderTileProvider *)self->_photoTileProvider photos];
      uint64_t v8 = [v7 firstObject];
      [(MUPlacePhotoSectionController *)self _routeAlbumTapWithViewModel:v8];
    }
    else
    {
      v9 = [(MUPlaceSectionController *)self mapItem];
      int v10 = objc_msgSend(v9, "_mapkit_hasMultiplePhotoVendors");

      if (v10)
      {
        [(MUPlacePhotoSectionController *)self _captureSliderInstrumentationWithAction:6018];
        id v7 = [(MUPlacePhotoSectionController *)self photoSectionControllerDelegate];
        [v7 placePhotoSectionControllerRequestsToOpenThumbnailGallery:self withStartingIndex:0];
        goto LABEL_9;
      }
      v11 = [(MUPlaceSectionController *)self mapItem];
      id v7 = objc_msgSend(v11, "_mapkit_preferredFirstPhotoVendor");

      int v12 = [v7 shouldHandlePhotosLocally];
      v13 = [v7 providerID];
      if (v12)
      {
        [(MUPlacePhotoSectionController *)self _captureSliderInstrumentationWithAction:6018 eventValue:0 actionRichProviderId:v13];

        uint64_t v8 = [(MUPlacePhotoSectionController *)self photoSectionControllerDelegate];
        [v8 placePhotoSectionControllerRequestsToOpenThumbnailGallery:self withStartingIndex:0];
      }
      else
      {
        [(MUPlacePhotoSectionController *)self _captureSliderInstrumentationWithAction:6023 eventValue:0 actionRichProviderId:v13];

        uint64_t v8 = [(MUPlacePhotoSectionController *)self photoSectionControllerDelegate];
        [v8 placePhotoSectionController:self requestsToOpenPhotoAttribution:v7 presentationOptions:v6];
      }
    }

LABEL_9:
    goto LABEL_10;
  }
  if (self->_addPhotoViewModel == v14) {
    [(MUPlacePhotoSectionController *)self _addPhotoButtonTappedWithEntryPoint:2 presentationOptions:v6];
  }
LABEL_10:
}

- (void)photoSliderViewDidTapHeaderView:(id)a3
{
  [(MUPlaceSectionController *)self captureInfoCardAction:6060 eventValue:0 feedbackType:0 actionRichProviderId:0];
  id v6 = [(MUPlacePhotoSectionController *)self lookAroundDelegate];
  BOOL v4 = [(MUPlaceSectionController *)self mapItem];
  unint64_t v5 = [(MKLookAroundContainerView *)self->_lookAroundContainerView lookAroundViewIfPresent];
  [v6 placePhotoSectionController:self enterLookAroundForMapItem:v4 lookAroundView:v5];
}

- (id)photoSliderViewHeaderViewForPhotoSlider:(id)a3
{
  if (![(MUPlacePhotoSectionControllerConfiguration *)self->_configuration showLookAround]) {
    goto LABEL_4;
  }
  BOOL v4 = [(MUPlaceSectionController *)self mapItem];
  int v5 = [v4 _hasLookAroundStorefront];

  if (!v5) {
    goto LABEL_4;
  }
  if (!self->_lookAroundContainerView
    && ([(MUPlacePhotoSectionController *)self lookAroundDelegate],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v8 lookAroundContainerForPlacePhotoSectionController:self],
        v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9))
  {
    int v10 = [(MUPlacePhotoSectionController *)self lookAroundDelegate];
    v11 = [v10 lookAroundContainerForPlacePhotoSectionController:self];
    lookAroundContainerView = self->_lookAroundContainerView;
    self->_lookAroundContainerView = v11;

    [(MKLookAroundContainerView *)self->_lookAroundContainerView setDelegate:self];
    v13 = self->_lookAroundContainerView;
    uint64_t v14 = [(MUPlaceSectionController *)self mapItem];
    [(MKLookAroundContainerView *)v13 setMapItem:v14 wantsCloseUpView:1];

    id v6 = self->_lookAroundContainerView;
  }
  else
  {
LABEL_4:
    id v6 = 0;
  }
  return v6;
}

- (MKLookAroundView)lookAroundView
{
  return (MKLookAroundView *)[(MKLookAroundContainerView *)self->_lookAroundContainerView lookAroundViewIfPresent];
}

- (void)_addPhotoButtonTappedWithEntryPoint:(int64_t)a3 presentationOptions:(id)a4
{
  id v6 = a4;
  [(MUPlaceSectionController *)self captureInfoCardAction:2147 eventValue:@"photo slider" feedbackType:0 actionRichProviderId:0];
  id v7 = [(MUPlacePhotoSectionController *)self photoSectionControllerDelegate];
  [v7 placePhotoSectionController:self requestsAddPhotosToMapsWithEntryPoint:a3 options:v6];
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v6 = objc_alloc(MEMORY[0x1E4FB1838]);
  id v7 = [(UIImageView *)self->_imageViewForTransition image];
  uint64_t v8 = (void *)[v6 initWithImage:v7];

  objc_msgSend(v8, "setContentMode:", -[UIImageView contentMode](self->_imageViewForTransition, "contentMode"));
  v9 = [[MUPhotoGalleryTransitionAnimator alloc] initWithView:self->_imageViewForTransition transitionView:v8];
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
  id v7 = [v6 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v9 = [v5 viewControllers];
    int v10 = [v9 firstObject];

    if (v10)
    {
      unint64_t v11 = [v10 indexOfVisibleView];
      if (v11 >= [(MUPhotoSliderTileProvider *)self->_photoTileProvider numberOfPhotos])
      {
        BOOL v16 = 0;
      }
      else
      {
        int v12 = [(MUPlacePhotoSliderView *)self->_photoSliderView imageViewForIndex:v11];
        id v13 = objc_alloc(MEMORY[0x1E4FB1838]);
        uint64_t v14 = [v12 image];
        char v15 = (void *)[v13 initWithImage:v14];

        objc_msgSend(v15, "setContentMode:", objc_msgSend(v12, "contentMode"));
        BOOL v16 = [[MUPhotoGalleryTransitionAnimator alloc] initWithView:v12 transitionView:v15];
        [(MUPhotoGalleryTransitionAnimator *)v16 setDelegate:self];
      }
      id v5 = v10;
      goto LABEL_10;
    }
LABEL_6:
    BOOL v16 = 0;
    goto LABEL_11;
  }
  BOOL v16 = 0;
LABEL_10:

LABEL_11:
  return v16;
}

- (void)placePhotoGalleryDidScrollLeftToIndex:(unint64_t)a3
{
}

- (void)placePhotoGalleryDidScrollRightToIndex:(unint64_t)a3
{
}

- (void)placePhotoGallery:(id)a3 willCloseAtIndex:(unint64_t)a4
{
  id v6 = [(MUPhotoSliderTileProvider *)self->_photoTileProvider photos];
  unint64_t v7 = [v6 count];

  if (v7 <= a4)
  {
    v9 = [(MUPhotoSliderTileProvider *)self->_photoTileProvider photos];
    unint64_t v10 = [v9 count] + 1;

    if (v10 <= a4)
    {
      uint64_t v8 = 0;
    }
    else
    {
      uint64_t v8 = [(MUPlacePhotoSliderView *)self->_photoSliderView attributionViewForAttribution:self->_attributionViewModel];
    }
  }
  else
  {
    uint64_t v8 = [(MUPlacePhotoSliderView *)self->_photoSliderView imageViewForIndex:a4];
  }
  photoSliderView = self->_photoSliderView;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__MUPlacePhotoSectionController_placePhotoGallery_willCloseAtIndex___block_invoke;
  v13[3] = &unk_1E57505A0;
  id v14 = v8;
  id v12 = v8;
  [(MUPlacePhotoSliderView *)photoSliderView enumerateImageViewsWithBlock:v13];
  [(MUPlacePhotoSliderView *)self->_photoSliderView scrollToViewAtIndex:a4];
}

uint64_t __68__MUPlacePhotoSectionController_placePhotoGallery_willCloseAtIndex___block_invoke(uint64_t a1, void *a2)
{
  double v2 = 1.0;
  if (*(void **)(a1 + 32) == a2) {
    double v2 = 0.0;
  }
  return [a2 setAlpha:v2];
}

- (void)placePhotoGalleryDidCloseAtIndex:(unint64_t)a3
{
  id v4 = [(MUPlacePhotoSectionController *)self photoSectionControllerDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(MUPlacePhotoSectionController *)self photoSectionControllerDelegate];
    [v6 placePhotoSectionControllerDidCloseFullscreenPhotos:self];
  }
}

- (void)placePhotoGalleryAdditionalViewTapped:(id)a3
{
}

- (void)placePhotoGallery:(id)a3 attributionViewTappedAtIndex:(unint64_t)a4
{
  id v6 = [(MUPlacePhotoSectionController *)self photoSectionControllerDelegate];
  [v6 placePhotoSectionController:self didSelectPhotoCategoryAtIndex:a4];
}

- (void)placePhotoGallery:(id)a3 openButtonTappedAtIndex:(unint64_t)a4
{
  id v16 = a3;
  id v6 = [(MUPhotoSliderTileProvider *)self->_photoTileProvider photos];
  unint64_t v7 = [v6 count];

  if (v7 > a4)
  {
    uint64_t v8 = [(MUPlacePhotoSectionController *)self photoSectionControllerDelegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      BOOL v10 = [(MUPlacePhotoSectionController *)self dismissPhotoGalleryIfNecessary:v16];
      unint64_t v11 = [(MUPhotoSliderTileProvider *)self->_photoTileProvider photos];
      id v12 = [v11 objectAtIndex:a4];

      id v13 = [(MUPlacePhotoSectionController *)self photoSectionControllerDelegate];
      id v14 = [v12 photoID];
      if (v10) {
        id v15 = 0;
      }
      else {
        id v15 = v16;
      }
      [v13 placePhotoSectionController:self didSelectViewPhoto:v12 withID:v14 presentingViewController:v15];
    }
  }
}

- (void)placePhotoGallery:(id)a3 didSelectReportImageAtIndex:(unint64_t)a4
{
  id v11 = a3;
  id v6 = [(MUPlacePhotoSectionController *)self photoSectionControllerDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v8 = [(MUPhotoSliderTileProvider *)self->_photoTileProvider photoItemAtIndex:a4];
    [(MUPlacePhotoSectionController *)self _captureSliderInstrumentationWithAction:86];
    char v9 = [(MUPlacePhotoSectionController *)self photoSectionControllerDelegate];
    BOOL v10 = [v8 geoMapItemPhoto];
    [v9 placePhotoSectionController:self didSelectPhotoToReport:v10 withPhotoGalleryViewController:v11];
  }
}

- (void)placePhotoGallery:(id)a3 selectedAddPhotoWithEntryPoint:(int64_t)a4 usingPresentationOptions:(id)a5
{
}

- (id)placePhotoGalleryImageViewForPhotoAtIndex:(unint64_t)a3
{
  return [(MUPlacePhotoSliderView *)self->_photoSliderView imageViewForIndex:a3];
}

- (id)draggableContent
{
  return 0;
}

- (void)updateForAttributionChange
{
}

- (void)photoGalleryTransitionAnimatorDidFinishAnimation
{
}

- (BOOL)dismissPhotoGalleryIfNecessary:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[MapsUIUtilities isSafariProcess];
  if (v4) {
    [v3 dismissViewControllerAnimated:1 completion:0];
  }

  return v4;
}

- (BOOL)isFirstParty
{
  double v2 = [(MUPlaceSectionController *)self mapItem];
  id v3 = objc_msgSend(v2, "_mapkit_preferredFirstPhotoVendor");
  char v4 = [v3 shouldHandlePhotosLocally];

  return v4;
}

- (void)performInstrumentationForScrollLeft
{
}

- (void)performInstrumentationForScrollRight
{
}

- (void)_captureSliderInstrumentationWithAction:(int)a3
{
}

- (void)_captureSliderInstrumentationWithAction:(int)a3 eventValue:(id)a4 actionRichProviderId:(id)a5
{
}

- (void)_capturePhotoGallerySwipeUserAction:(int)a3 atIndex:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v13[1] = *MEMORY[0x1E4F143B8];
  char v7 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", a4);
  [(MUPlaceSectionController *)self captureInfoCardAction:v5 target:612 eventValue:v7];
  uint64_t v8 = [(MUPlacePhotoGalleryViewController *)self->_photoGalleryViewController currentPhoto];
  char v9 = [v8 attribution];

  if ([v9 isUserSubmitted])
  {
    BOOL v10 = (void *)MEMORY[0x1E4F63E30];
    id v11 = [NSNumber numberWithUnsignedInteger:a4];
    v13[0] = v11;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    [v10 captureUGCUserAction:v5 target:612 value:v7 photoSources:v12];
  }
}

- (int)analyticsModuleType
{
  return 4;
}

- (BOOL)isImpressionable
{
  return [(MUPhotoSliderTileProvider *)self->_photoTileProvider numberOfPhotos]
      || self->_lookAroundContainerView != 0;
}

- (void)_populateRevealedAnalyticsModule:(id)a3
{
  photoTileProvider = self->_photoTileProvider;
  id v4 = a3;
  MUPhotosRevealedModuleForProvider(photoTileProvider);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setPhotos:v5];
}

- (void)_setContentVisibility:(int64_t)a3
{
  if ([(MUPlacePhotoSectionController *)self contentVisibility] == a3) {
    return;
  }
  id v11 = [(MKLookAroundContainerView *)self->_lookAroundContainerView lookAroundViewIfPresent];
  id v5 = [(MUPlacePhotoSectionController *)self lookAroundDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = [(MUPlacePhotoSectionController *)self lookAroundDelegate];
    char v8 = [v7 shouldMoveLookAroundStorefrontViewForPlacePhotoSectionController:self];

    char v9 = v8 ^ 1;
  }
  else
  {
    char v9 = 0;
  }
  BOOL v10 = v11;
  if (v11 && (v9 & 1) == 0)
  {
    if (a3 == 2)
    {
      [v11 moveToStandOffView];
      goto LABEL_11;
    }
    if (a3 == 3)
    {
      [v11 moveToCloseUpView];
LABEL_11:
      BOOL v10 = v11;
    }
  }
}

- (void)lookAroundContainerView:(id)a3 didAddLookAroundView:(id)a4
{
  id v8 = a4;
  if (MapKitIdiomIsMacCatalyst()) {
    goto LABEL_5;
  }
  int64_t v5 = [(MUPlacePhotoSectionController *)self contentVisibility];
  if (v5 == 2)
  {
    [v8 moveToStandOffView];
    goto LABEL_7;
  }
  BOOL v6 = v5 == 3;
  char v7 = v8;
  if (v6)
  {
LABEL_5:
    [v8 moveToCloseUpView];
LABEL_7:
    char v7 = v8;
  }
}

- (id)infoCardChildPossibleActions
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = v3;
  if (self->_lookAroundContainerView) {
    [v3 addObject:&unk_1EE404D30];
  }
  if ([(MUPhotoSliderTileProvider *)self->_photoTileProvider showFullScreen]) {
    int64_t v5 = &unk_1EE404D60;
  }
  else {
    int64_t v5 = &unk_1EE404D48;
  }
  [v4 addObject:v5];
  BOOL v6 = (void *)[v4 copy];

  return v6;
}

- (BOOL)isActive
{
  return self->_active;
}

- (MUPlacePhotoSectionControllerLookAroundDelegate)lookAroundDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lookAroundDelegate);
  return (MUPlacePhotoSectionControllerLookAroundDelegate *)WeakRetained;
}

- (void)setLookAroundDelegate:(id)a3
{
}

- (MUPlacePhotoSectionControllerDelegate)photoSectionControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoSectionControllerDelegate);
  return (MUPlacePhotoSectionControllerDelegate *)WeakRetained;
}

- (void)setPhotoSectionControllerDelegate:(id)a3
{
}

- (MUUserInformationProvider)userInfoProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userInfoProvider);
  return (MUUserInformationProvider *)WeakRetained;
}

- (void)setUserInfoProvider:(id)a3
{
}

- (MUUserSubmittedPhoto)userSubmittedPhoto
{
  return self->_userSubmittedPhoto;
}

- (void)setUserSubmittedPhoto:(id)a3
{
}

- (int64_t)numberOfUserSubmittedPhotos
{
  return self->_numberOfUserSubmittedPhotos;
}

- (void)setNumberOfUserSubmittedPhotos:(int64_t)a3
{
  self->_numberOfUserSubmittedPhotos = a3;
}

- (int64_t)contentVisibility
{
  return self->_contentVisibility;
}

- (void)setContentVisibility:(int64_t)a3
{
  self->_contentVisibility = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userSubmittedPhoto, 0);
  objc_destroyWeak((id *)&self->_userInfoProvider);
  objc_destroyWeak((id *)&self->_photoSectionControllerDelegate);
  objc_destroyWeak((id *)&self->_lookAroundDelegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_lookAroundContainerView, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_addPhotoViewModel, 0);
  objc_storeStrong((id *)&self->_attributionViewModel, 0);
  objc_storeStrong((id *)&self->_imageViewForTransition, 0);
  objc_storeStrong((id *)&self->_photoGalleryViewController, 0);
  objc_storeStrong((id *)&self->_photoSliderView, 0);
  objc_storeStrong((id *)&self->_photoTileProvider, 0);
}

@end