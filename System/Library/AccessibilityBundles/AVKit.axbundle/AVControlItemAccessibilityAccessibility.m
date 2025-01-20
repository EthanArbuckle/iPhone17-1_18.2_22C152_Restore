@interface AVControlItemAccessibilityAccessibility
@end

@implementation AVControlItemAccessibilityAccessibility

id __68__tvOS_AVControlItemAccessibilityAccessibility__startPiPControlItem__block_invoke()
{
  v0 = [NSClassFromString(&cfstr_Pbspictureinpi.isa) safeValueForKeyPath:@"sharedInstance.currentState"];
  if ([v0 safeBoolForKey:@"isPictureInPictureActive"]) {
    v1 = @"pip.swap.button";
  }
  else {
    v1 = @"pip.start.button";
  }
  v2 = accessibilityLocalizedString(v1);

  return v2;
}

@end