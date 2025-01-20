@interface RecentsHeaderButtonsView
- (_TtC15ConversationKit24RecentsHeaderButtonsView)initWithCoder:(id)a3;
- (_TtC15ConversationKit24RecentsHeaderButtonsView)initWithFrame:(CGRect)a3;
- (void)didTapNewCallButton;
- (void)didTapNewLinkButton;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation RecentsHeaderButtonsView

- (_TtC15ConversationKit24RecentsHeaderButtonsView)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKit24RecentsHeaderButtonsView *)RecentsHeaderButtonsView.init(frame:)();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  RecentsHeaderButtonsView.traitCollectionDidChange(_:)(v9);
}

- (_TtC15ConversationKit24RecentsHeaderButtonsView)initWithCoder:(id)a3
{
  id v3 = a3;
  RecentsHeaderButtonsView.init(coder:)();
}

- (void)didTapNewCallButton
{
  v2 = self;
  RecentsHeaderButtonsView.didTapNewCallButton()();
}

- (void)didTapNewLinkButton
{
  v2 = self;
  RecentsHeaderButtonsView.didTapNewLinkButton()();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  outlined consume of (@escaping @callee_guaranteed (@unowned CGRect, @unowned Bool) -> ())?(*(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC15ConversationKit24RecentsHeaderButtonsView_headerDelegate));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit24RecentsHeaderButtonsView_featureFlags));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit24RecentsHeaderButtonsView_newFaceTimeButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit24RecentsHeaderButtonsView_createLinkButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit24RecentsHeaderButtonsView_bottomAnchorConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit24RecentsHeaderButtonsView____lazy_storage___buttonsView));
  outlined destroy of UIButton.Configuration?((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit24RecentsHeaderButtonsView____lazy_storage___newFaceTimeButtonConfiguration);
  outlined destroy of UIButton.Configuration?((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit24RecentsHeaderButtonsView____lazy_storage___createLinkButtonConfiguration);
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC15ConversationKit24RecentsHeaderButtonsView_buttonTitleParagraphStyle);
}

@end