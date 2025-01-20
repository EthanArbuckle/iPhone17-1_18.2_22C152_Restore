@interface MediaControlsHeaderView
- (BOOL)isRouting;
- (BOOL)isTransitioning;
- (BOOL)marqueeEnabled;
- (BOOL)scalePlaceholderImage;
- (BOOL)shouldUseOverrideSize;
- (BOOL)showPlaceholderString;
- (CGSize)layoutTextInAvailableBounds:(CGRect)a3 setFrames:(BOOL)a4;
- (CGSize)overrideSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MPButton)doneButton;
- (MPCPlayerPath)playerPath;
- (MPRouteLabel)routeLabel;
- (MPUMarqueeView)primaryMarqueeView;
- (MPUMarqueeView)secondaryMarqueeView;
- (MTMaterialView)artworkBackground;
- (MTVisualStylingProvider)visualStylingProvider;
- (MediaControlsHeaderView)initWithFrame:(CGRect)a3;
- (MediaControlsRoutingButtonView)routingButton;
- (NSString)placeholderString;
- (NSString)primaryString;
- (NSString)secondaryString;
- (UIButton)launchNowPlayingAppButton;
- (UIImageView)artworkView;
- (UIImageView)placeholderArtworkView;
- (UILabel)placeholderLabel;
- (UILabel)primaryLabel;
- (UILabel)secondaryLabel;
- (UIPointerInteraction)pointerInteraction;
- (UIView)artworkContentView;
- (UIView)shadow;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (int64_t)buttonType;
- (int64_t)style;
- (void)_updateRTL;
- (void)_updateStyle;
- (void)clearOverrideSize;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)launchNowPlayingAppButtonPressed;
- (void)layoutSubviews;
- (void)setArtworkBackground:(id)a3;
- (void)setArtworkContentView:(id)a3;
- (void)setArtworkView:(id)a3;
- (void)setButtonType:(int64_t)a3;
- (void)setDoneButton:(id)a3;
- (void)setLaunchNowPlayingAppButton:(id)a3;
- (void)setMarqueeEnabled:(BOOL)a3;
- (void)setOverrideSize:(CGSize)a3;
- (void)setPlaceholderArtworkView:(id)a3;
- (void)setPlaceholderLabel:(id)a3;
- (void)setPlaceholderString:(id)a3;
- (void)setPlayerPath:(id)a3;
- (void)setPointerInteraction:(id)a3;
- (void)setPrimaryLabel:(id)a3;
- (void)setPrimaryMarqueeView:(id)a3;
- (void)setPrimaryString:(id)a3;
- (void)setRouteLabel:(id)a3;
- (void)setRouting:(BOOL)a3;
- (void)setRoutingButton:(id)a3;
- (void)setScalePlaceholderImage:(BOOL)a3;
- (void)setSecondaryLabel:(id)a3;
- (void)setSecondaryMarqueeView:(id)a3;
- (void)setSecondaryString:(id)a3;
- (void)setShadow:(id)a3;
- (void)setShouldUseOverrideSize:(BOOL)a3;
- (void)setShowPlaceholderString:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTransitioning:(BOOL)a3;
- (void)setVisualStylingProvider:(id)a3;
- (void)tintColorDidChange;
- (void)updateArtworkStyle;
@end

@implementation MediaControlsHeaderView

