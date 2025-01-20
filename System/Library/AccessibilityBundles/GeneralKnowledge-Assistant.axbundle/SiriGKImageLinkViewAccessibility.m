@interface SiriGKImageLinkViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SiriGKImageLinkViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SiriGKImageLinkView";
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
  v2 = [(SiriGKImageLinkViewAccessibility *)self safeValueForKey:@"_imageLinkedAnswer"];
  v3 = [v2 safeValueForKey:@"name"];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

@end