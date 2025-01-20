@interface CKComposeNavbarBusinessCanvasViewController
- (BOOL)_canShowAvatarView;
- (BOOL)_shouldUpdateVerifiedIconForConversation:(id)a3;
- (BOOL)hideChevron;
- (CKAvatarPickerViewController)avatarController;
- (CKConversation)cachedConversation;
- (CKLabel)defaultLabel;
- (id)_titleItemViewForTraitCollection:(id)a3;
- (void)_handleAddressBookPartialChange:(id)a3;
- (void)_updateBrandingForConversation:(id)a3;
- (void)_updateDefaultLabelForConversation:(id)a3;
- (void)_updateTitleForConversation:(id)a3 animated:(BOOL)a4;
- (void)setAvatarController:(id)a3;
- (void)setCachedConversation:(id)a3;
- (void)setDefaultLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateContentsForConversation:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation CKComposeNavbarBusinessCanvasViewController

- (void)updateContentsForConversation:(id)a3
{
  id v12 = a3;
  if (!self->_avatarController)
  {
    v4 = [[CKAvatarPickerViewController alloc] initWithConversation:v12];
    [(CKComposeNavbarBusinessCanvasViewController *)self setAvatarController:v4];

    v5 = [(CKComposeNavbarBusinessCanvasViewController *)self avatarController];
    [v5 setDelegate:self];

    v6 = [(CKComposeNavbarBusinessCanvasViewController *)self avatarController];
    [(CKComposeNavbarBusinessCanvasViewController *)self addChildViewController:v6];

    v7 = [(CKComposeNavbarBusinessCanvasViewController *)self avatarController];
    [v7 didMoveToParentViewController:self];
  }
  v8 = [(CKComposeNavbarBusinessCanvasViewController *)self avatarController];
  [v8 updateContentsForConversation:v12];

  [(CKComposeNavbarBusinessCanvasViewController *)self _updateBrandingForConversation:v12];
  v9 = [(CKComposeNavbarCanvasViewController *)self canvasView];
  v10 = [(CKComposeNavbarBusinessCanvasViewController *)self traitCollection];
  v11 = [(CKComposeNavbarBusinessCanvasViewController *)self _titleItemViewForTraitCollection:v10];
  [v9 setTitleView:v11];

  [(CKComposeNavbarBusinessCanvasViewController *)self setCachedConversation:v12];
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)CKComposeNavbarBusinessCanvasViewController;
  [(CKComposeNavbarCanvasViewController *)&v17 viewDidLoad];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__handleAddressBookPartialChange_ name:*MEMORY[0x1E4F6CA60] object:0];

  v4 = [CKLabel alloc];
  v5 = -[CKLabel initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  defaultLabel = self->_defaultLabel;
  self->_defaultLabel = v5;

  v7 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:17.0];
  [(CKLabel *)self->_defaultLabel setFont:v7];

  [(CKLabel *)self->_defaultLabel setTextAlignment:1];
  v8 = (void *)MEMORY[0x1E4F6E628];
  v9 = [(CKComposeNavbarBusinessCanvasViewController *)self cachedConversation];
  v10 = [v9 businessHandle];
  v11 = [v10 ID];
  id v12 = [v8 placeholderNameForBrandURI:v11];
  [(CKLabel *)self->_defaultLabel setText:v12];

  v13 = [MEMORY[0x1E4F428B8] clearColor];
  [(CKLabel *)self->_defaultLabel setBackgroundColor:v13];

  [(CKLabel *)self->_defaultLabel sizeToFit];
  v14 = [(CKComposeNavbarCanvasViewController *)self canvasView];
  v15 = [(CKComposeNavbarBusinessCanvasViewController *)self traitCollection];
  v16 = [(CKComposeNavbarBusinessCanvasViewController *)self _titleItemViewForTraitCollection:v15];
  [v14 setTitleView:v16];
}

