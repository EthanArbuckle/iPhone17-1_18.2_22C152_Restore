@interface MKLookAroundContainerView
- (BOOL)floatingDimmingStyle;
- (BOOL)isBadgeHidden;
- (BOOL)isBadgeOnLeadingEdge;
- (BOOL)isMarkedLocation;
- (BOOL)photosDimmingStyle;
- (BOOL)pipDimmingStyle;
- (MKLookAroundContainerBadgeView)badgeView;
- (MKLookAroundContainerView)initWithCoder:(id)a3;
- (MKLookAroundContainerView)initWithFloatingDimmingStyle:(BOOL)a3;
- (MKLookAroundContainerView)initWithFrame:(CGRect)a3;
- (MKLookAroundContainerView)initWithLookAroundView:(id)a3;
- (MKLookAroundContainerView)initWithPhotosDimmingStyle:(BOOL)a3;
- (MKLookAroundContainerViewDelegate)delegate;
- (MKMapItem)mapItem;
- (NSObject)lookAroundViewDidBecomeAdequatelyDrawnObserver;
- (NSObject)lookAroundViewDidBecomeFullyDrawnObserver;
- (UIActivityIndicatorView)activityIndicator;
- (UIColor)dimmingViewBackgroundColorBlackOpaque;
- (UIColor)dimmingViewBackgroundColorBlackTranslucent;
- (UIColor)dimmingViewBackgroundColorClear;
- (UIColor)dimmingViewBackgroundColorGreyOpaque;
- (UIColor)dimmingViewBackgroundColorPhotosOpaque;
- (UIView)dimmingView;
- (id)lookAroundViewIfPresent;
- (unint64_t)dimmingState;
- (void)_commonInitWithLookAroundView:(id)a3;
- (void)_setDimmingViewHidden:(BOOL)a3 loading:(BOOL)a4 animated:(BOOL)a5;
- (void)_updateBadgeConstraints;
- (void)_updateDimmingStateForLookAroundView:(id)a3 completion:(id)a4;
- (void)_updateDimmingViewActivityIndicator;
- (void)_updateDimmingViewBackgroundColor;
- (void)cancelIfPresent;
- (void)dealloc;
- (void)didAddSubview:(id)a3;
- (void)infoCardThemeChanged;
- (void)layoutSubviews;
- (void)setActivityIndicator:(id)a3;
- (void)setBadgeHidden:(BOOL)a3;
- (void)setBadgeHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setBadgeOnLeadingEdge:(BOOL)a3;
- (void)setBadgeView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDimmingState:(unint64_t)a3;
- (void)setDimmingState:(unint64_t)a3 animated:(BOOL)a4;
- (void)setDimmingView:(id)a3;
- (void)setFloatingDimmingStyle:(BOOL)a3;
- (void)setIsMarkedLocation:(BOOL)a3;
- (void)setLookAroundViewDidBecomeAdequatelyDrawnObserver:(id)a3;
- (void)setLookAroundViewDidBecomeFullyDrawnObserver:(id)a3;
- (void)setMapItem:(id)a3;
- (void)setMapItem:(id)a3 isMarkedLocation:(BOOL)a4 wantsCloseUpView:(BOOL)a5;
- (void)setMapItem:(id)a3 wantsCloseUpView:(BOOL)a4;
- (void)setPhotosDimmingStyle:(BOOL)a3;
- (void)setPipDimmingStyle:(BOOL)a3;
@end

@implementation MKLookAroundContainerView

- (UIColor)dimmingViewBackgroundColorGreyOpaque
{
  dimmingViewBackgroundColorGreyOpaque = self->_dimmingViewBackgroundColorGreyOpaque;
  if (!dimmingViewBackgroundColorGreyOpaque)
  {
    v4 = [MEMORY[0x1E4F428B8] systemGrayColor];
    v5 = self->_dimmingViewBackgroundColorGreyOpaque;
    self->_dimmingViewBackgroundColorGreyOpaque = v4;

    dimmingViewBackgroundColorGreyOpaque = self->_dimmingViewBackgroundColorGreyOpaque;
  }

  return dimmingViewBackgroundColorGreyOpaque;
}

