@interface LAUIPhysicalButtonView
- (BOOL)isAnimating;
- (BOOL)isInstructionHidden;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (LAUIPhysicalButtonView)init;
- (LAUIPhysicalButtonView)initWithFrame:(CGRect)a3;
- (LAUIPhysicalButtonView)initWithStyle:(int64_t)a3;
- (NSString)instruction;
- (id)_colorForStyle:(int64_t)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)animationStyle;
- (int64_t)style;
- (unsigned)edge;
- (void)_updateOnScreen;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)disableWorkarounds;
- (void)interfaceOrientationDidChange:(id)a3;
- (void)layoutSubviews;
- (void)setAnimating:(BOOL)a3;
- (void)setAnimationStyle:(int64_t)a3;
- (void)setInstruction:(id)a3;
- (void)setIsInstructionHidden:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
- (void)updateFrame;
@end

@implementation LAUIPhysicalButtonView

- (LAUIPhysicalButtonView)init
{
  return 0;
}

- (LAUIPhysicalButtonView)initWithFrame:(CGRect)a3
{
  return 0;
}

- (LAUIPhysicalButtonView)initWithStyle:(int64_t)a3
{
  v4 = (double *)MEMORY[0x263F001A8];
  double v5 = *MEMORY[0x263F001A8];
  double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
  v34.receiver = self;
  v34.super_class = (Class)LAUIPhysicalButtonView;
  v9 = -[LAUIPhysicalButtonView initWithFrame:](&v34, sel_initWithFrame_, v5, v6, v7, v8);
  if (v9)
  {
    v9->_export = SBSUIHardwareButtonHintViewsSupported();
    v9->_style = a3;
    v10 = [(LAUIPhysicalButtonView *)v9 _colorForStyle:a3];
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", *v4, v4[1], v4[2], v4[3]);
    containerView = v9->_containerView;
    v9->_containerView = (UIView *)v11;

    [(LAUIPhysicalButtonView *)v9 addSubview:v9->_containerView];
    v13 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
    buttonView = v9->_buttonView;
    v9->_buttonView = v13;

    [(UIView *)v9->_buttonView setBackgroundColor:v10];
    v33 = [(UIView *)v9->_buttonView layer];
    [v33 setCornerCurve:*MEMORY[0x263F15A20]];
    [(UIView *)v9->_containerView addSubview:v9->_buttonView];
    v15 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    instructionLabel = v9->_instructionLabel;
    v9->_instructionLabel = v15;

    [(UILabel *)v9->_instructionLabel setLineBreakMode:4];
    [(UILabel *)v9->_instructionLabel setMinimumScaleFactor:0.75];
    [(UILabel *)v9->_instructionLabel setAdjustsFontSizeToFitWidth:1];
    v17 = v9->_instructionLabel;
    v18 = (void *)MEMORY[0x263F1C658];
    id v19 = (id)*MEMORY[0x263F1D148];
    v20 = [MEMORY[0x263F1C408] sharedApplication];
    v21 = [v20 preferredContentSizeCategory];

    if (v19
      && ([v19 isEqualToString:*MEMORY[0x263F1D1A0]] & 1) == 0
      && UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v21, (UIContentSizeCategory)v19) == NSOrderedDescending)
    {
      id v22 = v19;

      v21 = v22;
    }

    v23 = (void *)MEMORY[0x263F1C658];
    v24 = [MEMORY[0x263F1CB00] traitCollectionWithPreferredContentSizeCategory:v21];
    v25 = [v23 preferredFontForTextStyle:*MEMORY[0x263F1D260] compatibleWithTraitCollection:v24];

    [v25 _scaledValueForValue:19.0];
    double v27 = v26;

    v28 = [v18 systemFontOfSize:v27];
    [(UILabel *)v17 setFont:v28];

    [(UILabel *)v9->_instructionLabel setTextColor:v10];
    v29 = v9->_instructionLabel;
    v30 = [MEMORY[0x263F1C550] clearColor];
    [(UILabel *)v29 setBackgroundColor:v30];

    [(UILabel *)v9->_instructionLabel setAlpha:0.0];
    [(UILabel *)v9->_instructionLabel setNumberOfLines:0];
    [(UIView *)v9->_containerView addSubview:v9->_instructionLabel];
    [(LAUIPhysicalButtonView *)v9 setAnimationStyle:1];
    v31 = [MEMORY[0x263F08A00] defaultCenter];
    [v31 addObserver:v9 selector:sel_interfaceOrientationDidChange_ name:*MEMORY[0x263F1D1B0] object:0];
  }
  return v9;
}

