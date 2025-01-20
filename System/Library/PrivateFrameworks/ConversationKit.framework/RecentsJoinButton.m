@interface RecentsJoinButton
- (_TtC15ConversationKit17RecentsJoinButton)init;
- (_TtC15ConversationKit17RecentsJoinButton)initWithCoder:(id)a3;
- (_TtC15ConversationKit17RecentsJoinButton)initWithFrame:(CGRect)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (unint64_t)_controlEventsForActionTriggered;
@end

@implementation RecentsJoinButton

- (_TtC15ConversationKit17RecentsJoinButton)init
{
  return (_TtC15ConversationKit17RecentsJoinButton *)RecentsJoinButton.init()();
}

- (_TtC15ConversationKit17RecentsJoinButton)initWithCoder:(id)a3
{
  id v3 = a3;
  RecentsJoinButton.init(coder:)();
}

- (unint64_t)_controlEventsForActionTriggered
{
  return 64;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  v6 = self;
  v9 = (void *)RecentsJoinButton.contextMenuInteraction(_:configurationForMenuAtLocation:)((UIContextMenuInteraction)v6, (CGPoint)__PAIR128__(v8, v7));

  return v9;
}

- (_TtC15ConversationKit17RecentsJoinButton)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
}

@end