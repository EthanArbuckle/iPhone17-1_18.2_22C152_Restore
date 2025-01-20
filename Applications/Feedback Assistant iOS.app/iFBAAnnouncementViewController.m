@interface iFBAAnnouncementViewController
- (FBKAnnouncement)announcement;
- (FBKContentItem)contentItem;
- (WKWebView)webView;
- (iFBAAnnouncementViewController)initWithCoder:(id)a3;
- (void)markAnnouncementRead;
- (void)setAnnouncement:(id)a3;
- (void)setContentItem:(id)a3;
- (void)setWebView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateTitle;
- (void)updateWebView;
- (void)viewDidLoad;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didCommitNavigation:(id)a4;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
@end

@implementation iFBAAnnouncementViewController

- (iFBAAnnouncementViewController)initWithCoder:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)iFBAAnnouncementViewController;
  v3 = [(iFBAAnnouncementViewController *)&v14 initWithCoder:a3];
  if (v3)
  {
    id v4 = objc_alloc_init((Class)WKWebViewConfiguration);
    [v4 setSelectionGranularity:1];
    [v4 _setColorFilterEnabled:1];
    id v5 = [objc_alloc((Class)WKWebView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    [(iFBAAnnouncementViewController *)v3 setWebView:v5];

    v6 = [(iFBAAnnouncementViewController *)v3 webView];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

    v7 = [(iFBAAnnouncementViewController *)v3 webView];
    [v7 setNavigationDelegate:v3];

    v8 = +[UIColor systemBackgroundColor];
    v9 = [(iFBAAnnouncementViewController *)v3 webView];
    [v9 setBackgroundColor:v8];

    v10 = +[UIColor systemBackgroundColor];
    v11 = [(iFBAAnnouncementViewController *)v3 webView];
    v12 = [v11 scrollView];
    [v12 setBackgroundColor:v10];
  }
  return v3;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)iFBAAnnouncementViewController;
  [(iFBAAnnouncementViewController *)&v8 viewDidLoad];
  v3 = +[UIColor systemBackgroundColor];
  id v4 = [(iFBAAnnouncementViewController *)self view];
  [v4 setBackgroundColor:v3];

  id v5 = [(iFBAAnnouncementViewController *)self navigationItem];
  [v5 setLargeTitleDisplayMode:2];

  v6 = [(iFBAAnnouncementViewController *)self view];
  v7 = [(iFBAAnnouncementViewController *)self webView];
  [v6 addSubview:v7];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = [a3 preferredContentSizeCategory];
  id v5 = [(iFBAAnnouncementViewController *)self traitCollection];
  v6 = [v5 preferredContentSizeCategory];

  if (v4 != v6)
  {
    [(iFBAAnnouncementViewController *)self updateWebView];
  }
}

- (void)setContentItem:(id)a3
{
  id v5 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100032530;
  v12[3] = &unk_1000F2518;
  v12[4] = self;
  v6 = objc_retainBlock(v12);
  objc_storeStrong((id *)&self->_contentItem, a3);
  v7 = [(iFBAAnnouncementViewController *)self contentItem];

  if (v7)
  {
    objc_super v8 = +[FBKData sharedInstance];
    v9 = [(iFBAAnnouncementViewController *)self contentItem];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10003256C;
    v10[3] = &unk_1000F3780;
    v10[4] = self;
    v11 = v6;
    [v8 refreshAnnouncementFromContentItem:v9 completion:v10];
  }
  else
  {
    ((void (*)(void *))v6[2])(v6);
  }
}

- (void)updateTitle
{
  v3 = [(iFBAAnnouncementViewController *)self announcement];

  if (v3)
  {
    id v6 = [(iFBAAnnouncementViewController *)self announcement];
    id v4 = [v6 title];
    id v5 = [(iFBAAnnouncementViewController *)self navigationItem];
    [v5 setTitle:v4];
  }
  else
  {
    id v6 = [(iFBAAnnouncementViewController *)self navigationItem];
    [v6 setTitle:&stru_1000F6658];
  }
}