- (void)dealloc
{
  [(SBSHardwareButtonHintViewContentVisibilityControlling *)self->_exportedHandle invalidate];
  v3.receiver = self;
  v3.super_class = (Class)LAUIPhysicalButtonView;
  [(LAUIPhysicalButtonView *)&v3 dealloc];
}

- (void)didMoveToWindow
{
  v9.receiver = self;
  v9.super_class = (Class)LAUIPhysicalButtonView;
  [(LAUIPhysicalButtonView *)&v9 didMoveToWindow];
  objc_super v3 = [(LAUIPhysicalButtonView *)self window];
  v4 = [v3 windowScene];
  self->_lastInterfaceOrientation = [v4 interfaceOrientation];

  if (v3)
  {
    double v5 = [v3 screen];
    double v6 = [v5 fixedCoordinateSpace];
    fixedCoordinateSpace = self->_fixedCoordinateSpace;
    self->_fixedCoordinateSpace = v6;

    [(LAUIPhysicalButtonView *)self setNeedsLayout];
    [(LAUIPhysicalButtonView *)self updateFrame];
  }
  else
  {
    double v8 = self->_fixedCoordinateSpace;
    self->_fixedCoordinateSpace = 0;

    [(LAUIPhysicalButtonViewAnimation *)self->_animation endImmediately];
  }
  [(LAUIPhysicalButtonView *)self _updateOnScreen];
}

- (void)interfaceOrientationDidChange:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_workaroundsDisabled)
  {
    if (self->_lastInterfaceOrientation)
    {
      double v5 = [(LAUIPhysicalButtonView *)self window];

      if (v5)
      {
        double v6 = [(LAUIPhysicalButtonView *)self window];
        double v7 = [v6 windowScene];
        int64_t v8 = [v7 interfaceOrientation];

        objc_super v9 = LA_LOG_LAUIPhysicalButtonView();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v10 = self->_lastInterfaceOrientation - 1;
          if (v10 > 3) {
            uint64_t v11 = @"Unknown";
          }
          else {
            uint64_t v11 = off_26420C730[v10];
          }
          if ((unint64_t)(v8 - 1) > 3) {
            v12 = @"Unknown";
          }
          else {
            v12 = off_26420C730[v8 - 1];
          }
          *(_DWORD *)buf = 138412546;
          v16 = v11;
          __int16 v17 = 2112;
          v18 = v12;
          _os_log_impl(&dword_214463000, v9, OS_LOG_TYPE_DEFAULT, "Interface orientation did change notification triggered _lastInterfaceOrientation: %@ currentInterfaceOrientation: %@", buf, 0x16u);
        }

        if (v8 != self->_lastInterfaceOrientation)
        {
          v13 = [(LAUIPhysicalButtonView *)self layer];
          [v13 setOpacity:0.0];

          self->_lastInterfaceOrientation = v8;
          v14[0] = MEMORY[0x263EF8330];
          v14[1] = 3221225472;
          v14[2] = __56__LAUIPhysicalButtonView_interfaceOrientationDidChange___block_invoke;
          v14[3] = &unk_26420C698;
          v14[4] = self;
          [MEMORY[0x263F1CB60] animateWithDuration:0 delay:v14 options:0 animations:0.1 completion:0.4];
        }
      }
    }
  }
}

void __56__LAUIPhysicalButtonView_interfaceOrientationDidChange___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) layer];
  LODWORD(v2) = 1.0;
  id v3 = v1;
  [v1 setOpacity:v2];
}

