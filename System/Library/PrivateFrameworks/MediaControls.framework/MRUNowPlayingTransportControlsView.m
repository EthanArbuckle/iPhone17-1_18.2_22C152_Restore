@interface MRUNowPlayingTransportControlsView
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isDimmed;
- (BOOL)showRoutingButton;
- (BOOL)showTVRemoteButton;
- (BOOL)useColorFilter;
- (CGSize)sizeThatFits:(CGSize)result;
- (MRUNowPlayingTransportControlsView)initWithFrame:(CGRect)a3;
- (MRUNowPlayingTransportControlsViewDelegate)delegate;
- (MRUTransportButton)centerButton;
- (MRUTransportButton)leadingButton;
- (MRUTransportButton)leftButton;
- (MRUTransportButton)rightButton;
- (MRUTransportButton)routingButton;
- (MRUTransportControls)transportControls;
- (MRUVisualStylingProvider)stylingProvider;
- (double)contentScale;
- (int64_t)layout;
- (void)configureLeadingButton;
- (void)didSelectRoutingButton:(id)a3;
- (void)layoutSubviews;
- (void)setCenterButton:(id)a3;
- (void)setContentScale:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDimmed:(BOOL)a3;
- (void)setLayout:(int64_t)a3;
- (void)setLeadingButton:(id)a3;
- (void)setLeftButton:(id)a3;
- (void)setRightButton:(id)a3;
- (void)setShowRoutingButton:(BOOL)a3;
- (void)setShowTVRemoteButton:(BOOL)a3;
- (void)setStylingProvider:(id)a3;
- (void)setTransportControls:(id)a3;
- (void)setUseColorFilter:(BOOL)a3;
- (void)updateImageConfiguration;
- (void)updateVisibility;
@end

@implementation MRUNowPlayingTransportControlsView

- (MRUNowPlayingTransportControlsView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)MRUNowPlayingTransportControlsView;
  v3 = -[MRUNowPlayingTransportControlsView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = +[MPButton easyTouchButtonWithType:0];
    leadingButton = v3->_leadingButton;
    v3->_leadingButton = (MRUTransportButton *)v4;

    [(MRUNowPlayingTransportControlsView *)v3 addSubview:v3->_leadingButton];
    uint64_t v6 = +[MPButton easyTouchButtonWithType:0];
    leftButton = v3->_leftButton;
    v3->_leftButton = (MRUTransportButton *)v6;

    [(MRUNowPlayingTransportControlsView *)v3 addSubview:v3->_leftButton];
    uint64_t v8 = +[MPButton easyTouchButtonWithType:0];
    centerButton = v3->_centerButton;
    v3->_centerButton = (MRUTransportButton *)v8;

    [(MRUNowPlayingTransportControlsView *)v3 addSubview:v3->_centerButton];
    uint64_t v10 = +[MPButton easyTouchButtonWithType:0];
    rightButton = v3->_rightButton;
    v3->_rightButton = (MRUTransportButton *)v10;

    [(MRUNowPlayingTransportControlsView *)v3 addSubview:v3->_rightButton];
    v12 = objc_alloc_init(MRUTransportButton);
    routingButton = v3->_routingButton;
    v3->_routingButton = v12;

    [(MRUTransportButton *)v3->_routingButton addTarget:v3 action:sel_didSelectRoutingButton_ forControlEvents:64];
    [(MRUNowPlayingTransportControlsView *)v3 addSubview:v3->_routingButton];
    v3->_contentScale = 1.0;
    [(MRUNowPlayingTransportControlsView *)v3 updateImageConfiguration];
    [(MRUNowPlayingTransportControlsView *)v3 updateVisibility];
  }
  return v3;
}

