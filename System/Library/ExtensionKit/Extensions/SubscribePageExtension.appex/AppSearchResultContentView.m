@interface AppSearchResultContentView
- (_TtC22SubscribePageExtension21SmallSearchLockupView)accessibilityLockupView;
- (_TtC22SubscribePageExtension26AppSearchResultContentView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension26AppSearchResultContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AppSearchResultContentView

- (_TtC22SubscribePageExtension26AppSearchResultContentView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension26AppSearchResultContentView *)sub_100558C70(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension26AppSearchResultContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10055CAF8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100558FE4();
}

- (_TtC22SubscribePageExtension21SmallSearchLockupView)accessibilityLockupView
{
  return (_TtC22SubscribePageExtension21SmallSearchLockupView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension26AppSearchResultContentView_lockupView);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension26AppSearchResultContentView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension26AppSearchResultContentView_screenshots));
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtension26AppSearchResultContentView_impressionsUpdateBlock);

  sub_10001A4D0(v3);
}

@end