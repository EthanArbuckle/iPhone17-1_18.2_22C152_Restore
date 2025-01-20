@interface SBLogoutProgressViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_updateViewData;
@end

@implementation SBLogoutProgressViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBLogoutProgressView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBLogoutProgressView" hasInstanceVariable:@"_goodbyeLabel" withType:"UILabel"];
  [v3 validateClass:@"SBLogoutProgressView" hasInstanceVariable:@"_savingDocumentsLabel" withType:"UILabel"];
  [v3 validateClass:@"SBLogoutProgressView" hasInstanceVariable:@"_savingDocumentsMoreLabel" withType:"UILabel"];
  [v3 validateClass:@"SBLogoutProgressView" hasInstanceVariable:@"_blameAppNameLabel" withType:"UILabel"];
  [v3 validateClass:@"SBLogoutProgressView" hasInstanceVariable:@"_blameAppIconView" withType:"UIImageView"];
  [v3 validateClass:@"SBLogoutProgressView" hasInstanceVariable:@"_userAvatarView" withType:"UIImageView"];
  [v3 validateClass:@"SBLogoutProgressView" hasInstanceVariable:@"_userContact" withType:"CNContact"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLogoutProgressView", @"_updateViewData", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUILegibilityLabel", @"string", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)SBLogoutProgressViewAccessibility;
  [(SBLogoutProgressViewAccessibility *)&v21 _accessibilityLoadAccessibilityInformation];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v3 = [&unk_26F7E5F08 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(&unk_26F7E5F08);
        }
        v7 = [(SBLogoutProgressViewAccessibility *)self safeValueForKey:*(void *)(*((void *)&v17 + 1) + 8 * i)];
        [v7 setIsAccessibilityElement:1];
      }
      uint64_t v4 = [&unk_26F7E5F08 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v4);
  }
  v8 = [(SBLogoutProgressViewAccessibility *)self safeValueForKey:@"_blameAppIconView"];
  [v8 setIsAccessibilityElement:0];

  v9 = [(SBLogoutProgressViewAccessibility *)self safeValueForKey:@"_userAvatarView"];
  objc_opt_class();
  v10 = [(SBLogoutProgressViewAccessibility *)self safeValueForKey:@"_userContact"];
  v11 = __UIAccessibilityCastAsClass();

  if (v11)
  {
    uint64_t v12 = [MEMORY[0x263EFEC20] monogramTypeForContact:v11];
    [v9 setIsAccessibilityElement:1];
    v13 = [MEMORY[0x263EFEA20] stringFromContact:v11 style:0];
    if (v12 == 1) {
      v14 = @"contact.description.initials";
    }
    else {
      v14 = @"contact.description.photo";
    }
    v15 = accessibilityLocalizedString(v14);
    v16 = objc_msgSend(NSString, "stringWithFormat:", v15, v13);
    [v9 setAccessibilityLabel:v16];
  }
}

- (void)_updateViewData
{
  v3.receiver = self;
  v3.super_class = (Class)SBLogoutProgressViewAccessibility;
  [(SBLogoutProgressViewAccessibility *)&v3 _updateViewData];
  [(SBLogoutProgressViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end