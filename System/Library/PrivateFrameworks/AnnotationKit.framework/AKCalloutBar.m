@interface AKCalloutBar
- (AKCalloutBar)initWithFrame:(CGRect)a3;
- (BOOL)up;
- (CGRect)dividerLineRectForControl:(int64_t)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFitsControls:(id)a3;
- (NSArray)controls;
- (double)arrowX;
- (id)newMaskView:(int64_t)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setArrowX:(double)a3;
- (void)setBlurDisabled:(BOOL)a3;
- (void)setControls:(id)a3;
- (void)setHighlighted:(BOOL)a3 forControl:(id)a4;
- (void)setUp:(BOOL)a3;
@end

@implementation AKCalloutBar

- (AKCalloutBar)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)AKCalloutBar;
  v3 = -[AKCalloutBar initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F1C550] clearColor];
    [(AKCalloutBar *)v3 setBackgroundColor:v4];

    id v5 = objc_alloc(MEMORY[0x263F1CBE8]);
    [(AKCalloutBar *)v3 bounds];
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:privateStyle:", 2050);
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = (_UIBackdropView *)v6;

    v8 = [(_UIBackdropView *)v3->_backgroundView layer];
    [v8 setAllowsGroupOpacity:0];

    v9 = [(_UIBackdropView *)v3->_backgroundView layer];
    [v9 setAllowsGroupBlending:0];

    if (objc_opt_respondsToSelector()) {
      [(_UIBackdropView *)v3->_backgroundView performSelector:sel_setDisablesOccludedBackdropBlurs_ withObject:0];
    }
    [(AKCalloutBar *)v3 bounds];
    -[_UIBackdropView setFrame:](v3->_backgroundView, "setFrame:");
    [(_UIBackdropView *)v3->_backgroundView setAutoresizingMask:18];
    [(AKCalloutBar *)v3 addSubview:v3->_backgroundView];
    uint64_t v10 = [objc_alloc(MEMORY[0x263F1CBE8]) initWithPrivateStyle:2020];
    separatorBackgroundView = v3->_separatorBackgroundView;
    v3->_separatorBackgroundView = (_UIBackdropView *)v10;

    v12 = [(_UIBackdropView *)v3->_separatorBackgroundView layer];
    [v12 setAllowsGroupOpacity:0];

    v13 = [(_UIBackdropView *)v3->_separatorBackgroundView layer];
    [v13 setAllowsGroupBlending:0];

    [(AKCalloutBar *)v3 bounds];
    -[_UIBackdropView setFrame:](v3->_separatorBackgroundView, "setFrame:");
    [(_UIBackdropView *)v3->_separatorBackgroundView setAutoresizingMask:18];
    [(AKCalloutBar *)v3 addSubview:v3->_separatorBackgroundView];
    uint64_t v14 = [(AKCalloutBar *)v3 newMaskView:4];
    blurMaskView = v3->_blurMaskView;
    v3->_blurMaskView = (UIImageView *)v14;

    uint64_t v16 = [(AKCalloutBar *)v3 newMaskView:3];
    tintMaskView = v3->_tintMaskView;
    v3->_tintMaskView = (UIImageView *)v16;

    uint64_t v18 = [(AKCalloutBar *)v3 newMaskView:7];
    separatorMaskView = v3->_separatorMaskView;
    v3->_separatorMaskView = (UIImageView *)v18;
  }
  return v3;
}

- (void)dealloc
{
  [(AKCalloutBar *)self setControls:0];
  v3.receiver = self;
  v3.super_class = (Class)AKCalloutBar;
  [(AKCalloutBar *)&v3 dealloc];
}

- (id)newMaskView:(int64_t)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263F1C6D0]);
  [v4 _setBackdropMaskViewFlags:a3];
  [v4 setAutoresizingMask:18];
  return v4;
}