- (void)updateFrame
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  if (self->_fixedCoordinateSpace)
  {
    id v3 = [(LAUIPhysicalButtonView *)self superview];
    if (!v3)
    {
LABEL_43:

      return;
    }
    id v4 = [(LAUIPhysicalButtonView *)self window];
    double v5 = v4;
    if (!v4)
    {
LABEL_42:

      goto LABEL_43;
    }
    double v6 = [v4 windowScene];
    double v7 = [v5 screen];
    [v7 scale];
    int64_t v8 = [v7 coordinateSpace];
    coordinateSpace = self->_coordinateSpace;
    self->_coordinateSpace = v8;

    [(UICoordinateSpace *)self->_fixedCoordinateSpace bounds];
    [(LAUIPhysicalButtonView *)self _physicalButtonNormalizedFrame];
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    uint64_t v15 = v14;
    uint64_t v17 = v16;
    v18 = LA_LOG_LAUIPhysicalButtonView();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = [v6 interfaceOrientation];
      if ((unint64_t)(v19 - 1) > 3) {
        v20 = @"Unknown";
      }
      else {
        v20 = off_26420C730[v19 - 1];
      }
      *(_DWORD *)buf = 138412290;
      v61 = v20;
      _os_log_impl(&dword_214463000, v18, OS_LOG_TYPE_DEFAULT, "LA: current orientation: %@", buf, 0xCu);
    }

    v21 = LA_LOG_LAUIPhysicalButtonView();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = [NSString stringWithFormat:@"{ x:%.3f, y:%.3f, w:%.3f, h:%.3f }", v11, v13, v15, v17];
      *(_DWORD *)buf = 138412290;
      v61 = v22;
      _os_log_impl(&dword_214463000, v21, OS_LOG_TYPE_DEFAULT, "MG: physical button normalized frame: %@", buf, 0xCu);
    }
    -[UICoordinateSpace convertRect:fromCoordinateSpace:](self->_coordinateSpace, "convertRect:fromCoordinateSpace:", self->_fixedCoordinateSpace);
    double rect = v23;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    if (self->_export) {
      double v30 = 5.0;
    }
    else {
      double v30 = 6.0;
    }
    v31 = self->_coordinateSpace;
    [(UICoordinateSpace *)self->_fixedCoordinateSpace bounds];
    -[UICoordinateSpace convertRect:fromCoordinateSpace:](v31, "convertRect:fromCoordinateSpace:", self->_fixedCoordinateSpace);
    CGFloat v36 = v32;
    CGFloat v37 = v33;
    CGFloat v38 = v34;
    CGFloat v39 = v35;
    if (v29 <= 0.0)
    {
      if (v27 >= CGRectGetMidY(*(CGRect *)&v32))
      {
        double v27 = v27 - v30;
        unsigned int v40 = 3;
      }
      else
      {
        unsigned int v40 = 1;
      }
      double v29 = v30;
    }
    else
    {
      if (v25 >= CGRectGetMidX(*(CGRect *)&v32))
      {
        double v25 = v25 - v30;
        unsigned int v40 = 2;
      }
      else
      {
        unsigned int v40 = 0;
      }
      double rect = v30;
    }
    unsigned int edge = self->_edge;
    if (edge != v40)
    {
      self->_unsigned int edge = v40;
      switch(v40)
      {
        case 1u:
        case 3u:
          instructionLabel = self->_instructionLabel;
          v63.origin.x = v25;
          v63.origin.y = v27;
          v63.size.width = rect;
          v63.size.height = v29;
          double MidX = CGRectGetMidX(v63);
          v64.origin.x = v36;
          v64.origin.y = v37;
          v64.size.width = v38;
          v64.size.height = v39;
          uint64_t v44 = 2 * (MidX >= CGRectGetMidX(v64));
          break;
        case 2u:
          instructionLabel = self->_instructionLabel;
          uint64_t v44 = 2;
          break;
        default:
          uint64_t v44 = 0;
          instructionLabel = self->_instructionLabel;
          break;
      }
      [(UILabel *)instructionLabel setTextAlignment:v44];
      [(LAUIPhysicalButtonView *)self setNeedsLayout];
    }
    objc_msgSend(v3, "convertRect:fromCoordinateSpace:", self->_coordinateSpace, v25, v27, rect, v29);
    double v46 = v45;
    double v48 = v47;
    double v50 = v49;
    double v52 = v51;
    v53 = LA_LOG_LAUIPhysicalButtonView();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      v54 = [NSString stringWithFormat:@"{ x:%.3f, y:%.3f, w:%.3f, h:%.3f }", *(void *)&v46, *(void *)&v48, *(void *)&v50, *(void *)&v52];
      *(_DWORD *)buf = 138412290;
      v61 = v54;
      _os_log_impl(&dword_214463000, v53, OS_LOG_TYPE_DEFAULT, "LA: physical button view frame: %@", buf, 0xCu);
    }
    if (self->_exportedHandle || self->_exporting)
    {
      double v55 = *MEMORY[0x263F00148];
      double v56 = *(double *)(MEMORY[0x263F00148] + 8);
      [(LAUIPhysicalButtonView *)self bounds];
      v67.origin.x = v55;
      v67.origin.y = v56;
      v67.size.width = v50;
      v67.size.height = v52;
      if (CGRectEqualToRect(v65, v67))
      {
LABEL_38:
        if (edge != v40)
        {
          if ([(LAUIPhysicalButtonViewAnimation *)self->_animation isRunning])
          {
            [(LAUIPhysicalButtonViewAnimation *)self->_animation endImmediately];
            [(LAUIPhysicalButtonViewAnimation *)self->_animation begin];
          }
        }

        goto LABEL_42;
      }
      -[LAUIPhysicalButtonView setBounds:](self, "setBounds:", v55, v56, v50, v52);
      v57 = LA_LOG_LAUIPhysicalButtonView();
      if (!os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
LABEL_37:

        goto LABEL_38;
      }
      *(_WORD *)buf = 0;
      v58 = "LA: physical button view bounds updated - exported view was incorrectly sized";
    }
    else
    {
      [(LAUIPhysicalButtonView *)self frame];
      v68.origin.x = v46;
      v68.origin.y = v48;
      v68.size.width = v50;
      v68.size.height = v52;
      if (CGRectEqualToRect(v66, v68)) {
        goto LABEL_38;
      }
      -[LAUIPhysicalButtonView setFrame:](self, "setFrame:", v46, v48, v50, v52);
      v57 = LA_LOG_LAUIPhysicalButtonView();
      if (!os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_37;
      }
      *(_WORD *)buf = 0;
      v58 = "LA: physical button view frame updated";
    }
    _os_log_impl(&dword_214463000, v57, OS_LOG_TYPE_DEFAULT, v58, buf, 2u);
    goto LABEL_37;
  }
}

