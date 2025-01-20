@interface MRUMediaControlsModuleNowPlayingView
- (BOOL)isOnScreen;
- (BOOL)resizing;
- (BOOL)showSuggestionsView;
- (CCUIModuleContentMetrics)contentMetrics;
- (CGPoint)resizingRatioForForLayout:(int64_t)a3;
- (CGRect)suggestionsFrame;
- (CGSize)sizeThatFits:(CGSize)result;
- (MRUArtworkView)artworkView;
- (MRUMediaControlsModuleNowPlayingView)initWithFrame:(CGRect)a3;
- (MRUMediaControlsModuleRouteButton)lowerRoutingButton;
- (MRUMediaControlsModuleRouteButton)upperRoutingButton;
- (MRUMediaModuleBackdropView)backdropView;
- (MRUMediaSuggestionsView)suggestionsView;
- (MRUNowPlayingHeaderView)headerView;
- (MRUNowPlayingTimeControlsView)timeControlsView;
- (MRUNowPlayingTransportControlsView)transportControlsView;
- (MRUNowPlayingVolumeControlsView)volumeControlsView;
- (MRUVisualStylingProvider)stylingProvider;
- (NSArray)routingButtons;
- (UIEdgeInsets)contentEdgeInsets;
- (double)backdropAlphaWithRatio:(CGPoint)a3;
- (double)contentScaleFactor;
- (double)resizingAlphaWithRatio:(CGPoint)a3;
- (double)resizingThresholdForLayout:(int64_t)a3;
- (int64_t)layout;
- (void)layoutSubviews;
- (void)setBackdropView:(id)a3;
- (void)setContentEdgeInsets:(UIEdgeInsets)a3;
- (void)setContentMetrics:(id)a3;
- (void)setLayout:(int64_t)a3;
- (void)setOnScreen:(BOOL)a3;
- (void)setResizing:(BOOL)a3;
- (void)setShowSuggestionsView:(BOOL)a3;
- (void)setStylingProvider:(id)a3;
- (void)setSuggestionsView:(id)a3;
- (void)updateLayout;
- (void)updateOnScreen;
- (void)updateVisibility;
@end

@implementation MRUMediaControlsModuleNowPlayingView

- (MRUMediaControlsModuleNowPlayingView)initWithFrame:(CGRect)a3
{
  v33[2] = *MEMORY[0x1E4F143B8];
  v31.receiver = self;
  v31.super_class = (Class)MRUMediaControlsModuleNowPlayingView;
  v3 = -[MRUMediaControlsModuleNowPlayingView initWithFrame:](&v31, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(MRUMediaControlsModuleNowPlayingView *)v3 layer];
    [v5 setAllowsGroupBlending:0];

    v6 = [(MRUMediaControlsModuleNowPlayingView *)v4 layer];
    [v6 setAllowsGroupOpacity:0];

    v7 = objc_alloc_init(MRUNowPlayingTimeControlsView);
    timeControlsView = v4->_timeControlsView;
    v4->_timeControlsView = v7;

    [(MRUMediaControlsModuleNowPlayingView *)v4 addSubview:v4->_timeControlsView];
    v9 = objc_alloc_init(MRUNowPlayingVolumeControlsView);
    volumeControlsView = v4->_volumeControlsView;
    v4->_volumeControlsView = v9;

    [(MRUMediaControlsModuleNowPlayingView *)v4 addSubview:v4->_volumeControlsView];
    v11 = objc_alloc_init(MRUNowPlayingHeaderView);
    headerView = v4->_headerView;
    v4->_headerView = v11;

    v13 = [(MRUNowPlayingHeaderView *)v4->_headerView labelView];
    objc_msgSend(v13, "setMarqueeFadeEdgeInsets:", 0.0, 3.0, 0.0, -9.0);

    [(MRUMediaControlsModuleNowPlayingView *)v4 addSubview:v4->_headerView];
    v14 = objc_alloc_init(MRUMediaControlsModuleRouteButton);
    upperRoutingButton = v4->_upperRoutingButton;
    v4->_upperRoutingButton = v14;

    [(MRUMediaControlsModuleRouteButton *)v4->_upperRoutingButton setShowRouteLabel:0];
    [(MRUTransportButton *)v4->_upperRoutingButton setSelected:1];
    [(MRUMediaControlsModuleRouteButton *)v4->_upperRoutingButton setAccessibilityIdentifier:@"mru-router-upper"];
    [(MRUMediaControlsModuleNowPlayingView *)v4 addSubview:v4->_upperRoutingButton];
    v16 = objc_alloc_init(MRUMediaControlsModuleRouteButton);
    lowerRoutingButton = v4->_lowerRoutingButton;
    v4->_lowerRoutingButton = v16;

    [(MRUMediaControlsModuleRouteButton *)v4->_lowerRoutingButton setShowRouteLabel:1];
    [(MRUTransportButton *)v4->_lowerRoutingButton setSelected:1];
    [(MRUMediaControlsModuleRouteButton *)v4->_lowerRoutingButton setAccessibilityIdentifier:@"mru-router-lower"];
    [(MRUMediaControlsModuleNowPlayingView *)v4 addSubview:v4->_lowerRoutingButton];
    v33[0] = v4->_upperRoutingButton;
    v33[1] = v4->_lowerRoutingButton;
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
    routingButtons = v4->_routingButtons;
    v4->_routingButtons = (NSArray *)v18;

    v20 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
    [v20 setValue:&unk_1F069F200 forKey:*MEMORY[0x1E4F3A1D8]];
    v21 = objc_alloc_init(MRUMediaModuleBackdropView);
    backdropView = v4->_backdropView;
    v4->_backdropView = v21;

    [(MRUMediaModuleBackdropView *)v4->_backdropView setAlpha:0.0];
    v32 = v20;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
    v24 = [(MRUMediaModuleBackdropView *)v4->_backdropView layer];
    [v24 setFilters:v23];

    [(MRUMediaControlsModuleNowPlayingView *)v4 addSubview:v4->_backdropView];
    v25 = objc_alloc_init(MRUNowPlayingTransportControlsView);
    transportControlsView = v4->_transportControlsView;
    v4->_transportControlsView = v25;

    [(MRUNowPlayingTransportControlsView *)v4->_transportControlsView setUseColorFilter:0];
    [(MRUMediaControlsModuleNowPlayingView *)v4 addSubview:v4->_transportControlsView];
    v27 = objc_alloc_init(MRUArtworkView);
    artworkView = v4->_artworkView;
    v4->_artworkView = v27;

    v29 = [(MRUArtworkView *)v4->_artworkView pointerInteraction];
    [v29 setEnabled:1];

    [(MRUMediaControlsModuleNowPlayingView *)v4 addSubview:v4->_artworkView];
    [(MRUMediaControlsModuleNowPlayingView *)v4 updateLayout];
    [(MRUMediaControlsModuleNowPlayingView *)v4 updateVisibility];
  }
  return v4;
}

