@interface MPAddKeepLocalControl
+ (CGSize)_expectedSizeForControlStatusType:(int64_t)a3 controlTitle:(id)a4 hasControlImage:(BOOL)a5 displayScale:(double)a6 preferredHeight:(double)a7;
+ (id)_imageNamed:(id)a3 compatibleWithTraitCollection:(id)a4;
+ (id)_newControlTitleLabel;
+ (id)controlTitleFontForControlStatusType:(int64_t)a3;
- (BOOL)allowsAddImage;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)scaleImageForAccessibility;
- (CGSize)maximumSizeWithPreferredHeight:(double)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MPAddKeepLocalControl)initWithFrame:(CGRect)a3;
- (MPAddKeepLocalControlStatus)controlStatus;
- (UIColor)filledTintColor;
- (id)_currentContentSuperview;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)titleForControlStatusType:(int64_t)a3;
- (int64_t)displayStyle;
- (void)_beginTransientContentViewTransaction;
- (void)_endTransientContentViewTransaction;
- (void)_updateBackgroundViewCornerRadius;
- (void)_updateControlImageViewAnimation;
- (void)_updateControlStatusProperties;
- (void)_updateControlTitleLabelVisualProperties;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setAllowsAddImage:(BOOL)a3;
- (void)setContentHorizontalAlignment:(int64_t)a3;
- (void)setControlStatus:(MPAddKeepLocalControlStatus)a3;
- (void)setControlStatus:(MPAddKeepLocalControlStatus)a3 animated:(BOOL)a4;
- (void)setDisplayStyle:(int64_t)a3;
- (void)setFilledTintColor:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setScaleImageForAccessibility:(BOOL)a3;
- (void)setTitle:(id)a3 forControlStatusType:(int64_t)a4;
- (void)tintColorDidChange;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation MPAddKeepLocalControl

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filledTintColor, 0);
  objc_storeStrong((id *)&self->_transientContentView, 0);
  objc_storeStrong((id *)&self->_downloadProgressView, 0);
  objc_storeStrong((id *)&self->_controlStatusTypeToTitle, 0);
  objc_storeStrong((id *)&self->_controlImageView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);

  objc_storeStrong((id *)&self->_controlTitleLabel, 0);
}

- (UIColor)filledTintColor
{
  return self->_filledTintColor;
}

- (void)setScaleImageForAccessibility:(BOOL)a3
{
  self->_scaleImageForAccessibility = a3;
}

- (BOOL)scaleImageForAccessibility
{
  return self->_scaleImageForAccessibility;
}

- (int64_t)displayStyle
{
  return self->_displayStyle;
}

- (MPAddKeepLocalControlStatus)controlStatus
{
  p_controlStatus = &self->_controlStatus;
  int64_t statusType = self->_controlStatus.statusType;
  double downloadProgress = p_controlStatus->downloadProgress;
  result.double downloadProgress = downloadProgress;
  result.int64_t statusType = statusType;
  return result;
}

- (BOOL)allowsAddImage
{
  return self->_allowsAddImage;
}

- (void)_updateControlImageViewAnimation
{
  controlImageView = self->_controlImageView;
  if (controlImageView)
  {
    id v15 = [(UIImageView *)controlImageView layer];
    if (self->_controlStatus.statusType == 3)
    {
      v4 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.rotation.z"];
      v5 = [v15 presentationLayer];
      if (v5) {
        v6 = v5;
      }
      else {
        v6 = v15;
      }
      v7 = [v4 keyPath];
      v8 = [v6 valueForKeyPath:v7];

      [v4 setFromValue:v8];
      v9 = NSNumber;
      [v8 floatValue];
      v11 = objc_msgSend(v9, "numberWithDouble:", (double)(fmod(v10, 6.28318531) + 6.28318531));
      [v4 setToValue:v11];

      [v4 setRemovedOnCompletion:0];
      LODWORD(v12) = 2139095040;
      [v4 setRepeatCount:v12];
      [v4 setFillMode:*MEMORY[0x1E4F39FA0]];
      [v4 setDuration:1.0];
      [v4 setBeginTimeMode:*MEMORY[0x1E4F39D60]];
      CFTimeInterval v13 = CACurrentMediaTime();
      [v4 duration];
      objc_msgSend(v4, "setBeginTime:", (double)(v13 - fmod(v13, v14)));
      [v15 addAnimation:v4 forKey:@"_MPAddKeepLocalControlWaitingSpinnerAnimationKey"];
    }
    else
    {
      [v15 removeAnimationForKey:@"_MPAddKeepLocalControlWaitingSpinnerAnimationKey"];
    }
  }
}

