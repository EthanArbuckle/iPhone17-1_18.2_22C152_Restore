@interface QLDetailItemViewController
- (BOOL)canEnterFullScreen;
- (BOOL)canPinchToDismiss;
- (BOOL)canSwipeToDismiss;
- (NSArray)information;
- (QLDetailItemViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (QLDetailItemViewControllerState)state;
- (id)_scalableSystemFontOfSize:(double)a3;
- (void)_setActionButtonView:(id)a3 animated:(BOOL)a4 actionButtonLabel:(id)a5 informationVisible:(BOOL)a6;
- (void)_updateInformation;
- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)setAppearance:(id)a3 animated:(BOOL)a4;
- (void)setInformation:(id)a3;
- (void)setState:(id)a3;
- (void)setState:(id)a3 animated:(BOOL)a4;
- (void)viewDidLoad;
@end

@implementation QLDetailItemViewController

- (QLDetailItemViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = QLFrameworkBundle();
  v8.receiver = self;
  v8.super_class = (Class)QLDetailItemViewController;
  v6 = [(QLDetailItemViewController *)&v8 initWithNibName:@"QLDetailItemViewController" bundle:v5];

  return v6;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)QLDetailItemViewController;
  [(QLDetailItemViewController *)&v9 viewDidLoad];
  v3 = [MEMORY[0x263F825C8] systemBackgroundColor];
  v4 = [(QLDetailItemViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [(UIButton *)self->_actionButton titleLabel];
  v6 = [(QLDetailItemViewController *)self _scalableSystemFontOfSize:15.0];
  [v5 setFont:v6];

  v7 = [(UIButton *)self->_actionButton titleLabel];
  [v7 setAdjustsFontForContentSizeCategory:1];

  [(UIButton *)self->_actionButton setTitle:&stru_26C8FAD38 forState:0];
  objc_super v8 = [(QLFileIconImageView *)self->_filePreviewImageView superview];
  [v8 bringSubviewToFront:self->_filePreviewImageView];
}

- (void)setState:(id)a3
{
}

- (void)setState:(id)a3 animated:(BOOL)a4
{
  v6 = (QLDetailItemViewControllerState *)a3;
  if (self->_state != v6)
  {
    [(QLDetailItemViewController *)self loadViewIfNeeded];
    objc_storeStrong((id *)&self->_state, a3);
    v7 = v6;
    QLRunInMainThread();
  }
}

void __48__QLDetailItemViewController_setState_animated___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) actionButtonView];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  v4 = [*(id *)(a1 + 40) actionButtonTitle];
  objc_msgSend(v2, "_setActionButtonView:animated:actionButtonLabel:informationVisible:", v5, v3, v4, objc_msgSend(*(id *)(a1 + 40), "isInformationVisible"));
}

- (void)setInformation:(id)a3
{
  objc_storeStrong((id *)&self->_information, a3);

  [(QLDetailItemViewController *)self _updateInformation];
}

- (void)_updateInformation
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  [(QLDetailItemViewController *)self loadViewIfNeeded];
  uint64_t v3 = [(UIStackView *)self->_informationStackView arrangedSubviews];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v7++) removeFromSuperview];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v5);
  }
  if (self->_previewTitle)
  {
    previewTitle = self->_previewTitle;
    objc_super v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&previewTitle count:1];
    objc_super v9 = [v8 arrayByAddingObjectsFromArray:self->_information];
  }
  else
  {
    objc_super v9 = self->_information;
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __48__QLDetailItemViewController__updateInformation__block_invoke;
  v10[3] = &unk_2642F6B28;
  v10[4] = self;
  [(NSArray *)v9 enumerateObjectsUsingBlock:v10];
}

