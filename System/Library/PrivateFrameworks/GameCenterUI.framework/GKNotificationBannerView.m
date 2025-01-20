@interface GKNotificationBannerView
+ (BOOL)_preventsAppearanceProxyCustomization;
- (BOOL)canTransitionToPlayerAvatar;
- (BOOL)useShortBanner;
- (GKDashboardPlayerPhotoView)playerAvatarView;
- (GKNotificationBannerView)initWithTitle:(id)a3 image:(id)a4 message:(id)a5 useShortBanner:(BOOL)a6;
- (GKNotificationBannerView)initWithTitle:(id)a3 player:(id)a4 leadingAccessoryView:(id)a5 message:(id)a6 useShortBanner:(BOOL)a7;
- (UILabel)actionLabel;
- (UILabel)messageLabel;
- (UILabel)titleLabel;
- (UIView)leadingAccessoryView;
- (double)duration;
- (double)preferredBannerWidth;
- (id)completionHandler;
- (id)touchHandler;
- (void)_wasTouched:(id)a3;
- (void)awakeFromNib;
- (void)callCompletionHandler;
- (void)createBackdropViewWithBlurStyle:(int64_t)a3;
- (void)createMessageLabel:(id)a3 withTextStyle:(id)a4;
- (void)createTitleLabel:(id)a3 withTextStyle:(id)a4;
- (void)dealloc;
- (void)fadeInWithCompletionHandler:(id)a3;
- (void)fadeOutQuickly:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)hideBanner;
- (void)layoutSubviews;
- (void)setActionLabel:(id)a3;
- (void)setCanTransitionToPlayerAvatar:(BOOL)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDuration:(double)a3;
- (void)setLeadingAccessoryView:(id)a3;
- (void)setMessageLabel:(id)a3;
- (void)setPlayerAvatarView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTouchHandler:(id)a3;
- (void)setUseShortBanner:(BOOL)a3;
- (void)showPlayerAvatarAnimationWithCompletionHandler:(id)a3;
- (void)showWithCompletionHandler:(id)a3;
- (void)showWithTouchHandler:(id)a3;
- (void)startLoadingPlayerAvatar;
- (void)transitionToPlayerAvatar;
@end

@implementation GKNotificationBannerView

- (void)awakeFromNib
{
  v4.receiver = self;
  v4.super_class = (Class)GKNotificationBannerView;
  [(GKNotificationBannerView *)&v4 awakeFromNib];
  [(GKNotificationBannerView *)self bounds];
  self->_preferredBannerWidth = v3;
}

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

- (void)createBackdropViewWithBlurStyle:(int64_t)a3
{
  id v10 = [MEMORY[0x1E4FB14C8] effectWithStyle:a3];
  objc_super v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v10];
  [(GKNotificationBannerView *)self addSubview:v4];
  if ([(GKNotificationBannerView *)self useShortBanner]) {
    double v5 = 13.0;
  }
  else {
    double v5 = 24.0;
  }
  v6 = [v4 layer];
  [v6 setCornerRadius:v5];

  uint64_t v7 = *MEMORY[0x1E4F39EA8];
  v8 = [v4 layer];
  [v8 setCornerCurve:v7];

  v9 = [v4 layer];
  [v9 setMasksToBounds:1];

  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [MEMORY[0x1E4F28DC8] _gkInstallEdgeConstraintsForView:v4 containedWithinParentView:self];
}

