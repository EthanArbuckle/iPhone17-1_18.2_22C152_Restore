@interface WKCompactContextMenuPresenterButton
- (UIContextMenuInteractionDelegate)externalDelegate;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)setExternalDelegate:(id)a3;
@end

@implementation WKCompactContextMenuPresenterButton

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  p_externalDelegate = &self->_externalDelegate;
  objc_loadWeak((id *)&self->_externalDelegate);
  if (objc_opt_respondsToSelector())
  {
    id Weak = objc_loadWeak((id *)p_externalDelegate);
    return (id)objc_msgSend(Weak, "contextMenuInteraction:configurationForMenuAtLocation:", a3, x, y);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)WKCompactContextMenuPresenterButton;
    return -[WKCompactContextMenuPresenterButton contextMenuInteraction:configurationForMenuAtLocation:](&v11, sel_contextMenuInteraction_configurationForMenuAtLocation_, a3, x, y);
  }
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  p_externalDelegate = &self->_externalDelegate;
  objc_loadWeak((id *)&self->_externalDelegate);
  if (objc_opt_respondsToSelector())
  {
    id Weak = objc_loadWeak((id *)p_externalDelegate);
    return (id)[Weak contextMenuInteraction:a3 configuration:a4 highlightPreviewForItemWithIdentifier:a5];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)WKCompactContextMenuPresenterButton;
    return [(WKCompactContextMenuPresenterButton *)&v12 contextMenuInteraction:a3 configuration:a4 highlightPreviewForItemWithIdentifier:a5];
  }
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)WKCompactContextMenuPresenterButton;
  -[WKCompactContextMenuPresenterButton contextMenuInteraction:willDisplayMenuForConfiguration:animator:](&v10, sel_contextMenuInteraction_willDisplayMenuForConfiguration_animator_);
  p_externalDelegate = &self->_externalDelegate;
  objc_loadWeak((id *)p_externalDelegate);
  if (objc_opt_respondsToSelector()) {
    [objc_loadWeak((id *)p_externalDelegate) contextMenuInteraction:a3 willDisplayMenuForConfiguration:a4 animator:a5];
  }
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)WKCompactContextMenuPresenterButton;
  -[WKCompactContextMenuPresenterButton contextMenuInteraction:willEndForConfiguration:animator:](&v10, sel_contextMenuInteraction_willEndForConfiguration_animator_);
  p_externalDelegate = &self->_externalDelegate;
  objc_loadWeak((id *)p_externalDelegate);
  if (objc_opt_respondsToSelector()) {
    [objc_loadWeak((id *)p_externalDelegate) contextMenuInteraction:a3 willEndForConfiguration:a4 animator:a5];
  }
}

- (UIContextMenuInteractionDelegate)externalDelegate
{
  return (UIContextMenuInteractionDelegate *)objc_loadWeak((id *)&self->_externalDelegate);
}

- (void)setExternalDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end