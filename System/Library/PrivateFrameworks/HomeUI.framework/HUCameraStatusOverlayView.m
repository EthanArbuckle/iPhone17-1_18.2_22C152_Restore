@interface HUCameraStatusOverlayView
- (BOOL)didUpdateConstraints;
- (BOOL)isDisplayingForSingleCamera;
- (HUCameraStatusOverlayView)initWithFrame:(CGRect)a3;
- (HULegibilityLabel)statusLabel;
- (NSString)statusImageName;
- (NSString)statusString;
- (UIColor)statusColor;
- (UIImageView)alertBadge;
- (UIImageView)statusIndicatorImageView;
- (id)_chevronImage;
- (id)_exclamationImage;
- (void)layoutSubviews;
- (void)setAlertBadge:(id)a3;
- (void)setBadgeStatus:(unint64_t)a3;
- (void)setDidUpdateConstraints:(BOOL)a3;
- (void)setIsDisplayingForSingleCamera:(BOOL)a3;
- (void)setStatusColor:(id)a3;
- (void)setStatusImageName:(id)a3;
- (void)setStatusIndicatorImageView:(id)a3;
- (void)setStatusLabel:(id)a3;
- (void)setStatusString:(id)a3;
- (void)updateStatusForPlaybackEngine:(id)a3;
- (void)updateStatusLabelBounds;
@end

@implementation HUCameraStatusOverlayView

- (HUCameraStatusOverlayView)initWithFrame:(CGRect)a3
{
  v23.receiver = self;
  v23.super_class = (Class)HUCameraStatusOverlayView;
  v3 = -[HUCameraStatusOverlayView initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F43228] sharedInstanceForStyle:0];
    v5 = [HULegibilityLabel alloc];
    double v6 = *MEMORY[0x1E4F440D8];
    v7 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438A0]];
    uint64_t v8 = [(HULegibilityLabel *)v5 initWithSettings:v4 strength:&stru_1F18F92B8 text:v7 font:*MEMORY[0x1E4F440F8] options:v6];
    statusLabel = v3->_statusLabel;
    v3->_statusLabel = (HULegibilityLabel *)v8;

    [(HUCameraStatusOverlayView *)v3 addSubview:v3->_statusLabel];
    v10 = [(HUCameraStatusOverlayView *)v3 alertBadge];
    [(HUCameraStatusOverlayView *)v3 addSubview:v10];

    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", 0.0, 0.0, 12.0, 12.0);
    statusIndicatorImageView = v3->_statusIndicatorImageView;
    v3->_statusIndicatorImageView = (UIImageView *)v11;

    double v13 = *MEMORY[0x1E4F1DB30];
    double v14 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    v15 = [(UIImageView *)v3->_statusIndicatorImageView layer];
    objc_msgSend(v15, "setShadowOffset:", v13, v14);

    v16 = [(UIImageView *)v3->_statusIndicatorImageView layer];
    [v16 setShadowRadius:8.0];

    id v17 = [MEMORY[0x1E4F428B8] systemBlackColor];
    uint64_t v18 = [v17 CGColor];
    v19 = [(UIImageView *)v3->_statusIndicatorImageView layer];
    [v19 setShadowColor:v18];

    v20 = [(UIImageView *)v3->_statusIndicatorImageView layer];
    LODWORD(v21) = 1061997773;
    [v20 setShadowOpacity:v21];

    [(UIImageView *)v3->_statusIndicatorImageView setContentMode:1];
    [(HUCameraStatusOverlayView *)v3 addSubview:v3->_statusIndicatorImageView];
  }
  return v3;
}