- (void)_updateControlStatusProperties
{
  id v51 = [(MPAddKeepLocalControl *)self traitCollection];
  [v51 displayScale];
  double v4 = v3;
  double v5 = vabdd_f64(0.0, v3);
  if (v4 < 0.0 || v5 < 0.00000011920929) {
    goto LABEL_50;
  }
  v7 = objc_msgSend(v51, "preferredContentSizeCategory", v5);
  char v8 = [v7 isEqualToString:*MEMORY[0x1E4FB27F0]];

  if (v8) {
    goto LABEL_50;
  }
  int64_t statusType = self->_controlStatus.statusType;
  downloadProgressView = self->_downloadProgressView;
  if (statusType == 4)
  {
    if (!downloadProgressView)
    {
      v11 = [(id)objc_opt_class() _imageNamed:@"UniversalDownloadProgressStopButton" compatibleWithTraitCollection:v51];
      double v12 = [MPDownloadProgressView alloc];
      [(MPAddKeepLocalControl *)self bounds];
      CFTimeInterval v13 = -[MPDownloadProgressView initWithFrame:](v12, "initWithFrame:");
      long double v14 = self->_downloadProgressView;
      self->_downloadProgressView = v13;

      [(MPDownloadProgressView *)self->_downloadProgressView setCenterImage:v11];
      id v15 = self->_downloadProgressView;
      v16 = [MEMORY[0x1E4FB1618] systemFillColor];
      [(MPDownloadProgressView *)v15 setOuterRingColor:v16];

      v17 = [(MPAddKeepLocalControl *)self _currentContentSuperview];
      [v17 addSubview:self->_downloadProgressView];

      downloadProgressView = self->_downloadProgressView;
    }
    [(MPDownloadProgressView *)downloadProgressView setDownloadProgress:self->_controlStatus.downloadProgress];
    goto LABEL_15;
  }
  [(MPDownloadProgressView *)downloadProgressView removeFromSuperview];
  v18 = self->_downloadProgressView;
  self->_downloadProgressView = 0;

  if (statusType != 1 || self->_displayStyle != 1)
  {
LABEL_15:
    [(UIView *)self->_backgroundView removeFromSuperview];
    backgroundView = self->_backgroundView;
    self->_backgroundView = 0;

    CGFloat v26 = *MEMORY[0x1E4FB2848];
    double v25 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    CGFloat v28 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    CGFloat v27 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    switch(statusType)
    {
      case 1:
        goto LABEL_16;
      case 2:
        v32 = objc_opt_class();
        v33 = @"UniversalAddControlDownloadable";
        goto LABEL_25;
      case 3:
        v32 = objc_opt_class();
        v33 = @"UniversalAddControlWaiting";
        goto LABEL_25;
      case 5:
        v34 = [(MPAddKeepLocalControl *)self titleForControlStatusType:5];
        if ([v34 length])
        {
        }
        else
        {
          v35 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
          int v36 = [v35 BOOLForKey:@"MPKeepLocalControlShouldShowDownloadedIndicator"];

          if (!v36) {
            goto LABEL_34;
          }
        }
        v30 = [(id)objc_opt_class() _imageNamed:@"UniversalAddControlDownloaded" compatibleWithTraitCollection:v51];
        if (vabdd_f64(2.0, v4) >= 0.00000011920929) {
          double v25 = -2.0;
        }
        else {
          double v25 = -1.5;
        }
        if (self->_displayStyle == 1) {
          [MEMORY[0x1E4FB1618] systemGrayColor];
        }
        else {
        v31 = [(id)objc_opt_class() systemLightGrayColor];
        }
        CGFloat v28 = 0.0;
        CGFloat v27 = -3.0;
        CGFloat v26 = 0.0;
        break;
      case 6:
        v32 = objc_opt_class();
        v33 = @"UniversalAddControlError";
        goto LABEL_25;
      case 7:
        v32 = objc_opt_class();
        v33 = @"UniversalAddControlPaused";
LABEL_25:
        v30 = [v32 _imageNamed:v33 compatibleWithTraitCollection:v51];
        v31 = 0;
        goto LABEL_37;
      default:
        goto LABEL_34;
    }
    goto LABEL_37;
  }
  if (!self->_backgroundView)
  {
    id v19 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(MPAddKeepLocalControl *)self bounds];
    v20 = (UIView *)objc_msgSend(v19, "initWithFrame:");
    v21 = self->_backgroundView;
    self->_backgroundView = v20;

    v22 = self->_backgroundView;
    v23 = [(MPAddKeepLocalControl *)self tintColor];
    [(UIView *)v22 setBackgroundColor:v23];

    [(UIView *)self->_backgroundView setClipsToBounds:1];
    [(MPAddKeepLocalControl *)self _updateBackgroundViewCornerRadius];
    v24 = [(MPAddKeepLocalControl *)self _currentContentSuperview];
    [v24 insertSubview:self->_backgroundView atIndex:0];
  }
  CGFloat v26 = *MEMORY[0x1E4FB2848];
  double v25 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  CGFloat v28 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  CGFloat v27 = *(double *)(MEMORY[0x1E4FB2848] + 24);
LABEL_16:
  if (!self->_allowsAddImage)
  {
LABEL_34:
    v31 = 0;
    self->_controlImageEdgeInsets.top = v26;
    self->_controlImageEdgeInsets.left = v25;
    self->_controlImageEdgeInsets.bottom = v28;
    self->_controlImageEdgeInsets.right = v27;
    goto LABEL_43;
  }
  v30 = [(id)objc_opt_class() _imageNamed:@"UniversalAddControlAdd" compatibleWithTraitCollection:v51];
  CGFloat v27 = 3.0;
  if (self->_displayStyle == 1)
  {
    v31 = [(MPAddKeepLocalControl *)self filledTintColor];
  }
  else
  {
    v31 = 0;
  }
  CGFloat v28 = 3.0;
  double v25 = 3.0;
  CGFloat v26 = 3.0;
