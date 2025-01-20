@interface MSStickerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
@end

@implementation MSStickerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MSStickerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MSStickerView", @"sticker", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MSSticker", @"localizedDescription", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(MSStickerViewAccessibility *)self safeValueForKey:@"sticker"];
  id v3 = [v2 safeValueForKey:@"localizedDescription"];

  if (![v3 length])
  {
    uint64_t v4 = accessibilityLocalizedString(@"sticker.label.unknown");

    id v3 = (void *)v4;
  }

  return v3;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"sticker.hint");
}

@end