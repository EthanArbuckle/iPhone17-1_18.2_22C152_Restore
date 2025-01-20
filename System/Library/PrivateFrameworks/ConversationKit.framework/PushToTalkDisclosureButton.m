@interface PushToTalkDisclosureButton
- (_TtC15ConversationKit26PushToTalkDisclosureButton)initWithCoder:(id)a3;
- (_TtC15ConversationKit26PushToTalkDisclosureButton)initWithFrame:(CGRect)a3;
@end

@implementation PushToTalkDisclosureButton

- (_TtC15ConversationKit26PushToTalkDisclosureButton)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKit26PushToTalkDisclosureButton *)PushToTalkDisclosureButton.init(frame:)();
}

- (_TtC15ConversationKit26PushToTalkDisclosureButton)initWithCoder:(id)a3
{
  id v3 = a3;
  PushToTalkDisclosureButton.init(coder:)();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit26PushToTalkDisclosureButton_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit26PushToTalkDisclosureButton____lazy_storage___label));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC15ConversationKit26PushToTalkDisclosureButton____lazy_storage___chevronImageView);
}

@end