@interface CardView
- (_TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D11068CardView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D11068CardView)initWithFrame:(CGRect)a3;
- (void)didTapFrom:(id)a3;
@end

@implementation CardView

- (_TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D11068CardView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D11068CardView *)sub_100707D90(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D11068CardView)initWithCoder:(id)a3
{
  return (_TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D11068CardView *)sub_100707EC0(a3);
}

- (void)didTapFrom:(id)a3
{
  id v4 = a3;
  v7 = self;
  if ([v4 state] == (id)3)
  {
    v5 = *(void (**)(uint64_t))((char *)&v7->super.super.super.isa
                                        + OBJC_IVAR____TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D11068CardView_tapAction);
    if (v5)
    {
      uint64_t v6 = swift_retain();
      v5(v6);
      sub_10001A4D0((uint64_t)v5);
    }
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D11068CardView_tintView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D11068CardView_view));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D11068CardView_tapAction);

  sub_10001A4D0(v3);
}

@end