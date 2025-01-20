@interface WebViewButton
- (BOOL)isHighlighted;
- (_TtC11AssetViewer13WebViewButton)initWithCoder:(id)a3;
- (_TtC11AssetViewer13WebViewButton)initWithFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
- (void)webViewWebContentProcessDidTerminate:(id)a3;
@end

@implementation WebViewButton

- (_TtC11AssetViewer13WebViewButton)initWithFrame:(CGRect)a3
{
  return (_TtC11AssetViewer13WebViewButton *)sub_1E298FB14(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11AssetViewer13WebViewButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E2990230();
}

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for WebViewButton();
  return [(WebViewButton *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for WebViewButton();
  v4 = (char *)v5.receiver;
  [(WebViewButton *)&v5 setHighlighted:v3];
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC11AssetViewer13WebViewButton_highlightedOverlayView], sel_setHidden_, objc_msgSend(v4, sel_isHighlighted, v5.receiver, v5.super_class) ^ 1);
}

- (void).cxx_destruct
{
  sub_1E287427C(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC11AssetViewer13WebViewButton_completionHandler));

  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11AssetViewer13WebViewButton_highlightedOverlayView);
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1E2990358(MEMORY[0x1E4FBD390], "webView:didFinish", 1);
}

- (void)webViewWebContentProcessDidTerminate:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_1E2990358(MEMORY[0x1E4FBD380], "webViewWebContentProcessDidTerminate:", 0);
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v11 = a5;
  v10 = self;
  sub_1E29904A4(v11, "webView:didFail:withError:%s");
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v11 = a5;
  v10 = self;
  sub_1E29904A4(v11, "webView:didFailProvisionalNavigation:withError:%s");
}

@end