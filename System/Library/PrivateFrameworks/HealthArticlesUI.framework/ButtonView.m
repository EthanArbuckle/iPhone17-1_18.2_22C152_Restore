@interface ButtonView
- (_TtC16HealthArticlesUI10ButtonView)initWithCoder:(id)a3;
- (_TtC16HealthArticlesUI10ButtonView)initWithFrame:(CGRect)a3;
- (void)performActionWithSender:(id)a3;
@end

@implementation ButtonView

- (_TtC16HealthArticlesUI10ButtonView)initWithFrame:(CGRect)a3
{
  return (_TtC16HealthArticlesUI10ButtonView *)sub_1C2918B1C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16HealthArticlesUI10ButtonView)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC16HealthArticlesUI10ButtonView_button;
  id v5 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)sub_1C29189D8();
  v6 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16HealthArticlesUI10ButtonView_buttonAction);
  void *v6 = 0;
  v6[1] = 0;

  result = (_TtC16HealthArticlesUI10ButtonView *)sub_1C2921060();
  __break(1u);
  return result;
}

- (void)performActionWithSender:(id)a3
{
  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC16HealthArticlesUI10ButtonView_buttonAction);
  if (v3)
  {
    id v5 = a3;
    v7 = self;
    uint64_t v6 = sub_1C2918EA4((uint64_t)v3);
    v3(v6);
    sub_1C2903C40((uint64_t)v3);
  }
}

- (void).cxx_destruct
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16HealthArticlesUI10ButtonView_buttonAction);
  sub_1C2903C40(v3);
}

@end