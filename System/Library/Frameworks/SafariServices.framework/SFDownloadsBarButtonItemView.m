@interface SFDownloadsBarButtonItemView
+ (id)buttonWithBarButtonItem:(id)a3;
- ($7D89C83CBEDB7BFACB170B738E295FE2)deferrableUpdateViewState;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)_barButtonHitRect;
- (CGRect)_selectedIndicatorBounds;
- (CGSize)intrinsicContentSize;
- (SFDownloadsBarButtonItemView)initWithFrame:(CGRect)a3;
- (UIBarButtonItem)barButtonItem;
- (double)progress;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (void)_buttonPressed;
- (void)_installSubviews;
- (void)_updateIcon;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
- (void)pulse;
- (void)setBarButtonItem:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setProgress:(double)a3;
- (void)updateContents;
@end

@implementation SFDownloadsBarButtonItemView

+ (id)buttonWithBarButtonItem:(id)a3
{
  id v4 = a3;
  v5 = [a1 buttonWithType:1];
  [v5 setBarButtonItem:v4];

  return v5;
}

- (SFDownloadsBarButtonItemView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SFDownloadsBarButtonItemView;
  v3 = -[SFDownloadsBarButtonItemView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4FB1E20], "safari_traitsAffectingTextAppearance");
    id v5 = (id)[(SFDownloadsBarButtonItemView *)v3 registerForTraitChanges:v4 withTarget:v3 action:sel__updateIcon];

    v6 = v3;
  }

  return v3;
}

- (void)_installSubviews
{
  [(SFDownloadsBarButtonItemView *)self setTranslatesAutoresizingMaskIntoConstraints:0];
  [(SFDownloadsBarButtonItemView *)self setPointerStyleProvider:&__block_literal_global_33];
  [(SFDownloadsBarButtonItemView *)self addTarget:self action:sel__buttonPressed forControlEvents:64];
  id v12 = [(SFDownloadsBarButtonItemView *)self imageView];
  [v12 setClipsToBounds:0];
  v3 = [_SFDownloadsIconView alloc];
  id v4 = -[_SFDownloadsIconView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  iconView = self->_iconView;
  self->_iconView = v4;

  [v12 addSubview:self->_iconView];
  [(SFDownloadsBarButtonItemView *)self _updateIcon];
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1818]);
  [(SFDownloadsBarButtonItemView *)self setImage:v6 forState:0];

  v7 = [(SFDownloadsBarButtonItemView *)self heightAnchor];
  objc_super v8 = [v7 constraintEqualToConstant:44.0];
  [v8 setActive:1];

  v9 = (UIProgressView *)[objc_alloc(MEMORY[0x1E4FB1B48]) initWithProgressViewStyle:0];
  progressView = self->_progressView;
  self->_progressView = v9;

  if ([(SFDownloadsBarButtonItemView *)self isEnabled]) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = 2;
  }
  [(UIProgressView *)self->_progressView setTintAdjustmentMode:v11];
  [v12 addSubview:self->_progressView];
}

id __48__SFDownloadsBarButtonItemView__installSubviews__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (void *)MEMORY[0x1E4FB1AE8];
  id v5 = (void *)MEMORY[0x1E4FB1AE0];
  id v6 = a3;
  v7 = objc_msgSend(v5, "sf_shapeForToolbarButton:", a2);
  objc_super v8 = [v4 styleWithEffect:v6 shape:v7];

  return v8;
}

- (void)_updateIcon
{
  v3 = (void *)MEMORY[0x1E4FB1830];
  uint64_t v4 = *MEMORY[0x1E4FB28C8];
  id v5 = [(SFDownloadsBarButtonItemView *)self traitCollection];
  objc_msgSend(v3, "_sf_staticConfigurationWithTextStyle:scale:compatibleWithTraitCollection:", v4, 3, v5);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = (void *)MEMORY[0x1E4FB1818];
  v7 = objc_msgSend(MEMORY[0x1E4F28B50], "sf_mobileSafariFrameworkBundle");
  objc_super v8 = [v6 imageNamed:@"DownloadsIconCircle" inBundle:v7 withConfiguration:v13];

  v9 = (void *)MEMORY[0x1E4FB1818];
  v10 = objc_msgSend(MEMORY[0x1E4F28B50], "sf_mobileSafariFrameworkBundle");
  uint64_t v11 = [v9 imageNamed:@"DownloadsIconArrow" inBundle:v10 withConfiguration:v13];

  [(_SFDownloadsIconView *)self->_iconView setCircleImage:v8];
  [(_SFDownloadsIconView *)self->_iconView setArrowImage:v11];
  [v8 size];
  [(_SFDownloadsIconView *)self->_iconView setIconScale:v12 / 24.0];
  [(SFDownloadsBarButtonItemView *)self invalidateIntrinsicContentSize];
  [(SFDownloadsBarButtonItemView *)self setNeedsLayout];
}

- (void)setBarButtonItem:(id)a3
{
  id obj = a3;
  p_barButtonItem = &self->_barButtonItem;
  id WeakRetained = objc_loadWeakRetained((id *)p_barButtonItem);

  id v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_barButtonItem, obj);
    id v6 = obj;
  }
}

