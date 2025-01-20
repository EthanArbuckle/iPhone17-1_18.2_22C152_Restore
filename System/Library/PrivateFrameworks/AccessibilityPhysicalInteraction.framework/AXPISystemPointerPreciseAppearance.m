@interface AXPISystemPointerPreciseAppearance
- (BOOL)showFingerOutlines;
- (BOOL)showInnerCircle;
- (BOOL)useSystemFilters;
- (double)fingerInnerCircleInnerRadius;
- (double)fingerInnerRadius;
- (double)innerCircleStrokeWidth;
- (double)pressedAlpha;
- (double)pressedScale;
- (double)strokeOutlineWidth;
- (double)strokeWidth;
- (double)unpressedAlpha;
- (double)unpressedScale;
- (id)circularProgressFillColor;
- (id)deselectedStrokeColor;
@end

@implementation AXPISystemPointerPreciseAppearance

- (double)strokeWidth
{
  _AXSPointerStrokeColorWidth();
  return v2;
}

- (id)deselectedStrokeColor
{
  _AXSPointerStrokeColor();
  if (_AXSPointerStrokeColorValues()) {
    [MEMORY[0x263F825C8] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
  }
  else {
  float v2 = [MEMORY[0x263F825C8] whiteColor];
  }
  return v2;
}

- (id)circularProgressFillColor
{
  float v2 = [(AXPISystemPointerPreciseAppearance *)self deselectedStrokeColor];
  v3 = AXSlightlyDarkerColorForColor();

  return v3;
}

- (double)strokeOutlineWidth
{
  return 0.0;
}

- (BOOL)showFingerOutlines
{
  return _AXSPointerStrokeColorValues() != 0;
}

- (BOOL)showInnerCircle
{
  return _AXSPointerShouldShowCenterPoint() != 0;
}

- (BOOL)useSystemFilters
{
  return 1;
}

- (double)pressedAlpha
{
  return 0.9;
}

- (double)pressedScale
{
  return 0.9;
}

- (double)unpressedAlpha
{
  return 0.5;
}

- (double)unpressedScale
{
  return 1.0;
}

- (double)fingerInnerCircleInnerRadius
{
  BOOL v2 = [(AXPISystemPointerPreciseAppearance *)self showInnerCircle];
  double result = 0.0;
  if (v2) {
    return 4.75;
  }
  return result;
}

- (double)innerCircleStrokeWidth
{
  return 0.0;
}

- (double)fingerInnerRadius
{
  _AXSPointerSizeMultiplier();
  return v2 * 19.0 * 0.5;
}

@end