- (void)disableWorkarounds
{
  if (!self->_workaroundsDisabled)
  {
    self->_workaroundsDisabled = 1;
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self name:*MEMORY[0x263F1D1B0] object:0];
  }
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    -[LAUIPhysicalButtonView _colorForStyle:](self, "_colorForStyle:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_buttonView, "setBackgroundColor:");
    [(UILabel *)self->_instructionLabel setTextColor:v4];
  }
}

- (void)setAnimationStyle:(int64_t)a3
{
  if (self->_animationStyle == a3) {
    return;
  }
  self->_animationStyle = a3;
  animation = self->_animation;
  if (animation)
  {
    [(LAUIPhysicalButtonViewAnimation *)animation endImmediately];
    double v6 = self->_animation;
    self->_animation = 0;
  }
  if (a3 == 2)
  {
    uint64_t v10 = [LAUIPhysicalButtonViewShimmerAnimation alloc];
    double v7 = [(UILabel *)self->_instructionLabel layer];
    objc_super v9 = [(LAUIPhysicalButtonViewAnimation *)v10 initWith:self layer:v7];
    goto LABEL_10;
  }
  if (a3 == 1)
  {
    int64_t v8 = [LAUIPhysicalButtonViewBounceAnimation alloc];
    double v7 = [(UIView *)self->_containerView layer];
    objc_super v9 = [(LAUIPhysicalButtonViewAnimation *)v8 initWith:self layer:v7];
LABEL_10:
    uint64_t v11 = self->_animation;
    self->_animation = v9;

    goto LABEL_11;
  }
  if (a3) {
    goto LABEL_12;
  }
  double v7 = self->_animation;
  self->_animation = 0;
LABEL_11:

LABEL_12:
  if (self->_onScreen)
  {
    uint64_t v12 = self->_animation;
    [(LAUIPhysicalButtonViewAnimation *)v12 begin];
  }
}