- (void)setBlurDisabled:(BOOL)a3
{
  if (a3)
  {
    id v4 = [MEMORY[0x263F1CBF0] settingsForPrivateStyle:2050 graphicsQuality:10];
    [(_UIBackdropView *)self->_backgroundView transitionToSettings:v4];
    [MEMORY[0x263F1CBF0] settingsForPrivateStyle:2020 graphicsQuality:10];
  }
  else
  {
    id v4 = [MEMORY[0x263F1CBF0] settingsForPrivateStyle:2050];
    [(_UIBackdropView *)self->_backgroundView transitionToSettings:v4];
    [MEMORY[0x263F1CBF0] settingsForPrivateStyle:2020];
  }
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  [(_UIBackdropView *)self->_separatorBackgroundView transitionToSettings:v5];
}

- (void)setHighlighted:(BOOL)a3 forControl:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [(AKCalloutBar *)self controls];
  uint64_t v8 = [v7 indexOfObject:v6];

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v4)
    {
      [(AKCalloutBar *)self dividerLineRectForControl:v8];
      CGFloat v10 = v9;
      CGFloat v25 = v11;
      CGFloat v26 = v9;
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      CGFloat v27 = v15;
      [(AKCalloutBar *)self dividerLineRectForControl:v8 - 1];
      CGFloat x = v29.origin.x;
      CGFloat y = v29.origin.y;
      CGFloat width = v29.size.width;
      CGFloat height = v29.size.height;
      CGFloat MaxX = CGRectGetMaxX(v29);
      v30.origin.CGFloat x = v10;
      v30.origin.CGFloat y = v12;
      v30.size.CGFloat width = v14;
      v30.size.CGFloat height = v27;
      double MinX = CGRectGetMinX(v30);
      v31.origin.CGFloat x = x;
      v31.origin.CGFloat y = y;
      v31.size.CGFloat width = width;
      v31.size.CGFloat height = height;
      double v22 = MinX - CGRectGetMaxX(v31);
      v32.origin.CGFloat y = v25;
      v32.origin.CGFloat x = v26;
      v32.size.CGFloat width = v14;
      v32.size.CGFloat height = v27;
      CGFloat v23 = CGRectGetHeight(v32);
      CGFloat v24 = 0.0;
    }
    else
    {
      CGFloat MaxX = *MEMORY[0x263F001A8];
      CGFloat v24 = *(double *)(MEMORY[0x263F001A8] + 8);
      double v22 = *(double *)(MEMORY[0x263F001A8] + 16);
      CGFloat v23 = *(double *)(MEMORY[0x263F001A8] + 24);
    }
    v33.origin.CGFloat x = MaxX;
    v33.origin.CGFloat y = v24;
    v33.size.CGFloat width = v22;
    v33.size.CGFloat height = v23;
    if (!CGRectEqualToRect(v33, self->_highlightRect))
    {
      self->_highlightRect.origin.CGFloat x = MaxX;
      self->_highlightRect.origin.CGFloat y = v24;
      self->_highlightRect.size.CGFloat width = v22;
      self->_highlightRect.size.CGFloat height = v23;
      [(AKCalloutBar *)self setNeedsLayout];
    }
  }
}

