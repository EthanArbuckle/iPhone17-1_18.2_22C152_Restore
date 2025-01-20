@interface HUDownloadControl
+ (CGSize)_expectedSizeForControlStatusType:(int64_t)a3 controlTitle:(id)a4 hasControlImage:(BOOL)a5 displayScale:(double)a6 preferredHeight:(double)a7 minTitleLength:(double)a8;
+ (id)_imageNamed:(id)a3 compatibleWithTraitCollection:(id)a4;
+ (id)_newControlTitleLabel;
+ (id)controlTitleFontForControlStatusType:(int64_t)a3;
- (BOOL)allowsAddImage;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)scaleImageForAccessibility;
- (BOOL)showStopImageWhenDownloading;
- (CGSize)intrinsicContentSize;
- (CGSize)maximumSizeWithPreferredHeight:(double)a3;
- (HUDownloadControl)initWithFrame:(CGRect)a3;
- (HUDownloadControlStatus)controlStatus;
- (UIColor)filledTintColor;
- (double)minTitleLength;
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
- (void)setControlStatus:(HUDownloadControlStatus)a3;
- (void)setControlStatus:(HUDownloadControlStatus)a3 animated:(BOOL)a4;
- (void)setDisplayStyle:(int64_t)a3;
- (void)setFilledTintColor:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setMinTitleLength:(double)a3;
- (void)setScaleImageForAccessibility:(BOOL)a3;
- (void)setShowStopImageWhenDownloading:(BOOL)a3;
- (void)setTitle:(id)a3 forControlStatusType:(int64_t)a4;
- (void)tintColorDidChange;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HUDownloadControl

- (HUDownloadControl)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HUDownloadControl;
  v3 = -[HUDownloadControl initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_allowsAddImage = 1;
    uint64_t v5 = [MEMORY[0x1E4F428B8] whiteColor];
    filledTintColor = v4->_filledTintColor;
    v4->_filledTintColor = (UIColor *)v5;

    v4->_minTitleLength = 0.0;
  }
  [(HUDownloadControl *)v4 setScaleImageForAccessibility:1];
  return v4;
}

- (void)dealloc
{
  if (self->_controlStatus.statusType == 3)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self name:*MEMORY[0x1E4F43708] object:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)HUDownloadControl;
  [(HUDownloadControl *)&v4 dealloc];
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)HUDownloadControl;
  [(HUDownloadControl *)&v3 didMoveToWindow];
  if ([(HUDownloadControl *)self _isInAWindow]) {
    [(HUDownloadControl *)self _updateControlImageViewAnimation];
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  if (-[HUDownloadControl pointInside:withEvent:](self, "pointInside:withEvent:", a4, a3.x, a3.y)
    && [(HUDownloadControl *)self isEnabled]
    && ([(HUDownloadControl *)self isHidden] & 1) == 0)
  {
    uint64_t v5 = self;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(HUDownloadControl *)self bounds];
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
  v13 = [(UILabel *)self->_controlTitleLabel text];
  if ([v13 length]) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = self->_downloadProgressView != 0;
  }

  return v11;
}

