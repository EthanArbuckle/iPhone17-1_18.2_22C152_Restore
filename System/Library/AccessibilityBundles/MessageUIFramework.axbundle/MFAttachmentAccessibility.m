@interface MFAttachmentAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)markupStringForDisplayWithData:(id)a3 allowAttachmentElement:(BOOL)a4;
@end

@implementation MFAttachmentAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFAttachment";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)markupStringForDisplayWithData:(id)a3 allowAttachmentElement:(BOOL)a4
{
  v11.receiver = self;
  v11.super_class = (Class)MFAttachmentAccessibility;
  v4 = [(MFAttachmentAccessibility *)&v11 markupStringForDisplayWithData:a3 allowAttachmentElement:a4];
  uint64_t v5 = [v4 rangeOfString:@"<object "];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = v5;
    uint64_t v8 = v6;
    v9 = (void *)[v4 mutableCopy];
    [v9 insertString:@" role='button' " atIndex:v7 + v8];

    v4 = v9;
  }

  return v4;
}

@end