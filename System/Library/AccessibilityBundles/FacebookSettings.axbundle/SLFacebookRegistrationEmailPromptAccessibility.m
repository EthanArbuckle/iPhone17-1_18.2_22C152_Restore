@interface SLFacebookRegistrationEmailPromptAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (void)viewWillLayoutSubviews;
@end

@implementation SLFacebookRegistrationEmailPromptAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SLFacebookRegistrationEmailPrompt";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

- (void)viewWillLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SLFacebookRegistrationEmailPromptAccessibility;
  [(SLFacebookRegistrationEmailPromptAccessibility *)&v4 viewWillLayoutSubviews];
  v3 = [(SLFacebookRegistrationEmailPromptAccessibility *)self safeValueForKey:@"_orLabel"];
  [v3 setIsAccessibilityElement:0];
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)SLFacebookRegistrationEmailPromptAccessibility;
  v6 = -[SLFacebookRegistrationEmailPromptAccessibility tableView:titleForFooterInSection:](&v11, sel_tableView_titleForFooterInSection_, a3);
  v7 = v6;
  if (!a4 && [v6 isEqualToString:@" "])
  {
    v8 = [(SLFacebookRegistrationEmailPromptAccessibility *)self safeValueForKey:@"_orLabel"];
    uint64_t v9 = [v8 accessibilityLabel];

    v7 = (void *)v9;
  }

  return v7;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SLFacebookRegistrationEmailPromptAccessibility;
  BOOL v10 = -[SLFacebookRegistrationEmailPromptAccessibility textField:shouldChangeCharactersInRange:replacementString:](&v12, sel_textField_shouldChangeCharactersInRange_replacementString_, v9, location, length, a5);
  if (!v10 && [v9 tag] == 1)
  {
    MEMORY[0x24564C530](*MEMORY[0x263F812C8]);
    UIAccessibilityPostNotification(*MEMORY[0x263F81438], 0);
  }

  return v10;
}

@end