- (void)layoutSubviews
{
  v93.receiver = self;
  v93.super_class = (Class)MRUNowPlayingTransportControlsView;
  [(MRUNowPlayingTransportControlsView *)&v93 layoutSubviews];
  [(MRUNowPlayingTransportControlsView *)self bounds];
  double height = v94.size.height;
  double x = v94.origin.x;
  double y = v94.origin.y;
  double width = v94.size.width;
  double v7 = CGRectGetHeight(v94);
  switch(self->_layout)
  {
    case 1:
      v95.origin.double x = x;
      v95.origin.double y = y;
      v95.size.double width = width;
      v95.size.double height = height;
      CGRectGetMinX(v95);
      UIRectCenteredYInRect();
      -[MRUTransportButton setFrame:](self->_leadingButton, "setFrame:");
      v96.origin.double x = x;
      v96.origin.double y = y;
      v96.size.double width = width;
      v96.size.double height = height;
      CGRectGetMaxX(v96);
      UIRectCenteredYInRect();
      -[MRUTransportButton setFrame:](self->_routingButton, "setFrame:");
      UIRectInset();
      CGFloat v8 = v97.origin.x;
      CGFloat rectb = v97.origin.y;
      CGFloat v9 = v97.size.width;
      CGFloat v10 = v97.size.height;
      CGRectGetMinX(v97);
      UIRectCenteredYInRect();
      -[MRUTransportButton setFrame:](self->_leftButton, "setFrame:");
      UIRectCenteredRect();
      UIRectCenteredRect();
      -[MRUTransportButton setFrame:](self->_centerButton, "setFrame:");
      v98.origin.double x = v8;
      v98.origin.double y = rectb;
      v98.size.double width = v9;
      v98.size.double height = v10;
      CGRectGetMaxX(v98);
      UIRectCenteredYInRect();
      uint64_t v11 = 488;
      goto LABEL_17;
    case 4:
      v108.origin.double x = x;
      v108.origin.double y = y;
      v108.size.double width = width;
      v108.size.double height = height;
      CGRectGetMinX(v108);
      UIRectCenteredYInRect();
      -[MRUTransportButton setFrame:](self->_leadingButton, "setFrame:");
      v109.origin.double x = x;
      v109.origin.double y = y;
      v109.size.double width = width;
      v109.size.double height = height;
      CGRectGetMinX(v109);
      UIRectCenteredYInRect();
      -[MRUTransportButton setFrame:](self->_leftButton, "setFrame:");
      v110.origin.double x = x;
      v110.origin.double y = y;
      v110.size.double width = width;
      v110.size.double height = height;
      CGRectGetMinX(v110);
      UIRectCenteredYInRect();
      -[MRUTransportButton setFrame:](self->_centerButton, "setFrame:");
      v111.origin.double x = x;
      v111.origin.double y = y;
      v111.size.double width = width;
      v111.size.double height = height;
      CGRectGetMaxX(v111);
      UIRectCenteredYInRect();
      -[MRUTransportButton setFrame:](self->_rightButton, "setFrame:");
      v112.origin.double x = x;
      v112.origin.double y = y;
      v112.size.double width = width;
      v112.size.double height = height;
      CGRectGetMaxX(v112);
      goto LABEL_16;
    case 5:
      CGFloat v33 = x + 7.0;
      CGFloat v34 = y + 0.0;
      CGFloat v35 = width - (7.0 + 7.0);
      CGFloat v36 = height - (0.0 + 0.0);
      v113.origin.double x = v33;
      v113.origin.double y = v34;
      v113.size.double width = v35;
      v113.size.double height = v36;
      CGRectGetMinX(v113);
      UIRectCenteredYInRect();
      -[MRUTransportButton setFrame:](self->_leadingButton, "setFrame:");
      v114.origin.double x = v33;
      v114.origin.double y = v34;
      v114.size.double width = v35;
      v114.size.double height = v36;
      CGRectGetMinX(v114);
      UIRectCenteredYInRect();
      -[MRUTransportButton setFrame:](self->_leftButton, "setFrame:");
      UIRectCenteredRect();
      UIRectCenteredRect();
      -[MRUTransportButton setFrame:](self->_centerButton, "setFrame:");
      v115.origin.double x = v33;
      v115.origin.double y = v34;
      v115.size.double width = v35;
      v115.size.double height = v36;
      CGRectGetMaxX(v115);
      UIRectCenteredYInRect();
      -[MRUTransportButton setFrame:](self->_rightButton, "setFrame:");
      v116.origin.double x = v33;
      v116.origin.double y = v34;
      v116.size.double width = v35;
      v116.size.double height = v36;
      CGRectGetMaxX(v116);
      goto LABEL_16;
    case 6:
      v117.origin.double x = x;
      v117.origin.double y = y;
      v117.size.double width = width;
      v117.size.double height = height;
      CGRectGetMinX(v117);
      CGFloat v91 = x;
      UIRectCenteredYInRect();
      -[MRUTransportButton setFrame:](self->_leadingButton, "setFrame:");
      UIRectCenteredRect();
      CGFloat v38 = v37;
      CGFloat rect = v37;
      CGFloat v40 = v39;
      CGFloat v85 = v41;
      CGFloat v86 = v39;
      CGFloat v42 = v41;
      CGFloat v44 = v43;
      CGFloat v83 = v43;
      -[MRUTransportButton setFrame:](self->_centerButton, "setFrame:");
      v118.origin.double x = v38;
      v118.origin.double y = v40;
      v118.size.double width = v42;
      v118.size.double height = v44;
      CGRectGetMinX(v118);
      UIRectCenteredYInRect();
      double v45 = v119.origin.y;
      double v46 = v119.size.width;
      double v47 = v119.size.height;
      CGFloat MinX = CGRectGetMinX(v119);
      v120.size.double width = width;
      CGFloat v49 = height;
      double v50 = MinX;
      v120.origin.double x = v91;
      v120.origin.double y = y;
      CGFloat v51 = y;
      CGFloat v52 = v120.size.width;
      v120.size.double height = v49;
      double v53 = CGRectGetMinX(v120);
      if (v50 >= v53) {
        double v53 = v50;
      }
      -[MRUTransportButton setFrame:](self->_leftButton, "setFrame:", v53, v45, v46, v47, 0x4038000000000000);
      v121.origin.double x = rect;
      v121.size.double width = v85;
      v121.origin.double y = v86;
      v121.size.double height = v83;
      CGRectGetMaxX(v121);
      UIRectCenteredYInRect();
      double recta = v122.origin.y;
      double v54 = v122.size.width;
      double v55 = v122.size.height;
      double v56 = CGRectGetMinX(v122);
      v123.origin.double x = v91;
      v123.origin.double y = v51;
      v123.size.double width = v52;
      v123.size.double height = v49;
      double v57 = CGRectGetMaxX(v123) - v7;
      if (v56 < v57) {
        double v57 = v56;
      }
      -[MRUTransportButton setFrame:](self->_rightButton, "setFrame:", v57, recta, v54, v55);
      v124.origin.double x = v91;
      v124.origin.double y = v51;
      v124.size.double width = v52;
      v124.size.double height = v49;
      CGRectGetMaxX(v124);
      goto LABEL_16;
    case 8:
      UIRectCenteredRect();
      CGFloat v59 = v58;
      CGFloat v61 = v60;
      CGFloat v82 = v60;
      CGFloat v84 = v62;
      CGFloat v63 = v62;
      CGFloat v65 = v64;
      CGFloat rectc = v64;
      -[MRUTransportButton setFrame:](self->_centerButton, "setFrame:");
      v125.origin.double x = v59;
      v125.origin.double y = v61;
      v125.size.double width = v63;
      v125.size.double height = v65;
      CGRectGetMinX(v125);
      UIRectCenteredYInRect();
      -[MRUTransportButton setFrame:](self->_leadingButton, "setFrame:");
      v126.origin.double x = v59;
      v126.origin.double y = v82;
      v126.size.double width = v84;
      v126.size.double height = rectc;
      CGRectGetMinX(v126);
      UIRectCenteredYInRect();
      -[MRUTransportButton setFrame:](self->_leftButton, "setFrame:");
      v127.origin.double x = v59;
      v127.origin.double y = v82;
      v127.size.double width = v84;
      v127.size.double height = rectc;
      CGRectGetMaxX(v127);
      UIRectCenteredYInRect();
      -[MRUTransportButton setFrame:](self->_rightButton, "setFrame:");
      v128.origin.double x = v59;
      v128.origin.double y = v82;
      v128.size.double width = v84;
      v128.size.double height = rectc;
      CGRectGetMinX(v128);
      goto LABEL_16;
    default:
      CGFloat v92 = height;
      if (self->_showRoutingButton
        || ([(MRUTransportButton *)self->_leadingButton transportControlItem],
            v12 = objc_claimAutoreleasedReturnValue(),
            v12,
            v12))
      {
        v99.origin.double x = x;
        v99.origin.double y = y;
        v99.size.double width = width;
        v99.size.double height = height;
        CGRectGetWidth(v99);
        UIRoundToViewScale();
        v100.origin.double x = x;
        v100.origin.double y = y;
        v100.size.double width = width;
        v100.size.double height = height;
        CGRectGetMinX(v100);
        v101.origin.double x = x;
        v101.origin.double y = y;
        v101.size.double width = width;
        v101.size.double height = height;
        CGRectGetMinY(v101);
        UIRectCenteredYInRect();
        CGFloat v14 = v13;
        CGFloat v16 = v15;
        CGFloat v18 = v17;
        CGFloat v20 = v19;
        -[MRUTransportButton setFrame:](self->_leadingButton, "setFrame:");
        v102.origin.double x = v14;
        v102.origin.double y = v16;
        v102.size.double width = v18;
        v102.size.double height = v20;
        CGRectGetMaxX(v102);
        v103.origin.double x = x;
        v103.origin.double y = y;
        v103.size.double width = width;
        v103.size.double height = v92;
        CGRectGetMinY(v103);
        UIRectCenteredYInRect();
        -[MRUTransportButton setFrame:](self->_leftButton, "setFrame:");
        v104.origin.double x = x;
        v104.origin.double y = y;
        v104.size.double width = width;
        v104.size.double height = v92;
        CGRectGetMinY(v104);
        UIRectCenteredRect();
        uint64_t v22 = v21;
        uint64_t v24 = v23;
        uint64_t v26 = v25;
        uint64_t v28 = v27;
        -[MRUTransportButton setFrame:](self->_centerButton, "setFrame:");
        uint64_t v29 = v22;
        uint64_t v30 = v24;
        uint64_t v31 = v26;
        uint64_t v32 = v28;
      }
      else
      {
        v131.origin.double x = x;
        v131.origin.double y = y;
        v131.size.double width = width;
        v131.size.double height = height;
        CGRectGetWidth(v131);
        UIRoundToViewScale();
        v132.origin.double x = x;
        v132.origin.double y = y;
        v132.size.double width = width;
        v132.size.double height = height;
        CGRectGetMinX(v132);
        v133.origin.double x = x;
        v133.origin.double y = y;
        v133.size.double width = width;
        v133.size.double height = height;
        CGRectGetMinY(v133);
        UIRectCenteredYInRect();
        -[MRUTransportButton setFrame:](self->_leadingButton, "setFrame:");
        v134.origin.double x = x;
        v134.origin.double y = y;
        v134.size.double width = width;
        v134.size.double height = height;
        CGRectGetMinX(v134);
        v135.origin.double x = x;
        v135.origin.double y = y;
        v135.size.double width = width;
        v135.size.double height = height;
        CGRectGetMinY(v135);
        UIRectCenteredYInRect();
        -[MRUTransportButton setFrame:](self->_leftButton, "setFrame:");
        UIRectCenteredRect();
        UIRectCenteredRect();
        uint64_t v75 = v74;
        uint64_t v77 = v76;
        uint64_t v79 = v78;
        uint64_t v81 = v80;
        -[MRUTransportButton setFrame:](self->_centerButton, "setFrame:");
        uint64_t v29 = v75;
        uint64_t v30 = v77;
        uint64_t v31 = v79;
        uint64_t v32 = v81;
      }
      CGRectGetMaxX(*(CGRect *)&v29);
      v105.origin.double x = x;
      v105.origin.double y = y;
      v105.size.double width = width;
      v105.size.double height = v92;
      CGRectGetMinY(v105);
      UIRectCenteredYInRect();
      -[MRUTransportButton setFrame:](self->_rightButton, "setFrame:");
      v106.origin.double x = x;
      v106.origin.double y = y;
      v106.size.double width = width;
      v106.size.double height = v92;
      CGRectGetMaxX(v106);
      v107.origin.double x = x;
      v107.origin.double y = y;
      v107.size.double width = width;
      v107.size.double height = v92;
      CGRectGetMinY(v107);
LABEL_16:
      UIRectCenteredYInRect();
      uint64_t v11 = 440;
LABEL_17:
      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v11), "setFrame:");
      [(MRUTransportButton *)self->_centerButton frame];
      CGRectGetMaxX(v129);
      [(MRUTransportButton *)self->_rightButton frame];
      CGRectGetMinX(v130);
      UIEdgeInsetsMakeWithEdges();
      double v67 = v66;
      double v69 = v68;
      double v71 = v70;
      double v73 = v72;
      -[MPButton setHitRectInsets:](self->_leadingButton, "setHitRectInsets:");
      -[MPButton setHitRectInsets:](self->_leftButton, "setHitRectInsets:", v67, v69, v71, v73);
      -[MPButton setHitRectInsets:](self->_centerButton, "setHitRectInsets:", v67, v69, v71, v73);
      -[MPButton setHitRectInsets:](self->_rightButton, "setHitRectInsets:", v67, v69, v71, v73);
      -[MPButton setHitRectInsets:](self->_routingButton, "setHitRectInsets:", v67, v69, v71, v73);
      [(MRUNowPlayingTransportControlsView *)self updateImageConfiguration];
      return;
  }
}

