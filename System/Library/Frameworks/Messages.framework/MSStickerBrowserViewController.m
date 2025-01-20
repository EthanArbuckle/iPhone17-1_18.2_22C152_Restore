@interface MSStickerBrowserViewController
- (BOOL)viewHasAppeared;
- (CGRect)initialFrameBeforeAppearance;
- (MSStickerBrowserView)stickerBrowserView;
- (MSStickerBrowserViewController)init;
- (MSStickerBrowserViewController)initWithCoder:(id)a3;
- (MSStickerBrowserViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (MSStickerBrowserViewController)initWithStickerSize:(MSStickerSize)stickerSize;
- (MSStickerSize)stickerSize;
- (id)stickerBrowserView:(id)a3 stickerAtIndex:(int64_t)a4;
- (int64_t)numberOfStickersInStickerBrowserView:(id)a3;
- (void)_setContentOverlayInsets:(UIEdgeInsets)a3;
- (void)didTransitionToPresentationStyle:(unint64_t)a3;
- (void)disableUserInteraction;
- (void)enableUserInteraction;
- (void)loadView;
- (void)setInitialFrameBeforeAppearance:(CGRect)a3;
- (void)setStickerBrowserView:(id)a3;
- (void)setViewHasAppeared:(BOOL)a3;
- (void)updateSnapshotWithCompletionBlock:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)willTransitionToPresentationStyle:(unint64_t)a3;
@end

@implementation MSStickerBrowserViewController

- (MSStickerBrowserViewController)init
{
  return [(MSStickerBrowserViewController *)self initWithStickerSize:1];
}

- (MSStickerBrowserViewController)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MSStickerBrowserViewController;
  result = [(MSStickerBrowserViewController *)&v4 initWithCoder:a3];
  if (result) {
    result->_stickerSize = 1;
  }
  return result;
}

- (MSStickerBrowserViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MSStickerBrowserViewController;
  result = [(MSStickerBrowserViewController *)&v5 initWithNibName:0 bundle:0];
  if (result) {
    result->_stickerSize = 1;
  }
  return result;
}

- (MSStickerBrowserViewController)initWithStickerSize:(MSStickerSize)stickerSize
{
  v6.receiver = self;
  v6.super_class = (Class)MSStickerBrowserViewController;
  result = [(MSStickerBrowserViewController *)&v6 initWithNibName:0 bundle:0];
  if (result)
  {
    CGSize v5 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    result->_initialFrameBeforeAppearance.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    result->_initialFrameBeforeAppearance.size = v5;
    result->_stickerSize = stickerSize;
  }
  return result;
}

- (void)loadView
{
  v13.receiver = self;
  v13.super_class = (Class)MSStickerBrowserViewController;
  [(MSStickerBrowserViewController *)&v13 loadView];
  [(MSStickerBrowserViewController *)self setViewHasAppeared:0];
  v3 = [MSStickerBrowserView alloc];
  MSStickerSize v4 = [(MSStickerBrowserViewController *)self stickerSize];
  CGSize v5 = -[MSStickerBrowserView initWithFrame:stickerSize:](v3, "initWithFrame:stickerSize:", v4, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(MSStickerBrowserView *)v5 setDataSource:self];
  [(MSStickerBrowserViewController *)self setStickerBrowserView:v5];
  objc_super v6 = [(MSStickerBrowserViewController *)self view];
  [v6 addSubview:v5];

  v7 = [MEMORY[0x1E4F28B50] mainBundle];
  v8 = [v7 bundleIdentifier];
  v9 = MSStickerBrowserStateRestorationInfo(v8);

  if ([v9 count])
  {
    v10 = [(MSStickerBrowserViewController *)self stickerBrowserView];
    [v10 restoreFromState:v9];
  }
  v11 = [(MSStickerBrowserViewController *)self view];
  v12 = [v11 layer];
  [v12 setHitTestsAsOpaque:1];
}

- (void)_setContentOverlayInsets:(UIEdgeInsets)a3
{
  double bottom = a3.bottom;
  double top = a3.top;
  v6.receiver = self;
  v6.super_class = (Class)MSStickerBrowserViewController;
  -[MSStickerBrowserViewController _setContentOverlayInsets:](&v6, sel__setContentOverlayInsets_, a3.top, a3.left, a3.bottom, a3.right);
  -[MSStickerBrowserViewController _setNavigationControllerContentInsetAdjustment:](self, "_setNavigationControllerContentInsetAdjustment:", top, 0.0, bottom, 0.0);
}

