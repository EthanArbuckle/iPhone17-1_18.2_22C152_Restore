@interface ParticipantCell
- (NSString)accessibilityDisplayName;
- (_TtC15ConversationKit15ParticipantCell)initWithCoder:(id)a3;
- (_TtC15ConversationKit15ParticipantCell)initWithFrame:(CGRect)a3;
- (_TtC15ConversationKit15ParticipantView)participantView;
- (void)prepareForReuse;
- (void)setAccessibilityDisplayName:(id)a3;
@end

@implementation ParticipantCell

- (_TtC15ConversationKit15ParticipantView)participantView
{
  id v2 = ParticipantCell.participantView.getter();
  return (_TtC15ConversationKit15ParticipantView *)v2;
}

- (_TtC15ConversationKit15ParticipantCell)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKit15ParticipantCell *)ParticipantCell.init(frame:)();
}

- (_TtC15ConversationKit15ParticipantCell)initWithCoder:(id)a3
{
  id v3 = a3;
  ParticipantCell.init(coder:)();
}

- (void)prepareForReuse
{
  id v2 = self;
  ParticipantCell.prepareForReuse()();
}

- (NSString)accessibilityDisplayName
{
  uint64_t v2 = ParticipantCell.accessibilityDisplayName.getter();
  id v3 = (void *)MEMORY[0x1C87730B0](v2);
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setAccessibilityDisplayName:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  v7 = self;
  ParticipantCell.accessibilityDisplayName.setter(v4, v6);
}

- (void).cxx_destruct
{
  outlined destroy of UUID?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit15ParticipantCell_participantIdentifier);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit15ParticipantCell_participantView));
  swift_bridgeObjectRelease();
}

@end