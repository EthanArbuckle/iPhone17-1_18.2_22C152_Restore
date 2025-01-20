@interface AttributionWeeAppControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_stocksAttributionAttributionString;
@end

@implementation AttributionWeeAppControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AttributionWeeAppController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)_stocksAttributionAttributionString
{
  AXCaptureImageAttachmentSetYahooLogo = 1;
  v4.receiver = self;
  v4.super_class = (Class)AttributionWeeAppControllerAccessibility;
  v2 = [(AttributionWeeAppControllerAccessibility *)&v4 _stocksAttributionAttributionString];
  AXCaptureImageAttachmentSetYahooLogo = 0;

  return v2;
}

@end