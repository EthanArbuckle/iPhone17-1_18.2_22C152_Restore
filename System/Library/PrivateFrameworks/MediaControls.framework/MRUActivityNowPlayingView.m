@interface MRUActivityNowPlayingView
- (BOOL)showTrailingAccessoryWhenExpanded;
- (MRUActivityAccessoryView)detachedMinimalView;
- (MRUActivityAccessoryView)leadingView;
- (MRUActivityNowPlayingHeaderView)headerView;
- (MRUActivityNowPlayingView)initWithFrame:(CGRect)a3;
- (MRUActivityTrailingAccessoryView)trailingView;
- (MRUNowPlayingTimeControlsView)timeControlsView;
- (MRUNowPlayingTransportControlsView)transportControlsView;
- (MRUVisualStylingProvider)stylingProvider;
- (NSArray)artworkViews;
- (double)preferredHeightForBottomSafeArea;
- (void)layoutSubviews;
- (void)setShowTrailingAccessoryWhenExpanded:(BOOL)a3;
- (void)setStylingProvider:(id)a3;
- (void)updateVisibilty;
@end

@implementation MRUActivityNowPlayingView

- (MRUActivityNowPlayingView)initWithFrame:(CGRect)a3
{
  v24[2] = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)MRUActivityNowPlayingView;
  v3 = -[MRUActivityNowPlayingView initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(MRUActivityNowPlayingView *)v3 layer];
    [v5 setHitTestsAsOpaque:1];

    v6 = objc_alloc_init(MRUFlippingArtworkView);
    [(MRUFlippingArtworkView *)v6 setStyle:7];
    [(MRUFlippingArtworkView *)v6 setDimsWhenPaused:1];
    v7 = objc_alloc_init(MRUFlippingArtworkView);
    [(MRUFlippingArtworkView *)v7 setStyle:7];
    [(MRUFlippingArtworkView *)v7 setDimsWhenPaused:1];
    v24[0] = v6;
    v24[1] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
    artworkViews = v4->_artworkViews;
    v4->_artworkViews = (NSArray *)v8;

    v10 = -[MRUActivityAccessoryView initWithContentView:size:]([MRUActivityAccessoryView alloc], "initWithContentView:size:", v6, 26.0, 22.0);
    leadingView = v4->_leadingView;
    v4->_leadingView = v10;

    [(MRUActivityNowPlayingView *)v4 addSubview:v4->_leadingView];
    v12 = -[MRUActivityAccessoryView initWithContentView:size:]([MRUActivityAccessoryView alloc], "initWithContentView:size:", v7, 45.0, 22.0);
    detachedMinimalView = v4->_detachedMinimalView;
    v4->_detachedMinimalView = v12;

    v14 = -[MRUActivityTrailingAccessoryView initWithSize:]([MRUActivityTrailingAccessoryView alloc], "initWithSize:", 22.0, 22.0);
    trailingView = v4->_trailingView;
    v4->_trailingView = v14;

    [(MRUActivityNowPlayingView *)v4 addSubview:v4->_trailingView];
    v16 = objc_alloc_init(MRUActivityNowPlayingHeaderView);
    headerView = v4->_headerView;
    v4->_headerView = v16;

    [(MRUActivityNowPlayingView *)v4 addSubview:v4->_headerView];
    v18 = objc_alloc_init(MRUNowPlayingTimeControlsView);
    timeControlsView = v4->_timeControlsView;
    v4->_timeControlsView = v18;

    [(MRUActivityNowPlayingView *)v4 addSubview:v4->_timeControlsView];
    v20 = objc_alloc_init(MRUNowPlayingTransportControlsView);
    transportControlsView = v4->_transportControlsView;
    v4->_transportControlsView = v20;

    [(MRUNowPlayingTransportControlsView *)v4->_transportControlsView setLayout:0];
    [(MRUActivityNowPlayingView *)v4 addSubview:v4->_transportControlsView];
    [(MRUActivityNowPlayingView *)v4 updateVisibilty];
  }
  return v4;
}

