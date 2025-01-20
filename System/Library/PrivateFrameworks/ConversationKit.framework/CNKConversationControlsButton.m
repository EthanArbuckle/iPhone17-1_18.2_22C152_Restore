@interface CNKConversationControlsButton
- (CGPoint)menuAttachmentPointForConfiguration:(id)a3;
- (CNKConversationControlsButton)initWithCoder:(id)a3;
- (CNKConversationControlsButton)initWithFrame:(CGRect)a3;
- (NSString)description;
- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)didMoveToWindow;
- (void)layoutSubviews;
@end

@implementation CNKConversationControlsButton

- (CNKConversationControlsButton)initWithCoder:(id)a3
{
  id v3 = a3;
  ConversationControlsButton.init(coder:)();
}

- (NSString)description
{
  return (NSString *)@objc ConversationControlsButton.description.getter(self, (uint64_t)a2, ConversationControlsButton.description.getter);
}

- (void)layoutSubviews
{
  v2 = self;
  ConversationControlsButton.layoutSubviews()();
}

- (void)didMoveToWindow
{
  v2 = self;
  ConversationControlsButton.didMoveToWindow()();
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  v6 = self;
  v9 = (void *)ConversationControlsButton.contextMenuInteraction(_:configurationForMenuAtLocation:)((UIContextMenuInteraction)v6, (CGPoint)__PAIR128__(v8, v7));

  return v9;
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = self;
  v9 = (void *)ConversationControlsButton._contextMenuInteraction(_:styleForMenuWith:)((uint64_t)v6, (uint64_t)v7);

  return v9;
}

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = self;
  CGPoint v6 = ConversationControlsButton.menuAttachmentPoint(for:)((UIContextMenuConfiguration)v4);

  double x = v6.x;
  double y = v6.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CNKConversationControlsButton)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_release();
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR___CNKConversationControlsButton_delegate);
  swift_bridgeObjectRelease();
}

@end