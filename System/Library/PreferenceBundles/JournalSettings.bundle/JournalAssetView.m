@interface JournalAssetView
- (_TtC15JournalSettings16JournalAssetView)initWithCoder:(id)a3;
- (_TtC15JournalSettings16JournalAssetView)initWithFrame:(CGRect)a3;
@end

@implementation JournalAssetView

- (_TtC15JournalSettings16JournalAssetView)initWithFrame:(CGRect)a3
{
  return (_TtC15JournalSettings16JournalAssetView *)sub_D223C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15JournalSettings16JournalAssetView)initWithCoder:(id)a3
{
  return (_TtC15JournalSettings16JournalAssetView *)sub_D2350(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15JournalSettings16JournalAssetView_fallbackView));
  v3 = (char *)self + OBJC_IVAR____TtC15JournalSettings16JournalAssetView_loadingDelegate;

  sub_118B0((uint64_t)v3);
}

@end