- (UIColor)dimmingViewBackgroundColorBlackOpaque
{
  dimmingViewBackgroundColorBlackOpaque = self->_dimmingViewBackgroundColorBlackOpaque;
  if (!dimmingViewBackgroundColorBlackOpaque)
  {
    v4 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:1.0];
    v5 = self->_dimmingViewBackgroundColorBlackOpaque;
    self->_dimmingViewBackgroundColorBlackOpaque = v4;

    dimmingViewBackgroundColorBlackOpaque = self->_dimmingViewBackgroundColorBlackOpaque;
  }

  return dimmingViewBackgroundColorBlackOpaque;
}

- (UIColor)dimmingViewBackgroundColorBlackTranslucent
{
  dimmingViewBackgroundColorBlackTranslucent = self->_dimmingViewBackgroundColorBlackTranslucent;
  if (!dimmingViewBackgroundColorBlackTranslucent)
  {
    v4 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.400000006];
    v5 = self->_dimmingViewBackgroundColorBlackTranslucent;
    self->_dimmingViewBackgroundColorBlackTranslucent = v4;

    dimmingViewBackgroundColorBlackTranslucent = self->_dimmingViewBackgroundColorBlackTranslucent;
  }

  return dimmingViewBackgroundColorBlackTranslucent;
}

- (UIColor)dimmingViewBackgroundColorClear
{
  dimmingViewBackgroundColorClear = self->_dimmingViewBackgroundColorClear;
  if (!dimmingViewBackgroundColorClear)
  {
    v4 = [MEMORY[0x1E4F428B8] clearColor];
    v5 = self->_dimmingViewBackgroundColorClear;
    self->_dimmingViewBackgroundColorClear = v4;

    dimmingViewBackgroundColorClear = self->_dimmingViewBackgroundColorClear;
  }

  return dimmingViewBackgroundColorClear;
}

- (UIColor)dimmingViewBackgroundColorPhotosOpaque
{
  dimmingViewBackgroundColorPhotosOpaque = self->_dimmingViewBackgroundColorPhotosOpaque;
  if (!dimmingViewBackgroundColorPhotosOpaque)
  {
    v4 = [(UIView *)self mk_theme];
    v5 = [v4 normalBackgroundColor];
    v6 = self->_dimmingViewBackgroundColorPhotosOpaque;
    self->_dimmingViewBackgroundColorPhotosOpaque = v5;

    dimmingViewBackgroundColorPhotosOpaque = self->_dimmingViewBackgroundColorPhotosOpaque;
  }

  return dimmingViewBackgroundColorPhotosOpaque;
}

- (void)_commonInitWithLookAroundView:(id)a3
{
  v18 = (MKLookAroundView *)a3;
  [(MKLookAroundContainerView *)self setClipsToBounds:1];
  [(MKLookAroundContainerView *)self setAccessibilityIdentifier:@"LookAroundContainer"];
  v4 = v18;
  if (v18)
  {
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    v9 = [MKLookAroundView alloc];
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v4 = -[MKLookAroundView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
  }
  v19 = v4;
  [(MKLookAroundView *)v4 setCompassHidden:1];
  [(MKLookAroundView *)v19 setAlpha:0.0];
  [(MKLookAroundView *)v19 setNavigatingEnabled:0];
  [(MKLookAroundView *)v19 setPanningEnabled:0];
  [(MKLookAroundView *)v19 setZoomingEnabled:0];
  [(MKLookAroundView *)v19 setShowsRoadLabels:0];
  [(MKLookAroundView *)v19 setShowsPointLabels:0];
  [(MKLookAroundContainerView *)self addSubview:v19];
  [(MKLookAroundContainerView *)self bounds];
  self->_dimmingState = -1;
  v14 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v10, v11, v12, v13);
  dimmingView = self->_dimmingView;
  self->_dimmingView = v14;

  [(UIView *)self->_dimmingView setClipsToBounds:1];
  [(UIView *)self->_dimmingView setUserInteractionEnabled:0];
  [(MKLookAroundContainerView *)self addSubview:self->_dimmingView];
  [(MKLookAroundContainerView *)self _updateDimmingViewBackgroundColor];
  self->_badgeOnLeadingEdge = 1;
  v16 = -[MKLookAroundContainerBadgeView initWithFrame:]([MKLookAroundContainerBadgeView alloc], "initWithFrame:", v5, v6, v7, v8);
  badgeView = self->_badgeView;
  self->_badgeView = v16;

  [(MKLookAroundContainerBadgeView *)self->_badgeView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MKLookAroundContainerView *)self addSubview:self->_badgeView];
  [(MKLookAroundContainerView *)self _updateBadgeConstraints];
  [(MKLookAroundContainerView *)self _updateDimmingViewActivityIndicator];
  [(MKLookAroundContainerView *)self _updateDimmingStateForLookAroundView:v19 completion:0];
}

