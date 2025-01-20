@interface CKLocationShareBalloonViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axActionForButton:(id)a3 withLabel:(id)a4;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
@end

@implementation CKLocationShareBalloonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKLocationShareBalloonView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKLocationShareBalloonView", @"titleString", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKLocationShareBalloonView", @"locationString", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKLocationShareBalloonView", @"startSharingButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKLocationShareBalloonView", @"ignoreButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKLocationShareBalloonView", @"offerState", "q", 0);
}

- (id)accessibilityLabel
{
  return (id)[(CKLocationShareBalloonViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"titleString, locationString"];
}

- (id)accessibilityCustomActions
{
  id v3 = [MEMORY[0x263EFF980] array];
  if (![(CKLocationShareBalloonViewAccessibility *)self safeIntegerForKey:@"offerState"])
  {
    v4 = accessibilityLocalizedString(@"start.sharing.button");
    v5 = [(CKLocationShareBalloonViewAccessibility *)self _axActionForButton:@"startSharingButton" withLabel:v4];
    [v3 axSafelyAddObject:v5];

    v6 = accessibilityLocalizedString(@"ignore.sharing.button");
    v7 = [(CKLocationShareBalloonViewAccessibility *)self _axActionForButton:@"ignoreButton" withLabel:v6];
    [v3 axSafelyAddObject:v7];
  }

  return v3;
}

- (id)_axActionForButton:(id)a3 withLabel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v15 = 0;
  v8 = [(CKLocationShareBalloonViewAccessibility *)self safeUIViewForKey:v6];
  v9 = __UIAccessibilitySafeClass();

  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x263F1C390]);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __72__CKLocationShareBalloonViewAccessibility__axActionForButton_withLabel___block_invoke;
    v13[3] = &unk_265112D88;
    id v14 = v9;
    v11 = (void *)[v10 initWithName:v7 actionHandler:v13];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __72__CKLocationShareBalloonViewAccessibility__axActionForButton_withLabel___block_invoke(uint64_t a1)
{
  return 1;
}

@end