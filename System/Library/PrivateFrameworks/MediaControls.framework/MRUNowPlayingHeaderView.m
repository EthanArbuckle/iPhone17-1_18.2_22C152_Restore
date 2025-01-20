@interface MRUNowPlayingHeaderView
- (BOOL)showHaptic;
- (BOOL)showRoutingButton;
- (BOOL)showTransportButton;
- (BOOL)showWaveform;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MRUHapticView)hapticView;
- (MRUNowPlayingHeaderView)initWithFrame:(CGRect)a3;
- (MRUNowPlayingLabelView)labelView;
- (MRUTransportButton)routingButton;
- (MRUTransportButton)transportButton;
- (MRUVisualStylingProvider)stylingProvider;
- (MRUWaveformView)waveformView;
- (double)contentScale;
- (double)textCenterOffsetY;
- (int64_t)layout;
- (int64_t)textAlignment;
- (void)layoutSubviews;
- (void)setContentScale:(double)a3;
- (void)setHapticView:(id)a3;
- (void)setLayout:(int64_t)a3;
- (void)setShowHaptic:(BOOL)a3;
- (void)setShowRoutingButton:(BOOL)a3;
- (void)setShowTransportButton:(BOOL)a3;
- (void)setShowWaveform:(BOOL)a3;
- (void)setStylingProvider:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextCenterOffsetY:(double)a3;
- (void)setWaveformView:(id)a3;
- (void)updateVisibility;
@end

@implementation MRUNowPlayingHeaderView

- (MRUNowPlayingHeaderView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)MRUNowPlayingHeaderView;
  v3 = -[MRUNowPlayingHeaderView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MRUNowPlayingLabelView);
    labelView = v3->_labelView;
    v3->_labelView = v4;

    [(MRUNowPlayingHeaderView *)v3 addSubview:v3->_labelView];
    v6 = [MEMORY[0x1E4FB1830] configurationWithPointSize:5 weight:-1 scale:29.0];
    uint64_t v7 = +[MPButton easyTouchButtonWithType:0];
    routingButton = v3->_routingButton;
    v3->_routingButton = (MRUTransportButton *)v7;

    [(MRUTransportButton *)v3->_routingButton setCursorScale:1.5];
    -[MPButton setHitRectInsets:](v3->_routingButton, "setHitRectInsets:", -24.0, -24.0, -24.0, -24.0);
    [(MRUTransportButton *)v3->_routingButton setPreferredSymbolConfiguration:v6 forImageInState:0];
    [(MRUNowPlayingHeaderView *)v3 addSubview:v3->_routingButton];
    uint64_t v9 = +[MPButton easyTouchButtonWithType:0];
    transportButton = v3->_transportButton;
    v3->_transportButton = (MRUTransportButton *)v9;

    -[MPButton setHitRectInsets:](v3->_transportButton, "setHitRectInsets:", -24.0, -24.0, -24.0, -24.0);
    [(MRUTransportButton *)v3->_transportButton setCursorScale:1.5];
    [(MRUTransportButton *)v3->_transportButton setPackageScale:0.7];
    [(MRUTransportButton *)v3->_transportButton setPreferredSymbolConfiguration:v6 forImageInState:0];
    [(MRUNowPlayingHeaderView *)v3 addSubview:v3->_transportButton];
    v3->_contentScale = 1.0;
    [(MRUNowPlayingHeaderView *)v3 updateVisibility];
  }
  return v3;
}

