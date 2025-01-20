@interface _NTKCUltraCubePreviewViewController
+ (id)_KVOScrollViewKeys;
- (BOOL)_shouldPositionMaskLabel:(int64_t)a3;
- (BOOL)_timePositionRequiresCropValidation:(int64_t)a3;
- (BOOL)didInteractWithCropView;
- (NTKUltraCubeCropPreview)currentPreview;
- (NTKUltraCubePreviewProvider)previewProvider;
- (_NTKCUltraCubePreviewViewController)initWithPreviewProvider:(id)a3;
- (_NTKCUltraCubePreviewViewControllerDelegate)delegate;
- (id)_toolbarItemsShowingRevert:(BOOL)a3;
- (int64_t)_optionFromPosition:(int64_t)a3;
- (int64_t)_positionFromOption:(int64_t)a3;
- (unint64_t)initialPreviewState;
- (void)_cancelPressed;
- (void)_deletePressed;
- (void)_donePressed;
- (void)_hideLoadingLabel;
- (void)_hideLoadingSpinner;
- (void)_loadInitialCropPreview;
- (void)_revertPressed;
- (void)_setCropValidationState:(unint64_t)a3 animated:(BOOL)a4;
- (void)_setPreview:(id)a3 animated:(BOOL)a4;
- (void)_setupCenteredViewWithPhoto:(id)a3 maskedPhoto:(id)a4;
- (void)_showLoadingLabel;
- (void)_showLoadingSpinner;
- (void)_updateAllButtonStates;
- (void)_updateDeleteButtonEnabledState;
- (void)_updateDoneButtonEnabledState;
- (void)_validatePreview:(id)a3 withCrop:(CGRect)a4 animated:(BOOL)a5;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewDidSettleFromInteracting:(id)a3;
- (void)scrollViewWillBeginInteraction:(id)a3;
- (void)setCurrentPreview:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidInteractWithCropView:(BOOL)a3;
- (void)setInitialPreviewState:(unint64_t)a3;
- (void)setPreviewProvider:(id)a3;
- (void)ultracubeTimePlacementViewControllerDidUpdateSelectedOption:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation _NTKCUltraCubePreviewViewController

+ (id)_KVOScrollViewKeys
{
  return &off_4B488;
}

- (_NTKCUltraCubePreviewViewController)initWithPreviewProvider:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_NTKCUltraCubePreviewViewController;
  v6 = [(_NTKCUltraCubePreviewViewController *)&v15 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    v8 = [(_NTKCUltraCubePreviewViewController *)v6 navigationItem];
    [v8 setHidesBackButton:1];

    v7->_initialPreviewState = 0;
    objc_storeStrong((id *)&v7->_previewProvider, a3);
    v7->_cropValidationState = 0;
    v9 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:16 target:v7 action:"_deletePressed"];
    deleteButton = v7->_deleteButton;
    v7->_deleteButton = v9;

    -[UIBarButtonItem setEnabled:](v7->_deleteButton, "setEnabled:", objc_msgSend(v5, "ultracube_canDelete"));
    v11 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:v7 action:"_cancelPressed"];
    cancelButton = v7->_cancelButton;
    v7->_cancelButton = v11;

    v13 = NTKCCustomizationLocalizedString();
    [(_NTKCUltraCubePreviewViewController *)v7 setTitle:v13];
  }
  return v7;
}

- (void)dealloc
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = +[_NTKCUltraCubePreviewViewController _KVOScrollViewKeys];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [(NTKCCenteringScrollView *)self->_scrollView removeObserver:self forKeyPath:*(void *)(*((void *)&v9 + 1) + 8 * (void)v7) context:off_586A8];
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)_NTKCUltraCubePreviewViewController;
  [(_NTKCUltraCubePreviewViewController *)&v8 dealloc];
}

