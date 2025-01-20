@interface SystemApertureButton
- (CGPoint)menuAttachmentPointForConfiguration:(id)a3;
- (NSString)description;
- (_TtC15ConversationKit20SystemApertureButton)initWithCoder:(id)a3;
- (_TtC15ConversationKit20SystemApertureButton)initWithFrame:(CGRect)a3;
- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)didMoveToWindow;
- (void)layoutSubviews;
@end

@implementation SystemApertureButton

- (_TtC15ConversationKit20SystemApertureButton)initWithCoder:(id)a3
{
}

- (NSString)description
{
  return (NSString *)@objc ConversationControlsButton.description.getter(self, (uint64_t)a2, SystemApertureButton.description.getter);
}

- (void)layoutSubviews
{
  v2 = self;
  SystemApertureButton.layoutSubviews()();
}

- (void)didMoveToWindow
{
  v2 = self;
  SystemApertureButton.didMoveToWindow()();
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
  v9 = (void *)SystemApertureButton.contextMenuInteraction(_:configurationForMenuAtLocation:)((UIContextMenuInteraction)v6, (CGPoint)__PAIR128__(v8, v7));

  return v9;
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = self;
  v9 = (void *)SystemApertureButton._contextMenuInteraction(_:styleForMenuWith:)((uint64_t)v6, (uint64_t)v7);

  return v9;
}

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = self;
  CGPoint v6 = SystemApertureButton.menuAttachmentPoint(for:)((UIContextMenuConfiguration)v4);

  double x = v6.x;
  double y = v6.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (_TtC15ConversationKit20SystemApertureButton)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
}

@end