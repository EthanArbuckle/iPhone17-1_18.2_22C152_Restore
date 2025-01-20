@interface SBFolderTitleTextFieldAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityOverridesInstructionsHint;
- (BOOL)_accessibilityServesAsFirstElement;
- (BOOL)_accessibilitySupportsHandwriting;
- (id)accessibilityHint;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SBFolderTitleTextFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBFolderTitleTextField";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  if ([(SBFolderTitleTextFieldAccessibility *)self safeBoolForKey:@"_showingEditUI"])
  {
    v2 = accessibilityLocalizedString(@"folder.name.textfield");
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (BOOL)_accessibilityServesAsFirstElement
{
  return 1;
}

- (id)accessibilityIdentifier
{
  v6.receiver = self;
  v6.super_class = (Class)SBFolderTitleTextFieldAccessibility;
  v2 = [(SBFolderTitleTextFieldAccessibility *)&v6 accessibilityValue];
  v5 = accessibilityLocalizedString(@"folder.name.textfield");
  v3 = __UIAXStringForVariables();

  return v3;
}

- (BOOL)_accessibilitySupportsHandwriting
{
  if ([(SBFolderTitleTextFieldAccessibility *)self safeBoolForKey:@"_showingEditUI"])
  {
    unint64_t v3 = [(SBFolderTitleTextFieldAccessibility *)self accessibilityTraits];
    if ((*MEMORY[0x263F81398] & ~v3) == 0) {
      return 1;
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)SBFolderTitleTextFieldAccessibility;
  return [(SBFolderTitleTextFieldAccessibility *)&v5 _accessibilitySupportsHandwriting];
}

- (unint64_t)accessibilityTraits
{
  v5.receiver = self;
  v5.super_class = (Class)SBFolderTitleTextFieldAccessibility;
  id v3 = [(SBFolderTitleTextFieldAccessibility *)&v5 accessibilityTraits];
  if (([(SBFolderTitleTextFieldAccessibility *)self safeBoolForKey:@"_showingEditUI"] & 1) == 0) {
    return *MEMORY[0x263F1CEF8] | _AXTraitsRemoveTrait();
  }
  return (unint64_t)v3;
}

- (BOOL)_accessibilityOverridesInstructionsHint
{
  return 1;
}

- (id)accessibilityHint
{
  if (([(SBFolderTitleTextFieldAccessibility *)self safeBoolForKey:@"isEditing"] & 1) == 0)
  {
    id v3 = [(SBFolderTitleTextFieldAccessibility *)self safeValueForKey:@"clearButtonMode"];
    int v4 = [v3 intValue];

    if (v4 == 3)
    {
      objc_super v5 = @"folder.name.enter.edit.textfield.hint";
LABEL_6:
      objc_super v6 = accessibilityLocalizedString(v5);
      goto LABEL_8;
    }
    if ([(SBFolderTitleTextFieldAccessibility *)self safeBoolForKey:@"isEditable"])
    {
      objc_super v5 = @"folder.name.enter.edit.mode.hint";
      goto LABEL_6;
    }
  }
  objc_super v6 = 0;
LABEL_8:

  return v6;
}

@end