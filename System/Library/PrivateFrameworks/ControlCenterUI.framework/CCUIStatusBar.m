@interface CCUIStatusBar
+ (Class)statusBarClass;
- (BOOL)alignCompactAndExpandedStatusBars;
- (CCUIStatusBar)initWithFrame:(CGRect)a3;
- (CCUIStatusBarDelegate)delegate;
- (CGAffineTransform)compactScaleTransform;
- (CGRect)compactAvoidanceFrame;
- (CGRect)expandedAvoidanceFrame;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIEdgeInsets)compactEdgeInsets;
- (UIEdgeInsets)expandedEdgeInsets;
- (UIStatusBarStyleRequest)compactTrailingStyleRequest;
- (double)compactTrailingAlpha;
- (double)expandedStatusBarTranslation;
- (double)expandedTrailingAlpha;
- (double)leadingAlpha;
- (double)maxCompactScaleFactor;
- (double)verticalSecondaryServiceDelta;
- (id)expandedStatusBar;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)orientation;
- (unint64_t)leadingState;
- (unint64_t)trailingState;
- (void)_updateCompactTrailingStatusBarStyleRequestAndAvoidanceFrame;
- (void)_updateMetricsIfNeeded;
- (void)_updateShadow;
- (void)controlCenterApplyPrimaryContentShadow;
- (void)layoutSubviews;
- (void)prepareForPresentation;
- (void)setAlignCompactAndExpandedStatusBars:(BOOL)a3;
- (void)setCompactEdgeInsets:(UIEdgeInsets)a3;
- (void)setCompactScaleTransform:(CGAffineTransform *)a3;
- (void)setCompactTrailingAlpha:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setExpandedEdgeInsets:(UIEdgeInsets)a3;
- (void)setExpandedStatusBarTranslation:(double)a3;
- (void)setExpandedTrailingAlpha:(double)a3;
- (void)setLeadingAlpha:(double)a3;
- (void)setLeadingState:(unint64_t)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setTrailingState:(unint64_t)a3;
@end

@implementation CCUIStatusBar

- (CCUIStatusBar)initWithFrame:(CGRect)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)CCUIStatusBar;
  v3 = -[CCUIStatusBar initWithFrame:](&v25, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CCUIStatusBar *)v3 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    v13 = (objc_class *)[(id)objc_opt_class() statusBarClass];
    uint64_t v14 = objc_msgSend([v13 alloc], "initWithFrame:showForegroundView:", 1, v6, v8, v10, v12);
    compactTrailingStatusBar = v4->_compactTrailingStatusBar;
    v4->_compactTrailingStatusBar = (UIStatusBar *)v14;

    v16 = CCUIStatusBarForStatusBar(v4->_compactTrailingStatusBar);
    v17 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v16 setTargetScreen:v17];

    v18 = v4->_compactTrailingStatusBar;
    v26[0] = *MEMORY[0x1E4FB32E8];
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    [(UIStatusBar *)v18 setEnabledPartIdentifiers:v19];

    [(CCUIStatusBar *)v4 addSubview:v4->_compactTrailingStatusBar];
    uint64_t v20 = objc_msgSend([v13 alloc], "initWithFrame:showForegroundView:", 1, v6, v8, v10, v12);
    expandedStatusBar = v4->_expandedStatusBar;
    v4->_expandedStatusBar = (UIStatusBar *)v20;

    v22 = CCUIStatusBarForStatusBar(v4->_expandedStatusBar);
    v23 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v22 setTargetScreen:v23];

    [(UIStatusBar *)v4->_expandedStatusBar requestStyle:1 animated:0];
    [(UIStatusBar *)v4->_expandedStatusBar setMode:1];
    [(CCUIStatusBar *)v4 addSubview:v4->_expandedStatusBar];
    [(CCUIStatusBar *)v4 setCompactTrailingAlpha:1.0];
  }
  return v4;
}

+ (Class)statusBarClass
{
  CCUIStatusBarIsSpeakeasy();
  v2 = objc_opt_class();

  return (Class)v2;
}

- (void)prepareForPresentation
{
  self->_needsUpdatedMetrics = 1;
}