LABEL_37:
  self->_controlImageEdgeInsets.top = v26;
  self->_controlImageEdgeInsets.left = v25;
  self->_controlImageEdgeInsets.bottom = v28;
  self->_controlImageEdgeInsets.right = v27;
  if (v30)
  {
    controlImageView = self->_controlImageView;
    if (!controlImageView)
    {
      id v38 = objc_alloc(MEMORY[0x1E4FB1838]);
      v39 = (UIImageView *)objc_msgSend(v38, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      v40 = self->_controlImageView;
      self->_controlImageView = v39;

      v41 = [(MPAddKeepLocalControl *)self _currentContentSuperview];
      [v41 addSubview:self->_controlImageView];

      controlImageView = self->_controlImageView;
    }
    [(UIImageView *)controlImageView setTintColor:v31];
    [(UIImageView *)self->_controlImageView setImage:v30];
    if ([(MPAddKeepLocalControl *)self scaleImageForAccessibility]) {
      [(UIImageView *)self->_controlImageView setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
    }
    [(MPAddKeepLocalControl *)self _updateControlImageViewAnimation];
    goto LABEL_44;
  }
LABEL_43:
  [(UIImageView *)self->_controlImageView removeFromSuperview];
  v30 = self->_controlImageView;
  self->_controlImageView = 0;
LABEL_44:

  v42 = [(MPAddKeepLocalControl *)self titleForControlStatusType:statusType];
  uint64_t v43 = [v42 length];
  controlTitleLabel = self->_controlTitleLabel;
  if (v43)
  {
    if (!controlTitleLabel)
    {
      v45 = (UILabel *)[(id)objc_opt_class() _newControlTitleLabel];
      v46 = self->_controlTitleLabel;
      self->_controlTitleLabel = v45;

      v47 = [(MPAddKeepLocalControl *)self _currentContentSuperview];
      [v47 addSubview:self->_controlTitleLabel];
    }
    [(MPAddKeepLocalControl *)self _updateControlTitleLabelVisualProperties];
    v48 = self->_controlTitleLabel;
    v49 = [(id)objc_opt_class() controlTitleFontForControlStatusType:statusType];
    [(UILabel *)v48 setFont:v49];

    [(UILabel *)self->_controlTitleLabel setText:v42];
  }
  else
  {
    [(UILabel *)controlTitleLabel removeFromSuperview];
    v50 = self->_controlTitleLabel;
    self->_controlTitleLabel = 0;
  }
  [(MPAddKeepLocalControl *)self setNeedsLayout];

LABEL_50:
}

- (void)_updateBackgroundViewCornerRadius
{
  [(UIView *)self->_backgroundView bounds];
  CGFloat x = v12.origin.x;
  CGFloat y = v12.origin.y;
  CGFloat width = v12.size.width;
  CGFloat height = v12.size.height;
  double v7 = CGRectGetWidth(v12);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  double v8 = CGRectGetHeight(v13);
  if (v7 < v8) {
    double v8 = v7;
  }
  double v9 = v8 * 0.5;
  id v10 = [(UIView *)self->_backgroundView layer];
  [v10 setCornerRadius:v9];
}

- (void)_updateControlTitleLabelVisualProperties
{
  if (self->_controlStatus.statusType == 5)
  {
    controlTitleLabel = self->_controlTitleLabel;
    uint64_t v3 = [MEMORY[0x1E4FB1618] systemGrayColor];
  }
  else
  {
    controlTitleLabel = self->_controlTitleLabel;
    if (self->_displayStyle == 1) {
      [(MPAddKeepLocalControl *)self filledTintColor];
    }
    else {
    uint64_t v3 = [(MPAddKeepLocalControl *)self tintColor];
    }
  }
  id v4 = (id)v3;
  -[UILabel setTextColor:](controlTitleLabel, "setTextColor:");
}

- (id)_currentContentSuperview
{
  if (self->_transientContentViewTransactionCount >= 1) {
    self = (MPAddKeepLocalControl *)self->_transientContentView;
  }
  return self;
}

- (void)_endTransientContentViewTransaction
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  --self->_transientContentViewTransactionCount;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = [(UIView *)self->_transientContentView subviews];
  id v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        transientContentView = *(UIView **)(*((void *)&v11 + 1) + 8 * v8);
        if (transientContentView != self->_transientContentView)
        {
          -[MPAddKeepLocalControl addSubview:](self, "addSubview:");
          transientContentView = self->_transientContentView;
        }
        [(UIView *)transientContentView removeFromSuperview];
        id v10 = self->_transientContentView;
        self->_transientContentView = 0;

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)_beginTransientContentViewTransaction
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int64_t transientContentViewTransactionCount = self->_transientContentViewTransactionCount;
  self->_int64_t transientContentViewTransactionCount = transientContentViewTransactionCount + 1;
  if (!transientContentViewTransactionCount)
  {
    if (!self->_transientContentView)
    {
      id v4 = objc_alloc(MEMORY[0x1E4FB1EB0]);
      [(MPAddKeepLocalControl *)self bounds];
      uint64_t v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
      transientContentView = self->_transientContentView;
      self->_transientContentView = v5;

      [(MPAddKeepLocalControl *)self insertSubview:self->_transientContentView atIndex:0];
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v7 = [(MPAddKeepLocalControl *)self subviews];
    uint64_t v8 = (void *)[v7 copy];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = self->_transientContentView;
          if (*(UIView **)(*((void *)&v14 + 1) + 8 * v12) != v13) {
            -[UIView addSubview:](v13, "addSubview:");
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
}

- (id)titleForControlStatusType:(int64_t)a3
{
  controlStatusTypeToTitle = self->_controlStatusTypeToTitle;
  id v4 = [NSNumber numberWithInteger:a3];
  uint64_t v5 = [(NSMutableDictionary *)controlStatusTypeToTitle objectForKey:v4];

  return v5;
}

- (void)setTitle:(id)a3 forControlStatusType:(int64_t)a4
{
  id v11 = a3;
  uint64_t v6 = [NSNumber numberWithInteger:a4];
  controlStatusTypeToTitle = self->_controlStatusTypeToTitle;
  if (v11)
  {
    if (!controlStatusTypeToTitle)
    {
      uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v9 = self->_controlStatusTypeToTitle;
      self->_controlStatusTypeToTitle = v8;

      controlStatusTypeToTitle = self->_controlStatusTypeToTitle;
    }
    [(NSMutableDictionary *)controlStatusTypeToTitle setObject:v11 forKey:v6];
  }
  else
  {
    [(NSMutableDictionary *)controlStatusTypeToTitle removeObjectForKey:v6];
    if (![(NSMutableDictionary *)self->_controlStatusTypeToTitle count])
    {
      uint64_t v10 = self->_controlStatusTypeToTitle;
      self->_controlStatusTypeToTitle = 0;
    }
  }
  if (self->_controlStatus.statusType == a4) {
    [(MPAddKeepLocalControl *)self _updateControlStatusProperties];
  }
}

- (void)setFilledTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_filledTintColor, a3);
  if (self->_displayStyle == 1)
  {
    [(MPAddKeepLocalControl *)self _updateControlTitleLabelVisualProperties];
    [(MPAddKeepLocalControl *)self _updateControlStatusProperties];
  }
}