- (void)layoutSubviews
{
  *(void *)&v161.origin.CGFloat y = self;
  *(void *)&v161.size.CGFloat width = HUDownloadControl;
  [(CGFloat *)(objc_super *)&v161.origin.y layoutSubviews];
  [(HUDownloadControl *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  BOOL v11 = [(HUDownloadControl *)self traitCollection];
  [v11 displayScale];
  double SafeScaleForValue = HUFloatGetSafeScaleForValue(v12);

  [(UILabel *)self->_controlTitleLabel frame];
  CGFloat v143 = v14;
  CGFloat v16 = v15;
  -[UILabel sizeThatFits:](self->_controlTitleLabel, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  CGFloat v148 = v17;
  CGFloat r1 = v18;
  double v19 = *MEMORY[0x1E4F1DB20];
  CGFloat v20 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  double v155 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v156 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  uint64_t v21 = [(HUDownloadControl *)self contentHorizontalAlignment];
  controlImageView = self->_controlImageView;
  CGFloat v157 = v6;
  v161.origin.double x = v4;
  double v147 = SafeScaleForValue;
  if (controlImageView)
  {
    CGFloat rect_16 = v20;
    double v158 = v19;
    int64_t statusType = self->_controlStatus.statusType;
    [(UIImageView *)controlImageView frame];
    v24 = [(UILabel *)self->_controlTitleLabel text];
    uint64_t v25 = [v24 length];

    double v26 = fmin(v8, 45.0);
    double v27 = fmin(v10, 45.0);
    if (v25) {
      double v28 = v10;
    }
    else {
      double v28 = v27;
    }
    if (v25) {
      double v29 = v8;
    }
    else {
      double v29 = v26;
    }
    -[UIImageView sizeThatFits:](self->_controlImageView, "sizeThatFits:", v29, v28);
    p_controlImageEdgeInsets = &self->_controlImageEdgeInsets;
    double rect_24 = v31;
    double v142 = v32;
    UIRectCenteredYInRectScale();
    CGFloat rect = v33;
    CGFloat v152 = v35;
    double r2 = v34;
    CGFloat v146 = v36;
    v37 = [(UILabel *)self->_controlTitleLabel text];
    uint64_t v38 = [v37 length];

    if (v38)
    {
      UIRectCenteredYInRectScale();
      CGFloat rect_8 = v39;
      CGFloat v41 = v40;
      CGFloat v43 = v42;
      CGFloat v45 = v44;
      v46 = objc_msgSend(MEMORY[0x1E4F42A30], "preferredFontForTextStyle:", *MEMORY[0x1E4F43870], *(void *)&SafeScaleForValue);
      [v46 _scaledValueForValue:8.0];
      double v47 = v6 + 0.0;
      double v144 = v29;
      double v49 = v29 - (v48 + 5.0);

      CGFloat v149 = v45;
      double r1a = v43;
      CGFloat v132 = v47;
      CGFloat v133 = v49;
      if (v21 == 2)
      {
        v166.origin.double x = v4 + 5.0;
        v166.origin.CGFloat y = v47;
        v166.size.CGFloat width = v49;
        v166.size.CGFloat height = v28;
        double MaxX = CGRectGetMaxX(v166);
        v167.origin.double x = rect_8;
        v167.origin.CGFloat y = v41;
        double rect_8b = v28;
        CGFloat v65 = v43;
        v167.size.CGFloat width = v43;
        v167.size.CGFloat height = v45;
        CGFloat v66 = MaxX - CGRectGetWidth(v167);
        v168.origin.double x = v66;
        v168.origin.CGFloat y = v41;
        v168.size.CGFloat width = v43;
        v168.size.CGFloat height = v45;
        double MinX = CGRectGetMinX(v168);
        v169.origin.double x = rect;
        CGFloat v52 = v152;
        CGFloat v51 = r2;
        v169.origin.CGFloat y = r2;
        v169.size.CGFloat width = v152;
        CGFloat v53 = v146;
        v169.size.CGFloat height = v146;
        double x = MinX - CGRectGetWidth(v169);
        double v54 = v66;
        CGFloat v55 = v144;
        double v56 = v65;
        double v28 = rect_8b;
      }
      else if (v21 == 1)
      {
        v162.origin.double x = v4 + 5.0;
        v162.origin.CGFloat y = v47;
        v162.size.CGFloat width = v49;
        v162.size.CGFloat height = v28;
        v163.origin.double x = CGRectGetMinX(v162);
        double x = v163.origin.x;
        CGFloat v52 = v152;
        CGFloat v51 = r2;
        v163.origin.CGFloat y = r2;
        v163.size.CGFloat width = v152;
        CGFloat v53 = v146;
        v163.size.CGFloat height = v146;
        double v54 = CGRectGetMaxX(v163) + 0.0;
        CGFloat v55 = v144;
        double v56 = r1a;
      }
      else
      {
        v170.origin.double x = 0.0;
        v170.origin.CGFloat y = r2;
        v170.size.CGFloat width = v152;
        v170.size.CGFloat height = v146;
        v171.origin.double x = CGRectGetMaxX(v170) + 0.0;
        double rect_8c = v171.origin.x;
        v189.origin.double x = 0.0;
        v171.origin.CGFloat y = v41;
        v171.size.CGFloat height = v45;
        v171.size.CGFloat width = v43;
        v189.origin.CGFloat y = r2;
        v189.size.CGFloat width = v152;
        v189.size.CGFloat height = v146;
        CGRect v172 = CGRectUnion(v171, v189);
        CGFloat recta = v172.origin.x;
        CGFloat y = v172.origin.y;
        CGFloat width = v172.size.width;
        CGFloat height = v172.size.height;
        double v131 = SafeScaleForValue;
        UIRectCenteredXInRectScale();
        double v71 = CGRectGetMinX(v173);
        v174.origin.double x = recta;
        v174.origin.CGFloat y = y;
        v174.size.CGFloat width = width;
        CGFloat v51 = r2;
        v174.size.CGFloat height = height;
        double v72 = v71 - CGRectGetMinX(v174);
        CGFloat v53 = v146;
        CGFloat v52 = v152;
        double v73 = HUFloatGetSafeScaleForValue(SafeScaleForValue);
        double v56 = r1a;
        double v74 = round(v73 * v72) / v73;
        double x = v74 + 0.0;
        double v54 = rect_8c + v74;
        CGFloat v55 = v144;
      }
      CGFloat rect_8a = v54;
      CGFloat v145 = v41;
      CGFloat v75 = v41;
      CGFloat v76 = v45;
      v190.origin.double x = x;
      v190.origin.CGFloat y = v51;
      v190.size.CGFloat width = v52;
      v190.size.CGFloat height = v53;
      CGRect v175 = CGRectUnion(*(CGRect *)&v54, v190);
      CGFloat v77 = v175.origin.x;
      CGFloat v78 = v175.origin.y;
      CGFloat v79 = v175.size.width;
      CGFloat v80 = v175.size.height;
      v175.origin.double x = v161.origin.x + 5.0;
      v175.origin.CGFloat y = v132;
      v175.size.CGFloat width = v133;
      v175.size.CGFloat height = v28;
      double v81 = CGRectGetWidth(v175);
      v82 = [(HUDownloadControl *)self traitCollection];
      v83 = [v82 preferredContentSizeCategory];
      IsAccessibilityCategorCGFloat y = UIContentSizeCategoryIsAccessibilityCategory(v83);

      if (!IsAccessibilityCategory)
      {
        v176.origin.double x = v77;
        v176.origin.CGFloat y = v78;
        v176.size.CGFloat width = v79;
        v176.size.CGFloat height = v80;
        double v85 = CGRectGetWidth(v176) - v81;
        if (v85 <= 0.00000011920929) {
          double v85 = 0.0;
        }
        double r1a = r1a - v85;
      }
      double v4 = v161.origin.x;
      double v6 = v157;
      if (statusType == 1)
      {
        double v19 = v158;
        double v86 = rect_16;
        CGFloat v88 = v152;
        double v87 = r2;
        CGFloat v89 = v146;
      }
      else
      {
        double x = x - self->_controlImageEdgeInsets.left;
        double v87 = r2 - p_controlImageEdgeInsets->top;
        CGFloat v88 = rect_24;
        CGFloat v89 = v142;
        double v19 = v158;
        double v86 = rect_16;
      }
      [(UIImageView *)self->_controlImageView setFrame:HURectByApplyingUserInterfaceLayoutDirectionInRect(x, v87, v88, v89, v161.origin.x, v157, v55, v28)];
      controlTitleLabel = self->_controlTitleLabel;
      double v91 = HURectByApplyingUserInterfaceLayoutDirectionInRect(rect_8a, v145, r1a, v149, v161.origin.x, v157, v55, v28);
      CGFloat v20 = v86;
    }
    else
    {
      uint64_t v61 = 2;
      if (statusType != 3) {
        uint64_t v61 = v21;
      }
      if (v61 == 2)
      {
        v180.origin.double x = v4;
        v180.origin.CGFloat y = v6;
        v180.size.CGFloat width = v8;
        v180.size.CGFloat height = v10;
        double v108 = CGRectGetMaxX(v180);
        v181.origin.double x = rect;
        v181.size.CGFloat width = v152;
        double v62 = r2;
        v181.origin.CGFloat y = r2;
        double v63 = v146;
        v181.size.CGFloat height = v146;
        double v19 = v108 - CGRectGetWidth(v181) - self->_controlImageEdgeInsets.right;
        CGFloat v55 = v29;
      }
      else
      {
        CGFloat v55 = v29;
        double v62 = r2;
        if (v61 == 1)
        {
          v165.origin.double x = v4;
          v165.origin.CGFloat y = v6;
          v165.size.CGFloat width = v29;
          v165.size.CGFloat height = v28;
          double v19 = CGRectGetMinX(v165) - self->_controlImageEdgeInsets.left;
          double v63 = v146;
        }
        else
        {
          double v131 = v147;
          UIRectCenteredXInRectScale();
          double v19 = v109;
          double v62 = v110;
          CGFloat v152 = v111;
          double v63 = v112;
        }
      }
      controlTitleLabel = self->_controlImageView;
      double v91 = HURectByApplyingUserInterfaceLayoutDirectionInRect(v19, v62 - p_controlImageEdgeInsets->top, fmin(rect_24, 45.0), fmin(v142, 45.0), v4, v6, v55, v28);
      CGFloat v20 = v63;
      double v155 = v152;
      double v156 = v62;
    }
  }
  else
  {
    v57 = [(UILabel *)self->_controlTitleLabel text];
    uint64_t v58 = [v57 length];

    if (!v58) {
      goto LABEL_38;
    }
    if (v21 == 2)
    {
      v177.origin.double x = v4;
      v177.origin.CGFloat y = v6;
      v177.size.CGFloat width = v8;
      v177.size.CGFloat height = v10;
      CGRectGetMaxX(v177);
      uint64_t v59 = *MEMORY[0x1E4F43870];
      v92 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
      [v92 _scaledValueForValue:8.0];
      v178.origin.double x = v143;
      v178.origin.CGFloat y = v16;
      v178.size.CGFloat width = v148;
      v178.size.CGFloat height = r1;
      CGRectGetWidth(v178);
    }
    else if (v21 == 1)
    {
      v164.origin.double x = v4;
      v164.origin.CGFloat y = v6;
      v164.size.CGFloat width = v8;
      v164.size.CGFloat height = v10;
      CGRectGetMinX(v164);
      uint64_t v59 = *MEMORY[0x1E4F43870];
      v60 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
      [v60 _scaledValueForValue:8.0];
    }
    else
    {
      UIRectCenteredXInRectScale();
      uint64_t v59 = *MEMORY[0x1E4F43870];
    }
    UIRectCenteredYInRectScale();
    double v94 = v93;
    CGFloat v95 = v4;
    CGFloat v159 = v96;
    double v98 = v97;
    CGFloat v100 = v99;
    v101 = objc_msgSend(MEMORY[0x1E4F42A30], "preferredFontForTextStyle:", v59, *(void *)&v147);
    [v101 _scaledValueForValue:8.0];
    double v103 = v94 - v102;

    v104 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:v59];
    [v104 _scaledValueForValue:8.0];
    double v155 = v98 + v105 * 2.0;

    v179.origin.double x = v95;
    v179.origin.CGFloat y = v6;
    v179.size.CGFloat width = v8;
    v179.size.CGFloat height = v10;
    CGFloat v106 = CGRectGetHeight(v179);
    controlTitleLabel = self->_controlTitleLabel;
    CGFloat v107 = v94;
    double v19 = v103;
    double v4 = v95;
    CGFloat v20 = v106;
    double v91 = HURectByApplyingUserInterfaceLayoutDirectionInRect(v107, v159, v98, v100, v4, v6, v8, v10);
    double v156 = 0.0;
    double v28 = v10;
    CGFloat v55 = v8;
  }
  objc_msgSend(controlTitleLabel, "setFrame:", v91, *(void *)&v131);
  double v10 = v28;
  double v8 = v55;
LABEL_38:
  if (!self->_downloadProgressView) {
    goto LABEL_51;
  }
  CGFloat v160 = v19;
  v182.origin.double x = v4;
  v182.origin.CGFloat y = v6;
  v182.size.CGFloat width = v8;
  v182.size.CGFloat height = v10;
  double v113 = CGRectGetWidth(v182);
  v183.origin.double x = v4;
  v183.origin.CGFloat y = v6;
  v183.size.CGFloat width = v8;
  v183.size.CGFloat height = v10;
  double v114 = CGRectGetHeight(v183);
  if (v113 >= v114) {
    CGFloat v115 = v114;
  }
  else {
    CGFloat v115 = v113;
  }
  [(HUDownloadProgressView *)self->_downloadProgressView frame];
  CGFloat v117 = v116;
  CGFloat v119 = v118;
  CGFloat r2a = v10;
  if (v21 == 2)
  {
    v185.origin.double x = v4;
    CGFloat v120 = v156;
    v185.origin.CGFloat y = v6;
    v185.size.CGFloat width = v8;
    v185.size.CGFloat height = v10;
    double v122 = CGRectGetMaxX(v185);
    v186.origin.double x = v117;
    v186.origin.CGFloat y = v119;
    v186.size.CGFloat width = v115;
    v186.size.CGFloat height = v115;
    double v121 = v122 - CGRectGetWidth(v186);
  }
  else
  {
    CGFloat v120 = v156;
    if (v21 != 1)
    {
      UIRectCenteredIntegralRectScale();
      double v121 = v124;
      CGFloat v119 = v125;
      CGFloat v115 = v126;
      CGFloat v123 = v127;
      goto LABEL_48;
    }
    v184.origin.double x = v161.origin.x;
    v184.origin.CGFloat y = v6;
    v184.size.CGFloat width = v8;
    v184.size.CGFloat height = v10;
    double v121 = CGRectGetMinX(v184);
  }
  CGFloat v123 = v115;
LABEL_48:
  v187.origin.double x = v160;
  v187.origin.CGFloat y = v120;
  v187.size.CGFloat width = v155;
  v187.size.CGFloat height = v20;
  if (!CGRectIsNull(v187))
  {
    v188.origin.double x = v160;
    v188.origin.CGFloat y = v120;
    v188.size.CGFloat width = v155;
    v188.size.CGFloat height = v20;
    v191.origin.double x = v121;
    v191.origin.CGFloat y = v119;
    v191.size.CGFloat width = v115;
    v191.size.CGFloat height = v123;
    CGRectUnion(v188, v191);
  }
  CGFloat v128 = v121;
  CGFloat v129 = v123;
  double v4 = v161.origin.x;
  double v6 = v157;
  double v10 = r2a;
  [(HUDownloadProgressView *)self->_downloadProgressView setFrame:HURectByApplyingUserInterfaceLayoutDirectionInRect(v128, v119, v115, v129, v161.origin.x, v157, v8, r2a)];
LABEL_51:
  backgroundView = self->_backgroundView;
  if (backgroundView)
  {
    -[UIView setFrame:](backgroundView, "setFrame:", v4, v6, v8, v10);
    [(HUDownloadControl *)self _updateBackgroundViewCornerRadius];
  }
}

- (CGSize)maximumSizeWithPreferredHeight:(double)a3
{
  double v5 = [(HUDownloadControl *)self traitCollection];
  [v5 displayScale];
  double SafeScaleForValue = HUFloatGetSafeScaleForValue(v6);

  uint64_t v8 = 0;
  double v9 = *MEMORY[0x1E4F1DB30];
  double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  do
  {
    uint64_t v11 = *(void *)((char *)&v24 + v8);
    double v12 = objc_opt_class();
    v13 = [(HUDownloadControl *)self titleForControlStatusType:v11];
    BOOL v15 = self->_allowsAddImage || v11 != 1;
    double v16 = HUFloatGetSafeScaleForValue(SafeScaleForValue);
    [(HUDownloadControl *)self minTitleLength];
    [v12 _expectedSizeForControlStatusType:v11 controlTitle:v13 hasControlImage:v15 displayScale:v16 preferredHeight:a3 minTitleLength:v17];
    double v19 = v18;
    double v21 = v20;

    if (v9 < v19) {
      double v9 = v19;
    }
    if (v10 < v21) {
      double v10 = v21;
    }
    v8 += 8;
  }
  while (v8 != 56);
  double v22 = v9;
  double v23 = v10;
  result.CGFloat height = v23;
  result.CGFloat width = v22;
  return result;
}

- (CGSize)intrinsicContentSize
{
  int64_t statusType = self->_controlStatus.statusType;
  double v4 = [(HUDownloadControl *)self traitCollection];
  [v4 displayScale];
  double SafeScaleForValue = HUFloatGetSafeScaleForValue(v5);

  double v7 = [(HUDownloadControl *)self titleForControlStatusType:statusType];
  uint64_t v8 = objc_opt_class();
  BOOL v10 = self->_allowsAddImage || statusType != 1;
  double v11 = HUFloatGetSafeScaleForValue(SafeScaleForValue);
  [(HUDownloadControl *)self minTitleLength];
  [v8 _expectedSizeForControlStatusType:statusType controlTitle:v7 hasControlImage:v10 displayScale:v11 preferredHeight:28.0 minTitleLength:v12];
  double v14 = v13;
  double v16 = v15;
  int64_t v17 = [(HUDownloadControl *)self displayStyle];
  if (v7) {
    BOOL v18 = v17 == 1;
  }
  else {
    BOOL v18 = 0;
  }
  if (v18) {
    double v14 = v14 + 6.0;
  }

  double v19 = v14;
  double v20 = v16;
  result.CGFloat height = v20;
  result.CGFloat width = v19;
  return result;
}

- (void)tintColorDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)HUDownloadControl;
  [(HUDownloadControl *)&v4 tintColorDidChange];
  double v3 = [(HUDownloadControl *)self tintColor];
  if (self->_displayStyle == 1) {
    [(UIView *)self->_backgroundView setBackgroundColor:v3];
  }
  [(HUDownloadControl *)self _updateControlTitleLabelVisualProperties];
  if (self->_controlStatus.statusType == 2 && self->_traitCollectionDidChangeWasCalled) {
    [(HUDownloadControl *)self _updateControlStatusProperties];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUDownloadControl;
  [(HUDownloadControl *)&v11 traitCollectionDidChange:v4];
  double v5 = [(HUDownloadControl *)self traitCollection];
  [v5 displayScale];
  float v7 = v6;
  [v4 displayScale];
  *(float *)&double v8 = v8;
  if (vabds_f32(v7, *(float *)&v8) >= 0.00000011921
    || ([v5 preferredContentSizeCategory],
        double v9 = objc_claimAutoreleasedReturnValue(),
        [v4 preferredContentSizeCategory],
        BOOL v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v9 != v10))
  {
    [(HUDownloadControl *)self _updateControlStatusProperties];
  }
  self->_traitCollectionDidChangeWasCalled = 1;
}

- (void)setContentHorizontalAlignment:(int64_t)a3
{
  uint64_t v5 = [(HUDownloadControl *)self contentHorizontalAlignment];
  v6.receiver = self;
  v6.super_class = (Class)HUDownloadControl;
  [(HUDownloadControl *)&v6 setContentHorizontalAlignment:a3];
  if (v5 != [(HUDownloadControl *)self contentHorizontalAlignment]) {
    [(HUDownloadControl *)self setNeedsLayout];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)HUDownloadControl;
  [(HUDownloadControl *)&v5 touchesCancelled:a3 withEvent:a4];
  self->_hadFirstTouchHighlight = 0;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)HUDownloadControl;
  [(HUDownloadControl *)&v5 touchesEnded:a3 withEvent:a4];
  self->_hadFirstTouchHighlight = 0;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(HUDownloadControl *)self isHighlighted];
  v12.receiver = self;
  v12.super_class = (Class)HUDownloadControl;
  [(HUDownloadControl *)&v12 setHighlighted:v3];
  int v6 = [(HUDownloadControl *)self isHighlighted];
  if (v5 != v6)
  {
    char v7 = v6;
    double v8 = 1.0;
    if (v6)
    {
      [(HUDownloadControl *)self _beginTransientContentViewTransaction];
      double v8 = 0.2;
    }
    if (self->_hadFirstTouchHighlight)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __36__HUDownloadControl_setHighlighted___block_invoke;
      v11[3] = &unk_1E6385738;
      v11[4] = self;
      *(double *)&v11[5] = v8;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __36__HUDownloadControl_setHighlighted___block_invoke_2;
      v9[3] = &unk_1E638B020;
      char v10 = v7;
      v9[4] = self;
      [MEMORY[0x1E4F42FF0] animateWithDuration:327684 delay:v11 options:v9 animations:0.47 completion:0.0];
    }
    else
    {
      self->_hadFirstTouchHighlight = 1;
      [(UIView *)self->_transientContentView setAlpha:v8];
      if ((v7 & 1) == 0) {
        [(HUDownloadControl *)self _endTransientContentViewTransaction];
      }
    }
  }
}

