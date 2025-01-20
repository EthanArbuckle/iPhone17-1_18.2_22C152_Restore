@interface AdvertsSearchResultContentView
- (_TtC22SubscribePageExtension21SmallSearchLockupView)accessibilityLockupView;
- (_TtC22SubscribePageExtension30AdvertsSearchResultContentView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension30AdvertsSearchResultContentView)initWithFrame:(CGRect)a3;
- (void)disableAdvertRotationTap;
- (void)layoutSubviews;
@end

@implementation AdvertsSearchResultContentView

- (_TtC22SubscribePageExtension30AdvertsSearchResultContentView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension30AdvertsSearchResultContentView *)sub_10048F028(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension30AdvertsSearchResultContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100493268();
}

- (void)disableAdvertRotationTap
{
  id v3 = (void (**)(uint64_t))((char *)self
                                     + OBJC_IVAR____TtC22SubscribePageExtension30AdvertsSearchResultContentView_disableAdvertRotation);
  swift_beginAccess();
  v4 = *v3;
  if (*v3)
  {
    v5 = self;
    uint64_t v6 = sub_10001A4E0((uint64_t)v4);
    v4(v6);
    sub_10001A4D0((uint64_t)v4);
  }
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10048F290();
}

- (_TtC22SubscribePageExtension21SmallSearchLockupView)accessibilityLockupView
{
  return (_TtC22SubscribePageExtension21SmallSearchLockupView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension30AdvertsSearchResultContentView_lockupView);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30AdvertsSearchResultContentView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30AdvertsSearchResultContentView_screenshots));
  swift_bridgeObjectRelease();
  sub_10001A4D0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC22SubscribePageExtension30AdvertsSearchResultContentView_disableAdvertRotation));
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtension30AdvertsSearchResultContentView_impressionsUpdateBlock);

  sub_10001A4D0(v3);
}

@end