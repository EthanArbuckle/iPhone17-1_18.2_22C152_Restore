@interface HUInlineWebContainerView
- (BOOL)webView:(id)a3 shouldPreviewElement:(id)a4;
- (HUInlineWebContainerView)initWithFrame:(CGRect)a3;
- (HUInlineWebContainerViewDelegate)delegate;
- (NSString)HTMLContent;
- (UIFont)font;
- (WKUserContentController)contentController;
- (WKWebView)webView;
- (double)estimatedHeight;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setEstimatedHeight:(double)a3;
- (void)setFont:(id)a3;
- (void)setHTMLContent:(id)a3;
- (void)setUserStyleSheet;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
@end

@implementation HUInlineWebContainerView

- (HUInlineWebContainerView)initWithFrame:(CGRect)a3
{
  v32.receiver = self;
  v32.super_class = (Class)HUInlineWebContainerView;
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v7 = -[HUInlineWebContainerView initWithFrame:](&v32, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v4, v5, v6);
  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F466F8]);
    [v8 setDataDetectorTypes:0];
    uint64_t v9 = objc_opt_new();
    contentController = v7->_contentController;
    v7->_contentController = (WKUserContentController *)v9;

    v11 = [(HUInlineWebContainerView *)v7 contentController];
    [v8 setUserContentController:v11];

    uint64_t v12 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43880]];
    font = v7->_font;
    v7->_font = (UIFont *)v12;

    [(HUInlineWebContainerView *)v7 setUserStyleSheet];
    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F466F0]), "initWithFrame:configuration:", v8, v3, v4, v5, v6);
    webView = v7->_webView;
    v7->_webView = (WKWebView *)v14;

    v16 = [(HUInlineWebContainerView *)v7 webView];
    [v16 setUIDelegate:v7];

    v17 = [(HUInlineWebContainerView *)v7 webView];
    [v17 setNavigationDelegate:v7];

    v18 = [(HUInlineWebContainerView *)v7 webView];
    v19 = [MEMORY[0x1E4F428B8] clearColor];
    [v18 setBackgroundColor:v19];

    v20 = [(HUInlineWebContainerView *)v7 webView];
    [v20 setOpaque:0];

    v21 = [(HUInlineWebContainerView *)v7 webView];
    [v21 setAutoresizesSubviews:0];

    v22 = [(HUInlineWebContainerView *)v7 webView];
    v23 = [v22 scrollView];
    [v23 _setShowsBackgroundShadow:0];

    v24 = [(HUInlineWebContainerView *)v7 webView];
    v25 = [v24 scrollView];
    [v25 setBounces:0];

    v26 = [(HUInlineWebContainerView *)v7 webView];
    v27 = [v26 scrollView];
    [v27 setZoomEnabled:0];

    v28 = [(HUInlineWebContainerView *)v7 webView];
    v29 = [v28 scrollView];
    [v29 setScrollEnabled:0];

    [(HUInlineWebContainerView *)v7 setClipsToBounds:1];
    v30 = [(HUInlineWebContainerView *)v7 webView];
    [(HUInlineWebContainerView *)v7 addSubview:v30];

    [(HUInlineWebContainerView *)v7 setEstimatedHeight:0.0];
  }
  return v7;
}

- (void)setUserStyleSheet
{
  id v3 = [NSString alloc];
  double v4 = [(HUInlineWebContainerView *)self font];
  double v5 = [v4 markupDescription];
  double v6 = [MEMORY[0x1E4F428B8] tableCellBlueTextColor];
  v7 = [v6 styleString];
  id v10 = (id)objc_msgSend(v3, "initWithFormat:", @"var styleTag = document.createElement('style');styleTag.textContent ='   body {       %@;   }   :root {       color-scheme: light dark;   }   a {       text-decoration: none;       color: %@;   }';document.documentElement.appendChild(styleTag);",
              v5,
              v7);

  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F466A8]) initWithSource:v10 injectionTime:0 forMainFrameOnly:0];
  uint64_t v9 = [(HUInlineWebContainerView *)self contentController];
  [v9 addUserScript:v8];
}

