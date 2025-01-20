@interface CKComposeNavbarCanvasViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)shouldConfigureForJunkModal;
- (BOOL)shouldShowAvatarView;
- (BOOL)shouldUseMinimumSafeAreas;
- (BOOL)splitViewControllerIsCollapsed;
- (CKNavbarCanvasViewControllerDelegate)delegate;
- (CKNavigationBarCanvasView)canvasView;
- (NSDirectionalEdgeInsets)systemMinimumLayoutMarginsForView:(id)a3;
- (UIButton)cancelButton;
- (UILabel)titleLabel;
- (double)preferredHeightOverride;
- (id)_windowTraitCollection;
- (id)locationLabel;
- (void)_setupDefaultCanvasView;
- (void)loadView;
- (void)setCancelButton:(id)a3;
- (void)setCanvasView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)updateTitle:(id)a3 animated:(BOOL)a4;
- (void)viewDidLoad;
@end

@implementation CKComposeNavbarCanvasViewController

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)CKComposeNavbarCanvasViewController;
  [(CKComposeNavbarCanvasViewController *)&v2 viewDidLoad];
}

- (void)loadView
{
  [(CKComposeNavbarCanvasViewController *)self _setupDefaultCanvasView];
  v3 = [(CKComposeNavbarCanvasViewController *)self canvasView];
  [v3 setDelegate:self];

  id v4 = [(CKComposeNavbarCanvasViewController *)self canvasView];
  [(CKComposeNavbarCanvasViewController *)self setView:v4];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)updateTitle:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(CKComposeNavbarCanvasViewController *)self titleLabel];
  v8 = [v7 text];
  char v9 = [v8 isEqualToString:v6];

  if ((v9 & 1) == 0)
  {
    v10 = [(CKComposeNavbarCanvasViewController *)self titleLabel];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__CKComposeNavbarCanvasViewController_updateTitle_animated___block_invoke;
    aBlock[3] = &unk_1E5620AA8;
    id v11 = v10;
    id v15 = v11;
    id v16 = v6;
    v17 = self;
    v12 = _Block_copy(aBlock);
    v13 = v12;
    if (v4) {
      [MEMORY[0x1E4F42FF0] transitionWithView:v11 duration:5242880 options:v12 animations:0 completion:0.35];
    }
    else {
      (*((void (**)(void *))v12 + 2))(v12);
    }
  }
}

void __60__CKComposeNavbarCanvasViewController_updateTitle_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setText:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 48) canvasView];
  [v2 setNeedsLayout];
}

- (void)_setupDefaultCanvasView
{
  v3 = [CKNavigationBarCanvasView alloc];
  id v6 = -[CKNavigationBarCanvasView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  BOOL v4 = [(CKComposeNavbarCanvasViewController *)self titleLabel];
  [(CKNavigationBarCanvasView *)v6 setTitleView:v4];

  v5 = [(CKComposeNavbarCanvasViewController *)self cancelButton];
  [(CKNavigationBarCanvasView *)v6 setRightItemView:v5];

  [(CKComposeNavbarCanvasViewController *)self setCanvasView:v6];
}

- (UILabel)titleLabel
{
  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    BOOL v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    v5 = self->_titleLabel;
    self->_titleLabel = v4;

    [(UILabel *)self->_titleLabel setTextAlignment:1];
    id v6 = self->_titleLabel;
    v7 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:17.0];
    [(UILabel *)v6 setFont:v7];

    titleLabel = self->_titleLabel;
  }

  return titleLabel;
}

- (UIButton)cancelButton
{
  cancelButton = self->_cancelButton;
  if (!cancelButton)
  {
    BOOL v4 = [MEMORY[0x1E4F427E0] buttonWithType:1];
    v5 = self->_cancelButton;
    self->_cancelButton = v4;

    id v6 = [(UIButton *)self->_cancelButton titleLabel];
    v7 = [MEMORY[0x1E4FB08E0] defaultFontForTextStyle:*MEMORY[0x1E4F43870]];
    [v6 setFont:v7];

    v8 = self->_cancelButton;
    char v9 = CKFrameworkBundle();
    v10 = [v9 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [(UIButton *)v8 setTitle:v10 forState:0];

    cancelButton = self->_cancelButton;
  }

  return cancelButton;
}

- (id)_windowTraitCollection
{
  id v2 = [MEMORY[0x1E4F43058] keyWindow];
  v3 = [v2 traitCollection];

  return v3;
}

- (BOOL)shouldShowAvatarView
{
  id v2 = [(CKComposeNavbarCanvasViewController *)self delegate];
  char v3 = [v2 shouldShowAvatarViewInNavBarCanvas];

  return v3;
}

- (BOOL)shouldConfigureForJunkModal
{
  return 0;
}

- (NSDirectionalEdgeInsets)systemMinimumLayoutMarginsForView:(id)a3
{
  BOOL v4 = [(CKComposeNavbarCanvasViewController *)self delegate];
  [v4 systemMinimumLayoutMarginsForViewController:self];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.trailing = v16;
  result.bottom = v15;
  result.leading = v14;
  result.top = v13;
  return result;
}

- (id)locationLabel
{
  return 0;
}

- (BOOL)splitViewControllerIsCollapsed
{
  id v2 = [(CKComposeNavbarCanvasViewController *)self delegate];
  char v3 = [v2 splitViewController];
  char v4 = [v3 isCollapsed];

  return v4;
}

- (BOOL)shouldUseMinimumSafeAreas
{
  return 0;
}

- (double)preferredHeightOverride
{
  char v3 = [(CKComposeNavbarCanvasViewController *)self _windowTraitCollection];
  if ([(CKComposeNavbarCanvasViewController *)self shouldShowAvatarView])
  {
    char v4 = +[CKUIBehavior sharedBehaviors];
    objc_msgSend(v4, "defaultNavigationBarHeightValueWantsMinimumSafeAreas:", -[CKComposeNavbarCanvasViewController shouldUseMinimumSafeAreas](self, "shouldUseMinimumSafeAreas"));
    double v6 = v5;
  }
  else if ([v3 verticalSizeClass] == 1)
  {
    [v3 horizontalSizeClass];
    +[CKNavigationBarCanvasView preferredLandscapeHeightForRegularWidth];
    double v6 = v7;
  }
  else
  {
    double v8 = +[CKUIBehavior sharedBehaviors];
    [v8 navigationBarDefaultHeight];
    double v6 = v9;
  }
  return v6;
}

- (void)setCancelButton:(id)a3
{
}

- (CKNavbarCanvasViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKNavbarCanvasViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setTitleLabel:(id)a3
{
}

- (CKNavigationBarCanvasView)canvasView
{
  return self->_canvasView;
}

- (void)setCanvasView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canvasView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_cancelButton, 0);
}

@end