- (void)setControlStatus:(MPAddKeepLocalControlStatus)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  p_controlStatus = &self->_controlStatus;
  int64_t statusType = self->_controlStatus.statusType;
  if (statusType == a3.statusType
    && vabdd_f64(self->_controlStatus.downloadProgress, a3.downloadProgress) <= 0.00000011920929)
  {
    return;
  }
  p_controlStatus->int64_t statusType = a3.statusType;
  self->_controlStatus.double downloadProgress = a3.downloadProgress;
  int64_t v8 = self->_controlStatusRevision + 1;
  self->_controlStatusRevision = v8;
  if (a3.statusType == 4 && statusType == 4)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __51__MPAddKeepLocalControl_setControlStatus_animated___block_invoke;
    v19[3] = &unk_1E57F9EA8;
    v19[4] = self;
    uint64_t v9 = MEMORY[0x19971E0F0](v19, a2);
    uint64_t v10 = (void *)v9;
    if (v4) {
      [MEMORY[0x1E4FB1EB0] animateWithDuration:134 delay:v9 options:0 animations:0.25 completion:0.0];
    }
    else {
      (*(void (**)(uint64_t))(v9 + 16))(v9);
    }

    return;
  }
  if (a3.statusType == 3)
  {
    if (statusType == 3) {
      goto LABEL_13;
    }
    id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:self selector:sel__applicationWillEnterForegroundNotification_ name:*MEMORY[0x1E4FB2730] object:0];
  }
  else
  {
    if (statusType != 3) {
      goto LABEL_13;
    }
    id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 removeObserver:self name:*MEMORY[0x1E4FB2730] object:0];
  }

LABEL_13:
  uint64_t v12 = [(MPAddKeepLocalControl *)self traitCollection];
  long long v13 = [v12 preferredContentSizeCategory];
  char v14 = [v13 isEqualToString:*MEMORY[0x1E4FB27F0]];

  BOOL v15 = statusType != 4 || !v4;
  if (v15 || p_controlStatus->statusType != 5)
  {
    if ((v14 & 1) == 0)
    {
      [(MPAddKeepLocalControl *)self _updateControlStatusProperties];
    }
  }
  else
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __51__MPAddKeepLocalControl_setControlStatus_animated___block_invoke_2;
    v18[3] = &unk_1E57F9EA8;
    v18[4] = self;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __51__MPAddKeepLocalControl_setControlStatus_animated___block_invoke_3;
    v16[3] = &unk_1E57F08F8;
    v16[4] = self;
    v16[5] = v8;
    char v17 = v14 ^ 1;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:134 delay:v18 options:v16 animations:0.25 completion:0.0];
  }
}

uint64_t __51__MPAddKeepLocalControl_setControlStatus_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 496) setDownloadProgress:*(double *)(*(void *)(a1 + 32) + 592)];
}

uint64_t __51__MPAddKeepLocalControl_setControlStatus_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 496) setDownloadProgress:1.0];
}

void __51__MPAddKeepLocalControl_setControlStatus_animated___block_invoke_3(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MPAddKeepLocalControl_setControlStatus_animated___block_invoke_4;
  block[3] = &unk_1E57F71A0;
  uint64_t v3 = *(void *)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  block[5] = v3;
  char v5 = *(unsigned char *)(a1 + 48);
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
}

void *__51__MPAddKeepLocalControl_setControlStatus_animated___block_invoke_4(uint64_t a1)
{
  MPAddKeepLocalControlStatus result = *(void **)(a1 + 32);
  if (result[61] == *(void *)(a1 + 40))
  {
    if (*(unsigned char *)(a1 + 48)) {
      return (void *)[result _updateControlStatusProperties];
    }
  }
  return result;
}

- (void)setControlStatus:(MPAddKeepLocalControlStatus)a3
{
}

- (void)setDisplayStyle:(int64_t)a3
{
  if (self->_displayStyle != a3)
  {
    self->_displayStyle = a3;
    [(MPAddKeepLocalControl *)self _updateControlStatusProperties];
    [(MPAddKeepLocalControl *)self _updateControlTitleLabelVisualProperties];
  }
}

- (void)setAllowsAddImage:(BOOL)a3
{
  if (self->_allowsAddImage != a3)
  {
    self->_allowsAddImage = a3;
    if (self->_controlStatus.statusType == 1) {
      [(MPAddKeepLocalControl *)self _updateControlStatusProperties];
    }
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(MPAddKeepLocalControl *)self isHighlighted];
  v12.receiver = self;
  v12.super_class = (Class)MPAddKeepLocalControl;
  [(MPAddKeepLocalControl *)&v12 setHighlighted:v3];
  int v6 = [(MPAddKeepLocalControl *)self isHighlighted];
  if (v5 != v6)
  {
    char v7 = v6;
    double v8 = 1.0;
    if (v6)
    {
      [(MPAddKeepLocalControl *)self _beginTransientContentViewTransaction];
      double v8 = 0.2;
    }
    if (self->_hadFirstTouchHighlight)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __40__MPAddKeepLocalControl_setHighlighted___block_invoke;
      v11[3] = &unk_1E57F8328;
      v11[4] = self;
      *(double *)&v11[5] = v8;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __40__MPAddKeepLocalControl_setHighlighted___block_invoke_2;
      v9[3] = &unk_1E57F08D0;
      char v10 = v7;
      v9[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:327684 delay:v11 options:v9 animations:0.47 completion:0.0];
    }
    else
    {
      self->_hadFirstTouchHighlight = 1;
      [(UIView *)self->_transientContentView setAlpha:v8];
      if ((v7 & 1) == 0) {
        [(MPAddKeepLocalControl *)self _endTransientContentViewTransaction];
      }
    }
  }
}