- (void)_updateMetricsIfNeeded
{
  if (self->_needsUpdatedMetrics)
  {
    [(UIStatusBar *)self->_compactTrailingStatusBar setNeedsLayout];
    [(UIStatusBar *)self->_compactTrailingStatusBar layoutIfNeeded];
    [(UIStatusBar *)self->_expandedStatusBar setNeedsLayout];
    [(UIStatusBar *)self->_expandedStatusBar layoutIfNeeded];
    uint64_t v3 = *MEMORY[0x1E4FB32C8];
    [(UIStatusBar *)self->_compactTrailingStatusBar frameForPartWithIdentifier:*MEMORY[0x1E4FB32C8]];
    CGFloat x = v63.origin.x;
    CGFloat y = v63.origin.y;
    CGFloat width = v63.size.width;
    CGFloat height = v63.size.height;
    if (CGRectIsNull(v63))
    {
      CGFloat x = *MEMORY[0x1E4F1DB28];
      CGFloat y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
    [(UIStatusBar *)self->_expandedStatusBar frameForPartWithIdentifier:v3];
    CGFloat v60 = v9;
    CGFloat v61 = v8;
    CGFloat v58 = v10;
    CGFloat rect = v11;
    [(UIStatusBar *)self->_compactTrailingStatusBar bounds];
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v56 = v16;
    CGFloat v57 = v14;
    CGFloat v18 = v17;
    v64.origin.CGFloat x = x;
    v64.origin.CGFloat y = y;
    v64.size.CGFloat width = width;
    v64.size.CGFloat height = height;
    CGFloat v55 = height;
    CGFloat v19 = width;
    CGFloat v20 = y;
    double MaxX = CGRectGetMaxX(v64);
    v65.origin.CGFloat x = v13;
    v65.origin.CGFloat y = v15;
    v65.size.CGFloat width = v56;
    v65.size.CGFloat height = v18;
    double v59 = MaxX / CGRectGetWidth(v65);
    v66.origin.CGFloat x = x;
    v66.origin.CGFloat y = v20;
    v66.size.CGFloat width = v19;
    v66.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v66);
    v67.origin.CGFloat x = v13;
    v67.origin.CGFloat y = v57;
    v67.size.CGFloat width = v56;
    v67.size.CGFloat height = v18;
    double v23 = MaxY / CGRectGetHeight(v67);
    v24 = [(UIStatusBar *)self->_compactTrailingStatusBar layer];
    double v25 = v23;
    CGFloat v26 = x;
    CGFloat v27 = v19;
    CGFloat v28 = v55;
    objc_msgSend(v24, "setAnchorPoint:", v59, v25);

    CGFloat v29 = rect;
    if (!self->_preparedMarginDelta)
    {
      [(UIStatusBar *)self->_expandedStatusBar bounds];
      CGFloat v53 = v31;
      CGFloat v54 = v30;
      CGFloat v51 = v33;
      CGFloat v52 = v32;
      v34 = [MEMORY[0x1E4FB1438] sharedApplication];
      uint64_t v35 = [v34 userInterfaceLayoutDirection];

      if (v35 == 1)
      {
        v68.origin.CGFloat x = x;
        v68.origin.CGFloat y = v20;
        v68.size.CGFloat width = v27;
        double v36 = v55;
        v68.size.CGFloat height = v55;
        double MinX = CGRectGetMinX(v68);
        v69.size.CGFloat width = v60;
        v69.origin.CGFloat x = v61;
        v69.origin.CGFloat y = v58;
        v69.size.CGFloat height = rect;
        double v38 = CGRectGetMinX(v69);
      }
      else
      {
        v70.origin.CGFloat x = v13;
        v70.origin.CGFloat y = v57;
        v70.size.CGFloat width = v56;
        v70.size.CGFloat height = v18;
        double v39 = CGRectGetWidth(v70);
        v71.origin.CGFloat x = v26;
        v71.origin.CGFloat y = v20;
        v71.size.CGFloat width = v27;
        double v36 = v55;
        v71.size.CGFloat height = v55;
        double MinX = v39 - CGRectGetMaxX(v71);
        v72.origin.CGFloat y = v53;
        v72.origin.CGFloat x = v54;
        v72.size.CGFloat height = v51;
        v72.size.CGFloat width = v52;
        double v40 = CGRectGetWidth(v72);
        v73.size.CGFloat width = v60;
        v73.origin.CGFloat x = v61;
        v73.origin.CGFloat y = v58;
        v73.size.CGFloat height = rect;
        double v38 = v40 - CGRectGetMaxX(v73);
      }
      self->_trailingMarginDelta = v38 - MinX;
      self->_preparedMarginDelta = 1;
      CGFloat v28 = v36;
      CGFloat v29 = rect;
    }
    CGFloat v41 = v61;
    CGFloat v42 = v58;
    CGFloat v43 = v60;
    double v44 = CGRectGetMaxY(*(CGRect *)(&v29 - 3));
    v74.origin.CGFloat x = v26;
    v74.origin.CGFloat y = v20;
    v74.size.CGFloat width = v27;
    v74.size.CGFloat height = v28;
    double v45 = v44 - CGRectGetMaxY(v74);
    double v46 = 0.0;
    if (self->_alignCompactAndExpandedStatusBars) {
      double v46 = v45;
    }
    self->_verticalBatteryAlignmentDelta = v46;
    v47 = [MEMORY[0x1E4FB16C8] currentDevice];
    if ([v47 userInterfaceIdiom])
    {
    }
    else
    {
      uint64_t v48 = SBFEffectiveHomeButtonType();

      if (v48 != 2)
      {
        double v49 = CCUIStatusBarBaselineToBaselineOffsetHeight();
LABEL_17:
        self->_verticalSecondaryServiceDelta = v49;
        v75.origin.CGFloat x = v61;
        v75.origin.CGFloat y = v58;
        v75.size.CGFloat width = v60;
        v75.size.CGFloat height = rect;
        double v50 = CGRectGetHeight(v75);
        v76.origin.CGFloat x = v26;
        v76.origin.CGFloat y = v20;
        v76.size.CGFloat width = v27;
        v76.size.CGFloat height = v28;
        self->_maxCompactScaleFactor = v50 / CGRectGetHeight(v76);
        self->_needsUpdatedMetrics = 0;
        return;
      }
    }
    double v49 = 0.0;
    if (v45 < 0.0) {
      double v49 = -self->_verticalBatteryAlignmentDelta;
    }
    goto LABEL_17;
  }
}

