@interface CKComposeNavbarManager
- (CKComposeNavbarCanvasViewController)defaultNavbarCanvasViewController;
- (CKComposeNavbarManagerContentView)composeContentView;
- (CKComposeNavbarManagerDelegate)delegate;
- (CKNavbarCanvasViewController)avatarNavbarCanvasViewController;
- (UIButton)cancelButton;
- (UIView)customStatusBackgroundView;
- (id)initForBusinessChat:(BOOL)a3;
- (void)_setupAvatarNavBarViewControllerWithConversation:(id)a3 shouldShowBackButtonView:(BOOL)a4;
- (void)_setupDefaultNavbarCanvasViewControllerForBusinessChat:(BOOL)a3;
- (void)commitTransitionAnimationWithConversation:(id)a3 shouldShowBackButtonView:(BOOL)a4;
- (void)dealloc;
- (void)setAvatarNavbarCanvasViewController:(id)a3;
- (void)setCanvasViewControllerDelegate:(id)a3;
- (void)setComposeContentView:(id)a3;
- (void)setDefaultNavbarCanvasViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateContentsForConversation:(id)a3;
- (void)updateTitle:(id)a3 animated:(BOOL)a4;
@end

@implementation CKComposeNavbarManager

- (id)initForBusinessChat:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKComposeNavbarManager;
  v4 = [(CKComposeNavbarManager *)&v9 init];
  if (v4)
  {
    v5 = objc_alloc_init(CKComposeNavbarManagerContentView);
    [(CKComposeNavbarManagerContentView *)v5 setAutoresizingMask:18];
    [(CKComposeNavbarManager *)v4 setComposeContentView:v5];
    [(CKComposeNavbarManager *)v4 _setupDefaultNavbarCanvasViewControllerForBusinessChat:v3];
    v6 = [(CKComposeNavbarManager *)v4 defaultNavbarCanvasViewController];
    v7 = [v6 view];

    [v7 setEnforceLeftItemViewsAlignmentToCenter:1];
    [(CKComposeNavbarManagerContentView *)v5 setCanvasView:v7];
    [(CKComposeNavbarManagerContentView *)v5 addSubview:v7];
  }
  return v4;
}

- (void)dealloc
{
  BOOL v3 = [(CKComposeNavbarManager *)self customStatusBackgroundView];
  [v3 removeFromSuperview];

  v4.receiver = self;
  v4.super_class = (Class)CKComposeNavbarManager;
  [(CKComposeNavbarManager *)&v4 dealloc];
}

- (void)updateContentsForConversation:(id)a3
{
  id v4 = a3;
  id v5 = [(CKComposeNavbarManager *)self defaultNavbarCanvasViewController];
  [v5 updateContentsForConversation:v4];
}

- (void)updateTitle:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(CKComposeNavbarManager *)self defaultNavbarCanvasViewController];
  [v7 updateTitle:v6 animated:v4];
}

- (UIButton)cancelButton
{
  v2 = [(CKComposeNavbarManager *)self defaultNavbarCanvasViewController];
  BOOL v3 = [v2 cancelButton];

  return (UIButton *)v3;
}

- (void)setCanvasViewControllerDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(CKComposeNavbarManager *)self defaultNavbarCanvasViewController];
  [v5 setDelegate:v4];
}

- (void)_setupDefaultNavbarCanvasViewControllerForBusinessChat:(BOOL)a3
{
  id v4 = off_1E561D5C0;
  if (!a3) {
    id v4 = off_1E561D5C8;
  }
  id v5 = objc_alloc_init(*v4);
  [(CKComposeNavbarManager *)self setDefaultNavbarCanvasViewController:v5];
}

- (void)_setupAvatarNavBarViewControllerWithConversation:(id)a3 shouldShowBackButtonView:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [[CKNavbarCanvasViewController alloc] initWithConversation:v6 navigationController:0];

  [(CKNavbarCanvasViewController *)v7 setCanShowBackButtonView:v4];
  [(CKComposeNavbarManager *)self setAvatarNavbarCanvasViewController:v7];
}

