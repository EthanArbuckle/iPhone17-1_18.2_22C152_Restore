@interface CKSendMenuPopoverPresentationConfiguration
- (CKSendMenuPopoverPresentationControllerAnchorItem)anchorItem;
- (UIViewController)appCardContentViewController;
- (UIViewController)initialViewController;
- (UIViewController)sendMenuViewController;
- (unint64_t)appCardPresentationStyle;
- (void)setAnchorItem:(id)a3;
- (void)setAppCardContentViewController:(id)a3;
- (void)setAppCardPresentationStyle:(unint64_t)a3;
- (void)setSendMenuViewController:(id)a3;
@end

@implementation CKSendMenuPopoverPresentationConfiguration

- (UIViewController)initialViewController
{
  sendMenuViewController = self->_sendMenuViewController;
  if (!sendMenuViewController) {
    sendMenuViewController = self->_appCardContentViewController;
  }
  return sendMenuViewController;
}

- (CKSendMenuPopoverPresentationControllerAnchorItem)anchorItem
{
  return self->_anchorItem;
}

- (void)setAnchorItem:(id)a3
{
}

- (UIViewController)sendMenuViewController
{
  return self->_sendMenuViewController;
}

- (void)setSendMenuViewController:(id)a3
{
}

- (UIViewController)appCardContentViewController
{
  return self->_appCardContentViewController;
}

- (void)setAppCardContentViewController:(id)a3
{
}

- (unint64_t)appCardPresentationStyle
{
  return self->_appCardPresentationStyle;
}

- (void)setAppCardPresentationStyle:(unint64_t)a3
{
  self->_appCardPresentationStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appCardContentViewController, 0);
  objc_storeStrong((id *)&self->_sendMenuViewController, 0);

  objc_storeStrong((id *)&self->_anchorItem, 0);
}

@end