- (void)layoutSubviews
{
  *(void *)&rect.size.width = self;
  *(void *)&rect.size.height = MRUMediaControlsModuleNowPlayingView;
  [(CGSize *)(objc_super *)&rect.size layoutSubviews];
  [(MRUMediaControlsModuleNowPlayingView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(MRUMediaControlsModuleNowPlayingView *)self contentScaleFactor];
  double v12 = v11;
  v13 = [(MRUMediaControlsModuleNowPlayingView *)self traitCollection];
  [v13 displayScale];

  -[MRUMediaModuleBackdropView setFrame:](self->_backdropView, "setFrame:", v4, v6, v8, v10);
  rect.origin.CGFloat x = v12;
  double v14 = MRUUIEdgeInsetsMultiply(self->_contentEdgeInsets.top, self->_contentEdgeInsets.left, self->_contentEdgeInsets.bottom, self->_contentEdgeInsets.right, v12);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  [(MRUMediaControlsModuleNowPlayingView *)self suggestionsFrame];
  double v530 = v22;
  double v533 = v21;
  double v524 = v24;
  double v526 = v23;
  -[MRUMediaSuggestionsView setFrame:](self->_suggestionsView, "setFrame:");
  contentMetrics = self->_contentMetrics;
  if (contentMetrics) {
    [(CCUIModuleContentMetrics *)contentMetrics gridGeometryInfo];
  }
  else {
    double v26 = MEMORY[0x1B3E725A0]();
  }
  double v522 = v26;
  v27 = self->_contentMetrics;
  if (v27)
  {
    [(CCUIModuleContentMetrics *)v27 gridGeometryInfo];
    double v29 = v28;
  }
  else
  {
    CCUILayoutGutter();
    double v29 = v30;
  }
  double v31 = v16 + v20;
  double v32 = v4 + v16;
  double v33 = v6 + v14;
  double v34 = v8 - v31;
  double v35 = v10 - (v14 + v18);
  switch(self->_layout)
  {
    case 0:
      -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v34, v10 - (v14 + v18), v29);
      v551.origin.CGFloat x = v32;
      v551.origin.CGFloat y = v33;
      v551.size.width = v34;
      v551.size.height = v10 - (v14 + v18);
      CGRectGetMaxY(v551);
      UIRectCenteredXInRect();
      CGFloat v67 = v66;
      CGFloat v69 = v68;
      CGFloat v71 = v70;
      CGFloat v520 = v33;
      CGFloat v73 = v72;
      -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:");
      -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v34, v35);
      double v518 = v32;
      v552.origin.CGFloat x = v67;
      v552.origin.CGFloat y = v69;
      v552.size.width = v71;
      v552.size.height = v73;
      CGRectGetMaxY(v552);
      UIRectCenteredXInRect();
      UIRectRoundToScale();
      CGFloat v75 = v74;
      CGFloat v77 = v76;
      CGFloat v79 = v78;
      CGFloat v81 = v80;
      -[MRUNowPlayingVolumeControlsView setFrame:](self->_volumeControlsView, "setFrame:");
      -[MRUMediaControlsModuleRouteButton sizeThatFits:](self->_lowerRoutingButton, "sizeThatFits:", v34, v35);
      v553.origin.CGFloat x = v75;
      v553.origin.CGFloat y = v77;
      v553.size.width = v79;
      v553.size.height = v81;
      CGRectGetMaxY(v553);
      UIRectCenteredXInRect();
      UIRectIntegralWithScale();
      -[MRUMediaControlsModuleRouteButton setFrame:](self->_lowerRoutingButton, "setFrame:");
      v554.origin.CGFloat x = v32;
      v554.origin.CGFloat y = v520;
      v554.size.width = v34;
      v554.size.height = v35;
      double Width = CGRectGetWidth(v554);
      v555.origin.CGFloat x = v32;
      v555.origin.CGFloat y = v520;
      v555.size.width = v34;
      v555.size.height = v35;
      double Height = CGRectGetHeight(v555);
      if (Width >= Height) {
        double Width = Height;
      }
      v556.origin.CGFloat x = v32;
      v556.origin.CGFloat y = v520;
      v556.size.width = v34;
      v556.size.height = v35;
      double v84 = CGRectGetWidth(v556);
      v557.origin.CGFloat x = v32;
      v557.origin.CGFloat y = v520;
      v557.size.width = v34;
      v557.size.height = v35;
      double v85 = CGRectGetHeight(v557);
      if (v84 >= v85) {
        double v84 = v85;
      }
      v558.origin.CGFloat x = v32;
      v558.origin.CGFloat y = v520;
      v558.size.width = v34;
      v558.size.height = v35;
      CGFloat MinX = CGRectGetMinX(v558);
      v559.origin.CGFloat x = v32;
      v559.origin.CGFloat y = v520;
      v559.size.width = v34;
      v559.size.height = v35;
      CGFloat MinY = CGRectGetMinY(v559);
      [(MRUMediaControlsModuleNowPlayingView *)self bounds];
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUArtworkView setFrame:](self->_artworkView, "setFrame:");
      v560.origin.CGFloat x = MinX;
      v560.origin.CGFloat y = MinY;
      v560.size.width = Width;
      v560.size.height = v84;
      CGRectGetWidth(v560);
      UIRectInset();
      CGFloat v89 = v88;
      CGFloat v91 = v90;
      CGFloat v93 = v92;
      CGFloat v95 = v94;
      -[MRUMediaControlsModuleRouteButton sizeThatFits:](self->_upperRoutingButton, "sizeThatFits:", v92, v94);
      v561.origin.CGFloat x = v89;
      v561.origin.CGFloat y = v91;
      v561.size.width = v93;
      v561.size.height = v95;
      CGRectGetMaxX(v561);
      UIRectCenteredYInRect();
      UIRectIntegralWithScale();
      CGFloat v97 = v96;
      CGFloat v99 = v98;
      CGFloat v101 = v100;
      CGFloat v103 = v102;
      -[MRUMediaControlsModuleRouteButton setFrame:](self->_upperRoutingButton, "setFrame:");
      v562.origin.CGFloat x = v97;
      v562.origin.CGFloat y = v99;
      v562.size.width = v101;
      v562.size.height = v103;
      CGRectGetWidth(v562);
      UIRectInset();
      CGFloat v105 = v104;
      CGFloat v107 = v106;
      CGFloat v109 = v108;
      CGFloat v111 = v110;
      -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v108, v110);
      v563.origin.CGFloat x = v105;
      v563.origin.CGFloat y = v107;
      v563.size.width = v109;
      v563.size.height = v111;
      CGRectGetMaxX(v563);
      v564.origin.CGFloat x = v105;
      v564.origin.CGFloat y = v107;
      v564.size.width = v109;
      v564.size.height = v111;
      CGRectGetMinY(v564);
      UIRectCenteredYInRect();
      CGFloat v113 = v112;
      CGFloat v115 = v114;
      CGFloat v117 = v116;
      CGFloat v119 = v118;
      [(MRUMediaControlsModuleNowPlayingView *)self bounds];
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUNowPlayingTransportControlsView setFrame:](self->_transportControlsView, "setFrame:");
      v565.origin.CGFloat x = v113;
      v565.origin.CGFloat y = v115;
      v565.size.width = v117;
      v565.size.height = v119;
      CGRectGetWidth(v565);
      UIRectInset();
      UIRectIntegralWithScale();
      goto LABEL_18;
    case 1:
    case 2:
      -[MRUMediaControlsModuleRouteButton sizeThatFits:](self->_upperRoutingButton, "sizeThatFits:", v34, v10 - (v14 + v18), v29);
      v538.origin.CGFloat x = v32;
      v538.origin.CGFloat y = v33;
      v538.size.width = v34;
      v538.size.height = v10 - (v14 + v18);
      CGRectGetMaxX(v538);
      v539.origin.CGFloat x = v32;
      v539.origin.CGFloat y = v33;
      v539.size.width = v34;
      v539.size.height = v10 - (v14 + v18);
      CGRectGetMinY(v539);
      UIRectIntegralWithScale();
      [(MRUMediaControlsModuleNowPlayingView *)self bounds];
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUMediaControlsModuleRouteButton setFrame:](self->_upperRoutingButton, "setFrame:");
      -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v34, v35);
      v540.origin.CGFloat x = v32;
      CGFloat v519 = v33;
      v540.origin.CGFloat y = v33;
      v540.size.width = v34;
      v540.size.height = v10 - (v14 + v18);
      CGRectGetMaxY(v540);
      UIRectCenteredXInRect();
      CGFloat v37 = v36;
      CGFloat v39 = v38;
      CGFloat v41 = v40;
      CGFloat v43 = v42;
      -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:");
      -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v34, v35);
      double v518 = v32;
      v541.origin.CGFloat x = v37;
      v541.origin.CGFloat y = v39;
      v541.size.width = v41;
      v541.size.height = v43;
      CGRectGetMaxY(v541);
      UIRectCenteredXInRect();
      CGFloat v45 = v44;
      CGFloat v47 = v46;
      CGFloat v49 = v48;
      CGFloat v51 = v50;
      -[MRUNowPlayingTransportControlsView setFrame:](self->_transportControlsView, "setFrame:");
      -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v34, v35);
      v542.origin.CGFloat x = v45;
      v542.origin.CGFloat y = v47;
      v542.size.width = v49;
      v542.size.height = v51;
      CGRectGetMaxY(v542);
      UIRectCenteredXInRect();
      UIRectRoundToScale();
      CGFloat v53 = v52;
      CGFloat v55 = v54;
      CGFloat v57 = v56;
      CGFloat v59 = v58;
      -[MRUNowPlayingVolumeControlsView setFrame:](self->_volumeControlsView, "setFrame:");
      -[MRUMediaControlsModuleRouteButton sizeThatFits:](self->_lowerRoutingButton, "sizeThatFits:", v34, v35);
      v543.origin.CGFloat x = v53;
      v543.origin.CGFloat y = v55;
      v543.size.width = v57;
      v543.size.height = v59;
      CGRectGetMaxY(v543);
      UIRectCenteredXInRect();
      UIRectIntegralWithScale();
      -[MRUMediaControlsModuleRouteButton setFrame:](self->_lowerRoutingButton, "setFrame:");
      v544.origin.CGFloat x = v32;
      v544.origin.CGFloat y = v519;
      v544.size.width = v34;
      v544.size.height = v35;
      double v60 = CGRectGetWidth(v544);
      v545.origin.CGFloat x = v32;
      v545.origin.CGFloat y = v519;
      v545.size.width = v34;
      v545.size.height = v35;
      double v61 = CGRectGetHeight(v545);
      if (v60 >= v61) {
        double v60 = v61;
      }
      v546.origin.CGFloat x = v32;
      v546.origin.CGFloat y = v519;
      v546.size.width = v34;
      v546.size.height = v35;
      double v62 = CGRectGetWidth(v546);
      v547.origin.CGFloat x = v32;
      v547.origin.CGFloat y = v519;
      v547.size.width = v34;
      v547.size.height = v35;
      double v63 = CGRectGetHeight(v547);
      if (v62 >= v63) {
        double v62 = v63;
      }
      v548.origin.CGFloat x = v32;
      v548.origin.CGFloat y = v519;
      v548.size.width = v34;
      v548.size.height = v35;
      CGFloat v64 = CGRectGetMinX(v548);
      v549.origin.CGFloat x = v32;
      v549.origin.CGFloat y = v519;
      v549.size.width = v34;
      v549.size.height = v35;
      CGFloat v65 = CGRectGetMinY(v549);
      [(MRUMediaControlsModuleNowPlayingView *)self bounds];
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUArtworkView setFrame:](self->_artworkView, "setFrame:");
      v550.origin.CGFloat x = v64;
      v550.origin.CGFloat y = v65;
      v550.size.width = v60;
      v550.size.height = v62;
      CGRectGetWidth(v550);
      UIRectInset();