- (MediaControlsHeaderView)initWithFrame:(CGRect)a3
{
  v108.receiver = self;
  v108.super_class = (Class)MediaControlsHeaderView;
  v3 = -[MediaControlsHeaderView initWithFrame:](&v108, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:4 configuration:4];
    artworkBackground = v3->_artworkBackground;
    v3->_artworkBackground = (MTMaterialView *)v4;

    id v6 = objc_alloc(MEMORY[0x1E4FB1838]);
    double v7 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], v8, v9, v10);
    artworkView = v3->_artworkView;
    v3->_artworkView = (UIImageView *)v11;

    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v7, v8, v9, v10);
    shadow = v3->_shadow;
    v3->_shadow = (UIView *)v13;

    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F31A38]), "initWithFrame:", v7, v8, v9, v10);
    routeLabel = v3->_routeLabel;
    v3->_routeLabel = (MPRouteLabel *)v15;

    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F76EE0]), "initWithFrame:", v7, v8, v9, v10);
    primaryMarqueeView = v3->_primaryMarqueeView;
    v3->_primaryMarqueeView = (MPUMarqueeView *)v17;

    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v7, v8, v9, v10);
    primaryLabel = v3->_primaryLabel;
    v3->_primaryLabel = (UILabel *)v19;

    uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F76EE0]), "initWithFrame:", v7, v8, v9, v10);
    secondaryMarqueeView = v3->_secondaryMarqueeView;
    v3->_secondaryMarqueeView = (MPUMarqueeView *)v21;

    uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v7, v8, v9, v10);
    secondaryLabel = v3->_secondaryLabel;
    v3->_secondaryLabel = (UILabel *)v23;

    uint64_t v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v7, v8, v9, v10);
    placeholderLabel = v3->_placeholderLabel;
    v3->_placeholderLabel = (UILabel *)v25;

    [(UILabel *)v3->_placeholderLabel setHidden:1];
    v27 = -[MediaControlsRoutingButtonView initWithFrame:]([MediaControlsRoutingButtonView alloc], "initWithFrame:", v7, v8, v9, v10);
    routingButton = v3->_routingButton;
    v3->_routingButton = v27;

    uint64_t v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB14D0]), "initWithFrame:", v7, v8, v9, v10);
    launchNowPlayingAppButton = v3->_launchNowPlayingAppButton;
    v3->_launchNowPlayingAppButton = (UIButton *)v29;

    uint64_t v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v7, v8, v9, v10);
    placeholderArtworkView = v3->_placeholderArtworkView;
    v3->_placeholderArtworkView = (UIImageView *)v31;

    uint64_t v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v7, v8, v9, v10);
    artworkContentView = v3->_artworkContentView;
    v3->_artworkContentView = (UIView *)v33;

    v35 = [(MediaControlsHeaderView *)v3 routingButton];
    [(MediaControlsHeaderView *)v3 addSubview:v35];

    v36 = [(MediaControlsHeaderView *)v3 routeLabel];
    [(MediaControlsHeaderView *)v3 addSubview:v36];

    v37 = [(MediaControlsHeaderView *)v3 primaryMarqueeView];
    [(MediaControlsHeaderView *)v3 addSubview:v37];

    v38 = [(MediaControlsHeaderView *)v3 secondaryMarqueeView];
    [(MediaControlsHeaderView *)v3 addSubview:v38];

    v39 = [(MediaControlsHeaderView *)v3 placeholderLabel];
    [(MediaControlsHeaderView *)v3 addSubview:v39];

    v40 = [(MediaControlsHeaderView *)v3 launchNowPlayingAppButton];
    [(MediaControlsHeaderView *)v3 addSubview:v40];

    v41 = [(MediaControlsHeaderView *)v3 artworkContentView];
    [(MediaControlsHeaderView *)v3 addSubview:v41];

    v42 = [(MediaControlsHeaderView *)v3 artworkContentView];
    v43 = [(MediaControlsHeaderView *)v3 shadow];
    [v42 addSubview:v43];

    v44 = [(MediaControlsHeaderView *)v3 artworkContentView];
    v45 = [(MediaControlsHeaderView *)v3 artworkBackground];
    [v44 addSubview:v45];

    v46 = [(MediaControlsHeaderView *)v3 artworkContentView];
    v47 = [(MediaControlsHeaderView *)v3 artworkView];
    [v46 addSubview:v47];

    v48 = [(MediaControlsHeaderView *)v3 artworkContentView];
    v49 = [(MediaControlsHeaderView *)v3 placeholderArtworkView];
    [v48 addSubview:v49];

    v50 = [(MediaControlsHeaderView *)v3 routingButton];
    objc_msgSend(v50, "setHitRectInsets:", -24.0, -24.0, -24.0, -24.0);

    v51 = [(MediaControlsHeaderView *)v3 traitCollection];
    [v51 displayScale];

    v52 = [(MediaControlsHeaderView *)v3 artworkContentView];
    [v52 setUserInteractionEnabled:0];

    v53 = [(MediaControlsHeaderView *)v3 artworkBackground];
    [v53 setClipsToBounds:1];

    UIRoundToScale();
    double v55 = v54;
    v56 = [(MediaControlsHeaderView *)v3 artworkBackground];
    [v56 _setContinuousCornerRadius:v55];

    uint64_t v57 = *MEMORY[0x1E4F3A340];
    v58 = [(MediaControlsHeaderView *)v3 artworkView];
    v59 = [v58 layer];
    [v59 setMinificationFilter:v57];

    v60 = [(MediaControlsHeaderView *)v3 artworkView];
    [v60 setContentMode:1];

    v61 = [(MediaControlsHeaderView *)v3 artworkView];
    [v61 setClipsToBounds:1];

    UIRoundToScale();
    double v63 = v62;
    v64 = [(MediaControlsHeaderView *)v3 artworkView];
    [v64 _setContinuousCornerRadius:v63];

    v65 = [(MediaControlsHeaderView *)v3 placeholderArtworkView];
    v66 = [v65 layer];
    [v66 setMinificationFilter:v57];

    v67 = [(MediaControlsHeaderView *)v3 placeholderArtworkView];
    [v67 setContentMode:1];

    v68 = [(MediaControlsHeaderView *)v3 placeholderArtworkView];
    [v68 setClipsToBounds:1];

    id v69 = [MEMORY[0x1E4FB1618] blackColor];
    uint64_t v70 = [v69 CGColor];
    v71 = [(MediaControlsHeaderView *)v3 shadow];
    v72 = [v71 layer];
    [v72 setShadowColor:v70];

    v73 = [(MediaControlsHeaderView *)v3 shadow];
    v74 = [v73 layer];
    objc_msgSend(v74, "setShadowOffset:", 0.0, 1.0);

    v75 = [(MediaControlsHeaderView *)v3 shadow];
    v76 = [v75 layer];
    [v76 setShadowRadius:4.0];

    v77 = [(MediaControlsHeaderView *)v3 shadow];
    v78 = [v77 layer];
    LODWORD(v79) = 1042536202;
    [v78 setShadowOpacity:v79];

    v80 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v80 addObserver:v3 selector:sel__handleContentSizeCategoryDidChangeNotification_ name:*MEMORY[0x1E4FB27A8] object:0];
    v81 = [(MediaControlsHeaderView *)v3 routeLabel];
    [v81 setForcesUppercaseText:1];

    v82 = [(MediaControlsHeaderView *)v3 primaryLabel];
    [v82 setNumberOfLines:1];

    v83 = [(MediaControlsHeaderView *)v3 secondaryLabel];
    [v83 setNumberOfLines:1];

    v84 = [(MediaControlsHeaderView *)v3 placeholderLabel];
    [v84 setNumberOfLines:0];

    v85 = [(MediaControlsHeaderView *)v3 primaryMarqueeView];
    v86 = [v85 contentView];
    v87 = [(MediaControlsHeaderView *)v3 primaryLabel];
    [v86 addSubview:v87];

    v88 = [(MediaControlsHeaderView *)v3 secondaryMarqueeView];
    v89 = [v88 contentView];
    v90 = [(MediaControlsHeaderView *)v3 secondaryLabel];
    [v89 addSubview:v90];

    v91 = [(MediaControlsHeaderView *)v3 traitCollection];
    [v91 displayScale];
    UIRoundToScale();
    double v93 = v92;
    v94 = [(MediaControlsHeaderView *)v3 primaryMarqueeView];
    [v94 setContentGap:v93];

    v95 = [(MediaControlsHeaderView *)v3 traitCollection];
    [v95 displayScale];
    UIRoundToScale();
    double v97 = v96;
    v98 = [(MediaControlsHeaderView *)v3 secondaryMarqueeView];
    [v98 setContentGap:v97];

    v99 = [(MediaControlsHeaderView *)v3 primaryMarqueeView];
    v100 = [(MediaControlsHeaderView *)v3 secondaryMarqueeView];
    [v99 addCoordinatedMarqueeView:v100];

    v101 = [(MediaControlsHeaderView *)v3 launchNowPlayingAppButton];
    [v101 setHidden:1];

    v102 = [(MediaControlsHeaderView *)v3 launchNowPlayingAppButton];
    [v102 addTarget:v3 action:sel_launchNowPlayingAppButtonPressed forControlEvents:64];

    [(MediaControlsHeaderView *)v3 _updateStyle];
    v103 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v104 = [v103 userInterfaceIdiom];

    if (v104 == 1)
    {
      uint64_t v105 = [objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v3];
      pointerInteraction = v3->_pointerInteraction;
      v3->_pointerInteraction = (UIPointerInteraction *)v105;

      [(MediaControlsHeaderView *)v3 addInteraction:v3->_pointerInteraction];
    }
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB27A8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)MediaControlsHeaderView;
  [(MediaControlsHeaderView *)&v4 dealloc];
}

