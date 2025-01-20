@interface MRUNowPlayingView
- (BOOL)isDimmed;
- (BOOL)isOnScreen;
- (BOOL)showArtworkView;
- (BOOL)showSuggestionsView;
- (BOOL)showTimeControlsView;
- (BOOL)showTransportControlsView;
- (BOOL)showVolumeControlsView;
- (BOOL)supportsHorizontalLayout;
- (BOOL)useArtworkOverrideSize;
- (CGRect)suggestionsFrame;
- (CGSize)artworkOverrideSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MRUArtworkView)artworkView;
- (MRUNowPlayingContainerView)containerView;
- (MRUNowPlayingHeaderView)headerView;
- (MRUNowPlayingTimeControlsView)timeControlsView;
- (MRUNowPlayingTransportControlsView)transportControlsView;
- (MRUNowPlayingView)initWithFrame:(CGRect)a3;
- (MRUNowPlayingVolumeControlsView)volumeControlsView;
- (MRUVisualStylingProvider)stylingProvider;
- (UIEdgeInsets)contentEdgeInsets;
- (UIView)contentView;
- (UIView)suggestionsView;
- (int64_t)context;
- (int64_t)layout;
- (void)layoutSubviews;
- (void)layoutSubviewsHorizontal;
- (void)layoutSubviewsSmall;
- (void)layoutSubviewsVertical;
- (void)setArtworkOverrideSize:(CGSize)a3;
- (void)setContainerView:(id)a3;
- (void)setContentEdgeInsets:(UIEdgeInsets)a3;
- (void)setContentView:(id)a3;
- (void)setContext:(int64_t)a3;
- (void)setDimmed:(BOOL)a3;
- (void)setLayout:(int64_t)a3;
- (void)setOnScreen:(BOOL)a3;
- (void)setShowArtworkView:(BOOL)a3;
- (void)setShowSuggestionsView:(BOOL)a3;
- (void)setShowTimeControlsView:(BOOL)a3;
- (void)setShowTransportControlsView:(BOOL)a3;
- (void)setShowVolumeControlsView:(BOOL)a3;
- (void)setStylingProvider:(id)a3;
- (void)setSuggestionsView:(id)a3;
- (void)setSupportsHorizontalLayout:(BOOL)a3;
- (void)setUseArtworkOverrideSize:(BOOL)a3;
- (void)updateArtworkStyle;
- (void)updateLayout;
- (void)updateOnScreen;
- (void)updateTextAlignment;
- (void)updateVisibility;
@end

@implementation MRUNowPlayingView

- (MRUNowPlayingView)initWithFrame:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)MRUNowPlayingView;
  v3 = -[MRUNowPlayingView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(MRUNowPlayingView *)v3 layer];
    [v5 setHitTestsAsOpaque:1];

    v6 = objc_alloc_init(MRUNowPlayingHeaderView);
    headerView = v4->_headerView;
    v4->_headerView = v6;

    [(MRUNowPlayingView *)v4 addSubview:v4->_headerView];
    v8 = objc_alloc_init(MRUNowPlayingTimeControlsView);
    timeControlsView = v4->_timeControlsView;
    v4->_timeControlsView = v8;

    [(MRUNowPlayingView *)v4 addSubview:v4->_timeControlsView];
    v10 = objc_alloc_init(MRUNowPlayingTransportControlsView);
    transportControlsView = v4->_transportControlsView;
    v4->_transportControlsView = v10;

    [(MRUNowPlayingView *)v4 addSubview:v4->_transportControlsView];
    v12 = objc_alloc_init(MRUNowPlayingVolumeControlsView);
    volumeControlsView = v4->_volumeControlsView;
    v4->_volumeControlsView = v12;

    [(MRUNowPlayingView *)v4 addSubview:v4->_volumeControlsView];
    v14 = objc_alloc_init(MRUNowPlayingContainerView);
    containerView = v4->_containerView;
    v4->_containerView = v14;

    [(MRUNowPlayingView *)v4 addSubview:v4->_containerView];
    v16 = objc_alloc_init(MRUArtworkView);
    artworkView = v4->_artworkView;
    v4->_artworkView = v16;

    v18 = [(MRUArtworkView *)v4->_artworkView pointerInteraction];
    [v18 setEnabled:1];

    [(MRUNowPlayingView *)v4 addSubview:v4->_artworkView];
    v4->_showArtworkView = 1;
    v4->_showTimeControlsView = 1;
    v4->_showTransportControlsView = 1;
    v4->_showVolumeControlsView = 1;
    [(MRUNowPlayingView *)v4 updateLayout];
    [(MRUNowPlayingView *)v4 updateArtworkStyle];
    [(MRUNowPlayingView *)v4 updateTextAlignment];
    [(MRUNowPlayingView *)v4 updateVisibility];
  }
  return v4;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MRUNowPlayingView;
  [(MRUNowPlayingView *)&v3 layoutSubviews];
  if (self->_supportsHorizontalLayout && !MRULayoutShouldBeVertical()) {
    [(MRUNowPlayingView *)self layoutSubviewsHorizontal];
  }
  else {
    [(MRUNowPlayingView *)self layoutSubviewsVertical];
  }
}

