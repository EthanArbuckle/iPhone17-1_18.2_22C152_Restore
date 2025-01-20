@interface PushToTalkSessionDetailsView
- (_TtC15ConversationKit28PushToTalkSessionDetailsView)initWithCoder:(id)a3;
- (_TtC15ConversationKit28PushToTalkSessionDetailsView)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PushToTalkSessionDetailsView

- (_TtC15ConversationKit28PushToTalkSessionDetailsView)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKit28PushToTalkSessionDetailsView *)PushToTalkSessionDetailsView.init(frame:)();
}

- (_TtC15ConversationKit28PushToTalkSessionDetailsView)initWithCoder:(id)a3
{
  id v3 = a3;
  PushToTalkSessionDetailsView.init(coder:)();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  PushToTalkSessionDetailsView.traitCollectionDidChange(_:)(v9);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit28PushToTalkSessionDetailsView_avatarView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit28PushToTalkSessionDetailsView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit28PushToTalkSessionDetailsView_disclosureButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit28PushToTalkSessionDetailsView_textAreaLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit28PushToTalkSessionDetailsView_disclosureButtonLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit28PushToTalkSessionDetailsView_textAreaLeadingAnchorConstraint));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15ConversationKit28PushToTalkSessionDetailsView_textAreaCenterYAnchorConstraint);
}

@end