uint64_t __40__MPAddKeepLocalControl_setHighlighted___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 544) setAlpha:*(double *)(a1 + 40)];
}

uint64_t __40__MPAddKeepLocalControl_setHighlighted___block_invoke_2(uint64_t result)
{
  if (!*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) _endTransientContentViewTransaction];
  }
  return result;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MPAddKeepLocalControl;
  [(MPAddKeepLocalControl *)&v5 touchesEnded:a3 withEvent:a4];
  self->_hadFirstTouchHighlight = 0;
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MPAddKeepLocalControl;
  [(MPAddKeepLocalControl *)&v5 touchesCancelled:a3 withEvent:a4];
  self->_hadFirstTouchHighlight = 0;
}

- (void)setContentHorizontalAlignment:(int64_t)a3
{
  uint64_t v5 = [(MPAddKeepLocalControl *)self contentHorizontalAlignment];
  v6.receiver = self;
  v6.super_class = (Class)MPAddKeepLocalControl;
  [(MPAddKeepLocalControl *)&v6 setContentHorizontalAlignment:a3];
  if (v5 != [(MPAddKeepLocalControl *)self contentHorizontalAlignment]) {
    [(MPAddKeepLocalControl *)self setNeedsLayout];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPAddKeepLocalControl;
  [(MPAddKeepLocalControl *)&v11 traitCollectionDidChange:v4];
  uint64_t v5 = [(MPAddKeepLocalControl *)self traitCollection];
  [v5 displayScale];
  double v7 = v6;
  [v4 displayScale];
  if (vabdd_f64(v8, v7) >= 0.00000011920929
    || ([v5 preferredContentSizeCategory],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        [v4 preferredContentSizeCategory],
        char v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v9 != v10))
  {
    [(MPAddKeepLocalControl *)self _updateControlStatusProperties];
  }
  self->_traitCollectionDidChangeWasCalled = 1;
}

- (void)tintColorDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)MPAddKeepLocalControl;
  [(MPAddKeepLocalControl *)&v4 tintColorDidChange];
  BOOL v3 = [(MPAddKeepLocalControl *)self tintColor];
  if (self->_displayStyle == 1) {
    [(UIView *)self->_backgroundView setBackgroundColor:v3];
  }
  [(MPAddKeepLocalControl *)self _updateControlTitleLabelVisualProperties];
  if (self->_controlStatus.statusType == 2 && self->_traitCollectionDidChangeWasCalled) {
    [(MPAddKeepLocalControl *)self _updateControlStatusProperties];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  uint64_t v5 = objc_opt_class();
  int64_t statusType = self->_controlStatus.statusType;
  double v7 = [(MPAddKeepLocalControl *)self titleForControlStatusType:statusType];
  BOOL v8 = self->_allowsAddImage || self->_controlStatus.statusType != 1;
  uint64_t v9 = [(MPAddKeepLocalControl *)self traitCollection];
  [v9 displayScale];
  [v5 _expectedSizeForControlStatusType:statusType controlTitle:v7 hasControlImage:v8 displayScale:MPFloatGetSafeScaleForValue(v10) preferredHeight:height];
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.double height = v16;
  result.CGFloat width = v15;
  return result;
}

- (CGSize)maximumSizeWithPreferredHeight:(double)a3
{
  uint64_t v5 = [(MPAddKeepLocalControl *)self traitCollection];
  [v5 displayScale];
  double SafeScaleForValue = MPFloatGetSafeScaleForValue(v6);

  uint64_t v8 = 0;
  double v9 = *MEMORY[0x1E4F1DB30];
  double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  do
  {
    uint64_t v11 = *(void *)((char *)&v21 + v8);
    double v12 = objc_opt_class();
    double v13 = [(MPAddKeepLocalControl *)self titleForControlStatusType:v11];
    BOOL v14 = self->_allowsAddImage || self->_controlStatus.statusType != 1;
    [v12 _expectedSizeForControlStatusType:v11 controlTitle:v13 hasControlImage:v14 displayScale:MPFloatGetSafeScaleForValue(SafeScaleForValue) preferredHeight:a3];
    double v16 = v15;
    double v18 = v17;

    if (v9 < v16) {
      double v9 = v16;
    }
    if (v10 < v18) {
      double v10 = v18;
    }
    v8 += 8;
  }
  while (v8 != 56);
  double v19 = v9;
  double v20 = v10;
  result.double height = v20;
  result.CGFloat width = v19;
  return result;
}

