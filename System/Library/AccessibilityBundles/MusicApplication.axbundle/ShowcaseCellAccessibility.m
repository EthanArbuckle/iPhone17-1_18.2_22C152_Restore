@interface ShowcaseCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation ShowcaseCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.ShowcaseCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.ShowcaseCell", @"accessibilityIsExplicit", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.ShowcaseCell", @"accessibilityHeadline", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.ShowcaseCell", @"accessibilityTitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.ShowcaseCell", @"accessibilitySubtitle", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  char v3 = [(ShowcaseCellAccessibility *)self safeBoolForKey:@"accessibilityIsExplicit"];
  v4 = [(ShowcaseCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityHeadline, accessibilityTitle, accessibilitySubtitle"];
  v5 = v4;
  if (v3)
  {
    v6 = accessibilityMusicLocalizedString(@"explicit");
    __UIAXStringForVariables();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = v4;
  }

  return v7;
}

@end