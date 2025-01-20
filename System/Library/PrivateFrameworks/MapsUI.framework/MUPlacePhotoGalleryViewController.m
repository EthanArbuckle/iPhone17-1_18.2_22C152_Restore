@interface MUPlacePhotoGalleryViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)canBecomeFirstResponder;
- (BOOL)enablePersonalizedAttribution;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)panAndSwipeToDismissGestureEnabled;
- (BOOL)shouldFinishAnimation;
- (CGPoint)imageViewCenterPoint;
- (CGPoint)scrollViewContentOffset;
- (MKMapItem)mapItem;
- (MUPlacePhotoGalleryAttributionView)attributionView;
- (MUPlacePhotoGalleryViewController)initWithPhotos:(id)a3 additionalView:(id)a4 scrollToIndex:(unint64_t)a5 mapItem:(id)a6 delegate:(id)a7;
- (MUPlacePhotoGalleryViewControllerDelegate)delegate;
- (MUPlaceUserAttributionViewModel)userAttributionViewModel;
- (NSArray)photoViews;
- (NSArray)photos;
- (NSMutableArray)downloadingImagesURLs;
- (NSMutableArray)indexesOfDownloadedImages;
- (NSNumber)originalIndex;
- (UIActivityIndicatorView)spinner;
- (UIBarButtonItem)addPhotoBarButtonItem;
- (UIBarButtonItem)backBarButtonItem;
- (UIBarButtonItem)openNavigationBarButton;
- (UIScrollView)scrollView;
- (UIView)additionalView;
- (UIView)gestureTrackedView;
- (UIView)rapBarButtonView;
- (double)lastScrollViewOffsetBeforeScrolling;
- (id)currentPhoto;
- (id)keyCommands;
- (id)photoViewForTransition;
- (int64_t)panGestureStartingDirection;
- (unint64_t)indexOfView:(id)a3;
- (unint64_t)indexOfVisibleView;
- (unint64_t)viewsCount;
- (void)_addPhoto;
- (void)_didTapDeletePhotoMenuItemForImageAtIndex:(unint64_t)a3;
- (void)_didTapEditPhotoCreditMenuItem;
- (void)_rapButtonPressed;
- (void)_selectedAddPhotosWithEntryPoint:(int64_t)a3;
- (void)_updateNavbarVisibility;
- (void)attributionViewDidSelectDeletePhoto:(id)a3;
- (void)beginAnimatingActivityIndicator;
- (void)cancelDownloadingImages;
- (void)dealloc;
- (void)didTapDone;
- (void)didTapOnAdditionalView;
- (void)didTapOnAttributionView;
- (void)didTapOpen;
- (void)dismiss;
- (void)downloadImageForPhotoViewAtIndex:(unint64_t)a3;
- (void)downloadImageForURL:(id)a3 forIndex:(unint64_t)a4;
- (void)downloadImageForVisibleViews;
- (void)endAnimatingActivityIndicatorWithError:(id)a3;
- (void)handlePanGesture:(id)a3;
- (void)reloadUserAttribution;
- (void)resetPhotosZoomLevel;
- (void)scrollLeft;
- (void)scrollRight;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setAdditionalView:(id)a3;
- (void)setAttributionView:(id)a3;
- (void)setBackBarButtonItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDownloadingImagesURLs:(id)a3;
- (void)setEnablePersonalizedAttribution:(BOOL)a3;
- (void)setGestureTrackedView:(id)a3;
- (void)setImageViewCenterPoint:(CGPoint)a3;
- (void)setIndexesOfDownloadedImages:(id)a3;
- (void)setLastScrollViewOffsetBeforeScrolling:(double)a3;
- (void)setMapItem:(id)a3;
- (void)setOpenNavigationBarButton:(id)a3;
- (void)setOriginalIndex:(id)a3;
- (void)setPanAndSwipeToDismissGestureEnabled:(BOOL)a3;
- (void)setPanGestureStartingDirection:(int64_t)a3;
- (void)setPhotoViews:(id)a3;
- (void)setPhotos:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setShouldFinishAnimation:(BOOL)a3;
- (void)setSpinner:(id)a3;
- (void)setUIStyleWithNavigationBarHidden:(BOOL)a3;
- (void)setUserAttributionViewModel:(id)a3;
- (void)setupAdditionalView:(id)a3 withStackView:(id)a4;
- (void)setupAttributionView;
- (void)setupPhotoViewsWithStackView:(id)a3;
- (void)setupViewsWithAdditionalView:(id)a3;
- (void)startAnimatingActivityIndicatorViewForRAP;
- (void)stopAnimatingActivityIndicatorViewForRAP;
- (void)toggleBackground:(id)a3;
- (void)updateViewsWithPhotoAtIndex:(unint64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)zoomToPoint:(id)a3;
@end

@implementation MUPlacePhotoGalleryViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MUPlacePhotoGalleryViewController)initWithPhotos:(id)a3 additionalView:(id)a4 scrollToIndex:(unint64_t)a5 mapItem:(id)a6 delegate:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)MUPlacePhotoGalleryViewController;
  v16 = [(MUPlacePhotoGalleryViewController *)&v26 initWithNibName:0 bundle:0];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    photos = v16->_photos;
    v16->_photos = (NSArray *)v17;

    objc_storeStrong((id *)&v16->_mapItem, a6);
    objc_storeWeak((id *)&v16->_delegate, v15);
    uint64_t v19 = [NSNumber numberWithUnsignedInteger:a5];
    originalIndex = v16->_originalIndex;
    v16->_originalIndex = (NSNumber *)v19;

    objc_storeStrong((id *)&v16->_additionalView, a4);
    uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](v16->_photos, "count"));
    indexesOfDownloadedImages = v16->_indexesOfDownloadedImages;
    v16->_indexesOfDownloadedImages = (NSMutableArray *)v21;

    uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](v16->_photos, "count"));
    downloadingImagesURLs = v16->_downloadingImagesURLs;
    v16->_downloadingImagesURLs = (NSMutableArray *)v23;

    v16->_panAndSwipeToDismissGestureEnabled = 1;
  }

  return v16;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)keyCommands
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2B08] modifierFlags:0 action:sel_didTapDone];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MUPlacePhotoGalleryViewController;
  [(MUPlacePhotoGalleryViewController *)&v4 viewDidAppear:a3];
  [(MUPlacePhotoGalleryViewController *)self becomeFirstResponder];
}

- (void)dealloc
{
  [(MUPlacePhotoGalleryViewController *)self cancelDownloadingImages];
  v3.receiver = self;
  v3.super_class = (Class)MUPlacePhotoGalleryViewController;
  [(MUPlacePhotoGalleryViewController *)&v3 dealloc];
}

