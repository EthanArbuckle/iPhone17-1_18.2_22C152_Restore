@interface SKUIDownloadsCellViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation SKUIDownloadsCellViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIDownloadsCellView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIDownloadsCellView", @"button", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIDownloadsCellView", @"attributedTitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIDownloadsCellView", @"subtitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIDownloadsCellView", @"progress", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIDownloadsCellView", @"buttonType", "q", 0);
  [v3 validateClass:@"SKUIDownloadsCollectionViewCell"];
  [v3 validateClass:@"SKUIDownloadsCollectionViewCell" hasInstanceVariable:@"_editIndicator" withType:"UIImageView"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  id v3 = [(SKUIDownloadsCellViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Skuidownloadsc_1.isa)];
  v4 = [v3 safeValueForKey:@"_editIndicator"];

  if (v4) {
    return 0;
  }
  v6 = [(SKUIDownloadsCellViewAccessibility *)self safeValueForKey:@"button"];
  char v7 = [v6 accessibilityActivate];

  return v7;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = *MEMORY[0x263F1CEE8];
  id v3 = [(SKUIDownloadsCellViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Skuidownloadsc_1.isa)];
  int v4 = [v3 isSelected];

  uint64_t v5 = *MEMORY[0x263F1CF38];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v5 | v2;
}

- (id)accessibilityLabel
{
  id v3 = [(SKUIDownloadsCellViewAccessibility *)self safeValueForKey:@"attributedTitle"];
  v6 = [(SKUIDownloadsCellViewAccessibility *)self safeValueForKey:@"subtitle"];
  int v4 = __UIAXStringForVariables();

  return v4;
}

- (id)accessibilityValue
{
  id v3 = [(SKUIDownloadsCellViewAccessibility *)self safeValueForKey:@"progress"];
  [v3 floatValue];

  int v4 = [(SKUIDownloadsCellViewAccessibility *)self safeValueForKey:@"buttonType"];
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
    char v7 = accessibilitySKUILocalizedString(v6);
    goto LABEL_7;
  }
  char v7 = 0;
LABEL_7:
  v10 = AXFormatFloatWithPercentage();
  v8 = __UIAXStringForVariables();

  return v8;
}

@end