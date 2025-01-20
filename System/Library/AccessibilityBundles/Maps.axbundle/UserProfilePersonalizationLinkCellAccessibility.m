@interface UserProfilePersonalizationLinkCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)updateTitle:(id)a3 subtitle:(id)a4 icon:(id)a5;
@end

@implementation UserProfilePersonalizationLinkCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UserProfilePersonalizationLinkCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UserProfilePersonalizationLinkCell", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UserProfilePersonalizationLinkCell", @"updateTitle:subtitle:icon:", "v", "@", "@", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(UserProfilePersonalizationLinkCellAccessibility *)self safeStringForKey:@"title"];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)UserProfilePersonalizationLinkCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(UserProfilePersonalizationLinkCellAccessibility *)&v3 accessibilityTraits];
}

- (void)updateTitle:(id)a3 subtitle:(id)a4 icon:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)UserProfilePersonalizationLinkCellAccessibility;
  id v8 = a3;
  [(UserProfilePersonalizationLinkCellAccessibility *)&v9 updateTitle:v8 subtitle:a4 icon:a5];
  -[UserProfilePersonalizationLinkCellAccessibility setAccessibilityLabel:](self, "setAccessibilityLabel:", v8, v9.receiver, v9.super_class);
}

@end