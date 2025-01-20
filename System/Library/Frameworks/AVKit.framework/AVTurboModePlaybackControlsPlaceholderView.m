@interface AVTurboModePlaybackControlsPlaceholderView
- (AVButton)prominentPlayButton;
- (AVMobileChromeControlsStyleSheet)styleSheet;
- (AVObservationController)observationController;
- (AVPlayerController)playerController;
- (AVTurboModePlaybackControlsPlaceholderView)initWithFrame:(CGRect)a3 styleSheet:(id)a4;
- (AVVolumeButtonControl)volumeButton;
- (BOOL)hasVisibleControls;
- (CGAffineTransform)overrideTransformForProminentPlayButton;
- (CGRect)_frameForIncludedViewType:(int64_t)a3;
- (NSString)volumeButtonMicaPackageStateName;
- (NSValue)overrideLayoutMarginsWhenEmbeddedInline;
- (UIView)contentView;
- (UIView)prominentPlayButtonContainer;
- (UIView)volumeButtonContainer;
- (id)_makeProminentPlayButtonAndContainer;
- (id)_makeVolumeButtonAndContainer;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)includedControlType;
- (int64_t)preferredUnobscuredArea;
- (void)_makeProminentPlayButtonAndContainerIfNeeded;
- (void)_makeVolumeButtonAndContainerIfNeeded;
- (void)_updateFramesAndHitRectInsets;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setHidden:(BOOL)a3;
- (void)setIncludedControlType:(int64_t)a3;
- (void)setOverrideLayoutMarginsWhenEmbeddedInline:(id)a3;
- (void)setOverrideTransformForProminentPlayButton:(CGAffineTransform *)a3;
- (void)setPlayerController:(id)a3;
- (void)setPreferredUnobscuredArea:(int64_t)a3;
- (void)setProminentPlayButton:(id)a3;
- (void)setProminentPlayButtonContainer:(id)a3;
- (void)setStyleSheet:(id)a3;
- (void)setVolumeButton:(id)a3;
- (void)setVolumeButtonContainer:(id)a3;
- (void)setVolumeButtonMicaPackageStateName:(id)a3;
@end

@implementation AVTurboModePlaybackControlsPlaceholderView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationController, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_volumeButtonContainer, 0);
  objc_destroyWeak((id *)&self->_prominentPlayButton);
  objc_storeStrong((id *)&self->_prominentPlayButtonContainer, 0);
  objc_destroyWeak((id *)&self->_volumeButton);
  objc_storeStrong((id *)&self->_overrideLayoutMarginsWhenEmbeddedInline, 0);
  objc_storeStrong((id *)&self->_volumeButtonMicaPackageStateName, 0);
  objc_storeStrong((id *)&self->_playerController, 0);

  objc_storeStrong((id *)&self->_styleSheet, 0);
}

- (AVObservationController)observationController
{
  return self->_observationController;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setVolumeButtonContainer:(id)a3
{
}

- (UIView)volumeButtonContainer
{
  return self->_volumeButtonContainer;
}

- (void)setProminentPlayButton:(id)a3
{
}

- (AVButton)prominentPlayButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_prominentPlayButton);

  return (AVButton *)WeakRetained;
}

- (void)setProminentPlayButtonContainer:(id)a3
{
}

- (UIView)prominentPlayButtonContainer
{
  return self->_prominentPlayButtonContainer;
}

- (void)setVolumeButton:(id)a3
{
}

- (AVVolumeButtonControl)volumeButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_volumeButton);

  return (AVVolumeButtonControl *)WeakRetained;
}

- (NSValue)overrideLayoutMarginsWhenEmbeddedInline
{
  return self->_overrideLayoutMarginsWhenEmbeddedInline;
}

- (CGAffineTransform)overrideTransformForProminentPlayButton
{
  long long v3 = *(_OWORD *)&self[10].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[10].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[11].b;
  return self;
}

- (NSString)volumeButtonMicaPackageStateName
{
  return self->_volumeButtonMicaPackageStateName;
}

- (int64_t)includedControlType
{
  return self->_includedControlType;
}