- (void)setupViewsWithAdditionalView:(id)a3
{
  v42[8] = *MEMORY[0x1E4F143B8];
  objc_super v4 = (objc_class *)MEMORY[0x1E4FB1BE0];
  id v41 = a3;
  v5 = (UIScrollView *)objc_alloc_init(v4);
  scrollView = self->_scrollView;
  self->_scrollView = v5;

  [(UIScrollView *)self->_scrollView setTranslatesAutoresizingMaskIntoConstraints:0];
  v7 = [MEMORY[0x1E4FB1618] clearColor];
  [(UIScrollView *)self->_scrollView setBackgroundColor:v7];

  [(UIScrollView *)self->_scrollView setPagingEnabled:1];
  [(UIScrollView *)self->_scrollView setShowsHorizontalScrollIndicator:0];
  [(UIScrollView *)self->_scrollView setShowsVerticalScrollIndicator:0];
  [(UIScrollView *)self->_scrollView setDelegate:self];
  v8 = [MEMORY[0x1E4FB1618] clearColor];
  [(UIScrollView *)self->_scrollView setBackgroundColor:v8];

  [(UIScrollView *)self->_scrollView setContentInsetAdjustmentBehavior:2];
  [(UIScrollView *)self->_scrollView setAccessibilityIdentifier:@"PlacePhotoGalleryScrollView"];
  v9 = [(MUPlacePhotoGalleryViewController *)self view];
  [v9 addSubview:self->_scrollView];

  id v10 = objc_alloc_init(MEMORY[0x1E4FB1C60]);
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v10 setDistribution:4];
  [(UIScrollView *)self->_scrollView addSubview:v10];
  v28 = (void *)MEMORY[0x1E4F28DC8];
  v39 = [(UIScrollView *)self->_scrollView leadingAnchor];
  v40 = [(MUPlacePhotoGalleryViewController *)self view];
  v38 = [v40 leadingAnchor];
  v37 = [v39 constraintEqualToAnchor:v38];
  v42[0] = v37;
  v35 = [(UIScrollView *)self->_scrollView trailingAnchor];
  v36 = [(MUPlacePhotoGalleryViewController *)self view];
  v34 = [v36 trailingAnchor];
  v33 = [v35 constraintEqualToAnchor:v34];
  v42[1] = v33;
  v31 = [(UIScrollView *)self->_scrollView topAnchor];
  v32 = [(MUPlacePhotoGalleryViewController *)self view];
  v30 = [v32 topAnchor];
  v29 = [v31 constraintEqualToAnchor:v30];
  v42[2] = v29;
  objc_super v26 = [(UIScrollView *)self->_scrollView bottomAnchor];
  v27 = [(MUPlacePhotoGalleryViewController *)self view];
  v25 = [v27 bottomAnchor];
  v24 = [v26 constraintEqualToAnchor:v25];
  v42[3] = v24;
  uint64_t v23 = [v10 leadingAnchor];
  v22 = [(UIScrollView *)self->_scrollView leadingAnchor];
  uint64_t v21 = [v23 constraintEqualToAnchor:v22];
  v42[4] = v21;
  v20 = [v10 trailingAnchor];
  uint64_t v19 = [(UIScrollView *)self->_scrollView trailingAnchor];
  v11 = [v20 constraintEqualToAnchor:v19];
  v42[5] = v11;
  id v12 = [v10 topAnchor];
  id v13 = [(UIScrollView *)self->_scrollView topAnchor];
  id v14 = [v12 constraintEqualToAnchor:v13];
  v42[6] = v14;
  id v15 = [v10 bottomAnchor];
  v16 = [(UIScrollView *)self->_scrollView bottomAnchor];
  uint64_t v17 = [v15 constraintEqualToAnchor:v16];
  v42[7] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:8];
  [v28 activateConstraints:v18];

  [(MUPlacePhotoGalleryViewController *)self setupPhotoViewsWithStackView:v10];
  [(MUPlacePhotoGalleryViewController *)self setupAdditionalView:v41 withStackView:v10];

  [(MUPlacePhotoGalleryViewController *)self setupAttributionView];
  [(MUPlacePhotoGalleryViewController *)self updateViewsWithPhotoAtIndex:[(NSNumber *)self->_originalIndex unsignedIntegerValue]];
  [(MUPlacePhotoGalleryViewController *)self reloadUserAttribution];
}

- (void)setEnablePersonalizedAttribution:(BOOL)a3
{
  if (self->_enablePersonalizedAttribution != a3)
  {
    self->_enablePersonalizedAttribution = a3;
    if (!a3) {
      [(MUPlacePhotoGalleryViewController *)self setUserAttributionViewModel:0];
    }
    [(MUPlacePhotoGalleryViewController *)self reloadUserAttribution];
  }
}

- (void)reloadUserAttribution
{
  objc_super v3 = [(MUPlacePhotoGalleryViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(MUPlacePhotoGalleryViewController *)self delegate];
    id v8 = [v5 placePhotoGalleryRequestsUserAttribution:self];
  }
  else
  {
    id v8 = 0;
  }
  v6 = [(MUPlacePhotoGalleryViewController *)self userAttributionViewModel];
  char v7 = [v8 isEqual:v6];

  if ((v7 & 1) == 0)
  {
    [(MUPlacePhotoGalleryViewController *)self setUserAttributionViewModel:v8];
    [(MUPlacePhotoGalleryViewController *)self updateViewsWithPhotoAtIndex:[(MUPlacePhotoGalleryViewController *)self indexOfVisibleView]];
  }
}

- (void)setupPhotoViewsWithStackView:(id)a3
{
  v37[2] = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  v30 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_photos, "count"));
  if ([(NSArray *)self->_photos count])
  {
    uint64_t v4 = 0;
    do
    {
      v5 = [(NSArray *)self->_photos objectAtIndexedSubscript:v4];
      v6 = [MEMORY[0x1E4F30E38] sharedImageManager];
      char v7 = [v5 largestPhotoURL];
      uint64_t v8 = [v6 cachedImageAtURL:v7];

      if (v8)
      {
        indexesOfDownloadedImages = self->_indexesOfDownloadedImages;
        id v10 = [NSNumber numberWithUnsignedInteger:v4];
        [(NSMutableArray *)indexesOfDownloadedImages addObject:v10];
        uint64_t v11 = v8;
      }
      else
      {
        id v10 = [(MUPlacePhotoGalleryViewController *)self delegate];
        id v12 = [v10 placePhotoGalleryImageViewForPhotoAtIndex:v4];
        uint64_t v11 = [v12 image];
      }
      id v13 = [[MUPlacePhotoView alloc] initWithImage:v11];
      [(MUPlacePhotoView *)v13 setNeedsFullImageDownload:v8 == 0];
      v35 = v5;
      uint64_t v36 = v4;
      v34 = (void *)v11;
      if ([v5 needsObfuscationWhenRenderedInFullScreen]
        && ([v5 attribution], id v14 = objc_claimAutoreleasedReturnValue(), v14, v14))
      {
        id v15 = [MUPlacePhotoViewObfuscationModel alloc];
        v16 = [v5 attribution];
        uint64_t v17 = [v16 providerName];
        v18 = [(MUPlacePhotoViewObfuscationModel *)v15 initWithProviderName:v17];

        uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_didTapOpen];
        [(MUPlacePhotoViewObfuscationModel *)v18 setTapGestureRecognizer:v19];
        [(MUPlacePhotoView *)v13 setObfuscationModel:v18];
      }
      else
      {
        v18 = (MUPlacePhotoViewObfuscationModel *)[objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:self action:sel_handlePanGesture_];
        [(MUPlacePhotoViewObfuscationModel *)v18 setDelegate:self];
        [(MUPlacePhotoView *)v13 addGestureRecognizer:v18];
      }

      [v30 addObject:v13];
      [v31 addArrangedSubview:v13];
      v32 = (void *)MEMORY[0x1E4F28DC8];
      v33 = [(MUPlacePhotoView *)v13 heightAnchor];
      v20 = [(MUPlacePhotoGalleryViewController *)self view];
      uint64_t v21 = [v20 heightAnchor];
      v22 = [v33 constraintEqualToAnchor:v21];
      v37[0] = v22;
      uint64_t v23 = [(MUPlacePhotoView *)v13 widthAnchor];
      v24 = [(MUPlacePhotoGalleryViewController *)self view];
      v25 = [v24 widthAnchor];
      objc_super v26 = [v23 constraintEqualToAnchor:v25];
      v37[1] = v26;
      v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
      [v32 activateConstraints:v27];

      uint64_t v4 = v36 + 1;
    }
    while (v36 + 1 < [(NSArray *)self->_photos count]);
  }
  v28 = (NSArray *)[v30 copy];
  photoViews = self->_photoViews;
  self->_photoViews = v28;
}

- (UIView)rapBarButtonView
{
  return [(MUPlacePhotoGalleryAttributionView *)self->_attributionView accessoryView];
}