- (void)layoutSubviews
{
  v115.receiver = self;
  v115.super_class = (Class)MRUActivityNowPlayingView;
  [(MRUActivityNowPlayingView *)&v115 layoutSubviews];
  [(MRUActivityNowPlayingView *)self updateVisibilty];
  v3 = [(MRUActivityNowPlayingView *)self traitCollection];
  [v3 displayScale];

  uint64_t v4 = [(MRUActivityNowPlayingView *)self SBUISA_layoutMode];
  [(MRUActivityNowPlayingView *)self bounds];
  CGFloat v9 = v5;
  CGFloat v10 = v6;
  if (v4 == 4)
  {
    UIRectInset();
    CGFloat x = v116.origin.x;
    CGFloat y = v116.origin.y;
    CGFloat width = v116.size.width;
    CGFloat height = v116.size.height;
    CGRectGetMinX(v116);
    v117.origin.CGFloat x = x;
    v117.origin.CGFloat y = y;
    v117.size.CGFloat width = width;
    v117.size.CGFloat height = height;
    CGRectGetMinY(v117);
    UIRectRoundToScale();
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    [(MRUActivityNowPlayingView *)self bounds];
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    -[MRUActivityAccessoryView setFrame:](self->_leadingView, "setFrame:");
    -[MRUActivityAccessoryView setContentInsets:](self->_leadingView, "setContentInsets:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    v118.origin.CGFloat x = x;
    v118.origin.CGFloat y = y;
    v118.size.CGFloat width = width;
    v118.size.CGFloat height = height;
    CGRectGetMaxX(v118);
    SBUISystemApertureInterItemSpacing();
    v119.origin.CGFloat x = x;
    v119.origin.CGFloat y = y;
    v119.size.CGFloat width = width;
    v119.size.CGFloat height = height;
    CGRectGetMinY(v119);
    SBUISystemApertureInterItemSpacing();
    UIRectRoundToScale();
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    -[MRUActivityAccessoryView setContentOffset:](self->_trailingView, "setContentOffset:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    [(MRUActivityNowPlayingView *)self bounds];
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    -[MRUActivityTrailingAccessoryView setFrame:](self->_trailingView, "setFrame:");
    if (self->_showTrailingAccessoryWhenExpanded)
    {
      v120.origin.CGFloat x = v24;
      v120.origin.CGFloat y = v26;
      v120.size.CGFloat width = v28;
      v120.size.CGFloat height = v30;
      CGRectGetWidth(v120);
    }
    v132.origin.CGFloat y = v18;
    v132.origin.CGFloat x = v16;
    v132.size.CGFloat height = v22;
    v132.size.CGFloat width = v20;
    CGRectGetWidth(v132);
    UIRectInset();
    v74 = [(MRUActivityNowPlayingView *)self SBUISA_systemApertureObstructedAreaLayoutGuide];
    [v74 layoutFrame];
    CGRectGetHeight(v133);
    [(MRUActivityNowPlayingHeaderView *)self->_headerView labelInset];

    UIRectInset();
    CGFloat v76 = v75;
    CGFloat v78 = v77;
    CGFloat v80 = v79;
    CGFloat v82 = v81;
    -[MRUActivityNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v79, v81);
    v134.origin.CGFloat x = v76;
    v134.origin.CGFloat y = v78;
    v134.size.CGFloat width = v80;
    v134.size.CGFloat height = v82;
    CGRectGetMinX(v134);
    v135.origin.CGFloat x = v76;
    v135.origin.CGFloat y = v78;
    v135.size.CGFloat width = v80;
    v135.size.CGFloat height = v82;
    CGRectGetMinY(v135);
    UIRectRoundToScale();
    CGFloat v84 = v83;
    CGFloat v86 = v85;
    CGFloat v88 = v87;
    CGFloat v90 = v89;
    [(MRUActivityNowPlayingView *)self bounds];
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    -[MRUActivityNowPlayingHeaderView setFrame:](self->_headerView, "setFrame:");
    [(MRUActivityNowPlayingView *)self bounds];
    UIRectInset();
    v136.origin.CGFloat x = v84;
    v136.origin.CGFloat y = v86;
    v136.size.CGFloat width = v88;
    v136.size.CGFloat height = v90;
    CGRectGetHeight(v136);
    UIRectInset();
    CGFloat v92 = v91;
    CGFloat v94 = v93;
    CGFloat v96 = v95;
    CGFloat v98 = v97;
    -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v95, v97);
    v137.origin.CGFloat x = v92;
    v137.origin.CGFloat y = v94;
    v137.size.CGFloat width = v96;
    v137.size.CGFloat height = v98;
    CGRectGetMinX(v137);
    v138.origin.CGFloat x = v92;
    v138.origin.CGFloat y = v94;
    v138.size.CGFloat width = v96;
    v138.size.CGFloat height = v98;
    CGRectGetMinY(v138);
    UIRectRoundToScale();
    CGFloat v100 = v99;
    CGFloat v102 = v101;
    CGFloat v104 = v103;
    CGFloat v106 = v105;
    -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:");
    v139.origin.CGFloat x = v100;
    v139.origin.CGFloat y = v102;
    v139.size.CGFloat width = v104;
    v139.size.CGFloat height = v106;
    CGRectGetHeight(v139);
    UIRectInset();
    CGFloat v108 = v107;
    CGFloat v110 = v109;
    CGFloat v112 = v111;
    CGFloat v114 = v113;
    p_transportControlsView = &self->_transportControlsView;
    -[MRUNowPlayingTransportControlsView sizeThatFits:](*p_transportControlsView, "sizeThatFits:", v111, v113);
    v140.origin.CGFloat x = v108;
    v140.origin.CGFloat y = v110;
    v140.size.CGFloat width = v112;
    v140.size.CGFloat height = v114;
    CGRectGetMinX(v140);
    v141.origin.CGFloat x = v108;
    v141.origin.CGFloat y = v110;
    v141.size.CGFloat width = v112;
    v141.size.CGFloat height = v114;
    CGRectGetMinY(v141);
    UIRectRoundToScale();
  }
  else
  {
    CGFloat v31 = v7;
    CGFloat v32 = v8;
    CGRectGetMinX(*(CGRect *)&v5);
    v121.origin.CGFloat x = v9;
    v121.origin.CGFloat y = v10;
    v121.size.CGFloat width = v31;
    v121.size.CGFloat height = v32;
    CGRectGetMinY(v121);
    UIRectRoundToScale();
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    CGFloat v38 = v37;
    CGFloat v40 = v39;
    [(MRUActivityNowPlayingView *)self bounds];
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    -[MRUActivityAccessoryView setFrame:](self->_leadingView, "setFrame:");
    -[MRUActivityAccessoryView setContentInsets:](self->_leadingView, "setContentInsets:", -0.5, -1.0, -0.5, 0.0);
    v122.origin.CGFloat x = v34;
    v122.origin.CGFloat y = v36;
    v122.size.CGFloat width = v38;
    v122.size.CGFloat height = v40;
    CGRectGetWidth(v122);
    UIRectInset();
    CGFloat v41 = v123.origin.x;
    CGFloat v42 = v123.origin.y;
    CGFloat v43 = v123.size.width;
    CGFloat v44 = v123.size.height;
    CGRectGetMaxX(v123);
    v124.origin.CGFloat x = v41;
    v124.origin.CGFloat y = v42;
    v124.size.CGFloat width = v43;
    v124.size.CGFloat height = v44;
    CGRectGetMinY(v124);
    -[MRUActivityAccessoryView setContentOffset:](self->_trailingView, "setContentOffset:", -1.0, 0.0);
    UIRectRoundToScale();
    CGFloat v46 = v45;
    CGFloat v48 = v47;
    CGFloat v50 = v49;
    CGFloat v52 = v51;
    [(MRUActivityNowPlayingView *)self bounds];
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    -[MRUActivityTrailingAccessoryView setFrame:](self->_trailingView, "setFrame:");
    v125.origin.CGFloat x = v46;
    v125.origin.CGFloat y = v48;
    v125.size.CGFloat width = v50;
    v125.size.CGFloat height = v52;
    CGRectGetWidth(v125);
    UIRectInset();
    CGFloat v54 = v53;
    CGFloat v56 = v55;
    double v58 = v57;
    double v60 = v59;
    -[MRUActivityNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v57, v59);
    double v62 = v61;
    double v64 = v63;
    v126.origin.CGFloat x = v54;
    v126.origin.CGFloat y = v56;
    v126.size.CGFloat width = v58;
    v126.size.CGFloat height = v60;
    double MinX = CGRectGetMinX(v126);
    v127.origin.CGFloat x = v54;
    v127.origin.CGFloat y = v56;
    v127.size.CGFloat width = v58;
    v127.size.CGFloat height = v60;
    double MinY = CGRectGetMinY(v127);
    [(MRUActivityNowPlayingHeaderView *)self->_headerView labelInset];
    -[MRUActivityNowPlayingHeaderView setFrame:](self->_headerView, "setFrame:", MinX, MinY - v67, v62, v64);
    -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v58, v60);
    double v69 = v68;
    double v71 = v70;
    v128.origin.CGFloat x = v54;
    v128.origin.CGFloat y = v56;
    v128.size.CGFloat width = v58;
    v128.size.CGFloat height = v60;
    double v72 = CGRectGetMinX(v128);
    v129.origin.CGFloat x = v54;
    v129.origin.CGFloat y = v56;
    v129.size.CGFloat width = v58;
    v129.size.CGFloat height = v60;
    -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:", v72, CGRectGetMinY(v129), v69, v71);
    p_transportControlsView = &self->_transportControlsView;
    -[MRUNowPlayingTransportControlsView sizeThatFits:](*p_transportControlsView, "sizeThatFits:", v58, v60);
    v130.origin.CGFloat x = v54;
    v130.origin.CGFloat y = v56;
    v130.size.CGFloat width = v58;
    v130.size.CGFloat height = v60;
    CGRectGetMinX(v130);
    v131.origin.CGFloat x = v54;
    v131.origin.CGFloat y = v56;
    v131.size.CGFloat width = v58;
    v131.size.CGFloat height = v60;
    CGRectGetMinY(v131);
    UIRectCenteredRect();
  }
  -[MRUNowPlayingTransportControlsView setFrame:](*p_transportControlsView, "setFrame:");
}