- (void)viewDidLayoutSubviews
{
  v44.receiver = self;
  v44.super_class = (Class)CKComposeNavbarBusinessCanvasViewController;
  [(CKComposeNavbarBusinessCanvasViewController *)&v44 viewDidLayoutSubviews];
  v3 = [(CKComposeNavbarCanvasViewController *)self canvasView];
  [v3 safeAreaInsets];
  double v5 = v4;
  double v7 = v6;

  v8 = [(CKComposeNavbarCanvasViewController *)self canvasView];
  [(CKComposeNavbarCanvasViewController *)self systemMinimumLayoutMarginsForView:v8];
  double v10 = v9;
  double v12 = v11;
  v13 = [(CKComposeNavbarCanvasViewController *)self canvasView];
  uint64_t v14 = [v13 effectiveUserInterfaceLayoutDirection];
  if (v14) {
    double v15 = v12;
  }
  else {
    double v15 = v10;
  }
  if (!v14) {
    double v10 = v12;
  }

  v16 = [(CKComposeNavbarBusinessCanvasViewController *)self view];
  char v17 = [v16 _shouldReverseLayoutDirection];

  v18 = [(CKComposeNavbarCanvasViewController *)self canvasView];
  if (v17)
  {
    v19 = [v18 rightItemView];
    [v19 frame];
    double v20 = v7 + v10 + CGRectGetWidth(v45);

    double v7 = v7 + v15;
    v21 = [(CKComposeNavbarCanvasViewController *)self canvasView];
    v22 = [v21 leftItemView];
    [v22 frame];
    double Width = CGRectGetWidth(v46);
  }
  else
  {
    v24 = [v18 leftItemView];
    [v24 frame];
    double v20 = v5 + v15 + CGRectGetWidth(v47);

    v21 = [(CKComposeNavbarCanvasViewController *)self canvasView];
    v22 = [v21 rightItemView];
    [v22 frame];
    double Width = v10 + CGRectGetWidth(v48);
  }
  double v25 = v7 + Width;

  if (v20 >= v25) {
    double v26 = v20;
  }
  else {
    double v26 = v25;
  }
  double v27 = v26 + v26;
  v28 = [(CKComposeNavbarCanvasViewController *)self canvasView];
  [v28 bounds];
  CGFloat v29 = CGRectGetWidth(v49) - (v27 + 14.0 + 14.0);

  v30 = [(CKComposeNavbarCanvasViewController *)self canvasView];
  v31 = [v30 titleView];
  [v31 frame];

  v32 = [(CKComposeNavbarBusinessCanvasViewController *)self view];
  [v32 frame];
  double v34 = v33;

  v35 = [(CKComposeNavbarBusinessCanvasViewController *)self view];
  [v35 bounds];
  float v37 = (v36 - v29) * 0.5;
  double v38 = rintf(v37);

  v39 = [(CKComposeNavbarBusinessCanvasViewController *)self view];
  [v39 bounds];
  float v41 = (v40 - v34) * 0.5;
  double v42 = rintf(v41);

  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __68__CKComposeNavbarBusinessCanvasViewController_viewDidLayoutSubviews__block_invoke;
  v43[3] = &unk_1E5621968;
  v43[4] = self;
  *(double *)&v43[5] = v38;
  *(double *)&v43[6] = v42;
  *(CGFloat *)&v43[7] = v29;
  *(double *)&v43[8] = v34;
  [MEMORY[0x1E4F42FF0] performWithoutAnimation:v43];
}

void __68__CKComposeNavbarBusinessCanvasViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  double v4 = *(double *)(a1 + 64);
  id v6 = [*(id *)(a1 + 32) canvasView];
  double v5 = [v6 titleView];
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKComposeNavbarBusinessCanvasViewController;
  [(CKComposeNavbarBusinessCanvasViewController *)&v7 traitCollectionDidChange:a3];
  double v4 = [(CKComposeNavbarCanvasViewController *)self canvasView];
  double v5 = [(CKComposeNavbarBusinessCanvasViewController *)self traitCollection];
  id v6 = [(CKComposeNavbarBusinessCanvasViewController *)self _titleItemViewForTraitCollection:v5];
  [v4 setTitleView:v6];
}

- (id)_titleItemViewForTraitCollection:(id)a3
{
  id v4 = a3;
  if ([(CKComposeNavbarBusinessCanvasViewController *)self _canShowAvatarView]
    && [v4 verticalSizeClass] != 1)
  {
    id v6 = [(CKComposeNavbarBusinessCanvasViewController *)self avatarController];
    if (v6)
    {
      objc_super v7 = [(CKComposeNavbarBusinessCanvasViewController *)self avatarController];
      double v5 = [v7 view];
    }
    else
    {
      double v5 = 0;
    }
  }
  else
  {
    double v5 = [(CKComposeNavbarBusinessCanvasViewController *)self defaultLabel];
  }

  return v5;
}

- (BOOL)_canShowAvatarView
{
  double v2 = [(CKComposeNavbarCanvasViewController *)self delegate];
  char v3 = [v2 shouldShowAvatarViewInNavBarCanvas];

  return v3;
}

- (void)_updateBrandingForConversation:(id)a3
{
  id v9 = a3;
  id v4 = +[CKUIBehavior sharedBehaviors];
  double v5 = [v4 theme];
  id v6 = [v9 businessHandle];
  uint64_t v7 = [v5 navBarTextStyleForBusinessHandle:v6];
  v8 = [(CKComposeNavbarBusinessCanvasViewController *)self avatarController];
  [v8 setStyle:v7];

  [(CKComposeNavbarBusinessCanvasViewController *)self _updateDefaultLabelForConversation:v9];
  [(CKComposeNavbarBusinessCanvasViewController *)self _updateTitleForConversation:v9 animated:0];
}

