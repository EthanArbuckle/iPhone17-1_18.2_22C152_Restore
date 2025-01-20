@interface AVMobileChromelessTimelineView
- (AVMobileChromelessControlsStyleSheet)styleSheet;
- (AVMobileChromelessSlider)slider;
- (AVMobileChromelessTimelineView)initWithStyleSheet:(id)a3;
- (AVMobileChromelessTimelineView)initWithUsingFluidSlider:(BOOL)a3;
- (AVMobileChromelessTimelineViewDelegate)delegate;
- (BOOL)drawsShadow;
- (BOOL)isEmphasized;
- (BOOL)isEnabled;
- (BOOL)labelsAutoadjustWithSliderEmphasis;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGSize)intrinsicContentSize;
- (NSString)labelsCompositingFilter;
- (NSString)leadingTimeText;
- (NSString)trailingTimeText;
- (UIColor)labelsTextColor;
- (UIFont)labelsFont;
- (double)labelsExtendedDynamicRangeGain;
- (double)sliderExtendedDynamicRangeGain;
- (uint64_t)_commonInit;
- (uint64_t)_labelIntrinsicContentSize;
- (uint64_t)_timelineScaleFactor;
- (uint64_t)_updateSliderEnabledStateIfNeeded;
- (unint64_t)labelPosition;
- (void)_setUpShadowAppearance;
- (void)_updateFonts;
- (void)_updateShadowAppearanceState;
- (void)_updateShadowPathIfNeeded;
- (void)avkit_intrinsicContentSizeOfSubviewWasInvalidated:(id)a3;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)prepareForDeemphasisIfNeeded;
- (void)setDelegate:(id)a3;
- (void)setDrawsShadow:(BOOL)a3;
- (void)setEmphasized:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setLabelPosition:(unint64_t)a3;
- (void)setLabelsAutoadjustWithSliderEmphasis:(BOOL)a3;
- (void)setLabelsCompositingFilter:(id)a3;
- (void)setLabelsExtendedDynamicRangeGain:(double)a3;
- (void)setLabelsFont:(id)a3;
- (void)setLabelsTextColor:(id)a3;
- (void)setLeadingTimeText:(id)a3;
- (void)setSliderExtendedDynamicRangeGain:(double)a3;
- (void)setStyleSheet:(id)a3;
- (void)setTrailingTimeText:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation AVMobileChromelessTimelineView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slider, 0);
  objc_storeStrong((id *)&self->_labelsCompositingFilter, 0);
  objc_storeStrong((id *)&self->_labelsTextColor, 0);
  objc_storeStrong((id *)&self->_labelsFont, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_trailingTimeText, 0);
  objc_storeStrong((id *)&self->_styleSheet, 0);
  objc_storeStrong((id *)&self->_leadingTimeText, 0);
  objc_storeStrong((id *)&self->_labelShadowView, 0);
  objc_storeStrong((id *)&self->_trailingLabel, 0);

  objc_storeStrong((id *)&self->_leadingLabel, 0);
}

- (double)sliderExtendedDynamicRangeGain
{
  return self->_sliderExtendedDynamicRangeGain;
}

- (AVMobileChromelessSlider)slider
{
  return self->_slider;
}

- (NSString)labelsCompositingFilter
{
  return self->_labelsCompositingFilter;
}

- (UIColor)labelsTextColor
{
  return self->_labelsTextColor;
}

- (UIFont)labelsFont
{
  return self->_labelsFont;
}

- (double)labelsExtendedDynamicRangeGain
{
  return self->_labelsExtendedDynamicRangeGain;
}

- (void)setDelegate:(id)a3
{
}

- (AVMobileChromelessTimelineViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVMobileChromelessTimelineViewDelegate *)WeakRetained;
}

- (BOOL)drawsShadow
{
  return self->_drawsShadow;
}

- (NSString)trailingTimeText
{
  return self->_trailingTimeText;
}

