@interface AttributionWeeAppNSTextAttachmentAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)setImage:(id)a3;
@end

@implementation AttributionWeeAppNSTextAttachmentAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NSTextAttachment";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)AttributionWeeAppNSTextAttachmentAccessibility;
  [(AttributionWeeAppNSTextAttachmentAccessibility *)&v5 setImage:v4];
  if (AXCaptureImageAttachmentSetYahooLogo) {
    [v4 setAccessibilityLabel:@"Yahoo!"];
  }
}

@end