- (int64_t)preferredUnobscuredArea
{
  return self->_preferredUnobscuredArea;
}

- (AVPlayerController)playerController
{
  return self->_playerController;
}

- (void)setStyleSheet:(id)a3
{
}

- (AVMobileChromeControlsStyleSheet)styleSheet
{
  return self->_styleSheet;
}

- (id)_makeProminentPlayButtonAndContainer
{
  long long v3 = [AVLayoutView alloc];
  [(AVTurboModePlaybackControlsPlaceholderView *)self _frameForIncludedViewType:1];
  v4 = -[AVLayoutView initWithFrame:](v3, "initWithFrame:");
  [(AVLayoutView *)v4 setShapeStyle:1];
  v5 = +[AVButton buttonWithAccessibilityIdentifier:@"Central Play" isSecondGeneration:0];
  [v5 setImageName:@"play.fill"];
  v6 = (void *)MEMORY[0x1E4FB08E0];
  uint64_t v7 = *MEMORY[0x1E4FB2928];
  v8 = [(AVTurboModePlaybackControlsPlaceholderView *)self traitCollection];
  v9 = [v6 preferredFontForTextStyle:v7 compatibleWithTraitCollection:v8];
  [v5 setInlineFont:v9];

  [v5 setTintEffectStyle:0];
  [(AVLayoutView *)v4 bounds];
  objc_msgSend(v5, "setFrame:");
  [(AVLayoutView *)v4 addSubview:v5];
  [(AVTurboModePlaybackControlsPlaceholderView *)self setProminentPlayButtonContainer:v4];
  [(AVView *)v4 setIgnoresTouches:1];
  [(AVTurboModePlaybackControlsPlaceholderView *)self setProminentPlayButton:v5];
  v10 = [(AVTurboModePlaybackControlsPlaceholderView *)self contentView];
  [v10 addSubview:v4];

  v11 = [(AVTurboModePlaybackControlsPlaceholderView *)self prominentPlayButton];
  [(AVTurboModePlaybackControlsPlaceholderView *)self overrideTransformForProminentPlayButton];
  [v11 setTransform:&v13];

  return v4;
}

- (void)_makeProminentPlayButtonAndContainerIfNeeded
{
  long long v3 = [(AVTurboModePlaybackControlsPlaceholderView *)self prominentPlayButtonContainer];

  if (!v3)
  {
    v4 = [(AVTurboModePlaybackControlsPlaceholderView *)self _makeProminentPlayButtonAndContainer];
    prominentPlayButtonContainer = self->_prominentPlayButtonContainer;
    self->_prominentPlayButtonContainer = v4;
    MEMORY[0x1F41817F8](v4, prominentPlayButtonContainer);
  }
}

- (id)_makeVolumeButtonAndContainer
{
  long long v3 = [AVLayoutView alloc];
  [(AVTurboModePlaybackControlsPlaceholderView *)self _frameForIncludedViewType:2];
  v4 = -[AVLayoutView initWithFrame:](v3, "initWithFrame:");
  v5 = [AVVolumeButtonControl alloc];
  [(AVLayoutView *)v4 bounds];
  v6 = -[AVVolumeButtonControl initWithFrame:](v5, "initWithFrame:");
  [(AVLayoutView *)v4 addSubview:v6];
  [(AVTurboModePlaybackControlsPlaceholderView *)self setVolumeButtonContainer:v4];
  [(AVTurboModePlaybackControlsPlaceholderView *)self setVolumeButton:v6];
  uint64_t v7 = [(AVTurboModePlaybackControlsPlaceholderView *)self volumeButton];
  v8 = [(AVTurboModePlaybackControlsPlaceholderView *)self volumeButtonMicaPackageStateName];
  [v7 setMicaPackageStateName:v8];

  v9 = [(AVTurboModePlaybackControlsPlaceholderView *)self contentView];
  [v9 addSubview:v4];

  return v4;
}

