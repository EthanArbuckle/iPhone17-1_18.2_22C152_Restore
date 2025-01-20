@interface CPUINowPlayingView
- (BOOL)buttonShapesVisible;
- (CPUINowPlayingLayoutProtocol)nowPlayingLayout;
- (CPUINowPlayingView)initWithFrame:(CGRect)a3;
- (CPUIPlayModeControlView)playModeControlView;
- (CPUIProgressView)progressView;
- (CPUIShadowImageView)artworkViewBrick;
- (CPUISongDetailsView)songDetailsView;
- (CPUITransportControlView)transportControlView;
- (NSArray)activeConstraints;
- (NSArray)verticalSpacerLayoutGuides;
- (NSLayoutConstraint)songDetailsViewHeightConstraint;
- (UIFocusContainerGuide)bottomRegionFocusContainerGuide;
- (UIFocusContainerGuide)controlsFocusContainerGuide;
- (UIImageView)progressImageView;
- (UIView)badgeAnnotationView;
- (id)_constraintsForNowPlayingLayout:(id)a3;
- (id)_equalHeightVerticalSpacers:(unint64_t)a3 minimumPadding:(double)a4 maximumPadding:(double)a5;
- (void)recalculateLayout:(BOOL)a3 allowsAlbumArt:(BOOL)a4 hasDataSource:(BOOL)a5 viewArea:(CGRect)a6 safeArea:(CGRect)a7 rightHandDrive:(BOOL)a8;
- (void)setActiveConstraints:(id)a3;
- (void)setBadgeAnnotationView:(id)a3;
- (void)setBottomRegionFocusContainerGuide:(id)a3;
- (void)setButtonShapesVisible:(BOOL)a3;
- (void)setControlsFocusContainerGuide:(id)a3;
- (void)setSongDetailsViewHeightConstraint:(id)a3;
- (void)setVerticalSpacerLayoutGuides:(id)a3;
@end

@implementation CPUINowPlayingView

- (CPUINowPlayingView)initWithFrame:(CGRect)a3
{
  v31.receiver = self;
  v31.super_class = (Class)CPUINowPlayingView;
  v3 = -[CPUINowPlayingView initWithFrame:](&v31, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F825C8] clearColor];
    [(CPUINowPlayingView *)v3 setBackgroundColor:v4];

    [(CPUINowPlayingView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    v5 = [(CPUINowPlayingView *)v3 layer];
    [v5 setAllowsGroupOpacity:0];

    v6 = [(CPUINowPlayingView *)v3 layer];
    [v6 setAllowsGroupBlending:0];

    v7 = objc_alloc_init(CPUIShadowImageView);
    artworkViewBrick = v3->_artworkViewBrick;
    v3->_artworkViewBrick = v7;

    [(CPUIShadowImageView *)v3->_artworkViewBrick setContentMode:1];
    [(CPUIShadowImageView *)v3->_artworkViewBrick setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CPUINowPlayingView *)v3 addSubview:v3->_artworkViewBrick];
    v9 = [CPUISongDetailsView alloc];
    double v10 = *MEMORY[0x263F001A8];
    double v11 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v12 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v13 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v14 = -[CPUISongDetailsView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x263F001A8], v11, v12, v13);
    songDetailsView = v3->_songDetailsView;
    v3->_songDetailsView = (CPUISongDetailsView *)v14;

    [(CPUISongDetailsView *)v3->_songDetailsView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CPUINowPlayingView *)v3 addSubview:v3->_songDetailsView];
    v16 = -[CPUITransportControlView initWithFrame:]([CPUITransportControlView alloc], "initWithFrame:", v10, v11, v12, v13);
    transportControlView = v3->_transportControlView;
    v3->_transportControlView = v16;

    [(CPUITransportControlView *)v3->_transportControlView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CPUINowPlayingView *)v3 addSubview:v3->_transportControlView];
    v18 = -[CPUIProgressView initWithFrame:]([CPUIProgressView alloc], "initWithFrame:", v10, v11, v12, v13);
    progressView = v3->_progressView;
    v3->_progressView = v18;

    [(CPUIProgressView *)v3->_progressView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CPUINowPlayingView *)v3 addSubview:v3->_progressView];
    v20 = -[CPUIPlayModeControlView initWithFrame:]([CPUIPlayModeControlView alloc], "initWithFrame:", v10, v11, v12, v13);
    playModeControlView = v3->_playModeControlView;
    v3->_playModeControlView = v20;

    [(CPUIPlayModeControlView *)v3->_playModeControlView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CPUINowPlayingView *)v3 addSubview:v3->_playModeControlView];
    uint64_t v22 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:0];
    progressImageView = v3->_progressImageView;
    v3->_progressImageView = (UIImageView *)v22;

    [(UIImageView *)v3->_progressImageView setContentMode:1];
    [(UIImageView *)v3->_progressImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v3->_progressImageView setHidden:1];
    [(CPUINowPlayingView *)v3 addSubview:v3->_progressImageView];
    v24 = (UIFocusContainerGuide *)objc_alloc_init(MEMORY[0x263F82740]);
    controlsFocusContainerGuide = v3->_controlsFocusContainerGuide;
    v3->_controlsFocusContainerGuide = v24;

    v26 = [(CPUINowPlayingView *)v3 controlsFocusContainerGuide];
    [(CPUINowPlayingView *)v3 addLayoutGuide:v26];

    v27 = (UIFocusContainerGuide *)objc_alloc_init(MEMORY[0x263F82740]);
    bottomRegionFocusContainerGuide = v3->_bottomRegionFocusContainerGuide;
    v3->_bottomRegionFocusContainerGuide = v27;

    v29 = [(CPUINowPlayingView *)v3 bottomRegionFocusContainerGuide];
    [(CPUINowPlayingView *)v3 addLayoutGuide:v29];
  }
  return v3;
}