- (MKLookAroundContainerView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MKLookAroundContainerView;
  v3 = [(MKLookAroundContainerView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(MKLookAroundContainerView *)v3 _commonInitWithLookAroundView:0];
  }
  return v4;
}

- (MKLookAroundContainerView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MKLookAroundContainerView;
  v3 = -[MKLookAroundContainerView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(MKLookAroundContainerView *)v3 _commonInitWithLookAroundView:0];
  }
  return v4;
}

- (MKLookAroundContainerView)initWithLookAroundView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MKLookAroundContainerView;
  double v5 = -[MKLookAroundContainerView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  objc_super v6 = v5;
  if (v5)
  {
    v5->_pipDimmingStyle = 1;
    [(MKLookAroundContainerView *)v5 _commonInitWithLookAroundView:v4];
  }

  return v6;
}

- (MKLookAroundContainerView)initWithPhotosDimmingStyle:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MKLookAroundContainerView;
  id v4 = -[MKLookAroundContainerView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v5 = v4;
  if (v4)
  {
    v4->_photosDimmingStyle = a3;
    [(MKLookAroundContainerView *)v4 _commonInitWithLookAroundView:0];
  }
  return v5;
}

- (MKLookAroundContainerView)initWithFloatingDimmingStyle:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MKLookAroundContainerView;
  id v4 = -[MKLookAroundContainerView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v5 = v4;
  if (v4)
  {
    v4->_floatingDimmingStyle = a3;
    [(MKLookAroundContainerView *)v4 _commonInitWithLookAroundView:0];
  }
  return v5;
}

- (void)dealloc
{
  if (self->_lookAroundViewDidBecomeAdequatelyDrawnObserver)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self->_lookAroundViewDidBecomeAdequatelyDrawnObserver];
  }
  if (self->_lookAroundViewDidBecomeFullyDrawnObserver)
  {
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:self->_lookAroundViewDidBecomeFullyDrawnObserver];
  }
  v5.receiver = self;
  v5.super_class = (Class)MKLookAroundContainerView;
  [(MKLookAroundContainerView *)&v5 dealloc];
}

- (void)setMapItem:(id)a3
{
}

- (void)setMapItem:(id)a3 wantsCloseUpView:(BOOL)a4
{
}

- (void)setMapItem:(id)a3 isMarkedLocation:(BOOL)a4 wantsCloseUpView:(BOOL)a5
{
  BOOL v5 = a5;
  id v14 = a3;
  objc_storeStrong((id *)&self->_mapItem, a3);
  v9 = v14;
  self->_isMarkedLocation = a4;
  if (v14)
  {
    double v10 = [(MKLookAroundContainerView *)self lookAroundViewIfPresent];
    double v11 = v10;
    if (v10)
    {
      id v12 = [v10 mapItem];

      if (v12 == v14)
      {
        if (v5) {
          [v11 moveToCloseUpView];
        }
      }
      else
      {
        double v13 = +[MKLookAroundEntryPoint entryPointWithMapItem:isMarkedLocation:wantsCloseUpView:cameraFrameOverride:triggerAction:](MKLookAroundEntryPoint, "entryPointWithMapItem:isMarkedLocation:wantsCloseUpView:cameraFrameOverride:triggerAction:");
        [v11 enterLookAroundWithEntryPoint:v13];

        [(MKLookAroundContainerView *)self _updateDimmingStateForLookAroundView:v11 completion:0];
      }
    }

    v9 = v14;
  }
}

