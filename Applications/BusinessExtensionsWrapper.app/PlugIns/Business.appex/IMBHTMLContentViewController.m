@interface IMBHTMLContentViewController
- (_TtC8Business28IMBHTMLContentViewController)initWithCoder:(id)a3;
- (void)shareButtonTapped:(id)a3;
- (void)viewDidLoad;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
@end

@implementation IMBHTMLContentViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100031040();
}

- (void)shareButtonTapped:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100033C48();
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_100033D6C(v10, (uint64_t)v11, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (_TtC8Business28IMBHTMLContentViewController)initWithCoder:(id)a3
{
  return (_TtC8Business28IMBHTMLContentViewController *)sub_100033868(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business28IMBHTMLContentViewController_scrollview));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business28IMBHTMLContentViewController_footerToolbar));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business28IMBHTMLContentViewController_toolbarBorder));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business28IMBHTMLContentViewController_shareButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business28IMBHTMLContentViewController_webview));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business28IMBHTMLContentViewController_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business28IMBHTMLContentViewController_contentHeaderView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business28IMBHTMLContentViewController_webviewHeightConstraint));

  swift_release();
}

@end