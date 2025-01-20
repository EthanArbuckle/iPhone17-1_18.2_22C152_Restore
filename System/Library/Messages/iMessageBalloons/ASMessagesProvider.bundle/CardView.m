@interface CardView
- (_TtC18ASMessagesProviderP33_B2CE61E316D584CC4A2ADF6070E311B48CardView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProviderP33_B2CE61E316D584CC4A2ADF6070E311B48CardView)initWithFrame:(CGRect)a3;
- (void)didTapFrom:(id)a3;
@end

@implementation CardView

- (_TtC18ASMessagesProviderP33_B2CE61E316D584CC4A2ADF6070E311B48CardView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProviderP33_B2CE61E316D584CC4A2ADF6070E311B48CardView *)sub_5A55C0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProviderP33_B2CE61E316D584CC4A2ADF6070E311B48CardView)initWithCoder:(id)a3
{
  return (_TtC18ASMessagesProviderP33_B2CE61E316D584CC4A2ADF6070E311B48CardView *)sub_5A56F0(a3);
}

- (void)didTapFrom:(id)a3
{
  id v4 = a3;
  v7 = self;
  if ([v4 state] == (char *)&def_270DE0 + 3)
  {
    v5 = *(void (**)(uint64_t))((char *)&v7->super.super.super.isa
                                        + OBJC_IVAR____TtC18ASMessagesProviderP33_B2CE61E316D584CC4A2ADF6070E311B48CardView_tapAction);
    if (v5)
    {
      uint64_t v6 = swift_retain();
      v5(v6);
      sub_13308((uint64_t)v5);
    }
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProviderP33_B2CE61E316D584CC4A2ADF6070E311B48CardView_tintView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProviderP33_B2CE61E316D584CC4A2ADF6070E311B48CardView_view));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC18ASMessagesProviderP33_B2CE61E316D584CC4A2ADF6070E311B48CardView_tapAction);

  sub_13308(v3);
}

@end