- (void)setupAdditionalView:(id)a3 withStackView:(id)a4
{
  v41[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    id v39 = v7;
    objc_storeStrong((id *)&self->_additionalView, a3);
    id v8 = a4;
    id v9 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [v9 setTranslatesAutoresizingMaskIntoConstraints:1];
    id v10 = [MEMORY[0x1E4FB1618] clearColor];
    [v9 setBackgroundColor:v10];

    [v8 addArrangedSubview:v9];
    v34 = (void *)MEMORY[0x1E4F28DC8];
    uint64_t v11 = v9;
    uint64_t v36 = [v9 heightAnchor];
    id v12 = [(MUPlacePhotoGalleryViewController *)self view];
    id v13 = [v12 heightAnchor];
    id v14 = [v36 constraintEqualToAnchor:v13];
    v41[0] = v14;
    v38 = v9;
    id v15 = [v9 widthAnchor];
    v16 = [(MUPlacePhotoGalleryViewController *)self view];
    uint64_t v17 = [v16 widthAnchor];
    v18 = [v15 constraintEqualToAnchor:v17];
    v41[1] = v18;
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
    [v34 activateConstraints:v19];

    [(UIView *)self->_additionalView setTranslatesAutoresizingMaskIntoConstraints:0];
    [v11 addSubview:self->_additionalView];
    id v31 = (void *)MEMORY[0x1E4F28DC8];
    v35 = [(UIView *)self->_additionalView heightAnchor];
    v37 = [(MUPlacePhotoGalleryViewController *)self view];
    v33 = [v37 widthAnchor];
    v32 = [v35 constraintEqualToAnchor:v33];
    v40[0] = v32;
    v20 = [(UIView *)self->_additionalView widthAnchor];
    uint64_t v21 = [(MUPlacePhotoGalleryViewController *)self view];
    v22 = [v21 widthAnchor];
    uint64_t v23 = [v20 constraintEqualToAnchor:v22];
    v40[1] = v23;
    v24 = [(UIView *)self->_additionalView centerYAnchor];
    v25 = [(MUPlacePhotoGalleryViewController *)self view];
    objc_super v26 = [v25 centerYAnchor];
    v27 = [v24 constraintEqualToAnchor:v26];
    v40[2] = v27;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:3];
    [v31 activateConstraints:v28];

    v29 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_didTapOnAdditionalView];
    [v29 setNumberOfTapsRequired:1];
    [(UIView *)self->_additionalView addGestureRecognizer:v29];
    v30 = (void *)[objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:self action:sel_handlePanGesture_];
    [v30 setDelegate:self];
    [v38 addGestureRecognizer:v30];

    id v7 = v39;
  }
}

- (void)setupAttributionView
{
  v20[3] = *MEMORY[0x1E4F143B8];
  objc_super v3 = objc_alloc_init(MUPlacePhotoGalleryAttributionView);
  attributionView = self->_attributionView;
  self->_attributionView = v3;

  [(MUPlacePhotoGalleryAttributionView *)self->_attributionView setDelegate:self];
  [(MUPlacePhotoGalleryAttributionView *)self->_attributionView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIScrollView *)self->_scrollView addSubview:self->_attributionView];
  uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_didTapOnAttributionView];
  [v19 setNumberOfTapsRequired:1];
  [(MUPlacePhotoGalleryAttributionView *)self->_attributionView addGestureRecognizer:v19];
  id v14 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v17 = [(MUPlacePhotoGalleryAttributionView *)self->_attributionView leadingAnchor];
  v18 = [(MUPlacePhotoGalleryViewController *)self view];
  v16 = [v18 leadingAnchor];
  id v15 = [v17 constraintEqualToAnchor:v16];
  v20[0] = v15;
  v5 = [(MUPlacePhotoGalleryAttributionView *)self->_attributionView trailingAnchor];
  v6 = [(MUPlacePhotoGalleryViewController *)self view];
  id v7 = [v6 trailingAnchor];
  id v8 = [v5 constraintEqualToAnchor:v7];
  v20[1] = v8;
  id v9 = [(MUPlacePhotoGalleryAttributionView *)self->_attributionView bottomAnchor];
  id v10 = [(MUPlacePhotoGalleryViewController *)self view];
  uint64_t v11 = [v10 bottomAnchor];
  id v12 = [v9 constraintEqualToAnchor:v11];
  v20[2] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
  [v14 activateConstraints:v13];

  [(MUPlacePhotoGalleryViewController *)self updateViewsWithPhotoAtIndex:[(NSNumber *)self->_originalIndex unsignedIntegerValue]];
}

- (void)viewDidLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)MUPlacePhotoGalleryViewController;
  [(MUPlacePhotoGalleryViewController *)&v14 viewDidLayoutSubviews];
  objc_super v3 = [(MUPlacePhotoGalleryViewController *)self originalIndex];

  if (v3)
  {
    uint64_t v4 = [(MUPlacePhotoGalleryViewController *)self originalIndex];
    unint64_t v5 = [v4 unsignedIntegerValue];

    v6 = [(MUPlacePhotoGalleryViewController *)self view];
    int v7 = objc_msgSend(v6, "_mapsui_isRTL");

    if (v7)
    {
      id v8 = [(MUPlacePhotoGalleryViewController *)self photoViews];
      uint64_t v9 = [v8 count];
      id v10 = [(MUPlacePhotoGalleryViewController *)self originalIndex];
      unint64_t v5 = v9 + ~[v10 unsignedIntegerValue];
    }
    uint64_t v11 = [(MUPlacePhotoGalleryViewController *)self scrollView];
    [v11 frame];
    CGFloat v12 = CGRectGetWidth(v15) * (double)v5;
    id v13 = [(MUPlacePhotoGalleryViewController *)self scrollView];
    objc_msgSend(v13, "setContentOffset:", v12, 0.0);

    [(MUPlacePhotoGalleryViewController *)self setOriginalIndex:0];
  }
  [(MUPlacePhotoGalleryViewController *)self downloadImageForVisibleViews];
}

- (void)viewDidLoad
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)MUPlacePhotoGalleryViewController;
  [(MUPlacePhotoGalleryViewController *)&v23 viewDidLoad];
  objc_super v3 = [(MUPlacePhotoGalleryViewController *)self view];
  [v3 setAccessibilityIdentifier:@"PlacePhotoGalleryView"];

  uint64_t v4 = [(MUPlacePhotoGalleryViewController *)self additionalView];
  [(MUPlacePhotoGalleryViewController *)self setupViewsWithAdditionalView:v4];

  id v5 = objc_alloc(MEMORY[0x1E4FB14A8]);
  v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"chevron.backward"];
  int v7 = (void *)[v5 initWithImage:v6 style:2 target:self action:sel_didTapDone];
  [(MUPlacePhotoGalleryViewController *)self setBackBarButtonItem:v7];

  id v8 = [(MUPlacePhotoGalleryViewController *)self leftBarButtonItem];
  uint64_t v9 = [(MUPlacePhotoGalleryViewController *)self navigationItem];
  [v9 setLeftBarButtonItem:v8];

  id v10 = [(MUPlacePhotoGalleryViewController *)self rightBarButtonItem];
  uint64_t v11 = [(MUPlacePhotoGalleryViewController *)self navigationItem];
  [v11 setRightBarButtonItem:v10];

  CGFloat v12 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  id v13 = [(MUPlacePhotoGalleryViewController *)self view];
  [v13 setBackgroundColor:v12];

  objc_super v14 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_toggleBackground_];
  [v14 setNumberOfTapsRequired:1];
  CGRect v15 = [(MUPlacePhotoGalleryViewController *)self view];
  [v15 addGestureRecognizer:v14];

  v16 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_zoomToPoint_];
  [v16 setNumberOfTapsRequired:2];
  uint64_t v17 = [(MUPlacePhotoGalleryViewController *)self view];
  [v17 addGestureRecognizer:v16];

  [v14 requireGestureRecognizerToFail:v16];
  [v16 setDelaysTouchesBegan:1];
  [v14 setDelaysTouchesBegan:1];
  id v18 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
  [v18 configureWithDefaultBackground];
  uint64_t v19 = [(MUPlacePhotoGalleryViewController *)self navigationItem];
  [v19 setScrollEdgeAppearance:v18];

  v20 = self;
  v24[0] = v20;
  uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  id v22 = (id)[(MUPlacePhotoGalleryViewController *)self registerForTraitChanges:v21 withAction:sel__updateNavbarVisibility];
}

- (void)downloadImageForVisibleViews
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  unint64_t v4 = [(MUPlacePhotoGalleryViewController *)self indexOfVisibleView];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v5 = v4;
    v6 = [NSNumber numberWithUnsignedInteger:v4];
    [v3 addObject:v6];

    if (v5)
    {
      int v7 = [NSNumber numberWithUnsignedInteger:v5 - 1];
      [v3 addObject:v7];
    }
    id v8 = [(MUPlacePhotoGalleryViewController *)self photos];
    unint64_t v9 = [v8 count] - 1;

    if (v5 < v9)
    {
      id v10 = [NSNumber numberWithUnsignedInteger:v5 + 1];
      [v3 addObject:v10];
    }
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = v3;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v17 = [(MUPlacePhotoGalleryViewController *)self indexesOfDownloadedImages];
        char v18 = [v17 containsObject:v16];

        if ((v18 & 1) == 0)
        {
          unint64_t v19 = [v16 unsignedIntegerValue];
          v20 = [(MUPlacePhotoGalleryViewController *)self photos];
          unint64_t v21 = [v20 count];

          if (v19 < v21)
          {
            id v22 = [(MUPlacePhotoGalleryViewController *)self photos];
            objc_super v23 = objc_msgSend(v22, "objectAtIndexedSubscript:", objc_msgSend(v16, "unsignedIntegerValue"));

            v24 = [v23 largestPhotoURL];
            if (v24) {
              -[MUPlacePhotoGalleryViewController downloadImageForURL:forIndex:](self, "downloadImageForURL:forIndex:", v24, [v16 unsignedIntegerValue]);
            }
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v13);
  }
}

