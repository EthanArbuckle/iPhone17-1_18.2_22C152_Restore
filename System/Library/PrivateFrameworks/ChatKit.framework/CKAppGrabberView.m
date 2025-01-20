@interface CKAppGrabberView
+ (double)compactRoundedCornerRadius;
+ (double)roundedCornerRadius;
- (BOOL)roundsTopCorners;
- (BOOL)showsAppTitle;
- (BOOL)showsGrabberPill;
- (CKAppGrabberView)initWithFrame:(CGRect)a3;
- (CKAppGrabberViewDelegate)delegate;
- (UIButton)closeButton;
- (double)chevronMaxYInView:(id)a3;
- (double)chevronMaxYOffset;
- (double)visualOriginYInView:(id)a3;
- (double)visualOriginYOffset;
- (id)headerView;
- (id)iconImageView;
- (void)closeButtonTapped:(id)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setRoundsTopCorners:(BOOL)a3;
- (void)setShowsAppTitle:(BOOL)a3;
- (void)setShowsGrabberPill:(BOOL)a3;
- (void)updateAppTitle:(id)a3 icon:(id)a4 appIdentifier:(id)a5;
- (void)updateHeaderFrame:(BOOL)a3;
- (void)updateIconImageView:(id)a3;
@end

@implementation CKAppGrabberView

- (CKAppGrabberView)initWithFrame:(CGRect)a3
{
  v49.receiver = self;
  v49.super_class = (Class)CKAppGrabberView;
  v3 = -[CKAppGrabberView initWithFrame:](&v49, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CKAppGrabberView *)v3 setBackgroundColor:0];
    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    headerView = v4->_headerView;
    v4->_headerView = v5;

    v7 = +[CKUIBehavior sharedBehaviors];
    v8 = [v7 theme];
    v9 = [v8 browserSwitcherBorderColor];

    if (v9)
    {
      v10 = [(UIView *)v4->_headerView layer];
      v11 = +[CKUIBehavior sharedBehaviors];
      v12 = [v11 theme];
      id v13 = [v12 browserSwitcherBorderColor];
      objc_msgSend(v10, "setBorderColor:", objc_msgSend(v13, "CGColor"));

      v14 = [(UIView *)v4->_headerView layer];
      LODWORD(v15) = 1041865114;
      [v14 setShadowOpacity:v15];

      v16 = [(UIView *)v4->_headerView layer];
      [v16 setShadowRadius:1.0];

      v17 = [(UIView *)v4->_headerView layer];
      objc_msgSend(v17, "setShadowOffset:", 0.0, -1.0);

      v18 = [(UIView *)v4->_headerView layer];
      [v18 setShadowPathIsBounds:1];
    }
    [(CKAppGrabberView *)v4 updateHeaderFrame:1];
    v19 = v4->_headerView;
    v20 = +[CKUIBehavior sharedBehaviors];
    v21 = [v20 theme];
    v22 = [v21 appGrabberBackgroundColor];
    [(UIView *)v19 setBackgroundColor:v22];

    [(UIView *)v4->_headerView setAutoresizingMask:10];
    [(UIView *)v4->_headerView setClipsToBounds:1];
    v23 = [(UIView *)v4->_headerView layer];
    [v23 setMaskedCorners:3];

    [(CKAppGrabberView *)v4 addSubview:v4->_headerView];
    v24 = (_UIGrabber *)objc_alloc_init(MEMORY[0x1E4F43170]);
    chevronView = v4->_chevronView;
    v4->_chevronView = v24;

    [(_UIGrabber *)v4->_chevronView sizeToFit];
    [(UIView *)v4->_headerView addSubview:v4->_chevronView];
    uint64_t v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", 0.0, 0.0, 40.0, 30.0);
    iconImageView = v4->_iconImageView;
    v4->_iconImageView = (UIImageView *)v26;

    [(UIView *)v4->_headerView addSubview:v4->_iconImageView];
    v28 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4F42AA0]);
    iconOutlineView = v4->_iconOutlineView;
    v4->_iconOutlineView = v28;

    v30 = v4->_iconOutlineView;
    v31 = [MEMORY[0x1E4F428B8] whiteColor];
    v32 = [v31 colorWithAlphaComponent:0.25];
    [(UIImageView *)v30 setTintColor:v32];

    v33 = (void *)MEMORY[0x1E4F42A80];
    v34 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v35 = [v33 imageNamed:@"BorderPath" inBundle:v34];
    v36 = [v35 imageWithRenderingMode:2];

    [(UIImageView *)v4->_iconOutlineView setImage:v36];
    [(UIView *)v4->_headerView addSubview:v4->_iconOutlineView];
    v37 = +[CKUIBehavior sharedBehaviors];
    v38 = [v37 appLabelFont];

    v39 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    pluginTitleLabel = v4->_pluginTitleLabel;
    v4->_pluginTitleLabel = v39;

    [(UILabel *)v4->_pluginTitleLabel setNumberOfLines:1];
    [(UILabel *)v4->_pluginTitleLabel setAutoresizingMask:34];
    [(UILabel *)v4->_pluginTitleLabel setFont:v38];
    v41 = v4->_pluginTitleLabel;
    v42 = +[CKUIBehavior sharedBehaviors];
    v43 = [v42 theme];
    v44 = [v43 appGrabberTitleColor];
    [(UILabel *)v41 setTextColor:v44];

    [(UILabel *)v4->_pluginTitleLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v4->_pluginTitleLabel setBaselineAdjustment:1];
    [(UIView *)v4->_headerView addSubview:v4->_pluginTitleLabel];
    uint64_t v45 = +[CKAppGrabberCloseButton buttonWithType:7];
    closeButton = v4->_closeButton;
    v4->_closeButton = (UIButton *)v45;

    [(UIButton *)v4->_closeButton sizeToFit];
    [(UIButton *)v4->_closeButton addTarget:v4 action:sel_closeButtonTapped_ forEvents:64];
    [(UIView *)v4->_headerView addSubview:v4->_closeButton];
    [(CKAppGrabberView *)v4 setAccessibilityIdentifier:@"collapseButtonIdentifier"];
    [(CKAppGrabberView *)v4 setShowsAppTitle:0];
    [(CKAppGrabberView *)v4 setRoundsTopCorners:0];
    v47 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v47 addObserver:v4 selector:sel_updateIconImageView_ name:*MEMORY[0x1E4F6B870] object:0];
  }
  return v4;
}