LABEL_18:
      [(MRUMediaControlsModuleNowPlayingView *)self bounds];
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      p_headerView = (id *)&self->_headerView;
      goto LABEL_56;
    case 3:
      -[MRUMediaControlsModuleRouteButton sizeThatFits:](self->_upperRoutingButton, "sizeThatFits:", v34, v10 - (v14 + v18), v29);
      v566.origin.CGFloat x = v32;
      v566.origin.CGFloat y = v33;
      v566.size.width = v34;
      v566.size.height = v10 - (v14 + v18);
      CGRectGetMaxX(v566);
      v567.origin.CGFloat x = v32;
      v567.origin.CGFloat y = v33;
      v567.size.width = v34;
      v567.size.height = v10 - (v14 + v18);
      CGRectGetMinY(v567);
      UIRectIntegralWithScale();
      [(MRUMediaControlsModuleNowPlayingView *)self bounds];
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUMediaControlsModuleRouteButton setFrame:](self->_upperRoutingButton, "setFrame:");
      -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v34, v35);
      double v122 = v121;
      CGFloat v527 = v121;
      double v124 = v123;
      v568.origin.CGFloat x = v32;
      v568.origin.CGFloat y = v33;
      v568.size.width = v34;
      v568.size.height = v35;
      double v525 = CGRectGetMinX(v568);
      v569.origin.CGFloat x = v32;
      v569.origin.CGFloat y = v33;
      v569.size.width = v34;
      v569.size.height = v35;
      CGFloat MaxY = CGRectGetMaxY(v569);
      CGFloat v126 = MaxY - v124;
      CGFloat v534 = MaxY - v124;
      -[MRUNowPlayingTransportControlsView setFrame:](self->_transportControlsView, "setFrame:", v525, MaxY - v124, v122, v124);
      v570.origin.CGFloat x = v525;
      v570.origin.CGFloat y = v126;
      v570.size.width = v122;
      v570.size.height = v124;
      CGRectGetHeight(v570);
      UIRectInset();
      CGFloat x = v571.origin.x;
      CGFloat y = v571.origin.y;
      CGFloat v129 = v571.size.width;
      CGFloat v130 = v571.size.height;
      CGFloat v131 = CGRectGetMinX(v571);
      v572.origin.CGFloat x = x;
      v572.origin.CGFloat y = y;
      v572.size.width = v129;
      v572.size.height = v130;
      CGFloat v132 = CGRectGetMinY(v572);
      [(MRUMediaControlsModuleNowPlayingView *)self bounds];
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUArtworkView setFrame:](self->_artworkView, "setFrame:");
      v573.origin.CGFloat x = v131;
      v573.origin.CGFloat y = v132;
      v573.size.width = rect.origin.x * 52.0;
      v573.size.height = rect.origin.x * 52.0;
      CGRectGetHeight(v573);
      UIRectInset();
      double v134 = v133;
      double v136 = v135;
      -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v135, v133);
      v574.origin.CGFloat x = v525;
      v574.size.height = v124;
      v574.origin.CGFloat y = v534;
      v574.size.width = v527;
      CGRectGetMinY(v574);
      UIRectCenteredXInRect();
      -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:");
      -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v136, v134);
      v575.origin.CGFloat x = v525;
      v575.size.height = v124;
      v575.origin.CGFloat y = v534;
      v575.size.width = v527;
      CGRectGetMaxY(v575);
      double v137 = v136;
      UIRectCenteredXInRect();
      UIRectRoundToScale();
      CGFloat v139 = v138;
      CGFloat v141 = v140;
      CGFloat v143 = v142;
      CGFloat v145 = v144;
      -[MRUNowPlayingVolumeControlsView setFrame:](self->_volumeControlsView, "setFrame:");
      -[MRUMediaControlsModuleRouteButton sizeThatFits:](self->_lowerRoutingButton, "sizeThatFits:", v137, v134);
      v576.origin.CGFloat x = v139;
      v576.origin.CGFloat y = v141;
      v576.size.width = v143;
      v576.size.height = v145;
      CGRectGetMaxY(v576);
      UIRectCenteredXInRect();
      UIRectIntegralWithScale();
      -[MRUMediaControlsModuleRouteButton setFrame:](self->_lowerRoutingButton, "setFrame:");
      UIRectInset();
      CGFloat v147 = v146;
      CGFloat v149 = v148;
      CGFloat v151 = v150;
      CGFloat v153 = v152;
      p_headerView = (id *)&self->_headerView;
      -[MRUNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v150, v152);
      v577.origin.CGFloat x = v147;
      v577.origin.CGFloat y = v149;
      v577.size.width = v151;
      v577.size.height = v153;
      CGRectGetMinX(v577);
      v578.origin.CGFloat x = v147;
      v578.origin.CGFloat y = v149;
      v578.size.width = v151;
      v578.size.height = v153;
      CGRectGetMinY(v578);
      v579.origin.CGFloat x = v147;
      v579.origin.CGFloat y = v149;
      v579.size.width = v151;
      v579.size.height = v153;
      CGRectGetHeight(v579);
      UIRectIntegralWithScale();
      goto LABEL_56;
    case 4:
      double v535 = v29;
      -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v34, v10 - (v14 + v18));
      rect.origin.CGFloat x = v18;
      v580.origin.CGFloat x = v32;
      v580.origin.CGFloat y = v33;
      v580.size.width = v34;
      v580.size.height = v10 - (v14 + v18);
      CGRectGetMaxY(v580);
      UIRectCenteredXInRect();
      CGFloat v528 = v155;
      CGFloat v531 = v154;
      CGFloat v157 = v156;
      CGFloat v521 = v33;
      CGFloat v159 = v158;
      [(MRUMediaControlsModuleNowPlayingView *)self bounds];
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUNowPlayingVolumeControlsView setFrame:](self->_volumeControlsView, "setFrame:");
      -[MRUMediaControlsModuleRouteButton sizeThatFits:](self->_lowerRoutingButton, "sizeThatFits:", v34, v35);
      v581.origin.CGFloat y = v528;
      v581.origin.CGFloat x = v531;
      v581.size.width = v157;
      v581.size.height = v159;
      CGRectGetMaxY(v581);
      UIRectCenteredXInRect();
      UIRectIntegralWithScale();
      -[MRUMediaControlsModuleRouteButton setFrame:](self->_lowerRoutingButton, "setFrame:");
      unsigned int v160 = CCUINumberOfRowsForGridSizeClass();
      double v161 = v535 * (double)(v160 - 1) + (double)v160 * v522 - v14 - rect.origin.x;
      v582.origin.CGFloat x = v32;
      v582.origin.CGFloat y = v521;
      v582.size.width = v34;
      v582.size.height = v35;
      double v162 = CGRectGetHeight(v582);
      if (v161 >= v162) {
        CGFloat v163 = v162;
      }
      else {
        CGFloat v163 = v161;
      }
      v583.origin.CGFloat x = v32;
      v583.origin.CGFloat y = v521;
      v583.size.width = v34;
      v583.size.height = v35;
      double v164 = CGRectGetHeight(v583);
      if (v161 >= v164) {
        double v161 = v164;
      }
      v584.origin.CGFloat x = v32;
      v584.origin.CGFloat y = v521;
      v584.size.width = v34;
      v584.size.height = v35;
      CGFloat v165 = CGRectGetMinX(v584);
      v585.origin.CGFloat x = v32;
      v585.origin.CGFloat y = v521;
      v585.size.width = v34;
      v585.size.height = v35;
      CGFloat v166 = CGRectGetMinY(v585);
      [(MRUMediaControlsModuleNowPlayingView *)self bounds];
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUArtworkView setFrame:](self->_artworkView, "setFrame:");
      v586.origin.CGFloat x = v165;
      v586.origin.CGFloat y = v166;
      v586.size.width = v163;
      v586.size.height = v161;
      CGRectGetHeight(v586);
      UIRectInset();
      CGFloat v168 = v167;
      CGFloat v170 = v169;
      CGFloat v172 = v171;
      CGFloat v174 = v173;
      -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v171, v173);
      CGFloat v176 = v175;
      double v178 = v177;
      v587.origin.CGFloat x = v168;
      v587.origin.CGFloat y = v170;
      v587.size.width = v172;
      v587.size.height = v174;
      CGFloat v179 = CGRectGetMinX(v587);
      v588.origin.CGFloat x = v168;
      v588.origin.CGFloat y = v170;
      v588.size.width = v172;
      v588.size.height = v174;
      CGFloat v180 = CGRectGetMaxY(v588) - v178;
      [(MRUMediaControlsModuleNowPlayingView *)self bounds];
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:");
      v589.origin.CGFloat x = v179;
      v589.origin.CGFloat y = v180;
      v589.size.width = v176;
      v589.size.height = v178;
      CGRectGetHeight(v589);
      UIRectInset();
      CGFloat v182 = v181;
      CGFloat v184 = v183;
      CGFloat v186 = v185;
      CGFloat v188 = v187;
      -[MRUMediaControlsModuleRouteButton sizeThatFits:](self->_upperRoutingButton, "sizeThatFits:", v185, v187);
      v590.origin.CGFloat x = v182;
      v590.origin.CGFloat y = v184;
      v590.size.width = v186;
      v590.size.height = v188;
      CGRectGetMaxX(v590);
      v591.origin.CGFloat x = v182;
      v591.origin.CGFloat y = v184;
      v591.size.width = v186;
      v591.size.height = v188;
      CGRectGetMinY(v591);
      UIRectIntegralWithScale();
      rect.origin.CGFloat x = v189;
      CGFloat v191 = v190;
      CGFloat v193 = v192;
      CGFloat v195 = v194;
      [(MRUMediaControlsModuleNowPlayingView *)self bounds];
      CGFloat v532 = v193;
      CGFloat v536 = v191;
      CGFloat v529 = v195;
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUMediaControlsModuleRouteButton setFrame:](self->_upperRoutingButton, "setFrame:");
      UIRectInset();
      CGFloat v196 = v592.origin.x;
      CGFloat v197 = v592.origin.y;
      CGFloat v198 = v592.size.width;
      CGFloat v199 = v592.size.height;
      headerView = self->_headerView;
      double v201 = CGRectGetWidth(v592);
      v593.origin.CGFloat x = rect.origin.x;
      v593.origin.CGFloat y = v191;
      v593.size.width = v193;
      v593.size.height = v195;
      double v202 = v201 - (CGRectGetWidth(v593) + 7.0);
      v594.origin.CGFloat x = v196;
      v594.origin.CGFloat y = v197;
      v594.size.width = v198;
      v594.size.height = v199;
      -[MRUNowPlayingHeaderView sizeThatFits:](headerView, "sizeThatFits:", v202, CGRectGetHeight(v594));
      v595.origin.CGFloat x = v196;
      v595.origin.CGFloat y = v197;
      v595.size.width = v198;
      v595.size.height = v199;
      CGRectGetMinX(v595);
      v596.origin.CGFloat x = v196;
      v596.origin.CGFloat y = v197;
      v596.size.width = v198;
      v596.size.height = v199;
      CGRectGetMinY(v596);
      UIRectIntegralWithScale();
      CGFloat v204 = v203;
      CGFloat v206 = v205;
      CGFloat v208 = v207;
      CGFloat v210 = v209;
      [(MRUMediaControlsModuleNowPlayingView *)self bounds];
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUNowPlayingHeaderView setFrame:](self->_headerView, "setFrame:");
      v597.origin.CGFloat x = v204;
      v597.origin.CGFloat y = v206;
      v597.size.width = v208;
      v597.size.height = v210;
      CGRectGetHeight(v597);
      v598.origin.CGFloat y = v536;
      v598.origin.CGFloat x = rect.origin.x;
      v598.size.height = v529;
      v598.size.width = v532;
      CGRectGetHeight(v598);
      UIRectInset();
      CGFloat v212 = v211;
      CGFloat v214 = v213;
      CGFloat v216 = v215;
      CGFloat v218 = v217;
      p_headerView = (id *)&self->_transportControlsView;
      -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v215, v217);
      v599.origin.CGFloat x = v212;
      v599.origin.CGFloat y = v214;
      v599.size.width = v216;
      v599.size.height = v218;
      CGRectGetMinX(v599);
      UIRectCenteredYInRect();
      goto LABEL_55;
    case 5:
      -[MRUMediaControlsModuleRouteButton sizeThatFits:](self->_upperRoutingButton, "sizeThatFits:", v34, v10 - (v14 + v18), v29);
      v600.origin.CGFloat x = v32;
      v600.origin.CGFloat y = v33;
      v600.size.width = v34;
      v600.size.height = v10 - (v14 + v18);
      CGRectGetMaxX(v600);
      v601.origin.CGFloat x = v32;
      v601.origin.CGFloat y = v33;
      v601.size.width = v34;
      v601.size.height = v10 - (v14 + v18);
      CGRectGetMinY(v601);
      UIRectIntegralWithScale();
      [(MRUMediaControlsModuleNowPlayingView *)self bounds];
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUMediaControlsModuleRouteButton setFrame:](self->_upperRoutingButton, "setFrame:");
      -[MRUMediaControlsModuleRouteButton sizeThatFits:](self->_lowerRoutingButton, "sizeThatFits:", v34, v35);
      v602.origin.CGFloat x = v32;
      v602.origin.CGFloat y = v33;
      v602.size.width = v34;
      v602.size.height = v10 - (v14 + v18);
      CGRectGetMaxY(v602);
      UIRectCenteredXInRect();
      UIRectIntegralWithScale();
      CGFloat v220 = v219;
      CGFloat v222 = v221;
      CGFloat v224 = v223;
      CGFloat v226 = v225;
      -[MRUMediaControlsModuleRouteButton setFrame:](self->_lowerRoutingButton, "setFrame:");
      v603.origin.CGFloat x = v220;
      v603.origin.CGFloat y = v222;
      v603.size.width = v224;
      v603.size.height = v226;
      CGRectGetHeight(v603);
      UIRectInset();
      CGFloat v228 = v227;
      CGFloat v230 = v229;
      CGFloat v232 = v231;
      CGFloat v234 = v233;
      -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v231, v233);
      v604.origin.CGFloat x = v228;
      v604.origin.CGFloat y = v230;
      v604.size.width = v232;
      v604.size.height = v234;
      CGRectGetMinX(v604);
      v605.origin.CGFloat x = v228;
      v605.origin.CGFloat y = v230;
      v605.size.width = v232;
      v605.size.height = v234;
      CGRectGetMaxY(v605);
      UIRectRoundToScale();
      CGFloat v236 = v235;
      CGFloat v238 = v237;
      CGFloat v240 = v239;
      CGFloat v242 = v241;
      -[MRUNowPlayingVolumeControlsView setFrame:](self->_volumeControlsView, "setFrame:");
      v606.origin.CGFloat x = v236;
      v606.origin.CGFloat y = v238;
      v606.size.width = v240;
      v606.size.height = v242;
      CGRectGetHeight(v606);
      UIRectInset();
      CGFloat v244 = v243;
      CGFloat v246 = v245;
      CGFloat v248 = v247;
      CGFloat v250 = v249;
      double v251 = MRUCGSizeMultiply(82.0, 82.0, rect.origin.x);
      CGFloat v253 = v252;
      v607.origin.CGFloat x = v244;
      v607.origin.CGFloat y = v246;
      v607.size.width = v248;
      v607.size.height = v250;
      CGFloat v254 = CGRectGetMinX(v607);
      v608.origin.CGFloat x = v244;
      v608.origin.CGFloat y = v246;
      v608.size.width = v248;
      v608.size.height = v250;
      CGFloat v523 = CGRectGetMinY(v608);
      [(MRUMediaControlsModuleNowPlayingView *)self bounds];
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUArtworkView setFrame:](self->_artworkView, "setFrame:");
      v255 = self->_headerView;
      v609.origin.CGFloat x = v244;
      v609.origin.CGFloat y = v246;
      v609.size.width = v248;
      v609.size.height = v250;
      double v256 = CGRectGetWidth(v609);
      v610.origin.CGFloat x = v254;
      v610.origin.CGFloat y = v523;
      v610.size.width = v251;
      v610.size.height = v253;
      double v257 = v256 - (rect.origin.x * 12.0 + CGRectGetWidth(v610));
      v611.origin.CGFloat x = v254;
      v611.origin.CGFloat y = v523;
      v611.size.width = v251;
      v611.size.height = v253;
      -[MRUNowPlayingHeaderView sizeThatFits:](v255, "sizeThatFits:", v257, CGRectGetHeight(v611));
      v612.origin.CGFloat x = v254;
      v612.origin.CGFloat y = v523;
      v612.size.width = v251;
      v612.size.height = v253;
      CGRectGetMaxX(v612);
      UIRectCenteredYInRect();
      UIRectIntegralWithScale();
      [(MRUMediaControlsModuleNowPlayingView *)self bounds];
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUNowPlayingHeaderView setFrame:](self->_headerView, "setFrame:");
      v613.origin.CGFloat x = v254;
      v613.origin.CGFloat y = v523;
      v613.size.width = v251;
      v613.size.height = v253;
      CGRectGetHeight(v613);
      UIRectInset();
      CGFloat v259 = v258;
      CGFloat v261 = v260;
      CGFloat v263 = v262;
      CGFloat v265 = v264;
      -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v262, v264);
      double v267 = v266;
      double v269 = v268;
      v614.origin.CGFloat x = v259;
      v614.origin.CGFloat y = v261;
      v614.size.width = v263;
      v614.size.height = v265;
      double v270 = CGRectGetMinX(v614);
      v615.origin.CGFloat x = v259;
      v615.origin.CGFloat y = v261;
      v615.size.width = v263;
      v615.size.height = v265;
      double v271 = CGRectGetMinY(v615);
      -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:", v270, v271, v267, v269);
      v616.origin.CGFloat x = v270;
      v616.origin.CGFloat y = v271;
      v616.size.width = v267;
      v616.size.height = v269;
      CGRectGetHeight(v616);
      goto LABEL_44;
    case 6:
      -[MRUMediaControlsModuleRouteButton sizeThatFits:](self->_upperRoutingButton, "sizeThatFits:", v34, v10 - (v14 + v18), v29);
      v617.origin.CGFloat x = v32;
      v617.origin.CGFloat y = v33;
      v617.size.width = v34;
      v617.size.height = v10 - (v14 + v18);
      CGRectGetMaxX(v617);
      v618.origin.CGFloat x = v32;
      v618.origin.CGFloat y = v33;
      v618.size.width = v34;
      v618.size.height = v10 - (v14 + v18);
      CGRectGetMinY(v618);
      UIRectIntegralWithScale();
      [(MRUMediaControlsModuleNowPlayingView *)self bounds];
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUMediaControlsModuleRouteButton setFrame:](self->_upperRoutingButton, "setFrame:");
      -[MRUMediaControlsModuleRouteButton sizeThatFits:](self->_lowerRoutingButton, "sizeThatFits:", v34, v35);
      v619.origin.CGFloat x = v32;
      v619.origin.CGFloat y = v33;
      v619.size.width = v34;
      v619.size.height = v10 - (v14 + v18);
      CGRectGetMaxY(v619);
      UIRectCenteredXInRect();
      UIRectIntegralWithScale();
      CGFloat v273 = v272;
      CGFloat v275 = v274;
      CGFloat v277 = v276;
      CGFloat v279 = v278;
      -[MRUMediaControlsModuleRouteButton setFrame:](self->_lowerRoutingButton, "setFrame:");
      v620.origin.CGFloat x = v273;
      v620.origin.CGFloat y = v275;
      v620.size.width = v277;
      v620.size.height = v279;
      CGRectGetHeight(v620);
      UIRectInset();
      CGFloat v280 = v621.origin.x;
      CGFloat v281 = v621.origin.y;
      CGFloat v282 = v621.size.width;
      CGFloat v283 = v621.size.height;
      double v284 = CGRectGetWidth(v621);
      v622.origin.CGFloat x = v280;
      v622.origin.CGFloat y = v281;
      v622.size.width = v282;
      v622.size.height = v283;
      double v285 = CGRectGetHeight(v622);
      if (v284 >= v285) {
        double v284 = v285;
      }
      v623.origin.CGFloat x = v280;
      v623.origin.CGFloat y = v281;
      v623.size.width = v282;
      v623.size.height = v283;
      CGRectGetWidth(v623);
      v624.origin.CGFloat x = v280;
      v624.origin.CGFloat y = v281;
      v624.size.width = v282;
      v624.size.height = v283;
      double v286 = CGRectGetHeight(v624);
      if (self->_resizing)
      {
        -[MRUMediaControlsModuleNowPlayingView resizingRatioForForLayout:](self, "resizingRatioForForLayout:", self->_layout, v286);
        double v284 = v284 * v287;
      }
      v625.origin.CGFloat x = v280;
      v625.origin.CGFloat y = v281;
      v625.size.width = v282;
      v625.size.height = v283;
      double v288 = CGRectGetMinX(v625);
      v626.origin.CGFloat x = v280;
      v626.origin.CGFloat y = v281;
      v626.size.width = v282;
      v626.size.height = v283;
      double v289 = CGRectGetMinY(v626);
      -[MRUArtworkView setFrame:](self->_artworkView, "setFrame:", v288, v289, v284, v284);
      v627.origin.CGFloat x = v288;
      v627.origin.CGFloat y = v289;
      v627.size.width = v284;
      v627.size.height = v284;
      CGRectGetHeight(v627);
      UIRectInset();
      CGFloat v291 = v290;
      CGFloat v293 = v292;
      CGFloat v295 = v294;
      CGFloat v297 = v296;
      -[MRUNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v294, v296);
      v628.origin.CGFloat x = v291;
      v628.origin.CGFloat y = v293;
      v628.size.width = v295;
      v628.size.height = v297;
      CGRectGetMinX(v628);
      v629.origin.CGFloat x = v291;
      v629.origin.CGFloat y = v293;
      v629.size.width = v295;
      v629.size.height = v297;
      CGRectGetMinY(v629);
      UIRectIntegralWithScale();
      CGFloat v299 = v298;
      CGFloat v301 = v300;
      CGFloat v303 = v302;
      CGFloat v305 = v304;
      -[MRUNowPlayingHeaderView setFrame:](self->_headerView, "setFrame:");
      v630.origin.CGFloat x = v299;
      v630.origin.CGFloat y = v301;
      v630.size.width = v303;
      v630.size.height = v305;
      CGRectGetHeight(v630);
      UIRectInset();
      CGFloat v307 = v306;
      CGFloat v309 = v308;
      CGFloat v311 = v310;
      CGFloat v313 = v312;
      -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v310, v312);
      v631.origin.CGFloat x = v307;
      v631.origin.CGFloat y = v309;
      v631.size.width = v311;
      v631.size.height = v313;
      CGRectGetMinX(v631);
      v632.origin.CGFloat x = v307;
      v632.origin.CGFloat y = v309;
      v632.size.width = v311;
      v632.size.height = v313;
      CGRectGetMinY(v632);
      UIRectRoundToScale();
      double v315 = v314;
      double v317 = v316;
      double v319 = v318;
      double v321 = v320;
      -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:");
      double v322 = v315;
      double v323 = v317;
      double v324 = v319;
      double v325 = v321;
      goto LABEL_43;
    case 7:
      -[MRUMediaControlsModuleRouteButton sizeThatFits:](self->_upperRoutingButton, "sizeThatFits:", v34, v10 - (v14 + v18), v29);
      v633.origin.CGFloat x = v32;
      v633.origin.CGFloat y = v33;
      v633.size.width = v34;
      v633.size.height = v10 - (v14 + v18);
      CGRectGetMaxX(v633);
      v634.origin.CGFloat x = v32;
      v634.origin.CGFloat y = v33;
      v634.size.width = v34;
      v634.size.height = v10 - (v14 + v18);
      CGRectGetMinY(v634);
      UIRectIntegralWithScale();
      [(MRUMediaControlsModuleNowPlayingView *)self bounds];
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUMediaControlsModuleRouteButton setFrame:](self->_upperRoutingButton, "setFrame:");
      v635.origin.CGFloat x = v32;
      v635.origin.CGFloat y = v33;
      v635.size.width = v34;
      v635.size.height = v10 - (v14 + v18);
      double v326 = CGRectGetWidth(v635);
      v636.origin.CGFloat x = v32;
      v636.origin.CGFloat y = v33;
      v636.size.width = v34;
      v636.size.height = v35;
      double v327 = CGRectGetHeight(v636);
      if (v326 >= v327) {
        double v326 = v327;
      }
      v637.origin.CGFloat x = v32;
      v637.origin.CGFloat y = v33;
      v637.size.width = v34;
      v637.size.height = v35;
      CGRectGetWidth(v637);
      v638.origin.CGFloat x = v32;
      v638.origin.CGFloat y = v33;
      v638.size.width = v34;
      v638.size.height = v35;
      CGRectGetHeight(v638);
      v639.origin.CGFloat x = v32;
      v639.origin.CGFloat y = v33;
      v639.size.width = v34;
      v639.size.height = v35;
      double v328 = CGRectGetMinX(v639);
      v640.origin.CGFloat x = v32;
      v640.origin.CGFloat y = v33;
      v640.size.width = v34;
      v640.size.height = v35;
      double v329 = CGRectGetMinY(v640);
      -[MRUArtworkView setFrame:](self->_artworkView, "setFrame:", v328, v329, v326, v326);
      double v330 = v530;
      if (self->_showSuggestionsView) {
        double v331 = v526;
      }
      else {
        double v331 = v326;
      }
      if (self->_showSuggestionsView) {
        double v332 = v524;
      }
      else {
        double v332 = v326;
      }
      double v333 = v533;
      if (!self->_showSuggestionsView)
      {
        double v333 = v328;
        double v330 = v329;
      }
      CGRectGetWidth(*(CGRect *)(&v330 - 1));
      UIRectInset();
      CGFloat v335 = v334;
      CGFloat v337 = v336;
      CGFloat v339 = v338;
      CGFloat v341 = v340;
      -[MRUMediaControlsModuleRouteButton sizeThatFits:](self->_lowerRoutingButton, "sizeThatFits:", v338, v340);
      v641.origin.CGFloat x = v335;
      v641.origin.CGFloat y = v337;
      v641.size.width = v339;
      v641.size.height = v341;
      CGRectGetMaxY(v641);
      UIRectCenteredXInRect();
      UIRectIntegralWithScale();
      CGFloat v343 = v342;
      CGFloat v345 = v344;
      CGFloat v347 = v346;
      CGFloat v349 = v348;
      -[MRUMediaControlsModuleRouteButton setFrame:](self->_lowerRoutingButton, "setFrame:");
      v642.origin.CGFloat x = v343;
      v642.origin.CGFloat y = v345;
      v642.size.width = v347;
      v642.size.height = v349;
      CGRectGetHeight(v642);
      UIRectInset();
      CGFloat v351 = v350;
      CGFloat v353 = v352;
      CGFloat v355 = v354;
      CGFloat v357 = v356;
      -[MRUNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v354, v356);
      v643.origin.CGFloat x = v351;
      v643.origin.CGFloat y = v353;
      v643.size.width = v355;
      v643.size.height = v357;
      CGRectGetMinX(v643);
      v644.origin.CGFloat x = v351;
      v644.origin.CGFloat y = v353;
      v644.size.width = v355;
      v644.size.height = v357;
      CGRectGetMinY(v644);
      v645.origin.CGFloat x = v351;
      v645.origin.CGFloat y = v353;
      v645.size.width = v355;
      v645.size.height = v357;
      CGRectGetWidth(v645);
      UIRectIntegralWithScale();
      CGFloat v359 = v358;
      CGFloat v361 = v360;
      CGFloat v363 = v362;
      CGFloat v365 = v364;
      -[MRUNowPlayingHeaderView setFrame:](self->_headerView, "setFrame:");
      v646.origin.CGFloat x = v359;
      v646.origin.CGFloat y = v361;
      v646.size.width = v363;
      v646.size.height = v365;
      CGRectGetHeight(v646);
      UIRectInset();
      CGFloat v367 = v366;
      CGFloat v369 = v368;
      CGFloat v371 = v370;
      CGFloat v373 = v372;
      -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v370, v372);
      double v375 = v374;
      double v377 = v376;
      v647.origin.CGFloat x = v367;
      v647.origin.CGFloat y = v369;
      v647.size.width = v371;
      v647.size.height = v373;
      double v378 = CGRectGetMinX(v647);
      v648.origin.CGFloat x = v367;
      v648.origin.CGFloat y = v369;
      v648.size.width = v371;
      v648.size.height = v373;
      double v379 = CGRectGetMinY(v648);
      -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:", v378, v379, v375, v377);
      double v322 = v378;
      double v323 = v379;
      double v324 = v375;
      double v325 = v377;