- (void)_updateDefaultLabelForConversation:(id)a3
{
  id v13 = a3;
  id v4 = +[CKUIBehavior sharedBehaviors];
  double v5 = [v4 theme];
  id v6 = [v13 businessHandle];
  uint64_t v7 = [v5 secondaryBrandColorForBusinessHandle:v6];

  if (v7)
  {
    v8 = +[CKUIBehavior sharedBehaviors];
    id v9 = [v8 theme];
    double v10 = [v13 businessHandle];
    double v11 = [v9 secondaryBrandColorForBusinessHandle:v10];
    double v12 = [(CKComposeNavbarBusinessCanvasViewController *)self defaultLabel];
    [v12 setTextColor:v11];
  }
}

- (void)_updateTitleForConversation:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v21 = a3;
  id v6 = [v21 businessHandle];
  uint64_t v7 = [v6 name];

  if (v7)
  {
    v8 = [(CKComposeNavbarBusinessCanvasViewController *)self defaultLabel];
    id v9 = [v8 text];
    if ([v7 isEqualToString:v9])
    {
      BOOL v10 = [(CKComposeNavbarBusinessCanvasViewController *)self _shouldUpdateVerifiedIconForConversation:v21];

      if (!v10) {
        goto LABEL_12;
      }
    }
    else
    {
    }
LABEL_8:
    int v11 = [v21 shouldShowVerifiedCheckmark];
    double v12 = [(CKComposeNavbarBusinessCanvasViewController *)self defaultLabel];
    [v12 setText:v7];

    id v13 = [(CKComposeNavbarBusinessCanvasViewController *)self avatarController];
    [v13 _setTitle:v7 animated:v4];

    uint64_t v14 = [(CKComposeNavbarBusinessCanvasViewController *)self defaultLabel];
    double v15 = v14;
    if (v11)
    {
      [v14 setTitleIconImageType:1];

      v16 = [(CKComposeNavbarBusinessCanvasViewController *)self avatarController];
      char v17 = [v16 titleView];
      v18 = v17;
      uint64_t v19 = 1;
    }
    else
    {
      [v14 setTitleIconImageType:0];

      v16 = [(CKComposeNavbarBusinessCanvasViewController *)self avatarController];
      char v17 = [v16 titleView];
      v18 = v17;
      uint64_t v19 = 0;
    }
    [v17 setAvatarTitleAccessoryImageType:v19];

    double v20 = [(CKComposeNavbarBusinessCanvasViewController *)self defaultLabel];
    [v20 sizeToFit];

    goto LABEL_12;
  }
  if ([(CKComposeNavbarBusinessCanvasViewController *)self _shouldUpdateVerifiedIconForConversation:v21])
  {
    goto LABEL_8;
  }
LABEL_12:
}

- (BOOL)_shouldUpdateVerifiedIconForConversation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKComposeNavbarBusinessCanvasViewController *)self defaultLabel];
  BOOL v6 = [(id)v5 titleIconImageType] == 1;

  LOBYTE(v5) = [v4 hasVerifiedBusiness];
  return v6 ^ v5;
}

- (void)_handleAddressBookPartialChange:(id)a3
{
  id v4 = [a3 userInfo];
  id v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6CA80]];

  uint64_t v5 = [(CKComposeNavbarBusinessCanvasViewController *)self cachedConversation];
  if (v5)
  {
    BOOL v6 = (void *)v5;
    int v7 = [v9 isEqualToString:*MEMORY[0x1E4F6CA68]];

    if (v7)
    {
      v8 = [(CKComposeNavbarBusinessCanvasViewController *)self cachedConversation];
      [(CKComposeNavbarBusinessCanvasViewController *)self _updateBrandingForConversation:v8];
    }
  }
}

- (BOOL)hideChevron
{
  return 1;
}

- (CKLabel)defaultLabel
{
  return self->_defaultLabel;
}

- (void)setDefaultLabel:(id)a3
{
}

- (CKAvatarPickerViewController)avatarController
{
  return self->_avatarController;
}

- (void)setAvatarController:(id)a3
{
}

- (CKConversation)cachedConversation
{
  return self->_cachedConversation;
}

- (void)setCachedConversation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedConversation, 0);
  objc_storeStrong((id *)&self->_avatarController, 0);

  objc_storeStrong((id *)&self->_defaultLabel, 0);
}

@end