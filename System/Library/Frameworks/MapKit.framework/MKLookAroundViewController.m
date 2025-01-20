@interface MKLookAroundViewController
+ (BOOL)supportsSecureCoding;
- (BOOL)_isDescendantOfRootViewController;
- (BOOL)_isFullScreenCover;
- (BOOL)_isPresentedFullScreen;
- (BOOL)_isPresentingFullScreen;
- (BOOL)_isTransitioningToOrFromFullScreen;
- (BOOL)_modalPresentationStyleIsFullScreen;
- (BOOL)_shouldRestrictLookAroundViewOptionsForPreview;
- (BOOL)didBecomeFullyDrawn;
- (BOOL)isNavigationEnabled;
- (BOOL)lookAroundView:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)showsRoadLabels;
- (CGRect)attributionButtonFrame;
- (MKLookAroundBadgePosition)badgePosition;
- (MKLookAroundScene)scene;
- (MKLookAroundViewController)initWithCoder:(NSCoder *)coder;
- (MKLookAroundViewController)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
- (MKLookAroundViewController)initWithScene:(MKLookAroundScene *)scene;
- (MKPointOfInterestFilter)pointOfInterestFilter;
- (NSAttributedString)badgeLabelGlyph;
- (NSAttributedString)badgeLabelTitle;
- (UIFont)attributionButtonFont;
- (UIFont)buttonFont;
- (UIFont)labelFont;
- (UIFont)secondaryLabelFont;
- (UIFont)tertiaryLabelFont;
- (id)_contentView;
- (id)_fullScreenViewController;
- (id)_fullScreenViewControllerIfLoaded;
- (id)_transitionController;
- (id)_urlForMapAttribution;
- (id)delegate;
- (int64_t)_preferredModalPresentationStyle;
- (int64_t)overrideUserInterfaceStyle;
- (void)_commonInit;
- (void)_contentSizeDidChange;
- (void)_didSelectView:(id)a3;
- (void)_didTapAttributionButton:(id)a3;
- (void)_didTapCloseButton:(id)a3;
- (void)_setFullScreenCover:(BOOL)a3;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_transitionFromFullScreenAnimated:(BOOL)a3 completionHandler:(id)a4;
- (void)_transitionToFullScreenAnimated:(BOOL)a3 completionHandler:(id)a4;
- (void)_updateBadgeViewIfNeeded;
- (void)_updateCloseButtonIfNeeded;
- (void)_updateGradientIfNeeded;
- (void)_updateLookAroundViewIfNeeded;
- (void)_updateSceneIfNeeded;
- (void)_updateStackViewIfNeeded;
- (void)applyShadowToView:(id)a3 withRadius:(double)a4 offset:(CGSize)a5 opacity:(float)a6;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)fullScreenViewControllerDidDismiss:(id)a3;
- (void)fullScreenViewControllerDidPresent:(id)a3;
- (void)fullScreenViewControllerWillDismiss:(id)a3;
- (void)fullScreenViewControllerWillPresent:(id)a3;
- (void)lookAroundView:(id)a3 didChangeLocationInfo:(id)a4;
- (void)lookAroundViewDidChangeRegion:(id)a3;
- (void)lookAroundViewWillChangeRegion:(id)a3;
- (void)setBadgePosition:(MKLookAroundBadgePosition)badgePosition;
- (void)setDelegate:(id)delegate;
- (void)setDidBecomeFullyDrawn:(BOOL)a3;
- (void)setNavigationEnabled:(BOOL)navigationEnabled;
- (void)setPointOfInterestFilter:(MKPointOfInterestFilter *)pointOfInterestFilter;
- (void)setScene:(MKLookAroundScene *)scene;
- (void)setShowsRoadLabels:(BOOL)showsRoadLabels;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MKLookAroundViewController

- (void)_commonInit
{
  self->_initialScene = 1;
  self->_navigationEnabled = 1;
  self->_needsLookAroundViewUpdate = 1;
  self->_needsSceneUpdate = 1;
  self->_presentationType = 0;
  v3 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
  dateFormatter = self->_dateFormatter;
  self->_dateFormatter = v3;

  self->_showsRoadLabels = 1;
}

- (MKLookAroundViewController)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  v7.receiver = self;
  v7.super_class = (Class)MKLookAroundViewController;
  v4 = [(MKLookAroundViewController *)&v7 initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  v5 = v4;
  if (v4) {
    [(MKLookAroundViewController *)v4 _commonInit];
  }
  return v5;
}

- (MKLookAroundViewController)initWithCoder:(NSCoder *)coder
{
  v4 = coder;
  v10.receiver = self;
  v10.super_class = (Class)MKLookAroundViewController;
  v5 = [(MKLookAroundViewController *)&v10 initWithCoder:v4];
  v6 = v5;
  if (v5)
  {
    [(MKLookAroundViewController *)v5 _commonInit];
    if ([(NSCoder *)v4 containsValueForKey:@"MKDelegate"])
    {
      objc_super v7 = [(NSCoder *)v4 decodeObjectForKey:@"MKDelegate"];
      [(MKLookAroundViewController *)v6 setDelegate:v7];
    }
    if ([(NSCoder *)v4 containsValueForKey:@"MKNavigationEnabled"]) {
      [(MKLookAroundViewController *)v6 setNavigationEnabled:[(NSCoder *)v4 decodeBoolForKey:@"MKNavigationEnabled"]];
    }
    if ([(NSCoder *)v4 containsValueForKey:@"MKShowsRoadLabels"]) {
      [(MKLookAroundViewController *)v6 setShowsRoadLabels:[(NSCoder *)v4 decodeBoolForKey:@"MKShowsRoadLabels"]];
    }
    if ([(NSCoder *)v4 containsValueForKey:@"MKPointOfInterestFilter"])
    {
      v8 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"MKPointOfInterestFilter"];
      [(MKLookAroundViewController *)v6 setPointOfInterestFilter:v8];
    }
  }

  return v6;
}

- (MKLookAroundViewController)initWithScene:(MKLookAroundScene *)scene
{
  v5 = scene;
  v9.receiver = self;
  v9.super_class = (Class)MKLookAroundViewController;
  v6 = [(MKLookAroundViewController *)&v9 initWithNibName:0 bundle:0];
  objc_super v7 = v6;
  if (v6)
  {
    [(MKLookAroundViewController *)v6 _commonInit];
    objc_storeStrong((id *)&v7->_scene, scene);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MKLookAroundViewController;
  id v4 = a3;
  [(MKLookAroundViewController *)&v7 encodeWithCoder:v4];
  v5 = [(MKLookAroundViewController *)self delegate];
  [v4 encodeConditionalObject:v5 forKey:@"MKDelegate"];

  objc_msgSend(v4, "encodeBool:forKey:", -[MKLookAroundViewController isNavigationEnabled](self, "isNavigationEnabled"), @"MKNavigationEnabled");
  objc_msgSend(v4, "encodeBool:forKey:", -[MKLookAroundViewController showsRoadLabels](self, "showsRoadLabels"), @"MKShowsRoadLabels");
  v6 = [(MKLookAroundViewController *)self pointOfInterestFilter];
  [v4 encodeObject:v6 forKey:@"MKPointOfInterestFilter"];
}

- (void)dealloc
{
  if (self->_didBecomeFullyDrawnObserver)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self->_didBecomeFullyDrawnObserver];
  }
  v4.receiver = self;
  v4.super_class = (Class)MKLookAroundViewController;
  [(MKLookAroundViewController *)&v4 dealloc];
}

- (void)setScene:(MKLookAroundScene *)scene
{
  v5 = scene;
  if (self->_scene != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_scene, scene);
    self->_needsSceneUpdate = 1;
    [(MKLookAroundViewController *)self _updateSceneIfNeeded];
    v5 = v6;
  }
}

- (void)setNavigationEnabled:(BOOL)navigationEnabled
{
  BOOL v3 = navigationEnabled;
  if (self->_navigationEnabled != navigationEnabled)
  {
    self->_navigationEnabled = navigationEnabled;
    self->_needsLookAroundViewUpdate = 1;
    [(MKLookAroundViewController *)self _updateLookAroundViewIfNeeded];
  }
  lookAroundView = self->_lookAroundView;

  [(MKLookAroundView *)lookAroundView setNavigatingEnabled:v3];
}

- (void)setShowsRoadLabels:(BOOL)showsRoadLabels
{
  if (self->_showsRoadLabels != showsRoadLabels)
  {
    self->_showsRoadLabels = showsRoadLabels;
    self->_needsLookAroundViewUpdate = 1;
    [(MKLookAroundViewController *)self _updateLookAroundViewIfNeeded];
  }
}

- (void)setPointOfInterestFilter:(MKPointOfInterestFilter *)pointOfInterestFilter
{
  v5 = pointOfInterestFilter;
  if (self->_pointOfInterestFilter != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_pointOfInterestFilter, pointOfInterestFilter);
    self->_needsLookAroundViewUpdate = 1;
    [(MKLookAroundViewController *)self _updateLookAroundViewIfNeeded];
    v5 = v6;
  }
}

