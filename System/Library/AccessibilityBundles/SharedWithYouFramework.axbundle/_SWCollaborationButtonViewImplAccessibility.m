@interface _SWCollaborationButtonViewImplAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation _SWCollaborationButtonViewImplAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_SWCollaborationButtonViewImpl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"collaboration.button.view.label");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)_SWCollaborationButtonViewImplAccessibility;
  return *MEMORY[0x263F1CEE8] | [(_SWCollaborationButtonViewImplAccessibility *)&v3 accessibilityTraits];
}

@end