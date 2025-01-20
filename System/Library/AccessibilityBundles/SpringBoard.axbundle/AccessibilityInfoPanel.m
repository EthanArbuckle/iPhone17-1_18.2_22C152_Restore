@interface AccessibilityInfoPanel
- (AccessibilityInfoPanel)init;
- (AccessibilityInfoPanel)initWithTitle:(id)a3;
- (BOOL)displayOnBottomEdge;
- (CGRect)_displayFrame;
- (NSString)title;
- (id)_accessibilityInfoPanelController;
- (id)_accessibilityInfoPanelView;
- (id)_accessibilityInfoPanelWindow;
- (id)_rootView;
- (void)_layoutSubviews;
- (void)_setup;
- (void)dealloc;
- (void)fadeOut;
- (void)hide;
- (void)setDisplayOnBottomEdge:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)show;
@end

@implementation AccessibilityInfoPanel

- (AccessibilityInfoPanel)init
{
  v3.receiver = self;
  v3.super_class = (Class)AccessibilityInfoPanel;
  return [(AccessibilityInfoPanel *)&v3 init];
}

- (AccessibilityInfoPanel)initWithTitle:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AccessibilityInfoPanel;
  v5 = [(AccessibilityInfoPanel *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(AccessibilityInfoPanel *)v5 setTitle:v4];
    [(AccessibilityInfoPanel *)v6 _setup];
  }

  return v6;
}

- (void)dealloc
{
  [(AccessibilityInfoPanelWindow *)self->_accessibilityInfoPanelWindow setHidden:1];
  [(AccessibilityInfoPanelWindow *)self->_accessibilityInfoPanelWindow setRootViewController:0];
  [(UIViewController *)self->_accessibilityInfoPanelController setView:0];
  [(UILabel *)self->_labelView removeFromSuperview];
  [(UIView *)self->_backgroundView removeFromSuperview];
  [(UIView *)self->_accessibilityInfoPanelView removeFromSuperview];
  [(UIView *)self->_rootView removeFromSuperview];
  v3.receiver = self;
  v3.super_class = (Class)AccessibilityInfoPanel;
  [(AccessibilityInfoPanel *)&v3 dealloc];
}

- (void)_setup
{
  id v6 = [(AccessibilityInfoPanel *)self _rootView];
  objc_super v3 = [(AccessibilityInfoPanel *)self _accessibilityInfoPanelView];
  id v4 = [(AccessibilityInfoPanel *)self _accessibilityInfoPanelWindow];
  v5 = [(AccessibilityInfoPanel *)self _accessibilityInfoPanelController];
  [v4 addSubview:v6];
  [v6 addSubview:v3];
  [v5 setView:v3];
  [v6 layoutSubviews];
}

- (BOOL)displayOnBottomEdge
{
  return self->_displayOnBottomEdge;
}

- (void)setDisplayOnBottomEdge:(BOOL)a3
{
  self->_displayOnBottomEdge = a3;
  [(AccessibilityInfoPanel *)self _layoutSubviews];
}

- (void)show
{
  int v3 = [(AccessibilityInfoPanelWindow *)self->_accessibilityInfoPanelWindow isHidden];
  accessibilityInfoPanelView = self->_accessibilityInfoPanelView;
  if (v3)
  {
    [(UIView *)accessibilityInfoPanelView setAlpha:0.0];
    [(AccessibilityInfoPanelWindow *)self->_accessibilityInfoPanelWindow setHidden:0];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __30__AccessibilityInfoPanel_show__block_invoke;
    v6[3] = &unk_265153D50;
    v6[4] = self;
    [MEMORY[0x263F1CB60] animateWithDuration:v6 animations:0.5];
  }
  else
  {
    [(UIView *)accessibilityInfoPanelView setAlpha:1.0];
    [(UILabel *)self->_labelView setAlpha:1.0];
    backgroundView = self->_backgroundView;
    [(UIView *)backgroundView setAlpha:0.6];
  }
}

uint64_t __30__AccessibilityInfoPanel_show__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) setAlpha:1.0];
  [*(id *)(*(void *)(a1 + 32) + 40) setAlpha:1.0];
  v2 = *(void **)(*(void *)(a1 + 32) + 48);

  return [v2 setAlpha:0.6];
}

- (void)hide
{
}

- (void)fadeOut
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __33__AccessibilityInfoPanel_fadeOut__block_invoke;
  v3[3] = &unk_265153D50;
  v3[4] = self;
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __33__AccessibilityInfoPanel_fadeOut__block_invoke_2;
  v2[3] = &unk_265153E80;
  v2[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:v3 animations:v2 completion:1.0];
}

uint64_t __33__AccessibilityInfoPanel_fadeOut__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) setAlpha:0.0];
}

uint64_t __33__AccessibilityInfoPanel_fadeOut__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) hide];
}

