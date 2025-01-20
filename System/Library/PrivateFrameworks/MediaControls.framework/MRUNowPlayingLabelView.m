@interface MRUNowPlayingLabelView
- (BOOL)_increaseContrast;
- (BOOL)acuis_wantsPriorityOverTargetOfGestureRecognizer:(id)a3;
- (BOOL)adjustsLabelsWhenHighlighted;
- (BOOL)disablesLabelsLayoutAnimation;
- (BOOL)isLabelOversized:(id)a3;
- (BOOL)isMarqueeEnabled;
- (BOOL)showDevice;
- (BOOL)showPlaceholder;
- (BOOL)showRoute;
- (BOOL)showSubtitle;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeForTextInLabel:(id)a3 availableSize:(CGSize)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MPAVRoute)route;
- (MPRouteLabel)routeLabel;
- (MRUMarqueeLabel)placeholderMarqueeView;
- (MRUMarqueeLabel)subtitleMarqueeView;
- (MRUMarqueeLabel)titleMarqueeView;
- (MRUNowPlayingLabelView)initWithFrame:(CGRect)a3;
- (MRUVisualStylingProvider)stylingProvider;
- (NSString)placeholder;
- (NSString)subtitle;
- (NSString)title;
- (UIEdgeInsets)marqueeFadeEdgeInsets;
- (UIFont)placeholderFont;
- (UIFont)routeFont;
- (UIFont)subtitleFont;
- (UIFont)titleFont;
- (UIImage)deviceImage;
- (UIImageView)deviceImageView;
- (UILabel)heightSizingLabel;
- (UIView)contentView;
- (double)contentScale;
- (double)estimatedHeight;
- (double)heightForTextInLabel:(id)a3;
- (double)intrinsicHeightForTextInLabel:(id)a3;
- (double)marqueeContentGap;
- (id)viewForFirstBaselineLayout;
- (int64_t)layout;
- (int64_t)textAlignment;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setAdjustsLabelsWhenHighlighted:(BOOL)a3;
- (void)setContentScale:(double)a3;
- (void)setContentView:(id)a3;
- (void)setDeviceImage:(id)a3;
- (void)setDeviceImageView:(id)a3;
- (void)setDisablesLabelsLayoutAnimation:(BOOL)a3;
- (void)setHeightSizingLabel:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setLayout:(int64_t)a3;
- (void)setMarqueeContentGap:(double)a3;
- (void)setMarqueeEnabled:(BOOL)a3;
- (void)setMarqueeFadeEdgeInsets:(UIEdgeInsets)a3;
- (void)setPlaceholder:(id)a3;
- (void)setPlaceholderFont:(id)a3;
- (void)setPlaceholderMarqueeView:(id)a3;
- (void)setRoute:(id)a3;
- (void)setRouteFont:(id)a3;
- (void)setRouteLabel:(id)a3;
- (void)setShowDevice:(BOOL)a3;
- (void)setShowPlaceholder:(BOOL)a3;
- (void)setShowRoute:(BOOL)a3;
- (void)setShowSubtitle:(BOOL)a3;
- (void)setStylingProvider:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleFont:(id)a3;
- (void)setSubtitleMarqueeView:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)setTitleFont:(id)a3;
- (void)setTitleMarqueeView:(id)a3;
- (void)updateContentSizeCategory;
- (void)updateFonts;
- (void)updateMarquee;
- (void)updatePlaceholderTextAlignment;
- (void)updateVisibility;
- (void)updateVisualStyling;
@end

@implementation MRUNowPlayingLabelView

- (MRUNowPlayingLabelView)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)MRUNowPlayingLabelView;
  v3 = -[MRUNowPlayingLabelView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    contentView = v3->_contentView;
    v3->_contentView = v4;

    v6 = [(UIView *)v3->_contentView layer];
    [v6 setAllowsGroupOpacity:0];

    [(UIView *)v3->_contentView setUserInteractionEnabled:0];
    [(MRUNowPlayingLabelView *)v3 addSubview:v3->_contentView];
    v7 = (MPRouteLabel *)objc_alloc_init(MEMORY[0x1E4F31A38]);
    routeLabel = v3->_routeLabel;
    v3->_routeLabel = v7;

    [(UIView *)v3->_contentView addSubview:v3->_routeLabel];
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    heightSizingLabel = v3->_heightSizingLabel;
    v3->_heightSizingLabel = v9;

    [(UILabel *)v3->_heightSizingLabel setSizingRule:1];
    v11 = objc_alloc_init(MRUMarqueeLabel);
    titleMarqueeView = v3->_titleMarqueeView;
    v3->_titleMarqueeView = v11;

    [(MRUMarqueeLabel *)v3->_titleMarqueeView setContentGap:26.0];
    [(MRUMarqueeLabel *)v3->_titleMarqueeView setAnimationReferenceView:v3];
    [(UIView *)v3->_contentView addSubview:v3->_titleMarqueeView];
    v13 = objc_alloc_init(MRUMarqueeLabel);
    subtitleMarqueeView = v3->_subtitleMarqueeView;
    v3->_subtitleMarqueeView = v13;

    [(MRUMarqueeLabel *)v3->_subtitleMarqueeView setContentGap:26.0];
    [(MRUMarqueeLabel *)v3->_subtitleMarqueeView addCoordinatedMarqueeView:v3->_titleMarqueeView];
    [(MRUMarqueeLabel *)v3->_subtitleMarqueeView setAnimationReferenceView:v3];
    [(UIView *)v3->_contentView addSubview:v3->_subtitleMarqueeView];
    v15 = objc_alloc_init(MRUMarqueeLabel);
    placeholderMarqueeView = v3->_placeholderMarqueeView;
    v3->_placeholderMarqueeView = v15;

    [(MRUMarqueeLabel *)v3->_placeholderMarqueeView setContentGap:26.0];
    [(MRUMarqueeLabel *)v3->_placeholderMarqueeView setAnimationReferenceView:v3];
    [(MRUMarqueeLabel *)v3->_placeholderMarqueeView setWantsContentAwareTypesettingLanguage:1];
    [(MRUMarqueeLabel *)v3->_placeholderMarqueeView setSizingRule:1];
    [(UIView *)v3->_contentView addSubview:v3->_placeholderMarqueeView];
    v17 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    deviceImageView = v3->_deviceImageView;
    v3->_deviceImageView = v17;

    [(MRUNowPlayingLabelView *)v3 addSubview:v3->_deviceImageView];
    v3->_contentScale = 1.0;
    v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 addObserver:v3 selector:sel_updateContentSizeCategory name:*MEMORY[0x1E4FB27A8] object:0];
    [v19 addObserver:v3 selector:sel_updateVisualStyling name:*MEMORY[0x1E4FB2438] object:0];
    [v19 addObserver:v3 selector:sel_updateVisualStyling name:*MEMORY[0x1E4FB24A8] object:0];
    v3->_showRoute = 1;
    v3->_showSubtitle = 1;
    v3->_adjustsLabelsWhenHighlighted = 1;
    v3->_disablesLabelsLayoutAnimation = 1;
    -[MRUNowPlayingLabelView setMarqueeFadeEdgeInsets:](v3, "setMarqueeFadeEdgeInsets:", 0.0, 3.0, 0.0, 3.0);
    [(MRUNowPlayingLabelView *)v3 updateContentSizeCategory];
    [(MRUNowPlayingLabelView *)v3 updateVisibility];
  }
  return v3;
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)MRUNowPlayingLabelView;
  [(MRUNowPlayingLabelView *)&v4 didMoveToWindow];
  v3 = [(MRUNowPlayingLabelView *)self window];

  if (!v3) {
    [(MRUNowPlayingLabelView *)self setMarqueeEnabled:0];
  }
}

