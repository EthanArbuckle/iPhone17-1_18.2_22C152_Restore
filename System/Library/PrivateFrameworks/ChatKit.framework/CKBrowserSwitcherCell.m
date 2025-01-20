@interface CKBrowserSwitcherCell
- (BOOL)isUsingFallbackSnapshot;
- (CKBrowserSwitcherCell)initWithFrame:(CGRect)a3;
- (CKSnapshotCacheKey)snapshotCacheKey;
- (IMBalloonPlugin)plugin;
- (UIView)browserSnapshotView;
- (UIView)extensionInterruptedView;
- (id)balloonPluginManager;
- (void)_handleBrowserSnapshotDidChange:(id)a3;
- (void)_updateSnapshotView;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setBrowserSnapshotView:(id)a3;
- (void)setExtensionInterruptedView:(id)a3;
- (void)setPlugin:(id)a3;
- (void)setPlugin:(id)a3 withSnapshotCacheKey:(id)a4;
- (void)setSnapshotCacheKey:(id)a3;
- (void)setUsingFallbackSnapshot:(BOOL)a3;
- (void)showExtensionInterruptedViewWithDisplayName:(id)a3;
@end

@implementation CKBrowserSwitcherCell

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CKBrowserSwitcherCell;
  [(CKBrowserSwitcherCell *)&v4 dealloc];
}

- (CKBrowserSwitcherCell)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CKBrowserSwitcherCell;
  v3 = -[CKBrowserSwitcherCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_super v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel__handleBrowserSnapshotDidChange_ name:@"CKBalloonPluginManagerSnapshotsDidChange" object:0];

    v5 = +[CKUIBehavior sharedBehaviors];
    v6 = [v5 theme];
    v7 = [v6 browserBackgroundColor];
    [(CKBrowserSwitcherCell *)v3 setBackgroundColor:v7];
  }
  return v3;
}

- (void)setPlugin:(id)a3 withSnapshotCacheKey:(id)a4
{
  id v6 = a4;
  [(CKBrowserSwitcherCell *)self setPlugin:a3];
  [(CKBrowserSwitcherCell *)self setSnapshotCacheKey:v6];
}

- (void)setSnapshotCacheKey:(id)a3
{
  v5 = (CKSnapshotCacheKey *)a3;
  snapshotCacheKey = self->_snapshotCacheKey;
  if (snapshotCacheKey != v5)
  {
    v8 = v5;
    BOOL v7 = [(CKSnapshotCacheKey *)snapshotCacheKey isEqual:v5];
    v5 = v8;
    if (!v7)
    {
      objc_storeStrong((id *)&self->_snapshotCacheKey, a3);
      v5 = v8;
      if (self->_snapshotCacheKey)
      {
        [(CKBrowserSwitcherCell *)self _updateSnapshotView];
        v5 = v8;
      }
    }
  }
}