uint64_t __36__HUDownloadControl_setHighlighted___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 544) setAlpha:*(double *)(a1 + 40)];
}

uint64_t __36__HUDownloadControl_setHighlighted___block_invoke_2(uint64_t result)
{
  if (!*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) _endTransientContentViewTransaction];
  }
  return result;
}

- (void)setAllowsAddImage:(BOOL)a3
{
  if (self->_allowsAddImage != a3)
  {
    self->_allowsAddImage = a3;
    if (self->_controlStatus.statusType == 1) {
      [(HUDownloadControl *)self _updateControlStatusProperties];
    }
  }
}

- (void)setDisplayStyle:(int64_t)a3
{
  if (self->_displayStyle != a3)
  {
    self->_displayStyle = a3;
    [(HUDownloadControl *)self _updateControlStatusProperties];
    [(HUDownloadControl *)self _updateControlTitleLabelVisualProperties];
  }
}

- (void)setControlStatus:(HUDownloadControlStatus)a3
{
}

- (void)setControlStatus:(HUDownloadControlStatus)a3 animated:(BOOL)a4
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
  self->_controlStatus.downloadProgress = a3.downloadProgress;
  int64_t v8 = self->_controlStatusRevision + 1;
  self->_controlStatusRevision = v8;
  if (a3.statusType == 4 && statusType == 4)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __47__HUDownloadControl_setControlStatus_animated___block_invoke;
    aBlock[3] = &unk_1E6386018;
    aBlock[4] = self;
    double v9 = _Block_copy(aBlock);
    char v10 = v9;
    if (v4) {
      [MEMORY[0x1E4F42FF0] animateWithDuration:134 delay:v9 options:0 animations:0.25 completion:0.0];
    }
    else {
      (*((void (**)(void *))v9 + 2))(v9);
    }

    return;
  }
  if (a3.statusType == 3)
  {
    if (statusType == 3) {
      goto LABEL_13;
    }
    objc_super v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:self selector:sel__applicationWillEnterForegroundNotification_ name:*MEMORY[0x1E4F43708] object:0];
  }
  else
  {
    if (statusType != 3) {
      goto LABEL_13;
    }
    objc_super v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 removeObserver:self name:*MEMORY[0x1E4F43708] object:0];
  }

