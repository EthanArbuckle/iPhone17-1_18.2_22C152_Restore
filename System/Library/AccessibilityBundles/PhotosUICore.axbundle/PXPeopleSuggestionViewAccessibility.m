@interface PXPeopleSuggestionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation PXPeopleSuggestionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXPeopleSuggestionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXPeopleSuggestionView", @"suggestion", "@", 0);
  [v3 validateProtocol:@"PXPerson" hasRequiredInstanceMethod:@"px_localizedName"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(PXPeopleSuggestionViewAccessibility *)self safeValueForKey:@"suggestion"];
  v4 = [v3 safeValueForKey:@"px_localizedName"];
  if ([v4 length])
  {
    v5 = NSString;
    v6 = accessibilityPhotosUICoreLocalizedString(@"avatar.for.name.label");
    v7 = objc_msgSend(v5, "stringWithFormat:", v6, v4);
  }
  else
  {
    v7 = accessibilityPhotosUICoreLocalizedString(@"avatar.for.unknown.person.label");
  }
  v8 = [(PXPeopleSuggestionViewAccessibility *)self safeValueForKey:@"imageView"];
  v11 = [v8 accessibilityLabel];
  v9 = __UIAXStringForVariables();

  return v9;
}

- (unint64_t)accessibilityTraits
{
  v2 = [(PXPeopleSuggestionViewAccessibility *)self safeValueForKey:@"imageView"];
  unint64_t v3 = [v2 accessibilityTraits];

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(PXPeopleSuggestionViewAccessibility *)self safeValueForKey:@"imageView"];
  unint64_t v3 = [v2 accessibilityValue];

  return v3;
}

@end