- (void)layoutSubviews
{
  v125.receiver = self;
  v125.super_class = (Class)MRUNowPlayingLabelView;
  [(MRUNowPlayingLabelView *)&v125 layoutSubviews];
  [(MRUNowPlayingLabelView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(MRUNowPlayingLabelView *)self traitCollection];
  [v11 displayScale];
  uint64_t v13 = v12;

  -[UIView setFrame:](self->_contentView, "setFrame:", v4, v6, v8, v10);
  -[MPRouteLabel sizeThatFits:](self->_routeLabel, "sizeThatFits:", v8, v10);
  double rect = v14;
  double v16 = v15;
  -[MRUNowPlayingLabelView sizeForTextInLabel:availableSize:](self, "sizeForTextInLabel:availableSize:", self->_placeholderMarqueeView, v8, v10);
  double rect_8 = v17;
  double v121 = v18;
  -[MRUNowPlayingLabelView sizeForTextInLabel:availableSize:](self, "sizeForTextInLabel:availableSize:", self->_titleMarqueeView, v8, v10);
  double v20 = v19;
  double v22 = v21;
  -[MRUNowPlayingLabelView sizeForTextInLabel:availableSize:](self, "sizeForTextInLabel:availableSize:", self->_subtitleMarqueeView, v8, v10);
  double v123 = v23;
  int64_t layout = self->_layout;
  double rect_16 = v20;
  double rect_24 = v25;
  if ((unint64_t)(layout - 4) >= 2)
  {
    uint64_t v112 = v13;
    if (layout)
    {
      NSUInteger v40 = [(NSString *)self->_title length];
      double v115 = v16;
      if (!self->_showPlaceholder && self->_showSubtitle) {
        [(NSString *)self->_subtitle length];
      }
      double v114 = v22;
      v155.origin.CGFloat x = v4;
      v155.origin.CGFloat y = v6;
      v155.size.CGFloat width = v8;
      v155.size.CGFloat height = v10;
      CGRectGetHeight(v155);
      UIRoundToViewScale();
      UIRectInset();
      CGFloat x = v156.origin.x;
      CGFloat y = v156.origin.y;
      CGFloat width = v156.size.width;
      CGFloat height = v156.size.height;
      CGFloat MinX = CGRectGetMinX(v156);
      v157.origin.CGFloat x = x;
      v157.origin.CGFloat y = y;
      v157.size.CGFloat width = width;
      v157.size.CGFloat height = height;
      CGFloat MinY = CGRectGetMinY(v157);
      v158.origin.CGFloat x = x;
      v158.origin.CGFloat y = y;
      v158.size.CGFloat width = width;
      v158.size.CGFloat height = height;
      double v89 = CGRectGetWidth(v158);
      if (rect >= v89) {
        CGFloat v90 = v89;
      }
      else {
        CGFloat v90 = rect;
      }
      if (self->_textAlignment == 1)
      {
        uint64_t v111 = v112;
        UIRectCenteredXInRectScale();
        CGFloat MinX = v91;
        CGFloat MinY = v92;
        CGFloat v90 = v93;
        CGFloat v95 = v94;
      }
      else
      {
        CGFloat v95 = v115;
      }
      [(MRUNowPlayingLabelView *)self bounds];
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MPRouteLabel setFrame:](self->_routeLabel, "setFrame:");
      if (self->_showRoute)
      {
        v159.origin.CGFloat x = MinX;
        v159.origin.CGFloat y = MinY;
        v159.size.CGFloat width = v90;
        v159.size.CGFloat height = v95;
        CGRectGetHeight(v159);
        UIRectInset();
        CGFloat x = v96;
        CGFloat y = v97;
        CGFloat width = v98;
        CGFloat height = v99;
      }
      v160.origin.CGFloat x = x;
      v160.origin.CGFloat y = y;
      v160.size.CGFloat width = width;
      v160.size.CGFloat height = height;
      double v100 = CGRectGetMinX(v160);
      v161.origin.CGFloat x = x;
      v161.origin.CGFloat y = y;
      v161.size.CGFloat width = width;
      v161.size.CGFloat height = height;
      double v101 = CGRectGetMinY(v161);
      v162.origin.CGFloat x = x;
      v162.origin.CGFloat y = y;
      v162.size.CGFloat width = width;
      v162.size.CGFloat height = height;
      -[MRUMarqueeLabel setFrame:](self->_placeholderMarqueeView, "setFrame:", v100, v101, CGRectGetWidth(v162), v121);
      -[MRUMarqueeLabel setContentSize:](self->_placeholderMarqueeView, "setContentSize:", rect_8, v121);
      v163.origin.CGFloat x = x;
      v163.origin.CGFloat y = y;
      v163.size.CGFloat width = width;
      v163.size.CGFloat height = height;
      double v102 = CGRectGetMinX(v163);
      v164.origin.CGFloat x = x;
      v164.origin.CGFloat y = y;
      v164.size.CGFloat width = width;
      v164.size.CGFloat height = height;
      double v103 = CGRectGetMinY(v164);
      v165.origin.CGFloat x = x;
      v165.origin.CGFloat y = y;
      v165.size.CGFloat width = width;
      v165.size.CGFloat height = height;
      double v104 = CGRectGetWidth(v165);
      -[MRUMarqueeLabel setFrame:](self->_titleMarqueeView, "setFrame:", v102, v103, v104, v114);
      -[MRUMarqueeLabel setContentSize:](self->_titleMarqueeView, "setContentSize:", rect_16, v114);
      if (v40)
      {
        v166.origin.CGFloat x = v102;
        v166.origin.CGFloat y = v103;
        v166.size.CGFloat width = v104;
        v166.size.CGFloat height = v114;
        CGRectGetHeight(v166);
        UIRectInset();
        CGFloat x = v105;
        CGFloat y = v106;
        CGFloat width = v107;
        CGFloat height = v108;
      }
      v167.origin.CGFloat x = x;
      v167.origin.CGFloat y = y;
      v167.size.CGFloat width = width;
      v167.size.CGFloat height = height;
      CGFloat v109 = CGRectGetMinX(v167);
      v168.origin.CGFloat x = x;
      v168.origin.CGFloat y = y;
      v168.size.CGFloat width = width;
      v168.size.CGFloat height = height;
      CGFloat v110 = CGRectGetMinY(v168);
      v169.origin.CGFloat x = x;
      v169.origin.CGFloat y = y;
      v169.size.CGFloat width = width;
      v169.size.CGFloat height = height;
      double v36 = CGRectGetWidth(v169);
      subtitleMarqueeView = self->_subtitleMarqueeView;
      double v38 = v109;
      double v39 = v110;
    }
    else
    {
      v126.origin.CGFloat x = v4;
      v126.origin.CGFloat y = v6;
      v126.size.CGFloat width = v8;
      v126.size.CGFloat height = v10;
      CGRectGetMinY(v126);
      v127.origin.CGFloat x = v4;
      v127.origin.CGFloat y = v6;
      v127.size.CGFloat width = v8;
      v127.size.CGFloat height = v10;
      CGRectGetWidth(v127);
      UIRectCenteredXInRectScale();
      [(MPRouteLabel *)self->_routeLabel setFrame:v13];
      v128.origin.CGFloat x = v4;
      v128.origin.CGFloat y = v6;
      v128.size.CGFloat width = v8;
      v128.size.CGFloat height = v10;
      double recta = CGRectGetMinX(v128);
      v129.origin.CGFloat x = v4;
      v129.origin.CGFloat y = v6;
      v129.size.CGFloat width = v8;
      v129.size.CGFloat height = v10;
      double v28 = CGRectGetMinY(v129);
      v130.origin.CGFloat x = v4;
      v130.origin.CGFloat y = v6;
      v130.size.CGFloat width = v8;
      v130.size.CGFloat height = v10;
      double v29 = CGRectGetWidth(v130);
      -[MRUMarqueeLabel setFrame:](self->_titleMarqueeView, "setFrame:", recta, v28, v29, v22);
      -[MRUMarqueeLabel setContentSize:](self->_titleMarqueeView, "setContentSize:", v20, v22);
      v131.origin.CGFloat x = v4;
      v131.origin.CGFloat y = v6;
      v131.size.CGFloat width = v8;
      v131.size.CGFloat height = v10;
      CGRectGetMinX(v131);
      v132.origin.CGFloat x = v4;
      v132.origin.CGFloat y = v6;
      v132.size.CGFloat width = v8;
      v132.size.CGFloat height = v10;
      CGRectGetWidth(v132);
      UIRectCenteredYInRectScale();
      [(MRUMarqueeLabel *)self->_placeholderMarqueeView setFrame:v112];
      -[MRUMarqueeLabel setContentSize:](self->_placeholderMarqueeView, "setContentSize:", rect_8, v121);
      v133.origin.CGFloat x = recta;
      v133.origin.CGFloat y = v28;
      v133.size.CGFloat width = v29;
      v133.size.CGFloat height = v22;
      CGRectGetHeight(v133);
      UIRectInset();
      CGFloat v30 = v134.origin.x;
      CGFloat v31 = v134.origin.y;
      CGFloat v32 = v134.size.width;
      CGFloat v33 = v134.size.height;
      CGFloat v34 = CGRectGetMinX(v134);
      v135.origin.CGFloat x = v30;
      v135.origin.CGFloat y = v31;
      v135.size.CGFloat width = v32;
      v135.size.CGFloat height = v33;
      CGFloat v35 = CGRectGetMinY(v135);
      v136.origin.CGFloat x = v30;
      v136.origin.CGFloat y = v31;
      v136.size.CGFloat width = v32;
      v136.size.CGFloat height = v33;
      double v36 = CGRectGetWidth(v136);
      subtitleMarqueeView = self->_subtitleMarqueeView;
      double v38 = v34;
      double v39 = v35;
    }
    -[MRUMarqueeLabel setFrame:](subtitleMarqueeView, "setFrame:", v38, v39, v36, v123);
    -[MRUMarqueeLabel setContentSize:](self->_subtitleMarqueeView, "setContentSize:", rect_24, v123);
  }
  else
  {
    NSUInteger v26 = [(NSString *)self->_title length];
    BOOL v27 = self->_showSubtitle && [(NSString *)self->_subtitle length] != 0;
    double v113 = v22;
    double v41 = v121;
    v137.origin.CGFloat x = v4;
    v137.origin.CGFloat y = v6;
    v137.size.CGFloat width = v8;
    v137.size.CGFloat height = v10;
    CGRectGetHeight(v137);
    UIRoundToViewScale();
    UIRectInset();
    CGFloat v42 = v138.origin.x;
    CGFloat v43 = v138.origin.y;
    double v44 = v138.size.width;
    double v45 = v138.size.height;
    double v46 = CGRectGetMinX(v138);
    v139.origin.CGFloat x = v42;
    v139.origin.CGFloat y = v43;
    v139.size.CGFloat width = v44;
    v139.size.CGFloat height = v45;
    double v47 = CGRectGetMinY(v139);
    v140.origin.CGFloat x = v42;
    v140.origin.CGFloat y = v43;
    v140.size.CGFloat width = v44;
    v140.size.CGFloat height = v45;
    double v48 = CGRectGetWidth(v140);
    if (self->_showRoute)
    {
      double v49 = v121;
    }
    else
    {
      UIRectCenteredYInRect();
      double v46 = v50;
      double v47 = v51;
      double v48 = v52;
    }
    CGFloat v122 = v49;
    -[MRUMarqueeLabel setFrame:](self->_placeholderMarqueeView, "setFrame:", v46, v47, v48);
    -[MRUMarqueeLabel setContentSize:](self->_placeholderMarqueeView, "setContentSize:", rect_8, v41);
    if (self->_showPlaceholder)
    {
      v141.origin.CGFloat x = v46;
      v141.origin.CGFloat y = v47;
      v141.size.CGFloat width = v48;
      v141.size.CGFloat height = v122;
      CGRectGetHeight(v141);
      UIRectInset();
      CGFloat v42 = v53;
      CGFloat v43 = v54;
      double v44 = v55;
      double v45 = v56;
    }
    v142.origin.CGFloat x = v42;
    v142.origin.CGFloat y = v43;
    v142.size.CGFloat width = v44;
    v142.size.CGFloat height = v45;
    double v57 = CGRectGetMinX(v142);
    v143.origin.CGFloat x = v42;
    v143.origin.CGFloat y = v43;
    v143.size.CGFloat width = v44;
    v143.size.CGFloat height = v45;
    double v58 = CGRectGetMinY(v143);
    v144.origin.CGFloat x = v42;
    v144.origin.CGFloat y = v43;
    v144.size.CGFloat width = v44;
    v144.size.CGFloat height = v45;
    double v59 = CGRectGetWidth(v144);
    -[MRUMarqueeLabel setFrame:](self->_titleMarqueeView, "setFrame:", v57, v58, v59, v113);
    -[MRUMarqueeLabel setContentSize:](self->_titleMarqueeView, "setContentSize:", rect_16, v113);
    if (v26)
    {
      v145.origin.CGFloat x = v57;
      v145.origin.CGFloat y = v58;
      v145.size.CGFloat width = v59;
      v145.size.CGFloat height = v113;
      CGRectGetHeight(v145);
      UIRectInset();
      CGFloat v42 = v60;
      CGFloat v43 = v61;
      double v44 = v62;
      double v45 = v63;
    }
    v146.origin.CGFloat x = v42;
    v146.origin.CGFloat y = v43;
    v146.size.CGFloat width = v44;
    v146.size.CGFloat height = v45;
    double v64 = CGRectGetMinX(v146);
    v147.origin.CGFloat x = v42;
    v147.origin.CGFloat y = v43;
    v147.size.CGFloat width = v44;
    v147.size.CGFloat height = v45;
    double v65 = CGRectGetMinY(v147);
    v148.origin.CGFloat x = v42;
    v148.origin.CGFloat y = v43;
    v148.size.CGFloat width = v44;
    v148.size.CGFloat height = v45;
    double v66 = CGRectGetWidth(v148);
    -[MRUMarqueeLabel setFrame:](self->_subtitleMarqueeView, "setFrame:", v64, v65, v66, v123);
    -[MRUMarqueeLabel setContentSize:](self->_subtitleMarqueeView, "setContentSize:", rect_24, v123);
    if (v27)
    {
      v149.origin.CGFloat x = v64;
      v149.origin.CGFloat y = v65;
      v149.size.CGFloat width = v66;
      v149.size.CGFloat height = v123;
      CGRectGetHeight(v149);
      UIRectInset();
      CGFloat v42 = v67;
      CGFloat v43 = v68;
      double v44 = v69;
      double v45 = v70;
    }
    -[UIImageView sizeThatFits:](self->_deviceImageView, "sizeThatFits:", v44, v45);
    v150.origin.CGFloat x = v42;
    v150.origin.CGFloat y = v43;
    v150.size.CGFloat width = v44;
    v150.size.CGFloat height = v45;
    CGRectGetMinX(v150);
    UIRectCenteredYInRect();
    CGFloat v72 = v71;
    CGFloat v74 = v73;
    CGFloat v76 = v75;
    CGFloat v78 = v77;
    [(MRUNowPlayingLabelView *)self bounds];
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    -[UIImageView setFrame:](self->_deviceImageView, "setFrame:");
    if (self->_showDevice)
    {
      v151.origin.CGFloat x = v72;
      v151.origin.CGFloat y = v74;
      v151.size.CGFloat width = v76;
      v151.size.CGFloat height = v78;
      CGRectGetWidth(v151);
      UIRectInset();
      CGFloat v42 = v79;
      CGFloat v43 = v80;
      double v44 = v81;
      double v45 = v82;
    }
    v152.origin.CGFloat x = v42;
    v152.origin.CGFloat y = v43;
    v152.size.CGFloat width = v44;
    v152.size.CGFloat height = v45;
    CGRectGetMinX(v152);
    v153.origin.CGFloat x = v42;
    v153.origin.CGFloat y = v43;
    v153.size.CGFloat width = v44;
    v153.size.CGFloat height = v45;
    CGRectGetMinY(v153);
    v154.origin.CGFloat x = v42;
    v154.origin.CGFloat y = v43;
    v154.size.CGFloat width = v44;
    v154.size.CGFloat height = v45;
    CGRectGetWidth(v154);
    [(MRUNowPlayingLabelView *)self bounds];
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    -[MPRouteLabel setFrame:](self->_routeLabel, "setFrame:");
  }
  if (self->_disablesLabelsLayoutAnimation)
  {
    v124[0] = MEMORY[0x1E4F143A8];
    v124[1] = 3221225472;
    v124[2] = __40__MRUNowPlayingLabelView_layoutSubviews__block_invoke;
    v124[3] = &unk_1E5F0D7F8;
    v124[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v124];
  }
}

