@interface WebHostingView.Coordinator
- (_TtCV11ActionKitUIP33_95B3E30599CAF9D678AD3209E5191A0514WebHostingView11Coordinator)init;
- (void)webView:(WKWebView *)a3 decidePolicyForNavigationAction:(WKNavigationAction *)a4 decisionHandler:(id)a5;
@end

@implementation WebHostingView.Coordinator

- (void)webView:(WKWebView *)a3 decidePolicyForNavigationAction:(WKNavigationAction *)a4 decisionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_22BF0E974((uint64_t)&unk_268491AC0, (uint64_t)v9);
}

- (_TtCV11ActionKitUIP33_95B3E30599CAF9D678AD3209E5191A0514WebHostingView11Coordinator)init
{
}

- (void).cxx_destruct
{
}

@end