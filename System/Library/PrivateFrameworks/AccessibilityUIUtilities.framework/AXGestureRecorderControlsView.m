@interface AXGestureRecorderControlsView
+ (double)defaultHeight;
- (AXGestureRecorderControlsView)initWithFrame:(CGRect)a3;
- (AXGestureRecorderControlsViewDelegate)delegate;
- (BOOL)isLeftButtonEnabled;
- (BOOL)isRightButtonEnabled;
- (UIButton)leftButton;
- (UIButton)middleButton;
- (UIButton)rightButton;
- (float)progress;
- (id)makeButton;
- (void)_buttonTapped:(id)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setLeftButton:(id)a3;
- (void)setLeftButtonColor:(int)a3 title:(id)a4 enabled:(BOOL)a5 rightButtonColor:(int)a6 title:(id)a7 enabled:(BOOL)a8 animationDuration:(double)a9 completion:(id)a10;
- (void)setLeftButtonEnabled:(BOOL)a3;
- (void)setMiddleButton:(id)a3;
- (void)setProgress:(float)a3;
- (void)setRightButton:(id)a3;
- (void)setRightButtonEnabled:(BOOL)a3;
@end

@implementation AXGestureRecorderControlsView

+ (double)defaultHeight
{
  return 90.0;
}

- (AXGestureRecorderControlsView)initWithFrame:(CGRect)a3
{
  double width = a3.size.width;
  v20.receiver = self;
  v20.super_class = (Class)AXGestureRecorderControlsView;
  v4 = -[AXGestureRecorderControlsView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    v5 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
    [(AXGestureRecorderControlsView *)v4 setBackgroundColor:v5];

    id v6 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v7 scale];
    v9 = objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, width, 1.0 / v8);

    v10 = [MEMORY[0x1E4FB1618] separatorColor];
    [v9 setBackgroundColor:v10];

    [v9 setAutoresizingMask:2];
    [(AXGestureRecorderControlsView *)v4 addSubview:v9];
    id v11 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    v12 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v12 scale];
    v14 = objc_msgSend(v11, "initWithFrame:", 0.0, 45.0, width, 1.0 / v13);

    v15 = [MEMORY[0x1E4FB1618] separatorColor];
    [v14 setBackgroundColor:v15];

    [v14 setAutoresizingMask:2];
    [(AXGestureRecorderControlsView *)v4 addSubview:v14];
    v16 = [[ASTBiggerProgressView alloc] initWithProgressViewStyle:0];
    progressView = v4->_progressView;
    v4->_progressView = v16;

    [(ASTBiggerProgressView *)v4->_progressView setAutoresizingMask:2];
    v18 = [MEMORY[0x1E4FB1618] quaternaryLabelColor];
    [(ASTBiggerProgressView *)v4->_progressView setTrackTintColor:v18];

    [(ASTBiggerProgressView *)v4->_progressView setProgress:0.0];
    [(AXGestureRecorderControlsView *)v4 addSubview:v4->_progressView];
  }
  return v4;
}

- (float)progress
{
  [(ASTBiggerProgressView *)self->_progressView progress];
  return result;
}

- (void)setProgress:(float)a3
{
  progressView = self->_progressView;
  if (fabsf(a3) >= 2.2204e-16)
  {
    id v13 = [(ASTBiggerProgressView *)progressView safeValueForKeyPath:@"_progressView.image"];
    [v13 capInsets];
    double v7 = v6;
    [v13 capInsets];
    double v9 = v8;
    [(ASTBiggerProgressView *)self->_progressView bounds];
    float v11 = v10;
    double v12 = 0.0;
    if (v11 > 0.0)
    {
      double v12 = v7 + v9;
      *(float *)&double v12 = v7 + v9;
      *(float *)&double v12 = *(float *)&v12 / v11;
    }
    *(float *)&double v12 = *(float *)&v12 + (float)((float)(1.0 - *(float *)&v12) * a3);
    [(ASTBiggerProgressView *)self->_progressView setProgress:1 animated:v12];
  }
  else
  {
    [(ASTBiggerProgressView *)progressView setProgress:0.0];
  }
}