uint64_t __40__MRUNowPlayingLabelView_layoutSubviews__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 560) layoutIfNeeded];
  [*(id *)(*(void *)(a1 + 32) + 568) layoutIfNeeded];
  v2 = *(void **)(*(void *)(a1 + 32) + 576);

  return [v2 layoutIfNeeded];
}

- (CGSize)intrinsicContentSize
{
  -[MPRouteLabel sizeThatFits:](self->_routeLabel, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  double v4 = v3;
  -[MRUNowPlayingLabelView sizeForTextInLabel:availableSize:](self, "sizeForTextInLabel:availableSize:", self->_placeholderMarqueeView, 1.79769313e308, 1.79769313e308);
  double v6 = v5;
  -[MRUNowPlayingLabelView sizeForTextInLabel:availableSize:](self, "sizeForTextInLabel:availableSize:", self->_titleMarqueeView, 1.79769313e308, 1.79769313e308);
  double v8 = v7;
  -[MRUNowPlayingLabelView sizeForTextInLabel:availableSize:](self, "sizeForTextInLabel:availableSize:", self->_subtitleMarqueeView, 1.79769313e308, 1.79769313e308);
  double v10 = fmax(fmax(fmax(v8, v9), v4), v6);

  -[MRUNowPlayingLabelView sizeThatFits:](self, "sizeThatFits:", v10, 1.79769313e308);
  result.CGFloat height = v12;
  result.CGFloat width = v11;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  if (self->_layout)
  {
    double v5 = [(MPRouteLabel *)self->_routeLabel titleLabel];
    double v6 = [v5 font];
    [v6 lineHeight];

    [(MRUNowPlayingLabelView *)self heightForTextInLabel:self->_titleMarqueeView];
  }
  else
  {
    -[MRUNowPlayingLabelView heightForTextInLabel:](self, "heightForTextInLabel:", self->_titleMarqueeView, a3.width, a3.height);
  }
  [(MRUNowPlayingLabelView *)self heightForTextInLabel:self->_subtitleMarqueeView];
  UICeilToViewScale();
  double v8 = v7;
  double v9 = width;
  result.CGFloat height = v8;
  result.CGFloat width = v9;
  return result;
}

- (CGSize)sizeForTextInLabel:(id)a3 availableSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  objc_msgSend(v7, "sizeThatFits:", width, height);
  if (v8 >= width) {
    double v9 = width;
  }
  else {
    double v9 = v8;
  }
  if (self->_layout >= 2uLL) {
    double v10 = v8;
  }
  else {
    double v10 = v9;
  }
  [(MRUNowPlayingLabelView *)self heightForTextInLabel:v7];
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (double)heightForTextInLabel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 text];
  if (v5
    && (double v6 = (void *)v5,
        [v4 text],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isEqualToString:&stru_1F06524E0],
        v7,
        v6,
        !v8))
  {
    double v12 = [v4 font];
    [(UILabel *)self->_heightSizingLabel setFont:v12];

    double v13 = [v4 text];
    [(UILabel *)self->_heightSizingLabel setText:v13];

    -[UILabel sizeThatFits:](self->_heightSizingLabel, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    double v11 = v14;
  }
  else
  {
    double v9 = [v4 font];
    [v9 lineHeight];
    UICeilToViewScale();
    double v11 = v10;
  }
  return v11;
}