- (void)layoutSubviews
{
  v99.receiver = self;
  v99.super_class = (Class)MediaControlsHeaderView;
  [(MediaControlsHeaderView *)&v99 layoutSubviews];
  [(MediaControlsHeaderView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(MediaControlsHeaderView *)self shouldUseOverrideSize])
  {
    [(MediaControlsHeaderView *)self overrideSize];
    double v8 = v11;
  }
  v12 = [(MediaControlsHeaderView *)self traitCollection];
  [v12 displayScale];

  if (self->_style != 1)
  {
    double v4 = v4 + 24.0;
    double v6 = v6 + 0.0;
    double v8 = v8 - (24.0 + 24.0);
  }
  UIRectIntegralWithScale();
  UIRectCenteredYInRect();
  uint64_t v13 = [(MediaControlsHeaderView *)self artworkView];
  [v13 setContentMode:1];

  int64_t style = self->_style;
  double v15 = 60.0 + 0.0;
  if (style == 1) {
    double v15 = 0.0;
  }
  double v16 = v8 - v15;
  if (style != 1) {
    double v6 = v6 + 0.0;
  }
  double v17 = -0.0;
  if (style != 1) {
    double v17 = 60.0;
  }
  double v18 = v4 + v17;
  uint64_t v19 = [(MediaControlsHeaderView *)self placeholderArtworkView];
  v20 = [v19 image];
  [v20 size];

  uint64_t v21 = [(MediaControlsHeaderView *)self placeholderArtworkView];
  [v21 setContentMode:1];

  v100.origin.x = v18;
  v100.origin.y = v6;
  v100.size.width = v16;
  v100.size.height = v10;
  CGRectGetMaxX(v100);
  MPFloatRoundForScale();
  MPFloatRoundForScale();
  UIRoundToScale();
  UIRectInset();
  double v23 = v22;
  int64_t v24 = [(MediaControlsHeaderView *)self buttonType];
  int64_t v25 = self->_style;
  if (v24 && (v25 == 3 || !v25))
  {
    double v18 = v18 + 0.0;
    double v6 = v6 + 0.0;
    double v16 = v16 - (v23 + 0.0);
  }
  if (v25 == 1)
  {
    UIRectInset();
    UIRectInset();
    UIRectInset();
  }
  -[MediaControlsHeaderView layoutTextInAvailableBounds:setFrames:](self, "layoutTextInAvailableBounds:setFrames:", 1, v18, v6, v16, v10);
  v26 = [(MediaControlsHeaderView *)self launchNowPlayingAppButton];
  char v27 = [v26 isHidden];

  if ((v27 & 1) == 0)
  {
    [(MediaControlsHeaderView *)self bounds];
    UIRectInset();
  }
  UIRectIntegralWithScale();
  [(MediaControlsHeaderView *)self bounds];
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  v36 = [(MediaControlsHeaderView *)self artworkContentView];
  objc_msgSend(v36, "setFrame:", v29, v31, v33, v35);

  v37 = [(MediaControlsHeaderView *)self artworkContentView];
  [v37 bounds];
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  v46 = [(MediaControlsHeaderView *)self artworkView];
  objc_msgSend(v46, "setFrame:", v39, v41, v43, v45);

  v47 = [(MediaControlsHeaderView *)self artworkContentView];
  [v47 bounds];
  UIRectCenteredIntegralRect();
  double v49 = v48;
  double v51 = v50;
  double v53 = v52;
  double v55 = v54;
  v56 = [(MediaControlsHeaderView *)self placeholderArtworkView];
  objc_msgSend(v56, "setFrame:", v49, v51, v53, v55);

  uint64_t v57 = [(MediaControlsHeaderView *)self artworkContentView];
  [v57 bounds];
  double v59 = v58;
  double v61 = v60;
  double v63 = v62;
  double v65 = v64;
  v66 = [(MediaControlsHeaderView *)self artworkBackground];
  objc_msgSend(v66, "setFrame:", v59, v61, v63, v65);

  v67 = [(MediaControlsHeaderView *)self artworkContentView];
  [v67 bounds];
  double v69 = v68;
  double v71 = v70;
  double v73 = v72;
  double v75 = v74;
  v76 = [(MediaControlsHeaderView *)self shadow];
  objc_msgSend(v76, "setFrame:", v69, v71, v73, v75);

  UIRectIntegralWithScale();
  [(MediaControlsHeaderView *)self bounds];
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  double v78 = v77;
  double v80 = v79;
  double v82 = v81;
  double v84 = v83;
  v85 = [(MediaControlsHeaderView *)self routingButton];
  objc_msgSend(v85, "setFrame:", v78, v80, v82, v84);

  UIRectIntegralWithScale();
  [(MediaControlsHeaderView *)self bounds];
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  double v87 = v86;
  double v89 = v88;
  double v91 = v90;
  double v93 = v92;
  v94 = [(MediaControlsHeaderView *)self launchNowPlayingAppButton];
  objc_msgSend(v94, "setFrame:", v87, v89, v91, v93);

  v95 = [(MediaControlsHeaderView *)self artworkView];
  [v95 bounds];
  double v96 = CGPathCreateWithRect(v101, MEMORY[0x1E4F1DAB8]);

  double v97 = [(MediaControlsHeaderView *)self shadow];
  v98 = [v97 layer];
  [v98 setShadowPath:v96];

  CGPathRelease(v96);
  [(MediaControlsHeaderView *)self _updateStyle];
}