- (void)_makeVolumeButtonAndContainerIfNeeded
{
  long long v3 = [(AVTurboModePlaybackControlsPlaceholderView *)self volumeButtonContainer];

  if (!v3)
  {
    v4 = [(AVTurboModePlaybackControlsPlaceholderView *)self _makeVolumeButtonAndContainer];
    volumeButtonContainer = self->_volumeButtonContainer;
    self->_volumeButtonContainer = v4;
    MEMORY[0x1F41817F8](v4, volumeButtonContainer);
  }
}

- (CGRect)_frameForIncludedViewType:(int64_t)a3
{
  if (a3 == 1)
  {
    [(AVTurboModePlaybackControlsPlaceholderView *)self bounds];
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    CGFloat v38 = v37;
    v39 = [(AVTurboModePlaybackControlsPlaceholderView *)self styleSheet];
    [v39 standardPaddingInline];
    CGFloat v41 = v40;
    v42 = [(AVTurboModePlaybackControlsPlaceholderView *)self styleSheet];
    [v42 standardPaddingInline];
    CGFloat v44 = v43;
    v85.origin.CGFloat x = v32;
    v85.origin.CGFloat y = v34;
    v85.size.CGFloat width = v36;
    v85.size.CGFloat height = v38;
    CGRect v86 = CGRectInset(v85, v41, v44);
    CGFloat x = v86.origin.x;
    CGFloat y = v86.origin.y;
    CGFloat width = v86.size.width;
    CGFloat height = v86.size.height;

    v87.origin.CGFloat x = x;
    v87.origin.CGFloat y = y;
    v87.size.CGFloat width = width;
    v87.size.CGFloat height = height;
    double v49 = CGRectGetWidth(v87);
    v88.origin.CGFloat x = x;
    v88.origin.CGFloat y = y;
    v88.size.CGFloat width = width;
    v88.size.CGFloat height = height;
    double v50 = CGRectGetHeight(v88);
    if (v49 >= v50) {
      double v49 = v50;
    }
    v51 = [(AVTurboModePlaybackControlsPlaceholderView *)self styleSheet];
    [v51 maximumProminentPlayButtonDimension];
    double v53 = v52;

    if (v49 < v53) {
      double v53 = v49;
    }
    v89.origin.CGFloat x = x;
    v89.origin.CGFloat y = y;
    v89.size.CGFloat width = v53;
    v89.size.CGFloat height = height;
    double v54 = CGRectGetHeight(v89);
    v55 = [(AVTurboModePlaybackControlsPlaceholderView *)self styleSheet];
    [v55 minimumProminentPlayButtonDimension];
    double v57 = v56;

    if (v54 < v57) {
      double v53 = 0.0;
    }
    v90.origin.CGFloat x = x;
    v90.origin.CGFloat y = y;
    v90.size.CGFloat width = v53;
    v90.size.CGFloat height = height;
    CGFloat v58 = CGRectGetWidth(v90);
    [(AVTurboModePlaybackControlsPlaceholderView *)self bounds];
    double MidX = CGRectGetMidX(v91);
    v92.origin.CGFloat x = x;
    v92.origin.CGFloat y = y;
    v92.size.CGFloat width = v53;
    v92.size.CGFloat height = v58;
    double v60 = MidX - CGRectGetWidth(v92) * 0.5;
    [(AVTurboModePlaybackControlsPlaceholderView *)self bounds];
    double MidY = CGRectGetMidY(v93);
    v94.origin.CGFloat x = v60;
    v94.origin.CGFloat y = y;
    v94.size.CGFloat width = v53;
    v94.size.CGFloat height = v58;
    double v62 = MidY - CGRectGetHeight(v94) * 0.5;
    v63 = [(AVTurboModePlaybackControlsPlaceholderView *)self prominentPlayButton];
    v64 = v63;
    if (v63) {
      [v63 transform];
    }
    else {
      memset(&v80, 0, sizeof(v80));
    }
    v96.origin.CGFloat x = v60;
    v96.origin.CGFloat y = v62;
    v96.size.CGFloat width = v53;
    v96.size.CGFloat height = v58;
    CGRectApplyAffineTransform(v96, &v80);
    goto LABEL_32;
  }
  if (a3 != 2) {
    goto LABEL_33;
  }
  [(AVTurboModePlaybackControlsPlaceholderView *)self bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  v12 = [(AVTurboModePlaybackControlsPlaceholderView *)self styleSheet];
  [v12 standardPaddingInline];
  CGFloat v14 = v13;
  v15 = [(AVTurboModePlaybackControlsPlaceholderView *)self styleSheet];
  [v15 standardPaddingInline];
  CGFloat v17 = v16;
  v81.origin.CGFloat x = v5;
  v81.origin.CGFloat y = v7;
  v81.size.CGFloat width = v9;
  v81.size.CGFloat height = v11;
  CGRect v82 = CGRectInset(v81, v14, v17);
  CGFloat v18 = v82.origin.x;
  CGFloat v19 = v82.origin.y;
  CGFloat v20 = v82.size.width;
  CGFloat v21 = v82.size.height;

  v83.origin.CGFloat x = v18;
  v83.origin.CGFloat y = v19;
  v83.size.CGFloat width = v20;
  v83.size.CGFloat height = v21;
  double v22 = CGRectGetWidth(v83);
  v23 = [(AVTurboModePlaybackControlsPlaceholderView *)self styleSheet];
  [v23 defaultItemInlineSize];
  if (v22 >= v24)
  {
    v84.origin.CGFloat x = v18;
    v84.origin.CGFloat y = v19;
    v84.size.CGFloat width = v20;
    v84.size.CGFloat height = v21;
    double v25 = CGRectGetHeight(v84);
    v26 = [(AVTurboModePlaybackControlsPlaceholderView *)self styleSheet];
    [v26 defaultItemInlineSize];
    double v28 = v27;

    if (v25 < v28) {
      goto LABEL_7;
    }
    v23 = [(AVTurboModePlaybackControlsPlaceholderView *)self styleSheet];
    [v23 defaultItemInlineSize];
  }

LABEL_7:
  v29 = [(AVTurboModePlaybackControlsPlaceholderView *)self overrideLayoutMarginsWhenEmbeddedInline];
  if (v29)
  {
    v30 = [(AVTurboModePlaybackControlsPlaceholderView *)self overrideLayoutMarginsWhenEmbeddedInline];
    [v30 UIEdgeInsetsValue];
  }
  else
  {
    v30 = [(AVTurboModePlaybackControlsPlaceholderView *)self styleSheet];
    [v30 standardPaddingInline];
  }

  v65 = [(AVTurboModePlaybackControlsPlaceholderView *)self overrideLayoutMarginsWhenEmbeddedInline];
  if (v65)
  {
    v66 = [(AVTurboModePlaybackControlsPlaceholderView *)self overrideLayoutMarginsWhenEmbeddedInline];
    [v66 UIEdgeInsetsValue];
  }
  else
  {
    v66 = [(AVTurboModePlaybackControlsPlaceholderView *)self styleSheet];
    [v66 standardPaddingInline];
  }

  v67 = [(AVTurboModePlaybackControlsPlaceholderView *)self overrideLayoutMarginsWhenEmbeddedInline];
  if (v67)
  {
    v68 = [(AVTurboModePlaybackControlsPlaceholderView *)self overrideLayoutMarginsWhenEmbeddedInline];
    [v68 UIEdgeInsetsValue];
  }
  else
  {
    v68 = [(AVTurboModePlaybackControlsPlaceholderView *)self styleSheet];
    [v68 standardPaddingInline];
  }

  if ([(AVTurboModePlaybackControlsPlaceholderView *)self effectiveUserInterfaceLayoutDirection] != 1)
  {
    [(AVTurboModePlaybackControlsPlaceholderView *)self bounds];
    CGRectGetMaxX(v95);
    v69 = [(AVTurboModePlaybackControlsPlaceholderView *)self styleSheet];
    [v69 defaultItemInlineSize];
  }
  if ([(AVTurboModePlaybackControlsPlaceholderView *)self preferredUnobscuredArea] == 1)
  {
    [(AVTurboModePlaybackControlsPlaceholderView *)self bounds];
    CGRectGetMaxY(v97);
    v64 = [(AVTurboModePlaybackControlsPlaceholderView *)self styleSheet];
    [v64 defaultItemInlineSize];
LABEL_32:
  }
LABEL_33:
  UIPointRoundToViewScale();
  double v71 = v70;
  double v73 = v72;
  UISizeRoundToViewScale();
  double v75 = v74;
  double v77 = v76;
  double v78 = v71;
  double v79 = v73;
  result.size.CGFloat height = v77;
  result.size.CGFloat width = v75;
  result.origin.CGFloat y = v79;
  result.origin.CGFloat x = v78;
  return result;
}

- (void)_updateFramesAndHitRectInsets
{
  long long v3 = [(AVTurboModePlaybackControlsPlaceholderView *)self contentView];
  [(AVTurboModePlaybackControlsPlaceholderView *)self bounds];
  objc_msgSend(v3, "setFrame:");

  double v4 = [(AVTurboModePlaybackControlsPlaceholderView *)self prominentPlayButtonContainer];
  [(AVTurboModePlaybackControlsPlaceholderView *)self _frameForIncludedViewType:1];
  objc_msgSend(v4, "setFrame:");

  CGFloat v5 = [(AVTurboModePlaybackControlsPlaceholderView *)self prominentPlayButton];
  double v6 = [(AVTurboModePlaybackControlsPlaceholderView *)self prominentPlayButtonContainer];
  [v6 bounds];
  objc_msgSend(v5, "setFrame:");

  CGFloat v7 = [(AVTurboModePlaybackControlsPlaceholderView *)self prominentPlayButton];
  double v8 = [(AVTurboModePlaybackControlsPlaceholderView *)self prominentPlayButtonContainer];
  [v8 frame];
  CGFloat v9 = -CGRectGetMinY(v20);
  double v10 = [(AVTurboModePlaybackControlsPlaceholderView *)self prominentPlayButtonContainer];
  [v10 frame];
  CGFloat v11 = -CGRectGetMinX(v21);
  v12 = [(AVTurboModePlaybackControlsPlaceholderView *)self prominentPlayButtonContainer];
  [v12 frame];
  CGFloat v13 = -CGRectGetMinY(v22);
  CGFloat v14 = [(AVTurboModePlaybackControlsPlaceholderView *)self prominentPlayButtonContainer];
  [v14 frame];
  objc_msgSend(v7, "setHitRectInsets:", v9, v11, v13, -CGRectGetMinX(v23));

  v15 = [(AVTurboModePlaybackControlsPlaceholderView *)self prominentPlayButton];
  [v15 setClampsHitRectInsetsWhenContainedInScrollableView:1];

  double v16 = [(AVTurboModePlaybackControlsPlaceholderView *)self volumeButtonContainer];
  [(AVTurboModePlaybackControlsPlaceholderView *)self _frameForIncludedViewType:2];
  objc_msgSend(v16, "setFrame:");

  id v18 = [(AVTurboModePlaybackControlsPlaceholderView *)self volumeButton];
  CGFloat v17 = [(AVTurboModePlaybackControlsPlaceholderView *)self volumeButtonContainer];
  [v17 bounds];
  objc_msgSend(v18, "setFrame:");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = -[UIView avkit_hitTestControlForPoint:withEvent:](self, "avkit_hitTestControlForPoint:withEvent:", v7, x, y);
  CGFloat v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)AVTurboModePlaybackControlsPlaceholderView;
    -[AVTurboModePlaybackControlsPlaceholderView hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v7, x, y);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  CGFloat v11 = v10;

  return v11;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AVTurboModePlaybackControlsPlaceholderView;
  [(AVTurboModePlaybackControlsPlaceholderView *)&v3 layoutSubviews];
  [(AVTurboModePlaybackControlsPlaceholderView *)self _updateFramesAndHitRectInsets];
}

