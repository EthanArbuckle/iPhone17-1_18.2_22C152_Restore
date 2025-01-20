@interface InCallControlsParticipantCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityActivateActionButton;
- (BOOL)_accessibilityActivateKickMemberButton;
- (BOOL)_accessibilityActivateLmiApproveButton;
- (BOOL)_accessibilityActivateLmiRejectButton;
- (BOOL)isAccessibilityElement;
- (InCallControlsParticipantCellAccessibility)initWithFrame:(CGRect)a3;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation InCallControlsParticipantCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ConversationKit.InCallControlsParticipantCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ConversationKit.InCallControlsParticipantCell" isKindOfClass:@"UICollectionViewListCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionViewListCell", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.InCallControlsParticipantCell", @"actionButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.InCallControlsParticipantCell", @"lmiApproveButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.InCallControlsParticipantCell", @"lmiRejectButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.InCallControlsParticipantCell", @"kickMemberButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.InCallControlsParticipantCell", @"nameLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.InCallControlsParticipantCell", @"subtitleLabel", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)InCallControlsParticipantCellAccessibility;
  [(InCallControlsParticipantCellAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(InCallControlsParticipantCellAccessibility *)self safeValueForKey:@"actionButton"];
  [v3 accessibilitySetIdentification:@"AXRingButtonIdentification"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(InCallControlsParticipantCellAccessibility *)self safeValueForKey:@"nameLabel"];
  objc_super v4 = [(InCallControlsParticipantCellAccessibility *)self safeValueForKey:@"subtitleLabel"];
  v5 = [v3 accessibilityLabel];
  v8 = [v4 accessibilityLabel];
  v6 = __UIAXStringForVariables();

  return v6;
}

- (id)accessibilityCustomActions
{
  id v3 = objc_opt_new();
  objc_super v4 = [(InCallControlsParticipantCellAccessibility *)self safeUIViewForKey:@"actionButton"];
  if ([v4 _accessibilityViewIsVisible])
  {
    id v5 = objc_alloc(MEMORY[0x263F1C390]);
    v6 = [v4 accessibilityLabel];
    v7 = (void *)[v5 initWithName:v6 target:self selector:sel__accessibilityActivateActionButton];
    [v3 addObject:v7];
  }
  v8 = [(InCallControlsParticipantCellAccessibility *)self safeUIViewForKey:@"lmiApproveButton"];
  if ([v8 _accessibilityViewIsVisible])
  {
    id v9 = objc_alloc(MEMORY[0x263F1C390]);
    v10 = [v8 accessibilityLabel];
    v11 = (void *)[v9 initWithName:v10 target:self selector:sel__accessibilityActivateLmiApproveButton];
    [v3 addObject:v11];
  }
  v12 = [(InCallControlsParticipantCellAccessibility *)self safeUIViewForKey:@"lmiRejectButton"];
  if ([v12 _accessibilityViewIsVisible])
  {
    id v13 = objc_alloc(MEMORY[0x263F1C390]);
    v14 = [v12 accessibilityLabel];
    v15 = (void *)[v13 initWithName:v14 target:self selector:sel__accessibilityActivateLmiRejectButton];
    [v3 addObject:v15];
  }
  v16 = [(InCallControlsParticipantCellAccessibility *)self safeUIViewForKey:@"kickMemberButton"];
  if ([v16 _accessibilityViewIsVisible])
  {
    id v17 = objc_alloc(MEMORY[0x263F1C390]);
    v18 = [v16 accessibilityLabel];
    v19 = (void *)[v17 initWithName:v18 target:self selector:sel__accessibilityActivateKickMemberButton];
    [v3 addObject:v19];
  }

  return v3;
}

- (InCallControlsParticipantCellAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)InCallControlsParticipantCellAccessibility;
  id v3 = -[InCallControlsParticipantCellAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(InCallControlsParticipantCellAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

- (BOOL)_accessibilityActivateActionButton
{
  v2 = [(InCallControlsParticipantCellAccessibility *)self safeValueForKey:@"actionButton"];
  id v3 = __UIAccessibilitySafeClass();

  [v3 sendActionsForControlEvents:64];
  return v3 != 0;
}

- (BOOL)_accessibilityActivateLmiApproveButton
{
  v2 = [(InCallControlsParticipantCellAccessibility *)self safeValueForKey:@"lmiApproveButton"];
  id v3 = __UIAccessibilitySafeClass();

  [v3 sendActionsForControlEvents:64];
  return v3 != 0;
}

- (BOOL)_accessibilityActivateLmiRejectButton
{
  v2 = [(InCallControlsParticipantCellAccessibility *)self safeValueForKey:@"lmiRejectButton"];
  id v3 = __UIAccessibilitySafeClass();

  [v3 sendActionsForControlEvents:64];
  return v3 != 0;
}

- (BOOL)_accessibilityActivateKickMemberButton
{
  v2 = [(InCallControlsParticipantCellAccessibility *)self safeValueForKey:@"kickMemberButton"];
  id v3 = __UIAccessibilitySafeClass();

  [v3 sendActionsForControlEvents:64];
  return v3 != 0;
}

@end