- (void)setBadgePosition:(MKLookAroundBadgePosition)badgePosition
{
  if ((unint64_t)badgePosition >= (MKLookAroundBadgePositionBottomTrailing|MKLookAroundBadgePositionTopTrailing)) {
    MKLookAroundBadgePosition v3 = MKLookAroundBadgePositionTopLeading;
  }
  else {
    MKLookAroundBadgePosition v3 = badgePosition;
  }
  if (self->_badgePosition != v3)
  {
    self->_badgePosition = v3;
    if ([(MKLookAroundViewController *)self isViewLoaded])
    {
      [(MKLookAroundViewController *)self _updateBadgeViewIfNeeded];
    }
  }
}

- (int64_t)_preferredModalPresentationStyle
{
  return 0;
}

- (int64_t)overrideUserInterfaceStyle
{
  return 2 * (self->_presentationType == 1);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MKLookAroundViewController;
  [(MKLookAroundViewController *)&v4 viewWillAppear:a3];
  if (![(MKLookAroundViewController *)self modalPresentationStyle]
    && ([(MKLookAroundViewController *)self isBeingPresented] & 1) != 0
    || [(MKLookAroundViewController *)self _isFullScreenCover])
  {
    self->_presentationType = 1;
    [(UITapGestureRecognizer *)self->_selectGestureRecognizer setEnabled:0];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MKLookAroundViewController;
  [(MKLookAroundViewController *)&v4 viewDidAppear:a3];
  [(MKLookAroundViewController *)self _updateSceneIfNeeded];
  if (self->_presentationType == 1)
  {
    [(MKLookAroundViewController *)self _updateBadgeViewIfNeeded];
    [(MKLookAroundViewController *)self _updateCloseButtonIfNeeded];
    [(MKLookAroundViewController *)self _updateGradientIfNeeded];
    [(MKLookAroundViewController *)self _updateLookAroundViewIfNeeded];
    [(MKLookAroundViewController *)self _updateStackViewIfNeeded];
  }
}

- (void)viewDidLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)MKLookAroundViewController;
  [(MKLookAroundViewController *)&v14 viewDidLayoutSubviews];
  MKLookAroundBadgePosition v3 = [(MKLookAroundView *)self->_lookAroundView superview];
  objc_super v4 = [(MKLookAroundViewController *)self view];

  if (v3 == v4)
  {
    v5 = [(MKLookAroundViewController *)self view];
    [v5 bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    -[MKLookAroundView setFrame:](self->_lookAroundView, "setFrame:", v7, v9, v11, v13);
    [(MKLookAroundViewController *)self _updateBadgeViewIfNeeded];
    [(MKLookAroundViewController *)self _updateCloseButtonIfNeeded];
    [(MKLookAroundViewController *)self _updateGradientIfNeeded];
    [(MKLookAroundViewController *)self _updateLookAroundViewIfNeeded];
    [(MKLookAroundViewController *)self _updateStackViewIfNeeded];
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)MKLookAroundViewController;
  [(MKLookAroundViewController *)&v3 viewDidLoad];
  [(MKLookAroundViewController *)self _setupSubviews];
  [(MKLookAroundViewController *)self _setupConstraints];
}

- (void)fullScreenViewControllerWillPresent:(id)a3
{
  objc_super v4 = [(MKLookAroundView *)self->_lookAroundView overlayView];
  [v4 setAlpha:0.0];

  [(UITapGestureRecognizer *)self->_selectGestureRecognizer setEnabled:0];
  v5 = [(MKLookAroundViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MKLookAroundViewController *)self delegate];
    [v7 lookAroundViewControllerWillPresentFullScreen:self];
  }
}

- (void)fullScreenViewControllerDidPresent:(id)a3
{
  self->_presentationType = 1;
  [(MKLookAroundViewController *)self _updateBadgeViewIfNeeded];
  [(MKLookAroundViewController *)self _updateCloseButtonIfNeeded];
  [(MKLookAroundViewController *)self _updateGradientIfNeeded];
  [(MKLookAroundViewController *)self _updateLookAroundViewIfNeeded];
  [(MKLookAroundViewController *)self _updateStackViewIfNeeded];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__MKLookAroundViewController_fullScreenViewControllerDidPresent___block_invoke;
  v7[3] = &unk_1E54B8188;
  v7[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v7 animations:0 completion:0.2];
  objc_super v4 = [(MKLookAroundViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(MKLookAroundViewController *)self delegate];
    [v6 lookAroundViewControllerDidPresentFullScreen:self];
  }
}

void __65__MKLookAroundViewController_fullScreenViewControllerDidPresent___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 1120) overlayView];
  [v1 setAlpha:1.0];
}

- (void)fullScreenViewControllerWillDismiss:(id)a3
{
  objc_super v4 = [(MKLookAroundView *)self->_lookAroundView overlayView];
  [v4 setAlpha:0.0];

  char v5 = [(MKLookAroundViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MKLookAroundViewController *)self delegate];
    [v7 lookAroundViewControllerWillDismissFullScreen:self];
  }
}

- (void)fullScreenViewControllerDidDismiss:(id)a3
{
  self->_presentationType = 0;
  [(UITapGestureRecognizer *)self->_selectGestureRecognizer setEnabled:1];
  objc_super v4 = [(MKLookAroundViewController *)self view];
  uint64_t v5 = [(MKLookAroundViewController *)self _contentView];
  [v4 addSubview:v5];

  char v6 = [(MKLookAroundViewController *)self view];
  [v6 needsUpdateConstraints];

  id v7 = [(MKLookAroundViewController *)self view];
  [v7 layoutIfNeeded];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__MKLookAroundViewController_fullScreenViewControllerDidDismiss___block_invoke;
  v10[3] = &unk_1E54B8188;
  v10[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v10 animations:0 completion:0.2];
  double v8 = [(MKLookAroundViewController *)self delegate];
  LOBYTE(v5) = objc_opt_respondsToSelector();

  if (v5)
  {
    double v9 = [(MKLookAroundViewController *)self delegate];
    [v9 lookAroundViewControllerDidDismissFullScreen:self];
  }
}

void __65__MKLookAroundViewController_fullScreenViewControllerDidDismiss___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 1120) overlayView];
  [v1 setAlpha:1.0];
}

- (void)lookAroundView:(id)a3 didChangeLocationInfo:(id)a4
{
  v49[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = objc_msgSend(v5, "_mapkit_locationTitle");
  [(UILabel *)self->_locationLabel setText:v6];

  id v7 = objc_msgSend(v5, "_mapkit_locationSubtitle");
  [(UILabel *)self->_localityLabel setText:v7];

  double v8 = [v5 collectionDate];

  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F42698]);
    double v10 = (void *)MEMORY[0x1E4F42A98];
    double v11 = [(MKLookAroundViewController *)self tertiaryLabelFont];
    [v11 pointSize];
    v44 = objc_msgSend(v10, "configurationWithPointSize:weight:scale:", (uint64_t)*MEMORY[0x1E4F43928], 1);

    double v12 = [MEMORY[0x1E4F42A80] systemImageNamed:@"applelogo" withConfiguration:v44];
    double v13 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    objc_super v14 = [v12 imageWithTintColor:v13];
    [v9 setImage:v14];

    v15 = objc_opt_new();
    v16 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v9];
    [v15 appendAttributedString:v16];

    id v17 = objc_alloc(MEMORY[0x1E4F28B18]);
    v18 = _MKLocalizedStringFromThisBundle(@"[Look Around] Apple Maps Logo");
    v19 = (void *)[v17 initWithString:v18];
    [v15 appendAttributedString:v19];

    dateFormatter = self->_dateFormatter;
    v21 = (void *)MEMORY[0x1E4F28C10];
    v22 = [MEMORY[0x1E4F1CA20] currentLocale];
    v23 = [v21 dateFormatFromTemplate:@"MMMMyyyy" options:0 locale:v22];
    [(NSDateFormatter *)dateFormatter setLocalizedDateFormatFromTemplate:v23];

    id v24 = objc_alloc(MEMORY[0x1E4F28B18]);
    v25 = self->_dateFormatter;
    v26 = [v5 collectionDate];
    v27 = [(NSDateFormatter *)v25 stringFromDate:v26];
    v28 = (void *)[v24 initWithString:v27];
    [v15 appendAttributedString:v28];

    uint64_t v47 = *MEMORY[0x1E4F42508];
    uint64_t v29 = v47;
    v30 = [(MKLookAroundViewController *)self tertiaryLabelFont];
    v49[0] = v30;
    uint64_t v48 = *MEMORY[0x1E4F42510];
    uint64_t v31 = v48;
    v32 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    v49[1] = v32;
    v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:&v47 count:2];
    objc_msgSend(v15, "addAttributes:range:", v33, 0, objc_msgSend(v15, "length"));

    v34 = (void *)[v15 copy];
    [(UILabel *)self->_imageryCollectionDateLabel setAttributedText:v34];

    id v35 = objc_alloc(MEMORY[0x1E4F28E48]);
    v36 = _MKLocalizedStringFromThisBundle(@"Legal");
    v37 = (void *)[v35 initWithString:v36];

    v45[0] = v29;
    v38 = [(MKLookAroundViewController *)self attributionButtonFont];
    v46[0] = v38;
    v45[1] = v31;
    v39 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    v46[1] = v39;
    v45[2] = *MEMORY[0x1E4F425C8];
    v40 = [NSNumber numberWithInt:1];
    v46[2] = v40;
    v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:3];
    objc_msgSend(v37, "addAttributes:range:", v41, 0, objc_msgSend(v37, "length"));

    attributionButton = self->_attributionButton;
    v43 = (void *)[v37 copy];
    [(UIButton *)attributionButton setAttributedTitle:v43 forState:0];
  }
}