- (void)downloadImageForURL:(id)a3 forIndex:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [(MUPlacePhotoGalleryViewController *)self downloadingImagesURLs];
  char v8 = [v7 containsObject:v6];

  if ((v8 & 1) == 0)
  {
    unint64_t v9 = MUGetMUPlacePhotoVCLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = [v6 absoluteString];
      *(_DWORD *)buf = 134218242;
      unint64_t v19 = a4;
      __int16 v20 = 2112;
      unint64_t v21 = v10;
      _os_log_impl(&dword_1931EA000, v9, OS_LOG_TYPE_DEBUG, "[...]Starting download for image at index: %lu. URL: %@", buf, 0x16u);
    }
    id v11 = [(MUPlacePhotoGalleryViewController *)self downloadingImagesURLs];
    [v11 addObject:v6];

    objc_initWeak((id *)buf, self);
    uint64_t v12 = [MEMORY[0x1E4F30E38] sharedImageManager];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __66__MUPlacePhotoGalleryViewController_downloadImageForURL_forIndex___block_invoke;
    v14[3] = &unk_1E5750D90;
    objc_copyWeak(v17, (id *)buf);
    id v13 = v6;
    v17[1] = (id)a4;
    id v15 = v13;
    v16 = self;
    [v12 loadAppImageAtURL:v13 completionHandler:v14];

    objc_destroyWeak(v17);
    objc_destroyWeak((id *)buf);
  }
}

void __66__MUPlacePhotoGalleryViewController_downloadImageForURL_forIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__MUPlacePhotoGalleryViewController_downloadImageForURL_forIndex___block_invoke_2;
  v12[3] = &unk_1E5750D68;
  objc_copyWeak(v17, (id *)(a1 + 48));
  id v13 = *(id *)(a1 + 32);
  id v14 = v8;
  v17[1] = *(id *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 40);
  id v15 = v7;
  uint64_t v16 = v9;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(MEMORY[0x1E4F14428], v12);

  objc_destroyWeak(v17);
}

void __66__MUPlacePhotoGalleryViewController_downloadImageForURL_forIndex___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_super v3 = [WeakRetained downloadingImagesURLs];
  [v3 removeObject:*(void *)(a1 + 32)];

  if (*(void *)(a1 + 40))
  {
    unint64_t v4 = MUGetMUPlacePhotoVCLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 72);
      id v6 = [*(id *)(a1 + 40) debugDescription];
      id v7 = [*(id *)(a1 + 32) absoluteString];
      int v15 = 134218498;
      uint64_t v16 = v5;
      __int16 v17 = 2112;
      char v18 = v6;
      __int16 v19 = 2112;
      __int16 v20 = v7;
      _os_log_impl(&dword_1931EA000, v4, OS_LOG_TYPE_ERROR, "[X]Error encountered for photo at index: %lu. Error: %@. URL: %@", (uint8_t *)&v15, 0x20u);
    }
  }
  if (*(void *)(a1 + 48))
  {
    id v8 = [WeakRetained photoViews];
    uint64_t v9 = [v8 objectAtIndexedSubscript:*(void *)(a1 + 72)];

    [v9 setNeedsFullImageDownload:0];
    id v10 = MUGetMUPlacePhotoVCLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = *(void *)(a1 + 72);
      uint64_t v12 = [*(id *)(a1 + 32) absoluteString];
      int v15 = 134218242;
      uint64_t v16 = v11;
      __int16 v17 = 2112;
      char v18 = v12;
      _os_log_impl(&dword_1931EA000, v10, OS_LOG_TYPE_DEBUG, "[✔]Showing image at index: %lu. URL: %@", (uint8_t *)&v15, 0x16u);
    }
    id v13 = [*(id *)(a1 + 56) indexesOfDownloadedImages];
    id v14 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 72)];
    [v13 addObject:v14];

    [v9 setImage:*(void *)(a1 + 48)];
  }
}

- (void)downloadImageForPhotoViewAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(MUPlacePhotoGalleryViewController *)self photoViews];
  unint64_t v6 = [v5 count] - 1;

  if (v6 >= a3)
  {
    id v7 = [(MUPlacePhotoGalleryViewController *)self photoViews];
    id v11 = [v7 objectAtIndexedSubscript:a3];

    id v8 = [(MUPlacePhotoGalleryViewController *)self photos];
    uint64_t v9 = [v8 objectAtIndexedSubscript:a3];

    id v10 = [v9 largestPhotoURL];
    if (v10) {
      [(MUPlacePhotoGalleryViewController *)self downloadImageForURL:v10 forIndex:a3];
    }
  }
}

- (void)cancelDownloadingImages
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(MUPlacePhotoGalleryViewController *)self downloadingImagesURLs];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v8 = MUGetMUPlacePhotoVCLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v9 = [v7 absoluteString];
          *(_DWORD *)buf = 138412290;
          uint64_t v16 = v9;
          _os_log_impl(&dword_1931EA000, v8, OS_LOG_TYPE_DEBUG, "[X]Cancelling image download for url: %@", buf, 0xCu);
        }
        id v10 = [MEMORY[0x1E4F30E38] sharedImageManager];
        [v10 cancelLoadAppImageAtURL:v7];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v4);
  }
}

- (id)currentPhoto
{
  unint64_t v3 = [(MUPlacePhotoGalleryViewController *)self indexOfVisibleView];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned int v4 = [(NSNumber *)self->_originalIndex unsignedIntValue];
    uint64_t v5 = [(MUPlacePhotoGalleryViewController *)self photos];
    unint64_t v6 = [v5 count];

    if (v6 > v4)
    {
      id v7 = [(MUPlacePhotoGalleryViewController *)self photos];
      unint64_t v8 = [(NSNumber *)self->_originalIndex unsignedIntValue];
      uint64_t v9 = v7;
LABEL_6:
      long long v13 = [v9 objectAtIndex:v8];

      goto LABEL_8;
    }
  }
  else
  {
    unint64_t v10 = v3;
    long long v11 = [(MUPlacePhotoGalleryViewController *)self photos];
    unint64_t v12 = [v11 count];

    if (v10 < v12)
    {
      uint64_t v9 = [(MUPlacePhotoGalleryViewController *)self photos];
      id v7 = v9;
      unint64_t v8 = v10;
      goto LABEL_6;
    }
  }
  long long v13 = 0;
LABEL_8:
  return v13;
}

- (id)photoViewForTransition
{
  uint64_t v3 = [(MUPlacePhotoGalleryViewController *)self originalIndex];
  if (v3)
  {
    unsigned int v4 = (void *)v3;
    uint64_t v5 = [(MUPlacePhotoGalleryViewController *)self originalIndex];
    unint64_t v6 = [v5 unsignedIntegerValue];
    id v7 = [(MUPlacePhotoGalleryViewController *)self photoViews];
    unint64_t v8 = [v7 count];

    if (v6 < v8)
    {
      uint64_t v9 = [(MUPlacePhotoGalleryViewController *)self photoViews];
      unint64_t v10 = [(MUPlacePhotoGalleryViewController *)self originalIndex];
      long long v11 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v10, "unsignedIntegerValue"));

LABEL_11:
      goto LABEL_12;
    }
  }
  unint64_t v12 = [(MUPlacePhotoGalleryViewController *)self indexOfVisibleView];
  long long v13 = [(MUPlacePhotoGalleryViewController *)self photoViews];
  unint64_t v14 = [v13 count];

  if (v12 < v14)
  {
    uint64_t v9 = [(MUPlacePhotoGalleryViewController *)self photoViews];
    uint64_t v15 = objc_msgSend(v9, "objectAtIndexedSubscript:", -[MUPlacePhotoGalleryViewController indexOfVisibleView](self, "indexOfVisibleView"));
LABEL_9:
    long long v11 = (void *)v15;
    goto LABEL_11;
  }
  unint64_t v16 = [(MUPlacePhotoGalleryViewController *)self indexOfVisibleView];
  uint64_t v9 = [(MUPlacePhotoGalleryViewController *)self photoViews];
  if (v16 != [v9 count])
  {
    long long v11 = 0;
    goto LABEL_11;
  }
  __int16 v17 = [(MUPlacePhotoGalleryViewController *)self additionalView];

  if (v17)
  {
    uint64_t v9 = [(MUPlacePhotoGalleryViewController *)self additionalView];
    uint64_t v15 = [v9 superview];
    goto LABEL_9;
  }
  long long v11 = 0;
