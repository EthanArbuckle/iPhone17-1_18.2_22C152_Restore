@interface WFWidgetConfigurationAttributionYahooFinanceLogoAttachmentAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation WFWidgetConfigurationAttributionYahooFinanceLogoAttachmentAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WFWidgetConfigurationAttributionYahooFinanceLogoAttachment";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"widget.configuration.attachment.yahoo.finance.label");
}

@end