- (void)commitTransitionAnimationWithConversation:(id)a3 shouldShowBackButtonView:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(CKComposeNavbarManager *)self _setupAvatarNavBarViewControllerWithConversation:v6 shouldShowBackButtonView:v4];
  id v7 = [(CKComposeNavbarManager *)self avatarNavbarCanvasViewController];
  v8 = [(CKComposeNavbarManager *)self defaultNavbarCanvasViewController];
  objc_super v9 = [v8 delegate];
  [v7 setDelegate:v9];

  v10 = [(CKComposeNavbarManager *)self defaultNavbarCanvasViewController];
  v11 = [v10 view];

  v12 = [(CKComposeNavbarManager *)self avatarNavbarCanvasViewController];
  v13 = [v12 view];

  v14 = [(CKComposeNavbarManager *)self composeContentView];
  [v14 setCanvasView:v13];

  if ([v6 isBusinessConversation])
  {
    v15 = +[CKUIBehavior sharedBehaviors];
    v16 = [v15 theme];
    v17 = [v6 chat];
    v18 = [v16 primaryBrandColorForBusinessChat:v17];
    [v13 setBackgroundColor:v18];

    [v13 setAlpha:1.0];
    v19 = +[CKUIBehavior sharedBehaviors];
    v20 = [v19 theme];
    v21 = [v6 chat];
    v22 = [v20 secondaryBrandColorForBusinessChat:v21];
    [v13 setTintColor:v22];

    v23 = [(CKComposeNavbarManager *)self avatarNavbarCanvasViewController];
    v24 = [v23 conversationIdentityView];
    v25 = +[CKUIBehavior sharedBehaviors];
    v26 = [v25 theme];
    [v6 chat];
    v27 = v70 = v11;
    objc_msgSend(v24, "setStyle:", objc_msgSend(v26, "navBarTextStyleForBusinessChat:", v27));

    id v28 = objc_alloc(MEMORY[0x1E4F42FF0]);
    v29 = [MEMORY[0x1E4F42738] sharedApplication];
    v30 = [v29 keyWindow];
    [v30 frame];
    double v32 = v31;
    v33 = [(CKComposeNavbarManager *)self contentView];
    [v33 frame];
    double v35 = v32 - v34;
    v36 = [(CKComposeNavbarManager *)self contentView];
    [v36 frame];
    double v38 = v37;
    v39 = [MEMORY[0x1E4F42738] sharedApplication];
    [v39 statusBarFrame];
    v40 = (UIView *)objc_msgSend(v28, "initWithFrame:", v35, 0.0, v38);
    customStatusBackgroundView = self->_customStatusBackgroundView;
    self->_customStatusBackgroundView = v40;

    v42 = v40;
    v43 = +[CKUIBehavior sharedBehaviors];
    v44 = [v43 theme];
    v45 = [v6 chat];
    v46 = [v44 primaryBrandColorForBusinessChat:v45];
    [(UIView *)v42 setBackgroundColor:v46];

    v11 = v70;
    [(UIView *)v42 setAlpha:0.0];
    [(UIView *)v42 setAccessibilityIgnoresInvertColors:1];
    v47 = [MEMORY[0x1E4F42738] sharedApplication];
    v48 = [v47 keyWindow];
    [v48 addSubview:v42];

    v49 = [(CKComposeNavbarManager *)self avatarNavbarCanvasViewController];
    [v49 updateTitle:&stru_1EDE4CA38 animated:0];

    v50 = [(CKComposeNavbarManager *)self defaultNavbarCanvasViewController];
    [v50 updateTitle:&stru_1EDE4CA38 animated:0];
  }
  else
  {
    v42 = 0;
  }
  v51 = [(CKComposeNavbarManager *)self contentView];
  [v51 insertSubview:v13 belowSubview:v11];

  v52 = [(CKComposeNavbarManager *)self contentView];
  [v52 bounds];
  objc_msgSend(v13, "setFrame:");

  v53 = +[CKUIBehavior sharedBehaviors];
  [v53 sendAnimationDuration];
  double v55 = v54 * 0.5;

  if ([v6 isBusinessConversation])
  {
    v56 = [v13 leftItemView];
    [v56 setAlpha:0.0];

    v57 = [v13 rightItemView];
    [v57 setAlpha:0.0];

    [v13 setAlpha:0.0];
    v58 = (void *)MEMORY[0x1E4F42FF0];
    v80[0] = MEMORY[0x1E4F143A8];
    v80[1] = 3221225472;
    v80[2] = __93__CKComposeNavbarManager_commitTransitionAnimationWithConversation_shouldShowBackButtonView___block_invoke;
    v80[3] = &unk_1E5620AA8;
    v59 = (id *)&v81;
    v81 = v42;
    v60 = v82;
    v82[0] = v11;
    v82[1] = self;
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __93__CKComposeNavbarManager_commitTransitionAnimationWithConversation_shouldShowBackButtonView___block_invoke_2;
    v77[3] = &unk_1E5623A38;
    v61 = &v78;
    v62 = (id *)v79;
    id v78 = v82[0];
    v79[0] = v13;
    *(double *)&v79[1] = v55;
    id v63 = v13;
    v64 = v42;
    v65 = v80;
    v66 = v77;
  }
  else
  {
    [v13 setAlpha:0.0];
    v58 = (void *)MEMORY[0x1E4F42FF0];
    v74[0] = MEMORY[0x1E4F143A8];
    v74[1] = 3221225472;
    v74[2] = __93__CKComposeNavbarManager_commitTransitionAnimationWithConversation_shouldShowBackButtonView___block_invoke_4;
    v74[3] = &unk_1E5620AA8;
    v59 = (id *)&v75;
    v75 = v42;
    v60 = v76;
    v76[0] = v11;
    v76[1] = self;
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __93__CKComposeNavbarManager_commitTransitionAnimationWithConversation_shouldShowBackButtonView___block_invoke_5;
    v71[3] = &unk_1E5623A38;
    v61 = &v72;
    id v67 = v76[0];
    *(double *)&v73[1] = v55;
    v62 = (id *)v73;
    id v72 = v67;
    v73[0] = v13;
    id v68 = v13;
    v69 = v42;
    v65 = v74;
    v66 = v71;
  }
  [v58 animateWithDuration:v65 animations:v66 completion:v55];
}

