@interface AdvertsSearchResultContentView
- (_TtC18ASMessagesProvider21SmallSearchLockupView)accessibilityLockupView;
- (_TtC18ASMessagesProvider30AdvertsSearchResultContentView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider30AdvertsSearchResultContentView)initWithFrame:(CGRect)a3;
- (void)disableAdvertRotationTap;
- (void)layoutSubviews;
@end

@implementation AdvertsSearchResultContentView

- (_TtC18ASMessagesProvider30AdvertsSearchResultContentView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider30AdvertsSearchResultContentView *)sub_237A7C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider30AdvertsSearchResultContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23B8B0();
}

- (void)disableAdvertRotationTap
{
  id v3 = (void (**)(uint64_t))((char *)self
                                     + OBJC_IVAR____TtC18ASMessagesProvider30AdvertsSearchResultContentView_disableAdvertRotation);
  swift_beginAccess();
  v4 = *v3;
  if (*v3)
  {
    v5 = self;
    uint64_t v6 = sub_13318((uint64_t)v4);
    v4(v6);
    sub_13308((uint64_t)v4);
  }
}

- (void)layoutSubviews
{
  v2 = self;
  sub_237CE4();
}

- (_TtC18ASMessagesProvider21SmallSearchLockupView)accessibilityLockupView
{
  return (_TtC18ASMessagesProvider21SmallSearchLockupView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider30AdvertsSearchResultContentView_lockupView);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider30AdvertsSearchResultContentView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider30AdvertsSearchResultContentView_screenshots));
  swift_bridgeObjectRelease();
  sub_13308(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC18ASMessagesProvider30AdvertsSearchResultContentView_disableAdvertRotation));
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC18ASMessagesProvider30AdvertsSearchResultContentView_impressionsUpdateBlock);

  sub_13308(v3);
}

@end