- (void)layoutSubviews
{
  v63.receiver = self;
  v63.super_class = (Class)CKAppGrabberView;
  [(CKAppGrabberView *)&v63 layoutSubviews];
  [(_UIGrabber *)self->_chevronView frame];
  double v4 = v3;
  double v6 = v5;
  [(UIView *)self->_headerView bounds];
  double v8 = v7;
  double v10 = v9;
  if (CKMainScreenScale_once_78 != -1) {
    dispatch_once(&CKMainScreenScale_once_78, &__block_literal_global_196);
  }
  double v11 = *(double *)&CKMainScreenScale_sMainScreenScale_78;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_78 == 0.0) {
    double v11 = 1.0;
  }
  -[_UIGrabber setFrame:](self->_chevronView, "setFrame:", 1.0 / v11 * (v8 * v11 + floor((v10 * v11 - v4 * v11) * 0.5)), *MEMORY[0x1E4F44178], v4 * v11 * (1.0 / v11), v6 * v11 * (1.0 / v11));
  [(UIView *)self->_headerView bounds];
  CGRect v65 = CGRectInset(v64, 16.0, 0.0);
  CGFloat x = v65.origin.x;
  CGFloat y = v65.origin.y;
  CGFloat width = v65.size.width;
  v14 = +[CKUIBehavior sharedBehaviors];
  [v14 browserSwitcherExpandedGrabberHeaderHeight];
  double v16 = v15;

  [(UIButton *)self->_closeButton frame];
  CGFloat v18 = v17;
  CGFloat v59 = v20;
  CGFloat v60 = v19;
  double v62 = v21;
  v22 = [(UIImageView *)self->_iconImageView image];
  if (v22)
  {
    v23 = [(UIImageView *)self->_iconImageView image];
    [v23 size];
    double v25 = v24;
    double v27 = v26;
  }
  else
  {
    double v25 = 40.0;
    double v27 = 30.0;
  }

  BOOL v28 = v25 == v27;
  if (v25 == v27) {
    double v29 = 36.0;
  }
  else {
    double v29 = 30.0;
  }
  if (v28) {
    double v30 = 36.0;
  }
  else {
    double v30 = 40.0;
  }
  v31 = (double *)MEMORY[0x1E4F1DAD8];
  double v32 = *(double *)(MEMORY[0x1E4F1DAD8] + 8) + v29 * -0.5;
  [(UILabel *)self->_pluginTitleLabel frame];
  double v57 = v33;
  CGFloat v56 = v30;
  CGFloat rect = v32;
  if ([(CKAppGrabberView *)self _shouldReverseLayoutDirection])
  {
    CGFloat v34 = *v31 + v30 * -0.5;
    v66.origin.CGFloat x = x;
    v66.origin.CGFloat y = y;
    v66.size.CGFloat width = width;
    v66.size.height = v16;
    double MinX = CGRectGetMinX(v66);
    v67.origin.CGFloat x = x;
    v67.origin.CGFloat y = y;
    v67.size.CGFloat width = width;
    v67.size.height = v16;
    double MaxX = CGRectGetMaxX(v67);
    v68.origin.CGFloat x = v34;
    v68.origin.CGFloat y = v32;
    v68.size.CGFloat width = v30;
    v68.size.height = v29;
    double v36 = MaxX - CGRectGetWidth(v68);
    if (CKMainScreenScale_once_78 != -1) {
      dispatch_once(&CKMainScreenScale_once_78, &__block_literal_global_196);
    }
    double v37 = *(double *)&CKMainScreenScale_sMainScreenScale_78;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_78 == 0.0) {
      double v37 = 1.0;
    }
    double v38 = floor(v36 * v37) / v37;
    v69.origin.CGFloat x = MinX;
    v69.size.height = v62;
    double v39 = v59;
    v69.origin.CGFloat y = v60;
    v69.size.CGFloat width = v59;
    double v55 = CGRectGetMaxX(v69);
    v70.origin.CGFloat x = x;
    double v40 = y;
    v70.origin.CGFloat y = y;
    v70.size.CGFloat width = width;
    v70.size.height = v16;
    double v41 = CGRectGetWidth(v70);
    v42 = [(UIImageView *)self->_iconImageView image];

    if (v42)
    {
      v71.origin.CGFloat x = v38;
      v71.origin.CGFloat y = rect;
      double v43 = v56;
      v71.size.CGFloat width = v56;
      v71.size.height = v29;
      double v41 = v41 - (CGRectGetWidth(v71) + 8.0);
      goto LABEL_29;
    }
  }
  else
  {
    v72.origin.CGFloat x = x;
    double v40 = y;
    v72.origin.CGFloat y = y;
    v72.size.CGFloat width = width;
    v72.size.height = v16;
    double v44 = CGRectGetMaxX(v72);
    v73.origin.CGFloat x = v18;
    v73.size.CGFloat width = v59;
    v73.origin.CGFloat y = v60;
    v73.size.height = v62;
    double v45 = v44 - CGRectGetWidth(v73);
    if (CKMainScreenScale_once_78 != -1) {
      dispatch_once(&CKMainScreenScale_once_78, &__block_literal_global_196);
    }
    double v46 = *(double *)&CKMainScreenScale_sMainScreenScale_78;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_78 == 0.0) {
      double v46 = 1.0;
    }
    double MinX = floor(v45 * v46) / v46;
    v74.origin.CGFloat x = x;
    v74.origin.CGFloat y = y;
    v74.size.CGFloat width = width;
    v74.size.height = v16;
    double v38 = CGRectGetMinX(v74);
    v75.origin.CGFloat x = x;
    v75.origin.CGFloat y = y;
    v75.size.CGFloat width = width;
    v75.size.height = v16;
    double v47 = CGRectGetMinX(v75);
    v76.origin.CGFloat x = x;
    v76.origin.CGFloat y = y;
    v76.size.CGFloat width = width;
    v76.size.height = v16;
    double v41 = CGRectGetWidth(v76);
    v48 = [(UIImageView *)self->_iconImageView image];

    if (v48)
    {
      v77.origin.CGFloat x = v38;
      v77.origin.CGFloat y = rect;
      double v43 = v56;
      v77.size.CGFloat width = v56;
      v77.size.height = v29;
      CGFloat v49 = CGRectGetWidth(v77) + 8.0;
      double v55 = v47 + v49;
      double v41 = v41 - v49;
      double v39 = v59;
      goto LABEL_29;
    }
    v78.origin.CGFloat x = x;
    v78.origin.CGFloat y = y;
    v78.size.CGFloat width = width;
    v78.size.height = v16;
    double v55 = CGRectGetMinX(v78);
    double v39 = v59;
  }
  double v43 = v56;