- (void)layoutSubviews
{
  v96.receiver = self;
  v96.super_class = (Class)AKCalloutBar;
  [(AKCalloutBar *)&v96 layoutSubviews];
  objc_super v3 = [(AKCalloutBar *)self controls];
  [(AKCalloutBar *)self sizeThatFitsControls:v3];
  double v5 = v4;

  [(AKCalloutBar *)self bounds];
  double Width = CGRectGetWidth(v101);
  v7 = [(AKCalloutBar *)self controls];
  uint64_t v8 = [v7 count];

  double v9 = [(AKCalloutBar *)self controls];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    unint64_t v11 = 0;
    double v12 = (Width - v5) / (double)(unint64_t)(2 * v8) + 6.0;
    double v13 = v12;
    do
    {
      CGFloat v14 = [(AKCalloutBar *)self controls];
      double v15 = [v14 objectAtIndex:v11];

      [v15 frame];
      double v17 = v16;
      double v18 = round(v13);
      if ([(AKCalloutBar *)self up]) {
        double v19 = 14.0;
      }
      else {
        double v19 = 0.0;
      }
      objc_msgSend(v15, "setFrame:", v18, v19, v17, 38.0);
      v102.origin.CGFloat x = v18;
      v102.origin.CGFloat y = v19;
      v102.size.CGFloat width = v17;
      v102.size.CGFloat height = 38.0;
      double v20 = CGRectGetWidth(v102);
      objc_super v21 = [MEMORY[0x263F1C920] mainScreen];
      [v21 scale];
      double v13 = v13 + v20 + 1.0 / v22 + v12 * 2.0;

      ++v11;
      CGFloat v23 = [(AKCalloutBar *)self controls];
      unint64_t v24 = [v23 count];
    }
    while (v11 < v24);
  }
  [(AKCalloutBar *)self bounds];
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  double v30 = v29;
  CGFloat v32 = v31;
  double v33 = 0.0;
  v97.CGFloat width = v29;
  v97.CGFloat height = v31;
  UIGraphicsBeginImageContextWithOptions(v97, 0, 0.0);
  if ([(AKCalloutBar *)self up]) {
    double v33 = 14.0;
  }
  v34 = [MEMORY[0x263F1C550] blackColor];
  [v34 set];

  v35 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRoundedRect:cornerRadius:", 0.0, v33, v30, 38.0, 8.0);
  [v35 fill];

  v36 = [MEMORY[0x263F1C550] blackColor];
  [v36 set];

  if ([(AKCalloutBar *)self up]) {
    double v37 = 5.0;
  }
  else {
    double v37 = 38.0;
  }
  [(AKCalloutBar *)self arrowX];
  double v39 = v38;
  v103.origin.CGFloat x = v26;
  v103.origin.CGFloat y = v28;
  v103.size.CGFloat width = v30;
  v103.size.CGFloat height = v32;
  double v40 = CGRectGetWidth(v103) + -17.0;
  if (v39 < v40) {
    double v40 = v39;
  }
  double v41 = fmax(v40, 17.0);
  double v42 = round(v41 + -9.0);
  v43 = [MEMORY[0x263F1C478] bezierPath];
  if ([(AKCalloutBar *)self up])
  {
    objc_msgSend(v43, "moveToPoint:", v41, v37);
    double v37 = v37 + 9.0;
  }
  else
  {
    objc_msgSend(v43, "moveToPoint:", v41, v37 + 9.0);
  }
  objc_msgSend(v43, "addLineToPoint:", v42, v37);
  objc_msgSend(v43, "addLineToPoint:", v42 + 18.0, v37);
  [v43 closePath];
  [v43 fill];
  v44 = UIGraphicsGetImageFromCurrentImageContext();
  v45 = [MEMORY[0x263F1C550] clearColor];
  [v45 set];

  v46 = [(AKCalloutBar *)self controls];
  uint64_t v47 = [v46 count];

  if (v47 >= 2)
  {
    uint64_t v48 = 0;
    do
    {
      [(AKCalloutBar *)self dividerLineRectForControl:v48];
      UIRectFillUsingBlendMode(v104, kCGBlendModeCopy);
      ++v48;
      v49 = [(AKCalloutBar *)self controls];
      uint64_t v50 = [v49 count] - 1;
    }
    while (v48 < v50);
  }
  v51 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  [v51 size];
  CGFloat v53 = v52;
  CGFloat v55 = v54;
  [v51 scale];
  CGFloat v57 = v56;
  v98.CGFloat width = v53;
  v98.CGFloat height = v55;
  UIGraphicsBeginImageContextWithOptions(v98, 0, v57);
  double v58 = *MEMORY[0x263F00148];
  double v59 = *(double *)(MEMORY[0x263F00148] + 8);
  objc_msgSend(v51, "drawAtPoint:blendMode:alpha:", 17, *MEMORY[0x263F00148], v59, 1.0);
  v60 = [MEMORY[0x263F1C550] blackColor];
  [v60 set];

  [v51 size];
  CGFloat v62 = v61;
  [v51 size];
  v105.size.CGFloat height = v63;
  v105.origin.CGFloat x = 0.0;
  v105.origin.CGFloat y = 0.0;
  v105.size.CGFloat width = v62;
  UIRectFillUsingBlendMode(v105, kCGBlendModeSourceOut);
  v64 = UIGraphicsGetImageFromCurrentImageContext();
  [(UIImageView *)self->_blurMaskView setImage:v64];

  [(UIImageView *)self->_blurMaskView sizeToFit];
  UIGraphicsEndImageContext();
  [(_UIBackdropView *)self->_backgroundView updateMaskViewsForView:self->_blurMaskView];
  [v51 size];
  CGFloat v66 = v65;
  CGFloat v68 = v67;
  [v51 scale];
  CGFloat v70 = v69;
  v99.CGFloat width = v66;
  v99.CGFloat height = v68;
  UIGraphicsBeginImageContextWithOptions(v99, 0, v70);
  objc_msgSend(v51, "drawAtPoint:blendMode:alpha:", 17, v58, v59, 1.0);
  if (!CGRectIsEmpty(self->_highlightRect))
  {
    v71 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v72 = [v71 _graphicsQuality];

    double v73 = 0.75;
    if (v72 != 10) {
      double v73 = 0.4;
    }
    v74 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:v73];
    [v74 set];

    UIRectFillUsingBlendMode(self->_highlightRect, kCGBlendModeSourceIn);
  }
  v75 = [MEMORY[0x263F1C550] blackColor];
  [v75 set];

  [v51 size];
  CGFloat v77 = v76;
  [v51 size];
  v106.size.CGFloat height = v78;
  v106.origin.CGFloat x = 0.0;
  v106.origin.CGFloat y = 0.0;
  v106.size.CGFloat width = v77;
  UIRectFillUsingBlendMode(v106, kCGBlendModeSourceOut);
  v79 = UIGraphicsGetImageFromCurrentImageContext();
  [(UIImageView *)self->_tintMaskView setImage:v79];

  [(UIImageView *)self->_tintMaskView sizeToFit];
  UIGraphicsEndImageContext();
  [(_UIBackdropView *)self->_backgroundView updateMaskViewsForView:self->_tintMaskView];
  [v51 size];
  CGFloat v81 = v80;
  CGFloat v83 = v82;
  [v51 scale];
  CGFloat v85 = v84;
  v100.CGFloat width = v81;
  v100.CGFloat height = v83;
  UIGraphicsBeginImageContextWithOptions(v100, 0, v85);
  v86 = [MEMORY[0x263F1C550] blackColor];
  [v86 set];

  v87 = [(AKCalloutBar *)self controls];
  uint64_t v88 = [v87 count];

  if (v88 != 1)
  {
    unint64_t v89 = 0;
    do
    {
      [(AKCalloutBar *)self dividerLineRectForControl:v89];
      UIRectFillUsingBlendMode(v107, kCGBlendModeCopy);
      ++v89;
      v90 = [(AKCalloutBar *)self controls];
      unint64_t v91 = [v90 count] - 1;
    }
    while (v89 < v91);
  }
  objc_msgSend(v44, "drawAtPoint:blendMode:alpha:", 22, v58, v59, 1.0);
  [v51 size];
  CGFloat v93 = v92;
  [v51 size];
  v108.size.CGFloat height = v94;
  v108.origin.CGFloat x = 0.0;
  v108.origin.CGFloat y = 0.0;
  v108.size.CGFloat width = v93;
  UIRectFillUsingBlendMode(v108, kCGBlendModeSourceOut);
  v95 = UIGraphicsGetImageFromCurrentImageContext();
  [(UIImageView *)self->_separatorMaskView setImage:v95];

  [(UIImageView *)self->_separatorMaskView sizeToFit];
  UIGraphicsEndImageContext();
  [(_UIBackdropView *)self->_separatorBackgroundView updateMaskViewsForView:self->_separatorMaskView];
}

