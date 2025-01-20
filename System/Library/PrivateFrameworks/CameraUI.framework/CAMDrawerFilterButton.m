@interface CAMDrawerFilterButton
- (BOOL)isOn;
- (BOOL)isSelfExpanding;
- (id)imageNameForCurrentState;
- (id)imageSymbolColorConfiguration;
- (int64_t)controlType;
- (void)setOn:(BOOL)a3;
@end

@implementation CAMDrawerFilterButton

- (int64_t)controlType
{
  return 4;
}

- (BOOL)isSelfExpanding
{
  return 0;
}

- (id)imageNameForCurrentState
{
  return @"camera.filters";
}

- (id)imageSymbolColorConfiguration
{
  v2 = (void *)MEMORY[0x263F82818];
  v3 = [MEMORY[0x263F825C8] tintColor];
  v4 = [v2 configurationWithHierarchicalColor:v3];

  return v4;
}

- (void)setOn:(BOOL)a3
{
  if (self->_on != a3)
  {
    self->_on = a3;
    [(CAMControlDrawerButton *)self updateImage];
  }
}

- (BOOL)isOn
{
  return self->_on;
}

@end