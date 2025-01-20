@interface PreferencesUITextFieldAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityValue;
@end

@implementation PreferencesUITextFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UITextField";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityValue
{
  v11.receiver = self;
  v11.super_class = (Class)PreferencesUITextFieldAccessibility;
  v3 = [(PreferencesUITextFieldAccessibility *)&v11 accessibilityValue];
  v4 = [(PreferencesUITextFieldAccessibility *)self accessibilityIdentifier];
  int v5 = [v4 isEqualToString:@"UIAccessibilityPronunciationEditorDictationCell"];

  if (v5
    && (-[PreferencesUITextFieldAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class()), v6 = objc_claimAutoreleasedReturnValue(), int v7 = [v6 safeBoolForKey:@"showsPhonemes"], v6, v7))
  {
    id v8 = v3;
    objc_opt_class();
    id v9 = v8;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v9 = [MEMORY[0x263F21660] axAttributedStringWithString:v8];
    }
    [v9 setAttribute:v8 forKey:*MEMORY[0x263F21628]];
  }
  else
  {
    id v9 = v3;
  }

  return v9;
}

@end