- (CGRect)dividerLineRectForControl:(int64_t)a3
{
  double v5 = [MEMORY[0x263F1C920] mainScreen];
  [v5 scale];
  double v7 = v6;

  if (a3 < 0)
  {
    double v15 = 0.0;
  }
  else
  {
    uint64_t v8 = [(AKCalloutBar *)self controls];
    unint64_t v9 = [v8 count] - 1;

    if (v9 <= a3)
    {
      [(AKCalloutBar *)self bounds];
      double v15 = v16;
    }
    else
    {
      uint64_t v10 = [(AKCalloutBar *)self controls];
      unint64_t v11 = [v10 objectAtIndex:a3];

      double v12 = [(AKCalloutBar *)self controls];
      double v13 = [v12 objectAtIndex:a3 + 1];

      [v13 frame];
      double MinX = CGRectGetMinX(v21);
      [v11 frame];
      double v15 = round((MinX + CGRectGetMaxX(v22) + -1.0) * 0.5);
    }
  }
  double v17 = 1.0 / v7;
  double v18 = 52.0;
  double v19 = v15;
  double v20 = 0.0;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4 = [(AKCalloutBar *)self controls];
  [(AKCalloutBar *)self sizeThatFitsControls:v4];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.CGFloat height = v10;
  result.CGFloat width = v9;
  return result;
}