- (AVMobileChromelessControlsStyleSheet)styleSheet
{
  return self->_styleSheet;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isEmphasized
{
  return self->_emphasized;
}

- (NSString)leadingTimeText
{
  return self->_leadingTimeText;
}

- (void)setLabelsAutoadjustWithSliderEmphasis:(BOOL)a3
{
  self->_labelsAutoadjustWithSliderEmphasis = a3;
}

- (BOOL)labelsAutoadjustWithSliderEmphasis
{
  return self->_labelsAutoadjustWithSliderEmphasis;
}

- (unint64_t)labelPosition
{
  return self->_labelPosition;
}

- (void)_setUpShadowAppearance
{
  id v4 = [(AVMobileChromelessSlider *)self->_slider layer];
  v3 = [(UIView *)self->_labelShadowView layer];
  objc_msgSend(v4, "setShadowOffset:", 0.0, 6.0);
  [v4 setShadowRadius:10.0];
  objc_msgSend(v3, "setShadowOffset:", 0.0, 6.0);
  [v3 setShadowRadius:10.0];
  -[AVMobileChromelessTimelineView _updateShadowAppearanceState]((id *)&self->super.super.super.super.isa);
}

- (void)_updateShadowAppearanceState
{
  if (!a1) {
    return;
  }
  id v16 = [a1[74] layer];
  v2 = [a1[59] layer];
  int v3 = 0;
  if ([a1 drawsShadow])
  {
    id v4 = [a1[74] traitCollection];
    uint64_t v5 = [v4 userInterfaceStyle];

    if (v5 == 1)
    {
      v6 = 0;
      double v7 = 0.0;
    }
    else
    {
      v6 = [MEMORY[0x1E4FB1618] blackColor];
      double v7 = 0.8;
    }
    v9 = [a1[57] traitCollection];
    if ([v9 userInterfaceStyle] == 1)
    {
      v10 = [a1[58] traitCollection];
      uint64_t v11 = [v10 userInterfaceStyle];

      if (v11 == 1)
      {
        v8 = 0;
        goto LABEL_12;
      }
    }
    else
    {
    }
    v8 = [MEMORY[0x1E4FB1618] blackColor];
    int v3 = 1058642330;
    goto LABEL_12;
  }
  v6 = 0;
  v8 = 0;
  double v7 = 0.0;
LABEL_12:
  id v12 = v6;
  objc_msgSend(v16, "setShadowColor:", objc_msgSend(v12, "CGColor"));
  *(float *)&double v13 = v7;
  [v16 setShadowOpacity:v13];
  id v14 = v8;
  objc_msgSend(v2, "setShadowColor:", objc_msgSend(v14, "CGColor"));
  LODWORD(v15) = v3;
  [v2 setShadowOpacity:v15];
  -[AVMobileChromelessTimelineView _updateShadowPathIfNeeded]((uint64_t)a1);
}

- (void)_updateShadowPathIfNeeded
{
  if (a1 && [(id)a1 drawsShadow])
  {
    id v27 = [*(id *)(a1 + 592) layer];
    [v27 bounds];
    double v3 = v2;
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    if (CGRectIsNull(*(CGRect *)(a1 + 480))
      || (v29.origin.x = v3,
          v29.origin.y = v5,
          v29.size.width = v7,
          v29.size.height = v9,
          !CGRectEqualToRect(*(CGRect *)(a1 + 480), v29)))
    {
      *(double *)(a1 + 480) = v3;
      *(double *)(a1 + 488) = v5;
      *(double *)(a1 + 496) = v7;
      *(double *)(a1 + 504) = v9;
      objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", v3, v5, v7, v9);
      id v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setShadowPath:", objc_msgSend(v10, "CGPath"));
    }
    uint64_t v11 = [*(id *)(a1 + 472) layer];
    id v12 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
    if (([*(id *)(a1 + 456) isHidden] & 1) == 0)
    {
      double v13 = [*(id *)(a1 + 456) traitCollection];
      uint64_t v14 = [v13 userInterfaceStyle];

      if (v14 != 1)
      {
        double v15 = [*(id *)(a1 + 456) layer];
        id v16 = (void *)MEMORY[0x1E4FB14C0];
        [v15 frame];
        uint64_t v17 = objc_msgSend(v16, "bezierPathWithRect:");

        id v12 = (void *)v17;
      }
    }
    if (([*(id *)(a1 + 464) isHidden] & 1) == 0)
    {
      v18 = [*(id *)(a1 + 464) traitCollection];
      uint64_t v19 = [v18 userInterfaceStyle];

      if (v19 != 1)
      {
        v20 = [*(id *)(a1 + 464) layer];
        char v21 = [v12 isEmpty];
        v22 = (void *)MEMORY[0x1E4FB14C0];
        [v20 frame];
        uint64_t v23 = objc_msgSend(v22, "bezierPathWithRect:");
        v24 = (void *)v23;
        if (v21)
        {
          v25 = v12;
          id v12 = (void *)v23;
        }
        else
        {
          [v12 appendPath:v23];
          v25 = v24;
        }
      }
    }
    id v26 = v12;
    objc_msgSend(v11, "setShadowPath:", objc_msgSend(v26, "CGPath"));
  }
}

- (void)setDrawsShadow:(BOOL)a3
{
  if (self->_drawsShadow != a3)
  {
    self->_drawsShadow = a3;
    -[AVMobileChromelessTimelineView _updateShadowAppearanceState]((id *)&self->super.super.super.super.isa);
  }
}

- (void)avkit_intrinsicContentSizeOfSubviewWasInvalidated:(id)a3
{
  if (self->_slider == a3)
  {
    id v4 = a3;
    [(AVMobileChromelessTimelineView *)self invalidateIntrinsicContentSize];
    double v5 = [(AVMobileChromelessTimelineView *)self superview];
    objc_msgSend(v5, "avkit_intrinsicContentSizeOfSubviewWasInvalidated:", v4);

    [(AVMobileChromelessTimelineView *)self setNeedsLayout];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AVMobileChromelessTimelineView;
  id v4 = a3;
  [(AVMobileChromelessTimelineView *)&v8 traitCollectionDidChange:v4];
  double v5 = [(AVMobileChromelessTimelineView *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    -[AVMobileChromelessTimelineView _updateShadowAppearanceState]((id *)&self->super.super.super.super.isa);
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = self;
  v11.receiver = self;
  v11.super_class = (Class)AVMobileChromelessTimelineView;
  id v7 = a4;
  unsigned __int8 v8 = -[AVMobileChromelessTimelineView pointInside:withEvent:](&v11, sel_pointInside_withEvent_, v7, x, y);
  slider = v6->_slider;
  -[AVMobileChromelessSlider convertPoint:fromView:](slider, "convertPoint:fromView:", v6, x, y, v11.receiver, v11.super_class);
  LOBYTE(v6) = -[AVMobileChromelessSlider pointInside:withEvent:](slider, "pointInside:withEvent:", v7);

  return v8 | v6;
}

- (void)layoutSubviews
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  v115.receiver = self;
  v115.super_class = (Class)AVMobileChromelessTimelineView;
  [(AVView *)&v115 layoutSubviews];
  unint64_t labelPosition = self->_labelPosition;
  [(AVMobileChromelessTimelineView *)self bounds];
  double v113 = v5;
  double v114 = v4;
  double v7 = v6;
  double v9 = v8;
  [(AVMobileChromelessSlider *)self->_slider intrinsicContentSize];
  double v11 = v10;
  if (labelPosition)
  {
    -[AVMobileChromelessTimelineView _labelIntrinsicContentSize]((id *)&self->super.super.super.super.isa);
    double v13 = v12;
    double v14 = v9;
    double v16 = v15;
    -[AVMobileChromelessTimelineView _labelIntrinsicContentSize]((id *)&self->super.super.super.super.isa);
    double v18 = v17;
    double v20 = v19;
    -[AVMobileChromelessTimelineView _timelineScaleFactor](self);
    double v110 = (15.0 - v11) * 0.5;
    double v22 = 7.5;
    if (self->_labelsAutoadjustWithSliderEmphasis) {
      double v22 = v11;
    }
    double v23 = v110 + 6.0 + v22;
    double v24 = 1.0;
    if (self->_emphasized) {
      double v24 = v21;
    }
    double v105 = v24;
    double v107 = v11;
    double v25 = v7 * v24;
    double v26 = -(v7 - v7 * v21) * 0.5;
    if (!self->_emphasized) {
      double v26 = 0.0;
    }
    double v111 = v26;
    double v109 = v16;
    double v27 = v16 + v23;
    double v9 = v14;
    BOOL v28 = v25 >= v13;
    BOOL v30 = v25 >= v27 && self->_leadingTimeText != 0;
    LOBYTE(v31) = v30 && v28;
    double v32 = v13 + 3.0;
    float v33 = v25;
    float v34 = v20 + v23;
    if (!v30 || !v28) {
      double v32 = 0.0;
    }
    BOOL v35 = v33 > v34;
    float v36 = v18 + v32;
    if (vabds_f32(v33, v34) < 0.00000011921) {
      BOOL v35 = 1;
    }
    BOOL v37 = v33 <= v36;
    float v38 = vabds_f32(v33, v36);
    int v39 = !v37;
    if (v38 < 0.00000011921) {
      int v40 = 1;
    }
    else {
      int v40 = v39;
    }
    if (self->_trailingTimeText) {
      BOOL v41 = v35;
    }
    else {
      BOOL v41 = 0;
    }
    float v42 = v14;
    BOOL v43 = fabsf(v42 + -15.0) >= 0.00000011921 && v42 <= 15.0;
    unint64_t v44 = self->_labelPosition;
    -[AVMobileChromelessTimelineView _timelineScaleFactor](self);
    memset(&v118, 0, sizeof(v118));
    if (self->_emphasized)
    {
      if (!v44) {
        double v45 = 1.0;
      }
      CGAffineTransformMakeScale(&v118, v45, v45);
    }
    else
    {
      long long v70 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v118.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v118.c = v70;
      *(_OWORD *)&v118.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    }
    int v69 = v41 & v40;
    leadingLabel = self->_leadingLabel;
    CGAffineTransform v116 = v118;
    -[AVLabel setTransform:](leadingLabel, "setTransform:", &v116, *(void *)&v105, *(void *)&v107);
    trailingLabel = self->_trailingLabel;
    CGAffineTransform v116 = v118;
    [(AVLabel *)trailingLabel setTransform:&v116];
    if (v31)
    {
      -[AVLabel setFrame:](self->_leadingLabel, "setFrame:", -v111, v23, v13, v109);
      if (!v69)
      {
LABEL_66:
        if (v43) {
          goto LABEL_72;
        }
        goto LABEL_70;
      }
    }
    else if (!v69)
    {
      goto LABEL_66;
    }
    -[AVLabel setFrame:](self->_trailingLabel, "setFrame:", v7 - v18 + v111, v23, v18, v20);
    if (v43) {
      goto LABEL_72;
    }
LABEL_70:
    -[AVMobileChromelessSlider setFrame:](self->_slider, "setFrame:", 0.0, v110, v25, v108 * v106);
    slider = self->_slider;
    [(AVMobileChromelessTimelineView *)self bounds];
    -[AVMobileChromelessSlider setCenter:](slider, "setCenter:", CGRectGetMidX(v120), v110);
    goto LABEL_71;
  }
  double v46 = v10;
  [(AVLabel *)self->_leadingLabel intrinsicContentSize];
  double v48 = v47;
  double v50 = v49;
  [(AVLabel *)self->_trailingLabel intrinsicContentSize];
  double v53 = v51;
  double v55 = v54;
  double v56 = v7 - v48 + -12.0;
  if (v56 >= 60.0
    && ((v57 = v50, v58 = v9, *(float *)&double v52 = vabds_f32(v57, v58), v57 >= v58)
      ? (BOOL v59 = *(float *)&v52 < 0.00000011921)
      : (BOOL v59 = 1),
        v59))
  {
    leadingTimeText = self->_leadingTimeText;
    double v61 = 0.0;
    BOOL v31 = leadingTimeText != 0;
    if (leadingTimeText) {
      double v62 = v7 - v48 + -12.0;
    }
    else {
      double v62 = v7;
    }
    if (leadingTimeText) {
      double v61 = v48 + 12.0;
    }
    double v112 = v61;
  }
  else
  {
    double v112 = 0.0;
    BOOL v31 = 0;
    double v62 = v7;
  }
  double v63 = v56 - v51 + -12.0;
  if (v63 >= 60.0
    && ((float v64 = v55, v65 = v9, v66 = vabds_f32(v64, v65), v64 >= v65) ? (v67 = v66 < 0.00000011921) : (v67 = 1), v67))
  {
    trailingTimeText = self->_trailingTimeText;
    int v69 = trailingTimeText != 0;
    if (trailingTimeText) {
      double v62 = v63;
    }
  }
  else
  {
    int v69 = 0;
  }
  BOOL v43 = v46 > v9;
  if (v31) {
    -[AVLabel setFrame:](self->_leadingLabel, "setFrame:", 0.0, (v9 - v50) * 0.5, v48, v50, v52);
  }
  if (v69) {
    -[AVLabel setFrame:](self->_trailingLabel, "setFrame:", v7 - v53, (v9 - v55) * 0.5, v53, v55, v52);
  }
  if (v46 <= v9)
  {
    -[AVMobileChromelessSlider setFrame:](self->_slider, "setFrame:", v112, (v9 - v46) * 0.5, v62, v46, v52);
LABEL_71:
    BOOL v43 = 0;
  }
LABEL_72:
  -[UIView setFrame:](self->_labelShadowView, "setFrame:", v114, v113, v7, v9);
  [(AVLabel *)self->_leadingLabel setHidden:!v31];
  [(AVLabel *)self->_trailingLabel setHidden:v69 ^ 1u];
  [(AVMobileChromelessSlider *)self->_slider setHidden:v43];
  -[AVMobileChromelessTimelineView _updateShadowPathIfNeeded]((uint64_t)self);
  if ([(id)objc_opt_class() conformsToProtocol:&unk_1F095A4B8])
  {
    v74 = self;
    BOOL emphasized = v74->_emphasized;
    [(AVView *)v74 contentIntersection];
    double v77 = v76;
    double v79 = v78;
    double v81 = v80;
    double v83 = v82;
    if (emphasized)
    {
      [(AVMobileChromelessTimelineView *)v74 bounds];
      double v85 = v84;
      -[AVMobileChromelessTimelineView _timelineScaleFactor](v74);
      double v87 = v86;
      [(AVMobileChromelessSlider *)v74->_slider frame];
      double v88 = -(v85 - v85 * v87) * 0.5;
      double v90 = fabs(v89);
      double v81 = v81 + v88 * 2.0;
      double v83 = v83 + v90;
      double v77 = v77 - v88;
      double v79 = v79 - v90;
    }
    v91 = [(AVMobileChromelessTimelineView *)v74 subviews];
    memset(&v116, 0, sizeof(v116));
    long long v117 = 0u;
    uint64_t v92 = [v91 countByEnumeratingWithState:&v116 objects:&v118 count:16];
    if (v92)
    {
      uint64_t v93 = v92;
      uint64_t v94 = **(void **)&v116.c;
      do
      {
        for (uint64_t i = 0; i != v93; ++i)
        {
          if (**(void **)&v116.c != v94) {
            objc_enumerationMutation(v91);
          }
          v96 = *(void **)(*(void *)&v116.b + 8 * i);
          if ([(id)objc_opt_class() conformsToProtocol:&unk_1F095A4B8])
          {
            id v97 = v96;
            [v97 frame];
            v123.origin.double x = v98;
            v123.origin.double y = v99;
            v123.size.width = v100;
            v123.size.height = v101;
            v121.origin.double x = v77;
            v121.origin.double y = v79;
            v121.size.width = v81;
            v121.size.height = v83;
            CGRect v122 = CGRectIntersection(v121, v123);
            objc_msgSend(v97, "convertRect:fromView:", v74, v122.origin.x, v122.origin.y, v122.size.width, v122.size.height);
            objc_msgSend(v97, "setContentIntersection:");
          }
        }
        uint64_t v93 = [v91 countByEnumeratingWithState:&v116 objects:&v118 count:16];
      }
      while (v93);
    }
  }
  v102 = [(AVMobileChromelessTimelineView *)self delegate];
  char v103 = objc_opt_respondsToSelector();

  if (v103)
  {
    v104 = [(AVMobileChromelessTimelineView *)self delegate];
    [v104 timelineViewDidLayoutSubviews:self];
  }
}

- (uint64_t)_timelineScaleFactor
{
  double v2 = [a1 superview];
  [v2 frame];

  return [a1 bounds];
}

- (uint64_t)_labelIntrinsicContentSize
{
  return -[AVMobileChromelessTimelineView _timelineScaleFactor](a1);
}

- (CGSize)intrinsicContentSize
{
  leadingTimeText = self->_leadingTimeText;
  if (self->_labelPosition)
  {
    if (leadingTimeText)
    {
      [(AVLabel *)self->_leadingLabel intrinsicContentSize];
      double v5 = v4;
    }
    else
    {
      double v5 = 0.0;
    }
    if (self->_trailingTimeText)
    {
      [(AVLabel *)self->_trailingLabel intrinsicContentSize];
      if (v5 < v8) {
        double v5 = v8;
      }
    }
    if (v5 <= 0.0) {
      double v7 = 15.0;
    }
    else {
      double v7 = v5 + 6.0 + 15.0;
    }
  }
  else
  {
    if (leadingTimeText)
    {
      [(AVLabel *)self->_leadingLabel intrinsicContentSize];
      double v7 = fmax(v6, 15.0);
    }
    else
    {
      double v7 = 15.0;
    }
    if (self->_trailingTimeText)
    {
      [(AVLabel *)self->_trailingLabel intrinsicContentSize];
      if (v7 < v9) {
        double v7 = v9;
      }
    }
  }
  double v10 = *MEMORY[0x1E4FB30D8];
  double v11 = v7;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)didMoveToWindow
{
  v20.receiver = self;
  v20.super_class = (Class)AVMobileChromelessTimelineView;
  [(AVMobileChromelessTimelineView *)&v20 didMoveToWindow];
  if (self)
  {
    if (self->_slider) {
      goto LABEL_17;
    }
    double v3 = (objc_class *)(self->_overrideFluidSliderPreference
                      ? AVMobileChromelessFluidSlider
                      : AVMobileChromelessSlider);
    double v4 = (AVMobileChromelessSlider *)objc_alloc_init(v3);
    slider = self->_slider;
    self->_slider = v4;

    [(AVMobileChromelessSlider *)self->_slider setAutoresizingMask:0];
    [(AVMobileChromelessSlider *)self->_slider setBarHeight:7.5];
    [(AVMobileChromelessSlider *)self->_slider setSemanticContentAttribute:3];
    [(UIView *)self->_slider setAvkit_extendedDynamicRangeGain:self->_sliderExtendedDynamicRangeGain];
    -[AVMobileChromelessTimelineView _updateSliderEnabledStateIfNeeded]((uint64_t)self);
    [(AVMobileChromelessTimelineView *)self addSubview:self->_slider];
    if (self->_slider)
    {
LABEL_17:
      if (!self->_trailingLabel)
      {
        double v6 = objc_alloc_init(AVLabel);
        trailingLabel = self->_trailingLabel;
        self->_trailingLabel = v6;

        [(AVLabel *)self->_trailingLabel setAccessibilityIdentifier:@"Remaining Time"];
        double v8 = self->_trailingLabel;
        double v9 = AVLocalizedString(@"Remaining Time");
        [(AVLabel *)v8 setAccessibilityLabel:v9];

        [(AVLabel *)self->_trailingLabel setIsAccessibilityElement:1];
        [(AVLabel *)self->_trailingLabel setAutoresizingMask:0];
        [(AVLabel *)self->_trailingLabel setUserInteractionEnabled:0];
        double v10 = self->_trailingLabel;
        double v11 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
        [(AVLabel *)v10 setTextColor:v11];

        [(UIView *)self->_trailingLabel setAvkit_extendedDynamicRangeGain:self->_labelsExtendedDynamicRangeGain];
        [(AVMobileChromelessTimelineView *)self insertSubview:self->_trailingLabel aboveSubview:self->_slider];
      }
      if (!self->_leadingLabel)
      {
        double v12 = objc_alloc_init(AVLabel);
        leadingLabel = self->_leadingLabel;
        self->_leadingLabel = v12;

        [(AVLabel *)self->_leadingLabel setAccessibilityIdentifier:@"Elapsed Time"];
        double v14 = self->_leadingLabel;
        double v15 = AVLocalizedString(@"Elapsed Time");
        [(AVLabel *)v14 setAccessibilityLabel:v15];

        [(AVLabel *)self->_leadingLabel setIsAccessibilityElement:1];
        [(AVLabel *)self->_leadingLabel setAutoresizingMask:0];
        [(AVLabel *)self->_leadingLabel setUserInteractionEnabled:0];
        double v16 = self->_leadingLabel;
        double v17 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
        [(AVLabel *)v16 setTextColor:v17];

        [(UIView *)self->_leadingLabel setAvkit_extendedDynamicRangeGain:self->_labelsExtendedDynamicRangeGain];
        [(AVMobileChromelessTimelineView *)self insertSubview:self->_leadingLabel aboveSubview:self->_trailingLabel];
      }
    }
    if (self->_slider && !self->_labelShadowView)
    {
      double v18 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      labelShadowView = self->_labelShadowView;
      self->_labelShadowView = v18;

      [(UIView *)self->_labelShadowView setIsAccessibilityElement:0];
      [(UIView *)self->_labelShadowView setAutoresizingMask:0];
      [(UIView *)self->_labelShadowView setUserInteractionEnabled:0];
      [(AVMobileChromelessTimelineView *)self insertSubview:self->_labelShadowView belowSubview:self->_slider];
    }
  }
  [(AVMobileChromelessTimelineView *)self _setUpShadowAppearance];
  -[AVMobileChromelessTimelineView _updateFonts]((uint64_t)self);
}

- (void)_updateFonts
{
  if (a1)
  {
    double v2 = *(void **)(a1 + 568);
    if (v2)
    {
      id v3 = v2;
    }
    else
    {
      id v3 = [*(id *)(a1 + 536) timeLabelFont];
    }
    id v4 = v3;
    [*(id *)(a1 + 456) setFont:v3];
    [*(id *)(a1 + 464) setFont:v4];
    [(id)a1 setNeedsLayout];
  }
}

- (uint64_t)_updateSliderEnabledStateIfNeeded
{
  if (result)
  {
    uint64_t v1 = result;
    int v2 = *(unsigned __int8 *)(result + 516);
    CGSize result = [*(id *)(result + 592) isEnabled];
    if (v2 != result)
    {
      id v3 = *(void **)(v1 + 592);
      uint64_t v4 = *(unsigned __int8 *)(v1 + 516);
      return [v3 setEnabled:v4];
    }
  }
  return result;
}

- (void)prepareForDeemphasisIfNeeded
{
  if (self->_overrideFluidSliderPreference
    || (+[AVKitGlobalSettings shared],
        id v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 fluidSliderEnabled],
        v3,
        v4))
  {
    if ([(AVMobileChromelessTimelineView *)self isEmphasized])
    {
      if ([MEMORY[0x1E4FB1EB0] _isInRetargetableAnimationBlock])
      {
        double v5 = [(AVMobileChromelessTimelineView *)self fluidSlider];
        [v5 _removeAllRetargetableAnimations:0];
        double v6 = (void *)MEMORY[0x1E4FB1EB0];
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __62__AVMobileChromelessTimelineView_prepareForDeemphasisIfNeeded__block_invoke;
        v8[3] = &unk_1E5FC3D18;
        id v9 = v5;
        double v10 = self;
        id v7 = v5;
        [v6 performWithoutAnimation:v8];
      }
    }
  }
}

uint64_t __62__AVMobileChromelessTimelineView_prepareForDeemphasisIfNeeded__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setBarHeight:11.25];
  [*(id *)(a1 + 32) frame];
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  int v2 = *(void **)(a1 + 40);

  return [v2 layoutIfNeeded];
}