- (CGRect)_displayFrame
{
  int v3 = [MEMORY[0x263F1C920] mainScreen];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  BOOL displayOnBottomEdge = self->_displayOnBottomEdge;
  v9 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v10 = [v9 userInterfaceIdiom];

  double v11 = -v5;
  if (displayOnBottomEdge)
  {
    double v12 = v7 + -80.0;
    if (v10 == 1) {
      double v13 = 0.75;
    }
    else {
      double v13 = 0.9;
    }
    double v14 = v5 + v11 * v13;
  }
  else
  {
    if (v10 == 1)
    {
      double v13 = 0.75;
      double v14 = v5 + v11 * 0.75;
      *(double *)&uint64_t v15 = 80.0;
    }
    else
    {
      double v13 = 0.9;
      double v14 = v5 + v11 * 0.9;
      *(double *)&uint64_t v15 = 40.0;
    }
    double v12 = *(double *)&v15;
  }
  double v16 = v5 * v13;
  double v17 = v14 * 0.5;
  double v18 = 60.0;
  result.size.height = v18;
  result.size.width = v16;
  result.origin.y = v12;
  result.origin.x = v17;
  return result;
}

- (id)_accessibilityInfoPanelController
{
  accessibilityInfoPanelController = self->_accessibilityInfoPanelController;
  if (!accessibilityInfoPanelController)
  {
    double v4 = (UIViewController *)[objc_allocWithZone(MEMORY[0x263F1CB68]) init];
    double v5 = self->_accessibilityInfoPanelController;
    self->_accessibilityInfoPanelController = v4;

    accessibilityInfoPanelController = self->_accessibilityInfoPanelController;
  }

  return accessibilityInfoPanelController;
}

- (id)_accessibilityInfoPanelWindow
{
  accessibilityInfoPanelWindow = self->_accessibilityInfoPanelWindow;
  if (!accessibilityInfoPanelWindow)
  {
    double v4 = [(AccessibilityInfoPanel *)self _accessibilityInfoPanelController];
    double v5 = [AccessibilityInfoPanelWindow alloc];
    double v6 = [MEMORY[0x263F1C920] mainScreen];
    [v6 bounds];
    double v7 = -[AccessibilityInfoPanelWindow initWithFrame:](v5, "initWithFrame:");
    objc_super v8 = self->_accessibilityInfoPanelWindow;
    self->_accessibilityInfoPanelWindow = v7;

    [(AccessibilityInfoPanelWindow *)self->_accessibilityInfoPanelWindow setAlpha:1.0];
    [(AccessibilityInfoPanelWindow *)self->_accessibilityInfoPanelWindow setHidden:1];
    [(AccessibilityInfoPanelWindow *)self->_accessibilityInfoPanelWindow setWindowLevel:10000021.0];
    [(AccessibilityInfoPanelWindow *)self->_accessibilityInfoPanelWindow setAccessibilityElementsHidden:1];
    [(AccessibilityInfoPanelWindow *)self->_accessibilityInfoPanelWindow _setAccessibilityWindowVisible:0];
    v9 = self->_accessibilityInfoPanelWindow;
    uint64_t v10 = [MEMORY[0x263F1C550] clearColor];
    [(AccessibilityInfoPanelWindow *)v9 setBackgroundColor:v10];

    [(AccessibilityInfoPanelWindow *)self->_accessibilityInfoPanelWindow setRootViewController:v4];
    [(AccessibilityInfoPanelWindow *)self->_accessibilityInfoPanelWindow setUserInteractionEnabled:0];
    [(AccessibilityInfoPanelWindow *)self->_accessibilityInfoPanelWindow setDelegate:v4];

    accessibilityInfoPanelWindow = self->_accessibilityInfoPanelWindow;
  }

  return accessibilityInfoPanelWindow;
}