- (void)layoutSubviews
{
  v72.receiver = self;
  v72.super_class = (Class)HUCameraStatusOverlayView;
  [(HUCameraStatusOverlayView *)&v72 layoutSubviews];
  [(HUCameraStatusOverlayView *)self updateStatusLabelBounds];
  [(HUCameraStatusOverlayView *)self bounds];
  double MidX = CGRectGetMidX(v73);
  v4 = [(HUCameraStatusOverlayView *)self statusLabel];
  [v4 center];

  v5 = [(HUCameraStatusOverlayView *)self alertBadge];
  int v6 = [v5 isHidden];

  if (v6)
  {
    v7 = [(HUCameraStatusOverlayView *)self statusIndicatorImageView];
    [v7 frame];
    double v8 = (CGRectGetWidth(v74) + 10.0) * 0.5;

    v9 = [(HUCameraStatusOverlayView *)self traitCollection];
    uint64_t v10 = [v9 layoutDirection];

    double v11 = -v8;
    if (!v10) {
      double v11 = v8;
    }
    double MidX = MidX + v11;
  }
  [(HUCameraStatusOverlayView *)self bounds];
  double MidY = CGRectGetMidY(v75);
  double v13 = [(HUCameraStatusOverlayView *)self statusLabel];
  objc_msgSend(v13, "setCenter:", MidX, MidY);

  double v14 = [(HUCameraStatusOverlayView *)self traitCollection];
  uint64_t v15 = [v14 layoutDirection];

  if (v15)
  {
    v16 = [(HUCameraStatusOverlayView *)self alertBadge];
    [v16 frame];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;

    objc_super v23 = [(HUCameraStatusOverlayView *)self statusLabel];
    [v23 frame];
    double v25 = v24 - (v20 + 7.0);

    v26 = [(HUCameraStatusOverlayView *)self alertBadge];
    objc_msgSend(v26, "setFrame:", v25, v18, v20, v22);

    v27 = [(HUCameraStatusOverlayView *)self alertBadge];
    [v27 center];
    double v29 = v28;

    v30 = [(HUCameraStatusOverlayView *)self alertBadge];
    objc_msgSend(v30, "setCenter:", v29, MidY);

    v31 = [(HUCameraStatusOverlayView *)self statusIndicatorImageView];
    [v31 frame];
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;

    v38 = [(HUCameraStatusOverlayView *)self statusLabel];
    [v38 frame];
    CGFloat v39 = CGRectGetMaxX(v76) + 10.0;

    v40 = [(HUCameraStatusOverlayView *)self statusIndicatorImageView];
    objc_msgSend(v40, "setFrame:", v39, v33, v35, v37);

    v41 = [(HUCameraStatusOverlayView *)self statusIndicatorImageView];
    [v41 center];
    double v43 = v42;

    [(HUCameraStatusOverlayView *)self statusIndicatorImageView];
  }
  else
  {
    v44 = [(HUCameraStatusOverlayView *)self statusIndicatorImageView];
    [v44 frame];
    double v46 = v45;
    double v48 = v47;
    double v50 = v49;

    v51 = [(HUCameraStatusOverlayView *)self statusLabel];
    [v51 frame];
    double v53 = v52 - (v48 + 10.0);

    v54 = [(HUCameraStatusOverlayView *)self statusIndicatorImageView];
    objc_msgSend(v54, "setFrame:", v53, v46, v48, v50);

    v55 = [(HUCameraStatusOverlayView *)self statusIndicatorImageView];
    [v55 center];
    double v57 = v56;

    v58 = [(HUCameraStatusOverlayView *)self statusIndicatorImageView];
    objc_msgSend(v58, "setCenter:", v57, MidY);

    v59 = [(HUCameraStatusOverlayView *)self alertBadge];
    [v59 frame];
    double v61 = v60;
    double v63 = v62;
    double v65 = v64;

    v66 = [(HUCameraStatusOverlayView *)self statusLabel];
    [v66 frame];
    CGFloat v67 = CGRectGetMaxX(v77) + 7.0;

    v68 = [(HUCameraStatusOverlayView *)self alertBadge];
    objc_msgSend(v68, "setFrame:", v67, v61, v63, v65);

    v69 = [(HUCameraStatusOverlayView *)self alertBadge];
    [v69 center];
    double v43 = v70;

    [(HUCameraStatusOverlayView *)self alertBadge];
  v71 = };
  objc_msgSend(v71, "setCenter:", v43, MidY);
}

- (void)updateStatusForPlaybackEngine:(id)a3
{
  id v11 = a3;
  v4 = [v11 playbackError];

  v5 = [v11 cameraProfile];
  int v6 = [v5 accessory];
  v7 = [v6 name];
  [(HUCameraStatusOverlayView *)self setStatusString:v7];

  if (v4)
  {
    double v8 = [v11 cameraProfile];
    int v9 = objc_msgSend(v8, "hf_shouldDisableLiveStream");

    if (v9) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = 2;
    }
  }
  else
  {
    uint64_t v10 = 1;
  }
  [(HUCameraStatusOverlayView *)self setBadgeStatus:v10];
}

- (void)setStatusString:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_statusString, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_statusString, a3);
    v5 = [(HUCameraStatusOverlayView *)self statusLabel];
    [v5 setText:v6];

    [(HUCameraStatusOverlayView *)self setNeedsLayout];
  }
}

