@interface DynamicHeightLabelView
- (_TtC16HealthArticlesUI22DynamicHeightLabelView)initWithCoder:(id)a3;
- (_TtC16HealthArticlesUI22DynamicHeightLabelView)initWithFrame:(CGRect)a3;
- (void)preferredContentSizeCategoryDidChange;
@end

@implementation DynamicHeightLabelView

- (_TtC16HealthArticlesUI22DynamicHeightLabelView)initWithFrame:(CGRect)a3
{
  return (_TtC16HealthArticlesUI22DynamicHeightLabelView *)sub_1C28FA6E4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16HealthArticlesUI22DynamicHeightLabelView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16HealthArticlesUI22DynamicHeightLabelView____lazy_storage___label) = 0;
  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16HealthArticlesUI22DynamicHeightLabelView_text);
  void *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16HealthArticlesUI22DynamicHeightLabelView_attributes) = (Class)7;
  id v5 = a3;

  result = (_TtC16HealthArticlesUI22DynamicHeightLabelView *)sub_1C2921060();
  __break(1u);
  return result;
}

- (void)preferredContentSizeCategoryDidChange
{
  v2 = self;
  sub_1C28FA9BC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HealthArticlesUI22DynamicHeightLabelView____lazy_storage___label));
  swift_bridgeObjectRelease();
  unint64_t v3 = *(unint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC16HealthArticlesUI22DynamicHeightLabelView_attributes);
  sub_1C28FB7C8(v3);
}

@end