- (void)createTitleLabel:(id)a3 withTextStyle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [GKLabel alloc];
  v9 = -[GKLabel initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  titleLabel = self->_titleLabel;
  self->_titleLabel = v9;

  v11 = [MEMORY[0x1E4FB1618] clearColor];
  [(UILabel *)self->_titleLabel setBackgroundColor:v11];

  [(UILabel *)self->_titleLabel setNumberOfLines:1];
  if ([(GKNotificationBannerView *)self useShortBanner]) {
    [v6 bannerShortTitle];
  }
  else {
  v12 = [v6 bannerTitle];
  }

  v13 = [v7 _gkAttributedStringByApplyingStyle:v12];

  [(UILabel *)self->_titleLabel setAttributedText:v13];
  [(UILabel *)self->_titleLabel setAdjustsFontSizeToFitWidth:1];
  [(UILabel *)self->_titleLabel setMinimumScaleFactor:0.6];
  [(UILabel *)self->_titleLabel setAccessibilityIdentifier:@"GameCenter.notificationBanner.title"];
  v14 = self->_titleLabel;

  [(GKNotificationBannerView *)self addSubview:v14];
}

- (void)createMessageLabel:(id)a3 withTextStyle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [GKLabel alloc];
  v9 = -[GKLabel initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  messageLabel = self->_messageLabel;
  self->_messageLabel = v9;

  v11 = [MEMORY[0x1E4FB1618] clearColor];
  [(UILabel *)self->_messageLabel setBackgroundColor:v11];

  [(UILabel *)self->_messageLabel setNumberOfLines:1];
  [(UILabel *)self->_messageLabel setAdjustsFontSizeToFitWidth:1];
  [(UILabel *)self->_messageLabel setMinimumScaleFactor:0.6];
  v12 = [v6 bannerMessage];

  v13 = [v7 _gkAttributedStringByApplyingStyle:v12];

  [(UILabel *)self->_messageLabel setAttributedText:v13];
  [(UILabel *)self->_messageLabel setAccessibilityIdentifier:@"GameCenter.notificationBanner.message"];
  v14 = self->_messageLabel;

  [(GKNotificationBannerView *)self addSubview:v14];
}