- (double)preferredHeightForBottomSafeArea
{
  [(MRUActivityNowPlayingHeaderView *)self->_headerView labelInset];
  double v4 = v3;
  CGFloat v5 = [(MRUActivityNowPlayingView *)self SBUISA_systemApertureObstructedAreaLayoutGuide];
  [v5 layoutFrame];
  CGFloat v6 = CGRectGetHeight(v13) - v4;

  -[MRUActivityNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  CGFloat v8 = v6 + v7 - v4;
  -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  CGFloat v10 = v8 + v9 + 4.0;
  -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  return v10 + v11;
}

- (void)setStylingProvider:(id)a3
{
  CGFloat v5 = (MRUVisualStylingProvider *)a3;
  if (self->_stylingProvider != v5)
  {
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    [(MRUActivityNowPlayingHeaderView *)self->_headerView setStylingProvider:v5];
    [(MRUNowPlayingTimeControlsView *)self->_timeControlsView setStylingProvider:v5];
    [(MRUNowPlayingTransportControlsView *)self->_transportControlsView setStylingProvider:v5];
    [(MRUActivityTrailingAccessoryView *)self->_trailingView setStylingProvider:v5];
  }
}

- (void)setShowTrailingAccessoryWhenExpanded:(BOOL)a3
{
  if (self->_showTrailingAccessoryWhenExpanded != a3)
  {
    self->_showTrailingAccessoryWhenExpanded = a3;
    [(MRUActivityNowPlayingView *)self setNeedsLayout];
    [(MRUActivityNowPlayingView *)self updateVisibilty];
  }
}

- (void)updateVisibilty
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MRUActivityNowPlayingView *)self SBUISA_layoutMode];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  double v4 = self->_artworkViews;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v27 + 1) + 8 * i) setOnScreen:v3 > 1];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v6);
  }

  if (v3 == 4)
  {
    timeControlsView = self->_timeControlsView;
    long long v19 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v25[0] = *MEMORY[0x1E4F1DAB8];
    long long v18 = v25[0];
    v25[1] = v19;
    long long v26 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    long long v17 = v26;
    [(MRUNowPlayingTimeControlsView *)timeControlsView setTransform:v25];
    transportControlsView = self->_transportControlsView;
    v24[0] = v18;
    v24[1] = v19;
    v24[2] = v17;
    [(MRUNowPlayingTransportControlsView *)transportControlsView setTransform:v24];
    double v11 = 1.0;
    [(MRUNowPlayingTimeControlsView *)self->_timeControlsView setAlpha:1.0];
    [(MRUNowPlayingTransportControlsView *)self->_transportControlsView setAlpha:1.0];
    if (!self->_showTrailingAccessoryWhenExpanded) {
      double v11 = 0.0;
    }
    v12 = [(MRUActivityAccessoryView *)self->_trailingView contentView];
    CGRect v13 = v12;
    double v14 = v11;
  }
  else
  {
    CGAffineTransformMakeScale(&v23, 0.5, 0.5);
    double v15 = self->_timeControlsView;
    CGAffineTransform v22 = v23;
    [(MRUNowPlayingTimeControlsView *)v15 setTransform:&v22];
    CGAffineTransformMakeScale(&v21, 0.5, 0.5);
    CGFloat v16 = self->_transportControlsView;
    CGAffineTransform v20 = v21;
    [(MRUNowPlayingTransportControlsView *)v16 setTransform:&v20];
    [(MRUNowPlayingTimeControlsView *)self->_timeControlsView setAlpha:0.0];
    [(MRUNowPlayingTransportControlsView *)self->_transportControlsView setAlpha:0.0];
    v12 = [(MRUActivityAccessoryView *)self->_trailingView contentView];
    CGRect v13 = v12;
    double v14 = 1.0;
  }
  [v12 setAlpha:v14];
}

- (MRUActivityAccessoryView)leadingView
{
  return self->_leadingView;
}

- (MRUActivityTrailingAccessoryView)trailingView
{
  return self->_trailingView;
}

- (MRUActivityAccessoryView)detachedMinimalView
{
  return self->_detachedMinimalView;
}

- (NSArray)artworkViews
{
  return self->_artworkViews;
}

- (MRUActivityNowPlayingHeaderView)headerView
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

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (BOOL)showTrailingAccessoryWhenExpanded
{
  return self->_showTrailingAccessoryWhenExpanded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_transportControlsView, 0);
  objc_storeStrong((id *)&self->_timeControlsView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_artworkViews, 0);
  objc_storeStrong((id *)&self->_detachedMinimalView, 0);
  objc_storeStrong((id *)&self->_trailingView, 0);

  objc_storeStrong((id *)&self->_leadingView, 0);
}

@end