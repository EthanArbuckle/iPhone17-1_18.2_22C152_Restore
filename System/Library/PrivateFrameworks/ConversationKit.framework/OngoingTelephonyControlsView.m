@interface OngoingTelephonyControlsView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC15ConversationKit28OngoingTelephonyControlsView)initWithCoder:(id)a3;
- (_TtC15ConversationKit28OngoingTelephonyControlsView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation OngoingTelephonyControlsView

- (_TtC15ConversationKit28OngoingTelephonyControlsView)initWithCoder:(id)a3
{
  id v3 = a3;
  OngoingTelephonyControlsView.init(coder:)();
}

- (void)layoutSubviews
{
  v2 = self;
  OngoingTelephonyControlsView.layoutSubviews()();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v5 = self;
  CGSize v6 = OngoingTelephonyControlsView.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  double v7 = v6.width;
  double v8 = v6.height;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  OngoingTelephonyControlsView.intrinsicContentSize.getter();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (_TtC15ConversationKit28OngoingTelephonyControlsView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit28OngoingTelephonyControlsView_avatarView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit28OngoingTelephonyControlsView_brandedIconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit28OngoingTelephonyControlsView_primaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit28OngoingTelephonyControlsView_secondaryLabel));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit28OngoingTelephonyControlsView_changeRouteButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit28OngoingTelephonyControlsView_hangUpButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit28OngoingTelephonyControlsView_controlsManager));
  _s15ConversationKit0A14ControlsActionOWOhTm_1((uint64_t)self + OBJC_IVAR____TtC15ConversationKit28OngoingTelephonyControlsView_recipe, (uint64_t (*)(void))type metadata accessor for ConversationControlsRecipe);
}

@end