- (void)lookAroundViewWillChangeRegion:(id)a3
{
  objc_super v4 = [(MKLookAroundViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(MKLookAroundViewController *)self delegate];
    [v6 lookAroundViewControllerWillUpdateScene:self];
  }
}

- (void)lookAroundViewDidChangeRegion:(id)a3
{
  id v4 = a3;
  id v20 = v4;
  if (self->_initialScene)
  {
    self->_initialScene = 0;
    goto LABEL_8;
  }
  char v5 = [v4 mapItem];

  if (v5)
  {
    id v6 = [MKLookAroundScene alloc];
    id v7 = [v20 mapItem];
    double v8 = [v20 muninViewState];
    id v9 = [v8 cameraFrame];
    double v10 = [(MKLookAroundScene *)v6 initWithMapItem:v7 cameraFrameOverride:v9];
    scene = self->_scene;
    self->_scene = v10;

LABEL_7:
    goto LABEL_8;
  }
  double v12 = [v20 revGeoMapItem];

  if (v12)
  {
    double v13 = [MKLookAroundScene alloc];
    id v7 = [v20 muninViewState];
    objc_super v14 = [(MKLookAroundScene *)v13 initWithMuninViewState:v7];
    v15 = self->_scene;
    self->_scene = v14;

    goto LABEL_7;
  }
  v19 = self->_scene;
  self->_scene = 0;

LABEL_8:
  v16 = [(MKLookAroundViewController *)self delegate];
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    v18 = [(MKLookAroundViewController *)self delegate];
    [v18 lookAroundViewControllerDidUpdateScene:self];
  }
}

- (BOOL)lookAroundView:(id)a3 shouldReceiveTouch:(id)a4
{
  [a4 locationInView:a3];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  [(UIVisualEffectView *)self->_closeButtonView frame];
  v10.x = v6;
  v10.y = v8;
  if (CGRectContainsPoint(v12, v10)) {
    return 0;
  }
  [(MKLookAroundViewController *)self attributionButtonFrame];
  v11.x = v6;
  v11.y = v8;
  return !CGRectContainsPoint(v13, v11);
}

- (UIFont)buttonFont
{
  v2 = +[MKFontManager sharedManager];
  objc_super v3 = [v2 lookAroundButtonFont];

  [v3 pointSize];
  if (v4 <= 18.0)
  {
    id v8 = v3;
  }
  else
  {
    double v5 = (void *)MEMORY[0x1E4F42A30];
    CGFloat v6 = [v3 fontDescriptor];
    double v7 = [v6 fontDescriptorWithSize:18.0];
    id v8 = [v5 fontWithDescriptor:v7 size:0.0];
  }

  return (UIFont *)v8;
}

- (UIFont)labelFont
{
  v2 = +[MKFontManager sharedManager];
  objc_super v3 = [v2 lookAroundLabelFont];

  [v3 pointSize];
  if (v4 <= 22.0)
  {
    id v8 = v3;
  }
  else
  {
    double v5 = (void *)MEMORY[0x1E4F42A30];
    CGFloat v6 = [v3 fontDescriptor];
    double v7 = [v6 fontDescriptorWithSize:22.0];
    id v8 = [v5 fontWithDescriptor:v7 size:0.0];
  }

  return (UIFont *)v8;
}

- (NSAttributedString)badgeLabelGlyph
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F42698]);
  double v4 = (void *)MEMORY[0x1E4F42A80];
  double v5 = (void *)MEMORY[0x1E4F42A98];
  CGFloat v6 = [(MKLookAroundViewController *)self buttonFont];
  double v7 = [v5 configurationWithFont:v6];
  id v8 = [v4 systemImageNamed:@"binoculars.fill" withConfiguration:v7];
  id v9 = [MEMORY[0x1E4F428B8] whiteColor];
  CGPoint v10 = [v8 imageWithTintColor:v9];
  [v3 setImage:v10];

  CGPoint v11 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v3];

  return (NSAttributedString *)v11;
}

- (NSAttributedString)badgeLabelTitle
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:&stru_1ED919588];
  double v4 = [(MKLookAroundViewController *)self badgeLabelGlyph];
  [v3 appendAttributedString:v4];

  double v5 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
  [v3 appendAttributedString:v5];

  id v6 = objc_alloc(MEMORY[0x1E4F28B18]);
  double v7 = _MKLocalizedStringFromThisBundle(@"[Look Around] Look Around Badge Text");
  id v8 = (void *)[v6 initWithString:v7];

  [v3 appendAttributedString:v8];
  uint64_t v9 = *MEMORY[0x1E4F42508];
  CGPoint v10 = [(MKLookAroundViewController *)self buttonFont];
  objc_msgSend(v3, "addAttribute:value:range:", v9, v10, 0, objc_msgSend(v3, "length"));

  CGPoint v11 = (void *)[v3 copy];

  return (NSAttributedString *)v11;
}

- (UIFont)secondaryLabelFont
{
  v2 = +[MKFontManager sharedManager];
  id v3 = [v2 lookAroundSecondaryLabelFont];

  [v3 pointSize];
  if (v4 <= 15.0)
  {
    id v8 = v3;
  }
  else
  {
    double v5 = (void *)MEMORY[0x1E4F42A30];
    id v6 = [v3 fontDescriptor];
    double v7 = [v6 fontDescriptorWithSize:15.0];
    id v8 = [v5 fontWithDescriptor:v7 size:0.0];
  }

  return (UIFont *)v8;
}

- (UIFont)tertiaryLabelFont
{
  v2 = +[MKFontManager sharedManager];
  id v3 = [v2 lookAroundTertiaryLabelFont];

  [v3 pointSize];
  if (v4 <= 13.0)
  {
    id v8 = v3;
  }
  else
  {
    double v5 = (void *)MEMORY[0x1E4F42A30];
    id v6 = [v3 fontDescriptor];
    double v7 = [v6 fontDescriptorWithSize:13.0];
    id v8 = [v5 fontWithDescriptor:v7 size:0.0];
  }

  return (UIFont *)v8;
}

- (UIFont)attributionButtonFont
{
  v2 = +[MKFontManager sharedManager];
  id v3 = [v2 lookAroundAttributionButtonFont];

  [v3 pointSize];
  if (v4 <= 9.0)
  {
    id v8 = v3;
  }
  else
  {
    double v5 = (void *)MEMORY[0x1E4F42A30];
    id v6 = [v3 fontDescriptor];
    double v7 = [v6 fontDescriptorWithSize:9.0];
    id v8 = [v5 fontWithDescriptor:v7 size:0.0];
  }

  return (UIFont *)v8;
}

- (CGRect)attributionButtonFrame
{
  id v3 = [(MKLookAroundView *)self->_lookAroundView overlayView];
  [(UIButton *)self->_attributionButton bounds];
  objc_msgSend(v3, "convertRect:fromView:", self->_attributionButton);
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;

  uint64_t v12 = v5;
  uint64_t v13 = v7;
  uint64_t v14 = v9;
  uint64_t v15 = v11;

  return CGRectInset(*(CGRect *)&v12, -9.0, -9.0);
}

- (void)applyShadowToView:(id)a3 withRadius:(double)a4 offset:(CGSize)a5 opacity:(float)a6
{
  double height = a5.height;
  double width = a5.width;
  id v10 = a3;
  uint64_t v11 = [v10 layer];
  [v11 setMasksToBounds:0];

  id v12 = [MEMORY[0x1E4F428B8] blackColor];
  uint64_t v13 = [v12 CGColor];
  uint64_t v14 = [v10 layer];
  [v14 setShadowColor:v13];

  uint64_t v15 = [v10 layer];
  [v15 setShadowRadius:a4];

  v16 = [v10 layer];
  objc_msgSend(v16, "setShadowOffset:", width, height);

  char v17 = [v10 layer];
  *(float *)&double v18 = a6;
  [v17 setShadowOpacity:v18];

  id v19 = [v10 layer];

  [v19 setShadowPathIsBounds:1];
}

- (void)_contentSizeDidChange
{
  [(MKLookAroundViewController *)self _updateBadgeViewIfNeeded];
  [(MKLookAroundViewController *)self _updateCloseButtonIfNeeded];

  [(MKLookAroundViewController *)self _updateStackViewIfNeeded];
}

- (id)_contentView
{
  return self->_lookAroundView;
}

- (void)_didSelectView:(id)a3
{
  if ([(MKLookAroundViewController *)self _isPresentingFullScreen])
  {
    [(MKLookAroundViewController *)self _transitionFromFullScreenAnimated:1 completionHandler:0];
  }
  else
  {
    [(MKLookAroundViewController *)self _transitionToFullScreenAnimated:1 completionHandler:0];
  }
}