- (void)layoutSubviews
{
  uint64_t v3 = [(AXGestureRecorderControlsView *)self effectiveUserInterfaceLayoutDirection];
  if (v3 == 1) {
    v4 = &OBJC_IVAR___AXGestureRecorderControlsView__rightButton;
  }
  else {
    v4 = &OBJC_IVAR___AXGestureRecorderControlsView__leftButton;
  }
  v5 = *(Class *)((char *)&self->super.super.super.isa + *v4);
  if (v3 == 1) {
    double v6 = &OBJC_IVAR___AXGestureRecorderControlsView__leftButton;
  }
  else {
    double v6 = &OBJC_IVAR___AXGestureRecorderControlsView__rightButton;
  }
  id v44 = v5;
  id v7 = *(id *)((char *)&self->super.super.super.isa + *v6);
  objc_msgSend(v44, "setFrame:", 30.0, 45.0, 125.0, 45.0);
  [v44 sizeToFit];
  [(UIButton *)self->_leftButton frame];
  CGFloat v40 = v8;
  CGFloat v41 = v9;
  CGFloat v11 = v10;
  objc_msgSend(v44, "setFrame:");
  objc_msgSend(v7, "setFrame:", 0.0, 45.0, 125.0, 45.0);
  [v7 sizeToFit];
  [v7 frame];
  double v13 = v12;
  CGFloat v43 = v14;
  double v16 = v15;
  [(AXGestureRecorderControlsView *)self frame];
  double v42 = v13 + v17 - (v16 + 30.0);
  objc_msgSend(v7, "setFrame:");
  [(UIButton *)self->_middleButton sizeToFit];
  [(UIButton *)self->_middleButton frame];
  -[UIButton setFrame:](self->_middleButton, "setFrame:", 0.0, 45.0);
  [(UIButton *)self->_middleButton frame];
  CGFloat v19 = v18;
  double v21 = v20;
  CGFloat v23 = v22;
  [(AXGestureRecorderControlsView *)self bounds];
  double Width = CGRectGetWidth(v46);
  v47.origin.x = v19;
  v47.origin.y = v21;
  v47.size.double width = v23;
  v47.size.height = 45.0;
  double v25 = (Width - CGRectGetWidth(v47)) * 0.5;
  [(AXGestureRecorderControlsView *)self bounds];
  double v26 = CGRectGetWidth(v48);
  v49.origin.x = v40;
  v49.origin.y = v41;
  CGFloat v38 = v11;
  v49.size.double width = v11;
  v49.size.height = 45.0;
  double v27 = CGRectGetWidth(v49);
  v50.origin.x = v42;
  v50.origin.y = v43;
  CGFloat rect = v16;
  v50.size.double width = v16;
  double v28 = v23;
  v50.size.height = 45.0;
  double v29 = v27 + CGRectGetWidth(v50);
  v51.origin.x = v25;
  v51.origin.y = v21;
  v51.size.double width = v23;
  v51.size.height = 45.0;
  if (v26 >= v29 + CGRectGetWidth(v51))
  {
    v55.origin.x = v25;
    v55.origin.y = v21;
    v55.size.double width = v23;
    v55.size.height = 45.0;
    double MaxX = CGRectGetMaxX(v55);
    v56.origin.x = v42;
    v56.origin.y = v43;
    v56.size.double width = rect;
    v56.size.height = 45.0;
    if (MaxX <= CGRectGetMinX(v56))
    {
      v59.origin.x = v40;
      v59.origin.y = v41;
      v59.size.double width = v38;
      v59.size.height = 45.0;
      double v34 = CGRectGetMaxX(v59);
      double v30 = v25;
      v60.origin.x = v25;
      v60.origin.y = v21;
      v60.size.double width = v28;
      v60.size.height = 45.0;
      if (v34 > CGRectGetMinX(v60))
      {
        v61.origin.x = v40;
        v61.origin.y = v41;
        v61.size.double width = v38;
        v61.size.height = 45.0;
        double v30 = CGRectGetMaxX(v61);
      }
    }
    else
    {
      v57.origin.x = v42;
      v57.origin.y = v43;
      v57.size.double width = rect;
      v57.size.height = 45.0;
      double MinX = CGRectGetMinX(v57);
      v58.origin.x = v25;
      v58.origin.y = v21;
      v58.size.double width = v28;
      v58.size.height = 45.0;
      double v30 = MinX - CGRectGetWidth(v58);
    }
  }
  else
  {
    v52.origin.x = v40;
    v52.origin.y = v41;
    v52.size.double width = v38;
    v52.size.height = 45.0;
    double v30 = CGRectGetMaxX(v52);
    v53.origin.x = v42;
    v53.origin.y = v43;
    v53.size.double width = rect;
    v53.size.height = 45.0;
    double v31 = CGRectGetMinX(v53);
    v54.origin.x = v40;
    v54.origin.y = v41;
    v54.size.double width = v38;
    v54.size.height = 45.0;
    double v28 = v31 - CGRectGetMaxX(v54);
  }
  -[UIButton setFrame:](self->_middleButton, "setFrame:", v30, v21, v28, 45.0, *(void *)&v38);
  [(ASTBiggerProgressView *)self->_progressView frame];
  double v36 = v35;
  [(AXGestureRecorderControlsView *)self frame];
  -[ASTBiggerProgressView setFrame:](self->_progressView, "setFrame:", 22.0, v36, v37 + -44.0, 14.0);
  [(ASTBiggerProgressView *)self->_progressView frame];
  -[ASTBiggerProgressView setFrame:](self->_progressView, "setFrame:");
}