- (void)setFont:(id)a3
{
  id v5 = a3;
  font = self->_font;
  id v10 = (UIFont *)v5;
  v7 = font;
  if (v7 == v10)
  {

    goto LABEL_8;
  }
  if (!v10)
  {

    goto LABEL_7;
  }
  char v8 = [(UIFont *)v10 isEqual:v7];

  if ((v8 & 1) == 0)
  {
LABEL_7:
    objc_storeStrong((id *)&self->_font, a3);
    uint64_t v9 = [(HUInlineWebContainerView *)self contentController];
    [v9 removeAllUserScripts];

    [(HUInlineWebContainerView *)self setUserStyleSheet];
  }
LABEL_8:
}

- (void)setHTMLContent:(id)a3
{
  id v4 = a3;
  HTMLContent = self->_HTMLContent;
  v16 = (NSString *)v4;
  double v6 = HTMLContent;
  if (v6 == v16)
  {

    char v8 = v16;
LABEL_11:

    goto LABEL_12;
  }
  if (!v16)
  {

    goto LABEL_7;
  }
  char v7 = [(NSString *)v16 isEqual:v6];

  if ((v7 & 1) == 0)
  {
LABEL_7:
    uint64_t v9 = (NSString *)[(NSString *)v16 copy];
    id v10 = self->_HTMLContent;
    self->_HTMLContent = v9;

    if (!self->_HTMLContent) {
      goto LABEL_12;
    }
    uint64_t v11 = [(HUInlineWebContainerView *)self semanticContentAttribute];
    uint64_t v12 = [(HUInlineWebContainerView *)self webView];
    char v8 = v12;
    if (v11 == 4)
    {
      v13 = [NSString stringWithFormat:@"<div dir='rtl'>%@<div>", self->_HTMLContent];
      id v14 = (id)[(NSString *)v8 loadHTMLString:v13 baseURL:0];
    }
    else
    {
      id v15 = (id)[(NSString *)v12 loadHTMLString:self->_HTMLContent baseURL:0];
    }
    goto LABEL_11;
  }
LABEL_12:
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)HUInlineWebContainerView;
  [(HUInlineWebContainerView *)&v6 layoutSubviews];
  id v3 = [(HUInlineWebContainerView *)self webView];
  [(HUInlineWebContainerView *)self bounds];
  objc_msgSend(v3, "setFrame:");

  id v4 = [(HUInlineWebContainerView *)self webView];
  [v4 _setLayoutMode:0];

  id v5 = [(HUInlineWebContainerView *)self webView];
  [v5 layoutSubviews];
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v12 = a4;
  objc_super v6 = (void (**)(id, uint64_t))a5;
  if ([v12 navigationType])
  {
    uint64_t v7 = 1;
  }
  else
  {
    char v8 = [MEMORY[0x1E4F69378] sharedInstance];
    uint64_t v9 = [v12 request];
    id v10 = [v9 URL];
    id v11 = (id)[v8 openURL:v10];

    uint64_t v7 = 0;
  }
  v6[2](v6, v7);
}

- (BOOL)webView:(id)a3 shouldPreviewElement:(id)a4
{
  return 0;
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v5 = [(HUInlineWebContainerView *)self webView];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__HUInlineWebContainerView_webView_didFinishNavigation___block_invoke;
  v6[3] = &unk_1E63850B8;
  v6[4] = self;
  [v5 evaluateJavaScript:@"document.body.offsetHeight" completionHandler:v6];
}

void __56__HUInlineWebContainerView_webView_didFinishNavigation___block_invoke(uint64_t a1, void *a2)
{
  [a2 floatValue];
  if (v3 != 0.0)
  {
    double v4 = v3;
    [*(id *)(a1 + 32) estimatedHeight];
    if (v5 != v4)
    {
      [*(id *)(a1 + 32) setEstimatedHeight:v4];
      objc_super v6 = [*(id *)(a1 + 32) delegate];
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        id v8 = [*(id *)(a1 + 32) delegate];
        [v8 inlineWebContainerViewDidFinishLoadingContent:*(void *)(a1 + 32)];
      }
    }
  }
}

- (WKWebView)webView
{
  return self->_webView;
}

- (NSString)HTMLContent
{
  return self->_HTMLContent;
}

- (UIFont)font
{
  return self->_font;
}

- (HUInlineWebContainerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUInlineWebContainerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)estimatedHeight
{
  return self->_estimatedHeight;
}

- (void)setEstimatedHeight:(double)a3
{
  self->_estimatedHeight = a3;
}

- (WKUserContentController)contentController
{
  return self->_contentController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_HTMLContent, 0);

  objc_storeStrong((id *)&self->_webView, 0);
}

@end