- (void)setHidden:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVTurboModePlaybackControlsPlaceholderView;
  [(AVTurboModePlaybackControlsPlaceholderView *)&v4 setHidden:a3];
  [(UIView *)self avkit_needsUpdateBackdropCaptureViewHidden];
}

- (void)setVolumeButtonMicaPackageStateName:(id)a3
{
  id v7 = a3;
  if (!-[NSString isEqualToString:](self->_volumeButtonMicaPackageStateName, "isEqualToString:"))
  {
    objc_super v4 = (NSString *)[v7 copy];
    volumeButtonMicaPackageStateName = self->_volumeButtonMicaPackageStateName;
    self->_volumeButtonMicaPackageStateName = v4;

    double v6 = [(AVTurboModePlaybackControlsPlaceholderView *)self volumeButton];
    [v6 setMicaPackageStateName:v7];
  }
}

- (void)setOverrideLayoutMarginsWhenEmbeddedInline:(id)a3
{
  id v5 = a3;
  if (!-[NSValue isEqualToValue:](self->_overrideLayoutMarginsWhenEmbeddedInline, "isEqualToValue:"))
  {
    objc_storeStrong((id *)&self->_overrideLayoutMarginsWhenEmbeddedInline, a3);
    [(AVTurboModePlaybackControlsPlaceholderView *)self setNeedsLayout];
  }
}