- (void)layoutSubviewsVertical
{
  [(MRUNowPlayingView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(MRUNowPlayingView *)self traitCollection];
  [v11 displayScale];
  uint64_t v13 = v12;

  switch(self->_layout)
  {
    case 0:
      [(MRUNowPlayingView *)self layoutSubviewsSmall];
      return;
    case 1:
      [(MRUNowPlayingView *)self suggestionsFrame];
      -[UIView setFrame:](self->_suggestionsView, "setFrame:");
      UIRectInset();
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      -[MRUNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v18, v20);
      uint64_t v301 = v13;
      double v23 = v22;
      v306.origin.CGFloat x = v15;
      v306.origin.CGFloat y = v17;
      v306.size.width = v19;
      v306.size.CGFloat height = v21;
      CGFloat MinX = CGRectGetMinX(v306);
      v307.origin.CGFloat x = v15;
      v307.origin.CGFloat y = v17;
      v307.size.width = v19;
      v307.size.CGFloat height = v21;
      CGFloat MinY = CGRectGetMinY(v307);
      v308.origin.CGFloat x = v15;
      v308.origin.CGFloat y = v17;
      v308.size.width = v19;
      v308.size.CGFloat height = v21;
      CGFloat Width = CGRectGetWidth(v308);
      if (v23 <= 60.0) {
        double v27 = 60.0;
      }
      else {
        double v27 = v23;
      }
      v309.origin.CGFloat x = MinX;
      v309.origin.CGFloat y = MinY;
      v309.size.width = Width;
      v309.size.CGFloat height = v27;
      CGRectGetMinX(v309);
      v310.origin.CGFloat x = MinX;
      v310.origin.CGFloat y = MinY;
      v310.size.width = Width;
      v310.size.CGFloat height = v27;
      CGRectGetMinY(v310);
      [(MRUNowPlayingView *)self bounds];
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUArtworkView setFrame:](self->_artworkView, "setFrame:");
      UIRectInset();
      CGFloat x = v311.origin.x;
      CGFloat y = v311.origin.y;
      CGFloat v30 = v311.size.width;
      CGFloat height = v311.size.height;
      CGRectGetMinX(v311);
      v312.origin.CGFloat x = x;
      v312.origin.CGFloat y = y;
      v312.size.width = v30;
      v312.size.CGFloat height = height;
      CGRectGetWidth(v312);
      UIRectCenteredYInRectScale();
      [(MRUNowPlayingView *)self bounds];
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUNowPlayingHeaderView setFrame:](self->_headerView, "setFrame:");
      v313.origin.CGFloat x = x;
      v313.origin.CGFloat y = y;
      v313.size.width = v30;
      v313.size.CGFloat height = height;
      CGRectGetHeight(v313);
      UIRectInset();
      CGFloat v33 = v32;
      CGFloat v35 = v34;
      double v37 = v36;
      double v39 = v38;
      -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v36, v38);
      double v41 = v40;
      double v43 = v42;
      v314.origin.CGFloat x = v33;
      v314.origin.CGFloat y = v35;
      v314.size.width = v37;
      v314.size.CGFloat height = v39;
      double v44 = CGRectGetMinX(v314);
      v315.origin.CGFloat x = v33;
      v315.origin.CGFloat y = v35;
      v315.size.width = v37;
      v315.size.CGFloat height = v39;
      double v45 = CGRectGetMinY(v315) - 7.0;
      -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:", v44, v45, v41, v43);
      if (self->_showTimeControlsView)
      {
        v316.origin.CGFloat x = v44;
        v316.origin.CGFloat y = v45;
        v316.size.width = v41;
        v316.size.CGFloat height = v43;
        CGRectGetHeight(v316);
        UIRectInset();
        CGFloat v33 = v46;
        CGFloat v35 = v47;
        double v37 = v48;
        double v39 = v49;
      }
      -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v37, v39);
      double v51 = v50;
      double v53 = v52;
      v317.origin.CGFloat x = v33;
      v317.origin.CGFloat y = v35;
      v317.size.width = v37;
      v317.size.CGFloat height = v39;
      double v54 = CGRectGetMinX(v317);
      v318.origin.CGFloat x = v33;
      v318.origin.CGFloat y = v35;
      v318.size.width = v37;
      v318.size.CGFloat height = v39;
      double v55 = CGRectGetMinY(v318);
      -[MRUNowPlayingTransportControlsView setFrame:](self->_transportControlsView, "setFrame:", v54, v55, v51, v53);
      if (self->_showTransportControlsView)
      {
        v319.origin.CGFloat x = v54;
        v319.origin.CGFloat y = v55;
        v319.size.width = v51;
        v319.size.CGFloat height = v53;
        CGRectGetHeight(v319);
        UIRectInset();
        CGFloat v33 = v56;
        CGFloat v35 = v57;
        double v37 = v58;
        double v39 = v59;
      }
      -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v37, v39);
      double v61 = v60;
      double v63 = v62;
      v320.origin.CGFloat x = v33;
      v320.origin.CGFloat y = v35;
      v320.size.width = v37;
      v320.size.CGFloat height = v39;
      double v64 = CGRectGetMinX(v320);
      v321.origin.CGFloat x = v33;
      v321.origin.CGFloat y = v35;
      v321.size.width = v37;
      v321.size.CGFloat height = v39;
      double v65 = CGRectGetMinY(v321);
      -[MRUNowPlayingVolumeControlsView setFrame:](self->_volumeControlsView, "setFrame:", v64, v65, v61, v63);
      if (self->_showVolumeControlsView)
      {
        v322.origin.CGFloat x = v64;
        v322.origin.CGFloat y = v65;
        v322.size.width = v61;
        v322.size.CGFloat height = v63;
        CGRectGetHeight(v322);
        UIRectInset();
        CGFloat v33 = v66;
        CGFloat v35 = v67;
        double v37 = v68;
        double v39 = v69;
      }
      v323.origin.CGFloat x = v33;
      v323.origin.CGFloat y = v35;
      v323.size.width = v37;
      v323.size.CGFloat height = v39;
      CGFloat v70 = CGRectGetMinY(v323);
      [(MRUNowPlayingView *)self bounds];
      CGFloat v71 = CGRectGetWidth(v324);
      v325.origin.CGFloat x = v33;
      v325.origin.CGFloat y = v35;
      v325.size.width = v37;
      v325.size.CGFloat height = v39;
      double v72 = CGRectGetHeight(v325);
      containerView = self->_containerView;
      double v74 = 0.0;
      double v75 = v70;
      double v76 = v71;
      goto LABEL_64;
    case 2:
      uint64_t v302 = v13;
      [(MRUNowPlayingView *)self suggestionsFrame];
      CGFloat v78 = v77;
      CGFloat v80 = v79;
      CGFloat v82 = v81;
      CGFloat v84 = v83;
      -[UIView setFrame:](self->_suggestionsView, "setFrame:");
      if (self->_showSuggestionsView)
      {
        v326.origin.CGFloat x = v78;
        v326.origin.CGFloat y = v80;
        v326.size.width = v82;
        v326.size.CGFloat height = v84;
        CGRectGetHeight(v326);
        UIRectInset();
        double v86 = v85;
        double v88 = v87;
        double v90 = v89;
        double v92 = v91;
      }
      else
      {
        double top = self->_contentEdgeInsets.top;
        double left = self->_contentEdgeInsets.left;
        double v86 = v4 + left;
        double v88 = v6 + top;
        double v90 = v8 - (left + self->_contentEdgeInsets.right);
        double v92 = v10 - (top + self->_contentEdgeInsets.bottom);
      }
      -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v90, v92);
      double v153 = v152;
      double v155 = v154;
      v337.origin.CGFloat x = v86;
      v337.origin.CGFloat y = v88;
      v337.size.width = v90;
      v337.size.CGFloat height = v92;
      double v156 = CGRectGetMinX(v337);
      v338.origin.CGFloat x = v86;
      v338.origin.CGFloat y = v88;
      v338.size.width = v90;
      v338.size.CGFloat height = v92;
      CGFloat MaxY = CGRectGetMaxY(v338);
      double v158 = MaxY - v155;
      -[MRUNowPlayingVolumeControlsView setFrame:](self->_volumeControlsView, "setFrame:", v156, MaxY - v155, v153, v155);
      if (self->_showVolumeControlsView)
      {
        v339.origin.CGFloat x = v156;
        v339.origin.CGFloat y = v158;
        v339.size.width = v153;
        v339.size.CGFloat height = v155;
        CGRectGetHeight(v339);
        UIRectInset();
        double v86 = v159;
        double v88 = v160;
        double v90 = v161;
        double v92 = v162;
      }
      -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v90, v92);
      double v164 = v163;
      double v166 = v165;
      v340.origin.CGFloat x = v86;
      v340.origin.CGFloat y = v88;
      v340.size.width = v90;
      v340.size.CGFloat height = v92;
      double v167 = CGRectGetMinX(v340);
      v341.origin.CGFloat x = v86;
      v341.origin.CGFloat y = v88;
      v341.size.width = v90;
      v341.size.CGFloat height = v92;
      CGFloat v168 = CGRectGetMaxY(v341);
      double v169 = v168 - v166;
      -[MRUNowPlayingTransportControlsView setFrame:](self->_transportControlsView, "setFrame:", v167, v168 - v166, v164, v166);
      if (self->_showTransportControlsView)
      {
        v342.origin.CGFloat x = v167;
        v342.origin.CGFloat y = v169;
        v342.size.width = v164;
        v342.size.CGFloat height = v166;
        CGRectGetHeight(v342);
        UIRectInset();
        double v86 = v170;
        double v88 = v171;
        double v90 = v172;
        double v92 = v173;
      }
      -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v90, v92);
      double v175 = v174;
      double v177 = v176;
      v343.origin.CGFloat x = v86;
      v343.origin.CGFloat y = v88;
      v343.size.width = v90;
      v343.size.CGFloat height = v92;
      double v178 = CGRectGetMinX(v343);
      v344.origin.CGFloat x = v86;
      v344.origin.CGFloat y = v88;
      v344.size.width = v90;
      v344.size.CGFloat height = v92;
      CGFloat v179 = CGRectGetMaxY(v344);
      double v180 = v179 - v177;
      -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:", v178, v179 - v177, v175, v177);
      if (self->_showTimeControlsView && !self->_showSuggestionsView)
      {
        v345.origin.CGFloat x = v178;
        v345.origin.CGFloat y = v180;
        v345.size.width = v175;
        v345.size.CGFloat height = v177;
        CGRectGetHeight(v345);
        UIRectInset();
        double v86 = v181;
        double v88 = v182;
        double v90 = v183;
        double v92 = v184;
      }
      -[MRUNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v90, v92);
      double v186 = v185;
      double v188 = v187;
      v346.origin.CGFloat x = v86;
      v346.origin.CGFloat y = v88;
      v346.size.width = v90;
      v346.size.CGFloat height = v92;
      double v189 = CGRectGetMinX(v346);
      v347.origin.CGFloat x = v86;
      v347.origin.CGFloat y = v88;
      v347.size.width = v90;
      v347.size.CGFloat height = v92;
      CGFloat v190 = CGRectGetMaxY(v347);
      CGFloat v191 = v190 - v188;
      -[MRUNowPlayingHeaderView setFrame:](self->_headerView, "setFrame:", v189, v190 - v188, v186, v188);
      v348.origin.CGFloat x = v189;
      v348.origin.CGFloat y = v191;
      v348.size.width = v186;
      v348.size.CGFloat height = v188;
      CGRectGetHeight(v348);
      UIRectInset();
      CGFloat v196 = v192;
      CGFloat v197 = v193;
      CGFloat v198 = v194;
      CGFloat v199 = v195;
      if (self->_showSuggestionsView)
      {
        CGFloat v200 = CGRectGetMinX(*(CGRect *)&v192);
        [(MRUNowPlayingView *)self bounds];
        CGFloat v201 = CGRectGetMinY(v349) + self->_contentEdgeInsets.top;
        v350.origin.CGFloat x = v196;
        v350.origin.CGFloat y = v197;
        v350.size.width = v198;
        v350.size.CGFloat height = v199;
        CGFloat v202 = CGRectGetWidth(v350);
        v351.origin.CGFloat x = v196;
        v351.origin.CGFloat y = v197;
        v351.size.width = v198;
        v351.size.CGFloat height = v199;
        CGFloat v199 = CGRectGetWidth(v351);
        CGFloat v198 = v202;
        CGFloat v197 = v201;
        CGFloat v196 = v200;
      }
      else if (self->_useArtworkOverrideSize)
      {
        uint64_t v293 = v302;
        UIRectCenteredIntegralRectScale();
        CGFloat v196 = v203;
        CGFloat v197 = v204;
        CGFloat v198 = v205;
        CGFloat v199 = v206;
      }
      artworkView = self->_artworkView;
      double v120 = v196;
      double v121 = v197;
      double v122 = v198;
      double v123 = v199;
      goto LABEL_36;
    case 3:
      [(MRUNowPlayingView *)self suggestionsFrame];
      -[UIView setFrame:](self->_suggestionsView, "setFrame:");
      double v93 = self->_contentEdgeInsets.top;
      double v94 = self->_contentEdgeInsets.left;
      CGFloat v95 = v4 + v94;
      CGFloat v96 = v6 + v93;
      CGFloat v97 = v8 - (v94 + self->_contentEdgeInsets.right);
      CGFloat v98 = v10 - (v93 + self->_contentEdgeInsets.bottom);
      -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v97, v98);
      uint64_t v303 = v13;
      double v100 = v99;
      double v102 = v101;
      CGFloat rect_8 = v101;
      v327.origin.CGFloat x = v95;
      v327.origin.CGFloat y = v96;
      v327.size.width = v97;
      v327.size.CGFloat height = v98;
      double v103 = CGRectGetMinX(v327);
      v328.origin.CGFloat x = v95;
      v328.origin.CGFloat y = v96;
      v328.size.width = v97;
      v328.size.CGFloat height = v98;
      double v104 = CGRectGetMaxY(v328);
      -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:", v103, v104, v100, v102);
      -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v97, v98);
      double v106 = v105;
      CGFloat rect_16 = v105;
      double rect_24 = v107;
      v329.origin.CGFloat x = v95;
      v329.origin.CGFloat y = v96;
      v329.size.width = v97;
      v329.size.CGFloat height = v98;
      double recta = CGRectGetMinX(v329);
      v330.origin.CGFloat x = v103;
      v330.origin.CGFloat y = v104;
      v330.size.width = v100;
      v330.size.CGFloat height = rect_8;
      CGFloat v108 = CGRectGetMaxY(v330) + 7.0;
      -[MRUNowPlayingTransportControlsView setFrame:](self->_transportControlsView, "setFrame:", recta, v108, v106, rect_24);
      -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v97, v98);
      double rect_8a = v109;
      double v295 = v110;
      v331.origin.CGFloat x = v95;
      v331.origin.CGFloat y = v96;
      v331.size.width = v97;
      v331.size.CGFloat height = v98;
      double v111 = CGRectGetMinX(v331);
      v332.origin.CGFloat x = recta;
      v332.origin.CGFloat y = v108;
      v332.size.width = rect_16;
      v332.size.CGFloat height = rect_24;
      -[MRUNowPlayingVolumeControlsView setFrame:](self->_volumeControlsView, "setFrame:", v111, CGRectGetMaxY(v332) + 7.0, rect_8a, v295);
      -[MRUArtworkView sizeThatFits:](self->_artworkView, "sizeThatFits:", v97, v98);
      v333.origin.CGFloat x = v95;
      v333.origin.CGFloat y = v96;
      v333.size.width = v97;
      v333.size.CGFloat height = v98;
      CGRectGetMinX(v333);
      UIRectCenteredYInRectScale();
      [(MRUNowPlayingView *)self bounds];
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUArtworkView setFrame:](self->_artworkView, "setFrame:");
      UIRectInset();
      CGFloat v113 = v112;
      CGFloat v115 = v114;
      CGFloat v117 = v116;
      CGFloat v119 = v118;
      -[MRUNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v116, v118);
      v334.origin.CGFloat x = v113;
      v334.origin.CGFloat y = v115;
      v334.size.width = v117;
      v334.size.CGFloat height = v119;
      CGRectGetMinX(v334);
      UIRectCenteredYInRectScale();
      [(MRUNowPlayingView *)self bounds];
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      artworkView = self->_headerView;
LABEL_36:
      objc_msgSend(artworkView, "setFrame:", v120, v121, v122, v123, v293);
      [(MRUNowPlayingView *)self bounds];
      CGFloat v207 = CGRectGetMaxY(v352);
      [(MRUNowPlayingView *)self bounds];
      double v76 = CGRectGetWidth(v353);
      containerView = self->_containerView;
      double v74 = 0.0;
      double v72 = 0.0;
      double v75 = v207;
      goto LABEL_64;
    case 4:
      uint64_t v304 = v13;
      BOOL v125 = +[MRUFeatureFlagProvider isAutobahnEnabled];
      [(MRUNowPlayingView *)self suggestionsFrame];
      CGFloat v127 = v126;
      CGFloat v129 = v128;
      CGFloat v131 = v130;
      CGFloat v133 = v132;
      -[UIView setFrame:](self->_suggestionsView, "setFrame:");
      if (v125)
      {
        if (self->_showSuggestionsView)
        {
          v335.origin.CGFloat x = v127;
          v335.origin.CGFloat y = v129;
          v335.size.width = v131;
          v335.size.CGFloat height = v133;
          CGRectGetHeight(v335);
          UIRectInset();
          double v135 = v134;
          double v137 = v136;
          double v139 = v138;
          double v141 = v140;
        }
        else
        {
          double v208 = self->_contentEdgeInsets.top;
          double v209 = self->_contentEdgeInsets.left;
          double v135 = v4 + v209;
          double v137 = v6 + v208;
          double v139 = v8 - (v209 + self->_contentEdgeInsets.right);
          double v141 = v10 - (v208 + self->_contentEdgeInsets.bottom);
        }
        -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v139, v141);
        double v211 = v210;
        double v213 = v212;
        v354.origin.CGFloat x = v135;
        v354.origin.CGFloat y = v137;
        v354.size.width = v139;
        v354.size.CGFloat height = v141;
        double v214 = CGRectGetMinX(v354);
        v355.origin.CGFloat x = v135;
        v355.origin.CGFloat y = v137;
        v355.size.width = v139;
        v355.size.CGFloat height = v141;
        CGFloat v215 = CGRectGetMaxY(v355);
        double v216 = v215 - v213;
        -[MRUNowPlayingVolumeControlsView setFrame:](self->_volumeControlsView, "setFrame:", v214, v215 - v213, v211, v213);
        if (self->_showVolumeControlsView)
        {
          v356.origin.CGFloat x = v214;
          v356.origin.CGFloat y = v216;
          v356.size.width = v211;
          v356.size.CGFloat height = v213;
          CGRectGetHeight(v356);
          UIRectInset();
          double v135 = v217;
          double v137 = v218;
          double v139 = v219;
          double v141 = v220;
        }
        -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v139, v141);
        double v222 = v221;
        double v224 = v223;
        v357.origin.CGFloat x = v135;
        v357.origin.CGFloat y = v137;
        v357.size.width = v139;
        v357.size.CGFloat height = v141;
        double v225 = CGRectGetMinX(v357);
        v358.origin.CGFloat x = v135;
        v358.origin.CGFloat y = v137;
        v358.size.width = v139;
        v358.size.CGFloat height = v141;
        CGFloat v226 = CGRectGetMaxY(v358);
        double v227 = v226 - v224;
        -[MRUNowPlayingTransportControlsView setFrame:](self->_transportControlsView, "setFrame:", v225, v226 - v224, v222, v224);
        if (self->_showTransportControlsView)
        {
          v359.origin.CGFloat x = v225;
          v359.origin.CGFloat y = v227;
          v359.size.width = v222;
          v359.size.CGFloat height = v224;
          CGRectGetHeight(v359);
          UIRectInset();
          double v135 = v228;
          double v137 = v229;
          double v139 = v230;
          double v141 = v231;
        }
        -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v139, v141);
        v360.origin.CGFloat x = v135;
        v360.origin.CGFloat y = v137;
        v360.size.width = v139;
        v360.size.CGFloat height = v141;
        CGRectGetMinX(v360);
        v361.origin.CGFloat x = v135;
        v361.origin.CGFloat y = v137;
        v361.size.width = v139;
        v361.size.CGFloat height = v141;
        CGRectGetMaxY(v361);
        UIRectInset();
        CGFloat v233 = v232;
        CGFloat v235 = v234;
        CGFloat v237 = v236;
        CGFloat v239 = v238;
        [(MRUNowPlayingView *)self bounds];
        MPRectByApplyingUserInterfaceLayoutDirectionInRect();
        -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:");
        if (self->_showTimeControlsView)
        {
          v362.origin.CGFloat x = v233;
          v362.origin.CGFloat y = v235;
          v362.size.width = v237;
          v362.size.CGFloat height = v239;
          CGRectGetHeight(v362);
          UIRectInset();
          double v135 = v240;
          double v137 = v241;
          double v139 = v242;
          double v141 = v243;
        }
        if (!self->_showSuggestionsView && self->_showArtworkView)
        {
          UIRectInset();
          double v135 = v244;
          double v137 = v245;
          double v139 = v246;
          double v141 = v247;
        }
        v363.origin.CGFloat x = v135;
        v363.origin.CGFloat y = v137;
        v363.size.width = v139;
        v363.size.CGFloat height = v141;
        CGRectGetMinX(v363);
        v364.origin.CGFloat x = v135;
        v364.origin.CGFloat y = v137;
        v364.size.width = v139;
        v364.size.CGFloat height = v141;
        CGRectGetMinY(v364);
        [(MRUNowPlayingView *)self bounds];
        MPRectByApplyingUserInterfaceLayoutDirectionInRect();
        -[MRUArtworkView setFrame:](self->_artworkView, "setFrame:");
        if (!self->_showSuggestionsView && self->_showArtworkView)
        {
          UIRectInset();
          double v135 = v248;
          double v137 = v249;
          double v139 = v250;
          double v141 = v251;
        }
        uint64_t v252 = 432;
        -[MRUNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v139, v141);
        v365.origin.CGFloat x = v135;
        v365.origin.CGFloat y = v137;
        v365.size.width = v139;
        v365.size.CGFloat height = v141;
        CGRectGetMinX(v365);
        v366.origin.CGFloat x = v135;
        v366.origin.CGFloat y = v137;
        v366.size.width = v139;
        v366.size.CGFloat height = v141;
        CGRectGetMinY(v366);
        UIRectCenteredYInRectScale();
        [(MRUNowPlayingView *)self bounds];
        MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      }
      else
      {
        if (self->_showSuggestionsView)
        {
          v336.origin.CGFloat x = v127;
          v336.origin.CGFloat y = v129;
          v336.size.width = v131;
          v336.size.CGFloat height = v133;
          CGRectGetHeight(v336);
          UIRectInset();
          double v143 = v142;
          double v145 = v144;
          double v147 = v146;
          double v149 = v148;
        }
        else
        {
          double v253 = self->_contentEdgeInsets.top;
          double v254 = self->_contentEdgeInsets.left;
          double v143 = v4 + v254;
          double v145 = v6 + v253;
          double v147 = v8 - (v254 + self->_contentEdgeInsets.right);
          double v149 = v10 - (v253 + self->_contentEdgeInsets.bottom);
        }
        v367.origin.CGFloat x = v143;
        v367.origin.CGFloat y = v145;
        v367.size.width = v147;
        v367.size.CGFloat height = v149;
        CGFloat v255 = CGRectGetMinX(v367);
        v368.origin.CGFloat x = v143;
        v368.origin.CGFloat y = v145;
        v368.size.width = v147;
        v368.size.CGFloat height = v149;
        CGFloat v256 = CGRectGetMinY(v368);
        v369.origin.CGFloat x = v143;
        v369.origin.CGFloat y = v145;
        v369.size.width = v147;
        v369.size.CGFloat height = v149;
        double v257 = CGRectGetWidth(v369);
        double v258 = 100.0;
        -[MRUNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v257, 100.0);
        if (self->_showSuggestionsView) {
          double v258 = v259;
        }
        -[MRUArtworkView sizeThatFits:](self->_artworkView, "sizeThatFits:", v257, v258);
        v370.origin.CGFloat x = v255;
        v370.origin.CGFloat y = v256;
        v370.size.width = v257;
        v370.size.CGFloat height = v258;
        CGRectGetMinX(v370);
        v371.origin.CGFloat x = v255;
        v371.origin.CGFloat y = v256;
        v371.size.width = v257;
        v371.size.CGFloat height = v258;
        CGRectGetMinY(v371);
        [(MRUNowPlayingView *)self bounds];
        MPRectByApplyingUserInterfaceLayoutDirectionInRect();
        -[MRUArtworkView setFrame:](self->_artworkView, "setFrame:");
        if (!self->_showSuggestionsView && self->_showArtworkView)
        {
          UIRectInset();
          CGFloat v255 = v260;
          CGFloat v256 = v261;
          double v257 = v262;
          double v258 = v263;
        }
        v372.origin.CGFloat x = v255;
        v372.origin.CGFloat y = v256;
        v372.size.width = v257;
        v372.size.CGFloat height = v258;
        CGRectGetMinX(v372);
        v373.origin.CGFloat x = v255;
        v373.origin.CGFloat y = v256;
        v373.size.width = v257;
        v373.size.CGFloat height = v258;
        CGRectGetMinY(v373);
        v374.origin.CGFloat x = v255;
        v374.origin.CGFloat y = v256;
        v374.size.width = v257;
        v374.size.CGFloat height = v258;
        CGRectGetWidth(v374);
        UIRectCenteredYInRectScale();
        [(MRUNowPlayingView *)self bounds];
        MPRectByApplyingUserInterfaceLayoutDirectionInRect();
        -[MRUNowPlayingHeaderView setFrame:](self->_headerView, "setFrame:");
        v375.origin.CGFloat x = v255;
        v375.origin.CGFloat y = v256;
        v375.size.width = v257;
        v375.size.CGFloat height = v258;
        CGRectGetHeight(v375);
        UIRectInset();
        CGFloat v265 = v264;
        CGFloat v267 = v266;
        double v269 = v268;
        double v271 = v270;
        -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v268, v270);
        double v273 = v272;
        double v275 = v274;
        v376.origin.CGFloat x = v265;
        v376.origin.CGFloat y = v267;
        v376.size.width = v269;
        v376.size.CGFloat height = v271;
        double v276 = CGRectGetMinX(v376);
        v377.origin.CGFloat x = v265;
        v377.origin.CGFloat y = v267;
        v377.size.width = v269;
        v377.size.CGFloat height = v271;
        double v277 = CGRectGetMinY(v377) - 7.0;
        -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:", v276, v277, v273, v275);
        if (!self->_showSuggestionsView && self->_showTimeControlsView)
        {
          v378.origin.CGFloat x = v276;
          v378.origin.CGFloat y = v277;
          v378.size.width = v273;
          v378.size.CGFloat height = v275;
          CGRectGetHeight(v378);
          UIRectInset();
          CGFloat v265 = v278;
          CGFloat v267 = v279;
          double v269 = v280;
          double v271 = v281;
        }
        -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v269, v271);
        double v283 = v282;
        double v285 = v284;
        v379.origin.CGFloat x = v265;
        v379.origin.CGFloat y = v267;
        v379.size.width = v269;
        v379.size.CGFloat height = v271;
        double v286 = CGRectGetMinX(v379);
        v380.origin.CGFloat x = v265;
        v380.origin.CGFloat y = v267;
        v380.size.width = v269;
        v380.size.CGFloat height = v271;
        CGFloat v287 = CGRectGetMaxY(v380);
        double v288 = v287 - v285;
        -[MRUNowPlayingVolumeControlsView setFrame:](self->_volumeControlsView, "setFrame:", v286, v287 - v285, v283, v285);
        if (self->_showVolumeControlsView)
        {
          v381.origin.CGFloat x = v286;
          v381.origin.CGFloat y = v288;
          v381.size.width = v283;
          v381.size.CGFloat height = v285;
          CGRectGetHeight(v381);
          UIRectInset();
          CGFloat v265 = v289;
          CGFloat v267 = v290;
          double v269 = v291;
          double v271 = v292;
        }
        uint64_t v252 = 448;
        -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v269, v271);
        v382.origin.CGFloat x = v265;
        v382.origin.CGFloat y = v267;
        v382.size.width = v269;
        v382.size.CGFloat height = v271;
        CGRectGetMinX(v382);
        uint64_t v294 = v304;
        UIRectCenteredYInRectScale();
      }
      [*(id *)((char *)&self->super.super.super.isa + v252) setFrame:v294];
      [(MRUNowPlayingView *)self bounds];
      CGRectGetMaxX(v383);
      [(MRUNowPlayingView *)self bounds];
      CGRectGetMinY(v384);
      [(MRUNowPlayingView *)self bounds];
      CGRectGetHeight(v385);
      [(MRUNowPlayingView *)self bounds];
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      containerView = self->_containerView;
LABEL_64:
      -[MRUNowPlayingContainerView setFrame:](containerView, "setFrame:", v74, v75, v76, v72);
      break;
    default:
      return;
  }
}