- (CGSize)sizeThatFits:(CGSize)result
{
  int64_t layout = self->_layout;
  if ((unint64_t)(layout - 5) >= 2)
  {
    if (layout == 4)
    {
      double v4 = 40.0;
      result.double width = 80.0;
    }
    else
    {
      double v4 = 44.0;
    }
  }
  else
  {
    double v4 = 26.0;
  }
  result.double height = v4;
  return result;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MRUNowPlayingTransportControlsView;
    BOOL v5 = [(MRUNowPlayingTransportControlsView *)&v7 gestureRecognizerShouldBegin:v4];
  }

  return v5;
}

- (void)setTransportControls:(id)a3
{
  objc_storeStrong((id *)&self->_transportControls, a3);
  id v5 = a3;
  uint64_t v6 = [v5 leftItem];
  [(MRUTransportButton *)self->_leftButton setTransportControlItem:v6];

  objc_super v7 = [v5 centerItem];
  [(MRUTransportButton *)self->_centerButton setTransportControlItem:v7];

  CGFloat v8 = [v5 rightItem];
  [(MRUTransportButton *)self->_rightButton setTransportControlItem:v8];

  [(MRUNowPlayingTransportControlsView *)self configureLeadingButton];
  [(MRUNowPlayingTransportControlsView *)self updateImageConfiguration];

  [(MRUNowPlayingTransportControlsView *)self updateVisibility];
}