- (UIStatusBarStyleRequest)compactTrailingStyleRequest
{
  uint64_t v3 = [(CCUIStatusBar *)self delegate];
  v4 = [v3 compactTrailingStyleRequestForStatusBar:self];

  double v5 = (void *)[v4 copy];

  return (UIStatusBarStyleRequest *)v5;
}

- (CGRect)compactAvoidanceFrame
{
  uint64_t v3 = [(CCUIStatusBar *)self delegate];
  [v3 compactAvoidanceFrameForStatusBar:self];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (CGRect)expandedAvoidanceFrame
{
  uint64_t v3 = [(CCUIStatusBar *)self delegate];
  [v3 expandedAvoidanceFrameForStatusBar:self];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  double v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    [(CCUIStatusBar *)self _updateCompactTrailingStatusBarStyleRequestAndAvoidanceFrame];
    double v5 = obj;
  }
}

- (void)setLeadingState:(unint64_t)a3
{
  if (self->_leadingState != a3)
  {
    self->_leadingState = a3;
    [(CCUIStatusBar *)self setNeedsLayout];
    [(CCUIStatusBar *)self layoutIfNeeded];
  }
}

- (void)setTrailingState:(unint64_t)a3
{
  if (self->_trailingState != a3)
  {
    self->_trailingState = a3;
    if (!a3)
    {
      [(CCUIStatusBar *)self _updateCompactTrailingStatusBarStyleRequestAndAvoidanceFrame];
      self->_preparedMarginDelta = 0;
    }
    [(CCUIStatusBar *)self setNeedsLayout];
    [(CCUIStatusBar *)self layoutIfNeeded];
  }
}

- (void)setCompactEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_compactEdgeInsets.left != a3.left
    || self->_compactEdgeInsets.top != a3.top
    || self->_compactEdgeInsets.right != a3.right
    || self->_compactEdgeInsets.bottom != a3.bottom)
  {
    self->_compactEdgeInsets = a3;
    [(CCUIStatusBar *)self setNeedsLayout];
  }
}

