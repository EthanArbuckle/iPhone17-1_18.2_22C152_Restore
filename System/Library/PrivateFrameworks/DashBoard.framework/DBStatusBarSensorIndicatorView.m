@interface DBStatusBarSensorIndicatorView
- (CGSize)intrinsicContentSize;
- (DBStatusBarSensorIndicatorView)init;
- (int64_t)sensorIndicatorType;
- (void)_updateColor;
- (void)setSensorIndicatorType:(int64_t)a3;
@end

@implementation DBStatusBarSensorIndicatorView

- (DBStatusBarSensorIndicatorView)init
{
  v6.receiver = self;
  v6.super_class = (Class)DBStatusBarSensorIndicatorView;
  v2 = [(DBStatusBarSensorIndicatorView *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(DBStatusBarSensorIndicatorView *)v2 layer];
    [v4 setCornerRadius:2.0];

    [(DBStatusBarSensorIndicatorView *)v3 _updateColor];
  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  double v2 = 4.0;
  double v3 = 4.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setSensorIndicatorType:(int64_t)a3
{
  if (self->_sensorIndicatorType != a3)
  {
    self->_sensorIndicatorType = a3;
    [(DBStatusBarSensorIndicatorView *)self _updateColor];
  }
}

- (void)_updateColor
{
  if ([(DBStatusBarSensorIndicatorView *)self sensorIndicatorType] == 2)
  {
    [(DBStatusBarSensorIndicatorView *)self setAccessibilityIdentifier:@"DBStatusBarSensorIndicatorTypeCamera"];
    double v3 = [MEMORY[0x263F825C8] colorWithDynamicProvider:&__block_literal_global_35];
  }
  else
  {
    double v3 = [MEMORY[0x263F825C8] systemOrangeColor];
    [(DBStatusBarSensorIndicatorView *)self setAccessibilityIdentifier:@"DBStatusBarSensorIndicatorTypeMicrophone"];
  }
  v4 = (void *)MEMORY[0x263F82E00];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__DBStatusBarSensorIndicatorView__updateColor__block_invoke_2;
  v6[3] = &unk_2649B3D30;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  [v4 transitionWithView:self duration:0 options:v6 animations:&__block_literal_global_9 completion:0.25];
}

id __46__DBStatusBarSensorIndicatorView__updateColor__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 1) {
    [MEMORY[0x263F825C8] colorWithRed:0.28627451 green:0.639215686 blue:0.349019608 alpha:1.0];
  }
  else {
  double v2 = [MEMORY[0x263F825C8] systemGreenColor];
  }
  return v2;
}

uint64_t __46__DBStatusBarSensorIndicatorView__updateColor__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setBackgroundColor:*(void *)(a1 + 40)];
}

- (int64_t)sensorIndicatorType
{
  return self->_sensorIndicatorType;
}

@end