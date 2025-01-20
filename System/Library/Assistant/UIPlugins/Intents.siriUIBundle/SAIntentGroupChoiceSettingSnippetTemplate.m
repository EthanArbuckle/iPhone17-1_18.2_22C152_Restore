@interface SAIntentGroupChoiceSettingSnippetTemplate
- (Class)templateViewControllerClass;
- (id)commandIdentifier;
@end

@implementation SAIntentGroupChoiceSettingSnippetTemplate

- (Class)templateViewControllerClass
{
  return (Class)objc_opt_class();
}

- (id)commandIdentifier
{
  v2 = [(SAIntentGroupChoiceSettingSnippetTemplate *)self updateSlotCommand];
  v3 = [v2 aceId];

  return v3;
}

@end