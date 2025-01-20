@interface FBKOpaqueFileViewController
+ (BOOL)shouldDisplayItem:(id)a3;
- (BOOL)showsItem;
- (DEDAttachmentItem)item;
- (UIImageView)icon;
- (UILabel)debugLabel;
- (UILabel)fileNameLabel;
- (UILabel)fileSizeLabel;
- (void)didTapView;
- (void)setDebugLabel:(id)a3;
- (void)setFileNameLabel:(id)a3;
- (void)setFileSizeLabel:(id)a3;
- (void)setIcon:(id)a3;
- (void)setItem:(id)a3;
- (void)showShareSheet;
- (void)viewDidLoad;
@end

@implementation FBKOpaqueFileViewController

- (void)viewDidLoad
{
  v32.receiver = self;
  v32.super_class = (Class)FBKOpaqueFileViewController;
  [(FBKOpaqueFileViewController *)&v32 viewDidLoad];
  v3 = [(FBKOpaqueFileViewController *)self navigationItem];
  [v3 setLargeTitleDisplayMode:2];

  v4 = [(FBKOpaqueFileViewController *)self item];

  if (v4)
  {
    v5 = [(FBKOpaqueFileViewController *)self item];
    v6 = [v5 displayName];
    v7 = [(FBKOpaqueFileViewController *)self fileNameLabel];
    [v7 setText:v6];

    v8 = [(FBKOpaqueFileViewController *)self fileNameLabel];
    [v8 setNumberOfLines:0];

    v9 = [(FBKOpaqueFileViewController *)self item];
    v10 = [v9 fileSize];
    uint64_t v11 = [v10 unsignedLongLongValue];

    v12 = [MEMORY[0x263F086F0] stringFromByteCount:v11 countStyle:0];
    v13 = [(FBKOpaqueFileViewController *)self fileSizeLabel];
    [v13 setText:v12];

    if (FBKIsInternalInstall(v14, v15) && [(FBKOpaqueFileViewController *)self showsItem])
    {
      v16 = NSString;
      v17 = [(FBKOpaqueFileViewController *)self item];
      v18 = [v17 description];
      v19 = [v16 stringWithFormat:@"(INTERNAL)\n\n%@", v18];
      v20 = [(FBKOpaqueFileViewController *)self debugLabel];
      [v20 setText:v19];

      v21 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel_didTapView];
      v22 = [(FBKOpaqueFileViewController *)self view];
      [v22 addGestureRecognizer:v21];

      v23 = [(FBKOpaqueFileViewController *)self debugLabel];
      [v23 setAlpha:0.0];

      v24 = [(FBKOpaqueFileViewController *)self debugLabel];
      [v24 setHidden:0];
    }
  }
  else
  {
    v25 = [(FBKOpaqueFileViewController *)self fileNameLabel];
    [v25 setText:&stru_26DDF6A30];

    v12 = [(FBKOpaqueFileViewController *)self fileNameLabel];
    [v12 setText:&stru_26DDF6A30];
  }

  v26 = [(FBKOpaqueFileViewController *)self item];
  int v27 = [v26 isLocal];

  if (v27)
  {
    id v28 = objc_alloc(MEMORY[0x263F824A8]);
    v29 = [MEMORY[0x263F827E8] systemImageNamed:@"square.and.arrow.up"];
    v30 = (void *)[v28 initWithImage:v29 style:0 target:self action:sel_showShareSheet];
    v31 = [(FBKOpaqueFileViewController *)self navigationItem];
    [v31 setRightBarButtonItem:v30];
  }
}

- (void)showShareSheet
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F6BC98]);
  v4 = [(FBKOpaqueFileViewController *)self item];
  v5 = [v4 attachedPath];
  v11[0] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  v7 = (void *)[v3 initWithActivityItems:v6 applicationActivities:0];

  v8 = [v7 popoverPresentationController];
  v9 = [(FBKOpaqueFileViewController *)self navigationItem];
  v10 = [v9 rightBarButtonItem];
  [v8 setSourceItem:v10];

  [(FBKOpaqueFileViewController *)self presentViewController:v7 animated:1 completion:&__block_literal_global_32];
}

+ (BOOL)shouldDisplayItem:(id)a3
{
  id v3 = a3;
  if ([v3 pointsToReachableDir])
  {
    BOOL v4 = 0;
  }
  else
  {
    v5 = [v3 attachedPath];
    if ([v3 isLocal]
      && [v5 checkResourceIsReachableAndReturnError:0]
      && +[FBKFileManager humansCanReadFile:v5])
    {
      v6 = [v3 fileSize];
      BOOL v4 = [v6 intValue] == 0;
    }
    else
    {
      BOOL v4 = 1;
    }
  }
  return v4;
}

- (BOOL)showsItem
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"showDEDItem"];

  return v3;
}

- (void)didTapView
{
  char v3 = [(FBKOpaqueFileViewController *)self debugLabel];
  [v3 alpha];
  BOOL v5 = v4 == 0.0;

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__FBKOpaqueFileViewController_didTapView__block_invoke;
  v6[3] = &unk_264875490;
  BOOL v7 = v5;
  v6[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:v6 animations:0.25];
}

void __41__FBKOpaqueFileViewController_didTapView__block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  char v3 = [*(id *)(a1 + 32) fileSizeLabel];
  double v4 = v3;
  if (v2)
  {
    [v3 setAlpha:0.0];

    BOOL v5 = [*(id *)(a1 + 32) fileNameLabel];
    [v5 setAlpha:0.0];

    v6 = [*(id *)(a1 + 32) icon];
    [v6 setAlpha:0.0];

    BOOL v7 = [*(id *)(a1 + 32) debugLabel];
    double v8 = 1.0;
  }
  else
  {
    [v3 setAlpha:1.0];

    v9 = [*(id *)(a1 + 32) fileNameLabel];
    [v9 setAlpha:1.0];

    v10 = [*(id *)(a1 + 32) icon];
    [v10 setAlpha:1.0];

    BOOL v7 = [*(id *)(a1 + 32) debugLabel];
    double v8 = 0.0;
  }
  id v11 = v7;
  [v7 setAlpha:v8];
}

- (DEDAttachmentItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (UILabel)debugLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_debugLabel);

  return (UILabel *)WeakRetained;
}

- (void)setDebugLabel:(id)a3
{
}

- (UILabel)fileNameLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fileNameLabel);

  return (UILabel *)WeakRetained;
}

- (void)setFileNameLabel:(id)a3
{
}

- (UILabel)fileSizeLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fileSizeLabel);

  return (UILabel *)WeakRetained;
}

- (void)setFileSizeLabel:(id)a3
{
}

- (UIImageView)icon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icon);

  return (UIImageView *)WeakRetained;
}

- (void)setIcon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_icon);
  objc_destroyWeak((id *)&self->_fileSizeLabel);
  objc_destroyWeak((id *)&self->_fileNameLabel);
  objc_destroyWeak((id *)&self->_debugLabel);

  objc_storeStrong((id *)&self->_item, 0);
}

@end