LABEL_43:
      CGRectGetHeight(*(CGRect *)&v322);
      UIRectInset();
      CGFloat v381 = v380;
      CGFloat v383 = v382;
      CGFloat v385 = v384;
      CGFloat v387 = v386;
      -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v384, v386);
      v649.origin.CGFloat x = v381;
      v649.origin.CGFloat y = v383;
      v649.size.width = v385;
      v649.size.height = v387;
      CGRectGetMinX(v649);
      v650.origin.CGFloat x = v381;
      v650.origin.CGFloat y = v383;
      v650.size.width = v385;
      v650.size.height = v387;
      CGRectGetMaxY(v650);
      UIRectRoundToScale();
      CGFloat v389 = v388;
      CGFloat v391 = v390;
      CGFloat v393 = v392;
      CGFloat v395 = v394;
      -[MRUNowPlayingVolumeControlsView setFrame:](self->_volumeControlsView, "setFrame:");
      v651.origin.CGFloat x = v389;
      v651.origin.CGFloat y = v391;
      v651.size.width = v393;
      v651.size.height = v395;
      CGRectGetHeight(v651);
LABEL_44:
      UIRectInset();
      CGFloat v397 = v396;
      CGFloat v399 = v398;
      CGFloat v401 = v400;
      CGFloat v403 = v402;
      p_headerView = (id *)&self->_transportControlsView;
      -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v400, v402);
      v652.origin.CGFloat x = v397;
      v652.origin.CGFloat y = v399;
      v652.size.width = v401;
      v652.size.height = v403;
      CGRectGetMinX(v652);
      UIRectCenteredYInRect();
      goto LABEL_56;
    case 8:
      -[MRUMediaControlsModuleRouteButton sizeThatFits:](self->_upperRoutingButton, "sizeThatFits:", v34, v10 - (v14 + v18), v29);
      v653.origin.CGFloat x = v32;
      v653.origin.CGFloat y = v33;
      v653.size.width = v34;
      v653.size.height = v10 - (v14 + v18);
      CGRectGetMaxX(v653);
      v654.origin.CGFloat x = v32;
      v654.origin.CGFloat y = v33;
      v654.size.width = v34;
      v654.size.height = v10 - (v14 + v18);
      CGRectGetMinY(v654);
      UIRectIntegralWithScale();
      [(MRUMediaControlsModuleNowPlayingView *)self bounds];
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUMediaControlsModuleRouteButton setFrame:](self->_upperRoutingButton, "setFrame:");
      -[MRUMediaControlsModuleRouteButton sizeThatFits:](self->_lowerRoutingButton, "sizeThatFits:", v34, v35);
      v655.origin.CGFloat x = v32;
      v655.origin.CGFloat y = v33;
      v655.size.width = v34;
      v655.size.height = v10 - (v14 + v18);
      CGRectGetMaxY(v655);
      UIRectCenteredXInRect();
      UIRectIntegralWithScale();
      -[MRUMediaControlsModuleRouteButton setFrame:](self->_lowerRoutingButton, "setFrame:");
      -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v34, v35);
      v656.origin.CGFloat x = v32;
      v656.origin.CGFloat y = v33;
      v656.size.width = v34;
      v656.size.height = v10 - (v14 + v18);
      CGRectGetMinX(v656);
      v657.origin.CGFloat x = v32;
      v657.origin.CGFloat y = v33;
      v657.size.width = v34;
      v657.size.height = v10 - (v14 + v18);
      CGRectGetMaxY(v657);
      UIRectRoundToScale();
      CGFloat v405 = v404;
      CGFloat v407 = v406;
      CGFloat v409 = v408;
      CGFloat v411 = v410;
      -[MRUNowPlayingVolumeControlsView setFrame:](self->_volumeControlsView, "setFrame:");
      v658.origin.CGFloat x = v405;
      v658.origin.CGFloat y = v407;
      v658.size.width = v409;
      v658.size.height = v411;
      CGRectGetHeight(v658);
      UIRectInset();
      CGFloat v413 = v412;
      CGFloat v415 = v414;
      CGFloat v417 = v416;
      CGFloat v419 = v418;
      -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v416, v418);
      double v421 = v420;
      double v423 = v422;
      v659.origin.CGFloat x = v413;
      v659.origin.CGFloat y = v415;
      v659.size.width = v417;
      v659.size.height = v419;
      double v424 = CGRectGetMinX(v659);
      v660.origin.CGFloat x = v413;
      v660.origin.CGFloat y = v415;
      v660.size.width = v417;
      v660.size.height = v419;
      CGFloat v425 = CGRectGetMaxY(v660);
      CGFloat v426 = v425 - v423;
      -[MRUNowPlayingTransportControlsView setFrame:](self->_transportControlsView, "setFrame:", v424, v425 - v423, v421, v423);
      v661.origin.CGFloat x = v424;
      v661.origin.CGFloat y = v426;
      v661.size.width = v421;
      v661.size.height = v423;
      CGRectGetHeight(v661);
      UIRectInset();
      CGFloat v428 = v427;
      CGFloat v430 = v429;
      CGFloat v432 = v431;
      CGFloat v434 = v433;
      -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v431, v433);
      v662.origin.CGFloat x = v428;
      v662.origin.CGFloat y = v430;
      v662.size.width = v432;
      v662.size.height = v434;
      CGRectGetMinX(v662);
      v663.origin.CGFloat x = v428;
      v663.origin.CGFloat y = v430;
      v663.size.width = v432;
      v663.size.height = v434;
      CGRectGetMaxY(v663);
      UIRectRoundToScale();
      CGFloat v436 = v435;
      CGFloat v438 = v437;
      CGFloat v440 = v439;
      CGFloat v442 = v441;
      -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:");
      v664.origin.CGFloat x = v436;
      v664.origin.CGFloat y = v438;
      v664.size.width = v440;
      v664.size.height = v442;
      CGRectGetHeight(v664);
      UIRectInset();
      CGFloat v443 = v665.origin.x;
      CGFloat v444 = v665.origin.y;
      CGFloat v445 = v665.size.width;
      CGFloat v446 = v665.size.height;
      double v447 = CGRectGetWidth(v665);
      v666.origin.CGFloat x = v443;
      v666.origin.CGFloat y = v444;
      v666.size.width = v445;
      v666.size.height = v446;
      double v448 = CGRectGetHeight(v666);
      if (v447 >= v448) {
        double v447 = v448;
      }
      v667.origin.CGFloat x = v443;
      v667.origin.CGFloat y = v444;
      v667.size.width = v445;
      v667.size.height = v446;
      double v449 = CGRectGetWidth(v667);
      v668.origin.CGFloat x = v443;
      v668.origin.CGFloat y = v444;
      v668.size.width = v445;
      v668.size.height = v446;
      double v450 = CGRectGetHeight(v668);
      if (v449 >= v450) {
        double v449 = v450;
      }
      goto LABEL_54;
    case 9:
      -[MRUMediaControlsModuleRouteButton sizeThatFits:](self->_upperRoutingButton, "sizeThatFits:", v34, v10 - (v14 + v18), v29);
      v669.origin.CGFloat x = v32;
      v669.origin.CGFloat y = v33;
      v669.size.width = v34;
      v669.size.height = v10 - (v14 + v18);
      CGRectGetMaxX(v669);
      v670.origin.CGFloat x = v32;
      v670.origin.CGFloat y = v33;
      v670.size.width = v34;
      v670.size.height = v10 - (v14 + v18);
      CGRectGetMinY(v670);
      UIRectIntegralWithScale();
      [(MRUMediaControlsModuleNowPlayingView *)self bounds];
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUMediaControlsModuleRouteButton setFrame:](self->_upperRoutingButton, "setFrame:");
      -[MRUMediaControlsModuleRouteButton sizeThatFits:](self->_lowerRoutingButton, "sizeThatFits:", v34, v35);
      v671.origin.CGFloat x = v32;
      v671.origin.CGFloat y = v33;
      v671.size.width = v34;
      v671.size.height = v10 - (v14 + v18);
      CGRectGetMaxY(v671);
      UIRectCenteredXInRect();
      UIRectIntegralWithScale();
      CGFloat v452 = v451;
      CGFloat v454 = v453;
      CGFloat v456 = v455;
      CGFloat v458 = v457;
      -[MRUMediaControlsModuleRouteButton setFrame:](self->_lowerRoutingButton, "setFrame:");
      v672.origin.CGFloat x = v452;
      v672.origin.CGFloat y = v454;
      v672.size.width = v456;
      v672.size.height = v458;
      CGRectGetHeight(v672);
      UIRectInset();
      CGFloat v460 = v459;
      CGFloat v462 = v461;
      CGFloat v464 = v463;
      CGFloat v466 = v465;
      -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v463, v465);
      v673.origin.CGFloat x = v460;
      v673.origin.CGFloat y = v462;
      v673.size.width = v464;
      v673.size.height = v466;
      CGRectGetMinX(v673);
      v674.origin.CGFloat x = v460;
      v674.origin.CGFloat y = v462;
      v674.size.width = v464;
      v674.size.height = v466;
      CGRectGetMaxY(v674);
      UIRectRoundToScale();
      CGFloat v468 = v467;
      CGFloat v470 = v469;
      CGFloat v472 = v471;
      CGFloat v474 = v473;
      -[MRUNowPlayingVolumeControlsView setFrame:](self->_volumeControlsView, "setFrame:");
      v675.origin.CGFloat x = v468;
      v675.origin.CGFloat y = v470;
      v675.size.width = v472;
      v675.size.height = v474;
      CGRectGetHeight(v675);
      UIRectInset();
      CGFloat v476 = v475;
      CGFloat v478 = v477;
      CGFloat v480 = v479;
      CGFloat v482 = v481;
      -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v479, v481);
      double v484 = v483;
      double v486 = v485;
      v676.origin.CGFloat x = v476;
      v676.origin.CGFloat y = v478;
      v676.size.width = v480;
      v676.size.height = v482;
      double v487 = CGRectGetMinX(v676);
      v677.origin.CGFloat x = v476;
      v677.origin.CGFloat y = v478;
      v677.size.width = v480;
      v677.size.height = v482;
      CGFloat v488 = CGRectGetMaxY(v677);
      CGFloat v489 = v488 - v486;
      -[MRUNowPlayingTransportControlsView setFrame:](self->_transportControlsView, "setFrame:", v487, v488 - v486, v484, v486);
      v678.origin.CGFloat x = v487;
      v678.origin.CGFloat y = v489;
      v678.size.width = v484;
      v678.size.height = v486;
      CGRectGetHeight(v678);
      UIRectInset();
      CGFloat v491 = v490;
      CGFloat v493 = v492;
      CGFloat v495 = v494;
      CGFloat v497 = v496;
      -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v494, v496);
      v679.origin.CGFloat x = v491;
      v679.origin.CGFloat y = v493;
      v679.size.width = v495;
      v679.size.height = v497;
      CGRectGetMinX(v679);
      v680.origin.CGFloat x = v491;
      v680.origin.CGFloat y = v493;
      v680.size.width = v495;
      v680.size.height = v497;
      CGRectGetMaxY(v680);
      UIRectRoundToScale();
      CGFloat v499 = v498;
      CGFloat v501 = v500;
      CGFloat v503 = v502;
      CGFloat v505 = v504;
      -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:");
      v681.origin.CGFloat x = v499;
      v681.origin.CGFloat y = v501;
      v681.size.width = v503;
      v681.size.height = v505;
      CGRectGetHeight(v681);
      UIRectInset();
      CGFloat v443 = v682.origin.x;
      CGFloat v444 = v682.origin.y;
      CGFloat v445 = v682.size.width;
      CGFloat v446 = v682.size.height;
      double v447 = CGRectGetWidth(v682);
      v683.origin.CGFloat x = v443;
      v683.origin.CGFloat y = v444;
      v683.size.width = v445;
      v683.size.height = v446;
      double v506 = CGRectGetHeight(v683);
      if (v447 >= v506) {
        double v447 = v506;
      }
      v684.origin.CGFloat x = v443;
      v684.origin.CGFloat y = v444;
      v684.size.width = v445;
      v684.size.height = v446;
      double v449 = CGRectGetWidth(v684);
      v685.origin.CGFloat x = v443;
      v685.origin.CGFloat y = v444;
      v685.size.width = v445;
      v685.size.height = v446;
      double v507 = CGRectGetHeight(v685);
      if (v449 >= v507) {
        double v449 = v507;
      }