- (void)setLayout:(int64_t)a3
{
  if (self->_layout != a3)
  {
    self->_int64_t layout = a3;
    [(MRUNowPlayingTransportControlsView *)self updateImageConfiguration];
    [(MRUNowPlayingTransportControlsView *)self updateVisibility];
    [(MRUNowPlayingTransportControlsView *)self setNeedsLayout];
  }
}

- (void)setShowRoutingButton:(BOOL)a3
{
  if (self->_showRoutingButton != a3)
  {
    self->_showRoutingButton = a3;
    [(MRUNowPlayingTransportControlsView *)self updateVisibility];
    [(MRUNowPlayingTransportControlsView *)self setNeedsLayout];
  }
}

- (void)setShowTVRemoteButton:(BOOL)a3
{
  if (self->_showTVRemoteButton != a3)
  {
    self->_showTVRemoteButton = a3;
    [(MRUNowPlayingTransportControlsView *)self configureLeadingButton];
    [(MRUNowPlayingTransportControlsView *)self updateVisibility];
    [(MRUNowPlayingTransportControlsView *)self setNeedsLayout];
  }
}

- (void)setStylingProvider:(id)a3
{
  id v5 = (MRUVisualStylingProvider *)a3;
  if (self->_stylingProvider != v5)
  {
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    [(MRUTransportButton *)self->_leadingButton setStylingProvider:v5];
    [(MRUTransportButton *)self->_leftButton setStylingProvider:v5];
    [(MRUTransportButton *)self->_centerButton setStylingProvider:v5];
    [(MRUTransportButton *)self->_rightButton setStylingProvider:v5];
    [(MRUTransportButton *)self->_routingButton setStylingProvider:v5];
  }
}

