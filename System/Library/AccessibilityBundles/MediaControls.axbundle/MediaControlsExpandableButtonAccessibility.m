@interface MediaControlsExpandableButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)setExpanded:(BOOL)a3;
- (void)setSelectedOptionIndex:(int64_t)a3;
@end

@implementation MediaControlsExpandableButtonAccessibility

- (void)setSelectedOptionIndex:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MediaControlsExpandableButtonAccessibility;
  -[MediaControlsExpandableButtonAccessibility setSelectedOptionIndex:](&v7, sel_setSelectedOptionIndex_);
  v5 = [(MediaControlsExpandableButtonAccessibility *)self safeArrayForKey:@"_buttons"];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__MediaControlsExpandableButtonAccessibility_setSelectedOptionIndex___block_invoke;
  v6[3] = &__block_descriptor_40_e25_v32__0__NSObject_8Q16_B24l;
  v6[4] = a3;
  [v5 enumerateObjectsUsingBlock:v6];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

+ (id)safeCategoryTargetClassName
{
  return @"MediaControlsExpandableButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsExpandableButton", @"setSelectedOptionIndex:", "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsExpandableButton", @"setExpanded:", "v", "B", 0);
  [v3 validateClass:@"MediaControlsExpandableButton" hasInstanceVariable:@"_buttons" withType:"NSMutableArray"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsExpandableButton", @"isExpanded", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsExpandableButton", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsExpandableButton", @"subtitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsExpandableButton", @"messageLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsExpandableButton", @"toggleEnabled", "B", 0);
  [v3 validateClass:@"MediaControlsExpandableButton" hasInstanceVariable:@"_buttons" withType:"NSMutableArray"];
}

- (BOOL)isAccessibilityElement
{
  return [(MediaControlsExpandableButtonAccessibility *)self safeBoolForKey:@"isExpanded"] ^ 1;
}

- (id)accessibilityLabel
{
  v2 = [(MediaControlsExpandableButtonAccessibility *)self safeUIViewForKey:@"titleLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  id v3 = [(MediaControlsExpandableButtonAccessibility *)self safeUIViewForKey:@"subtitleLabel"];
  v4 = [v3 accessibilityLabel];

  v5 = [(MediaControlsExpandableButtonAccessibility *)self safeUIViewForKey:@"messageLabel"];
  v6 = [v5 accessibilityLabel];

  objc_super v7 = __UIAXStringForVariables();

  return v7;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = *MEMORY[0x263F1CEE8];
  int v3 = [(MediaControlsExpandableButtonAccessibility *)self safeBoolForKey:@"toggleEnabled"];
  uint64_t v4 = *MEMORY[0x263F1CF20];
  if (v3) {
    uint64_t v4 = 0;
  }
  return v4 | v2;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

- (CGPoint)accessibilityActivationPoint
{
  char v13 = 0;
  objc_opt_class();
  int v3 = [(MediaControlsExpandableButtonAccessibility *)self safeArrayForKey:@"_buttons"];
  uint64_t v4 = [v3 firstObject];
  v5 = __UIAccessibilityCastAsClass();

  if (v5)
  {
    [v5 accessibilityActivationPoint];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)MediaControlsExpandableButtonAccessibility;
    [(MediaControlsExpandableButtonAccessibility *)&v12 accessibilityActivationPoint];
  }
  double v8 = v6;
  double v9 = v7;

  double v10 = v8;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)setExpanded:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MediaControlsExpandableButtonAccessibility;
  [(MediaControlsExpandableButtonAccessibility *)&v7 setExpanded:a3];
  UIAccessibilityNotifications v4 = *MEMORY[0x263F1CE18];
  v5 = [(MediaControlsExpandableButtonAccessibility *)self safeArrayForKey:@"_buttons"];
  double v6 = [v5 firstObject];
  UIAccessibilityPostNotification(v4, v6);
}

void __69__MediaControlsExpandableButtonAccessibility_setSelectedOptionIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = a2;
  uint64_t v5 = [v7 accessibilityTraits];
  if (v4 == a3) {
    uint64_t v6 = *MEMORY[0x263F1CF38] | v5;
  }
  else {
    uint64_t v6 = v5 & ~*MEMORY[0x263F1CF38];
  }
  [v7 setAccessibilityTraits:v6];
}

@end