- (void)recalculateLayout:(BOOL)a3 allowsAlbumArt:(BOOL)a4 hasDataSource:(BOOL)a5 viewArea:(CGRect)a6 safeArea:(CGRect)a7 rightHandDrive:(BOOL)a8
{
  BOOL v8 = a8;
  CGFloat height = a7.size.height;
  CGFloat width = a7.size.width;
  CGFloat y = a7.origin.y;
  CGFloat x = a7.origin.x;
  double v13 = a6.size.height;
  double v14 = a6.size.width;
  double v15 = a6.origin.y;
  double v16 = a6.origin.x;
  BOOL v17 = a5;
  BOOL v18 = a4;
  id v36 = [(CPUINowPlayingView *)self nowPlayingLayout];
  v21 = [(CPUINowPlayingView *)self traitCollection];
  [v21 displayScale];
  v29 = CPUINowPlayingLayoutForSafeAreaFrameScaleArtwork(v18, x, y, width, height, v16, v15, v14, v13, v8, v22, v23, v24, v25, v26, v27, v28);

  if (a3 || ![v36 isEqual:v29])
  {
    objc_storeStrong((id *)&self->_nowPlayingLayout, v29);
    -[CPUIPlayModeControlView setShowsArtwork:](self->_playModeControlView, "setShowsArtwork:", [v29 showsArtwork]);
    -[CPUISongDetailsView setFontStyle:](self->_songDetailsView, "setFontStyle:", [v29 trackInfoFontStyle]);
    [v29 maximumTitleViewSize];
    -[CPUISongDetailsView setMaximumTitleViewSize:](self->_songDetailsView, "setMaximumTitleViewSize:");
    [v29 transportControlButtonHeight];
    -[CPUITransportControlView setButtonHeight:](self->_transportControlView, "setButtonHeight:");
    [v29 transportControlButtonSpacing];
    -[CPUITransportControlView setButtonSpacing:](self->_transportControlView, "setButtonSpacing:");
    -[CPUIShadowImageView setHidden:](self->_artworkViewBrick, "setHidden:", [v29 showsArtwork] ^ 1);
    [v29 playModeControlButtonWidth];
    -[CPUIPlayModeControlView setButtonWidth:](self->_playModeControlView, "setButtonWidth:");
    [v29 playModeControlButtonSpacing];
    -[CPUIPlayModeControlView setButtonSpacing:](self->_playModeControlView, "setButtonSpacing:");
    v30 = (void *)MEMORY[0x263F08938];
    objc_super v31 = [(CPUINowPlayingView *)self activeConstraints];
    [v30 deactivateConstraints:v31];

    v32 = [(CPUINowPlayingView *)self _constraintsForNowPlayingLayout:v29];
    [(CPUINowPlayingView *)self setActiveConstraints:v32];

    v33 = (void *)MEMORY[0x263F08938];
    v34 = [(CPUINowPlayingView *)self activeConstraints];
    [v33 activateConstraints:v34];
  }
  BOOL v35 = !v17;
  [(CPUITransportControlView *)self->_transportControlView setHidden:v35];
  [(CPUITransportControlView *)self->_transportControlView setNeedsUpdateConstraints];
  [(CPUIPlayModeControlView *)self->_playModeControlView setHidden:v35];
  [(CPUISongDetailsView *)self->_songDetailsView setHidden:v35];
}

- (id)_equalHeightVerticalSpacers:(unint64_t)a3 minimumPadding:(double)a4 maximumPadding:(double)a5
{
  v9 = [MEMORY[0x263EFF980] array];
  if (a3)
  {
    uint64_t v10 = 0;
    do
    {
      double v11 = objc_opt_new();
      [(CPUINowPlayingView *)self addLayoutGuide:v11];
      [v9 addObject:v11];
      if (a4 > 0.0)
      {
        double v12 = [v11 heightAnchor];
        double v13 = [v12 constraintGreaterThanOrEqualToConstant:a4];

        [v13 setActive:1];
      }
      if (a5 > 0.0)
      {
        double v14 = [v11 heightAnchor];
        double v15 = [v14 constraintLessThanOrEqualToConstant:a5];

        [v15 setActive:1];
      }
      if (v10)
      {
        double v16 = [v11 heightAnchor];
        BOOL v17 = [v9 objectAtIndexedSubscript:v10 - 1];
        BOOL v18 = [v17 heightAnchor];
        v19 = [v16 constraintEqualToAnchor:v18];

        [v19 setActive:1];
      }

      ++v10;
    }
    while (a3 != v10);
  }
  return v9;
}