- (void)setExpandedEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_expandedEdgeInsets.left != a3.left
    || self->_expandedEdgeInsets.top != a3.top
    || self->_expandedEdgeInsets.right != a3.right
    || self->_expandedEdgeInsets.bottom != a3.bottom)
  {
    self->_expandedEdgeInsets = a3;
    [(CCUIStatusBar *)self setNeedsLayout];
  }
}

- (double)leadingAlpha
{
  [(UIStatusBar *)self->_expandedStatusBar alphaForPartWithIdentifier:*MEMORY[0x1E4FB32E0]];
  return result;
}

- (void)setLeadingAlpha:(double)a3
{
}

- (double)compactTrailingAlpha
{
  [(UIStatusBar *)self->_compactTrailingStatusBar alpha];
  return result;
}

- (void)setCompactTrailingAlpha:(double)a3
{
}

- (double)expandedTrailingAlpha
{
  [(UIStatusBar *)self->_expandedStatusBar alphaForPartWithIdentifier:*MEMORY[0x1E4FB32E8]];
  return result;
}

- (void)setExpandedTrailingAlpha:(double)a3
{
  [(UIStatusBar *)self->_expandedStatusBar setAlpha:*MEMORY[0x1E4FB32E8] forPartWithIdentifier:a3];

  [(CCUIStatusBar *)self _updateShadow];
}

- (int64_t)orientation
{
  return [(UIStatusBar *)self->_expandedStatusBar orientation];
}

- (void)setOrientation:(int64_t)a3
{
}

- (CGAffineTransform)compactScaleTransform
{
  long long v3 = *(_OWORD *)&self[12].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[11].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&self[12].d;
  return self;
}

- (void)setCompactScaleTransform:(CGAffineTransform *)a3
{
  p_compactScaleTransform = &self->_compactScaleTransform;
  long long v6 = *(_OWORD *)&self->_compactScaleTransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_compactScaleTransform.a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&self->_compactScaleTransform.tx;
  long long v7 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v10.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v10.c = v7;
  *(_OWORD *)&v10.tCGFloat x = *(_OWORD *)&a3->tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v10))
  {
    long long v8 = *(_OWORD *)&a3->a;
    long long v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_compactScaleTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_compactScaleTransform->tCGFloat x = v9;
    *(_OWORD *)&p_compactScaleTransform->a = v8;
    [(CCUIStatusBar *)self setNeedsLayout];
  }
}

