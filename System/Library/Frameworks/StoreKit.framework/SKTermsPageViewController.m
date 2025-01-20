@interface SKTermsPageViewController
- (SKTermsPageViewController)init;
- (SKTermsPageViewController)initWithTerms:(id)a3;
- (SKTermsPageViewControllerDelegate)delegate;
- (id)_markupTermsWithHTML:(id)a3;
- (int64_t)positionForBar:(id)a3;
- (unint64_t)edgesForExtendedLayout;
- (void)_buttonAccept:(id)a3;
- (void)_buttonDecline:(id)a3;
- (void)_dismissViewController;
- (void)_dismissViewControllerAnimated:(BOOL)a3;
- (void)_dismissViewControllerAnimated:(BOOL)a3 withAcceptance:(BOOL)a4;
- (void)_loadSubviews;
- (void)setDelegate:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
@end

@implementation SKTermsPageViewController

- (SKTermsPageViewController)init
{
  return [(SKTermsPageViewController *)self initWithTerms:0];
}

- (SKTermsPageViewController)initWithTerms:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)SKTermsPageViewController;
    v5 = [(SKTermsPageViewController *)&v10 init];
    v6 = v5;
    if (v5)
    {
      uint64_t v7 = [(SKTermsPageViewController *)v5 _markupTermsWithHTML:v4];
      terms = v6->_terms;
      v6->_terms = (NSString *)v7;
    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (unint64_t)edgesForExtendedLayout
{
  return 0;
}

- (void)viewDidLayoutSubviews
{
  v3 = [(SKTermsPageViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v36 = v7;
  -[UINavigationBar setFrame:](self->_navbar, "setFrame:", v5, v7, v9, v11);
  [(UINavigationBar *)self->_navbar sizeToFit];
  navbar = self->_navbar;
  if (navbar)
  {
    [(UINavigationBar *)navbar frame];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    CGFloat v20 = v19;
  }
  else
  {
    double v14 = *MEMORY[0x1E4F1DB28];
    double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat v20 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  v21 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v21 statusBarFrame];
  double Height = CGRectGetHeight(v39);
  v40.origin.x = v14;
  v40.origin.y = v16;
  v40.size.width = v18;
  v40.size.height = v20;
  double v23 = Height + CGRectGetHeight(v40);

  -[UINavigationBar setFrame:](self->_navbar, "setFrame:", v14, v16, v18, v23);
  -[UIToolbar setFrame:](self->_toolbar, "setFrame:", v5, v36, v9, v11);
  [(UIToolbar *)self->_toolbar sizeToFit];
  toolbar = self->_toolbar;
  if (toolbar)
  {
    [(UIToolbar *)toolbar frame];
    toolbar = self->_toolbar;
  }
  else
  {
    double v25 = *MEMORY[0x1E4F1DB28];
    double v26 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v27 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  -[UIToolbar setFrame:](toolbar, "setFrame:", v25, v11 - v27, v26);
  -[WKWebView setFrame:](self->_webview, "setFrame:", v5, v36, v9, v11);
  terms = self->_terms;
  if (terms)
  {
    webview = self->_webview;
    v30 = [MEMORY[0x1E4F28B50] mainBundle];
    v31 = [v30 resourceURL];
    id v32 = [(WKWebView *)webview loadHTMLString:terms baseURL:v31];
  }
  [(UINavigationBar *)self->_navbar frame];
  double v33 = CGRectGetHeight(v41);
  [(UIToolbar *)self->_toolbar frame];
  double v34 = CGRectGetHeight(v42);
  id v37 = [(WKWebView *)self->_webview scrollView];
  v43.origin.x = v5;
  v43.origin.y = v36;
  v43.size.width = v9;
  v43.size.height = v11;
  double Width = CGRectGetWidth(v43);
  v44.origin.x = v5;
  v44.origin.y = v36;
  v44.size.width = v9;
  v44.size.height = v11;
  objc_msgSend(v37, "setFrame:", v5, v33, Width, CGRectGetHeight(v44) - v33 - v34);
}

- (void)viewDidLoad
{
  v3 = [(SKTermsPageViewController *)self view];
  double v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v3 setBackgroundColor:v4];

  v5.receiver = self;
  v5.super_class = (Class)SKTermsPageViewController;
  [(SKTermsPageViewController *)&v5 viewDidLoad];
}

- (int64_t)positionForBar:(id)a3
{
  return 3;
}

- (void)_dismissViewController
{
}

- (void)_buttonAccept:(id)a3
{
  double v4 = (void *)MEMORY[0x1E4FB1418];
  objc_super v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v6 = [v5 localizedStringForKey:@"TERMS_AND_CONDITIONS" value:&stru_1F08A7B80 table:0];
  double v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v8 = [v7 localizedStringForKey:@"AGREE_TEXT" value:&stru_1F08A7B80 table:0];
  double v9 = [v4 alertControllerWithTitle:v6 message:v8 preferredStyle:1];

  double v10 = (void *)MEMORY[0x1E4FB1410];
  double v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"CANCEL" value:&stru_1F08A7B80 table:0];
  double v13 = [v10 actionWithTitle:v12 style:1 handler:0];
  [v9 addAction:v13];

  double v14 = (void *)MEMORY[0x1E4FB1410];
  double v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v16 = [v15 localizedStringForKey:@"AGREE" value:&stru_1F08A7B80 table:0];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __43__SKTermsPageViewController__buttonAccept___block_invoke;
  v18[3] = &unk_1E5FA9F68;
  v18[4] = self;
  double v17 = [v14 actionWithTitle:v16 style:0 handler:v18];
  [v9 addAction:v17];

  [(SKTermsPageViewController *)self presentViewController:v9 animated:1 completion:0];
}

uint64_t __43__SKTermsPageViewController__buttonAccept___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismissViewControllerAnimated:1 withAcceptance:1];
}