- (void)setDimmed:(BOOL)a3
{
  if (self->_dimmed != a3)
  {
    self->_BOOL dimmed = a3;
    -[MRUTransportButton setDimmed:](self->_leadingButton, "setDimmed:");
    [(MRUTransportButton *)self->_leftButton setDimmed:self->_dimmed];
    [(MRUTransportButton *)self->_centerButton setDimmed:self->_dimmed];
    [(MRUTransportButton *)self->_rightButton setDimmed:self->_dimmed];
    BOOL dimmed = self->_dimmed;
    routingButton = self->_routingButton;
    [(MRUTransportButton *)routingButton setDimmed:dimmed];
  }
}

- (void)setContentScale:(double)a3
{
  if (vabdd_f64(self->_contentScale, a3) > 2.22044605e-16)
  {
    self->_contentScale = a3;
    [(MRUNowPlayingTransportControlsView *)self updateImageConfiguration];
    [(MRUNowPlayingTransportControlsView *)self setNeedsLayout];
  }
}

- (BOOL)useColorFilter
{
  if ([(MRUTransportButton *)self->_leadingButton useColorFilter]
    || [(MRUTransportButton *)self->_leftButton useColorFilter]
    || [(MRUTransportButton *)self->_centerButton useColorFilter]
    || [(MRUTransportButton *)self->_rightButton useColorFilter])
  {
    return 1;
  }
  routingButton = self->_routingButton;

  return [(MRUTransportButton *)routingButton useColorFilter];
}

