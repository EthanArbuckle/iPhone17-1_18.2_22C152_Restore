@interface CKDetailsContactsTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CKDetailsContactsTableViewCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)accessibilityHint;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CKDetailsContactsTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKDetailsContactsTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKDetailsContactsTableViewCell", @"messageButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKDetailsContactsTableViewCell", @"phoneButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKDetailsContactsTableViewCell", @"facetimeVideoButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKDetailsContactsTableViewCell", @"screenSharingButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKDetailsContactsTableViewCell", @"initWithStyle: reuseIdentifier:", "@", "q", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v11.receiver = self;
  v11.super_class = (Class)CKDetailsContactsTableViewCellAccessibility;
  [(CKDetailsContactsTableViewCellAccessibility *)&v11 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CKDetailsContactsTableViewCellAccessibility *)self safeValueForKey:@"messageButton"];
  v4 = accessibilityLocalizedString(@"details.message.button.label");
  [v3 setAccessibilityLabel:v4];

  v5 = [(CKDetailsContactsTableViewCellAccessibility *)self safeValueForKey:@"phoneButton"];
  v6 = accessibilityLocalizedString(@"details.phone.button.label");
  [v5 setAccessibilityLabel:v6];

  v7 = [(CKDetailsContactsTableViewCellAccessibility *)self safeValueForKey:@"facetimeVideoButton"];
  v8 = accessibilityLocalizedString(@"details.facetime.video.button.label");
  [v7 setAccessibilityLabel:v8];

  v9 = [(CKDetailsContactsTableViewCellAccessibility *)self safeValueForKey:@"screenSharingButton"];
  v10 = accessibilityLocalizedString(@"details.screensharing.button.label");
  [v9 setAccessibilityLabel:v10];
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"more.contact.information");
}

- (CKDetailsContactsTableViewCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CKDetailsContactsTableViewCellAccessibility;
  v4 = [(CKDetailsContactsTableViewCellAccessibility *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(CKDetailsContactsTableViewCellAccessibility *)v4 _accessibilityLoadAccessibilityInformation];
  }
  return v5;
}

@end