LABEL_29:
  v79.origin.CGFloat y = v60;
  v79.origin.CGFloat x = MinX;
  v79.size.CGFloat width = v39;
  v79.size.height = v62;
  double v50 = CGRectGetWidth(v79);
  if (CKMainScreenScale_once_78 != -1) {
    dispatch_once(&CKMainScreenScale_once_78, &__block_literal_global_196);
  }
  double v51 = *(double *)&CKMainScreenScale_sMainScreenScale_78;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_78 == 0.0) {
    double v51 = 1.0;
  }
  -[UIImageView setFrame:](self->_iconImageView, "setFrame:", v38 * v51 * (1.0 / v51), 1.0 / v51 * (v40 * v51 + floor((v16 * v51 - v29 * v51) * 0.5)), v43 * v51 * (1.0 / v51), v29 * v51 * (1.0 / v51));
  [(UIImageView *)self->_iconImageView frame];
  -[UIImageView setFrame:](self->_iconOutlineView, "setFrame:");
  if (CKMainScreenScale_once_78 != -1) {
    dispatch_once(&CKMainScreenScale_once_78, &__block_literal_global_196);
  }
  double v52 = *(double *)&CKMainScreenScale_sMainScreenScale_78;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_78 == 0.0) {
    double v52 = 1.0;
  }
  -[UIButton setFrame:](self->_closeButton, "setFrame:", MinX * v52 * (1.0 / v52), 1.0 / v52 * (v40 * v52 + floor((v16 * v52 - v62 * v52) * 0.5)), v39 * v52 * (1.0 / v52), v62 * v52 * (1.0 / v52));
  if (CKMainScreenScale_once_78 != -1) {
    dispatch_once(&CKMainScreenScale_once_78, &__block_literal_global_196);
  }
  double v53 = *(double *)&CKMainScreenScale_sMainScreenScale_78;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_78 == 0.0) {
    double v53 = 1.0;
  }
  -[UILabel setFrame:](self->_pluginTitleLabel, "setFrame:", v55 * v53 * (1.0 / v53), 1.0 / v53 * (v40 * v53 + floor((v16 * v53 - v57 * v53) * 0.5)), (v41 - (v50 + 8.0)) * v53 * (1.0 / v53), v57 * v53 * (1.0 / v53));
}