- (double)intrinsicHeightForTextInLabel:(id)a3
{
  objc_msgSend(a3, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  return v3;
}

- (BOOL)isLabelOversized:(id)a3
{
  id v4 = a3;
  [(MRUNowPlayingLabelView *)self heightForTextInLabel:v4];
  double v6 = v5;
  [(MRUNowPlayingLabelView *)self intrinsicHeightForTextInLabel:v4];
  double v8 = v7;

  return v6 > v8;
}

- (id)viewForFirstBaselineLayout
{
  if (self->_layout)
  {
    if (self->_showRoute)
    {
      v2 = [(MPRouteLabel *)self->_routeLabel titleLabel];
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (!self->_showPlaceholder)
  {
LABEL_6:
    uint64_t v3 = 560;
    goto LABEL_7;
  }
  uint64_t v3 = 576;
LABEL_7:
  v2 = [*(id *)((char *)&self->super.super.super.super.isa + v3) viewForFirstBaselineLayout];
LABEL_8:

  return v2;
}

- (void)setRoute:(id)a3
{
  objc_storeStrong((id *)&self->_route, a3);
  id v5 = a3;
  [(MPRouteLabel *)self->_routeLabel setRoute:v5];

  [(MRUNowPlayingLabelView *)self invalidateIntrinsicContentSize];

  [(MRUNowPlayingLabelView *)self setNeedsLayout];
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = (NSString *)[v4 copy];
  title = self->_title;
  self->_title = v5;

  [(MRUMarqueeLabel *)self->_titleMarqueeView setText:v4];
  [(MRUNowPlayingLabelView *)self updateFonts];
  [(MRUNowPlayingLabelView *)self invalidateIntrinsicContentSize];

  [(MRUNowPlayingLabelView *)self setNeedsLayout];
}

- (void)setSubtitle:(id)a3
{
  id v4 = a3;
  id v5 = (NSString *)[v4 copy];
  subtitle = self->_subtitle;
  self->_subtitle = v5;

  [(MRUMarqueeLabel *)self->_subtitleMarqueeView setText:v4];
  [(MRUNowPlayingLabelView *)self updateFonts];
  [(MRUNowPlayingLabelView *)self invalidateIntrinsicContentSize];

  [(MRUNowPlayingLabelView *)self setNeedsLayout];
}

- (void)setPlaceholder:(id)a3
{
  id v4 = a3;
  id v5 = (NSString *)[v4 copy];
  placeholder = self->_placeholder;
  self->_placeholder = v5;

  [(MRUMarqueeLabel *)self->_placeholderMarqueeView setText:v4];
  [(MRUNowPlayingLabelView *)self invalidateIntrinsicContentSize];

  [(MRUNowPlayingLabelView *)self setNeedsLayout];
}

- (void)setDeviceImage:(id)a3
{
  objc_storeStrong((id *)&self->_deviceImage, a3);
  id v5 = a3;
  [(UIImageView *)self->_deviceImageView setImage:v5];

  [(MRUNowPlayingLabelView *)self setNeedsLayout];
}

- (void)setShowRoute:(BOOL)a3
{
  if (self->_showRoute != a3)
  {
    self->_showRoute = a3;
    [(MRUNowPlayingLabelView *)self updateVisibility];
    [(MRUNowPlayingLabelView *)self setNeedsLayout];
  }
}

- (void)setShowSubtitle:(BOOL)a3
{
  if (self->_showSubtitle != a3)
  {
    self->_showSubtitle = a3;
    [(MRUNowPlayingLabelView *)self updateVisibility];
    [(MRUNowPlayingLabelView *)self setNeedsLayout];
  }
}

- (void)setShowPlaceholder:(BOOL)a3
{
  if (self->_showPlaceholder != a3)
  {
    self->_showPlaceholder = a3;
    [(MRUNowPlayingLabelView *)self updateVisualStyling];
    [(MRUNowPlayingLabelView *)self updateVisibility];
    [(MRUNowPlayingLabelView *)self setNeedsLayout];
  }
}

- (void)setShowDevice:(BOOL)a3
{
  if (self->_showDevice != a3)
  {
    self->_showDevice = a3;
    [(MRUNowPlayingLabelView *)self updateVisibility];
    [(MRUNowPlayingLabelView *)self setNeedsLayout];
  }
}

- (void)setMarqueeEnabled:(BOOL)a3
{
  if (self->_marqueeEnabled != a3)
  {
    self->_marqueeEnabled = a3;
    [(MRUNowPlayingLabelView *)self updateMarquee];
  }
}

- (void)setTextAlignment:(int64_t)a3
{
  if (self->_textAlignment != a3)
  {
    self->_textAlignment = a3;
    -[MPRouteLabel setTextAlignment:](self->_routeLabel, "setTextAlignment:");
    [(MRUMarqueeLabel *)self->_titleMarqueeView setTextAlignment:a3];
    [(MRUMarqueeLabel *)self->_subtitleMarqueeView setTextAlignment:a3];
    [(MRUNowPlayingLabelView *)self updatePlaceholderTextAlignment];
    [(MRUNowPlayingLabelView *)self setNeedsLayout];
  }
}

- (void)setLayout:(int64_t)a3
{
  if (self->_layout != a3)
  {
    self->_int64_t layout = a3;
    [(MRUNowPlayingLabelView *)self updateContentSizeCategory];
    [(MRUNowPlayingLabelView *)self updateMarquee];
    [(MRUNowPlayingLabelView *)self updateVisualStyling];
    [(MRUNowPlayingLabelView *)self updateVisibility];
    [(MRUNowPlayingLabelView *)self updatePlaceholderTextAlignment];
    [(MRUNowPlayingLabelView *)self setNeedsLayout];
  }
}

- (void)setMarqueeFadeEdgeInsets:(UIEdgeInsets)a3
{
  self->_marqueeFadeEdgeInsets = a3;
  double v4 = fabs(a3.left);
  double v5 = fabs(a3.right);
  -[MRUMarqueeLabel setFadeEdgeInsets:](self->_titleMarqueeView, "setFadeEdgeInsets:", 0.0, v4, 0.0, v5);
  -[MRUMarqueeLabel setFadeEdgeInsets:](self->_subtitleMarqueeView, "setFadeEdgeInsets:", 0.0, v4, 0.0, v5);
  placeholderMarqueeView = self->_placeholderMarqueeView;

  -[MRUMarqueeLabel setFadeEdgeInsets:](placeholderMarqueeView, "setFadeEdgeInsets:", 0.0, v4, 0.0, v5);
}

- (void)setMarqueeContentGap:(double)a3
{
  self->_marqueeContentGap = a3;
  -[MRUMarqueeLabel setContentGap:](self->_titleMarqueeView, "setContentGap:");
  [(MRUMarqueeLabel *)self->_subtitleMarqueeView setContentGap:a3];
  placeholderMarqueeView = self->_placeholderMarqueeView;

  [(MRUMarqueeLabel *)placeholderMarqueeView setContentGap:a3];
}

- (void)setStylingProvider:(id)a3
{
  double v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  if (stylingProvider != v5)
  {
    double v7 = v5;
    [(MRUVisualStylingProvider *)stylingProvider removeObserver:self];
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    [(MRUVisualStylingProvider *)self->_stylingProvider addObserver:self];
    [(MRUNowPlayingLabelView *)self updateVisualStyling];
    double v5 = v7;
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MRUNowPlayingLabelView;
  -[MRUNowPlayingLabelView setHighlighted:](&v7, sel_setHighlighted_);
  if (self->_adjustsLabelsWhenHighlighted)
  {
    if (v3)
    {
      double v5 = [(MRUNowPlayingLabelView *)self contentView];
      [v5 setAlpha:0.2];
    }
    else
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __41__MRUNowPlayingLabelView_setHighlighted___block_invoke;
      v6[3] = &unk_1E5F0D7F8;
      v6[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v6 animations:0.25];
    }
  }
}

void __41__MRUNowPlayingLabelView_setHighlighted___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) contentView];
  [v1 setAlpha:1.0];
}