LABEL_12:
  return v11;
}

- (unint64_t)indexOfVisibleView
{
  uint64_t v3 = [(MUPlacePhotoGalleryViewController *)self scrollView];
  [v3 frame];
  double Width = CGRectGetWidth(v15);

  if (Width == 0.0) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v6 = [(MUPlacePhotoGalleryViewController *)self view];
  int v7 = objc_msgSend(v6, "_mapsui_isRTL");

  if (v7)
  {
    unint64_t v8 = [(MUPlacePhotoGalleryViewController *)self photoViews];
    double v9 = (double)(unint64_t)[v8 count];
    unint64_t v10 = [(MUPlacePhotoGalleryViewController *)self scrollView];
    [v10 contentOffset];
    double v12 = v9 - v11 / Width + -1.0;
  }
  else
  {
    unint64_t v8 = [(MUPlacePhotoGalleryViewController *)self scrollView];
    [v8 contentOffset];
    double v12 = v13 / Width;
  }
  unint64_t v5 = (unint64_t)v12;

  return v5;
}

- (unint64_t)indexOfView:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v5 = [(MUPlacePhotoGalleryViewController *)self photoViews];
    int v6 = [v5 containsObject:v4];

    if (v6)
    {
      int v7 = [(MUPlacePhotoGalleryViewController *)self photoViews];
      uint64_t v8 = [v7 indexOfObject:v4];
LABEL_9:
      unint64_t v13 = v8;

      goto LABEL_10;
    }
  }
  uint64_t v9 = [(MUPlacePhotoGalleryViewController *)self additionalView];
  if ((id)v9 == v4)
  {

    goto LABEL_8;
  }
  unint64_t v10 = (void *)v9;
  double v11 = [(MUPlacePhotoGalleryViewController *)self additionalView];
  id v12 = [v11 superview];

  if (v12 == v4)
  {
LABEL_8:
    int v7 = [(MUPlacePhotoGalleryViewController *)self photoViews];
    uint64_t v8 = [v7 count];
    goto LABEL_9;
  }
  unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_10:

  return v13;
}

- (CGPoint)scrollViewContentOffset
{
  v2 = [(MUPlacePhotoGalleryViewController *)self scrollView];
  [v2 contentOffset];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)handlePanGesture:(id)a3
{
  id v4 = a3;
  if ([(MUPlacePhotoGalleryViewController *)self panAndSwipeToDismissGestureEnabled])
  {
    double v5 = [v4 view];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      double v7 = [v4 view];
      double v8 = v7;
      if (v7)
      {
        char v9 = [v7 isZoomed];
        unint64_t v10 = [v8 image];

        if ((v9 & 1) != 0 || !v10) {
          goto LABEL_47;
        }
      }
    }
    else
    {
      double v8 = 0;
    }
    double v11 = [v4 view];
    [v4 translationInView:v11];
    double v13 = v12;
    double v15 = v14;

    unint64_t v16 = [v4 view];
    [v16 bounds];
    double v18 = v17;

    double v19 = 0.0;
    if (v18 > 0.0)
    {
      double v19 = v15 / v18;
      if (v15 / v18 < 0.0) {
        double v19 = -(v15 / v18);
      }
    }
    if (v19 >= 0.0) {
      double v20 = v19;
    }
    else {
      double v20 = 0.0;
    }
    uint64_t v21 = objc_msgSend(v4, "state", 0.0);
    if ((unint64_t)(v21 - 3) < 2)
    {
      long long v25 = [(MUPlacePhotoGalleryViewController *)self gestureTrackedView];
      long long v26 = [v4 view];

      if (v25 != v26) {
        goto LABEL_47;
      }
      [v8 setUserInteractionEnabled:1];
      if ([(MUPlacePhotoGalleryViewController *)self shouldFinishAnimation])
      {
        [(MUPlacePhotoGalleryViewController *)self dismiss];
      }
      else
      {
        v61 = (void *)MEMORY[0x1E4FB1EB0];
        uint64_t v63 = MEMORY[0x1E4F143A8];
        uint64_t v64 = 3221225472;
        v65 = __54__MUPlacePhotoGalleryViewController_handlePanGesture___block_invoke;
        v66 = &unk_1E574EE08;
        id v67 = v4;
        v68 = self;
        [v61 animateWithDuration:&v63 animations:0.15];
      }
    }
    else
    {
      if (v21 == 2)
      {
        long long v27 = [(MUPlacePhotoGalleryViewController *)self gestureTrackedView];
        long long v28 = [v4 view];

        if (v27 == v28
          && ([(MUPlacePhotoGalleryViewController *)self panGestureStartingDirection] == 2
           || [(MUPlacePhotoGalleryViewController *)self panGestureStartingDirection] == 1))
        {
          double v29 = fmin(v20, 1.0);
          uint64_t v30 = [(MUPlacePhotoGalleryViewController *)self scrollView];
          [v30 setScrollEnabled:0];

          if (1.0 - v29 >= 0.8) {
            double v31 = 1.0 - v29;
          }
          else {
            double v31 = 0.8;
          }
          long long v32 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
          *(_OWORD *)&v70.a = *MEMORY[0x1E4F1DAB8];
          *(_OWORD *)&v70.c = v32;
          *(_OWORD *)&v70.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
          CGAffineTransformScale(&v71, &v70, v31, v31);
          v33 = [v4 view];
          CGAffineTransform v69 = v71;
          [v33 setTransform:&v69];

          [(MUPlacePhotoGalleryViewController *)self imageViewCenterPoint];
          double v35 = v13 + v34;
          [(MUPlacePhotoGalleryViewController *)self imageViewCenterPoint];
          double v37 = v15 + v36;
          v38 = [v4 view];
          objc_msgSend(v38, "setCenter:", v35, v37);

          id v39 = [(MUPlacePhotoGalleryViewController *)self view];
          v40 = [v39 backgroundColor];
          id v41 = [v40 colorWithAlphaComponent:v31];
          v42 = [(MUPlacePhotoGalleryViewController *)self view];
          [v42 setBackgroundColor:v41];

          v43 = [(MUPlacePhotoGalleryViewController *)self attributionView];
          [v43 setAlpha:v31];

          v44 = [v4 view];
          [v44 setAlpha:1.0];

          [(MUPlacePhotoGalleryViewController *)self setShouldFinishAnimation:v29 > 0.15];
        }
        goto LABEL_47;
      }
      if (v21 == 1)
      {
        uint64_t v22 = [(MUPlacePhotoGalleryViewController *)self gestureTrackedView];

        if (!v22)
        {
          v45 = [v4 view];
          [(MUPlacePhotoGalleryViewController *)self setGestureTrackedView:v45];

LABEL_32:
          [v8 setUserInteractionEnabled:0];
          if (![(MUPlacePhotoGalleryViewController *)self panGestureStartingDirection])
          {
            v46 = [v4 view];
            [v4 velocityInView:v46];
            double v48 = v47;
            double v50 = v49;

            double v51 = fabs(v50);
            double v52 = fabs(v48);
            uint64_t v53 = 2;
            if (v50 <= 0.0) {
              uint64_t v53 = 1;
            }
            uint64_t v54 = 3;
            if (v48 > 0.0) {
              uint64_t v54 = 4;
            }
            if (v51 <= v52) {
              uint64_t v55 = v54;
            }
            else {
              uint64_t v55 = v53;
            }
            [(MUPlacePhotoGalleryViewController *)self setPanGestureStartingDirection:v55];
          }
          [(MUPlacePhotoGalleryViewController *)self setShouldFinishAnimation:0];
          v56 = [v4 view];
          [v56 center];
          -[MUPlacePhotoGalleryViewController setImageViewCenterPoint:](self, "setImageViewCenterPoint:");

          if ([(MUPlacePhotoGalleryViewController *)self panGestureStartingDirection] == 2
            || [(MUPlacePhotoGalleryViewController *)self panGestureStartingDirection] == 1)
          {
            v57 = [(MUPlacePhotoGalleryViewController *)self delegate];
            char v58 = objc_opt_respondsToSelector();

            if (v58)
            {
              v59 = [(MUPlacePhotoGalleryViewController *)self delegate];
              v60 = [v4 view];
              objc_msgSend(v59, "placePhotoGallery:willCloseAtIndex:", self, -[MUPlacePhotoGalleryViewController indexOfView:](self, "indexOfView:", v60));
            }
          }
          goto LABEL_47;
        }
        objc_super v23 = [(MUPlacePhotoGalleryViewController *)self gestureTrackedView];
        v24 = [v4 view];

        if (v23 == v24) {
          goto LABEL_32;
        }
LABEL_47:

        goto LABEL_48;
      }
      [v8 setUserInteractionEnabled:1];
    }
    -[MUPlacePhotoGalleryViewController setPanGestureStartingDirection:](self, "setPanGestureStartingDirection:", 0, v63, v64, v65, v66);
    v62 = [(MUPlacePhotoGalleryViewController *)self scrollView];
    [v62 setScrollEnabled:1];

    [(MUPlacePhotoGalleryViewController *)self setGestureTrackedView:0];
    goto LABEL_47;
  }