- (id)_constraintsForNowPlayingLayout:(id)a3
{
  v339[14] = *MEMORY[0x263EF8340];
  v327 = objc_opt_new();
  v4 = [(CPUINowPlayingView *)self nowPlayingLayout];
  [v4 layoutMargins];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v326 = [(CPUINowPlayingView *)self safeAreaLayoutGuide];
  double v13 = [(CPUINowPlayingView *)self verticalSpacerLayoutGuides];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    double v15 = [(CPUINowPlayingView *)self verticalSpacerLayoutGuides];
    v328[0] = MEMORY[0x263EF8330];
    v328[1] = 3221225472;
    v328[2] = __54__CPUINowPlayingView__constraintsForNowPlayingLayout___block_invoke;
    v328[3] = &unk_26482D720;
    v328[4] = self;
    [v15 enumerateObjectsUsingBlock:v328];
  }
  v323 = [MEMORY[0x263EFF980] array];
  +[CPUISongDetailsView maximumHeightForTrackInfoFontStyle:](CPUISongDetailsView, "maximumHeightForTrackInfoFontStyle:", [v4 trackInfoFontStyle]);
  double v17 = v16;
  [v4 maximumTitleViewSize];
  if (v17 >= v18) {
    double v17 = v18;
  }
  v310 = [(UIFocusContainerGuide *)self->_controlsFocusContainerGuide topAnchor];
  v304 = [(CPUIProgressView *)v326 topAnchor];
  v298 = [v310 constraintEqualToAnchor:v304];
  v339[0] = v298;
  v292 = [(UIFocusContainerGuide *)self->_controlsFocusContainerGuide bottomAnchor];
  v285 = [(CPUIProgressView *)v326 bottomAnchor];
  v278 = [v292 constraintEqualToAnchor:v285];
  v339[1] = v278;
  v271 = [(UIFocusContainerGuide *)self->_controlsFocusContainerGuide leadingAnchor];
  v264 = [(CPUIProgressView *)v326 leadingAnchor];
  v257 = [v271 constraintEqualToAnchor:v264];
  v339[2] = v257;
  v250 = [(UIFocusContainerGuide *)self->_controlsFocusContainerGuide trailingAnchor];
  v243 = [(CPUIProgressView *)v326 trailingAnchor];
  v236 = [v250 constraintEqualToAnchor:v243];
  v339[3] = v236;
  v229 = [(CPUISongDetailsView *)self->_songDetailsView heightAnchor];
  v222 = [v229 constraintGreaterThanOrEqualToConstant:v17];
  v339[4] = v222;
  v215 = [(CPUIProgressView *)self->_progressView heightAnchor];
  v208 = [v215 constraintEqualToConstant:14.0];
  v339[5] = v208;
  v201 = [(UIImageView *)self->_progressImageView centerXAnchor];
  v195 = [(CPUIProgressView *)self->_progressView centerXAnchor];
  v191 = [v201 constraintEqualToAnchor:v195];
  v339[6] = v191;
  v186 = [(UIImageView *)self->_progressImageView topAnchor];
  p_transportControlView = &self->_transportControlView;
  v181 = [(CPUITransportControlView *)self->_transportControlView bottomAnchor];
  v178 = [v186 constraintEqualToAnchor:v181];
  v339[7] = v178;
  v175 = [(UIImageView *)self->_progressImageView bottomAnchor];
  v173 = [(CPUIPlayModeControlView *)self->_playModeControlView topAnchor];
  v171 = [v175 constraintEqualToAnchor:v173];
  v339[8] = v171;
  v169 = [(CPUIPlayModeControlView *)self->_playModeControlView heightAnchor];
  v167 = [v169 constraintEqualToConstant:26.0];
  v339[9] = v167;
  v166 = [(UIFocusContainerGuide *)self->_bottomRegionFocusContainerGuide leadingAnchor];
  v165 = [(CPUIProgressView *)v326 leadingAnchor];
  [v166 constraintEqualToAnchor:v165];
  v19 = v325 = v4;
  v339[10] = v19;
  v20 = [(UIFocusContainerGuide *)self->_bottomRegionFocusContainerGuide trailingAnchor];
  v21 = [(CPUIProgressView *)v326 trailingAnchor];
  uint64_t v22 = [v20 constraintEqualToAnchor:v21];
  v339[11] = v22;
  uint64_t v23 = [(UIFocusContainerGuide *)self->_bottomRegionFocusContainerGuide bottomAnchor];
  uint64_t v24 = [(CPUIProgressView *)v326 bottomAnchor];
  uint64_t v25 = [v23 constraintEqualToAnchor:v24];
  v339[12] = v25;
  v324 = self;
  uint64_t v26 = [(UIFocusContainerGuide *)self->_bottomRegionFocusContainerGuide heightAnchor];
  uint64_t v27 = [v26 constraintEqualToConstant:26.0];
  v339[13] = v27;
  uint64_t v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v339 count:14];
  [v327 addObjectsFromArray:v28];

  v29 = v325;
  if ([v325 showsArtwork] && objc_msgSend(v325, "verticalCenteringContent"))
  {
    v30 = v324;
    objc_super v31 = [(CPUIPlayModeControlView *)v324->_playModeControlView bottomAnchor];
    v32 = [(CPUIShadowImageView *)v324->_artworkViewBrick bottomAnchor];
    uint64_t v33 = [v31 constraintEqualToAnchor:v32];
  }
  else
  {
    v30 = v324;
    objc_super v31 = [(CPUIPlayModeControlView *)v324->_playModeControlView bottomAnchor];
    v32 = [(CPUIProgressView *)v326 bottomAnchor];
    uint64_t v33 = [v31 constraintEqualToAnchor:v32 constant:-v10];
  }
  v34 = (void *)v33;
  BOOL v35 = v327;
  [v327 addObject:v33];

  if ([v325 showsArtwork])
  {
    id v36 = [(CPUIShadowImageView *)v30->_artworkViewBrick widthAnchor];
    v37 = [(CPUINowPlayingView *)v30 widthAnchor];
    [v325 albumArtWidthMultiplier];
    v38 = objc_msgSend(v36, "constraintEqualToAnchor:multiplier:", v37);
    v338[0] = v38;
    v39 = [(CPUIShadowImageView *)v30->_artworkViewBrick heightAnchor];
    v40 = [(CPUIShadowImageView *)v30->_artworkViewBrick widthAnchor];
    v41 = [v39 constraintEqualToAnchor:v40];
    v338[1] = v41;
    v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:v338 count:2];
    [v327 addObjectsFromArray:v42];

    v29 = v325;
    if ([v325 verticalCenteringContent])
    {
      v43 = [(CPUIShadowImageView *)v30->_artworkViewBrick centerYAnchor];
      v44 = [(CPUIProgressView *)v326 centerYAnchor];
      double v45 = -8.0;
      v46 = v43;
      v47 = v44;
    }
    else
    {
      if ([v325 progressViewFullWidth] && objc_msgSend(v325, "artworkPosition") != 1)
      {
        v43 = objc_opt_new();
        [(CPUINowPlayingView *)v30 addLayoutGuide:v43];
        [v323 addObject:v43];
        v44 = [v43 topAnchor];
        v48 = [(CPUIProgressView *)v326 topAnchor];
        v316 = [v44 constraintEqualToAnchor:v48];
        v337[0] = v316;
        v158 = [v43 bottomAnchor];
        v159 = [(CPUIProgressView *)v30->_progressView topAnchor];
        v160 = [v158 constraintEqualToAnchor:v159];
        v337[1] = v160;
        v161 = [(CPUIShadowImageView *)v30->_artworkViewBrick centerYAnchor];
        v162 = [v43 centerYAnchor];
        v163 = [v161 constraintEqualToAnchor:v162];
        v337[2] = v163;
        v164 = [MEMORY[0x263EFF8C0] arrayWithObjects:v337 count:3];
        [v327 addObjectsFromArray:v164];

        v30 = v324;
        BOOL v35 = v327;

        v29 = v325;
        goto LABEL_16;
      }
      v43 = [(CPUIShadowImageView *)v30->_artworkViewBrick topAnchor];
      v44 = [(CPUIProgressView *)v326 topAnchor];
      v46 = v43;
      v47 = v44;
      double v45 = v6;
    }
    v48 = [v46 constraintEqualToAnchor:v47 constant:v45];
    [v327 addObject:v48];