void __48__QLDetailItemViewController__updateInformation__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v9 = (id)objc_opt_new();
  if (a3)
  {
    uint64_t v6 = [MEMORY[0x263F825C8] secondaryLabelColor];
    [v9 setTextColor:v6];

    [v9 setLineBreakMode:5];
    [v9 setText:v5];

    [v9 setAdjustsFontForContentSizeCategory:1];
    [*(id *)(a1 + 32) _scalableSystemFontOfSize:17.0];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263F825C8] labelColor];
    [v9 setTextColor:v7];

    [v9 setLineBreakMode:5];
    [v9 setText:v5];

    [v9 setAdjustsFontForContentSizeCategory:1];
    [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83618]];
  objc_super v8 = };
  [v9 setFont:v8];

  [*(id *)(*(void *)(a1 + 32) + 1120) addArrangedSubview:v9];
}

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  v23[1] = *MEMORY[0x263EF8340];
  uint64_t v7 = (void (**)(id, void))a5;
  id v8 = a4;
  [(QLDetailItemViewController *)self setInformation:MEMORY[0x263EFFA68]];
  QLCGSizeFromQLItemThumbnailSize();
  double v10 = v9;
  double v12 = v11;
  long long v13 = [v8 thumbnailGenerator];
  long long v14 = objc_msgSend(v13, "genericIconWithSize:", v10, v12);

  [(QLFileIconImageView *)self->_filePreviewImageView setImage:v14];
  v15 = [v8 thumbnailGenerator];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __90__QLDetailItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke;
  v22[3] = &unk_2642F5E30;
  v22[4] = self;
  objc_msgSend(v15, "generateThumbnailWithSize:completionBlock:", v22, v10, v12);

  v16 = [v8 previewTitle];
  previewTitle = self->_previewTitle;
  self->_previewTitle = v16;

  v18 = [v8 itemSize];

  objc_msgSend(MEMORY[0x263F086F0], "stringFromByteCount:countStyle:", objc_msgSend(v18, "longLongValue"), 0);
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v20 = &stru_26C8FAD38;
  if (v19 && [v18 integerValue] > 0) {
    v20 = v19;
  }
  v23[0] = v20;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
  [(QLDetailItemViewController *)self setInformation:v21];

  if (v7) {
    v7[2](v7, 0);
  }
}

void __90__QLDetailItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v4 = a2;
  id v5 = v4;
  if (a3)
  {
    id v6 = v4;
    QLRunInMainThread();
  }
}

void __90__QLDetailItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1112) setImage:*(void *)(a1 + 40)];
  v2 = [*(id *)(*(void *)(a1 + 32) + 1112) layer];
  [v2 setCornerRadius:0.0];

  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 1112) layer];
  [v3 setBorderWidth:1.0];

  id v6 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.17];
  uint64_t v4 = [v6 CGColor];
  id v5 = [*(id *)(*(void *)(a1 + 32) + 1112) layer];
  [v5 setBorderColor:v4];
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)QLDetailItemViewController;
  id v6 = a3;
  [(QLItemViewController *)&v8 setAppearance:v6 animated:v4];
  uint64_t v7 = objc_msgSend(v6, "presentationMode", v8.receiver, v8.super_class);

  [(UIButton *)self->_actionButton setHidden:v7 == 4];
}

- (BOOL)canEnterFullScreen
{
  return 0;
}

- (BOOL)canSwipeToDismiss
{
  return 0;
}

- (BOOL)canPinchToDismiss
{
  return 0;
}

