@interface CAMSemanticStyleDetailViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation CAMSemanticStyleDetailViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMSemanticStyleDetailView";
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
  v2 = UIAXStringForAllChildren();
  v3 = [v2 localizedLowercaseString];

  return v3;
}

@end