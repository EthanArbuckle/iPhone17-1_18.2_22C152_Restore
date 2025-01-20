@interface BaseWebView.Controller
- (_TtCV8FeedbackP33_A8ABDB21747C1062E707FA1890A6718D11BaseWebView10Controller)init;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
@end

@implementation BaseWebView.Controller

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  v9 = (void *)sub_23D005918();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v8;
  *(void *)(v10 + 24) = v6;
  v14[4] = sub_23CF312B0;
  v14[5] = v10;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 1107296256;
  v14[2] = sub_23CF30910;
  v14[3] = &block_descriptor_1;
  v11 = _Block_copy(v14);
  id v12 = v6;
  v13 = v8;
  swift_release();
  objc_msgSend(v12, sel_evaluateJavaScript_completionHandler_, v9, v11);
  _Block_release(v11);
}

- (_TtCV8FeedbackP33_A8ABDB21747C1062E707FA1890A6718D11BaseWebView10Controller)init
{
  v3 = (char *)self + OBJC_IVAR____TtCV8FeedbackP33_A8ABDB21747C1062E707FA1890A6718D11BaseWebView10Controller_parent;
  v4 = (objc_class *)type metadata accessor for BaseWebView.Controller();
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((_OWORD *)v3 + 2) = 0u;
  *((_OWORD *)v3 + 3) = 0u;
  *((void *)v3 + 8) = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(BaseWebView.Controller *)&v6 init];
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtCV8FeedbackP33_A8ABDB21747C1062E707FA1890A6718D11BaseWebView10Controller_parent;
  sub_23CF3188C(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtCV8FeedbackP33_A8ABDB21747C1062E707FA1890A6718D11BaseWebView10Controller_parent), *((void *)v2 + 1), *((void *)v2 + 2), *((void *)v2 + 3), *((void *)v2 + 4), *((void *)v2 + 5), *((void *)v2 + 6), *((void *)v2 + 7), *((void **)v2 + 8));
}

@end