- (double)estimatedHeight
{
  BOOL v3 = [(MRUMarqueeLabel *)self->_titleMarqueeView font];
  [v3 lineHeight];

  double v4 = [(MRUMarqueeLabel *)self->_subtitleMarqueeView font];
  [v4 lineHeight];

  if (self->_layout)
  {
    double v5 = [(MPRouteLabel *)self->_routeLabel titleLabel];
    double v6 = [v5 font];
    [v6 lineHeight];
  }

  UICeilToViewScale();
  return result;
}

- (void)setContentScale:(double)a3
{
  if (vabdd_f64(self->_contentScale, a3) > 2.22044605e-16)
  {
    self->_contentScale = a3;
    [(MRUNowPlayingLabelView *)self updateContentSizeCategory];
  }
}

- (BOOL)acuis_wantsPriorityOverTargetOfGestureRecognizer:(id)a3
{
  return 1;
}

- (BOOL)_increaseContrast
{
  if (UIAccessibilityDarkerSystemColorsEnabled()) {
    return 1;
  }

  return UIAccessibilityIsReduceTransparencyEnabled();
}

- (void)updateVisualStyling
{
  stylingProvider = self->_stylingProvider;
  if (self->_layout == 3)
  {
    if (self->_showPlaceholder)
    {
      if ([(MRUNowPlayingLabelView *)self _increaseContrast]) {
        uint64_t v4 = 1;
      }
      else {
        uint64_t v4 = 2;
      }
    }
    else
    {
      uint64_t v4 = 1;
    }
    double v8 = [(MPRouteLabel *)self->_routeLabel contentView];
    [(MRUVisualStylingProvider *)stylingProvider applyStyle:v4 toView:v8];

    uint64_t v5 = 2;
  }
  else
  {
    uint64_t v5 = 1;
    if ([(MRUNowPlayingLabelView *)self _increaseContrast]) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = 2;
    }
    objc_super v7 = [(MPRouteLabel *)self->_routeLabel contentView];
    [(MRUVisualStylingProvider *)stylingProvider applyStyle:v6 toView:v7];

    [(MRUVisualStylingProvider *)self->_stylingProvider applyStyle:2 toView:self->_deviceImageView];
  }
  [(MRUVisualStylingProvider *)self->_stylingProvider applyStyle:0 toView:self->_titleMarqueeView];
  [(MRUVisualStylingProvider *)self->_stylingProvider applyStyle:v5 toView:self->_subtitleMarqueeView];
  double v9 = self->_stylingProvider;
  placeholderMarqueeView = self->_placeholderMarqueeView;

  [(MRUVisualStylingProvider *)v9 applyStyle:1 toView:placeholderMarqueeView];
}