- (void)setStatusColor:(id)a3
{
  id v6 = a3;
  if ((-[UIColor isEqual:](self->_statusColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_statusColor, a3);
    v5 = [(HUCameraStatusOverlayView *)self statusIndicatorImageView];
    [v5 setTintColor:v6];
  }
}

- (void)setStatusImageName:(id)a3
{
  id v7 = a3;
  if (!-[NSString isEqualToString:](self->_statusImageName, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_statusImageName, a3);
    v5 = [MEMORY[0x1E4F42A80] systemImageNamed:v7];
    id v6 = [(HUCameraStatusOverlayView *)self statusIndicatorImageView];
    [v6 setImage:v5];
  }
}

- (void)setBadgeStatus:(unint64_t)a3
{
  if (a3 == 2)
  {
    int v9 = [(HUCameraStatusOverlayView *)self alertBadge];
    [v9 setHidden:0];

    uint64_t v10 = [(HUCameraStatusOverlayView *)self _exclamationImage];
    id v11 = [(HUCameraStatusOverlayView *)self alertBadge];
    [v11 setImage:v10];

    uint64_t v8 = [MEMORY[0x1E4F428B8] systemRedColor];
  }
  else
  {
    if (a3 != 1) {
      goto LABEL_6;
    }
    BOOL v4 = [(HUCameraStatusOverlayView *)self isDisplayingForSingleCamera];
    v5 = [(HUCameraStatusOverlayView *)self alertBadge];
    [v5 setHidden:v4];

    id v6 = [(HUCameraStatusOverlayView *)self _chevronImage];
    id v7 = [(HUCameraStatusOverlayView *)self alertBadge];
    [v7 setImage:v6];

    uint64_t v8 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  }
  v12 = (void *)v8;
  double v13 = [(HUCameraStatusOverlayView *)self alertBadge];
  [v13 setTintColor:v12];

LABEL_6:
  double v14 = [(HUCameraStatusOverlayView *)self alertBadge];
  [v14 sizeToFit];

  [(HUCameraStatusOverlayView *)self setNeedsLayout];
}

- (void)updateStatusLabelBounds
{
  v3 = [(HUCameraStatusOverlayView *)self statusLabel];
  [v3 sizeToFit];

  [(HUCameraStatusOverlayView *)self bounds];
  double v5 = v4;
  id v6 = [(HUCameraStatusOverlayView *)self alertBadge];
  [v6 bounds];
  double v8 = v7 + 17.0;
  int v9 = [(HUCameraStatusOverlayView *)self statusIndicatorImageView];
  [v9 bounds];
  double v11 = v5 - (v8 + v10);

  if (v11 > 0.0)
  {
    v12 = [(HUCameraStatusOverlayView *)self statusLabel];
    [v12 bounds];
    double v14 = v13;

    if (v14 > v11)
    {
      uint64_t v15 = [(HUCameraStatusOverlayView *)self statusLabel];
      [v15 bounds];
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;

      id v22 = [(HUCameraStatusOverlayView *)self statusLabel];
      objc_msgSend(v22, "setBounds:", v17, v19, v11, v21);
    }
  }
}

- (UIImageView)alertBadge
{
  alertBadge = self->_alertBadge;
  if (!alertBadge)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42AA0]);
    double v5 = [(HUCameraStatusOverlayView *)self _chevronImage];
    id v6 = (UIImageView *)[v4 initWithImage:v5];

    double v7 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    [(UIImageView *)v6 setTintColor:v7];

    [(UIImageView *)v6 setContentMode:1];
    double v8 = self->_alertBadge;
    self->_alertBadge = v6;

    alertBadge = self->_alertBadge;
  }

  return alertBadge;
}

- (id)_exclamationImage
{
  v2 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"exclamationmark.circle.fill"];
  v3 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_standardSymbolConfiguration");
  id v4 = [v2 imageWithConfiguration:v3];

  return v4;
}

- (id)_chevronImage
{
  v2 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"chevron.down"];
  v3 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_standardSymbolConfiguration");
  id v4 = [v2 imageWithConfiguration:v3];

  return v4;
}

- (NSString)statusString
{
  return self->_statusString;
}

- (UIColor)statusColor
{
  return self->_statusColor;
}

- (NSString)statusImageName
{
  return self->_statusImageName;
}

- (void)setAlertBadge:(id)a3
{
}

- (BOOL)isDisplayingForSingleCamera
{
  return self->_isDisplayingForSingleCamera;
}

- (void)setIsDisplayingForSingleCamera:(BOOL)a3
{
  self->_isDisplayingForSingleCamera = a3;
}

- (HULegibilityLabel)statusLabel
{
  return self->_statusLabel;
}

- (void)setStatusLabel:(id)a3
{
}

- (UIImageView)statusIndicatorImageView
{
  return self->_statusIndicatorImageView;
}

- (void)setStatusIndicatorImageView:(id)a3
{
}

- (BOOL)didUpdateConstraints
{
  return self->_didUpdateConstraints;
}

- (void)setDidUpdateConstraints:(BOOL)a3
{
  self->_didUpdateConstraints = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusIndicatorImageView, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_alertBadge, 0);
  objc_storeStrong((id *)&self->_statusImageName, 0);
  objc_storeStrong((id *)&self->_statusColor, 0);

  objc_storeStrong((id *)&self->_statusString, 0);
}

@end