- (id)lookAroundViewIfPresent
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(MKLookAroundContainerView *)self subviews];
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_super v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)didAddSubview:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [(MKLookAroundContainerView *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      objc_super v6 = [(MKLookAroundContainerView *)self delegate];
      [v6 lookAroundContainerView:self didAddLookAroundView:v7];
    }
  }
}

- (void)layoutSubviews
{
  id v3 = MKGetMKLookAroundLog();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BAEC000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "LookAroundContainerLayoutSubviews", (const char *)&unk_18BD3917F, buf, 2u);
  }

  v14.receiver = self;
  v14.super_class = (Class)MKLookAroundContainerView;
  [(MKLookAroundContainerView *)&v14 layoutSubviews];
  [(MKLookAroundContainerView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = [(MKLookAroundContainerView *)self lookAroundViewIfPresent];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[UIView setFrame:](self->_dimmingView, "setFrame:", v5, v7, v9, v11);
  uint64_t v13 = MKGetMKLookAroundLog();
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BAEC000, v13, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "LookAroundContainerLayoutSubviews", (const char *)&unk_18BD3917F, buf, 2u);
  }
}

- (void)setBadgeOnLeadingEdge:(BOOL)a3
{
  if (self->_badgeOnLeadingEdge != a3)
  {
    self->_badgeOnLeadingEdge = a3;
    [(MKLookAroundContainerView *)self _updateBadgeConstraints];
  }
}

- (void)_updateBadgeConstraints
{
  v24[1] = *MEMORY[0x1E4F143B8];
  if (self->_badgeConstraints)
  {
    objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
    badgeConstraints = self->_badgeConstraints;
    self->_badgeConstraints = 0;
  }
  double v4 = +[MKSystemController sharedInstance];
  int v5 = [v4 userInterfaceIdiom];

  if (v5 == 2) {
    double v6 = 10.0;
  }
  else {
    double v6 = 8.0;
  }
  double v7 = (void *)MEMORY[0x1E4F1CA48];
  double v8 = [(MKLookAroundContainerBadgeView *)self->_badgeView bottomAnchor];
  double v9 = [(MKLookAroundContainerView *)self safeAreaLayoutGuide];
  double v10 = [v9 bottomAnchor];
  double v11 = [v8 constraintEqualToAnchor:v10 constant:-v6];
  v24[0] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  uint64_t v13 = [v7 arrayWithArray:v12];

  badgeView = self->_badgeView;
  if (self->_badgeOnLeadingEdge)
  {
    v15 = [(MKLookAroundContainerBadgeView *)badgeView leadingAnchor];
    v16 = [(MKLookAroundContainerView *)self safeAreaLayoutGuide];
    v17 = [v16 leadingAnchor];
    v18 = v15;
    v19 = v17;
    double v20 = v6;
  }
  else
  {
    v15 = [(MKLookAroundContainerBadgeView *)badgeView trailingAnchor];
    v16 = [(MKLookAroundContainerView *)self safeAreaLayoutGuide];
    v17 = [v16 trailingAnchor];
    v18 = v15;
    v19 = v17;
    double v20 = -v6;
  }
  v21 = [v18 constraintEqualToAnchor:v19 constant:v20];
  [v13 addObject:v21];

  v22 = (NSArray *)[v13 copy];
  v23 = self->_badgeConstraints;
  self->_badgeConstraints = v22;

  [MEMORY[0x1E4F28DC8] activateConstraints:self->_badgeConstraints];
}

- (BOOL)isBadgeHidden
{
  return [(MKLookAroundContainerBadgeView *)self->_badgeView isHidden];
}