- (void)viewDidLoad
{
  v65.receiver = self;
  v65.super_class = (Class)_NTKCUltraCubePreviewViewController;
  [(_NTKCUltraCubePreviewViewController *)&v65 viewDidLoad];
  v3 = +[UIColor systemBackgroundColor];
  id v4 = [(_NTKCUltraCubePreviewViewController *)self view];
  [v4 setBackgroundColor:v3];

  id v5 = +[CAShapeLayer layer];
  reverseMask = self->_reverseMask;
  self->_reverseMask = v5;

  id v7 = +[UIColor colorWithWhite:0.2 alpha:1.0];
  -[CAShapeLayer setFillColor:](self->_reverseMask, "setFillColor:", [v7 CGColor]);

  objc_super v8 = [(_NTKCUltraCubePreviewViewController *)self view];
  long long v9 = [v8 layer];
  [v9 addSublayer:self->_reverseMask];

  long long v10 = [(_NTKCUltraCubePreviewViewController *)self view];
  [v10 bounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  v19 = (NTKCCenteringScrollView *)objc_msgSend(objc_alloc((Class)NTKCCenteringScrollView), "initWithFrame:", v12, v14, v16, v18);
  scrollView = self->_scrollView;
  self->_scrollView = v19;

  [(NTKCCenteringScrollView *)self->_scrollView setNtk_delegate:self];
  [(NTKCCenteringScrollView *)self->_scrollView setMinimumZoomScale:0.1];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v21 = +[_NTKCUltraCubePreviewViewController _KVOScrollViewKeys];
  id v22 = [v21 countByEnumeratingWithState:&v61 objects:v66 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v62;
    do
    {
      v25 = 0;
      do
      {
        if (*(void *)v62 != v24) {
          objc_enumerationMutation(v21);
        }
        [(NTKCCenteringScrollView *)self->_scrollView addObserver:self forKeyPath:*(void *)(*((void *)&v61 + 1) + 8 * (void)v25) options:0 context:off_586A8];
        v25 = (char *)v25 + 1;
      }
      while (v23 != v25);
      id v23 = [v21 countByEnumeratingWithState:&v61 objects:v66 count:16];
    }
    while (v23);
  }

  v26 = -[_NTKCUltraCubeOverlayScrollView initWithFrame:]([_NTKCUltraCubeOverlayScrollView alloc], "initWithFrame:", v12, v14, v16, v18);
  overlayScrollView = self->_overlayScrollView;
  self->_overlayScrollView = (NTKCCenteringScrollView *)v26;

  v28 = +[UIColor clearColor];
  [(NTKCCenteringScrollView *)self->_overlayScrollView setBackgroundColor:v28];

  [(NTKCCenteringScrollView *)self->_overlayScrollView setUserInteractionEnabled:0];
  if ([(NTKUltraCubePreviewProvider *)self->_previewProvider ultracube_canCrop])
  {
    [(NTKUltraCubePreviewProvider *)self->_previewProvider ultracube_minimumNormalizedCropSize];
    double v30 = 1.0 / v29;
    double v32 = 1.0 / v31;
    if (v30 >= v32) {
      double v30 = v32;
    }
    [(NTKCCenteringScrollView *)self->_scrollView setMaximumZoomRatio:v30];
    [(NTKCCenteringScrollView *)self->_scrollView maximumZoomRatio];
    -[NTKCCenteringScrollView setMaximumZoomRatio:](self->_overlayScrollView, "setMaximumZoomRatio:");
  }
  else
  {
    [(NTKCCenteringScrollView *)self->_scrollView setMaximumZoomRatio:1.0];
    [(NTKCCenteringScrollView *)self->_scrollView maximumZoomRatio];
    -[NTKCCenteringScrollView setMaximumZoomRatio:](self->_overlayScrollView, "setMaximumZoomRatio:");
    [(NTKCCenteringScrollView *)self->_scrollView setScrollEnabled:0];
    [(UIBarButtonItem *)self->_cancelButton setEnabled:0];
  }
  v33 = [(_NTKCUltraCubePreviewViewController *)self view];
  [v33 addSubview:self->_scrollView];

  v34 = [(_NTKCUltraCubePreviewViewController *)self _toolbarItemsShowingRevert:1];
  revertableToolbarItems = self->_revertableToolbarItems;
  self->_revertableToolbarItems = v34;

  v36 = [(_NTKCUltraCubePreviewViewController *)self _toolbarItemsShowingRevert:0];
  doneToolbarItems = self->_doneToolbarItems;
  self->_doneToolbarItems = v36;

  [(_NTKCUltraCubePreviewViewController *)self _loadInitialCropPreview];
  v38 = (UIView *)objc_opt_new();
  timeContainer = self->_timeContainer;
  self->_timeContainer = v38;

  [(UIView *)self->_timeContainer setUserInteractionEnabled:0];
  v40 = [(_NTKCUltraCubePreviewViewController *)self view];
  [v40 addSubview:self->_timeContainer];

  v41 = +[CLKDevice currentDevice];
  v42 = +[NTKDigitalTimeLabel labelWithOptions:0 forDevice:v41];
  time = self->_time;
  self->_time = v42;

  [(NTKDigitalTimeLabel *)self->_time setUsesLegibility:1];
  v44 = +[UIColor colorWithWhite:1.0 alpha:0.9];
  [(NTKDigitalTimeLabel *)self->_time setTextColor:v44];

  v45 = +[NTKDate faceDate];
  v46 = [(NTKDigitalTimeLabel *)self->_time timeFormatter];
  [v46 setOverrideDate:v45];

  [(NTKDigitalTimeLabel *)self->_time setHidden:1];
  [(UIView *)self->_timeContainer addSubview:self->_time];
  v47 = [(_NTKCUltraCubePreviewViewController *)self view];
  [v47 insertSubview:self->_overlayScrollView aboveSubview:self->_timeContainer];

  v48 = +[CAShapeLayer layer];
  mask = self->_mask;
  self->_mask = v48;

  [(CAShapeLayer *)self->_mask setFillRule:kCAFillRuleEvenOdd];
  id v50 = +[UIColor colorWithWhite:0.0 alpha:0.6];
  -[CAShapeLayer setFillColor:](self->_mask, "setFillColor:", [v50 CGColor]);

  v51 = [(_NTKCUltraCubePreviewViewController *)self view];
  v52 = [v51 layer];
  [v52 addSublayer:self->_mask];

  v53 = (UIView *)objc_opt_new();
  placementGuideContainer = self->_placementGuideContainer;
  self->_placementGuideContainer = v53;

  [(UIView *)self->_placementGuideContainer setAlpha:0.0];
  [(UIView *)self->_placementGuideContainer setUserInteractionEnabled:0];
  v55 = [(_NTKCUltraCubePreviewViewController *)self view];
  [v55 addSubview:self->_placementGuideContainer];

  v56 = (UILabel *)objc_opt_new();
  placementGuideLabel = self->_placementGuideLabel;
  self->_placementGuideLabel = v56;

  v58 = +[UIFont systemFontOfSize:16.0 weight:UIFontWeightRegular];
  [(UILabel *)self->_placementGuideLabel setFont:v58];

  [(UILabel *)self->_placementGuideLabel setTextAlignment:1];
  v59 = +[NTKUltraCubeFaceBundle localizedStringForKey:@"PLACEMENT_GUIDE_INVALID" comment:&stru_49630];
  [(UILabel *)self->_placementGuideLabel setText:v59];

  v60 = +[UIColor systemRedColor];
  [(UILabel *)self->_placementGuideLabel setTextColor:v60];

  [(UIView *)self->_placementGuideContainer addSubview:self->_placementGuideLabel];
}

- (void)viewDidLayoutSubviews
{
  v80.receiver = self;
  v80.super_class = (Class)_NTKCUltraCubePreviewViewController;
  [(_NTKCUltraCubePreviewViewController *)&v80 viewDidLayoutSubviews];
  v3 = [(_NTKCUltraCubePreviewViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = [(_NTKCUltraCubePreviewViewController *)self previewProvider];
  objc_msgSend(v12, "ultracube_screenBounds");
  CGFloat v74 = v14;
  CGFloat v75 = v13;
  CGFloat v72 = v16;
  CGFloat v73 = v15;

  double v17 = [(_NTKCUltraCubePreviewViewController *)self previewProvider];
  objc_msgSend(v17, "ultracube_screenCornerRadius");
  double v70 = v18;

  -[NTKCCenteringScrollView setFrame:](self->_scrollView, "setFrame:", v5, v7, v9, v11);
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  -[NTKCCenteringScrollView setContentInset:](self->_scrollView, "setContentInset:", UIEdgeInsetsZero.top, left, bottom, right);
  double v76 = v11;
  -[NTKCCenteringScrollView setFrame:](self->_overlayScrollView, "setFrame:", v5, v7, v9, v11);
  -[NTKCCenteringScrollView setContentInset:](self->_overlayScrollView, "setContentInset:", UIEdgeInsetsZero.top, left, bottom, right);
  double v22 = v7;
  double v69 = v7;
  UIRectCenteredIntegralRectScale();
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  [(NTKCCenteringScrollView *)self->_scrollView safeAreaInsets];
  double v32 = v31;
  [(NTKCCenteringScrollView *)self->_scrollView safeAreaInsets];
  CGFloat v34 = v32 - v33;
  ddouble y = v32 - v33;
  v81.origin.double x = v24;
  v81.origin.double y = v26;
  v81.size.double width = v28;
  v81.size.double height = v30;
  CGRect v82 = CGRectOffset(v81, 0.0, v34);
  double x = v82.origin.x;
  double y = v82.origin.y;
  double width = v82.size.width;
  double height = v82.size.height;
  -[CAShapeLayer setFrame:](self->_mask, "setFrame:", v5, v22, v9, v76);
  [(CAShapeLayer *)self->_mask bounds];
  v39 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:");
  v40 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, v70);
  [v39 appendPath:v40];

  id v41 = v39;
  -[CAShapeLayer setPath:](self->_mask, "setPath:", [v41 CGPath]);
  -[CAShapeLayer setFrame:](self->_reverseMask, "setFrame:", x, y, width, height);
  [(CAShapeLayer *)self->_reverseMask bounds];
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:");
  id v42 = objc_claimAutoreleasedReturnValue();
  -[CAShapeLayer setPath:](self->_reverseMask, "setPath:", [v42 CGPath]);

  v83.origin.double x = v75;
  v83.origin.double y = v74;
  v83.size.double width = v73;
  v83.size.double height = v72;
  double v43 = 272.0 / CGRectGetWidth(v83);
  v84.origin.double x = v75;
  v84.origin.double y = v74;
  v84.size.double width = v73;
  v84.size.double height = v72;
  double v44 = 340.0 / CGRectGetHeight(v84);
  if (v43 >= v44) {
    double v44 = v43;
  }
  self->_timeContainerScale = v44;
  timeContainer = self->_timeContainer;
  long long v46 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v79[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v79[1] = v46;
  v79[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [(UIView *)timeContainer setTransform:v79];
  UIRectCenteredIntegralRectScale();
  [(UIView *)self->_timeContainer setFrame:0];
  [(UIView *)self->_timeContainer frame];
  CGRect v86 = CGRectOffset(v85, 0.0, dy);
  -[UIView setFrame:](self->_timeContainer, "setFrame:", v86.origin.x, v86.origin.y, v86.size.width, v86.size.height);
  CGAffineTransformMakeScale(&v78, self->_timeContainerScale, self->_timeContainerScale);
  v47 = self->_timeContainer;
  CGAffineTransform v77 = v78;
  [(UIView *)v47 setTransform:&v77];
  -[NTKCCenteringScrollView setMinimumDisplaySize:withCropRectCushion:](self->_scrollView, "setMinimumDisplaySize:withCropRectCushion:", width, height, 1.075 + -1.0);
  overlayScrollView = self->_overlayScrollView;
  [(NTKCCenteringScrollView *)self->_scrollView minimumDisplaySize];
  -[NTKCCenteringScrollView setMinimumDisplaySize:withCropRectCushion:](overlayScrollView, "setMinimumDisplaySize:withCropRectCushion:");
  -[UIView setFrame:](self->_placementGuideContainer, "setFrame:", v5, v69, v9, v76);
  [(NTKCCenteringScrollView *)self->_scrollView safeAreaInsets];
  double v50 = y - v49;
  [(NTKCCenteringScrollView *)self->_scrollView safeAreaInsets];
  -[UILabel setFrame:](self->_placementGuideLabel, "setFrame:", 0.0, v51, v9, v50);
  [(NTKCompanionUltraCubeTimePlacementViewController *)self->_timePlacementViewController idealViewHeight];
  double v53 = v52;
  v87.origin.double x = v5;
  v87.origin.double y = v69;
  v87.size.double width = v9;
  v87.size.double height = v76;
  double v54 = CGRectGetWidth(v87);
  v55 = [(NTKCompanionUltraCubeTimePlacementViewController *)self->_timePlacementViewController view];
  [v55 bounds];
  v91.origin.double x = 0.0;
  v91.origin.double y = 0.0;
  v91.size.double width = v54;
  v91.size.double height = v53;
  BOOL v56 = CGRectEqualToRect(v88, v91);

  if (!v56)
  {
    v57 = [(NTKCompanionUltraCubeTimePlacementViewController *)self->_timePlacementViewController view];
    objc_msgSend(v57, "setBounds:", 0.0, 0.0, v54, v53);
  }
  v58 = [(_NTKCUltraCubePreviewViewController *)self view];
  [v58 safeAreaInsets];
  double v60 = v59;

  v89.origin.double x = v5;
  v89.origin.double y = v69;
  v89.size.double width = v9;
  v89.size.double height = v76;
  double v61 = CGRectGetWidth(v89) * 0.5;
  v90.origin.double x = v5;
  v90.origin.double y = v69;
  v90.size.double width = v9;
  v90.size.double height = v76;
  double v62 = CGRectGetMaxY(v90) - v53 * 0.5 - v60 + -16.0;
  long long v63 = [(NTKCompanionUltraCubeTimePlacementViewController *)self->_timePlacementViewController view];
  [v63 center];
  double v65 = v64;
  double v67 = v66;

  if (v65 != v61 || v67 != v62)
  {
    v68 = [(NTKCompanionUltraCubeTimePlacementViewController *)self->_timePlacementViewController view];
    objc_msgSend(v68, "setCenter:", v61, v62);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_NTKCUltraCubePreviewViewController;
  [(_NTKCUltraCubePreviewViewController *)&v5 viewDidDisappear:a3];
  double v4 = [(_NTKCUltraCubePreviewViewController *)self delegate];
  [v4 _ultracubePreviewViewControllerDidDismiss:self];
}

- (void)_loadInitialCropPreview
{
  [(_NTKCUltraCubePreviewViewController *)self setInitialPreviewState:1];
  objc_initWeak(&location, self);
  previewProvider = self->_previewProvider;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_4CFC;
  v4[3] = &unk_48C40;
  objc_copyWeak(&v5, &location);
  [(NTKUltraCubePreviewProvider *)previewProvider ultracube_getPreviewWithCompletion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)setInitialPreviewState:(unint64_t)a3
{
  self->_initialPreviewState = a3;
  switch(a3)
  {
    case 3uLL:
      [(_NTKCUltraCubePreviewViewController *)self _hideLoadingSpinner];
      [(_NTKCUltraCubePreviewViewController *)self _hideLoadingLabel];
      break;
    case 2uLL:
      [(_NTKCUltraCubePreviewViewController *)self _hideLoadingSpinner];
      id v4 = +[NTKUltraCubeFaceBundle localizedStringForKey:@"LOADING_IMAGE_ERROR_MESSAGE" comment:@"Something went wrong."];
      [(UILabel *)self->_loadingLabel setText:v4];

      break;
    case 1uLL:
      [(_NTKCUltraCubePreviewViewController *)self setToolbarItems:self->_doneToolbarItems animated:0];
      [(UIBarButtonItem *)self->_doneButton setEnabled:0];
      [(UIBarButtonItem *)self->_deleteButton setEnabled:0];
      [(_NTKCUltraCubePreviewViewController *)self _showLoadingLabel];
      [(_NTKCUltraCubePreviewViewController *)self _showLoadingSpinner];
      break;
  }
}

- (void)_showLoadingSpinner
{
  if (!self->_loadingSpinner)
  {
    v3 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    loadingSpinner = self->_loadingSpinner;
    self->_loadingSpinner = v3;

    [(UIActivityIndicatorView *)self->_loadingSpinner startAnimating];
  }
  id v6 = [objc_alloc((Class)UIBarButtonItem) initWithCustomView:self->_loadingSpinner];
  id v5 = [(_NTKCUltraCubePreviewViewController *)self navigationItem];
  [v5 setRightBarButtonItem:v6];
}

- (void)_hideLoadingSpinner
{
  v3 = [(_NTKCUltraCubePreviewViewController *)self navigationItem];
  [v3 setRightBarButtonItem:0];

  [(UIActivityIndicatorView *)self->_loadingSpinner stopAnimating];
  loadingSpinner = self->_loadingSpinner;
  self->_loadingSpinner = 0;
}

- (void)_showLoadingLabel
{
  if (!self->_loadingLabel)
  {
    v3 = [(_NTKCUltraCubePreviewViewController *)self view];
    [v3 bounds];
    UIRectCenteredIntegralRectScale();
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;

    double v12 = [(_NTKCUltraCubePreviewViewController *)self navigationController];
    double v13 = [v12 view];
    [v13 safeAreaInsets];
    double v15 = v14;
    double v16 = [(_NTKCUltraCubePreviewViewController *)self navigationController];
    double v17 = [v16 view];
    [v17 safeAreaInsets];
    CGFloat v19 = v15 - v18;

    v27.origin.double x = v5;
    v27.origin.double y = v7;
    v27.size.double width = v9;
    v27.size.double height = v11;
    CGRect v28 = CGRectOffset(v27, 0.0, v19);
    v20 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", v28.origin.x, v28.origin.y, v28.size.width, v28.size.height);
    loadingLabel = self->_loadingLabel;
    self->_loadingLabel = v20;

    +[UIFont labelFontSize];
    double v22 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
    [(UILabel *)self->_loadingLabel setFont:v22];

    double v23 = +[NTKUltraCubeFaceBundle localizedStringForKey:@"LOADING_IMAGE_MESSAGE" comment:@"Loading Image..."];
    [(UILabel *)self->_loadingLabel setText:v23];

    [(UILabel *)self->_loadingLabel setTextAlignment:1];
    CGFloat v24 = +[UIColor placeholderTextColor];
    [(UILabel *)self->_loadingLabel setTextColor:v24];

    id v25 = [(_NTKCUltraCubePreviewViewController *)self view];
    [v25 addSubview:self->_loadingLabel];
  }
}

- (void)_hideLoadingLabel
{
  [(UILabel *)self->_loadingLabel removeFromSuperview];
  loadingLabel = self->_loadingLabel;
  self->_loadingLabel = 0;
}

- (void)_setupCenteredViewWithPhoto:(id)a3 maskedPhoto:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  CGFloat v7 = [(NTKCCenteringScrollView *)self->_scrollView centeredView];

  if (!v7)
  {
    id v8 = [objc_alloc((Class)UIImageView) initWithImage:v18];
    [(NTKCCenteringScrollView *)self->_scrollView setCenteredView:v8];

    [(NTKCCenteringScrollView *)self->_overlayScrollView setHidden:v6 == 0];
    if (v6)
    {
      id v9 = [objc_alloc((Class)UIImageView) initWithImage:v6];
      [(NTKCCenteringScrollView *)self->_overlayScrollView setCenteredView:v9];

      double v10 = &off_4B4A0;
    }
    else
    {
      double v10 = &off_4B4B8;
    }
    CGFloat v11 = [[NTKCompanionUltraCubeTimePlacementViewController alloc] initWithOptions:v10];
    double v12 = BPSBridgeTintColor();
    double v13 = [(NTKCompanionUltraCubeTimePlacementViewController *)v11 view];
    [v13 setTintColor:v12];

    [(NTKCompanionUltraCubeTimePlacementViewController *)v11 setDelegate:self];
    [(_NTKCUltraCubePreviewViewController *)self addChildViewController:v11];
    double v14 = [(_NTKCUltraCubePreviewViewController *)self view];
    double v15 = [(NTKCompanionUltraCubeTimePlacementViewController *)v11 view];
    [v14 addSubview:v15];

    [(NTKCompanionUltraCubeTimePlacementViewController *)v11 didMoveToParentViewController:self];
    timePlacementViewController = self->_timePlacementViewController;
    self->_timePlacementViewController = v11;

    double v17 = [(_NTKCUltraCubePreviewViewController *)self view];
    [v17 setNeedsLayout];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_586A8 == a6)
  {
    if (objc_msgSend(a3, "isEqualToString:", @"bounds", a4, a5))
    {
      [(NTKCCenteringScrollView *)self->_scrollView zoomScale];
      -[NTKCCenteringScrollView setZoomScale:animated:](self->_overlayScrollView, "setZoomScale:animated:", 0);
      [(NTKCCenteringScrollView *)self->_scrollView contentInset];
      -[NTKCCenteringScrollView setContentInset:](self->_overlayScrollView, "setContentInset:");
      [(NTKCCenteringScrollView *)self->_scrollView bounds];
      overlayScrollView = self->_overlayScrollView;
      -[NTKCCenteringScrollView setBounds:](overlayScrollView, "setBounds:");
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_NTKCUltraCubePreviewViewController;
    -[_NTKCUltraCubePreviewViewController observeValueForKeyPath:ofObject:change:context:](&v8, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)scrollViewWillBeginInteraction:(id)a3
{
  [(_NTKCUltraCubePreviewViewController *)self setDidInteractWithCropView:1];
  double v4 = [(_NTKCUltraCubePreviewViewController *)self currentPreview];
  [(NTKCCenteringScrollView *)self->_scrollView cropRect];
  -[_NTKCUltraCubePreviewViewController _validatePreview:withCrop:animated:](self, "_validatePreview:withCrop:animated:", v4, 0);

  CGFloat v5 = [(_NTKCUltraCubePreviewViewController *)self toolbarItems];
  unsigned int v6 = [v5 isEqualToArray:self->_revertableToolbarItems];

  if (v6)
  {
    doneToolbarItems = self->_doneToolbarItems;
    [(_NTKCUltraCubePreviewViewController *)self setToolbarItems:doneToolbarItems animated:1];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = [(_NTKCUltraCubePreviewViewController *)self currentPreview];
  [(NTKCCenteringScrollView *)self->_scrollView cropRect];
  -[_NTKCUltraCubePreviewViewController _validatePreview:withCrop:animated:](self, "_validatePreview:withCrop:animated:", v4, 0);
}

- (void)scrollViewDidSettleFromInteracting:(id)a3
{
  id v4 = [(_NTKCUltraCubePreviewViewController *)self currentPreview];
  [(NTKCCenteringScrollView *)self->_scrollView cropRect];
  double x = v5;
  double y = v7;
  double width = v9;
  double height = v11;
  double photoScale = self->_photoScale;
  if (photoScale != 0.0)
  {
    CGAffineTransformMakeScale(&v19, photoScale, self->_photoScale);
    v20.origin.double x = x;
    v20.origin.double y = y;
    v20.size.double width = width;
    v20.size.double height = height;
    CGRect v21 = CGRectApplyAffineTransform(v20, &v19);
    double x = v21.origin.x;
    double y = v21.origin.y;
    double width = v21.size.width;
    double height = v21.size.height;
  }
  double v14 = [NTKUltraCubeCropPreview alloc];
  double v15 = [v4 photo];
  double v16 = [v4 maskedPhoto];
  double v17 = [v4 previewValidator];
  id v18 = -[NTKUltraCubeCropPreview initWithPhoto:maskedPhoto:previewValidator:crop:timeLabelPosition:revertable:](v14, "initWithPhoto:maskedPhoto:previewValidator:crop:timeLabelPosition:revertable:", v15, v16, v17, [v4 timeLabelPosition], 1, x, y, width, height);

  [(_NTKCUltraCubePreviewViewController *)self _setPreview:v18 animated:1];
}

- (void)_setPreview:(id)a3 animated:(BOOL)a4
{
  double v5 = (NTKUltraCubeCropPreview *)a3;
  if ([(NTKDigitalTimeLabel *)self->_time isHidden]) {
    [(NTKDigitalTimeLabel *)self->_time setHidden:0];
  }
  [(NTKUltraCubeCropPreview *)v5 crop];
  double x = v6;
  double y = v8;
  double width = v10;
  double height = v12;
  double v14 = [(NTKUltraCubeCropPreview *)v5 photo];
  double v15 = [(NTKUltraCubeCropPreview *)v5 maskedPhoto];
  [v14 scale];
  self->_double photoScale = v16;
  [(_NTKCUltraCubePreviewViewController *)self _setupCenteredViewWithPhoto:v14 maskedPhoto:v15];
  id v17 = [(NTKUltraCubeCropPreview *)v5 timeLabelPosition];
  [(NTKCompanionUltraCubeTimePlacementViewController *)self->_timePlacementViewController setSelectedOption:[(_NTKCUltraCubePreviewViewController *)self _optionFromPosition:v17]];
  v31.origin.double x = x;
  v31.origin.double y = y;
  v31.size.double width = width;
  v31.size.double height = height;
  if (!CGRectIsEmpty(v31))
  {
    double photoScale = self->_photoScale;
    if (photoScale != 0.0)
    {
      CGAffineTransformMakeScale(&v30, 1.0 / photoScale, 1.0 / photoScale);
      v32.origin.double x = x;
      v32.origin.double y = y;
      v32.size.double width = width;
      v32.size.double height = height;
      CGRect v33 = CGRectApplyAffineTransform(v32, &v30);
      double x = v33.origin.x;
      double y = v33.origin.y;
      double width = v33.size.width;
      double height = v33.size.height;
    }
  }
  -[NTKCCenteringScrollView setCropRect:](self->_scrollView, "setCropRect:", x, y, width, height);
  -[NTKCCenteringScrollView setCropRect:](self->_overlayScrollView, "setCropRect:", x, y, width, height);
  CGAffineTransform v19 = +[CLKDevice currentDevice];
  CGRect v20 = [(NTKUltraCubePreviewProvider *)self->_previewProvider ultracube_timeLabelFont];
  CGRect v21 = [(NTKUltraCubeCropPreview *)v5 timeLabelStyleForDevice:v19 font:v20];
  [(NTKDigitalTimeLabel *)self->_time setStyle:v21];
  [(NTKDigitalTimeLabel *)self->_time setFrameUsingCurrentStyle];
  unsigned int v22 = [(_NTKCUltraCubePreviewViewController *)self _shouldPositionMaskLabel:v17];
  double v23 = 0.0;
  if (v22) {
    double v23 = 1.0;
  }
  [(NTKCCenteringScrollView *)self->_overlayScrollView setAlpha:v23];
  unsigned int v24 = [(NTKUltraCubeCropPreview *)v5 isRevertable];
  if ([(_NTKCUltraCubePreviewViewController *)self didInteractWithCropView] | v24 ^ 1) {
    id v25 = &OBJC_IVAR____NTKCUltraCubePreviewViewController__doneToolbarItems;
  }
  else {
    id v25 = &OBJC_IVAR____NTKCUltraCubePreviewViewController__revertableToolbarItems;
  }
  id v26 = *(id *)((char *)&self->super.super.super.isa + *v25);
  id v27 = [(_NTKCUltraCubePreviewViewController *)self toolbarItems];

  if (v27 != v26) {
    [(_NTKCUltraCubePreviewViewController *)self setToolbarItems:v26 animated:0];
  }
  -[_NTKCUltraCubePreviewViewController _validatePreview:withCrop:animated:](self, "_validatePreview:withCrop:animated:", v5, 0, x, y, width, height);
  [(_NTKCUltraCubePreviewViewController *)self _updateAllButtonStates];
  currentPreview = self->_currentPreview;
  self->_currentPreview = v5;
  double v29 = v5;
}

- (int64_t)_positionFromOption:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return 2;
  }
  else {
    return qword_441E8[a3 - 1];
  }
}

- (int64_t)_optionFromPosition:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return 3;
  }
  else {
    return qword_44208[a3 - 1];
  }
}

- (BOOL)_shouldPositionMaskLabel:(int64_t)a3
{
  return (unint64_t)(a3 - 3) < 2;
}

- (void)_setCropValidationState:(unint64_t)a3 animated:(BOOL)a4
{
  self->_cropValidationState = a3;
  double v5 = 0.0;
  block[1] = 3221225472;
  block[0] = _NSConcreteStackBlock;
  block[2] = sub_5BB0;
  block[3] = &unk_48C90;
  BOOL v7 = a4;
  if (a3 == 1) {
    double v5 = 1.0;
  }
  block[4] = self;
  *(double *)&block[5] = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  [(_NTKCUltraCubePreviewViewController *)self _updateDoneButtonEnabledState];
}

- (BOOL)_timePositionRequiresCropValidation:(int64_t)a3
{
  return a3 == 3;
}

- (void)_validatePreview:(id)a3 withCrop:(CGRect)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v9 = a3;
  if (-[_NTKCUltraCubePreviewViewController _timePositionRequiresCropValidation:](self, "_timePositionRequiresCropValidation:", [v9 timeLabelPosition]))
  {
    double v10 = [v9 photo];
    [v10 size];
    double v12 = v11;
    double v14 = v13;

    [(NTKCCenteringScrollView *)self->_scrollView zoomScale];
    double v37 = v15;
    double v16 = [(NTKDigitalTimeLabel *)self->_time font];
    [v16 capHeight];
    double v18 = v17;

    CGAffineTransform v19 = [(NTKDigitalTimeLabel *)self->_time font];
    [v19 ascender];
    double v21 = floor(v20 - v18);

    [(NTKDigitalTimeLabel *)self->_time frame];
    CGFloat v23 = v22;
    [(NTKDigitalTimeLabel *)self->_time frame];
    CGFloat v25 = v21 + v24;
    [(NTKDigitalTimeLabel *)self->_time frame];
    CGFloat v27 = v26;
    CGAffineTransformMakeScale(&v41, self->_timeContainerScale, self->_timeContainerScale);
    v42.origin.CGFloat x = v23;
    v42.origin.CGFloat y = v25;
    v42.size.CGFloat width = v27;
    v42.size.CGFloat height = v18;
    CGRect v43 = CGRectApplyAffineTransform(v42, &v41);
    CGFloat v28 = v43.origin.x;
    CGFloat v29 = v43.origin.y;
    CGFloat width = v43.size.width;
    CGFloat height = v43.size.height;
    CGAffineTransformMakeScale(&v40, 1.0 / v37, 1.0 / v37);
    v44.origin.CGFloat x = v28;
    v44.origin.CGFloat y = v29;
    v44.size.CGFloat width = width;
    v44.size.CGFloat height = height;
    CGRect v45 = CGRectApplyAffineTransform(v44, &v40);
    CGRect v46 = CGRectOffset(v45, x, y);
    CGFloat v32 = v46.origin.x / v12;
    CGFloat v33 = v46.origin.y / v14;
    CGFloat v34 = v46.size.width / v12;
    CGFloat v35 = v46.size.height / v14;
    v36 = [v9 previewValidator];
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_5EA8;
    v38[3] = &unk_48CB8;
    v38[4] = self;
    BOOL v39 = v5;
    objc_msgSend(v36, "validateTimeLabel:completion:", v38, v32, v33, v34, v35);
  }
  else
  {
    [(_NTKCUltraCubePreviewViewController *)self _setCropValidationState:0 animated:v5];
  }
}

- (void)_updateAllButtonStates
{
  [(_NTKCUltraCubePreviewViewController *)self _updateDoneButtonEnabledState];

  [(_NTKCUltraCubePreviewViewController *)self _updateDeleteButtonEnabledState];
}

- (void)_updateDeleteButtonEnabledState
{
  unsigned int v3 = [(NTKUltraCubePreviewProvider *)self->_previewProvider ultracube_canDelete];
  if (self->_initialPreviewState == 3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  deleteButton = self->_deleteButton;

  [(UIBarButtonItem *)deleteButton setEnabled:v4];
}

- (void)_updateDoneButtonEnabledState
{
  unsigned __int8 v3 = [(NTKCCenteringScrollView *)self->_scrollView isDragging];
  unsigned __int8 v4 = [(NTKCCenteringScrollView *)self->_scrollView isDecelerating];
  BOOL v5 = 0;
  if ((v3 & 1) == 0 && (v4 & 1) == 0) {
    BOOL v5 = self->_cropValidationState != 1 && self->_initialPreviewState == 3;
  }
  doneButton = self->_doneButton;

  [(UIBarButtonItem *)doneButton setEnabled:v5];
}

- (void)_cancelPressed
{
  if ([(_NTKCUltraCubePreviewViewController *)self didInteractWithCropView])
  {
    unsigned __int8 v3 = +[UIAlertController alertControllerWithTitle:0 message:0 preferredStyle:0];
    unsigned __int8 v4 = NTKCCustomizationLocalizedString();
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_61A4;
    v10[3] = &unk_48CE0;
    v10[4] = self;
    BOOL v5 = +[UIAlertAction actionWithTitle:v4 style:0 handler:v10];
    [v3 addAction:v5];

    double v6 = NTKCCustomizationLocalizedString();
    BOOL v7 = +[UIAlertAction actionWithTitle:v6 style:1 handler:0];
    [v3 addAction:v7];

    double v8 = [(_NTKCUltraCubePreviewViewController *)self parentViewController];
    [v8 presentViewController:v3 animated:1 completion:0];
  }
  else
  {
    id v9 = [(_NTKCUltraCubePreviewViewController *)self delegate];
    [v9 _ultracubePreviewViewControllerWantsToCancel:self];
  }
}

- (void)_deletePressed
{
  unsigned __int8 v3 = NTKCCustomizationLocalizedString();
  unsigned __int8 v4 = +[UIAlertController alertControllerWithTitle:0 message:v3 preferredStyle:0];
  BOOL v5 = NTKCCustomizationLocalizedString();
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_6370;
  v9[3] = &unk_48CE0;
  v9[4] = self;
  double v6 = +[UIAlertAction actionWithTitle:v5 style:2 handler:v9];
  [v4 addAction:v6];

  BOOL v7 = NTKCCustomizationLocalizedString();
  double v8 = +[UIAlertAction actionWithTitle:v7 style:1 handler:0];
  [v4 addAction:v8];

  [(_NTKCUltraCubePreviewViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)_donePressed
{
  id v3 = [(_NTKCUltraCubePreviewViewController *)self delegate];
  [v3 _ultracubePreviewViewControllerWantsToSave:self];
}

- (void)_revertPressed
{
  id v3 = +[NTKUltraCubeFaceBundle localizedStringForKey:@"REVERT_WARNING_MESSAGE" comment:@"Revert to original will…"];
  unsigned __int8 v4 = +[UIAlertController alertControllerWithTitle:0 message:v3 preferredStyle:0];
  BOOL v5 = +[NTKUltraCubeFaceBundle localizedStringForKey:@"REVERT_TO_ORIGINAL" comment:@"Revert to Original"];
  objc_initWeak(&location, self);
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  double v11 = sub_65EC;
  double v12 = &unk_48D08;
  objc_copyWeak(&v13, &location);
  double v6 = +[UIAlertAction actionWithTitle:v5 style:2 handler:&v9];
  objc_msgSend(v4, "addAction:", v6, v9, v10, v11, v12);

  BOOL v7 = +[NTKUltraCubeFaceBundle localizedStringForKey:@"CANCEL" comment:@"Cancel"];
  double v8 = +[UIAlertAction actionWithTitle:v7 style:1 handler:0];
  [v4 addAction:v8];

  [(_NTKCUltraCubePreviewViewController *)self presentViewController:v4 animated:1 completion:0];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (id)_toolbarItemsShowingRevert:(BOOL)a3
{
  if (a3)
  {
    unsigned __int8 v4 = +[NTKUltraCubeFaceBundle localizedStringForKey:@"REVERT" comment:@"Revert"];
    BOOL v5 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithTitle:v4 style:0 target:self action:"_revertPressed"];
    double v6 = +[UIColor systemRedColor];
    [(UIBarButtonItem *)v5 setTintColor:v6];
  }
  else
  {
    doneButton = self->_doneButton;
    if (!doneButton)
    {
      double v8 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"_donePressed"];
      id v9 = self->_doneButton;
      self->_doneButton = v8;

      [(UIBarButtonItem *)self->_doneButton setEnabled:0];
      doneButton = self->_doneButton;
    }
    BOOL v5 = doneButton;
  }
  uint64_t v10 = +[UIBarButtonItem flexibleSpaceItem];
  deleteButton = self->_deleteButton;
  v15[1] = v10;
  v15[2] = deleteButton;
  double v12 = +[UIBarButtonItem flexibleSpaceItem];
  v15[3] = v12;
  v15[4] = v5;
  id v13 = +[NSArray arrayWithObjects:v15 count:5];

  return v13;
}

- (void)ultracubeTimePlacementViewControllerDidUpdateSelectedOption:(id)a3
{
  id v11 = a3;
  unsigned __int8 v4 = [(_NTKCUltraCubePreviewViewController *)self currentPreview];
  if (v4)
  {
    [(_NTKCUltraCubePreviewViewController *)self setDidInteractWithCropView:1];
    int64_t v5 = -[_NTKCUltraCubePreviewViewController _positionFromOption:](self, "_positionFromOption:", [v11 selectedOption]);
    double v6 = [NTKUltraCubeCropPreview alloc];
    BOOL v7 = [v4 photo];
    double v8 = [v4 maskedPhoto];
    id v9 = [v4 previewValidator];
    [v4 crop];
    uint64_t v10 = -[NTKUltraCubeCropPreview initWithPhoto:maskedPhoto:previewValidator:crop:timeLabelPosition:revertable:](v6, "initWithPhoto:maskedPhoto:previewValidator:crop:timeLabelPosition:revertable:", v7, v8, v9, v5, 1);

    [(_NTKCUltraCubePreviewViewController *)self _setPreview:v10 animated:1];
  }
}

- (NTKUltraCubePreviewProvider)previewProvider
{
  return self->_previewProvider;
}

- (void)setPreviewProvider:(id)a3
{
}

- (NTKUltraCubeCropPreview)currentPreview
{
  return self->_currentPreview;
}

- (void)setCurrentPreview:(id)a3
{
}

- (_NTKCUltraCubePreviewViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_NTKCUltraCubePreviewViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)didInteractWithCropView
{
  return self->_didInteractWithCropView;
}

- (void)setDidInteractWithCropView:(BOOL)a3
{
  self->_didInteractWithCropView = a3;
}

- (unint64_t)initialPreviewState
{
  return self->_initialPreviewState;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentPreview, 0);
  objc_storeStrong((id *)&self->_previewProvider, 0);
  objc_storeStrong((id *)&self->_placementGuideLabel, 0);
  objc_storeStrong((id *)&self->_placementGuideContainer, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_doneToolbarItems, 0);
  objc_storeStrong((id *)&self->_revertableToolbarItems, 0);
  objc_storeStrong((id *)&self->_timePlacementViewController, 0);
  objc_storeStrong((id *)&self->_loadingLabel, 0);
  objc_storeStrong((id *)&self->_loadingSpinner, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_deleteButton, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_timeContainer, 0);
  objc_storeStrong((id *)&self->_reverseMask, 0);
  objc_storeStrong((id *)&self->_mask, 0);
  objc_storeStrong((id *)&self->_overlayScrollView, 0);

  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end