@interface MRULockscreenView
- (BOOL)isDimmed;
- (BOOL)isOnScreen;
- (BOOL)showArtworkView;
- (BOOL)showSuggestionsView;
- (BOOL)showVolumeControlsView;
- (CGRect)suggestionsFrame;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MRUArtworkView)artworkView;
- (MRULockscreenView)initWithFrame:(CGRect)a3;
- (MRUNowPlayingHeaderView)headerView;
- (MRUNowPlayingTimeControlsView)timeControlsView;
- (MRUNowPlayingTransportControlsView)transportControlsView;
- (MRUNowPlayingVolumeControlsView)volumeControlsView;
- (MRUVisualStylingProvider)stylingProvider;
- (UIEdgeInsets)contentEdgeInsets;
- (UIView)suggestionsView;
- (void)layoutSubviews;
- (void)setContentEdgeInsets:(UIEdgeInsets)a3;
- (void)setDimmed:(BOOL)a3;
- (void)setOnScreen:(BOOL)a3;
- (void)setShowArtworkView:(BOOL)a3;
- (void)setShowSuggestionsView:(BOOL)a3;
- (void)setShowVolumeControlsView:(BOOL)a3;
- (void)setStylingProvider:(id)a3;
- (void)setSuggestionsView:(id)a3;
- (void)updateOnScreen;
- (void)updateTextAlignment;
- (void)updateVisibility;
@end

@implementation MRULockscreenView

- (MRULockscreenView)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)MRULockscreenView;
  v3 = -[MRULockscreenView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(MRULockscreenView *)v3 layer];
    [v5 setHitTestsAsOpaque:1];

    v6 = objc_alloc_init(MRUNowPlayingHeaderView);
    headerView = v4->_headerView;
    v4->_headerView = v6;

    [(MRUNowPlayingHeaderView *)v4->_headerView setLayout:0];
    v8 = [(MRUNowPlayingHeaderView *)v4->_headerView labelView];
    [v8 setLayout:2];

    [(MRULockscreenView *)v4 addSubview:v4->_headerView];
    v9 = objc_alloc_init(MRUNowPlayingTimeControlsView);
    timeControlsView = v4->_timeControlsView;
    v4->_timeControlsView = v9;

    [(MRUNowPlayingTimeControlsView *)v4->_timeControlsView setLayout:1];
    [(MRULockscreenView *)v4 addSubview:v4->_timeControlsView];
    v11 = objc_alloc_init(MRUNowPlayingTransportControlsView);
    transportControlsView = v4->_transportControlsView;
    v4->_transportControlsView = v11;

    [(MRUNowPlayingTransportControlsView *)v4->_transportControlsView setLayout:2];
    [(MRULockscreenView *)v4 addSubview:v4->_transportControlsView];
    v13 = objc_alloc_init(MRUNowPlayingVolumeControlsView);
    volumeControlsView = v4->_volumeControlsView;
    v4->_volumeControlsView = v13;

    [(MRUNowPlayingVolumeControlsView *)v4->_volumeControlsView setLayout:1];
    [(MRULockscreenView *)v4 addSubview:v4->_volumeControlsView];
    v15 = objc_alloc_init(MRUArtworkView);
    artworkView = v4->_artworkView;
    v4->_artworkView = v15;

    [(MRUArtworkView *)v4->_artworkView setStyle:1];
    v17 = [(MRUArtworkView *)v4->_artworkView pointerInteraction];
    [v17 setEnabled:1];

    [(MRULockscreenView *)v4 addSubview:v4->_artworkView];
    v4->_showArtworkView = 1;
    v4->_showVolumeControlsView = 1;
    [(MRULockscreenView *)v4 updateTextAlignment];
    [(MRULockscreenView *)v4 updateVisibility];
  }
  return v4;
}

