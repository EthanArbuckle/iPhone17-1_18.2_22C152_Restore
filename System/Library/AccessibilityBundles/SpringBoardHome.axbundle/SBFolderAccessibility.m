@interface SBFolderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)automationElements;
@end

@implementation SBFolderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBFolder";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)automationElements
{
  return (id)[(SBFolderAccessibility *)self safeArrayForKey:@"lists"];
}

@end