- (GKNotificationBannerView)initWithTitle:(id)a3 player:(id)a4 leadingAccessoryView:(id)a5 message:(id)a6 useShortBanner:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v52.receiver = self;
  v52.super_class = (Class)GKNotificationBannerView;
  v16 = -[GKNotificationBannerView initWithFrame:](&v52, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v17 = v16;
  if (!v16) {
    goto LABEL_37;
  }
  v16->_useShortBanner = a7;
  [(GKNotificationBannerView *)v16 setDuration:3.0];
  v18 = [MEMORY[0x1E4F639F8] textStyle];
  if (GKIsXRUIIdiom())
  {
    id v51 = v14;
    id v19 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [MEMORY[0x1E4FB1618] blackColor];
    id v50 = a5;
    id v20 = v15;
    id v21 = v13;
    id v22 = v12;
    v24 = v23 = v18;
    id v25 = [v24 colorWithAlphaComponent:0.5];
    uint64_t v26 = [v25 CGColor];
    v27 = [v19 layer];
    [v27 setBackgroundColor:v26];

    v18 = v23;
    id v12 = v22;
    id v13 = v21;
    id v15 = v20;
    a5 = v50;
    if ([(GKNotificationBannerView *)v17 useShortBanner]) {
      double v28 = 13.0;
    }
    else {
      double v28 = 24.0;
    }
    v29 = [v19 layer];
    [v29 setCornerRadius:v28];

    v30 = [v19 layer];
    [v30 setContinuousCorners:1];

    [(GKNotificationBannerView *)v17 insertSubview:v19 atIndex:0];
    [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
    [MEMORY[0x1E4F28DC8] _gkInstallEdgeConstraintsForView:v19 containedWithinParentView:v17];

    id v14 = v51;
    if (!v13) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  [(GKNotificationBannerView *)v17 createBackdropViewWithBlurStyle:17];
  if (v13)
  {
LABEL_9:
    v31 = objc_alloc_init(GKDashboardPlayerPhotoView);
    playerAvatarView = v17->_playerAvatarView;
    v17->_playerAvatarView = v31;

    [(GKDashboardPlayerPhotoView *)v17->_playerAvatarView setPlayer:v13];
    [(GKNotificationBannerView *)v17 addSubview:v17->_playerAvatarView];
  }
LABEL_10:
  if (v14)
  {
    objc_storeStrong((id *)&v17->_leadingAccessoryView, a5);
    [(UIView *)v17->_leadingAccessoryView setAccessibilityIdentifier:@"GameCenter.notificationBanner.image"];
    [(GKNotificationBannerView *)v17 addSubview:v17->_leadingAccessoryView];
  }
  if (v12) {
    [(GKNotificationBannerView *)v17 createTitleLabel:v12 withTextStyle:v18];
  }
  if (v15) {
    [(GKNotificationBannerView *)v17 createMessageLabel:v15 withTextStyle:v18];
  }
  [(GKNotificationBannerView *)v17 setAccessibilityIdentifier:@"UIA.GameCenter.GKNotificationBannerView"];
  [(UILabel *)v17->_titleLabel sizeToFit];
  [(UILabel *)v17->_messageLabel sizeToFit];
  titleLabel = v17->_titleLabel;
  if (titleLabel)
  {
    [(UILabel *)titleLabel frame];
    double v35 = v34;
  }
  else
  {
    double v35 = 0.0;
  }
  messageLabel = v17->_messageLabel;
  if (messageLabel)
  {
    [(UILabel *)messageLabel frame];
    if (v35 < v37) {
      double v35 = v37;
    }
  }
  if ([(GKNotificationBannerView *)v17 useShortBanner]) {
    double v38 = 15.0;
  }
  else {
    double v38 = 30.0;
  }
  BOOL v39 = [(GKNotificationBannerView *)v17 useShortBanner];
  double v40 = 42.0;
  if (v39) {
    double v40 = 24.0;
  }
  double v41 = v38 + v40;
  BOOL v42 = [(GKNotificationBannerView *)v17 useShortBanner];
  double v43 = 20.0;
  if (v42) {
    double v43 = 8.0;
  }
  double v44 = v35 + v41 + v43;
  if ([(GKNotificationBannerView *)v17 useShortBanner]) {
    double v45 = 15.0;
  }
  else {
    double v45 = 30.0;
  }
  double v46 = v45 + v44;
  v17->_preferredBannerWidth = v46;
  BOOL v47 = [(GKNotificationBannerView *)v17 useShortBanner];
  double v48 = 282.0;
  if (v47) {
    double v48 = 260.0;
  }
  if (v46 >= v48) {
    double v48 = v46;
  }
  v17->_preferredBannerWidth = v48;

LABEL_37:
  return v17;
}

- (GKNotificationBannerView)initWithTitle:(id)a3 image:(id)a4 message:(id)a5 useShortBanner:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = (objc_class *)MEMORY[0x1E4FB1838];
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = (void *)[[v10 alloc] initWithImage:v12];

  id v15 = [MEMORY[0x1E4FB1618] clearColor];
  [v14 setBackgroundColor:v15];

  [v14 setContentMode:1];
  [v14 setClipsToBounds:1];
  v16 = [(GKNotificationBannerView *)self initWithTitle:v13 player:0 leadingAccessoryView:v14 message:v11 useShortBanner:v6];

  return v16;
}

- (void)startLoadingPlayerAvatar
{
  double v3 = [GKDashboardPlayerPhotoView alloc];
  objc_super v4 = -[GKDashboardPlayerPhotoView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(GKNotificationBannerView *)self setPlayerAvatarView:v4];

  objc_initWeak(&location, self);
  double v5 = [(GKNotificationBannerView *)self playerAvatarView];
  BOOL v6 = [MEMORY[0x1E4F63760] local];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__GKNotificationBannerView_startLoadingPlayerAvatar__block_invoke;
  v7[3] = &unk_1E5F634E8;
  objc_copyWeak(&v8, &location);
  [v5 setPlayer:v6 completionHandler:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __52__GKNotificationBannerView_startLoadingPlayerAvatar__block_invoke(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 32));
  id v1 = objc_loadWeakRetained(&to);
  int v2 = [v1 canTransitionToPlayerAvatar];

  id v3 = objc_loadWeakRetained(&to);
  objc_super v4 = v3;
  if (v2) {
    [v3 transitionToPlayerAvatar];
  }
  else {
    [v3 setCanTransitionToPlayerAvatar:1];
  }

  objc_destroyWeak(&to);
}

- (void)transitionToPlayerAvatar
{
  id v3 = [(GKNotificationBannerView *)self playerAvatarView];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v4 = [(GKNotificationBannerView *)self playerAvatarView];
  double v5 = [v4 layer];
  [v5 setOpacity:0.0];

  BOOL v6 = [(GKNotificationBannerView *)self playerAvatarView];
  [(GKNotificationBannerView *)self addSubview:v6];

  id v7 = [(GKNotificationBannerView *)self leadingAccessoryView];
  id v8 = [(GKNotificationBannerView *)self playerAvatarView];
  v9 = [v8 centerXAnchor];
  id v10 = [v7 centerXAnchor];
  id v11 = [v9 constraintEqualToAnchor:v10 constant:0.0];
  [v11 setActive:1];

  id v12 = [(GKNotificationBannerView *)self playerAvatarView];
  id v13 = [v12 centerYAnchor];
  id v14 = [v7 centerYAnchor];
  id v15 = [v13 constraintEqualToAnchor:v14 constant:0.0];
  [v15 setActive:1];

  v16 = [(GKNotificationBannerView *)self playerAvatarView];
  v17 = [v16 widthAnchor];
  v18 = [v7 widthAnchor];
  id v19 = [v17 constraintEqualToAnchor:v18 constant:0.0];
  [v19 setActive:1];

  id v20 = [(GKNotificationBannerView *)self playerAvatarView];
  id v21 = [v20 heightAnchor];
  id v22 = [v7 widthAnchor];
  v23 = [v21 constraintEqualToAnchor:v22 constant:0.0];
  [v23 setActive:1];

  [MEMORY[0x1E4F39CF8] begin];
  v24 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform"];
  [v24 setRemovedOnCompletion:0];
  long long v25 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  v42[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  v42[5] = v25;
  long long v26 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  v42[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  v42[7] = v26;
  long long v27 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  v42[0] = *MEMORY[0x1E4F39B10];
  v42[1] = v27;
  long long v28 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  v42[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  v42[3] = v28;
  v29 = [MEMORY[0x1E4F29238] valueWithCATransform3D:v42];
  [v24 setFromValue:v29];

  v30 = (void *)MEMORY[0x1E4F29238];
  CATransform3DMakeScale(&v41, 0.01, 0.01, 1.0);
  v31 = [v30 valueWithCATransform3D:&v41];
  [v24 setToValue:v31];

  [v24 setDuration:0.12];
  [v24 setRepeatCount:0.0];
  [v24 setAutoreverses:0];
  [v24 setFillMode:*MEMORY[0x1E4F39FA0]];
  v32 = (void *)MEMORY[0x1E4F39CF8];
  uint64_t v35 = MEMORY[0x1E4F143A8];
  uint64_t v36 = 3221225472;
  double v37 = __52__GKNotificationBannerView_transitionToPlayerAvatar__block_invoke;
  double v38 = &unk_1E5F63350;
  id v39 = v7;
  double v40 = self;
  id v33 = v7;
  [v32 setCompletionBlock:&v35];
  double v34 = objc_msgSend(v33, "layer", v35, v36, v37, v38);
  [v34 addAnimation:v24 forKey:@"transform"];

  [MEMORY[0x1E4F39CF8] commit];
}

void __52__GKNotificationBannerView_transitionToPlayerAvatar__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setHidden:1];
  [MEMORY[0x1E4F39CF8] begin];
  CATransform3DMakeScale(&v23, 0.01, 0.01, 1.0);
  int v2 = [*(id *)(a1 + 40) playerAvatarView];
  id v3 = [v2 layer];
  CATransform3D v22 = v23;
  [v3 setTransform:&v22];

  objc_super v4 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform"];
  double v5 = (void *)MEMORY[0x1E4F29238];
  BOOL v6 = [*(id *)(a1 + 40) playerAvatarView];
  id v7 = [v6 layer];
  id v8 = v7;
  if (v7) {
    [v7 transform];
  }
  else {
    memset(v21, 0, sizeof(v21));
  }
  v9 = [v5 valueWithCATransform3D:v21];
  [v4 setFromValue:v9];

  long long v10 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  v20[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  v20[5] = v10;
  long long v11 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  v20[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  v20[7] = v11;
  long long v12 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  v20[0] = *MEMORY[0x1E4F39B10];
  v20[1] = v12;
  long long v13 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  v20[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  v20[3] = v13;
  id v14 = [MEMORY[0x1E4F29238] valueWithCATransform3D:v20];
  [v4 setToValue:v14];

  [v4 setMass:1.0];
  [v4 setStiffness:800.0];
  [v4 setDamping:20.0];
  [v4 setBeginTime:CACurrentMediaTime()];
  [v4 settlingDuration];
  objc_msgSend(v4, "setDuration:");
  [v4 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v4 setRemovedOnCompletion:0];
  id v15 = [*(id *)(a1 + 40) playerAvatarView];
  v16 = [v15 layer];
  [v16 addAnimation:v4 forKey:@"transform"];

  [MEMORY[0x1E4F39CF8] commit];
  v17 = [*(id *)(a1 + 40) playerAvatarView];
  v18 = [v17 layer];
  LODWORD(v19) = 1.0;
  [v18 setOpacity:v19];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)GKNotificationBannerView;
  [(GKNotificationBannerView *)&v4 dealloc];
}

- (void)layoutSubviews
{
  v114.receiver = self;
  v114.super_class = (Class)GKNotificationBannerView;
  [(GKNotificationBannerView *)&v114 layoutSubviews];
  [(GKNotificationBannerView *)self bounds];
  double v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  long long v11 = [(GKNotificationBannerView *)self leadingAccessoryView];
  if (v11) {
    [(GKNotificationBannerView *)self leadingAccessoryView];
  }
  else {
  long long v12 = [(GKNotificationBannerView *)self playerAvatarView];
  }

  double v13 = 8.0;
  double v14 = 8.0;
  if (![(GKNotificationBannerView *)self useShortBanner])
  {
    id v15 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v16 = [v15 userInterfaceIdiom];

    if (v16 != 1 || (double v14 = 12.0, *MEMORY[0x1E4F63830]) && !*MEMORY[0x1E4F63A38]) {
      double v14 = 11.0;
    }
  }
  v115.origin.double x = v4;
  CGFloat v108 = v6;
  double v110 = v8;
  v115.origin.double y = v6;
  v115.size.double width = v8;
  v115.size.double height = v10;
  double MidY = CGRectGetMidY(v115);
  BOOL v18 = [(GKNotificationBannerView *)self useShortBanner];
  double v19 = 21.0;
  if (v18) {
    double v19 = 12.0;
  }
  double v20 = MidY - v19;
  if ([(GKNotificationBannerView *)self useShortBanner]) {
    double v21 = 24.0;
  }
  else {
    double v21 = 42.0;
  }
  if ([(GKNotificationBannerView *)self useShortBanner]) {
    double v22 = 24.0;
  }
  else {
    double v22 = 42.0;
  }
  objc_msgSend(v12, "setFrame:", v14, v20, v21, v22);
  [v12 frame];
  double MaxX = CGRectGetMaxX(v116);
  BOOL v24 = [(GKNotificationBannerView *)self useShortBanner];
  double v25 = 20.0;
  if (v24) {
    double v25 = 8.0;
  }
  double v26 = MaxX + v25;
  if (![(GKNotificationBannerView *)self useShortBanner])
  {
    long long v27 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v28 = [v27 userInterfaceIdiom];

    if (v28 != 1 || (double v13 = 12.0, *MEMORY[0x1E4F63830]) && !*MEMORY[0x1E4F63A38]) {
      double v13 = 11.0;
    }
  }
  double v29 = v4 + v26;
  double v30 = v109 + 0.0;
  double v31 = v26 + v13;
  remainder.origin.double x = v29;
  remainder.origin.double y = v109 + 0.0;
  double v32 = v8;
  double v33 = v8 - v31;
  remainder.size.double width = v110 - v31;
  remainder.size.double height = v10;
  uint64_t v34 = [(GKNotificationBannerView *)self titleLabel];
  if (v34)
  {
    uint64_t v35 = (void *)v34;
    uint64_t v36 = [(GKNotificationBannerView *)self messageLabel];

    if (v36)
    {
      double v37 = [(GKNotificationBannerView *)self titleLabel];
      objc_msgSend(v37, "sizeThatFits:", v33, v10);
      double v39 = v38;
      double v41 = v40;

      BOOL v42 = [(GKNotificationBannerView *)self messageLabel];
      objc_msgSend(v42, "sizeThatFits:", v33, v10);
      double v44 = v43;
      double v46 = v45;

      double v48 = v30 + floor((v10 - (v41 + v46)) * 0.5);
      if (v39 >= v44) {
        double v49 = v39;
      }
      else {
        double v49 = v44;
      }
      if (v33 <= v49) {
        CGFloat v50 = v33;
      }
      else {
        CGFloat v50 = v49;
      }
      remainder.origin.double y = v48;
      remainder.size.double width = v50;
      remainder.size.double height = v41 + v46;
      memset(&slice, 0, sizeof(slice));
      memset(&v111, 0, sizeof(v111));
      double v51 = v29;
      double v47 = v41 + v46;
      CGRectDivide(*(CGRect *)(&v48 - 1), &slice, &remainder, v41, CGRectMinYEdge);
      CGRectDivide(remainder, &v111, &remainder, v46, CGRectMaxYEdge);
      double x = slice.origin.x;
      double y = slice.origin.y;
      double width = slice.size.width;
      double height = slice.size.height;
      v56 = [(GKNotificationBannerView *)self titleLabel];
      objc_msgSend(v56, "setFrame:", x, y, width, height);

      double v57 = v111.origin.x;
      double v58 = v111.origin.y;
      double v59 = v111.size.width;
      double v60 = v111.size.height;
      v61 = [(GKNotificationBannerView *)self messageLabel];
      objc_msgSend(v61, "setFrame:", v57, v58, v59, v60);

      double v62 = CGRectGetMaxX(slice);
      double v63 = CGRectGetMaxX(v111);
      if (v62 < v63) {
        double v62 = v63;
      }
      BOOL v64 = [(GKNotificationBannerView *)self useShortBanner];
      double v65 = 8.0;
      if (!v64)
      {
        v66 = objc_msgSend(MEMORY[0x1E4FB16C8], "currentDevice", 8.0);
        uint64_t v67 = [v66 userInterfaceIdiom];

        if (v67 != 1 || (double v65 = 12.0, *MEMORY[0x1E4F63830]) && !*MEMORY[0x1E4F63A38]) {
          double v65 = 11.0;
        }
      }
      double v68 = v62 + v65;
      double v32 = v110;
      goto LABEL_55;
    }
  }
  v69 = [(GKNotificationBannerView *)self titleLabel];

  if (v69)
  {
    v70 = [(GKNotificationBannerView *)self titleLabel];
    objc_msgSend(v70, "sizeThatFits:", v33, v10);
    double v72 = v71;

    if (v33 > v72) {
      double v33 = v72;
    }
    remainder.size.double width = v33;
    v73 = [(GKNotificationBannerView *)self titleLabel];
  }
  else
  {
    v74 = [(GKNotificationBannerView *)self messageLabel];

    if (!v74) {
      goto LABEL_49;
    }
    v75 = [(GKNotificationBannerView *)self messageLabel];
    objc_msgSend(v75, "sizeThatFits:", v33, v10);
    double v77 = v76;

    if (v33 > v77) {
      double v33 = v77;
    }
    remainder.size.double width = v33;
    v73 = [(GKNotificationBannerView *)self messageLabel];
  }
  v78 = v73;
  objc_msgSend(v73, "setFrame:", v29, v30, v33, v10);

LABEL_49:
  v117.origin.double x = v29;
  v117.origin.double y = v109 + 0.0;
  v117.size.double width = v33;
  v117.size.double height = v10;
  double v79 = CGRectGetMaxX(v117);
  BOOL v80 = [(GKNotificationBannerView *)self useShortBanner];
  double v81 = 8.0;
  if (!v80)
  {
    v82 = objc_msgSend(MEMORY[0x1E4FB16C8], "currentDevice", 8.0);
    uint64_t v83 = [v82 userInterfaceIdiom];

    if (v83 != 1 || (double v81 = 12.0, *MEMORY[0x1E4F63830]) && !*MEMORY[0x1E4F63A38]) {
      double v81 = 11.0;
    }
  }
  double v68 = v79 + v81;
LABEL_55:
  if (v68 != 0.0)
  {
    double v84 = (v32 - v68) * 0.5;
    [v12 frame];
    [v12 setFrame:v84 + v85];
    v86 = [(GKNotificationBannerView *)self titleLabel];

    if (v86)
    {
      v87 = [(GKNotificationBannerView *)self titleLabel];
      [v87 frame];
      double v89 = v88;
      double v91 = v90;
      double v93 = v92;
      double v95 = v94;

      v96 = [(GKNotificationBannerView *)self titleLabel];
      objc_msgSend(v96, "setFrame:", v84 + v89, v91, v93, v95);
    }
    v97 = [(GKNotificationBannerView *)self messageLabel];

    if (v97)
    {
      v98 = [(GKNotificationBannerView *)self messageLabel];
      [v98 frame];
      double v100 = v99;
      double v102 = v101;
      double v104 = v103;
      double v106 = v105;

      v107 = [(GKNotificationBannerView *)self messageLabel];
      objc_msgSend(v107, "setFrame:", v84 + v100, v102, v104, v106);
    }
  }
}

- (void)showPlayerAvatarAnimationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(GKNotificationBannerView *)self startLoadingPlayerAvatar];
  [(GKNotificationBannerView *)self setCompletionHandler:v4];

  +[GKNotificationBannerWindow enqueBanner:self];
}

- (void)showWithCompletionHandler:(id)a3
{
  [(GKNotificationBannerView *)self setCompletionHandler:a3];

  +[GKNotificationBannerWindow enqueBanner:self];
}

- (void)showWithTouchHandler:(id)a3
{
  [(GKNotificationBannerView *)self setTouchHandler:a3];

  +[GKNotificationBannerWindow enqueBanner:self];
}

- (void)hideBanner
{
  id v3 = [(GKNotificationBannerView *)self superview];
  [v3 _hideBanner:self quickly:1];
}

- (void)_wasTouched:(id)a3
{
  id v4 = [(GKNotificationBannerView *)self touchHandler];
  if (v4)
  {
    double v5 = v4;
    v4[2]();
    [(GKNotificationBannerView *)self setTouchHandler:0];
    id v4 = v5;
  }
}

- (void)callCompletionHandler
{
  id v3 = [(GKNotificationBannerView *)self completionHandler];
  if (v3) {
    v3[2]();
  }
  [(GKNotificationBannerView *)self setCompletionHandler:0];
  [(GKNotificationBannerView *)self setTouchHandler:0];
}

- (void)fadeInWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(GKNotificationBannerView *)self setAlpha:0.0];
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v13.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v13.c = v5;
  *(_OWORD *)&v13.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  CGAffineTransformScale(&v14, &v13, 0.93, 0.93);
  CGAffineTransform v12 = v14;
  [(GKNotificationBannerView *)self setTransform:&v12];
  CGFloat v6 = [(GKNotificationBannerView *)self layer];
  [v6 setAllowsGroupOpacity:0];

  double v7 = (void *)MEMORY[0x1E4FB1EB0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__GKNotificationBannerView_fadeInWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E5F62EB0;
  v11[4] = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__GKNotificationBannerView_fadeInWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E5F64428;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 animateWithDuration:38 delay:v11 options:v9 animations:0.5 completion:0.0];
}