- (void)_buttonDecline:(id)a3
{
}

- (void)_dismissViewControllerAnimated:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60__SKTermsPageViewController__dismissViewControllerAnimated___block_invoke;
  v3[3] = &unk_1E5FA9A08;
  v3[4] = self;
  [(SKTermsPageViewController *)self dismissViewControllerAnimated:a3 completion:v3];
}

void __60__SKTermsPageViewController__dismissViewControllerAnimated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1008));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1008));
    [v4 termsPageViewControllerDidFinish:*(void *)(a1 + 32)];
  }
}

- (void)_dismissViewControllerAnimated:(BOOL)a3 withAcceptance:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__SKTermsPageViewController__dismissViewControllerAnimated_withAcceptance___block_invoke;
  v4[3] = &unk_1E5FA9F90;
  v4[4] = self;
  BOOL v5 = a4;
  [(SKTermsPageViewController *)self dismissViewControllerAnimated:a3 completion:v4];
}

void __75__SKTermsPageViewController__dismissViewControllerAnimated_withAcceptance___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1008));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1008));
    [v4 termsPageViewControllerDidFinish:*(void *)(a1 + 32) withAcceptance:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)_loadSubviews
{
  v35[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v8 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], v5, v6, v7);
  id v34 = objc_alloc_init(MEMORY[0x1E4F466F8]);
  double v9 = [v34 preferences];
  [v9 setTextInteractionEnabled:0];

  double v10 = (WKWebView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F466F0]), "initWithFrame:configuration:", v34, v4, v5, v6, v7);
  webview = self->_webview;
  self->_webview = v10;

  [(WKWebView *)self->_webview setNavigationDelegate:self];
  [(WKWebView *)self->_webview setAllowsLinkPreview:0];
  [(WKWebView *)self->_webview setOpaque:0];
  v12 = self->_webview;
  double v13 = [MEMORY[0x1E4FB1618] clearColor];
  [(WKWebView *)v12 setBackgroundColor:v13];

  double v14 = [(WKWebView *)self->_webview scrollView];
  [v14 _setShowsBackgroundShadow:0];

  [v8 addSubview:self->_webview];
  double v15 = (UINavigationBar *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB19D0]), "initWithFrame:", v4, v5, v6, v7);
  navbar = self->_navbar;
  self->_navbar = v15;

  id v17 = objc_alloc(MEMORY[0x1E4FB19F0]);
  double v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v19 = [v18 localizedStringForKey:@"TERMS_AND_CONDITIONS" value:&stru_1F08A7B80 table:0];
  double v33 = (void *)[v17 initWithTitle:v19];

  [(UINavigationBar *)self->_navbar pushNavigationItem:v33 animated:0];
  [v8 addSubview:self->_navbar];
  [(UINavigationBar *)self->_navbar setDelegate:self];
  CGFloat v20 = (UIToolbar *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1DF0]), "initWithFrame:", v4, v5, v6, v7);
  toolbar = self->_toolbar;
  self->_toolbar = v20;

  id v22 = objc_alloc(MEMORY[0x1E4FB14A8]);
  double v23 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v24 = [v23 localizedStringForKey:@"AGREE" value:&stru_1F08A7B80 table:0];
  double v25 = (void *)[v22 initWithTitle:v24 style:2 target:self action:sel__buttonAccept_];

  id v26 = objc_alloc(MEMORY[0x1E4FB14A8]);
  double v27 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v28 = [v27 localizedStringForKey:@"DISAGREE" value:&stru_1F08A7B80 table:0];
  v29 = (void *)[v26 initWithTitle:v28 style:0 target:self action:sel__buttonDecline_];

  v30 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
  v31 = self->_toolbar;
  v35[0] = v29;
  v35[1] = v30;
  v35[2] = v25;
  id v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:3];
  [(UIToolbar *)v31 setItems:v32];

  [(UIToolbar *)self->_toolbar setTranslucent:1];
  [v8 addSubview:self->_toolbar];
  [(SKTermsPageViewController *)self setView:v8];
}

- (id)_markupTermsWithHTML:(id)a3
{
  if (a3)
  {
    id v3 = NSString;
    id v4 = a3;
    double v5 = [v3 stringWithFormat:@"<style type=\"text/css\"> p.p1 {background-color: transparent color:#4C566C;text-shadow: white 0px 1px 1px; font-family: Helvetica; font-size: 9pt; } </style>"];;
    double v6 = [NSString stringWithFormat:@"<html><head>%@</head><body><p class=\"p1\">%@</p></body></html>", v5, v4];

    double v7 = [v6 stringByReplacingOccurrencesOfString:@"\n" withString:@"<br/>"];
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  double v6 = (void (**)(id, BOOL))a5;
  v6[2](v6, [a4 navigationType] != 0);
}

- (SKTermsPageViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKTermsPageViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_webview, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_terms, 0);

  objc_storeStrong((id *)&self->_navbar, 0);
}

@end