- (void)_setActionButtonView:(id)a3 animated:(BOOL)a4 actionButtonLabel:(id)a5 informationVisible:(BOOL)a6
{
  BOOL v8 = a4;
  id v11 = a3;
  id v12 = a5;
  long long v13 = self->_currentActionButtonView;
  objc_storeStrong((id *)&self->_currentActionButtonView, a3);
  [MEMORY[0x263F158F8] begin];
  long long v14 = [v11 layer];
  [v14 removeAllAnimations];

  [MEMORY[0x263F158F8] commit];
  if (self->_isSettingStateAnimated)
  {
    v15 = (NSObject **)MEMORY[0x263F62940];
    v16 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      v16 = *v15;
    }
    BOOL v8 = 0;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.a) = 0;
      _os_log_impl(&dword_217F61000, v16, OS_LOG_TYPE_DEFAULT, "Updating view state in detail item view controller without animation, since state animation already in progress. #DetailItemViewController", (uint8_t *)&buf, 2u);
      BOOL v8 = 0;
    }
  }
  else
  {
    self->_isSettingStateAnimated = 1;
  }
  memset(&buf, 0, sizeof(buf));
  CGAffineTransformMakeScale(&buf, 0.1, 0.1);
  [v11 setAlpha:0.0];
  CGAffineTransform v33 = buf;
  [v11 setTransform:&v33];
  [(UIView *)v13 setAlpha:1.0];
  long long v17 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v32[0] = *MEMORY[0x263F000D0];
  v32[1] = v17;
  v32[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [(UIView *)v13 setTransform:v32];
  [v11 removeFromSuperview];
  [(UIButton *)self->_actionIconButton addSubview:v11];
  [(UIButton *)self->_actionIconButton bounds];
  double MidX = CGRectGetMidX(v35);
  [(UIButton *)self->_actionIconButton bounds];
  objc_msgSend(v11, "setCenter:", MidX, CGRectGetMidY(v36));
  [(UIButton *)self->_actionIconButton setEnabled:v11 != 0];
  [(UIButton *)self->_actionButton setUserInteractionEnabled:0];
  [(UIButton *)self->_actionIconButton setUserInteractionEnabled:0];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__QLDetailItemViewController__setActionButtonView_animated_actionButtonLabel_informationVisible___block_invoke;
  aBlock[3] = &unk_2642F6B50;
  v26 = v13;
  CGAffineTransform v30 = buf;
  id v19 = v11;
  id v27 = v19;
  v28 = self;
  BOOL v31 = a6;
  id v20 = v12;
  id v29 = v20;
  v21 = v13;
  v22 = (void (**)(void))_Block_copy(aBlock);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __97__QLDetailItemViewController__setActionButtonView_animated_actionButtonLabel_informationVisible___block_invoke_2;
  v24[3] = &unk_2642F5458;
  v24[4] = self;
  v23 = (void (**)(void *, uint64_t))_Block_copy(v24);
  if (v8)
  {
    [MEMORY[0x263F82E00] animateWithDuration:v22 animations:v23 completion:0.35];
  }
  else
  {
    v22[2](v22);
    v23[2](v23, 1);
  }
}

uint64_t __97__QLDetailItemViewController__setActionButtonView_animated_actionButtonLabel_informationVisible___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  long long v2 = *(_OWORD *)(a1 + 80);
  v7[0] = *(_OWORD *)(a1 + 64);
  v7[1] = v2;
  v7[2] = *(_OWORD *)(a1 + 96);
  [*(id *)(a1 + 32) setTransform:v7];
  [*(id *)(a1 + 40) setAlpha:1.0];
  uint64_t v3 = *(void **)(a1 + 40);
  long long v4 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v6[0] = *MEMORY[0x263F000D0];
  v6[1] = v4;
  v6[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v3 setTransform:v6];
  [*(id *)(*(void *)(a1 + 48) + 1120) setHidden:*(unsigned char *)(a1 + 112) == 0];
  return [*(id *)(*(void *)(a1 + 48) + 1136) setTitle:*(void *)(a1 + 56) forState:0];
}

uint64_t __97__QLDetailItemViewController__setActionButtonView_animated_actionButtonLabel_informationVisible___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1136) setUserInteractionEnabled:1];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 1128) setUserInteractionEnabled:1];
  *(unsigned char *)(*(void *)(a1 + 32) + 1144) = 0;
  return result;
}

- (id)_scalableSystemFontOfSize:(double)a3
{
  long long v4 = [MEMORY[0x263F82770] defaultMetrics];
  id v5 = [MEMORY[0x263F81708] systemFontOfSize:a3];
  id v6 = [v4 scaledFontForFont:v5];

  return v6;
}

- (QLDetailItemViewControllerState)state
{
  return self->_state;
}

- (NSArray)information
{
  return self->_information;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_information, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_previewTitle, 0);
  objc_storeStrong((id *)&self->_currentActionButtonView, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_actionIconButton, 0);
  objc_storeStrong((id *)&self->_informationStackView, 0);

  objc_storeStrong((id *)&self->_filePreviewImageView, 0);
}

@end