uint64_t __56__GKNotificationBannerView_fadeInWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v6.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v6.c = v2;
  *(_OWORD *)&v6.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  CGAffineTransformScale(&v7, &v6, 1.0, 1.0);
  id v3 = *(void **)(a1 + 32);
  CGAffineTransform v5 = v7;
  return [v3 setTransform:&v5];
}

uint64_t __56__GKNotificationBannerView_fadeInWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) layer];
  [v2 setAllowsGroupOpacity:1];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)fadeOutQuickly:(BOOL)a3 withCompletionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  CGAffineTransform v7 = [(GKNotificationBannerView *)self layer];
  [v7 setAllowsGroupOpacity:0];

  id v8 = (void *)MEMORY[0x1E4FB1EB0];
  if (v4) {
    double v9 = 0.1;
  }
  else {
    double v9 = 0.5;
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__GKNotificationBannerView_fadeOutQuickly_withCompletionHandler___block_invoke;
  v13[3] = &unk_1E5F62EB0;
  v13[4] = self;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__GKNotificationBannerView_fadeOutQuickly_withCompletionHandler___block_invoke_2;
  v11[3] = &unk_1E5F64428;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v8 animateWithDuration:38 delay:v13 options:v11 animations:v9 completion:0.0];
}

uint64_t __65__GKNotificationBannerView_fadeOutQuickly_withCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v6.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v6.c = v2;
  *(_OWORD *)&v6.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  CGAffineTransformScale(&v7, &v6, 0.93, 0.93);
  id v3 = *(void **)(a1 + 32);
  CGAffineTransform v5 = v7;
  return [v3 setTransform:&v5];
}