- (void)updateContentSizeCategory
{
  switch(self->_layout)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E4FB08E0], "mru_routeFont");
      BOOL v3 = (UIFont *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E4FB08E0], "mru_smallTitleFont");
      uint64_t v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E4FB08E0], "mru_smallSubtitleFont");
      uint64_t v5 = (UIFont *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E4FB08E0], "mru_smallTitleFont");
      uint64_t v6 = (UIFont *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 1:
      double v8 = objc_msgSend(MEMORY[0x1E4FB08E0], "mru_titleFont");
      objc_msgSend(MEMORY[0x1E4FB08E0], "mru_subtitleFont");
      BOOL v3 = (UIFont *)(id)objc_claimAutoreleasedReturnValue();
      uint64_t v6 = v8;
      uint64_t v4 = v6;
      uint64_t v5 = v3;
      goto LABEL_8;
    case 2:
      objc_msgSend(MEMORY[0x1E4FB08E0], "mru_expandedRouteFont");
      BOOL v3 = (UIFont *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E4FB08E0], "mru_expandedTitleFont");
      uint64_t v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E4FB08E0], "mru_expandedSubtitleFont");
      uint64_t v5 = (UIFont *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E4FB08E0], "mru_expandedTitleFont");
      uint64_t v6 = (UIFont *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3:
      objc_super v7 = objc_msgSend(MEMORY[0x1E4FB08E0], "mru_ambientTitleFont");
      objc_msgSend(MEMORY[0x1E4FB08E0], "mru_ambientSubtitleFont");
      uint64_t v5 = (UIFont *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E4FB08E0], "mru_titleFont");
      BOOL v3 = (UIFont *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 4:
      double v10 = objc_msgSend(MEMORY[0x1E4FB08E0], "mru_controlCenterMediumTitleFontWithScale:", self->_contentScale);
      uint64_t v11 = objc_msgSend(MEMORY[0x1E4FB08E0], "mru_controlCenterMediumSubtitleFontWithScale:", self->_contentScale);
      goto LABEL_11;
    case 5:
      double v10 = objc_msgSend(MEMORY[0x1E4FB08E0], "mru_controlCenterLargeTitleFontWithScale:", self->_contentScale);
      uint64_t v11 = objc_msgSend(MEMORY[0x1E4FB08E0], "mru_controlCenterLargeSubtitleFontWithScale:", self->_contentScale);
LABEL_11:
      double v12 = (void *)v11;
      uint64_t v4 = v10;
      BOOL v3 = v12;
      uint64_t v5 = v3;
      double v9 = v4;
      break;
    default:
      objc_msgSend(MEMORY[0x1E4FB08E0], "mru_routeFont");
      BOOL v3 = (UIFont *)objc_claimAutoreleasedReturnValue();
      objc_super v7 = objc_msgSend(MEMORY[0x1E4FB08E0], "mru_titleFont");
      objc_msgSend(MEMORY[0x1E4FB08E0], "mru_subtitleFont");
      uint64_t v5 = (UIFont *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      uint64_t v6 = v7;
      uint64_t v4 = v6;
LABEL_8:
      double v9 = v6;
      break;
  }
  routeFont = self->_routeFont;
  self->_routeFont = v3;
  double v19 = v3;

  titleFont = self->_titleFont;
  self->_titleFont = v4;
  double v15 = v4;

  placeholderFont = self->_placeholderFont;
  self->_placeholderFont = v9;
  double v17 = v9;

  subtitleFont = self->_subtitleFont;
  self->_subtitleFont = v5;

  [(MRUNowPlayingLabelView *)self updateFonts];
}