LABEL_13:
  objc_super v12 = [(HUDownloadControl *)self traitCollection];
  double v13 = [v12 preferredContentSizeCategory];
  char v14 = [v13 isEqualToString:*MEMORY[0x1E4F437D0]];

  BOOL v15 = statusType != 4 || !v4;
  if (v15 || p_controlStatus->statusType != 5)
  {
    if ((v14 & 1) == 0)
    {
      [(HUDownloadControl *)self _updateControlStatusProperties];
    }
  }
  else
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __47__HUDownloadControl_setControlStatus_animated___block_invoke_2;
    v18[3] = &unk_1E6386018;
    v18[4] = self;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __47__HUDownloadControl_setControlStatus_animated___block_invoke_3;
    v16[3] = &unk_1E638B070;
    v16[4] = self;
    v16[5] = v8;
    char v17 = v14 ^ 1;
    [MEMORY[0x1E4F42FF0] animateWithDuration:134 delay:v18 options:v16 animations:0.25 completion:0.0];
  }
}

uint64_t __47__HUDownloadControl_setControlStatus_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 496) setDownloadProgress:*(double *)(*(void *)(a1 + 32) + 600)];
}

uint64_t __47__HUDownloadControl_setControlStatus_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 496) setDownloadProgress:1.0];
}