- (void)setUseColorFilter:(BOOL)a3
{
  BOOL v3 = a3;
  -[MRUTransportButton setUseColorFilter:](self->_leadingButton, "setUseColorFilter:");
  [(MRUTransportButton *)self->_leftButton setUseColorFilter:v3];
  [(MRUTransportButton *)self->_centerButton setUseColorFilter:v3];
  [(MRUTransportButton *)self->_rightButton setUseColorFilter:v3];
  routingButton = self->_routingButton;

  [(MRUTransportButton *)routingButton setUseColorFilter:v3];
}

- (void)didSelectRoutingButton:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained transportControlsView:self didSelectRoutingButton:v5];
}

- (void)updateImageConfiguration
{
  int64_t layout = self->_layout;
  if ((unint64_t)(layout - 5) < 2) {
    goto LABEL_4;
  }
  if (layout == 4)
  {
    id v14 = [MEMORY[0x1E4FB1830] configurationWithPointSize:5 weight:-1 scale:self->_contentScale * 17.0];
    id v4 = [MEMORY[0x1E4FB1830] configurationWithPointSize:5 weight:-1 scale:self->_contentScale * 20.0];
    id v5 = [MEMORY[0x1E4FB1830] configurationWithPointSize:5 weight:-1 scale:self->_contentScale * 28.0];
    uint64_t v6 = 0;
    double v7 = 0.7;
    CGFloat v9 = &MRUNowPlayingTransportCursorScaleSmall;
  }
  else
  {
    if (layout == 1)
    {
LABEL_4:
      id v14 = [MEMORY[0x1E4FB1830] configurationWithPointSize:5 weight:-1 scale:self->_contentScale * 13.0];
      id v4 = [MEMORY[0x1E4FB1830] configurationWithPointSize:5 weight:1 scale:self->_contentScale * 20.0];
      id v5 = [MEMORY[0x1E4FB1830] configurationWithPointSize:5 weight:3 scale:self->_contentScale * 22.0];
      uint64_t v6 = 0;
      double v7 = 0.7;
      double v8 = 0.75;
      CGFloat v9 = &MRUNowPlayingTransportCursorScaleSmall;
      goto LABEL_8;
    }
    id v14 = [MEMORY[0x1E4FB1830] configurationWithPointSize:5 weight:-1 scale:self->_contentScale * 21.0];
    id v4 = [MEMORY[0x1E4FB1830] configurationWithPointSize:5 weight:-1 scale:self->_contentScale * 26.0];
    id v5 = [MEMORY[0x1E4FB1830] configurationWithPointSize:5 weight:-1 scale:self->_contentScale * 40.0];
    double v7 = 1.1;
    uint64_t v6 = 1;
    CGFloat v9 = &MRUNowPlayingTransportCursorScaleDefault;
  }
  double v8 = v7;
LABEL_8:
  double contentScale = self->_contentScale;
  double v11 = v7 * contentScale;
  double v12 = v8 * contentScale;
  double v13 = *(double *)v9 * contentScale;
  [(MRUTransportButton *)self->_leadingButton setPreferredSymbolConfiguration:v14 forImageInState:0];
  [(MRUTransportButton *)self->_leftButton setPreferredSymbolConfiguration:v4 forImageInState:0];
  [(MRUTransportButton *)self->_centerButton setPreferredSymbolConfiguration:v5 forImageInState:0];
  [(MRUTransportButton *)self->_rightButton setPreferredSymbolConfiguration:v4 forImageInState:0];
  [(MRUTransportButton *)self->_routingButton setPreferredSymbolConfiguration:v14 forImageInState:0];
  [(MRUTransportButton *)self->_leadingButton setPackageScale:v11];
  [(MRUTransportButton *)self->_leftButton setPackageScale:v11];
  [(MRUTransportButton *)self->_centerButton setPackageScale:v12];
  [(MRUTransportButton *)self->_rightButton setPackageScale:v11];
  [(MRUTransportButton *)self->_routingButton setPackageScale:v11];
  [(MRUTransportButton *)self->_leadingButton setCursorScale:v13];
  [(MRUTransportButton *)self->_leftButton setCursorScale:v13];
  [(MRUTransportButton *)self->_centerButton setCursorScale:v13];
  [(MRUTransportButton *)self->_rightButton setCursorScale:v13];
  [(MRUTransportButton *)self->_routingButton setCursorScale:v13];
  [(MRUTransportButton *)self->_leadingButton setShowHighlightCircle:v6];
  [(MRUTransportButton *)self->_leftButton setShowHighlightCircle:v6];
  [(MRUTransportButton *)self->_centerButton setShowHighlightCircle:v6];
  [(MRUTransportButton *)self->_rightButton setShowHighlightCircle:v6];
  [(MRUTransportButton *)self->_routingButton setShowHighlightCircle:v6];
}