- (void)layoutSubviews
{
  *(void *)&v137.size.CGFloat height = self;
  v138 = MPAddKeepLocalControl;
  [(CGFloat *)(objc_super *)&v137.size.height layoutSubviews];
  [(MPAddKeepLocalControl *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(MPAddKeepLocalControl *)self traitCollection];
  [v11 displayScale];
  double SafeScaleForValue = MPFloatGetSafeScaleForValue(v12);

  [(UILabel *)self->_controlTitleLabel frame];
  v137.origin.double x = v14;
  CGFloat v16 = v15;
  -[UILabel sizeThatFits:](self->_controlTitleLabel, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  uint64_t v21 = [(MPAddKeepLocalControl *)self contentHorizontalAlignment];
  controlImageView = self->_controlImageView;
  v137.size.CGFloat width = SafeScaleForValue;
  if (controlImageView)
  {
    int64_t statusType = self->_controlStatus.statusType;
    [(UIImageView *)controlImageView frame];
    v137.origin.CGFloat y = v4;
    v24 = [(UILabel *)self->_controlTitleLabel text];
    uint64_t v25 = [v24 length];

    double v26 = fmin(v8, 45.0);
    double v27 = fmin(v10, 45.0);
    if (!v25)
    {
      double v10 = v27;
      double v8 = v26;
    }
    -[UIImageView sizeThatFits:](self->_controlImageView, "sizeThatFits:", v8, v10);
    p_controlImageEdgeInsets = &self->_controlImageEdgeInsets;
    double v131 = v29;
    double v132 = v30;
    UIRectCenteredYInRectScale();
    CGFloat v127 = v31;
    double v33 = v32;
    CGFloat v136 = v34;
    CGFloat v134 = v35;
    int v36 = [(UILabel *)self->_controlTitleLabel text];
    uint64_t v37 = [v36 length];

    if (v37)
    {
      double v119 = SafeScaleForValue;
      UIRectCenteredYInRectScale();
      CGFloat v39 = v38;
      CGFloat v41 = v40;
      double v129 = v42;
      CGFloat v44 = v43;
      v45 = objc_msgSend(MEMORY[0x1E4FB1798], "preferredFontForTextStyle:", *MEMORY[0x1E4FB28C8], *(void *)&v119);
      [v45 _scaledValueForValue:8.0];
      v137.origin.double x = v6 + 0.0;
      double rect = v8 - (v46 + 5.0);

      CGFloat v125 = v8;
      CGFloat v126 = v6;
      double v133 = v33;
      CGFloat v130 = v41;
      if (v21 == 2)
      {
        v143.origin.double x = v4 + 5.0;
        v143.origin.CGFloat y = v6 + 0.0;
        v143.size.CGFloat width = rect;
        v143.size.CGFloat height = v10;
        double MaxX = CGRectGetMaxX(v143);
        v144.origin.double x = v39;
        v144.origin.CGFloat y = v41;
        v144.size.CGFloat width = v129;
        v144.size.CGFloat height = v44;
        CGFloat v59 = MaxX - CGRectGetWidth(v144);
        v145.origin.double x = v59;
        v145.origin.CGFloat y = v41;
        v145.size.CGFloat width = v129;
        v145.size.CGFloat height = v44;
        double MinX = CGRectGetMinX(v145);
        v146.origin.double x = v127;
        CGFloat v49 = v136;
        v146.size.CGFloat width = v136;
        CGFloat v52 = v41;
        v146.origin.CGFloat y = v133;
        CGFloat v50 = v134;
        v146.size.CGFloat height = v134;
        CGFloat v47 = v44;
        double x = MinX - CGRectGetWidth(v146);
        double v51 = v59;
        double v33 = v133;
      }
      else if (v21 == 1)
      {
        v139.origin.double x = v4 + 5.0;
        v139.origin.CGFloat y = v6 + 0.0;
        v139.size.CGFloat width = rect;
        v139.size.CGFloat height = v10;
        v140.origin.double x = CGRectGetMinX(v139);
        CGFloat v47 = v44;
        double x = v140.origin.x;
        v140.origin.CGFloat y = v33;
        CGFloat v49 = v136;
        v140.size.CGFloat width = v136;
        CGFloat v50 = v134;
        v140.size.CGFloat height = v134;
        double v51 = CGRectGetMaxX(v140) + 0.0;
        CGFloat v52 = v130;
      }
      else
      {
        v147.origin.double x = 0.0;
        v147.origin.CGFloat y = v33;
        v147.size.CGFloat width = v136;
        CGFloat v50 = v134;
        v147.size.CGFloat height = v134;
        v148.origin.double x = CGRectGetMaxX(v147) + 0.0;
        double v123 = v148.origin.x;
        v164.origin.double x = 0.0;
        v148.size.CGFloat width = v129;
        CGFloat v52 = v130;
        v148.origin.CGFloat y = v130;
        v148.size.CGFloat height = v44;
        v164.origin.CGFloat y = v33;
        v164.size.CGFloat width = v136;
        v164.size.CGFloat height = v134;
        CGRect v149 = CGRectUnion(v148, v164);
        CGFloat y = v149.origin.y;
        CGFloat v122 = v149.origin.x;
        CGFloat v47 = v44;
        CGFloat height = v149.size.height;
        CGFloat width = v137.size.width;
        CGFloat v120 = v149.size.width;
        UIRectCenteredXInRectScale();
        double v62 = CGRectGetMinX(v150);
        v151.origin.CGFloat y = y;
        v151.origin.double x = v122;
        v151.size.CGFloat width = v120;
        CGFloat v49 = v136;
        v151.size.CGFloat height = height;
        double v63 = v62 - CGRectGetMinX(v151);
        double v33 = v133;
        double v64 = MPFloatGetSafeScaleForValue(v137.size.width);
        double v65 = round(v64 * v63) / v64;
        double x = v65 + 0.0;
        double v51 = v123 + v65;
      }
      double v124 = v51;
      CGFloat v66 = v52;
      double v67 = v129;
      double v68 = v129;
      double v128 = v47;
      CGFloat v69 = v47;
      v165.origin.double x = x;
      v165.origin.CGFloat y = v33;
      v165.size.CGFloat width = v49;
      v165.size.CGFloat height = v50;
      CGRect v152 = CGRectUnion(*(CGRect *)&v51, v165);
      CGFloat v70 = v152.origin.x;
      CGFloat v71 = v152.origin.y;
      CGFloat v72 = v152.size.width;
      CGFloat v73 = v152.size.height;
      v152.origin.double x = v137.origin.y + 5.0;
      v152.origin.CGFloat y = v137.origin.x;
      v152.size.CGFloat width = rect;
      v152.size.CGFloat height = v10;
      double v74 = CGRectGetWidth(v152);
      v75 = [(MPAddKeepLocalControl *)self traitCollection];
      v76 = [v75 preferredContentSizeCategory];
      IsAccessibilityCategorCGFloat y = UIContentSizeCategoryIsAccessibilityCategory(v76);

      if (!IsAccessibilityCategory)
      {
        v153.origin.double x = v70;
        v153.origin.CGFloat y = v71;
        v153.size.CGFloat width = v72;
        v153.size.CGFloat height = v73;
        double v78 = CGRectGetWidth(v153) - v74;
        if (v78 <= 0.00000011920929) {
          double v78 = 0.0;
        }
        double v67 = v129 - v78;
      }
      double v4 = v137.origin.y;
      double v6 = v126;
      if (statusType == 1)
      {
        double v79 = v133;
        CGFloat v80 = v134;
        CGFloat v81 = v136;
      }
      else
      {
        double x = x - self->_controlImageEdgeInsets.left;
        CGFloat v80 = v132;
        double v79 = v133 - p_controlImageEdgeInsets->top;
        CGFloat v81 = v131;
      }
      CGFloat v82 = x;
      double v8 = v125;
      [(UIImageView *)self->_controlImageView setFrame:MPRectByApplyingUserInterfaceLayoutDirectionInRect(v82, v79, v81, v80, v137.origin.y, v126, v125, v10)];
      controlTitleLabel = self->_controlTitleLabel;
      double v84 = v124;
      double v85 = v130;
      double v86 = v67;
      double v87 = v128;
    }
    else
    {
      if (v21 == 2)
      {
        v157.origin.double x = v4;
        v157.origin.CGFloat y = v6;
        v157.size.CGFloat width = v8;
        v157.size.CGFloat height = v10;
        CGFloat v101 = v33;
        double v102 = CGRectGetMaxX(v157);
        v158.origin.double x = v127;
        v158.origin.CGFloat y = v101;
        v158.size.CGFloat width = v136;
        v158.size.CGFloat height = v134;
        double v57 = v102 - CGRectGetWidth(v158);
        double v33 = v101;
      }
      else if (v21 == 1)
      {
        v142.origin.double x = v4;
        v142.origin.CGFloat y = v6;
        v142.size.CGFloat width = v8;
        v142.size.CGFloat height = v10;
        double v57 = CGRectGetMinX(v142);
      }
      else
      {
        CGFloat width = SafeScaleForValue;
        UIRectCenteredXInRectScale();
        double v33 = v103;
      }
      double v84 = v57 - self->_controlImageEdgeInsets.left;
      double v85 = v33 - p_controlImageEdgeInsets->top;
      double v86 = fmin(v131, 45.0);
      double v87 = fmin(v132, 45.0);
      controlTitleLabel = self->_controlImageView;
    }
    CGFloat v100 = v4;
  }
  else
  {
    v53 = [(UILabel *)self->_controlTitleLabel text];
    uint64_t v54 = [v53 length];

    if (!v54) {
      goto LABEL_33;
    }
    if (v21 == 2)
    {
      v154.origin.double x = v4;
      v154.origin.CGFloat y = v6;
      v154.size.CGFloat width = v8;
      v154.size.CGFloat height = v10;
      CGRectGetMaxX(v154);
      uint64_t v55 = *MEMORY[0x1E4FB28C8];
      v88 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
      [v88 _scaledValueForValue:8.0];
      v155.origin.double x = v137.origin.x;
      v155.origin.CGFloat y = v16;
      v155.size.CGFloat width = v18;
      v155.size.CGFloat height = v20;
      CGRectGetWidth(v155);
    }
    else if (v21 == 1)
    {
      v141.origin.double x = v4;
      v141.origin.CGFloat y = v6;
      v141.size.CGFloat width = v8;
      v141.size.CGFloat height = v10;
      CGRectGetMinX(v141);
      uint64_t v55 = *MEMORY[0x1E4FB28C8];
      v56 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
      [v56 _scaledValueForValue:8.0];
    }
    else
    {
      UIRectCenteredXInRectScale();
      uint64_t v55 = *MEMORY[0x1E4FB28C8];
    }
    UIRectCenteredYInRectScale();
    double v90 = v89;
    CGFloat v91 = v4;
    double v93 = v92;
    double v95 = v94;
    double v97 = v96;
    v98 = objc_msgSend(MEMORY[0x1E4FB1798], "preferredFontForTextStyle:", v55, *(void *)&v137.size.width);
    [v98 _scaledValueForValue:8.0];

    v99 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:v55];
    [v99 _scaledValueForValue:8.0];

    v156.origin.double x = v91;
    v156.origin.CGFloat y = v6;
    v156.size.CGFloat width = v8;
    v156.size.CGFloat height = v10;
    CGRectGetHeight(v156);
    controlTitleLabel = self->_controlTitleLabel;
    double v84 = v90;
    double v85 = v93;
    double v4 = v91;
    double v86 = v95;
    double v87 = v97;
    CGFloat v100 = v91;
  }
  objc_msgSend(controlTitleLabel, "setFrame:", MPRectByApplyingUserInterfaceLayoutDirectionInRect(v84, v85, v86, v87, v100, v6, v8, v10));
LABEL_33:
  if (!self->_downloadProgressView) {
    goto LABEL_44;
  }
  v159.origin.double x = v4;
  v159.origin.CGFloat y = v6;
  v159.size.CGFloat width = v8;
  v159.size.CGFloat height = v10;
  double v104 = CGRectGetWidth(v159);
  v160.origin.double x = v4;
  v160.origin.CGFloat y = v6;
  v160.size.CGFloat width = v8;
  v160.size.CGFloat height = v10;
  double v105 = CGRectGetHeight(v160);
  if (v104 >= v105) {
    CGFloat v106 = v105;
  }
  else {
    CGFloat v106 = v104;
  }
  [(MPDownloadProgressView *)self->_downloadProgressView frame];
  CGFloat v108 = v107;
  CGFloat v110 = v109;
  if (v21 == 2)
  {
    v162.origin.double x = v4;
    v162.origin.CGFloat y = v6;
    v162.size.CGFloat width = v8;
    v162.size.CGFloat height = v10;
    double v112 = v4;
    double v113 = CGRectGetMaxX(v162);
    v163.origin.double x = v108;
    v163.origin.CGFloat y = v110;
    v163.size.CGFloat width = v106;
    v163.size.CGFloat height = v106;
    double v111 = v113 - CGRectGetWidth(v163);
    double v4 = v112;
  }
  else
  {
    if (v21 != 1)
    {
      UIRectCenteredIntegralRectScale();
      CGFloat v110 = v115;
      CGFloat v106 = v116;
      goto LABEL_43;
    }
    v161.origin.double x = v4;
    v161.origin.CGFloat y = v6;
    v161.size.CGFloat width = v8;
    v161.size.CGFloat height = v10;
    double v111 = CGRectGetMinX(v161);
  }
  CGFloat v114 = v106;
LABEL_43:
  [(MPDownloadProgressView *)self->_downloadProgressView setFrame:MPRectByApplyingUserInterfaceLayoutDirectionInRect(v111, v110, v106, v114, v4, v6, v8, v10)];
LABEL_44:
  backgroundView = self->_backgroundView;
  if (backgroundView)
  {
    -[UIView setFrame:](backgroundView, "setFrame:", v4, v6, v8, v10);
    [(MPAddKeepLocalControl *)self _updateBackgroundViewCornerRadius];
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(MPAddKeepLocalControl *)self bounds];
  CGFloat v7 = v15.origin.x;
  CGFloat v8 = v15.origin.y;
  CGFloat width = v15.size.width;
  CGFloat height = v15.size.height;
  if (CGRectIsEmpty(v15)) {
    return 0;
  }
  v16.origin.CGFloat x = v7;
  v16.origin.CGFloat y = v8;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  CGRect v17 = CGRectInset(v16, -16.0, -16.0);
  v14.CGFloat x = x;
  v14.CGFloat y = y;
  if (!CGRectContainsPoint(v17, v14)) {
    return 0;
  }
  if (self->_controlImageView) {
    return 1;
  }
  double v13 = [(UILabel *)self->_controlTitleLabel text];
  if ([v13 length]) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = self->_downloadProgressView != 0;
  }

  return v11;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  if (-[MPAddKeepLocalControl pointInside:withEvent:](self, "pointInside:withEvent:", a4, a3.x, a3.y)
    && [(MPAddKeepLocalControl *)self isEnabled])
  {
    double v5 = self;
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)MPAddKeepLocalControl;
  [(MPAddKeepLocalControl *)&v3 didMoveToWindow];
  if ([(MPAddKeepLocalControl *)self _isInAWindow]) {
    [(MPAddKeepLocalControl *)self _updateControlImageViewAnimation];
  }
}