LABEL_48:
}

void __54__MUPlacePhotoGalleryViewController_handlePanGesture___block_invoke(uint64_t a1)
{
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v15.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v15.c = v2;
  *(_OWORD *)&v15.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  CGAffineTransformScale(&v16, &v15, 1.0, 1.0);
  double v3 = [*(id *)(a1 + 32) view];
  CGAffineTransform v14 = v16;
  [v3 setTransform:&v14];

  [*(id *)(a1 + 40) imageViewCenterPoint];
  double v5 = v4;
  double v7 = v6;
  double v8 = [*(id *)(a1 + 32) view];
  objc_msgSend(v8, "setCenter:", v5, v7);

  char v9 = [*(id *)(a1 + 40) view];
  unint64_t v10 = [v9 backgroundColor];
  double v11 = [v10 colorWithAlphaComponent:1.0];
  double v12 = [*(id *)(a1 + 40) view];
  [v12 setBackgroundColor:v11];

  double v13 = [*(id *)(a1 + 40) attributionView];
  [v13 setAlpha:1.0];
}

- (unint64_t)viewsCount
{
  double v3 = [(MUPlacePhotoGalleryViewController *)self photos];
  uint64_t v4 = [v3 count];
  double v5 = [(MUPlacePhotoGalleryViewController *)self additionalView];
  if (v5) {
    unint64_t v6 = v4 + 1;
  }
  else {
    unint64_t v6 = v4;
  }

  return v6;
}

- (void)toggleBackground:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__MUPlacePhotoGalleryViewController_toggleBackground___block_invoke;
  v3[3] = &unk_1E574EFD0;
  v3[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v3 animations:0.150000006];
}

void __54__MUPlacePhotoGalleryViewController_toggleBackground___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 navigationController];
  objc_msgSend(v1, "setUIStyleWithNavigationBarHidden:", objc_msgSend(v2, "isNavigationBarHidden") ^ 1);
}

- (void)setUIStyleWithNavigationBarHidden:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(MUPlacePhotoGalleryViewController *)self navigationController];
  [v5 setNavigationBarHidden:v3 animated:1];

  if (v3) {
    [MEMORY[0x1E4FB1618] blackColor];
  }
  else {
  unint64_t v6 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  }
  double v7 = [(MUPlacePhotoGalleryViewController *)self view];
  [v7 setBackgroundColor:v6];

  id v8 = [(MUPlacePhotoGalleryViewController *)self attributionView];
  [v8 setHidden:v3];
}

- (void)zoomToPoint:(id)a3
{
  id v9 = a3;
  unint64_t v4 = [(MUPlacePhotoGalleryViewController *)self indexOfVisibleView];
  double v5 = [(MUPlacePhotoGalleryViewController *)self photoViews];
  unint64_t v6 = [v5 count];

  if (v4 < v6)
  {
    double v7 = [(MUPlacePhotoGalleryViewController *)self photoViews];
    id v8 = [v7 objectAtIndexedSubscript:v4];

    [v8 zoomWithGestureRecognizer:v9];
  }
}

- (void)resetPhotosZoomLevel
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(MUPlacePhotoGalleryViewController *)self photoViews];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        double v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        [v7 minimumZoomScale];
        objc_msgSend(v7, "setZoomScale:animated:", 0);
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)updateViewsWithPhotoAtIndex:(unint64_t)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(MUPlacePhotoGalleryViewController *)self photos];
  unint64_t v6 = [v5 count];

  if (v6 > a3)
  {
    double v7 = [(MUPlacePhotoGalleryViewController *)self photos];
    id v26 = [v7 objectAtIndexedSubscript:a3];

    long long v8 = [(MUPlacePhotoGalleryViewController *)self photos];
    unint64_t v9 = [v8 count];

    if (v9 <= a3)
    {
      double v17 = [(MUPlacePhotoGalleryViewController *)self attributionView];
      [v17 setHidden:1];

      CGAffineTransform v14 = [(MUPlacePhotoGalleryViewController *)self leftBarButtonItem];
      double v18 = [(MUPlacePhotoGalleryViewController *)self navigationItem];
      [v18 setLeftBarButtonItem:v14];
LABEL_14:

      uint64_t v22 = [(MUPlacePhotoGalleryViewController *)self photoViews];
      unint64_t v23 = [v22 count];

      if (v23 > a3) {
        [(MUPlacePhotoGalleryViewController *)self downloadImageForVisibleViews];
      }
      v24 = _MULocalizedStringFromThisBundle(@"%lu of %lu");
      long long v25 = objc_msgSend(NSString, "stringWithFormat:", v24, a3 + 1, -[MUPlacePhotoGalleryViewController viewsCount](self, "viewsCount"));
      [(MUPlacePhotoGalleryViewController *)self setTitle:v25];

      return;
    }
    uint64_t v10 = [v26 photoStyle];
    if (v10 == 1)
    {
      CGAffineTransform v14 = objc_alloc_init(MUPlacePhotoGalleryAttributionViewModel);
      double v19 = [v26 title];
      [(MUPlacePhotoGalleryAttributionViewModel *)v14 setTitleText:v19];

      double v12 = [v26 subtitle];
      [(MUPlacePhotoGalleryAttributionViewModel *)v14 setSubtitleText:v12];
    }
    else
    {
      if (v10)
      {
        CGAffineTransform v14 = 0;
        goto LABEL_13;
      }
      mapItem = self->_mapItem;
      double v12 = [(MUPlacePhotoGalleryViewController *)self userAttributionViewModel];
      uint64_t v13 = [v12 attributionName];
      CGAffineTransform v14 = +[MUPlacePhotoGalleryAttributionViewModel viewModelFromMapItem:mapItem photo:v26 photoCreditName:v13 shouldAddPhotoCredit:[(MUPlacePhotoGalleryViewController *)self enablePersonalizedAttribution]];
    }
LABEL_13:
    double v20 = [(MUPlacePhotoGalleryViewController *)self attributionView];
    [v20 setViewModel:v14];

    double v18 = [(MUPlacePhotoGalleryViewController *)self leftBarButtonItem];
    uint64_t v21 = [(MUPlacePhotoGalleryViewController *)self navigationItem];
    [v21 setLeftBarButtonItem:v18];

    goto LABEL_14;
  }
  CGAffineTransform v15 = MUGetMUPlacePhotoVCLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
  {
    CGAffineTransform v16 = [(MUPlacePhotoGalleryViewController *)self photos];
    *(_DWORD *)buf = 134218240;
    unint64_t v28 = a3;
    __int16 v29 = 2048;
    uint64_t v30 = [v16 count];
    _os_log_impl(&dword_1931EA000, v15, OS_LOG_TYPE_FAULT, "Tried to update views when index %lu >= photos count %lu", buf, 0x16u);
  }
}

- (void)_rapButtonPressed
{
  id v3 = [(MUPlacePhotoGalleryViewController *)self delegate];
  objc_msgSend(v3, "placePhotoGallery:didSelectReportImageAtIndex:", self, -[MUPlacePhotoGalleryViewController indexOfVisibleView](self, "indexOfVisibleView"));
}

- (void)_selectedAddPhotosWithEntryPoint:(int64_t)a3
{
  unint64_t v6 = objc_alloc_init(MUPresentationOptions);
  [(MUPresentationOptions *)v6 setBarButtonItem:self->_addPhotoBarButtonItem];
  [(MUPresentationOptions *)v6 setPresentingViewController:self];
  uint64_t v5 = [(MUPlacePhotoGalleryViewController *)self delegate];
  [v5 placePhotoGallery:self selectedAddPhotoWithEntryPoint:a3 usingPresentationOptions:v6];
}

