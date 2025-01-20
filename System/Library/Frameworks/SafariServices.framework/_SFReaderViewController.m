@interface _SFReaderViewController
- (SFReaderViewControllerDelegate)delegate;
- (_SFReaderViewController)initWithOriginalWebView:(id)a3;
- (void)_webView:(id)a3 contextMenuConfigurationForElement:(id)a4 completionHandler:(id)a5;
- (void)_webView:(id)a3 contextMenuDidEndForElement:(id)a4;
- (void)_webView:(id)a3 contextMenuForElement:(id)a4 willCommitWithAnimator:(id)a5;
- (void)_webView:(id)a3 contextMenuWillPresentForElement:(id)a4;
- (void)loadView;
- (void)setDelegate:(id)a3;
@end

@implementation _SFReaderViewController

- (_SFReaderViewController)initWithOriginalWebView:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFReaderViewController;
  v5 = [(_SFReaderViewController *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_originalWebView, v4);
    v7 = v6;
  }

  return v6;
}

- (void)loadView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originalWebView);
  id v3 = objc_alloc_init(MEMORY[0x1E4F466F8]);
  id v4 = [WeakRetained configuration];
  v5 = [v4 processPool];
  [v3 setProcessPool:v5];

  [v3 _setRelatedWebView:WeakRetained];
  [v3 _setAlternateWebViewForNavigationGestures:WeakRetained];
  [v3 _setGroupIdentifier:@"Reader"];
  v6 = [WeakRetained configuration];
  v7 = [v6 websiteDataStore];
  [v3 setWebsiteDataStore:v7];

  [v3 setAllowsPictureInPictureMediaPlayback:0];
  v8 = _SFApplicationNameForUserAgent();
  [v3 setApplicationNameForUserAgent:v8];

  [v3 _setNeedsStorageAccessFromFileURLsQuirk:0];
  objc_super v9 = objc_msgSend(MEMORY[0x1E4F466A0], "safari_readerUserContentController");
  [v3 setUserContentController:v9];

  v10 = [_SFWebView alloc];
  [WeakRetained frame];
  v11 = -[_SFWebView initWithFrame:configuration:](v10, "initWithFrame:configuration:", v3);
  if (objc_opt_respondsToSelector()) {
    [(_SFWebView *)v11 _grantAccessToAssetServices];
  }
  [(_SFWebView *)v11 _setBackgroundExtendsBeyondPage:1];
  [(_SFWebView *)v11 setAllowsLinkPreview:1];
  [(_SFWebView *)v11 setAutoresizingMask:18];
  [(_SFWebView *)v11 setUIDelegate:self];
  [(_SFWebView *)v11 setInspectable:1];
  [(_SFReaderViewController *)self setView:v11];
}

- (void)_webView:(id)a3 contextMenuConfigurationForElement:(id)a4 completionHandler:(id)a5
{
  id v10 = a4;
  v7 = (void (**)(id, void))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_super v9 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained contextMenuConfigurationForReaderViewController:self element:v10 completionHandler:v7];
  }
  else {
    v7[2](v7, 0);
  }
}

- (void)_webView:(id)a3 contextMenuWillPresentForElement:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained readerViewController:self contextMenuWillPresentForElement:v6];
}

- (void)_webView:(id)a3 contextMenuForElement:(id)a4 willCommitWithAnimator:(id)a5
{
  p_delegate = &self->_delegate;
  id v8 = a5;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained readerViewController:self contextMenuForElement:v9 willCommitWithAnimator:v8];
}

- (void)_webView:(id)a3 contextMenuDidEndForElement:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained readerViewController:self contextMenuDidEndForElement:v6];
}

- (SFReaderViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFReaderViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_originalWebView);
}

@end