@interface QLErrorItemViewController
- (BOOL)canEnterFullScreen;
- (BOOL)canPinchToDismiss;
- (BOOL)canSwipeToDismiss;
- (NSError)error;
- (QLItem)previewItem;
- (void)_updateLabelsWithCurrentErrorIfNeeded;
- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)loadView;
- (void)setError:(id)a3;
- (void)setPreviewItem:(id)a3;
@end

@implementation QLErrorItemViewController

- (void)loadView
{
  v3 = [QLErrorView alloc];
  id v5 = [(QLErrorItemViewController *)self title];
  v4 = -[_UIContentUnavailableView initWithFrame:title:style:](v3, "initWithFrame:title:style:", v5, 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(QLErrorItemViewController *)self setView:v4];
}

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v23 = a4;
  v7 = (void (**)(id, void))a5;
  v8 = [v23 previewTitle];
  v9 = v8;
  if (v8 && ([v8 isEqualToString:&stru_26C8FAD38] & 1) == 0)
  {
    v10 = [(QLErrorItemViewController *)self errorView];
    [v10 setTitle:v9];
  }
  v11 = [v23 originalContentType];

  if (v11
    && (v12 = (void *)MEMORY[0x263F1D920],
        [v23 originalContentType],
        v13 = objc_claimAutoreleasedReturnValue(),
        [v12 typeWithIdentifier:v13],
        v11 = objc_claimAutoreleasedReturnValue(),
        v13,
        v11)
    && ([v11 isDynamic] & 1) == 0)
  {
    v15 = [v11 localizedDescription];
    v16 = [(QLErrorItemViewController *)self errorView];
    [v16 setMessage:v15];

    int v14 = 1;
  }
  else
  {
    int v14 = 0;
  }
  v17 = [v23 itemSize];
  v18 = objc_msgSend(MEMORY[0x263F086F0], "stringFromByteCount:countStyle:", objc_msgSend(v17, "longLongValue"), 0);
  if (v17)
  {
    if (v14)
    {
      v19 = NSString;
      v20 = [v11 localizedDescription];
      v21 = [v19 stringWithFormat:@"%@\n%@", v20, v18];
      v22 = [(QLErrorItemViewController *)self errorView];
      [v22 setMessage:v21];
    }
    else
    {
      v20 = [(QLErrorItemViewController *)self errorView];
      [v20 setMessage:v18];
    }
  }
  [(QLErrorItemViewController *)self _updateLabelsWithCurrentErrorIfNeeded];
  if (v7) {
    v7[2](v7, 0);
  }
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

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);

  [(QLErrorItemViewController *)self _updateLabelsWithCurrentErrorIfNeeded];
}

- (void)_updateLabelsWithCurrentErrorIfNeeded
{
  v3 = [(QLItemViewController *)self context];
  v4 = [v3 previewTitle];

  if (!v4)
  {
    id v9 = [(QLErrorItemViewController *)self error];
    id v5 = [v9 domain];
    if (v5 == @"com.apple.quicklook.QLErrorItemViewController")
    {
      v7 = [(QLErrorItemViewController *)self error];
      uint64_t v8 = [v7 code];

      if (v8 != 1) {
        return;
      }
      QLLocalizedStringFromTable();
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      v6 = [(QLErrorItemViewController *)self errorView];
      [v6 setTitle:v9];
    }
    else
    {
      v6 = v5;
    }
  }
}

- (NSError)error
{
  return self->_error;
}

- (QLItem)previewItem
{
  return (QLItem *)objc_getProperty(self, a2, 1120, 1);
}

- (void)setPreviewItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewItem, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end