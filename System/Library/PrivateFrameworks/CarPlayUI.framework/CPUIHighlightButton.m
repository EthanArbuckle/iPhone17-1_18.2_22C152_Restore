@interface CPUIHighlightButton
- (BOOL)canShowHighlight;
- (id)colorForKnobFocusLayer;
@end

@implementation CPUIHighlightButton

- (id)colorForKnobFocusLayer
{
  return (id)[MEMORY[0x263F825C8] clearColor];
}

- (BOOL)canShowHighlight
{
  return 1;
}

@end