- (void)updateFonts
{
  [(MPRouteLabel *)self->_routeLabel setFont:self->_routeFont];
  BOOL v3 = [MEMORY[0x1E4FB1830] configurationWithFont:self->_routeFont scale:1];
  [(UIImageView *)self->_deviceImageView setSymbolConfiguration:v3];

  [(MRUMarqueeLabel *)self->_placeholderMarqueeView setFont:self->_placeholderFont];
  if ([(MRUNowPlayingLabelView *)self isLabelOversized:self->_titleMarqueeView]) {
    LOBYTE(v4) = 0;
  }
  else {
    int v4 = ![(MRUNowPlayingLabelView *)self isLabelOversized:self->_subtitleMarqueeView];
  }
  titleFont = self->_titleFont;
  if (self->_layout || (v4 & 1) != 0)
  {
    [(MRUMarqueeLabel *)self->_titleMarqueeView setFont:self->_titleFont];
    subtitleFont = self->_subtitleFont;
    subtitleMarqueeView = self->_subtitleMarqueeView;
    [(MRUMarqueeLabel *)subtitleMarqueeView setFont:subtitleFont];
  }
  else
  {
    [(UIFont *)self->_titleFont pointSize];
    objc_super v7 = [(UIFont *)titleFont fontWithSize:v6 * 0.9];
    [(MRUMarqueeLabel *)self->_titleMarqueeView setFont:v7];

    double v8 = self->_subtitleFont;
    [(UIFont *)v8 pointSize];
    id v12 = [(UIFont *)v8 fontWithSize:0.9 * v9];
    [(MRUMarqueeLabel *)self->_subtitleMarqueeView setFont:v12];
  }
}

