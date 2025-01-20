@interface SUUIDownloadsCellViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation SUUIDownloadsCellViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIDownloadsCellView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIDownloadsCellView", @"button", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIDownloadsCellView", @"attributedTitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIDownloadsCellView", @"subtitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIDownloadsCellView", @"progress", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIDownloadsCellView", @"buttonType", "q", 0);
  [v3 validateClass:@"SUUIDownloadsCollectionViewCell"];
  [v3 validateClass:@"SUUIDownloadsCollectionViewCell" hasInstanceVariable:@"_editIndicator" withType:"UIImageView"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  id v3 = [(SUUIDownloadsCellViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Suuidownloadsc_0.isa)];
  v4 = [v3 safeValueForKey:@"_editIndicator"];

  if (v4) {
    return 0;
  }
  v6 = [(SUUIDownloadsCellViewAccessibility *)self safeValueForKey:@"button"];
  char v7 = [v6 accessibilityActivate];

  return v7;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = *MEMORY[0x263F1CEE8];
  id v3 = [(SUUIDownloadsCellViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Suuidownloadsc_0.isa)];
  int v4 = [v3 isSelected];

  uint64_t v5 = *MEMORY[0x263F1CF38];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v5 | v2;
}

- (id)accessibilityLabel
{
  id v3 = [(SUUIDownloadsCellViewAccessibility *)self safeValueForKey:@"attributedTitle"];
  v6 = [(SUUIDownloadsCellViewAccessibility *)self safeValueForKey:@"subtitle"];
  int v4 = __UIAXStringForVariables();

  return v4;
}

- (id)accessibilityValue
{
  id v3 = [(SUUIDownloadsCellViewAccessibility *)self safeValueForKey:@"progress"];
  [v3 floatValue];

  int v4 = [(SUUIDownloadsCellViewAccessibility *)self safeValueForKey:@"buttonType"];
  uint64_t v5 = [v4 unsignedIntegerValue];

  if (v5 == 1)
  {
    v6 = @"item.downloading";
    goto LABEL_5;
  }
  if (v5 == 2)
  {
    v6 = @"item.download.paused";
LABEL_5:
    char v7 = accessibilityLocalizedString(v6);
    goto LABEL_7;
  }
  char v7 = 0;
LABEL_7:
  v10 = AXFormatFloatWithPercentage();
  v8 = __UIAXStringForVariables();

  return v8;
}

@end