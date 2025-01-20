@interface UIApplication(MailAccessibilityCategory)
+ (void)_accessibilityPerformValidations:()MailAccessibilityCategory;
- (id)_accessibilityFilenameForAttachmentCID:()MailAccessibilityCategory;
- (id)accessibilityLabel;
- (uint64_t)_accessibilityApplicationIsModal;
@end

@implementation UIApplication(MailAccessibilityCategory)

+ (void)_accessibilityPerformValidations:()MailAccessibilityCategory
{
  id v3 = a3;
  [v3 validateClass:@"MailComposeScene"];
  [v3 validateClass:@"UIWindowScene" isKindOfClass:@"UIScene"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"UIScene", @"_mostActiveScene", "@", 0);
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"app.name");
}

- (id)_accessibilityFilenameForAttachmentCID:()MailAccessibilityCategory
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [MEMORY[0x263F55340] defaultManager];
    v5 = [v4 attachmentForContentID:v3];

    v6 = [v5 fileName];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)_accessibilityApplicationIsModal
{
  v0 = [MEMORY[0x263F1CBD0] safeValueForKey:@"_mostActiveScene"];
  NSClassFromString(&cfstr_Mailcomposesce.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end