- (void)setBadgeHidden:(BOOL)a3
{
}

- (void)setBadgeHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = self->_badgeView;
  if ([(MKLookAroundContainerBadgeView *)v6 isHidden]) {
    [(MKLookAroundContainerBadgeView *)v6 setHidden:0];
  }
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __53__MKLookAroundContainerView_setBadgeHidden_animated___block_invoke;
  double v20 = &unk_1E54B8718;
  BOOL v22 = a3;
  double v7 = v6;
  v21 = v7;
  double v8 = (void (**)(void))MEMORY[0x18C139AE0](&v17);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __53__MKLookAroundContainerView_setBadgeHidden_animated___block_invoke_2;
  objc_super v14 = &unk_1E54B8740;
  LOBYTE(v16) = a3;
  v15 = v7;
  double v9 = v7;
  double v10 = (void (**)(void, void))MEMORY[0x18C139AE0](&v11);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_animateWithDuration:animations:completion:", v8, v10, 0.25, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20);
  }
  else
  {
    v8[2](v8);
    v10[2](v10, 1);
  }
}

uint64_t __53__MKLookAroundContainerView_setBadgeHidden_animated___block_invoke(uint64_t a1)
{
  double v1 = 0.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  return [*(id *)(a1 + 32) setAlpha:v1];
}

uint64_t __53__MKLookAroundContainerView_setBadgeHidden_animated___block_invoke_2(uint64_t a1)
{
  double v2 = 0.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v2 = 1.0;
  }
  [*(id *)(a1 + 32) setAlpha:v2];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  BOOL v4 = *(void **)(a1 + 32);

  return [v4 setHidden:v3];
}

- (void)setDimmingState:(unint64_t)a3
{
}

- (void)setDimmingState:(unint64_t)a3 animated:(BOOL)a4
{
  if (self->_dimmingState != a3)
  {
    self->_dimmingState = a3;
    [(MKLookAroundContainerView *)self _setDimmingViewHidden:a3 == 0 loading:a3 == 2 animated:a4];
  }
}

- (void)_setDimmingViewHidden:(BOOL)a3 loading:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  double v9 = self->_dimmingView;
  double v10 = [(MKLookAroundContainerView *)self lookAroundViewIfPresent];
  uint64_t v11 = self->_activityIndicator;
  uint64_t v12 = v11;
  if (v6) {
    [(UIActivityIndicatorView *)v11 startAnimating];
  }
  BOOL photosDimmingStyle = self->_photosDimmingStyle;
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  v28 = __68__MKLookAroundContainerView__setDimmingViewHidden_loading_animated___block_invoke;
  v29 = &unk_1E54BCFA0;
  BOOL v32 = a3;
  BOOL v33 = photosDimmingStyle;
  objc_super v14 = v9;
  v30 = v14;
  id v15 = v10;
  id v31 = v15;
  uint64_t v16 = (void (**)(void))MEMORY[0x18C139AE0](&v26);
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __68__MKLookAroundContainerView__setDimmingViewHidden_loading_animated___block_invoke_2;
  BOOL v22 = &unk_1E54BCFC8;
  LOBYTE(v25) = v6;
  v23 = v12;
  v24 = self;
  BYTE1(v25) = a3;
  uint64_t v17 = v12;
  uint64_t v18 = (void (**)(void, void))MEMORY[0x18C139AE0](&v19);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_animateWithDuration:animations:completion:", v16, v18, 0.25, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30);
  }
  else
  {
    v16[2](v16);
    v18[2](v18, 1);
  }
}

uint64_t __68__MKLookAroundContainerView__setDimmingViewHidden_loading_animated___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    double v2 = 1.0;
    double v3 = 0.0;
  }
  else
  {
    double v3 = 1.0;
    if (*(unsigned char *)(a1 + 49)) {
      double v2 = 0.0;
    }
    else {
      double v2 = 1.0;
    }
  }
  [*(id *)(a1 + 32) setAlpha:v3];
  BOOL v4 = *(void **)(a1 + 40);

  return [v4 setAlpha:v2];
}