LABEL_54:
      v686.origin.CGFloat x = v443;
      v686.origin.CGFloat y = v444;
      v686.size.width = v445;
      v686.size.height = v446;
      CGFloat v508 = CGRectGetMinX(v686);
      v687.origin.CGFloat x = v443;
      v687.origin.CGFloat y = v444;
      v687.size.width = v445;
      v687.size.height = v446;
      CGFloat v509 = CGRectGetMinY(v687);
      [(MRUMediaControlsModuleNowPlayingView *)self bounds];
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUArtworkView setFrame:](self->_artworkView, "setFrame:");
      v688.origin.CGFloat x = v508;
      v688.origin.CGFloat y = v509;
      v688.size.width = v447;
      v688.size.height = v449;
      CGRectGetWidth(v688);
      UIRectInset();
      CGFloat v511 = v510;
      CGFloat v513 = v512;
      CGFloat v515 = v514;
      CGFloat v517 = v516;
      p_headerView = (id *)&self->_headerView;
      -[MRUNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v514, v516);
      v689.origin.CGFloat x = v511;
      v689.origin.CGFloat y = v513;
      v689.size.width = v515;
      v689.size.height = v517;
      CGRectGetMinX(v689);
      v690.origin.CGFloat x = v511;
      v690.origin.CGFloat y = v513;
      v690.size.width = v515;
      v690.size.height = v517;
      CGRectGetWidth(v690);
      UIRectCenteredYInRect();
      UIRectIntegralWithScale();