- (id)makeButton
{
  v2 = [MEMORY[0x1E4FB1798] fontWithName:@"HelveticaNeue Thin" size:18.0];
  if (_AXSEnhanceTextLegibilityEnabled())
  {
    uint64_t v3 = [MEMORY[0x1E4FB1798] systemFontOfSize:18.0];

    v2 = (void *)v3;
  }
  v4 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
  v5 = [v4 titleLabel];
  [v5 setFont:v2];

  double v6 = [MEMORY[0x1E4FB1618] clearColor];
  [v4 setBackgroundColor:v6];

  id v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v4 setTitleColor:v7 forState:2];

  double v8 = [MEMORY[0x1E4FB1618] systemBlueColor];
  [v4 setTitleColor:v8 forState:0];

  return v4;
}

- (void)setLeftButtonColor:(int)a3 title:(id)a4 enabled:(BOOL)a5 rightButtonColor:(int)a6 title:(id)a7 enabled:(BOOL)a8 animationDuration:(double)a9 completion:(id)a10
{
  uint64_t v10 = a8;
  uint64_t v12 = a5;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v15 = a7;
  double v16 = (void (**)(id, uint64_t))a10;
  double v17 = [(AXGestureRecorderControlsView *)self leftButton];
  double v18 = [(AXGestureRecorderControlsView *)self rightButton];
  if (!v17)
  {
    unsigned int v26 = v12;
    unsigned int v27 = v10;
    id v28 = v15;
    double v17 = [(AXGestureRecorderControlsView *)self makeButton];
    uint64_t v19 = [(AXGestureRecorderControlsView *)self makeButton];

    [(AXGestureRecorderControlsView *)self setRightButton:v19];
    [(AXGestureRecorderControlsView *)self setLeftButton:v17];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v33[0] = v17;
    v33[1] = v19;
    double v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v30 != v23) {
            objc_enumerationMutation(v20);
          }
          double v25 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          [v25 addTarget:self action:sel__buttonTapped_ forControlEvents:64];
          [(AXGestureRecorderControlsView *)self addSubview:v25];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v22);
    }

    double v18 = (void *)v19;
    id v15 = v28;
    uint64_t v12 = v26;
    uint64_t v10 = v27;
  }
  [v17 setTitle:v14 forState:0];
  [v18 setTitle:v15 forState:0];
  [v17 setEnabled:v12];
  [v18 setEnabled:v10];
  UIAccessibilityPostNotification(*MEMORY[0x1E4FB2470], 0);
  if (v16) {
    v16[2](v16, 1);
  }
  [(AXGestureRecorderControlsView *)self layoutSubviews];
}

- (BOOL)isLeftButtonEnabled
{
  v2 = [(AXGestureRecorderControlsView *)self leftButton];
  char v3 = [v2 isEnabled];

  return v3;
}

- (void)setLeftButtonEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(AXGestureRecorderControlsView *)self leftButton];
  [v4 setEnabled:v3];

  UIAccessibilityNotifications v5 = *MEMORY[0x1E4FB2470];
  UIAccessibilityPostNotification(v5, 0);
}

- (BOOL)isRightButtonEnabled
{
  v2 = [(AXGestureRecorderControlsView *)self rightButton];
  char v3 = [v2 isEnabled];

  return v3;
}

- (void)setRightButtonEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(AXGestureRecorderControlsView *)self rightButton];
  [v4 setEnabled:v3];

  UIAccessibilityNotifications v5 = *MEMORY[0x1E4FB2470];
  UIAccessibilityPostNotification(v5, 0);
}

- (void)setMiddleButton:(id)a3
{
  UIAccessibilityNotifications v5 = (UIButton *)a3;
  middleButton = self->_middleButton;
  if (middleButton != v5)
  {
    id v7 = v5;
    [(UIButton *)middleButton removeFromSuperview];
    objc_storeStrong((id *)&self->_middleButton, a3);
    UIAccessibilityNotifications v5 = v7;
    if (v7)
    {
      middleButton = (UIButton *)[(AXGestureRecorderControlsView *)self addSubview:v7];
      UIAccessibilityNotifications v5 = v7;
    }
  }
  MEMORY[0x1F41817F8](middleButton, v5);
}

- (void)_buttonTapped:(id)a3
{
  id v8 = a3;
  id v4 = [(AXGestureRecorderControlsView *)self leftButton];

  if (v4 == v8)
  {
    uint64_t v6 = 0;
  }
  else
  {
    id v5 = [(AXGestureRecorderControlsView *)self rightButton];

    if (v5 == v8) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  id v7 = [(AXGestureRecorderControlsView *)self delegate];
  [v7 gestureRecorderControlsView:self buttonTappedAtIndex:v6];
}

- (AXGestureRecorderControlsViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AXGestureRecorderControlsViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIButton)leftButton
{
  return self->_leftButton;
}

- (void)setLeftButton:(id)a3
{
}

- (UIButton)rightButton
{
  return self->_rightButton;
}

- (void)setRightButton:(id)a3
{
}

- (UIButton)middleButton
{
  return self->_middleButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_middleButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_rightButton, 0);
  objc_storeStrong((id *)&self->_leftButton, 0);
}

@end