- (void)setSliderExtendedDynamicRangeGain:(double)a3
{
  if (self->_sliderExtendedDynamicRangeGain != a3)
  {
    self->_sliderExtendedDynamicRangeGain = a3;
    -[UIView setAvkit_extendedDynamicRangeGain:](self->_slider, "setAvkit_extendedDynamicRangeGain:");
  }
}

- (void)setLabelsCompositingFilter:(id)a3
{
  id v7 = (NSString *)a3;
  if (self->_labelsCompositingFilter != v7)
  {
    objc_storeStrong((id *)&self->_labelsCompositingFilter, a3);
    double v5 = [(AVLabel *)self->_trailingLabel layer];
    [v5 setCompositingFilter:v7];

    double v6 = [(AVLabel *)self->_leadingLabel layer];
    [v6 setCompositingFilter:v7];
  }
}

- (void)setLabelsFont:(id)a3
{
  double v5 = (UIFont *)a3;
  p_labelsFont = &self->_labelsFont;
  if (self->_labelsFont != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_labelsFont, a3);
    -[AVMobileChromelessTimelineView _updateFonts]((uint64_t)self);
    double v5 = v7;
  }

  MEMORY[0x1F41817F8](p_labelsFont, v5);
}

- (void)setLabelsTextColor:(id)a3
{
  int v4 = (UIColor *)a3;
  if (self->_labelsTextColor != v4)
  {
    id v7 = v4;
    if (v4)
    {
      double v5 = v4;
    }
    else
    {
      double v5 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    }
    labelsTextColor = self->_labelsTextColor;
    self->_labelsTextColor = v5;

    [(AVLabel *)self->_trailingLabel setTextColor:self->_labelsTextColor];
    [(AVLabel *)self->_leadingLabel setTextColor:self->_labelsTextColor];
    int v4 = v7;
  }
}

