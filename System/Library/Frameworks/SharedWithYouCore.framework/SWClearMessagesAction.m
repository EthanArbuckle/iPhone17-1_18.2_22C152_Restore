@interface SWClearMessagesAction
- (NSString)collaborationIdentifier;
- (_TtC17SharedWithYouCore21SWClearMessagesAction)init;
- (_TtC17SharedWithYouCore21SWClearMessagesAction)initWithCoder:(id)a3;
- (_TtC17SharedWithYouCore21SWClearMessagesAction)initWithCollaborationIdentifier:(id)a3;
@end

@implementation SWClearMessagesAction

- (NSString)collaborationIdentifier
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_18C0F2608();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (_TtC17SharedWithYouCore21SWClearMessagesAction)initWithCollaborationIdentifier:(id)a3
{
  uint64_t v4 = sub_18C0F2628();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC17SharedWithYouCore21SWClearMessagesAction_collaborationIdentifier);
  uint64_t *v5 = v4;
  v5[1] = v6;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SWClearMessagesAction();
  return [(SWAction *)&v8 init];
}

- (_TtC17SharedWithYouCore21SWClearMessagesAction)initWithCoder:(id)a3
{
  return (_TtC17SharedWithYouCore21SWClearMessagesAction *)sub_18C0F1EEC(a3);
}

- (_TtC17SharedWithYouCore21SWClearMessagesAction)init
{
  result = (_TtC17SharedWithYouCore21SWClearMessagesAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end