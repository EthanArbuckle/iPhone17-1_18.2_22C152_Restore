@interface CKActionMenuWindow
+ (id)sharedInstance;
- (BOOL)_canAffectStatusBarAppearance;
- (BOOL)_shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (BOOL)shouldDismissOnTap;
- (CKActionMenuView)actionMenuView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)actionMenuGestureRecognized:(id)a3;
- (void)dismissActionMenuViewAnimated:(BOOL)a3;
- (void)presentActionMenuView:(id)a3 fromPoint:(CGPoint)a4 inView:(id)a5 animated:(BOOL)a6;
- (void)setActionMenuView:(id)a3;
- (void)setShouldDismissOnTap:(BOOL)a3;
@end

@implementation CKActionMenuWindow

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CKActionMenuWindow;
  -[UIAutoRotatingWindow hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (CKActionMenuWindow *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self) {
    v5 = 0;
  }
  v7 = v5;

  return v7;
}

- (BOOL)_shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  if ([(CKActionMenuWindow *)self isHidden]) {
    return 1;
  }
  v5 = [(CKActionMenuWindow *)self rootViewController];
  v6 = [v5 view];
  char v7 = [v6 isHidden];

  return v7;
}

+ (id)sharedInstance
{
  if (sharedInstance_once_2 != -1) {
    dispatch_once(&sharedInstance_once_2, &__block_literal_global_159);
  }
  v2 = (void *)sharedInstance_sSharedInstance_1;

  return v2;
}

void __36__CKActionMenuWindow_sharedInstance__block_invoke()
{
  v0 = [CKActionMenuWindow alloc];
  v1 = [MEMORY[0x1E4F42D90] mainScreen];
  [v1 bounds];
  uint64_t v2 = -[CKActionMenuWindow initWithFrame:](v0, "initWithFrame:");
  v3 = (void *)sharedInstance_sSharedInstance_1;
  sharedInstance_sSharedInstance_1 = v2;

  v4 = (void *)sharedInstance_sSharedInstance_1;
  id v5 = +[CKUIBehavior sharedBehaviors];
  [v5 actionMenuWindowLevel];
  objc_msgSend(v4, "setWindowLevel:");
}

- (void)presentActionMenuView:(id)a3 fromPoint:(CGPoint)a4 inView:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  double y = a4.y;
  double x = a4.x;
  id v43 = a3;
  id v11 = a5;
  v12 = [v11 window];
  [v12 frame];
  -[CKActionMenuWindow setFrame:](self, "setFrame:");

  id v13 = [(CKActionMenuWindow *)self actionMenuView];
  if (v13 != v43)
  {
    [v13 removeFromSuperview];
    [(CKActionMenuWindow *)self setActionMenuView:v43];
    [(CKActionMenuWindow *)self addSubview:v43];
    [MEMORY[0x1E4F42FF8] attemptRotationToDeviceOrientation];
  }
  [(CKActionMenuWindow *)self bounds];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  v22 = [MEMORY[0x1E4F42738] sharedApplication];
  [v22 statusBarFrame];
  double v24 = v23;

  if (CKMainScreenScale_once_61 != -1) {
    dispatch_once(&CKMainScreenScale_once_61, &__block_literal_global_64_1);
  }
  double v25 = *(double *)&CKMainScreenScale_sMainScreenScale_61;
  double v26 = 1.0;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_61 == 0.0) {
    double v25 = 1.0;
  }
  double v27 = ceil(v25 * 4.0) / v25;
  double v28 = *(double *)&CKMainScreenScale_sMainScreenScale_61;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_61 == 0.0) {
    double v28 = 1.0;
  }
  double v29 = v24 + ceil(v28 * 4.0) / v28 * 0.5;
  if (v27 < v29) {
    double v27 = v29;
  }
  double v30 = *(double *)&CKMainScreenScale_sMainScreenScale_61;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_61 == 0.0) {
    double v30 = 1.0;
  }
  double v31 = ceil(v30 * 4.0) / v30;
  double v32 = *(double *)&CKMainScreenScale_sMainScreenScale_61;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_61 == 0.0) {
    double v32 = 1.0;
  }
  double v33 = ceil(v32 * 4.0) / v32;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_61 != 0.0) {
    double v26 = *(double *)&CKMainScreenScale_sMainScreenScale_61;
  }
  double v34 = v15 + v31;
  double v35 = v17 + v27;
  double v36 = v19 - (v31 + ceil(v26 * 4.0) / v26);
  double v37 = v21 - (v27 + v33);
  -[CKActionMenuWindow convertPoint:fromView:](self, "convertPoint:fromView:", v11, x, y);
  double v39 = v38;
  double v41 = v40;

  objc_msgSend(v43, "presentActionMenuViewFromPoint:inRect:animated:completion:", v6, 0, v39, v41, v34, v35, v36, v37);
  [(CKActionMenuWindow *)self setHidden:0];
  v42 = [(CKActionMenuWindow *)self actionMenuView];
  [(CKActionMenuWindow *)self bringSubviewToFront:v42];
}

- (void)dismissActionMenuViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CKActionMenuWindow *)self actionMenuView];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__CKActionMenuWindow_dismissActionMenuViewAnimated___block_invoke;
  v7[3] = &unk_1E5621EA8;
  id v8 = v5;
  objc_super v9 = self;
  id v6 = v5;
  [v6 dismissActionMenuViewAnimated:v3 completion:v7];
}

void __52__CKActionMenuWindow_dismissActionMenuViewAnimated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  uint64_t v2 = [*(id *)(a1 + 40) actionMenuView];
  BOOL v3 = *(void **)(a1 + 32);

  if (v2 == v3)
  {
    [*(id *)(a1 + 40) setActionMenuView:0];
    v4 = *(void **)(a1 + 40);
    [v4 setHidden:1];
  }
}

- (void)actionMenuGestureRecognized:(id)a3
{
  id v4 = a3;
  id v5 = [(CKActionMenuWindow *)self actionMenuView];
  [v5 actionMenuGestureRecognized:v4];
}

- (BOOL)_canAffectStatusBarAppearance
{
  return 0;
}

- (CKActionMenuView)actionMenuView
{
  return *(CKActionMenuView **)&self->_shouldDismissOnTap;
}

- (void)setActionMenuView:(id)a3
{
}

- (BOOL)shouldDismissOnTap
{
  return *(&self->super._unknownOrientation + 1);
}

- (void)setShouldDismissOnTap:(BOOL)a3
{
  *(&self->super._unknownOrientation + 1) = a3;
}

- (void).cxx_destruct
{
}

@end