LABEL_16:
  }
  unint64_t v49 = [v29 artworkPosition];
  if (v49 < 2)
  {
    v69 = [(CPUITransportControlView *)*p_transportControlView trailingAnchor];
    progressView = v326;
    [(CPUIProgressView *)v326 trailingAnchor];
    v306 = double v71 = -v12;
    v312 = v69;
    v300 = objc_msgSend(v69, "constraintEqualToAnchor:constant:", v71);
    v336[0] = v300;
    v72 = [(CPUITransportControlView *)*p_transportControlView leadingAnchor];
    v287 = [(CPUIProgressView *)v326 leadingAnchor];
    v294 = v72;
    v280 = objc_msgSend(v72, "constraintEqualToAnchor:constant:", v8);
    v336[1] = v280;
    v73 = [(CPUIProgressView *)v30->_progressView rightAnchor];
    v266 = [(CPUITransportControlView *)*p_transportControlView fastForwardButton];
    [v266 rightAnchor];
    v259 = v273 = v73;
    v252 = objc_msgSend(v73, "constraintEqualToAnchor:");
    v336[2] = v252;
    v74 = [(CPUIProgressView *)v30->_progressView leftAnchor];
    v238 = [(CPUITransportControlView *)*p_transportControlView leftButton];
    [v238 leftAnchor];
    v231 = v245 = v74;
    v224 = objc_msgSend(v74, "constraintEqualToAnchor:");
    v336[3] = v224;
    v75 = [(CPUISongDetailsView *)v30->_songDetailsView trailingAnchor];
    v210 = [(CPUITransportControlView *)*p_transportControlView trailingAnchor];
    v217 = v75;
    v203 = objc_msgSend(v75, "constraintEqualToAnchor:");
    v336[4] = v203;
    v76 = [(CPUISongDetailsView *)v30->_songDetailsView leadingAnchor];
    v77 = [(CPUIProgressView *)v326 leadingAnchor];
    v197 = v76;
    v78 = [v76 constraintEqualToAnchor:v77 constant:v8];
    v336[5] = v78;
    v79 = [(CPUIPlayModeControlView *)v30->_playModeControlView leadingAnchor];
    v80 = [(CPUIProgressView *)v326 leadingAnchor];
    v81 = [v79 constraintEqualToAnchor:v80 constant:v8];
    v336[6] = v81;
    v82 = [(CPUIPlayModeControlView *)v30->_playModeControlView trailingAnchor];
    if (([v29 playModeControlButtonsFullWidth] & 1) == 0) {
      progressView = v324->_progressView;
    }
    v83 = [(CPUIProgressView *)progressView trailingAnchor];
    v29 = v325;
    int v84 = [v325 playModeControlButtonsFullWidth];
    double v85 = 0.0;
    if (v84) {
      double v85 = v71;
    }
    v86 = [v82 constraintEqualToAnchor:v83 constant:v85];
    v336[7] = v86;
    v87 = [MEMORY[0x263EFF8C0] arrayWithObjects:v336 count:8];
    [v327 addObjectsFromArray:v87];

    v30 = v324;
    if ([v325 showsArtwork])
    {
      v88 = [(CPUIShadowImageView *)v324->_artworkViewBrick centerXAnchor];
      v89 = [(CPUIProgressView *)v326 centerXAnchor];
      v90 = [v88 constraintEqualToAnchor:v89];
      v335 = v90;
      unint64_t v50 = 0x263EFF000uLL;
      v91 = (void *)MEMORY[0x263EFF8C0];
      v92 = &v335;
    }
    else
    {
      v88 = [(CPUISongDetailsView *)v324->_songDetailsView topAnchor];
      v89 = [(CPUIProgressView *)v326 topAnchor];
      v90 = [v88 constraintEqualToAnchor:v89 constant:v6];
      v334 = v90;
      unint64_t v50 = 0x263EFF000uLL;
      v91 = (void *)MEMORY[0x263EFF8C0];
      v92 = &v334;
    }
    v103 = [v91 arrayWithObjects:v92 count:1];
    BOOL v35 = v327;
    [v327 addObjectsFromArray:v103];
  }
  else
  {
    if (v49 == 2)
    {
      v93 = [(CPUIShadowImageView *)v30->_artworkViewBrick rightAnchor];
      uint64_t v94 = [(CPUIProgressView *)v326 rightAnchor];
      uint64_t v95 = [v93 constraintEqualToAnchor:v94 constant:-v12];
      v333[0] = v95;
      v96 = [(CPUISongDetailsView *)v30->_songDetailsView rightAnchor];
      v288 = [(CPUIShadowImageView *)v30->_artworkViewBrick leftAnchor];
      v281 = objc_msgSend(v96, "constraintEqualToAnchor:constant:", -v12);
      v333[1] = v281;
      v97 = [(CPUISongDetailsView *)v30->_songDetailsView leftAnchor];
      v267 = [(CPUIProgressView *)v326 leftAnchor];
      v274 = v97;
      v260 = objc_msgSend(v97, "constraintEqualToAnchor:constant:", v8);
      v333[2] = v260;
      v98 = [(CPUITransportControlView *)*p_transportControlView rightAnchor];
      v246 = [(CPUIShadowImageView *)v30->_artworkViewBrick leftAnchor];
      v253 = v98;
      v239 = objc_msgSend(v98, "constraintEqualToAnchor:constant:", -v12);
      v333[3] = v239;
      v99 = [(CPUITransportControlView *)*p_transportControlView leftAnchor];
      uint64_t v100 = [(CPUIProgressView *)v326 leftAnchor];
      v232 = v99;
      v218 = [v99 constraintEqualToAnchor:v100 constant:v8];
      v333[4] = v218;
      v101 = [(CPUIProgressView *)v30->_progressView rightAnchor];
      uint64_t v305 = v94;
      v311 = v93;
      v293 = v96;
      uint64_t v299 = v95;
      v225 = (void *)v100;
      int v204 = [v29 progressViewFullWidth];
      if (v204)
      {
        uint64_t v102 = [(CPUIShadowImageView *)v30->_artworkViewBrick rightAnchor];
        v188 = (void *)v102;
      }
      else
      {
        v188 = [(CPUITransportControlView *)*p_transportControlView fastForwardButton];
        uint64_t v102 = [v188 rightAnchor];
      }
      v211 = v101;
      v183 = (void *)v102;
      v198 = [v101 constraintEqualToAnchor:v102];
      v333[5] = v198;
      v104 = [(CPUIProgressView *)v30->_progressView leftAnchor];
      v105 = [(CPUITransportControlView *)*p_transportControlView leftButton];
      v106 = [v105 leftAnchor];
      v192 = v104;
      v107 = [v104 constraintEqualToAnchor:v106];
      v333[6] = v107;
      v108 = [(CPUIPlayModeControlView *)v30->_playModeControlView leadingAnchor];
      v109 = v326;
      v110 = [(CPUIProgressView *)v326 leadingAnchor];
      v111 = [v108 constraintEqualToAnchor:v110 constant:v8];
      v333[7] = v111;
      v112 = [(CPUIPlayModeControlView *)v30->_playModeControlView trailingAnchor];
      if (([v325 playModeControlButtonsFullWidth] & 1) == 0) {
        v109 = v30->_progressView;
      }
      v113 = [(CPUIProgressView *)v109 trailingAnchor];
      int v114 = [v325 playModeControlButtonsFullWidth];
      double v115 = 0.0;
      if (v114) {
        double v115 = -v12;
      }
      v116 = [v112 constraintEqualToAnchor:v113 constant:v115];
      v333[8] = v116;
      v117 = [MEMORY[0x263EFF8C0] arrayWithObjects:v333 count:9];
      [v327 addObjectsFromArray:v117];

      if ((v204 & 1) == 0) {
      BOOL v35 = v327;
      }
      v30 = v324;
      v29 = v325;
      unint64_t v50 = 0x263EFF000uLL;
    }
    else
    {
      unint64_t v50 = 0x263EFF000;
      if (v49 != 3) {
        goto LABEL_48;
      }
      v51 = [(CPUIShadowImageView *)v30->_artworkViewBrick leftAnchor];
      v52 = (CPUITransportControlView *)v326;
      uint64_t v305 = [(CPUIProgressView *)v326 leftAnchor];
      v311 = v51;
      uint64_t v299 = objc_msgSend(v51, "constraintEqualToAnchor:constant:", v8);
      v332[0] = v299;
      v53 = [(CPUISongDetailsView *)v30->_songDetailsView leftAnchor];
      v286 = [(CPUIShadowImageView *)v30->_artworkViewBrick rightAnchor];
      v293 = v53;
      v279 = objc_msgSend(v53, "constraintEqualToAnchor:constant:", v8);
      v332[1] = v279;
      v54 = [(CPUISongDetailsView *)v30->_songDetailsView rightAnchor];
      v265 = [(CPUIProgressView *)v326 rightAnchor];
      v272 = v54;
      v258 = objc_msgSend(v54, "constraintEqualToAnchor:constant:", -v12);
      v332[2] = v258;
      v55 = [(CPUITransportControlView *)*p_transportControlView leftAnchor];
      v244 = [(CPUIShadowImageView *)v30->_artworkViewBrick rightAnchor];
      v251 = v55;
      v237 = objc_msgSend(v55, "constraintEqualToAnchor:constant:", v8);
      v332[3] = v237;
      v56 = [(CPUITransportControlView *)*p_transportControlView rightAnchor];
      v223 = [(CPUIProgressView *)v326 rightAnchor];
      v230 = v56;
      v216 = objc_msgSend(v56, "constraintEqualToAnchor:constant:", -v12);
      v332[4] = v216;
      v57 = [(CPUIProgressView *)v30->_progressView rightAnchor];
      v202 = [(CPUITransportControlView *)*p_transportControlView rightAnchor];
      v209 = v57;
      v196 = objc_msgSend(v57, "constraintEqualToAnchor:");
      v332[5] = v196;
      v58 = [(CPUIProgressView *)v30->_progressView leftAnchor];
      if ([v29 progressViewFullWidth]) {
        p_artworkViewBrick = (id *)&v30->_artworkViewBrick;
      }
      else {
        p_artworkViewBrick = (id *)p_transportControlView;
      }
      v187 = [*p_artworkViewBrick leftAnchor];
      v182 = objc_msgSend(v58, "constraintEqualToAnchor:");
      v332[6] = v182;
      v60 = [(CPUIPlayModeControlView *)v30->_playModeControlView leadingAnchor];
      if (([v29 playModeControlButtonsFullWidth] & 1) == 0) {
        v52 = *p_transportControlView;
      }
      v61 = [(CPUITransportControlView *)v52 leadingAnchor];
      v29 = v325;
      int v62 = [v325 playModeControlButtonsFullWidth];
      double v63 = 0.0;
      if (v62) {
        double v63 = v8;
      }
      v64 = [v60 constraintEqualToAnchor:v61 constant:v63];
      v332[7] = v64;
      v65 = [(CPUIPlayModeControlView *)v30->_playModeControlView trailingAnchor];
      v66 = [(CPUIProgressView *)v326 trailingAnchor];
      v67 = [v65 constraintEqualToAnchor:v66 constant:-v12];
      v332[8] = v67;
      v68 = [MEMORY[0x263EFF8C0] arrayWithObjects:v332 count:9];
      BOOL v35 = v327;
      [v327 addObjectsFromArray:v68];

      v30 = v324;
      unint64_t v50 = 0x263EFF000uLL;
    }
    v89 = (void *)v305;
    v88 = v311;
    v103 = v293;
    v90 = (void *)v299;
  }

