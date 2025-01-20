@interface RCRecordingViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation RCRecordingViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"RCRecordingView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 0;
}

@end