- (CGSize)layoutTextInAvailableBounds:(CGRect)a3 setFrames:(BOOL)a4
{
  BOOL v150 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  v164[1] = *MEMORY[0x1E4F143B8];
  double v7 = [(MediaControlsHeaderView *)self traitCollection];
  [v7 displayScale];

  double v8 = [(MediaControlsHeaderView *)self routeLabel];
  objc_msgSend(v8, "sizeThatFits:", width, height);
  double v10 = v9;
  double v157 = v11;

  v12 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v13 = [v12 preferredContentSizeCategory];
  uint64_t v14 = *MEMORY[0x1E4FB27B8];
  NSComparisonResult v15 = UIContentSizeCategoryCompareToCategory(v13, (UIContentSizeCategory)*MEMORY[0x1E4FB27B8]);

  double v16 = [(MediaControlsHeaderView *)self traitCollection];
  if (v15 == NSOrderedDescending)
  {
    uint64_t v17 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:v14];

    double v16 = (void *)v17;
  }
  double v18 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28E0] compatibleWithTraitCollection:v16];
  uint64_t v19 = [v18 fontDescriptorWithSymbolicTraits:2];

  v156 = (void *)v19;
  uint64_t v20 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v19 size:0.0];
  uint64_t v21 = *MEMORY[0x1E4FB28C8];
  double v22 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8] compatibleWithTraitCollection:v16];
  double v23 = [v22 fontDescriptorWithSymbolicTraits:2];

  int64_t v24 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v23 size:0.0];
  v154 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:v21 compatibleWithTraitCollection:v16];
  int64_t v25 = objc_msgSend(MEMORY[0x1E4FB08E0], "fontWithDescriptor:size:", 0.0);
  v26 = [MEMORY[0x1E4FB17A8] metricsForTextStyle:v21];
  [v26 scaledValueForValue:v16 compatibleWithTraitCollection:6.0];

  char v27 = [(MediaControlsHeaderView *)self routeLabel];
  v155 = (void *)v20;
  [v27 setFont:v20];

  double v28 = [(MediaControlsHeaderView *)self primaryLabel];
  [v28 setFont:v24];

  double v29 = [(MediaControlsHeaderView *)self placeholderLabel];
  [v29 setFont:v24];

  double v30 = [(MediaControlsHeaderView *)self secondaryLabel];
  [v30 setFont:v25];

  double v31 = [(MediaControlsHeaderView *)self primaryString];
  uint64_t v163 = *MEMORY[0x1E4FB06F8];
  uint64_t v32 = v163;
  v164[0] = v24;
  double v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v164 forKeys:&v163 count:1];
  objc_msgSend(v31, "boundingRectWithSize:options:attributes:context:", 1, v33, 0, 1.79769313e308, 1.79769313e308);
  double v160 = v34;
  double v149 = v35;

  v36 = [(MediaControlsHeaderView *)self secondaryString];
  uint64_t v161 = v32;
  v162 = v25;
  v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v162 forKeys:&v161 count:1];
  objc_msgSend(v36, "boundingRectWithSize:options:attributes:context:", 1, v37, 0, 1.79769313e308, 1.79769313e308);
  double v39 = v38;
  double v148 = v40;

  double v41 = [MEMORY[0x1E4FB17A8] metricsForTextStyle:v21];
  [v41 scaledValueForValue:v16 compatibleWithTraitCollection:20.0];
  double v43 = v42;

  int64_t style = self->_style;
  if (style != 1)
  {
    double v49 = [(MediaControlsHeaderView *)self primaryString];
    if ([v49 length])
    {
      double v50 = [(MediaControlsHeaderView *)self secondaryString];
      uint64_t v51 = [v50 length];

      if (v51)
      {
        double v48 = v157 + v43;
LABEL_11:
        double v52 = v43 + v48;
LABEL_12:
        double v159 = v52;
        goto LABEL_14;
      }
    }
    else
    {
    }
    v66 = [(MediaControlsHeaderView *)self primaryString];
    if ([v66 length])
    {
      v67 = [(MediaControlsHeaderView *)self secondaryString];
      uint64_t v68 = [v67 length];

      if (!v68)
      {
        double v52 = v157 + v43;
        goto LABEL_12;
      }
    }
    else
    {
    }
  }
  double v45 = [(MediaControlsHeaderView *)self primaryString];
  if ([v45 length])
  {
    v46 = [(MediaControlsHeaderView *)self secondaryString];
    uint64_t v47 = [v46 length];

    double v48 = -0.0;
    if (v47) {
      double v48 = v43;
    }
    goto LABEL_11;
  }

  double v159 = v43;