uint64_t __68__MKLookAroundContainerView__setDimmingViewHidden_loading_animated___block_invoke_2(uint64_t result)
{
  uint64_t v1 = result;
  if (!*(unsigned char *)(result + 48)) {
    result = [*(id *)(result + 32) stopAnimating];
  }
  uint64_t v2 = *(void *)(v1 + 40);
  if (*(unsigned char *)(v2 + 460) && *(unsigned char *)(v1 + 49) && !*(unsigned char *)(v1 + 48))
  {
    *(unsigned char *)(v2 + 460) = 0;
    [*(id *)(v1 + 40) _updateDimmingViewActivityIndicator];
    double v3 = *(void **)(v1 + 40);
    return [v3 _updateDimmingViewBackgroundColor];
  }
  return result;
}

- (void)cancelIfPresent
{
  uint64_t v2 = [(MKLookAroundContainerView *)self lookAroundViewIfPresent];
  if (v2)
  {
    id v3 = v2;
    [v2 removeFromSuperview];
    uint64_t v2 = v3;
  }
}

- (void)infoCardThemeChanged
{
  v4.receiver = self;
  v4.super_class = (Class)MKLookAroundContainerView;
  [(UIView *)&v4 infoCardThemeChanged];
  dimmingViewBackgroundColorPhotosOpaque = self->_dimmingViewBackgroundColorPhotosOpaque;
  self->_dimmingViewBackgroundColorPhotosOpaque = 0;

  [(MKLookAroundContainerView *)self _updateDimmingViewBackgroundColor];
}

- (void)_updateDimmingStateForLookAroundView:(id)a3 completion:(id)a4
{
  id v6 = a3;
  double v7 = (void (**)(void))a4;
  BOOL floatingDimmingStyle = self->_floatingDimmingStyle;
  if (([v6 adequatelyDrawn] & 1) == 0 && !floatingDimmingStyle)
  {
    [(MKLookAroundContainerView *)self setDimmingState:2 animated:0];
    objc_initWeak(&location, self);
    if (self->_lookAroundViewDidBecomeAdequatelyDrawnObserver)
    {
      double v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 removeObserver:self->_lookAroundViewDidBecomeAdequatelyDrawnObserver];
    }
    double v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v11 = [MEMORY[0x1E4F28F08] mainQueue];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __77__MKLookAroundContainerView__updateDimmingStateForLookAroundView_completion___block_invoke;
    v26[3] = &unk_1E54BCFF0;
    uint64_t v12 = &v28;
    objc_copyWeak(&v28, &location);
    uint64_t v27 = v7;
    uint64_t v13 = [v10 addObserverForName:@"MKLookAroundViewDidBecomeAdequatelyDrawn" object:v6 queue:v11 usingBlock:v26];
    lookAroundViewDidBecomeAdequatelyDrawnObserver = self->_lookAroundViewDidBecomeAdequatelyDrawnObserver;
    self->_lookAroundViewDidBecomeAdequatelyDrawnObserver = v13;

    id v15 = v27;
LABEL_16:

    objc_destroyWeak(v12);
    objc_destroyWeak(&location);
    goto LABEL_17;
  }
  int v16 = [v6 isLoading];
  if (floatingDimmingStyle && v16 != 0)
  {
    [(MKLookAroundContainerView *)self setDimmingState:2 animated:0];
    objc_initWeak(&location, self);
    if (self->_lookAroundViewDidBecomeFullyDrawnObserver)
    {
      uint64_t v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v18 removeObserver:self->_lookAroundViewDidBecomeFullyDrawnObserver];
    }
    uint64_t v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v20 = [MEMORY[0x1E4F28F08] mainQueue];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __77__MKLookAroundContainerView__updateDimmingStateForLookAroundView_completion___block_invoke_2;
    v23[3] = &unk_1E54BCFF0;
    uint64_t v12 = &v25;
    objc_copyWeak(&v25, &location);
    v24 = v7;
    v21 = [v19 addObserverForName:@"MKLookAroundViewDidBecomeFullyDrawn" object:v6 queue:v20 usingBlock:v23];
    lookAroundViewDidBecomeFullyDrawnObserver = self->_lookAroundViewDidBecomeFullyDrawnObserver;
    self->_lookAroundViewDidBecomeFullyDrawnObserver = v21;

    id v15 = v24;
    goto LABEL_16;
  }
  [(MKLookAroundContainerView *)self setDimmingState:0 animated:0];
  if (v7) {
    v7[2](v7);
  }