- (void)setLabelsExtendedDynamicRangeGain:(double)a3
{
  if (self->_labelsExtendedDynamicRangeGain != a3)
  {
    self->_double labelsExtendedDynamicRangeGain = a3;
    -[UIView setAvkit_extendedDynamicRangeGain:](self->_trailingLabel, "setAvkit_extendedDynamicRangeGain:");
    leadingLabel = self->_leadingLabel;
    double labelsExtendedDynamicRangeGain = self->_labelsExtendedDynamicRangeGain;
    [(UIView *)leadingLabel setAvkit_extendedDynamicRangeGain:labelsExtendedDynamicRangeGain];
  }
}

- (void)setTrailingTimeText:(id)a3
{
  double v5 = (NSString *)a3;
  if (self->_trailingTimeText != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_trailingTimeText, a3);
    [(AVLabel *)self->_trailingLabel setText:self->_trailingTimeText];
    [(AVMobileChromelessTimelineView *)self setNeedsLayout];
    double v5 = v6;
  }
}

- (void)setStyleSheet:(id)a3
{
  double v5 = (AVMobileChromelessControlsStyleSheet *)a3;
  p_styleSheet = &self->_styleSheet;
  if (self->_styleSheet != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_styleSheet, a3);
    -[AVMobileChromelessTimelineView _updateFonts]((uint64_t)self);
    double v5 = v7;
  }

  MEMORY[0x1F41817F8](p_styleSheet, v5);
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[AVMobileChromelessTimelineView _updateSliderEnabledStateIfNeeded]((uint64_t)self);
  }
}

