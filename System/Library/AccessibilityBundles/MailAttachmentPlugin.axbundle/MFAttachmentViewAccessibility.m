@interface MFAttachmentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityElementsHidden;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation MFAttachmentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFAttachmentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MFAttachmentView" hasInstanceVariable:@"_filenameLabel" withType:"UILabel"];
  [v3 validateClass:@"MFAttachmentView" hasInstanceVariable:@"_statusLabel" withType:"UILabel"];
  [v3 validateClass:@"MFAttachmentView" hasInstanceVariable:@"_totalSizeString" withType:"NSString"];
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (BOOL)accessibilityElementsHidden
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(MFAttachmentViewAccessibility *)self safeValueForKey:@"_filenameLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  id v3 = [(MFAttachmentViewAccessibility *)self safeValueForKey:@"_statusLabel"];
  if ([v3 _accessibilityViewIsVisible])
  {
    v4 = [(MFAttachmentViewAccessibility *)self safeValueForKey:@"_totalSizeString"];
    v7 = [v3 accessibilityLabel];
    v5 = __UIAXStringForVariables();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"view.attachment.hint");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

@end