- (void)setControls:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  double v5 = (NSArray *)a3;
  p_controls = &self->_controls;
  controls = self->_controls;
  if (controls != v5)
  {
    CGFloat v23 = v5;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    double v8 = controls;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(v8);
          }
          double v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          [v13 removeFromSuperview];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v13 setBar:0];
          }
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v10);
    }

    objc_storeStrong((id *)&self->_controls, a3);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    CGFloat v14 = *p_controls;
    uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v14);
          }
          double v19 = *(void **)(*((void *)&v24 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v20 = v19;
            [v20 setBar:self];
            uint64_t v21 = [(NSArray *)*p_controls indexOfObject:v20];
            if (v21)
            {
              if (v21 == [(NSArray *)*p_controls count] - 1) {
                uint64_t v22 = 2;
              }
              else {
                uint64_t v22 = 1;
              }
            }
            else
            {
              uint64_t v22 = 0;
            }
            [v20 setPosition:v22];
          }
          [(AKCalloutBar *)self addSubview:v19];
        }
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v16);
    }

    [(AKCalloutBar *)self setNeedsDisplay];
    double v5 = v23;
  }
}

- (CGSize)sizeThatFitsControls:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    double v7 = 12.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) frame];
        double v7 = v7 + CGRectGetWidth(v19);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 12.0;
  }
  uint64_t v9 = [v3 count];

  double v10 = v7 + (double)(unint64_t)(v9 - 1) * 13.0;
  double v11 = 52.0;
  result.CGFloat height = v11;
  result.CGFloat width = v10;
  return result;
}

- (double)arrowX
{
  return self->_arrowX;
}

- (void)setArrowX:(double)a3
{
  self->_arrowX = a3;
}

- (BOOL)up
{
  return self->_up;
}

- (void)setUp:(BOOL)a3
{
  self->_up = a3;
}

- (NSArray)controls
{
  return self->_controls;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorMaskView, 0);
  objc_storeStrong((id *)&self->_tintMaskView, 0);
  objc_storeStrong((id *)&self->_blurMaskView, 0);
  objc_storeStrong((id *)&self->_separatorBackgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);

  objc_storeStrong((id *)&self->_controls, 0);
}

@end