- (void)updateWebView
{
  uint64_t v3 = [(iFBAAnnouncementViewController *)self announcement];
  if (v3
    && (id v4 = (void *)v3,
        [(iFBAAnnouncementViewController *)self announcement],
        id v5 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v6 = [v5 isStub],
        v5,
        v4,
        (v6 & 1) == 0))
  {
    v10 = [(iFBAAnnouncementViewController *)self announcement];
    v11 = [v10 fullHTMLContent];

    if (v11)
    {
      v12 = [(iFBAAnnouncementViewController *)self announcement];
      v15 = [v12 fullHTMLContent];
    }
    else
    {
      v15 = &stru_1000F6658;
    }
    objc_super v8 = [(iFBAAnnouncementViewController *)self webView];
    v13 = +[iFBAConstants appleSeedURL];
    id v14 = [v8 loadHTMLString:v15 baseURL:v13];
  }
  else
  {
    v7 = +[NSURL URLWithString:@"about://blank"];
    v15 = +[NSURLRequest requestWithURL:v7];

    objc_super v8 = [(iFBAAnnouncementViewController *)self webView];
    id v9 = [v8 loadRequest:v15];
  }
}

- (void)markAnnouncementRead
{
  uint64_t v3 = [(iFBAAnnouncementViewController *)self announcement];
  if (v3)
  {
    id v9 = (id)v3;
    uint64_t v4 = [(iFBAAnnouncementViewController *)self contentItem];
    if (v4)
    {
      id v5 = (void *)v4;
      unsigned __int8 v6 = [(iFBAAnnouncementViewController *)self contentItem];
      unsigned int v7 = [v6 unread];

      if (!v7) {
        return;
      }
      id v9 = +[FBKData sharedInstance];
      objc_super v8 = [(iFBAAnnouncementViewController *)self announcement];
      [v9 markAnnouncementRead:v8 completion:0];
    }
  }
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v21 = [(iFBAAnnouncementViewController *)self view];
  id v5 = [v21 leadingAnchor];
  unsigned __int8 v6 = [(iFBAAnnouncementViewController *)self webView];
  unsigned int v7 = [v6 leadingAnchor];
  objc_super v8 = [v5 constraintEqualToAnchor:v7];
  [v8 setActive:1];

  id v9 = [v21 trailingAnchor];
  v10 = [(iFBAAnnouncementViewController *)self webView];
  v11 = [v10 trailingAnchor];
  v12 = [v9 constraintEqualToAnchor:v11];
  [v12 setActive:1];

  v13 = [v21 topAnchor];
  id v14 = [(iFBAAnnouncementViewController *)self webView];
  v15 = [v14 topAnchor];
  v16 = [v13 constraintEqualToAnchor:v15];
  [v16 setActive:1];

  v17 = [v21 bottomAnchor];
  v18 = [(iFBAAnnouncementViewController *)self webView];
  v19 = [v18 bottomAnchor];
  v20 = [v17 constraintEqualToAnchor:v19];
  [v20 setActive:1];
}

- (void)webView:(id)a3 didCommitNavigation:(id)a4
{
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v12 = a4;
  unsigned __int8 v6 = a5;
  id v7 = [v12 navigationType];
  objc_super v8 = (void (*)(void *, uint64_t))v6[2];
  if (v7 == (id)-1)
  {
    v8(v6, 1);
  }
  else
  {
    v8(v6, 0);

    id v9 = [v12 request];
    unsigned __int8 v6 = [v9 URL];

    v10 = +[UIApplication sharedApplication];
    v11 = v10;
    if (v6 && [v10 canOpenURL:v6]) {
      [v11 openURL:v6 options:&__NSDictionary0__struct completionHandler:0];
    }
  }
}

- (FBKContentItem)contentItem
{
  return self->_contentItem;
}

- (FBKAnnouncement)announcement
{
  return self->_announcement;
}

- (void)setAnnouncement:(id)a3
{
}

- (WKWebView)webView
{
  return (WKWebView *)objc_getProperty(self, a2, 24, 1);
}

- (void)setWebView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_announcement, 0);

  objc_storeStrong((id *)&self->_contentItem, 0);
}

@end