- (void)updateMarquee
{
  if (self->_layout > 1uLL)
  {
    [(MRUMarqueeLabel *)self->_titleMarqueeView setMarqueeEnabled:self->_marqueeEnabled];
    [(MRUMarqueeLabel *)self->_subtitleMarqueeView setMarqueeEnabled:self->_marqueeEnabled];
    BOOL marqueeEnabled = self->_marqueeEnabled;
  }
  else
  {
    [(MRUMarqueeLabel *)self->_titleMarqueeView setMarqueeEnabled:0];
    [(MRUMarqueeLabel *)self->_subtitleMarqueeView setMarqueeEnabled:0];
    BOOL marqueeEnabled = 0;
  }
  placeholderMarqueeView = self->_placeholderMarqueeView;

  [(MRUMarqueeLabel *)placeholderMarqueeView setMarqueeEnabled:marqueeEnabled];
}

- (void)updateVisibility
{
  double v3 = 1.0;
  if (!self->_showRoute) {
    double v3 = 0.0;
  }
  [(MPRouteLabel *)self->_routeLabel setAlpha:v3];
  [(MRUMarqueeLabel *)self->_titleMarqueeView setHidden:self->_showPlaceholder];
  BOOL v4 = self->_showPlaceholder || !self->_showSubtitle;
  [(MRUMarqueeLabel *)self->_subtitleMarqueeView setHidden:v4];
  [(MRUMarqueeLabel *)self->_placeholderMarqueeView setHidden:!self->_showPlaceholder];
  BOOL v5 = !self->_showDevice;
  deviceImageView = self->_deviceImageView;

  [(UIImageView *)deviceImageView setHidden:v5];
}

- (void)updatePlaceholderTextAlignment
{
  if (self->_layout) {
    int64_t textAlignment = self->_textAlignment;
  }
  else {
    int64_t textAlignment = 1;
  }
  [(MRUMarqueeLabel *)self->_placeholderMarqueeView setTextAlignment:textAlignment];
}

- (MPAVRoute)route
{
  return self->_route;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (UIImage)deviceImage
{
  return self->_deviceImage;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (int64_t)layout
{
  return self->_layout;
}

- (UIEdgeInsets)marqueeFadeEdgeInsets
{
  double top = self->_marqueeFadeEdgeInsets.top;
  double left = self->_marqueeFadeEdgeInsets.left;
  double bottom = self->_marqueeFadeEdgeInsets.bottom;
  double right = self->_marqueeFadeEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)marqueeContentGap
{
  return self->_marqueeContentGap;
}

- (BOOL)showRoute
{
  return self->_showRoute;
}

- (BOOL)showSubtitle
{
  return self->_showSubtitle;
}

- (BOOL)showPlaceholder
{
  return self->_showPlaceholder;
}

- (BOOL)showDevice
{
  return self->_showDevice;
}

- (BOOL)isMarqueeEnabled
{
  return self->_marqueeEnabled;
}

- (BOOL)adjustsLabelsWhenHighlighted
{
  return self->_adjustsLabelsWhenHighlighted;
}

- (void)setAdjustsLabelsWhenHighlighted:(BOOL)a3
{
  self->_adjustsLabelsWhenHighlighted = a3;
}

- (BOOL)disablesLabelsLayoutAnimation
{
  return self->_disablesLabelsLayoutAnimation;
}

- (void)setDisablesLabelsLayoutAnimation:(BOOL)a3
{
  self->_disablesLabelsLayoutAnimation = a3;
}

- (double)contentScale
{
  return self->_contentScale;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (MPRouteLabel)routeLabel
{
  return self->_routeLabel;
}

- (void)setRouteLabel:(id)a3
{
}

- (MRUMarqueeLabel)titleMarqueeView
{
  return self->_titleMarqueeView;
}

- (void)setTitleMarqueeView:(id)a3
{
}

- (MRUMarqueeLabel)subtitleMarqueeView
{
  return self->_subtitleMarqueeView;
}

- (void)setSubtitleMarqueeView:(id)a3
{
}

- (MRUMarqueeLabel)placeholderMarqueeView
{
  return self->_placeholderMarqueeView;
}

- (void)setPlaceholderMarqueeView:(id)a3
{
}

- (UIImageView)deviceImageView
{
  return self->_deviceImageView;
}

- (void)setDeviceImageView:(id)a3
{
}

- (UILabel)heightSizingLabel
{
  return self->_heightSizingLabel;
}

- (void)setHeightSizingLabel:(id)a3
{
}

- (UIFont)routeFont
{
  return self->_routeFont;
}

- (void)setRouteFont:(id)a3
{
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (void)setTitleFont:(id)a3
{
}

- (UIFont)placeholderFont
{
  return self->_placeholderFont;
}

- (void)setPlaceholderFont:(id)a3
{
}

- (UIFont)subtitleFont
{
  return self->_subtitleFont;
}

- (void)setSubtitleFont:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleFont, 0);
  objc_storeStrong((id *)&self->_placeholderFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_routeFont, 0);
  objc_storeStrong((id *)&self->_heightSizingLabel, 0);
  objc_storeStrong((id *)&self->_deviceImageView, 0);
  objc_storeStrong((id *)&self->_placeholderMarqueeView, 0);
  objc_storeStrong((id *)&self->_subtitleMarqueeView, 0);
  objc_storeStrong((id *)&self->_titleMarqueeView, 0);
  objc_storeStrong((id *)&self->_routeLabel, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_deviceImage, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_route, 0);
}

@end