- (void)layoutSubviewsHorizontal
{
  [(MRUNowPlayingView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(MRUNowPlayingView *)self traitCollection];
  [v11 displayScale];
  uint64_t v13 = v12;

  switch(self->_layout)
  {
    case 0:
      [(MRUNowPlayingView *)self layoutSubviewsSmall];
      return;
    case 1:
      [(MRUNowPlayingView *)self suggestionsFrame];
      -[UIView setFrame:](self->_suggestionsView, "setFrame:");
      v262.origin.CGFloat x = v4;
      v262.origin.CGFloat y = v6;
      v262.size.CGFloat width = v8;
      v262.size.CGFloat height = v10;
      uint64_t v257 = v13;
      CGFloat v14 = CGRectGetWidth(v262) * 0.5;
      v263.origin.CGFloat x = v4;
      v263.origin.CGFloat y = v6;
      v263.size.CGFloat width = v8;
      v263.size.CGFloat height = v10;
      CGFloat Height = CGRectGetHeight(v263);
      v264.origin.CGFloat x = v4;
      v264.origin.CGFloat y = v6;
      v264.size.CGFloat width = v8;
      v264.size.CGFloat height = v10;
      CGFloat v252 = CGRectGetMaxX(v264) - v14;
      v265.origin.CGFloat x = v4;
      v265.origin.CGFloat y = v6;
      v265.size.CGFloat width = v8;
      v265.size.CGFloat height = v10;
      CGFloat MinY = CGRectGetMinY(v265);
      [(MRUNowPlayingView *)self bounds];
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUNowPlayingContainerView setFrame:](self->_containerView, "setFrame:");
      v266.origin.CGFloat x = v252;
      v266.size.CGFloat height = Height;
      v266.origin.CGFloat y = MinY;
      v266.size.CGFloat width = v14;
      CGRectGetWidth(v266);
      UIRectInset();
      CGFloat x = v267.origin.x;
      CGFloat y = v267.origin.y;
      CGFloat width = v267.size.width;
      CGFloat v19 = v267.size.height;
      CGFloat MinX = CGRectGetMinX(v267);
      v268.origin.CGFloat x = x;
      v268.origin.CGFloat y = y;
      v268.size.CGFloat width = width;
      v268.size.CGFloat height = v19;
      CGFloat v21 = CGRectGetMinY(v268);
      v269.origin.CGFloat x = x;
      v269.origin.CGFloat y = y;
      v269.size.CGFloat width = width;
      v269.size.CGFloat height = v19;
      double v22 = CGRectGetWidth(v269);
      -[MRUArtworkView sizeThatFits:](self->_artworkView, "sizeThatFits:", v22, 60.0);
      v270.origin.CGFloat x = MinX;
      v270.origin.CGFloat y = v21;
      v270.size.CGFloat width = v22;
      v270.size.CGFloat height = 60.0;
      CGRectGetMinX(v270);
      v271.origin.CGFloat x = MinX;
      v271.origin.CGFloat y = v21;
      v271.size.CGFloat width = v22;
      v271.size.CGFloat height = 60.0;
      CGRectGetMinY(v271);
      [(MRUNowPlayingView *)self bounds];
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUArtworkView setFrame:](self->_artworkView, "setFrame:");
      UIRectInset();
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      CGFloat v28 = v27;
      CGFloat v30 = v29;
      -[MRUNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v27, v29);
      v272.origin.CGFloat x = v24;
      v272.origin.CGFloat y = v26;
      v272.size.CGFloat width = v28;
      v272.size.CGFloat height = v30;
      CGRectGetMinX(v272);
      v273.origin.CGFloat x = v24;
      v273.origin.CGFloat y = v26;
      v273.size.CGFloat width = v28;
      v273.size.CGFloat height = v30;
      CGRectGetMinY(v273);
      v274.origin.CGFloat x = v24;
      v274.origin.CGFloat y = v26;
      v274.size.CGFloat width = v28;
      v274.size.CGFloat height = v30;
      CGRectGetWidth(v274);
      UIRectCenteredYInRectScale();
      [(MRUNowPlayingView *)self bounds];
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUNowPlayingHeaderView setFrame:](self->_headerView, "setFrame:");
      v275.origin.CGFloat x = v24;
      v275.origin.CGFloat y = v26;
      v275.size.CGFloat width = v28;
      v275.size.CGFloat height = v30;
      CGRectGetHeight(v275);
      UIRectInset();
      CGFloat v32 = v31;
      CGFloat v34 = v33;
      double v36 = v35;
      double v38 = v37;
      -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v35, v37);
      CGFloat v40 = v39;
      CGFloat v42 = v41;
      v276.origin.CGFloat x = v32;
      v276.origin.CGFloat y = v34;
      v276.size.CGFloat width = v36;
      v276.size.CGFloat height = v38;
      CGFloat v43 = CGRectGetMinX(v276);
      v277.origin.CGFloat x = v32;
      v277.origin.CGFloat y = v34;
      v277.size.CGFloat width = v36;
      v277.size.CGFloat height = v38;
      CGFloat v44 = CGRectGetMinY(v277);
      [(MRUNowPlayingView *)self bounds];
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:");
      if (self->_showTimeControlsView)
      {
        v278.origin.CGFloat x = v43;
        v278.origin.CGFloat y = v44;
        v278.size.CGFloat width = v40;
        v278.size.CGFloat height = v42;
        CGRectGetHeight(v278);
        UIRectInset();
        CGFloat v32 = v45;
        CGFloat v34 = v46;
        double v36 = v47;
        double v38 = v48;
      }
      -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v36, v38);
      CGFloat v50 = v49;
      double v52 = v51;
      v279.origin.CGFloat x = v32;
      v279.origin.CGFloat y = v34;
      v279.size.CGFloat width = v36;
      v279.size.CGFloat height = v38;
      CGFloat v53 = CGRectGetMinX(v279);
      v280.origin.CGFloat x = v32;
      v280.origin.CGFloat y = v34;
      v280.size.CGFloat width = v36;
      v280.size.CGFloat height = v38;
      double v54 = CGRectGetMaxY(v280) - v52;
      [(MRUNowPlayingView *)self bounds];
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUNowPlayingVolumeControlsView setFrame:](self->_volumeControlsView, "setFrame:");
      if (self->_showVolumeControlsView)
      {
        v281.origin.CGFloat x = v53;
        v281.origin.CGFloat y = v54;
        v281.size.CGFloat width = v50;
        v281.size.CGFloat height = v52;
        CGRectGetHeight(v281);
        UIRectInset();
        CGFloat v32 = v55;
        CGFloat v34 = v56;
        double v36 = v57;
        double v38 = v58;
      }
      -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v36, v38);
      v282.origin.CGFloat x = v32;
      v282.origin.CGFloat y = v34;
      v282.size.CGFloat width = v36;
      v282.size.CGFloat height = v38;
      CGRectGetMinX(v282);
      UIRectCenteredYInRectScale();
      [(MRUNowPlayingView *)self bounds];
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      transportControlsView = self->_transportControlsView;
      goto LABEL_48;
    case 2:
      uint64_t v258 = v13;
      [(MRUNowPlayingView *)self suggestionsFrame];
      double v253 = v61;
      double v255 = v60;
      uint64_t rect_24 = v63;
      uint64_t v250 = v62;
      -[UIView setFrame:](self->_suggestionsView, "setFrame:");
      double top = self->_contentEdgeInsets.top;
      double left = self->_contentEdgeInsets.left;
      CGFloat v66 = v4 + left;
      CGFloat v67 = v6 + top;
      CGFloat v68 = v8 - (left + self->_contentEdgeInsets.right);
      CGFloat v69 = v10 - (top + self->_contentEdgeInsets.bottom);
      -[MRUArtworkView sizeThatFits:](self->_artworkView, "sizeThatFits:", v68, v69);
      uint64_t v71 = v70;
      uint64_t v73 = v72;
      v283.origin.CGFloat x = v66;
      v283.origin.CGFloat y = v67;
      v283.size.CGFloat width = v68;
      v283.size.CGFloat height = v69;
      CGFloat v74 = CGRectGetMinX(v283);
      v284.origin.CGFloat x = v66;
      v284.origin.CGFloat y = v67;
      v284.size.CGFloat width = v68;
      v284.size.CGFloat height = v69;
      CGFloat v75 = CGRectGetMinY(v284);
      [(MRUNowPlayingView *)self bounds];
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUArtworkView setFrame:](self->_artworkView, "setFrame:");
      if (self->_showSuggestionsView)
      {
        CGFloat v77 = v253;
        CGFloat v76 = v255;
        uint64_t v79 = rect_24;
        uint64_t v78 = v250;
      }
      else
      {
        CGFloat v76 = v74;
        CGFloat v77 = v75;
        uint64_t v78 = v71;
        uint64_t v79 = v73;
      }
      CGRectGetWidth(*(CGRect *)&v76);
      UIRectInset();
      CGFloat v132 = v131;
      CGFloat v134 = v133;
      CGFloat v136 = v135;
      CGFloat v138 = v137;
      -[MRUNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v135, v137);
      CGFloat v140 = v139;
      CGFloat v142 = v141;
      v296.origin.CGFloat x = v132;
      v296.origin.CGFloat y = v134;
      v296.size.CGFloat width = v136;
      v296.size.CGFloat height = v138;
      CGFloat v143 = CGRectGetMinX(v296);
      v297.origin.CGFloat x = v132;
      v297.origin.CGFloat y = v134;
      v297.size.CGFloat width = v136;
      v297.size.CGFloat height = v138;
      CGFloat v144 = CGRectGetMinY(v297);
      [(MRUNowPlayingView *)self bounds];
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUNowPlayingHeaderView setFrame:](self->_headerView, "setFrame:");
      v298.origin.CGFloat x = v143;
      v298.origin.CGFloat y = v144;
      v298.size.CGFloat width = v140;
      v298.size.CGFloat height = v142;
      CGRectGetHeight(v298);
      UIRectInset();
      CGFloat v146 = v145;
      CGFloat v148 = v147;
      double v150 = v149;
      double v152 = v151;
      -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v149, v151);
      CGFloat v154 = v153;
      CGFloat v156 = v155;
      v299.origin.CGFloat x = v146;
      v299.origin.CGFloat y = v148;
      v299.size.CGFloat width = v150;
      v299.size.CGFloat height = v152;
      CGFloat v157 = CGRectGetMinX(v299);
      v300.origin.CGFloat x = v146;
      v300.origin.CGFloat y = v148;
      v300.size.CGFloat width = v150;
      v300.size.CGFloat height = v152;
      double v158 = CGRectGetMinY(v300) - 7.0;
      [(MRUNowPlayingView *)self bounds];
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:");
      if (self->_showTimeControlsView)
      {
        v301.origin.CGFloat x = v157;
        v301.origin.CGFloat y = v158;
        v301.size.CGFloat width = v154;
        v301.size.CGFloat height = v156;
        CGRectGetHeight(v301);
        UIRectInset();
        CGFloat v146 = v159;
        CGFloat v148 = v160;
        double v150 = v161;
        double v152 = v162;
      }
      -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v150, v152);
      CGFloat v164 = v163;
      double v166 = v165;
      v302.origin.CGFloat x = v146;
      v302.origin.CGFloat y = v148;
      v302.size.CGFloat width = v150;
      v302.size.CGFloat height = v152;
      CGFloat v167 = CGRectGetMinX(v302);
      v303.origin.CGFloat x = v146;
      v303.origin.CGFloat y = v148;
      v303.size.CGFloat width = v150;
      v303.size.CGFloat height = v152;
      double v168 = CGRectGetMaxY(v303) - v166;
      [(MRUNowPlayingView *)self bounds];
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUNowPlayingVolumeControlsView setFrame:](self->_volumeControlsView, "setFrame:");
      if (self->_showVolumeControlsView)
      {
        v304.origin.CGFloat x = v167;
        v304.origin.CGFloat y = v168;
        v304.size.CGFloat width = v164;
        v304.size.CGFloat height = v166;
        CGRectGetHeight(v304);
        UIRectInset();
        CGFloat v146 = v169;
        CGFloat v148 = v170;
        double v150 = v171;
        double v152 = v172;
      }
      uint64_t v173 = 448;
      -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v150, v152);
      v305.origin.CGFloat x = v146;
      v305.origin.CGFloat y = v148;
      v305.size.CGFloat width = v150;
      v305.size.CGFloat height = v152;
      CGRectGetMinX(v305);
      UIRectCenteredYInRectScale();
      [(MRUNowPlayingView *)self bounds];
      goto LABEL_33;
    case 3:
      [(MRUNowPlayingView *)self suggestionsFrame];
      -[UIView setFrame:](self->_suggestionsView, "setFrame:");
      double v80 = self->_contentEdgeInsets.top;
      double v81 = self->_contentEdgeInsets.left;
      CGFloat v256 = v4 + v81;
      CGFloat v82 = v6 + v80;
      CGFloat v83 = v8 - (v81 + self->_contentEdgeInsets.right);
      CGFloat v84 = v10 - (v80 + self->_contentEdgeInsets.bottom);
      -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v83, v84);
      double v86 = v85;
      CGFloat rect_16 = v85;
      double rect_24a = v87;
      v285.origin.CGFloat x = v256;
      v285.origin.CGFloat y = v82;
      v285.size.CGFloat width = v83;
      v285.size.CGFloat height = v84;
      double rect = CGRectGetMinX(v285);
      v286.origin.CGFloat x = v256;
      v286.origin.CGFloat y = v82;
      v286.size.CGFloat width = v83;
      v286.size.CGFloat height = v84;
      CGFloat v88 = CGRectGetMaxY(v286) + 7.0;
      -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:", rect, v88, v86, rect_24a);
      -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v83, v84);
      double v90 = v89;
      CGFloat rect_8 = v89;
      double v243 = v91;
      v287.origin.CGFloat x = v256;
      CGFloat v251 = v82;
      v287.origin.CGFloat y = v82;
      v287.size.CGFloat width = v83;
      v287.size.CGFloat height = v84;
      uint64_t v259 = v13;
      double v92 = CGRectGetMinX(v287);
      v288.origin.CGFloat x = rect;
      v288.origin.CGFloat y = v88;
      v288.size.CGFloat width = rect_16;
      v288.size.CGFloat height = rect_24a;
      double MaxY = CGRectGetMaxY(v288);
      -[MRUNowPlayingTransportControlsView setFrame:](self->_transportControlsView, "setFrame:", v92, MaxY, v90, v243);
      -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v83, v84);
      double rect_24b = v94;
      double v96 = v95;
      v289.origin.CGFloat x = v256;
      v289.origin.CGFloat y = v82;
      v289.size.CGFloat width = v83;
      v289.size.CGFloat height = v84;
      double v97 = CGRectGetMinX(v289);
      v290.origin.CGFloat x = v92;
      v290.origin.CGFloat y = MaxY;
      v290.size.CGFloat width = rect_8;
      v290.size.CGFloat height = v243;
      -[MRUNowPlayingVolumeControlsView setFrame:](self->_volumeControlsView, "setFrame:", v97, CGRectGetMaxY(v290) + 7.0, rect_24b, v96);
      -[MRUArtworkView sizeThatFits:](self->_artworkView, "sizeThatFits:", v83, v84);
      v291.origin.CGFloat x = v256;
      v291.origin.CGFloat y = v251;
      v291.size.CGFloat width = v83;
      v291.size.CGFloat height = v84;
      CGRectGetMinX(v291);
      UIRectCenteredYInRectScale();
      [(MRUNowPlayingView *)self bounds];
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUArtworkView setFrame:](self->_artworkView, "setFrame:");
      UIRectInset();
      CGFloat v99 = v98;
      CGFloat v101 = v100;
      CGFloat v103 = v102;
      CGFloat v105 = v104;
      -[MRUNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v102, v104);
      v292.origin.CGFloat x = v99;
      v292.origin.CGFloat y = v101;
      v292.size.CGFloat width = v103;
      v292.size.CGFloat height = v105;
      CGRectGetMinX(v292);
      UIRectCenteredYInRectScale();
      [(MRUNowPlayingView *)self bounds];
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUNowPlayingHeaderView setFrame:](self->_headerView, "setFrame:");
      [(MRUNowPlayingView *)self bounds];
      CGRectGetMinX(v293);
      goto LABEL_47;
    case 4:
      uint64_t v260 = v13;
      BOOL v106 = +[MRUFeatureFlagProvider isAutobahnEnabled];
      [(MRUNowPlayingView *)self suggestionsFrame];
      CGFloat v108 = v107;
      CGFloat v110 = v109;
      CGFloat v112 = v111;
      CGFloat v114 = v113;
      -[UIView setFrame:](self->_suggestionsView, "setFrame:");
      if (v106)
      {
        if (self->_showSuggestionsView)
        {
          v294.origin.CGFloat x = v108;
          v294.origin.CGFloat y = v110;
          v294.size.CGFloat width = v112;
          v294.size.CGFloat height = v114;
          CGRectGetHeight(v294);
          UIRectInset();
          double v116 = v115;
          double v118 = v117;
          double v120 = v119;
          double v122 = v121;
        }
        else
        {
          double v174 = self->_contentEdgeInsets.top;
          double v175 = self->_contentEdgeInsets.left;
          double v116 = v4 + v175;
          double v118 = v6 + v174;
          double v120 = v8 - (v175 + self->_contentEdgeInsets.right);
          double v122 = v10 - (v174 + self->_contentEdgeInsets.bottom);
        }
        -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v120, v122);
        double v177 = v176;
        double v179 = v178;
        v306.origin.CGFloat x = v116;
        v306.origin.CGFloat y = v118;
        v306.size.CGFloat width = v120;
        v306.size.CGFloat height = v122;
        double v180 = CGRectGetMinX(v306);
        v307.origin.CGFloat x = v116;
        v307.origin.CGFloat y = v118;
        v307.size.CGFloat width = v120;
        v307.size.CGFloat height = v122;
        CGFloat v181 = CGRectGetMaxY(v307);
        double v182 = v181 - v179;
        -[MRUNowPlayingVolumeControlsView setFrame:](self->_volumeControlsView, "setFrame:", v180, v181 - v179, v177, v179);
        if (self->_showVolumeControlsView)
        {
          v308.origin.CGFloat x = v180;
          v308.origin.CGFloat y = v182;
          v308.size.CGFloat width = v177;
          v308.size.CGFloat height = v179;
          CGRectGetHeight(v308);
          UIRectInset();
          double v116 = v183;
          double v118 = v184;
          double v120 = v185;
          double v122 = v186;
        }
        -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v120, v122);
        double v188 = v187;
        double v190 = v189;
        v309.origin.CGFloat x = v116;
        v309.origin.CGFloat y = v118;
        v309.size.CGFloat width = v120;
        v309.size.CGFloat height = v122;
        double v191 = CGRectGetMinX(v309);
        v310.origin.CGFloat x = v116;
        v310.origin.CGFloat y = v118;
        v310.size.CGFloat width = v120;
        v310.size.CGFloat height = v122;
        CGFloat v192 = CGRectGetMaxY(v310);
        double v193 = v192 - v190;
        -[MRUNowPlayingTransportControlsView setFrame:](self->_transportControlsView, "setFrame:", v191, v192 - v190, v188, v190);
        if (self->_showTransportControlsView)
        {
          v311.origin.CGFloat x = v191;
          v311.origin.CGFloat y = v193;
          v311.size.CGFloat width = v188;
          v311.size.CGFloat height = v190;
          CGRectGetHeight(v311);
          UIRectInset();
          double v116 = v194;
          double v118 = v195;
          double v120 = v196;
          double v122 = v197;
        }
        v312.origin.CGFloat x = v116;
        v312.origin.CGFloat y = v118;
        v312.size.CGFloat width = v120;
        v312.size.CGFloat height = v122;
        CGRectGetMinX(v312);
        v313.origin.CGFloat x = v116;
        v313.origin.CGFloat y = v118;
        v313.size.CGFloat width = v120;
        v313.size.CGFloat height = v122;
        CGRectGetMinY(v313);
        [(MRUNowPlayingView *)self bounds];
        MPRectByApplyingUserInterfaceLayoutDirectionInRect();
        -[MRUArtworkView setFrame:](self->_artworkView, "setFrame:");
        if (!self->_showSuggestionsView && self->_showArtworkView)
        {
          UIRectInset();
          double v116 = v198;
          double v118 = v199;
          double v120 = v200;
          double v122 = v201;
        }
        -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v120, v122);
        v314.origin.CGFloat x = v116;
        v314.origin.CGFloat y = v118;
        v314.size.CGFloat width = v120;
        v314.size.CGFloat height = v122;
        CGRectGetMinX(v314);
        v315.origin.CGFloat x = v116;
        v315.origin.CGFloat y = v118;
        v315.size.CGFloat width = v120;
        v315.size.CGFloat height = v122;
        CGRectGetMaxY(v315);
        UIRectInset();
        [(MRUNowPlayingView *)self bounds];
        MPRectByApplyingUserInterfaceLayoutDirectionInRect();
        -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:");
        uint64_t v173 = 432;
        -[MRUNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v120, v122);
        v316.origin.CGFloat x = v116;
        v316.origin.CGFloat y = v118;
        v316.size.CGFloat width = v120;
        v316.size.CGFloat height = v122;
        CGRectGetMinX(v316);
        v317.origin.CGFloat x = v116;
        v317.origin.CGFloat y = v118;
        v317.size.CGFloat width = v120;
        v317.size.CGFloat height = v122;
        CGRectGetMinY(v317);
        [(MRUNowPlayingView *)self bounds];
