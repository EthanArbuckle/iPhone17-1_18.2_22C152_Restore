@interface SystemApertureIncomingCallControlsView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC15ConversationKit38SystemApertureIncomingCallControlsView)initWithCoder:(id)a3;
- (_TtC15ConversationKit38SystemApertureIncomingCallControlsView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SystemApertureIncomingCallControlsView

- (_TtC15ConversationKit38SystemApertureIncomingCallControlsView)initWithCoder:(id)a3
{
  id v3 = a3;
  SystemApertureIncomingCallControlsView.init(coder:)();
}

- (void)layoutSubviews
{
  v2 = self;
  SystemApertureIncomingCallControlsView.layoutSubviews()();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v5 = self;
  CGSize v6 = SystemApertureIncomingCallControlsView.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  double v7 = v6.width;
  double v8 = v6.height;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  double v7 = self;
  CGSize v10 = SystemApertureIncomingCallControlsView.systemLayoutSizeFitting(_:withHorizontalFittingPriority:verticalFittingPriority:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width), v8, v9);

  double v11 = v10.width;
  double v12 = v10.height;
  result.CGFloat height = v12;
  result.CGFloat width = v11;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  SystemApertureIncomingCallControlsView.intrinsicContentSize.getter();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (_TtC15ConversationKit38SystemApertureIncomingCallControlsView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit38SystemApertureIncomingCallControlsView_features));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit38SystemApertureIncomingCallControlsView_leadingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit38SystemApertureIncomingCallControlsView_primaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit38SystemApertureIncomingCallControlsView_secondaryBadge));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit38SystemApertureIncomingCallControlsView_secondaryLabel));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit38SystemApertureIncomingCallControlsView_rejectButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit38SystemApertureIncomingCallControlsView_acceptButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit38SystemApertureIncomingCallControlsView_controlsManager));
  outlined destroy of ConversationControlsAction((uint64_t)self + OBJC_IVAR____TtC15ConversationKit38SystemApertureIncomingCallControlsView_recipe, (void (*)(void))type metadata accessor for ConversationControlsRecipe);
}

@end