LABEL_55:
      [(MRUMediaControlsModuleNowPlayingView *)self bounds];
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
LABEL_56:
      objc_msgSend(*p_headerView, "setFrame:");
      break;
    default:
      break;
  }
  if (self->_resizing) {
    [(MRUMediaControlsModuleNowPlayingView *)self updateVisibility];
  }
}

- (CGSize)sizeThatFits:(CGSize)result
{
  CGFloat width = result.width;
  if (self->_layout == 8)
  {
    CGFloat v5 = self->_contentEdgeInsets.top + self->_contentEdgeInsets.bottom;
    CGFloat v6 = result.width - (self->_contentEdgeInsets.left + self->_contentEdgeInsets.right);
    CGFloat v7 = result.height - v5;
    -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v6, result.height - v5);
    CGFloat v9 = v7 - (v8 + 7.0);
    CGFloat v10 = v5 + v8 + 7.0;
    -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v6, v9);
    double v12 = v11 + 7.0;
    CGFloat v13 = v9 - (v11 + 7.0);
    CGFloat v14 = v10 + v12;
    -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v6, v13);
    CGFloat v16 = v14 + v15 + 7.0;
    [(MRUMediaControlsModuleNowPlayingView *)self contentScaleFactor];
    MRUCGSizeMultiply(45.0, 45.0, v17);
    result.height = v16 + v18;
  }
  double v19 = width;
  result.CGFloat width = v19;
  return result;
}

- (void)setLayout:(int64_t)a3
{
  if (self->_layout != a3)
  {
    self->_layout = a3;
    [(MRUMediaControlsModuleNowPlayingView *)self updateOnScreen];
    [(MRUMediaControlsModuleNowPlayingView *)self updateLayout];
    [(MRUMediaControlsModuleNowPlayingView *)self updateVisibility];
  }
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentEdgeInsets.left
    || a3.top != self->_contentEdgeInsets.top
    || a3.right != self->_contentEdgeInsets.right
    || a3.bottom != self->_contentEdgeInsets.bottom)
  {
    self->_contentEdgeInsets = a3;
    [(MRUMediaControlsModuleNowPlayingView *)self setNeedsLayout];
  }
}

