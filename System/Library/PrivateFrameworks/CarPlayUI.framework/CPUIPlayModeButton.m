@interface CPUIPlayModeButton
- (BOOL)shouldUpdateButtonOpacityForKnobUnfocused;
- (BOOL)showBezelInTouch;
- (id)colorForKnobContentSelected;
- (id)colorForKnobFocusLayerSelected;
- (id)colorForTouchContentSelected;
- (id)colorForTouchFocusLayer;
- (id)colorForTouchFocusLayerSelected;
- (id)tintColorForUnhighlightedTextLabel;
@end

@implementation CPUIPlayModeButton

- (BOOL)showBezelInTouch
{
  return 1;
}

- (BOOL)shouldUpdateButtonOpacityForKnobUnfocused
{
  return 0;
}

- (id)colorForTouchContentSelected
{
  v2 = (void *)MEMORY[0x263F825C8];
  v3 = [MEMORY[0x263F825C8] labelColor];
  v4 = [v2 _focusedCarSystemColor:v3];

  return v4;
}

- (id)colorForKnobFocusLayerSelected
{
  return (id)[MEMORY[0x263F825C8] labelColor];
}

- (id)colorForKnobContentSelected
{
  v2 = (void *)MEMORY[0x263F825C8];
  v3 = [MEMORY[0x263F825C8] labelColor];
  v4 = [v2 _focusedCarSystemColor:v3];

  return v4;
}

- (id)colorForTouchFocusLayerSelected
{
  return (id)[MEMORY[0x263F825C8] labelColor];
}

- (id)colorForTouchFocusLayer
{
  return (id)[MEMORY[0x263F825C8] clearColor];
}

- (id)tintColorForUnhighlightedTextLabel
{
  return (id)[MEMORY[0x263F825C8] labelColor];
}

@end