- (UIBarButtonItem)addPhotoBarButtonItem
{
  int v3 = [MEMORY[0x1E4F30F78] shouldShowAddPhotoButtonsOnSingleFullScreenPhotoViewerForMapItem:self->_mapItem photoAttribution:0];
  uint64_t v4 = 0;
  if (v3)
  {
    addPhotoBarButtonItem = self->_addPhotoBarButtonItem;
    if (!addPhotoBarButtonItem)
    {
      id v6 = objc_alloc(MEMORY[0x1E4FB14A8]);
      double v7 = _MULocalizedStringFromThisBundle(@"Add Photo [UGC]");
      long long v8 = (UIBarButtonItem *)[v6 initWithTitle:v7 style:0 target:self action:0];
      unint64_t v9 = self->_addPhotoBarButtonItem;
      self->_addPhotoBarButtonItem = v8;

      objc_initWeak(&location, self);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __58__MUPlacePhotoGalleryViewController_addPhotoBarButtonItem__block_invoke;
      v14[3] = &unk_1E574F3A8;
      objc_copyWeak(&v15, &location);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __58__MUPlacePhotoGalleryViewController_addPhotoBarButtonItem__block_invoke_2;
      v12[3] = &unk_1E574F3A8;
      objc_copyWeak(&v13, &location);
      uint64_t v10 = +[MUPhotoOptionsMenuButton menuForPhotoOptionsMenuButtonWithCameraCompletion:v14 libraryCompletion:v12];
      [(UIBarButtonItem *)self->_addPhotoBarButtonItem setMenu:v10];

      if (+[MUPhotoOptionsMenuButton preferredEntryPoint])
      {
        [(UIBarButtonItem *)self->_addPhotoBarButtonItem setAction:sel__addPhoto];
      }
      objc_destroyWeak(&v13);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
      addPhotoBarButtonItem = self->_addPhotoBarButtonItem;
    }
    uint64_t v4 = addPhotoBarButtonItem;
  }
  return v4;
}

void __58__MUPlacePhotoGalleryViewController_addPhotoBarButtonItem__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _selectedAddPhotosWithEntryPoint:1];
    id WeakRetained = v2;
  }
}

void __58__MUPlacePhotoGalleryViewController_addPhotoBarButtonItem__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _selectedAddPhotosWithEntryPoint:2];
    id WeakRetained = v2;
  }
}

- (UIActivityIndicatorView)spinner
{
  spinner = self->_spinner;
  if (!spinner)
  {
    uint64_t v4 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    uint64_t v5 = self->_spinner;
    self->_spinner = v4;

    [(UIActivityIndicatorView *)self->_spinner setHidesWhenStopped:1];
    spinner = self->_spinner;
  }
  return spinner;
}

- (void)_addPhoto
{
  int64_t v3 = +[MUPhotoOptionsMenuButton preferredEntryPoint];
  if (v3)
  {
    [(MUPlacePhotoGalleryViewController *)self _selectedAddPhotosWithEntryPoint:v3];
  }
}

- (void)didTapOpen
{
  int64_t v3 = [(MUPlacePhotoGalleryViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MUPlacePhotoGalleryViewController *)self delegate];
    objc_msgSend(v5, "placePhotoGallery:openButtonTappedAtIndex:", self, -[MUPlacePhotoGalleryViewController indexOfVisibleView](self, "indexOfVisibleView"));
  }
}

- (void)didTapDone
{
  int64_t v3 = [(MUPlacePhotoGalleryViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MUPlacePhotoGalleryViewController *)self delegate];
    objc_msgSend(v5, "placePhotoGallery:willCloseAtIndex:", self, -[MUPlacePhotoGalleryViewController indexOfVisibleView](self, "indexOfVisibleView"));
  }
  [(MUPlacePhotoGalleryViewController *)self dismiss];
}

- (void)dismiss
{
  [(MUPlacePhotoGalleryViewController *)self cancelDownloadingImages];
  int64_t v3 = [(MUPlacePhotoGalleryViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MUPlacePhotoGalleryViewController *)self delegate];
    objc_msgSend(v5, "placePhotoGalleryDidCloseAtIndex:", -[MUPlacePhotoGalleryViewController indexOfVisibleView](self, "indexOfVisibleView"));
  }
  id v6 = [(MUPlacePhotoGalleryViewController *)self presentingViewController];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__MUPlacePhotoGalleryViewController_dismiss__block_invoke;
  v7[3] = &unk_1E574EFD0;
  v7[4] = self;
  [v6 dismissViewControllerAnimated:1 completion:v7];
}

void __44__MUPlacePhotoGalleryViewController_dismiss__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 placePhotoGalleryDidFinishDismissing:*(void *)(a1 + 32)];
  }
}

- (void)didTapOnAttributionView
{
  char v3 = [(MUPlacePhotoGalleryViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MUPlacePhotoGalleryViewController *)self delegate];
    objc_msgSend(v5, "placePhotoGallery:attributionViewTappedAtIndex:", self, -[MUPlacePhotoGalleryViewController indexOfVisibleView](self, "indexOfVisibleView"));
  }
}

- (void)didTapOnAdditionalView
{
  char v3 = [(MUPlacePhotoGalleryViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MUPlacePhotoGalleryViewController *)self delegate];
    [v5 placePhotoGalleryAdditionalViewTapped:self];
  }
}

- (void)_didTapEditPhotoCreditMenuItem
{
  char v3 = [(MUPlacePhotoGalleryViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MUPlacePhotoGalleryViewController *)self delegate];
    [v5 placePhotoGalleryDidSelectEditPhotoCredit:self];
  }
}

- (void)_didTapDeletePhotoMenuItemForImageAtIndex:(unint64_t)a3
{
  id v5 = [(MUPlacePhotoGalleryViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MUPlacePhotoGalleryViewController *)self delegate];
    [v7 placePhotoGallery:self didSelectDeleteImageAtIndex:a3];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v5 = a3;
  [(MUPlacePhotoGalleryViewController *)self updateViewsWithPhotoAtIndex:[(MUPlacePhotoGalleryViewController *)self indexOfVisibleView]];
  [(MUPlacePhotoGalleryViewController *)self lastScrollViewOffsetBeforeScrolling];
  if (v4 == 0.0)
  {
    [v5 contentOffset];
    -[MUPlacePhotoGalleryViewController setLastScrollViewOffsetBeforeScrolling:](self, "setLastScrollViewOffsetBeforeScrolling:");
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(MUPlacePhotoGalleryViewController *)self indexOfVisibleView];
  [v4 contentOffset];
  double v7 = v6;

  [(MUPlacePhotoGalleryViewController *)self lastScrollViewOffsetBeforeScrolling];
  if (v8 >= v7)
  {
    [(MUPlacePhotoGalleryViewController *)self lastScrollViewOffsetBeforeScrolling];
    if (v12 > v7)
    {
      id v13 = [(MUPlacePhotoGalleryViewController *)self delegate];
      char v14 = objc_opt_respondsToSelector();

      if (v14)
      {
        long long v11 = [(MUPlacePhotoGalleryViewController *)self delegate];
        [v11 placePhotoGalleryDidScrollRightToIndex:v5];
        goto LABEL_7;
      }
    }
  }
  else
  {
    unint64_t v9 = [(MUPlacePhotoGalleryViewController *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      long long v11 = [(MUPlacePhotoGalleryViewController *)self delegate];
      [v11 placePhotoGalleryDidScrollLeftToIndex:v5];
LABEL_7:
    }
  }
  [(MUPlacePhotoGalleryViewController *)self lastScrollViewOffsetBeforeScrolling];
  if (v15 != v7)
  {
    CGAffineTransform v16 = [(MUPlacePhotoGalleryViewController *)self delegate];
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      double v18 = [(MUPlacePhotoGalleryViewController *)self delegate];
      [v18 placePhotoGalleryDidScrollToIndex:v5];
    }
  }
  [(MUPlacePhotoGalleryViewController *)self setLastScrollViewOffsetBeforeScrolling:0.0];
  [(MUPlacePhotoGalleryViewController *)self resetPhotosZoomLevel];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v11.receiver = self;
  v11.super_class = (Class)MUPlacePhotoGalleryViewController;
  id v7 = a4;
  -[MUPlacePhotoGalleryViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  unint64_t v8 = [(MUPlacePhotoGalleryViewController *)self indexOfVisibleView];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __88__MUPlacePhotoGalleryViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v10[3] = &unk_1E5750DB8;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = v8;
  }
  v10[4] = self;
  v10[5] = v9;
  [v7 animateAlongsideTransition:v10 completion:0];
}