- (void)updateVisibility
{
  int64_t layout = self->_layout;
  if ((unint64_t)(layout - 5) < 2) {
    goto LABEL_4;
  }
  if (layout == 4)
  {
    double v4 = 0.0;
    [(MRUTransportButton *)self->_leadingButton setAlpha:0.0];
    leftButton = self->_leftButton;
    double v6 = 0.0;
    goto LABEL_6;
  }
  if (layout == 1)
  {
LABEL_4:
    double v4 = 0.0;
    [(MRUTransportButton *)self->_leadingButton setAlpha:0.0];
    leftButton = self->_leftButton;
    double v6 = 1.0;
LABEL_6:
    [(MRUTransportButton *)leftButton setAlpha:v6];
    goto LABEL_12;
  }
  double v7 = [(MRUTransportButton *)self->_leadingButton transportControlItem];
  double v4 = 0.5;
  if (v7) {
    double v8 = 0.5;
  }
  else {
    double v8 = 0.0;
  }
  [(MRUTransportButton *)self->_leadingButton setAlpha:v8];

  [(MRUTransportButton *)self->_leftButton setAlpha:1.0];
  if (!self->_showRoutingButton) {
    double v4 = 0.0;
  }
LABEL_12:
  routingButton = self->_routingButton;

  [(MRUTransportButton *)routingButton setAlpha:v4];
}