LABEL_48:
  unint64_t v118 = [v29 artworkPosition];
  if (v118 - 2 >= 2)
  {
    if (v118 > 1) {
      goto LABEL_56;
    }
    v119 = [(CPUINowPlayingView *)v30 _equalHeightVerticalSpacers:4 minimumPadding:6.0 maximumPadding:0.0];
    v313 = [v119 objectAtIndexedSubscript:0];
    v307 = [v313 topAnchor];
    v301 = [(CPUIShadowImageView *)v30->_artworkViewBrick bottomAnchor];
    v295 = [v307 constraintEqualToAnchor:v301];
    v331[0] = v295;
    v289 = [v119 objectAtIndexedSubscript:0];
    v282 = [v289 bottomAnchor];
    v275 = [(CPUISongDetailsView *)v30->_songDetailsView topAnchor];
    v268 = [v282 constraintEqualToAnchor:v275];
    v331[1] = v268;
    v261 = [v119 objectAtIndexedSubscript:1];
    v254 = [v261 topAnchor];
    v320 = [(CPUISongDetailsView *)v30->_songDetailsView bottomAnchor];
    v247 = [v254 constraintEqualToAnchor:v320];
    v331[2] = v247;
    v240 = [v119 objectAtIndexedSubscript:1];
    v233 = [v240 bottomAnchor];
    v226 = [(CPUITransportControlView *)*p_transportControlView topAnchor];
    v219 = [v233 constraintEqualToAnchor:v226];
    v331[3] = v219;
    v212 = [v119 objectAtIndexedSubscript:2];
    v205 = [v212 topAnchor];
    v318 = [(CPUITransportControlView *)*p_transportControlView bottomAnchor];
    v199 = [v205 constraintEqualToAnchor:v318];
    v331[4] = v199;
    v193 = [v119 objectAtIndexedSubscript:2];
    v189 = [v193 bottomAnchor];
    v184 = [(CPUIProgressView *)v30->_progressView topAnchor];
    v179 = [v189 constraintEqualToAnchor:v184];
    v331[5] = v179;
    [v119 objectAtIndexedSubscript:3];
    v176 = v120 = v30;
    v121 = [v176 topAnchor];
    v122 = [(CPUIProgressView *)v120->_progressView bottomAnchor];
    v123 = [v121 constraintEqualToAnchor:v122];
    v331[6] = v123;
    v124 = [v119 objectAtIndexedSubscript:3];
    v125 = [v124 bottomAnchor];
    v126 = [(CPUIPlayModeControlView *)v120->_playModeControlView topAnchor];
    v127 = [v125 constraintEqualToAnchor:v126];
    v331[7] = v127;
    v128 = [*(id *)(v50 + 2240) arrayWithObjects:v331 count:8];
    [v327 addObjectsFromArray:v128];

    v129 = v119;
    v130 = v323;
    v131 = v119;
    goto LABEL_54;
  }
  if (![v29 playModeControlButtonsFullWidth])
  {
    v145 = [(CPUINowPlayingView *)v30 _equalHeightVerticalSpacers:3 minimumPadding:6.0 maximumPadding:0.0];
    v315 = [(CPUISongDetailsView *)v30->_songDetailsView topAnchor];
    v309 = [(CPUIShadowImageView *)v30->_artworkViewBrick topAnchor];
    v303 = [v315 constraintEqualToAnchor:v309];
    v329[0] = v303;
    v297 = [v145 objectAtIndexedSubscript:0];
    v291 = [v297 topAnchor];
    v322 = [(CPUISongDetailsView *)v30->_songDetailsView bottomAnchor];
    v284 = [v291 constraintEqualToAnchor:v322];
    v329[1] = v284;
    v277 = [v145 objectAtIndexedSubscript:0];
    v270 = [v277 bottomAnchor];
    v263 = [(CPUITransportControlView *)*p_transportControlView topAnchor];
    v256 = [v270 constraintEqualToAnchor:v263];
    v329[2] = v256;
    v249 = [v145 objectAtIndexedSubscript:1];
    v242 = [v249 topAnchor];
    v319 = [(CPUITransportControlView *)*p_transportControlView bottomAnchor];
    v235 = [v242 constraintEqualToAnchor:v319];
    v329[3] = v235;
    v228 = [v145 objectAtIndexedSubscript:1];
    v221 = [v228 bottomAnchor];
    v214 = [(CPUIProgressView *)v30->_progressView topAnchor];
    v207 = [v221 constraintEqualToAnchor:v214];
    v329[4] = v207;
    v146 = [v145 objectAtIndexedSubscript:2];
    v147 = [v146 topAnchor];
    v148 = [(CPUIProgressView *)v30->_progressView bottomAnchor];
    v149 = [v147 constraintEqualToAnchor:v148];
    v329[5] = v149;
    v150 = [v145 objectAtIndexedSubscript:2];
    v151 = [v150 bottomAnchor];
    v152 = [(CPUIPlayModeControlView *)v30->_playModeControlView topAnchor];
    v153 = [v151 constraintEqualToAnchor:v152];
    v329[6] = v153;
    v154 = [MEMORY[0x263EFF8C0] arrayWithObjects:v329 count:7];
    [v327 addObjectsFromArray:v154];

    v129 = v145;
    v130 = v323;
    v131 = v145;
LABEL_54:
    [v130 addObjectsFromArray:v131];
    goto LABEL_55;
  }
  v132 = [(CPUINowPlayingView *)v30 _equalHeightVerticalSpacers:2 minimumPadding:6.0 maximumPadding:12.0];
  v206 = [(CPUINowPlayingView *)v30 _equalHeightVerticalSpacers:2 minimumPadding:6.0 maximumPadding:0.0];
  v314 = [v132 objectAtIndexedSubscript:0];
  v308 = [v314 topAnchor];
  v302 = [(CPUISongDetailsView *)v30->_songDetailsView bottomAnchor];
  v296 = [v308 constraintEqualToAnchor:v302];
  v330[0] = v296;
  v290 = [v132 objectAtIndexedSubscript:0];
  v283 = [v290 bottomAnchor];
  v276 = [(CPUITransportControlView *)*p_transportControlView topAnchor];
  v269 = [v283 constraintEqualToAnchor:v276];
  v330[1] = v269;
  v194 = v132;
  v262 = [v132 objectAtIndexedSubscript:1];
  v255 = [v262 topAnchor];
  v248 = [(CPUIProgressView *)v30->_progressView bottomAnchor];
  v241 = [v255 constraintEqualToAnchor:v248];
  v330[2] = v241;
  v234 = [v132 objectAtIndexedSubscript:1];
  v227 = [v234 bottomAnchor];
  v220 = [(CPUIPlayModeControlView *)v30->_playModeControlView topAnchor];
  v213 = [v227 constraintEqualToAnchor:v220];
  v330[3] = v213;
  v200 = [v206 objectAtIndexedSubscript:0];
  v190 = [v200 topAnchor];
  v185 = [(CPUIProgressView *)v326 topAnchor];
  v180 = [v190 constraintEqualToAnchor:v185];
  v330[4] = v180;
  v177 = [v206 objectAtIndexedSubscript:0];
  v174 = [v177 bottomAnchor];
  v321 = [(CPUISongDetailsView *)v30->_songDetailsView topAnchor];
  v172 = [v174 constraintEqualToAnchor:v321];
  v330[5] = v172;
  v170 = [v206 objectAtIndexedSubscript:1];
  v168 = [v170 topAnchor];
  v133 = [(CPUITransportControlView *)*p_transportControlView bottomAnchor];
  v134 = [v168 constraintEqualToAnchor:v133];
  v330[6] = v134;
  [v206 objectAtIndexedSubscript:1];
  v136 = p_isa = (id *)&v30->super.super.super.isa;
  v137 = [v136 bottomAnchor];
  v138 = [p_isa[57] bottomAnchor];
  v139 = [v137 constraintEqualToAnchor:v138];
  v330[7] = v139;
  v140 = [p_isa[55] bottomAnchor];
  v141 = [p_isa[54] topAnchor];
  v142 = [v140 constraintEqualToAnchor:v141 constant:-6.0];
  v330[8] = v142;
  v143 = [MEMORY[0x263EFF8C0] arrayWithObjects:v330 count:9];
  [v327 addObjectsFromArray:v143];

  v129 = v194;
  v144 = [v194 arrayByAddingObjectsFromArray:v206];
  [v323 addObjectsFromArray:v144];

