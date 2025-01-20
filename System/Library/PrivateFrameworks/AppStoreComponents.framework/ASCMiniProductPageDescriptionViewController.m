@interface ASCMiniProductPageDescriptionViewController
- (ASCMiniProductPageDescriptionViewController)initWithText:(id)a3;
- (NSString)text;
- (void)loadView;
- (void)setText:(id)a3;
@end

@implementation ASCMiniProductPageDescriptionViewController

- (ASCMiniProductPageDescriptionViewController)initWithText:(id)a3
{
  id v5 = a3;
  v6 = [(ASCMiniProductPageDescriptionViewController *)self initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_text, a3);
    v8 = (void *)MEMORY[0x1E4FB13F0];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __60__ASCMiniProductPageDescriptionViewController_initWithText___block_invoke;
    v16[3] = &unk_1E645E648;
    v9 = v7;
    v17 = v9;
    v10 = [v8 actionWithHandler:v16];
    v11 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:24 primaryAction:v10];
    v12 = [(ASCMiniProductPageDescriptionViewController *)v9 navigationItem];
    [v12 setRightBarButtonItem:v11];

    v14 = ASCLocalizedString(@"MINI_PRODUCT_PAGE_DESCRIPTION_SHEET_TITLE", v13);
    [(ASCMiniProductPageDescriptionViewController *)v9 setTitle:v14];
  }
  return v7;
}

uint64_t __60__ASCMiniProductPageDescriptionViewController_initWithText___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1DD8]);
  id v6 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v4 = [(ASCMiniProductPageDescriptionViewController *)self text];
  [v6 setText:v4];

  [v6 setEditable:0];
  [v6 setSelectable:0];
  objc_msgSend(v6, "setTextContainerInset:", 8.0, 16.0, 0.0, 16.0);
  id v5 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  [v6 setFont:v5];

  [(ASCMiniProductPageDescriptionViewController *)self setView:v6];
}

- (void)setText:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_text, a3);
  id v5 = [(ASCMiniProductPageDescriptionViewController *)self viewIfLoaded];

  if (v5)
  {
    id v6 = [(ASCMiniProductPageDescriptionViewController *)self textView];
    [v6 setText:v7];
  }
}

- (NSString)text
{
  return self->_text;
}

- (void).cxx_destruct
{
}

@end