uint64_t __88__MUPlacePhotoGalleryViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  char v3 = [*(id *)(a1 + 32) view];
  int v4 = objc_msgSend(v3, "_mapsui_isRTL");

  if (v4)
  {
    unint64_t v5 = [*(id *)(a1 + 32) photoViews];
    uint64_t v2 = [v5 count] + ~*(void *)(a1 + 40);
  }
  double v6 = [*(id *)(a1 + 32) scrollView];
  id v7 = [*(id *)(a1 + 32) view];
  [v7 frame];
  objc_msgSend(v6, "setContentOffset:animated:", 0, CGRectGetWidth(v12) * (double)(unint64_t)v2, 0.0);

  unint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  return [v8 updateViewsWithPhotoAtIndex:v9];
}

- (void)_updateNavbarVisibility
{
  id v3 = [(MUPlacePhotoGalleryViewController *)self navigationController];
  -[MUPlacePhotoGalleryViewController setUIStyleWithNavigationBarHidden:](self, "setUIStyleWithNavigationBarHidden:", [v3 isNavigationBarHidden]);
}

- (void)startAnimatingActivityIndicatorViewForRAP
{
  [(MUPlacePhotoGalleryViewController *)self stopAnimatingActivityIndicatorViewForRAP];
  attributionView = self->_attributionView;
  [(MUPlacePhotoGalleryAttributionView *)attributionView beginAnimatingActivityIndicator];
}

- (void)stopAnimatingActivityIndicatorViewForRAP
{
}

- (void)beginAnimatingActivityIndicator
{
  [(MUPlacePhotoGalleryViewController *)self endAnimatingActivityIndicatorWithError:0];
  id v3 = [(MUPlacePhotoGalleryViewController *)self spinner];
  int v4 = [(MUPlacePhotoGalleryViewController *)self addPhotoBarButtonItem];
  [v4 setCustomView:v3];

  id v5 = [(MUPlacePhotoGalleryViewController *)self spinner];
  [v5 startAnimating];
}

- (void)endAnimatingActivityIndicatorWithError:(id)a3
{
  int v4 = [(MUPlacePhotoGalleryViewController *)self spinner];
  [v4 stopAnimating];

  id v5 = [(MUPlacePhotoGalleryViewController *)self addPhotoBarButtonItem];
  [v5 setCustomView:0];
}

- (void)scrollLeft
{
  unint64_t v3 = [(MUPlacePhotoGalleryViewController *)self indexOfVisibleView];
  if (v3)
  {
    unint64_t v4 = v3;
    [(MUPlacePhotoGalleryViewController *)self scrollViewContentOffset];
    double v6 = v5;
    id v7 = [(MUPlacePhotoGalleryViewController *)self view];
    [v7 frame];
    double v8 = v6 - CGRectGetWidth(v14);

    uint64_t v9 = [(MUPlacePhotoGalleryViewController *)self scrollView];
    objc_msgSend(v9, "setContentOffset:animated:", 0, v8, 0.0);

    char v10 = [(MUPlacePhotoGalleryViewController *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = [(MUPlacePhotoGalleryViewController *)self delegate];
      [v12 placePhotoGalleryDidScrollLeftToIndex:v4 - 1];
    }
  }
}

- (void)scrollRight
{
  unint64_t v3 = [(MUPlacePhotoGalleryViewController *)self indexOfVisibleView];
  if (v3 < [(MUPlacePhotoGalleryViewController *)self viewsCount] - 1)
  {
    [(MUPlacePhotoGalleryViewController *)self scrollViewContentOffset];
    double v5 = v4;
    double v6 = [(MUPlacePhotoGalleryViewController *)self view];
    [v6 frame];
    double v7 = v5 + CGRectGetWidth(v13);

    double v8 = [(MUPlacePhotoGalleryViewController *)self scrollView];
    objc_msgSend(v8, "setContentOffset:animated:", 0, v7, 0.0);

    uint64_t v9 = [(MUPlacePhotoGalleryViewController *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = [(MUPlacePhotoGalleryViewController *)self delegate];
      [v11 placePhotoGalleryDidScrollRightToIndex:v3 + 1];
    }
  }
}

- (void)attributionViewDidSelectDeletePhoto:(id)a3
{
  unint64_t v4 = [(MUPlacePhotoGalleryViewController *)self indexOfVisibleView];
  [(MUPlacePhotoGalleryViewController *)self _didTapDeletePhotoMenuItemForImageAtIndex:v4];
}

- (MUPlacePhotoGalleryViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MUPlacePhotoGalleryViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)panAndSwipeToDismissGestureEnabled
{
  return self->_panAndSwipeToDismissGestureEnabled;
}

- (void)setPanAndSwipeToDismissGestureEnabled:(BOOL)a3
{
  self->_panAndSwipeToDismissGestureEnabled = a3;
}

- (BOOL)enablePersonalizedAttribution
{
  return self->_enablePersonalizedAttribution;
}

- (NSArray)photos
{
  return self->_photos;
}

- (void)setPhotos:(id)a3
{
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
}

- (NSArray)photoViews
{
  return self->_photoViews;
}

- (void)setPhotoViews:(id)a3
{
}

- (UIView)additionalView
{
  return self->_additionalView;
}

- (void)setAdditionalView:(id)a3
{
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (CGPoint)imageViewCenterPoint
{
  double x = self->_imageViewCenterPoint.x;
  double y = self->_imageViewCenterPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setImageViewCenterPoint:(CGPoint)a3
{
  self->_imageViewCenterPoint = a3;
}

- (int64_t)panGestureStartingDirection
{
  return self->_panGestureStartingDirection;
}

- (void)setPanGestureStartingDirection:(int64_t)a3
{
  self->_panGestureStartingDirection = a3;
}

- (UIView)gestureTrackedView
{
  return self->_gestureTrackedView;
}

- (void)setGestureTrackedView:(id)a3
{
}

- (BOOL)shouldFinishAnimation
{
  return self->_shouldFinishAnimation;
}

- (void)setShouldFinishAnimation:(BOOL)a3
{
  self->_shouldFinishAnimation = a3;
}

- (NSNumber)originalIndex
{
  return self->_originalIndex;
}

- (void)setOriginalIndex:(id)a3
{
}

- (MUPlacePhotoGalleryAttributionView)attributionView
{
  return self->_attributionView;
}

- (void)setAttributionView:(id)a3
{
}

- (NSMutableArray)indexesOfDownloadedImages
{
  return self->_indexesOfDownloadedImages;
}

- (void)setIndexesOfDownloadedImages:(id)a3
{
}

- (NSMutableArray)downloadingImagesURLs
{
  return self->_downloadingImagesURLs;
}

- (void)setDownloadingImagesURLs:(id)a3
{
}

- (double)lastScrollViewOffsetBeforeScrolling
{
  return self->_lastScrollViewOffsetBeforeScrolling;
}

- (void)setLastScrollViewOffsetBeforeScrolling:(double)a3
{
  self->_lastScrollViewOffsetBeforeScrolling = a3;
}

- (UIBarButtonItem)openNavigationBarButton
{
  return self->_openNavigationBarButton;
}

- (void)setOpenNavigationBarButton:(id)a3
{
}

- (void)setSpinner:(id)a3
{
}

- (UIBarButtonItem)backBarButtonItem
{
  return self->_backBarButtonItem;
}

- (void)setBackBarButtonItem:(id)a3
{
}

- (MUPlaceUserAttributionViewModel)userAttributionViewModel
{
  return self->_userAttributionViewModel;
}

- (void)setUserAttributionViewModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAttributionViewModel, 0);
  objc_storeStrong((id *)&self->_backBarButtonItem, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_openNavigationBarButton, 0);
  objc_storeStrong((id *)&self->_downloadingImagesURLs, 0);
  objc_storeStrong((id *)&self->_indexesOfDownloadedImages, 0);
  objc_storeStrong((id *)&self->_attributionView, 0);
  objc_storeStrong((id *)&self->_originalIndex, 0);
  objc_storeStrong((id *)&self->_gestureTrackedView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_additionalView, 0);
  objc_storeStrong((id *)&self->_photoViews, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_photos, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_addPhotoBarButtonItem, 0);
}

@end