LABEL_14:
  if (v150)
  {
    double v151 = v39;
    double v53 = [(MediaControlsHeaderView *)self traitCollection];
    [v53 displayScale];
    UIRoundToScale();
    double v143 = v54;

    double v55 = width + -12.0;
    double v146 = v10;
    if (style != 1)
    {
      v56 = [(MediaControlsHeaderView *)self routeLabel];
      [v56 _baselineOffsetFromBottom];
    }
    int64_t v57 = self->_style;
    if (v160 <= v55)
    {
      if (v57 == 1)
      {
        double v63 = *(double *)(MEMORY[0x1E4FB2848] + 8);
        double v147 = *MEMORY[0x1E4FB2848];
        double v65 = *(double *)(MEMORY[0x1E4FB2848] + 16);
        double v64 = *(double *)(MEMORY[0x1E4FB2848] + 24);
        double v62 = [(MediaControlsHeaderView *)self primaryMarqueeView];
        objc_msgSend(v62, "setFadeEdgeInsets:", v147, v63, v65, v64);
      }
      else
      {
        double v69 = *MEMORY[0x1E4FB2848];
        double v70 = *(double *)(MEMORY[0x1E4FB2848] + 8);
        double v71 = *(double *)(MEMORY[0x1E4FB2848] + 16);
        double v72 = *(double *)(MEMORY[0x1E4FB2848] + 24);
        double v62 = [(MediaControlsHeaderView *)self primaryMarqueeView];
        objc_msgSend(v62, "setFadeEdgeInsets:", v69, v70, v71, v72);
      }
    }
    else if (v57 == 1)
    {
      UIRoundToScale();
      double v58 = *MEMORY[0x1E4FB2848];
      double v59 = *(double *)(MEMORY[0x1E4FB2848] + 8);
      double v60 = *(double *)(MEMORY[0x1E4FB2848] + 16);
      double v61 = *(double *)(MEMORY[0x1E4FB2848] + 24);
      double v62 = [(MediaControlsHeaderView *)self primaryMarqueeView];
      objc_msgSend(v62, "setFadeEdgeInsets:", v58, v59, v60, v61);
    }
    else
    {
      double v62 = [(MediaControlsHeaderView *)self primaryMarqueeView];
      objc_msgSend(v62, "setFadeEdgeInsets:", 0.0, v143, 0.0, v143);
    }

    int64_t v73 = self->_style;
    if (v151 <= v55)
    {
      double v84 = *MEMORY[0x1E4FB2848];
      double v85 = *(double *)(MEMORY[0x1E4FB2848] + 8);
      double v86 = *(double *)(MEMORY[0x1E4FB2848] + 16);
      double v87 = *(double *)(MEMORY[0x1E4FB2848] + 24);
      if (v73 == 1) {
        [(MediaControlsHeaderView *)self secondaryMarqueeView];
      }
      else {
      double v79 = [(MediaControlsHeaderView *)self secondaryMarqueeView];
      }
      objc_msgSend(v79, "setFadeEdgeInsets:", v84, v85, v86, v87);
      double v88 = v151;
    }
    else
    {
      if (v73 == 1)
      {
        UIRoundToScale();
        double v74 = *MEMORY[0x1E4FB2848];
        double v75 = *(double *)(MEMORY[0x1E4FB2848] + 8);
        double v77 = *(double *)(MEMORY[0x1E4FB2848] + 16);
        double v76 = *(double *)(MEMORY[0x1E4FB2848] + 24);
        double v78 = [(MediaControlsHeaderView *)self secondaryMarqueeView];
        double v79 = v78;
        double v80 = v74;
        double v81 = v75;
        double v82 = v77;
        double v83 = v76;
      }
      else
      {
        double v78 = [(MediaControlsHeaderView *)self secondaryMarqueeView];
        double v79 = v78;
        double v80 = 0.0;
        double v82 = 0.0;
        double v81 = v143;
        double v83 = v143;
      }
      objc_msgSend(v78, "setFadeEdgeInsets:", v80, v81, v82, v83, *(void *)&v143);
      double v88 = v151;
    }

    [(MediaControlsHeaderView *)self bounds];
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    UIRectIntegralWithScale();
    double v158 = v89;
    double v152 = v90;
    double v144 = v92;
    double v145 = v91;
    [(MediaControlsHeaderView *)self bounds];
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    double v94 = v93;
    double v96 = v95;
    double v98 = v97;
    double v100 = v99;
    CGRect v101 = [(MediaControlsHeaderView *)self primaryMarqueeView];
    objc_msgSend(v101, "setFrame:", v94, v96, v98, v100);

    [(MediaControlsHeaderView *)self bounds];
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    double v103 = v102;
    double v105 = v104;
    double v107 = v106;
    double v109 = v108;
    v110 = [(MediaControlsHeaderView *)self secondaryMarqueeView];
    objc_msgSend(v110, "setFrame:", v103, v105, v107, v109);

    [(MediaControlsHeaderView *)self bounds];
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    double v112 = v111;
    double v114 = v113;
    double v116 = v115;
    double v118 = v117;
    v119 = [(MediaControlsHeaderView *)self placeholderLabel];
    objc_msgSend(v119, "setFrame:", v112, v114, v116, v118);

    v120 = [(MediaControlsHeaderView *)self primaryMarqueeView];
    objc_msgSend(v120, "setContentSize:", v160, v149);

    v121 = [(MediaControlsHeaderView *)self secondaryMarqueeView];
    objc_msgSend(v121, "setContentSize:", v88, v148);

    [(MediaControlsHeaderView *)self style];
    UIRectIntegralWithScale();
    double v123 = v122;
    double v125 = v124;
    double v127 = v126;
    double v129 = v128;
    UIRectIntegralWithScale();
    double v131 = v130;
    double v133 = v132;
    double v153 = v134;
    double v136 = v135;
    v137 = [(MediaControlsHeaderView *)self routeLabel];
    objc_msgSend(v137, "setFrame:", v158, v152, v145, v144);

    v138 = [(MediaControlsHeaderView *)self primaryLabel];
    objc_msgSend(v138, "setFrame:", v123, v125, v127, v129);

    v139 = [(MediaControlsHeaderView *)self secondaryLabel];
    objc_msgSend(v139, "setFrame:", v131, v133, v153, v136);

    double v10 = v146;
    double v39 = v88;
  }
  double v140 = v160;
  if (v10 >= v160) {
    double v140 = v10;
  }
  if (v140 >= v39) {
    double v39 = v140;
  }

  double v141 = v39;
  double v142 = v159;
  result.double height = v142;
  result.double width = v141;
  return result;
}

- (void)_updateStyle
{
  visualStylingProvider = self->_visualStylingProvider;
  double v4 = [(MediaControlsHeaderView *)self secondaryLabel];
  [(MTVisualStylingProvider *)visualStylingProvider stopAutomaticallyUpdatingView:v4];

  double v5 = self->_visualStylingProvider;
  double v6 = [(MediaControlsHeaderView *)self secondaryLabel];
  [(MTVisualStylingProvider *)v5 automaticallyUpdateView:v6 withStyle:self->_style == 1];

  if ([(MediaControlsHeaderView *)self marqueeEnabled]) {
    BOOL v7 = (unint64_t)(self->_style - 3) < 0xFFFFFFFFFFFFFFFELL;
  }
  else {
    BOOL v7 = 0;
  }
  double v8 = [(MediaControlsHeaderView *)self primaryMarqueeView];
  [v8 setMarqueeEnabled:v7];

  double v9 = [(MediaControlsHeaderView *)self secondaryMarqueeView];
  [v9 setMarqueeEnabled:v7];

  switch(self->_style)
  {
    case 0:
    case 3:
    case 4:
    case 5:
      goto LABEL_7;
    case 1:
      double v10 = [(MediaControlsHeaderView *)self routingButton];
      [v10 setAlpha:0.0];

      double v11 = [(MediaControlsHeaderView *)self routeLabel];
      [v11 setAlpha:0.0];

      v12 = [(MediaControlsHeaderView *)self placeholderArtworkView];
      uint64_t v13 = v12;
      double v14 = 0.0;
      goto LABEL_8;
    case 2:
      NSComparisonResult v15 = [(MediaControlsHeaderView *)self routingButton];
      [v15 setAlpha:0.0];

LABEL_7:
      v12 = [(MediaControlsHeaderView *)self routeLabel];
      uint64_t v13 = v12;
      double v14 = 1.0;
LABEL_8:
      [v12 setAlpha:v14];

      break;
    default:
      break;
  }
  int64_t style = self->_style;
  double v17 = 0.0;
  if (style == 3) {
    double v17 = 1.0;
  }
  if (style) {
    double v18 = v17;
  }
  else {
    double v18 = 1.0;
  }
  int64_t v19 = [(MediaControlsHeaderView *)self buttonType];
  if (v19 == 2)
  {
    int64_t v25 = [(MediaControlsHeaderView *)self routingButton];
    [v25 setAlpha:v18];

    v26 = [(MediaControlsHeaderView *)self routingButton];
    [v26 setUserInteractionEnabled:1];

    uint64_t v27 = [(MediaControlsHeaderView *)self isRouting];
    double v22 = [(MediaControlsHeaderView *)self routingButton];
    double v23 = v22;
    uint64_t v24 = v27;
  }
  else if (v19 == 1)
  {
    double v28 = [(MediaControlsHeaderView *)self routingButton];
    [v28 setAlpha:v18];

    double v29 = [(MediaControlsHeaderView *)self routingButton];
    [v29 setUserInteractionEnabled:1];

    double v22 = [(MediaControlsHeaderView *)self routingButton];
    double v23 = v22;
    uint64_t v24 = 2;
  }
  else
  {
    if (v19) {
      goto LABEL_21;
    }
    uint64_t v20 = [(MediaControlsHeaderView *)self routingButton];
    [v20 setAlpha:0.0];

    uint64_t v21 = [(MediaControlsHeaderView *)self routingButton];
    [v21 setUserInteractionEnabled:0];

    double v22 = [(MediaControlsHeaderView *)self routingButton];
    double v23 = v22;
    uint64_t v24 = 0;
  }
  [v22 setCurrentMode:v24];

LABEL_21:

  [(MediaControlsHeaderView *)self updateArtworkStyle];
}