- (void)dealloc
{
  if (self->_controlStatus.statusType == 3)
  {
    objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self name:*MEMORY[0x1E4FB2730] object:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)MPAddKeepLocalControl;
  [(MPAddKeepLocalControl *)&v4 dealloc];
}

- (MPAddKeepLocalControl)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MPAddKeepLocalControl;
  objc_super v3 = -[MPAddKeepLocalControl initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_super v4 = v3;
  if (v3)
  {
    v3->_allowsAddImage = 1;
    uint64_t v5 = [MEMORY[0x1E4FB1618] whiteColor];
    filledTintColor = v4->_filledTintColor;
    v4->_filledTintColor = (UIColor *)v5;
  }
  [(MPAddKeepLocalControl *)v4 setScaleImageForAccessibility:1];
  return v4;
}

+ (id)_imageNamed:(id)a3 compatibleWithTraitCollection:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4FB1818];
  double v6 = (void *)MEMORY[0x1E4F28B50];
  id v7 = a4;
  id v8 = a3;
  double v9 = [v6 bundleForClass:objc_opt_class()];
  double v10 = [v5 imageNamed:v8 inBundle:v9 compatibleWithTraitCollection:v7];

  return v10;
}

+ (id)controlTitleFontForControlStatusType:(int64_t)a3
{
  objc_super v3 = (void *)MEMORY[0x1E4FB1798];
  objc_msgSend(MEMORY[0x1E4FB1798], "smallSystemFontSize", a3);

  return (id)objc_msgSend(v3, "boldSystemFontOfSize:");
}