- (void)setOverrideTransformForProminentPlayButton:(CGAffineTransform *)a3
{
  id v5 = [(AVTurboModePlaybackControlsPlaceholderView *)self prominentPlayButton];
  double v6 = v5;
  if (v5) {
    [v5 transform];
  }
  else {
    memset(&t1, 0, sizeof(t1));
  }
  long long v7 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v13.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v13.c = v7;
  *(_OWORD *)&v13.tdouble x = *(_OWORD *)&a3->tx;
  BOOL v8 = CGAffineTransformEqualToTransform(&t1, &v13);

  if (!v8)
  {
    long long v10 = *(_OWORD *)&a3->c;
    long long v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&self->_overrideTransformForProminentPlayButton.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&self->_overrideTransformForProminentPlayButton.c = v10;
    *(_OWORD *)&self->_overrideTransformForProminentPlayButton.tdouble x = v9;
    CGFloat v11 = [(AVTurboModePlaybackControlsPlaceholderView *)self prominentPlayButton];
    long long v12 = *(_OWORD *)&self->_overrideTransformForProminentPlayButton.c;
    *(_OWORD *)&v13.a = *(_OWORD *)&self->_overrideTransformForProminentPlayButton.a;
    *(_OWORD *)&v13.c = v12;
    *(_OWORD *)&v13.tdouble x = *(_OWORD *)&self->_overrideTransformForProminentPlayButton.tx;
    [v11 setTransform:&v13];

    [(AVTurboModePlaybackControlsPlaceholderView *)self setNeedsLayout];
  }
}