- (void)layoutSubviews
{
  v70.receiver = self;
  v70.super_class = (Class)LAUIPhysicalButtonView;
  [(LAUIPhysicalButtonView *)&v70 layoutSubviews];
  id v3 = [(LAUIPhysicalButtonView *)self window];
  id v4 = [v3 screen];
  [v4 scale];
  double v64 = v5;
  unsigned int edge = self->_edge;
  if (self->_export) {
    double v7 = 44.0;
  }
  else {
    double v7 = 8.0;
  }
  unsigned int v8 = edge & 0xFFFFFFFD;
  if ((edge & 0xFFFFFFFD) != 0) {
    double v9 = 20.0;
  }
  else {
    double v9 = 8.0;
  }
  [(LAUIPhysicalButtonView *)self bounds];
  double v65 = v11;
  double v66 = v10;
  double v13 = v12;
  double v15 = v14;
  double v62 = v7;
  [(UICoordinateSpace *)self->_coordinateSpace bounds];
  -[LAUIPhysicalButtonView convertRect:fromCoordinateSpace:](self, "convertRect:fromCoordinateSpace:", self->_coordinateSpace);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  if (v8) {
    double v24 = 40.0;
  }
  else {
    double v24 = 16.0;
  }
  [(LAUIPhysicalButtonViewAnimation *)self->_animation update];
  double v59 = v23;
  double v60 = v19;
  double v25 = v13;
  if ((edge | 2) == 2)
  {
    if (self->_export) {
      double v25 = v13;
    }
    else {
      double v25 = v13 * 4.0;
    }
  }
  double v61 = v17;
  double v26 = v25;
  double v27 = v15;
  if ((edge | 2) != 2)
  {
    double v26 = v15 * 4.0;
    if (self->_export) {
      double v26 = v15;
    }
    double v27 = v26;
  }
  CGFloat amount = v26;
  -[UILabel sizeThatFits:](self->_instructionLabel, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  double v67 = v28;
  double v30 = v29;
  double v56 = v21 - v24;
  if (self->_coordinateSpace)
  {
    double v31 = 0.0;
    if (!v8) {
      double v31 = v13;
    }
    double v32 = v21 - v24 - v31;
    double v33 = fmin(v30, v32);
    if (v32 > 0.0) {
      double v30 = v33;
    }
  }
  double v34 = v13;
  if ((edge | 2) == 2) {
    double v34 = v25 + v30 + 8.0;
  }
  double v35 = v15;
  if ((edge | 2) == 2)
  {
    double v36 = v25 - v13;
  }
  else
  {
    double v35 = v27 + v67 + 8.0;
    double v36 = v27 - v15;
  }
  double v37 = v34;
  if ((edge | 2) != 2) {
    double v37 = v35;
  }
  double v58 = v9;
  double v38 = v37 - v36;
  switch(self->_edge)
  {
    case 0u:
      if (!self->_onScreen) {
        double v36 = v62 + v34;
      }
      double v39 = v66 - v36;
      goto LABEL_43;
    case 1u:
      if (!self->_onScreen) {
        double v36 = v62 + v35;
      }
      double v40 = v65 - v36;
      goto LABEL_45;
    case 2u:
      double v42 = v65;
      double v41 = v66;
      double v43 = v13;
      double v44 = v15;
      if (self->_onScreen) {
        double v39 = CGRectGetMaxX(*(CGRect *)&v41) - v38;
      }
      else {
        double v39 = v62 + CGRectGetMaxX(*(CGRect *)&v41);
      }
LABEL_43:
      double v40 = v65;
      break;
    case 3u:
      double v46 = v65;
      double v45 = v66;
      double v47 = v13;
      double v48 = v15;
      if (self->_onScreen) {
        double v40 = CGRectGetMaxY(*(CGRect *)&v45) - v38;
      }
      else {
        double v40 = v62 + CGRectGetMaxY(*(CGRect *)&v45);
      }
LABEL_45:
      double v39 = v66;
      break;
    default:
      double v39 = *MEMORY[0x263F00148];
      double v40 = *(double *)(MEMORY[0x263F00148] + 8);
      break;
  }
  -[UIView setFrame:](self->_containerView, "setFrame:", v39, v40, v34, v35, *(void *)&v56);
  [(UIView *)self->_containerView bounds];
  CGRect remainder = v71;
  CGRectDivide(v71, &slice, &remainder, amount, (CGRectEdge)self->_edge);
  double v49 = fmax(v64, 1.0);
  -[UIView setFrame:](self->_buttonView, "setFrame:", round(v49 * (slice.origin.x + (slice.size.width - v25) * 0.5)) / v49, round(v49 * (slice.origin.y + (slice.size.height - v27) * 0.5)) / v49, v25, v27);
  double v50 = [(UIView *)self->_buttonView layer];
  double v51 = v50;
  if (self->_export) {
    double v52 = round(v49 * fmin(v25 * 0.5, v27 * 0.5)) / v49;
  }
  else {
    double v52 = 5.0;
  }
  [v50 setCornerRadius:v52];

  CGRectDivide(remainder, &slice, &remainder, 8.0, (CGRectEdge)self->_edge);
  double height = remainder.size.height;
  double y = remainder.origin.y;
  double v55 = round(v49 * (remainder.origin.x + (remainder.size.width - v30) * 0.5)) / v49;
  if ((edge | 2) != 2 && self->_coordinateSpace)
  {
    -[UIView convertRect:fromView:](self->_containerView, "convertRect:fromView:", self, v58 + v61, v60 + 8.0, v57, v59 + -16.0);
    double v55 = fmin(CGRectGetMaxX(v72) - v30, fmax(v72.origin.x, v55));
  }
  -[UILabel setFrame:](self->_instructionLabel, "setFrame:", v55, round(v49 * (y + (height - v67) * 0.5)) / v49, v30);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(UIView *)self->_containerView frame];
  CGFloat v10 = x;
  CGFloat v11 = y;
  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)LAUIPhysicalButtonView;
  double v5 = -[LAUIPhysicalButtonView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  if (v5) {
    uint64_t v6 = self;
  }
  else {
    uint64_t v6 = 0;
  }
  double v7 = v6;

  return v7;
}