- (void)_didTapCloseButton:(id)a3
{
}

- (void)_didTapAttributionButton:(id)a3
{
  id v4 = [(MKLookAroundViewController *)self _urlForMapAttribution];
  if (v4)
  {
    id v3 = +[MKSystemController sharedInstance];
    [v3 openURL:v4 completionHandler:0];
  }
}

- (id)_fullScreenViewController
{
  fullScreenViewController = self->_fullScreenViewController;
  if (!fullScreenViewController)
  {
    id v4 = objc_alloc_init(MKLookAroundFullScreenViewController);
    [(MKLookAroundFullScreenViewController *)v4 setModalPresentationStyle:0];
    uint64_t v5 = [(MKLookAroundViewController *)self _transitionController];
    [(MKLookAroundFullScreenViewController *)v4 setTransitioningDelegate:v5];

    [(MKLookAroundFullScreenViewController *)v4 setDelegate:self];
    uint64_t v6 = self->_fullScreenViewController;
    self->_fullScreenViewController = v4;

    fullScreenViewController = self->_fullScreenViewController;
  }

  return fullScreenViewController;
}

- (id)_fullScreenViewControllerIfLoaded
{
  return self->_fullScreenViewController;
}

- (BOOL)_isDescendantOfRootViewController
{
  v2 = self;
  id v3 = [(MKLookAroundViewController *)v2 parentViewController];

  id v4 = v2;
  if (v3)
  {
    uint64_t v5 = v2;
    do
    {
      id v4 = [(MKLookAroundViewController *)v5 parentViewController];

      uint64_t v6 = [(MKLookAroundViewController *)v4 parentViewController];

      uint64_t v5 = v4;
    }
    while (v6);
  }
  uint64_t v7 = [(MKLookAroundViewController *)v4 presentingViewController];

  if (v7)
  {
    do
    {
      uint64_t v8 = [(MKLookAroundViewController *)v4 presentingViewController];

      uint64_t v9 = [(MKLookAroundViewController *)v8 presentingViewController];

      id v4 = v8;
    }
    while (v9);
    if (v8) {
      goto LABEL_7;
    }
LABEL_9:
    LOBYTE(v10) = 0;
    goto LABEL_10;
  }
  uint64_t v8 = v4;
  if (!v4) {
    goto LABEL_9;
  }
LABEL_7:
  int v10 = [(MKLookAroundViewController *)v8 isEqual:v2] ^ 1;
LABEL_10:

  return v10;
}

- (BOOL)_isPresentedFullScreen
{
  id v3 = [(MKLookAroundViewController *)self parentViewController];
  BOOL v4 = !v3
    && [(MKLookAroundViewController *)self _isDescendantOfRootViewController]
    && [(MKLookAroundViewController *)self _modalPresentationStyleIsFullScreen];

  return v4;
}

- (BOOL)_isPresentingFullScreen
{
  v2 = [(MKLookAroundViewController *)self _fullScreenViewControllerIfLoaded];
  id v3 = [v2 presentingViewController];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)_isTransitioningToOrFromFullScreen
{
  if ([(MKLookAroundViewController *)self isBeingDismissed]) {
    char v3 = 1;
  }
  else {
    char v3 = [(MKLookAroundViewController *)self isBeingPresented];
  }
  BOOL v4 = [(MKLookAroundViewController *)self _fullScreenViewControllerIfLoaded];
  if ([v4 isBeingDismissed] & 1) != 0 || (objc_msgSend(v4, "isBeingPresented"))
  {
    BOOL v5 = 1;
  }
  else if (v4)
  {
    uint64_t v7 = [v4 presentingViewController];
    BOOL v5 = v7 == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v3 | v5;
}

- (BOOL)_modalPresentationStyleIsFullScreen
{
  return ![(MKLookAroundViewController *)self modalPresentationStyle]
      || [(MKLookAroundViewController *)self modalPresentationStyle] == 5;
}

- (void)_setupConstraints
{
  v99[23] = *MEMORY[0x1E4F143B8];
  char v3 = [(UIVisualEffectView *)self->_badgeView topAnchor];
  BOOL v4 = [(MKLookAroundView *)self->_lookAroundView overlayView];
  BOOL v5 = [v4 topAnchor];
  uint64_t v6 = [v3 constraintEqualToAnchor:v5 constant:14.0];
  badgeViewVerticalConstraint = self->_badgeViewVerticalConstraint;
  self->_badgeViewVerticalConstraint = v6;

  uint64_t v8 = [(UIVisualEffectView *)self->_badgeView leadingAnchor];
  uint64_t v9 = [(MKLookAroundView *)self->_lookAroundView overlayView];
  int v10 = [v9 safeAreaLayoutGuide];
  uint64_t v11 = [v10 leadingAnchor];
  id v12 = [v8 constraintEqualToAnchor:v11 constant:14.0];
  badgeViewHorizontalConstraint = self->_badgeViewHorizontalConstraint;
  self->_badgeViewHorizontalConstraint = v12;

  uint64_t v14 = [(UIStackView *)self->_infoStackView trailingAnchor];
  uint64_t v15 = [(MKLookAroundView *)self->_lookAroundView overlayView];
  v16 = [v15 safeAreaLayoutGuide];
  char v17 = [v16 trailingAnchor];
  double v18 = [v14 constraintLessThanOrEqualToAnchor:v17 constant:-16.0];

  LODWORD(v19) = 1144750080;
  id v20 = v18;
  v52 = v18;
  [v18 setPriority:v19];
  v69 = (void *)MEMORY[0x1E4F28DC8];
  v97 = [(_MKGradientView *)self->_gradientView topAnchor];
  v98 = [(MKLookAroundView *)self->_lookAroundView overlayView];
  v96 = [v98 topAnchor];
  v95 = [v97 constraintEqualToAnchor:v96];
  v99[0] = v95;
  v93 = [(_MKGradientView *)self->_gradientView bottomAnchor];
  v94 = [(MKLookAroundView *)self->_lookAroundView overlayView];
  v92 = [v94 bottomAnchor];
  v91 = [v93 constraintEqualToAnchor:v92];
  v99[1] = v91;
  v89 = [(_MKGradientView *)self->_gradientView leadingAnchor];
  v90 = [(MKLookAroundView *)self->_lookAroundView overlayView];
  v88 = [v90 leadingAnchor];
  v87 = [v89 constraintEqualToAnchor:v88];
  v99[2] = v87;
  v85 = [(_MKGradientView *)self->_gradientView trailingAnchor];
  v86 = [(MKLookAroundView *)self->_lookAroundView overlayView];
  v84 = [v86 trailingAnchor];
  v83 = [v85 constraintEqualToAnchor:v84];
  v99[3] = v83;
  v80 = [(UIVisualEffectView *)self->_closeButtonView topAnchor];
  v82 = [(MKLookAroundView *)self->_lookAroundView overlayView];
  v81 = [v82 safeAreaLayoutGuide];
  v79 = [v81 topAnchor];
  v78 = [v80 constraintEqualToAnchor:v79 constant:12.0];
  v99[4] = v78;
  v76 = [(UIVisualEffectView *)self->_closeButtonView trailingAnchor];
  v77 = [(MKLookAroundView *)self->_lookAroundView overlayView];
  v75 = [v77 safeAreaLayoutGuide];
  v74 = [v75 trailingAnchor];
  v73 = [v76 constraintEqualToAnchor:v74 constant:-16.0];
  v99[5] = v73;
  v72 = [(UIVisualEffectView *)self->_closeButtonView heightAnchor];
  v71 = [v72 constraintEqualToConstant:44.0];
  v99[6] = v71;
  v70 = [(UIVisualEffectView *)self->_closeButtonView widthAnchor];
  v68 = [v70 constraintEqualToConstant:44.0];
  v99[7] = v68;
  v67 = [(UIButton *)self->_closeButton topAnchor];
  v66 = [(UIVisualEffectView *)self->_closeButtonView topAnchor];
  v65 = [v67 constraintEqualToAnchor:v66];
  v99[8] = v65;
  v64 = [(UIButton *)self->_closeButton bottomAnchor];
  v63 = [(UIVisualEffectView *)self->_closeButtonView bottomAnchor];
  v62 = [v64 constraintEqualToAnchor:v63];
  v99[9] = v62;
  v61 = [(UIButton *)self->_closeButton leadingAnchor];
  v60 = [(UIVisualEffectView *)self->_closeButtonView leadingAnchor];
  v59 = [v61 constraintEqualToAnchor:v60];
  v99[10] = v59;
  v57 = [(UIButton *)self->_closeButton trailingAnchor];
  v56 = [(UIVisualEffectView *)self->_closeButtonView trailingAnchor];
  v55 = [v57 constraintEqualToAnchor:v56];
  v21 = self->_badgeViewVerticalConstraint;
  v99[11] = v55;
  v99[12] = v21;
  v99[13] = self->_badgeViewHorizontalConstraint;
  v58 = [(UILabel *)self->_badgeLabel topAnchor];
  v54 = [(UIVisualEffectView *)self->_badgeView topAnchor];
  v53 = [v58 constraintEqualToAnchor:v54 constant:7.0];
  v99[14] = v53;
  v51 = [(UILabel *)self->_badgeLabel bottomAnchor];
  v50 = [(UIVisualEffectView *)self->_badgeView bottomAnchor];
  v49 = [v51 constraintEqualToAnchor:v50 constant:-7.0];
  v99[15] = v49;
  uint64_t v48 = [(UILabel *)self->_badgeLabel leadingAnchor];
  uint64_t v47 = [(UIVisualEffectView *)self->_badgeView leadingAnchor];
  v46 = [v48 constraintEqualToAnchor:v47 constant:10.0];
  v99[16] = v46;
  v45 = [(UILabel *)self->_badgeLabel trailingAnchor];
  v44 = [(UIVisualEffectView *)self->_badgeView trailingAnchor];
  v43 = [v45 constraintEqualToAnchor:v44 constant:-10.0];
  v99[17] = v43;
  v40 = [(UIImageView *)self->_appleLogoImageView bottomAnchor];
  v42 = [(MKLookAroundView *)self->_lookAroundView overlayView];
  v41 = [v42 safeAreaLayoutGuide];
  v39 = [v41 bottomAnchor];
  v38 = [v40 constraintEqualToAnchor:v39 constant:-12.0];
  v99[18] = v38;
  v36 = [(UIImageView *)self->_appleLogoImageView leadingAnchor];
  v37 = [(MKLookAroundView *)self->_lookAroundView overlayView];
  id v35 = [v37 safeAreaLayoutGuide];
  v34 = [v35 leadingAnchor];
  v33 = [v36 constraintEqualToAnchor:v34 constant:14.0];
  v99[19] = v33;
  v32 = [(UIStackView *)self->_infoStackView bottomAnchor];
  v22 = [(MKLookAroundView *)self->_lookAroundView overlayView];
  v23 = [v22 safeAreaLayoutGuide];
  id v24 = [v23 bottomAnchor];
  v25 = [v32 constraintEqualToAnchor:v24 constant:-12.0];
  v99[20] = v25;
  v26 = [(UIStackView *)self->_infoStackView leadingAnchor];
  v27 = [(MKLookAroundView *)self->_lookAroundView overlayView];
  v28 = [v27 safeAreaLayoutGuide];
  uint64_t v29 = [v28 leadingAnchor];
  v30 = [v26 constraintEqualToAnchor:v29 constant:16.0];
  v99[21] = v30;
  v99[22] = v20;
  uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v99 count:23];
  [v69 activateConstraints:v31];
}