- (void)setExpandedStatusBarTranslation:(double)a3
{
  if (vabdd_f64(self->_expandedStatusBarTranslation, a3) >= 2.22044605e-16)
  {
    self->_expandedStatusBarTranslation = a3;
    [(CCUIStatusBar *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v87.receiver = self;
  v87.super_class = (Class)CCUIStatusBar;
  [(CCUIStatusBar *)&v87 layoutSubviews];
  [(CCUIStatusBar *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  CCUIEdgeInsetsRTLSwap();
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  CCUIEdgeInsetsRTLSwap();
  double v19 = v4 + v14;
  double v83 = v6 + v12;
  double v20 = v8 - (v14 + v18);
  double v21 = v10 - (v12 + v16);
  double v23 = v4 + v22;
  double v25 = v8 - (v22 + v24);
  double v28 = v10 - (v26 + v27);
  double v29 = v6 + v26 - self->_verticalBatteryAlignmentDelta + self->_expandedStatusBarTranslation;
  if (self->_alignCompactAndExpandedStatusBars) {
    double verticalSecondaryServiceDelta = self->_verticalSecondaryServiceDelta;
  }
  else {
    double verticalSecondaryServiceDelta = 0.0;
  }
  double v31 = v19;
  double v32 = v83;
  double v33 = v29 - verticalSecondaryServiceDelta;
  compactTrailingStatusBar = self->_compactTrailingStatusBar;
  long long v35 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v84 = *MEMORY[0x1E4F1DAB8];
  long long v85 = v35;
  long long v86 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(UIStatusBar *)compactTrailingStatusBar setTransform:&v84];
  -[UIStatusBar setFrame:](self->_compactTrailingStatusBar, "setFrame:", v31, v83, v20, v21);
  -[UIStatusBar setFrame:](self->_expandedStatusBar, "setFrame:", v23, v33, v25, v28);
  [(CCUIStatusBar *)self _updateMetricsIfNeeded];
  if (!UIAccessibilityIsReduceMotionEnabled())
  {
    CGFloat v81 = v33;
    CGFloat rect = v25;
    double v36 = v23;
    double v37 = v28;
    double v38 = v31;
    double v39 = v21;
    double v40 = *MEMORY[0x1E4FB2E10];
    double v41 = *(double *)(MEMORY[0x1E4FB2E10] + 8);
    unint64_t v42 = [(CCUIStatusBar *)self leadingState];
    double v77 = v40;
    double v43 = v40;
    CGFloat v44 = v39;
    CGFloat v45 = v38;
    CGFloat v46 = v37;
    CGFloat v47 = v36;
    double v48 = v41;
    if (!v42)
    {
      v88.origin.CGFloat x = v45;
      v88.origin.CGFloat y = v83;
      v88.size.CGFloat width = v20;
      v88.size.CGFloat height = v44;
      double MinX = CGRectGetMinX(v88);
      v89.origin.CGFloat x = v47;
      v89.origin.CGFloat y = v81;
      v89.size.CGFloat width = rect;
      v89.size.CGFloat height = v46;
      double v43 = MinX - CGRectGetMinX(v89);
      double v32 = v83;
      double v48 = 0.0;
    }
    double v80 = v43;
    unint64_t v50 = [(CCUIStatusBar *)self trailingState];
    double v79 = v48;
    if (v50 == 1)
    {
      CGRect v63 = [MEMORY[0x1E4FB1438] sharedApplication];
      uint64_t v64 = [v63 userInterfaceLayoutDirection];

      CGFloat v65 = v81;
      CGFloat v66 = v47;
      CGFloat v67 = rect;
      CGFloat v68 = v46;
      if (v64 == 1)
      {
        double v69 = CGRectGetMinX(*(CGRect *)&v66);
        v91.origin.CGFloat x = v45;
        CGFloat v60 = v83;
        v91.origin.CGFloat y = v83;
        v91.size.CGFloat width = v20;
        v91.size.CGFloat height = v44;
        double v61 = v69 - CGRectGetMinX(v91) + self->_trailingMarginDelta;
      }
      else
      {
        double MaxX = CGRectGetMaxX(*(CGRect *)&v66);
        v93.origin.CGFloat x = v45;
        CGFloat v60 = v83;
        v93.origin.CGFloat y = v83;
        v93.size.CGFloat width = v20;
        v93.size.CGFloat height = v44;
        double v61 = MaxX - CGRectGetMaxX(v93) - self->_trailingMarginDelta;
      }
      double v70 = 0.0;
      double v62 = v78;
    }
    else if (v50)
    {
      double v62 = v78;
      double v61 = v78;
      CGFloat v60 = v32;
      double v70 = v41;
    }
    else
    {
      CGFloat v51 = [MEMORY[0x1E4FB1438] sharedApplication];
      uint64_t v52 = [v51 userInterfaceLayoutDirection];

      CGFloat v53 = v45;
      double v54 = v32;
      double v55 = v20;
      CGFloat v56 = v44;
      if (v52 == 1)
      {
        CGFloat v57 = CGRectGetMinX(*(CGRect *)&v53);
        double v58 = v32;
        double v59 = v57;
        v90.origin.CGFloat x = v47;
        v90.origin.CGFloat y = v81;
        v90.size.CGFloat width = rect;
        v90.size.CGFloat height = v46;
        CGFloat v60 = v58;
        double v61 = v78;
        double v62 = v59 - CGRectGetMinX(v90) - self->_trailingMarginDelta;
      }
      else
      {
        CGFloat v71 = CGRectGetMaxX(*(CGRect *)&v53);
        double v72 = v32;
        double v73 = v71;
        v92.origin.CGFloat x = v47;
        v92.origin.CGFloat y = v81;
        v92.size.CGFloat width = rect;
        v92.size.CGFloat height = v46;
        CGFloat v60 = v72;
        double v61 = v78;
        double v62 = v73 - CGRectGetMaxX(v92) + self->_trailingMarginDelta;
      }
      double v70 = v41;
      double v41 = 0.0;
    }
    -[UIStatusBar setOffset:forPartWithIdentifier:](self->_expandedStatusBar, "setOffset:forPartWithIdentifier:", *MEMORY[0x1E4FB32E0], v80, v79);
    -[UIStatusBar setOffset:forPartWithIdentifier:](self->_expandedStatusBar, "setOffset:forPartWithIdentifier:", *MEMORY[0x1E4FB32E8], v62, v41);
    v94.origin.CGFloat x = v45;
    v94.origin.CGFloat y = v60;
    v94.size.CGFloat width = v20;
    v94.size.CGFloat height = v44;
    CGRect v95 = CGRectOffset(v94, v61, v70 - self->_verticalSecondaryServiceDelta);
    -[UIStatusBar setFrame:](self->_compactTrailingStatusBar, "setFrame:", v95.origin.x, v95.origin.y, v95.size.width, v95.size.height);
    CGRect v75 = self->_compactTrailingStatusBar;
    long long v76 = *(_OWORD *)&self->_compactScaleTransform.c;
    long long v84 = *(_OWORD *)&self->_compactScaleTransform.a;
    long long v85 = v76;
    long long v86 = *(_OWORD *)&self->_compactScaleTransform.tx;
    [(UIStatusBar *)v75 setTransform:&v84];
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([(CCUIStatusBar *)self leadingState] != 1
    || (-[UIStatusBar frameForPartWithIdentifier:](self->_expandedStatusBar, "frameForPartWithIdentifier:", *MEMORY[0x1E4FB32E0]), v14.x = x, v14.y = y, !CGRectContainsPoint(v16, v14))|| (double v8 = self->_expandedStatusBar, -[CCUIStatusBar convertPoint:toView:](self, "convertPoint:toView:", v8, x, y), -[UIStatusBar hitTest:withEvent:](v8, "hitTest:withEvent:", v7), (v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if ([(CCUIStatusBar *)self trailingState] != 1
      || (-[UIStatusBar frameForPartWithIdentifier:](self->_expandedStatusBar, "frameForPartWithIdentifier:", *MEMORY[0x1E4FB32E8]), v15.x = x, v15.y = y, !CGRectContainsPoint(v17, v15))|| (expandedStatusBar = self->_expandedStatusBar, -[CCUIStatusBar convertPoint:toView:](self, "convertPoint:toView:", expandedStatusBar, x, y), -[UIStatusBar hitTest:withEvent:](expandedStatusBar, "hitTest:withEvent:", v7), (double v9 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v12.receiver = self;
      v12.super_class = (Class)CCUIStatusBar;
      double v9 = -[CCUIStatusBar hitTest:withEvent:](&v12, sel_hitTest_withEvent_, v7, x, y);
    }
  }

  return v9;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  double v4 = CCUIStatusBarHeight();
  double v5 = width;
  result.CGFloat height = v4;
  result.CGFloat width = v5;
  return result;
}

- (CGSize)intrinsicContentSize
{
  -[CCUIStatusBar sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (void)_updateShadow
{
  [(UIStatusBar *)self->_expandedStatusBar _controlCenterApplyPrimaryContentShadow];
  id v8 = [(UIStatusBar *)self->_expandedStatusBar layer];
  double v3 = [(UIStatusBar *)self->_expandedStatusBar layer];
  [v3 shadowOpacity];
  double v5 = v4;
  [(CCUIStatusBar *)self expandedTrailingAlpha];
  double v7 = v6 * v5;
  *(float *)&double v7 = v7;
  [v8 setShadowOpacity:v7];
}

- (void)controlCenterApplyPrimaryContentShadow
{
  Mutable = CGPathCreateMutable();
  [(UIStatusBar *)self->_expandedStatusBar frameForPartWithIdentifier:*MEMORY[0x1E4FB32D0]];
  CGFloat x = v14.origin.x;
  CGFloat y = v14.origin.y;
  CGFloat width = v14.size.width;
  CGFloat height = v14.size.height;
  if (!CGRectIsNull(v14))
  {
    v15.origin.CGFloat x = x;
    v15.origin.CGFloat y = y;
    v15.size.CGFloat width = width;
    v15.size.CGFloat height = height;
    CGPathAddRect(Mutable, 0, v15);
  }
  [(UIStatusBar *)self->_expandedStatusBar frameForPartWithIdentifier:*MEMORY[0x1E4FB32D8]];
  CGFloat v8 = v16.origin.x;
  CGFloat v9 = v16.origin.y;
  CGFloat v10 = v16.size.width;
  CGFloat v11 = v16.size.height;
  if (!CGRectIsNull(v16))
  {
    v17.origin.CGFloat x = v8;
    v17.origin.CGFloat y = v9;
    v17.size.CGFloat width = v10;
    v17.size.CGFloat height = v11;
    CGPathAddRect(Mutable, 0, v17);
  }
  objc_super v12 = [(UIStatusBar *)self->_expandedStatusBar layer];
  [v12 setShadowPath:Mutable];

  CGPathRelease(Mutable);

  [(CCUIStatusBar *)self _updateShadow];
}

- (void)_updateCompactTrailingStatusBarStyleRequestAndAvoidanceFrame
{
  compactTrailingStatusBar = self->_compactTrailingStatusBar;
  float v4 = [(CCUIStatusBar *)self compactTrailingStyleRequest];
  [(UIStatusBar *)compactTrailingStatusBar setStyleRequest:v4];

  double v5 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    [(CCUIStatusBar *)self compactAvoidanceFrame];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGRect v15 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v16 = [v15 userInterfaceLayoutDirection];
    [(CCUIStatusBar *)self compactEdgeInsets];
    if (v16 == 1) {
      double v19 = v18;
    }
    else {
      double v19 = v17;
    }
    CGFloat v20 = -v19;
    v32.origin.double x = v8;
    v32.origin.double y = v10;
    v32.size.double width = v12;
    v32.size.double height = v14;
    CGRect v33 = CGRectOffset(v32, v20, 0.0);
    double x = v33.origin.x;
    double y = v33.origin.y;
    double width = v33.size.width;
    double height = v33.size.height;

    expandedStatusBar = self->_compactTrailingStatusBar;
  }
  else
  {
    double v26 = self->_compactTrailingStatusBar;
    [(CCUIStatusBar *)self compactAvoidanceFrame];
    -[UIStatusBar setAvoidanceFrame:](v26, "setAvoidanceFrame:");
    expandedStatusBar = self->_expandedStatusBar;
    [(CCUIStatusBar *)self expandedAvoidanceFrame];
    double x = v27;
    double y = v28;
    double width = v29;
    double height = v30;
  }

  -[UIStatusBar setAvoidanceFrame:](expandedStatusBar, "setAvoidanceFrame:", x, y, width, height);
}

- (id)expandedStatusBar
{
  return self->_expandedStatusBar;
}

- (CCUIStatusBarDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CCUIStatusBarDelegate *)WeakRetained;
}

- (unint64_t)leadingState
{
  return self->_leadingState;
}

- (unint64_t)trailingState
{
  return self->_trailingState;
}

- (UIEdgeInsets)compactEdgeInsets
{
  double top = self->_compactEdgeInsets.top;
  double left = self->_compactEdgeInsets.left;
  double bottom = self->_compactEdgeInsets.bottom;
  double right = self->_compactEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)expandedEdgeInsets
{
  double top = self->_expandedEdgeInsets.top;
  double left = self->_expandedEdgeInsets.left;
  double bottom = self->_expandedEdgeInsets.bottom;
  double right = self->_expandedEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)maxCompactScaleFactor
{
  return self->_maxCompactScaleFactor;
}

- (double)verticalSecondaryServiceDelta
{
  return self->_verticalSecondaryServiceDelta;
}

- (double)expandedStatusBarTranslation
{
  return self->_expandedStatusBarTranslation;
}

- (BOOL)alignCompactAndExpandedStatusBars
{
  return self->_alignCompactAndExpandedStatusBars;
}

- (void)setAlignCompactAndExpandedStatusBars:(BOOL)a3
{
  self->_alignCompactAndExpandedStatusBars = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_expandedStatusBar, 0);

  objc_storeStrong((id *)&self->_compactTrailingStatusBar, 0);
}

@end