void __93__CKComposeNavbarManager_commitTransitionAnimationWithConversation_shouldShowBackButtonView___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2) {
    [v2 setAlpha:1.0];
  }
  BOOL v3 = [*(id *)(a1 + 40) leftItemView];
  [v3 setAlpha:0.0];

  BOOL v4 = [*(id *)(a1 + 40) rightItemView];
  [v4 setAlpha:0.0];

  id v5 = [*(id *)(a1 + 48) delegate];
  [v5 navbarManagerIsAnimatingNavbarTransition:*(void *)(a1 + 48)];
}

void __93__CKComposeNavbarManager_commitTransitionAnimationWithConversation_shouldShowBackButtonView___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  [*(id *)(a1 + 40) setAlpha:1.0];
  v2 = (void *)MEMORY[0x1E4F42FF0];
  double v3 = *(double *)(a1 + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __93__CKComposeNavbarManager_commitTransitionAnimationWithConversation_shouldShowBackButtonView___block_invoke_3;
  v4[3] = &unk_1E5620C40;
  id v5 = *(id *)(a1 + 40);
  [v2 animateWithDuration:v4 animations:v3];
}

void __93__CKComposeNavbarManager_commitTransitionAnimationWithConversation_shouldShowBackButtonView___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) leftItemView];
  [v2 setAlpha:1.0];

  id v3 = [*(id *)(a1 + 32) rightItemView];
  [v3 setAlpha:1.0];
}

void __93__CKComposeNavbarManager_commitTransitionAnimationWithConversation_shouldShowBackButtonView___block_invoke_4(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2) {
    [v2 setAlpha:1.0];
  }
  [*(id *)(a1 + 40) setAlpha:0.0];
  id v3 = [*(id *)(a1 + 48) delegate];
  [v3 navbarManagerIsAnimatingNavbarTransition:*(void *)(a1 + 48)];
}

void __93__CKComposeNavbarManager_commitTransitionAnimationWithConversation_shouldShowBackButtonView___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  v2 = (void *)MEMORY[0x1E4F42FF0];
  double v3 = *(double *)(a1 + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __93__CKComposeNavbarManager_commitTransitionAnimationWithConversation_shouldShowBackButtonView___block_invoke_6;
  v4[3] = &unk_1E5620C40;
  id v5 = *(id *)(a1 + 40);
  [v2 animateWithDuration:v4 animations:v3];
}

uint64_t __93__CKComposeNavbarManager_commitTransitionAnimationWithConversation_shouldShowBackButtonView___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (CKComposeNavbarManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKComposeNavbarManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)customStatusBackgroundView
{
  return self->_customStatusBackgroundView;
}

- (CKComposeNavbarManagerContentView)composeContentView
{
  return self->_composeContentView;
}

- (void)setComposeContentView:(id)a3
{
}

- (CKComposeNavbarCanvasViewController)defaultNavbarCanvasViewController
{
  return self->_defaultNavbarCanvasViewController;
}

- (void)setDefaultNavbarCanvasViewController:(id)a3
{
}

- (CKNavbarCanvasViewController)avatarNavbarCanvasViewController
{
  return self->_avatarNavbarCanvasViewController;
}

- (void)setAvatarNavbarCanvasViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarNavbarCanvasViewController, 0);
  objc_storeStrong((id *)&self->_defaultNavbarCanvasViewController, 0);
  objc_storeStrong((id *)&self->_composeContentView, 0);
  objc_storeStrong((id *)&self->_customStatusBackgroundView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end