- (void)_setupSubviews
{
  v88[3] = *MEMORY[0x1E4F143B8];
  char v3 = [(MKLookAroundViewController *)self view];
  BOOL v4 = [MEMORY[0x1E4F428B8] clearColor];
  objc_msgSend(v3, "_mapkit_setBackgroundColor:", v4);

  BOOL v5 = [MKLookAroundView alloc];
  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  int v10 = -[MKLookAroundView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], v7, v8, v9);
  lookAroundView = self->_lookAroundView;
  self->_lookAroundView = v10;

  [(MKLookAroundView *)self->_lookAroundView setDelegate:self];
  id v12 = [(MKLookAroundViewController *)self view];
  [v12 addSubview:self->_lookAroundView];

  uint64_t v13 = -[_MKGradientView initWithFrame:]([_MKGradientView alloc], "initWithFrame:", v6, v7, v8, v9);
  gradientView = self->_gradientView;
  self->_gradientView = v13;

  [(_MKGradientView *)self->_gradientView setAccessibilityIdentifier:@"LookAroundGradientView"];
  [(_MKGradientView *)self->_gradientView setTranslatesAutoresizingMaskIntoConstraints:0];
  -[_MKGradientView setStartPoint:](self->_gradientView, "setStartPoint:", 0.5, 0.0);
  -[_MKGradientView setEndPoint:](self->_gradientView, "setEndPoint:", 0.5, 1.0);
  uint64_t v15 = [MEMORY[0x1E4F428B8] blackColor];
  v84 = [v15 colorWithAlphaComponent:0.0];

  v16 = [MEMORY[0x1E4F428B8] blackColor];
  v83 = [v16 colorWithAlphaComponent:0.0];

  char v17 = [MEMORY[0x1E4F428B8] blackColor];
  double v18 = [v17 colorWithAlphaComponent:0.68];

  v88[0] = v84;
  v88[1] = v83;
  v88[2] = v18;
  double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:3];
  [(_MKGradientView *)self->_gradientView setColors:v19];

  [(_MKGradientView *)self->_gradientView setLocations:&unk_1ED97F3C8];
  id v20 = [(MKLookAroundView *)self->_lookAroundView overlayView];
  objc_msgSend(v20, "_mapkit_insertSubview:atIndex:", self->_gradientView, 0);

  id v21 = objc_alloc(MEMORY[0x1E4F43028]);
  v22 = [MEMORY[0x1E4F427D8] effectWithStyle:18];
  v23 = (UIVisualEffectView *)[v21 initWithEffect:v22];
  closeButtonView = self->_closeButtonView;
  self->_closeButtonView = v23;

  [(UIVisualEffectView *)self->_closeButtonView setAccessibilityIdentifier:@"LookAroundCloseButtonView"];
  [(UIVisualEffectView *)self->_closeButtonView setTranslatesAutoresizingMaskIntoConstraints:0];
  v25 = [MEMORY[0x1E4F428B8] clearColor];
  [(UIVisualEffectView *)self->_closeButtonView setBackgroundColor:v25];

  v26 = [MEMORY[0x1E4F428B8] blackColor];
  v27 = [v26 colorWithAlphaComponent:0.24];
  v28 = [(UIVisualEffectView *)self->_closeButtonView contentView];
  [v28 setBackgroundColor:v27];

  uint64_t v29 = [(UIVisualEffectView *)self->_closeButtonView contentView];
  double v30 = *MEMORY[0x1E4F1DB30];
  double v31 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  LODWORD(v32) = 1041865114;
  -[MKLookAroundViewController applyShadowToView:withRadius:offset:opacity:](self, "applyShadowToView:withRadius:offset:opacity:", v29, 5.0, *MEMORY[0x1E4F1DB30], v31, v32);

  v33 = [(MKLookAroundView *)self->_lookAroundView overlayView];
  [v33 addSubview:self->_closeButtonView];

  v34 = [MEMORY[0x1E4F427E0] buttonWithType:0];
  closeButton = self->_closeButton;
  self->_closeButton = v34;

  [(UIVisualEffectView *)self->_closeButtonView setAccessibilityIdentifier:@"LookAroundCloseButton"];
  [(UIButton *)self->_closeButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->_closeButton addTarget:self action:sel__didTapCloseButton_ forControlEvents:64];
  v36 = [MEMORY[0x1E4F428B8] labelColor];
  [(UIButton *)self->_closeButton setTintColor:v36];

  v37 = [(UIVisualEffectView *)self->_closeButtonView contentView];
  [v37 addSubview:self->_closeButton];

  id v38 = objc_alloc(MEMORY[0x1E4F43028]);
  v39 = [MEMORY[0x1E4F427D8] effectWithStyle:17];
  v40 = (UIVisualEffectView *)[v38 initWithEffect:v39];
  badgeView = self->_badgeView;
  self->_badgeView = v40;

  [(UIVisualEffectView *)self->_badgeView setAccessibilityIdentifier:@"LookAroundBadgeView"];
  [(UIVisualEffectView *)self->_badgeView setTranslatesAutoresizingMaskIntoConstraints:0];
  v42 = [MEMORY[0x1E4F428B8] clearColor];
  [(UIVisualEffectView *)self->_badgeView setBackgroundColor:v42];

  [(UIVisualEffectView *)self->_badgeView _setContinuousCornerRadius:6.0];
  v43 = [(UIVisualEffectView *)self->_badgeView contentView];
  LODWORD(v44) = 1041865114;
  -[MKLookAroundViewController applyShadowToView:withRadius:offset:opacity:](self, "applyShadowToView:withRadius:offset:opacity:", v43, 5.0, v30, v31, v44);

  v45 = [(MKLookAroundView *)self->_lookAroundView overlayView];
  [v45 addSubview:self->_badgeView];

  v46 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v6, v7, v8, v9);
  badgeLabel = self->_badgeLabel;
  self->_badgeLabel = v46;

  [(UIVisualEffectView *)self->_badgeView setAccessibilityIdentifier:@"LookAroundBadgeLabel"];
  [(UILabel *)self->_badgeLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v48 = [MEMORY[0x1E4F428B8] whiteColor];
  [(UILabel *)self->_badgeLabel setTextColor:v48];

  LODWORD(v49) = 1148846080;
  [(UILabel *)self->_badgeLabel setContentCompressionResistancePriority:0 forAxis:v49];
  [(UILabel *)self->_badgeLabel setNumberOfLines:1];
  [(UILabel *)self->_badgeLabel setTextAlignment:1];
  v50 = [(UIVisualEffectView *)self->_badgeView contentView];
  [v50 addSubview:self->_badgeLabel];

  v51 = [[MKAppleLogoImageView alloc] initForMapType:107 forDarkMode:1];
  appleLogoImageView = self->_appleLogoImageView;
  self->_appleLogoImageView = v51;

  [(UIImageView *)self->_appleLogoImageView setAccessibilityIdentifier:@"LookAroundAppleLogo"];
  [(UIImageView *)self->_appleLogoImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  v53 = [(MKLookAroundView *)self->_lookAroundView overlayView];
  [v53 addSubview:self->_appleLogoImageView];

  v54 = (UIStackView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42E20]), "initWithFrame:", v6, v7, v8, v9);
  infoStackView = self->_infoStackView;
  self->_infoStackView = v54;

  [(UIStackView *)self->_infoStackView setAccessibilityIdentifier:@"LookAroundInfoStackView"];
  [(UIStackView *)self->_infoStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_infoStackView setAxis:1];
  [(UIStackView *)self->_infoStackView setDistribution:0];
  [(UIStackView *)self->_infoStackView setAlignment:1];
  [(UIStackView *)self->_infoStackView setSpacing:6.0];
  v56 = [(MKLookAroundView *)self->_lookAroundView overlayView];
  [v56 addSubview:self->_infoStackView];

  v57 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v6, v7, v8, v9);
  locationLabel = self->_locationLabel;
  self->_locationLabel = v57;

  [(UILabel *)self->_locationLabel setAccessibilityIdentifier:@"LookAroundLocationLabel"];
  v59 = [MEMORY[0x1E4F428B8] whiteColor];
  [(UILabel *)self->_locationLabel setTextColor:v59];

  [(UILabel *)self->_locationLabel setNumberOfLines:0];
  LODWORD(v60) = 1034147594;
  -[MKLookAroundViewController applyShadowToView:withRadius:offset:opacity:](self, "applyShadowToView:withRadius:offset:opacity:", self->_locationLabel, 4.0, 0.0, 1.0, v60);
  [(UIStackView *)self->_infoStackView addArrangedSubview:self->_locationLabel];
  v61 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v6, v7, v8, v9);
  localityLabel = self->_localityLabel;
  self->_localityLabel = v61;

  [(UILabel *)self->_localityLabel setAccessibilityIdentifier:@"LookAroundLocalityLabel"];
  v63 = [MEMORY[0x1E4F428B8] whiteColor];
  [(UILabel *)self->_localityLabel setTextColor:v63];

  [(UILabel *)self->_localityLabel setNumberOfLines:0];
  LODWORD(v64) = 1034147594;
  -[MKLookAroundViewController applyShadowToView:withRadius:offset:opacity:](self, "applyShadowToView:withRadius:offset:opacity:", self->_localityLabel, 4.0, 0.0, 1.0, v64);
  [(UIStackView *)self->_infoStackView addArrangedSubview:self->_localityLabel];
  v65 = (UIStackView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42E20]), "initWithFrame:", v6, v7, v8, v9);
  tertiaryLineStackView = self->_tertiaryLineStackView;
  self->_tertiaryLineStackView = v65;

  [(UIStackView *)self->_tertiaryLineStackView setAccessibilityIdentifier:@"LookAroundTertiaryLineStackView"];
  [(UIStackView *)self->_tertiaryLineStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_tertiaryLineStackView setAxis:0];
  [(UIStackView *)self->_tertiaryLineStackView setDistribution:0];
  [(UIStackView *)self->_tertiaryLineStackView setAlignment:5];
  [(UIStackView *)self->_tertiaryLineStackView setSpacing:0.0];
  [(UIStackView *)self->_infoStackView addArrangedSubview:self->_tertiaryLineStackView];
  v67 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v6, v7, v8, v9);
  imageryCollectionDateLabel = self->_imageryCollectionDateLabel;
  self->_imageryCollectionDateLabel = v67;

  [(UILabel *)self->_imageryCollectionDateLabel setAccessibilityIdentifier:@"LookAroundImageryDateLabel"];
  [(UILabel *)self->_imageryCollectionDateLabel setNumberOfLines:0];
  LODWORD(v69) = 1034147594;
  -[MKLookAroundViewController applyShadowToView:withRadius:offset:opacity:](self, "applyShadowToView:withRadius:offset:opacity:", self->_imageryCollectionDateLabel, 4.0, 0.0, 1.0, v69);
  [(UIStackView *)self->_tertiaryLineStackView addArrangedSubview:self->_imageryCollectionDateLabel];
  v70 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v6, v7, v8, v9);
  v71 = [v70 widthAnchor];
  v72 = [v71 constraintEqualToConstant:9.22337204e18];

  LODWORD(v73) = 1132068864;
  [v72 setPriority:v73];
  [v72 setActive:1];
  [(UIStackView *)self->_tertiaryLineStackView addArrangedSubview:v70];
  v74 = [MEMORY[0x1E4F427E0] buttonWithType:0];
  attributionButton = self->_attributionButton;
  self->_attributionButton = v74;

  [(UIButton *)self->_attributionButton setAccessibilityIdentifier:@"LookAroundAttributionButton"];
  -[UIButton _setTouchInsets:](self->_attributionButton, "_setTouchInsets:", -9.0, -9.0, -9.0, -9.0);
  [(UIButton *)self->_attributionButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->_attributionButton addTarget:self action:sel__didTapAttributionButton_ forControlEvents:64];
  [(UIStackView *)self->_tertiaryLineStackView addArrangedSubview:self->_attributionButton];
  v76 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v76 addObserver:self selector:sel__contentSizeDidChange name:*MEMORY[0x1E4F43788] object:0];

  v77 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__didSelectView_];
  selectGestureRecognizer = self->_selectGestureRecognizer;
  self->_selectGestureRecognizer = v77;

  [(MKLookAroundView *)self->_lookAroundView addGestureRecognizer:self->_selectGestureRecognizer];
  objc_initWeak(&location, self);
  v79 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v80 = self->_lookAroundView;
  v85[0] = MEMORY[0x1E4F143A8];
  v85[1] = 3221225472;
  v85[2] = __44__MKLookAroundViewController__setupSubviews__block_invoke;
  v85[3] = &unk_1E54BB7D8;
  objc_copyWeak(&v86, &location);
  v81 = [v79 addObserverForName:@"MKLookAroundViewDidBecomeFullyDrawn" object:v80 queue:0 usingBlock:v85];
  didBecomeFullyDrawnObserver = self->_didBecomeFullyDrawnObserver;
  self->_didBecomeFullyDrawnObserver = v81;

  objc_destroyWeak(&v86);
  objc_destroyWeak(&location);
}

