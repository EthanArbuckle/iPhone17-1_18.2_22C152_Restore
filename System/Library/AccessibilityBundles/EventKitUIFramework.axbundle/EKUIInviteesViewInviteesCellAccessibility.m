@interface EKUIInviteesViewInviteesCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityValue;
- (void)updateWithParticipantForSorting:(id)a3;
- (void)updateWithParticipantForSorting:(id)a3 availabilityType:(int64_t)a4 showSpinner:(BOOL)a5 animated:(BOOL)a6;
@end

@implementation EKUIInviteesViewInviteesCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"EKUIInviteesViewInviteesCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKParticipantForSorting", @"participant", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKUIInviteesViewInviteesCell", @"commentLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKUIInviteesViewInviteesCell", @"nameLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKUIInviteesViewInviteesCell", @"updateWithParticipantForSorting:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKUIInviteesViewInviteesCell", @"updateWithParticipantForSorting: availabilityType: showSpinner: animated:", "v", "@", "q", "B", "B", 0);
}

- (void)updateWithParticipantForSorting:(id)a3 availabilityType:(int64_t)a4 showSpinner:(BOOL)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  v22.receiver = self;
  v22.super_class = (Class)EKUIInviteesViewInviteesCellAccessibility;
  [(EKUIInviteesViewInviteesCellAccessibility *)&v22 updateWithParticipantForSorting:v10 availabilityType:a4 showSpinner:v7 animated:v6];
  v11 = [v10 safeValueForKey:@"participant"];
  v12 = __UIAccessibilitySafeClass();

  v13 = [(EKUIInviteesViewInviteesCellAccessibility *)self safeValueForKey:@"nameLabel"];
  v14 = [v13 accessibilityLabel];

  if ([v12 participantRole] == 3)
  {
    v15 = accessibilityLocalizedString(@"organizer");
  }
  else
  {
    v15 = 0;
  }
  if ([v12 participantType] == 2)
  {
    v16 = accessibilityLocalizedString(@"invitee.type.room");
  }
  else
  {
    v16 = 0;
  }
  int64_t v17 = a4 - 1;
  if (unint64_t)(a4 - 1) <= 6 && ((0x6Bu >> v17))
  {
    v18 = accessibilityLocalizedString(off_26511E660[v17]);
  }
  else
  {
    v18 = 0;
  }
  unint64_t v19 = [v12 participantStatus];
  if (v19 > 7)
  {
    v20 = 0;
  }
  else
  {
    v20 = accessibilityLocalizedString(off_26511E698[v19]);
  }
  v21 = __UIAXStringForVariables();
  [(EKUIInviteesViewInviteesCellAccessibility *)self setAccessibilityLabel:v21, v20, v18, v15, v16, @"__AXStringForVariablesSentinel"];
}

- (id)accessibilityValue
{
  v2 = [(EKUIInviteesViewInviteesCellAccessibility *)self safeValueForKey:@"commentLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (void)updateWithParticipantForSorting:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)EKUIInviteesViewInviteesCellAccessibility;
  [(EKUIInviteesViewInviteesCellAccessibility *)&v14 updateWithParticipantForSorting:v4];
  v5 = [v4 safeValueForKey:@"participant"];
  BOOL v6 = __UIAccessibilitySafeClass();

  BOOL v7 = [(EKUIInviteesViewInviteesCellAccessibility *)self safeValueForKey:@"nameLabel"];
  v8 = [v7 accessibilityLabel];

  if ([v6 participantRole] == 3)
  {
    v9 = accessibilityLocalizedString(@"organizer");
  }
  else
  {
    v9 = 0;
  }
  if ([v6 participantType] == 2)
  {
    id v10 = accessibilityLocalizedString(@"invitee.type.room");
  }
  else
  {
    id v10 = 0;
  }
  unint64_t v11 = [v6 participantStatus];
  if (v11 > 7)
  {
    v12 = 0;
  }
  else
  {
    v12 = accessibilityLocalizedString(off_26511E698[v11]);
  }
  v13 = __UIAXStringForVariables();
  [(EKUIInviteesViewInviteesCellAccessibility *)self setAccessibilityLabel:v13, v12, v9, v10, @"__AXStringForVariablesSentinel"];
}

@end