LABEL_55:
  BOOL v35 = v327;
  v30 = v324;
  v29 = v325;
LABEL_56:
  uint64_t v155 = [v323 copy];
  verticalSpacerLayoutGuides = v30->_verticalSpacerLayoutGuides;
  v30->_verticalSpacerLayoutGuides = (NSArray *)v155;

  return v35;
}

uint64_t __54__CPUINowPlayingView__constraintsForNowPlayingLayout___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeLayoutGuide:a2];
}

- (void)setBadgeAnnotationView:(id)a3
{
  v16[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  badgeAnnotationView = self->_badgeAnnotationView;
  if (badgeAnnotationView) {
    [(UIView *)badgeAnnotationView removeFromSuperview];
  }
  objc_storeStrong((id *)&self->_badgeAnnotationView, a3);
  if (v5)
  {
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CPUINowPlayingView *)self addSubview:v5];
    double v7 = (void *)MEMORY[0x263F08938];
    double v8 = [v5 centerXAnchor];
    double v9 = [(CPUISongDetailsView *)self->_songDetailsView centerXAnchor];
    double v10 = [v8 constraintEqualToAnchor:v9];
    v16[0] = v10;
    double v11 = [v5 topAnchor];
    double v12 = [(CPUISongDetailsView *)self->_songDetailsView albumArtistLabelButton];
    double v13 = [v12 bottomAnchor];
    uint64_t v14 = [v11 constraintEqualToAnchor:v13 constant:3.0];
    v16[1] = v14;
    double v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
    [v7 activateConstraints:v15];
  }
}

