@interface SystemApertureInCallLeadingView
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4;
- (_TtC15ConversationKit31SystemApertureInCallLeadingView)initWithCoder:(id)a3;
- (_TtC15ConversationKit31SystemApertureInCallLeadingView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)layoutSubviews;
@end

@implementation SystemApertureInCallLeadingView

- (_TtC15ConversationKit31SystemApertureInCallLeadingView)initWithFrame:(CGRect)a3
{
}

- (_TtC15ConversationKit31SystemApertureInCallLeadingView)initWithCoder:(id)a3
{
  id v3 = a3;
  SystemApertureInCallLeadingView.init(coder:)();
}

- (void)dealloc
{
  v2 = self;
  SystemApertureInCallLeadingView.__deallocating_deinit();
}

- (void).cxx_destruct
{
  outlined consume of SystemApertureIconAsset(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC15ConversationKit31SystemApertureInCallLeadingView_icon), *(void *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC15ConversationKit31SystemApertureInCallLeadingView_icon), *(void **)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC15ConversationKit31SystemApertureInCallLeadingView_icon), *(uint64_t *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC15ConversationKit31SystemApertureInCallLeadingView_icon), *(uint64_t *)((char *)&self->super._cachedTraitCollection+ OBJC_IVAR____TtC15ConversationKit31SystemApertureInCallLeadingView_icon), *((unsigned char *)&self->super._swiftAnimationInfo + OBJC_IVAR____TtC15ConversationKit31SystemApertureInCallLeadingView_icon));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit31SystemApertureInCallLeadingView_iconView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15ConversationKit31SystemApertureInCallLeadingView_durationView);
}

- (void)layoutSubviews
{
  v2 = self;
  SystemApertureInCallLeadingView.layoutSubviews()();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v5 = self;
  CGSize v6 = SystemApertureInCallLeadingView.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  double v7 = v6.width;
  double v8 = v6.height;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4
{
  v4 = self;
  SystemApertureInCallLeadingView.sizeThatFits(_:for:)();
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.CGFloat height = v10;
  result.CGFloat width = v9;
  return result;
}

@end