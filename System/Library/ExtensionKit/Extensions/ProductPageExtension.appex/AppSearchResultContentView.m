@interface AppSearchResultContentView
- (_TtC20ProductPageExtension21SmallSearchLockupView)accessibilityLockupView;
- (_TtC20ProductPageExtension26AppSearchResultContentView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension26AppSearchResultContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AppSearchResultContentView

- (_TtC20ProductPageExtension26AppSearchResultContentView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension26AppSearchResultContentView *)sub_1005709F0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension26AppSearchResultContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100574878();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100570D64();
}

- (_TtC20ProductPageExtension21SmallSearchLockupView)accessibilityLockupView
{
  return (_TtC20ProductPageExtension21SmallSearchLockupView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension26AppSearchResultContentView_lockupView);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension26AppSearchResultContentView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension26AppSearchResultContentView_screenshots));
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC20ProductPageExtension26AppSearchResultContentView_impressionsUpdateBlock);

  sub_1000194B0(v3);
}

@end