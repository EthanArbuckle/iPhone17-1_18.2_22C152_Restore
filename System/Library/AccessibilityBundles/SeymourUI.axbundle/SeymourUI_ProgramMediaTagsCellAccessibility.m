@interface SeymourUI_ProgramMediaTagsCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation SeymourUI_ProgramMediaTagsCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.ProgramMediaTagsCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SeymourUI.ProgramMediaTagsCell", @"accessibilityMediaTags", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SeymourUI.ProgramMediaTagsCell", @"tagsTextLabel", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(SeymourUI_ProgramMediaTagsCellAccessibility *)self safeValueForKey:@"tagsTextLabel"];
  v4 = [(SeymourUI_ProgramMediaTagsCellAccessibility *)self safeArrayForKey:@"accessibilityMediaTags"];
  v5 = _accessibilityDescriptionForMediaTags(v4);
  v6 = [v3 accessibilityLabel];

  if (v6)
  {
    v7 = [v3 accessibilityLabel];
    _accessibilityReplaceStylsticBulletsForSpeaking(v7, v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = &stru_26F7B5DB0;
  }
  v10 = __UIAXStringForVariables();

  return v10;
}

@end