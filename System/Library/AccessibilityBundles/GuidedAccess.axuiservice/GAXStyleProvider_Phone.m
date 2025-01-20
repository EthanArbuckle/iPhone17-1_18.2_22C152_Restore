@interface GAXStyleProvider_Phone
- (BOOL)workspaceInstructionsLabelShouldBeDisplayed;
- (BOOL)workspaceNavigationBarNeedsMiniMetricsInitialized;
- (UIEdgeInsets)hostedApplicationScaledFrameEdgeInsetsForInterfaceOrientation:(int64_t)a3;
- (UIOffset)featureViewToggleOffset;
- (double)featureViewAdditionalBottomOffsetForLargeText;
- (double)featureViewMinimumHeight;
- (id)featureViewTextFont;
@end

@implementation GAXStyleProvider_Phone

- (BOOL)workspaceNavigationBarNeedsMiniMetricsInitialized
{
  return 1;
}

- (BOOL)workspaceInstructionsLabelShouldBeDisplayed
{
  return 0;
}

- (UIEdgeInsets)hostedApplicationScaledFrameEdgeInsetsForInterfaceOrientation:(int64_t)a3
{
  double v3 = 17.0;
  double v4 = 0.0;
  double v5 = 17.0;
  double v6 = 0.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (double)featureViewMinimumHeight
{
  return 51.0;
}

- (id)featureViewTextFont
{
  return [(GAXStyleProvider *)self _lightLabelFontWithSize:17.0];
}

- (UIOffset)featureViewToggleOffset
{
  double v2 = -2.0;
  double v3 = 0.0;
  result.vertical = v3;
  result.horizontal = v2;
  return result;
}

- (double)featureViewAdditionalBottomOffsetForLargeText
{
  return 10.0;
}

@end