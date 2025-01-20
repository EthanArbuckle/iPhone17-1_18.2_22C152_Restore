@interface GCEventViewController
- (BOOL)controllerUserInteractionEnabled;
- (void)setControllerUserInteractionEnabled:(BOOL)controllerUserInteractionEnabled;
@end

@implementation GCEventViewController

- (BOOL)controllerUserInteractionEnabled
{
  return self->_controllerUserInteractionEnabled;
}

- (void)setControllerUserInteractionEnabled:(BOOL)controllerUserInteractionEnabled
{
  self->_controllerUserInteractionEnabled = controllerUserInteractionEnabled;
}

@end