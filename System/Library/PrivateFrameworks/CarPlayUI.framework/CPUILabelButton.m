@interface CPUILabelButton
- (UIColor)disabledTextColor;
- (id)colorForKnobFocusLayer;
- (id)tintColor;
- (void)setDisabledTextColor:(id)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation CPUILabelButton

- (id)tintColor
{
  if ([(CPUILabelButton *)self isEnabled]) {
    [MEMORY[0x263F825C8] _carSystemFocusColor];
  }
  else {
  v3 = [(CPUILabelButton *)self disabledTextColor];
  }
  return v3;
}

- (void)setEnabled:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CPUILabelButton;
  [(CPUILabelButton *)&v4 setEnabled:a3];
  [(CPUILabelButton *)self setNeedsLayout];
}

- (id)colorForKnobFocusLayer
{
  return (id)[MEMORY[0x263F825C8] clearColor];
}

- (UIColor)disabledTextColor
{
  return self->_disabledTextColor;
}

- (void)setDisabledTextColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end