void __44__MKLookAroundViewController__setupSubviews__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = (void *)MEMORY[0x1E4F14428];
  id v5 = MEMORY[0x1E4F14428];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  id v12 = __44__MKLookAroundViewController__setupSubviews__block_invoke_2;
  uint64_t v13 = &unk_1E54B8CB0;
  objc_copyWeak(&v14, (id *)(a1 + 32));
  id v6 = v4;
  double v7 = (void *)MEMORY[0x1E4F29060];
  double v8 = v11;
  if ([v7 isMainThread])
  {
    v12((uint64_t)v8);
  }
  else
  {
    double v9 = (void *)MEMORY[0x1E4F14428];
    dispatch_async(MEMORY[0x1E4F14428], v8);

    double v8 = v9;
  }

  int v10 = (void *)MEMORY[0x1E4F14428];
  objc_destroyWeak(&v14);
}

void __44__MKLookAroundViewController__setupSubviews__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained setDidBecomeFullyDrawn:1];
    id WeakRetained = v2;
  }
}

- (BOOL)_shouldRestrictLookAroundViewOptionsForPreview
{
  return self->_presentationType == 0;
}

- (id)_transitionController
{
  transitionController = self->_transitionController;
  if (!transitionController)
  {
    BOOL v4 = objc_alloc_init(MKLookAroundTransitionController);
    id v5 = self->_transitionController;
    self->_transitionController = v4;

    transitionController = self->_transitionController;
  }

  return transitionController;
}

