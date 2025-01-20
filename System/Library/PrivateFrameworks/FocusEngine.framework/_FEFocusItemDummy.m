@interface _FEFocusItemDummy
- (BOOL)_canBecomeFocused;
- (CGRect)_focusFrame;
- (NSArray)_preferredFocusEnvironments;
- (_FEFocusEnvironment)_parentFocusEnvironment;
- (_FEFocusItemContainer)_focusItemContainer;
- (void)set_focusFrame:(CGRect)a3;
- (void)set_parentFocusEnvironment:(id)a3;
@end

@implementation _FEFocusItemDummy

- (BOOL)_canBecomeFocused
{
  return 0;
}

- (NSArray)_preferredFocusEnvironments
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = self;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return (NSArray *)v2;
}

- (_FEFocusItemContainer)_focusItemContainer
{
  return 0;
}

- (CGRect)_focusFrame
{
  double x = self->__focusFrame.origin.x;
  double y = self->__focusFrame.origin.y;
  double width = self->__focusFrame.size.width;
  double height = self->__focusFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)set_focusFrame:(CGRect)a3
{
  self->__focusFrame = a3;
}

- (_FEFocusEnvironment)_parentFocusEnvironment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__parentFocusEnvironment);
  return (_FEFocusEnvironment *)WeakRetained;
}

- (void)set_parentFocusEnvironment:(id)a3
{
}

- (void).cxx_destruct
{
}

@end