@interface TodayTransitioningLabelView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC20ProductPageExtension27TodayTransitioningLabelView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension27TodayTransitioningLabelView)initWithFrame:(CGRect)a3;
- (void)layoutDirectionDidChange;
- (void)layoutSubviews;
@end

@implementation TodayTransitioningLabelView

- (_TtC20ProductPageExtension27TodayTransitioningLabelView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001E90B4();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension27TodayTransitioningLabelView_fadeInLabel))
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension27TodayTransitioningLabelView_fadeInLabel), "sizeThatFits:", a3.width, a3.height);
  else {
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension27TodayTransitioningLabelView_label), "sizeThatFits:", a3.width, a3.height);
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001E71F4();
}

- (void)layoutDirectionDidChange
{
  v2 = self;
  sub_1001E89BC();
}

- (_TtC20ProductPageExtension27TodayTransitioningLabelView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC20ProductPageExtension27TodayTransitioningLabelView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension27TodayTransitioningLabelView_label));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension27TodayTransitioningLabelView_fadeInLabel));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension27TodayTransitioningLabelView_defaultFont));
  sub_1000194B0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC20ProductPageExtension27TodayTransitioningLabelView_applyPendingFontChange));

  swift_bridgeObjectRelease();
}

@end