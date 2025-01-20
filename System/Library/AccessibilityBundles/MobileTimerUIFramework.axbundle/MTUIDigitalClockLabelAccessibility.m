@interface MTUIDigitalClockLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
@end

@implementation MTUIDigitalClockLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTUIDigitalClockLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end