- (id)_colorForStyle:(int64_t)a3
{
  int64_t style = self->_style;
  if (style == 2)
  {
    id v4 = objc_msgSend(MEMORY[0x263F1C550], "blackColor", a3);
    if (v4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (style != 1
    || (objc_msgSend(MEMORY[0x263F1C550], "colorWithWhite:alpha:", a3, 0.9803922, 1.0),
        (id v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_6:
    id v4 = [MEMORY[0x263F1C550] colorWithRed:0.56 green:0.56 blue:0.58 alpha:1.0];
  }
LABEL_7:
  return v4;
}

- (void)setAnimating:(BOOL)a3
{
  if (self->_animating != a3)
  {
    self->_animating = a3;
    [(LAUIPhysicalButtonView *)self _updateOnScreen];
  }
}

- (void)_updateOnScreen
{
  uint64_t v3 = [(LAUIPhysicalButtonView *)self window];
  id v4 = (void *)v3;
  if (!self->_animating || v3 == 0)
  {
    if (!v3)
    {
      exportedHandle = self->_exportedHandle;
      if (exportedHandle)
      {
        [(SBSHardwareButtonHintViewContentVisibilityControlling *)exportedHandle invalidate];
        double v7 = self->_exportedHandle;
        self->_exportedHandle = 0;

        [(LAUIPhysicalButtonView *)self updateFrame];
      }
    }
    BOOL v9 = 0;
    BOOL v8 = 0;
  }
  else
  {
    BOOL v8 = !self->_isInstructionHidden;
    BOOL v9 = !self->_isInstructionHidden;
  }
  if (self->_onScreen != v9)
  {
    [(LAUIPhysicalButtonView *)self layoutIfNeeded];
    self->_onScreen = v9;
    if (v8 && self->_export && !self->_exportedHandle && !self->_exporting)
    {
      self->_exporting = 1;
      objc_initWeak(&location, self);
      v48[5] = MEMORY[0x263EF8330];
      v48[6] = 3221225472;
      v48[7] = __41__LAUIPhysicalButtonView__updateOnScreen__block_invoke;
      v48[8] = &unk_26420C6E8;
      objc_copyWeak(&v49, &location);
      SBSUIRegisterHardwareButtonHintViewAsync();
      objc_destroyWeak(&v49);
      objc_destroyWeak(&location);
    }
    [(UIView *)self->_containerView frame];
    double v11 = v10;
    double v13 = v12;
    [(LAUIPhysicalButtonView *)self setNeedsLayout];
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __41__LAUIPhysicalButtonView__updateOnScreen__block_invoke_3;
    v48[3] = &unk_26420C698;
    v48[4] = self;
    [MEMORY[0x263F1CB60] performWithoutAnimation:v48];
    [(UIView *)self->_containerView frame];
    double v16 = v15;
    double v17 = v14;
    if (v11 == v15 && v13 == v14)
    {
      if (self->_onScreen)
      {
        double v26 = self->_exportedHandle;
        uint64_t v27 = 1;
      }
      else
      {
        double v26 = self->_exportedHandle;
        if (!self->_visibilityAnimationCount)
        {
          double v38 = 0.0;
          if (v26)
          {
            [(SBSHardwareButtonHintViewContentVisibilityControlling *)v26 invalidate];
            double v42 = self->_exportedHandle;
            self->_exportedHandle = 0;

            [(LAUIPhysicalButtonView *)self updateFrame];
          }
          goto LABEL_29;
        }
        uint64_t v27 = 0;
      }
      double v38 = 0.0;
      [(SBSHardwareButtonHintViewContentVisibilityControlling *)v26 setContentVisibility:v27 animationSettings:0];
    }
    else
    {
      if (self->_onScreen)
      {
        double v19 = [MEMORY[0x263F15890] animationWithKeyPath:@"position"];
        [v19 setMass:1.0];
        [v19 setStiffness:109.6623];
        [v19 setDamping:14.6608];
        [v19 setVelocity:0.0];
        LODWORD(v20) = 1036831949;
        LODWORD(v21) = 0.25;
        LODWORD(v22) = 0.25;
        LODWORD(v23) = 1.0;
        double v24 = [MEMORY[0x263F15808] functionWithControlPoints:v21 :v20 :v22 :v23];
        [v19 setTimingFunction:v24];

        [v19 durationForEpsilon:0.001];
        objc_msgSend(v19, "setDuration:");
        id v25 = v19;
        [(SBSHardwareButtonHintViewContentVisibilityControlling *)self->_exportedHandle setContentVisibility:1 animationSettings:0];
      }
      else
      {
        double v28 = [MEMORY[0x263F15760] animationWithKeyPath:@"position"];
        LODWORD(v29) = 1036831949;
        LODWORD(v30) = 0.25;
        LODWORD(v31) = 0.25;
        LODWORD(v32) = 1.0;
        double v33 = [MEMORY[0x263F15808] functionWithControlPoints:v30 :v29 :v31 :v32];
        [v28 setTimingFunction:v33];

        [v28 setDuration:0.25];
        id v25 = v28;
        [(SBSHardwareButtonHintViewContentVisibilityControlling *)self->_exportedHandle setContentVisibility:0 animationSettings:0];
      }

      ++self->_visibilityAnimationCount;
      objc_initWeak(&location, self);
      uint64_t v43 = MEMORY[0x263EF8330];
      uint64_t v44 = 3221225472;
      double v45 = __41__LAUIPhysicalButtonView__updateOnScreen__block_invoke_4;
      double v46 = &unk_26420C710;
      objc_copyWeak(&v47, &location);
      objc_msgSend(v25, "laui_setDidStopHandler:", &v43);
      objc_msgSend(v25, "setAdditive:", 1, v43, v44, v45, v46);
      [v25 setFillMode:*MEMORY[0x263F15AB8]];
      double v34 = (CAAnimation *)v25;
      double v35 = objc_msgSend(MEMORY[0x263F08D40], "valueWithPoint:", v11 - v16, v13 - v17);
      [(CAAnimation *)v34 setFromValue:v35];

      double v36 = objc_msgSend(MEMORY[0x263F08D40], "valueWithPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
      [(CAAnimation *)v34 setToValue:v36];

      [(CAAnimation *)v34 duration];
      double v38 = v37;
      double v39 = [(UIView *)self->_containerView layer];
      id v40 = LAUILayerAddAdditiveAnimation(v39, 0, v34);

      objc_destroyWeak(&v47);
      objc_destroyWeak(&location);
    }
LABEL_29:
    animation = self->_animation;
    if (self->_onScreen) {
      [(LAUIPhysicalButtonViewAnimation *)animation beginWithDelay:v38];
    }
    else {
      [(LAUIPhysicalButtonViewAnimation *)animation end];
    }
  }
}

void __41__LAUIPhysicalButtonView__updateOnScreen__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__LAUIPhysicalButtonView__updateOnScreen__block_invoke_2;
  v5[3] = &unk_26420C6C0;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);

  objc_destroyWeak(&v7);
}

void __41__LAUIPhysicalButtonView__updateOnScreen__block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 409) = 0;
    if (*((unsigned char *)WeakRetained + 452))
    {
      objc_storeStrong(WeakRetained + 52, *(id *)(a1 + 32));
      [v3[52] setContentVisibility:1 animationSettings:0];
    }
    else
    {
      [*(id *)(a1 + 32) invalidate];
      [v3 updateFrame];
    }
  }
  else
  {
    [*(id *)(a1 + 32) invalidate];
  }
}