- (CPUINowPlayingLayoutProtocol)nowPlayingLayout
{
  return self->_nowPlayingLayout;
}

- (CPUITransportControlView)transportControlView
{
  return self->_transportControlView;
}

- (CPUIPlayModeControlView)playModeControlView
{
  return self->_playModeControlView;
}

- (CPUIProgressView)progressView
{
  return self->_progressView;
}

- (CPUISongDetailsView)songDetailsView
{
  return self->_songDetailsView;
}

- (CPUIShadowImageView)artworkViewBrick
{
  return self->_artworkViewBrick;
}

- (UIImageView)progressImageView
{
  return self->_progressImageView;
}

- (UIView)badgeAnnotationView
{
  return self->_badgeAnnotationView;
}

- (UIFocusContainerGuide)controlsFocusContainerGuide
{
  return self->_controlsFocusContainerGuide;
}

- (void)setControlsFocusContainerGuide:(id)a3
{
}

- (UIFocusContainerGuide)bottomRegionFocusContainerGuide
{
  return self->_bottomRegionFocusContainerGuide;
}

- (void)setBottomRegionFocusContainerGuide:(id)a3
{
}

- (NSArray)activeConstraints
{
  return self->_activeConstraints;
}

- (void)setActiveConstraints:(id)a3
{
}

