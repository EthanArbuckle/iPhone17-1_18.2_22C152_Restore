@interface CKAvatarTitleCollectionReusableViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CKAvatarTitleCollectionReusableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKAvatarTitleCollectionReusableView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKAvatarTitleCollectionReusableView", @"titleLabel", "@", 0);
  [v3 validateClass:@"CKAvatarTitleCollectionReusableView" hasInstanceVariable:@"_avatarTitleAccessoryImageType" withType:"q"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)CKAvatarTitleCollectionReusableViewAccessibility;
  [(CKAvatarTitleCollectionReusableViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CKAvatarTitleCollectionReusableViewAccessibility *)self safeValueForKey:@"titleLabel"];
  [v3 setIsAccessibilityElement:0];
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)accessibilityLabel
{
  if ([(CKAvatarTitleCollectionReusableViewAccessibility *)self safeIntegerForKey:@"_avatarTitleAccessoryImageType"] == 1)
  {
    id v3 = accessibilityLocalizedString(@"conversation.verified");
  }
  else
  {
    id v3 = 0;
  }
  objc_super v4 = [(CKAvatarTitleCollectionReusableViewAccessibility *)self safeUIViewForKey:@"titleLabel"];
  v5 = [v4 accessibilityLabel];
  v6 = __UIAXStringForVariables();

  return v6;
}

- (BOOL)isAccessibilityElement
{
  id v3 = [(CKAvatarTitleCollectionReusableViewAccessibility *)self isAccessibilityUserDefinedElement];
  int v4 = [v3 BOOLValue];

  if (!v4) {
    return 0;
  }

  return [(CKAvatarTitleCollectionReusableViewAccessibility *)self _accessibilityViewIsVisible];
}

- (id)accessibilityHint
{
  id v3 = [(CKAvatarTitleCollectionReusableViewAccessibility *)self accessibilityUserDefinedHint];

  if (v3) {
    [(CKAvatarTitleCollectionReusableViewAccessibility *)self accessibilityUserDefinedHint];
  }
  else {
  int v4 = accessibilityLocalizedString(@"multi.person.header.hint");
  }

  return v4;
}

@end