LABEL_17:
}

void __77__MKLookAroundContainerView__updateDimmingStateForLookAroundView_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 object];
  int v4 = [v3 hasEnteredLookAround];

  if (v4)
  {
    BOOL v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    double v7 = [WeakRetained lookAroundViewDidBecomeAdequatelyDrawnObserver];
    [v5 removeObserver:v7];

    id v8 = objc_loadWeakRetained((id *)(a1 + 40));
    [v8 setLookAroundViewDidBecomeAdequatelyDrawnObserver:0];

    id v9 = objc_loadWeakRetained((id *)(a1 + 40));
    [v9 _updateDimmingViewBackgroundColor];

    id v10 = objc_loadWeakRetained((id *)(a1 + 40));
    [v10 setDimmingState:0 animated:1];

    uint64_t v11 = *(void *)(a1 + 32);
    if (v11)
    {
      uint64_t v12 = *(void (**)(void))(v11 + 16);
      v12();
    }
  }
}

void __77__MKLookAroundContainerView__updateDimmingStateForLookAroundView_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 object];
  int v4 = [v3 hasEnteredLookAround];

  if (v4)
  {
    BOOL v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    double v7 = [WeakRetained lookAroundViewDidBecomeFullyDrawnObserver];
    [v5 removeObserver:v7];

    id v8 = objc_loadWeakRetained((id *)(a1 + 40));
    [v8 setLookAroundViewDidBecomeFullyDrawnObserver:0];

    id v9 = objc_loadWeakRetained((id *)(a1 + 40));
    [v9 _updateDimmingViewBackgroundColor];

    id v10 = objc_loadWeakRetained((id *)(a1 + 40));
    [v10 setDimmingState:0 animated:1];

    uint64_t v11 = *(void *)(a1 + 32);
    if (v11)
    {
      uint64_t v12 = *(void (**)(void))(v11 + 16);
      v12();
    }
  }
}

- (void)_updateDimmingViewActivityIndicator
{
  v16[2] = *MEMORY[0x1E4F143B8];
  activityIndicator = self->_activityIndicator;
  if (activityIndicator)
  {
    if (self->_photosDimmingStyle || self->_pipDimmingStyle || self->_floatingDimmingStyle)
    {
      [(UIActivityIndicatorView *)activityIndicator removeFromSuperview];
      int v4 = self->_activityIndicator;
      self->_activityIndicator = 0;
    }
  }
  else if (!self->_photosDimmingStyle && !self->_pipDimmingStyle && !self->_floatingDimmingStyle)
  {
    BOOL v5 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
    id v6 = self->_activityIndicator;
    self->_activityIndicator = v5;

    [(UIActivityIndicatorView *)self->_activityIndicator setHidesWhenStopped:1];
    [(UIActivityIndicatorView *)self->_activityIndicator startAnimating];
    double v7 = [MEMORY[0x1E4F428B8] whiteColor];
    [(UIActivityIndicatorView *)self->_activityIndicator setColor:v7];

    [(UIActivityIndicatorView *)self->_activityIndicator setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_dimmingView addSubview:self->_activityIndicator];
    id v8 = (void *)MEMORY[0x1E4F28DC8];
    id v9 = [(UIActivityIndicatorView *)self->_activityIndicator centerXAnchor];
    id v10 = [(UIView *)self->_dimmingView centerXAnchor];
    uint64_t v11 = [v9 constraintEqualToAnchor:v10];
    v16[0] = v11;
    uint64_t v12 = [(UIActivityIndicatorView *)self->_activityIndicator centerYAnchor];
    uint64_t v13 = [(UIView *)self->_dimmingView centerYAnchor];
    objc_super v14 = [v12 constraintEqualToAnchor:v13];
    v16[1] = v14;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    [v8 activateConstraints:v15];
  }
}