- (void)layoutSubviews
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  v85.receiver = self;
  v85.super_class = (Class)MRULockscreenView;
  [(MRULockscreenView *)&v85 layoutSubviews];
  [(MRULockscreenView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = MCLogCategoryDefault();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = objc_opt_class();
    v91.origin.x = v4;
    v91.origin.y = v6;
    v91.size.width = v8;
    v91.size.height = v10;
    v13 = NSStringFromCGRect(v91);
    *(_DWORD *)buf = 138543618;
    uint64_t v87 = v12;
    __int16 v88 = 2114;
    v89 = v13;
    _os_log_impl(&dword_1AE7DF000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ frame: %{public}@", buf, 0x16u);
  }
  v14 = [(MRULockscreenView *)self traitCollection];
  [v14 displayScale];
  uint64_t v84 = v15;

  [(MRULockscreenView *)self suggestionsFrame];
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  -[UIView setFrame:](self->_suggestionsView, "setFrame:");
  if (self->_showSuggestionsView)
  {
    v92.origin.x = v17;
    v92.origin.y = v19;
    v92.size.width = v21;
    v92.size.height = v23;
    CGRectGetHeight(v92);
    UIRectInset();
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
  }
  else
  {
    double top = self->_contentEdgeInsets.top;
    double left = self->_contentEdgeInsets.left;
    double v25 = v4 + left;
    double v27 = v6 + top;
    double v29 = v8 - (left + self->_contentEdgeInsets.right);
    double v31 = v10 - (top + self->_contentEdgeInsets.bottom);
  }
  -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v29, v31);
  double v35 = v34;
  double v37 = v36;
  v93.origin.x = v25;
  v93.origin.y = v27;
  v93.size.width = v29;
  v93.size.height = v31;
  double MinX = CGRectGetMinX(v93);
  v94.origin.x = v25;
  v94.origin.y = v27;
  v94.size.width = v29;
  v94.size.height = v31;
  CGFloat MaxY = CGRectGetMaxY(v94);
  double v40 = MaxY - v37;
  -[MRUNowPlayingVolumeControlsView setFrame:](self->_volumeControlsView, "setFrame:", MinX, MaxY - v37, v35, v37);
  if (self->_showVolumeControlsView)
  {
    v95.origin.x = MinX;
    v95.origin.y = v40;
    v95.size.width = v35;
    v95.size.height = v37;
    CGRectGetHeight(v95);
    UIRectInset();
    double v25 = v41;
    double v27 = v42;
    double v29 = v43;
    double v31 = v44;
  }
  -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v29, v31);
  double v46 = v45;
  double v48 = v47;
  v96.origin.x = v25;
  v96.origin.y = v27;
  v96.size.width = v29;
  v96.size.height = v31;
  double v49 = CGRectGetMinX(v96);
  v97.origin.x = v25;
  v97.origin.y = v27;
  v97.size.width = v29;
  v97.size.height = v31;
  CGFloat v50 = CGRectGetMaxY(v97);
  CGFloat v51 = v50 - v48;
  -[MRUNowPlayingTransportControlsView setFrame:](self->_transportControlsView, "setFrame:", v49, v50 - v48, v46, v48);
  v98.origin.x = v49;
  v98.origin.y = v51;
  v98.size.width = v46;
  v98.size.height = v48;
  CGRectGetHeight(v98);
  UIRectInset();
  CGFloat v53 = v52;
  CGFloat v55 = v54;
  CGFloat v57 = v56;
  CGFloat v59 = v58;
  -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v56, v58);
  v99.origin.x = v53;
  v99.origin.y = v55;
  v99.size.width = v57;
  v99.size.height = v59;
  CGRectGetMinX(v99);
  v100.origin.x = v53;
  v100.origin.y = v55;
  v100.size.width = v57;
  v100.size.height = v59;
  CGRectGetMaxY(v100);
  UIRectInset();
  CGFloat v61 = v60;
  CGFloat v63 = v62;
  CGFloat v65 = v64;
  CGFloat v67 = v66;
  [(MRULockscreenView *)self bounds];
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:");
  v101.origin.x = v61;
  v101.origin.y = v63;
  v101.size.width = v65;
  v101.size.height = v67;
  CGRectGetHeight(v101);
  UIRectInset();
  CGFloat v69 = v68;
  CGFloat v71 = v70;
  double v73 = v72;
  double v75 = v74;
  if (!self->_showSuggestionsView && self->_showArtworkView)
  {
    UIRectInset();
    CGFloat v69 = v76;
    CGFloat v71 = v77;
    double v73 = v78;
    double v75 = v79;
  }
  v102.origin.x = v69;
  v102.origin.y = v71;
  v102.size.width = v73;
  v102.size.height = v75;
  CGRectGetMinX(v102);
  v103.origin.x = v69;
  v103.origin.y = v71;
  v103.size.width = v73;
  v103.size.height = v75;
  CGRectGetMinY(v103);
  [(MRULockscreenView *)self bounds];
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[MRUArtworkView setFrame:](self->_artworkView, "setFrame:");
  if (!self->_showSuggestionsView && self->_showArtworkView)
  {
    UIRectInset();
    CGFloat v69 = v80;
    CGFloat v71 = v81;
    double v73 = v82;
    double v75 = v83;
  }
  -[MRUNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v73, v75);
  v104.origin.x = v69;
  v104.origin.y = v71;
  v104.size.width = v73;
  v104.size.height = v75;
  CGRectGetMinX(v104);
  v105.origin.x = v69;
  v105.origin.y = v71;
  v105.size.width = v73;
  v105.size.height = v75;
  CGRectGetMinY(v105);
  UIRectCenteredYInRectScale();
  [(MRULockscreenView *)self bounds];
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[MRUNowPlayingHeaderView setFrame:](self->_headerView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  double bottom = self->_contentEdgeInsets.bottom;
  double v6 = self->_contentEdgeInsets.left + self->_contentEdgeInsets.right;
  if (self->_showSuggestionsView)
  {
    CGFloat v7 = a3.height - bottom;
    [(UIView *)self->_suggestionsView sizeThatFits:a3.width];
    double v9 = v7 - v8;
    double v10 = bottom + v8;
  }
  else
  {
    double v10 = bottom + self->_contentEdgeInsets.top;
    double v9 = a3.height - v10;
  }
  double v11 = width - v6;
  -[MRUNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v11, v9);
  if (self->_showArtworkView && !self->_showSuggestionsView)
  {
    double v13 = 57.0;
    if (v12 > 57.0) {
      double v13 = v12;
    }
    double v12 = v13 + 7.0;
  }
  double v14 = v10 + v12;
  double v15 = v9 - v12;
  -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v11, v15);
  double v17 = v15 - v16;
  double v18 = v14 + v16;
  -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v11, v17);
  double v20 = v18 + v19 + 7.0;
  if (self->_showVolumeControlsView)
  {
    -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v11, v17 - (v19 + 7.0));
    double v20 = v20 + v21 + 7.0;
  }
  double v22 = width;
  double v23 = v20;
  result.height = v23;
  result.double width = v22;
  return result;
}