- (void)_layoutSubviews
{
  [(AccessibilityInfoPanel *)self _displayFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIView setFrame:](self->_accessibilityInfoPanelView, "setFrame:");
  backgroundView = self->_backgroundView;
  [(UIView *)self->_accessibilityInfoPanelView bounds];
  -[UIView setFrame:](backgroundView, "setFrame:");
  labelView = self->_labelView;
  [(UIView *)self->_accessibilityInfoPanelView bounds];
  -[UILabel setFrame:](labelView, "setFrame:");
  id v17 = [MEMORY[0x263F1C658] systemFontOfSize:18.0];
  -[NSString _legacy_sizeWithFont:constrainedToSize:lineBreakMode:](self->_title, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", v8, 3.40282347e38);
  if (v13 > v10)
  {
    double v14 = v13 + 10.0;
    double v15 = v13 + 10.0 - v10;
    if (v6 <= 160.0) {
      double v15 = 0.0;
    }
    double v6 = v6 - v15;
    double v10 = v14;
  }
  -[UIView setFrame:](self->_accessibilityInfoPanelView, "setFrame:", v4, v6, v8, v10);
  double v16 = self->_labelView;
  [(UIView *)self->_accessibilityInfoPanelView bounds];
  -[UILabel setFrame:](v16, "setFrame:");
}

- (id)_accessibilityInfoPanelView
{
  accessibilityInfoPanelView = self->_accessibilityInfoPanelView;
  if (!accessibilityInfoPanelView)
  {
    [(AccessibilityInfoPanel *)self _displayFrame];
    double v8 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v4, v5, v6, v7);
    double v9 = self->_accessibilityInfoPanelView;
    self->_accessibilityInfoPanelView = v8;

    [(UIView *)self->_accessibilityInfoPanelView setAccessibilityElementsHidden:1];
    [(UIView *)self->_accessibilityInfoPanelView setUserInteractionEnabled:0];
    double v10 = self->_accessibilityInfoPanelView;
    double v11 = [MEMORY[0x263F1C550] clearColor];
    [(UIView *)v10 setBackgroundColor:v11];

    id v12 = objc_alloc(MEMORY[0x263F1CB60]);
    [(UIView *)self->_accessibilityInfoPanelView bounds];
    double v13 = (UIView *)objc_msgSend(v12, "initWithFrame:");
    backgroundView = self->_backgroundView;
    self->_backgroundView = v13;

    [(UIView *)self->_backgroundView setAutoresizingMask:18];
    double v15 = self->_backgroundView;
    double v16 = [MEMORY[0x263F1C550] grayColor];
    [(UIView *)v15 setBackgroundColor:v16];

    id v17 = [(UIView *)self->_backgroundView layer];
    [v17 setCornerRadius:5.0];

    double v18 = [(UIView *)self->_backgroundView layer];
    objc_msgSend(v18, "setShadowOffset:", 3.0, 3.0);

    v19 = [(UIView *)self->_backgroundView layer];
    LODWORD(v20) = 0.75;
    [v19 setShadowOpacity:v20];

    [(UIView *)self->_backgroundView setTag:100];
    [(UIView *)self->_accessibilityInfoPanelView addSubview:self->_backgroundView];
    v21 = [MEMORY[0x263F1C658] systemFontOfSize:18.0];
    id v22 = objc_allocWithZone(MEMORY[0x263F1C768]);
    [(UIView *)self->_accessibilityInfoPanelView bounds];
    v23 = (UILabel *)objc_msgSend(v22, "initWithFrame:");
    labelView = self->_labelView;
    self->_labelView = v23;

    v25 = self->_labelView;
    v26 = [MEMORY[0x263F1C550] clearColor];
    [(UILabel *)v25 setBackgroundColor:v26];

    [(UILabel *)self->_labelView setTextAlignment:1];
    [(UILabel *)self->_labelView setLineBreakMode:0];
    v27 = self->_labelView;
    v28 = [MEMORY[0x263F1C550] whiteColor];
    [(UILabel *)v27 setTextColor:v28];

    [(UILabel *)self->_labelView setNumberOfLines:0];
    [(UILabel *)self->_labelView setTag:200];
    v29 = self->_labelView;
    v30 = [MEMORY[0x263F1C550] blackColor];
    v31 = [v30 colorWithAlphaComponent:0.75];
    [(UILabel *)v29 setShadowColor:v31];

    -[UILabel setShadowOffset:](self->_labelView, "setShadowOffset:", 1.0, 1.0);
    [(UILabel *)self->_labelView setText:self->_title];
    [(UILabel *)self->_labelView setFont:v21];
    [(UILabel *)self->_labelView setUserInteractionEnabled:0];
    [(UIView *)self->_accessibilityInfoPanelView addSubview:self->_labelView];
    [(AccessibilityInfoPanel *)self _layoutSubviews];

    accessibilityInfoPanelView = self->_accessibilityInfoPanelView;
  }

  return accessibilityInfoPanelView;
}

- (id)_rootView
{
  rootView = self->_rootView;
  if (!rootView)
  {
    double v4 = [(AccessibilityInfoPanel *)self _accessibilityInfoPanelWindow];
    id v5 = objc_alloc(MEMORY[0x263F1CB60]);
    [v4 bounds];
    double v6 = (UIView *)objc_msgSend(v5, "initWithFrame:");
    double v7 = self->_rootView;
    self->_rootView = v6;

    [(UIView *)self->_rootView setAccessibilityElementsHidden:1];
    rootView = self->_rootView;
  }

  return rootView;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_labelView, 0);
  objc_storeStrong((id *)&self->_rootView, 0);
  objc_storeStrong((id *)&self->_accessibilityInfoPanelView, 0);
  objc_storeStrong((id *)&self->_accessibilityInfoPanelWindow, 0);

  objc_storeStrong((id *)&self->_accessibilityInfoPanelController, 0);
}

@end