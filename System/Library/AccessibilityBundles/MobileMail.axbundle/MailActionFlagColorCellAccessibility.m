@interface MailActionFlagColorCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
@end

@implementation MailActionFlagColorCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MailActionFlagColorCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end