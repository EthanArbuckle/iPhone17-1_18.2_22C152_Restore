@interface CPUIRoundedLabelButton
- (CPUIRoundedLabelButton)initWithFrame:(CGRect)a3;
- (id)colorForKnobContentSelected;
- (id)colorForKnobFocusLayer;
- (id)colorForKnobFocusLayerSelected;
- (id)colorForTouchContentSelected;
- (id)colorForTouchFocusLayerSelected;
@end

@implementation CPUIRoundedLabelButton

- (CPUIRoundedLabelButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CPUIRoundedLabelButton;
  v3 = -[CPUIMediaButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(CPUIRoundedLabelButton *)v3 _setContinuousCornerRadius:8.0];
  }
  return v4;
}

- (id)colorForKnobFocusLayer
{
  return (id)[MEMORY[0x263F825C8] _carSystemQuaternaryColor];
}

- (id)colorForTouchContentSelected
{
  return (id)[MEMORY[0x263F825C8] _carSystemFocusLabelColor];
}

- (id)colorForKnobFocusLayerSelected
{
  return (id)[MEMORY[0x263F825C8] _carSystemFocusColor];
}

- (id)colorForKnobContentSelected
{
  return (id)[MEMORY[0x263F825C8] _carSystemFocusLabelColor];
}

- (id)colorForTouchFocusLayerSelected
{
  return (id)[MEMORY[0x263F825C8] _carSystemFocusColor];
}

@end