@interface DOCTagCheckableDotViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation DOCTagCheckableDotViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"DOCTagCheckableDotView";
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
  switch([(DOCTagCheckableDotViewAccessibility *)self safeIntegerForKey:@"tagColor"])
  {
    case 1:
      uint64_t v2 = [MEMORY[0x263F1C550] systemGrayColor];
      goto LABEL_9;
    case 2:
      uint64_t v2 = [MEMORY[0x263F1C550] systemGreenColor];
      goto LABEL_9;
    case 3:
      uint64_t v2 = [MEMORY[0x263F1C550] systemPurpleColor];
      goto LABEL_9;
    case 4:
      uint64_t v2 = [MEMORY[0x263F1C550] systemBlueColor];
      goto LABEL_9;
    case 5:
      uint64_t v2 = [MEMORY[0x263F1C550] systemYellowColor];
      goto LABEL_9;
    case 6:
      uint64_t v2 = [MEMORY[0x263F1C550] systemRedColor];
      goto LABEL_9;
    case 7:
      uint64_t v2 = [MEMORY[0x263F1C550] systemOrangeColor];
LABEL_9:
      v3 = (void *)v2;
      if (!v2) {
        goto LABEL_11;
      }
      v4 = AXColorStringForColor();

      break;
    default:
LABEL_11:
      v4 = accessibilityLocalizedString(@"tag.no.color");
      break;
  }

  return v4;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = *MEMORY[0x263F1CEE8];
  int v3 = [(DOCTagCheckableDotViewAccessibility *)self safeBoolForKey:@"checked"];
  uint64_t v4 = *MEMORY[0x263F1CF38];
  if (!v3) {
    uint64_t v4 = 0;
  }
  return v4 | v2;
}

@end