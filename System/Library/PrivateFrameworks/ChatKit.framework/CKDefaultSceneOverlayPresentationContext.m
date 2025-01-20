@interface CKDefaultSceneOverlayPresentationContext
- (CGRect)anchorRect;
- (CKChatInputController)inputController;
- (CKDefaultSceneOverlayPresentationContext)initWithChatInputController:(id)a3 initialTraitCollection:(id)a4;
- (UIView)anchorView;
- (UIView)viewToPortal;
- (id)_determineViewToPortal;
- (int64_t)presentationStyle;
- (void)_endSendMenuPresentation;
- (void)appCardDidAppearInPopover;
- (void)didChangePopoverMetrics:(id)a3;
- (void)setInputController:(id)a3;
- (void)willDismissSendMenuPresentation;
- (void)willPresentAppCard;
@end

@implementation CKDefaultSceneOverlayPresentationContext

- (CKDefaultSceneOverlayPresentationContext)initWithChatInputController:(id)a3 initialTraitCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CKDefaultSceneOverlayPresentationContext;
  v8 = [(CKDefaultSceneOverlayPresentationContext *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_inputController, v6);
    v9->_presentationStyle = [v6 determineSendMenuPresentationStyleCompatibleWithTraitCollection:v7];
    uint64_t v10 = [(CKDefaultSceneOverlayPresentationContext *)v9 _determineViewToPortal];
    viewToPortal = v9->_viewToPortal;
    v9->_viewToPortal = (UIView *)v10;
  }
  return v9;
}

- (UIView)anchorView
{
  v2 = [(CKDefaultSceneOverlayPresentationContext *)self inputController];
  v3 = [v2 entryView];
  v4 = [v3 sendMenuSourceView];

  return (UIView *)v4;
}

- (CGRect)anchorRect
{
  v2 = [(CKDefaultSceneOverlayPresentationContext *)self inputController];
  v3 = [v2 entryView];
  v4 = [v3 sendMenuSourceView];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)_determineViewToPortal
{
  if (self->_presentationStyle)
  {
    v2 = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
    v4 = [WeakRetained entryView];
    double v5 = [v4 sendMenuSourceView];
    v2 = [v5 superview];
  }

  return v2;
}

- (void)willDismissSendMenuPresentation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  [WeakRetained setIsAppCardUsingPopoverPresentation:0];

  [(CKDefaultSceneOverlayPresentationContext *)self _endSendMenuPresentation];
}

- (void)_endSendMenuPresentation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  v2 = [WeakRetained entryView];
  [v2 endSendMenuPresentation];
}

- (void)didChangePopoverMetrics:(id)a3
{
  p_inputController = &self->_inputController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  double v5 = [WeakRetained entryView];
  [v5 sendMenuPopoverMetricsDidChange:v4];
}

- (void)appCardDidAppearInPopover
{
  id v3 = [(CKDefaultSceneOverlayPresentationContext *)self inputController];
  v2 = [v3 entryView];
  [v2 beginSendMenuPopoverPresentation];
}

- (void)willPresentAppCard
{
  if (self->_presentationStyle == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
    [WeakRetained setIsAppCardUsingPopoverPresentation:1];
  }
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (UIView)viewToPortal
{
  return self->_viewToPortal;
}

- (CKChatInputController)inputController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);

  return (CKChatInputController *)WeakRetained;
}

- (void)setInputController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_inputController);

  objc_storeStrong((id *)&self->_viewToPortal, 0);
}

@end