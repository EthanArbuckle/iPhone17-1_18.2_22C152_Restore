@interface WFWorkflowWizardNameIconButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation WFWorkflowWizardNameIconButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WFWorkflowWizardNameIconButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"icon.picker");
}

@end