- (void)setEmphasized:(BOOL)a3
{
  if (self->_emphasized != a3)
  {
    self->_BOOL emphasized = a3;
    if ([(AVMobileChromelessTimelineView *)self isEmphasized])
    {
      if (self->_labelPosition == 1) {
        double v4 = 0.0;
      }
      else {
        double v4 = 1.0;
      }
      double v5 = 15.0;
    }
    else
    {
      double v5 = 7.5;
      double v4 = 1.0;
    }
    [(AVMobileChromelessSlider *)self->_slider setBarHeight:v5];
    if (!self->_labelsAutoadjustWithSliderEmphasis)
    {
      [(AVLabel *)self->_leadingLabel setAlpha:v4];
      [(AVLabel *)self->_trailingLabel setAlpha:v4];
    }
    [(AVMobileChromelessTimelineView *)self setNeedsLayout];
  }
}

- (void)setLeadingTimeText:(id)a3
{
  double v5 = (NSString *)a3;
  if (self->_leadingTimeText != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_leadingTimeText, a3);
    [(AVLabel *)self->_leadingLabel setText:self->_leadingTimeText];
    [(AVMobileChromelessTimelineView *)self setNeedsLayout];
    double v5 = v6;
  }
}

- (void)setLabelPosition:(unint64_t)a3
{
  if (self->_labelPosition != a3)
  {
    self->_unint64_t labelPosition = a3;
    [(AVMobileChromelessTimelineView *)self setNeedsLayout];
  }
}