- (void)updateIconImageView:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__CKAppGrabberView_updateIconImageView___block_invoke;
  v6[3] = &unk_1E5620AF8;
  id v7 = v4;
  double v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __40__CKAppGrabberView_updateIconImageView___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) userInfo];
  id v6 = [v2 valueForKey:@"IMBalloonPluginIdentifierKey"];

  double v3 = [*(id *)(a1 + 32) userInfo];
  id v4 = [v3 valueForKey:@"UpdatedIMBalloonPluginIconKey"];

  if ([v6 isEqualToString:*(void *)(*(void *)(a1 + 40) + 464)])
  {
    id v5 = [*(id *)(*(void *)(a1 + 40) + 408) image];

    if (v4 != v5)
    {
      [*(id *)(*(void *)(a1 + 40) + 408) setImage:v4];
      [*(id *)(a1 + 40) setNeedsLayout];
    }
  }
}

- (BOOL)showsGrabberPill
{
  [(_UIGrabber *)self->_chevronView alpha];
  return v2 == 1.0;
}

- (void)setShowsGrabberPill:(BOOL)a3
{
  double v3 = 0.0;
  if (a3) {
    double v3 = 1.0;
  }
  [(_UIGrabber *)self->_chevronView setAlpha:v3];
}

- (double)visualOriginYOffset
{
  [(UIView *)self->_headerView frame];

  return CGRectGetMinY(*(CGRect *)&v2);
}

- (double)chevronMaxYOffset
{
  [(_UIGrabber *)self->_chevronView frame];
  -[CKAppGrabberView convertRect:fromView:](self, "convertRect:fromView:", self->_headerView);

  return CGRectGetMaxY(*(CGRect *)&v3);
}

- (double)visualOriginYInView:(id)a3
{
  headerView = self->_headerView;
  id v5 = a3;
  [(UIView *)headerView frame];
  objc_msgSend(v5, "convertRect:fromView:", self);
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;

  uint64_t v14 = v7;
  uint64_t v15 = v9;
  uint64_t v16 = v11;
  uint64_t v17 = v13;

  return CGRectGetMinY(*(CGRect *)&v14);
}

- (double)chevronMaxYInView:(id)a3
{
  chevronView = self->_chevronView;
  id v5 = a3;
  [(_UIGrabber *)chevronView frame];
  objc_msgSend(v5, "convertRect:fromView:", self->_headerView);
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;

  uint64_t v14 = v7;
  uint64_t v15 = v9;
  uint64_t v16 = v11;
  uint64_t v17 = v13;

  return CGRectGetMaxY(*(CGRect *)&v14);
}

