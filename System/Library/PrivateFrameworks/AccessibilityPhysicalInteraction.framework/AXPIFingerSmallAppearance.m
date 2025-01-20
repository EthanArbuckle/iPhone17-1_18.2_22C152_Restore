@interface AXPIFingerSmallAppearance
- (BOOL)showFingerOutlines;
- (BOOL)showInnerCircle;
- (BOOL)useSystemFilters;
- (double)fingerInnerRadius;
- (double)fingerWidth;
- (double)pressedAlpha;
- (double)pressedScale;
- (double)strokeOutlineWidth;
- (double)strokeWidth;
- (double)unpressedAlpha;
- (double)unpressedScale;
- (id)deselectedFillColor;
- (id)deselectedStrokeColor;
- (id)selectedFillColor;
- (id)selectedStrokeColor;
- (id)strokeOutlineColor;
@end

@implementation AXPIFingerSmallAppearance

- (id)selectedFillColor
{
  return (id)[MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.4];
}

- (id)deselectedFillColor
{
  return (id)[MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.6];
}

- (id)selectedStrokeColor
{
  return (id)[MEMORY[0x263F825C8] whiteColor];
}

- (id)deselectedStrokeColor
{
  return (id)[MEMORY[0x263F825C8] colorWithWhite:0.6 alpha:1.0];
}

- (id)strokeOutlineColor
{
  return (id)[MEMORY[0x263F825C8] blackColor];
}

- (BOOL)useSystemFilters
{
  return 0;
}

- (double)pressedAlpha
{
  return 1.0;
}

- (double)pressedScale
{
  return 1.0;
}

- (double)unpressedAlpha
{
  return 1.0;
}

- (double)unpressedScale
{
  return 1.0;
}

- (double)strokeWidth
{
  return 2.0;
}

- (double)strokeOutlineWidth
{
  return 2.0;
}

- (double)fingerInnerRadius
{
  return 17.0;
}

- (BOOL)showFingerOutlines
{
  return 1;
}

- (BOOL)showInnerCircle
{
  return 1;
}

- (double)fingerWidth
{
  [(AXPIFingerSmallAppearance *)self fingerInnerRadius];
  double v4 = v3;
  [(AXPIFingerSmallAppearance *)self strokeWidth];
  double v6 = v4 + v5;
  [(AXPIFingerSmallAppearance *)self strokeOutlineWidth];
  return v6 + v7 + v6 + v7;
}

@end