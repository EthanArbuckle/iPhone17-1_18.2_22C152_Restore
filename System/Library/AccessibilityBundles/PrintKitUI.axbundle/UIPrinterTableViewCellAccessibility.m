@interface UIPrinterTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation UIPrinterTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIPrinterTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIPrinterTableViewCell", @"checked", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIPrinterTableViewCell", @"printerState", "i", 0);
}

- (id)accessibilityValue
{
  if ([(UIPrinterTableViewCellAccessibility *)self safeIntForKey:@"printerState"]- 1 > 3)
  {
    v2 = 0;
  }
  else
  {
    v2 = UIKitAccessibilityLocalizedString();
  }

  return v2;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)UIPrinterTableViewCellAccessibility;
  unint64_t v3 = [(UIPrinterTableViewCellAccessibility *)&v7 accessibilityTraits];
  int v4 = [(UIPrinterTableViewCellAccessibility *)self safeBoolForKey:@"checked"];
  uint64_t v5 = *MEMORY[0x263F1CF38];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v5 | v3;
}

@end