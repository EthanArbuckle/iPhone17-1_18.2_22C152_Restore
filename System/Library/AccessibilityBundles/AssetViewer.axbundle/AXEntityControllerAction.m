@interface AXEntityControllerAction
- (id)entityController;
- (void)setEntityController:(id)a3;
@end

@implementation AXEntityControllerAction

- (id)entityController
{
  id WeakRetained = objc_loadWeakRetained(&self->_entityController);

  return WeakRetained;
}

- (void)setEntityController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end