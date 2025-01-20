@interface CKMentionSuggestionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CKMentionSuggestionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKMentionSuggestionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKMentionSuggestionView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMentionSuggestionView", @"collectionView", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)CKMentionSuggestionViewAccessibility;
  [(CKMentionSuggestionViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CKMentionSuggestionViewAccessibility *)self safeValueForKey:@"collectionView"];
  v4 = accessibilityLocalizedString(@"group.mentions.collection");
  [v3 setAccessibilityLabel:v4];
}

@end