- (void)setStylingProvider:(id)a3
{
  double v5 = (MRUVisualStylingProvider *)a3;
  if (self->_stylingProvider != v5)
  {
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    [(MRUArtworkView *)self->_artworkView setStylingProvider:v5];
    [(MRUNowPlayingHeaderView *)self->_headerView setStylingProvider:v5];
    [(MRUNowPlayingTimeControlsView *)self->_timeControlsView setStylingProvider:v5];
    [(MRUNowPlayingTransportControlsView *)self->_transportControlsView setStylingProvider:v5];
    [(MRUNowPlayingVolumeControlsView *)self->_volumeControlsView setStylingProvider:v5];
  }
}

- (void)setSuggestionsView:(id)a3
{
  double v5 = (UIView *)a3;
  suggestionsView = self->_suggestionsView;
  if (suggestionsView != v5)
  {
    [(UIView *)suggestionsView removeFromSuperview];
    objc_storeStrong((id *)&self->_suggestionsView, a3);
    [(MRULockscreenView *)self addSubview:v5];
    CGFloat v7 = (void *)MEMORY[0x1E4FB1EB0];
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    double v10 = __40__MRULockscreenView_setSuggestionsView___block_invoke;
    double v11 = &unk_1E5F0D8E8;
    double v12 = v5;
    double v13 = self;
    [v7 performWithoutAnimation:&v8];
    [(MRULockscreenView *)self updateVisibility];
    [(MRULockscreenView *)self setNeedsLayout];
  }
}

uint64_t __40__MRULockscreenView_setSuggestionsView___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 40) suggestionsFrame];
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

- (void)setOnScreen:(BOOL)a3
{
  if (self->_onScreen != a3)
  {
    self->_onScreen = a3;
    [(MRULockscreenView *)self updateOnScreen];
  }
}

- (void)setDimmed:(BOOL)a3
{
  if (self->_dimmed != a3)
  {
    BOOL v3 = a3;
    self->_dimmed = a3;
    -[MRUNowPlayingTimeControlsView setDimmed:](self->_timeControlsView, "setDimmed:");
    [(MRUNowPlayingTransportControlsView *)self->_transportControlsView setDimmed:v3];
    [(MRUNowPlayingVolumeControlsView *)self->_volumeControlsView setDimmed:v3];
    [(MRULockscreenView *)self updateOnScreen];
  }
}

- (void)setShowArtworkView:(BOOL)a3
{
  if (self->_showArtworkView != a3)
  {
    self->_showArtworkView = a3;
    [(MRULockscreenView *)self updateTextAlignment];
    [(MRULockscreenView *)self updateVisibility];
    [(MRULockscreenView *)self setNeedsLayout];
  }
}

- (void)setShowVolumeControlsView:(BOOL)a3
{
  if (self->_showVolumeControlsView != a3)
  {
    self->_showVolumeControlsView = a3;
    [(MRULockscreenView *)self updateVisibility];
    [(MRULockscreenView *)self setNeedsLayout];
  }
}

