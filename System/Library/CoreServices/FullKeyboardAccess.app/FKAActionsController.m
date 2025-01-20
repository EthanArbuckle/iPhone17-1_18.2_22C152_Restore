@interface FKAActionsController
- (AXElement)element;
- (BOOL)_canShowWhileLocked;
- (void)setElement:(id)a3;
@end

@implementation FKAActionsController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (AXElement)element
{
  return self->_element;
}

- (void)setElement:(id)a3
{
}

- (void).cxx_destruct
{
}

@end