- (void)updateAppTitle:(id)a3 icon:(id)a4 appIdentifier:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(UILabel *)self->_pluginTitleLabel text];
  if (([v10 isEqualToString:v12] & 1) == 0)
  {

    goto LABEL_5;
  }
  id v11 = [(UIImageView *)self->_iconImageView image];

  if (v11 != v8)
  {
LABEL_5:
    [(UILabel *)self->_pluginTitleLabel setText:v12];
    [(UILabel *)self->_pluginTitleLabel sizeToFit];
    objc_storeStrong((id *)&self->_appIdentifier, a5);
    [(UIImageView *)self->_iconImageView setImage:v8];
    [(CKAppGrabberView *)self setNeedsLayout];
  }
}

- (void)closeButtonTapped:(id)a3
{
  id v4 = [(CKAppGrabberView *)self delegate];
  [v4 appGrabberViewCloseButtonTapped:self];
}

+ (double)roundedCornerRadius
{
  return *MEMORY[0x1E4F44170];
}

+ (double)compactRoundedCornerRadius
{
  if (!CKIsRunningInMessages()) {
    return *MEMORY[0x1E4F44170];
  }
  uint64_t v2 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  double result = 0.0;
  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    return *MEMORY[0x1E4F44170];
  }
  return result;
}

- (void)setRoundsTopCorners:(BOOL)a3
{
  BOOL v3 = a3;
  self->_roundsTopCorners = a3;
  id v5 = objc_opt_class();
  if (v3) {
    [v5 roundedCornerRadius];
  }
  else {
    [v5 compactRoundedCornerRadius];
  }
  double v7 = v6;
  id v8 = [(UIView *)self->_headerView layer];
  [v8 setCornerRadius:v7];
}

- (void)setShowsAppTitle:(BOOL)a3
{
  BOOL v3 = a3;
  self->_showsAppTitle = a3;
  [(CKAppGrabberView *)self updateHeaderFrame:!a3];
  if (v3) {
    double v5 = 1.0;
  }
  else {
    double v5 = 0.0;
  }
  [(UIImageView *)self->_iconImageView setAlpha:v5];
  [(UILabel *)self->_pluginTitleLabel setAlpha:v5];
  [(UIButton *)self->_closeButton setAlpha:v5];
  double v6 = [(CKAppGrabberView *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceStyle];

  id v8 = [(UIImageView *)self->_iconImageView image];
  [v8 size];
  double v10 = v9;
  BOOL v12 = v11 == 30.0;

  BOOL v13 = v7 == 2 && v3;
  if (v10 != 40.0) {
    BOOL v13 = 0;
  }
  if (v13 && v12) {
    double v14 = v5;
  }
  else {
    double v14 = 0.0;
  }
  iconOutlineView = self->_iconOutlineView;

  [(UIImageView *)iconOutlineView setAlpha:v14];
}

- (void)updateHeaderFrame:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = +[CKUIBehavior sharedBehaviors];
  double v6 = v5;
  if (v3) {
    [v5 browserSwitcherCompactGrabberVisibleHeight];
  }
  else {
    [v5 browserSwitcherExpandedGrabberHeaderHeight];
  }
  double v8 = v7;

  [(CKAppGrabberView *)self bounds];
  CGFloat x = v18.origin.x;
  CGFloat y = v18.origin.y;
  CGFloat width = v18.size.width;
  CGFloat height = v18.size.height;
  double v13 = CGRectGetHeight(v18);
  if (CKPixelWidth_once_14 != -1) {
    dispatch_once(&CKPixelWidth_once_14, &__block_literal_global_124_0);
  }
  double v14 = v13 - v8 + *(double *)&CKPixelWidth_sPixel_14;
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  double v15 = CGRectGetWidth(v19);
  headerView = self->_headerView;

  -[UIView setFrame:](headerView, "setFrame:", 0.0, v14, v15, v8);
}

- (id)headerView
{
  return self->_headerView;
}

- (id)iconImageView
{
  return self->_iconImageView;
}

- (CKAppGrabberViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKAppGrabberViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)showsAppTitle
{
  return self->_showsAppTitle;
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (BOOL)roundsTopCorners
{
  return self->_roundsTopCorners;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_chevronView, 0);
  objc_storeStrong((id *)&self->_grayLine, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_pluginTitleLabel, 0);
  objc_storeStrong((id *)&self->_iconOutlineView, 0);

  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end