- (void)configureLeadingButton
{
  objc_initWeak(&location, self->_leadingButton);
  objc_initWeak(&from, self);
  if (self->_showTVRemoteButton)
  {
    BOOL v3 = [MRUAsset alloc];
    double v4 = +[MRUAssetsProvider tvRemote];
    id v5 = [(MRUAsset *)v3 initWithImage:v4];

    double v6 = [MRUTransportControlItem alloc];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    double v12 = __60__MRUNowPlayingTransportControlsView_configureLeadingButton__block_invoke;
    double v13 = &unk_1E5F0FC10;
    objc_copyWeak(&v14, &from);
    objc_copyWeak(&v15, &location);
    double v7 = [(MRUTransportControlItem *)v6 initWithIdentifier:@"tvremote" asset:v5 mainAction:&v10];
    -[MRUTransportButton setTransportControlItem:](self->_leadingButton, "setTransportControlItem:", v7, v10, v11, v12, v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v14);
  }
  else
  {
    double v8 = [(MRUTransportControls *)self->_transportControls leadingItem];

    leadingButton = self->_leadingButton;
    if (!v8)
    {
      [(MRUTransportButton *)self->_leadingButton setTransportControlItem:0];
      goto LABEL_6;
    }
    id v5 = [(MRUTransportControls *)self->_transportControls leadingItem];
    [(MRUTransportButton *)leadingButton setTransportControlItem:v5];
  }

LABEL_6:
  [(MRUNowPlayingTransportControlsView *)self setNeedsLayout];
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __60__MRUNowPlayingTransportControlsView_configureLeadingButton__block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = [WeakRetained delegate];
  id v4 = objc_loadWeakRetained(v2);
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  [v3 transportControlsView:v4 didSelectTVRemoteButton:v5];
}

- (MRUNowPlayingTransportControlsViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRUNowPlayingTransportControlsViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MRUTransportControls)transportControls
{
  return self->_transportControls;
}

- (MRUTransportButton)leftButton
{
  return self->_leftButton;
}

- (void)setLeftButton:(id)a3
{
}

- (MRUTransportButton)routingButton
{
  return self->_routingButton;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (int64_t)layout
{
  return self->_layout;
}

- (BOOL)showTVRemoteButton
{
  return self->_showTVRemoteButton;
}

- (BOOL)showRoutingButton
{
  return self->_showRoutingButton;
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (double)contentScale
{
  return self->_contentScale;
}

- (MRUTransportButton)leadingButton
{
  return self->_leadingButton;
}

- (void)setLeadingButton:(id)a3
{
}

- (MRUTransportButton)centerButton
{
  return self->_centerButton;
}

- (void)setCenterButton:(id)a3
{
}

- (MRUTransportButton)rightButton
{
  return self->_rightButton;
}

- (void)setRightButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightButton, 0);
  objc_storeStrong((id *)&self->_centerButton, 0);
  objc_storeStrong((id *)&self->_leadingButton, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_routingButton, 0);
  objc_storeStrong((id *)&self->_leftButton, 0);
  objc_storeStrong((id *)&self->_transportControls, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end