@interface FBKAttachmentViewerViewController
- (BOOL)interactionEnabled;
- (FBKAttachmentViewerViewController)initWithURL:(id)a3 deleteHandler:(id)a4;
- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4;
- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3;
- (void)_didTapDeleteButton;
- (void)setInteractionEnabled:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation FBKAttachmentViewerViewController

- (FBKAttachmentViewerViewController)initWithURL:(id)a3 deleteHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FBKAttachmentViewerViewController;
  v9 = [(FBKAttachmentViewerViewController *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    uint64_t v11 = objc_opt_new();
    previewController = v10->_previewController;
    v10->_previewController = (QLPreviewController *)v11;

    [(QLPreviewController *)v10->_previewController setDataSource:v10];
    v13 = _Block_copy(v8);
    id deleteHandler = v10->_deleteHandler;
    v10->_id deleteHandler = v13;

    v10->_interactionEnabled = 1;
  }

  return v10;
}

- (void)viewDidLoad
{
  v41[5] = *MEMORY[0x263EF8340];
  v40.receiver = self;
  v40.super_class = (Class)FBKAttachmentViewerViewController;
  [(FBKAttachmentViewerViewController *)&v40 viewDidLoad];
  v3 = [MEMORY[0x263F825C8] systemBackgroundColor];
  v4 = [(FBKAttachmentViewerViewController *)self view];
  [v4 setBackgroundColor:v3];

  id v5 = objc_alloc(MEMORY[0x263F82BF8]);
  v6 = (UIStackView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  stackView = self->_stackView;
  self->_stackView = v6;

  [(UIStackView *)self->_stackView setAxis:1];
  [(UIStackView *)self->_stackView setAlignment:3];
  [(UIStackView *)self->_stackView setSpacing:1.17549435e-38];
  [(UIStackView *)self->_stackView setInsetsLayoutMarginsFromSafeArea:1];
  [(UIStackView *)self->_stackView setLayoutMarginsRelativeArrangement:1];
  [(QLPreviewController *)self->_previewController willMoveToParentViewController:self];
  [(FBKAttachmentViewerViewController *)self addChildViewController:self->_previewController];
  id v8 = self->_stackView;
  v9 = [(QLPreviewController *)self->_previewController view];
  [(UIStackView *)v8 addArrangedSubview:v9];

  [(QLPreviewController *)self->_previewController didMoveToParentViewController:self];
  v10 = [(QLPreviewController *)self->_previewController view];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  v39 = [MEMORY[0x263F824F0] tintedButtonConfiguration];
  uint64_t v11 = [MEMORY[0x263F825C8] redColor];
  [v39 setBaseBackgroundColor:v11];

  [v39 setCornerStyle:3];
  [v39 setButtonSize:3];
  v12 = [MEMORY[0x263F824E8] buttonWithConfiguration:v39 primaryAction:0];
  deleteButton = self->_deleteButton;
  self->_deleteButton = v12;

  v14 = self->_deleteButton;
  v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v16 = [v15 localizedStringForKey:@"DELETE_ATTACHMENT" value:&stru_26DDF6A30 table:0];
  [(UIButton *)v14 setTitle:v16 forState:0];

  v17 = [MEMORY[0x263F825C8] redColor];
  [(UIButton *)self->_deleteButton setTintColor:v17];

  [(UIButton *)self->_deleteButton addTarget:self action:sel__didTapDeleteButton forControlEvents:64];
  [(UIButton *)self->_deleteButton setHidden:self->_deleteHandler == 0];
  [(UIStackView *)self->_stackView addArrangedSubview:self->_deleteButton];
  v18 = [(FBKAttachmentViewerViewController *)self view];
  [v18 addSubview:self->_stackView];

  v30 = (void *)MEMORY[0x263F08938];
  v38 = [(QLPreviewController *)self->_previewController view];
  v37 = [v38 leadingAnchor];
  v36 = [(UIStackView *)self->_stackView leadingAnchor];
  v35 = [v37 constraintEqualToAnchor:v36];
  v41[0] = v35;
  v34 = [(QLPreviewController *)self->_previewController view];
  v33 = [v34 trailingAnchor];
  v32 = [(UIStackView *)self->_stackView trailingAnchor];
  v31 = [v33 constraintEqualToAnchor:v32];
  v41[1] = v31;
  v29 = [(UIButton *)self->_deleteButton leadingAnchor];
  v19 = [(UIStackView *)self->_stackView leadingAnchor];
  v20 = [v29 constraintEqualToAnchor:v19 constant:16.0];
  v41[2] = v20;
  v21 = [(UIButton *)self->_deleteButton trailingAnchor];
  v22 = [(UIStackView *)self->_stackView trailingAnchor];
  v23 = [v21 constraintEqualToAnchor:v22 constant:-16.0];
  v41[3] = v23;
  v24 = [(UIButton *)self->_deleteButton bottomAnchor];
  v25 = [(UIStackView *)self->_stackView safeAreaLayoutGuide];
  v26 = [v25 bottomAnchor];
  v27 = [v24 constraintEqualToAnchor:v26 constant:-16.0];
  v41[4] = v27;
  v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:5];
  [v30 activateConstraints:v28];
}

- (void)viewWillLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)FBKAttachmentViewerViewController;
  [(FBKAttachmentViewerViewController *)&v4 viewWillLayoutSubviews];
  v3 = [(FBKAttachmentViewerViewController *)self view];
  [v3 frame];
  -[UIStackView setFrame:](self->_stackView, "setFrame:");
}

- (void)setInteractionEnabled:(BOOL)a3
{
  self->_interactionEnabled = a3;
}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  return self->_url != 0;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  return self->_url;
}

- (void)_didTapDeleteButton
{
  id deleteHandler = (void (**)(id, FBKAttachmentViewerViewController *))self->_deleteHandler;
  if (deleteHandler) {
    deleteHandler[2](deleteHandler, self);
  }
}

- (BOOL)interactionEnabled
{
  return self->_interactionEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deleteHandler, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_deleteButton, 0);
  objc_storeStrong((id *)&self->_previewController, 0);
  objc_storeStrong((id *)&self->_stackView, 0);

  objc_storeStrong((id *)&self->_underlyingViewControler, 0);
}

@end