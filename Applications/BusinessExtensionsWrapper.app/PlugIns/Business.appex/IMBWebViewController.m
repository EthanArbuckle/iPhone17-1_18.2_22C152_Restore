@interface IMBWebViewController
- (_TtC8Business20IMBWebViewController)initWithCallbackURI:(id)a3;
- (_TtC8Business20IMBWebViewController)initWithCoder:(id)a3;
- (_TtC8Business20IMBWebViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadURL:(id)a3;
- (void)setupConstraints;
- (void)setupSubviews;
- (void)updateNavigationBar;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
@end

@implementation IMBWebViewController

- (_TtC8Business20IMBWebViewController)initWithCallbackURI:(id)a3
{
  return (_TtC8Business20IMBWebViewController *)sub_10007DC0C();
}

- (_TtC8Business20IMBWebViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10007F510();
}

- (void)loadURL:(id)a3
{
  uint64_t v4 = sub_1000BB138();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000BB0F8();
  v9 = self;
  sub_1000BB0C8(v10);
  v12 = v11;
  v13 = (objc_class *)type metadata accessor for IMBWebViewController();
  v14.receiver = v9;
  v14.super_class = v13;
  [(IMBWebViewController *)&v14 loadURL:v12];

  sub_10007DE90();
  [(IMBWebViewController *)v9 updateNavigationBar];

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void)setupSubviews
{
  v2 = self;
  sub_10007E134();
}

- (void)setupConstraints
{
  v2 = self;
  sub_10007E3C4();
}

- (void)updateNavigationBar
{
  v2 = self;
  sub_10007F0FC();
}

- (_TtC8Business20IMBWebViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8Business20IMBWebViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(void **)&self->BCWebViewController_opaque[OBJC_IVAR____TtC8Business20IMBWebViewController_titleViewHeightConstraint];
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10007F5E8(v6);
}

@end