LABEL_33:
        MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      }
      else
      {
        if (self->_showSuggestionsView)
        {
          v295.origin.CGFloat x = v108;
          v295.origin.CGFloat y = v110;
          v295.size.CGFloat width = v112;
          v295.size.CGFloat height = v114;
          CGRectGetHeight(v295);
          UIRectInset();
          double v124 = v123;
          double v126 = v125;
          double v128 = v127;
          double v130 = v129;
        }
        else
        {
          double v202 = self->_contentEdgeInsets.top;
          double v203 = self->_contentEdgeInsets.left;
          double v124 = v4 + v203;
          double v126 = v6 + v202;
          double v128 = v8 - (v203 + self->_contentEdgeInsets.right);
          double v130 = v10 - (v202 + self->_contentEdgeInsets.bottom);
        }
        v318.origin.CGFloat x = v124;
        v318.origin.CGFloat y = v126;
        v318.size.CGFloat width = v128;
        v318.size.CGFloat height = v130;
        CGFloat v204 = CGRectGetMinX(v318);
        v319.origin.CGFloat x = v124;
        v319.origin.CGFloat y = v126;
        v319.size.CGFloat width = v128;
        v319.size.CGFloat height = v130;
        CGFloat v205 = CGRectGetMinY(v319);
        v320.origin.CGFloat x = v124;
        v320.origin.CGFloat y = v126;
        v320.size.CGFloat width = v128;
        v320.size.CGFloat height = v130;
        double v206 = CGRectGetWidth(v320);
        double v207 = 100.0;
        -[MRUNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v206, 100.0);
        if (self->_showSuggestionsView) {
          double v207 = v208;
        }
        -[MRUArtworkView sizeThatFits:](self->_artworkView, "sizeThatFits:", v206, v207);
        v321.origin.CGFloat x = v204;
        v321.origin.CGFloat y = v205;
        v321.size.CGFloat width = v206;
        v321.size.CGFloat height = v207;
        CGRectGetMinX(v321);
        v322.origin.CGFloat x = v204;
        v322.origin.CGFloat y = v205;
        v322.size.CGFloat width = v206;
        v322.size.CGFloat height = v207;
        CGRectGetMinY(v322);
        [(MRUNowPlayingView *)self bounds];
        MPRectByApplyingUserInterfaceLayoutDirectionInRect();
        -[MRUArtworkView setFrame:](self->_artworkView, "setFrame:");
        if (!self->_showSuggestionsView && self->_showArtworkView)
        {
          UIRectInset();
          CGFloat v204 = v209;
          CGFloat v205 = v210;
          double v206 = v211;
          double v207 = v212;
        }
        v323.origin.CGFloat x = v204;
        v323.origin.CGFloat y = v205;
        v323.size.CGFloat width = v206;
        v323.size.CGFloat height = v207;
        CGRectGetMinX(v323);
        v324.origin.CGFloat x = v204;
        v324.origin.CGFloat y = v205;
        v324.size.CGFloat width = v206;
        v324.size.CGFloat height = v207;
        CGRectGetMinY(v324);
        v325.origin.CGFloat x = v204;
        v325.origin.CGFloat y = v205;
        v325.size.CGFloat width = v206;
        v325.size.CGFloat height = v207;
        CGRectGetWidth(v325);
        UIRectCenteredYInRectScale();
        [(MRUNowPlayingView *)self bounds];
        MPRectByApplyingUserInterfaceLayoutDirectionInRect();
        -[MRUNowPlayingHeaderView setFrame:](self->_headerView, "setFrame:");
        v326.origin.CGFloat x = v204;
        v326.origin.CGFloat y = v205;
        v326.size.CGFloat width = v206;
        v326.size.CGFloat height = v207;
        CGRectGetHeight(v326);
        UIRectInset();
        CGFloat v214 = v213;
        CGFloat v216 = v215;
        double v218 = v217;
        double v220 = v219;
        -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v217, v219);
        double v222 = v221;
        double v224 = v223;
        v327.origin.CGFloat x = v214;
        v327.origin.CGFloat y = v216;
        v327.size.CGFloat width = v218;
        v327.size.CGFloat height = v220;
        double v225 = CGRectGetMinX(v327);
        v328.origin.CGFloat x = v214;
        v328.origin.CGFloat y = v216;
        v328.size.CGFloat width = v218;
        v328.size.CGFloat height = v220;
        double v226 = CGRectGetMinY(v328) - 7.0;
        -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:", v225, v226, v222, v224);
        if (!self->_showSuggestionsView && self->_showTimeControlsView)
        {
          v329.origin.CGFloat x = v225;
          v329.origin.CGFloat y = v226;
          v329.size.CGFloat width = v222;
          v329.size.CGFloat height = v224;
          CGRectGetHeight(v329);
          UIRectInset();
          CGFloat v214 = v227;
          CGFloat v216 = v228;
          double v218 = v229;
          double v220 = v230;
        }
        -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v218, v220);
        double v232 = v231;
        double v234 = v233;
        v330.origin.CGFloat x = v214;
        v330.origin.CGFloat y = v216;
        v330.size.CGFloat width = v218;
        v330.size.CGFloat height = v220;
        double v235 = CGRectGetMinX(v330);
        v331.origin.CGFloat x = v214;
        v331.origin.CGFloat y = v216;
        v331.size.CGFloat width = v218;
        v331.size.CGFloat height = v220;
        CGFloat v236 = CGRectGetMaxY(v331);
        double v237 = v236 - v234;
        -[MRUNowPlayingVolumeControlsView setFrame:](self->_volumeControlsView, "setFrame:", v235, v236 - v234, v232, v234);
        if (self->_showVolumeControlsView)
        {
          v332.origin.CGFloat x = v235;
          v332.origin.CGFloat y = v237;
          v332.size.CGFloat width = v232;
          v332.size.CGFloat height = v234;
          CGRectGetHeight(v332);
          UIRectInset();
          CGFloat v214 = v238;
          CGFloat v216 = v239;
          double v218 = v240;
          double v220 = v241;
        }
        uint64_t v173 = 448;
        -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v218, v220);
        v333.origin.CGFloat x = v214;
        v333.origin.CGFloat y = v216;
        v333.size.CGFloat width = v218;
        v333.size.CGFloat height = v220;
        CGRectGetMinX(v333);
        uint64_t v242 = v260;
        UIRectCenteredYInRectScale();
      }
      [*(id *)((char *)&self->super.super.super.isa + v173) setFrame:v242];
      [(MRUNowPlayingView *)self bounds];
      CGRectGetMaxX(v334);