- (void)_transitionFromFullScreenAnimated:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (![(MKLookAroundViewController *)self _isDescendantOfRootViewController])
  {
    double v7 = MKGetMKLookAroundLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = self;
      _os_log_impl(&dword_18BAEC000, v7, OS_LOG_TYPE_ERROR, "*** Warning: %@ is trying to exit full screen, but is not in its view's window's view controller hierarchy. This results in undefined behavior.", buf, 0xCu);
    }
  }
  if (([(MKLookAroundViewController *)self _isPresentingFullScreen]
     || [(MKLookAroundViewController *)self _isPresentedFullScreen])
    && ![(MKLookAroundViewController *)self _isTransitioningToOrFromFullScreen])
  {
    uint64_t v13 = [(MKLookAroundViewController *)self _fullScreenViewControllerIfLoaded];
    id v14 = [v13 presentingViewController];
    if (v14)
    {
      uint64_t v15 = [(MKLookAroundViewController *)self _fullScreenViewControllerIfLoaded];
    }
    else
    {
      uint64_t v15 = self;
    }
    int v10 = v15;

    id v20 = [(MKLookAroundViewController *)self _transitionController];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __82__MKLookAroundViewController__transitionFromFullScreenAnimated_completionHandler___block_invoke;
    v23[3] = &unk_1E54BAFC0;
    v23[4] = self;
    id v24 = v6;
    [v20 beginFullScreenDismissalOfViewController:v10 animated:v4 completion:v23];

    goto LABEL_19;
  }
  double v8 = [(MKLookAroundViewController *)self presentingViewController];
  if (v8
    && ![(MKLookAroundViewController *)self _isTransitioningToOrFromFullScreen])
  {
    v16 = [(MKLookAroundViewController *)self presentingViewController];
    char v17 = [v16 presentedViewController];
    char v18 = [v17 isBeingDismissed];

    if ((v18 & 1) == 0)
    {
      double v19 = [(MKLookAroundViewController *)self presentingViewController];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __82__MKLookAroundViewController__transitionFromFullScreenAnimated_completionHandler___block_invoke_2;
      v21[3] = &unk_1E54B82E8;
      id v22 = v6;
      [v19 dismissViewControllerAnimated:v4 completion:v21];

      int v10 = v22;
      goto LABEL_19;
    }
  }
  else
  {
  }
  if (v6)
  {
    double v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F28568];
    int v10 = [NSString stringWithFormat:@"Invalid method call"];
    v26 = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    id v12 = [v9 errorWithDomain:@"MKErrorDomain" code:1 userInfo:v11];
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v12);

LABEL_19:
  }
}

void __82__MKLookAroundViewController__transitionFromFullScreenAnimated_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, uint64_t, void))(v3 + 16))(v3, a2, 0);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 976);
  *(void *)(v4 + 976) = 0;
}

uint64_t __82__MKLookAroundViewController__transitionFromFullScreenAnimated_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

- (void)_transitionToFullScreenAnimated:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (![(MKLookAroundViewController *)self _isDescendantOfRootViewController])
  {
    double v7 = MKGetMKLookAroundLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      double v19 = self;
      _os_log_impl(&dword_18BAEC000, v7, OS_LOG_TYPE_ERROR, "*** Warning: %@ is trying to enter full screen, but is not in its view's window's view controller hierarchy. This results in undefined behavior.", buf, 0xCu);
    }
  }
  if (![(MKLookAroundViewController *)self _isPresentingFullScreen]
    && ![(MKLookAroundViewController *)self _isPresentedFullScreen]
    && ![(MKLookAroundViewController *)self _isTransitioningToOrFromFullScreen])
  {
    double v9 = [(MKLookAroundViewController *)self _fullScreenViewController];
    id v12 = [(MKLookAroundViewController *)self _transitionController];
    lookAroundView = self->_lookAroundView;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __80__MKLookAroundViewController__transitionToFullScreenAnimated_completionHandler___block_invoke;
    v14[3] = &unk_1E54B89C0;
    id v15 = v6;
    [v12 beginFullScreenPresentationOfViewController:v9 fromView:lookAroundView animated:v4 completion:v14];

    int v10 = v15;
    goto LABEL_10;
  }
  if (v6)
  {
    double v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28568];
    double v9 = [NSString stringWithFormat:@"Invalid method call"];
    char v17 = v9;
    int v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    uint64_t v11 = [v8 errorWithDomain:@"MKErrorDomain" code:1 userInfo:v10];
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v11);

LABEL_10:
  }
}

uint64_t __80__MKLookAroundViewController__transitionToFullScreenAnimated_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

- (void)_updateCloseButtonIfNeeded
{
  uint64_t v3 = (void *)MEMORY[0x1E4F42A98];
  BOOL v4 = [(MKLookAroundViewController *)self buttonFont];
  id v11 = [v3 configurationWithFont:v4];

  id v5 = [MEMORY[0x1E4F42A80] systemImageNamed:@"xmark" withConfiguration:v11];
  id v6 = [MEMORY[0x1E4F428B8] labelColor];
  double v7 = [v5 imageWithTintColor:v6];

  [(UIButton *)self->_closeButton setImage:v7 forState:0];
  [(UIVisualEffectView *)self->_closeButtonView bounds];
  [(UIVisualEffectView *)self->_closeButtonView _setContinuousCornerRadius:CGRectGetHeight(v13) * 0.5];
  unint64_t presentationType = self->_presentationType;
  if (presentationType)
  {
    if (presentationType != 1) {
      goto LABEL_6;
    }
    uint64_t v9 = 0;
    double v10 = 1.0;
  }
  else
  {
    uint64_t v9 = 1;
    double v10 = 0.0;
  }
  [(UIVisualEffectView *)self->_closeButtonView setAlpha:v10];
  [(UIVisualEffectView *)self->_closeButtonView setHidden:v9];
LABEL_6:
}

- (void)_updateGradientIfNeeded
{
  unint64_t presentationType = self->_presentationType;
  if (presentationType)
  {
    if (presentationType != 1) {
      return;
    }
    uint64_t v3 = &unk_1ED97F3F8;
  }
  else
  {
    uint64_t v3 = &unk_1ED97F3E0;
  }
  [(_MKGradientView *)self->_gradientView setLocations:v3];
}

- (void)_updateBadgeViewIfNeeded
{
  v59[2] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = 0x1E4F28000uLL;
  BOOL v4 = (void *)MEMORY[0x1E4F28DC8];
  badgeViewVerticalConstraint = self->_badgeViewVerticalConstraint;
  v59[0] = self->_badgeViewHorizontalConstraint;
  v59[1] = badgeViewVerticalConstraint;
  unint64_t v6 = 0x1E4F1C000uLL;
  double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];
  [v4 deactivateConstraints:v7];

  int64_t badgePosition = self->_badgePosition;
  if (badgePosition == 2)
  {
    id v21 = [(UIVisualEffectView *)self->_badgeView bottomAnchor];
    id v22 = [(MKLookAroundView *)self->_lookAroundView overlayView];
    v23 = [v22 safeAreaLayoutGuide];
    id v24 = [v23 bottomAnchor];
    uint64_t v25 = [v21 constraintEqualToAnchor:v24 constant:-12.0];
    v26 = self->_badgeViewVerticalConstraint;
    self->_badgeViewVerticalConstraint = v25;

    unint64_t v3 = 0x1E4F28000;
    v27 = [(UIVisualEffectView *)self->_badgeView trailingAnchor];
    unint64_t v6 = 0x1E4F1C000;
    v28 = [(MKLookAroundView *)self->_lookAroundView overlayView];
    uint64_t v29 = [v28 safeAreaLayoutGuide];
    double v30 = [v29 trailingAnchor];
    double v31 = [v27 constraintEqualToAnchor:v30 constant:-10.0];
    badgeViewHorizontalConstraint = self->_badgeViewHorizontalConstraint;
    self->_badgeViewHorizontalConstraint = v31;

    id v15 = [(UIImageView *)self->_appleLogoImageView image];
    [v15 size];
    double v9 = v33 + 8.0;
  }
  else if (badgePosition == 1)
  {
    v34 = [(UIVisualEffectView *)self->_badgeView topAnchor];
    id v35 = [(MKLookAroundView *)self->_lookAroundView overlayView];
    v36 = [v35 topAnchor];
    v37 = [v34 constraintEqualToAnchor:v36 constant:14.0];
    id v38 = self->_badgeViewVerticalConstraint;
    self->_badgeViewVerticalConstraint = v37;

    id v15 = [(UIVisualEffectView *)self->_badgeView trailingAnchor];
    v39 = [(MKLookAroundView *)self->_lookAroundView overlayView];
    v40 = [v39 safeAreaLayoutGuide];
    v41 = [v40 trailingAnchor];
    v42 = [v15 constraintEqualToAnchor:v41 constant:-14.0];
    v43 = self->_badgeViewHorizontalConstraint;
    self->_badgeViewHorizontalConstraint = v42;

    double v9 = 0.0;
  }
  else
  {
    double v9 = 0.0;
    if (badgePosition) {
      goto LABEL_8;
    }
    double v10 = [(UIVisualEffectView *)self->_badgeView topAnchor];
    id v11 = [(MKLookAroundView *)self->_lookAroundView overlayView];
    id v12 = [v11 topAnchor];
    CGRect v13 = [v10 constraintEqualToAnchor:v12 constant:14.0];
    id v14 = self->_badgeViewVerticalConstraint;
    self->_badgeViewVerticalConstraint = v13;

    id v15 = [(UIVisualEffectView *)self->_badgeView leadingAnchor];
    uint64_t v16 = [(MKLookAroundView *)self->_lookAroundView overlayView];
    char v17 = [v16 safeAreaLayoutGuide];
    char v18 = [v17 leadingAnchor];
    double v19 = [v15 constraintEqualToAnchor:v18 constant:14.0];
    uint64_t v20 = self->_badgeViewHorizontalConstraint;
    self->_badgeViewHorizontalConstraint = v19;
  }