void __47__HUDownloadControl_setControlStatus_animated___block_invoke_3(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__HUDownloadControl_setControlStatus_animated___block_invoke_4;
  block[3] = &unk_1E638B048;
  uint64_t v3 = *(void *)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  block[5] = v3;
  char v5 = *(unsigned char *)(a1 + 48);
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
}

void *__47__HUDownloadControl_setControlStatus_animated___block_invoke_4(uint64_t a1)
{
  CGSize result = *(void **)(a1 + 32);
  if (result[61] == *(void *)(a1 + 40))
  {
    if (*(unsigned char *)(a1 + 48)) {
      return (void *)[result _updateControlStatusProperties];
    }
  }
  return result;
}

- (void)setFilledTintColor:(id)a3
{
  id v7 = a3;
  char v5 = [(HUDownloadControl *)self filledTintColor];
  char v6 = [v7 isEqual:v5];

  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_filledTintColor, a3);
    if (self->_displayStyle == 1)
    {
      [(HUDownloadControl *)self _updateControlTitleLabelVisualProperties];
      [(HUDownloadControl *)self _updateControlStatusProperties];
    }
  }
}

- (void)setTitle:(id)a3 forControlStatusType:(int64_t)a4
{
  id v12 = a3;
  char v6 = [NSNumber numberWithInteger:a4];
  controlStatusTypeToTitle = self->_controlStatusTypeToTitle;
  if (v12)
  {
    if (!controlStatusTypeToTitle)
    {
      int64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      double v9 = self->_controlStatusTypeToTitle;
      self->_controlStatusTypeToTitle = v8;

      controlStatusTypeToTitle = self->_controlStatusTypeToTitle;
    }
    char v10 = [NSNumber numberWithInteger:a4];
    objc_super v11 = [(NSMutableDictionary *)controlStatusTypeToTitle objectForKey:v10];

    if ([v11 isEqualToString:v12])
    {

      goto LABEL_12;
    }
    [(NSMutableDictionary *)self->_controlStatusTypeToTitle setObject:v12 forKey:v6];
  }
  else
  {
    [(NSMutableDictionary *)controlStatusTypeToTitle removeObjectForKey:v6];
    if ([(NSMutableDictionary *)self->_controlStatusTypeToTitle count]) {
      goto LABEL_10;
    }
    objc_super v11 = self->_controlStatusTypeToTitle;
    self->_controlStatusTypeToTitle = 0;
  }

LABEL_10:
  if (self->_controlStatus.statusType == a4) {
    [(HUDownloadControl *)self _updateControlStatusProperties];
  }
LABEL_12:
}