- (void)setStylingProvider:(id)a3
{
  CGFloat v5 = (MRUVisualStylingProvider *)a3;
  if (self->_stylingProvider != v5)
  {
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    [(MRUArtworkView *)self->_artworkView setStylingProvider:v5];
    [(MRUNowPlayingHeaderView *)self->_headerView setStylingProvider:v5];
    [(MRUNowPlayingTimeControlsView *)self->_timeControlsView setStylingProvider:v5];
    [(MRUNowPlayingTransportControlsView *)self->_transportControlsView setStylingProvider:v5];
    [(MRUNowPlayingVolumeControlsView *)self->_volumeControlsView setStylingProvider:v5];
    [(MRUTransportButton *)self->_upperRoutingButton setStylingProvider:v5];
    [(MRUTransportButton *)self->_lowerRoutingButton setStylingProvider:v5];
  }
}

- (void)setSuggestionsView:(id)a3
{
  CGFloat v5 = (MRUMediaSuggestionsView *)a3;
  suggestionsView = self->_suggestionsView;
  if (suggestionsView != v5)
  {
    [(MRUMediaSuggestionsView *)suggestionsView removeFromSuperview];
    objc_storeStrong((id *)&self->_suggestionsView, a3);
    [(MRUMediaControlsModuleNowPlayingView *)self contentScaleFactor];
    -[MRUMediaSuggestionsView setContentScale:](self->_suggestionsView, "setContentScale:");
    [(MRUMediaControlsModuleNowPlayingView *)self addSubview:v5];
    CGFloat v7 = (void *)MEMORY[0x1E4FB1EB0];
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    CGFloat v10 = __59__MRUMediaControlsModuleNowPlayingView_setSuggestionsView___block_invoke;
    double v11 = &unk_1E5F0D8E8;
    double v12 = v5;
    CGFloat v13 = self;
    [v7 performWithoutAnimation:&v8];
    [(MRUMediaControlsModuleNowPlayingView *)self updateVisibility];
    [(MRUMediaControlsModuleNowPlayingView *)self setNeedsLayout];
  }
}

uint64_t __59__MRUMediaControlsModuleNowPlayingView_setSuggestionsView___block_invoke(uint64_t a1)
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
    [(MRUMediaControlsModuleNowPlayingView *)self updateOnScreen];
  }
}

- (void)setShowSuggestionsView:(BOOL)a3
{
  if (self->_showSuggestionsView != a3)
  {
    self->_showSuggestionsView = a3;
    [(MRUMediaControlsModuleNowPlayingView *)self updateVisibility];
    [(MRUMediaControlsModuleNowPlayingView *)self setNeedsLayout];
  }
}

- (void)setContentMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_contentMetrics, a3);
  id v5 = a3;
  [(MRUMediaControlsModuleNowPlayingView *)self contentScaleFactor];
  double v7 = v6;
  -[MRUNowPlayingTransportControlsView setContentScale:](self->_transportControlsView, "setContentScale:");
  [(MRUNowPlayingHeaderView *)self->_headerView setContentScale:v7];
  [(MRUMediaControlsModuleRouteButton *)self->_upperRoutingButton setContentScale:v7];
  [(MRUMediaControlsModuleRouteButton *)self->_lowerRoutingButton setContentScale:v7];
  [(MRUNowPlayingTimeControlsView *)self->_timeControlsView setContentScale:v7];
  [(MRUMediaControlsModuleRouteButton *)self->_lowerRoutingButton setContentScale:v7];
  [(MRUNowPlayingVolumeControlsView *)self->_volumeControlsView setContentScale:v7];
  [(MRUArtworkView *)self->_artworkView setContentScale:v7];
  [(MRUMediaSuggestionsView *)self->_suggestionsView setContentScale:v7];

  [(MRUMediaControlsModuleNowPlayingView *)self setNeedsLayout];
}

- (void)setResizing:(BOOL)a3
{
  self->_resizing = a3;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__MRUMediaControlsModuleNowPlayingView_setResizing___block_invoke;
  v3[3] = &unk_1E5F0D7F8;
  v3[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v3 animations:0.25];
}

uint64_t __52__MRUMediaControlsModuleNowPlayingView_setResizing___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateVisibility];
}

- (double)contentScaleFactor
{
  contentMetrics = self->_contentMetrics;
  if (!contentMetrics) {
    return 1.0;
  }
  [(CCUIModuleContentMetrics *)contentMetrics symbolScaleFactor];
  return result;
}

- (void)updateLayout
{
  switch(self->_layout)
  {
    case 0:
      [(MRUArtworkView *)self->_artworkView setStyle:11];
      uint64_t v4 = 4;
      [(MRUNowPlayingHeaderView *)self->_headerView setLayout:4];
      double v3 = [(MRUNowPlayingHeaderView *)self->_headerView labelView];
      [v3 setLayout:5];
      goto LABEL_8;
    case 1:
    case 2:
      [(MRUArtworkView *)self->_artworkView setStyle:11];
      uint64_t v5 = 3;
      [(MRUNowPlayingHeaderView *)self->_headerView setLayout:3];
      double v3 = [(MRUNowPlayingHeaderView *)self->_headerView labelView];
      [v3 setLayout:5];
      uint64_t v4 = 7;
      goto LABEL_9;
    case 3:
      [(MRUArtworkView *)self->_artworkView setStyle:12];
      [(MRUNowPlayingHeaderView *)self->_headerView setLayout:4];
      double v3 = [(MRUNowPlayingHeaderView *)self->_headerView labelView];
      [v3 setLayout:4];
      uint64_t v4 = 5;
      goto LABEL_8;
    case 4:
      [(MRUArtworkView *)self->_artworkView setStyle:13];
      uint64_t v5 = 4;
      [(MRUNowPlayingHeaderView *)self->_headerView setLayout:4];
      double v3 = [(MRUNowPlayingHeaderView *)self->_headerView labelView];
      [v3 setLayout:5];
      uint64_t v4 = 6;
      goto LABEL_9;
    case 5:
    case 6:
    case 8:
    case 9:
      [(MRUArtworkView *)self->_artworkView setStyle:2];
      [(MRUNowPlayingHeaderView *)self->_headerView setLayout:4];
      double v3 = [(MRUNowPlayingHeaderView *)self->_headerView labelView];
      [v3 setLayout:5];
      uint64_t v4 = 7;
      goto LABEL_8;
    case 7:
      [(MRUArtworkView *)self->_artworkView setStyle:2];
      [(MRUNowPlayingHeaderView *)self->_headerView setLayout:4];
      double v3 = [(MRUNowPlayingHeaderView *)self->_headerView labelView];
      [v3 setLayout:5];
      uint64_t v4 = 8;
LABEL_8:
      uint64_t v5 = 3;
LABEL_9:

      [(MRUNowPlayingTimeControlsView *)self->_timeControlsView setLayout:v5];
      [(MRUNowPlayingTransportControlsView *)self->_transportControlsView setLayout:v4];
      volumeControlsView = self->_volumeControlsView;
      [(MRUNowPlayingVolumeControlsView *)volumeControlsView setLayout:0];
      break;
    default:
      return;
  }
}

- (void)updateOnScreen
{
  unint64_t layout = self->_layout;
  if (layout <= 9)
  {
    if (((1 << layout) & 0x3F0) != 0)
    {
      BOOL onScreen = self->_onScreen;
      uint64_t v5 = [(MRUNowPlayingHeaderView *)self->_headerView labelView];
      [v5 setMarqueeEnabled:onScreen];

      BOOL v6 = self->_onScreen;
    }
    else
    {
      if (((1 << layout) & 6) != 0)
      {
        double v7 = [(MRUNowPlayingHeaderView *)self->_headerView labelView];
        [v7 setMarqueeEnabled:0];

        [(MRUNowPlayingTimeControlsView *)self->_timeControlsView setOnScreen:0];
      }
      BOOL v8 = self->_onScreen;
      uint64_t v9 = [(MRUNowPlayingHeaderView *)self->_headerView labelView];
      [v9 setMarqueeEnabled:v8];

      BOOL v6 = 0;
    }
    timeControlsView = self->_timeControlsView;
    [(MRUNowPlayingTimeControlsView *)timeControlsView setOnScreen:v6];
  }
}

