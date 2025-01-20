@interface _SFCompressedBarButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (int64_t)_accessibilityExpandedStatus;
@end

@implementation _SFCompressedBarButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_SFCompressedBarButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  v3 = [(_SFCompressedBarButtonAccessibility *)self isAccessibilityUserDefinedElement];

  if (!v3) {
    return 0;
  }
  v4 = [(_SFCompressedBarButtonAccessibility *)self isAccessibilityUserDefinedElement];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (id)accessibilityLabel
{
  return accessibilityMobileSafariLocalizedString(@"collapsed.address.bar");
}

- (int64_t)_accessibilityExpandedStatus
{
  return 2;
}

@end