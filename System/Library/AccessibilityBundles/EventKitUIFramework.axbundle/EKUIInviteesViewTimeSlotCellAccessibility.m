@interface EKUIInviteesViewTimeSlotCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (EKUIInviteesViewTimeSlotCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation EKUIInviteesViewTimeSlotCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"EKUIInviteesViewTimeSlotCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKUIInviteesViewTimeSlotCell", @"checked", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKUIInviteesViewTimeSlotCell", @"topTimeLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKUIInviteesViewTimeSlotCell", @"bottomTimeLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKUIInviteesViewTimeSlotCell", @"participantsTextView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITextView", @"text", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKUIInviteesViewTimeSlotCell", @"initWithStyle: reuseIdentifier:", "@", "q", "@", 0);
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)EKUIInviteesViewTimeSlotCellAccessibility;
  unint64_t v3 = [(EKUIInviteesViewTimeSlotCellAccessibility *)&v7 accessibilityTraits];
  int v4 = [(EKUIInviteesViewTimeSlotCellAccessibility *)self safeBoolForKey:@"checked"];
  uint64_t v5 = *MEMORY[0x263F1CF38];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v5 | v3;
}

- (id)accessibilityLabel
{
  unint64_t v3 = [(EKUIInviteesViewTimeSlotCellAccessibility *)self safeValueForKey:@"topTimeLabel"];
  int v4 = [(EKUIInviteesViewTimeSlotCellAccessibility *)self safeValueForKey:@"bottomTimeLabel"];
  uint64_t v5 = [(EKUIInviteesViewTimeSlotCellAccessibility *)self safeValueForKey:@"participantsTextView"];
  v8 = [v5 safeValueForKey:@"text"];
  v6 = __UIAXStringForVariables();

  return v6;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)EKUIInviteesViewTimeSlotCellAccessibility;
  [(EKUIInviteesViewTimeSlotCellAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  unint64_t v3 = [(EKUIInviteesViewTimeSlotCellAccessibility *)self safeValueForKey:@"participantsTextView"];
  [v3 setIsAccessibilityElement:0];
}

- (EKUIInviteesViewTimeSlotCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)EKUIInviteesViewTimeSlotCellAccessibility;
  objc_super v4 = [(EKUIInviteesViewTimeSlotCellAccessibility *)&v6 initWithStyle:a3 reuseIdentifier:a4];
  [(EKUIInviteesViewTimeSlotCellAccessibility *)v4 _accessibilityLoadAccessibilityInformation];

  return v4;
}

@end