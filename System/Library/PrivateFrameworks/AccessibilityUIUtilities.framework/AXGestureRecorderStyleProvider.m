@interface AXGestureRecorderStyleProvider
- (CGSize)fingerLineDropDownShadowOffset;
- (CGSize)instructionsLabelShadowOffset;
- (double)dynamicFingerLineDropDownShadowOpacity;
- (double)dynamicFingerLineDropDownShadowRadius;
- (double)dynamicFingerLineOuterBevelWidth;
- (double)fingerLineDropDownShadowOpacity;
- (double)fingerLineDropDownShadowRadius;
- (double)fingerLineOuterBevelWidth;
- (double)instructionsLabelHorizontalInset;
- (double)maximumFingerLineWidth;
- (double)minimumFingerLineWidth;
- (float)fingerLineGradientBottomColorLocation;
- (float)fingerLineGradientTopColorLocation;
- (id)dynamicFingerLineDropDownShadowColor;
- (id)dynamicFingerLineGradientBottomColor;
- (id)dynamicFingerLineGradientTopColor;
- (id)finalDynamicFingerColor;
- (id)fingerLineDropDownShadowColor;
- (id)fingerLineGradientBottomColor;
- (id)fingerLineGradientTopColor;
- (id)fingerLineOuterBevelColor;
- (id)gestureRecorderViewBackgroundColor;
- (id)gestureRecorderViewBackgroundGradientBottomColor;
- (id)gestureRecorderViewBackgroundGradientTopColor;
- (id)instructionsLabelBackgroundColor;
- (id)instructionsLabelFont;
- (id)instructionsLabelShadowColor;
- (id)instructionsLabelTextColor;
- (id)staticFingerColor;
- (id)tracingDynamicFingerColor;
@end

@implementation AXGestureRecorderStyleProvider

- (id)instructionsLabelFont
{
  return (id)[MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
}

- (id)instructionsLabelTextColor
{
  return (id)[MEMORY[0x1E4FB1618] secondaryLabelColor];
}

- (id)instructionsLabelBackgroundColor
{
  return (id)[MEMORY[0x1E4FB1618] clearColor];
}

- (id)instructionsLabelShadowColor
{
  return 0;
}

- (CGSize)instructionsLabelShadowOffset
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)instructionsLabelHorizontalInset
{
  int IsPad = AXDeviceIsPad();
  double result = 10.0;
  if (IsPad) {
    return 30.0;
  }
  return result;
}

- (id)gestureRecorderViewBackgroundColor
{
  return (id)[MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
}

- (id)gestureRecorderViewBackgroundGradientTopColor
{
  double v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 1)
  {
    double v4 = 0.90234375;
    double v5 = 0.91015625;
    double v6 = 0.92578125;
  }
  else
  {
    double v4 = 0.800000012;
    double v5 = 0.819999993;
    double v6 = 0.839999974;
  }
  v7 = [MEMORY[0x1E4FB1618] colorWithRed:v4 green:v5 blue:v6 alpha:1.0];
  return v7;
}

- (id)gestureRecorderViewBackgroundGradientBottomColor
{
  uint64_t v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 1) {
    [MEMORY[0x1E4FB1618] colorWithRed:0.8515625 green:0.859375 blue:0.875 alpha:1.0];
  }
  else {
  double v5 = [(AXGestureRecorderStyleProvider *)self gestureRecorderViewBackgroundGradientTopColor];
  }
  return v5;
}

- (double)minimumFingerLineWidth
{
  return 50.0;
}

- (double)maximumFingerLineWidth
{
  [(AXGestureRecorderStyleProvider *)self minimumFingerLineWidth];
  return v2 * 4.0;
}

- (id)tracingDynamicFingerColor
{
  double v2 = [MEMORY[0x1E4FB1618] systemTealColor];
  uint64_t v3 = [v2 colorWithAlphaComponent:0.8];

  return v3;
}

- (id)finalDynamicFingerColor
{
  return (id)[MEMORY[0x1E4FB1618] colorWithRed:0.196078431 green:0.603921569 blue:1.0 alpha:1.0];
}

- (id)staticFingerColor
{
  return (id)[MEMORY[0x1E4FB1618] colorWithRed:0.721568627 green:0.721568627 blue:0.721568627 alpha:1.0];
}

- (id)fingerLineGradientTopColor
{
  return (id)[MEMORY[0x1E4FB1618] colorWithRed:0.69921875 green:0.70703125 blue:0.73828125 alpha:1.0];
}

- (id)fingerLineGradientBottomColor
{
  return (id)[MEMORY[0x1E4FB1618] colorWithRed:0.8125 green:0.81640625 blue:0.8359375 alpha:1.0];
}

- (float)fingerLineGradientTopColorLocation
{
  return 0.0;
}

- (float)fingerLineGradientBottomColorLocation
{
  return 0.8;
}

- (id)dynamicFingerLineGradientTopColor
{
  double v2 = [MEMORY[0x1E4FB1618] systemBlueColor];
  uint64_t v3 = [v2 colorWithAlphaComponent:0.8];

  return v3;
}

- (id)dynamicFingerLineGradientBottomColor
{
  double v2 = [MEMORY[0x1E4FB1618] systemGray2Color];
  uint64_t v3 = [v2 colorWithAlphaComponent:0.8];

  return v3;
}

- (id)fingerLineOuterBevelColor
{
  return (id)[MEMORY[0x1E4FB1618] whiteColor];
}

- (double)fingerLineOuterBevelWidth
{
  return 2.0;
}

- (double)dynamicFingerLineOuterBevelWidth
{
  return 1.0;
}

- (id)fingerLineDropDownShadowColor
{
  return (id)[MEMORY[0x1E4FB1618] blackColor];
}

- (CGSize)fingerLineDropDownShadowOffset
{
  double v2 = 0.0;
  double v3 = 1.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)fingerLineDropDownShadowRadius
{
  return 2.0;
}

- (double)fingerLineDropDownShadowOpacity
{
  return 0.5;
}

- (id)dynamicFingerLineDropDownShadowColor
{
  return (id)[MEMORY[0x1E4FB1618] colorWithRed:0.65625 green:0.65625 blue:0.65625 alpha:1.0];
}

- (double)dynamicFingerLineDropDownShadowRadius
{
  return 3.0;
}

- (double)dynamicFingerLineDropDownShadowOpacity
{
  return 1.0;
}

@end