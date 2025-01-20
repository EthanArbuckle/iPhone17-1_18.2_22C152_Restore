@interface TodayTransitioningLabelView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC18ASMessagesProvider27TodayTransitioningLabelView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider27TodayTransitioningLabelView)initWithFrame:(CGRect)a3;
- (void)layoutDirectionDidChange;
- (void)layoutSubviews;
@end

@implementation TodayTransitioningLabelView

- (_TtC18ASMessagesProvider27TodayTransitioningLabelView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_73E538();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider27TodayTransitioningLabelView_fadeInLabel))
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC18ASMessagesProvider27TodayTransitioningLabelView_fadeInLabel), "sizeThatFits:", a3.width, a3.height);
  else {
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC18ASMessagesProvider27TodayTransitioningLabelView_label), "sizeThatFits:", a3.width, a3.height);
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_73C678();
}

- (void)layoutDirectionDidChange
{
  v2 = self;
  sub_73DE40();
}

- (_TtC18ASMessagesProvider27TodayTransitioningLabelView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC18ASMessagesProvider27TodayTransitioningLabelView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider27TodayTransitioningLabelView_label));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider27TodayTransitioningLabelView_fadeInLabel));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider27TodayTransitioningLabelView_defaultFont));
  sub_13308(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC18ASMessagesProvider27TodayTransitioningLabelView_applyPendingFontChange));

  swift_bridgeObjectRelease();
}

@end