- (CGRect)_selectedIndicatorBounds
{
  v2 = [(SFDownloadsBarButtonItemView *)self imageView];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)_barButtonHitRect
{
  double v3 = [(SFDownloadsBarButtonItemView *)self _sf_firstAncestorViewOfClass:objc_opt_class()];
  double v4 = [v3 items];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_barButtonItem);
  uint64_t v6 = [v4 indexOfObject:WeakRetained];

  BOOL v7 = v6 >= [v4 count];
  BOOL v8 = v6 < 1;
  int v9 = [(SFDownloadsBarButtonItemView *)self _sf_usesLeftToRightLayout];
  if (v9) {
    BOOL v10 = v8;
  }
  else {
    BOOL v10 = v7;
  }
  if (v9) {
    BOOL v11 = v7;
  }
  else {
    BOOL v11 = v8;
  }
  if (v10) {
    double v12 = 0.0;
  }
  else {
    double v12 = -17.0;
  }
  if (v11) {
    double v13 = 0.0;
  }
  else {
    double v13 = -17.0;
  }
  [(SFDownloadsBarButtonItemView *)self bounds];
  double v15 = v14;
  double v17 = v12 + v16;
  double v19 = v18 + 0.0;
  double v21 = v20 - (v12 + v13);

  double v22 = v17;
  double v23 = v19;
  double v24 = v21;
  double v25 = v15;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(SFDownloadsBarButtonItemView *)self _barButtonHitRect];
  CGFloat v10 = x;
  CGFloat v11 = y;

  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  double v5 = (void *)MEMORY[0x1E4FB1AD8];
  [(SFDownloadsBarButtonItemView *)self _barButtonHitRect];

  return (id)objc_msgSend(v5, "regionWithRect:identifier:", @"SFDownloadsBarButtonItem");
}

- (CGSize)intrinsicContentSize
{
  [(_SFDownloadsIconView *)self->_iconView intrinsicContentSize];
  double v3 = 44.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SFDownloadsBarButtonItemView;
  -[SFDownloadsBarButtonItemView setEnabled:](&v6, sel_setEnabled_);
  if (v3) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = 2;
  }
  [(UIProgressView *)self->_progressView setTintAdjustmentMode:v5];
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)SFDownloadsBarButtonItemView;
  [(SFDownloadsBarButtonItemView *)&v3 didMoveToWindow];
  if (!self->_iconView) {
    [(SFDownloadsBarButtonItemView *)self _installSubviews];
  }
  SFDeferrableUpdateViewDidMoveToWindow();
}

- (void)setProgress:(double)a3
{
  if (self->_progress != a3)
  {
    self->_progress = a3;
    [(SFDownloadsBarButtonItemView *)self updateContents];
  }
}

- (void)pulse
{
  if (SFDeferrableUpdateViewCanUpdateContents())
  {
    iconView = self->_iconView;
    [(_SFDownloadsIconView *)iconView pulse];
  }
}

- (void)_buttonPressed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_barButtonItem);
  double v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v3 = [WeakRetained action];
  double v4 = [WeakRetained target];
  [v2 sendAction:v3 to:v4 from:WeakRetained forEvent:0];
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)SFDownloadsBarButtonItemView;
  [(SFDownloadsBarButtonItemView *)&v20 layoutSubviews];
  [(_SFDownloadsIconView *)self->_iconView intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  BOOL v7 = [(SFDownloadsBarButtonItemView *)self _sf_firstAncestorViewOfClass:objc_opt_class()];
  BOOL v8 = v7;
  if (!v7) {
    BOOL v7 = self;
  }
  [v7 bounds];
  CGFloat v9 = CGRectGetHeight(v21) + -16.0 - v6;
  CGFloat v10 = [(_SFDownloadsIconView *)self->_iconView circleImage];
  [v10 baselineOffsetFromBottom];
  CGFloat v12 = v9 + v11;

  double v13 = [(SFDownloadsBarButtonItemView *)self imageView];
  objc_msgSend(v13, "setFrame:", 0.0, v12, v4, v6);

  -[_SFDownloadsIconView setFrame:](self->_iconView, "setFrame:", 0.0, 0.0, v4, v6);
  double v14 = [(_SFDownloadsIconView *)self->_iconView arrowImage];
  [v14 size];
  double v16 = v15;

  _SFRoundFloatToPixels();
  double v18 = v17;
  _SFRoundFloatToPixels();
  -[UIProgressView setFrame:](self->_progressView, "setFrame:", v18, v19, v16, 2.0);
}

- ($7D89C83CBEDB7BFACB170B738E295FE2)deferrableUpdateViewState
{
  return ($7D89C83CBEDB7BFACB170B738E295FE2 *)&self->deferrableUpdateViewState;
}

- (void)updateContents
{
  if (SFDeferrableUpdateViewShouldAttemptToUpdateContents())
  {
    double progress = self->_progress;
    float v4 = progress;
    BOOL v5 = progress == -1.0;
    double v6 = 0.0;
    if (!v5) {
      *(float *)&double v6 = v4;
    }
    [(UIProgressView *)self->_progressView setProgress:v6];
    BOOL v7 = self->_progress == -2.0;
    progressView = self->_progressView;
    [(UIProgressView *)progressView setHidden:v7];
  }
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
}

- (double)progress
{
  return self->_progress;
}

- (UIBarButtonItem)barButtonItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_barButtonItem);

  return (UIBarButtonItem *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_barButtonItem);
  objc_storeStrong((id *)&self->_iconView, 0);

  objc_storeStrong((id *)&self->_progressView, 0);
}

@end