- (void)updateArtworkStyle
{
  switch(self->_style)
  {
    case 0:
    case 2:
    case 3:
    case 4:
      double v3 = [(MediaControlsHeaderView *)self artworkView];
      double v4 = [v3 image];
      if (v4) {
        double v5 = 1.0;
      }
      else {
        double v5 = 0.0;
      }
      double v6 = [(MediaControlsHeaderView *)self shadow];
      [v6 setAlpha:v5];

      BOOL v7 = [(MediaControlsHeaderView *)self artworkView];
      [v7 setAlpha:1.0];

      double v8 = [(MediaControlsHeaderView *)self placeholderArtworkView];
      double v9 = v8;
      double v10 = 1.0;
      goto LABEL_7;
    case 1:
    case 5:
      double v11 = [(MediaControlsHeaderView *)self shadow];
      [v11 setAlpha:0.0];

      double v8 = [(MediaControlsHeaderView *)self artworkView];
      double v9 = v8;
      double v10 = 0.0;
LABEL_7:
      [v8 setAlpha:v10];

      break;
    default:
      break;
  }
  v12 = [(MediaControlsHeaderView *)self artworkView];
  uint64_t v13 = [v12 image];
  [v13 size];
  double v15 = v14;
  double v16 = [(MediaControlsHeaderView *)self artworkView];
  double v17 = [v16 image];
  [v17 size];
  double v19 = v15 - v18;

  double v20 = -v19;
  if (v19 >= 0.0) {
    double v20 = v19;
  }
  if (v20 <= 0.00000011920929)
  {
    double v22 = [(MediaControlsHeaderView *)self artworkView];
    [v22 alpha];
    double v24 = v23;
    int64_t v25 = [(MediaControlsHeaderView *)self artworkBackground];
    [v25 setWeighting:v24];

    id v29 = [(MediaControlsHeaderView *)self artworkView];
    [v29 alpha];
    double v27 = v26;
    double v28 = [(MediaControlsHeaderView *)self shadow];
    [v28 setAlpha:v27];
  }
  else
  {
    uint64_t v21 = [(MediaControlsHeaderView *)self artworkBackground];
    [v21 setWeighting:0.0];

    id v29 = [(MediaControlsHeaderView *)self shadow];
    [v29 setAlpha:0.0];
  }
}

- (void)setTransitioning:(BOOL)a3
{
  if (self->_transitioning != a3)
  {
    self->_transitioning = a3;
    if (self->_style == 1)
    {
      BOOL v4 = !a3;
      double v5 = [(MediaControlsHeaderView *)self shadow];
      [v5 setHidden:v4];

      BOOL v6 = !self->_transitioning;
      BOOL v7 = [(MediaControlsHeaderView *)self artworkView];
      [v7 setHidden:v6];

      BOOL v8 = !self->_transitioning;
      double v9 = [(MediaControlsHeaderView *)self placeholderArtworkView];
      [v9 setHidden:v8];

      BOOL v10 = !self->_transitioning;
      double v11 = [(MediaControlsHeaderView *)self routingButton];
      id v16 = v11;
      BOOL v12 = v10;
    }
    else
    {
      uint64_t v13 = [(MediaControlsHeaderView *)self shadow];
      [v13 setHidden:0];

      double v14 = [(MediaControlsHeaderView *)self artworkView];
      [v14 setHidden:0];

      double v15 = [(MediaControlsHeaderView *)self placeholderArtworkView];
      [v15 setHidden:0];

      double v11 = [(MediaControlsHeaderView *)self routingButton];
      id v16 = v11;
      BOOL v12 = 0;
    }
    [v11 setHidden:v12];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[MediaControlsHeaderView layoutTextInAvailableBounds:setFrames:](self, "layoutTextInAvailableBounds:setFrames:", 0, 0.0, 0.0, a3.width, a3.height);
  if (v4 < 60.0) {
    double v4 = 60.0;
  }
  double v5 = width;
  result.double height = v4;
  result.CGFloat width = v5;
  return result;
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)MediaControlsHeaderView;
  [(MediaControlsHeaderView *)&v4 didMoveToWindow];
  double v3 = [(MediaControlsHeaderView *)self window];
  [(MediaControlsHeaderView *)self setMarqueeEnabled:v3 != 0];

  [(MediaControlsHeaderView *)self _updateStyle];
}

- (void)tintColorDidChange
{
  v7.receiver = self;
  v7.super_class = (Class)MediaControlsHeaderView;
  [(MediaControlsHeaderView *)&v7 tintColorDidChange];
  if (!self->_visualStylingProvider)
  {
    double v3 = [(MediaControlsHeaderView *)self tintColor];
    objc_super v4 = [(MediaControlsHeaderView *)self traitCollection];
    double v5 = objc_msgSend(v3, "secondaryColorForInterfaceStyle:", objc_msgSend(v4, "userInterfaceStyle"));
    BOOL v6 = [(MediaControlsHeaderView *)self routeLabel];
    [v6 setTextColor:v5];
  }
  [(MediaControlsHeaderView *)self _updateStyle];
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_int64_t style = a3;
    [(MediaControlsHeaderView *)self _updateStyle];
    [(MediaControlsHeaderView *)self setNeedsLayout];
  }
}

- (void)setButtonType:(int64_t)a3
{
  if (self->_buttonType != a3)
  {
    self->_buttonType = a3;
    [(MediaControlsHeaderView *)self _updateStyle];
    [(MediaControlsHeaderView *)self setNeedsLayout];
    [(MediaControlsHeaderView *)self layoutIfNeeded];
  }
}

- (void)setPrimaryString:(id)a3
{
  double v5 = (NSString *)a3;
  if (self->_primaryString != v5)
  {
    BOOL v8 = v5;
    objc_storeStrong((id *)&self->_primaryString, a3);
    primaryString = self->_primaryString;
    objc_super v7 = [(MediaControlsHeaderView *)self primaryLabel];
    [v7 setText:primaryString];

    [(MediaControlsHeaderView *)self _updateRTL];
    [(MediaControlsHeaderView *)self setNeedsLayout];
    double v5 = v8;
  }
}