LABEL_8:
  double v44 = *(void **)(v3 + 3528);
  v45 = self->_badgeViewVerticalConstraint;
  v58[0] = self->_badgeViewHorizontalConstraint;
  v58[1] = v45;
  v46 = [*(id *)(v6 + 2424) arrayWithObjects:v58 count:2];
  [v44 activateConstraints:v46];

  uint64_t v47 = [(MKLookAroundView *)self->_lookAroundView overlayView];
  [v47 bounds];
  double v49 = v48;

  double v50 = 0.0;
  if (v49 + -28.0 > v9) {
    double v50 = v9;
  }
  double v51 = v49 + -28.0 - v50;
  v52 = [(MKLookAroundViewController *)self badgeLabelTitle];
  [v52 size];
  if (v53 + 14.0 > v51)
  {
    uint64_t v54 = [(MKLookAroundViewController *)self badgeLabelGlyph];

    v52 = (void *)v54;
  }
  [(UILabel *)self->_badgeLabel setAttributedText:v52];
  unint64_t presentationType = self->_presentationType;
  if (!presentationType)
  {
    uint64_t v56 = 0;
    double v57 = 1.0;
    goto LABEL_16;
  }
  if (presentationType == 1)
  {
    uint64_t v56 = 1;
    double v57 = 0.0;
LABEL_16:
    [(UIVisualEffectView *)self->_badgeView setAlpha:v57];
    [(UIVisualEffectView *)self->_badgeView setHidden:v56];
  }
}

- (void)_updateLookAroundViewIfNeeded
{
  if (self->_needsLookAroundViewUpdate && self->_lookAroundView)
  {
    BOOL v3 = [(MKLookAroundViewController *)self _shouldRestrictLookAroundViewOptionsForPreview];
    [(MKLookAroundView *)self->_lookAroundView setCompassHidden:v3];
    BOOL IsMacCatalyst = MapKitIdiomIsMacCatalyst();
    uint64_t v5 = 17;
    if (IsMacCatalyst) {
      uint64_t v5 = 16;
    }
    [*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MKLookAroundViewController__initialScene[v5]) bounds];
    CGFloat Height = CGRectGetHeight(v11);
    -[MKLookAroundView setCompassInsets:](self->_lookAroundView, "setCompassInsets:", Height + 24.0, 16.0, Height + 24.0, 16.0);
    if (v3)
    {
      [(MKLookAroundView *)self->_lookAroundView setNavigatingEnabled:0];
      [(MKLookAroundView *)self->_lookAroundView setPanningEnabled:0];
      [(MKLookAroundView *)self->_lookAroundView setZoomingEnabled:0];
      double v7 = +[MKPointOfInterestFilter filterExcludingAllCategories];
      [(MKLookAroundView *)self->_lookAroundView setPointOfInterestFilter:v7];

      BOOL showsRoadLabels = 0;
    }
    else
    {
      [(MKLookAroundView *)self->_lookAroundView setNavigatingEnabled:self->_navigationEnabled];
      [(MKLookAroundView *)self->_lookAroundView setPanningEnabled:1];
      [(MKLookAroundView *)self->_lookAroundView setZoomingEnabled:1];
      [(MKLookAroundView *)self->_lookAroundView setPointOfInterestFilter:self->_pointOfInterestFilter];
      BOOL showsRoadLabels = self->_showsRoadLabels;
    }
    lookAroundView = self->_lookAroundView;
    [(MKLookAroundView *)lookAroundView setShowsRoadLabels:showsRoadLabels];
  }
}

- (void)_updateSceneIfNeeded
{
  if (self->_needsSceneUpdate)
  {
    lookAroundView = self->_lookAroundView;
    if (lookAroundView)
    {
      if (self->_scene)
      {
        [(MKLookAroundViewController *)self setDidBecomeFullyDrawn:0];
        unint64_t v4 = [(MKLookAroundScene *)self->_scene _type];
        if (v4)
        {
          if (v4 != 1)
          {
            lookAroundView = self->_lookAroundView;
            goto LABEL_11;
          }
          uint64_t v5 = [(MKLookAroundScene *)self->_scene _muninViewState];
          unint64_t v6 = +[MKLookAroundEntryPoint entryPointWithMuninViewState:v5];
        }
        else
        {
          uint64_t v5 = [(MKLookAroundScene *)self->_scene _mapItem];
          BOOL v7 = [(MKLookAroundScene *)self->_scene _wantsCloseUpView];
          double v8 = [(MKLookAroundScene *)self->_scene _cameraFrameOverride];
          unint64_t v6 = +[MKLookAroundEntryPoint entryPointWithMapItem:v5 wantsCloseUpView:v7 cameraFrameOverride:v8];
        }
        lookAroundView = self->_lookAroundView;
        if (v6)
        {
          [(MKLookAroundView *)lookAroundView enterLookAroundWithEntryPoint:v6];

LABEL_12:
          self->_needsSceneUpdate = 0;
          return;
        }
      }
LABEL_11:
      [(MKLookAroundView *)lookAroundView reset];
      goto LABEL_12;
    }
  }
}

- (void)_updateStackViewIfNeeded
{
  BOOL v3 = [(MKLookAroundViewController *)self labelFont];
  [(UILabel *)self->_locationLabel setFont:v3];

  unint64_t v4 = [(MKLookAroundViewController *)self secondaryLabelFont];
  [(UILabel *)self->_localityLabel setFont:v4];

  uint64_t v5 = [(UILabel *)self->_imageryCollectionDateLabel attributedText];
  id v19 = (id)[v5 mutableCopy];

  uint64_t v6 = *MEMORY[0x1E4F42508];
  BOOL v7 = [(MKLookAroundViewController *)self tertiaryLabelFont];
  objc_msgSend(v19, "addAttribute:value:range:", v6, v7, 0, objc_msgSend(v19, "length"));

  double v8 = (void *)[v19 copy];
  [(UILabel *)self->_imageryCollectionDateLabel setAttributedText:v8];

  double v9 = [(UIButton *)self->_attributionButton attributedTitleForState:0];
  double v10 = (void *)[v9 mutableCopy];

  CGRect v11 = [(MKLookAroundViewController *)self attributionButtonFont];
  objc_msgSend(v10, "addAttribute:value:range:", v6, v11, 0, objc_msgSend(v10, "length"));

  attributionButton = self->_attributionButton;
  CGRect v13 = (void *)[v10 copy];
  [(UIButton *)attributionButton setAttributedTitle:v13 forState:0];

  unint64_t presentationType = self->_presentationType;
  if (presentationType)
  {
    if (presentationType != 1) {
      goto LABEL_6;
    }
    uint64_t v15 = 0;
    double v16 = 1.0;
    uint64_t v17 = 1;
    double v18 = 0.0;
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v15 = 1;
    double v16 = 0.0;
    double v18 = 1.0;
  }
  [(UIImageView *)self->_appleLogoImageView setAlpha:v18];
  [(UIImageView *)self->_appleLogoImageView setHidden:v17];
  [(UIStackView *)self->_infoStackView setAlpha:v16];
  [(UIStackView *)self->_infoStackView setHidden:v15];
LABEL_6:
}

- (id)_urlForMapAttribution
{
  id v2 = [(MKLookAroundView *)self->_lookAroundView lookAroundView];
  BOOL v3 = [v2 attributionsForCurrentRegion];

  unint64_t v4 = +[MKMapAttribution attributionUrlFromRegionalAttributions:v3];

  return v4;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (MKLookAroundScene)scene
{
  return self->_scene;
}

- (BOOL)isNavigationEnabled
{
  return self->_navigationEnabled;
}

- (BOOL)showsRoadLabels
{
  return self->_showsRoadLabels;
}

- (MKPointOfInterestFilter)pointOfInterestFilter
{
  return self->_pointOfInterestFilter;
}

- (MKLookAroundBadgePosition)badgePosition
{
  return self->_badgePosition;
}

- (BOOL)didBecomeFullyDrawn
{
  return self->_didBecomeFullyDrawn;
}

- (void)setDidBecomeFullyDrawn:(BOOL)a3
{
  self->_didBecomeFullyDrawn = a3;
}

- (BOOL)_isFullScreenCover
{
  return self->_fullScreenCover;
}

- (void)_setFullScreenCover:(BOOL)a3
{
  self->_fullScreenCover = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scene, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pointOfInterestFilter, 0);
  objc_storeStrong((id *)&self->_didBecomeFullyDrawnObserver, 0);
  objc_storeStrong((id *)&self->_selectGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_lookAroundView, 0);
  objc_storeStrong((id *)&self->_attributionButton, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_imageryCollectionDateLabel, 0);
  objc_storeStrong((id *)&self->_tertiaryLineStackView, 0);
  objc_storeStrong((id *)&self->_localityLabel, 0);
  objc_storeStrong((id *)&self->_locationLabel, 0);
  objc_storeStrong((id *)&self->_infoStackView, 0);
  objc_storeStrong((id *)&self->_appleLogoImageView, 0);
  objc_storeStrong((id *)&self->_badgeLabel, 0);
  objc_storeStrong((id *)&self->_badgeViewHorizontalConstraint, 0);
  objc_storeStrong((id *)&self->_badgeViewVerticalConstraint, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_closeButtonView, 0);
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_transitionController, 0);

  objc_storeStrong((id *)&self->_fullScreenViewController, 0);
}

@end