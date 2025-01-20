@interface PrintableHTMLContentController
- (_TtC15JournalSettings30PrintableHTMLContentController)init;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
@end

@implementation PrintableHTMLContentController

- (_TtC15JournalSettings30PrintableHTMLContentController)init
{
  return (_TtC15JournalSettings30PrintableHTMLContentController *)sub_BBD04();
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_BCEAC(v6);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15JournalSettings30PrintableHTMLContentController_webView));
  v3 = (char *)self + OBJC_IVAR____TtC15JournalSettings30PrintableHTMLContentController_continuation;

  sub_BD138((uint64_t)v3);
}

@end