- (void)setSecondaryString:(id)a3
{
  double v5 = (NSString *)a3;
  if (self->_secondaryString != v5)
  {
    BOOL v8 = v5;
    objc_storeStrong((id *)&self->_secondaryString, a3);
    secondaryString = self->_secondaryString;
    objc_super v7 = [(MediaControlsHeaderView *)self secondaryLabel];
    [v7 setText:secondaryString];

    [(MediaControlsHeaderView *)self _updateRTL];
    [(MediaControlsHeaderView *)self setNeedsLayout];
    double v5 = v8;
  }
}

- (void)setPlaceholderString:(id)a3
{
  double v5 = (NSString *)a3;
  if (self->_placeholderString != v5)
  {
    BOOL v8 = v5;
    objc_storeStrong((id *)&self->_placeholderString, a3);
    placeholderString = self->_placeholderString;
    objc_super v7 = [(MediaControlsHeaderView *)self placeholderLabel];
    [v7 setText:placeholderString];

    [(MediaControlsHeaderView *)self setNeedsLayout];
    double v5 = v8;
  }
}

- (void)setShowPlaceholderString:(BOOL)a3
{
  if (self->_showPlaceholderString != a3)
  {
    self->_BOOL showPlaceholderString = a3;
    BOOL v4 = !a3;
    double v5 = [(MediaControlsHeaderView *)self placeholderLabel];
    [v5 setHidden:v4];

    BOOL showPlaceholderString = self->_showPlaceholderString;
    objc_super v7 = [(MediaControlsHeaderView *)self primaryLabel];
    [v7 setHidden:showPlaceholderString];

    BOOL v8 = self->_showPlaceholderString;
    double v9 = [(MediaControlsHeaderView *)self secondaryLabel];
    [v9 setHidden:v8];

    BOOL v10 = self->_showPlaceholderString;
    id v11 = [(MediaControlsHeaderView *)self routeLabel];
    [v11 setHidden:v10];
  }
}

- (void)setMarqueeEnabled:(BOOL)a3
{
  if (self->_marqueeEnabled != a3)
  {
    self->_marqueeEnabled = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __45__MediaControlsHeaderView_setMarqueeEnabled___block_invoke;
    v3[3] = &unk_1E5F0D7F8;
    v3[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v3];
  }
}

uint64_t __45__MediaControlsHeaderView_setMarqueeEnabled___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateStyle];
}

- (void)setOverrideSize:(CGSize)a3
{
  double width = a3.width;
  self->_overrideSize = a3;
  -[MediaControlsHeaderView layoutTextInAvailableBounds:setFrames:](self, "layoutTextInAvailableBounds:setFrames:", 0, 0.0, 0.0, a3.width, a3.height);
  if (v5 <= width + -12.0)
  {
    [(MediaControlsHeaderView *)self setShouldUseOverrideSize:0];
  }
  else
  {
    [(MediaControlsHeaderView *)self setShouldUseOverrideSize:1];
    [(MediaControlsHeaderView *)self setNeedsLayout];
    [(MediaControlsHeaderView *)self layoutIfNeeded];
  }
}

- (void)clearOverrideSize
{
  self->_overrideSize = (CGSize)*MEMORY[0x1E4F1DB30];
  [(MediaControlsHeaderView *)self setShouldUseOverrideSize:0];
}

- (void)setRouting:(BOOL)a3
{
  if (self->_routing != a3)
  {
    self->_routing = a3;
    [(MediaControlsHeaderView *)self _updateStyle];
  }
}

- (void)setVisualStylingProvider:(id)a3
{
  double v5 = (MTVisualStylingProvider *)a3;
  p_visualStylingProvider = &self->_visualStylingProvider;
  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider != v5)
  {
    id v29 = v5;
    BOOL v8 = [(MediaControlsHeaderView *)self routeLabel];
    double v9 = [v8 titleLabel];
    [(MTVisualStylingProvider *)visualStylingProvider stopAutomaticallyUpdatingView:v9];

    BOOL v10 = *p_visualStylingProvider;
    id v11 = [(MediaControlsHeaderView *)self primaryLabel];
    [(MTVisualStylingProvider *)v10 stopAutomaticallyUpdatingView:v11];

    BOOL v12 = *p_visualStylingProvider;
    uint64_t v13 = [(MediaControlsHeaderView *)self secondaryLabel];
    [(MTVisualStylingProvider *)v12 stopAutomaticallyUpdatingView:v13];

    double v14 = *p_visualStylingProvider;
    double v15 = [(MediaControlsHeaderView *)self placeholderLabel];
    [(MTVisualStylingProvider *)v14 stopAutomaticallyUpdatingView:v15];

    id v16 = *p_visualStylingProvider;
    double v17 = [(MediaControlsHeaderView *)self placeholderArtworkView];
    [(MTVisualStylingProvider *)v16 stopAutomaticallyUpdatingView:v17];

    objc_storeStrong((id *)&self->_visualStylingProvider, a3);
    double v18 = *p_visualStylingProvider;
    double v19 = [(MediaControlsHeaderView *)self routeLabel];
    double v20 = [v19 titleLabel];
    [(MTVisualStylingProvider *)v18 automaticallyUpdateView:v20 withStyle:1];

    uint64_t v21 = *p_visualStylingProvider;
    double v22 = [(MediaControlsHeaderView *)self primaryLabel];
    [(MTVisualStylingProvider *)v21 automaticallyUpdateView:v22 withStyle:0];

    double v23 = *p_visualStylingProvider;
    double v24 = [(MediaControlsHeaderView *)self secondaryLabel];
    [(MTVisualStylingProvider *)v23 automaticallyUpdateView:v24 withStyle:1];

    int64_t v25 = *p_visualStylingProvider;
    double v26 = [(MediaControlsHeaderView *)self placeholderLabel];
    [(MTVisualStylingProvider *)v25 automaticallyUpdateView:v26 withStyle:0];

    double v27 = *p_visualStylingProvider;
    double v28 = [(MediaControlsHeaderView *)self placeholderArtworkView];
    [(MTVisualStylingProvider *)v27 automaticallyUpdateView:v28 withStyle:0];

    double v5 = v29;
  }
}

