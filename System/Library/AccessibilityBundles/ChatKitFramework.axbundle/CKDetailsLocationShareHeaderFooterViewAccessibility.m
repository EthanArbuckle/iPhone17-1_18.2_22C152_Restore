@interface CKDetailsLocationShareHeaderFooterViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)isAccessibilityElement;
@end

@implementation CKDetailsLocationShareHeaderFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKDetailsLocationShareHeaderFooterView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  if (AXRequestingClient() == 4 || AXRequestingClient() == 5) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)CKDetailsLocationShareHeaderFooterViewAccessibility;
  return [(CKDetailsLocationShareHeaderFooterViewAccessibility *)&v4 isAccessibilityElement];
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

@end