@interface _MKMapContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityNativeFocusPreferredElementIsValid;
- (BOOL)_accessibilityShouldIgnoreSoundForFailedMoveAttempt;
@end

@implementation _MKMapContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_MKMapContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityShouldIgnoreSoundForFailedMoveAttempt
{
  return 1;
}

- (BOOL)_accessibilityNativeFocusPreferredElementIsValid
{
  return 0;
}

@end