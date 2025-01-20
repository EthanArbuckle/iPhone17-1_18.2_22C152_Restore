@interface QLLoadingItemViewController
- (BOOL)canEnterFullScreen;
- (BOOL)canPinchToDismiss;
- (BOOL)canSwipeToDismiss;
- (void)_updateLoadingLabel;
- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)previewBecameFullScreen:(BOOL)a3 animated:(BOOL)a4;
- (void)setDelegate:(id)a3;
@end

@implementation QLLoadingItemViewController

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

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  v43[1] = *MEMORY[0x263EF8340];
  v6 = (void (**)(id, void))a5;
  v7 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
  spinner = self->_spinner;
  self->_spinner = v7;

  v9 = [MEMORY[0x263F825C8] secondaryLabelColor];
  [(UIActivityIndicatorView *)self->_spinner setColor:v9];

  [(UIActivityIndicatorView *)self->_spinner setTranslatesAutoresizingMaskIntoConstraints:0];
  v10 = [(QLLoadingItemViewController *)self view];
  [v10 addSubview:self->_spinner];

  [(UIActivityIndicatorView *)self->_spinner startAnimating];
  v11 = (UILabel *)objc_opt_new();
  loadingLabel = self->_loadingLabel;
  self->_loadingLabel = v11;

  [(UILabel *)self->_loadingLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v13 = self->_loadingLabel;
  v14 = [MEMORY[0x263F81708] systemFontOfSize:13.0];
  [(UILabel *)v13 setFont:v14];

  [(UILabel *)self->_loadingLabel setTextAlignment:1];
  v15 = self->_loadingLabel;
  v16 = [MEMORY[0x263F825C8] clearColor];
  [(UILabel *)v15 setBackgroundColor:v16];

  v17 = self->_loadingLabel;
  v18 = [MEMORY[0x263F825C8] labelColor];
  [(UILabel *)v17 setTextColor:v18];

  v19 = self->_loadingLabel;
  id v20 = objc_alloc(MEMORY[0x263F089B8]);
  uint64_t v42 = *MEMORY[0x263F81510];
  v43[0] = &unk_26C913388;
  v21 = [NSDictionary dictionaryWithObjects:v43 forKeys:&v42 count:1];
  v22 = (void *)[v20 initWithString:&stru_26C8FAD38 attributes:v21];
  [(UILabel *)v19 setAttributedText:v22];

  v23 = [(QLLoadingItemViewController *)self view];
  [v23 addSubview:self->_loadingLabel];

  v24 = [(UILabel *)self->_loadingLabel centerXAnchor];
  v25 = [(QLLoadingItemViewController *)self view];
  v26 = [v25 centerXAnchor];
  v27 = [v24 constraintEqualToAnchor:v26];
  [v27 setActive:1];

  v28 = [(UILabel *)self->_loadingLabel heightAnchor];
  v29 = [v28 constraintEqualToConstant:25.0];
  [v29 setActive:1];

  v30 = [(UILabel *)self->_loadingLabel bottomAnchor];
  v31 = [(QLLoadingItemViewController *)self view];
  v32 = [v31 centerYAnchor];
  v33 = [v30 constraintEqualToAnchor:v32 constant:8.0];
  [v33 setActive:1];

  v34 = [(UIActivityIndicatorView *)self->_spinner centerXAnchor];
  v35 = [(QLLoadingItemViewController *)self view];
  v36 = [v35 centerXAnchor];
  v37 = [v34 constraintEqualToAnchor:v36];
  [v37 setActive:1];

  v38 = [(UIActivityIndicatorView *)self->_spinner bottomAnchor];
  v39 = [(QLLoadingItemViewController *)self view];
  v40 = [v39 centerYAnchor];
  v41 = [v38 constraintEqualToAnchor:v40 constant:-18.5];
  [v41 setActive:1];

  [(QLLoadingItemViewController *)self _updateLoadingLabel];
  if (v6) {
    v6[2](v6, 0);
  }
}

- (void)previewBecameFullScreen:(BOOL)a3 animated:(BOOL)a4
{
  if (a3)
  {
    id v6 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:1.0];
    [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:1.0];
  }
  else
  {
    id v6 = [MEMORY[0x263F825C8] labelColor];
    [MEMORY[0x263F825C8] secondaryLabelColor];
  v5 = };
  [(UILabel *)self->_loadingLabel setTextColor:v6];
  [(UIActivityIndicatorView *)self->_spinner setColor:v5];
}

- (void)_updateLoadingLabel
{
  [(QLLoadingItemViewController *)self loadViewIfNeeded];
  v3 = [(QLItemViewController *)self delegate];
  id v7 = [v3 loadingTextForPreviewItemViewController:self];

  if (!v7 || (int v4 = [v7 isEqualToString:&stru_26C8FAD38], v5 = v7, v4))
  {
    uint64_t v6 = QLLocalizedString();

    id v5 = (id)v6;
  }
  id v8 = v5;
  [(UILabel *)self->_loadingLabel setText:v5];
}

- (void)setDelegate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)QLLoadingItemViewController;
  [(QLItemViewController *)&v4 setDelegate:a3];
  [(QLLoadingItemViewController *)self _updateLoadingLabel];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);

  objc_storeStrong((id *)&self->_loadingLabel, 0);
}

@end