- (void)updateVisibility
{
  if (self->_resizing)
  {
    [(MRUMediaControlsModuleNowPlayingView *)self resizingRatioForForLayout:self->_layout];
    double v4 = v3;
    double v6 = v5;
    -[MRUMediaControlsModuleNowPlayingView resizingAlphaWithRatio:](self, "resizingAlphaWithRatio:");
    double v8 = v7;
    if (v4 >= v6) {
      double v9 = v6;
    }
    else {
      double v9 = v4;
    }
    if (v4 >= v6) {
      double v10 = v4;
    }
    else {
      double v10 = v6;
    }
    if (v10 > 1.05 || v9 < 0.95) {
      double v12 = 1.0;
    }
    else {
      double v12 = 0.0;
    }
    CGFloat v13 = [(MRUMediaControlsModuleNowPlayingView *)self backdropView];
    [v13 alpha];
    double v15 = v14;

    if (v15 != v12)
    {
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __56__MRUMediaControlsModuleNowPlayingView_updateVisibility__block_invoke;
      v25[3] = &unk_1E5F0DBF8;
      v25[4] = self;
      *(double *)&v25[5] = v12;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v25 options:0 animations:0.25 completion:0.0];
    }
  }
  else
  {
    double v8 = 1.0;
  }
  switch(self->_layout)
  {
    case 0:
    case 3:
      [(MRUArtworkView *)self->_artworkView setAlpha:1.0];
      [(MRUNowPlayingHeaderView *)self->_headerView setAlpha:v8];
      double v16 = 0.0;
      [(MRUNowPlayingTimeControlsView *)self->_timeControlsView setAlpha:0.0];
      [(MRUNowPlayingTransportControlsView *)self->_transportControlsView setAlpha:1.0];
      volumeControlsView = self->_volumeControlsView;
      goto LABEL_21;
    case 1:
    case 2:
      [(MRUArtworkView *)self->_artworkView setAlpha:1.0];
      [(MRUNowPlayingHeaderView *)self->_headerView setAlpha:1.0];
      double v16 = 0.0;
      [(MRUNowPlayingTimeControlsView *)self->_timeControlsView setAlpha:0.0];
      [(MRUNowPlayingTransportControlsView *)self->_transportControlsView setAlpha:0.0];
      [(MRUNowPlayingVolumeControlsView *)self->_volumeControlsView setAlpha:0.0];
      goto LABEL_44;
    case 4:
      [(MRUArtworkView *)self->_artworkView setAlpha:1.0];
      [(MRUNowPlayingHeaderView *)self->_headerView setAlpha:v8];
      [(MRUNowPlayingTimeControlsView *)self->_timeControlsView setAlpha:v8];
      [(MRUNowPlayingTransportControlsView *)self->_transportControlsView setAlpha:1.0];
      volumeControlsView = self->_volumeControlsView;
      double v16 = 0.0;
LABEL_21:
      [(MRUNowPlayingVolumeControlsView *)volumeControlsView setAlpha:0.0];
      double v18 = v8;
      goto LABEL_45;
    case 5:
      [(MRUArtworkView *)self->_artworkView setAlpha:1.0];
      [(MRUNowPlayingHeaderView *)self->_headerView setAlpha:1.0];
      [(MRUNowPlayingTimeControlsView *)self->_timeControlsView setAlpha:v8];
      [(MRUNowPlayingTransportControlsView *)self->_transportControlsView setAlpha:1.0];
      double v19 = self->_volumeControlsView;
      double v20 = v8;
      goto LABEL_42;
    case 6:
      double v18 = 0.0;
      double v16 = 1.0;
      if (self->_showSuggestionsView) {
        double v21 = 0.0;
      }
      else {
        double v21 = 1.0;
      }
      [(MRUArtworkView *)self->_artworkView setAlpha:v21];
      if (self->_showSuggestionsView) {
        double v22 = 0.0;
      }
      else {
        double v22 = v8;
      }
      [(MRUNowPlayingHeaderView *)self->_headerView setAlpha:v22];
      if (self->_showSuggestionsView) {
        double v23 = 0.0;
      }
      else {
        double v23 = v8;
      }
      [(MRUNowPlayingTimeControlsView *)self->_timeControlsView setAlpha:v23];
      [(MRUNowPlayingTransportControlsView *)self->_transportControlsView setAlpha:1.0];
      [(MRUNowPlayingVolumeControlsView *)self->_volumeControlsView setAlpha:v8];
      if (!self->_showSuggestionsView) {
        double v16 = 0.0;
      }
      goto LABEL_46;
    case 7:
      double v18 = 0.0;
      double v8 = 1.0;
      if (self->_showSuggestionsView) {
        double v24 = 0.0;
      }
      else {
        double v24 = 1.0;
      }
      [(MRUArtworkView *)self->_artworkView setAlpha:v24];
      [(MRUNowPlayingHeaderView *)self->_headerView setAlpha:1.0];
      [(MRUNowPlayingTimeControlsView *)self->_timeControlsView setAlpha:1.0];
      [(MRUNowPlayingTransportControlsView *)self->_transportControlsView setAlpha:1.0];
      [(MRUNowPlayingVolumeControlsView *)self->_volumeControlsView setAlpha:1.0];
      if (self->_showSuggestionsView) {
        double v16 = 1.0;
      }
      else {
        double v16 = 0.0;
      }
      goto LABEL_46;
    case 8:
      [(MRUArtworkView *)self->_artworkView setAlpha:1.0];
      [(MRUNowPlayingHeaderView *)self->_headerView setAlpha:1.0];
      [(MRUNowPlayingTimeControlsView *)self->_timeControlsView setAlpha:1.0];
      [(MRUNowPlayingTransportControlsView *)self->_transportControlsView setAlpha:1.0];
      [(MRUNowPlayingVolumeControlsView *)self->_volumeControlsView setAlpha:1.0];
      double v16 = 0.0;
LABEL_44:
      double v18 = 0.0;
LABEL_45:
      double v8 = 0.0;
      goto LABEL_46;
    case 9:
      double v8 = 1.0;
      [(MRUArtworkView *)self->_artworkView setAlpha:1.0];
      [(MRUNowPlayingHeaderView *)self->_headerView setAlpha:1.0];
      [(MRUNowPlayingTimeControlsView *)self->_timeControlsView setAlpha:1.0];
      [(MRUNowPlayingTransportControlsView *)self->_transportControlsView setAlpha:1.0];
      double v19 = self->_volumeControlsView;
      double v20 = 1.0;
LABEL_42:
      [(MRUNowPlayingVolumeControlsView *)v19 setAlpha:v20];
      double v16 = 0.0;
      double v18 = 0.0;
LABEL_46:
      [(MRUMediaSuggestionsView *)self->_suggestionsView setAlpha:v16];
      [(MRUMediaControlsModuleRouteButton *)self->_upperRoutingButton setAlpha:v18];
      [(MRUMediaControlsModuleRouteButton *)self->_lowerRoutingButton setAlpha:v8];
      break;
    default:
      return;
  }
}

void __56__MRUMediaControlsModuleNowPlayingView_updateVisibility__block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) backdropView];
  [v2 setAlpha:v1];
}

- (CGRect)suggestionsFrame
{
  [(MRUMediaControlsModuleNowPlayingView *)self bounds];
  CGFloat v7 = v3;
  CGFloat v8 = v4;
  CGFloat v9 = v5;
  CGFloat v10 = v6;
  if (self->_layout == 7)
  {
    CGRectGetMinX(*(CGRect *)&v3);
    v23.origin.CGFloat x = v7;
    v23.origin.CGFloat y = v8;
    v23.size.CGFloat width = v9;
    v23.size.height = v10;
    CGRectGetMinY(v23);
    v24.origin.CGFloat x = v7;
    v24.origin.CGFloat y = v8;
    v24.size.CGFloat width = v9;
    v24.size.height = v10;
    CGRectGetWidth(v24);
    v25.origin.CGFloat x = v7;
    v25.origin.CGFloat y = v8;
    v25.size.CGFloat width = v9;
    v25.size.height = v10;
    CGRectGetHeight(v25);
    [(MRUMediaControlsModuleNowPlayingView *)self bounds];
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    CGFloat MinX = v12;
    double v15 = v14;
    double v17 = v16;
  }
  else
  {
    -[MRUMediaSuggestionsView sizeThatFits:](self->_suggestionsView, "sizeThatFits:", v5, v6);
    double v15 = v18;
    double v17 = v19;
    v26.origin.CGFloat x = v7;
    v26.origin.CGFloat y = v8;
    v26.size.CGFloat width = v9;
    v26.size.height = v10;
    CGFloat MinX = CGRectGetMinX(v26);
    v27.origin.CGFloat x = v7;
    v27.origin.CGFloat y = v8;
    v27.size.CGFloat width = v9;
    v27.size.height = v10;
    double MinY = CGRectGetMinY(v27);
  }
  double v20 = MinX;
  double v21 = v15;
  double v22 = v17;
  result.size.height = v22;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = MinY;
  result.origin.CGFloat x = v20;
  return result;
}

- (CGPoint)resizingRatioForForLayout:(int64_t)a3
{
  contentMetrics = self->_contentMetrics;
  if (contentMetrics) {
    [(CCUIModuleContentMetrics *)contentMetrics gridGeometryInfo];
  }
  else {
    double v6 = MEMORY[0x1B3E725A0](0, a2);
  }
  double v7 = v6;
  CGFloat v8 = self->_contentMetrics;
  if (v8)
  {
    [(CCUIModuleContentMetrics *)v8 gridGeometryInfo];
    double v10 = v9;
  }
  else
  {
    CCUILayoutGutter();
    double v10 = v11;
  }
  uint64_t v12 = MRUMediaControlsModuleGridSizeClassForLayout(a3);
  __int16 v13 = CCUINumberOfRowsForGridSizeClass();
  unsigned int v14 = CCUINumberOfColumnsForGridSizeClass();
  double v15 = v10 * (double)(int)(v14 - 1) + v7 * (double)v14;
  double v16 = v10 * (double)((unsigned __int16)(v13 - (v12 == 9)) - 1) + v7 * (double)(unsigned __int16)(v13 - (v12 == 9));
  [(MRUMediaControlsModuleNowPlayingView *)self bounds];
  double v17 = CGRectGetWidth(v23) / v15;
  [(MRUMediaControlsModuleNowPlayingView *)self bounds];
  double v18 = CGRectGetHeight(v24) / v16;
  if (v17 >= v18) {
    double v19 = v18;
  }
  else {
    double v19 = v17;
  }
  NSLog(&cfstr_ResizingRatioW.isa, *(void *)&v17, *(void *)&v18, *(void *)&v19);
  double v20 = v17;
  double v21 = v18;
  result.CGFloat y = v21;
  result.CGFloat x = v20;
  return result;
}

- (double)resizingThresholdForLayout:(int64_t)a3
{
  double result = 0.75;
  if ((unint64_t)a3 <= 5) {
    return dbl_1AE964088[a3];
  }
  return result;
}

- (double)resizingAlphaWithRatio:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(MRUMediaControlsModuleNowPlayingView *)self resizingThresholdForLayout:self->_layout];
  if (x >= y) {
    double v6 = y;
  }
  else {
    double v6 = x;
  }
  return (v6 - v5) / (1.0 - v5);
}

- (double)backdropAlphaWithRatio:(CGPoint)a3
{
  if (a3.x >= a3.y) {
    double y = a3.y;
  }
  else {
    double y = a3.x;
  }
  if (a3.x < a3.y) {
    a3.double x = a3.y;
  }
  BOOL v4 = a3.x > 1.1 || y < 0.9;
  double result = 0.0;
  if (v4) {
    return 1.0;
  }
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

- (NSArray)routingButtons
{
  return self->_routingButtons;
}

- (MRUMediaSuggestionsView)suggestionsView
{
  return self->_suggestionsView;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (int64_t)layout
{
  return self->_layout;
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

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (BOOL)showSuggestionsView
{
  return self->_showSuggestionsView;
}

- (CCUIModuleContentMetrics)contentMetrics
{
  return self->_contentMetrics;
}

- (BOOL)resizing
{
  return self->_resizing;
}

- (MRUMediaControlsModuleRouteButton)upperRoutingButton
{
  return self->_upperRoutingButton;
}

- (MRUMediaControlsModuleRouteButton)lowerRoutingButton
{
  return self->_lowerRoutingButton;
}

- (MRUMediaModuleBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)setBackdropView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_lowerRoutingButton, 0);
  objc_storeStrong((id *)&self->_upperRoutingButton, 0);
  objc_storeStrong((id *)&self->_contentMetrics, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_suggestionsView, 0);
  objc_storeStrong((id *)&self->_routingButtons, 0);
  objc_storeStrong((id *)&self->_volumeControlsView, 0);
  objc_storeStrong((id *)&self->_transportControlsView, 0);
  objc_storeStrong((id *)&self->_timeControlsView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);

  objc_storeStrong((id *)&self->_artworkView, 0);
}

@end