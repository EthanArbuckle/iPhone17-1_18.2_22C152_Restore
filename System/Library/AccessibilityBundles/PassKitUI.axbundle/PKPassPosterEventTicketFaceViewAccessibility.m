@interface PKPassPosterEventTicketFaceViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation PKPassPosterEventTicketFaceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPassPosterEventTicketFaceView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKPassPosterEventTicketFaceView" hasInstanceVariable:@"_logoLabel" withType:"UILabel"];
  [v3 validateClass:@"PKPassPosterEventTicketFaceView" hasInstanceVariable:@"_primaryFieldLabel" withType:"UILabel"];
  [v3 validateClass:@"PKPassPosterEventTicketFaceView" hasInstanceVariable:@"_dateLabel" withType:"UILabel"];
  [v3 validateClass:@"PKPassPosterEventTicketFaceView" hasInstanceVariable:@"_timeLabel" withType:"UILabel"];
  [v3 validateClass:@"PKPassPosterEventTicketFaceView" hasInstanceVariable:@"_secnamLabel" withType:"UILabel"];
  [v3 validateClass:@"PKPassPosterEventTicketFaceView" hasInstanceVariable:@"_venueLabel" withType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(PKPassPosterEventTicketFaceViewAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global_0];
  v4 = [v3 accessibilityLabel];

  v5 = [(PKPassPosterEventTicketFaceViewAccessibility *)self safeUIViewForKey:@"_logoLabel"];
  v6 = [v5 accessibilityLabel];

  v7 = [(PKPassPosterEventTicketFaceViewAccessibility *)self safeUIViewForKey:@"_primaryFieldLabel"];
  v8 = [v7 accessibilityLabel];

  v9 = [(PKPassPosterEventTicketFaceViewAccessibility *)self safeUIViewForKey:@"_dateLabel"];
  v10 = [v9 accessibilityLabel];

  v11 = [(PKPassPosterEventTicketFaceViewAccessibility *)self safeUIViewForKey:@"_timeLabel"];
  v12 = [v11 accessibilityLabel];

  v13 = [(PKPassPosterEventTicketFaceViewAccessibility *)self safeUIViewForKey:@"_secnamLabel"];
  v14 = [v13 accessibilityLabel];

  v15 = [(PKPassPosterEventTicketFaceViewAccessibility *)self safeUIViewForKey:@"_venueLabel"];
  v16 = [v15 accessibilityLabel];

  v17 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 7, v4, v6, v8, v10, v12, v14, v16);
  v18 = AXLabelForElements();

  return v18;
}

BOOL __66__PKPassPosterEventTicketFaceViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 accessibilityIdentifier];
    BOOL v4 = [v3 caseInsensitiveCompare:@"LogoImage"] == 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

@end