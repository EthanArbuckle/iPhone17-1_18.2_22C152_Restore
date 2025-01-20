@interface BKUIIndicatorViewController
- (BKUIIndicatorViewController)init;
- (BOOL)prefersStatusBarHidden;
- (BOOL)shouldShow;
- (LAUIPhysicalButtonView)physicalButtonView;
- (void)_updateUI;
- (void)setPhysicalButtonView:(id)a3;
- (void)setShouldShow:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BKUIIndicatorViewController

- (BKUIIndicatorViewController)init
{
  v10.receiver = self;
  v10.super_class = (Class)BKUIIndicatorViewController;
  v2 = [(BKUIIndicatorViewController *)&v10 initWithNibName:0 bundle:0];
  if (v2)
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2050000000;
    v3 = (void *)getLAUIPhysicalButtonViewClass_softClass;
    uint64_t v15 = getLAUIPhysicalButtonViewClass_softClass;
    if (!getLAUIPhysicalButtonViewClass_softClass)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __getLAUIPhysicalButtonViewClass_block_invoke;
      v11[3] = &unk_1E6EA23D0;
      v11[4] = &v12;
      __getLAUIPhysicalButtonViewClass_block_invoke((uint64_t)v11);
      v3 = (void *)v13[3];
    }
    v4 = v3;
    _Block_object_dispose(&v12, 8);
    uint64_t v5 = [[v4 alloc] initWithStyle:1];
    physicalButtonView = v2->_physicalButtonView;
    v2->_physicalButtonView = (LAUIPhysicalButtonView *)v5;

    v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"SET_UP_MESA" value:&stru_1F4081468 table:@"BiometricKitUI"];
    [(LAUIPhysicalButtonView *)v2->_physicalButtonView setInstruction:v8];

    [(LAUIPhysicalButtonView *)v2->_physicalButtonView setAnimationStyle:2];
    v2->_shouldShow = 1;
  }
  return v2;
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)BKUIIndicatorViewController;
  [(BKUIIndicatorViewController *)&v2 viewDidLoad];
}

- (void)viewDidAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)BKUIIndicatorViewController;
  [(BKUIIndicatorViewController *)&v10 viewDidAppear:a3];
  v4 = [(BKUIIndicatorViewController *)self view];
  uint64_t v5 = [MEMORY[0x1E4F428B8] clearColor];
  [v4 setBackgroundColor:v5];

  v6 = [(BKUIIndicatorViewController *)self view];
  v7 = [v6 window];
  v8 = [(BKUIIndicatorViewController *)self physicalButtonView];
  [v7 addSubview:v8];

  v9 = [(BKUIIndicatorViewController *)self physicalButtonView];
  [v9 setAnimating:1];
}

- (void)viewDidLayoutSubviews
{
  v3 = [(BKUIIndicatorViewController *)self physicalButtonView];

  if (v3)
  {
    v4 = [(BKUIIndicatorViewController *)self physicalButtonView];
    [v4 updateFrame];

    uint64_t v5 = [(BKUIIndicatorViewController *)self physicalButtonView];
    [v5 layoutIfNeeded];
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__BKUIIndicatorViewController_viewDidLayoutSubviews__block_invoke;
  v6[3] = &unk_1E6EA20C0;
  v6[4] = self;
  [MEMORY[0x1E4F42FF0] performWithoutAnimation:v6];
}

void __52__BKUIIndicatorViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  objc_super v2 = [*(id *)(a1 + 32) physicalButtonView];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) physicalButtonView];
    objc_msgSend(v3, "setAnimating:", objc_msgSend(*(id *)(a1 + 32), "shouldShow"));
  }
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)_updateUI
{
  id v3 = [(BKUIIndicatorViewController *)self physicalButtonView];
  [v3 setAnimating:0];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__BKUIIndicatorViewController__updateUI__block_invoke;
  block[3] = &unk_1E6EA20C0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __40__BKUIIndicatorViewController__updateUI__block_invoke(uint64_t a1)
{
  objc_super v2 = [*(id *)(a1 + 32) physicalButtonView];
  [v2 updateFrame];

  uint64_t v3 = [*(id *)(a1 + 32) shouldShow];
  id v4 = [*(id *)(a1 + 32) physicalButtonView];
  [v4 setAnimating:v3];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)BKUIIndicatorViewController;
  id v7 = a4;
  -[BKUIIndicatorViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82__BKUIIndicatorViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E6EA2770;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

void __82__BKUIIndicatorViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateUI];
  id v2 = [*(id *)(a1 + 32) view];
  [v2 layoutIfNeeded];
}

- (void)setShouldShow:(BOOL)a3
{
  self->_shouldShow = a3;
  [(BKUIIndicatorViewController *)self _updateUI];
  id v4 = [(BKUIIndicatorViewController *)self view];
  [v4 layoutIfNeeded];
}

- (LAUIPhysicalButtonView)physicalButtonView
{
  return self->_physicalButtonView;
}

- (void)setPhysicalButtonView:(id)a3
{
}

- (BOOL)shouldShow
{
  return self->_shouldShow;
}

- (void).cxx_destruct
{
}

@end