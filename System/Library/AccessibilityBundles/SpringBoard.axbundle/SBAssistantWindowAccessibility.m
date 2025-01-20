@interface SBAssistantWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityViewIsModal;
@end

@implementation SBAssistantWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBAssistantWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

@end