LABEL_47:
      [(MRUNowPlayingView *)self bounds];
      CGRectGetMinY(v335);
      [(MRUNowPlayingView *)self bounds];
      CGRectGetHeight(v336);
      [(MRUNowPlayingView *)self bounds];
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      transportControlsView = self->_containerView;
LABEL_48:
      objc_msgSend(transportControlsView, "setFrame:");
      return;
    default:
      return;
  }
}

- (void)layoutSubviewsSmall
{
  [(MRUNowPlayingView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(MRUNowPlayingView *)self traitCollection];
  [v11 displayScale];
  uint64_t v13 = v12;

  v36.origin.CGFloat x = v4;
  v36.origin.CGFloat y = v6;
  v36.size.CGFloat width = v8;
  v36.size.CGFloat height = v10;
  CGRectGetHeight(v36);
  UIRoundToScale();
  double v15 = v14 * -0.5;
  -[MRUNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v8, v10);
  UIRectCenteredIntegralRectScale();
  [(MRUNowPlayingHeaderView *)self->_headerView setFrame:v13];
  -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v8, v10);
  double v17 = v16;
  double v19 = v18;
  v37.origin.CGFloat x = v4;
  v37.origin.CGFloat y = v6;
  v37.size.CGFloat width = v8;
  v37.size.CGFloat height = v10;
  CGFloat v20 = CGRectGetMaxY(v37) - v19 + v15 - 6.0;
  v38.origin.CGFloat x = v4;
  v38.origin.CGFloat y = v6;
  v38.size.CGFloat width = v8;
  v38.size.CGFloat height = v10;
  -[MRUNowPlayingTransportControlsView setFrame:](self->_transportControlsView, "setFrame:", CGRectGetMinX(v38), v20, v17, v19);
  [(MRUNowPlayingView *)self suggestionsFrame];
  -[UIView setFrame:](self->_suggestionsView, "setFrame:");
  -[MRUArtworkView setFrame:](self->_artworkView, "setFrame:", v4 + self->_contentEdgeInsets.left, v6 + self->_contentEdgeInsets.top, v8 - (self->_contentEdgeInsets.left + self->_contentEdgeInsets.right), v10 - (self->_contentEdgeInsets.top + self->_contentEdgeInsets.bottom));
  -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v8, v10);
  double v22 = v21;
  double v24 = v23;
  v39.origin.CGFloat x = v4;
  v39.origin.CGFloat y = v6;
  v39.size.CGFloat width = v8;
  v39.size.CGFloat height = v10;
  double MinX = CGRectGetMinX(v39);
  [(MRUNowPlayingHeaderView *)self->_headerView frame];
  -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:", MinX, CGRectGetMaxY(v40), v22, v24);
  -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v8, v10);
  double v27 = v26;
  double v29 = v28;
  v41.origin.CGFloat x = v4;
  v41.origin.CGFloat y = v6;
  v41.size.CGFloat width = v8;
  v41.size.CGFloat height = v10;
  double v30 = CGRectGetMinX(v41);
  [(MRUNowPlayingTransportControlsView *)self->_transportControlsView frame];
  double MaxY = CGRectGetMaxY(v42);
  -[MRUNowPlayingVolumeControlsView setFrame:](self->_volumeControlsView, "setFrame:", v30, MaxY, v27, v29);
  v43.origin.CGFloat x = v30;
  v43.origin.CGFloat y = MaxY;
  v43.size.CGFloat width = v27;
  v43.size.CGFloat height = v29;
  double v32 = CGRectGetMaxY(v43);
  [(MRUNowPlayingView *)self bounds];
  double Width = CGRectGetWidth(v44);
  containerView = self->_containerView;

  -[MRUNowPlayingContainerView setFrame:](containerView, "setFrame:", 0.0, v32, Width, 0.0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  switch(self->_layout)
  {
    case 1:
      if (self->_supportsHorizontalLayout && !MRULayoutShouldBeVertical()) {
        goto LABEL_20;
      }
      double top = self->_contentEdgeInsets.top;
      double v7 = self->_contentEdgeInsets.left + self->_contentEdgeInsets.right;
      double v8 = width - v7;
      double v9 = height - top;
      if (self->_showVolumeControlsView)
      {
        -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", width - v7, v9);
        double v9 = v9 - (v10 + 7.0);
        double top = top + v10 + 7.0;
      }
      if (self->_showTransportControlsView)
      {
        -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v8, v9);
        double v9 = v9 - (v11 + 7.0);
        double top = top + v11 + 7.0;
      }
      if (self->_showTimeControlsView)
      {
        -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v8, v9);
        double v9 = v9 - (v12 + 7.0);
        double top = top + v12 + 7.0;
      }
      -[MRUNowPlayingContainerView sizeThatFits:](self->_containerView, "sizeThatFits:", v8, v9 - 60.0);
      double height = top + 60.0 + v13;
      goto LABEL_62;
    case 2:
      if (self->_supportsHorizontalLayout && !MRULayoutShouldBeVertical())
      {
LABEL_20:
        double v25 = (self->_contentEdgeInsets.left + self->_contentEdgeInsets.right) * 1.5;
        double v26 = height - (self->_contentEdgeInsets.top + self->_contentEdgeInsets.bottom);
        if (width - v25 < v26) {
          double v26 = width - v25;
        }
        double v27 = v25 + v26 * 2.0;
        if (v27 < width) {
          double width = v27;
        }
      }
      else
      {
        double bottom = self->_contentEdgeInsets.bottom;
        double v15 = self->_contentEdgeInsets.left + self->_contentEdgeInsets.right;
        if (self->_showSuggestionsView)
        {
          -[UIView sizeThatFits:](self->_suggestionsView, "sizeThatFits:", width, height);
          double v17 = height - bottom - v16;
          double v18 = bottom + v16;
        }
        else
        {
          double v18 = bottom + self->_contentEdgeInsets.top;
          double v17 = height - v18;
        }
        double v41 = width - v15;
        if (self->_showVolumeControlsView)
        {
          -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v41, v17);
          double v17 = v17 - (v42 + 7.0);
          double v18 = v18 + v42 + 7.0;
        }
        if (self->_showTransportControlsView)
        {
          -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v41, v17);
          double v17 = v17 - (v43 + 7.0);
          double v18 = v18 + v43 + 7.0;
        }
        if (self->_showTimeControlsView && !self->_showSuggestionsView)
        {
          -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v41, v17);
          double v17 = v17 - (v44 + 7.0);
          double v18 = v18 + v44 + 7.0;
        }
        -[MRUNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v41, v17);
        double height = v18 + v45;
        if (!self->_showSuggestionsView)
        {
          double v38 = v17 - v45;
          artworkView = self->_artworkView;
          double v37 = v41;
          goto LABEL_51;
        }
      }
      goto LABEL_62;
    case 3:
      -[MRUNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", a3.width, a3.height);
      if (v19 <= 60.0) {
        double height = 60.0;
      }
      else {
        double height = v19;
      }
      goto LABEL_62;
    case 4:
      double v20 = self->_contentEdgeInsets.bottom;
      double v21 = self->_contentEdgeInsets.left + self->_contentEdgeInsets.right;
      if (self->_showSuggestionsView)
      {
        -[UIView sizeThatFits:](self->_suggestionsView, "sizeThatFits:", a3.width, a3.height);
        double v23 = height - v20 - v22;
        double v24 = v20 + v22;
      }
      else
      {
        double v24 = v20 + self->_contentEdgeInsets.top;
        double v23 = a3.height - v24;
      }
      double v28 = width - v21;
      BOOL v29 = +[MRUFeatureFlagProvider isAutobahnEnabled];
      headerView = self->_headerView;
      if (v29)
      {
        -[MRUNowPlayingHeaderView sizeThatFits:](headerView, "sizeThatFits:", v28, v23);
        if (self->_showArtworkView && !self->_showSuggestionsView)
        {
          double v32 = 57.0;
          if (v31 > 57.0) {
            double v32 = v31;
          }
          double v31 = v32 + 7.0;
        }
        double v33 = v23 - v31;
        double height = v24 + v31;
        if (self->_showTimeControlsView)
        {
          -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v28, v33);
          double v33 = v33 - v34;
          double height = height + v34;
        }
        if (self->_showTransportControlsView)
        {
          -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v28, v33);
          double v33 = v33 - (v35 + 7.0);
          double height = height + v35 + 7.0;
        }
        if (self->_showVolumeControlsView)
        {
          artworkView = self->_volumeControlsView;
          double v37 = v28;
          double v38 = v33;
LABEL_51:
          objc_msgSend(artworkView, "sizeThatFits:", v37, v38);
          goto LABEL_61;
        }
      }
      else
      {
        -[MRUNowPlayingHeaderView sizeThatFits:](headerView, "sizeThatFits:", v28, v23);
        if (self->_showArtworkView && !self->_showSuggestionsView)
        {
          double v40 = 100.0;
          if (v39 > 100.0) {
            double v40 = v39;
          }
        }
        else
        {
          double v40 = v39 + 7.0 * 2.0;
        }
        double v47 = v23 - v40;
        double height = v24 + v40;
        if (self->_showTimeControlsView && !self->_showSuggestionsView)
        {
          -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v28, v47);
          double v47 = v47 - (v48 + 7.0);
          double height = height + v48 + 7.0;
        }
        if (self->_showTransportControlsView)
        {
          -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v28, v47);
          double v47 = v47 - (v49 + 7.0);
          double height = height + v49 + 7.0;
        }
        if (self->_showVolumeControlsView)
        {
          -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v28, v47);
