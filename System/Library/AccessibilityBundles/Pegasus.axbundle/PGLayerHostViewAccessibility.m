@interface PGLayerHostViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (int64_t)accessibilityContainerType;
@end

@implementation PGLayerHostViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PGLayerHostView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"pip.video");
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

@end