- (void)setBrowserSnapshotView:(id)a3
{
  v5 = (UIView *)a3;
  p_browserSnapshotView = &self->_browserSnapshotView;
  browserSnapshotView = self->_browserSnapshotView;
  if (browserSnapshotView != v5)
  {
    objc_super v9 = v5;
    v8 = [(UIView *)browserSnapshotView superview];

    if (v8 == self) {
      [(UIView *)*p_browserSnapshotView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_browserSnapshotView, a3);
    [(CKBrowserSwitcherCell *)self addSubview:*p_browserSnapshotView];
    [(CKBrowserSwitcherCell *)self setNeedsLayout];
    [(CKBrowserSwitcherCell *)self layoutIfNeeded];
    v5 = v9;
  }
}

- (void)showExtensionInterruptedViewWithDisplayName:(id)a3
{
  id v4 = a3;
  v5 = [(CKBrowserSwitcherCell *)self extensionInterruptedView];

  if (v5)
  {
    id v6 = [(CKBrowserSwitcherCell *)self extensionInterruptedView];
    [v6 removeFromSuperview];
  }
  BOOL v7 = [(CKBrowserSwitcherCell *)self browserSnapshotView];

  if (v7)
  {
    v8 = [(CKBrowserSwitcherCell *)self browserSnapshotView];
    [v8 removeFromSuperview];

    [(CKBrowserSwitcherCell *)self setBrowserSnapshotView:0];
  }
  [(CKBrowserSwitcherCell *)self bounds];
  double v10 = v9 + -50.0;
  v11 = +[CKUIBehavior sharedBehaviors];
  [v11 chatChromeBottomInset];
  double v13 = (v10 - v12) * 0.5;

  id v14 = objc_alloc(MEMORY[0x1E4F42B38]);
  [(CKBrowserSwitcherCell *)self bounds];
  id v25 = (id)objc_msgSend(v14, "initWithFrame:", 0.0, v13);
  v15 = NSString;
  v16 = CKFrameworkBundle();
  v17 = [v16 localizedStringForKey:@"MESSAGES_EXTENSION_CRASHED_SWITCHER" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v18 = objc_msgSend(v15, "stringWithFormat:", v17, v4);

  v19 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v20 = [v19 userInterfaceLayoutDirection];

  if (v20 == 1) {
    v21 = @"\u200F";
  }
  else {
    v21 = @"\u200E";
  }
  v22 = [(__CFString *)v21 stringByAppendingString:v18];

  [v25 setText:v22];
  [v25 setTextAlignment:1];
  id v23 = objc_alloc(MEMORY[0x1E4F42FF0]);
  [(CKBrowserSwitcherCell *)self bounds];
  v24 = objc_msgSend(v23, "initWithFrame:");
  [v24 addSubview:v25];
  [(CKBrowserSwitcherCell *)self setExtensionInterruptedView:v24];
  [(CKBrowserSwitcherCell *)self addSubview:v24];
  [(CKBrowserSwitcherCell *)self setNeedsLayout];
  [(CKBrowserSwitcherCell *)self layoutIfNeeded];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)CKBrowserSwitcherCell;
  [(CKBrowserSwitcherCell *)&v4 layoutSubviews];
  v3 = [(CKBrowserSwitcherCell *)self browserSnapshotView];
  [(CKBrowserSwitcherCell *)self bounds];
  objc_msgSend(v3, "setFrame:");
}

- (id)balloonPluginManager
{
  return +[CKBalloonPluginManager sharedInstance];
}

- (void)_updateSnapshotView
{
  v3 = [(CKBrowserSwitcherCell *)self balloonPluginManager];
  objc_super v4 = [(CKBrowserSwitcherCell *)self snapshotCacheKey];
  v5 = [v3 browserSnapshotForKey:v4];

  [(CKBrowserSwitcherCell *)self setUsingFallbackSnapshot:v5 == 0];
  if ([(CKBrowserSwitcherCell *)self isUsingFallbackSnapshot])
  {
    id v6 = [(CKBrowserSwitcherCell *)self plugin];
    BOOL v7 = [(CKBrowserSwitcherCell *)self traitCollection];
    v8 = objc_msgSend(v6, "__ck_browserImageForInterfaceStyle:", objc_msgSend(v7, "userInterfaceStyle"));

    double v9 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v8];
    id v10 = objc_alloc(MEMORY[0x1E4F42FF0]);
    double v11 = *MEMORY[0x1E4F1DAD8];
    double v12 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [(CKBrowserSwitcherCell *)self bounds];
    id v28 = (id)objc_msgSend(v10, "initWithFrame:", v11, v12);

    [v28 addSubview:v9];
    double v13 = +[CKUIBehavior sharedBehaviors];
    [v13 appIconSize];
    double v15 = v14;
    double v17 = v16;
    [(CKBrowserSwitcherCell *)self bounds];
    double v19 = v18;
    [(CKBrowserSwitcherCell *)self bounds];
    double v21 = floor((v20 - v17) * 0.5) + 0.0;

    v22 = +[CKUIBehavior sharedBehaviors];
    [v22 chatChromeBottomInset];
    double v24 = v21 - v23 * 0.5;

    objc_msgSend(v9, "setFrame:", floor((v19 - v15) * 0.5) + 0.0, v24, v15, v17);
    if (_IMWillLog())
    {
      v27 = [(CKBrowserSwitcherCell *)self plugin];
      id v26 = v28;
      _IMAlwaysLog();
    }
    id v25 = v28;
  }
  else
  {
    id v25 = v5;
  }
  id v29 = v25;
  -[CKBrowserSwitcherCell setBrowserSnapshotView:](self, "setBrowserSnapshotView:", v25, v26, v27);
}

- (void)_handleBrowserSnapshotDidChange:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__CKBrowserSwitcherCell__handleBrowserSnapshotDidChange___block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __57__CKBrowserSwitcherCell__handleBrowserSnapshotDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSnapshotView];
}

- (IMBalloonPlugin)plugin
{
  return self->_plugin;
}

- (void)setPlugin:(id)a3
{
}

- (BOOL)isUsingFallbackSnapshot
{
  return self->_usingFallbackSnapshot;
}

- (void)setUsingFallbackSnapshot:(BOOL)a3
{
  self->_usingFallbackSnapshot = a3;
}

- (UIView)browserSnapshotView
{
  return self->_browserSnapshotView;
}

- (UIView)extensionInterruptedView
{
  return self->_extensionInterruptedView;
}

- (void)setExtensionInterruptedView:(id)a3
{
}

- (CKSnapshotCacheKey)snapshotCacheKey
{
  return self->_snapshotCacheKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotCacheKey, 0);
  objc_storeStrong((id *)&self->_extensionInterruptedView, 0);
  objc_storeStrong((id *)&self->_browserSnapshotView, 0);

  objc_storeStrong((id *)&self->_plugin, 0);
}

@end