LABEL_61:
          double height = height + v46 + 7.0;
        }
      }
LABEL_62:
      double v50 = width;
      double v51 = height;
      result.double height = v51;
      result.double width = v50;
      return result;
    default:
      goto LABEL_62;
  }
}

- (UIView)contentView
{
  return [(MRUNowPlayingContainerView *)self->_containerView contentView];
}

- (void)setContentView:(id)a3
{
}

- (void)setLayout:(int64_t)a3
{
  if (self->_layout != a3)
  {
    self->_layout = a3;
    [(MRUNowPlayingView *)self updateLayout];
    [(MRUNowPlayingView *)self updateArtworkStyle];
    [(MRUNowPlayingView *)self updateTextAlignment];
    [(MRUNowPlayingView *)self updateOnScreen];
    [(MRUNowPlayingView *)self updateVisibility];
    [(MRUNowPlayingView *)self setNeedsLayout];
  }
}

- (void)setContext:(int64_t)a3
{
  if (self->_context != a3)
  {
    self->_context = a3;
    [(MRUNowPlayingView *)self updateArtworkStyle];
    [(MRUNowPlayingView *)self setNeedsLayout];
  }
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
    [(MRUNowPlayingContainerView *)self->_containerView setStylingProvider:v5];
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
    [(MRUNowPlayingView *)self addSubview:v5];
    double v7 = (void *)MEMORY[0x1E4FB1EB0];
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    double v10 = __40__MRUNowPlayingView_setSuggestionsView___block_invoke;
    double v11 = &unk_1E5F0D8E8;
    double v12 = v5;
    double v13 = self;
    [v7 performWithoutAnimation:&v8];
    [(MRUNowPlayingView *)self updateVisibility];
    [(MRUNowPlayingView *)self setNeedsLayout];
  }
}

