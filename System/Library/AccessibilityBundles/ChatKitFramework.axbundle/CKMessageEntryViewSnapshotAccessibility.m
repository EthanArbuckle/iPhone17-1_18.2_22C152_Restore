@interface CKMessageEntryViewSnapshotAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CKMessageEntryViewSnapshotAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKMessageEntryViewSnapshot";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKMessageEntryViewSnapshot" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryViewSnapshot", @"browserButton", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)CKMessageEntryViewSnapshotAccessibility;
  [(CKMessageEntryViewSnapshotAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CKMessageEntryViewSnapshotAccessibility *)self safeUIViewForKey:@"browserButton"];
  v4 = accessibilityLocalizedString(@"app.store.button.text");
  [v3 setAccessibilityLabel:v4];
}

@end