uint64_t __41__LAUIPhysicalButtonView__updateOnScreen__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

void __41__LAUIPhysicalButtonView__updateOnScreen__block_invoke_4(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v1 = WeakRetained[53] - 1;
    WeakRetained[53] = v1;
    if (!v1 && !*((unsigned char *)WeakRetained + 452))
    {
      double v2 = (void *)WeakRetained[52];
      if (v2)
      {
        [v2 invalidate];
        id v3 = (void *)WeakRetained[52];
        WeakRetained[52] = 0;

        [WeakRetained updateFrame];
      }
    }
  }
}

- (void)setInstruction:(id)a3
{
  BOOL v9 = (NSString *)a3;
  if ([(NSString *)v9 length])
  {
    id v4 = v9;
  }
  else
  {

    id v4 = 0;
  }
  instruction = self->_instruction;
  double v10 = v4;
  if (instruction != v4 && (!v4 || !instruction || ([(NSString *)instruction isEqual:v4] & 1) == 0))
  {
    id v6 = (NSString *)[(NSString *)v10 copy];
    id v7 = self->_instruction;
    self->_instruction = v6;

    [(UILabel *)self->_instructionLabel setText:self->_instruction];
    double v8 = 0.0;
    if (self->_instruction) {
      double v8 = 1.0;
    }
    [(UILabel *)self->_instructionLabel setAlpha:v8];
    [(LAUIPhysicalButtonView *)self setNeedsLayout];
  }
}

- (void)setIsInstructionHidden:(BOOL)a3
{
  if (self->_isInstructionHidden != a3)
  {
    self->_isInstructionHidden = a3;
    [(LAUIPhysicalButtonView *)self _updateOnScreen];
  }
}

- (int64_t)style
{
  return self->_style;
}

- (int64_t)animationStyle
{
  return self->_animationStyle;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (unsigned)edge
{
  return self->_edge;
}

- (NSString)instruction
{
  return self->_instruction;
}

- (BOOL)isInstructionHidden
{
  return self->_isInstructionHidden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instruction, 0);
  objc_storeStrong((id *)&self->_animation, 0);
  objc_storeStrong((id *)&self->_buttonView, 0);
  objc_storeStrong((id *)&self->_instructionLabel, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_coordinateSpace, 0);
  objc_storeStrong((id *)&self->_fixedCoordinateSpace, 0);
  objc_storeStrong((id *)&self->_exportedHandle, 0);
}

@end