- (id)titleForControlStatusType:(int64_t)a3
{
  controlStatusTypeToTitle = self->_controlStatusTypeToTitle;
  BOOL v4 = [NSNumber numberWithInteger:a3];
  char v5 = [(NSMutableDictionary *)controlStatusTypeToTitle objectForKey:v4];

  return v5;
}

+ (CGSize)_expectedSizeForControlStatusType:(int64_t)a3 controlTitle:(id)a4 hasControlImage:(BOOL)a5 displayScale:(double)a6 preferredHeight:(double)a7 minTitleLength:(double)a8
{
  BOOL v11 = a5;
  id v14 = a4;
  BOOL v15 = v14;
  double v17 = *MEMORY[0x1E4F1DB30];
  double v16 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (a3)
  {
    if ([v14 length])
    {
      BOOL v18 = (void *)[a1 _newControlTitleLabel];
      double v19 = [a1 controlTitleFontForControlStatusType:a3];
      [v18 setFont:v19];

      [v18 setText:v15];
      objc_msgSend(v18, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
      double v21 = v20;
      double v23 = v22;
      double SafeScaleForValue = HUFloatGetSafeScaleForValue(a6);
      double v25 = ceil(SafeScaleForValue * v21) / SafeScaleForValue;
      if (v25 >= a8) {
        a8 = v25;
      }
      if (v11)
      {
        double v16 = fmax(v23, 28.0);
        double v26 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
        [v26 _scaledValueForValue:8.0];
        double v28 = v17 + a8 + 5.0 + v27;

        double v17 = v16 + 0.0 + v28;
      }
      else
      {
        double v29 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
        [v29 _scaledValueForValue:8.0];
        double v17 = v17 + a8 + v30 * 2.0;
      }
      if (v16 <= a7) {
        double v16 = a7;
      }
    }
    else
    {
      if (a7 >= 28.0) {
        double v16 = a7;
      }
      else {
        double v16 = 28.0;
      }
      double v17 = v16;
    }
  }

  double v31 = v17;
  double v32 = v16;
  result.CGFloat height = v32;
  result.CGFloat width = v31;
  return result;
}

+ (id)_newControlTitleLabel
{
  id v2 = objc_alloc(MEMORY[0x1E4F42B38]);
  uint64_t v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  BOOL v4 = [MEMORY[0x1E4F428B8] clearColor];
  [v3 setBackgroundColor:v4];

  return v3;
}

+ (id)controlTitleFontForControlStatusType:(int64_t)a3
{
  return (id)[MEMORY[0x1E4F6A420] preferredFontForTextStyle:*MEMORY[0x1E4F438D8] traits:2];
}

+ (id)_imageNamed:(id)a3 compatibleWithTraitCollection:(id)a4
{
  char v5 = (void *)MEMORY[0x1E4F42A80];
  char v6 = (void *)MEMORY[0x1E4F28B50];
  id v7 = a4;
  id v8 = a3;
  double v9 = [v6 bundleForClass:objc_opt_class()];
  char v10 = [v5 imageNamed:v8 inBundle:v9 compatibleWithTraitCollection:v7];

  return v10;
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
      id v4 = objc_alloc(MEMORY[0x1E4F42FF0]);
      [(HUDownloadControl *)self bounds];
      char v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
      transientContentView = self->_transientContentView;
      self->_transientContentView = v5;

      [(HUDownloadControl *)self insertSubview:self->_transientContentView atIndex:0];
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = [(HUDownloadControl *)self subviews];
    id v8 = (void *)[v7 copy];

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
          double v13 = self->_transientContentView;
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
          -[HUDownloadControl addSubview:](self, "addSubview:");
          transientContentView = self->_transientContentView;
        }
        [(UIView *)transientContentView removeFromSuperview];
        uint64_t v10 = self->_transientContentView;
        self->_transientContentView = 0;

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (id)_currentContentSuperview
{
  if (self->_transientContentViewTransactionCount >= 1) {
    self = (HUDownloadControl *)self->_transientContentView;
  }
  return self;
}

- (void)_updateControlTitleLabelVisualProperties
{
  if (self->_controlStatus.statusType == 5)
  {
    controlTitleLabel = self->_controlTitleLabel;
    uint64_t v3 = [MEMORY[0x1E4F428B8] systemGrayColor];
  }
  else
  {
    controlTitleLabel = self->_controlTitleLabel;
    if (self->_displayStyle == 1) {
      [(HUDownloadControl *)self filledTintColor];
    }
    else {
    uint64_t v3 = [(HUDownloadControl *)self tintColor];
    }
  }
  id v4 = (id)v3;
  -[UILabel setTextColor:](controlTitleLabel, "setTextColor:");
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

- (void)_updateControlStatusProperties
{
  id v50 = [(HUDownloadControl *)self traitCollection];
  [v50 displayScale];
  float v3 = v4;
  *(float *)&double v4 = fabsf(v3);
  if (v3 < 0.0 || *(float *)&v4 < 0.00000011921) {
    goto LABEL_52;
  }
  uint64_t v6 = objc_msgSend(v50, "preferredContentSizeCategory", v4);
  char v7 = [v6 isEqualToString:*MEMORY[0x1E4F437D0]];

  if (v7) {
    goto LABEL_52;
  }
  int64_t statusType = self->_controlStatus.statusType;
  downloadProgressView = self->_downloadProgressView;
  if (statusType == 4)
  {
    if (!downloadProgressView)
    {
      id v10 = [HUDownloadProgressView alloc];
      [(HUDownloadControl *)self bounds];
      long long v11 = -[HUDownloadProgressView initWithFrame:](v10, "initWithFrame:");
      CGRect v12 = self->_downloadProgressView;
      self->_downloadProgressView = v11;

      CGRect v13 = self->_downloadProgressView;
      long long v14 = [MEMORY[0x1E4F428B8] systemFillColor];
      [(HUDownloadProgressView *)v13 setOuterRingColor:v14];

      if ([(HUDownloadControl *)self showStopImageWhenDownloading])
      {
        long long v15 = [(id)objc_opt_class() _imageNamed:@"UniversalDownloadProgressStopButton" compatibleWithTraitCollection:v50];
        [(HUDownloadProgressView *)self->_downloadProgressView setCenterImage:v15];
      }
      uint64_t v16 = [(HUDownloadControl *)self _currentContentSuperview];
      [v16 addSubview:self->_downloadProgressView];

      downloadProgressView = self->_downloadProgressView;
    }
    [(HUDownloadProgressView *)downloadProgressView setDownloadProgress:self->_controlStatus.downloadProgress];
    goto LABEL_17;
  }
  [(HUDownloadProgressView *)downloadProgressView removeFromSuperview];
  long long v17 = self->_downloadProgressView;
  self->_downloadProgressView = 0;

  if (statusType != 1 || self->_displayStyle != 1)
  {
LABEL_17:
    [(UIView *)self->_backgroundView removeFromSuperview];
    backgroundView = self->_backgroundView;
    self->_backgroundView = 0;

    CGFloat v25 = *MEMORY[0x1E4F437F8];
    double v24 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    CGFloat v27 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    CGFloat v26 = *(double *)(MEMORY[0x1E4F437F8] + 24);
    switch(statusType)
    {
      case 1:
        goto LABEL_18;
      case 2:
        double v31 = objc_opt_class();
        double v32 = @"UniversalAddControlDownloadable";
        goto LABEL_27;
      case 3:
        double v31 = objc_opt_class();
        double v32 = @"UniversalAddControlWaiting";
        goto LABEL_27;
      case 5:
        double v33 = [(HUDownloadControl *)self titleForControlStatusType:5];
        if ([v33 length])
        {
        }
        else
        {
          double v34 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
          int v35 = [v34 BOOLForKey:@"HUDownloadControlShouldShowDownloadedIndicator"];

          if (!v35) {
            goto LABEL_36;
          }
        }
        double v29 = [(id)objc_opt_class() _imageNamed:@"UniversalAddControlDownloaded" compatibleWithTraitCollection:v50];
        if (fabsf(v3 + -2.0) >= 0.00000011921) {
          double v24 = -2.0;
        }
        else {
          double v24 = -1.5;
        }
        if (self->_displayStyle == 1) {
          [MEMORY[0x1E4F428B8] systemGrayColor];
        }
        else {
        double v30 = [(id)objc_opt_class() systemLightGrayColor];
        }
        CGFloat v27 = 0.0;
        CGFloat v26 = -3.0;
        CGFloat v25 = 0.0;
        break;
      case 6:
        double v31 = objc_opt_class();
        double v32 = @"UniversalAddControlError";
        goto LABEL_27;
      case 7:
        double v31 = objc_opt_class();
        double v32 = @"UniversalAddControlPaused";
LABEL_27:
        double v29 = [v31 _imageNamed:v32 compatibleWithTraitCollection:v50];
        double v30 = 0;
        goto LABEL_39;
      default:
        goto LABEL_36;
    }
    goto LABEL_39;
  }
  if (!self->_backgroundView)
  {
    id v18 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [(HUDownloadControl *)self bounds];
    uint64_t v19 = (UIView *)objc_msgSend(v18, "initWithFrame:");
    double v20 = self->_backgroundView;
    self->_backgroundView = v19;

    double v21 = self->_backgroundView;
    double v22 = [(HUDownloadControl *)self tintColor];
    [(UIView *)v21 setBackgroundColor:v22];

    [(UIView *)self->_backgroundView setClipsToBounds:1];
    [(HUDownloadControl *)self _updateBackgroundViewCornerRadius];
    double v23 = [(HUDownloadControl *)self _currentContentSuperview];
    [v23 insertSubview:self->_backgroundView atIndex:0];
  }
  CGFloat v25 = *MEMORY[0x1E4F437F8];
  double v24 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  CGFloat v27 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  CGFloat v26 = *(double *)(MEMORY[0x1E4F437F8] + 24);
LABEL_18:
  if (!self->_allowsAddImage)
  {
LABEL_36:
    double v30 = 0;
    self->_controlImageEdgeInsets.top = v25;
    self->_controlImageEdgeInsets.left = v24;
    self->_controlImageEdgeInsets.bottom = v27;
    self->_controlImageEdgeInsets.right = v26;
    goto LABEL_45;
  }
  double v29 = [(id)objc_opt_class() _imageNamed:@"UniversalAddControlAdd" compatibleWithTraitCollection:v50];
  CGFloat v26 = 3.0;
  if (self->_displayStyle == 1)
  {
    double v30 = [(HUDownloadControl *)self filledTintColor];
  }
  else
  {
    double v30 = 0;
  }
  CGFloat v27 = 3.0;
  double v24 = 3.0;
  CGFloat v25 = 3.0;
LABEL_39:
  self->_controlImageEdgeInsets.top = v25;
  self->_controlImageEdgeInsets.left = v24;
  self->_controlImageEdgeInsets.bottom = v27;
  self->_controlImageEdgeInsets.right = v26;
  if (v29)
  {
    controlImageView = self->_controlImageView;
    if (!controlImageView)
    {
      id v37 = objc_alloc(MEMORY[0x1E4F42AA0]);
      uint64_t v38 = (UIImageView *)objc_msgSend(v37, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      double v39 = self->_controlImageView;
      self->_controlImageView = v38;

      double v40 = [(HUDownloadControl *)self _currentContentSuperview];
      [v40 addSubview:self->_controlImageView];

      controlImageView = self->_controlImageView;
    }
    [(UIImageView *)controlImageView setTintColor:v30];
    [(UIImageView *)self->_controlImageView setImage:v29];
    if ([(HUDownloadControl *)self scaleImageForAccessibility]) {
      [(UIImageView *)self->_controlImageView setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
    }
    [(HUDownloadControl *)self _updateControlImageViewAnimation];
    goto LABEL_46;
  }
LABEL_45:
  [(UIImageView *)self->_controlImageView removeFromSuperview];
  double v29 = self->_controlImageView;
  self->_controlImageView = 0;
LABEL_46:

  CGFloat v41 = [(HUDownloadControl *)self titleForControlStatusType:statusType];
  uint64_t v42 = [v41 length];
  controlTitleLabel = self->_controlTitleLabel;
  if (v42)
  {
    if (!controlTitleLabel)
    {
      double v44 = (UILabel *)[(id)objc_opt_class() _newControlTitleLabel];
      CGFloat v45 = self->_controlTitleLabel;
      self->_controlTitleLabel = v44;

      v46 = [(HUDownloadControl *)self _currentContentSuperview];
      [v46 addSubview:self->_controlTitleLabel];
    }
    [(HUDownloadControl *)self _updateControlTitleLabelVisualProperties];
    double v47 = self->_controlTitleLabel;
    double v48 = [(id)objc_opt_class() controlTitleFontForControlStatusType:statusType];
    [(UILabel *)v47 setFont:v48];

    [(UILabel *)self->_controlTitleLabel setText:v41];
  }
  else
  {
    [(UILabel *)controlTitleLabel removeFromSuperview];
    double v49 = self->_controlTitleLabel;
    self->_controlTitleLabel = 0;
  }
  [(HUDownloadControl *)self setNeedsLayout];

LABEL_52:
}

- (void)_updateControlImageViewAnimation
{
  controlImageView = self->_controlImageView;
  if (controlImageView)
  {
    id v15 = [(UIImageView *)controlImageView layer];
    if (self->_controlStatus.statusType == 3)
    {
      double v4 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.rotation.z"];
      uint64_t v5 = [v15 presentationLayer];
      if (v5) {
        uint64_t v6 = v5;
      }
      else {
        uint64_t v6 = v15;
      }
      char v7 = [v4 keyPath];
      double v8 = [v6 valueForKeyPath:v7];

      [v4 setFromValue:v8];
      double v9 = NSNumber;
      [v8 floatValue];
      long long v11 = objc_msgSend(v9, "numberWithDouble:", (double)(fmod(v10, 6.28318531) + 6.28318531));
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
      [v15 addAnimation:v4 forKey:@"_HUDownloadControlWaitingSpinnerAnimationKey"];
    }
    else
    {
      [v15 removeAnimationForKey:@"_HUDownloadControlWaitingSpinnerAnimationKey"];
    }
  }
}

- (BOOL)allowsAddImage
{
  return self->_allowsAddImage;
}

- (HUDownloadControlStatus)controlStatus
{
  p_controlStatus = &self->_controlStatus;
  int64_t statusType = self->_controlStatus.statusType;
  double downloadProgress = p_controlStatus->downloadProgress;
  result.double downloadProgress = downloadProgress;
  result.int64_t statusType = statusType;
  return result;
}

- (int64_t)displayStyle
{
  return self->_displayStyle;
}

- (BOOL)scaleImageForAccessibility
{
  return self->_scaleImageForAccessibility;
}

- (void)setScaleImageForAccessibility:(BOOL)a3
{
  self->_scaleImageForAccessibilitCGFloat y = a3;
}

- (BOOL)showStopImageWhenDownloading
{
  return self->_showStopImageWhenDownloading;
}

- (void)setShowStopImageWhenDownloading:(BOOL)a3
{
  self->_showStopImageWhenDownloading = a3;
}

- (UIColor)filledTintColor
{
  return self->_filledTintColor;
}

- (double)minTitleLength
{
  return self->_minTitleLength;
}

- (void)setMinTitleLength:(double)a3
{
  self->_minTitleLength = a3;
}

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

@end