- (void)_updateDimmingViewBackgroundColor
{
  id v3 = [(MKLookAroundContainerView *)self lookAroundViewIfPresent];
  int v4 = v3;
  if (self->_floatingDimmingStyle)
  {
    uint64_t v5 = [(MKLookAroundContainerView *)self dimmingViewBackgroundColorGreyOpaque];
  }
  else if (self->_photosDimmingStyle)
  {
    uint64_t v5 = [(MKLookAroundContainerView *)self dimmingViewBackgroundColorPhotosOpaque];
  }
  else if (self->_pipDimmingStyle)
  {
    uint64_t v5 = [(MKLookAroundContainerView *)self dimmingViewBackgroundColorClear];
  }
  else
  {
    if ([v3 hasEnteredLookAround]) {
      [(MKLookAroundContainerView *)self dimmingViewBackgroundColorBlackTranslucent];
    }
    else {
    uint64_t v5 = [(MKLookAroundContainerView *)self dimmingViewBackgroundColorBlackOpaque];
    }
  }
  id v6 = (id)v5;
  [(UIView *)self->_dimmingView setBackgroundColor:v5];
}

- (MKLookAroundContainerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MKLookAroundContainerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (BOOL)isMarkedLocation
{
  return self->_isMarkedLocation;
}

- (void)setIsMarkedLocation:(BOOL)a3
{
  self->_isMarkedLocation = a3;
}

- (BOOL)isBadgeOnLeadingEdge
{
  return self->_badgeOnLeadingEdge;
}

- (unint64_t)dimmingState
{
  return self->_dimmingState;
}

- (BOOL)floatingDimmingStyle
{
  return self->_floatingDimmingStyle;
}

- (void)setFloatingDimmingStyle:(BOOL)a3
{
  self->_BOOL floatingDimmingStyle = a3;
}

- (BOOL)photosDimmingStyle
{
  return self->_photosDimmingStyle;
}

- (void)setPhotosDimmingStyle:(BOOL)a3
{
  self->_BOOL photosDimmingStyle = a3;
}

- (BOOL)pipDimmingStyle
{
  return self->_pipDimmingStyle;
}

- (void)setPipDimmingStyle:(BOOL)a3
{
  self->_pipDimmingStyle = a3;
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (void)setDimmingView:(id)a3
{
}

- (MKLookAroundContainerBadgeView)badgeView
{
  return self->_badgeView;
}

- (void)setBadgeView:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (NSObject)lookAroundViewDidBecomeAdequatelyDrawnObserver
{
  return self->_lookAroundViewDidBecomeAdequatelyDrawnObserver;
}

- (void)setLookAroundViewDidBecomeAdequatelyDrawnObserver:(id)a3
{
}

- (NSObject)lookAroundViewDidBecomeFullyDrawnObserver
{
  return self->_lookAroundViewDidBecomeFullyDrawnObserver;
}

- (void)setLookAroundViewDidBecomeFullyDrawnObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookAroundViewDidBecomeFullyDrawnObserver, 0);
  objc_storeStrong((id *)&self->_lookAroundViewDidBecomeAdequatelyDrawnObserver, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_badgeConstraints, 0);
  objc_storeStrong((id *)&self->_dimmingViewBackgroundColorPhotosOpaque, 0);
  objc_storeStrong((id *)&self->_dimmingViewBackgroundColorClear, 0);
  objc_storeStrong((id *)&self->_dimmingViewBackgroundColorBlackTranslucent, 0);
  objc_storeStrong((id *)&self->_dimmingViewBackgroundColorBlackOpaque, 0);

  objc_storeStrong((id *)&self->_dimmingViewBackgroundColorGreyOpaque, 0);
}

@end