- (void)setIncludedControlType:(int64_t)a3
{
  if (self->_includedControlType == a3) {
    return;
  }
  self->_includedControlType = a3;
  switch(a3)
  {
    case 0:
      double v6 = [(AVTurboModePlaybackControlsPlaceholderView *)self volumeButtonContainer];
      [v6 setHidden:1];

      id v5 = [(AVTurboModePlaybackControlsPlaceholderView *)self prominentPlayButtonContainer];
      long long v7 = v5;
      uint64_t v8 = 1;
LABEL_9:
      [v5 setHidden:v8];

      break;
    case 2:
      long long v9 = [(AVTurboModePlaybackControlsPlaceholderView *)self prominentPlayButtonContainer];
      [v9 setHidden:1];

      [(AVTurboModePlaybackControlsPlaceholderView *)self _makeVolumeButtonAndContainerIfNeeded];
      id v5 = [(AVTurboModePlaybackControlsPlaceholderView *)self volumeButtonContainer];
      goto LABEL_8;
    case 1:
      objc_super v4 = [(AVTurboModePlaybackControlsPlaceholderView *)self volumeButtonContainer];
      [v4 setHidden:1];

      [(AVTurboModePlaybackControlsPlaceholderView *)self _makeProminentPlayButtonAndContainerIfNeeded];
      id v5 = [(AVTurboModePlaybackControlsPlaceholderView *)self prominentPlayButtonContainer];
LABEL_8:
      long long v7 = v5;
      uint64_t v8 = 0;
      goto LABEL_9;
  }

  [(UIView *)self avkit_needsUpdateBackdropCaptureViewHidden];
}