- (void)setShowSuggestionsView:(BOOL)a3
{
  if (self->_showSuggestionsView != a3)
  {
    self->_showSuggestionsView = a3;
    [(MRULockscreenView *)self updateTextAlignment];
    [(MRULockscreenView *)self updateVisibility];
    [(MRULockscreenView *)self setNeedsLayout];
  }
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_contentEdgeInsets.left != a3.left
    || self->_contentEdgeInsets.top != a3.top
    || self->_contentEdgeInsets.right != a3.right
    || self->_contentEdgeInsets.bottom != a3.bottom)
  {
    self->_contentEdgeInsets = a3;
    [(MRULockscreenView *)self setNeedsLayout];
  }
}

- (void)updateTextAlignment
{
  if (self->_showSuggestionsView)
  {
    uint64_t v2 = 1;
  }
  else if (self->_showArtworkView)
  {
    uint64_t v2 = 4;
  }
  else
  {
    uint64_t v2 = 1;
  }
  [(MRUNowPlayingHeaderView *)self->_headerView setTextAlignment:v2];
}

- (void)updateOnScreen
{
  BOOL v3 = self->_onScreen && !self->_dimmed;
  double v4 = [(MRUNowPlayingHeaderView *)self->_headerView labelView];
  [v4 setMarqueeEnabled:v3];

  BOOL onScreen = self->_onScreen;
  timeControlsView = self->_timeControlsView;

  [(MRUNowPlayingTimeControlsView *)timeControlsView setOnScreen:onScreen];
}

- (void)updateVisibility
{
  double v3 = 0.0;
  if (!self->_showSuggestionsView)
  {
    double v3 = 1.0;
    if (!self->_showArtworkView) {
      double v3 = 0.0;
    }
  }
  [(MRUArtworkView *)self->_artworkView setAlpha:v3];
  if (self->_showArtworkView)
  {
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v9.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v9.c = v4;
    *(_OWORD *)&v9.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  else
  {
    CGAffineTransformMakeScale(&v9, 0.01, 0.01);
  }
  artworkView = self->_artworkView;
  CGAffineTransform v8 = v9;
  [(MRUArtworkView *)artworkView setTransform:&v8];
  if (self->_showVolumeControlsView) {
    double v6 = 1.0;
  }
  else {
    double v6 = 0.0;
  }
  [(MRUNowPlayingVolumeControlsView *)self->_volumeControlsView setAlpha:v6];
  if (self->_showSuggestionsView) {
    double v7 = 1.0;
  }
  else {
    double v7 = 0.0;
  }
  [(UIView *)self->_suggestionsView setAlpha:v7];
}

- (CGRect)suggestionsFrame
{
  [(MRULockscreenView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[UIView sizeThatFits:](self->_suggestionsView, "sizeThatFits:", v7, v9);
  double v12 = v11;
  double v14 = v13;
  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.double width = v8;
  v20.size.height = v10;
  CGFloat MinX = CGRectGetMinX(v20);
  v21.origin.x = v4;
  v21.origin.y = v6;
  v21.size.double width = v8;
  v21.size.height = v10;
  double MinY = CGRectGetMinY(v21);
  double v17 = MinX;
  double v18 = v12;
  double v19 = v14;
  result.size.height = v19;
  result.size.double width = v18;
  result.origin.y = MinY;
  result.origin.x = v17;
  return result;
}

- (MRUArtworkView)artworkView
{
  return self->_artworkView;
}

- (MRUNowPlayingHeaderView)headerView
{
  return self->_headerView;
}

- (MRUNowPlayingTimeControlsView)timeControlsView
{
  return self->_timeControlsView;
}

- (MRUNowPlayingTransportControlsView)transportControlsView
{
  return self->_transportControlsView;
}

- (MRUNowPlayingVolumeControlsView)volumeControlsView
{
  return self->_volumeControlsView;
}

- (UIView)suggestionsView
{
  return self->_suggestionsView;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (BOOL)showArtworkView
{
  return self->_showArtworkView;
}

- (BOOL)showVolumeControlsView
{
  return self->_showVolumeControlsView;
}

- (BOOL)showSuggestionsView
{
  return self->_showSuggestionsView;
}

- (UIEdgeInsets)contentEdgeInsets
{
  double top = self->_contentEdgeInsets.top;
  double left = self->_contentEdgeInsets.left;
  double bottom = self->_contentEdgeInsets.bottom;
  double right = self->_contentEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_suggestionsView, 0);
  objc_storeStrong((id *)&self->_volumeControlsView, 0);
  objc_storeStrong((id *)&self->_transportControlsView, 0);
  objc_storeStrong((id *)&self->_timeControlsView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);

  objc_storeStrong((id *)&self->_artworkView, 0);
}

@end