- (void)layoutSubviews
{
  v70.receiver = self;
  v70.super_class = (Class)MRUNowPlayingHeaderView;
  [(MRUNowPlayingHeaderView *)&v70 layoutSubviews];
  [(MRUNowPlayingHeaderView *)self bounds];
  CGFloat v7 = v3;
  CGFloat v8 = v4;
  double v9 = v5;
  double v10 = v6;
  int64_t layout = self->_layout;
  if (layout == 4)
  {
    CGRectGetMaxX(*(CGRect *)&v3);
    UIRectCenteredYInRect();
    uint64_t v26 = v25;
    uint64_t v28 = v27;
    uint64_t v30 = v29;
    uint64_t v32 = v31;
    [(MRUNowPlayingHeaderView *)self bounds];
    uint64_t v68 = v28;
    uint64_t v69 = v26;
    uint64_t v66 = v32;
    uint64_t v67 = v30;
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    -[MRUWaveformView setFrame:](self->_waveformView, "setFrame:");
    v76.origin.x = v7;
    v76.origin.y = v8;
    v76.size.width = v9;
    v76.size.height = v10;
    CGRectGetMaxX(v76);
    UIRectCenteredYInRect();
    uint64_t v34 = v33;
    uint64_t v36 = v35;
    uint64_t v38 = v37;
    uint64_t v40 = v39;
    [(MRUNowPlayingHeaderView *)self bounds];
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    -[MRUHapticView setFrame:](self->_hapticView, "setFrame:");
    v77.origin.x = v7;
    v77.origin.y = v8;
    v77.size.width = v9;
    v77.size.height = v10;
    CGRectGetMaxX(v77);
    UIRectCenteredYInRect();
    [(MRUNowPlayingHeaderView *)self bounds];
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    -[MRUTransportButton setFrame:](self->_transportButton, "setFrame:");
    if (self->_showWaveform)
    {
      if (!self->_showHaptic)
      {
        uint64_t v42 = v68;
        uint64_t v41 = v69;
        uint64_t v44 = v66;
        uint64_t v43 = v67;
LABEL_21:
        CGRectGetWidth(*(CGRect *)&v41);
        UIRectInset();
        CGFloat v7 = v62;
        CGFloat v8 = v63;
        double v9 = v64;
        double v10 = v65;
        goto LABEL_22;
      }
    }
    else if (!self->_showHaptic)
    {
LABEL_22:
      p_labelView = (id *)&self->_labelView;
      -[MRUNowPlayingLabelView sizeThatFits:](self->_labelView, "sizeThatFits:", v9, v10, v66);
      v85.origin.x = v7;
      v85.origin.y = v8;
      v85.size.width = v9;
      v85.size.height = v10;
      CGRectGetMinX(v85);
      v86.origin.x = v7;
      v86.origin.y = v8;
      v86.size.width = v9;
      v86.size.height = v10;
      CGRectGetWidth(v86);
LABEL_23:
      UIRectCenteredYInRect();
      [(MRUNowPlayingHeaderView *)self bounds];
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      goto LABEL_24;
    }
    uint64_t v42 = v36;
    uint64_t v41 = v34;
    uint64_t v44 = v40;
    uint64_t v43 = v38;
    goto LABEL_21;
  }
  if (layout != 2)
  {
    CGRectGetMaxX(*(CGRect *)&v3);
    UIRectCenteredYInRect();
    [(MRUNowPlayingHeaderView *)self bounds];
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    -[MRUTransportButton setFrame:](self->_routingButton, "setFrame:");
    v78.origin.x = v7;
    v78.origin.y = v8;
    v78.size.width = v9;
    v78.size.height = v10;
    v79.origin.x = CGRectGetMaxX(v78) - 22.0;
    v79.origin.y = 0.0;
    v79.size.width = 22.0;
    v79.size.height = 22.0;
    CGRectOffset(v79, -10.0, 3.0);
    [(MRUNowPlayingHeaderView *)self bounds];
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    -[MRUWaveformView setFrame:](self->_waveformView, "setFrame:");
    v80.origin.x = v7;
    v80.origin.y = v8;
    v80.size.width = v9;
    v80.size.height = v10;
    v81.origin.x = CGRectGetMaxX(v80) - 32.0;
    v81.origin.y = 0.0;
    v81.size.width = 32.0;
    v81.size.height = 32.0;
    CGRectOffset(v81, -10.0, 3.0);
    [(MRUNowPlayingHeaderView *)self bounds];
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    -[MRUHapticView setFrame:](self->_hapticView, "setFrame:");
    if (self->_showRoutingButton && self->_layout == 3)
    {
      UIRectInset();
      CGFloat v7 = v45;
      CGFloat v8 = v46;
      double v9 = v47;
      double v10 = v48;
    }
    if (self->_showWaveform && !self->_showHaptic)
    {
      UIRectInset();
      CGFloat v7 = v49;
      CGFloat v8 = v50;
      double v9 = v51;
      double v10 = v52;
    }
    if (self->_showHaptic)
    {
      UIRectInset();
      CGFloat v7 = v53;
      CGFloat v8 = v54;
      double v9 = v55;
      double v10 = v56;
    }
    v82.origin.x = v7;
    v82.origin.y = v8;
    v82.size.width = v9;
    v82.size.height = v10;
    CGRectGetMaxX(v82);
    CGFloat v57 = v8;
    UIRectCenteredYInRect();
    [(MRUNowPlayingHeaderView *)self bounds];
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    -[MRUTransportButton setFrame:](self->_transportButton, "setFrame:");
    if (self->_showTransportButton && self->_layout == 3)
    {
      UIRectInset();
      CGFloat v7 = v58;
      CGFloat v57 = v59;
      double v9 = v60;
      double v10 = v61;
    }
    p_labelView = (id *)&self->_labelView;
    -[MRUNowPlayingLabelView sizeThatFits:](self->_labelView, "sizeThatFits:", v9, v10);
    v83.origin.x = v7;
    v83.origin.y = v57;
    v83.size.width = v9;
    v83.size.height = v10;
    CGRectGetMinX(v83);
    v84.origin.x = v7;
    v84.origin.y = v57;
    v84.size.width = v9;
    v84.size.height = v10;
    CGRectGetWidth(v84);
    goto LABEL_23;
  }
  UIRectInset();
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  -[MRUNowPlayingLabelView sizeThatFits:](self->_labelView, "sizeThatFits:", v16, v18);
  double v21 = v20;
  v71.origin.x = v13;
  v71.origin.y = v15;
  v71.size.width = v17;
  v71.size.height = v19;
  double MinX = CGRectGetMinX(v71);
  v72.origin.x = v13;
  v72.origin.y = v15;
  v72.size.width = v17;
  v72.size.height = v19;
  double MinY = CGRectGetMinY(v72);
  v73.origin.x = v13;
  v73.origin.y = v15;
  v73.size.width = v17;
  v73.size.height = v19;
  -[MRUNowPlayingLabelView setFrame:](self->_labelView, "setFrame:", MinX, MinY, CGRectGetWidth(v73), v21);
  v74.origin.x = v13;
  v74.origin.y = v15;
  v74.size.width = v17;
  v74.size.height = v19;
  CGRectGetMaxX(v74);
  UIRectCenteredYInRect();
  [(MRUNowPlayingHeaderView *)self bounds];
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[MRUTransportButton setFrame:](self->_transportButton, "setFrame:");
  v75.origin.x = v13;
  v75.origin.y = v15;
  v75.size.width = v17;
  v75.size.height = v19;
  CGRectGetMaxX(v75);
  UIRectCenteredYInRect();
  [(MRUNowPlayingHeaderView *)self bounds];
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  p_labelView = (id *)&self->_routingButton;
LABEL_24:
  objc_msgSend(*p_labelView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (self->_layout == 2)
  {
    -[MRUNowPlayingLabelView sizeThatFits:](self->_labelView, "sizeThatFits:", a3.width, a3.height);
  }
  else
  {
    -[MRUTransportButton sizeThatFits:](self->_routingButton, "sizeThatFits:", a3.width, a3.height);
    double v8 = v7;
    -[MRUNowPlayingLabelView sizeThatFits:](self->_labelView, "sizeThatFits:", width, height);
    if (v8 >= v6) {
      double v6 = v8;
    }
  }
  double v9 = width;
  result.double height = v6;
  result.double width = v9;
  return result;
}

- (void)setStylingProvider:(id)a3
{
  double v5 = (MRUVisualStylingProvider *)a3;
  if (self->_stylingProvider != v5)
  {
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    [(MRUWaveformView *)self->_waveformView setStylingProvider:v5];
    [(MRUHapticView *)self->_hapticView setStylingProvider:v5];
    [(MRUNowPlayingLabelView *)self->_labelView setStylingProvider:v5];
    [(MRUTransportButton *)self->_transportButton setStylingProvider:v5];
  }
}

- (void)setWaveformView:(id)a3
{
  double v4 = (MRUWaveformView *)a3;
  [(MRUWaveformView *)self->_waveformView removeFromSuperview];
  waveformView = self->_waveformView;
  self->_waveformView = v4;
  double v6 = v4;

  [(MRUWaveformView *)self->_waveformView setStylingProvider:self->_stylingProvider];
  [(MRUNowPlayingHeaderView *)self addSubview:v6];

  [(MRUNowPlayingHeaderView *)self updateVisibility];

  [(MRUNowPlayingHeaderView *)self setNeedsLayout];
}

- (void)setHapticView:(id)a3
{
  double v4 = (MRUHapticView *)a3;
  [(MRUHapticView *)self->_hapticView removeFromSuperview];
  hapticView = self->_hapticView;
  self->_hapticView = v4;
  double v6 = v4;

  [(MRUHapticView *)self->_hapticView setStylingProvider:self->_stylingProvider];
  [(MRUNowPlayingHeaderView *)self addSubview:v6];

  [(MRUNowPlayingHeaderView *)self updateVisibility];

  [(MRUNowPlayingHeaderView *)self setNeedsLayout];
}

- (void)setLayout:(int64_t)a3
{
  if (self->_layout != a3)
  {
    self->_int64_t layout = a3;
    [(MRUNowPlayingHeaderView *)self updateVisibility];
    [(MRUNowPlayingHeaderView *)self setNeedsLayout];
  }
}

- (void)setShowTransportButton:(BOOL)a3
{
  if (self->_showTransportButton != a3)
  {
    self->_showTransportButton = a3;
    [(MRUNowPlayingHeaderView *)self updateVisibility];
    [(MRUNowPlayingHeaderView *)self setNeedsLayout];
  }
}

- (void)setShowWaveform:(BOOL)a3
{
  if (self->_showWaveform != a3)
  {
    self->_showWaveform = a3;
    [(MRUNowPlayingHeaderView *)self updateVisibility];
    [(MRUNowPlayingHeaderView *)self setNeedsLayout];
  }
}

- (void)setShowHaptic:(BOOL)a3
{
  if (self->_showHaptic != a3)
  {
    self->_showHaptic = a3;
    [(MRUNowPlayingHeaderView *)self updateVisibility];
    [(MRUNowPlayingHeaderView *)self setNeedsLayout];
  }
}

- (void)setShowRoutingButton:(BOOL)a3
{
  if (self->_showRoutingButton != a3)
  {
    self->_showRoutingButton = a3;
    [(MRUNowPlayingHeaderView *)self updateVisibility];
    [(MRUNowPlayingHeaderView *)self setNeedsLayout];
  }
}

- (void)setTextAlignment:(int64_t)a3
{
  if (self->_textAlignment != a3)
  {
    self->_textAlignment = a3;
    -[MRUNowPlayingLabelView setTextAlignment:](self->_labelView, "setTextAlignment:");
    [(MRUNowPlayingHeaderView *)self setNeedsLayout];
  }
}

- (void)setContentScale:(double)a3
{
  if (vabdd_f64(self->_contentScale, a3) > 2.22044605e-16)
  {
    self->_contentScale = a3;
    -[MRUNowPlayingLabelView setContentScale:](self->_labelView, "setContentScale:");
  }
}

- (void)updateVisibility
{
  switch(self->_layout)
  {
    case 0:
    case 4:
      [(MRUTransportButton *)self->_routingButton setAlpha:0.0];
      [(MRUTransportButton *)self->_transportButton setAlpha:0.0];
      double v5 = 0.0;
      if (self->_showWaveform && !self->_showHaptic) {
        double v5 = 1.0;
      }
      [(MRUWaveformView *)self->_waveformView setAlpha:v5];
      double v4 = 1.0;
      if (!self->_showHaptic) {
        double v4 = 0.0;
      }
      hapticView = self->_hapticView;
      goto LABEL_9;
    case 1:
    case 2:
      [(MRUTransportButton *)self->_routingButton setAlpha:0.0];
      [(MRUTransportButton *)self->_transportButton setAlpha:0.0];
      [(MRUWaveformView *)self->_waveformView setAlpha:0.0];
      hapticView = self->_hapticView;
      double v4 = 0.0;
LABEL_9:
      [(MRUHapticView *)hapticView setAlpha:v4];
      break;
    case 3:
      if (self->_showRoutingButton) {
        double v6 = 1.0;
      }
      else {
        double v6 = 0.0;
      }
      [(MRUTransportButton *)self->_routingButton setAlpha:v6];
      if (self->_showTransportButton) {
        double v7 = 1.0;
      }
      else {
        double v7 = 0.0;
      }
      [(MRUTransportButton *)self->_transportButton setAlpha:v7];
      [(MRUWaveformView *)self->_waveformView setAlpha:0.0];
      [(MRUHapticView *)self->_hapticView setAlpha:0.0];
      if (self->_showTransportButton) {
        double v8 = (double *)&unk_1AE963988;
      }
      else {
        double v8 = (double *)&unk_1AE963948;
      }
      double v9 = *v8;
      double v10 = &qword_1AE963940;
      if (self->_showTransportButton) {
        double v10 = (uint64_t *)&unk_1AE963980;
      }
      double v11 = *(double *)v10;
      double v12 = (double *)&unk_1AE963938;
      if (self->_showTransportButton) {
        double v12 = (double *)&unk_1AE963978;
      }
      double v13 = *v12;
      if (self->_showTransportButton) {
        double v14 = (double *)&MRUNowPlayingHitRectInsetRight;
      }
      else {
        double v14 = (double *)&MRUNowPlayingHitRectInset;
      }
      -[MPButton setHitRectInsets:](self->_routingButton, "setHitRectInsets:", *v14, v13, v11, v9);
      if (self->_showRoutingButton) {
        CGFloat v15 = &MRUNowPlayingHitRectInsetLeft;
      }
      else {
        CGFloat v15 = &MRUNowPlayingHitRectInset;
      }
      double v16 = *(double *)v15;
      double v17 = *((double *)v15 + 1);
      transportButton = self->_transportButton;
      double v19 = *((double *)v15 + 2);
      double v20 = *((double *)v15 + 3);
      -[MPButton setHitRectInsets:](transportButton, "setHitRectInsets:", v16, v17, v19, v20);
      break;
    default:
      return;
  }
}

- (MRUWaveformView)waveformView
{
  return self->_waveformView;
}

- (MRUHapticView)hapticView
{
  return self->_hapticView;
}

- (MRUNowPlayingLabelView)labelView
{
  return self->_labelView;
}

- (MRUTransportButton)routingButton
{
  return self->_routingButton;
}

- (MRUTransportButton)transportButton
{
  return self->_transportButton;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (int64_t)layout
{
  return self->_layout;
}

- (BOOL)showTransportButton
{
  return self->_showTransportButton;
}

- (BOOL)showRoutingButton
{
  return self->_showRoutingButton;
}

- (BOOL)showWaveform
{
  return self->_showWaveform;
}

- (BOOL)showHaptic
{
  return self->_showHaptic;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (double)textCenterOffsetY
{
  return self->_textCenterOffsetY;
}

- (void)setTextCenterOffsetY:(double)a3
{
  self->_textCenterOffsetY = a3;
}

- (double)contentScale
{
  return self->_contentScale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_transportButton, 0);
  objc_storeStrong((id *)&self->_routingButton, 0);
  objc_storeStrong((id *)&self->_labelView, 0);
  objc_storeStrong((id *)&self->_hapticView, 0);

  objc_storeStrong((id *)&self->_waveformView, 0);
}

@end