- (void)setPreferredUnobscuredArea:(int64_t)a3
{
  if (self->_preferredUnobscuredArea != a3)
  {
    self->_preferredUnobscuredArea = a3;
    [(AVTurboModePlaybackControlsPlaceholderView *)self setNeedsLayout];
  }
}

- (void)setPlayerController:(id)a3
{
  id v5 = (AVPlayerController *)a3;
  p_playerController = &self->_playerController;
  long long v12 = v5;
  if (self->_playerController != v5)
  {
    objc_storeStrong((id *)p_playerController, a3);
    long long v7 = [(AVTurboModePlaybackControlsPlaceholderView *)self observationController];
    [v7 stopAllObservation];

    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v8 = [(AVTurboModePlaybackControlsPlaceholderView *)self observationController];
        id v9 = (id)[v8 startObserving:v12 keyPath:@"timeControlStatus" includeInitialValue:1 observationHandler:&__block_literal_global_12955];

        long long v10 = [(AVTurboModePlaybackControlsPlaceholderView *)self observationController];
        id v11 = (id)[v10 startObserving:v12 keyPath:@"muted" includeInitialValue:1 observationHandler:&__block_literal_global_14_12957];

        goto LABEL_8;
      }
    }
    p_playerController = (AVPlayerController **)[(AVTurboModePlaybackControlsPlaceholderView *)self setIncludedControlType:1];
    id v5 = v12;
  }
  if (!v5) {
    p_playerController = (AVPlayerController **)[(AVTurboModePlaybackControlsPlaceholderView *)self setIncludedControlType:1];
  }
LABEL_8:

  MEMORY[0x1F4181820](p_playerController);
}

void __66__AVTurboModePlaybackControlsPlaceholderView_setPlayerController___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a2;
  id v7 = [a4 value];
  if ([v7 BOOLValue]) {
    double v6 = @"mute";
  }
  else {
    double v6 = @"half";
  }
  [v5 setVolumeButtonMicaPackageStateName:v6];
}

void __66__AVTurboModePlaybackControlsPlaceholderView_setPlayerController___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v8 = a2;
  id v5 = [a4 value];
  uint64_t v6 = [v5 integerValue];

  if (v6 == 2) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }
  [v8 setIncludedControlType:v7];
}

- (BOOL)hasVisibleControls
{
  if ([(AVTurboModePlaybackControlsPlaceholderView *)self isHidden]) {
    return 0;
  }
  objc_super v4 = [(AVTurboModePlaybackControlsPlaceholderView *)self contentView];
  BOOL v3 = ([v4 isHidden] & 1) == 0
    && [(AVTurboModePlaybackControlsPlaceholderView *)self includedControlType] != 0;

  return v3;
}

- (void)dealloc
{
  BOOL v3 = [(AVTurboModePlaybackControlsPlaceholderView *)self observationController];
  [v3 stopAllObservation];

  v4.receiver = self;
  v4.super_class = (Class)AVTurboModePlaybackControlsPlaceholderView;
  [(AVTurboModePlaybackControlsPlaceholderView *)&v4 dealloc];
}

- (AVTurboModePlaybackControlsPlaceholderView)initWithFrame:(CGRect)a3 styleSheet:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)AVTurboModePlaybackControlsPlaceholderView;
  id v11 = -[AVTurboModePlaybackControlsPlaceholderView initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  long long v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_styleSheet, a4);
    CGAffineTransform v13 = [AVTouchIgnoringView alloc];
    uint64_t v14 = -[AVTouchIgnoringView initWithFrame:](v13, "initWithFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), width, height);
    contentView = v12->_contentView;
    v12->_contentView = (UIView *)v14;

    double v16 = [[AVObservationController alloc] initWithOwner:v12];
    observationController = v12->_observationController;
    v12->_observationController = v16;

    [(AVTurboModePlaybackControlsPlaceholderView *)v12 addSubview:v12->_contentView];
  }

  return v12;
}

@end