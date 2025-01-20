@interface PKHoverControllerDisplayLinkDelegate
- (PKHoverController)controller;
- (void)display:(id)a3;
- (void)setController:(id)a3;
@end

@implementation PKHoverControllerDisplayLinkDelegate

- (void)display:(id)a3
{
  id v3 = [(PKHoverControllerDisplayLinkDelegate *)self controller];
  [v3 vsync];
}

- (PKHoverController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (PKHoverController *)WeakRetained;
}

- (void)setController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end