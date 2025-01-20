@interface CAMFilterStatusIndicator
- (BOOL)isOn;
- (BOOL)shouldUseOutline;
- (id)accessibilityIdentifier;
- (id)imageNameForAXHUD;
- (id)imageNameForCurrentState;
- (id)imageSymbolColorConfiguration;
- (void)setOn:(BOOL)a3;
@end

@implementation CAMFilterStatusIndicator

- (void)setOn:(BOOL)a3
{
  if (self->_on != a3)
  {
    self->_on = a3;
    [(CAMControlStatusIndicator *)self updateImage];
  }
}

- (id)imageNameForCurrentState
{
  return @"camera.filters";
}

- (BOOL)shouldUseOutline
{
  return 0;
}

- (id)imageSymbolColorConfiguration
{
  v2 = (void *)MEMORY[0x263F82818];
  v3 = [MEMORY[0x263F825C8] tintColor];
  v4 = [v2 configurationWithHierarchicalColor:v3];

  return v4;
}

- (id)accessibilityIdentifier
{
  return @"StatusBarFiltersButton";
}

- (id)imageNameForAXHUD
{
  return @"camera.filters";
}

- (BOOL)isOn
{
  return self->_on;
}

@end