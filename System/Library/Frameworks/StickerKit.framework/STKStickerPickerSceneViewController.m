@interface STKStickerPickerSceneViewController
+ (UIEdgeInsets)additionalInsets;
- (STKStickerPickerSceneViewController)init;
- (STKStickerPickerSceneViewControllerDelegate)delegate;
- (id)_remoteSheet;
- (void)setDelegate:(id)a3;
- (void)setupSceneHosting;
- (void)stickerPickerSceneDidRequestDismissal;
@end

@implementation STKStickerPickerSceneViewController

- (STKStickerPickerSceneViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)STKStickerPickerSceneViewController;
  v2 = [(STKStickerPickerSceneViewController *)&v5 initWithNibName:0 bundle:0];
  v3 = v2;
  if (v2) {
    [(STKStickerPickerSceneViewController *)v2 setupSceneHosting];
  }
  return v3;
}

- (void)setupSceneHosting
{
  v25[4] = *MEMORY[0x263EF8340];
  if (!self->_hostingController)
  {
    [(STKStickerPickerSceneViewController *)self _beginDelayingPresentation:&__block_literal_global_0 cancellationHandler:3.0];
    v24 = [MEMORY[0x263F64598] identityForEmbeddedApplicationIdentifier:@"com.apple.StickerKit.StickerPickerService"];
    id v3 = objc_alloc(MEMORY[0x263F830A8]);
    v4 = +[FBSSceneSpecification specification];
    objc_super v5 = (_UISceneHostingController *)[v3 initWithProcessIdentity:v24 sceneSpecification:v4];
    hostingController = self->_hostingController;
    self->_hostingController = v5;

    [(_UISceneHostingController *)self->_hostingController setDelegate:self];
    v23 = [(_UISceneHostingController *)self->_hostingController sceneViewController];
    [(STKStickerPickerSceneViewController *)self addChildViewController:v23];
    v7 = [v23 view];
    v8 = [(STKStickerPickerSceneViewController *)self view];
    [v8 addSubview:v7];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    v17 = (void *)MEMORY[0x263F08938];
    v22 = [v7 leadingAnchor];
    v21 = [v8 leadingAnchor];
    v20 = [v22 constraintEqualToAnchor:v21];
    v25[0] = v20;
    v19 = [v7 trailingAnchor];
    v18 = [v8 trailingAnchor];
    v16 = [v19 constraintEqualToAnchor:v18];
    v25[1] = v16;
    v9 = [v7 topAnchor];
    v10 = [v8 topAnchor];
    v11 = [v9 constraintEqualToAnchor:v10];
    v25[2] = v11;
    v12 = [v7 bottomAnchor];
    v13 = [v8 bottomAnchor];
    v14 = [v12 constraintEqualToAnchor:v13];
    v25[3] = v14;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:4];
    [v17 activateConstraints:v15];

    [v23 didMoveToParentViewController:self];
  }
}

uint64_t __56__STKStickerPickerSceneViewController_setupSceneHosting__block_invoke()
{
  return 0;
}

+ (UIEdgeInsets)additionalInsets
{
  double v2 = 600.0;
  double v3 = 300.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v3;
  result.left = v4;
  result.top = v2;
  return result;
}

- (void)stickerPickerSceneDidRequestDismissal
{
  double v3 = [(STKStickerPickerSceneViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(STKStickerPickerSceneViewController *)self delegate];
    [v5 stickerPickerSceneDidRequestDismissal:self];
  }
}

- (id)_remoteSheet
{
  return self->_hostingController;
}

- (STKStickerPickerSceneViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (STKStickerPickerSceneViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_hostingController, 0);
}

@end