+ (id)_newControlTitleLabel
{
  id v2 = objc_alloc(MEMORY[0x1E4FB1930]);
  objc_super v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  objc_super v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setBackgroundColor:v4];

  return v3;
}

+ (CGSize)_expectedSizeForControlStatusType:(int64_t)a3 controlTitle:(id)a4 hasControlImage:(BOOL)a5 displayScale:(double)a6 preferredHeight:(double)a7
{
  BOOL v9 = a5;
  id v12 = a4;
  double v13 = v12;
  double v15 = *MEMORY[0x1E4F1DB30];
  double v14 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (a3)
  {
    if ([v12 length])
    {
      CGRect v16 = (void *)[a1 _newControlTitleLabel];
      CGRect v17 = [a1 controlTitleFontForControlStatusType:a3];
      [v16 setFont:v17];

      [v16 setText:v13];
      objc_msgSend(v16, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
      double v19 = v18;
      double v21 = v20;
      double SafeScaleForValue = MPFloatGetSafeScaleForValue(a6);
      double v23 = ceil(SafeScaleForValue * v19) / SafeScaleForValue;
      if (v9)
      {
        double v14 = fmax(v21, 28.0);
        v24 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
        [v24 _scaledValueForValue:8.0];
        double v26 = v15 + v23 + 5.0 + v25;

        double v15 = v14 + 0.0 + v26;
      }
      else
      {
        double v27 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
        [v27 _scaledValueForValue:8.0];
        double v15 = v15 + v23 + v28 * 2.0;
      }
      if (v14 <= a7) {
        double v14 = a7;
      }
    }
    else
    {
      if (a7 >= 28.0) {
        double v14 = a7;
      }
      else {
        double v14 = 28.0;
      }
      double v15 = v14;
    }
  }

  double v29 = v15;
  double v30 = v14;
  result.CGFloat height = v30;
  result.CGFloat width = v29;
  return result;
}

@end