uint64_t __40__MRUNowPlayingView_setSuggestionsView___block_invoke(uint64_t a1)
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
    [(MRUNowPlayingView *)self updateOnScreen];
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
    [(MRUNowPlayingView *)self updateOnScreen];
  }
}

- (void)setShowArtworkView:(BOOL)a3
{
  if (self->_showArtworkView != a3)
  {
    self->_showArtworkView = a3;
    [(MRUNowPlayingView *)self updateTextAlignment];
    [(MRUNowPlayingView *)self updateVisibility];
    [(MRUNowPlayingView *)self setNeedsLayout];
  }
}

- (void)setShowTimeControlsView:(BOOL)a3
{
  if (self->_showTimeControlsView != a3)
  {
    self->_showTimeControlsView = a3;
    [(MRUNowPlayingView *)self updateVisibility];
    [(MRUNowPlayingView *)self setNeedsLayout];
  }
}

- (void)setShowTransportControlsView:(BOOL)a3
{
  if (self->_showTransportControlsView != a3)
  {
    self->_showTransportControlsView = a3;
    [(MRUNowPlayingView *)self updateVisibility];
    [(MRUNowPlayingView *)self setNeedsLayout];
  }
}

- (void)setShowVolumeControlsView:(BOOL)a3
{
  if (self->_showVolumeControlsView != a3)
  {
    self->_showVolumeControlsView = a3;
    [(MRUNowPlayingView *)self updateVisibility];
    [(MRUNowPlayingView *)self setNeedsLayout];
  }
}

- (void)setShowSuggestionsView:(BOOL)a3
{
  if (self->_showSuggestionsView != a3)
  {
    self->_showSuggestionsView = a3;
    [(MRUNowPlayingView *)self updateTextAlignment];
    [(MRUNowPlayingView *)self updateVisibility];
    [(MRUNowPlayingView *)self setNeedsLayout];
  }
}

- (void)setSupportsHorizontalLayout:(BOOL)a3
{
  if (self->_supportsHorizontalLayout != a3)
  {
    self->_supportsHorizontalLayout = a3;
    [(MRUNowPlayingContainerView *)self->_containerView setSupportsHorizontalLayout:"setSupportsHorizontalLayout:"];
    [(MRUNowPlayingView *)self setNeedsLayout];
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
    [(MRUNowPlayingView *)self setNeedsLayout];
  }
}

- (void)setUseArtworkOverrideSize:(BOOL)a3
{
  self->_useArtworkOverrideSize = a3;
  [(MRUNowPlayingView *)self setNeedsLayout];

  [(MRUNowPlayingView *)self updateVisibility];
}

- (void)updateArtworkStyle
{
  [(MRUArtworkView *)self->_artworkView setShowPlaceholder:self->_context != 3];
  uint64_t v3 = 0;
  switch(self->_layout)
  {
    case 0:
    case 1:
      goto LABEL_7;
    case 2:
      uint64_t v3 = 2;
      goto LABEL_7;
    case 3:
      if (self->_context == 3) {
        uint64_t v3 = 6;
      }
      else {
        uint64_t v3 = 0;
      }
      goto LABEL_7;
    case 4:
      uint64_t v3 = 1;
LABEL_7:
      artworkView = self->_artworkView;
      [(MRUArtworkView *)artworkView setStyle:v3];
      break;
    default:
      return;
  }
}

- (void)updateLayout
{
  [(MRUNowPlayingHeaderView *)self->_headerView setLayout:MRUNowPlayingHeaderLayoutFromNowPlayingLayout(self->_layout)];
  uint64_t v3 = MRUNowPlayingLabelViewLayoutFromNowPlayingLayout(self->_layout);
  double v4 = [(MRUNowPlayingHeaderView *)self->_headerView labelView];
  [v4 setLayout:v3];

  [(MRUNowPlayingTimeControlsView *)self->_timeControlsView setLayout:MRUNowPlayingTimeControlsLayoutFromNowPlayingLayout(self->_layout)];
  [(MRUNowPlayingTransportControlsView *)self->_transportControlsView setLayout:MRUNowPlayingTransportControlsLayoutFromNowPlayingLayout(self->_layout)];
  BOOL v5 = MRUNowPlayingTimeControlsLayoutFromNowPlayingLayout(self->_layout);
  volumeControlsView = self->_volumeControlsView;

  [(MRUNowPlayingVolumeControlsView *)volumeControlsView setLayout:v5];
}

- (void)updateTextAlignment
{
  int64_t layout = self->_layout;
  if (!layout) {
    goto LABEL_5;
  }
  if (layout == 4
    && +[MRUFeatureFlagProvider isAutobahnEnabled])
  {
    if (self->_showSuggestionsView)
    {
LABEL_5:
      uint64_t v4 = 1;
      goto LABEL_7;
    }
    if (self->_showArtworkView) {
      uint64_t v4 = 4;
    }
    else {
      uint64_t v4 = 1;
    }
  }
  else
  {
    uint64_t v4 = 4;
  }
LABEL_7:
  headerView = self->_headerView;

  [(MRUNowPlayingHeaderView *)headerView setTextAlignment:v4];
}