- (void)_updateRTL
{
  double v3 = [(MediaControlsHeaderView *)self primaryLabel];
  BOOL v4 = [v3 text];
  unsigned int v5 = [v4 _isNaturallyRTL];

  BOOL v6 = [(MediaControlsHeaderView *)self primaryMarqueeView];
  [v6 setAnimationDirection:v5];

  objc_super v7 = [(MediaControlsHeaderView *)self primaryMarqueeView];
  BOOL v8 = v7;
  if (v5) {
    uint64_t v9 = 4;
  }
  else {
    uint64_t v9 = 3;
  }
  [v7 setSemanticContentAttribute:v9];

  BOOL v10 = [(MediaControlsHeaderView *)self secondaryLabel];
  id v11 = [v10 text];
  unsigned int v12 = [v11 _isNaturallyRTL];

  uint64_t v13 = [(MediaControlsHeaderView *)self secondaryMarqueeView];
  [v13 setAnimationDirection:v12];

  double v14 = [(MediaControlsHeaderView *)self secondaryMarqueeView];
  id v16 = v14;
  if (v12) {
    uint64_t v15 = 4;
  }
  else {
    uint64_t v15 = 3;
  }
  [v14 setSemanticContentAttribute:v15];
}

- (void)launchNowPlayingAppButtonPressed
{
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6 = a4;
  objc_super v7 = [(MediaControlsHeaderView *)self launchNowPlayingAppButton];
  if ([v7 isHidden])
  {
    BOOL v8 = 0;
LABEL_5:

    goto LABEL_7;
  }
  uint64_t v9 = [(MediaControlsHeaderView *)self artworkContentView];
  [v9 frame];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  [v6 location];
  v24.x = v18;
  v24.y = v19;
  v25.origin.x = v11;
  v25.origin.y = v13;
  v25.size.double width = v15;
  v25.size.double height = v17;
  BOOL v20 = CGRectContainsPoint(v25, v24);

  if (v20)
  {
    uint64_t v21 = (void *)MEMORY[0x1E4FB1AD8];
    objc_super v7 = [(MediaControlsHeaderView *)self artworkContentView];
    [v7 frame];
    BOOL v8 = objc_msgSend(v21, "regionWithRect:identifier:", @"Artwork");
    goto LABEL_5;
  }
  BOOL v8 = 0;
LABEL_7:

  return v8;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = objc_alloc(MEMORY[0x1E4FB1D48]);
  id v6 = [(MediaControlsHeaderView *)self artworkContentView];
  objc_super v7 = (void *)[v5 initWithView:v6];

  BOOL v8 = [MEMORY[0x1E4FB1AD0] effectWithPreview:v7];
  uint64_t v9 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v8 shape:0];

  return v9;
}

- (MPCPlayerPath)playerPath
{
  return self->_playerPath;
}

- (void)setPlayerPath:(id)a3
{
}

- (UIImageView)artworkView
{
  return self->_artworkView;
}

- (void)setArtworkView:(id)a3
{
}

- (UIImageView)placeholderArtworkView
{
  return self->_placeholderArtworkView;
}

- (void)setPlaceholderArtworkView:(id)a3
{
}

- (BOOL)isTransitioning
{
  return self->_transitioning;
}

- (int64_t)style
{
  return self->_style;
}

- (MPRouteLabel)routeLabel
{
  return self->_routeLabel;
}

- (void)setRouteLabel:(id)a3
{
}

- (NSString)primaryString
{
  return self->_primaryString;
}

- (NSString)secondaryString
{
  return self->_secondaryString;
}

- (NSString)placeholderString
{
  return self->_placeholderString;
}

- (BOOL)showPlaceholderString
{
  return self->_showPlaceholderString;
}

- (MediaControlsRoutingButtonView)routingButton
{
  return self->_routingButton;
}

- (void)setRoutingButton:(id)a3
{
}

- (MPButton)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
}

- (UIButton)launchNowPlayingAppButton
{
  return self->_launchNowPlayingAppButton;
}

- (void)setLaunchNowPlayingAppButton:(id)a3
{
}

- (BOOL)marqueeEnabled
{
  return self->_marqueeEnabled;
}

- (int64_t)buttonType
{
  return self->_buttonType;
}

- (BOOL)isRouting
{
  return self->_routing;
}

- (BOOL)scalePlaceholderImage
{
  return self->_scalePlaceholderImage;
}

- (void)setScalePlaceholderImage:(BOOL)a3
{
  self->_scalePlaceholderImage = a3;
}

- (MTVisualStylingProvider)visualStylingProvider
{
  return self->_visualStylingProvider;
}

- (CGSize)overrideSize
{
  double width = self->_overrideSize.width;
  double height = self->_overrideSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (void)setPointerInteraction:(id)a3
{
}

- (MTMaterialView)artworkBackground
{
  return self->_artworkBackground;
}

- (void)setArtworkBackground:(id)a3
{
}

- (UIView)shadow
{
  return self->_shadow;
}

- (void)setShadow:(id)a3
{
}

- (MPUMarqueeView)primaryMarqueeView
{
  return self->_primaryMarqueeView;
}

- (void)setPrimaryMarqueeView:(id)a3
{
}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (void)setPrimaryLabel:(id)a3
{
}

- (MPUMarqueeView)secondaryMarqueeView
{
  return self->_secondaryMarqueeView;
}

- (void)setSecondaryMarqueeView:(id)a3
{
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
}

- (UILabel)placeholderLabel
{
  return self->_placeholderLabel;
}

- (void)setPlaceholderLabel:(id)a3
{
}

- (BOOL)shouldUseOverrideSize
{
  return self->_shouldUseOverrideSize;
}

- (void)setShouldUseOverrideSize:(BOOL)a3
{
  self->_shouldUseOverrideSize = a3;
}

- (UIView)artworkContentView
{
  return self->_artworkContentView;
}

- (void)setArtworkContentView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkContentView, 0);
  objc_storeStrong((id *)&self->_placeholderLabel, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_secondaryMarqueeView, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryMarqueeView, 0);
  objc_storeStrong((id *)&self->_shadow, 0);
  objc_storeStrong((id *)&self->_artworkBackground, 0);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
  objc_storeStrong((id *)&self->_launchNowPlayingAppButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_routingButton, 0);
  objc_storeStrong((id *)&self->_placeholderString, 0);
  objc_storeStrong((id *)&self->_secondaryString, 0);
  objc_storeStrong((id *)&self->_primaryString, 0);
  objc_storeStrong((id *)&self->_routeLabel, 0);
  objc_storeStrong((id *)&self->_placeholderArtworkView, 0);
  objc_storeStrong((id *)&self->_artworkView, 0);

  objc_storeStrong((id *)&self->_playerPath, 0);
}

@end