- (AVMobileChromelessTimelineView)initWithUsingFluidSlider:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVMobileChromelessTimelineView;
  double v4 = -[AVView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v5 = v4;
  if (v4)
  {
    v4->_overrideFluidSliderPreference = a3;
    -[AVMobileChromelessTimelineView _commonInit]((uint64_t)v4);
  }
  return v5;
}

- (uint64_t)_commonInit
{
  int v2 = *(void **)(a1 + 528);
  *(void *)(a1 + 528) = 0;

  id v3 = *(void **)(a1 + 544);
  *(void *)(a1 + 544) = 0;

  *(void *)(a1 + 520) = 0;
  *(unsigned char *)(a1 + 514) = 1;
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  *(_OWORD *)(a1 + 480) = *MEMORY[0x1E4F1DB20];
  *(_OWORD *)(a1 + 496) = v4;
  *(unsigned char *)(a1 + 515) = 0;
  *(unsigned char *)(a1 + 516) = 1;

  return [(id)a1 setIgnoresTouches:1];
}

- (AVMobileChromelessTimelineView)initWithStyleSheet:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AVMobileChromelessTimelineView;
  double v6 = -[AVView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  objc_super v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_styleSheet, a3);
    double v8 = +[AVKitGlobalSettings shared];
    v7->_overrideFluidSliderPreference = [v8 fluidSliderEnabled];

    -[AVMobileChromelessTimelineView _commonInit]((uint64_t)v7);
  }

  return v7;
}

@end