- (void)updateOnScreen
{
  unint64_t layout = self->_layout;
  if (layout <= 4)
  {
    if (((1 << layout) & 0x16) != 0)
    {
      BOOL v4 = self->_onScreen && !self->_dimmed;
      double v7 = [(MRUNowPlayingHeaderView *)self->_headerView labelView];
      [v7 setMarqueeEnabled:v4];

      BOOL onScreen = self->_onScreen;
    }
    else
    {
      BOOL v5 = [(MRUNowPlayingHeaderView *)self->_headerView labelView];
      [v5 setMarqueeEnabled:0];

      BOOL onScreen = 0;
    }
    timeControlsView = self->_timeControlsView;
    [(MRUNowPlayingTimeControlsView *)timeControlsView setOnScreen:onScreen];
  }
}

- (void)updateVisibility
{
  switch(self->_layout)
  {
    case 0:
      double v3 = 0.0;
      [(MRUArtworkView *)self->_artworkView setAlpha:0.0];
      [(MRUNowPlayingHeaderView *)self->_headerView setAlpha:1.0];
      [(MRUNowPlayingTimeControlsView *)self->_timeControlsView setAlpha:0.0];
      transportControlsView = self->_transportControlsView;
      double v5 = 1.0;
      goto LABEL_23;
    case 1:
      [(MRUArtworkView *)self->_artworkView setAlpha:1.0];
      [(MRUNowPlayingHeaderView *)self->_headerView setAlpha:1.0];
      double v3 = 0.0;
      if (self->_showTimeControlsView) {
        double v6 = 1.0;
      }
      else {
        double v6 = 0.0;
      }
      [(MRUNowPlayingTimeControlsView *)self->_timeControlsView setAlpha:v6];
      if (self->_showTransportControlsView) {
        double v7 = 1.0;
      }
      else {
        double v7 = 0.0;
      }
      [(MRUNowPlayingTransportControlsView *)self->_transportControlsView setAlpha:v7];
      volumeControlsView = self->_volumeControlsView;
      double v9 = 1.0;
      goto LABEL_24;
    case 2:
      double v10 = 0.0;
      double v11 = 0.0;
      if (!self->_showSuggestionsView)
      {
        double v11 = 1.0;
        if (!self->_showArtworkView) {
          double v11 = 0.0;
        }
      }
      [(MRUArtworkView *)self->_artworkView setAlpha:v11];
      double v12 = 1.0;
      [(MRUNowPlayingHeaderView *)self->_headerView setAlpha:1.0];
      if (self->_showTimeControlsView)
      {
        double v10 = 1.0;
        if (self->_showSuggestionsView)
        {
          if (MRULayoutShouldBeVertical()) {
            double v10 = 0.0;
          }
          else {
            double v10 = 1.0;
          }
        }
      }
      [(MRUNowPlayingTimeControlsView *)self->_timeControlsView setAlpha:v10];
      double v3 = 0.0;
      if (self->_showTransportControlsView) {
        double v13 = 1.0;
      }
      else {
        double v13 = 0.0;
      }
      [(MRUNowPlayingTransportControlsView *)self->_transportControlsView setAlpha:v13];
      double v14 = self->_volumeControlsView;
      double v15 = 1.0;
      goto LABEL_40;
    case 3:
      [(MRUArtworkView *)self->_artworkView setAlpha:1.0];
      [(MRUNowPlayingHeaderView *)self->_headerView setAlpha:1.0];
      double v3 = 0.0;
      [(MRUNowPlayingTimeControlsView *)self->_timeControlsView setAlpha:0.0];
      transportControlsView = self->_transportControlsView;
      double v5 = 0.0;
LABEL_23:
      [(MRUNowPlayingTransportControlsView *)transportControlsView setAlpha:v5];
      volumeControlsView = self->_volumeControlsView;
      double v9 = 0.0;
LABEL_24:
      [(MRUNowPlayingVolumeControlsView *)volumeControlsView setAlpha:v9];
      goto LABEL_42;
    case 4:
      double v16 = 0.0;
      double v17 = 0.0;
      if (!self->_showSuggestionsView)
      {
        double v17 = 1.0;
        if (!self->_showArtworkView) {
          double v17 = 0.0;
        }
      }
      [(MRUArtworkView *)self->_artworkView setAlpha:v17];
      double v12 = 1.0;
      [(MRUNowPlayingHeaderView *)self->_headerView setAlpha:1.0];
      if (self->_showTimeControlsView)
      {
        double v16 = 1.0;
        if (self->_showSuggestionsView)
        {
          if (+[MRUFeatureFlagProvider isAutobahnEnabled]) {
            double v16 = 1.0;
          }
          else {
            double v16 = 0.0;
          }
        }
      }
      [(MRUNowPlayingTimeControlsView *)self->_timeControlsView setAlpha:v16];
      double v3 = 0.0;
      if (self->_showTransportControlsView) {
        double v18 = 1.0;
      }
      else {
        double v18 = 0.0;
      }
      [(MRUNowPlayingTransportControlsView *)self->_transportControlsView setAlpha:v18];
      if (self->_showVolumeControlsView) {
        double v15 = 1.0;
      }
      else {
        double v15 = 0.0;
      }
      double v14 = self->_volumeControlsView;
LABEL_40:
      [(MRUNowPlayingVolumeControlsView *)v14 setAlpha:v15];
      if (self->_showSuggestionsView) {
        double v3 = v12;
      }
LABEL_42:
      suggestionsView = self->_suggestionsView;
      [(UIView *)suggestionsView setAlpha:v3];
      break;
    default:
      return;
  }
}

- (CGRect)suggestionsFrame
{
  [(MRUNowPlayingView *)self bounds];
  CGFloat v8 = v7;
  CGFloat v9 = MinY;
  double v11 = v10;
  double v13 = v12;
  if (self->_supportsHorizontalLayout && !MRULayoutShouldBeVertical())
  {
    switch(self->_layout)
    {
      case 0:
        -[UIView sizeThatFits:](self->_suggestionsView, "sizeThatFits:", v11, v13);
        v33.origin.CGFloat x = v8;
        v33.origin.CGFloat y = v9;
        v33.size.double width = v11;
        v33.size.double height = v13;
        CGRectGetMinX(v33);
        v34.origin.CGFloat x = v8;
        v34.origin.CGFloat y = v9;
        v34.size.double width = v11;
        v34.size.double height = v13;
        CGRectGetMinY(v34);
        [(MRUNowPlayingView *)self bounds];
        goto LABEL_13;
      case 1:
      case 3:
        v27.origin.CGFloat x = v8;
        v27.origin.CGFloat y = v9;
        v27.size.double width = v11;
        v27.size.double height = v13;
        CGRectGetMinX(v27);
        v28.origin.CGFloat x = v8;
        v28.origin.CGFloat y = v9;
        v28.size.double width = v11;
        v28.size.double height = v13;
        CGRectGetWidth(v28);
        v29.origin.CGFloat x = v8;
        v29.origin.CGFloat y = v9;
        v29.size.double width = v11;
        v29.size.double height = v13;
        CGRectGetMinY(v29);
        v30.origin.CGFloat x = v8;
        v30.origin.CGFloat y = v9;
        v30.size.double width = v11;
        v30.size.double height = v13;
        CGRectGetWidth(v30);
        goto LABEL_12;
      case 2:
        v35.origin.CGFloat x = v8;
        v35.origin.CGFloat y = v9;
        v35.size.double width = v11;
        v35.size.double height = v13;
        CGRectGetMinX(v35);
        v36.origin.CGFloat x = v8;
        v36.origin.CGFloat y = v9;
        v36.size.double width = v11;
        v36.size.double height = v13;
        CGRectGetMinY(v36);
        v37.origin.CGFloat x = v8;
        v37.origin.CGFloat y = v9;
        v37.size.double width = v11;
        v37.size.double height = v13;
        CGRectGetWidth(v37);
LABEL_12:
        v38.origin.CGFloat x = v8;
        v38.origin.CGFloat y = v9;
        v38.size.double width = v11;
        v38.size.double height = v13;
        CGRectGetHeight(v38);
        [(MRUNowPlayingView *)self bounds];
LABEL_13:
        MPRectByApplyingUserInterfaceLayoutDirectionInRect();
        CGFloat MinX = v19;
        double v2 = v20;
        double v3 = v21;
        break;
      case 4:
        goto LABEL_8;
      default:
        break;
    }
  }
  else
  {
    unint64_t layout = self->_layout;
    if (layout <= 4)
    {
      if (((1 << layout) & 0xB) != 0)
      {
        -[UIView sizeThatFits:](self->_suggestionsView, "sizeThatFits:", v11, v13);
        double v2 = v15;
        double v3 = v16;
        v25.origin.CGFloat x = v8;
        v25.origin.CGFloat y = v9;
        v25.size.double width = v11;
        v25.size.double height = v13;
        CGFloat MinX = CGRectGetMinX(v25);
        v26.origin.CGFloat x = v8;
        v26.origin.CGFloat y = v9;
        v26.size.double width = v11;
        v26.size.double height = v13;
        double MinY = CGRectGetMinY(v26) - v3;
      }
      else
      {
LABEL_8:
        -[UIView sizeThatFits:](self->_suggestionsView, "sizeThatFits:", v11, v13);
        double v2 = v17;
        double v3 = v18;
        v31.origin.CGFloat x = v8;
        v31.origin.CGFloat y = v9;
        v31.size.double width = v11;
        v31.size.double height = v13;
        CGFloat MinX = CGRectGetMinX(v31);
        v32.origin.CGFloat x = v8;
        v32.origin.CGFloat y = v9;
        v32.size.double width = v11;
        v32.size.double height = v13;
        double MinY = CGRectGetMinY(v32);
      }
    }
  }
  double v22 = MinX;
  double v23 = v2;
  double v24 = v3;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.CGFloat y = MinY;
  result.origin.CGFloat x = v22;
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

- (int64_t)layout
{
  return self->_layout;
}

- (int64_t)context
{
  return self->_context;
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

- (BOOL)showTimeControlsView
{
  return self->_showTimeControlsView;
}

- (BOOL)showTransportControlsView
{
  return self->_showTransportControlsView;
}

- (BOOL)showVolumeControlsView
{
  return self->_showVolumeControlsView;
}

- (BOOL)showSuggestionsView
{
  return self->_showSuggestionsView;
}

- (BOOL)supportsHorizontalLayout
{
  return self->_supportsHorizontalLayout;
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

- (BOOL)useArtworkOverrideSize
{
  return self->_useArtworkOverrideSize;
}

- (CGSize)artworkOverrideSize
{
  double width = self->_artworkOverrideSize.width;
  double height = self->_artworkOverrideSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setArtworkOverrideSize:(CGSize)a3
{
  self->_artworkOverrideSize = a3;
}

- (MRUNowPlayingContainerView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_suggestionsView, 0);
  objc_storeStrong((id *)&self->_volumeControlsView, 0);
  objc_storeStrong((id *)&self->_transportControlsView, 0);
  objc_storeStrong((id *)&self->_timeControlsView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);

  objc_storeStrong((id *)&self->_artworkView, 0);
}

@end