uint64_t __65__GKNotificationBannerView_fadeOutQuickly_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) layer];
  [v2 setAllowsGroupOpacity:1];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    BOOL v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (UIView)leadingAccessoryView
{
  return self->_leadingAccessoryView;
}

- (void)setLeadingAccessoryView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)touchHandler
{
  return self->_touchHandler;
}

- (void)setTouchHandler:(id)a3
{
}

- (GKDashboardPlayerPhotoView)playerAvatarView
{
  return self->_playerAvatarView;
}

- (void)setPlayerAvatarView:(id)a3
{
}

- (BOOL)canTransitionToPlayerAvatar
{
  return self->_canTransitionToPlayerAvatar;
}

- (void)setCanTransitionToPlayerAvatar:(BOOL)a3
{
  self->_canTransitionToPlayerAvatar = a3;
}

- (UILabel)actionLabel
{
  return self->_actionLabel;
}

- (void)setActionLabel:(id)a3
{
}

- (double)preferredBannerWidth
{
  return self->_preferredBannerWidth;
}

- (BOOL)useShortBanner
{
  return self->_useShortBanner;
}

- (void)setUseShortBanner:(BOOL)a3
{
  self->_useShortBanner = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionLabel, 0);
  objc_storeStrong((id *)&self->_playerAvatarView, 0);
  objc_storeStrong(&self->_touchHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_leadingAccessoryView, 0);
}

@end