- (void)viewDidLayoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)MSStickerBrowserViewController;
  [(MSStickerBrowserViewController *)&v17 viewDidLayoutSubviews];
  MSStickerSize v3 = [(MSStickerBrowserViewController *)self stickerSize];
  MSStickerSize v4 = [(MSStickerBrowserViewController *)self stickerBrowserView];
  uint64_t v5 = [v4 stickerSize];

  if (v3 != v5)
  {
    objc_super v6 = [(MSStickerBrowserViewController *)self stickerBrowserView];
    [v6 reloadData];
  }
  v7 = [(MSStickerBrowserViewController *)self view];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  v16 = [(MSStickerBrowserViewController *)self stickerBrowserView];
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MSStickerBrowserViewController;
  [(MSStickerBrowserViewController *)&v4 viewWillAppear:a3];
  -[MSStickerBrowserViewController setInitialFrameBeforeAppearance:](self, "setInitialFrameBeforeAppearance:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MSStickerBrowserViewController;
  [(MSStickerBrowserViewController *)&v6 viewDidAppear:a3];
  if (![(MSStickerBrowserViewController *)self viewHasAppeared])
  {
    objc_super v4 = [(MSStickerBrowserViewController *)self extensionContext];
    [v4 _remoteViewDidBecomeReadyForDisplay];

    [(MSStickerBrowserViewController *)self setViewHasAppeared:1];
  }
  uint64_t v5 = [(MSStickerBrowserViewController *)self stickerBrowserView];
  [v5 _startAnimating];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MSStickerBrowserViewController;
  [(MSStickerBrowserViewController *)&v5 viewDidDisappear:a3];
  objc_super v4 = [(MSStickerBrowserViewController *)self stickerBrowserView];
  [v4 _stopAnimating];
}

- (void)willTransitionToPresentationStyle:(unint64_t)a3
{
  id v3 = [(MSStickerBrowserViewController *)self stickerBrowserView];
  [v3 setUserInteractionEnabled:0];
}

- (void)didTransitionToPresentationStyle:(unint64_t)a3
{
  id v3 = [(MSStickerBrowserViewController *)self stickerBrowserView];
  [v3 setUserInteractionEnabled:1];
}

- (int64_t)numberOfStickersInStickerBrowserView:(id)a3
{
  return 0;
}

- (id)stickerBrowserView:(id)a3 stickerAtIndex:(int64_t)a4
{
  return 0;
}

- (void)updateSnapshotWithCompletionBlock:(id)a3
{
  objc_super v4 = (void (**)(id, void *))a3;
  objc_super v5 = [(MSStickerBrowserViewController *)self stickerBrowserView];
  id v21 = [v5 stateRestorationInfo];

  objc_super v6 = [MEMORY[0x1E4F28B50] mainBundle];
  v7 = [v6 bundleIdentifier];
  double v8 = MSStickerBrowserStateRestorationInfoPath(v7);
  [v21 writeToFile:v8 atomically:1];

  double v9 = [(MSStickerBrowserViewController *)self stickerBrowserView];
  [v9 prepareForSnapshotting];

  double v10 = [(MSStickerBrowserViewController *)self view];
  [v10 bounds];
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  double v15 = [MEMORY[0x1E4F42D90] mainScreen];
  [v15 scale];
  CGFloat v17 = v16;
  v23.width = v12;
  v23.height = v14;
  UIGraphicsBeginImageContextWithOptions(v23, 0, v17);

  v18 = [(MSStickerBrowserViewController *)self view];
  v19 = [v18 layer];
  [v19 renderInContext:UIGraphicsGetCurrentContext()];

  v20 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  v4[2](v4, v20);
}

- (void)enableUserInteraction
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__MSStickerBrowserViewController_enableUserInteraction__block_invoke;
  block[3] = &unk_1E6E987F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __55__MSStickerBrowserViewController_enableUserInteraction__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) stickerBrowserView];
  [v1 setUserInteractionEnabled:1];
}

- (void)disableUserInteraction
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__MSStickerBrowserViewController_disableUserInteraction__block_invoke;
  block[3] = &unk_1E6E987F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __56__MSStickerBrowserViewController_disableUserInteraction__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) stickerBrowserView];
  [v1 setUserInteractionEnabled:0];
}

- (CGRect)initialFrameBeforeAppearance
{
  double x = self->_initialFrameBeforeAppearance.origin.x;
  double y = self->_initialFrameBeforeAppearance.origin.y;
  double width = self->_initialFrameBeforeAppearance.size.width;
  double height = self->_initialFrameBeforeAppearance.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setInitialFrameBeforeAppearance:(CGRect)a3
{
  self->_initialFrameBeforeAppearance = a3;
}

- (MSStickerBrowserView)stickerBrowserView
{
  return self->_stickerBrowserView;
}

- (void)setStickerBrowserView:(id)a3
{
}

- (MSStickerSize)stickerSize
{
  return self->_stickerSize;
}

- (BOOL)viewHasAppeared
{
  return self->_viewHasAppeared;
}

- (void)setViewHasAppeared:(BOOL)a3
{
  self->_viewHasAppeared = a3;
}

- (void).cxx_destruct
{
}

@end