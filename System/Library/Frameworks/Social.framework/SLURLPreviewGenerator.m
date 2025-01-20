@interface SLURLPreviewGenerator
- (BOOL)webView:(id)a3 shouldStartLoadWithRequest:(id)a4 navigationType:(int64_t)a5;
- (SLURLPreviewGenerator)initWithFrame:(CGRect)a3;
- (UIWebView)webView;
- (void)_callCompletionWithPreview:(id)a3;
- (void)dealloc;
- (void)loadURL:(id)a3 completion:(id)a4;
- (void)setWebView:(id)a3;
- (void)uiWebView:(id)a3 decidePolicyForGeolocationRequestFromOrigin:(id)a4 frame:(id)a5 listener:(id)a6;
- (void)webView:(id)a3 didFailLoadWithError:(id)a4;
- (void)webViewDidFinishLoad:(id)a3;
@end

@implementation SLURLPreviewGenerator

- (SLURLPreviewGenerator)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  _SLLog(v3, 7, @"SLURLPreviewGenerator %@ initWithFrame: %g %g %g %g");
  v17.receiver = self;
  v17.super_class = (Class)SLURLPreviewGenerator;
  v9 = [(SLURLPreviewGenerator *)&v17 init];
  if (v9)
  {
    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F43050]), "initWithFrame:", x, y, width, height);
    webView = v9->_webView;
    v9->_webView = (UIWebView *)v10;

    [(UIWebView *)v9->_webView setAllowsInlineMediaPlayback:0];
    [(UIWebView *)v9->_webView setMediaPlaybackRequiresUserAction:1];
    [(UIWebView *)v9->_webView setMediaPlaybackAllowsAirPlay:0];
    [(UIWebView *)v9->_webView setSuppressesIncrementalRendering:1];
    [(UIWebView *)v9->_webView setScalesPageToFit:1];
    [(UIWebView *)v9->_webView setDelegate:v9];
    v12 = [(UIWebView *)v9->_webView _browserView];
    v13 = [v12 webView];

    [v13 setUIDelegate:v9];
  }
  return v9;
}

- (void)dealloc
{
  v4 = self;
  _SLLog(v2, 7, @"SLURLPreviewGenerator %@ dealloc");
  if (self->_completion) {
    -[SLURLPreviewGenerator _callCompletionWithPreview:](self, "_callCompletionWithPreview:", 0, v4);
  }
  -[UIWebView setDelegate:](self->_webView, "setDelegate:", 0, v4);
  [(UIWebView *)self->_webView stopLoading];
  v5.receiver = self;
  v5.super_class = (Class)SLURLPreviewGenerator;
  [(SLURLPreviewGenerator *)&v5 dealloc];
}

- (void)_callCompletionWithPreview:(id)a3
{
  id v8 = a3;
  _SLLog(v3, 7, @"SLURLPreviewGenerator %@ _callCompletionWithPreview: %@");
  v7 = (void *)MEMORY[0x1C876A6A0](self->_completion);
  _SLLog(v3, 7, @"_completion %@");

  completion = (void (**)(id, id))self->_completion;
  if (completion)
  {
    completion[2](completion, v8);
    id v6 = self->_completion;
    self->_completion = 0;
  }
}

- (void)loadURL:(id)a3 completion:(id)a4
{
  id v15 = a3;
  id v7 = a4;
  _SLLog(v4, 7, @"SLURLPreviewGenerator %@ loadURL:completion: with %@");
  if (!objc_msgSend(v15, "loadingInUIWebViewWillLaunchAnotherApp", self, v15))
  {
    id v8 = [v15 scheme];
    if ([v8 isEqualToString:@"http"])
    {
    }
    else
    {
      v9 = [v15 scheme];
      int v10 = [v9 isEqualToString:@"https"];

      if (!v10)
      {
        v14 = [v15 scheme];
        _SLLog(v4, 7, @"SLURLPreviewGenerator not loading a preview for url with unsupported scheme '%@'.");

        goto LABEL_8;
      }
    }
    v11 = (void *)[v7 copy];
    id completion = self->_completion;
    self->_id completion = v11;

    v13 = (void *)[objc_alloc(MEMORY[0x1E4F28E88]) initWithURL:v15];
    [v13 setHTTPShouldHandleCookies:0];
    [(UIWebView *)self->_webView loadRequest:v13];

    goto LABEL_9;
  }
  _SLLog(v4, 7, @"SLURLPreviewGenerator not loading a preview that would launch another app.");
LABEL_8:
  (*((void (**)(id, void))v7 + 2))(v7, 0);
LABEL_9:
}

- (BOOL)webView:(id)a3 shouldStartLoadWithRequest:(id)a4 navigationType:(int64_t)a5
{
  id v8 = a4;
  _SLLog(v5, 7, @"SLURLPreviewGenerator %@ shouldStartLoadWithRequest: %@ navigationType: %d");
  v9 = objc_msgSend(v8, "URL", self, v8, a5);

  int v10 = [v9 loadingInUIWebViewWillLaunchAnotherApp];
  if (v10)
  {
    _SLLog(v5, 7, @"SLURLPreviewGenerator not loading a preview that would launch another app.");
    [(SLURLPreviewGenerator *)self _callCompletionWithPreview:0];
  }
  return v10 ^ 1;
}

- (void)webViewDidFinishLoad:(id)a3
{
  uint64_t v8 = [(UIWebView *)self->_webView isLoading];
  _SLLog(v3, 7, @"SLURLPreviewGenerator %@ webViewDidFinishLoad: still loading %d");
  if (![(UIWebView *)self->_webView isLoading] && self->_completion)
  {
    webView = self->_webView;
    [(UIWebView *)webView frame];
    id v6 = (CGImage *)-[UIWebView newSnapshotWithRect:](webView, "newSnapshotWithRect:");
    _SLLog(v3, 7, @"SLURLPreviewGenerator %@ generated cgImage %p");
    id v7 = objc_msgSend(MEMORY[0x1E4F42A80], "imageWithCGImage:", v6, self, v6);
    [(SLURLPreviewGenerator *)self _callCompletionWithPreview:v7];

    CGImageRelease(v6);
  }
}

- (void)webView:(id)a3 didFailLoadWithError:(id)a4
{
  webView = self->_webView;
  id v7 = a4;
  uint64_t v8 = [(UIWebView *)webView isLoading];
  _SLLog(v4, 7, @"SLURLPreviewGenerator %@ webView:didFailLoadWithError: %@ still loading %d");

  if (![(UIWebView *)self->_webView isLoading])
  {
    [(SLURLPreviewGenerator *)self _callCompletionWithPreview:0];
  }
}

- (void)uiWebView:(id)a3 decidePolicyForGeolocationRequestFromOrigin:(id)a4 frame:(id)a5 listener:(id)a6
{
  id v7 = a6;
  id v6 = v7;
  WebThreadRun();
}

uint64_t __94__SLURLPreviewGenerator_uiWebView_decidePolicyForGeolocationRequestFromOrigin_frame_listener___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deny];
}

- (UIWebView)webView
{
  return (UIWebView *)objc_getProperty(self, a2, 16, 1);
}

- (void)setWebView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webView, 0);

  objc_storeStrong(&self->_completion, 0);
}

@end