- (NSArray)verticalSpacerLayoutGuides
{
  return self->_verticalSpacerLayoutGuides;
}

- (void)setVerticalSpacerLayoutGuides:(id)a3
{
}

- (NSLayoutConstraint)songDetailsViewHeightConstraint
{
  return self->_songDetailsViewHeightConstraint;
}

- (void)setSongDetailsViewHeightConstraint:(id)a3
{
}

- (BOOL)buttonShapesVisible
{
  return self->_buttonShapesVisible;
}

- (void)setButtonShapesVisible:(BOOL)a3
{
  self->_buttonShapesVisible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_songDetailsViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_verticalSpacerLayoutGuides, 0);
  objc_storeStrong((id *)&self->_activeConstraints, 0);
  objc_storeStrong((id *)&self->_bottomRegionFocusContainerGuide, 0);
  objc_storeStrong((id *)&self->_controlsFocusContainerGuide, 0);
  objc_storeStrong((id *)&self->_badgeAnnotationView, 0);
  objc_storeStrong((id *)&self->_progressImageView, 0);
  objc_storeStrong((id *)&self->_artworkViewBrick, 0);
  objc_storeStrong((id *)&self->_songDetailsView, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_playModeControlView, 0);
  objc_storeStrong((id *)&self->_transportControlView, 0);
  objc_storeStrong((id *)&self->_nowPlayingLayout, 0);
}

@end